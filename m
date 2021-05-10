Content-Type: multipart/mixed; boundary="===============7441601434310273909=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [rcu:tglx-pc.2021.05.10a 1/13] arch/um/include/shared/kern_util.h:54:12: error: conflicting types for '__cant_sleep'
Date: Mon, 10 May 2021 15:51:27 -0700
Message-ID: <20210510225127.GI975577@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <202105110647.8rU44xvP-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7441601434310273909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 06:25:03AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu=
.git tglx-pc.2021.05.10a
> head:   650c7ee79df04a22835a23144ffb918a75ab04e6
> commit: 2ae8c0da23534e0cbf43aa185b3f261ce8340e45 [1/13] lib/debug: Remove=
 pointless ARCH_NO_PREEMPT dependencies
> config: um-allmodconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-r=
cu.git/commit/?id=3D2ae8c0da23534e0cbf43aa185b3f261ce8340e45
>         git remote add rcu https://git.kernel.org/pub/scm/linux/kernel/gi=
t/paulmck/linux-rcu.git
>         git fetch --no-tags rcu tglx-pc.2021.05.10a
>         git checkout 2ae8c0da23534e0cbf43aa185b3f261ce8340e45
>         # save the attached .config to linux build tree
>         make W=3D1 W=3D1 ARCH=3Dum =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):

OK, I clearly need to work harder on this forward-port.  Apologies for
the noise.

							Thanx, Paul

>    In file included from arch/um/kernel/irq.c:19:
> >> arch/um/include/shared/kern_util.h:54:12: error: conflicting types for=
 '__cant_sleep'
>       54 | extern int __cant_sleep(void);
>          |            ^~~~~~~~~~~~
>    In file included from include/linux/cpumask.h:10,
>                     from arch/um/kernel/irq.c:10:
>    include/linux/kernel.h:103:13: note: previous declaration of '__cant_s=
leep' was here
>      103 | extern void __cant_sleep(const char *file, int line, int preem=
pt_offset);
>          |             ^~~~~~~~~~~~
>    arch/um/kernel/irq.c:620:13: warning: no previous prototype for 'init_=
IRQ' [-Wmissing-prototypes]
>      620 | void __init init_IRQ(void)
>          |             ^~~~~~~~
> --
>    In file included from arch/um/kernel/mem.c:18:
> >> arch/um/include/shared/kern_util.h:54:12: error: conflicting types for=
 '__cant_sleep'
>       54 | extern int __cant_sleep(void);
>          |            ^~~~~~~~~~~~
>    In file included from include/linux/list.h:9,
>                     from include/linux/module.h:12,
>                     from arch/um/kernel/mem.c:7:
>    include/linux/kernel.h:103:13: note: previous declaration of '__cant_s=
leep' was here
>      103 | extern void __cant_sleep(const char *file, int line, int preem=
pt_offset);
>          |             ^~~~~~~~~~~~
>    arch/um/kernel/mem.c:184:8: warning: no previous prototype for 'pgd_al=
loc' [-Wmissing-prototypes]
>      184 | pgd_t *pgd_alloc(struct mm_struct *mm)
>          |        ^~~~~~~~~
>    arch/um/kernel/mem.c:197:7: warning: no previous prototype for 'uml_km=
alloc' [-Wmissing-prototypes]
>      197 | void *uml_kmalloc(int size, int flags)
>          |       ^~~~~~~~~~~
> --
>    In file included from arch/um/kernel/process.c:31:
> >> arch/um/include/shared/kern_util.h:54:12: error: conflicting types for=
 '__cant_sleep'
