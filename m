Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F05A101CE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 13:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ignk/1Ca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697290530; x=1728826530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kFffXtQmg4FYbpmpUs8sA9vKRuPJESj7eJvI8z7CLqk=;
  b=Ignk/1CaAjRJbp7R9hGGLiKfh65F+XKmx6tUb0RRzWCUQFCmHsniXwVu
   I5g8rDPsUC/tbXd6zODcmjlYRcMy5xwFkSP3QOBoUy4TXmAkG9Sx0Rvh4
   MDY2RPWYnYGfOBgwPNTfuQZEc4D9RHKelXEIEe2Qaoux0zJp5wnwcPB2C
   5NbXSdhbezM2vsOsN4/vMXHsCc/tBknCr9GWwJdRBdsYKTejIM1vBxZLI
   2g+D7t7euVitkwhgxDeRUfh93SLpYbBos1LFJ9Frl67negKWAH7uje5pJ
   5B66m5+7pz3xmxwe9CLIi7nuk0Iv2G1Fb+uo6tMu/bP1RwZmv8XygQWSO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388179536"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="388179536"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 06:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="820982101"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="820982101"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Oct 2023 06:35:27 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrend-0006CJ-1i;
	Sat, 14 Oct 2023 13:35:25 +0000
Date: Sat, 14 Oct 2023 21:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 23/68] include/linux/kasan.h:476:69:
 warning: unused parameter 'gfp_mask'
Message-ID: <202310142147.wOl3AETx-lkp@intel.com>
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
commit: 68b80821638108be63f3a7c3043884770888d3f3 [23/68] UPSTREAM: mm: defer kmemleak object creation of module_alloc()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231014/202310142147.wOl3AETx-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142147.wOl3AETx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142147.wOl3AETx-lkp@intel.com/

