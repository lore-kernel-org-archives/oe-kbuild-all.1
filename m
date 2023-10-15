Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F75290B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 10:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O41EDtcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697365158; x=1728901158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kXEpev67MGrtcnr1NFnQvNmIIYhtlykYo8T5GBAd9BI=;
  b=O41EDtcxsUiUqZypUWzmQ1v22NolXUheznXN5wyCJ7fLSbmZKHxBwauU
   EXPQldxMnZ41kH7GPZXESVtItQYzU8/i/SegA+8gf9TFkSZY4ft293tmw
   5pBu425r278rdFVWD5RKPydCi7+8sAMAgML0Gsx8YO6pLHbQJLNcust30
   ulkD0PbCp7IwH4Lwg6pPW+/gOnL7MJqwn4NBgYv0m5ERCMRXceJCzzaAM
   WPFdlojhl5ISrwbHXLYnjtTNK+vrpiiy7U4nsj43EtLTvqs9dHtro4sRX
   cBRt8sSugtOv9XhFzaMG6rX8fOcXy48D7t9byoYbZwgsDQjPt47Dvd465
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382608086"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="382608086"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 03:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="879090868"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="879090868"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Oct 2023 03:19:15 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qryDI-0007Jb-2y;
	Sun, 15 Oct 2023 10:19:12 +0000
Date: Sun, 15 Oct 2023 18:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 11/12]
 include/linux/mmap_lock.h:80:60: warning: unused parameter 'mm'
Message-ID: <202310151835.dwCxLDT4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Suren,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   bfeb57ae959355c98e0f24329ed7eb646f53cf7e
commit: 5844c8e7aaa946341f0d30441adc8f2cd97efbfc [11/12] ANDROID: mm: disable speculative page faults for CONFIG_NUMA
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231015/202310151835.dwCxLDT4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151835.dwCxLDT4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151835.dwCxLDT4-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> include/linux/mmap_lock.h:80:60: warning: unused parameter 'mm' [-Wunused-parameter]
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
                                     ^
   arch/x86/include/asm/pgtable.h:267:36: warning: unused parameter 'pgd' [-Wunused-parameter]
   static inline int pgd_devmap(pgd_t pgd)
                                      ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:33:
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
--
                                                      ^
   include/linux/regulator/consumer.h:633:18: warning: unused parameter 'num_supplies' [-Wunused-parameter]
                                   unsigned int num_supplies)
                                                ^
   include/linux/regulator/consumer.h:638:38: warning: unused parameter 'reg1' [-Wunused-parameter]
   regulator_is_equal(struct regulator *reg1, struct regulator *reg2)
                                        ^
   include/linux/regulator/consumer.h:638:62: warning: unused parameter 'reg2' [-Wunused-parameter]
   regulator_is_equal(struct regulator *reg1, struct regulator *reg2)
                                                                ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:39:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:7:
   In file included from include/uapi/linux/fb.h:6:
   include/linux/i2c.h:389:57: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
                                                           ^
   include/linux/i2c.h:976:81: warning: unused parameter 'node' [-Wunused-parameter]
   static inline struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
                                                                                   ^
   include/linux/i2c.h:981:83: warning: unused parameter 'node' [-Wunused-parameter]
   static inline struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)
                                                                                     ^
   include/linux/i2c.h:986:82: warning: unused parameter 'node' [-Wunused-parameter]
   static inline struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node *node)
                                                                                    ^
   include/linux/i2c.h:992:49: warning: unused parameter 'matches' [-Wunused-parameter]
   *i2c_of_match_device(const struct of_device_id *matches,
                                                   ^
   include/linux/i2c.h:993:27: warning: unused parameter 'client' [-Wunused-parameter]
                        struct i2c_client *client)
                                           ^
   include/linux/i2c.h:998:56: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline int of_i2c_get_board_info(struct device *dev,
                                                          ^
   include/linux/i2c.h:999:26: warning: unused parameter 'node' [-Wunused-parameter]
                                           struct device_node *node,
                                                               ^
   include/linux/i2c.h:1000:29: warning: unused parameter 'info' [-Wunused-parameter]
                                           struct i2c_board_info *info)
                                                                  ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:39:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:16:
   include/linux/backlight.h:473:47: warning: unused parameter 'node' [-Wunused-parameter]
   of_find_backlight_by_node(struct device_node *node)
                                                 ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:39:
   In file included from include/linux/vga_switcheroo.h:34:
   include/linux/fb.h:672:47: warning: unused parameter 'info' [-Wunused-parameter]
   static inline bool fb_be_math(struct fb_info *info)
                                                 ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:43:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:40:
   include/drm/drm_modes.h:470:63: warning: unused parameter 'np' [-Wunused-parameter]
   static inline int of_get_drm_display_mode(struct device_node *np,
                                                                 ^
   include/drm/drm_modes.h:471:33: warning: unused parameter 'dmode' [-Wunused-parameter]
                                             struct drm_display_mode *dmode,
                                                                      ^
   include/drm/drm_modes.h:472:13: warning: unused parameter 'bus_flags' [-Wunused-parameter]
                                             u32 *bus_flags, int index)
                                                  ^
   include/drm/drm_modes.h:472:28: warning: unused parameter 'index' [-Wunused-parameter]
                                             u32 *bus_flags, int index)
                                                                 ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:49:
   In file included from drivers/gpu/drm/i915/display/intel_bw.h:12:
   In file included from drivers/gpu/drm/i915/display/intel_display_power.h:10:
   drivers/gpu/drm/i915/intel_runtime_pm.h:201:68: warning: unused parameter 'wref' [-Wunused-parameter]
   intel_runtime_pm_put(struct intel_runtime_pm *rpm, intel_wakeref_t wref)
                                                                      ^
   drivers/gpu/drm/i915/intel_runtime_pm.h:212:76: warning: unused parameter 'rpm' [-Wunused-parameter]
   static inline void print_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm,
                                                                              ^
   drivers/gpu/drm/i915/intel_runtime_pm.h:213:29: warning: unused parameter 'p' [-Wunused-parameter]
                                                     struct drm_printer *p)
                                                                         ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:49:
   In file included from drivers/gpu/drm/i915/display/intel_bw.h:12:
   drivers/gpu/drm/i915/display/intel_display_power.h:358:20: warning: unused parameter 'wakeref' [-Wunused-parameter]
                           intel_wakeref_t wakeref)
                                           ^
   drivers/gpu/drm/i915/display/intel_display_power.h:366:26: warning: unused parameter 'wakeref' [-Wunused-parameter]
                                 intel_wakeref_t wakeref)
                                                 ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:50:
   In file included from drivers/gpu/drm/i915/display/intel_cdclk.h:11:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   include/linux/io-mapping.h:156:19: warning: unused parameter 'size' [-Wunused-parameter]
                     unsigned long size)
                                   ^
   include/linux/io-mapping.h:162:32: warning: unused parameter 'vaddr' [-Wunused-parameter]
   io_mapping_unmap(void __iomem *vaddr)
                                  ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:50:
   In file included from drivers/gpu/drm/i915/display/intel_cdclk.h:11:
   In file included from drivers/gpu/drm/i915/i915_drv.h:43:
   In file included from include/linux/intel-iommu.h:17:
