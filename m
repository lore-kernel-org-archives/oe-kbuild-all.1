Content-Type: multipart/mixed; boundary="===============4544677778765056679=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC 1/4] drivers/nvdimm: Add perf interface to expose nvdimm performance stats
Date: Sun, 16 May 2021 08:09:23 +0800
Message-ID: <202105160858.VpnB8fq6-lkp@intel.com>
In-Reply-To: <20210512163824.255370-2-kjain@linux.ibm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4544677778765056679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kajol,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on powerpc/next]
[also build test ERROR on linus/master linux-nvdimm/libnvdimm-for-next v5.1=
3-rc1 next-20210514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kajol-Jain/Add-perf-interf=
ace-to-expose-nvdimm-performance-stats/20210513-004122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
config: powerpc-randconfig-r011-20210516 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 23f7d6=
51b682ea387eaae99f0888e6ca916039cb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/0day-ci/linux/commit/ab3efdc432a19e9be03c6cb37=
1dd4d1e50cf9917
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kajol-Jain/Add-perf-interface-to-e=
xpose-nvdimm-performance-stats/20210513-004122
        git checkout ab3efdc432a19e9be03c6cb371dd4d1e50cf9917
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:174:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_in=
sw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/nvdimm/nd_perf.c:12:
   In file included from include/linux/nd.h:12:
   In file included from include/linux/perf_event.h:49:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:176:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_in=
sl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/nvdimm/nd_perf.c:12:
   In file included from include/linux/nd.h:12:
   In file included from include/linux/perf_event.h:49:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:178:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_ou=
tsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/nvdimm/nd_perf.c:12:
   In file included from include/linux/nd.h:12:
   In file included from include/linux/perf_event.h:49:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:180:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_ou=
tsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/nvdimm/nd_perf.c:12:
   In file included from include/linux/nd.h:12:
   In file included from include/linux/perf_event.h:49:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:182:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_ou=
tsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/nvdimm/nd_perf.c:18:51: error: no member named 'pmu' in 'struct =
perf_event'
           struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
                                                     ~~~~~  ^
   drivers/nvdimm/nd_perf.c:14:42: note: expanded from macro 'to_nvdimm_pmu'
   #define to_nvdimm_pmu(_pmu)     container_of(_pmu, struct nvdimm_pmu, pm=
u)
                                                ^~~~
   include/linux/kernel.h:701:26: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                   ^~~
>> drivers/nvdimm/nd_perf.c:18:51: error: no member named 'pmu' in 'struct =
perf_event'
           struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
                                                     ~~~~~  ^
   drivers/nvdimm/nd_perf.c:14:42: note: expanded from macro 'to_nvdimm_pmu'
   #define to_nvdimm_pmu(_pmu)     container_of(_pmu, struct nvdimm_pmu, pm=
u)
                                                ^~~~
   include/linux/kernel.h:702:34: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                           ^~~
   include/linux/compiler_types.h:264:63: note: expanded from macro '__same=
_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
                                                                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:316:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:308:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/nvdimm/nd_perf.c:18:51: error: no member named 'pmu' in 'struct =
perf_event'
           struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
                                                     ~~~~~  ^
   drivers/nvdimm/nd_perf.c:14:42: note: expanded from macro 'to_nvdimm_pmu'
   #define to_nvdimm_pmu(_pmu)     container_of(_pmu, struct nvdimm_pmu, pm=
u)
                                                ^~~~
   include/linux/kernel.h:703:20: note: expanded from macro 'container_of'
                            !__same_type(*(ptr), void),                    \
                                           ^~~
   include/linux/compiler_types.h:264:63: note: expanded from macro '__same=
_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
                                                                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:316:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:308:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/nvdimm/nd_perf.c:21:13: error: no member named 'attr' in 'struct=
 perf_event'
           if (event->attr.type !=3D event->pmu->type)
               ~~~~~  ^
   drivers/nvdimm/nd_perf.c:21:33: error: no member named 'pmu' in 'struct =
perf_event'
           if (event->attr.type !=3D event->pmu->type)
                                   ~~~~~  ^
>> drivers/nvdimm/nd_perf.c:25:6: error: implicit declaration of function '=
is_sampling_event' [-Werror,-Wimplicit-function-declaration]
           if (is_sampling_event(event))
               ^
>> drivers/nvdimm/nd_perf.c:29:6: error: implicit declaration of function '=
has_branch_stack' [-Werror,-Wimplicit-function-declaration]
           if (has_branch_stack(event))
               ^
   drivers/nvdimm/nd_perf.c:41:51: error: no member named 'pmu' in 'struct =
perf_event'
           struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
                                                     ~~~~~  ^
   drivers/nvdimm/nd_perf.c:14:42: note: expanded from macro 'to_nvdimm_pmu'
   #define to_nvdimm_pmu(_pmu)     container_of(_pmu, struct nvdimm_pmu, pm=
