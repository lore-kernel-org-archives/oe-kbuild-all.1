Content-Type: multipart/mixed; boundary="===============5588027120689971260=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [rcu:tglx.2020.05.05a 105/140] arch/x86/kernel/traps.c:819:24: error: 'tsk' undeclared
Date: Sun, 17 May 2020 19:26:32 +0800
Message-ID: <202005171929.ZVVDCTIJ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5588027120689971260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.g=
it tglx.2020.05.05a
head:   e6d36eed49b863bbe393e3c07cae737cd9c475e3
commit: ca303aa341bab5cdb3a3b41391ff262e252cd3f3 [105/140] x86/traps: Restr=
ucture #DB handling
config: i386-tinyconfig (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        git checkout ca303aa341bab5cdb3a3b41391ff262e252cd3f3
        # save the attached .config to linux build tree
        make ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

Note: the rcu/tglx.2020.05.05a HEAD e6d36eed49b863bbe393e3c07cae737cd9c475e=
3 builds fine.
      It only hurts bisectibility.

All errors (new ones prefixed by >>, old ones prefixed by <<):

arch/x86/kernel/traps.c: In function 'exc_debug_kernel':
>> arch/x86/kernel/traps.c:819:24: error: 'tsk' undeclared (first use in th=
is function)
clear_tsk_thread_flag(tsk, TIF_BLOCKSTEP);
^~~
arch/x86/kernel/traps.c:819:24: note: each undeclared identifier is reporte=
d only once for each function it appears in
arch/x86/kernel/traps.c: In function 'exc_debug_user':
arch/x86/kernel/traps.c:842:24: error: 'tsk' undeclared (first use in this =
function)
clear_tsk_thread_flag(tsk, TIF_BLOCKSTEP);
^~~

vim +/tsk +819 arch/x86/kernel/traps.c

   809	=

   810	static __always_inline void exc_debug_kernel(struct pt_regs *regs,
   811						     unsigned long dr6)
   812	{
   813		nmi_enter();
   814		/*
   815		 * The SDM says "The processor clears the BTF flag when it
   816		 * generates a debug exception."  Clear TIF_BLOCKSTEP to keep
   817		 * TIF_BLOCKSTEP in sync with the hardware BTF flag.
   818		 */
 > 819		clear_tsk_thread_flag(tsk, TIF_BLOCKSTEP);
   820	=

   821		/*
   822		 * Catch SYSENTER with TF set and clear DR_STEP. If this hit a
   823		 * watchpoint at the same time then that will still be handled.
   824		 */
   825		if ((dr6 & DR_STEP) && is_sysenter_singlestep(regs))
   826			dr6 &=3D ~DR_STEP;
   827	=

   828		/*
   829		 * If DR6 is zero, no point in trying to handle it. The kernel is
   830		 * not using INT1.
   831		 */
   832		if (dr6)
   833			handle_debug(regs, dr6, false);
   834	=

   835		nmi_exit();
   836	}
   837	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5588027120689971260==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
vuao538w4ex2XGgAAA==
--===============5588027120689971260==--