>> include/linux/mmu_notifier.h:798:59: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline bool mmu_notifier_trylock(struct mm_struct *mm)
                                                             ^
   include/linux/mmu_notifier.h:803:58: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline void mmu_notifier_unlock(struct mm_struct *mm)
                                                            ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:50:
   In file included from drivers/gpu/drm/i915/display/intel_cdclk.h:11:
   In file included from drivers/gpu/drm/i915/i915_drv.h:43:
   In file included from include/linux/intel-iommu.h:21:
   In file included from include/linux/dmar.h:14:
   include/linux/msi.h:260:55: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
                                                         ^
   include/linux/msi.h:260:64: warning: unused parameter 'nvec' [-Wunused-parameter]
   static inline int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
                                                                  ^
   include/linux/msi.h:260:74: warning: unused parameter 'type' [-Wunused-parameter]
   static inline int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
                                                                            ^
   include/linux/msi.h:266:59: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline void arch_teardown_msi_irqs(struct pci_dev *dev)
                                                             ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:50:
   In file included from drivers/gpu/drm/i915/display/intel_cdclk.h:11:
   In file included from drivers/gpu/drm/i915/i915_drv.h:43:
   In file included from include/linux/intel-iommu.h:21:
   include/linux/dmar.h:129:58: warning: unused parameter 'hdr' [-Wunused-parameter]
   static inline int dmar_res_noop(struct acpi_dmar_header *hdr, void *arg)
                                                            ^
   include/linux/dmar.h:129:69: warning: unused parameter 'arg' [-Wunused-parameter]
   static inline int dmar_res_noop(struct acpi_dmar_header *hdr, void *arg)
                                                                       ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:50:
   In file included from drivers/gpu/drm/i915/display/intel_cdclk.h:11:
   In file included from drivers/gpu/drm/i915/i915_drv.h:43:
   include/linux/intel-iommu.h:803:56: warning: unused parameter 'iommu' [-Wunused-parameter]
   static inline void intel_svm_check(struct intel_iommu *iommu) {}
                                                          ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:50:
   In file included from drivers/gpu/drm/i915/display/intel_cdclk.h:11:
   In file included from drivers/gpu/drm/i915/i915_drv.h:46:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/x86/include/asm/perf_event.h:459:
   arch/x86/include/asm/stacktrace.h:83:39: warning: unused parameter 'task' [-Wunused-parameter]
   get_frame_pointer(struct task_struct *task, struct pt_regs *regs)
                                         ^
   arch/x86/include/asm/stacktrace.h:83:61: warning: unused parameter 'regs' [-Wunused-parameter]
   get_frame_pointer(struct task_struct *task, struct pt_regs *regs)
                                                               ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:50:
   In file included from drivers/gpu/drm/i915/display/intel_cdclk.h:11:
   In file included from drivers/gpu/drm/i915/i915_drv.h:46:
   In file included from include/linux/perf_event.h:39:
   arch/x86/include/asm/hw_breakpoint.h:47:43: warning: unused parameter 'type' [-Wunused-parameter]
   static inline int hw_breakpoint_slots(int type)
                                             ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:50:
   In file included from drivers/gpu/drm/i915/display/intel_cdclk.h:11:
   In file included from drivers/gpu/drm/i915/i915_drv.h:46:
   In file included from include/linux/perf_event.h:61:
   include/linux/security.h:1365:65: warning: unused parameter 'w_cred' [-Wunused-parameter]
   static inline int security_post_notification(const struct cred *w_cred,
                                                                   ^
   include/linux/security.h:1366:30: warning: unused parameter 'cred' [-Wunused-parameter]
                                                const struct cred *cred,
                                                                   ^
   include/linux/security.h:1367:38: warning: unused parameter 'n' [-Wunused-parameter]
                                                struct watch_notification *n)
                                                                           ^
   include/linux/security.h:1376:50: warning: unused parameter 'key' [-Wunused-parameter]
   static inline int security_watch_key(struct key *key)
                                                    ^
   include/linux/security.h:1660:49: warning: unused parameter 'sec' [-Wunused-parameter]
   static inline int security_ib_pkey_access(void *sec, u64 subnet_prefix, u16 pkey)
                                                   ^
   include/linux/security.h:1660:58: warning: unused parameter 'subnet_prefix' [-Wunused-parameter]
   static inline int security_ib_pkey_access(void *sec, u64 subnet_prefix, u16 pkey)
                                                            ^
   include/linux/security.h:1660:77: warning: unused parameter 'pkey' [-Wunused-parameter]
   static inline int security_ib_pkey_access(void *sec, u64 subnet_prefix, u16 pkey)
                                                                               ^
   include/linux/security.h:1665:59: warning: unused parameter 'sec' [-Wunused-parameter]
   static inline int security_ib_endport_manage_subnet(void *sec, const char *dev_name, u8 port_num)
                                                             ^
   include/linux/security.h:1665:76: warning: unused parameter 'dev_name' [-Wunused-parameter]
   static inline int security_ib_endport_manage_subnet(void *sec, const char *dev_name, u8 port_num)
                                                                              ^
   include/linux/security.h:1665:89: warning: unused parameter 'port_num' [-Wunused-parameter]
   static inline int security_ib_endport_manage_subnet(void *sec, const char *dev_name, u8 port_num)
                                                                                           ^
   include/linux/security.h:1670:53: warning: unused parameter 'sec' [-Wunused-parameter]
   static inline int security_ib_alloc_security(void **sec)
                                                       ^
   include/linux/security.h:1675:52: warning: unused parameter 'sec' [-Wunused-parameter]
   static inline void security_ib_free_security(void *sec)
                                                      ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:50:
   In file included from drivers/gpu/drm/i915/display/intel_cdclk.h:11:
   In file included from drivers/gpu/drm/i915/i915_drv.h:46:
   include/linux/perf_event.h:940:76: warning: unused parameter 'ctx' [-Wunused-parameter]