u)
                                                ^~~~
   include/linux/kernel.h:701:26: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                   ^~~
   drivers/nvdimm/nd_perf.c:41:51: error: no member named 'pmu' in 'struct =
perf_event'
           struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
                                                     ~~~~~  ^
   drivers/nvdimm/nd_perf.c:14:42: note: expanded from macro 'to_nvdimm_pmu'
   #define to_nvdimm_pmu(_pmu)     container_of(_pmu, struct nvdimm_pmu, pm=
u)
                                                ^~~~
   include/linux/kernel.h:702:34: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                           ^~~
   include/linux/compiler_types.h:264:63: note: expanded from macro '__same=
_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
                                                                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:316:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:308:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/nvdimm/nd_perf.c:41:51: error: no member named 'pmu' in 'struct =
perf_event'
           struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
                                                     ~~~~~  ^
   drivers/nvdimm/nd_perf.c:14:42: note: expanded from macro 'to_nvdimm_pmu'
   #define to_nvdimm_pmu(_pmu)     container_of(_pmu, struct nvdimm_pmu, pm=
u)
                                                ^~~~
   include/linux/kernel.h:703:20: note: expanded from macro 'container_of'
                            !__same_type(*(ptr), void),                    \
                                           ^~~
   include/linux/compiler_types.h:264:63: note: expanded from macro '__same=
_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
                                                                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:316:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:308:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/nvdimm/nd_perf.c:50:51: error: no member named 'pmu' in 'struct =
perf_event'
           struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
                                                     ~~~~~  ^
   drivers/nvdimm/nd_perf.c:14:42: note: expanded from macro 'to_nvdimm_pmu'
   #define to_nvdimm_pmu(_pmu)     container_of(_pmu, struct nvdimm_pmu, pm=
u)
                                                ^~~~
   include/linux/kernel.h:701:26: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                   ^~~
   drivers/nvdimm/nd_perf.c:50:51: error: no member named 'pmu' in 'struct =
perf_event'
           struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
                                                     ~~~~~  ^
   drivers/nvdimm/nd_perf.c:14:42: note: expanded from macro 'to_nvdimm_pmu'
   #define to_nvdimm_pmu(_pmu)     container_of(_pmu, struct nvdimm_pmu, pm=
u)
                                                ^~~~
   include/linux/kernel.h:702:34: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                           ^~~
   include/linux/compiler_types.h:264:63: note: expanded from macro '__same=
_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
                                                                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:316:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:308:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/nvdimm/nd_perf.c:50:51: error: no member named 'pmu' in 'struct =
perf_event'
           struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
                                                     ~~~~~  ^
   drivers/nvdimm/nd_perf.c:14:42: note: expanded from macro 'to_nvdimm_pmu'
   #define to_nvdimm_pmu(_pmu)     container_of(_pmu, struct nvdimm_pmu, pm=
u)
                                                ^~~~
   include/linux/kernel.h:703:20: note: expanded from macro 'container_of'
                            !__same_type(*(ptr), void),                    \
                                           ^~~
   include/linux/compiler_types.h:264:63: note: expanded from macro '__same=
_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
                                                                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:316:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:308:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/nvdimm/nd_perf.c:59:51: error: no member named 'pmu' in 'struct =
perf_event'
           struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
                                                     ~~~~~  ^
   drivers/nvdimm/nd_perf.c:14:42: note: expanded from macro 'to_nvdimm_pmu'
   #define to_nvdimm_pmu(_pmu)     container_of(_pmu, struct nvdimm_pmu, pm=
u)
                                                ^~~~
   include/linux/kernel.h:701:26: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                   ^~~
   drivers/nvdimm/nd_perf.c:59:51: error: no member named 'pmu' in 'struct =
perf_event'
           struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
                                                     ~~~~~  ^
   drivers/nvdimm/nd_perf.c:14:42: note: expanded from macro 'to_nvdimm_pmu'
   #define to_nvdimm_pmu(_pmu)     container_of(_pmu, struct nvdimm_pmu, pm=
u)
                                                ^~~~
   include/linux/kernel.h:702:34: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                           ^~~
   include/linux/compiler_types.h:264:63: note: expanded from macro '__same=
_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
                                                                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:316:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:308:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/nvdimm/nd_perf.c:59:51: error: no member named 'pmu' in 'struct =
perf_event'
           struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
                                                     ~~~~~  ^
   drivers/nvdimm/nd_perf.c:14:42: note: expanded from macro 'to_nvdimm_pmu'
   #define to_nvdimm_pmu(_pmu)     container_of(_pmu, struct nvdimm_pmu, pm=
