Content-Type: multipart/mixed; boundary="===============3107992228346681485=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [userns:exec-testing 10/18] include/linux/security.h:580:9: error: implicit declaration of function 'cap_bprm_creds_from_file'
Date: Thu, 28 May 2020 18:34:59 +0800
Message-ID: <202005281855.CjdycDG3%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3107992228346681485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-names=
pace.git exec-testing
head:   bb6108934507ef1ac534afdef0db20dcd242c5fa
commit: b5579c9de204da3aa3575aeaa46fd94ab19d77d0 [10/18] exec: Compute file=
 based creds only once
config: x86_64-allnoconfig (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 2d068e=
534f1671459e1b135852c1b3c10502e929)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        git checkout b5579c9de204da3aa3575aeaa46fd94ab19d77d0
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

In file included from kernel/fork.c:50:
>> include/linux/security.h:580:9: error: implicit declaration of function =
'cap_bprm_creds_from_file' [-Werror,-Wimplicit-function-declaration]
return cap_bprm_creds_from_file(bprm);
^
include/linux/security.h:580:9: note: did you mean 'security_bprm_creds_fro=
m_file'?
include/linux/security.h:578:19: note: 'security_bprm_creds_from_file' decl=
ared here
static inline int security_bprm_creds_from_file(struct linux_binprm *bprm)
^
1 error generated.
--
In file included from kernel/time/hrtimer.c:30:
In file included from include/linux/syscalls.h:85:
In file included from include/trace/syscall.h:7:
In file included from include/linux/trace_events.h:10:
In file included from include/linux/perf_event.h:59:
>> include/linux/security.h:580:9: error: implicit declaration of function =
'cap_bprm_creds_from_file' [-Werror,-Wimplicit-function-declaration]
return cap_bprm_creds_from_file(bprm);
^
include/linux/security.h:580:9: note: did you mean 'security_bprm_creds_fro=
m_file'?
include/linux/security.h:578:19: note: 'security_bprm_creds_from_file' decl=
ared here
static inline int security_bprm_creds_from_file(struct linux_binprm *bprm)
^
kernel/time/hrtimer.c:120:21: warning: initializer overrides prior initiali=
zation of this subobject [-Winitializer-overrides]
[CLOCK_REALTIME]        =3D HRTIMER_BASE_REALTIME,
^~~~~~~~~~~~~~~~~~~~~
kernel/time/hrtimer.c:118:27: note: previous initialization is here
[0 ... MAX_CLOCKS - 1]  =3D HRTIMER_MAX_CLOCK_BASES,
^~~~~~~~~~~~~~~~~~~~~~~
kernel/time/hrtimer.c:121:22: warning: initializer overrides prior initiali=
zation of this subobject [-Winitializer-overrides]
[CLOCK_MONOTONIC]       =3D HRTIMER_BASE_MONOTONIC,
^~~~~~~~~~~~~~~~~~~~~~
kernel/time/hrtimer.c:118:27: note: previous initialization is here
[0 ... MAX_CLOCKS - 1]  =3D HRTIMER_MAX_CLOCK_BASES,
^~~~~~~~~~~~~~~~~~~~~~~
kernel/time/hrtimer.c:122:21: warning: initializer overrides prior initiali=
zation of this subobject [-Winitializer-overrides]
[CLOCK_BOOTTIME]        =3D HRTIMER_BASE_BOOTTIME,
^~~~~~~~~~~~~~~~~~~~~
kernel/time/hrtimer.c:118:27: note: previous initialization is here
[0 ... MAX_CLOCKS - 1]  =3D HRTIMER_MAX_CLOCK_BASES,
^~~~~~~~~~~~~~~~~~~~~~~
kernel/time/hrtimer.c:123:17: warning: initializer overrides prior initiali=
zation of this subobject [-Winitializer-overrides]
[CLOCK_TAI]             =3D HRTIMER_BASE_TAI,
^~~~~~~~~~~~~~~~
kernel/time/hrtimer.c:118:27: note: previous initialization is here
[0 ... MAX_CLOCKS - 1]  =3D HRTIMER_MAX_CLOCK_BASES,
^~~~~~~~~~~~~~~~~~~~~~~
4 warnings and 1 error generated.
--
In file included from kernel/time/posix-stubs.c:13:
In file included from include/linux/syscalls.h:85:
In file included from include/trace/syscall.h:7:
In file included from include/linux/trace_events.h:10:
In file included from include/linux/perf_event.h:59:
>> include/linux/security.h:580:9: error: implicit declaration of function =
'cap_bprm_creds_from_file' [-Werror,-Wimplicit-function-declaration]
return cap_bprm_creds_from_file(bprm);
^
include/linux/security.h:580:9: note: did you mean 'security_bprm_creds_fro=
m_file'?
include/linux/security.h:578:19: note: 'security_bprm_creds_from_file' decl=
ared here
static inline int security_bprm_creds_from_file(struct linux_binprm *bprm)
^
kernel/time/posix-stubs.c:25:17: warning: no previous prototype for functio=
n 'sys_ni_posix_timers' [-Wmissing-prototypes]
asmlinkage long sys_ni_posix_timers(void)
^
kernel/time/posix-stubs.c:25:12: note: declare 'static' if the function is =
not intended to be used outside of this translation unit
asmlinkage long sys_ni_posix_timers(void)
^
static
kernel/time/posix-stubs.c:73:5: warning: no previous prototype for function=
 'do_clock_gettime' [-Wmissing-prototypes]
