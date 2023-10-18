Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD12A15AD8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mE4PYyqH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697640184; x=1729176184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NatmcgYfCyNzaJd9l+Qls1znWKQIVrZP49EwhvqQ1XI=;
  b=mE4PYyqH7W2xILAsauhfwuZ2dvPfLBQcBrQhA57kOQbjTy9GJXGKZTou
   gTAf/qY7i9iYnRKhBumSCjGG1F9GQyaSPku5Nfdx/NlwQomPV/3S0H57/
   kvZ9+0b+iFMbPjMm0BjZdIcfcTn9YotUCdiThy22rvJJlhsYREBkqwoLf
   N/UwGgpdSdwtUJB2ZLDWKf1akLSKMtCC6lmEwTOTS66oRJT1ZAjUTe5A0
   QidAY3N4MrAQNapZ196x2plHiaHVORYrK1/Wz3s1hvPdGiCARQ9DwDhT9
   kSNQjzq02iMM9eWvrZ+0CZbKJmhwD8Z/pgZ7XX0jBRAM508e6IKlMmg45
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="472252940"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="472252940"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 07:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="785951704"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="785951704"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Oct 2023 07:43:01 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt7lD-0000Wb-04;
	Wed, 18 Oct 2023 14:42:59 +0000
Date: Wed, 18 Oct 2023 22:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 291/29113]
 include/linux/arch_topology.h:39:64: warning: unused parameter 'sd'
Message-ID: <202310182235.uFnV9DnK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   c8eebb1ab1c0d8d550ddcd3197172b2e86e62e1c
commit: 0cfe39fe403ea6dbe2fdfb38edd36022b35d4d66 [291/29113] ANDROID: cpufreq: arch_topology: implement max frequency capping
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231018/202310182235.uFnV9DnK-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310182235.uFnV9DnK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310182235.uFnV9DnK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/numa.h:7:
   arch/x86/include/asm/topology.h:156:49: warning: unused parameter 'num' [-Wunused-parameter]
   static inline void arch_fix_phys_package_id(int num, u32 slot)
                                                   ^
   arch/x86/include/asm/topology.h:156:58: warning: unused parameter 'slot' [-Wunused-parameter]
   static inline void arch_fix_phys_package_id(int num, u32 slot)
                                                            ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:18:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:972:
   In file included from arch/x86/include/asm/mmzone.h:5:
   In file included from arch/x86/include/asm/mmzone_64.h:11:
   In file included from arch/x86/include/asm/smp.h:13:
   In file included from arch/x86/include/asm/apic.h:11:
   In file included from arch/x86/include/asm/fixmap.h:29:
   arch/x86/include/asm/acpi.h:166:64: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
                                                                  ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:18:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:972:
   In file included from arch/x86/include/asm/mmzone.h:5:
   In file included from arch/x86/include/asm/mmzone_64.h:11:
   In file included from arch/x86/include/asm/smp.h:13:
   arch/x86/include/asm/apic.h:151:51: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline int apic_force_enable(unsigned long addr)
                                                     ^
   arch/x86/include/asm/apic.h:217:50: warning: unused parameter 'reg' [-Wunused-parameter]
   static inline void native_apic_msr_eoi_write(u32 reg, u32 v)
                                                    ^
   arch/x86/include/asm/apic.h:217:59: warning: unused parameter 'v' [-Wunused-parameter]
   static inline void native_apic_msr_eoi_write(u32 reg, u32 v)
                                                             ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:18:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:1043:44: warning: comparison of integers of different signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:18:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:1447:54: warning: unused parameter 'pfn' [-Wunused-parameter]
   static inline bool memmap_valid_within(unsigned long pfn,
                                                        ^
   include/linux/mmzone.h:1448:19: warning: unused parameter 'page' [-Wunused-parameter]
                                           struct page *page, struct zone *zone)
                                                        ^
   include/linux/mmzone.h:1448:38: warning: unused parameter 'zone' [-Wunused-parameter]
                                           struct page *page, struct zone *zone)
                                                                           ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:18:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:9:
   In file included from include/linux/topology.h:30:
