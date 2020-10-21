Content-Type: multipart/mixed; boundary="===============8707923755506013389=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 15579/15595] arch/arc/kernel/sys.c:13:36: warning: excess elements in array initializer
Date: Wed, 21 Oct 2020 15:05:47 +0800
Message-ID: <202010211528.419mGwtE-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8707923755506013389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5302568121ba345f5c22528aefd72d775f25221e
commit: 5394c6318b32ffd216e5e17d95f0be2db1df2e79 [15579/15595] Merge remote=
-tracking branch 'notifications/notifications-pipe-core' into master
config: arc-defconfig (attached as .config)
compiler: arc-elf-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D5394c6318b32ffd216e5e17d95f0be2db1df2e79
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 5394c6318b32ffd216e5e17d95f0be2db1df2e79
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Darc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

         |                                    ^
   include/uapi/asm-generic/unistd.h:846:1: note: in expansion of macro '__=
SYSCALL'
     846 | __SYSCALL(__NR_pidfd_open, sys_pidfd_open)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_ta=
ble[434]')
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:846:1: note: in expansion of macro '__=
SYSCALL'
     846 | __SYSCALL(__NR_pidfd_open, sys_pidfd_open)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Wo=
verride-init]
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:849:1: note: in expansion of macro '__=
SYSCALL'
     849 | __SYSCALL(__NR_clone3, sys_clone3)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_ta=
ble[435]')
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:849:1: note: in expansion of macro '__=
SYSCALL'
     849 | __SYSCALL(__NR_clone3, sys_clone3)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Wo=
verride-init]
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:852:1: note: in expansion of macro '__=
SYSCALL'
     852 | __SYSCALL(__NR_close_range, sys_close_range)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_ta=
ble[436]')
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:852:1: note: in expansion of macro '__=
SYSCALL'
     852 | __SYSCALL(__NR_close_range, sys_close_range)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Wo=
verride-init]
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:855:1: note: in expansion of macro '__=
SYSCALL'
     855 | __SYSCALL(__NR_openat2, sys_openat2)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_ta=
ble[437]')
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:855:1: note: in expansion of macro '__=
SYSCALL'
     855 | __SYSCALL(__NR_openat2, sys_openat2)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Wo=
verride-init]
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:857:1: note: in expansion of macro '__=
SYSCALL'
     857 | __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_ta=
ble[438]')
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:857:1: note: in expansion of macro '__=
SYSCALL'
     857 | __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Wo=
verride-init]
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:859:1: note: in expansion of macro '__=
SYSCALL'
     859 | __SYSCALL(__NR_faccessat2, sys_faccessat2)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_ta=
ble[439]')
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:859:1: note: in expansion of macro '__=
SYSCALL'
     859 | __SYSCALL(__NR_faccessat2, sys_faccessat2)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Wo=
verride-init]
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:861:1: note: in expansion of macro '__=
SYSCALL'
     861 | __SYSCALL(__NR_process_madvise, sys_process_madvise)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_ta=
ble[440]')
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:861:1: note: in expansion of macro '__=
SYSCALL'
     861 | __SYSCALL(__NR_process_madvise, sys_process_madvise)
         | ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:862:26: error: array index in initiali=
zer exceeds array bounds
     862 | #define __NR_watch_mount 441
         |                          ^~~
   arch/arc/kernel/sys.c:13:30: note: in definition of macro '__SYSCALL'
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                              ^~
   include/uapi/asm-generic/unistd.h:863:11: note: in expansion of macro '_=
_NR_watch_mount'
     863 | __SYSCALL(__NR_watch_mount, sys_watch_mount)
         |           ^~~~~~~~~~~~~~~~
   include/uapi/asm-generic/unistd.h:862:26: note: (near initialization for=
 'sys_call_table')
     862 | #define __NR_watch_mount 441
         |                          ^~~
   arch/arc/kernel/sys.c:13:30: note: in definition of macro '__SYSCALL'
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                              ^~
   include/uapi/asm-generic/unistd.h:863:11: note: in expansion of macro '_=
_NR_watch_mount'
     863 | __SYSCALL(__NR_watch_mount, sys_watch_mount)
         |           ^~~~~~~~~~~~~~~~
