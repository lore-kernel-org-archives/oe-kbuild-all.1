Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC1B163
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 00:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yxl1xYnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697415676; x=1728951676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lrNqYnQEsGPtsKCQe8IbNf68h55hXBHIaB4rJBZU2oM=;
  b=Yxl1xYntVriht7hpmng04nCgqmbgcA7t77ynP3LBkGhODvuB7f4rjmzp
   7ntbuBgR8uMysvTsYuTEA9IIp45Pl7LSJc23e0YVMyPBROC7J/986glqy
   Ep0M2YwUh8mr8ipKgXWuJ/9lg6LGjd6CWk7WPqPO9Koyq+g7wc8HCYDNW
   O0iJG3AUJ5PhAQSjnxUXZ3enVA+qeV80dCAg3i56N3VEgaO74cMKP19wt
   /EGQerwApmFof0Rsk0Oo+v6isjR1ze4M7kjuHyVk4m4DORqAV27qKOLCn
   tY2GLrfFzQYHfpW0rys/cyK2lIsT8DU1AGsTJsDknTQ1jY0WPnW6ICP5v
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370497925"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="370497925"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 17:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="871879351"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="871879351"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2023 17:21:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsBM4-0007xH-1Y;
	Mon, 16 Oct 2023 00:21:08 +0000
Date: Mon, 16 Oct 2023 08:20:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 18943/23625]
 include/linux/uaccess.h:289:59: warning: unused parameter 'uaddr'
Message-ID: <202310160802.G8rF3OfQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   bfeb57ae959355c98e0f24329ed7eb646f53cf7e
commit: e4b506cb0aaf1f51041ad83d1c08bbb16db00434 [18943/23625] BACKPORT: mm: Add fault_in_subpage_writeable() to probe at sub-page granularity
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231016/202310160802.G8rF3OfQ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160802.G8rF3OfQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160802.G8rF3OfQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

                                                            u64 pfn, unsigned int max_page_shift)
                                                                ^
   include/linux/vmalloc.h:105:31: warning: unused parameter 'max_page_shift' [-Wunused-parameter]
                                                            u64 pfn, unsigned int max_page_shift)
                                                                                  ^
   include/linux/vmalloc.h:112:63: warning: unused parameter 'size' [-Wunused-parameter]
   static inline int arch_vmap_pte_supported_shift(unsigned long size)
                                                                 ^
   include/linux/vmalloc.h:219:53: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline bool is_vm_area_hugepages(const void *addr)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:35:
   In file included from include/acpi/acpi_io.h:7:
   arch/x86/include/asm/acpi.h:165:64: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
                                                                  ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   include/linux/acpi.h:175:57: warning: unused parameter 'owner' [-Wunused-parameter]
   static inline int acpi_register_debugger(struct module *owner,
                                                           ^
   include/linux/acpi.h:176:39: warning: unused parameter 'ops' [-Wunused-parameter]
                                            const struct acpi_debugger_ops *ops)
                                                                            ^
   include/linux/acpi.h:181:77: warning: unused parameter 'ops' [-Wunused-parameter]
   static inline void acpi_unregister_debugger(const struct acpi_debugger_ops *ops)
                                                                               ^
   include/linux/acpi.h:185:70: warning: unused parameter 'function' [-Wunused-parameter]
   static inline int acpi_debugger_create_thread(acpi_osd_exec_callback function,
                                                                        ^
   include/linux/acpi.h:186:18: warning: unused parameter 'context' [-Wunused-parameter]
                                                 void *context)
                                                       ^
   include/linux/acpi.h:191:55: warning: unused parameter 'msg' [-Wunused-parameter]
   static inline int acpi_debugger_write_log(const char *msg)
                                                         ^
   include/linux/acpi.h:196:48: warning: unused parameter 'buffer' [-Wunused-parameter]
   static inline int acpi_debugger_read_cmd(char *buffer, u32 buffer_length)
                                                  ^
   include/linux/acpi.h:196:60: warning: unused parameter 'buffer_length' [-Wunused-parameter]
   static inline int acpi_debugger_read_cmd(char *buffer, u32 buffer_length)
                                                              ^
   include/linux/acpi.h:266:62: warning: unused parameter 'pa' [-Wunused-parameter]
   acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa) { }
                                                                ^
   include/linux/acpi.h:268:36: warning: unused parameter 'dev' [-Wunused-parameter]
   acpi_arch_dma_setup(struct device *dev, u64 *dma_addr, u64 *dma_size) { }
                                      ^
   include/linux/acpi.h:268:46: warning: unused parameter 'dma_addr' [-Wunused-parameter]
   acpi_arch_dma_setup(struct device *dev, u64 *dma_addr, u64 *dma_size) { }
                                                ^
   include/linux/acpi.h:268:61: warning: unused parameter 'dma_size' [-Wunused-parameter]
   acpi_arch_dma_setup(struct device *dev, u64 *dma_addr, u64 *dma_size) { }
                                                               ^
   include/linux/acpi.h:1347:30: warning: unused parameter 'handle' [-Wunused-parameter]
   int acpi_irq_get(acpi_handle handle, unsigned int index, struct resource *res)
                                ^
   include/linux/acpi.h:1347:51: warning: unused parameter 'index' [-Wunused-parameter]
   int acpi_irq_get(acpi_handle handle, unsigned int index, struct resource *res)
                                                     ^
   include/linux/acpi.h:1347:75: warning: unused parameter 'res' [-Wunused-parameter]
   int acpi_irq_get(acpi_handle handle, unsigned int index, struct resource *res)
                                                                             ^
   include/linux/acpi.h:1369:56: warning: unused parameter 'cpu' [-Wunused-parameter]
   static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
                                                          ^
   include/linux/acpi.h:1373:55: warning: unused parameter 'cpu' [-Wunused-parameter]
   static inline int find_acpi_cpu_topology(unsigned int cpu, int level)
                                                         ^
   include/linux/acpi.h:1373:64: warning: unused parameter 'level' [-Wunused-parameter]
   static inline int find_acpi_cpu_topology(unsigned int cpu, int level)
                                                                  ^
   include/linux/acpi.h:1377:63: warning: unused parameter 'cpu' [-Wunused-parameter]
   static inline int find_acpi_cpu_topology_package(unsigned int cpu)
                                                                 ^
   include/linux/acpi.h:1381:65: warning: unused parameter 'cpu' [-Wunused-parameter]
   static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
                                                                   ^
   include/linux/acpi.h:1385:61: warning: unused parameter 'cpu' [-Wunused-parameter]
   static inline int find_acpi_cpu_cache_topology(unsigned int cpu, int level)
                                                               ^
   include/linux/acpi.h:1385:70: warning: unused parameter 'level' [-Wunused-parameter]
   static inline int find_acpi_cpu_cache_topology(unsigned int cpu, int level)
                                                                        ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:479:22: warning: unused parameter 'sig' [-Wunused-parameter]
                                                    unsigned long sig,
                                                                  ^
   include/linux/signal.h:480:22: warning: unused parameter 'si_code' [-Wunused-parameter]
                                                    unsigned long si_code)
                                                                  ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   include/linux/uaccess.h:48:51: warning: unused parameter 'oldfs' [-Wunused-parameter]
   static inline void force_uaccess_end(mm_segment_t oldfs)
                                                     ^
