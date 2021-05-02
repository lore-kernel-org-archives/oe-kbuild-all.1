Content-Type: multipart/mixed; boundary="===============1201231860215034569=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [ak:lto-5.12-3 19/49] kernel/time/posix-stubs.c:34:43: warning: 'sys_timer_gettime32' alias between functions of incompatible types 'long int(timer_t, struct old_itimerspec32 *)' and 'long int(void)'
Date: Mon, 03 May 2021 04:09:26 +0800
Message-ID: <202105030423.HBH0ZctL-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1201231860215034569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ak/linux-misc.git l=
to-5.12-3
head:   da25990b9e339fcef8836f19a20f3818c762e4dc
commit: 2c0dd544b5cd0292e3a59ca1fae855de66d7dea9 [19/49] lto: Use C version=
 for SYSCALL_ALIAS / cond_syscall
config: um-randconfig-r016-20210503 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ak/linux-misc.git=
/commit/?id=3D2c0dd544b5cd0292e3a59ca1fae855de66d7dea9
        git remote add ak https://git.kernel.org/pub/scm/linux/kernel/git/a=
k/linux-misc.git
        git fetch --no-tags ak lto-5.12-3
        git checkout 2c0dd544b5cd0292e3a59ca1fae855de66d7dea9
        # save the attached .config to linux build tree
        make W=3D1 W=3D1 ARCH=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing=
-include-dirs]
   kernel/time/posix-stubs.c:25:17: warning: no previous prototype for 'sys=
_ni_posix_timers' [-Wmissing-prototypes]
      25 | asmlinkage long sys_ni_posix_timers(void)
         |                 ^~~~~~~~~~~~~~~~~~~
   kernel/time/posix-stubs.c:73:5: warning: no previous prototype for 'do_c=
lock_gettime' [-Wmissing-prototypes]
      73 | int do_clock_gettime(clockid_t which_clock, struct timespec64 *t=
p)
         |     ^~~~~~~~~~~~~~~~
   In file included from kernel/time/posix-stubs.c:9:
   kernel/time/posix-stubs.c:34:43: warning: 'sys_timer_create' alias betwe=
en functions of incompatible types 'long int(clockid_t,  struct sigevent *,=
 timer_t *)' and 'long int(void)' [-Wattribute-alias=3D]
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                                           ^~~~
   kernel/time/posix-stubs.c:34:23: note: in expansion of macro 'SYSCALL_AL=
IAS_PROTO'
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                       ^~~~~~~~~~~~~~~~~~~
   kernel/time/posix-stubs.c:41:1: note: in expansion of macro 'SYS_NI'
      41 | SYS_NI(timer_create);
         | ^~~~~~
   kernel/time/posix-stubs.c:25:17: note: aliased declaration here
      25 | asmlinkage long sys_ni_posix_timers(void)
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/time/posix-stubs.c:9:
>> kernel/time/posix-stubs.c:34:43: warning: 'sys_timer_gettime32' alias be=
tween functions of incompatible types 'long int(timer_t,  struct old_itimer=
spec32 *)' and 'long int(void)' [-Wattribute-alias=3D]
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                                           ^~~~
   kernel/time/posix-stubs.c:34:23: note: in expansion of macro 'SYSCALL_AL=
IAS_PROTO'
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                       ^~~~~~~~~~~~~~~~~~~
   kernel/time/posix-stubs.c:170:1: note: in expansion of macro 'SYS_NI'
     170 | SYS_NI(timer_gettime32);
         | ^~~~~~
   kernel/time/posix-stubs.c:25:17: note: aliased declaration here
      25 | asmlinkage long sys_ni_posix_timers(void)
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/time/posix-stubs.c:9:
>> kernel/time/posix-stubs.c:34:43: warning: 'sys_timer_settime32' alias be=
tween functions of incompatible types 'long int(timer_t,  int,  struct old_=
itimerspec32 *, struct old_itimerspec32 *)' and 'long int(void)' [-Wattribu=
te-alias=3D]
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                                           ^~~~
   kernel/time/posix-stubs.c:34:23: note: in expansion of macro 'SYSCALL_AL=
IAS_PROTO'
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                       ^~~~~~~~~~~~~~~~~~~
   kernel/time/posix-stubs.c:169:1: note: in expansion of macro 'SYS_NI'
     169 | SYS_NI(timer_settime32);
         | ^~~~~~
   kernel/time/posix-stubs.c:25:17: note: aliased declaration here
      25 | asmlinkage long sys_ni_posix_timers(void)
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/time/posix-stubs.c:9:
   kernel/time/posix-stubs.c:34:43: warning: 'sys_alarm' alias between func=
tions of incompatible types 'long int(unsigned int)' and 'long int(void)' [=
-Wattribute-alias=3D]
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                                           ^~~~
   kernel/time/posix-stubs.c:34:23: note: in expansion of macro 'SYSCALL_AL=
IAS_PROTO'
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                       ^~~~~~~~~~~~~~~~~~~
   kernel/time/posix-stubs.c:51:1: note: in expansion of macro 'SYS_NI'
      51 | SYS_NI(alarm);
         | ^~~~~~
   kernel/time/posix-stubs.c:25:17: note: aliased declaration here
      25 | asmlinkage long sys_ni_posix_timers(void)
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/time/posix-stubs.c:9:
   kernel/time/posix-stubs.c:34:43: warning: 'sys_clock_adjtime32' alias be=
tween functions of incompatible types 'long int(clockid_t,  struct old_time=
x32 *)' and 'long int(void)' [-Wattribute-alias=3D]
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                                           ^~~~
   kernel/time/posix-stubs.c:34:23: note: in expansion of macro 'SYSCALL_AL=
IAS_PROTO'
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                       ^~~~~~~~~~~~~~~~~~~
   kernel/time/posix-stubs.c:49:1: note: in expansion of macro 'SYS_NI'
      49 | SYS_NI(clock_adjtime32);
         | ^~~~~~
   kernel/time/posix-stubs.c:25:17: note: aliased declaration here
      25 | asmlinkage long sys_ni_posix_timers(void)
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/time/posix-stubs.c:9:
   kernel/time/posix-stubs.c:34:43: warning: 'sys_setitimer' alias between =
functions of incompatible types 'long int(int,  struct __kernel_old_itimerv=
al *, struct __kernel_old_itimerval *)' and 'long int(void)' [-Wattribute-a=
lias=3D]
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                                           ^~~~
   kernel/time/posix-stubs.c:34:23: note: in expansion of macro 'SYSCALL_AL=
IAS_PROTO'
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                       ^~~~~~~~~~~~~~~~~~~
   kernel/time/posix-stubs.c:48:1: note: in expansion of macro 'SYS_NI'
      48 | SYS_NI(setitimer);
         | ^~~~~~
   kernel/time/posix-stubs.c:25:17: note: aliased declaration here
      25 | asmlinkage long sys_ni_posix_timers(void)
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/time/posix-stubs.c:9:
   kernel/time/posix-stubs.c:34:43: warning: 'sys_getitimer' alias between =
functions of incompatible types 'long int(int,  struct __kernel_old_itimerv=
al *)' and 'long int(void)' [-Wattribute-alias=3D]
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                                           ^~~~
   kernel/time/posix-stubs.c:34:23: note: in expansion of macro 'SYSCALL_AL=
IAS_PROTO'
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                       ^~~~~~~~~~~~~~~~~~~
   kernel/time/posix-stubs.c:47:1: note: in expansion of macro 'SYS_NI'
      47 | SYS_NI(getitimer);
         | ^~~~~~
   kernel/time/posix-stubs.c:25:17: note: aliased declaration here
      25 | asmlinkage long sys_ni_posix_timers(void)
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/time/posix-stubs.c:9:
   kernel/time/posix-stubs.c:34:43: warning: 'sys_clock_adjtime' alias betw=
