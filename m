Content-Type: multipart/mixed; boundary="===============1953669809701940355=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 4125/4677] arch/s390/kernel/signal.c:464:6: warning: no previous prototype for function 'arch_do_signal_or_restart'
Date: Thu, 21 Jan 2021 01:44:30 +0800
Message-ID: <202101210114.jUMhxjS5-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1953669809701940355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   647060f3b592d3c8df0c85dd887557b03e6ea897
commit: 56e62a73702836017564eaacd5212e4d0fa1c01d [4125/4677] s390: convert =
to generic entry
config: s390-randconfig-r003-20210120 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 22b684=
40e1647e16b5ee24b924986207173c02d1)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D56e62a73702836017564eaacd5212e4d0fa1c01d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 56e62a73702836017564eaacd5212e4d0fa1c01d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from arch/s390/kernel/signal.c:27:
   In file included from include/linux/tracehook.h:50:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
                     ^
   In file included from arch/s390/kernel/signal.c:27:
   In file included from include/linux/tracehook.h:50:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
                     ^
   In file included from arch/s390/kernel/signal.c:27:
   In file included from include/linux/tracehook.h:50:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
                     ^
   In file included from arch/s390/kernel/signal.c:27:
   In file included from include/linux/tracehook.h:50:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> arch/s390/kernel/signal.c:464:6: warning: no previous prototype for func=
tion 'arch_do_signal_or_restart' [-Wmissing-prototypes]
   void arch_do_signal_or_restart(struct pt_regs *regs, bool has_signal)
        ^
   arch/s390/kernel/signal.c:464:1: note: declare 'static' if the function =
is not intended to be used outside of this translation unit
   void arch_do_signal_or_restart(struct pt_regs *regs, bool has_signal)
   ^
   static =

   21 warnings generated.


vim +/arch_do_signal_or_restart +464 arch/s390/kernel/signal.c

   453	=

   454	/*
   455	 * Note that 'init' is a special process: it doesn't get signals it =
doesn't
   456	 * want to handle. Thus you cannot kill init even with a SIGKILL eve=
n by
   457	 * mistake.
   458	 *
   459	 * Note that we go through the signals twice: once to check the sign=
als that
   460	 * the kernel can handle, and then we build all the user-level signa=
l handling
   461	 * stack-frames in one go after that.
   462	 */
   463	=

 > 464	void arch_do_signal_or_restart(struct pt_regs *regs, bool has_signal)
   465	{
   466		struct ksignal ksig;
   467		sigset_t *oldset =3D sigmask_to_save();
   468	=

   469		/*
   470		 * Get signal to deliver. When running under ptrace, at this point
   471		 * the debugger may change all our registers, including the system
   472		 * call information.
   473		 */
   474		current->thread.system_call =3D
   475			test_pt_regs_flag(regs, PIF_SYSCALL) ? regs->int_code : 0;
   476	=

   477		if (has_signal && get_signal(&ksig)) {
   478			/* Whee!  Actually deliver the signal.  */
   479			if (current->thread.system_call) {
   480				regs->int_code =3D current->thread.system_call;
   481				/* Check for system call restarting. */
   482				switch (regs->gprs[2]) {
   483				case -ERESTART_RESTARTBLOCK:
   484				case -ERESTARTNOHAND:
   485					regs->gprs[2] =3D -EINTR;
   486					break;
   487				case -ERESTARTSYS:
   488					if (!(ksig.ka.sa.sa_flags & SA_RESTART)) {
   489						regs->gprs[2] =3D -EINTR;
   490						break;
   491					}
   492					fallthrough;
   493				case -ERESTARTNOINTR:
   494					regs->gprs[2] =3D regs->orig_gpr2;
   495					regs->psw.addr =3D
   496						__rewind_psw(regs->psw,
   497							     regs->int_code >> 16);
   498					break;
   499				}
   500			}
   501			/* No longer in a system call */
   502			clear_pt_regs_flag(regs, PIF_SYSCALL);
   503			clear_pt_regs_flag(regs, PIF_SYSCALL_RESTART);
   504			rseq_signal_deliver(&ksig, regs);
   505			if (is_compat_task())
   506				handle_signal32(&ksig, oldset, regs);
   507			else
   508				handle_signal(&ksig, oldset, regs);
   509			return;
   510		}
   511	=

   512		/* No handlers present - check for system call restart */
   513		clear_pt_regs_flag(regs, PIF_SYSCALL);
   514		clear_pt_regs_flag(regs, PIF_SYSCALL_RESTART);
   515		if (current->thread.system_call) {
   516			regs->int_code =3D current->thread.system_call;
   517			switch (regs->gprs[2]) {
   518			case -ERESTART_RESTARTBLOCK:
   519				/* Restart with sys_restart_syscall */
   520				regs->int_code =3D __NR_restart_syscall;
   521				fallthrough;
   522			case -ERESTARTNOHAND:
   523			case -ERESTARTSYS:
   524			case -ERESTARTNOINTR:
   525				/* Restart system call with magic TIF bit. */
   526				regs->gprs[2] =3D regs->orig_gpr2;
   527				set_pt_regs_flag(regs, PIF_SYSCALL_RESTART);
   528				if (test_thread_flag(TIF_SINGLE_STEP))
   529					clear_thread_flag(TIF_PER_TRAP);
   530				break;
   531			}
   532		}
   533	=

   534		/*
   535		 * If there's no signal to deliver, we just put the saved sigmask b=
ack.
   536		 */
   537		restore_saved_sigmask();
   538	}
   539	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1953669809701940355==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1953669809701940355==--