..


vim +/mm +80 include/linux/mmap_lock.h

29e9bee6fcf559 Michel Lespinasse 2022-01-24  79  
29e9bee6fcf559 Michel Lespinasse 2022-01-24 @80  static inline void __mmap_seq_write_lock(struct mm_struct *mm)
29e9bee6fcf559 Michel Lespinasse 2022-01-24  81  {
29e9bee6fcf559 Michel Lespinasse 2022-01-24  82  #ifdef CONFIG_SPECULATIVE_PAGE_FAULT
29e9bee6fcf559 Michel Lespinasse 2022-01-24  83  	VM_BUG_ON_MM(mm->mmap_seq & 1, mm);
29e9bee6fcf559 Michel Lespinasse 2022-01-24  84  	mm->mmap_seq++;
29e9bee6fcf559 Michel Lespinasse 2022-01-24  85  	smp_wmb();
29e9bee6fcf559 Michel Lespinasse 2022-01-24  86  #endif
29e9bee6fcf559 Michel Lespinasse 2022-01-24  87  }
29e9bee6fcf559 Michel Lespinasse 2022-01-24  88  

:::::: The code at line 80 was first introduced by commit
:::::: 29e9bee6fcf5591f780775aeb4cb0f0f8270ec85 FROMLIST: mm: add per-mm mmap sequence counter for speculative page fault handling.

:::::: TO: Michel Lespinasse <michel@lespinasse.org>
:::::: CC: Todd Kjos <tkjos@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
