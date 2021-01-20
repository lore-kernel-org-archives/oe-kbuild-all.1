Content-Type: multipart/mixed; boundary="===============3909979768608224461=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [dynticks:preempt/dynamic-v4 8/8] arch/x86/include/asm/entry-common.h:20:25: error: implicit declaration of function 'native_save_fl'
Date: Thu, 21 Jan 2021 04:50:08 +0800
Message-ID: <202101210403.Lhje3Sw4-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3909979768608224461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynt=
icks.git preempt/dynamic-v4
head:   b5f3b1da9df4197d0b0ffe0f55f0f6a8c838d75f
commit: b5f3b1da9df4197d0b0ffe0f55f0f6a8c838d75f [8/8] preempt/dynamic: Sup=
port dynamic preempt with preempt=3D boot option
config: um-i386_defconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dy=
nticks.git/commit/?id=3Db5f3b1da9df4197d0b0ffe0f55f0f6a8c838d75f
        git remote add dynticks https://git.kernel.org/pub/scm/linux/kernel=
/git/frederic/linux-dynticks.git
        git fetch --no-tags dynticks preempt/dynamic-v4
        git checkout b5f3b1da9df4197d0b0ffe0f55f0f6a8c838d75f
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Dum SUBARCH=3Di386

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing=
-include-dirs]
   In file included from arch/x86/include/asm/entry-common.h:7,
                    from include/linux/entry-common.h:11,
                    from kernel/sched/core.c:15:
   arch/x86/include/asm/nospec-branch.h: In function 'mds_clear_cpu_buffers=
':
>> arch/x86/include/asm/nospec-branch.h:267:24: error: '__KERNEL_DS' undecl=
ared (first use in this function); did you mean 'KERNEL_DS'?
     267 |  static const u16 ds =3D __KERNEL_DS;
         |                        ^~~~~~~~~~~
         |                        KERNEL_DS
   arch/x86/include/asm/nospec-branch.h:267:24: note: each undeclared ident=
ifier is reported only once for each function it appears in
   In file included from arch/x86/include/asm/entry-common.h:8,
                    from include/linux/entry-common.h:11,
                    from kernel/sched/core.c:15:
   arch/x86/include/asm/io_bitmap.h: At top level:
>> arch/x86/include/asm/io_bitmap.h:13:23: error: 'IO_BITMAP_LONGS' undecla=
red here (not in a function); did you mean 'IDA_BITMAP_LONGS'?
      13 |  unsigned long bitmap[IO_BITMAP_LONGS];
         |                       ^~~~~~~~~~~~~~~
         |                       IDA_BITMAP_LONGS
   In file included from include/linux/entry-common.h:11,
                    from kernel/sched/core.c:15:
   arch/x86/include/asm/entry-common.h: In function 'arch_check_user_regs':
>> arch/x86/include/asm/entry-common.h:20:25: error: implicit declaration o=
f function 'native_save_fl' [-Werror=3Dimplicit-function-declaration]
      20 |   unsigned long flags =3D native_save_fl();
         |                         ^~~~~~~~~~~~~~