All warnings (new ones prefixed by >>):

                                                              ^
   include/linux/kasan.h:335:55: warning: unused parameter 's' [-Wunused-parameter]
   static inline bool kasan_slab_free(struct kmem_cache *s, void *object, bool init)
                                                         ^
   include/linux/kasan.h:335:64: warning: unused parameter 'object' [-Wunused-parameter]
   static inline bool kasan_slab_free(struct kmem_cache *s, void *object, bool init)
                                                                  ^
   include/linux/kasan.h:335:77: warning: unused parameter 'init' [-Wunused-parameter]
   static inline bool kasan_slab_free(struct kmem_cache *s, void *object, bool init)
                                                                               ^
   include/linux/kasan.h:339:44: warning: unused parameter 'ptr' [-Wunused-parameter]
   static inline void kasan_kfree_large(void *ptr) {}
                                              ^
   include/linux/kasan.h:340:50: warning: unused parameter 'ptr' [-Wunused-parameter]
   static inline void kasan_slab_free_mempool(void *ptr) {}
                                                    ^
   include/linux/kasan.h:341:57: warning: unused parameter 's' [-Wunused-parameter]
   static inline void *kasan_slab_alloc(struct kmem_cache *s, void *object,
                                                           ^
   include/linux/kasan.h:342:14: warning: unused parameter 'flags' [-Wunused-parameter]
                                      gfp_t flags, bool init)
                                            ^
   include/linux/kasan.h:342:26: warning: unused parameter 'init' [-Wunused-parameter]
                                      gfp_t flags, bool init)
                                                        ^
   include/linux/kasan.h:346:54: warning: unused parameter 's' [-Wunused-parameter]
   static inline void *kasan_kmalloc(struct kmem_cache *s, const void *object,
                                                        ^
   include/linux/kasan.h:347:12: warning: unused parameter 'size' [-Wunused-parameter]
                                   size_t size, gfp_t flags)
                                          ^
   include/linux/kasan.h:347:24: warning: unused parameter 'flags' [-Wunused-parameter]
                                   size_t size, gfp_t flags)
                                                      ^
   include/linux/kasan.h:351:65: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void *kasan_kmalloc_large(const void *ptr, size_t size, gfp_t flags)
                                                                   ^
   include/linux/kasan.h:351:77: warning: unused parameter 'flags' [-Wunused-parameter]
   static inline void *kasan_kmalloc_large(const void *ptr, size_t size, gfp_t flags)
                                                                               ^
   include/linux/kasan.h:355:63: warning: unused parameter 'new_size' [-Wunused-parameter]
   static inline void *kasan_krealloc(const void *object, size_t new_size,
                                                                 ^
   include/linux/kasan.h:356:12: warning: unused parameter 'flags' [-Wunused-parameter]
                                    gfp_t flags)
                                          ^
   include/linux/kasan.h:360:49: warning: unused parameter 'address' [-Wunused-parameter]
   static inline bool kasan_check_byte(const void *address)
                                                   ^
   include/linux/kasan.h:370:66: warning: unused parameter 'task' [-Wunused-parameter]
   static inline void kasan_unpoison_task_stack(struct task_struct *task) {}
                                                                    ^
   include/linux/kasan.h:382:58: warning: unused parameter 'cache' [-Wunused-parameter]
   static inline void kasan_cache_shrink(struct kmem_cache *cache) {}
                                                            ^
   include/linux/kasan.h:383:60: warning: unused parameter 'cache' [-Wunused-parameter]
   static inline void kasan_cache_shutdown(struct kmem_cache *cache) {}
                                                              ^
   include/linux/kasan.h:384:49: warning: unused parameter 'ptr' [-Wunused-parameter]
   static inline void kasan_record_aux_stack(void *ptr) {}
                                                   ^
   include/linux/kasan.h:385:57: warning: unused parameter 'ptr' [-Wunused-parameter]
   static inline void kasan_record_aux_stack_noalloc(void *ptr) {}
                                                           ^
   include/linux/kasan.h:446:56: warning: unused parameter 'start' [-Wunused-parameter]
   static inline int kasan_populate_vmalloc(unsigned long start,
                                                          ^
   include/linux/kasan.h:447:20: warning: unused parameter 'size' [-Wunused-parameter]
                                           unsigned long size)
                                                         ^
   include/linux/kasan.h:452:53: warning: unused parameter 'start' [-Wunused-parameter]
   static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
                                                       ^
   include/linux/kasan.h:452:74: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
                                                                            ^
   include/linux/kasan.h:454:55: warning: unused parameter 'start' [-Wunused-parameter]
   static inline void kasan_unpoison_vmalloc(const void *start, unsigned long size)
                                                         ^
   include/linux/kasan.h:454:76: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void kasan_unpoison_vmalloc(const void *start, unsigned long size)
                                                                              ^
   include/linux/kasan.h:456:56: warning: unused parameter 'start' [-Wunused-parameter]
   static inline void kasan_release_vmalloc(unsigned long start,
                                                          ^
   include/linux/kasan.h:457:21: warning: unused parameter 'end' [-Wunused-parameter]
                                            unsigned long end,
                                                          ^
   include/linux/kasan.h:458:21: warning: unused parameter 'free_region_start' [-Wunused-parameter]
                                            unsigned long free_region_start,
                                                          ^
   include/linux/kasan.h:459:21: warning: unused parameter 'free_region_end' [-Wunused-parameter]
                                            unsigned long free_region_end) {}
                                                          ^
   include/linux/kasan.h:476:44: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask) { return 0; }
                                              ^
   include/linux/kasan.h:476:57: warning: unused parameter 'size' [-Wunused-parameter]
   static inline int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask) { return 0; }
                                                           ^