>> include/linux/uaccess.h:289:59: warning: unused parameter 'uaddr' [-Wunused-parameter]
   static inline size_t probe_subpage_writeable(char __user *uaddr, size_t size)
                                                             ^
>> include/linux/uaccess.h:289:73: warning: unused parameter 'size' [-Wunused-parameter]
   static inline size_t probe_subpage_writeable(char __user *uaddr, size_t size)
                                                                           ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:6:
   In file included from include/linux/sched/signal.h:10:
   include/linux/cred.h:204:54: warning: unused parameter 'cred' [-Wunused-parameter]
   static inline void validate_creds(const struct cred *cred)
                                                        ^
   include/linux/cred.h:207:67: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void validate_creds_for_do_exit(struct task_struct *tsk)
                                                                     ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:6:
   include/linux/sched/signal.h:724:73: warning: unused parameter 'task' [-Wunused-parameter]
   static inline void lockdep_assert_task_sighand_held(struct task_struct *task) { }
                                                                           ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:18:
   include/linux/mmap_lock.h:80:60: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline void __mmap_seq_write_lock(struct mm_struct *mm)
                                                              ^
   include/linux/mmap_lock.h:89:62: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline void __mmap_seq_write_unlock(struct mm_struct *mm)
                                                                ^
   include/linux/mmap_lock.h:137:69: warning: unused parameter 'subclass' [-Wunused-parameter]
   static inline void mmap_write_lock_nested(struct mm_struct *mm, int subclass)
                                                                       ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:25:
   include/linux/page_ext.h:70:60: warning: unused parameter 'pgdat' [-Wunused-parameter]
   static inline void pgdat_page_ext_init(struct pglist_data *pgdat)
                                                              ^
   include/linux/page_ext.h:74:67: warning: unused parameter 'page' [-Wunused-parameter]
   static inline struct page_ext *lookup_page_ext(const struct page *page)
                                                                     ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:28:
   include/linux/page_ref.h:41:48: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void __page_ref_set(struct page *page, int v)
                                                  ^
   include/linux/page_ref.h:41:58: warning: unused parameter 'v' [-Wunused-parameter]
   static inline void __page_ref_set(struct page *page, int v)
                                                            ^
   include/linux/page_ref.h:44:48: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void __page_ref_mod(struct page *page, int v)
                                                  ^
   include/linux/page_ref.h:44:58: warning: unused parameter 'v' [-Wunused-parameter]
   static inline void __page_ref_mod(struct page *page, int v)
                                                            ^
   include/linux/page_ref.h:47:57: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void __page_ref_mod_and_test(struct page *page, int v, int ret)
                                                           ^
   include/linux/page_ref.h:47:67: warning: unused parameter 'v' [-Wunused-parameter]
   static inline void __page_ref_mod_and_test(struct page *page, int v, int ret)
                                                                     ^
   include/linux/page_ref.h:47:74: warning: unused parameter 'ret' [-Wunused-parameter]
   static inline void __page_ref_mod_and_test(struct page *page, int v, int ret)
                                                                            ^
   include/linux/page_ref.h:50:59: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void __page_ref_mod_and_return(struct page *page, int v, int ret)
                                                             ^
   include/linux/page_ref.h:50:69: warning: unused parameter 'v' [-Wunused-parameter]
   static inline void __page_ref_mod_and_return(struct page *page, int v, int ret)
                                                                       ^
   include/linux/page_ref.h:50:76: warning: unused parameter 'ret' [-Wunused-parameter]
   static inline void __page_ref_mod_and_return(struct page *page, int v, int ret)
                                                                              ^
   include/linux/page_ref.h:53:55: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void __page_ref_mod_unless(struct page *page, int v, int u)
                                                         ^
   include/linux/page_ref.h:53:65: warning: unused parameter 'v' [-Wunused-parameter]
   static inline void __page_ref_mod_unless(struct page *page, int v, int u)
                                                                   ^
   include/linux/page_ref.h:53:72: warning: unused parameter 'u' [-Wunused-parameter]
   static inline void __page_ref_mod_unless(struct page *page, int v, int u)
                                                                          ^
   include/linux/page_ref.h:56:51: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void __page_ref_freeze(struct page *page, int v, int ret)
                                                     ^
   include/linux/page_ref.h:56:61: warning: unused parameter 'v' [-Wunused-parameter]
   static inline void __page_ref_freeze(struct page *page, int v, int ret)
                                                               ^
   include/linux/page_ref.h:56:68: warning: unused parameter 'ret' [-Wunused-parameter]
   static inline void __page_ref_freeze(struct page *page, int v, int ret)
                                                                      ^
   include/linux/page_ref.h:59:53: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void __page_ref_unfreeze(struct page *page, int v)
                                                       ^
   include/linux/page_ref.h:59:63: warning: unused parameter 'v' [-Wunused-parameter]
   static inline void __page_ref_unfreeze(struct page *page, int v)
                                                                 ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:33:
   In file included from include/linux/pgtable.h:6:
   arch/x86/include/asm/pgtable.h:215:35: warning: unused parameter 'p4d' [-Wunused-parameter]
   static inline int p4d_large(p4d_t p4d)