een functions of incompatible types 'long int(clockid_t,  struct __kernel_t=
imex *)' and 'long int(void)' [-Wattribute-alias=3D]
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                                           ^~~~
   kernel/time/posix-stubs.c:34:23: note: in expansion of macro 'SYSCALL_AL=
IAS_PROTO'
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                       ^~~~~~~~~~~~~~~~~~~
   kernel/time/posix-stubs.c:46:1: note: in expansion of macro 'SYS_NI'
      46 | SYS_NI(clock_adjtime);
         | ^~~~~~
   kernel/time/posix-stubs.c:25:17: note: aliased declaration here
      25 | asmlinkage long sys_ni_posix_timers(void)
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/time/posix-stubs.c:9:
   kernel/time/posix-stubs.c:34:43: warning: 'sys_timer_delete' alias betwe=
en functions of incompatible types 'long int(timer_t)' and 'long int(void)'=
 [-Wattribute-alias=3D]
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                                           ^~~~
   kernel/time/posix-stubs.c:34:23: note: in expansion of macro 'SYSCALL_AL=
IAS_PROTO'
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                       ^~~~~~~~~~~~~~~~~~~
   kernel/time/posix-stubs.c:45:1: note: in expansion of macro 'SYS_NI'
      45 | SYS_NI(timer_delete);
         | ^~~~~~
   kernel/time/posix-stubs.c:25:17: note: aliased declaration here
      25 | asmlinkage long sys_ni_posix_timers(void)
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/time/posix-stubs.c:9:
   kernel/time/posix-stubs.c:34:43: warning: 'sys_timer_settime' alias betw=
een functions of incompatible types 'long int(timer_t,  int,  const struct =
__kernel_itimerspec *, struct __kernel_itimerspec *)' and 'long int(void)' =
[-Wattribute-alias=3D]
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                                           ^~~~
   kernel/time/posix-stubs.c:34:23: note: in expansion of macro 'SYSCALL_AL=
IAS_PROTO'
      34 | #define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_pos=
ix_timers)
         |                       ^~~~~~~~~~~~~~~~~~~
   kernel/time/posix-stubs.c:44:1: note: in expansion of macro 'SYS_NI'
      44 | SYS_NI(timer_settime);
         | ^~~~~~
   kernel/time/posix-stubs.c:25:17: note: aliased declaration here

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && (FRAME_POINTER || M=
IPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by
   - LOCK_STAT && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
   - DEBUG_LOCK_ALLOC && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT


vim +34 kernel/time/posix-stubs.c

    32	=

    33	#ifndef SYS_NI
  > 34	#define SYS_NI(name)  SYSCALL_ALIAS_PROTO(sys_##name, sys_ni_posix_t=
imers)
    35	#endif
    36	=

    37	#ifndef COMPAT_SYS_NI
    38	#define COMPAT_SYS_NI(name)  SYSCALL_ALIAS(compat_sys_##name, sys_ni=
_posix_timers)
    39	#endif
    40	=

  > 41	SYS_NI(timer_create);
    42	SYS_NI(timer_gettime);
    43	SYS_NI(timer_getoverrun);
    44	SYS_NI(timer_settime);
    45	SYS_NI(timer_delete);
    46	SYS_NI(clock_adjtime);
    47	SYS_NI(getitimer);
    48	SYS_NI(setitimer);
    49	SYS_NI(clock_adjtime32);
    50	#ifdef __ARCH_WANT_SYS_ALARM
    51	SYS_NI(alarm);
    52	#endif
    53	=

    54	/*
    55	 * We preserve minimal support for CLOCK_REALTIME and CLOCK_MONOTONIC
    56	 * as it is easy to remain compatible with little code. CLOCK_BOOTTI=
ME
    57	 * is also included for convenience as at least systemd uses it.
    58	 */
    59	=

    60	SYSCALL_DEFINE2(clock_settime, const clockid_t, which_clock,
    61			const struct __kernel_timespec __user *, tp)
    62	{
    63		struct timespec64 new_tp;
    64	=

    65		if (which_clock !=3D CLOCK_REALTIME)
    66			return -EINVAL;
    67		if (get_timespec64(&new_tp, tp))
    68			return -EFAULT;
    69	=

    70		return do_sys_settimeofday64(&new_tp, NULL);
    71	}
    72	=

    73	int do_clock_gettime(clockid_t which_clock, struct timespec64 *tp)
    74	{
    75		switch (which_clock) {
    76		case CLOCK_REALTIME:
    77			ktime_get_real_ts64(tp);
    78			break;
    79		case CLOCK_MONOTONIC:
    80			ktime_get_ts64(tp);
    81			timens_add_monotonic(tp);
    82			break;
    83		case CLOCK_BOOTTIME:
    84			ktime_get_boottime_ts64(tp);
    85			timens_add_boottime(tp);
    86			break;
    87		default:
    88			return -EINVAL;
    89		}
    90	=

    91		return 0;
    92	}
    93	SYSCALL_DEFINE2(clock_gettime, const clockid_t, which_clock,
    94			struct __kernel_timespec __user *, tp)
    95	{
    96		int ret;
    97		struct timespec64 kernel_tp;
    98	=

    99		ret =3D do_clock_gettime(which_clock, &kernel_tp);
   100		if (ret)
   101			return ret;
   102	=

   103		if (put_timespec64(&kernel_tp, tp))
   104			return -EFAULT;
   105		return 0;
   106	}
   107	=

   108	SYSCALL_DEFINE2(clock_getres, const clockid_t, which_clock, struct _=
_kernel_timespec __user *, tp)
   109	{
   110		struct timespec64 rtn_tp =3D {
   111			.tv_sec =3D 0,
   112			.tv_nsec =3D hrtimer_resolution,
   113		};
   114	=

   115		switch (which_clock) {
   116		case CLOCK_REALTIME:
   117		case CLOCK_MONOTONIC:
   118		case CLOCK_BOOTTIME:
   119			if (put_timespec64(&rtn_tp, tp))
   120				return -EFAULT;
   121			return 0;
   122		default:
   123			return -EINVAL;
   124		}
   125	}
   126	=

   127	SYSCALL_DEFINE4(clock_nanosleep, const clockid_t, which_clock, int, =
flags,
   128			const struct __kernel_timespec __user *, rqtp,
   129			struct __kernel_timespec __user *, rmtp)
   130	{
   131		struct timespec64 t;
   132		ktime_t texp;
   133	=

   134		switch (which_clock) {
   135		case CLOCK_REALTIME:
   136		case CLOCK_MONOTONIC:
   137		case CLOCK_BOOTTIME:
   138			break;
   139		default:
   140			return -EINVAL;
   141		}
   142	=

   143		if (get_timespec64(&t, rqtp))
   144			return -EFAULT;
   145		if (!timespec64_valid(&t))
   146			return -EINVAL;
   147		if (flags & TIMER_ABSTIME)
   148			rmtp =3D NULL;
   149		current->restart_block.nanosleep.type =3D rmtp ? TT_NATIVE : TT_NON=
E;
   150		current->restart_block.nanosleep.rmtp =3D rmtp;
   151		texp =3D timespec64_to_ktime(t);
   152		if (flags & TIMER_ABSTIME)
   153			texp =3D timens_ktime_to_host(which_clock, texp);
   154		return hrtimer_nanosleep(texp, flags & TIMER_ABSTIME ?
   155					 HRTIMER_MODE_ABS : HRTIMER_MODE_REL,
   156					 which_clock);
   157	}
   158	=

   159	#ifdef CONFIG_COMPAT
   160	COMPAT_SYS_NI(timer_create);
   161	#endif
   162	=

   163	#if defined(CONFIG_COMPAT) || defined(CONFIG_ALPHA)
   164	COMPAT_SYS_NI(getitimer);
   165	COMPAT_SYS_NI(setitimer);
   166	#endif
   167	=

   168	#ifdef CONFIG_COMPAT_32BIT_TIME
   169	SYS_NI(timer_settime32);
 > 170	SYS_NI(timer_gettime32);
   171	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1201231860215034569==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICLcBj2AAAy5jb25maWcAjDxbc9w2r+/9FTvuSztz2tq7sRufM36gKEpiVxRlUlqv86JxnU3r
