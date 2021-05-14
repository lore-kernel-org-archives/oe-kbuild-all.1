Content-Type: multipart/mixed; boundary="===============3564042763859835303=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [arm-platforms:irq/domain_cleanup 14/20] include/linux/irqdesc.h:56:25: error: field has incomplete type 'struct irq_common_data'
Date: Fri, 14 May 2021 17:34:56 +0800
Message-ID: <202105141750.0vepUNpb-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3564042763859835303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.g=
it irq/domain_cleanup
head:   76a98e310bbd7bada3f24d6fda08858460fd6cd4
commit: 5dd760fc3140b85b7d8cf1ad003238c5a223fc76 [14/20] irqdomain: Introdu=
ce irq_resolve_mapping()
config: mips-randconfig-r004-20210514 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 425781=
bce01f2f1d5f553d3b2bf9ebbd6e15068c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms=
.git/commit/?id=3D5dd760fc3140b85b7d8cf1ad003238c5a223fc76
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/k=
ernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/domain_cleanup
        git checkout 5dd760fc3140b85b7d8cf1ad003238c5a223fc76
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/mips/include/asm/hardirq.h:16:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/mips/include/asm/irq.h:14:
   In file included from include/linux/irqdomain.h:35:
>> include/linux/irqdesc.h:56:25: error: field has incomplete type 'struct =
irq_common_data'
           struct irq_common_data  irq_common_data;
                                   ^
   include/linux/irqdesc.h:56:9: note: forward declaration of 'struct irq_c=
ommon_data'
           struct irq_common_data  irq_common_data;
                  ^
>> include/linux/irqdesc.h:57:19: error: field has incomplete type 'struct =
irq_data'
           struct irq_data         irq_data;
                                   ^
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct ir=
q_data'
   struct irq_data;
          ^
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/mips/include/asm/hardirq.h:16:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/mips/include/asm/irq.h:14:
   In file included from include/linux/irqdomain.h:35:
>> include/linux/irqdesc.h:113:33: error: use of undeclared identifier 'NR_=
IRQS'
   extern struct irq_desc irq_desc[NR_IRQS];
                                   ^
>> include/linux/irqdesc.h:124:26: error: incomplete definition of type 'st=
ruct irq_data'
           return container_of(data->common, struct irq_desc, irq_common_da=
ta);
                               ~~~~^
   include/linux/kernel.h:703:26: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                   ^~~
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct ir=
q_data'
   struct irq_data;
          ^
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/mips/include/asm/hardirq.h:16:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/mips/include/asm/irq.h:14:
   In file included from include/linux/irqdomain.h:35:
>> include/linux/irqdesc.h:124:26: error: incomplete definition of type 'st=
ruct irq_data'
           return container_of(data->common, struct irq_desc, irq_common_da=
ta);
                               ~~~~^
   include/linux/kernel.h:704:34: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                           ^~~
   include/linux/compiler_types.h:264:63: note: expanded from macro '__same=
_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
                                                                 ^
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
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
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct ir=
q_data'
   struct irq_data;
          ^
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/mips/include/asm/hardirq.h:16:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/mips/include/asm/irq.h:14:
   In file included from include/linux/irqdomain.h:35:
>> include/linux/irqdesc.h:124:26: error: incomplete definition of type 'st=
ruct irq_data'
           return container_of(data->common, struct irq_desc, irq_common_da=
ta);
                               ~~~~^
   include/linux/kernel.h:705:20: note: expanded from macro 'container_of'
                            !__same_type(*(ptr), void),                    \
                                           ^~~
   include/linux/compiler_types.h:264:63: note: expanded from macro '__same=
_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
                                                                 ^
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
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
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct ir=
q_data'
   struct irq_data;
          ^
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/mips/include/asm/hardirq.h:16:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/mips/include/asm/irq.h:14:
   In file included from include/linux/irqdomain.h:35:
   include/linux/irqdesc.h:229:6: error: incomplete definition of type 'str=
uct irq_data'
           data->chip =3D chip;
           ~~~~^
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct ir=
q_data'
   struct irq_data;
          ^
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/mips/include/asm/hardirq.h:16:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/mips/include/asm/irq.h:14:
   In file included from include/linux/irqdomain.h:35:
>> include/linux/irqdesc.h:236:35: error: use of undeclared identifier 'IRQ=
_NO_BALANCING_MASK'
           return irq_check_status_bit(irq, IRQ_NO_BALANCING_MASK);
                                            ^
>> include/linux/irqdesc.h:241:35: error: use of undeclared identifier 'IRQ=
_PER_CPU'
           return irq_check_status_bit(irq, IRQ_PER_CPU);
                                            ^