>> arch/x86/include/asm/entry-common.h:26:7: error: implicit declaration of=
 function 'boot_cpu_has'; did you mean 'boot_cpu_init'? [-Werror=3Dimplicit=
-function-declaration]
      26 |   if (boot_cpu_has(X86_FEATURE_SMAP) ||
         |       ^~~~~~~~~~~~
         |       boot_cpu_init
   In file included from ./arch/um/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:5,
                    from ./arch/um/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/kthread.h:6,
                    from include/trace/events/sched.h:8,
                    from kernel/sched/core.c:10:
>> arch/x86/include/asm/entry-common.h:40:17: error: implicit declaration o=
f function 'on_thread_stack'; did you mean 'setup_thread_stack'? [-Werror=
=3Dimplicit-function-declaration]
      40 |   WARN_ON_ONCE(!on_thread_stack());
         |                 ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:145:27: note: in definition of macro 'WARN_ON_=
ONCE'
     145 |  int __ret_warn_once =3D !!(condition);   \
         |                           ^~~~~~~~~
   In file included from include/linux/entry-common.h:11,
                    from kernel/sched/core.c:15:
   arch/x86/include/asm/entry-common.h: In function 'arch_exit_to_user_mode=
_prepare':
>> arch/x86/include/asm/entry-common.h:51:16: error: '_TIF_USER_RETURN_NOTI=
FY' undeclared (first use in this function)
      51 |  if (ti_work & _TIF_USER_RETURN_NOTIFY)
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/err.h:5,
                    from include/linux/kthread.h:5,
                    from include/trace/events/sched.h:8,
                    from kernel/sched/core.c:10:
>> arch/x86/include/asm/entry-common.h:54:25: error: '_TIF_IO_BITMAP' undec=
lared (first use in this function)
      54 |  if (unlikely(ti_work & _TIF_IO_BITMAP))
         |                         ^~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
>> arch/x86/include/asm/entry-common.h:58:25: error: '_TIF_NEED_FPU_LOAD' u=
ndeclared (first use in this function)
      58 |  if (unlikely(ti_work & _TIF_NEED_FPU_LOAD))
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   kernel/sched/core.c: In function 'ttwu_stat':
   kernel/sched/core.c:2895:13: warning: variable 'rq' set but not used [-W=
unused-but-set-variable]
    2895 |  struct rq *rq;
         |             ^~
   kernel/sched/core.c: In function 'schedule_tail':
   kernel/sched/core.c:4239:13: warning: variable 'rq' set but not used [-W=
unused-but-set-variable]
    4239 |  struct rq *rq;
         |             ^~
   cc1: some warnings being treated as errors


vim +/native_save_fl +20 arch/x86/include/asm/entry-common.h

167fd210ec0555d3 Thomas Gleixner 2020-07-23  10  =

27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  11  /* Check that the stack an=
d regs on entry from user mode are sane. */
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  12  static __always_inline voi=
d arch_check_user_regs(struct pt_regs *regs)
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  13  {
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  14  	if (IS_ENABLED(CONFIG_DEB=
UG_ENTRY)) {
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  15  		/*
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  16  		 * Make sure that the en=
try code gave us a sensible EFLAGS
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  17  		 * register.  Native bec=
ause we want to check the actual CPU
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  18  		 * state, not the interr=
upt state as imagined by Xen.
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  19  		 */
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23 @20  		unsigned long flags =3D =
native_save_fl();
662a0221893a3d58 Peter Zijlstra  2020-09-02  21  		unsigned long mask =3D X=
86_EFLAGS_DF | X86_EFLAGS_NT;
662a0221893a3d58 Peter Zijlstra  2020-09-02  22  =

662a0221893a3d58 Peter Zijlstra  2020-09-02  23  		/*
662a0221893a3d58 Peter Zijlstra  2020-09-02  24  		 * For !SMAP hardware we=
 patch out CLAC on entry.
662a0221893a3d58 Peter Zijlstra  2020-09-02  25  		 */
662a0221893a3d58 Peter Zijlstra  2020-09-02 @26  		if (boot_cpu_has(X86_FEA=
TURE_SMAP) ||
662a0221893a3d58 Peter Zijlstra  2020-09-02  27  		    (IS_ENABLED(CONFIG_6=
4_BIT) && boot_cpu_has(X86_FEATURE_XENPV)))
662a0221893a3d58 Peter Zijlstra  2020-09-02  28  			mask |=3D X86_EFLAGS_AC;
662a0221893a3d58 Peter Zijlstra  2020-09-02  29  =

662a0221893a3d58 Peter Zijlstra  2020-09-02  30  		WARN_ON_ONCE(flags & mas=
k);
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  31  =

27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  32  		/* We think we came from=
 user mode. Make sure pt_regs agrees. */
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  33  		WARN_ON_ONCE(!user_mode(=
regs));
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  34  =

27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  35  		/*
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  36  		 * All entries from user=
 mode (except #DF) should be on the
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  37  		 * normal thread stack a=
nd should have user pt_regs in the
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  38  		 * correct location.
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  39  		 */
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23 @40  		WARN_ON_ONCE(!on_thread_=
stack());
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  41  		WARN_ON_ONCE(regs !=3D t=
ask_pt_regs(current));
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  42  	}
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  43  }
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  44  #define arch_check_user_re=
gs arch_check_user_regs
27d6b4d14f5c3ab2 Thomas Gleixner 2020-07-23  45  =

167fd210ec0555d3 Thomas Gleixner 2020-07-23  46  #define ARCH_SYSCALL_EXIT_=
WORK		(_TIF_SINGLESTEP)
167fd210ec0555d3 Thomas Gleixner 2020-07-23  47  =

167fd210ec0555d3 Thomas Gleixner 2020-07-23  48  static inline void arch_ex=
it_to_user_mode_prepare(struct pt_regs *regs,
167fd210ec0555d3 Thomas Gleixner 2020-07-23  49  						  unsigned long ti_w=
ork)
167fd210ec0555d3 Thomas Gleixner 2020-07-23  50  {
167fd210ec0555d3 Thomas Gleixner 2020-07-23 @51  	if (ti_work & _TIF_USER_R=
ETURN_NOTIFY)
167fd210ec0555d3 Thomas Gleixner 2020-07-23  52  		fire_user_return_notifie=
rs();
167fd210ec0555d3 Thomas Gleixner 2020-07-23  53  =

167fd210ec0555d3 Thomas Gleixner 2020-07-23 @54  	if (unlikely(ti_work & _T=
IF_IO_BITMAP))
167fd210ec0555d3 Thomas Gleixner 2020-07-23  55  		tss_update_io_bitmap();
167fd210ec0555d3 Thomas Gleixner 2020-07-23  56  =

167fd210ec0555d3 Thomas Gleixner 2020-07-23  57  	fpregs_assert_state_consi=
stent();
167fd210ec0555d3 Thomas Gleixner 2020-07-23 @58  	if (unlikely(ti_work & _T=
IF_NEED_FPU_LOAD))
167fd210ec0555d3 Thomas Gleixner 2020-07-23  59  		switch_fpu_return();
167fd210ec0555d3 Thomas Gleixner 2020-07-23  60  =


:::::: The code at line 20 was first introduced by commit
:::::: 27d6b4d14f5c3ab21c4aef87dd04055a2d7adf14 x86/entry: Use generic sysc=
all entry function

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3909979768608224461==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AA==
--===============3909979768608224461==--