aWzn86Vf8+8PQN1ICXL60MYCwBsI4kZwv//u+xV7fXm8v3m5u735/Pnr6o/Dw+Hp5uXwcfXp7vPh
/1axXhW6WolYVj8DcX738PrPL6/3q9OfT9Y/H//0dPt+tT08PRw+r/jjw6e7P16h8d3jw3fff8d1
kci04bzZCWOlLppK7KuLoz9ub386X/0QH36/u3lYnf+8gW7W6x/bv468ZtI2KecXX3tQOnZ1cX68
OT4eaHNWpANqAOcxdhEl8dgFgHqy9eb0eD3APcSxNwXOiiaXxXbswQM2tmKV5AEuY7ZhVjWprjSJ
kAU0FSNKmsvmShscAXj2/Sp1/P+8ej68vH4ZuRgZvRVFA0y0qvRaF7JqRLFrmIFFSCWri5P1+2FV
mrO8X9bREQVuWO1PNKolcMKyvPLoY5GwOq/cYAQ407YqmBIXRz88PD4cfjyCVXQk9truZMlXd8+r
h8cXXNOIK7WV+0Zd1qIWJMEVq3jWLOO50dY2SihtrhtWVYxnPl1HVVuRywhWOLRjNcgyQZmxnQA+
wpiOAuYObMr7fYF9Wj2//v789fnlcD/uSyoKYSR322gzfRVubKwVk0UIs1L5s/E7iEVUp4kNV3t4
+Lh6/DQZfzo8hz3dip0oKttPuLq7Pzw9U3POPjQltNKxk91hJoVGjIxzmt0OTWIymWaNEbappAKp
Iqc/m00/mdIIocoKuvdPRQ/lui6qfkW8rH+pbp7/Wr1AZ6sb6Pj55ebleXVze/v4+vBy9/DHuEY4
l9sGGjSMuz5kkfprjWwMY2guQIKAghKHitktHnA7zgpBsEk5u3aNJog9AZN6YQKllSSf/sUaHS8M
r1d2vrUwzHUDuHEa8NGIPey3NzUbULg2ExCu3TXtBIxAzUB1LCh4ZRh/GwGyw+JGtYe040O4vuH8
bNs/vBO1zaAxSN3FfcsYe/vn4ePr58PT6tPh5uX16fDswF23BHbQ0anRdWn9TQLdwlNa9zjixvJM
xITsdOhSxkF/HdjEii03SkD0PwjjGY8WHoud5ILoDkRmQYQ7gqhMiGZO2RCNrMaT09Gwio0TQSVv
S9g070jUlW0K/9sKEwCAB+33qEgEnHZLTTcTfFtqWVSoTSptgtU6Xjtz5eZGbgvo7MTCykB9cFaF
WzMQGTzAxPBRjod758yc8XwG980UdGx1bWALRhNo4ib9ID17DIAIAGt/4gDLP5A7Dpj9h6Bx/kHP
mr6jW36wlTfJSGvUlt3hGPeaN7oEtSw/iCbRBvU+/KNYwQW1ARNqC3+MQzj7WMv45Mwb1olW9zFV
MxNaBc6CRPnwFFEqKoV6cjS2k73sEORGJhkrlqxV611QBmmwMCBnWxI1ORcDXOQJsNjQA0bMAtPq
panW4PvSnZZ6oY2VacHyhBZit7IFnPMDEkov2QxUWuALSU2QgdWqzcRgsXgnYYXdftA8hc4jZowU
huh0i82ulacaekjT7vwU6jiKh7WSOxGInCcuntpRGgxQbIDYhNSgDXLN4sD+j+CmVhSrsEfn3/rh
w5b7zjesVsSx8PAlPzl+17srXVhUHp4+PT7d3zzcHlbi78MDGHMGxoijOQeXyLdO/7LFuIydaje7
9ZMmot4faq1KVkEA4QUxNmeBS2zzOqJlMNcRJUfQHnbbpKKPAsK+nRHLpQVFDkdUqyVsxkwMDkaw
NTarkyQXTcmgd9hkCFbAFFCTuLaVUM5GYewmEwmUGOl4XqROZN4Kcn9u0OlwNsb67kYYdbk9qVX+
0/OXw+3dp7vb1eMXDGqfR0cLsJ5mU55zA36y1O0x88dEBz/JWQoqrS5L7etJ9N3BZs0R4H7ybdt6
hhs8fwbhjQFj1zqmnrr+cHEyhsiFQT/BXpy0i8sen19WX54ebw/Pz49Pq5evX1pnM/CZ+tW9e39m
aeWFKBpx+gaisnREiDilFkY6W+qwBPmXtZLyG+i38epN7Dsau12Y0vbXBfh7Gs5NbTVtVpRIQK6F
LmjslSx4BhH2wkQ69Ia2EwoEZqHfVIAyTfcnb2CbfE8cSsWvjdwDtwM/eicZ3zRrujdELjAMre1C
K1AKihh///5sHrMgUKJ+LHDenIEnCWpGJtXFmU+Snyzj4JSlhUJV67s0fce5Mxdcl9chDqBNCVqo
dW1trUI0HIQQoMDXVLVygWvClMyvL94NRplt1k0iQJXzKnCUujgW/TWRCzoQgP5Ag7Rz9SKLDuz2
rNms5xim4jkwu059LTv0AtxhtZkjQIMVVglQ09QQteIk/EPG9N4lTwYt/U2t5Wln5KfPpbN3EZn1
Qbb7w2+aHExq3pRpxaLcD3VcagjTeJZ3vtkUaQRuOObDml3nogBCsLnWzq6ETLNQ1VcAD3ONmIrj
RpbVLNOIYyS+KwWyDZN2BqPRYFQNaPrBOrGy9H2ibmntQu3FZmQS8g09S9wyZEJndchMBWkfe8u5
4n/ePN3cgruyig9/390ePNMJcYswBoMVq/MwxLO0J1yAWw1HKFRWg6NvKocLjkR1vURfdSjv4IFi
UBNYoXtpDMDwTwOxuW7BR58+/u/x/8D/To58ghb3D6z9foDDyjr4l5evRyHDIaos4iUWE4wceFwc
Xv77+PSXx+GgX4izF3udNvVcSmkq9P9VTjDPSbmtLZjFGEMsK6Pcc807zAwwz2n0CLuV4PdcF55o
lwqcRCHKAIJhfw8dd1k1V2wr0H2iHN9STYiXMh6A4vnWJ766hNVdCdM46ytR7Xd+rt88yNffPN3+
efdyuEVF9NPHwxdgNnjuc8fRiqpJpopjswbl1OgkaTyV0OajrWogsOmy9dN2VwxmBuYfnGUDmqdP
9U+6cJsmOAYCb6AacJWrYI+mTZYI80pP0rcw4xp0p7N/GDWbwOrkQAvRHd9egfvvLUmjvpNpJxub
GYLx0L3vIpuWeai2JtwBT7zLI4e+th8zDenylOvdT7/fPB8+rv5qwzAwNJ/uPrdZ5TFdD2SdtiUP
11vdBKzHy6wyr1NZkIHIN8RpyANVjcLUgm+nXNxsFcbHJ+GGIBMbl/+pZns1BSAdxB3TwLlD1gUi
aM9slFbKP+wmYvhwAeXH8eM8KVg7JxIzSR55GJuxBTc2oFmvqTzbhOb0bHmQzfuFKCGgOj1Zvz0M
OBjZxdHznzcw2NGsFxR5A87ech8YMV+BIwm6ufBSto1UaCmDRGxlpIKdhEMaN1tMuSz2isl6gcKg
t3WggiM8T5ShsMWJl50p2lvPxpaycLLDPS9nNA7uoIl/DrevLze/fz64G+iVS4W8BNYtkkWiKtQs
dCquRbeuE5XobfHAI//uFkKNuFalfxiXpuLmog73j09fV+rm4eaPwz2p6yHer4JMAAIaF4QAGGIY
X7mWOWixsnIKyoXqg+ffXXFGuLU68HOcBnRakTJrmEAxArc9SIFsrTej/hIXnUQMPxoWx+bi3fH5
EP0UAsQD/EfnmG+Vr8cFK1zAFEyJzHR/KLXOL+6Hz6iOva9NAhre+3bKS/M5xPnB/mh4W9kuFNMk
W1gnxQgIzTCo6C7zRl2OsYmwtJe0vL0jYzwtipcaMDqezRAoJjC7jRoBLmfR23MnTJ0/BlZiLkWw
w1sY6j78bmLJ0hEIR2wfHLg9yL+aQFyTMS2V46XZqA1y290xUV4zICvtqd59YlT4BZon1ROQy/bf
ByAXhyegkfyxHcbWEXhdueTU5YyjUDLFTNd03GwyBGi86aCl82Tu/Y3ZiuuLya0UgPoxSMWyj0t3
PSYqSlXKQCDAr3UXHpzZUGJLTKXjBUzcGA22m0ptApHDYWULKPI46LYsyul3E2d8DsQ7oTnUMFNO
5LaUMwhILUiDqvch06CPqi4K350b6KeU2EVkwE3oWOAxplucVsr35wbMhF+lVOAF72grPuIpwwqh
BQyjt1LY6Yx3lQxnXMfe4gK5SHRNx6UtbuQKfS2CggFSuowDgV1GtrK7IG+z3XDAUDW0dLykwLhm
AmzYFQVGEEiFrYwOzg52Dn+mg2RTGqSn4XXkZzJ6A9TjL45uX3+/uz3y26n4NPAIYfPOvKnBV3eU
0N9PQunpcbCChLzrQor21tNiBiZmccjNs0DBtJBWwwT75IAYwi06xgMVqEC+tKFno64KF6FkebbY
xim5ThQmU51BsbNW9sMBLJkecyiyj+DEt1NEfVeCQZ5mztr+6widSDvbnvbML41tRXrW5Ffzgzli
M8X4UnNT5mRr4E3OIkElOSBeDJQpSr6DTY5EC9vWWIKHbkRgTaERVvVhzKyYoVxk7Lasyk7FJ9eB
fnJty+zahbXguKhych0LNG0YTvm35RCh+xeeDtbUiqqSAw0Wc15OzzsfF+3cFASsOJfx86za01fI
rh2Srec5F5JuQ7pgi6ONc+luTLOb27+C8q++cze879JTrbxGllceE/BrUFCtGXHChgopyFsu0S3G
nostMI9C2TGk/9YM3hrZ39Z28ECWgzwMfKDaDbAeJ3vFvFTYCTEPCc/XFaX1rM/xFJ2T4SsyMk7F
9LuRqYKdKrQug7imw+5yVnQpKgqtTBjAtlCeUJdJLlHjDoJlofuAgPsJANQeJp7ON5sTGhcZrnqn
Z5HgjaZg3Fx6laTIRJ5z0K/biRYaCFJ7JSn++zT471sTXFy2WMSoaksjtvYDjTBV/q5Z6E1zkeuK
xl1ytrR2EInzzfFm0Ynr6exv7OTk+PQbXIJQU+YusCE72Rv76/ExdTnqRPP98frkclzBCGvSXSib
HkoBipx9LPgkz9+ftpz7E4RPyj9mFcsDicECOFaCEUcEHQStT+njzUq6hqTMND3Fs1xflazwh+9A
dCX0hKbISKsvhECenb4LPJwB2hR594crV5N4p8soN8Br0sZ8nnEcUcQaQP22yAUxcoWMfeB/+Xp4
PYAR+qWrTA2sWEfd8OgyVD8IzKqIACaWT+US4aUhC716tPPcLqdhj3VXmrQz2+NtQtUHjdhLajaV
uKQ4PqCjJDzhLQ+m/pUDgxv05vwqNl36jCT91hpj+4YLhwTwr5/lG9oZM1+HusQJzYntNqIRPNNb
QS39Mrl8Y05cx77L3oOTyw5D7DVnW8r3GJvOu8uyZD7jUoo5EAYm4WPSbC60OXldN269nU9oLEfz
VFrrZoXsmqEdW96k6HlHzMkjaVc5a2y/MTz454luEmYpTdkTdau8OPr0n+bL3eGoexfx+eb5Ga/h
Jy+vkJrnM9YCCO+IJKU9e3zFZRGLSfIHES5WezeHJ1fh1iKs3qx9ue1ArgaZqlHp0HjW5n0Zuytp
6NkcDDH41fTEIJzPKsenbCkTYmk5XgXP4QrfJ+G902Qk4RBvjML4JHEMgDbzKeZwvPX0R0gdsSHL
Mvs2ShrQaeGMEW4hjsyJMQpGTQif/BF9yDA5McC3kaDfVfUUPKh/GuZaziUU4bucLN/o0UHhuTcH
pYl1y2SmQBHcZgUw6/vGQCkmnCeNoT831sQqUDRvGN6OYjxqQfuK91cFb6lk0BmBsuGUWMSFxQcV
Og8royFOY3jfs/OHHqH9nzv6js2jy9m3SGJWfYukoINJj0JxWjn640yDVA+HF0T0/ZCGqGoH0RGc
Wq/mYASGqa5ddwMwh/Qx9ejA94gcYlUseKBigrbehug1RIxxWZDDwmeoOCyZx8onSW+EQBw4cTIK
m/ksyyyVU3IS57gBEcL0vOYbUIYWs0uAJBpfmiqIlvAbT98CaaOySWq+4FZ6k4avRguIpVXcpLgu
Fjxk7B4vuQTbkvPn0XR3LAuLNvsmqu016mcvzR5d+h/4IqEygqm2Dme4yu6rrF4Ozy8zxz42umxg
R2WljZ+hmjWaIPw7Qm/XmDIsJnUNZ140j2+XDbsKAZGfdkBAOiH47eR8cx6CpNUucdN6IKCr21Ky
Vfx093f7rMEj3s3msNvzMGpCoM05qfS5iwh3YQ+c5byJZIWZez/PgzjVEL075dBdcdKPVIllDHvs
mcIIX1OI2NelICcJHtCAqAVhxWFAGRWiDDsDAGi3WV1VjwJrX2kKmwWWEwA55b8DXNnEvb0Pqd8K
sgFtRZ7Mr8dHPNYi1+6acJLidSIRfX49vDw+vvy5+thy9ONUMKKqq0f2eZFxWTNTUTCYkGmVzxyV
vZusrUcUeiupggSPJOK2XGjNqmxDKW2PJNAKI3hzJY0gMX0NNjUeHMQlbvckl3zB2nqzTs/2VPrJ
I1FmN5v3Dv4L+O6IAkC17TZnODKL2zxkmBJQoaYMFHQPA178JsDHyjVZ0TSQ9Wa9g5v91r+kA7Kt
X+owVcUdOJFRY8JKN9yjPKjO4EmKuRuvdqlNF524Gx58YRYYmo4alYrINRbJXDFTgDoiH2L11FyA
Ze9fKzW6qIkJgMN2WcP0XKU5lgqINI4IMqyw7Iq/HQl6s1R3cPoNG0liafAZ63wlQAHzy/M6Z6bJ
8JnUWytBanyht3evnswCb7oAl1Y0Ht2yNhpZZ2JGV6VPKa8mnvM0PUfdjvQoLBVyhXgA2bevYIeH
VCbZSv/Mt99NWk5zN+ezMOm87Jy6BVfjvJw7sJxJMlgWZdbg71rcTyF4SwAWZ95Rj0eJ8SMCajKJ
d0EPH+BhprJieQgsuJwBmlB5I7TVKiMjErycinM+sxjF4eZpldwdPuNTx/v714cuobH6Adr82OkX
z364nqQK54AMrlnuJjcZNYnJ0B8wZXG62YT9OFAj1+EvZHSItVvmQmeh1uwhBGMcGEeYcqdynATM
wgjFvqTW14HfaGg3yZUpTsOVdkBqrS3q/Xy5nk/6r/asH6+kMhBtdN4BqLv6HoaONhXeAsP6MsQO
lOITDdBik/jH/bSBsmkIBeUdPrtJmMx1ECuLKqu0zvuIq/fvZy7v+CLg7rYDr/Ts6Whbfp6JPHiV
E4DBelVZ8Fs7u0qV/ruBHgIhRPsTKeNdcMWKmOWTi+TxOsa0AyXSKLBWov3Nn9lpTO6e7v9783RY
fX68+Xh48opar1xReGBae5ArxYyhx+BXAdDy9KN5axpbuR+NmPKDRMPe5DlG0hRdXxztMwOwTjZI
6Z2ucfAoXA01XoUFVcED510c4R6ak7naLswwItguhKIT0bUE/av0LnAnStVcautVlFBlVNgDwxcz
fT+YCwwyVG37HiuWehoeEJd1HxR5Vk2kQXVy+93piBBmS+W5jR1QKTCHU6A0l/MeN16Zb6wYFi6Y
VoQSXxoQlYiCt4W+wg+YF85bG4W8Ps8NB6YwsWxYYWQ/DqEy6QD+VV4LoqpYev/XG8Azthr0Faef
raeF73DiFwY20reuDgjONo2w0iQ9xk8MI66O9h2K9n0qKs0RV96u6sT/G+uGKxSgAIhl7FjLFQAF
M/k1jdrq6LcAEF8XTMlgVFd4HvjiAAskBr4LEU6k82H8QwRQ1N2Tn3hpHYydEiv7+uXL49OL/7ML
Abyt7b97vvXkZgxc4tP16b6JS03e0tRKXXdzHm+euT3frO27Y7oQCEQaoh8Mo2HbZpmJftgytufg
mQYvTqXN1+fHxxvvWtpB1sdeAZMorDa2qQBzekogouzk11+Pvdipg/8/Z0/XnDqy41+h5mmmamfG
n2Ae9sHYBjyxwXEbQuaFYhJuQk0CWSB1z7m/fqVu26jbcs7svpwTJPWH+0MtqSW1bHFskQugeR4N
XV+70ImFPQz48OzIMSV0FduRALfKB5d2DppRkHBQtx3t1r4GZ8ksZJ3CazwI6cNgpPlD1ZixG234
0PiaII2rbTCeF4ngFOaaKElsy/Ko1mt8h8q3tv+2uwzS4+V6/nyXSTsur3C2PA+u593xgnSDt8MR
FGRYW4cP/JOurCrd9gQi/D/qvZ1jVQJnLwgEBRFJk2i+pPxTW+wqh1Yk0kaf78wVIjEsiFbBFSAi
1u140a/kjFw6SqY6wIce/vrEDJTi34fr0+sgJLFwjBnJJ1sAfmzzOF02eWA0hLQfGXfG6LSD1vku
NK9Gvmsx8HUQJENryKHSqFxiwgV0bup1pNKoxt5o9A9IOnoCRxiMxl+5LqmObzadqyZEKr+1Lx2k
ar8mU7/opct5c3RDdh+FAeMaVia4auHoy1OunyIXUePO9cOeaMRmd24uof9wxRHmUc3R5MKdAcX8
UWoI7xqAWG7EA0CoVWqD4VVzzZ9eTIvOvsAEJ0DWa00N86aa9qxKFxLSdiW8X4WLKg3N5sJNAEtn
OEE4b1uUURzACQ2CBh3lvmd7lt4aQEew2DrAwAsCu4beWgD4SBHzDajbHDWW1K6fRmEc9nY8krFv
/fg4BMbU/S5yeBcZiH98r7JNpY+4ygSyeQgfdXgGDDOpbMu2Ix2Rh+UatFRzPhqwbc16e4YbP8l6
enbjCtrg38BVZwIkTiR52lPlQhorw0z/gPumBJX11f41gItEhML8UOjNXdNNzjMYt6/WnqjgKN4Q
vQTPN1gZIGTphHERuIHjdIFVFNi22Q9J7QU93ZDY4Uj/IgUcmzWtUxCWMekLW9MGk1FttjPYy06J
/5K5kYdWk+KRAjUdBaRbBBokrbJ5m05ZMq0m4aJ7NSM5Yf75dgVxYf9N4yJNi1st8otC2yiPjTxe
ZYVFJHr5EuC2G/iHigsMfUtekKMYfmCmVjMeBsFxgpoGd92F2G78A0LzougxiRR1sB6y7j6KngRN
RcF6tWOVUk03Oy5V96rid7XIWBdtkc2jZqwxB86vl8PzfrASk0bYkmX2+2fM2n06S0xzjRw+7z4w
e8iF6D11tQ+8i80DzXiCllqiBMCv+vr4dvNcw/BUZGqT6CgV0dKoZloaADX1soOb3xz/d+lQTD4Q
BFwMxX4mUR43P1wl7+nCHWwLtA9rIgax7amhaNOrdMwE2r0txs+OA0wso+0zpZpIMHdCxPDdMndJ
nUah6ch2Jmi/ML2Nau2mD6isb8Z6bIZrHXUSHSqtXxqtFMe4LaobJqpK2ZKpnN2+uM6LeevcDaby
Bd3SYtUOKlGbx6fp3UOT9Y+ukgbIXIG0RJi1RlHxYh0MJt6zsEa3tRZoD7/vNACw3uyxse401/2d
uW/PK9XVqlyJSobRthZPlQsc5M6OXqTZxuAHlAvLGKMOdbDKWqKZCBAqUyFyzjOIRW5ct034tuxH
9Hr44DY3FgvLiRywrfRTTBYzNspO1W/cYN2g2knQgLMq8lxraH4FooooHIM4+EVLiuIbWzhd4Brt
KSwDkhsazb2/Lp5nG5DY+GRKXw6cXlVta8aN29MTkatN1i6H8O3ldD5cX98v2oqQQfET6kfZAIto
ag6AAods7402tL5Uq4k5GCIL1/x5pcYRjdGm+t0hqAP6tT6Y2r1mv5Wm4BsfEES+gR/ahlBnmUgH
T6fj9Xx6eyMXKBL8dkBbB13RWAVuk55jWHTkHDyZn95OT39r+6ORQTrI9uiu11fH5M8szlv7CrfN
o8JxhcUnemyIxMb29QAhldN9f9xfdpfBx+H4dD2/EVnqlha9h6Q1EMMm1tTNGiAdy/FOqX4kwrcd
kyIt71EWN68sdLYguYnMzGzAIsMtsAUacfvthpGMfP/tY3d81uRFWTCMC98PAqONGmpaWCUuDzcj
17I4e3uLdggjk1DJiNyN0UwNZZuRuFFvM7CpA3+kGVgkvCrSyAlsq3drG6OhOP007o7SjZ11sRK9
Ppyvn7s3haMrSBvJ2awEyaXngkIOGKhmKy0ZDlsxWdsyXxqoIbxZRGLRcSPTxBwK/yJWuEAdH0lZ
bHOTFcYROvyC5M8pX/LmrNBd+ZGdzJDTw8qyhrbhCI0VbaMHx7I5s1pDEAtnFJAEkg1cTES3IQ2Y
h4uwAXaKT+4dNJ/QwTJQPRf9DRUseXtkeVa36hrjdLsHmGAsrxRuJpQalRXByBkx7TUEOqNoi1Xu
0Lc5eOTZQyfr9iFOKnl1JrvpDf1htzAMgGf7m25ZiRhbXP8R5fhffQBSjFyfbc7H5lhEMLbYfvjj
wNL8bwiKd89r10g+cT1iFG6mbRauZgkOnDP27G6bZTX2fJ/pSzweg7ilKRfzpMzZoEf55k68JB4S
DUSKC7SSFrFYPoSPyxW37VsalalfvVKQLDA9RMw0gT73MuMB1HbzuGrRzbkj2dnD7vr0+nx6GRTn
Pb6Vcvq8DmYnYErHk87w2uLoGKXq3s6W686h1FbY58gsltOKDlDbwp9piulSWxynwU+iwB1a24eY
iII5fG3o2BJIqkMtiKvqZjZLZqush3lHSaRmirQSp6GEd3KIS+I5HIxOo3jPzruP18PThZOYOrhW
NxaT7XIepSBbVBXMcrKAFokNARQxTK1yR/ukIK2/G8moJq4HEMo6dqS2yGohwikmNhMrmfGxU1Rm
CY5asbI7kYvkAXTZ2FDkY6EiAToLA1CkOwZI2lv+ejsc//7Z/kUaXsrZROKhmk88lwcCk+TCwTlP
23oGP8MP2IbpYpb/0lQ6fdtdXmU+4+p0fnrta7c6H15eDNgEO0DuAiJMCJ1OUpiQx2aIoBu7vz8/
UOC+nN72g8vHfv/0qj2Ow1OQhVdFPWMU5+FkNSW5y27WB7R3TVPWM12V2qIfDHCRSkuCUuMM198a
2rimk8O0xsyTUH/Dh8LrJwP4WyD9C9qhXG3iVBRaZn3krFlE4szmseeNAqtz41fDiXdbFDuag0kR
ol8bZgbG1BQwaeGs57Ez1eZ2kmGOoR+SsFEUN/w0C/Wgn1WPRWY9Zc0taMNpTW7fKZTKALWBCNjc
qgNcxwVJ8VADbxkOGzhS3X7JzNpGdRKmnoJTfKe2ybWc4fB0Pl1O/7oO5t8/9udf14OXzz0wCIbB
/Yi0FZDL5NG0sVXhjA8ukzlEVHrhZh6yO9SL2mSaBqFM8xHS4AG1rIxKWhjKSWMv8FmcSH3XszU5
REf6nKFGp7G9vqq9Xgz1KSGYKI6SkUVydxm4sePzOOFYFuyvgq21eNBMjQSzjjjJnRCo61fprUZD
4B4wSZeZ2rSOtUaTgTh9nrXLDv0eTd1ppdXQm7C8hq2E3v+l2WTJv4ORQt9XnAd8bUF4P133mCGf
Nx50sKrUx/vlhS2gIchqx4zlGDzR6YBYRoOfhXy0bbA8ShvbL4M2S7zhKBu+v51eACxOEdc6h1ZO
fefT7vnp9N5XkMUrD7BN8fv0vN9fnnZwvt2fzul9XyU/IpW0h9/yTV8FHZzygDrKdLLZ4bpX2Mnn
4Q2lhHaQmKr+eaE6p8juDT6/d3xYPJ3dCITwztRuMIn1t746OWwrV/yjRUEORUzVvp6WCZffItlU
kTxj62TBV5BWuiL7zVVDkkvTwB98AG5NIdXX905BYK6u63NcpCYoqgUohxZTtKyC8cjlgs9qApH7
vkW08BqM4nTdmw4CZgb+damPn8oOTCz3mhlfXtzqrrQ32DaasGCQhfrgyWKmnq+9caQbfv4gb4NA
LmeTmgLhncxyofmHI7gq0xnoqozfb6pumOBPanIkZTqksnkhMxY3JA4lEQ/NPfu7/hGAqAv0dP7W
S+lB30gY4dPTHvSM0/v+aiy+MN5kruf3+ilJ/MjpM+TkoR1Q800eelbnt37vNMkjWIxSAch4qBnn
EYdOYLG9i0PX5j3CYB2UscWlo1SYsSawl7FNlqsc6aruixtuUtGDw3sIA3+3EfHY+Fl7xrWg6I87
27KJS2AeuQ7148vzcKQZSmqAXhECh0NtWwMo8Hw2fXsejn3fbkwkOlRzy5Agl6tiE8FkEiEOAEOH
dlNUd4FrE0MjAiahb1EjrbEW1fo87uAgHVxPg+fDy+EKmiiwTOCTV91/LB5ZY7v06RcDzBlzAiIg
xmNif0sWKv6xNd4RsXYzsom1Kl2EzmaD/Jj4R1WR440066sEBRzblZjxiDpRbWx3SCcc5OEhDeHM
o8L1HMJoF+EK1DIylPfoBIa3V9sUe0ZTFbSYNWDY3XAjAQo+N5qI5Qkkk+mbhhvqAgxEVmBzzEAi
Baxsn95gfzm1dPKn59PxCnLEM72ehN1WJvhKkRZO0S1RC2sfb3BeGxxunkeemQ+uFd/aArWnxf4d
35gfiP3xctKWXpVJ37Da+/w2LQqR/LnsYCZ5MqSKtfqtb+EoEoGtrao0vO99v7PI0WuV25oiil3L
MKopmNacArVxGQ0UE72XGOcrZoWrWYRFIVzuJmn9ZzDe0BnpjJy6JT0814ABzKQMv6sTsTavZbEE
dPZz0Tr8q09RMrwomnLdSrtIg3nTCr/34Go+Wft7q4ULa3inVh7PnXxrSLRN+O3S+YffnjfUfvtj
p5RvoRhQt9QAw0AvNhwP9XnFYA84CylEeJ5DOpMPHVdPdQUsyLe5uwZEBI7Om7yRQ/g+bHRozPdr
ftj6KH8xSupOFW/lPt/fv9fyt77PVWhKsp4lxDwlZ0XFQkl8P2bbPi2vS0yURElu/A2n2Tdl7zzv
/+dzf3z6PhDfj9fX/eXwHzSNxrH4vciyRklUurJ6Fud6Ov/eemsf9IX5JZ1yB3jdXfa/ZkC2fx5k
p9PH4Gdo55fBv9p+XEg/NF+B/2PJNr7w6y/U1v/L9/Pp8nT62MPQNfzxdvOXz+whxyumm1A4tmXR
BXuDGSJNsXItnwiQNYDdqrPHclmLXyzqJp3RNVHNQDXhb7n7v1Nxs/3u7fpKzoYGer4Oyt11P8hP
x8PVGJZwmnie1fPsDihulm12Rkc6bE/ZRgmS9lP18vP98Hy4fudmLswd1+aFgnhesVkI5nEE/aah
V3HkQG+JTFUJxyFClfqtz/a8Wjna4SdSON84iQoRjiZFdj5IcRjYWle8yHjf7y6fZ/UoyicMEA3G
yVNYqPScxt+mzjHdLEUwUroL06G7fDMkLDJdrLdplHvO0KJ6BIHqX44YWNpDubQ1ZZgimDWfiXwY
i43BBlu40YqBcyPKr78YK3Vpc3h5vZL10p4/f8Rb4epSSxivNrBWue0fZq5aGDfiDI4iizM6yJA+
19KpZZjfkN8koRi5fJ4MjBrUTR4ICbgeRjnUEWjfgyCXU6MAARhi4s1dmCuj6HDImqxnhRMWlqWd
wgoGo2FZXN6AVlKRYZN2oMlmGs7h3bkk0na4PfWHCG3H1npTFqXlO7xCnVWl3xMgmq1hhr2IfZsr
3AD7o5uihozppyyWoe1aPAtaFhWsCL7hAr7AsUx0yzNs2yU6F/72dGXVdfWVCZtltU4FO1xVJFzP
1n0UEDTio0u1sNYhJ7NLTOBqFQJoNOLWHWA839XW6Er4duBwwdLraJHJQf+uQ6jjyDrJs6FFjQ4K
Qm9F1tlQs+78CXMB421TPqxzCXWdtXs57q9Kv2fPm7tgPOIyT0sE6WN4Z43HtmadqM1EeThb9HBm
QAFzoiJEHrm+41kdybBS1UgR4cs5BA3SD7z+WL6GrsxhPfWdGI9hHs5D+E/4rnaSscNl+lEbOrFy
eOb8htuD8OntcGTmoGX+DF4SNHf3g18Hl+vu+AySvB4GjO3LF7LKVVFx5kh9lNEhhqdqgofZBusj
6IjJW9DfYHd8+XyDvz9Ol4PM3sJ81D8h1wTaj9MVDr0Daxb1HXYjxgK2hG7J8T36ODNqS4pTE4BP
31uoigwFO7oGejrEdhYGSXc6zvJiDOvua5lWL62UjfP+ggc/c8ZPCmto5Xqa0rxw2OMzzubAN4iv
VFwI19aO3nnR87BBGhW2KQG3kn9m29QEKn+bQcYAhd3O8etc+LqFTf7WhSqEuaOOwFToSR4oVC9f
+Z7uiTgvHGvI7f4/ixAECuInWANasbNR48w5uYliR8yqya56E1nP7unb4R0lZNwPzwfcW0+s5iZl
BJ89Q7M0Dkv0mUq2a2KczCe2Q9e8fOTkFkk5jUcjr17gDYsspxbH8sVm7FLTO/z2qbSA5QJyRsE5
5ipNoD2jfDdTEd/6OH759fVN9OX0hv5RfWZnciv9JaXim/v3D9Tr2Q2VZ5uxNbRJUnIF0U0yVQ7i
IXdlIRHEnlwBV7U0YUBCHD6qhOtZO3MPJAAJfpiO8wgy/JsQhG+GZiD/kORuCEbX86F081CHUHk/
eNJjf5ol1zryE61gO00j9gM69RCJFZ258UqtKpdZpp8wahvMHwfi86+LvNrVnMxrj+xO9HKzgrSC
ROZE9+wo5J86KcOu31l4fD6fDs/a6bKIy2XKz1ZD3nLTkKa410PI5M92ym7itAKjuV/EIfdqkKIo
VWXKQPCAyTqeJBvpRmoJ872kRgvvliIqdDHjlLwpzZMMP6SvI3obLVTqSoKpMzab994ENV/xD7og
iYh6gvQkcpLgPS/rhJ80Zmb4k3MkoOB2P3dDjmk0V9dXdIU3TLPR2NFeBGqi3LgDDYPH8nokmIAx
xksi7fHQEVmKwWH8kYyiXaSSQ7GOSatFE7fciBhGOmJpOMW3iNXe0c6adYhHChwnIBSq7KfsCoFd
JlIYoIjcECcb9CfSV3oDU488g67I6aDo2SkfVddyMOeYga7CR4t5/BSd9aLysagfdCerBx+xT3vC
o2PlJNoztBInk8XxCzP8ovT9almxRpNVtZwKD/pFLgkkTANNMakmZe3RSmj+BbWD45QbwjpdlVb+
BsMXeNISs+TGeoJVjiTMHsJH6NoSE9h92dRWPTrANZgnVRgti9aDMto9vdK46Kkwsi3WgO5je3VJ
dVZc9p/PJ/mONrN0i3IZ8aMjMXCeZXGZEM9QzHlLB6zDp2VyRHaP4X9q/qhM0+0eYRwYxo0rWfkP
c9Uu6jcbCRU5Sm7NEciaN25IFGfTkAhPr3Xtbe0OhAqPsmm5B2WMRrf0Vt7hyFewZDriNN7GyzxM
F//909/ymcTfTueXn4zuYTn1UDL/9HhNJJJohZt5K5/apN9fYiDIoifbrxouJm0jweOGq4Pv4wU7
ITVRnRw5XhjzEacCw1DkC7idwIhmIDGbSYzvENFwRxmZj0+HLYlehiwu1iswnzduKxUi6mS7FKuF
SpKt/d7OtKfDFQzTX6LHuJElFVAw3lhie1dOWL9XTAFM2VYNMLZzDeWOiQbVmdgGn04193b8rd5d
Z+29iFW5NtOFrDK5OW/rdTwkIfr5yqTMvPM7Uq1ARs74+FyJ32Buwr6OGJL4DeZ0elOn+FzlhUy3
3d9gzHZKG5yHRU1hNN2dlmUcamdE2OEq4ZRNVanR92+rtjScXqXocVIZFzybXmi5duVT8uohrp8O
l1MQ+ONfbcpE8DEmkEgxXezWc7mbco1kRA0JOmbk92AC/YbCwHHr0SDpr3jUXzF7S2uQ2H0VDx19
DAnG7S3j9WL83tqGX3zA+EcfMHaHPRWP6e2yUcbp6ebYG/d1c6RdCCAuFUtcS1v+PkYrbTv+D6cC
aGyziVBEadpTsGm+U6hB9K2qBu/qn9qAe7+TTedH8EO+vs76bBB9c9t+mNvXE5u/ZddI+np7t0yD
bal3VcJWZj/x5eISpA9WpqjxUQLKYMSVjECISVYlm3SwISmXILPob8O0uMcyzbKUTZ5ek8zCJOPb
nuHTu71DhBQpdBzUoi9qTxertNKHqR2Qnj5Xq/IuFexjc/icXjUl9r04y7Uf3ccGVosU9wZTG+gu
D/dUXtZ0UOU2tn/6PKNR8GQmPK+fpGibwd/yfYukydzOX0AmpUhBkl5UWKI0X9W46alKk0zi/sMY
ENt4jvHFSmTtu5KqpZo4T4Q0f1VlyirqDaV+ZaxgPUJtW3mtKXxRq0r+rgeGyfRA+BAI6reonUnB
KQp1X1uTiPavW0OTS53zQekQI8MURahp6yjZpZGkwadRlEz79deL3GiwS1It8+UjH47Y0oRFEUKb
P2gMrwV/0J1wikZO9vWvm5CLsv0SBLVM0GdmOLTKgq2rBVuJrPWQ6bKMEvnKOx3IHjI0F816rSE9
hSQWJg/YXNZXlK244QzNg6XtbgiprzYMwU/oavd8+vfxv77v3nf/W9nRNLet4+77Kzy7l92Zvm7i
tq99hx4oibb1Yn1Eku0kF4+buImnjZOJndnX/fULgKJEEpDbPXRSAxA/QRAgQeANBs9/3u3fHDZf
t1DO7u7Nbn/c3qMsePPl+WubpPSCjMnRw+blbrt3c5j9w33BPdrtd+g3s/tvkMs0xZj2wG/Q5XDw
CIVvfHBBdM337VJGPAF5PUhrDwDlJln0cI86Z9lQJHa6PAqsLgxS/PLj+fg0un162Y6eXkYP2+/P
5L/Z2xJEDna8eATXYtV8qkrn9NcDjzlcuxHpHCAnrS/itJy51mqA4J/MzPtiDuSklZe8rYOJhE56
36Dhgy1RQ42/KEtOfeGGn7QlYMQ2TtpGbxmC8w9QTHrGsUffHUjQu/bhabbkJq2GeQQf1jSdnI8/
ZYs5Q2CkQRHIW0t/BA5ZNDOdx2yQ2hwB5qjv9cv33e1v37Y/RrfE2vcYOeJHv5jthNbKM60NNJG0
mRan45i1SMfJjDVHx1Uill5nAwHr214vqqUef/hw7mnK5qrp9fiAt/y3GwwUrffUNfR++M/u+DBS
h8PT7Y5Qyea4YX2NvRSL7TRR1jLWhBloRGp8Vhbz60HHrW69TtP63HdPC/qrL9OlMDwzBZJwaWcs
Iufpx6c795zXtifisx1PIg5r+FqI3QgNXd0Ro5tXKwYrJpyuxMaEwCthBYDCt6rcBCaW12d2WDln
Y/CAxk1RbBtc1zSE5ioPY3QMDFSm+EjNMiW02HQjnM0l0DK2S3b328ORV1bF78a8ZAKzRlxdifI4
mqsLPY4EmWQwJ6QQ1NOcnyXphDP1LAgtYadOYOdAsiXvWWlZwicqS4F7Qd3JfEvMCpUskV3l7YKY
qXNWDQDHXqCpDvzhfCxJkZmSTug7GfOOF4VJUSI/blCLWpVQCZv3ePf84OdRtUu+FsoAaPBmm1Hk
i2jAFc9SVLHkRdKxRLGapCIXGUR/3s0kmso0GNbS/VpHgZZgcF7u4DgTIJRPWKK5KJjQX6FZFzN1
oyTFPxDE0vxrfeJD2OdL8z445AvO4I1WjA7sQxppRmvgLMxMgP5AL5oMEz09PqPTk6dKd2NFEbRZ
MfObgsE+vecKwvyG9wZgMy4Db2pSJIxf0GZ/9/Q4yl8fv2xf7HMdqXkqx3CfpaQdJlU0DcLAuBhR
5BqMLJoIF8s3Az0FK/JPzIxUafSOKa8ZlpKWoULORZRFsduMAbJO/w4HtqOoXBcxAQnLZVkKPe9o
UPH/hZaY0G3rIsKIz40WpJwSNmPKpOnGfW0Nnu+7Ly8bMLBenl6Pu72wo2JYUiUsaYKDtBLGFlE/
3b2QyKxu66kkVmFIOJMjqtMTuxJOk4loSVxRCs92rwQNGXOPnp8iOdWBQV2n712vZ4ot7DbGcJxn
knuBqq+zTOOhGZ24NdelwyIOslxE85amXkQ+2dWHsz+cDLm6z+PbHwxexPUnDEq+RDyWMujtgqQf
bWCtgaI+mtCgUI58VmQS8Jba3KOje4rN3cs3bXz185VMhANFhjvs7vfGOfD2YXv7zUsCT6/BKcEv
1v3577fw8eHf+AWQrcF6evu8feyyJRqnAhOS3Bx1Vp5LDcfXTq7FFmuMRmd02feMwqS/fX/2x+/e
8VmRJ6q6DpsjnaKZcmFNxhfztG4GW95TkLzA/5kUxdaZ5BfG1hYZpTm2juLWT6zUmQ+Km3maa1Vh
1PepuyJLFbgtRWmDyTOBiXqYdXXE5AKLJnWvQS1qkuYJJsDEWPKpr4kUVZLK7x6g7ZkG2zyLoD5h
XKs2IYu7tmMwM2FT8kDnv/tSMl4bxV2UjvE6bRZrv4B3gQIMADE1vE8A61tH15+ETw1Gvk5qSVS1
CnJ7BBQwjHLV7hvxGHcIv37pohnEHDemYueNQWg9meQAzij0KNCT3CykDjTRHH5DYbdzo4b5UKac
gVbWl+xBpZJBDxOpQTuT4W4pHRz1NqE7BJZqvbpBcPh7ffXJ20BaKLn6ltJlW0uQKncyW6CqMgnW
zGCdMEQN8p43J4r/ZDCaxf5urOvbenrjR0TvEBEgxiLm6kYEo1otwVvlOBAZwuWOqusiTmHVLzV0
uXIDUuZFG7Kp95TMFClsw94gSIEJWCOdx6AxyxdS07lpidPySzcd6byI/F/CmsgpI6izuOY360a5
gaeqS9RUnHKzMvWC2MOPSeJm/kwTDIILO0TlJYcCeZ3osmgCmNlQQNRiKKizHoXbkNtg59VHsFP4
Nxh2Hyfo88tuf/xmXkI8bg/3/PozNglS1vNiShlUukPsj4MUl4tUN5/fd+PR6i+shI4CdKuoQJ1K
V1WuMi+gy2ALOxNx9337G8ZQNhvpgUhvDfxFiulqvIRQo5c8giuof71SVf75/Gz83h1uTImELvWu
byR62JFRoWovfwvWAHoG+SRmaZ1hQGRnXgMM1bcucj+6vCnFXItNFrn5RM1TfJg4HvBtp9aXBXlq
i7djfZHGKQ3DqJULd8B/eUhpTG364pa9ku2X1/t7vE5yUn72zNTWzzJLd550xpMsHALj70gElC9c
Fgl+SflQBvFFVCv5xuyX+uI33Nxdht1Bj9vPXmznvrB+MMiJBzRWjLHjnzy1CTsAT/JLsgzw22KV
uzc4BIO5r4vc6H1CecCwYhJ6IiiiP3Xsx0nxEKcUJ59wYnIoDxSDccxFrdAnQz+DcGQtrooXGBQ5
Ga4EOBtzg7ePEn5aWXs2YEXTeVhsPVeRUAh5N7SskOlsDmuKN8liTrCtkfSLwQDKdTwDO8VQadDH
4afo+WBKW2a8EcuMTuhDf5WQporCIQdgOQV9biowhoneSNfSkkYb4961vlCw4ARL32BxlnEnywug
Shsw15xc2uFldr+K2ADO8CkYu35A+lHx9Hx4M8IAOK/PRpbNNvt734Mf6o7xZr2QH4p4eHyqstB9
iH+D7CP/97NWTJo5pSLpQssN8AAi17MFjEOjaplRVpenQvTTIYCpy4u8dHIAjOcTyPi7Vwo1z2WU
4bv29Kv3DBA+8ZkGB+NC69IIImPA4iVdL1P/eXje7fHiDlr2+Hrc/rWF/2yPt2/fvv2XY9sWNsz+
lNSdztXdfXux7N7oSAYSloAneyFfV806WzT6SrPdyIZPZmJdJl+tDAZkRLHynZ/amla196DCQKlh
gX5KzjiaZTE6AcZRoVPWLqa8770DLNegZ3qnJFpu6hotyHRH7Ey8EsRt8/+ZWL8DsGStYHE1Xsoe
6DUW1SMYKsyeoHUCHHkiz14rc41gPy2y4d9SV1FR9/HcaL2YpyOju81xM8KdnzIpMzWGznj4Lovg
QQlbC/syPexK5R2Rtqh8nahG4XELxlWwuoK3wgdaHFYVV7r1reKPUWFLlSTAEAPhDkzRFxljOATe
x48uBvQQ53MfZ+ffAelL9sSBGkAujuGjlv5xttelcDBAoBpNuCIdWPJCLUrTGEfLMr8xuEPYTpP0
MvYlB1lpYVhgikdH9N4BHfyBFdms61WKRoFUs0dvze0BQv4waBK0GBPaoKR2iu5dzapL2L4mbeGS
eU1bQ1d376m5ApN5+LN2/OpclfWs8FgqQFnjBMZDSXllzXhHIApgsGAbmGACXD8whYvTwyaBJVA5
rEWFJ8LmSz3wpM8QgzyyZEKlfAB6qXqdN7M2KKFIYHpmuCTNB+QYEZGp15+CiHznoB//FtSg5nSM
gh1y+zBpE7g2CtZvObjCnTpcUk9MODTdC1/iuUTPGyX3vwTzIQNJV10ilboW9h47lArf/w34LBvh
YJKrMnH3+ihJO3KAtVlkHUniUbvnKc32cMRdD5WqGBM4be63ju/4Ind94umnkT6uDWzAvhw0MH1F
/RNxyH9BFhm7k+A5SlG1rJMWnu99mclk4hAWExDUpwqX3wxQ8uKff2CZjbxY+8b24kqlc7S7fIix
YwPFKSjDdSEfoOBHEaqCZUsGS1wsmZ0C1gmA24XjvnX0qfGXNSYpV26F9rj/gABJ0hzYc4EPV9fy
+zpDBStAVVqZa6yzvzB0l2NfVGDbkvgGNsB1hl4FQlHA/uEZ4UnuZS7C5sjwfzi9bp5u1wAA
--===============1201231860215034569==--