>> include/linux/irqdesc.h:246:35: error: use of undeclared identifier 'IRQ=
_PER_CPU_DEVID'
           return irq_check_status_bit(irq, IRQ_PER_CPU_DEVID);
                                            ^
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for =
function 'output_ptreg_defines' [-Wmissing-prototypes]
   void output_ptreg_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:26:1: note: declare 'static' if the funct=
ion is not intended to be used outside of this translation unit
   void output_ptreg_defines(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for =
function 'output_task_defines' [-Wmissing-prototypes]
   void output_task_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:78:1: note: declare 'static' if the funct=
ion is not intended to be used outside of this translation unit
   void output_task_defines(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:93:6: warning: no previous prototype for =
function 'output_thread_info_defines' [-Wmissing-prototypes]
   void output_thread_info_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:93:1: note: declare 'static' if the funct=
ion is not intended to be used outside of this translation unit
   void output_thread_info_defines(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:109:6: warning: no previous prototype for=
 function 'output_thread_defines' [-Wmissing-prototypes]
   void output_thread_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:109:1: note: declare 'static' if the func=
tion is not intended to be used outside of this translation unit
   void output_thread_defines(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:180:6: warning: no previous prototype for=
 function 'output_mm_defines' [-Wmissing-prototypes]
   void output_mm_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:180:1: note: declare 'static' if the func=
tion is not intended to be used outside of this translation unit
   void output_mm_defines(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:219:6: warning: no previous prototype for=
 function 'output_sc_defines' [-Wmissing-prototypes]
   void output_sc_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:219:1: note: declare 'static' if the func=
tion is not intended to be used outside of this translation unit
   void output_sc_defines(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:254:6: warning: no previous prototype for=
 function 'output_signal_defined' [-Wmissing-prototypes]
   void output_signal_defined(void)
        ^
   arch/mips/kernel/asm-offsets.c:254:1: note: declare 'static' if the func=
tion is not intended to be used outside of this translation unit
   void output_signal_defined(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:391:6: warning: no previous prototype for=
 function 'output_cps_defines' [-Wmissing-prototypes]
   void output_cps_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:391:1: note: declare 'static' if the func=
tion is not intended to be used outside of this translation unit
   void output_cps_defines(void)
   ^
   static =

   8 warnings and 10 errors generated.
--
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/mips/include/asm/hardirq.h:16:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/mips/include/asm/irq.h:14:
   In file included from include/linux/irqdomain.h:35:
>> include/linux/irqdesc.h:56:25: error: field has incomplete type 'struct =
irq_common_data'
           struct irq_common_data  irq_common_data;
                                   ^
   include/linux/irqdesc.h:56:9: note: forward declaration of 'struct irq_c=
ommon_data'
           struct irq_common_data  irq_common_data;
                  ^
>> include/linux/irqdesc.h:57:19: error: field has incomplete type 'struct =
irq_data'
           struct irq_data         irq_data;
                                   ^
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct ir=
q_data'
   struct irq_data;
          ^
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/mips/include/asm/hardirq.h:16:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/mips/include/asm/irq.h:14:
   In file included from include/linux/irqdomain.h:35:
>> include/linux/irqdesc.h:113:33: error: use of undeclared identifier 'NR_=
IRQS'
   extern struct irq_desc irq_desc[NR_IRQS];
                                   ^
>> include/linux/irqdesc.h:124:26: error: incomplete definition of type 'st=
ruct irq_data'
           return container_of(data->common, struct irq_desc, irq_common_da=
ta);
                               ~~~~^
   include/linux/kernel.h:703:26: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                   ^~~
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct ir=
q_data'
   struct irq_data;
          ^
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/mips/include/asm/hardirq.h:16:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/mips/include/asm/irq.h:14:
   In file included from include/linux/irqdomain.h:35:
>> include/linux/irqdesc.h:124:26: error: incomplete definition of type 'st=
ruct irq_data'
           return container_of(data->common, struct irq_desc, irq_common_da=
ta);
                               ~~~~^
   include/linux/kernel.h:704:34: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                           ^~~
   include/linux/compiler_types.h:264:63: note: expanded from macro '__same=
_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
                                                                 ^
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
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
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct ir=
q_data'
   struct irq_data;
          ^
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/mips/include/asm/hardirq.h:16:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/mips/include/asm/irq.h:14:
   In file included from include/linux/irqdomain.h:35:
>> include/linux/irqdesc.h:124:26: error: incomplete definition of type 'st=
ruct irq_data'
           return container_of(data->common, struct irq_desc, irq_common_da=
ta);
                               ~~~~^
   include/linux/kernel.h:705:20: note: expanded from macro 'container_of'
                            !__same_type(*(ptr), void),                    \
                                           ^~~
   include/linux/compiler_types.h:264:63: note: expanded from macro '__same=
_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
                                                                 ^
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
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
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct ir=
q_data'
   struct irq_data;
          ^
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/mips/include/asm/hardirq.h:16:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/mips/include/asm/irq.h:14:
   In file included from include/linux/irqdomain.h:35:
   include/linux/irqdesc.h:229:6: error: incomplete definition of type 'str=
uct irq_data'
           data->chip =3D chip;
           ~~~~^
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct ir=
q_data'
   struct irq_data;
          ^
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/mips/include/asm/hardirq.h:16:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/mips/include/asm/irq.h:14:
   In file included from include/linux/irqdomain.h:35:
>> include/linux/irqdesc.h:236:35: error: use of undeclared identifier 'IRQ=
_NO_BALANCING_MASK'
           return irq_check_status_bit(irq, IRQ_NO_BALANCING_MASK);
                                            ^
>> include/linux/irqdesc.h:241:35: error: use of undeclared identifier 'IRQ=
_PER_CPU'
           return irq_check_status_bit(irq, IRQ_PER_CPU);
                                            ^
>> include/linux/irqdesc.h:246:35: error: use of undeclared identifier 'IRQ=
_PER_CPU_DEVID'
           return irq_check_status_bit(irq, IRQ_PER_CPU_DEVID);
                                            ^
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for =
function 'output_ptreg_defines' [-Wmissing-prototypes]
   void output_ptreg_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:26:1: note: declare 'static' if the funct=
ion is not intended to be used outside of this translation unit
   void output_ptreg_defines(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for =
function 'output_task_defines' [-Wmissing-prototypes]
   void output_task_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:78:1: note: declare 'static' if the funct=
ion is not intended to be used outside of this translation unit
   void output_task_defines(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:93:6: warning: no previous prototype for =
function 'output_thread_info_defines' [-Wmissing-prototypes]
   void output_thread_info_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:93:1: note: declare 'static' if the funct=
ion is not intended to be used outside of this translation unit
   void output_thread_info_defines(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:109:6: warning: no previous prototype for=
 function 'output_thread_defines' [-Wmissing-prototypes]
   void output_thread_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:109:1: note: declare 'static' if the func=
tion is not intended to be used outside of this translation unit
   void output_thread_defines(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:180:6: warning: no previous prototype for=
 function 'output_mm_defines' [-Wmissing-prototypes]
   void output_mm_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:180:1: note: declare 'static' if the func=
tion is not intended to be used outside of this translation unit
   void output_mm_defines(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:219:6: warning: no previous prototype for=
 function 'output_sc_defines' [-Wmissing-prototypes]
   void output_sc_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:219:1: note: declare 'static' if the func=
tion is not intended to be used outside of this translation unit
   void output_sc_defines(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:254:6: warning: no previous prototype for=
 function 'output_signal_defined' [-Wmissing-prototypes]
   void output_signal_defined(void)
        ^
   arch/mips/kernel/asm-offsets.c:254:1: note: declare 'static' if the func=
tion is not intended to be used outside of this translation unit
   void output_signal_defined(void)
   ^
   static =

   arch/mips/kernel/asm-offsets.c:391:6: warning: no previous prototype for=
 function 'output_cps_defines' [-Wmissing-prototypes]
   void output_cps_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:391:1: note: declare 'static' if the func=
tion is not intended to be used outside of this translation unit
   void output_cps_defines(void)
   ^
   static =

   8 warnings and 10 errors generated.
   make[2]: *** [scripts/Makefile.build:117: arch/mips/kernel/asm-offsets.s=
] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1227: prepare0] Error 2
   make[1]: Target 'modules_prepare' not remade because of errors.
   make: *** [Makefile:215: __sub-make] Error 2
   make: Target 'modules_prepare' not remade because of errors.
..


vim +56 include/linux/irqdesc.h

293a7a0a165c4f Thomas Gleixner           2012-10-16   19  =

e144710b302525 Thomas Gleixner           2010-10-01   20  /**
e144710b302525 Thomas Gleixner           2010-10-01   21   * struct irq_des=
c - interrupt descriptor
0d0b4c866bcce6 Jiang Liu                 2015-06-01   22   * @irq_common_da=
ta:	per irq and chip data passed down to chip functions
e144710b302525 Thomas Gleixner           2010-10-01   23   * @kstat_irqs:		=
irq stats per cpu
770767787c2304 Geert Uytterhoeven        2011-04-10   24   * @handle_irq:		=
highlevel irq-events handler
e144710b302525 Thomas Gleixner           2010-10-01   25   * @action:		the =
irq action chain
80ebc420ec59a7 Yunfeng Ye                2019-09-18   26   * @status_use_ac=
cessors: status information
dbec07bac614a6 Thomas Gleixner           2011-02-07   27   * @core_internal=
_state__do_not_mess_with_it: core internal status information
e144710b302525 Thomas Gleixner           2010-10-01   28   * @depth:		disab=
le-depth, for nested irq_disable() calls
0911f124bf5535 Geert Uytterhoeven        2011-04-10   29   * @wake_depth:		=
enable depth, for multiple irq_set_irq_wake() callers
030fc443aef663 Waiman Long               2019-02-12   30   * @tot_count:		s=
tats field for non-percpu irqs
e144710b302525 Thomas Gleixner           2010-10-01   31   * @irq_count:		s=
tats field to detect stalled irqs
e144710b302525 Thomas Gleixner           2010-10-01   32   * @last_unhandle=
d:	aging timer for unhandled count
e144710b302525 Thomas Gleixner           2010-10-01   33   * @irqs_unhandle=
d:	stats field for spurious unhandled interrupts
1e77d0a1ed7417 Thomas Gleixner           2013-03-07   34   * @threads_handl=
ed:	stats field for deferred spurious detection of threaded handlers
a359f757965aaf Ingo Molnar               2021-03-22   35   * @threads_handl=
ed_last: comparator field for deferred spurious detection of threaded handl=
ers
e144710b302525 Thomas Gleixner           2010-10-01   36   * @lock:		lockin=
g for SMP
770767787c2304 Geert Uytterhoeven        2011-04-10   37   * @affinity_hint=
:	hint to user space for preferred irq affinity
cd7eab44e9946c Ben Hutchings             2011-01-19   38   * @affinity_noti=
fy:	context for notification of affinity changes
e144710b302525 Thomas Gleixner           2010-10-01   39   * @pending_mask:=
	pending rebalanced interrupts
b5faba21a6805c Thomas Gleixner           2011-02-23   40   * @threads_onesh=
ot:	bitfield to handle shared oneshot threads
e144710b302525 Thomas Gleixner           2010-10-01   41   * @threads_activ=
e:	number of irqaction threads currently running
e144710b302525 Thomas Gleixner           2010-10-01   42   * @wait_for_thre=
ads:	wait queue for sync_irq to wait for threaded handlers
cab303be91dc47 Thomas Gleixner           2014-08-28   43   * @nr_actions:		=
number of installed actions on this descriptor
cab303be91dc47 Thomas Gleixner           2014-08-28   44   * @no_suspend_de=
pth:	number of irqactions on a irq descriptor with
cab303be91dc47 Thomas Gleixner           2014-08-28   45   *			IRQF_NO_SUSP=
END set
cab303be91dc47 Thomas Gleixner           2014-08-28   46   * @force_resume_=
depth:	number of irqactions on a irq descriptor with
cab303be91dc47 Thomas Gleixner           2014-08-28   47   *			IRQF_FORCE_R=
ESUME set
425a5072dcd1bd Thomas Gleixner           2015-12-13   48   * @rcu:		rcu hea=
d for delayed free
ecb3f394c5dba8 Craig Gallek              2016-09-13   49   * @kobj:		kobjec=
t used to represent this struct in sysfs
9114014cf4e6df Thomas Gleixner           2017-06-29   50   * @request_mutex=
:	mutex to protect request/free before locking desc->lock
e144710b302525 Thomas Gleixner           2010-10-01   51   * @dir:		/proc/i=
rq/ procfs entry
087cdfb662ae50 Thomas Gleixner           2017-06-20   52   * @debugfs_file:=
	dentry for the debugfs file
e144710b302525 Thomas Gleixner           2010-10-01   53   * @name:		flow h=
andler name for /proc/interrupts output
e144710b302525 Thomas Gleixner           2010-10-01   54   */
e144710b302525 Thomas Gleixner           2010-10-01   55  struct irq_desc {
0d0b4c866bcce6 Jiang Liu                 2015-06-01  @56  	struct irq_commo=
n_data	irq_common_data;
e144710b302525 Thomas Gleixner           2010-10-01  @57  	struct irq_data	=
	irq_data;
6c9ae009b29875 Eric Dumazet              2011-01-13   58  	unsigned int __p=
ercpu	*kstat_irqs;
e144710b302525 Thomas Gleixner           2010-10-01   59  	irq_flow_handler=
_t	handle_irq;
e144710b302525 Thomas Gleixner           2010-10-01   60  	struct irqaction=
	*action;	/* IRQ action list */
a6967caf00ebbb Thomas Gleixner           2011-02-10   61  	unsigned int		st=
atus_use_accessors;
dbec07bac614a6 Thomas Gleixner           2011-02-07   62  	unsigned int		co=
re_internal_state__do_not_mess_with_it;
e144710b302525 Thomas Gleixner           2010-10-01   63  	unsigned int		de=
pth;		/* nested irq disables */
e144710b302525 Thomas Gleixner           2010-10-01   64  	unsigned int		wa=
ke_depth;	/* nested wake enables */
1136b072896990 Thomas Gleixner           2019-02-08   65  	unsigned int		to=
t_count;
e144710b302525 Thomas Gleixner           2010-10-01   66  	unsigned int		ir=
q_count;	/* For detecting broken IRQs */
e144710b302525 Thomas Gleixner           2010-10-01   67  	unsigned long		l=
ast_unhandled;	/* Aging timer for unhandled count */
e144710b302525 Thomas Gleixner           2010-10-01   68  	unsigned int		ir=
qs_unhandled;
1e77d0a1ed7417 Thomas Gleixner           2013-03-07   69  	atomic_t		thread=
s_handled;
1e77d0a1ed7417 Thomas Gleixner           2013-03-07   70  	int			threads_ha=
ndled_last;
e144710b302525 Thomas Gleixner           2010-10-01   71  	raw_spinlock_t		=
lock;
31d9d9b6d83030 Marc Zyngier              2011-09-23   72  	struct cpumask		=
*percpu_enabled;
222df54fd8b764 Marc Zyngier              2016-04-11   73  	const struct cpu=
mask	*percpu_affinity;
e144710b302525 Thomas Gleixner           2010-10-01   74  #ifdef CONFIG_SMP
e144710b302525 Thomas Gleixner           2010-10-01   75  	const struct cpu=
mask	*affinity_hint;
cd7eab44e9946c Ben Hutchings             2011-01-19   76  	struct irq_affin=
ity_notify *affinity_notify;
e144710b302525 Thomas Gleixner           2010-10-01   77  #ifdef CONFIG_GEN=
ERIC_PENDING_IRQ
e144710b302525 Thomas Gleixner           2010-10-01   78  	cpumask_var_t		p=
ending_mask;
e144710b302525 Thomas Gleixner           2010-10-01   79  #endif
e144710b302525 Thomas Gleixner           2010-10-01   80  #endif
b5faba21a6805c Thomas Gleixner           2011-02-23   81  	unsigned long		t=
hreads_oneshot;
e144710b302525 Thomas Gleixner           2010-10-01   82  	atomic_t		thread=
s_active;
e144710b302525 Thomas Gleixner           2010-10-01   83  	wait_queue_head_=
t       wait_for_threads;
cab303be91dc47 Thomas Gleixner           2014-08-28   84  #ifdef CONFIG_PM_=
SLEEP
cab303be91dc47 Thomas Gleixner           2014-08-28   85  	unsigned int		nr=
_actions;
cab303be91dc47 Thomas Gleixner           2014-08-28   86  	unsigned int		no=
_suspend_depth;
17f480342026e5 Rafael J. Wysocki         2015-02-27   87  	unsigned int		co=
nd_suspend_depth;
cab303be91dc47 Thomas Gleixner           2014-08-28   88  	unsigned int		fo=
rce_resume_depth;
cab303be91dc47 Thomas Gleixner           2014-08-28   89  #endif
e144710b302525 Thomas Gleixner           2010-10-01   90  #ifdef CONFIG_PRO=
C_FS
e144710b302525 Thomas Gleixner           2010-10-01   91  	struct proc_dir_=
entry	*dir;
425a5072dcd1bd Thomas Gleixner           2015-12-13   92  #endif
087cdfb662ae50 Thomas Gleixner           2017-06-20   93  #ifdef CONFIG_GEN=
ERIC_IRQ_DEBUGFS
087cdfb662ae50 Thomas Gleixner           2017-06-20   94  	struct dentry		*=
debugfs_file;
07557ccb8c83f3 Thomas Gleixner           2017-09-13   95  	const char		*dev=
_name;
087cdfb662ae50 Thomas Gleixner           2017-06-20   96  #endif
425a5072dcd1bd Thomas Gleixner           2015-12-13   97  #ifdef CONFIG_SPA=
RSE_IRQ
425a5072dcd1bd Thomas Gleixner           2015-12-13   98  	struct rcu_head	=
	rcu;
ecb3f394c5dba8 Craig Gallek              2016-09-13   99  	struct kobject		=
kobj;
e144710b302525 Thomas Gleixner           2010-10-01  100  #endif
9114014cf4e6df Thomas Gleixner           2017-06-29  101  	struct mutex		re=
quest_mutex;
293a7a0a165c4f Thomas Gleixner           2012-10-16  102  	int			parent_irq;
b6873807a7143b Sebastian Andrzej Siewior 2011-07-11  103  	struct module		*=
owner;
e144710b302525 Thomas Gleixner           2010-10-01  104  	const char		*nam=
e;
e144710b302525 Thomas Gleixner           2010-10-01  105  } ____cacheline_i=
nternodealigned_in_smp;
e144710b302525 Thomas Gleixner           2010-10-01  106  =

a899418167264c Thomas Gleixner           2015-07-05  107  #ifdef CONFIG_SPA=
RSE_IRQ
a899418167264c Thomas Gleixner           2015-07-05  108  extern void irq_l=
ock_sparse(void);
a899418167264c Thomas Gleixner           2015-07-05  109  extern void irq_u=
nlock_sparse(void);
a899418167264c Thomas Gleixner           2015-07-05  110  #else
a899418167264c Thomas Gleixner           2015-07-05  111  static inline voi=
d irq_lock_sparse(void) { }
a899418167264c Thomas Gleixner           2015-07-05  112  static inline voi=
d irq_unlock_sparse(void) { }
e144710b302525 Thomas Gleixner           2010-10-01 @113  extern struct irq=
_desc irq_desc[NR_IRQS];
e144710b302525 Thomas Gleixner           2010-10-01  114  #endif
e144710b302525 Thomas Gleixner           2010-10-01  115  =

501e2db67fa426 Thomas Gleixner           2020-12-10  116  static inline uns=
igned int irq_desc_kstat_cpu(struct irq_desc *desc,
501e2db67fa426 Thomas Gleixner           2020-12-10  117  					      unsign=
ed int cpu)
501e2db67fa426 Thomas Gleixner           2020-12-10  118  {
501e2db67fa426 Thomas Gleixner           2020-12-10  119  	return desc->kst=
at_irqs ? *per_cpu_ptr(desc->kstat_irqs, cpu) : 0;
501e2db67fa426 Thomas Gleixner           2020-12-10  120  }
501e2db67fa426 Thomas Gleixner           2020-12-10  121  =

7bbf1dd24b17b9 Jiang Liu                 2015-06-01  122  static inline str=
uct irq_desc *irq_data_to_desc(struct irq_data *data)
7bbf1dd24b17b9 Jiang Liu                 2015-06-01  123  {
755d119a620497 Thomas Gleixner           2015-09-16 @124  	return container=
_of(data->common, struct irq_desc, irq_common_data);
7bbf1dd24b17b9 Jiang Liu                 2015-06-01  125  }
7bbf1dd24b17b9 Jiang Liu                 2015-06-01  126  =

304adf8a8fff97 Jiang Liu                 2015-06-04  127  static inline uns=
igned int irq_desc_get_irq(struct irq_desc *desc)
304adf8a8fff97 Jiang Liu                 2015-06-04  128  {
304adf8a8fff97 Jiang Liu                 2015-06-04  129  	return desc->irq=
_data.irq;
304adf8a8fff97 Jiang Liu                 2015-06-04  130  }
304adf8a8fff97 Jiang Liu                 2015-06-04  131  =

d9936bb3952a08 Thomas Gleixner           2011-03-11  132  static inline str=
uct irq_data *irq_desc_get_irq_data(struct irq_desc *desc)
d9936bb3952a08 Thomas Gleixner           2011-03-11  133  {
d9936bb3952a08 Thomas Gleixner           2011-03-11  134  	return &desc->ir=
q_data;
d9936bb3952a08 Thomas Gleixner           2011-03-11  135  }
d9936bb3952a08 Thomas Gleixner           2011-03-11  136  =

a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  137  static inline str=
uct irq_chip *irq_desc_get_chip(struct irq_desc *desc)
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  138  {
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  139  	return desc->irq=
_data.chip;
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  140  }
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  141  =

a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  142  static inline voi=
d *irq_desc_get_chip_data(struct irq_desc *desc)
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  143  {
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  144  	return desc->irq=
_data.chip_data;
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  145  }
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  146  =

a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  147  static inline voi=
d *irq_desc_get_handler_data(struct irq_desc *desc)
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  148  {
af7080e040d223 Jiang Liu                 2015-06-01  149  	return desc->irq=
_common_data.handler_data;
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  150  }
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  151  =

e144710b302525 Thomas Gleixner           2010-10-01  152  /*
e144710b302525 Thomas Gleixner           2010-10-01  153   * Architectures =
call this to let the generic IRQ layer
6584d84c3e504c Huang Shijie              2015-09-01  154   * handle an inte=
rrupt.
e144710b302525 Thomas Gleixner           2010-10-01  155   */
bd0b9ac405e179 Thomas Gleixner           2015-09-14  156  static inline voi=
d generic_handle_irq_desc(struct irq_desc *desc)
e144710b302525 Thomas Gleixner           2010-10-01  157  {
bd0b9ac405e179 Thomas Gleixner           2015-09-14  158  	desc->handle_irq=
(desc);
e144710b302525 Thomas Gleixner           2010-10-01  159  }
e144710b302525 Thomas Gleixner           2010-10-01  160  =

fe12bc2c996d3e Thomas Gleixner           2011-05-18  161  int generic_handl=
e_irq(unsigned int irq);
e144710b302525 Thomas Gleixner           2010-10-01  162  =

76ba59f8366f2d Marc Zyngier              2014-08-26  163  #ifdef CONFIG_HAN=
DLE_DOMAIN_IRQ
76ba59f8366f2d Marc Zyngier              2014-08-26  164  /*
76ba59f8366f2d Marc Zyngier              2014-08-26  165   * Convert a HW i=
nterrupt number to a logical one using a IRQ domain,
76ba59f8366f2d Marc Zyngier              2014-08-26  166   * and handle the=
 result interrupt number. Return -EINVAL if
76ba59f8366f2d Marc Zyngier              2014-08-26  167   * conversion fai=
led. Providing a NULL domain indicates that the
76ba59f8366f2d Marc Zyngier              2014-08-26  168   * conversion has=
 already been done.
76ba59f8366f2d Marc Zyngier              2014-08-26  169   */
76ba59f8366f2d Marc Zyngier              2014-08-26  170  int __handle_doma=
in_irq(struct irq_domain *domain, unsigned int hwirq,
76ba59f8366f2d Marc Zyngier              2014-08-26  171  			bool lookup, s=
truct pt_regs *regs);
76ba59f8366f2d Marc Zyngier              2014-08-26  172  =

76ba59f8366f2d Marc Zyngier              2014-08-26  173  static inline int=
 handle_domain_irq(struct irq_domain *domain,
76ba59f8366f2d Marc Zyngier              2014-08-26  174  				    unsigned =
int hwirq, struct pt_regs *regs)
76ba59f8366f2d Marc Zyngier              2014-08-26  175  {
76ba59f8366f2d Marc Zyngier              2014-08-26  176  	return __handle_=
domain_irq(domain, hwirq, true, regs);
76ba59f8366f2d Marc Zyngier              2014-08-26  177  }
6e4933a0066163 Julien Thierry            2019-01-31  178  =

6e4933a0066163 Julien Thierry            2019-01-31  179  #ifdef CONFIG_IRQ=
_DOMAIN
6e4933a0066163 Julien Thierry            2019-01-31  180  int handle_domain=
_nmi(struct irq_domain *domain, unsigned int hwirq,
6e4933a0066163 Julien Thierry            2019-01-31  181  		      struct pt=
_regs *regs);
6e4933a0066163 Julien Thierry            2019-01-31  182  #endif
76ba59f8366f2d Marc Zyngier              2014-08-26  183  #endif
76ba59f8366f2d Marc Zyngier              2014-08-26  184  =

e144710b302525 Thomas Gleixner           2010-10-01  185  /* Test to see if=
 a driver has successfully requested an irq */
f61ae4fb66a4f7 Thomas Gleixner           2015-08-02  186  static inline int=
 irq_desc_has_action(struct irq_desc *desc)
e144710b302525 Thomas Gleixner           2010-10-01  187  {
a313357e704f26 Thomas Gleixner           2020-12-10  188  	return desc && d=
esc->action !=3D NULL;
f61ae4fb66a4f7 Thomas Gleixner           2015-08-02  189  }
f61ae4fb66a4f7 Thomas Gleixner           2015-08-02  190  =

bbc9d21fc0071c Thomas Gleixner           2015-06-23  191  /**
bbc9d21fc0071c Thomas Gleixner           2015-06-23  192   * irq_set_handle=
r_locked - Set irq handler from a locked region
bbc9d21fc0071c Thomas Gleixner           2015-06-23  193   * @data:	Pointer=
 to the irq_data structure which identifies the irq
bbc9d21fc0071c Thomas Gleixner           2015-06-23  194   * @handler:	Flow=
 control handler function for this interrupt
bbc9d21fc0071c Thomas Gleixner           2015-06-23  195   *
bbc9d21fc0071c Thomas Gleixner           2015-06-23  196   * Sets the handl=
er in the irq descriptor associated to @data.
bbc9d21fc0071c Thomas Gleixner           2015-06-23  197   *
bbc9d21fc0071c Thomas Gleixner           2015-06-23  198   * Must be called=
 with irq_desc locked and valid parameters. Typical
bbc9d21fc0071c Thomas Gleixner           2015-06-23  199   * call site is t=
he irq_set_type() callback.
bbc9d21fc0071c Thomas Gleixner           2015-06-23  200   */
bbc9d21fc0071c Thomas Gleixner           2015-06-23  201  static inline voi=
d irq_set_handler_locked(struct irq_data *data,
bbc9d21fc0071c Thomas Gleixner           2015-06-23  202  					  irq_flow_h=
andler_t handler)
bbc9d21fc0071c Thomas Gleixner           2015-06-23  203  {
bbc9d21fc0071c Thomas Gleixner           2015-06-23  204  	struct irq_desc =
*desc =3D irq_data_to_desc(data);
bbc9d21fc0071c Thomas Gleixner           2015-06-23  205  =

bbc9d21fc0071c Thomas Gleixner           2015-06-23  206  	desc->handle_irq=
 =3D handler;
bbc9d21fc0071c Thomas Gleixner           2015-06-23  207  }
bbc9d21fc0071c Thomas Gleixner           2015-06-23  208  =

bbc9d21fc0071c Thomas Gleixner           2015-06-23  209  /**
bbc9d21fc0071c Thomas Gleixner           2015-06-23  210   * irq_set_chip_h=
andler_name_locked - Set chip, handler and name from a locked region
bbc9d21fc0071c Thomas Gleixner           2015-06-23  211   * @data:	Pointer=
 to the irq_data structure for which the chip is set
bbc9d21fc0071c Thomas Gleixner           2015-06-23  212   * @chip:	Pointer=
 to the new irq chip
bbc9d21fc0071c Thomas Gleixner           2015-06-23  213   * @handler:	Flow=
 control handler function for this interrupt
bbc9d21fc0071c Thomas Gleixner           2015-06-23  214   * @name:	Name of=
 the interrupt
bbc9d21fc0071c Thomas Gleixner           2015-06-23  215   *
bbc9d21fc0071c Thomas Gleixner           2015-06-23  216   * Replace the ir=
q chip at the proper hierarchy level in @data and
bbc9d21fc0071c Thomas Gleixner           2015-06-23  217   * sets the handl=
er and name in the associated irq descriptor.
bbc9d21fc0071c Thomas Gleixner           2015-06-23  218   *
bbc9d21fc0071c Thomas Gleixner           2015-06-23  219   * Must be called=
 with irq_desc locked and valid parameters.
bbc9d21fc0071c Thomas Gleixner           2015-06-23  220   */
bbc9d21fc0071c Thomas Gleixner           2015-06-23  221  static inline void
bbc9d21fc0071c Thomas Gleixner           2015-06-23  222  irq_set_chip_hand=
ler_name_locked(struct irq_data *data, struct irq_chip *chip,
bbc9d21fc0071c Thomas Gleixner           2015-06-23  223  				 irq_flow_han=
dler_t handler, const char *name)
bbc9d21fc0071c Thomas Gleixner           2015-06-23  224  {
bbc9d21fc0071c Thomas Gleixner           2015-06-23  225  	struct irq_desc =
*desc =3D irq_data_to_desc(data);
bbc9d21fc0071c Thomas Gleixner           2015-06-23  226  =

bbc9d21fc0071c Thomas Gleixner           2015-06-23  227  	desc->handle_irq=
 =3D handler;
bbc9d21fc0071c Thomas Gleixner           2015-06-23  228  	desc->name =3D n=
ame;
bbc9d21fc0071c Thomas Gleixner           2015-06-23  229  	data->chip =3D c=
hip;
bbc9d21fc0071c Thomas Gleixner           2015-06-23  230  }
bbc9d21fc0071c Thomas Gleixner           2015-06-23  231  =

fdd029630434b4 Thomas Gleixner           2020-12-10  232  bool irq_check_st=
atus_bit(unsigned int irq, unsigned int bitmask);
fdd029630434b4 Thomas Gleixner           2020-12-10  233  =

4ce413d1840b25 Will Deacon               2017-12-01  234  static inline boo=
l irq_balancing_disabled(unsigned int irq)
e144710b302525 Thomas Gleixner           2010-10-01  235  {
fdd029630434b4 Thomas Gleixner           2020-12-10 @236  	return irq_check=
_status_bit(irq, IRQ_NO_BALANCING_MASK);
e144710b302525 Thomas Gleixner           2010-10-01  237  }
781295762defc7 Thomas Gleixner           2011-02-10  238  =

4ce413d1840b25 Will Deacon               2017-12-01  239  static inline boo=
l irq_is_percpu(unsigned int irq)
7f4a8e7b1943c1 Vinayak Kale              2013-12-04  240  {
fdd029630434b4 Thomas Gleixner           2020-12-10 @241  	return irq_check=
_status_bit(irq, IRQ_PER_CPU);
7f4a8e7b1943c1 Vinayak Kale              2013-12-04  242  }
7f4a8e7b1943c1 Vinayak Kale              2013-12-04  243  =

4ce413d1840b25 Will Deacon               2017-12-01  244  static inline boo=
l irq_is_percpu_devid(unsigned int irq)
08395c7f4d9f58 Julien Thierry            2017-10-13  245  {
fdd029630434b4 Thomas Gleixner           2020-12-10 @246  	return irq_check=
_status_bit(irq, IRQ_PER_CPU_DEVID);
08395c7f4d9f58 Julien Thierry            2017-10-13  247  }
08395c7f4d9f58 Julien Thierry            2017-10-13  248  =


:::::: The code at line 56 was first introduced by commit
:::::: 0d0b4c866bcce647f40d73efe5e90aeeb079050a genirq: Introduce struct ir=
q_common_data to host shared irq data

:::::: TO: Jiang Liu <jiang.liu@linux.intel.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3564042763859835303==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
mgVF7fiTxkJQB8tbpP8HNKQ3Yh/+AQA=
--===============3564042763859835303==--