>> arch/arc/kernel/sys.c:13:36: warning: excess elements in array initializ=
er
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:863:1: note: in expansion of macro '__=
SYSCALL'
     863 | __SYSCALL(__NR_watch_mount, sys_watch_mount)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_ta=
ble')
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   include/uapi/asm-generic/unistd.h:863:1: note: in expansion of macro '__=
SYSCALL'
     863 | __SYSCALL(__NR_watch_mount, sys_watch_mount)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Wo=
verride-init]
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   arch/arc/include/uapi/asm/unistd.h:44:1: note: in expansion of macro '__=
SYSCALL'
      44 | __SYSCALL(__NR_cacheflush, sys_cacheflush)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_ta=
ble[244]')
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   arch/arc/include/uapi/asm/unistd.h:44:1: note: in expansion of macro '__=
SYSCALL'
      44 | __SYSCALL(__NR_cacheflush, sys_cacheflush)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Wo=
verride-init]
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   arch/arc/include/uapi/asm/unistd.h:45:1: note: in expansion of macro '__=
SYSCALL'
      45 | __SYSCALL(__NR_arc_settls, sys_arc_settls)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_ta=
ble[245]')
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   arch/arc/include/uapi/asm/unistd.h:45:1: note: in expansion of macro '__=
SYSCALL'
      45 | __SYSCALL(__NR_arc_settls, sys_arc_settls)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Wo=
verride-init]
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   arch/arc/include/uapi/asm/unistd.h:46:1: note: in expansion of macro '__=
SYSCALL'
      46 | __SYSCALL(__NR_arc_gettls, sys_arc_gettls)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_ta=
ble[246]')
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   arch/arc/include/uapi/asm/unistd.h:46:1: note: in expansion of macro '__=
SYSCALL'
      46 | __SYSCALL(__NR_arc_gettls, sys_arc_gettls)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Wo=
verride-init]
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   arch/arc/include/uapi/asm/unistd.h:47:1: note: in expansion of macro '__=
SYSCALL'
      47 | __SYSCALL(__NR_arc_usr_cmpxchg, sys_arc_usr_cmpxchg)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_ta=
ble[248]')
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   arch/arc/include/uapi/asm/unistd.h:47:1: note: in expansion of macro '__=
SYSCALL'
      47 | __SYSCALL(__NR_arc_usr_cmpxchg, sys_arc_usr_cmpxchg)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Wo=
verride-init]
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   arch/arc/include/uapi/asm/unistd.h:48:1: note: in expansion of macro '__=
SYSCALL'
      48 | __SYSCALL(__NR_sysfs, sys_sysfs)
         | ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_ta=
ble[247]')
      13 | #define __SYSCALL(nr, call) [nr] =3D (call),
         |                                    ^
   arch/arc/include/uapi/asm/unistd.h:48:1: note: in expansion of macro '__=
SYSCALL'
      48 | __SYSCALL(__NR_sysfs, sys_sysfs)
         | ^~~~~~~~~
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:84,
                    from arch/arc/kernel/sys.c:3:
   arch/arc/include/asm/perf_event.h:126:23: warning: 'arc_pmu_cache_map' d=
efined but not used [-Wunused-const-variable=3D]
     126 | static const unsigned arc_pmu_cache_map[C(MAX)][C(OP_MAX)][C(RES=
ULT_MAX)] =3D {
         |                       ^~~~~~~~~~~~~~~~~
   arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_map' de=
fined but not used [-Wunused-const-variable=3D]
      91 | static const char * const arc_pmu_ev_hw_map[] =3D {
         |                           ^~~~~~~~~~~~~~~~~

vim +13 arch/arc/kernel/sys.c

4adeefe161a7436 Vineet Gupta 2013-01-18  11  =

4adeefe161a7436 Vineet Gupta 2013-01-18  12  #undef __SYSCALL
4adeefe161a7436 Vineet Gupta 2013-01-18 @13  #define __SYSCALL(nr, call) [n=
r] =3D (call),
4adeefe161a7436 Vineet Gupta 2013-01-18  14  =


:::::: The code at line 13 was first introduced by commit
:::::: 4adeefe161a74369e44cc8e663f240ece0470dc3 ARC: Syscall support (no-le=
gacy-syscall ABI)

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8707923755506013389==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8707923755506013389==--