>> include/linux/kasan.h:476:69: warning: unused parameter 'gfp_mask' [-Wunused-parameter]
   static inline int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask) { return 0; }
                                                                       ^
   include/linux/kasan.h:477:62: warning: unused parameter 'vm' [-Wunused-parameter]
   static inline void kasan_free_shadow(const struct vm_struct *vm) {}
                                                                ^
   include/linux/kasan.h:484:59: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void kasan_non_canonical_hook(unsigned long addr) { }
                                                             ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:19:
   include/linux/hrtimer.h:363:64: warning: unused parameter 'timer' [-Wunused-parameter]
   static inline void hrtimer_cancel_wait_running(struct hrtimer *timer)
                                                                  ^
   include/linux/hrtimer.h:400:61: warning: unused parameter 'timer' [-Wunused-parameter]
   static inline void destroy_hrtimer_on_stack(struct hrtimer *timer) { }
                                                               ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:21:
   include/linux/seccomp.h:112:59: warning: unused parameter 'task' [-Wunused-parameter]
   static inline long seccomp_get_filter(struct task_struct *task,
                                                             ^
   include/linux/seccomp.h:113:25: warning: unused parameter 'n' [-Wunused-parameter]
                                         unsigned long n, void __user *data)
                                                       ^
   include/linux/seccomp.h:113:41: warning: unused parameter 'data' [-Wunused-parameter]
                                         unsigned long n, void __user *data)
                                                                       ^
   include/linux/seccomp.h:117:61: warning: unused parameter 'task' [-Wunused-parameter]
   static inline long seccomp_get_metadata(struct task_struct *task,
                                                               ^
   include/linux/seccomp.h:118:20: warning: unused parameter 'filter_off' [-Wunused-parameter]
                                           unsigned long filter_off,
                                                         ^
   include/linux/seccomp.h:119:19: warning: unused parameter 'data' [-Wunused-parameter]
                                           void __user *data)
                                                        ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:33:
   In file included from include/linux/posix-timers.h:9:
   include/linux/task_work.h:30:55: warning: unused parameter 'task' [-Wunused-parameter]
   static inline void exit_task_work(struct task_struct *task)
                                                         ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   include/linux/sched.h:2099:46: warning: unused parameter 'lock' [-Wunused-parameter]
   static inline int spin_needbreak(spinlock_t *lock)
                                                ^
   include/linux/sched.h:2116:46: warning: unused parameter 'lock' [-Wunused-parameter]
   static inline int rwlock_needbreak(rwlock_t *lock)
                                                ^
   include/linux/sched.h:2302:49: warning: unused parameter 'regs' [-Wunused-parameter]
   static inline void rseq_syscall(struct pt_regs *regs)
                                                   ^
   include/linux/sched.h:2328:56: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void sched_core_free(struct task_struct *tsk) { }
                                                          ^
   include/linux/sched.h:2329:56: warning: unused parameter 'p' [-Wunused-parameter]
   static inline void sched_core_fork(struct task_struct *p) { }
                                                          ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:16:
   In file included from include/linux/energy_model.h:10:
   include/linux/sched/topology.h:251:43: warning: unused parameter 'cpu' [-Wunused-parameter]
   unsigned long arch_scale_cpu_capacity(int cpu)
                                             ^
   include/linux/sched/topology.h:259:47: warning: unused parameter 'cpu' [-Wunused-parameter]
   unsigned long arch_scale_thermal_pressure(int cpu)
                                                 ^
   include/linux/sched/topology.h:267:54: warning: unused parameter 'cpus' [-Wunused-parameter]
   void arch_set_thermal_pressure(const struct cpumask *cpus,
                                                        ^
   include/linux/sched/topology.h:268:25: warning: unused parameter 'th_pressure' [-Wunused-parameter]
                                  unsigned long th_pressure)
                                                ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:16:
   include/linux/energy_model.h:219:48: warning: unused parameter 'dev' [-Wunused-parameter]
   int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
                                                  ^
   include/linux/energy_model.h:219:66: warning: unused parameter 'nr_states' [-Wunused-parameter]
   int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
                                                                    ^
   include/linux/energy_model.h:220:30: warning: unused parameter 'cb' [-Wunused-parameter]