--
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:12:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:375:
   include/asm-generic/io.h:83:39: warning: unused parameter 'val' [-Wunused-parameter]
   static inline void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                         ^
   include/asm-generic/io.h:83:47: warning: unused parameter 'width' [-Wunused-parameter]
   static inline void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                                 ^
   include/asm-generic/io.h:83:77: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                                                               ^
   include/asm-generic/io.h:84:21: warning: unused parameter 'caller_addr' [-Wunused-parameter]
                                     unsigned long caller_addr) {}
                                                   ^
   include/asm-generic/io.h:85:44: warning: unused parameter 'val' [-Wunused-parameter]
   static inline void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                              ^
   include/asm-generic/io.h:85:52: warning: unused parameter 'width' [-Wunused-parameter]
   static inline void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                                      ^
   include/asm-generic/io.h:85:82: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                                                                    ^
   include/asm-generic/io.h:86:26: warning: unused parameter 'caller_addr' [-Wunused-parameter]
                                          unsigned long caller_addr) {}
                                                        ^
   include/asm-generic/io.h:87:37: warning: unused parameter 'width' [-Wunused-parameter]
   static inline void log_read_mmio(u8 width, const volatile void __iomem *addr,
                                       ^
   include/asm-generic/io.h:87:73: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void log_read_mmio(u8 width, const volatile void __iomem *addr,
                                                                           ^
   include/asm-generic/io.h:88:20: warning: unused parameter 'caller_addr' [-Wunused-parameter]
                                    unsigned long caller_addr) {}
                                                  ^
   include/asm-generic/io.h:89:43: warning: unused parameter 'val' [-Wunused-parameter]
   static inline void log_post_read_mmio(u64 val, u8 width, const volatile void __iomem *addr,
                                             ^
   include/asm-generic/io.h:89:51: warning: unused parameter 'width' [-Wunused-parameter]
   static inline void log_post_read_mmio(u64 val, u8 width, const volatile void __iomem *addr,
                                                     ^
   include/asm-generic/io.h:89:87: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void log_post_read_mmio(u64 val, u8 width, const volatile void __iomem *addr,
                                                                                         ^
   include/asm-generic/io.h:90:25: warning: unused parameter 'caller_addr' [-Wunused-parameter]
                                         unsigned long caller_addr) {}
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:12:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:375:
   In file included from include/asm-generic/io.h:984:
   In file included from include/linux/vmalloc.h:13:
   arch/x86/include/asm/vmalloc.h:12:53: warning: unused parameter 'prot' [-Wunused-parameter]
   static inline bool arch_vmap_pud_supported(pgprot_t prot)
                                                       ^
   arch/x86/include/asm/vmalloc.h:19:53: warning: unused parameter 'prot' [-Wunused-parameter]
   static inline bool arch_vmap_pmd_supported(pgprot_t prot)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:12:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:375:
   In file included from include/asm-generic/io.h:984:
   include/linux/vmalloc.h:83:53: warning: unused parameter 'prot' [-Wunused-parameter]
   static inline bool arch_vmap_p4d_supported(pgprot_t prot)
                                                       ^
   include/linux/vmalloc.h:104:72: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
                                                                          ^
   include/linux/vmalloc.h:104:92: warning: unused parameter 'end' [-Wunused-parameter]
   static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
                                                                                              ^
   include/linux/vmalloc.h:105:13: warning: unused parameter 'pfn' [-Wunused-parameter]
                                                            u64 pfn, unsigned int max_page_shift)
                                                                ^
   include/linux/vmalloc.h:105:31: warning: unused parameter 'max_page_shift' [-Wunused-parameter]
                                                            u64 pfn, unsigned int max_page_shift)
                                                                                  ^
   include/linux/vmalloc.h:112:63: warning: unused parameter 'size' [-Wunused-parameter]
   static inline int arch_vmap_pte_supported_shift(unsigned long size)
                                                                 ^
   include/linux/vmalloc.h:219:53: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline bool is_vm_area_hugepages(const void *addr)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:13:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/x86/include/asm/pgtable.h:26:
   In file included from arch/x86/include/asm/pkru.h:5:
   In file included from arch/x86/include/asm/fpu/xstate.h:5:
   include/linux/uaccess.h:48:51: warning: unused parameter 'oldfs' [-Wunused-parameter]
   static inline void force_uaccess_end(mm_segment_t oldfs)
                                                     ^
>> include/linux/uaccess.h:289:59: warning: unused parameter 'uaddr' [-Wunused-parameter]
   static inline size_t probe_subpage_writeable(char __user *uaddr, size_t size)
                                                             ^
>> include/linux/uaccess.h:289:73: warning: unused parameter 'size' [-Wunused-parameter]
   static inline size_t probe_subpage_writeable(char __user *uaddr, size_t size)
                                                                           ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:13:
   In file included from include/linux/pgtable.h:6:
   arch/x86/include/asm/pgtable.h:215:35: warning: unused parameter 'p4d' [-Wunused-parameter]
   static inline int p4d_large(p4d_t p4d)
                                     ^
   arch/x86/include/asm/pgtable.h:267:36: warning: unused parameter 'pgd' [-Wunused-parameter]
   static inline int pgd_devmap(pgd_t pgd)
                                      ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:13:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/x86/include/asm/pgtable.h:716:
   arch/x86/include/asm/pgtable_64.h:57:52: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline bool mm_p4d_folded(struct mm_struct *mm)
                                                      ^
   arch/x86/include/asm/pgtable_64.h:70:55: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline void native_pte_clear(struct mm_struct *mm, unsigned long addr,
                                                         ^
   arch/x86/include/asm/pgtable_64.h:70:73: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void native_pte_clear(struct mm_struct *mm, unsigned long addr,
                                                                           ^
   arch/x86/include/asm/pgtable_64.h:262:53: warning: unused parameter 'start' [-Wunused-parameter]
   static inline bool gup_fast_permitted(unsigned long start, unsigned long end)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:13:
   In file included from include/linux/pgtable.h:6:
   arch/x86/include/asm/pgtable.h:1007:49: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
                                                   ^
   arch/x86/include/asm/pgtable.h:1007:67: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
                                                                     ^
   arch/x86/include/asm/pgtable.h:1013:49: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
                                                   ^
   arch/x86/include/asm/pgtable.h:1013:67: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
                                                                     ^
   arch/x86/include/asm/pgtable.h:1019:49: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
                                                   ^
   arch/x86/include/asm/pgtable.h:1019:67: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
                                                                     ^
   arch/x86/include/asm/pgtable.h:1048:58: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
                                                            ^
   arch/x86/include/asm/pgtable.h:1048:76: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
                                                                              ^
   arch/x86/include/asm/pgtable.h:1074:57: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline void ptep_set_wrprotect(struct mm_struct *mm,
                                                           ^
   arch/x86/include/asm/pgtable.h:1075:25: warning: unused parameter 'addr' [-Wunused-parameter]
                                         unsigned long addr, pte_t *ptep)
                                                       ^
   arch/x86/include/asm/pgtable.h:1110:63: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm, unsigned long addr,
                                                                 ^
   arch/x86/include/asm/pgtable.h:1110:81: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm, unsigned long addr,
                                                                                   ^
   arch/x86/include/asm/pgtable.h:1117:63: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
                                                                 ^
   arch/x86/include/asm/pgtable.h:1118:20: warning: unused parameter 'addr' [-Wunused-parameter]
                                           unsigned long addr, pud_t *pudp)
                                                         ^
   arch/x86/include/asm/pgtable.h:1124:57: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline void pmdp_set_wrprotect(struct mm_struct *mm,
                                                           ^
   arch/x86/include/asm/pgtable.h:1125:25: warning: unused parameter 'addr' [-Wunused-parameter]
                                         unsigned long addr, pmd_t *pmdp)
                                                       ^
   arch/x86/include/asm/pgtable.h:1138:59: warning: unused parameter 'vma' [-Wunused-parameter]
   static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
                                                             ^
   arch/x86/include/asm/pgtable.h:1139:17: warning: unused parameter 'address' [-Wunused-parameter]
                   unsigned long address, pmd_t *pmdp, pmd_t pmd)
                                 ^
   arch/x86/include/asm/pgtable.h:1165:35: warning: unused parameter 'pgd' [-Wunused-parameter]
   static inline int pgd_large(pgd_t pgd) { return 0; }
                                     ^
   arch/x86/include/asm/pgtable.h:1256:60: warning: unused parameter 'vma' [-Wunused-parameter]
   static inline void update_mmu_cache(struct vm_area_struct *vma,
                                                              ^
   arch/x86/include/asm/pgtable.h:1257:17: warning: unused parameter 'addr' [-Wunused-parameter]
                   unsigned long addr, pte_t *ptep)
                                 ^
   arch/x86/include/asm/pgtable.h:1257:30: warning: unused parameter 'ptep' [-Wunused-parameter]
                   unsigned long addr, pte_t *ptep)
                                              ^
   arch/x86/include/asm/pgtable.h:1260:64: warning: unused parameter 'vma' [-Wunused-parameter]
..


vim +/uaddr +289 include/linux/uaccess.h

   275	
   276	/**
   277	 * probe_subpage_writeable: probe the user range for write faults at sub-page
   278	 *			    granularity (e.g. arm64 MTE)
   279	 * @uaddr: start of address range
   280	 * @size: size of address range
   281	 *
   282	 * Returns 0 on success, the number of bytes not probed on fault.
   283	 *
   284	 * It is expected that the caller checked for the write permission of each
   285	 * page in the range either by put_user() or GUP. The architecture port can
   286	 * implement a more efficient get_user() probing if the same sub-page faults
   287	 * are triggered by either a read or a write.
   288	 */
 > 289	static inline size_t probe_subpage_writeable(char __user *uaddr, size_t size)
   290	{
   291		return 0;
   292	}
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
