Content-Type: multipart/mixed; boundary="===============3125537036794569934=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [mark-rutland:arm64/daif-rework 5/5] arch/arm64/include/asm/arch_gicv3.h:173:0: error: unterminated argument list invoking macro "BUILD_BUG_ON"
Date: Thu, 27 Feb 2020 07:08:04 +0800
Message-ID: <202002270757.mT3255mu%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3125537036794569934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm6=
4/daif-rework
head:   2badfbbf7363ecae9afa46b4f5e2ae557a906123
commit: 2badfbbf7363ecae9afa46b4f5e2ae557a906123 [5/5] arm64: rework irq/da=
if flag manipulation
config: arm64-allnoconfig (attached as .config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 2badfbbf7363ecae9afa46b4f5e2ae557a906123
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Darm64 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/kvm_host.h:19:0,
                    from include/linux/kvm_host.h:36,
                    from arch/arm64/kernel/asm-offsets.c:14:
   arch/arm64/include/asm/arch_gicv3.h: In function 'gic_pmr_mask_irqs':
>> arch/arm64/include/asm/arch_gicv3.h:173:0: error: unterminated argument =
list invoking macro "BUILD_BUG_ON"
    #endif /* __ASM_ARCH_GICV3_H */
    =

>> arch/arm64/include/asm/arch_gicv3.h:156:2: error: 'BUILD_BUG_ON' undecla=
red (first use in this function)
     BUILD_BUG_ON(GICD_INT_DEF_PRI < (GIC_PRIO_IRQOFF);
     ^~~~~~~~~~~~
   arch/arm64/include/asm/arch_gicv3.h:156:2: note: each undeclared identif=
ier is reported only once for each function it appears in
   In file included from arch/arm64/include/asm/kvm_host.h:23:0,
                    from include/linux/kvm_host.h:36,
                    from arch/arm64/kernel/asm-offsets.c:14:
>> arch/arm64/include/asm/daifflags.h:22:1: error: expected ';' before 'sta=
tic'
    static inline void local_daif_mask(void)
    ^~~~~~
   In file included from arch/arm64/include/asm/kvm_host.h:26:0,
                    from include/linux/kvm_host.h:36,
                    from arch/arm64/kernel/asm-offsets.c:14:
>> arch/arm64/include/asm/kvm_asm.h:53:1: warning: ISO C90 forbids mixed de=
clarations and code [-Wdeclaration-after-statement]
    struct kvm_vcpu;
    ^~~~~~
   In file included from include/kvm/arm_vgic.h:14:0,
                    from arch/arm64/include/asm/kvm_host.h:34,
                    from include/linux/kvm_host.h:36,
                    from arch/arm64/kernel/asm-offsets.c:14:
>> include/kvm/iodev.h:36:20: error: invalid storage class for function 'kv=
m_iodevice_init'
    static inline void kvm_iodevice_init(struct kvm_io_device *dev,
                       ^~~~~~~~~~~~~~~~~
>> include/kvm/iodev.h:42:19: error: invalid storage class for function 'kv=
m_iodevice_read'
    static inline int kvm_iodevice_read(struct kvm_vcpu *vcpu,
                      ^~~~~~~~~~~~~~~~~
>> include/kvm/iodev.h:50:19: error: invalid storage class for function 'kv=
m_iodevice_write'
    static inline int kvm_iodevice_write(struct kvm_vcpu *vcpu,
                      ^~~~~~~~~~~~~~~~~~
>> include/kvm/iodev.h:58:20: error: invalid storage class for function 'kv=
m_iodevice_destructor'
    static inline void kvm_iodevice_destructor(struct kvm_io_device *dev)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/kvm_host.h:34:0,
                    from include/linux/kvm_host.h:36,
                    from arch/arm64/kernel/asm-offsets.c:14:
>> include/kvm/arm_vgic.h:376:19: error: invalid storage class for function=
 'kvm_vgic_get_max_vcpus'
    static inline int kvm_vgic_get_max_vcpus(void)
                      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kvm/arm_arch_timer.h:10:0,
                    from arch/arm64/include/asm/kvm_host.h:35,
                    from include/linux/kvm_host.h:36,
                    from arch/arm64/kernel/asm-offsets.c:14:
>> include/linux/clocksource.h:127:19: error: invalid storage class for fun=
ction 'clocksource_freq2mult'
    static inline u32 clocksource_freq2mult(u32 freq, u32 shift_constant, u=
64 from)
                      ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/clocksource.h:152:19: error: invalid storage class for fun=
ction 'clocksource_khz2mult'
    static inline u32 clocksource_khz2mult(u32 khz, u32 shift_constant)
                      ^~~~~~~~~~~~~~~~~~~~
>> include/linux/clocksource.h:166:19: error: invalid storage class for fun=
ction 'clocksource_hz2mult'
    static inline u32 clocksource_hz2mult(u32 hz, u32 shift_constant)
                      ^~~~~~~~~~~~~~~~~~~
>> include/linux/clocksource.h:184:19: error: invalid storage class for fun=
ction 'clocksource_cyc2ns'
    static inline s64 clocksource_cyc2ns(u64 cycles, u32 mult, u32 shift)
                      ^~~~~~~~~~~~~~~~~~
>> include/linux/clocksource.h:219:19: error: invalid storage class for fun=
ction '__clocksource_register'
    static inline int __clocksource_register(struct clocksource *cs)
                      ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/clocksource.h:224:19: error: invalid storage class for fun=
ction 'clocksource_register_hz'
    static inline int clocksource_register_hz(struct clocksource *cs, u32 h=
z)
                      ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/clocksource.h:229:19: error: invalid storage class for fun=
ction 'clocksource_register_khz'
    static inline int clocksource_register_khz(struct clocksource *cs, u32 =
khz)
                      ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/clocksource.h:234:20: error: invalid storage class for fun=
ction '__clocksource_update_freq_hz'
    static inline void __clocksource_update_freq_hz(struct clocksource *cs,=
 u32 hz)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/clocksource.h:239:20: error: invalid storage class for fun=
ction '__clocksource_update_freq_khz'
    static inline void __clocksource_update_freq_khz(struct clocksource *cs=
, u32 khz)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/clocksource.h:247:20: error: invalid storage class for fun=
ction 'clocksource_arch_init'
    static inline void clocksource_arch_init(struct clocksource *cs) { }
                       ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kmod.h:9:0,
                    from include/linux/module.h:16,
                    from include/linux/kallsyms.h:13,
                    from include/linux/ftrace.h:11,
                    from include/linux/perf_event.h:49,
                    from include/kvm/arm_pmu.h:10,
                    from arch/arm64/include/asm/kvm_host.h:36,
                    from include/linux/kvm_host.h:36,
                    from arch/arm64/kernel/asm-offsets.c:14:
>> include/linux/umh.h:70:19: error: invalid storage class for function 'us=
ermodehelper_disable'
    static inline int usermodehelper_disable(void)
                      ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/umh.h:75:20: error: invalid storage class for function 'us=
ermodehelper_enable'
    static inline void usermodehelper_enable(void)
                       ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/module.h:16:0,
                    from include/linux/kallsyms.h:13,
                    from include/linux/ftrace.h:11,
                    from include/linux/perf_event.h:49,
                    from include/kvm/arm_pmu.h:10,
                    from arch/arm64/include/asm/kvm_host.h:36,
                    from include/linux/kvm_host.h:36,
                    from arch/arm64/kernel/asm-offsets.c:14:
   include/linux/kmod.h:30:19: error: invalid storage class for function 'r=
equest_module'
    static inline int request_module(const char *name, ...) { return -ENOSY=
S; }
                      ^~~~~~~~~~~~~~
   include/linux/kmod.h:31:19: error: invalid storage class for function 'r=
equest_module_nowait'
    static inline int request_module_nowait(const char *name, ...) { return=
 -ENOSYS; }
                      ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/module.h:18:0,
                    from include/linux/kallsyms.h:13,
                    from include/linux/ftrace.h:11,
                    from include/linux/perf_event.h:49,
                    from include/kvm/arm_pmu.h:10,
                    from arch/arm64/include/asm/kvm_host.h:36,
                    from include/linux/kvm_host.h:36,
                    from arch/arm64/kernel/asm-offsets.c:14:
   include/linux/elf.h:53:19: error: invalid storage class for function 'el=
f_coredump_extra_notes_size'
    static inline int elf_coredump_extra_notes_size(void) { return 0; }
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/elf.h:54:19: error: invalid storage class for function 'el=
f_coredump_extra_notes_write'
    static inline int elf_coredump_extra_notes_write(struct coredump_params=
 *cprm) { return 0; }
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/module.h:21:0,
                    from include/linux/kallsyms.h:13,
                    from include/linux/ftrace.h:11,
                    from include/linux/perf_event.h:49,
                    from include/kvm/arm_pmu.h:10,
                    from arch/arm64/include/asm/kvm_host.h:36,
                    from include/linux/kvm_host.h:36,
                    from arch/arm64/kernel/asm-offsets.c:14:
   include/linux/moduleparam.h:307:20: error: invalid storage class for fun=
ction 'kernel_param_lock'
    static inline void kernel_param_lock(struct module *mod)
                       ^~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:310:20: error: invalid storage class for fun=
ction 'kernel_param_unlock'
    static inline void kernel_param_unlock(struct module *mod)
                       ^~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:399:20: error: invalid storage class for fun=
ction 'destroy_params'
    static inline void destroy_params(const struct kernel_param *params,
                       ^~~~~~~~~~~~~~
   include/linux/moduleparam.h:597:19: error: invalid storage class for fun=
ction 'module_param_sysfs_setup'
    static inline int module_param_sysfs_setup(struct module *mod,
                      ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:604:20: error: invalid storage class for fun=
ction 'module_param_sysfs_remove'
    static inline void module_param_sysfs_remove(struct module *mod)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/module.h:24:0,
                    from include/linux/kallsyms.h:13,
                    from include/linux/ftrace.h:11,
                    from include/linux/perf_event.h:49,
                    from include/kvm/arm_pmu.h:10,
                    from arch/arm64/include/asm/kvm_host.h:36,
                    from include/linux/kvm_host.h:36,
                    from arch/arm64/kernel/asm-offsets.c:14:
   include/linux/rbtree_latch.h:70:1: error: invalid storage class for func=
tion '__lt_from_rb'
    __lt_from_rb(struct rb_node *node, int idx)
    ^~~~~~~~~~~~
   include/linux/rbtree_latch.h:76:1: error: invalid storage class for func=
tion '__lt_insert'
    __lt_insert(struct latch_tree_node *ltn, struct latch_tree_root *ltr, i=
nt idx,
    ^~~~~~~~~~~
   include/linux/rbtree_latch.h:100:1: error: invalid storage class for fun=
ction '__lt_erase'
    __lt_erase(struct latch_tree_node *ltn, struct latch_tree_root *ltr, in=
t idx)
    ^~~~~~~~~~
   include/linux/rbtree_latch.h:106:1: error: invalid storage class for fun=
ction '__lt_find'
    __lt_find(void *key, struct latch_tree_root *ltr, int idx,
    ^~~~~~~~~
   include/linux/rbtree_latch.h:144:1: error: invalid storage class for fun=
ction 'latch_tree_insert'
    latch_tree_insert(struct latch_tree_node *node,
    ^~~~~~~~~~~~~~~~~
   include/linux/rbtree_latch.h:171:1: error: invalid storage class for fun=
ction 'latch_tree_erase'
    latch_tree_erase(struct latch_tree_node *node,
    ^~~~~~~~~~~~~~~~
   include/linux/rbtree_latch.h:200:1: error: invalid storage class for fun=
ction 'latch_tree_find'
    latch_tree_find(void *key, struct latch_tree_root *root,
    ^~~~~~~~~~~~~~~
   In file included from include/linux/error-injection.h:6:0,
                    from include/linux/module.h:25,
                    from include/linux/kallsyms.h:13,
                    from include/linux/ftrace.h:11,
                    from include/linux/perf_event.h:49,
                    from include/kvm/arm_pmu.h:10,
                    from arch/arm64/include/asm/kvm_host.h:36,
                    from include/linux/kvm_host.h:36,
                    from arch/arm64/kernel/asm-offsets.c:14:
   include/asm-generic/error-injection.h:38:20: error: invalid storage clas=
s for function 'override_function_with_return'
    static inline void override_function_with_return(struct pt_regs *regs) =
{ }
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/module.h:25:0,
                    from include/linux/kallsyms.h:13,
                    from include/linux/ftrace.h:11,

vim +/BUILD_BUG_ON +173 arch/arm64/include/asm/arch_gicv3.h

3f1f3234bc2db1 Julien Thierry        2019-01-31  153  =

3f1f3234bc2db1 Julien Thierry        2019-01-31  154  static inline void gi=
c_pmr_mask_irqs(void)
3f1f3234bc2db1 Julien Thierry        2019-01-31  155  {
2badfbbf7363ec Mark Rutland          2020-01-17 @156  	BUILD_BUG_ON(GICD_IN=
T_DEF_PRI < (GIC_PRIO_IRQOFF);
bd82d4bd21880b Julien Thierry        2019-06-11  157  	BUILD_BUG_ON(GICD_IN=
T_DEF_PRI >=3D GIC_PRIO_IRQON);
677379bc9139ac Julien Thierry        2019-07-29  158  	/*
677379bc9139ac Julien Thierry        2019-07-29  159  	 * Need to make sure=
 IRQON allows IRQs when SCR_EL3.FIQ is cleared
677379bc9139ac Julien Thierry        2019-07-29  160  	 * and non-secure PM=
R accesses are not subject to the shifts that
677379bc9139ac Julien Thierry        2019-07-29  161  	 * are applied to IR=
Q priorities
677379bc9139ac Julien Thierry        2019-07-29  162  	 */
677379bc9139ac Julien Thierry        2019-07-29  163  	BUILD_BUG_ON((0x80 |=
 (GICD_INT_DEF_PRI >> 1)) >=3D GIC_PRIO_IRQON);
b334481ab76b2a Julien Thierry        2019-01-31  164  	gic_write_pmr(GIC_PR=
IO_IRQOFF);
3f1f3234bc2db1 Julien Thierry        2019-01-31  165  }
3f1f3234bc2db1 Julien Thierry        2019-01-31  166  =

3f1f3234bc2db1 Julien Thierry        2019-01-31  167  static inline void gi=
c_arch_enable_irqs(void)
3f1f3234bc2db1 Julien Thierry        2019-01-31  168  {
b334481ab76b2a Julien Thierry        2019-01-31  169  	asm volatile ("msr d=
aifclr, #2" : : : "memory");
3f1f3234bc2db1 Julien Thierry        2019-01-31  170  }
3f1f3234bc2db1 Julien Thierry        2019-01-31  171  =

7936e914f7b082 Jean-Philippe Brucker 2015-10-01  172  #endif /* __ASSEMBLY_=
_ */
7936e914f7b082 Jean-Philippe Brucker 2015-10-01 @173  #endif /* __ASM_ARCH_=
GICV3_H */

:::::: The code at line 173 was first introduced by commit
:::::: 7936e914f7b0827c2dcfe63fbefdc21de2d61dcb irqchip/gic-v3: Refactor th=
e arm64 specific parts

:::::: TO: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3125537036794569934==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
PBwmp8nzaCvvxX//lDYhTXgAAA==
--===============3125537036794569934==--