--
                                                              ^
   include/linux/kasan.h:335:55: warning: unused parameter 's' [-Wunused-parameter]
   static inline bool kasan_slab_free(struct kmem_cache *s, void *object, bool init)
                                                         ^
   include/linux/kasan.h:335:64: warning: unused parameter 'object' [-Wunused-parameter]
   static inline bool kasan_slab_free(struct kmem_cache *s, void *object, bool init)
                                                                  ^
   include/linux/kasan.h:335:77: warning: unused parameter 'init' [-Wunused-parameter]
   static inline bool kasan_slab_free(struct kmem_cache *s, void *object, bool init)
                                                                               ^
   include/linux/kasan.h:339:44: warning: unused parameter 'ptr' [-Wunused-parameter]
   static inline void kasan_kfree_large(void *ptr) {}
                                              ^
   include/linux/kasan.h:340:50: warning: unused parameter 'ptr' [-Wunused-parameter]
   static inline void kasan_slab_free_mempool(void *ptr) {}
                                                    ^
   include/linux/kasan.h:341:57: warning: unused parameter 's' [-Wunused-parameter]
   static inline void *kasan_slab_alloc(struct kmem_cache *s, void *object,
                                                           ^
   include/linux/kasan.h:342:14: warning: unused parameter 'flags' [-Wunused-parameter]
                                      gfp_t flags, bool init)
                                            ^
   include/linux/kasan.h:342:26: warning: unused parameter 'init' [-Wunused-parameter]
                                      gfp_t flags, bool init)
                                                        ^
   include/linux/kasan.h:346:54: warning: unused parameter 's' [-Wunused-parameter]
   static inline void *kasan_kmalloc(struct kmem_cache *s, const void *object,
                                                        ^
   include/linux/kasan.h:347:12: warning: unused parameter 'size' [-Wunused-parameter]
                                   size_t size, gfp_t flags)
                                          ^
   include/linux/kasan.h:347:24: warning: unused parameter 'flags' [-Wunused-parameter]
                                   size_t size, gfp_t flags)
                                                      ^
   include/linux/kasan.h:351:65: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void *kasan_kmalloc_large(const void *ptr, size_t size, gfp_t flags)
                                                                   ^
   include/linux/kasan.h:351:77: warning: unused parameter 'flags' [-Wunused-parameter]
   static inline void *kasan_kmalloc_large(const void *ptr, size_t size, gfp_t flags)
                                                                               ^
   include/linux/kasan.h:355:63: warning: unused parameter 'new_size' [-Wunused-parameter]
   static inline void *kasan_krealloc(const void *object, size_t new_size,
                                                                 ^
   include/linux/kasan.h:356:12: warning: unused parameter 'flags' [-Wunused-parameter]
                                    gfp_t flags)
                                          ^
   include/linux/kasan.h:360:49: warning: unused parameter 'address' [-Wunused-parameter]
   static inline bool kasan_check_byte(const void *address)
                                                   ^
   include/linux/kasan.h:370:66: warning: unused parameter 'task' [-Wunused-parameter]
   static inline void kasan_unpoison_task_stack(struct task_struct *task) {}
                                                                    ^
   include/linux/kasan.h:382:58: warning: unused parameter 'cache' [-Wunused-parameter]
   static inline void kasan_cache_shrink(struct kmem_cache *cache) {}
                                                            ^
   include/linux/kasan.h:383:60: warning: unused parameter 'cache' [-Wunused-parameter]
   static inline void kasan_cache_shutdown(struct kmem_cache *cache) {}
                                                              ^
   include/linux/kasan.h:384:49: warning: unused parameter 'ptr' [-Wunused-parameter]
   static inline void kasan_record_aux_stack(void *ptr) {}
                                                   ^
   include/linux/kasan.h:385:57: warning: unused parameter 'ptr' [-Wunused-parameter]
   static inline void kasan_record_aux_stack_noalloc(void *ptr) {}
                                                           ^
   include/linux/kasan.h:446:56: warning: unused parameter 'start' [-Wunused-parameter]
   static inline int kasan_populate_vmalloc(unsigned long start,
                                                          ^
   include/linux/kasan.h:447:20: warning: unused parameter 'size' [-Wunused-parameter]
                                           unsigned long size)
                                                         ^
   include/linux/kasan.h:452:53: warning: unused parameter 'start' [-Wunused-parameter]
   static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
                                                       ^
   include/linux/kasan.h:452:74: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
                                                                            ^
   include/linux/kasan.h:454:55: warning: unused parameter 'start' [-Wunused-parameter]
   static inline void kasan_unpoison_vmalloc(const void *start, unsigned long size)
                                                         ^
   include/linux/kasan.h:454:76: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void kasan_unpoison_vmalloc(const void *start, unsigned long size)
                                                                              ^
   include/linux/kasan.h:456:56: warning: unused parameter 'start' [-Wunused-parameter]
   static inline void kasan_release_vmalloc(unsigned long start,
                                                          ^
   include/linux/kasan.h:457:21: warning: unused parameter 'end' [-Wunused-parameter]
                                            unsigned long end,
                                                          ^
   include/linux/kasan.h:458:21: warning: unused parameter 'free_region_start' [-Wunused-parameter]
                                            unsigned long free_region_start,
                                                          ^
   include/linux/kasan.h:459:21: warning: unused parameter 'free_region_end' [-Wunused-parameter]
                                            unsigned long free_region_end) {}
                                                          ^
   include/linux/kasan.h:476:44: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask) { return 0; }
                                              ^
   include/linux/kasan.h:476:57: warning: unused parameter 'size' [-Wunused-parameter]
   static inline int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask) { return 0; }
                                                           ^
