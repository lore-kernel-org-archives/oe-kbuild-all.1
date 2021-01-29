Content-Type: multipart/mixed; boundary="===============0301348635815961967=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [peterz-queue:mm/apply-to-page-range 4/6] arch/powerpc/include/asm/hardirq.h:23:25: error: storage class specified for parameter 'irq_cpustat_t'
Date: Sat, 30 Jan 2021 02:59:28 +0800
Message-ID: <202101300225.omLv0AWB-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0301348635815961967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git mm=
/apply-to-page-range
head:   a47da290a4ea193c408840f03d2edfa59c547208
commit: 7cba8c501b1137c69e72889384a5274d506bb096 [4/6] mm: Introduce verify=
_page_range()
config: powerpc-tqm5200_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/=
commit/?id=3D7cba8c501b1137c69e72889384a5274d506bb096
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/ke=
rnel/git/peterz/queue.git
        git fetch --no-tags peterz-queue mm/apply-to-page-range
        git checkout 7cba8c501b1137c69e72889384a5274d506bb096
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

     828 | {
         | ^
   include/linux/irq.h:833:1: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before '{' token
     833 | {
         | ^
   include/linux/irq.h:839:1: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before '{' token
     839 | {
         | ^
   include/linux/irq.h:844:1: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before '{' token
     844 | {
         | ^
   include/linux/irq.h:850:1: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before '{' token
     850 | {
         | ^
   include/linux/irq.h:855:1: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before '{' token
     855 | {
         | ^
   include/linux/irq.h:861:1: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before '{' token
     861 | {
         | ^
   include/linux/irq.h:870:1: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before '{' token
     870 | {
         | ^
   include/linux/irq.h:875:1: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before '{' token
     875 | {
         | ^
   include/linux/irq.h:882:1: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before '{' token
     882 | {
         | ^
   include/linux/irq.h:900:1: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before '{' token
     900 | {
         | ^
   include/linux/irq.h:904:1: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before '{' token
     904 | {
         | ^
   include/linux/irq.h:910:1: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before '{' token
     910 | {
         | ^
   include/linux/irq.h:959:1: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before '{' token
     959 | {
         | ^
   include/linux/irq.h:977:1: warning: empty declaration
     977 | struct irq_chip_regs {
         | ^~~~~~
   include/linux/irq.h:1003:2: error: expected specifier-qualifier-list bef=
ore 'irq_flow_handler_t'
    1003 |  irq_flow_handler_t handler;
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/irq.h:1000:1: warning: empty declaration
    1000 | struct irq_chip_type {
         | ^~~~~~
   include/linux/irq.h:1042:1: warning: empty declaration
    1042 | struct irq_chip_generic {
         | ^~~~~~
   include/linux/irq.h:1075:1: warning: empty declaration
    1075 | enum irq_gc_flags {
         | ^~~~
   include/linux/irq.h:1092:1: warning: empty declaration
    1092 | struct irq_domain_chip_generic {
         | ^~~~~~
   include/linux/irq.h:1118:34: error: expected declaration specifiers or '=
...' before 'irq_flow_handler_t'
    1118 |          void __iomem *reg_base, irq_flow_handler_t handler);
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/irq.h:1129:8: error: expected declaration specifiers or '.=
..' before 'irq_flow_handler_t'
    1129 |        irq_flow_handler_t handler);
         |        ^~~~~~~~~~~~~~~~~~
   include/linux/irq.h:1138:10: error: expected declaration specifiers or '=
...' before 'irq_flow_handler_t'
    1138 |          irq_flow_handler_t handler,
         |          ^~~~~~~~~~~~~~~~~~
   include/linux/irq.h:1151:1: error: expected '=3D', ',', ';', 'asm' or '_=
_attribute__' before '{' token
    1151 | {
         | ^
   include/linux/irq.h:1158:1: error: expected '=3D', ',', ';', 'asm' or '_=
_attribute__' before '{' token
    1158 | {
         | ^
   include/linux/irq.h:1164:1: error: expected '=3D', ',', ';', 'asm' or '_=
_attribute__' before '{' token
    1164 | {
         | ^
   include/linux/irq.h:1181:61: error: expected '=3D', ',', ';', 'asm' or '=
__attribute__' before '{' token
    1181 | static inline void irq_gc_lock(struct irq_chip_generic *gc) { }
         |                                                             ^
   include/linux/irq.h:1182:63: error: expected '=3D', ',', ';', 'asm' or '=
__attribute__' before '{' token
    1182 | static inline void irq_gc_unlock(struct irq_chip_generic *gc) { }
         |                                                               ^
   include/linux/irq.h:1197:1: error: expected '=3D', ',', ';', 'asm' or '_=
_attribute__' before '{' token
    1197 | {
         | ^
   include/linux/irq.h:1206:1: error: expected '=3D', ',', ';', 'asm' or '_=
_attribute__' before '{' token
    1206 | {
         | ^
   include/linux/irq.h:1213:1: warning: empty declaration
    1213 | struct irq_matrix;
         | ^~~~~~
   In file included from include/linux/hardirq.h:10,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/powerpc/kernel/asm-offsets.c:23:
>> arch/powerpc/include/asm/hardirq.h:23:25: error: storage class specified=
 for parameter 'irq_cpustat_t'
      23 | } ____cacheline_aligned irq_cpustat_t;
         |                         ^~~~~~~~~~~~~
   In file included from include/asm-generic/percpu.h:7,
                    from arch/powerpc/include/asm/percpu.h:18,
                    from include/linux/irqflags.h:17,
                    from include/linux/spinlock.h:54,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:14:
>> arch/powerpc/include/asm/hardirq.h:25:47: error: storage class specified=
 for parameter 'irq_stat'
      25 | DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
         |                                               ^~~~~~~~
   include/linux/percpu-defs.h:101:44: note: in definition of macro 'DECLAR=
E_PER_CPU_SECTION'
     101 |  extern __PCPU_ATTRS(sec) __typeof__(type) name
         |                                            ^~~~
   arch/powerpc/include/asm/hardirq.h:25:1: note: in expansion of macro 'DE=
CLARE_PER_CPU_SHARED_ALIGNED'
      25 | DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/hardirq.h:25:47: error: section attribute not a=
llowed for 'irq_stat'
      25 | DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
         |                                               ^~~~~~~~
   include/linux/percpu-defs.h:101:44: note: in definition of macro 'DECLAR=
E_PER_CPU_SECTION'
     101 |  extern __PCPU_ATTRS(sec) __typeof__(type) name
         |                                            ^~~~
   arch/powerpc/include/asm/hardirq.h:25:1: note: in expansion of macro 'DE=
CLARE_PER_CPU_SHARED_ALIGNED'
      25 | DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/hardirq.h:10,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/powerpc/kernel/asm-offsets.c:23:
>> arch/powerpc/include/asm/hardirq.h:31:1: error: expected '=3D', ',', ';'=
, 'asm' or '__attribute__' before '{' token
      31 | {
         | ^
>> arch/powerpc/include/asm/hardirq.h:35:12: error: storage class specified=
 for parameter 'arch_irq_stat_cpu'
      35 | extern u64 arch_irq_stat_cpu(unsigned int cpu);
         |            ^~~~~~~~~~~~~~~~~
   In file included from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/powerpc/kernel/asm-offsets.c:23:
   include/linux/hardirq.h:12:13: error: storage class specified for parame=
ter 'synchronize_irq'
      12 | extern void synchronize_irq(unsigned int irq);
         |             ^~~~~~~~~~~~~~~
   include/linux/hardirq.h:13:13: error: storage class specified for parame=
ter 'synchronize_hardirq'
      13 | extern bool synchronize_hardirq(unsigned int irq);
         |             ^~~~~~~~~~~~~~~~~~~
   include/linux/hardirq.h:18:53: error: expected '=3D', ',', ';', 'asm' or=
 '__attribute__' before '{' token
      18 | static inline void __rcu_irq_enter_check_tick(void) { }
         |                                                     ^
   include/linux/hardirq.h:22:1: error: expected '=3D', ',', ';', 'asm' or =
'__attribute__' before '{' token
      22 | {
         | ^
   include/linux/hardirq.h:95:40: error: expected '=3D', ',', ';', 'asm' or=
 '__attribute__' before '{' token
      95 | static inline void rcu_nmi_enter(void) { }
         |                                        ^
   include/linux/hardirq.h:96:39: error: expected '=3D', ',', ';', 'asm' or=
 '__attribute__' before '{' token
      96 | static inline void rcu_nmi_exit(void) { }
         |                                       ^
   In file included from arch/powerpc/include/asm/elf.h:11,
                    from include/linux/elf.h:6,
                    from arch/powerpc/include/asm/sections.h:6,
                    from include/linux/interrupt.h:20,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/powerpc/kernel/asm-offsets.c:23:
>> arch/powerpc/include/uapi/asm/elf.h:102:23: error: storage class specifi=
ed for parameter 'elf_greg_t64'
     102 | typedef unsigned long elf_greg_t64;
         |                       ^~~~~~~~~~~~
>> arch/powerpc/include/uapi/asm/elf.h:103:22: error: expected '=3D', ',', =
';', 'asm' or '__attribute__' before 'elf_gregset_t64'
     103 | typedef elf_greg_t64 elf_gregset_t64[ELF_NGREG];
         |                      ^~~~~~~~~~~~~~~
>> arch/powerpc/include/uapi/asm/elf.h:105:22: error: storage class specifi=
ed for parameter 'elf_greg_t32'
     105 | typedef unsigned int elf_greg_t32;
         |                      ^~~~~~~~~~~~
>> arch/powerpc/include/uapi/asm/elf.h:106:22: error: expected '=3D', ',', =
';', 'asm' or '__attribute__' before 'elf_gregset_t32'
     106 | typedef elf_greg_t32 elf_gregset_t32[ELF_NGREG];
         |                      ^~~~~~~~~~~~~~~
>> arch/powerpc/include/uapi/asm/elf.h:107:9: error: unknown type name 'elf=
_gregset_t32'
     107 | typedef elf_gregset_t32 compat_elf_gregset_t;
         |         ^~~~~~~~~~~~~~~
>> arch/powerpc/include/uapi/asm/elf.h:107:25: error: storage class specifi=
ed for parameter 'compat_elf_gregset_t'
     107 | typedef elf_gregset_t32 compat_elf_gregset_t;
         |                         ^~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/uapi/asm/elf.h:127:22: error: expected '=3D', ',', =
';', 'asm' or '__attribute__' before 'elf_greg_t'
     127 | typedef elf_greg_t32 elf_greg_t;
         |                      ^~~~~~~~~~
   arch/powerpc/include/uapi/asm/elf.h:128:9: error: unknown type name 'elf=
_gregset_t32'
     128 | typedef elf_gregset_t32 elf_gregset_t;
         |         ^~~~~~~~~~~~~~~
>> arch/powerpc/include/uapi/asm/elf.h:128:25: error: storage class specifi=
ed for parameter 'elf_gregset_t'
     128 | typedef elf_gregset_t32 elf_gregset_t;
         |                         ^~~~~~~~~~~~~
>> arch/powerpc/include/uapi/asm/elf.h:138:16: error: storage class specifi=
ed for parameter 'elf_fpreg_t'
     138 | typedef double elf_fpreg_t;
         |                ^~~~~~~~~~~
   arch/powerpc/include/uapi/asm/elf.h:139:21: error: expected '=3D', ',', =
';', 'asm' or '__attribute__' before 'elf_fpregset_t'
     139 | typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
         |                     ^~~~~~~~~~~~~~
   arch/powerpc/include/uapi/asm/elf.h:160:21: error: storage class specifi=
ed for parameter 'elf_vrreg_t'
     160 | typedef __vector128 elf_vrreg_t;
         |                     ^~~~~~~~~~~
   arch/powerpc/include/uapi/asm/elf.h:161:21: error: expected '=3D', ',', =
';', 'asm' or '__attribute__' before 'elf_vrregset_t'
     161 | typedef elf_vrreg_t elf_vrregset_t[ELF_NVRREG];
         |                     ^~~~~~~~~~~~~~
   arch/powerpc/include/uapi/asm/elf.h:293:1: warning: empty declaration
     293 | struct ppc64_opd_entry
         | ^~~~~~
   In file included from include/linux/elf.h:6,
                    from arch/powerpc/include/asm/sections.h:6,
                    from include/linux/interrupt.h:20,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/powerpc/kernel/asm-offsets.c:23:
   arch/powerpc/include/asm/elf.h:49:43: error: expected declaration specif=
iers or '...' before 'elf_gregset_t'
      49 | static inline void ppc_elf_core_copy_regs(elf_gregset_t elf_regs,
         |                                           ^~~~~~~~~~~~~
   arch/powerpc/include/asm/elf.h:110:12: error: storage class specified fo=
r parameter 'dcache_bsize'
     110 | extern int dcache_bsize;
         |            ^~~~~~~~~~~~
   arch/powerpc/include/asm/elf.h:111:12: error: storage class specified fo=
r parameter 'icache_bsize'
     111 | extern int icache_bsize;
         |            ^~~~~~~~~~~~
   arch/powerpc/include/asm/elf.h:112:12: error: storage class specified fo=
r parameter 'ucache_bsize'
     112 | extern int ucache_bsize;
         |            ^~~~~~~~~~~~
   arch/powerpc/include/asm/elf.h:116:1: warning: empty declaration
     116 | struct linux_binprm;
         | ^~~~~~
   arch/powerpc/include/asm/elf.h:117:12: error: storage class specified fo=
r parameter 'arch_setup_additional_pages'
     117 | extern int arch_setup_additional_pages(struct linux_binprm *bprm,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/elf.h:7,
                    from arch/powerpc/include/asm/sections.h:6,
                    from include/linux/interrupt.h:20,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/powerpc/kernel/asm-offsets.c:23:
   include/uapi/linux/elf.h:9:15: error: storage class specified for parame=
ter 'Elf32_Addr'
       9 | typedef __u32 Elf32_Addr;
         |               ^~~~~~~~~~
   include/uapi/linux/elf.h:10:15: error: storage class specified for param=
eter 'Elf32_Half'
      10 | typedef __u16 Elf32_Half;
         |               ^~~~~~~~~~
   include/uapi/linux/elf.h:11:15: error: storage class specified for param=
eter 'Elf32_Off'
      11 | typedef __u32 Elf32_Off;
         |               ^~~~~~~~~
   include/uapi/linux/elf.h:12:15: error: storage class specified for param=
eter 'Elf32_Sword'
      12 | typedef __s32 Elf32_Sword;
         |               ^~~~~~~~~~~
   include/uapi/linux/elf.h:13:15: error: storage class specified for param=
eter 'Elf32_Word'
      13 | typedef __u32 Elf32_Word;
         |               ^~~~~~~~~~
   include/uapi/linux/elf.h:16:15: error: storage class specified for param=
eter 'Elf64_Addr'
      16 | typedef __u64 Elf64_Addr;
         |               ^~~~~~~~~~
   include/uapi/linux/elf.h:17:15: error: storage class specified for param=
eter 'Elf64_Half'
      17 | typedef __u16 Elf64_Half;
         |               ^~~~~~~~~~
   include/uapi/linux/elf.h:18:15: error: storage class specified for param=
eter 'Elf64_SHalf'
      18 | typedef __s16 Elf64_SHalf;
         |               ^~~~~~~~~~~
   include/uapi/linux/elf.h:19:15: error: storage class specified for param=
eter 'Elf64_Off'
      19 | typedef __u64 Elf64_Off;
         |               ^~~~~~~~~
   include/uapi/linux/elf.h:20:15: error: storage class specified for param=
eter 'Elf64_Sword'
      20 | typedef __s32 Elf64_Sword;
         |               ^~~~~~~~~~~
   include/uapi/linux/elf.h:21:15: error: storage class specified for param=
eter 'Elf64_Word'
      21 | typedef __u32 Elf64_Word;
         |               ^~~~~~~~~~
   include/uapi/linux/elf.h:22:15: error: storage class specified for param=
eter 'Elf64_Xword'
      22 | typedef __u64 Elf64_Xword;
         |               ^~~~~~~~~~~
   include/uapi/linux/elf.h:23:15: error: storage class specified for param=
eter 'Elf64_Sxword'
      23 | typedef __s64 Elf64_Sxword;
         |               ^~~~~~~~~~~~
   include/uapi/linux/elf.h:140:3: error: expected specifier-qualifier-list=
 before 'Elf32_Sword'
     140 |   Elf32_Sword d_tag;
         |   ^~~~~~~~~~~
   include/uapi/linux/elf.h:145:3: error: storage class specified for param=
eter 'Elf32_Dyn'
     145 | } Elf32_Dyn;
         |   ^~~~~~~~~
   include/uapi/linux/elf.h:148:3: error: expected specifier-qualifier-list=
 before 'Elf64_Sxword'
     148 |   Elf64_Sxword d_tag;  /* entry tag value */
         |   ^~~~~~~~~~~~
   include/uapi/linux/elf.h:153:3: error: storage class specified for param=
eter 'Elf64_Dyn'
     153 | } Elf64_Dyn;
..


vim +/irq_cpustat_t +23 arch/powerpc/include/asm/hardirq.h

8c007bfdf1bab5 Anton Blanchard   2010-01-31   7  =

8c007bfdf1bab5 Anton Blanchard   2010-01-31   8  typedef struct {
8c007bfdf1bab5 Anton Blanchard   2010-01-31   9  	unsigned int __softirq_pe=
nding;
c041cfa2af1ccb fan.du            2013-01-23  10  	unsigned int timer_irqs_e=
vent;
e360cd37f0e9ba Nicholas Piggin   2018-05-05  11  	unsigned int broadcast_ir=
qs_event;
c041cfa2af1ccb fan.du            2013-01-23  12  	unsigned int timer_irqs_o=
thers;
89713ed1081540 Anton Blanchard   2010-01-31  13  	unsigned int pmu_irqs;
89713ed1081540 Anton Blanchard   2010-01-31  14  	unsigned int mce_exceptio=
ns;
17081102a6e0fe Anton Blanchard   2010-01-31  15  	unsigned int spurious_irq=
s;
ca41ad4377072e Nicholas Piggin   2017-08-01  16  	unsigned int sreset_irqs;
04019bf8ebb3c8 Nicholas Piggin   2017-08-01  17  #ifdef CONFIG_PPC_WATCHDOG
04019bf8ebb3c8 Nicholas Piggin   2017-08-01  18  	unsigned int soft_nmi_irq=
s;
04019bf8ebb3c8 Nicholas Piggin   2017-08-01  19  #endif
a6a058e52a0ce6 Ian Munsie        2013-03-21  20  #ifdef CONFIG_PPC_DOORBELL
a6a058e52a0ce6 Ian Munsie        2013-03-21  21  	unsigned int doorbell_irq=
s;
a6a058e52a0ce6 Ian Munsie        2013-03-21  22  #endif
8c007bfdf1bab5 Anton Blanchard   2010-01-31 @23  } ____cacheline_aligned ir=
q_cpustat_t;
8c007bfdf1bab5 Anton Blanchard   2010-01-31  24  =

8c007bfdf1bab5 Anton Blanchard   2010-01-31 @25  DECLARE_PER_CPU_SHARED_ALI=
GNED(irq_cpustat_t, irq_stat);
8c007bfdf1bab5 Anton Blanchard   2010-01-31  26  =

8c007bfdf1bab5 Anton Blanchard   2010-01-31  27  #define __ARCH_IRQ_STAT
c16bee4bded544 Nicholas Piggin   2017-11-17  28  #define __ARCH_IRQ_EXIT_IR=
QS_DISABLED
69111bac42f5ce Christoph Lameter 2014-10-21  29  =

8c007bfdf1bab5 Anton Blanchard   2010-01-31  30  static inline void ack_bad=
_irq(unsigned int irq)
8c007bfdf1bab5 Anton Blanchard   2010-01-31 @31  {
8c007bfdf1bab5 Anton Blanchard   2010-01-31  32  	printk(KERN_CRIT "unexpec=
ted IRQ trap at vector %02x\n", irq);
8c007bfdf1bab5 Anton Blanchard   2010-01-31  33  }
8c007bfdf1bab5 Anton Blanchard   2010-01-31  34  =

89713ed1081540 Anton Blanchard   2010-01-31 @35  extern u64 arch_irq_stat_c=
pu(unsigned int cpu);
89713ed1081540 Anton Blanchard   2010-01-31  36  #define arch_irq_stat_cpu	=
arch_irq_stat_cpu
89713ed1081540 Anton Blanchard   2010-01-31  37  =


:::::: The code at line 23 was first introduced by commit
:::::: 8c007bfdf1bab536f824d91fccc76596c18aba78 powerpc: Reduce footprint o=
f irq_stat

:::::: TO: Anton Blanchard <anton@samba.org>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0301348635815961967==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0301348635815961967==--