>       54 | extern int __cant_sleep(void);
>          |            ^~~~~~~~~~~~
>    In file included from include/asm-generic/bug.h:20,
>                     from ./arch/um/include/generated/asm/bug.h:1,
>                     from include/linux/bug.h:5,
>                     from include/linux/mmdebug.h:5,
>                     from include/linux/percpu.h:5,
>                     from include/linux/context_tracking_state.h:5,
>                     from include/linux/hardirq.h:5,
>                     from arch/um/kernel/process.c:11:
>    include/linux/kernel.h:103:13: note: previous declaration of '__cant_s=
leep' was here
>      103 | extern void __cant_sleep(const char *file, int line, int preem=
pt_offset);
>          |             ^~~~~~~~~~~~
>    arch/um/kernel/process.c:49:5: warning: no previous prototype for 'pid=
_to_processor_id' [-Wmissing-prototypes]
>       49 | int pid_to_processor_id(int pid)
>          |     ^~~~~~~~~~~~~~~~~~~
>    arch/um/kernel/process.c:85:7: warning: no previous prototype for '__s=
witch_to' [-Wmissing-prototypes]
>       85 | void *__switch_to(struct task_struct *from, struct task_struct=
 *to)
>          |       ^~~~~~~~~~~
>    arch/um/kernel/process.c: In function 'new_thread_handler':
>    arch/um/kernel/process.c:120:21: warning: variable 'n' set but not use=
d [-Wunused-but-set-variable]
>      120 |  int (*fn)(void *), n;
>          |                     ^
>    arch/um/kernel/process.c: At top level:
>    arch/um/kernel/process.c:138:6: warning: no previous prototype for 'fo=
rk_handler' [-Wmissing-prototypes]
>      138 | void fork_handler(void)
>          |      ^~~~~~~~~~~~
>    arch/um/kernel/process.c:214:6: warning: no previous prototype for 'ar=
ch_cpu_idle' [-Wmissing-prototypes]
>      214 | void arch_cpu_idle(void)
>          |      ^~~~~~~~~~~~~
> >> arch/um/kernel/process.c:221:5: error: conflicting types for '__cant_s=
leep'
>      221 | int __cant_sleep(void) {
>          |     ^~~~~~~~~~~~
>    In file included from include/asm-generic/bug.h:20,
>                     from ./arch/um/include/generated/asm/bug.h:1,
>                     from include/linux/bug.h:5,
>                     from include/linux/mmdebug.h:5,
>                     from include/linux/percpu.h:5,
>                     from include/linux/context_tracking_state.h:5,
>                     from include/linux/hardirq.h:5,
>                     from arch/um/kernel/process.c:11:
>    include/linux/kernel.h:103:13: note: previous declaration of '__cant_s=
leep' was here
>      103 | extern void __cant_sleep(const char *file, int line, int preem=
pt_offset);
>          |             ^~~~~~~~~~~~
>    arch/um/kernel/process.c:251:5: warning: no previous prototype for 'co=
py_to_user_proc' [-Wmissing-prototypes]
>      251 | int copy_to_user_proc(void __user *to, void *from, int size)
>          |     ^~~~~~~~~~~~~~~~~
>    arch/um/kernel/process.c:261:5: warning: no previous prototype for 'cl=
ear_user_proc' [-Wmissing-prototypes]
>      261 | int clear_user_proc(void __user *buf, int size)
>          |     ^~~~~~~~~~~~~~~
>    arch/um/kernel/process.c:274:6: warning: no previous prototype for 'se=
t_using_sysemu' [-Wmissing-prototypes]
>      274 | void set_using_sysemu(int value)
>          |      ^~~~~~~~~~~~~~~~
>    arch/um/kernel/process.c:281:5: warning: no previous prototype for 'ge=
t_using_sysemu' [-Wmissing-prototypes]
>      281 | int get_using_sysemu(void)
>          |     ^~~~~~~~~~~~~~~~
>    arch/um/kernel/process.c:319:12: warning: no previous prototype for 'm=
ake_proc_sysemu' [-Wmissing-prototypes]
>      319 | int __init make_proc_sysemu(void)
>          |            ^~~~~~~~~~~~~~~~
>    arch/um/kernel/process.c:359:15: warning: no previous prototype for 'a=
rch_align_stack' [-Wmissing-prototypes]
>      359 | unsigned long arch_align_stack(unsigned long sp)
>          |               ^~~~~~~~~~~~~~~~
> --
>    In file included from arch/um/kernel/reboot.c:12:
> >> arch/um/include/shared/kern_util.h:54:12: error: conflicting types for=
 '__cant_sleep'
>       54 | extern int __cant_sleep(void);
>          |            ^~~~~~~~~~~~
>    In file included from include/linux/list.h:9,
>                     from include/linux/rculist.h:10,
>                     from include/linux/sched/signal.h:5,
>                     from arch/um/kernel/reboot.c:6:
>    include/linux/kernel.h:103:13: note: previous declaration of '__cant_s=
leep' was here
>      103 | extern void __cant_sleep(const char *file, int line, int preem=
pt_offset);
>          |             ^~~~~~~~~~~~
>    arch/um/kernel/reboot.c:45:6: warning: no previous prototype for 'mach=
ine_restart' [-Wmissing-prototypes]
>       45 | void machine_restart(char * __unused)
>          |      ^~~~~~~~~~~~~~~
>    arch/um/kernel/reboot.c:51:6: warning: no previous prototype for 'mach=
ine_power_off' [-Wmissing-prototypes]
>       51 | void machine_power_off(void)
>          |      ^~~~~~~~~~~~~~~~~
>    arch/um/kernel/reboot.c:57:6: warning: no previous prototype for 'mach=
ine_halt' [-Wmissing-prototypes]
>       57 | void machine_halt(void)
>          |      ^~~~~~~~~~~~
> --
>    In file included from arch/um/kernel/signal.c:14:
> >> arch/um/include/shared/kern_util.h:54:12: error: conflicting types for=
 '__cant_sleep'
>       54 | extern int __cant_sleep(void);
>          |            ^~~~~~~~~~~~
>    In file included from include/linux/list.h:9,
>                     from include/linux/module.h:12,
>                     from arch/um/kernel/signal.c:6:
>    include/linux/kernel.h:103:13: note: previous declaration of '__cant_s=
leep' was here
>      103 | extern void __cant_sleep(const char *file, int line, int preem=
pt_offset);
>          |             ^~~~~~~~~~~~
> --
>    In file included from arch/um/kernel/time.c:20:
> >> arch/um/include/shared/kern_util.h:54:12: error: conflicting types for=
 '__cant_sleep'
>       54 | extern int __cant_sleep(void);
>          |            ^~~~~~~~~~~~
>    In file included from include/linux/list.h:9,
>                     from include/linux/clocksource.h:15,
>                     from include/linux/clockchips.h:14,
>                     from arch/um/kernel/time.c:10:
>    include/linux/kernel.h:103:13: note: previous declaration of '__cant_s=
leep' was here
>      103 | extern void __cant_sleep(const char *file, int line, int preem=
pt_offset);
>          |             ^~~~~~~~~~~~
>    arch/um/kernel/time.c:789:13: warning: no previous prototype for 'time=
_init' [-Wmissing-prototypes]
>      789 | void __init time_init(void)
>          |             ^~~~~~~~~
> --
>    In file included from arch/um/kernel/tlb.c:15:
> >> arch/um/include/shared/kern_util.h:54:12: error: conflicting types for=
 '__cant_sleep'
>       54 | extern int __cant_sleep(void);
>          |            ^~~~~~~~~~~~
>    In file included from include/asm-generic/bug.h:20,
>                     from ./arch/um/include/generated/asm/bug.h:1,
>                     from include/linux/bug.h:5,
>                     from include/linux/mmdebug.h:5,
>                     from include/linux/mm.h:9,
>                     from arch/um/kernel/tlb.c:6:
>    include/linux/kernel.h:103:13: note: previous declaration of '__cant_s=
leep' was here
>      103 | extern void __cant_sleep(const char *file, int line, int preem=
pt_offset);
>          |             ^~~~~~~~~~~~
>    arch/um/kernel/tlb.c:317:6: warning: no previous prototype for 'fix_ra=
nge_common' [-Wmissing-prototypes]
>      317 | void fix_range_common(struct mm_struct *mm, unsigned long star=
t_addr,
>          |      ^~~~~~~~~~~~~~~~
>    arch/um/kernel/tlb.c:579:6: warning: no previous prototype for 'flush_=
tlb_mm_range' [-Wmissing-prototypes]
>      579 | void flush_tlb_mm_range(struct mm_struct *mm, unsigned long st=
art,
>          |      ^~~~~~~~~~~~~~~~~~
>    arch/um/kernel/tlb.c:595:6: warning: no previous prototype for 'force_=
flush_all' [-Wmissing-prototypes]
>      595 | void force_flush_all(void)
>          |      ^~~~~~~~~~~~~~~
> --
>    In file included from arch/um/kernel/trap.c:16:
> >> arch/um/include/shared/kern_util.h:54:12: error: conflicting types for=
 '__cant_sleep'
>       54 | extern int __cant_sleep(void);
>          |            ^~~~~~~~~~~~
>    In file included from include/asm-generic/bug.h:20,
>                     from ./arch/um/include/generated/asm/bug.h:1,
>                     from include/linux/bug.h:5,
>                     from include/linux/mmdebug.h:5,
>                     from include/linux/mm.h:9,
>                     from arch/um/kernel/trap.c:6:
>    include/linux/kernel.h:103:13: note: previous declaration of '__cant_s=
leep' was here
>      103 | extern void __cant_sleep(const char *file, int line, int preem=
pt_offset);
>          |             ^~~~~~~~~~~~
>    arch/um/kernel/trap.c:315:6: warning: no previous prototype for 'trap_=
init' [-Wmissing-prototypes]
>      315 | void trap_init(void)
>          |      ^~~~~~~~~
> --
>    In file included from arch/um/kernel/um_arch.c:25:
> >> arch/um/include/shared/kern_util.h:54:12: error: conflicting types for=
 '__cant_sleep'
>       54 | extern int __cant_sleep(void);
>          |            ^~~~~~~~~~~~
>    In file included from include/linux/delay.h:22,
>                     from arch/um/kernel/um_arch.c:6:
>    include/linux/kernel.h:103:13: note: previous declaration of '__cant_s=
leep' was here
>      103 | extern void __cant_sleep(const char *file, int line, int preem=
pt_offset);
>          |             ^~~~~~~~~~~~
>    arch/um/kernel/um_arch.c:359:19: warning: no previous prototype for 'r=
ead_initrd' [-Wmissing-prototypes]
>      359 | int __init __weak read_initrd(void)
>          |                   ^~~~~~~~~~~
>    arch/um/kernel/um_arch.c:377:13: warning: no previous prototype for 'c=
heck_bugs' [-Wmissing-prototypes]
>      377 | void __init check_bugs(void)
>          |             ^~~~~~~~~~
>    arch/um/kernel/um_arch.c:387:7: warning: no previous prototype for 'te=
xt_poke' [-Wmissing-prototypes]
>      387 | void *text_poke(void *addr, const void *opcode, size_t len)
>          |       ^~~~~~~~~
>    arch/um/kernel/um_arch.c:399:6: warning: no previous prototype for 'te=
xt_poke_sync' [-Wmissing-prototypes]
>      399 | void text_poke_sync(void)
>          |      ^~~~~~~~~~~~~~
> --
>    In file included from arch/um/kernel/skas/syscall.c:9:
> >> arch/um/include/shared/kern_util.h:54:12: error: conflicting types for=
 '__cant_sleep'
>       54 | extern int __cant_sleep(void);
>          |            ^~~~~~~~~~~~
>    In file included from arch/um/kernel/skas/syscall.c:6:
>    include/linux/kernel.h:103:13: note: previous declaration of '__cant_s=
leep' was here
>      103 | extern void __cant_sleep(const char *file, int line, int preem=
pt_offset);
>          |             ^~~~~~~~~~~~
>    In file included from arch/um/include/asm/processor-generic.h:13,
>                     from arch/x86/um/asm/processor.h:41,
>                     from include/linux/rcupdate.h:30,
>                     from include/linux/rculist.h:11,
>                     from include/linux/pid.h:5,
>                     from include/linux/sched.h:14,
>                     from include/linux/ptrace.h:6,
>                     from arch/um/kernel/skas/syscall.c:7:
>    arch/um/kernel/skas/syscall.c: In function 'handle_syscall':
>    arch/x86/um/shared/sysdep/syscalls_64.h:18:4: warning: cast between in=
compatible function types from 'long int (*)(void)' to 'long int (*)(long i=
nt,  long int,  long int,  long int,  long int,  long int)' [-Wcast-functio=
n-type]
>       18 |  (((long (*)(long, long, long, long, long, long)) \
>          |    ^
>    arch/x86/um/asm/ptrace.h:36:62: note: in definition of macro 'PT_REGS_=
SET_SYSCALL_RETURN'
>       36 | #define PT_REGS_SET_SYSCALL_RETURN(r, res) (PT_REGS_AX(r) =3D =
(res))
>          |                                                              ^=
~~
>    arch/um/kernel/skas/syscall.c:46:5: note: in expansion of macro 'EXECU=
TE_SYSCALL'
>       46 |     EXECUTE_SYSCALL(syscall, regs));
>          |     ^~~~~~~~~~~~~~~
> =

> =

> vim +/__cant_sleep +54 arch/um/include/shared/kern_util.h
> =

> 5cb38bc47bf3705 arch/um/include/kern_util.h        Jeff Dike             =
         2006-06-04  49  =

> edea138584d7586 arch/um/include/kern_util.h        Jeff Dike             =
         2008-02-04  50  /*
> edea138584d7586 arch/um/include/kern_util.h        Jeff Dike             =
         2008-02-04  51   * Are we disallowed to sleep? Used to choose betw=
een GFP_KERNEL and
> edea138584d7586 arch/um/include/kern_util.h        Jeff Dike             =
         2008-02-04  52   * GFP_ATOMIC.
> edea138584d7586 arch/um/include/kern_util.h        Jeff Dike             =
         2008-02-04  53   */
> b63162939cd797c arch/um/include/kern_util.h        Paolo 'Blaisorblade' G=
iarrusso 2006-01-18 @54  extern int __cant_sleep(void);
> c2220b2a124d2fe arch/um/include/shared/kern_util.h Al Viro               =
         2012-01-30  55  extern int get_current_pid(void);
> edea138584d7586 arch/um/include/kern_util.h        Jeff Dike             =
         2008-02-04  56  extern int copy_from_user_proc(void *to, void *fro=
m, int size);
> edea138584d7586 arch/um/include/kern_util.h        Jeff Dike             =
         2008-02-04  57  extern int cpu(void);
> edea138584d7586 arch/um/include/kern_util.h        Jeff Dike             =
         2008-02-04  58  extern char *uml_strdup(const char *string);
> edea138584d7586 arch/um/include/kern_util.h        Jeff Dike             =
         2008-02-04  59  =

> =

> :::::: The code at line 54 was first introduced by commit
> :::::: b63162939cd797c8269964ce856ed1f2fec5f70e [PATCH] uml: avoid malloc=
 to sleep in atomic sections
> =

> :::::: TO: Paolo 'Blaisorblade' Giarrusso <blaisorblade@yahoo.it>
> :::::: CC: Linus Torvalds <torvalds@g5.osdl.org>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============7441601434310273909==--

