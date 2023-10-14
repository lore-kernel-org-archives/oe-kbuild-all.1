Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2342E1F5F3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 20:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KszRhbqa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697314663; x=1728850663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AaK7dvBFBw2S/drvhqDLXdutQNPgD2Iw8/l31E9B2wY=;
  b=KszRhbqas5+WSB8SDnHwljHxWbUbhDpFdeU0sfNdugGOebqbOUrUTG+V
   HGXXVKMDAsn9WnKJkI5YTl/016JsNiTQxxVPv0v/x4TIAeyenSidCFX0T
   R9JAX72XmoRNaXuWHsnWSqiCHr2KwyCi+2J5ytWCIvu9sAgHvbyZeyogt
   GzlH0qh/Ml91VYTQO6kiPQW5xLXHHOVpzO8S2M9Q79BuO1rL8ge39UgP0
   kwgvpm6LpIWxqRCaFBR4DR4a30BMSuvxTMBlhR9MixAanMnpH60E9sH3O
   ub8Lklf5Oxbf0E40Tr7pe4jBDFCDK93iHlruOdFMsVBJq00MCXHmI1by/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385186132"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="385186132"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 13:17:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="898953022"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="898953022"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2023 13:15:45 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrl4q-0006bt-2Y;
	Sat, 14 Oct 2023 20:17:36 +0000
Date: Sun, 15 Oct 2023 04:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 3/5] include/linux/mm.h:3346:53:
 warning: unused parameter 'anon_name'