int do_clock_gettime(clockid_t which_clock, struct timespec64 *tp)
^
kernel/time/posix-stubs.c:73:1: note: declare 'static' if the function is n=
ot intended to be used outside of this translation unit
int do_clock_gettime(clockid_t which_clock, struct timespec64 *tp)
^
static
2 warnings and 1 error generated.
--
In file included from kernel/events/core.c:34:
In file included from include/linux/syscalls.h:85:
In file included from include/trace/syscall.h:7:
In file included from include/linux/trace_events.h:10:
In file included from include/linux/perf_event.h:59:
>> include/linux/security.h:580:9: error: implicit declaration of function =
'cap_bprm_creds_from_file' [-Werror,-Wimplicit-function-declaration]
return cap_bprm_creds_from_file(bprm);
^
include/linux/security.h:580:9: note: did you mean 'security_bprm_creds_fro=
m_file'?
include/linux/security.h:578:19: note: 'security_bprm_creds_from_file' decl=
ared here
static inline int security_bprm_creds_from_file(struct linux_binprm *bprm)
^
kernel/events/core.c:6487:6: warning: no previous prototype for function 'p=
erf_pmu_snapshot_aux' [-Wmissing-prototypes]
long perf_pmu_snapshot_aux(struct perf_buffer *rb,
^
kernel/events/core.c:6487:1: note: declare 'static' if the function is not =
intended to be used outside of this translation unit
long perf_pmu_snapshot_aux(struct perf_buffer *rb,
^
static
1 warning and 1 error generated.
--
In file included from kernel/events/hw_breakpoint.c:36:
In file included from include/linux/hw_breakpoint.h:5:
In file included from include/linux/perf_event.h:59:
>> include/linux/security.h:580:9: error: implicit declaration of function =
'cap_bprm_creds_from_file' [-Werror,-Wimplicit-function-declaration]
return cap_bprm_creds_from_file(bprm);
^
include/linux/security.h:580:9: note: did you mean 'security_bprm_creds_fro=
m_file'?
include/linux/security.h:578:19: note: 'security_bprm_creds_from_file' decl=
ared here
static inline int security_bprm_creds_from_file(struct linux_binprm *bprm)
^
kernel/events/hw_breakpoint.c:71:12: warning: no previous prototype for fun=
ction 'hw_breakpoint_weight' [-Wmissing-prototypes]
__weak int hw_breakpoint_weight(struct perf_event *bp)
^
kernel/events/hw_breakpoint.c:71:8: note: declare 'static' if the function =
is not intended to be used outside of this translation unit
__weak int hw_breakpoint_weight(struct perf_event *bp)
^
static
kernel/events/hw_breakpoint.c:219:13: warning: no previous prototype for fu=
nction 'arch_unregister_hw_breakpoint' [-Wmissing-prototypes]
__weak void arch_unregister_hw_breakpoint(struct perf_event *bp)
^
kernel/events/hw_breakpoint.c:219:8: note: declare 'static' if the function=
 is not intended to be used outside of this translation unit
__weak void arch_unregister_hw_breakpoint(struct perf_event *bp)
^
static
2 warnings and 1 error generated.
--
In file included from kernel/printk/printk.c:34:
>> include/linux/security.h:580:9: error: implicit declaration of function =
'cap_bprm_creds_from_file' [-Werror,-Wimplicit-function-declaration]
return cap_bprm_creds_from_file(bprm);
^
include/linux/security.h:580:9: note: did you mean 'security_bprm_creds_fro=
m_file'?
include/linux/security.h:578:19: note: 'security_bprm_creds_from_file' decl=
ared here
static inline int security_bprm_creds_from_file(struct linux_binprm *bprm)
^
In file included from kernel/printk/printk.c:61:
kernel/printk/internal.h:57:20: warning: no previous prototype for function=
 'vprintk_func' [-Wmissing-prototypes]
__printf(1, 0) int vprintk_func(const char *fmt, va_list args) { return 0; }
^
kernel/printk/internal.h:57:16: note: declare 'static' if the function is n=
ot intended to be used outside of this translation unit
__printf(1, 0) int vprintk_func(const char *fmt, va_list args) { return 0; }
^
static
kernel/printk/printk.c:175:5: warning: no previous prototype for function '=
devkmsg_sysctl_set_loglvl' [-Wmissing-prototypes]
int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
^
kernel/printk/printk.c:175:1: note: declare 'static' if the function is not=
 intended to be used outside of this translation unit
int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
^
static
kernel/printk/printk.c:2441:10: warning: 'sprintf' will always overflow; de=
stination buffer has size 0, but format string expands to at least 33 [-Wfo=
rtify-source]
len =3D sprintf(text,
^
3 warnings and 1 error generated.
--
In file included from kernel/sched/fair.c:23:
In file included from kernel/sched/sched.h:61:
>> include/linux/security.h:580:9: error: implicit declaration of function =
'cap_bprm_creds_from_file' [-Werror,-Wimplicit-function-declaration]
return cap_bprm_creds_from_file(bprm);
^
include/linux/security.h:580:9: note: did you mean 'security_bprm_creds_fro=
m_file'?
include/linux/security.h:578:19: note: 'security_bprm_creds_from_file' decl=
ared here
static inline int security_bprm_creds_from_file(struct linux_binprm *bprm)
^
kernel/sched/fair.c:5324:6: warning: no previous prototype for function 'in=
it_cfs_bandwidth' [-Wmissing-prototypes]
void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
^
kernel/sched/fair.c:5324:1: note: declare 'static' if the function is not i=
ntended to be used outside of this translation unit
void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
^
static
kernel/sched/fair.c:11065:6: warning: no previous prototype for function 'f=
ree_fair_sched_group' [-Wmissing-prototypes]
void free_fair_sched_group(struct task_group *tg) { }
^
kernel/sched/fair.c:11065:1: note: declare 'static' if the function is not =
intended to be used outside of this translation unit
void free_fair_sched_group(struct task_group *tg) { }
^
static
kernel/sched/fair.c:11067:5: warning: no previous prototype for function 'a=
lloc_fair_sched_group' [-Wmissing-prototypes]
int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
^
kernel/sched/fair.c:11067:1: note: declare 'static' if the function is not =
intended to be used outside of this translation unit
int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
^
static
kernel/sched/fair.c:11072:6: warning: no previous prototype for function 'o=
nline_fair_sched_group' [-Wmissing-prototypes]
void online_fair_sched_group(struct task_group *tg) { }
^
kernel/sched/fair.c:11072:1: note: declare 'static' if the function is not =
intended to be used outside of this translation unit
void online_fair_sched_group(struct task_group *tg) { }
^
static
kernel/sched/fair.c:11074:6: warning: no previous prototype for function 'u=
nregister_fair_sched_group' [-Wmissing-prototypes]
void unregister_fair_sched_group(struct task_group *tg) { }
^
kernel/sched/fair.c:11074:1: note: declare 'static' if the function is not =
intended to be used outside of this translation unit
void unregister_fair_sched_group(struct task_group *tg) { }
^
static
5 warnings and 1 error generated.
--
In file included from kernel/sched/rt.c:6:
In file included from kernel/sched/sched.h:61:
>> include/linux/security.h:580:9: error: implicit declaration of function =
'cap_bprm_creds_from_file' [-Werror,-Wimplicit-function-declaration]
return cap_bprm_creds_from_file(bprm);
^
include/linux/security.h:580:9: note: did you mean 'security_bprm_creds_fro=
m_file'?
include/linux/security.h:578:19: note: 'security_bprm_creds_from_file' decl=
ared here
static inline int security_bprm_creds_from_file(struct linux_binprm *bprm)
^
kernel/sched/rt.c:251:6: warning: no previous prototype for function 'free_=
rt_sched_group' [-Wmissing-prototypes]
void free_rt_sched_group(struct task_group *tg) { }
^
kernel/sched/rt.c:251:1: note: declare 'static' if the function is not inte=
nded to be used outside of this translation unit
void free_rt_sched_group(struct task_group *tg) { }
^
static
kernel/sched/rt.c:253:5: warning: no previous prototype for function 'alloc=
_rt_sched_group' [-Wmissing-prototypes]
int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
^
kernel/sched/rt.c:253:1: note: declare 'static' if the function is not inte=
nded to be used outside of this translation unit
int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
^
static
kernel/sched/rt.c:666:6: warning: no previous prototype for function 'sched=
_rt_bandwidth_account' [-Wmissing-prototypes]
bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
^
kernel/sched/rt.c:666:1: note: declare 'static' if the function is not inte=
nded to be used outside of this translation unit
bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
^
static
3 warnings and 1 error generated.

vim +/cap_bprm_creds_from_file +580 include/linux/security.h

   577	=

   578	static inline int security_bprm_creds_from_file(struct linux_binprm =
*bprm)
   579	{
 > 580		return cap_bprm_creds_from_file(bprm);
   581	}
   582	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3107992228346681485==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
HFz9BzGMBg1dagAA
--===============3107992228346681485==--