u)
                                                ^~~~
   include/linux/kernel.h:703:20: note: expanded from macro 'container_of'
                            !__same_type(*(ptr), void),                    \
                                           ^~~
   include/linux/compiler_types.h:264:63: note: expanded from macro '__same=
_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
                                                                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:316:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:308:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/nvdimm/nd_perf.c:92:7: error: implicit declaration of function '=
perf_pmu_register' [-Werror,-Wimplicit-function-declaration]
           rc =3D perf_pmu_register(&nd_pmu->pmu, nd_pmu->name, -1);
                ^
>> drivers/nvdimm/nd_perf.c:109:2: error: implicit declaration of function =
'perf_pmu_unregister' [-Werror,-Wimplicit-function-declaration]
           perf_pmu_unregister(nd_pmu);
           ^
   12 warnings and 18 errors generated.


vim +18 drivers/nvdimm/nd_perf.c

    15	=

    16	static int nvdimm_pmu_event_init(struct perf_event *event)
    17	{
  > 18		struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
    19	=

    20		/* test the event attr type for PMU enumeration */
  > 21		if (event->attr.type !=3D event->pmu->type)
    22			return -ENOENT;
    23	=

    24		/* it does not support event sampling mode */
  > 25		if (is_sampling_event(event))
    26			return -EINVAL;
    27	=

    28		/* no branch sampling */
  > 29		if (has_branch_stack(event))
    30			return -EOPNOTSUPP;
    31	=

    32		/* jump to arch/platform specific callbacks if any */
    33		if (nd_pmu && nd_pmu->event_init)
    34			return nd_pmu->event_init(event, nd_pmu->dev);
    35	=

    36		return 0;
    37	}
    38	=

    39	static void nvdimm_pmu_read(struct perf_event *event)
    40	{
    41		struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
    42	=

    43		/* jump to arch/platform specific callbacks if any */
    44		if (nd_pmu && nd_pmu->read)
    45			nd_pmu->read(event, nd_pmu->dev);
    46	}
    47	=

    48	static void nvdimm_pmu_del(struct perf_event *event, int flags)
    49	{
    50		struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
    51	=

    52		/* jump to arch/platform specific callbacks if any */
    53		if (nd_pmu && nd_pmu->del)
    54			nd_pmu->del(event, flags, nd_pmu->dev);
    55	}
    56	=

    57	static int nvdimm_pmu_add(struct perf_event *event, int flags)
    58	{
    59		struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
    60	=

    61		if (flags & PERF_EF_START)
    62			/* jump to arch/platform specific callbacks if any */
    63			if (nd_pmu && nd_pmu->add)
    64				return nd_pmu->add(event, flags, nd_pmu->dev);
    65		return 0;
    66	}
    67	=

    68	int register_nvdimm_pmu(struct nvdimm_pmu *nd_pmu, struct platform_d=
evice *pdev)
    69	{
    70		int rc;
    71	=

    72		if (!nd_pmu || !pdev)
    73			return -EINVAL;
    74	=

    75		nd_pmu->pmu.task_ctx_nr =3D perf_invalid_context;
    76		nd_pmu->pmu.event_init =3D nvdimm_pmu_event_init;
    77		nd_pmu->pmu.add =3D nvdimm_pmu_add;
    78		nd_pmu->pmu.del =3D nvdimm_pmu_del;
    79		nd_pmu->pmu.read =3D nvdimm_pmu_read;
    80		nd_pmu->pmu.name =3D nd_pmu->name;
    81		nd_pmu->pmu.attr_groups =3D nd_pmu->attr_groups;
    82		nd_pmu->pmu.capabilities =3D PERF_PMU_CAP_NO_INTERRUPT |
    83					PERF_PMU_CAP_NO_EXCLUDE;
    84	=

    85		/*
    86		 * Adding platform_device->dev pointer to nvdimm_pmu, so that we can
    87		 * access that device data in PMU callbacks and also pass it to
    88		 * arch/platform specific code.
    89		 */
    90		nd_pmu->dev =3D &pdev->dev;
    91	=

  > 92		rc =3D perf_pmu_register(&nd_pmu->pmu, nd_pmu->name, -1);
    93		if (rc)
    94			return rc;
    95	=

    96		pr_info("%s NVDIMM performance monitor support registered\n",
    97			nd_pmu->name);
    98	=

    99		return 0;
   100	}
   101	EXPORT_SYMBOL_GPL(register_nvdimm_pmu);
   102	=

   103	void unregister_nvdimm_pmu(struct pmu *nd_pmu)
   104	{
   105		/*
   106		 * nd_pmu will get free in arch/platform specific code once
   107		 * corresponding pmu get unregistered.
   108		 */
 > 109		perf_pmu_unregister(nd_pmu);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4544677778765056679==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4544677778765056679==--