Message-ID: <202310150428.LjRXEJEk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   8a0ac15c3162cd3792293d0848bde875b44e48d5
commit: 0fd37220d859184c035692422ae1b5bc28a91504 [3/5] UPSTREAM: mm: refactor vm_area_struct::anon_vma_name usage code
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231015/202310150428.LjRXEJEk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150428.LjRXEJEk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150428.LjRXEJEk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:757:
   include/linux/huge_mm.h:306:43: warning: unused parameter 'pud' [-Wunused-parameter]
   static inline bool is_huge_zero_pud(pud_t pud)
                                             ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   include/linux/mm.h:1566:52: warning: unused parameter 'page' [-Wunused-parameter]
   static inline u8 page_kasan_tag(const struct page *page)
                                                      ^
   include/linux/mm.h:1571:52: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void page_kasan_tag_set(struct page *page, u8 tag) { }
                                                      ^
   include/linux/mm.h:1571:61: warning: unused parameter 'tag' [-Wunused-parameter]
   static inline void page_kasan_tag_set(struct page *page, u8 tag) { }
                                                               ^
   include/linux/mm.h:1572:54: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void page_kasan_tag_reset(struct page *page) { }
                                                        ^
   include/linux/mm.h:1626:36: warning: unused parameter 'pfn' [-Wunused-parameter]
           unsigned long node, unsigned long pfn)
                                             ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:1638:
   include/linux/vmstat.h:138:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_online_cpu(cpu)
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:789:36: note: expanded from macro 'for_each_online_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:9: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                    ~~~  ^ ~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:1638:
   include/linux/vmstat.h:326:15: warning: unused parameter 'migratetype' [-Wunused-parameter]
                                                int migratetype)
                                                    ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   include/linux/mm.h:2236:46: warning: unused parameter 'page' [-Wunused-parameter]
   static inline bool ptlock_alloc(struct page *page)
                                                ^
   include/linux/mm.h:2241:45: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void ptlock_free(struct page *page)
                                               ^
   include/linux/mm.h:2251:57: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
                                                           ^
   include/linux/mm.h:2342:57: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
                                                           ^
   include/linux/mm.h:2408:68: warning: unused parameter 'pud' [-Wunused-parameter]
   static inline spinlock_t *pud_lockptr(struct mm_struct *mm, pud_t *pud)
                                                                      ^
   include/linux/mm.h:3023:55: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void __kernel_poison_pages(struct page *page, int nunmpages) { }
                                                         ^
   include/linux/mm.h:3023:65: warning: unused parameter 'nunmpages' [-Wunused-parameter]
   static inline void __kernel_poison_pages(struct page *page, int nunmpages) { }
                                                                   ^
   include/linux/mm.h:3024:53: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void kernel_poison_pages(struct page *page, int numpages) { }
                                                       ^
   include/linux/mm.h:3024:63: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void kernel_poison_pages(struct page *page, int numpages) { }
                                                                 ^
   include/linux/mm.h:3025:55: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void kernel_unpoison_pages(struct page *page, int numpages) { }
                                                         ^
   include/linux/mm.h:3025:65: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void kernel_unpoison_pages(struct page *page, int numpages) { }
                                                                   ^
   include/linux/mm.h:3084:59: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void debug_pagealloc_map_pages(struct page *page, int numpages) {}
                                                             ^
   include/linux/mm.h:3084:69: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void debug_pagealloc_map_pages(struct page *page, int numpages) {}
                                                                       ^
   include/linux/mm.h:3085:61: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void debug_pagealloc_unmap_pages(struct page *page, int numpages) {}
                                                               ^
   include/linux/mm.h:3085:71: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void debug_pagealloc_unmap_pages(struct page *page, int numpages) {}
                                                                         ^
   include/linux/mm.h:3269:47: warning: unused parameter 'page' [-Wunused-parameter]
   static inline bool page_is_guard(struct page *page) { return false; }
                                                 ^
   include/linux/mm.h:3345:41: warning: unused parameter 'mm' [-Wunused-parameter]
   madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
                                           ^
   include/linux/mm.h:3345:59: warning: unused parameter 'start' [-Wunused-parameter]
   madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
                                                             ^
   include/linux/mm.h:3346:23: warning: unused parameter 'len_in' [-Wunused-parameter]
                         unsigned long len_in, struct anon_vma_name *anon_name) {
                                       ^
>> include/linux/mm.h:3346:53: warning: unused parameter 'anon_name' [-Wunused-parameter]
                         unsigned long len_in, struct anon_vma_name *anon_name) {
                                                                     ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   include/linux/vtime.h:41:58: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void vtime_account_irq(struct task_struct *tsk, unsigned int offset) { }
                                                            ^
   include/linux/vtime.h:41:76: warning: unused parameter 'offset' [-Wunused-parameter]
   static inline void vtime_account_irq(struct task_struct *tsk, unsigned int offset) { }
                                                                              ^
   include/linux/vtime.h:42:62: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void vtime_account_softirq(struct task_struct *tsk) { }
                                                                ^
   include/linux/vtime.h:43:62: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void vtime_account_hardirq(struct task_struct *tsk) { }
                                                                ^
   include/linux/vtime.h:44:52: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void vtime_flush(struct task_struct *tsk) { }
                                                      ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/x86/include/asm/sections.h:7:
   include/asm-generic/sections.h:70:53: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline int arch_is_kernel_text(unsigned long addr)
                                                       ^
   include/asm-generic/sections.h:77:53: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline int arch_is_kernel_data(unsigned long addr)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   In file included from include/linux/pci.h:38:
   include/linux/interrupt.h:416:88: warning: unused parameter 'flags' [-Wunused-parameter]
   static inline void disable_irq_nosync_lockdep_irqsave(unsigned int irq, unsigned long *flags)
                                                                                          ^
   include/linux/interrupt.h:440:83: warning: unused parameter 'flags' [-Wunused-parameter]
   static inline void enable_irq_lockdep_irqrestore(unsigned int irq, unsigned long *flags)
                                                                                     ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   include/linux/pci.h:1606:58: warning: unused parameter 'd' [-Wunused-parameter]
   static inline int pci_irqd_intx_xlate(struct irq_domain *d,
                                                            ^
   include/linux/pci.h:1607:31: warning: unused parameter 'node' [-Wunused-parameter]
                                         struct device_node *node,
                                                             ^
   include/linux/pci.h:1609:24: warning: unused parameter 'intsize' [-Wunused-parameter]
                                         unsigned int intsize,
                                                      ^
   include/linux/pci.h:1611:25: warning: unused parameter 'out_type' [-Wunused-parameter]
                                         unsigned int *out_type)
                                                       ^
   include/linux/pci.h:1666:50: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline int pci_enable_ptm(struct pci_dev *dev, u8 *granularity)
                                                    ^
   include/linux/pci.h:1666:59: warning: unused parameter 'granularity' [-Wunused-parameter]
   static inline int pci_enable_ptm(struct pci_dev *dev, u8 *granularity)
                                                             ^
   include/linux/pci.h:1668:53: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline bool pcie_ptm_enabled(struct pci_dev *dev)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   In file included from include/linux/pci.h:1890:
   In file included from arch/x86/include/asm/pci.h:109:
   include/asm-generic/pci.h:11:58: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
                                                            ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   include/linux/pci.h:2360:47: warning: unused parameter 'bus' [-Wunused-parameter]
   pci_host_bridge_of_msi_domain(struct pci_bus *bus) { return NULL; }
                                                 ^
   include/linux/pci.h:2361:59: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline bool pci_host_of_has_msi_map(struct device *dev) { return false; }
                                                             ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   In file included from include/linux/pci.h:2452:
   In file included from include/linux/pci-dma-compat.h:8:
   include/linux/dma-mapping.h:100:59: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline void debug_dma_mapping_error(struct device *dev,
                                                             ^
   include/linux/dma-mapping.h:101:14: warning: unused parameter 'dma_addr' [-Wunused-parameter]
                   dma_addr_t dma_addr)
                              ^
   include/linux/dma-mapping.h:104:56: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline void debug_dma_map_single(struct device *dev, const void *addr,
                                                          ^
   include/linux/dma-mapping.h:104:73: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void debug_dma_map_single(struct device *dev, const void *addr,
                                                                           ^
   include/linux/dma-mapping.h:105:17: warning: unused parameter 'len' [-Wunused-parameter]
                   unsigned long len)
                                 ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:39:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:29:
   In file included from include/linux/ftrace.h:10:
   include/linux/trace_recursion.h:142:71: warning: unused parameter 'ip' [-Wunused-parameter]
   static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsigned long pip,
--
   In file included from include/linux/cgroup.h:28:
   In file included from include/linux/cgroup-defs.h:22:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1638:
   include/linux/vmstat.h:138:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_online_cpu(cpu)
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:789:36: note: expanded from macro 'for_each_online_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:9: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                    ~~~  ^ ~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:28:
   In file included from include/linux/cgroup-defs.h:22:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1638:
   include/linux/vmstat.h:326:15: warning: unused parameter 'migratetype' [-Wunused-parameter]
                                                int migratetype)
                                                    ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:28:
   In file included from include/linux/cgroup-defs.h:22:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   include/linux/mm.h:2236:46: warning: unused parameter 'page' [-Wunused-parameter]
   static inline bool ptlock_alloc(struct page *page)
                                                ^
   include/linux/mm.h:2241:45: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void ptlock_free(struct page *page)
                                               ^
   include/linux/mm.h:2251:57: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
                                                           ^
   include/linux/mm.h:2342:57: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
                                                           ^
   include/linux/mm.h:2408:68: warning: unused parameter 'pud' [-Wunused-parameter]
   static inline spinlock_t *pud_lockptr(struct mm_struct *mm, pud_t *pud)
                                                                      ^
   include/linux/mm.h:3023:55: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void __kernel_poison_pages(struct page *page, int nunmpages) { }
                                                         ^
   include/linux/mm.h:3023:65: warning: unused parameter 'nunmpages' [-Wunused-parameter]
   static inline void __kernel_poison_pages(struct page *page, int nunmpages) { }
                                                                   ^
   include/linux/mm.h:3024:53: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void kernel_poison_pages(struct page *page, int numpages) { }
                                                       ^
   include/linux/mm.h:3024:63: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void kernel_poison_pages(struct page *page, int numpages) { }
                                                                 ^
   include/linux/mm.h:3025:55: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void kernel_unpoison_pages(struct page *page, int numpages) { }
                                                         ^
   include/linux/mm.h:3025:65: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void kernel_unpoison_pages(struct page *page, int numpages) { }
                                                                   ^
   include/linux/mm.h:3084:59: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void debug_pagealloc_map_pages(struct page *page, int numpages) {}
                                                             ^
   include/linux/mm.h:3084:69: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void debug_pagealloc_map_pages(struct page *page, int numpages) {}
                                                                       ^
   include/linux/mm.h:3085:61: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void debug_pagealloc_unmap_pages(struct page *page, int numpages) {}
                                                               ^
   include/linux/mm.h:3085:71: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void debug_pagealloc_unmap_pages(struct page *page, int numpages) {}
                                                                         ^
   include/linux/mm.h:3269:47: warning: unused parameter 'page' [-Wunused-parameter]
   static inline bool page_is_guard(struct page *page) { return false; }
                                                 ^
   include/linux/mm.h:3345:41: warning: unused parameter 'mm' [-Wunused-parameter]
   madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
                                           ^
   include/linux/mm.h:3345:59: warning: unused parameter 'start' [-Wunused-parameter]
   madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
                                                             ^
   include/linux/mm.h:3346:23: warning: unused parameter 'len_in' [-Wunused-parameter]
                         unsigned long len_in, struct anon_vma_name *anon_name) {
                                       ^
>> include/linux/mm.h:3346:53: warning: unused parameter 'anon_name' [-Wunused-parameter]
                         unsigned long len_in, struct anon_vma_name *anon_name) {
                                                                     ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:28:
   In file included from include/linux/cgroup-defs.h:22:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:22:
   include/linux/sched/mm.h:182:55: warning: unused parameter 'ip' [-Wunused-parameter]
   static inline void __fs_reclaim_acquire(unsigned long ip) { }
                                                         ^
   include/linux/sched/mm.h:183:55: warning: unused parameter 'ip' [-Wunused-parameter]
   static inline void __fs_reclaim_release(unsigned long ip) { }
                                                         ^
   include/linux/sched/mm.h:184:45: warning: unused parameter 'gfp_mask' [-Wunused-parameter]
   static inline void fs_reclaim_acquire(gfp_t gfp_mask) { }
                                               ^
   include/linux/sched/mm.h:185:45: warning: unused parameter 'gfp_mask' [-Wunused-parameter]
   static inline void fs_reclaim_release(gfp_t gfp_mask) { }
                                               ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:28:
   include/linux/cgroup-defs.h:720:72: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void cgroup_threadgroup_change_begin(struct task_struct *tsk)
                                                                          ^
   include/linux/cgroup-defs.h:731:70: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void cgroup_threadgroup_change_end(struct task_struct *tsk)
                                                                        ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from arch/x86/include/asm/cacheflush.h:8:
   include/asm-generic/cacheflush.h:21:53: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline void flush_cache_mm(struct mm_struct *mm)
                                                       ^
   include/asm-generic/cacheflush.h:27:57: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline void flush_cache_dup_mm(struct mm_struct *mm)
                                                           ^
   include/asm-generic/cacheflush.h:33:61: warning: unused parameter 'vma' [-Wunused-parameter]
   static inline void flush_cache_range(struct vm_area_struct *vma,
                                                               ^
   include/asm-generic/cacheflush.h:34:24: warning: unused parameter 'start' [-Wunused-parameter]
                                        unsigned long start,
                                                      ^
   include/asm-generic/cacheflush.h:35:24: warning: unused parameter 'end' [-Wunused-parameter]
                                        unsigned long end)
                                                      ^
   include/asm-generic/cacheflush.h:41:60: warning: unused parameter 'vma' [-Wunused-parameter]
   static inline void flush_cache_page(struct vm_area_struct *vma,
                                                              ^
   include/asm-generic/cacheflush.h:42:23: warning: unused parameter 'vmaddr' [-Wunused-parameter]
                                       unsigned long vmaddr,
                                                     ^
   include/asm-generic/cacheflush.h:43:23: warning: unused parameter 'pfn' [-Wunused-parameter]
                                       unsigned long pfn)
                                                     ^
   include/asm-generic/cacheflush.h:49:51: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void flush_dcache_page(struct page *page)
                                                     ^
   include/asm-generic/cacheflush.h:57:65: warning: unused parameter 'mapping' [-Wunused-parameter]
   static inline void flush_dcache_mmap_lock(struct address_space *mapping)
                                                                   ^
   include/asm-generic/cacheflush.h:63:67: warning: unused parameter 'mapping' [-Wunused-parameter]
   static inline void flush_dcache_mmap_unlock(struct address_space *mapping)
                                                                     ^
   include/asm-generic/cacheflush.h:69:53: warning: unused parameter 'start' [-Wunused-parameter]
   static inline void flush_icache_range(unsigned long start, unsigned long end)
                                                       ^
   include/asm-generic/cacheflush.h:69:74: warning: unused parameter 'end' [-Wunused-parameter]
   static inline void flush_icache_range(unsigned long start, unsigned long end)
                                                                            ^
   include/asm-generic/cacheflush.h:79:61: warning: unused parameter 'vma' [-Wunused-parameter]
   static inline void flush_icache_page(struct vm_area_struct *vma,
                                                               ^
   include/asm-generic/cacheflush.h:80:23: warning: unused parameter 'page' [-Wunused-parameter]
                                        struct page *page)
                                                     ^
   include/asm-generic/cacheflush.h:86:66: warning: unused parameter 'vma' [-Wunused-parameter]
   static inline void flush_icache_user_page(struct vm_area_struct *vma,
                                                                    ^
   include/asm-generic/cacheflush.h:87:22: warning: unused parameter 'page' [-Wunused-parameter]
..


vim +/anon_name +3346 include/linux/mm.h

  3338	
  3339	#ifdef CONFIG_ANON_VMA_NAME
  3340	int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
  3341				  unsigned long len_in,
  3342				  struct anon_vma_name *anon_name);
  3343	#else
  3344	static inline int
> 3345	madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> 3346			      unsigned long len_in, struct anon_vma_name *anon_name) {
  3347		return 0;
  3348	}
  3349	#endif
  3350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