>> include/linux/arch_topology.h:39:64: warning: unused parameter 'sd' [-Wunused-parameter]
   unsigned long topology_get_max_freq_scale(struct sched_domain *sd, int cpu)
                                                                  ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:18:
   In file included from include/linux/xarray.h:14:
   include/linux/gfp.h:460:48: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void arch_free_page(struct page *page, int order) { }
                                                  ^
   include/linux/gfp.h:460:58: warning: unused parameter 'order' [-Wunused-parameter]
   static inline void arch_free_page(struct page *page, int order) { }
                                                            ^
   include/linux/gfp.h:463:49: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void arch_alloc_page(struct page *page, int order) { }
                                                   ^
   include/linux/gfp.h:463:59: warning: unused parameter 'order' [-Wunused-parameter]
   static inline void arch_alloc_page(struct page *page, int order) { }
                                                             ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:18:
   include/linux/xarray.h:1141:51: warning: unused parameter 'xa' [-Wunused-parameter]
   static inline void *xa_entry(const struct xarray *xa,
                                                     ^
   include/linux/xarray.h:1150:58: warning: unused parameter 'xa' [-Wunused-parameter]
   static inline void *xa_entry_locked(const struct xarray *xa,
                                                            ^
   include/linux/xarray.h:1159:62: warning: unused parameter 'xa' [-Wunused-parameter]
   static inline struct xa_node *xa_parent(const struct xarray *xa,
                                                                ^
   include/linux/xarray.h:1167:69: warning: unused parameter 'xa' [-Wunused-parameter]
   static inline struct xa_node *xa_parent_locked(const struct xarray *xa,
                                                                       ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/idr.h:15:
   include/linux/radix-tree.h:180:20: warning: unused parameter 'treelock' [-Wunused-parameter]
                                                           spinlock_t *treelock)
                                                                       ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   include/linux/of.h:129:52: warning: unused parameter 'node' [-Wunused-parameter]
   static inline void of_node_put(struct device_node *node) { }
                                                      ^
   include/linux/of.h:565:59: warning: unused parameter 'fwnode' [-Wunused-parameter]
   static inline bool is_of_node(const struct fwnode_handle *fwnode)
                                                             ^
   include/linux/of.h:570:74: warning: unused parameter 'fwnode' [-Wunused-parameter]
   static inline struct device_node *to_of_node(const struct fwnode_handle *fwnode)
                                                                            ^
   include/linux/of.h:575:62: warning: unused parameter 'np' [-Wunused-parameter]
   static inline bool of_node_name_eq(const struct device_node *np, const char *name)
                                                                ^
   include/linux/of.h:575:78: warning: unused parameter 'name' [-Wunused-parameter]
   static inline bool of_node_name_eq(const struct device_node *np, const char *name)
                                                                                ^
   include/linux/of.h:580:66: warning: unused parameter 'np' [-Wunused-parameter]
   static inline bool of_node_name_prefix(const struct device_node *np, const char *prefix)
                                                                    ^
   include/linux/of.h:580:82: warning: unused parameter 'prefix' [-Wunused-parameter]
   static inline bool of_node_name_prefix(const struct device_node *np, const char *prefix)
                                                                                    ^
   include/linux/of.h:585:71: warning: unused parameter 'np' [-Wunused-parameter]
   static inline const char* of_node_full_name(const struct device_node *np)
                                                                         ^
   include/linux/of.h:590:76: warning: unused parameter 'from' [-Wunused-parameter]
   static inline struct device_node *of_find_node_by_name(struct device_node *from,
                                                                              ^
   include/linux/of.h:591:14: warning: unused parameter 'name' [-Wunused-parameter]
           const char *name)
                       ^
   include/linux/of.h:596:76: warning: unused parameter 'from' [-Wunused-parameter]
   static inline struct device_node *of_find_node_by_type(struct device_node *from,
                                                                              ^
   include/linux/of.h:597:14: warning: unused parameter 'type' [-Wunused-parameter]
           const char *type)
                       ^
   include/linux/of.h:603:22: warning: unused parameter 'from' [-Wunused-parameter]
           struct device_node *from,
                               ^
   include/linux/of.h:604:29: warning: unused parameter 'matches' [-Wunused-parameter]
           const struct of_device_id *matches,
--
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:91:65: warning: unused parameter 'ssp' [-Wunused-parameter]
   static inline int srcu_read_lock_held(const struct srcu_struct *ssp)
                                                                   ^
   In file included from drivers/gpu/drm/i915/i915_irq.c:32:
   In file included from include/linux/cpuidle.h:14:
   In file included from include/linux/percpu.h:7:
   In file included from include/linux/smp.h:68:
   In file included from arch/x86/include/asm/smp.h:13:
   arch/x86/include/asm/apic.h:151:51: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline int apic_force_enable(unsigned long addr)
                                                     ^
   arch/x86/include/asm/apic.h:217:50: warning: unused parameter 'reg' [-Wunused-parameter]
   static inline void native_apic_msr_eoi_write(u32 reg, u32 v)
                                                    ^
   arch/x86/include/asm/apic.h:217:59: warning: unused parameter 'v' [-Wunused-parameter]
   static inline void native_apic_msr_eoi_write(u32 reg, u32 v)
                                                             ^
   In file included from drivers/gpu/drm/i915/i915_irq.c:32:
   In file included from include/linux/cpuidle.h:16:
   include/linux/hrtimer.h:366:64: warning: unused parameter 'timer' [-Wunused-parameter]
   static inline void hrtimer_cancel_wait_running(struct hrtimer *timer)
                                                                  ^
   include/linux/hrtimer.h:403:61: warning: unused parameter 'timer' [-Wunused-parameter]
   static inline void destroy_hrtimer_on_stack(struct hrtimer *timer) { }
                                                               ^
   In file included from drivers/gpu/drm/i915/i915_irq.c:32:
   include/linux/cpuidle.h:230:76: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline void cpuidle_coupled_parallel_barrier(struct cpuidle_device *dev, atomic_t *a)
                                                                              ^
   include/linux/cpuidle.h:230:91: warning: unused parameter 'a' [-Wunused-parameter]
   static inline void cpuidle_coupled_parallel_barrier(struct cpuidle_device *dev, atomic_t *a)
                                                                                             ^
   In file included from drivers/gpu/drm/i915/i915_irq.c:33:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:22:
   include/linux/page-flags.h:194:21: warning: comparison of integers of different signs: 'const unsigned long' and 'long' [-Wsign-compare]
           return page->flags == PAGE_POISON_PATTERN;
                  ~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:200:50: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void page_init_poison(struct page *page, size_t size)
                                                    ^
   include/linux/page-flags.h:200:63: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void page_init_poison(struct page *page, size_t size)
                                                                 ^
   include/linux/page-flags.h:376:1: warning: unused parameter 'page' [-Wunused-parameter]
   PAGEFLAG_FALSE(HighMem)
   ^
   include/linux/page-flags.h:306:31: note: expanded from macro 'PAGEFLAG_FALSE'
   #define PAGEFLAG_FALSE(uname) TESTPAGEFLAG_FALSE(uname)                 \
                                 ^
   include/linux/page-flags.h:289:50: note: expanded from macro 'TESTPAGEFLAG_FALSE'
   static inline int Page##uname(const struct page *page) { return 0; }
                                                    ^
   include/linux/page-flags.h:376:1: warning: unused parameter 'page' [-Wunused-parameter]
   include/linux/page-flags.h:307:2: note: expanded from macro 'PAGEFLAG_FALSE'
           SETPAGEFLAG_NOOP(uname) CLEARPAGEFLAG_NOOP(uname)
           ^
   include/linux/page-flags.h:292:48: note: expanded from macro 'SETPAGEFLAG_NOOP'
   static inline void SetPage##uname(struct page *page) {  }
                                                  ^
   include/linux/page-flags.h:376:1: warning: unused parameter 'page' [-Wunused-parameter]
   include/linux/page-flags.h:307:26: note: expanded from macro 'PAGEFLAG_FALSE'
           SETPAGEFLAG_NOOP(uname) CLEARPAGEFLAG_NOOP(uname)
                                   ^
   include/linux/page-flags.h:295:50: note: expanded from macro 'CLEARPAGEFLAG_NOOP'
   static inline void ClearPage##uname(struct page *page) {  }
                                                    ^
   In file included from drivers/gpu/drm/i915/i915_irq.c:33:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:916:49: warning: unused parameter 'idx' [-Wunused-parameter]
   static inline int is_highmem_idx(enum zone_type idx)
                                                   ^
   include/linux/mmzone.h:932:43: warning: unused parameter 'zone' [-Wunused-parameter]
   static inline int is_highmem(struct zone *zone)
                                             ^
   include/linux/mmzone.h:1043:44: warning: comparison of integers of different signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   In file included from drivers/gpu/drm/i915/i915_irq.c:33:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:1447:54: warning: unused parameter 'pfn' [-Wunused-parameter]
   static inline bool memmap_valid_within(unsigned long pfn,
                                                        ^
   include/linux/mmzone.h:1448:19: warning: unused parameter 'page' [-Wunused-parameter]
                                           struct page *page, struct zone *zone)
                                                        ^
   include/linux/mmzone.h:1448:38: warning: unused parameter 'zone' [-Wunused-parameter]
                                           struct page *page, struct zone *zone)
                                                                           ^
   In file included from drivers/gpu/drm/i915/i915_irq.c:33:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:9:
   In file included from include/linux/topology.h:30:
>> include/linux/arch_topology.h:39:64: warning: unused parameter 'sd' [-Wunused-parameter]
   unsigned long topology_get_max_freq_scale(struct sched_domain *sd, int cpu)
                                                                  ^
   In file included from drivers/gpu/drm/i915/i915_irq.c:33:
   In file included from include/linux/slab.h:15:
   include/linux/gfp.h:460:48: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void arch_free_page(struct page *page, int order) { }
                                                  ^
   include/linux/gfp.h:460:58: warning: unused parameter 'order' [-Wunused-parameter]
   static inline void arch_free_page(struct page *page, int order) { }
                                                            ^
   include/linux/gfp.h:463:49: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void arch_alloc_page(struct page *page, int order) { }
                                                   ^
   include/linux/gfp.h:463:59: warning: unused parameter 'order' [-Wunused-parameter]
   static inline void arch_alloc_page(struct page *page, int order) { }
                                                             ^
   In file included from drivers/gpu/drm/i915/i915_irq.c:33:
   In file included from include/linux/slab.h:19:
   include/linux/percpu-refcount.h:192:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
                   this_cpu_add(*percpu_count, nr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:510:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:381:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:239:1: note: expanded from here
   this_cpu_add_8
   ^
   arch/x86/include/asm/percpu.h:492:35: note: expanded from macro 'this_cpu_add_8'
   #define this_cpu_add_8(pcp, val)                percpu_add_op(volatile, (pcp), val)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:131:31: note: expanded from macro 'percpu_add_op'
                                 ((val) == 1 || (val) == -1)) ?            \
                                                 ~~~  ^  ~~
   In file included from drivers/gpu/drm/i915/i915_irq.c:33:
   In file included from include/linux/slab.h:19:
   include/linux/percpu-refcount.h:291:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
                   this_cpu_sub(*percpu_count, nr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:520:33: note: expanded from macro 'this_cpu_sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:510:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:381:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:41:1: note: expanded from here
   this_cpu_add_8
   ^
   arch/x86/include/asm/percpu.h:492:35: note: expanded from macro 'this_cpu_add_8'
   #define this_cpu_add_8(pcp, val)                percpu_add_op(volatile, (pcp), val)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:131:31: note: expanded from macro 'percpu_add_op'
                                 ((val) == 1 || (val) == -1)) ?            \
                                                 ~~~  ^  ~~
   In file included from drivers/gpu/drm/i915/i915_irq.c:33:
   In file included from include/linux/slab.h:136:
   include/linux/kasan.h:91:54: warning: unused parameter 'address' [-Wunused-parameter]
   static inline void kasan_unpoison_shadow(const void *address, size_t size) {}
                                                        ^
   include/linux/kasan.h:91:70: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void kasan_unpoison_shadow(const void *address, size_t size) {}
                                                                        ^
   include/linux/kasan.h:93:66: warning: unused parameter 'task' [-Wunused-parameter]
   static inline void kasan_unpoison_task_stack(struct task_struct *task) {}
                                                                    ^
   include/linux/kasan.h:94:65: warning: unused parameter 'watermark' [-Wunused-parameter]
   static inline void kasan_unpoison_stack_above_sp_to(const void *watermark) {}
                                                                   ^
   include/linux/kasan.h:99:51: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void kasan_alloc_pages(struct page *page, unsigned int order) {}
                                                     ^
   include/linux/kasan.h:99:70: warning: unused parameter 'order' [-Wunused-parameter]
   static inline void kasan_alloc_pages(struct page *page, unsigned int order) {}
                                                                        ^
   include/linux/kasan.h:100:50: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void kasan_free_pages(struct page *page, unsigned int order) {}
                                                    ^
   include/linux/kasan.h:100:69: warning: unused parameter 'order' [-Wunused-parameter]
   static inline void kasan_free_pages(struct page *page, unsigned int order) {}
                                                                       ^
   include/linux/kasan.h:102:58: warning: unused parameter 'cache' [-Wunused-parameter]
   static inline void kasan_cache_create(struct kmem_cache *cache,
                                                            ^
   include/linux/kasan.h:103:25: warning: unused parameter 'size' [-Wunused-parameter]
                                         unsigned int *size,
                                                       ^
   include/linux/kasan.h:104:25: warning: unused parameter 'flags' [-Wunused-parameter]
                                         slab_flags_t *flags) {}
                                                       ^
   include/linux/kasan.h:106:51: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void kasan_poison_slab(struct page *page) {}
                                                     ^
   include/linux/kasan.h:107:66: warning: unused parameter 'cache' [-Wunused-parameter]
   static inline void kasan_unpoison_object_data(struct kmem_cache *cache,
                                                                    ^
..


vim +/sd +39 include/linux/arch_topology.h

    37	
    38	static inline
  > 39	unsigned long topology_get_max_freq_scale(struct sched_domain *sd, int cpu)
    40	{
    41		return per_cpu(max_freq_scale, cpu);
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
