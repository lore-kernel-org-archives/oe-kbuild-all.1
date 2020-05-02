Content-Type: multipart/mixed; boundary="===============3473911188810159430=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 03/10] powerpc/powernv: Use OPAL_REPORT_TRAP to cope with trap interrupts from OPAL
Date: Sat, 02 May 2020 22:30:37 +0800
Message-ID: <202005022225.5GPUG5PB%lkp@intel.com>
In-Reply-To: <20200502111914.166578-4-npiggin@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3473911188810159430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Nicholas,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on powerpc/next]
[also build test ERROR on linus/master scottwood/next v5.7-rc3]
[cannot apply to next-20200501]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/OPAL-V4/20=
200502-195816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
config: powerpc-mpc866_ads_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/traps.c: In function 'program_check_exception':
>> arch/powerpc/kernel/traps.c:1509:11: error: implicit declaration of func=
tion 'opal_report_trap' [-Werror=3Dimplicit-function-declaration]
    1509 |     ret =3D opal_report_trap(regs->nip);
         |           ^~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/traps.c:1510:16: error: 'OPAL_TRAP_WARN' undeclared =
(first use in this function)
    1510 |     if (ret =3D=3D OPAL_TRAP_WARN) {
         |                ^~~~~~~~~~~~~~
   arch/powerpc/kernel/traps.c:1510:16: note: each undeclared identifier is=
 reported only once for each function it appears in
   cc1: all warnings being treated as errors

vim +/opal_report_trap +1509 arch/powerpc/kernel/traps.c

  1460	=

  1461	void program_check_exception(struct pt_regs *regs)
  1462	{
  1463		enum ctx_state prev_state =3D exception_enter();
  1464		unsigned int reason =3D get_reason(regs);
  1465	=

  1466		/* We can now get here via a FP Unavailable exception if the core
  1467		 * has no FPU, in that case the reason flags will be 0 */
  1468	=

  1469		if (reason & REASON_FP) {
  1470			/* IEEE FP exception */
  1471			parse_fpe(regs);
  1472			goto bail;
  1473		}
  1474		if (reason & REASON_TRAP) {
  1475			/* Debugger is first in line to stop recursive faults in
  1476			 * rcu_lock, notify_die, or atomic_notifier_call_chain */
  1477			if (debugger_bpt(regs))
  1478				goto bail;
  1479	=

  1480			if (kprobe_handler(regs))
  1481				goto bail;
  1482	=

  1483			/* trap exception */
  1484			if (notify_die(DIE_BPT, "breakpoint", regs, 5, 5, SIGTRAP)
  1485					=3D=3D NOTIFY_STOP)
  1486				goto bail;
  1487	=

  1488			if (!(regs->msr & MSR_PR)) { /* not user-mode */
  1489				unsigned long bugaddr;
  1490				enum bug_trap_type t;
  1491	=

  1492				/*
  1493				 * Fixup bugaddr for BUG_ON() in real mode
  1494				 */
  1495				bugaddr =3D regs->nip;
  1496				if (!is_kernel_addr(bugaddr) && !(regs->msr & MSR_IR))
  1497					bugaddr +=3D PAGE_OFFSET;
  1498				t =3D report_bug(bugaddr, regs);
  1499				if (t =3D=3D BUG_TRAP_TYPE_WARN) {
  1500					regs->nip +=3D 4;
  1501					goto bail;
  1502				}
  1503				if (t =3D=3D BUG_TRAP_TYPE_BUG)
  1504					goto bug;
  1505	=

  1506				if (firmware_has_feature(FW_FEATURE_OPAL)) {
  1507					int64_t ret;
  1508	=

> 1509					ret =3D opal_report_trap(regs->nip);
> 1510					if (ret =3D=3D OPAL_TRAP_WARN) {
  1511						regs->nip +=3D 4;
  1512						goto bail;
  1513					}
  1514				}
  1515			}
  1516	bug:
  1517			_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
  1518			goto bail;
  1519		}
  1520	#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
  1521		if (reason & REASON_TM) {
  1522			/* This is a TM "Bad Thing Exception" program check.
  1523			 * This occurs when:
  1524			 * -  An rfid/hrfid/mtmsrd attempts to cause an illegal
  1525			 *    transition in TM states.
  1526			 * -  A trechkpt is attempted when transactional.
  1527			 * -  A treclaim is attempted when non transactional.
  1528			 * -  A tend is illegally attempted.
  1529			 * -  writing a TM SPR when transactional.
  1530			 *
  1531			 * If usermode caused this, it's done something illegal and
  1532			 * gets a SIGILL slap on the wrist.  We call it an illegal
  1533			 * operand to distinguish from the instruction just being bad
  1534			 * (e.g. executing a 'tend' on a CPU without TM!); it's an
  1535			 * illegal /placement/ of a valid instruction.
  1536			 */
  1537			if (user_mode(regs)) {
  1538				_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
  1539				goto bail;
  1540			} else {
  1541				printk(KERN_EMERG "Unexpected TM Bad Thing exception "
  1542				       "at %lx (msr 0x%lx) tm_scratch=3D%llx\n",
  1543				       regs->nip, regs->msr, get_paca()->tm_scratch);
  1544				die("Unrecoverable exception", regs, SIGABRT);
  1545			}
  1546		}
  1547	#endif
  1548	=

  1549		/*
  1550		 * If we took the program check in the kernel skip down to sending a
  1551		 * SIGILL. The subsequent cases all relate to emulating instructions
  1552		 * which we should only do for userspace. We also do not want to en=
able
  1553		 * interrupts for kernel faults because that might lead to further
  1554		 * faults, and loose the context of the original exception.
  1555		 */
  1556		if (!user_mode(regs))
  1557			goto sigill;
  1558	=

  1559		/* We restore the interrupt state now */
  1560		if (!arch_irq_disabled_regs(regs))
  1561			local_irq_enable();
  1562	=

  1563		/* (reason & REASON_ILLEGAL) would be the obvious thing here,
  1564		 * but there seems to be a hardware bug on the 405GP (RevD)
  1565		 * that means ESR is sometimes set incorrectly - either to
  1566		 * ESR_DST (!?) or 0.  In the process of chasing this with the
  1567		 * hardware people - not sure if it can happen on any illegal
  1568		 * instruction or only on FP instructions, whether there is a
  1569		 * pattern to occurrences etc. -dgibson 31/Mar/2003
  1570		 */
  1571		if (!emulate_math(regs))
  1572			goto bail;
  1573	=

  1574		/* Try to emulate it if we should. */
  1575		if (reason & (REASON_ILLEGAL | REASON_PRIVILEGED)) {
  1576			switch (emulate_instruction(regs)) {
  1577			case 0:
  1578				regs->nip +=3D 4;
  1579				emulate_single_step(regs);
  1580				goto bail;
  1581			case -EFAULT:
  1582				_exception(SIGSEGV, regs, SEGV_MAPERR, regs->nip);
  1583				goto bail;
  1584			}
  1585		}
  1586	=

  1587	sigill:
  1588		if (reason & REASON_PRIVILEGED)
  1589			_exception(SIGILL, regs, ILL_PRVOPC, regs->nip);
  1590		else
  1591			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
  1592	=

  1593	bail:
  1594		exception_exit(prev_state);
  1595	}
  1596	NOKPROBE_SYMBOL(program_check_exception);
  1597	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3473911188810159430==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3473911188810159430==--