>> include/linux/kasan.h:476:69: warning: unused parameter 'gfp_mask' [-Wunused-parameter]
   static inline int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask) { return 0; }
                                                                       ^
   include/linux/kasan.h:477:62: warning: unused parameter 'vm' [-Wunused-parameter]
   static inline void kasan_free_shadow(const struct vm_struct *vm) {}
                                                                ^
   include/linux/kasan.h:484:59: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void kasan_non_canonical_hook(unsigned long addr) { }
                                                             ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:12:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:224:
   include/asm-generic/iomap.h:107:52: warning: unused parameter 'offset' [-Wunused-parameter]
   static inline void __iomem *ioremap_np(phys_addr_t offset, size_t size)
                                                      ^
   include/asm-generic/iomap.h:107:67: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void __iomem *ioremap_np(phys_addr_t offset, size_t size)
                                                                     ^
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
   include/linux/vmalloc.h:94:53: warning: unused parameter 'prot' [-Wunused-parameter]
   static inline bool arch_vmap_p4d_supported(pgprot_t prot)
                                                       ^
   include/linux/vmalloc.h:115:72: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
                                                                          ^
   include/linux/vmalloc.h:115:92: warning: unused parameter 'end' [-Wunused-parameter]
   static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
                                                                                              ^
   include/linux/vmalloc.h:116:13: warning: unused parameter 'pfn' [-Wunused-parameter]
                                                            u64 pfn, unsigned int max_page_shift)
                                                                ^
..


vim +/gfp_mask +476 include/linux/kasan.h

   451	
   452	static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
   453	{ }
   454	static inline void kasan_unpoison_vmalloc(const void *start, unsigned long size)
   455	{ }
   456	static inline void kasan_release_vmalloc(unsigned long start,
   457						 unsigned long end,
   458						 unsigned long free_region_start,
 > 459						 unsigned long free_region_end) {}
   460	
   461	#endif /* CONFIG_KASAN_VMALLOC */
   462	
   463	#if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
   464			!defined(CONFIG_KASAN_VMALLOC)
   465	
   466	/*
   467	 * These functions provide a special case to support backing module
   468	 * allocations with real shadow memory. With KASAN vmalloc, the special
   469	 * case is unnecessary, as the work is handled in the generic case.
   470	 */
   471	int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask);
   472	void kasan_free_shadow(const struct vm_struct *vm);
   473	
   474	#else /* (CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS) && !CONFIG_KASAN_VMALLOC */
   475	
 > 476	static inline int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask) { return 0; }
   477	static inline void kasan_free_shadow(const struct vm_struct *vm) {}
   478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
