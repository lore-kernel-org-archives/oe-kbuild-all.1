Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D607342C81
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286331; cv=none; b=cqb3klou+Kgy4xFIyJIC/rP9OULPWxkBFW2ErtVhJ9ZPgprDrxhZCDO0QS2cTIuxE/tn9ogHgi5eH6ZgN9/Q43OtaEYd2eNJRtllbCcHVyJB/c1MTJMcfn/c+nA5jVxmgRsTNoR7rm2fjvzkryC3FNXGics6JbBQnVHOaPAiLWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286331; c=relaxed/simple;
	bh=MwN+m9ymNuq77G2nFfcm7H9jbSgRoR+F03koGhQH6Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B+dlVhHpwCxx8GGpEZw651j2V5LLR9GB8u/K50l5c5Dt6k7DY8hgBnsyNEMC9NfM+g6z+Jf6jd8IzHxUpgtA+4B/jw9KmUPHbejIpsdoIy/jqilJXmfDQlgltnYWg0FEeLUpJt1M9N23OUxmzr4ppZJueJfOdrgkLeZnLsRZij0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KX41Bmnx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KX41Bmnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756286329; x=1787822329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MwN+m9ymNuq77G2nFfcm7H9jbSgRoR+F03koGhQH6Aw=;
  b=KX41Bmnx9iZqY972XGCiSlfUmZdNWWnXqr1zCuA12KaJCSCRseiyUTk8
   aY8PU6mSyh2eC5UVR8BLUWMp/fTeJj74C4/XSKzrBi0yo6EmmrStsJSk0
   soFdSxVZY9K1hqMx+o2RdU/fnybIWVqJY2weMkFPI0Mc8Ow+i60E726Yb
   ox+BUTbYF2kuUarmQyc4LmRblmyBLUX4oZA/CdzYZ2BggTFdVqS2Id/UD
   dqO/cIqI1OQ5IZumNaCikrBCzsIot7BDIJgZyV5dHs2/GQhpN/pclwOx2
   MwrkNyEGK+Cmfh949qGIwQjHXfqcDCA4T3O+TzcQU5QqVv+Ve/iqrJIG+
   Q==;
X-CSE-ConnectionGUID: /aIG4hj/REi/cwosf8IL0g==
X-CSE-MsgGUID: m3IBncUlQEOURgK7YcEujA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58468504"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58468504"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 02:18:48 -0700
X-CSE-ConnectionGUID: CLkbnpkmTpOPeyKY/lnUiw==
X-CSE-MsgGUID: ihuuQnHRQ4upSVBHJ380MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="170197735"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Aug 2025 02:18:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urCIn-000SpT-0N;
	Wed, 27 Aug 2025 09:18:45 +0000
Date: Wed, 27 Aug 2025 17:18:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/2] include/linux/kasan.h:476:69:
 warning: unused parameter 'gfp_mask'
Message-ID: <202508271741.HFtPajwv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   456275f3e7f8f3b2be487c9f5b18c811bee029fc
commit: f26b7aaceae3d334db6c21f53bea1ac7071e263c [0/2] UPSTREAM: mm: defer kmemleak object creation of module_alloc()
config: i386-buildonly-randconfig-003-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271741.HFtPajwv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271741.HFtPajwv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271741.HFtPajwv-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                                            ^
   include/linux/kasan.h:335:55: warning: unused parameter 's' [-Wunused-parameter]
     335 | static inline bool kasan_slab_free(struct kmem_cache *s, void *object, bool init)
         |                                                       ^
   include/linux/kasan.h:335:64: warning: unused parameter 'object' [-Wunused-parameter]
     335 | static inline bool kasan_slab_free(struct kmem_cache *s, void *object, bool init)
         |                                                                ^
   include/linux/kasan.h:335:77: warning: unused parameter 'init' [-Wunused-parameter]
     335 | static inline bool kasan_slab_free(struct kmem_cache *s, void *object, bool init)
         |                                                                             ^
   include/linux/kasan.h:339:44: warning: unused parameter 'ptr' [-Wunused-parameter]
     339 | static inline void kasan_kfree_large(void *ptr) {}
         |                                            ^
   include/linux/kasan.h:340:50: warning: unused parameter 'ptr' [-Wunused-parameter]
     340 | static inline void kasan_slab_free_mempool(void *ptr) {}
         |                                                  ^
   include/linux/kasan.h:341:57: warning: unused parameter 's' [-Wunused-parameter]
     341 | static inline void *kasan_slab_alloc(struct kmem_cache *s, void *object,
         |                                                         ^
   include/linux/kasan.h:342:14: warning: unused parameter 'flags' [-Wunused-parameter]
     342 |                                    gfp_t flags, bool init)
         |                                          ^
   include/linux/kasan.h:342:26: warning: unused parameter 'init' [-Wunused-parameter]
     342 |                                    gfp_t flags, bool init)
         |                                                      ^
   include/linux/kasan.h:346:54: warning: unused parameter 's' [-Wunused-parameter]
     346 | static inline void *kasan_kmalloc(struct kmem_cache *s, const void *object,
         |                                                      ^
   include/linux/kasan.h:347:12: warning: unused parameter 'size' [-Wunused-parameter]
     347 |                                 size_t size, gfp_t flags)
         |                                        ^
   include/linux/kasan.h:347:24: warning: unused parameter 'flags' [-Wunused-parameter]
     347 |                                 size_t size, gfp_t flags)
         |                                                    ^
   include/linux/kasan.h:351:65: warning: unused parameter 'size' [-Wunused-parameter]
     351 | static inline void *kasan_kmalloc_large(const void *ptr, size_t size, gfp_t flags)
         |                                                                 ^
   include/linux/kasan.h:351:77: warning: unused parameter 'flags' [-Wunused-parameter]
     351 | static inline void *kasan_kmalloc_large(const void *ptr, size_t size, gfp_t flags)
         |                                                                             ^
   include/linux/kasan.h:355:63: warning: unused parameter 'new_size' [-Wunused-parameter]
     355 | static inline void *kasan_krealloc(const void *object, size_t new_size,
         |                                                               ^
   include/linux/kasan.h:356:12: warning: unused parameter 'flags' [-Wunused-parameter]
     356 |                                  gfp_t flags)
         |                                        ^
   include/linux/kasan.h:360:49: warning: unused parameter 'address' [-Wunused-parameter]
     360 | static inline bool kasan_check_byte(const void *address)
         |                                                 ^
   include/linux/kasan.h:370:66: warning: unused parameter 'task' [-Wunused-parameter]
     370 | static inline void kasan_unpoison_task_stack(struct task_struct *task) {}
         |                                                                  ^
   include/linux/kasan.h:382:58: warning: unused parameter 'cache' [-Wunused-parameter]
     382 | static inline void kasan_cache_shrink(struct kmem_cache *cache) {}
         |                                                          ^
   include/linux/kasan.h:383:60: warning: unused parameter 'cache' [-Wunused-parameter]
     383 | static inline void kasan_cache_shutdown(struct kmem_cache *cache) {}
         |                                                            ^
   include/linux/kasan.h:384:49: warning: unused parameter 'ptr' [-Wunused-parameter]
     384 | static inline void kasan_record_aux_stack(void *ptr) {}
         |                                                 ^
   include/linux/kasan.h:385:57: warning: unused parameter 'ptr' [-Wunused-parameter]
     385 | static inline void kasan_record_aux_stack_noalloc(void *ptr) {}
         |                                                         ^
   include/linux/kasan.h:446:56: warning: unused parameter 'start' [-Wunused-parameter]
     446 | static inline int kasan_populate_vmalloc(unsigned long start,
         |                                                        ^
   include/linux/kasan.h:447:20: warning: unused parameter 'size' [-Wunused-parameter]
     447 |                                         unsigned long size)
         |                                                       ^
   include/linux/kasan.h:452:53: warning: unused parameter 'start' [-Wunused-parameter]
     452 | static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
         |                                                     ^
   include/linux/kasan.h:452:74: warning: unused parameter 'size' [-Wunused-parameter]
     452 | static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
         |                                                                          ^
   include/linux/kasan.h:454:55: warning: unused parameter 'start' [-Wunused-parameter]
     454 | static inline void kasan_unpoison_vmalloc(const void *start, unsigned long size)
         |                                                       ^
   include/linux/kasan.h:454:76: warning: unused parameter 'size' [-Wunused-parameter]
     454 | static inline void kasan_unpoison_vmalloc(const void *start, unsigned long size)
         |                                                                            ^
   include/linux/kasan.h:456:56: warning: unused parameter 'start' [-Wunused-parameter]
     456 | static inline void kasan_release_vmalloc(unsigned long start,
         |                                                        ^
   include/linux/kasan.h:457:21: warning: unused parameter 'end' [-Wunused-parameter]
     457 |                                          unsigned long end,
         |                                                        ^
   include/linux/kasan.h:458:21: warning: unused parameter 'free_region_start' [-Wunused-parameter]
     458 |                                          unsigned long free_region_start,
         |                                                        ^
   include/linux/kasan.h:459:21: warning: unused parameter 'free_region_end' [-Wunused-parameter]
     459 |                                          unsigned long free_region_end) {}
         |                                                        ^
   include/linux/kasan.h:476:44: warning: unused parameter 'addr' [-Wunused-parameter]
     476 | static inline int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask) { return 0; }
         |                                            ^
   include/linux/kasan.h:476:57: warning: unused parameter 'size' [-Wunused-parameter]
     476 | static inline int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask) { return 0; }
         |                                                         ^
>> include/linux/kasan.h:476:69: warning: unused parameter 'gfp_mask' [-Wunused-parameter]
     476 | static inline int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask) { return 0; }
         |                                                                     ^
   include/linux/kasan.h:477:62: warning: unused parameter 'vm' [-Wunused-parameter]
     477 | static inline void kasan_free_shadow(const struct vm_struct *vm) {}
         |                                                              ^
   include/linux/kasan.h:484:59: warning: unused parameter 'addr' [-Wunused-parameter]
     484 | static inline void kasan_non_canonical_hook(unsigned long addr) { }
         |                                                           ^
   In file included from drivers/gpu/drm/i915/display/intel_connector.c:26:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/resource_ext.h:11:
   include/linux/slab.h:416:75: warning: unused parameter 'node' [-Wunused-parameter]
     416 | static __always_inline void *__kmalloc_node(size_t size, gfp_t flags, int node)
         |                                                                           ^
   include/linux/slab.h:421:91: warning: unused parameter 'node' [-Wunused-parameter]
     421 | static __always_inline void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t flags, int node)
         |                                                                                           ^
   include/linux/slab.h:438:14: warning: unused parameter 'node' [-Wunused-parameter]
     438 |                               int node, size_t size)
         |                                   ^
   In file included from drivers/gpu/drm/i915/display/intel_connector.c:26:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:15:
   include/linux/sem.h:25:46: warning: unused parameter 'clone_flags' [-Wunused-parameter]
      25 | static inline int copy_semundo(unsigned long clone_flags, struct task_struct *tsk)
         |                                              ^
   include/linux/sem.h:25:79: warning: unused parameter 'tsk' [-Wunused-parameter]
      25 | static inline int copy_semundo(unsigned long clone_flags, struct task_struct *tsk)
         |                                                                               ^
   include/linux/sem.h:30:49: warning: unused parameter 'tsk' [-Wunused-parameter]
      30 | static inline void exit_sem(struct task_struct *tsk)
         |                                                 ^
   In file included from drivers/gpu/drm/i915/display/intel_connector.c:26:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:16:
   include/linux/shm.h:27:33: warning: unused parameter 'shmid' [-Wunused-parameter]
      27 | static inline long do_shmat(int shmid, char __user *shmaddr,
         |                                 ^
   include/linux/shm.h:27:53: warning: unused parameter 'shmaddr' [-Wunused-parameter]
      27 | static inline long do_shmat(int shmid, char __user *shmaddr,
         |                                                     ^
   include/linux/shm.h:28:12: warning: unused parameter 'shmflg' [-Wunused-parameter]
      28 |                             int shmflg, unsigned long *addr,
         |                                 ^
   include/linux/shm.h:28:35: warning: unused parameter 'addr' [-Wunused-parameter]
      28 |                             int shmflg, unsigned long *addr,
         |                                                        ^
   include/linux/shm.h:29:22: warning: unused parameter 'shmlba' [-Wunused-parameter]
      29 |                             unsigned long shmlba)
         |                                           ^
   include/linux/shm.h:33:55: warning: unused parameter 'file' [-Wunused-parameter]
      33 | static inline bool is_file_shm_hugepages(struct file *file)
         |                                                       ^
   include/linux/shm.h:37:49: warning: unused parameter 'task' [-Wunused-parameter]
      37 | static inline void exit_shm(struct task_struct *task)
         |                                                 ^
   include/linux/shm.h:40:54: warning: unused parameter 'task' [-Wunused-parameter]
      40 | static inline void shm_init_task(struct task_struct *task)
         |                                                      ^
   In file included from drivers/gpu/drm/i915/display/intel_connector.c:26:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:17:
   include/linux/kcov.h:57:55: warning: unused parameter 't' [-Wunused-parameter]
      57 | static inline void kcov_task_init(struct task_struct *t) {}
         |                                                       ^
   include/linux/kcov.h:58:55: warning: unused parameter 't' [-Wunused-parameter]
      58 | static inline void kcov_task_exit(struct task_struct *t) {}
         |                                                       ^
   include/linux/kcov.h:59:60: warning: unused parameter 't' [-Wunused-parameter]
      59 | static inline void kcov_prepare_switch(struct task_struct *t) {}
         |                                                            ^
   include/linux/kcov.h:60:59: warning: unused parameter 't' [-Wunused-parameter]
      60 | static inline void kcov_finish_switch(struct task_struct *t) {}
         |                                                           ^
   include/linux/kcov.h:61:42: warning: unused parameter 'handle' [-Wunused-parameter]
      61 | static inline void kcov_remote_start(u64 handle) {}
         |                                          ^
   include/linux/kcov.h:67:49: warning: unused parameter 'id' [-Wunused-parameter]
      67 | static inline void kcov_remote_start_common(u64 id) {}
         |                                                 ^
   include/linux/kcov.h:68:46: warning: unused parameter 'id' [-Wunused-parameter]
      68 | static inline void kcov_remote_start_usb(u64 id) {}
         |                                              ^
   In file included from drivers/gpu/drm/i915/display/intel_connector.c:26:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:15:
--
         |                                                            ^
   include/linux/kasan.h:335:55: warning: unused parameter 's' [-Wunused-parameter]
     335 | static inline bool kasan_slab_free(struct kmem_cache *s, void *object, bool init)
         |                                                       ^
   include/linux/kasan.h:335:64: warning: unused parameter 'object' [-Wunused-parameter]
     335 | static inline bool kasan_slab_free(struct kmem_cache *s, void *object, bool init)
         |                                                                ^
   include/linux/kasan.h:335:77: warning: unused parameter 'init' [-Wunused-parameter]
     335 | static inline bool kasan_slab_free(struct kmem_cache *s, void *object, bool init)
         |                                                                             ^
   include/linux/kasan.h:339:44: warning: unused parameter 'ptr' [-Wunused-parameter]
     339 | static inline void kasan_kfree_large(void *ptr) {}
         |                                            ^
   include/linux/kasan.h:340:50: warning: unused parameter 'ptr' [-Wunused-parameter]
     340 | static inline void kasan_slab_free_mempool(void *ptr) {}
         |                                                  ^
   include/linux/kasan.h:341:57: warning: unused parameter 's' [-Wunused-parameter]
     341 | static inline void *kasan_slab_alloc(struct kmem_cache *s, void *object,
         |                                                         ^
   include/linux/kasan.h:342:14: warning: unused parameter 'flags' [-Wunused-parameter]
     342 |                                    gfp_t flags, bool init)
         |                                          ^
   include/linux/kasan.h:342:26: warning: unused parameter 'init' [-Wunused-parameter]
     342 |                                    gfp_t flags, bool init)
         |                                                      ^
   include/linux/kasan.h:346:54: warning: unused parameter 's' [-Wunused-parameter]
     346 | static inline void *kasan_kmalloc(struct kmem_cache *s, const void *object,
         |                                                      ^
   include/linux/kasan.h:347:12: warning: unused parameter 'size' [-Wunused-parameter]
     347 |                                 size_t size, gfp_t flags)
         |                                        ^
   include/linux/kasan.h:347:24: warning: unused parameter 'flags' [-Wunused-parameter]
     347 |                                 size_t size, gfp_t flags)
         |                                                    ^
   include/linux/kasan.h:351:65: warning: unused parameter 'size' [-Wunused-parameter]
     351 | static inline void *kasan_kmalloc_large(const void *ptr, size_t size, gfp_t flags)
         |                                                                 ^
   include/linux/kasan.h:351:77: warning: unused parameter 'flags' [-Wunused-parameter]
     351 | static inline void *kasan_kmalloc_large(const void *ptr, size_t size, gfp_t flags)
         |                                                                             ^
   include/linux/kasan.h:355:63: warning: unused parameter 'new_size' [-Wunused-parameter]
     355 | static inline void *kasan_krealloc(const void *object, size_t new_size,
         |                                                               ^
   include/linux/kasan.h:356:12: warning: unused parameter 'flags' [-Wunused-parameter]
     356 |                                  gfp_t flags)
         |                                        ^
   include/linux/kasan.h:360:49: warning: unused parameter 'address' [-Wunused-parameter]
     360 | static inline bool kasan_check_byte(const void *address)
         |                                                 ^
   include/linux/kasan.h:370:66: warning: unused parameter 'task' [-Wunused-parameter]
     370 | static inline void kasan_unpoison_task_stack(struct task_struct *task) {}
         |                                                                  ^
   include/linux/kasan.h:382:58: warning: unused parameter 'cache' [-Wunused-parameter]
     382 | static inline void kasan_cache_shrink(struct kmem_cache *cache) {}
         |                                                          ^
   include/linux/kasan.h:383:60: warning: unused parameter 'cache' [-Wunused-parameter]
     383 | static inline void kasan_cache_shutdown(struct kmem_cache *cache) {}
         |                                                            ^
   include/linux/kasan.h:384:49: warning: unused parameter 'ptr' [-Wunused-parameter]
     384 | static inline void kasan_record_aux_stack(void *ptr) {}
         |                                                 ^
   include/linux/kasan.h:385:57: warning: unused parameter 'ptr' [-Wunused-parameter]
     385 | static inline void kasan_record_aux_stack_noalloc(void *ptr) {}
         |                                                         ^
   include/linux/kasan.h:446:56: warning: unused parameter 'start' [-Wunused-parameter]
     446 | static inline int kasan_populate_vmalloc(unsigned long start,
         |                                                        ^
   include/linux/kasan.h:447:20: warning: unused parameter 'size' [-Wunused-parameter]
     447 |                                         unsigned long size)
         |                                                       ^
   include/linux/kasan.h:452:53: warning: unused parameter 'start' [-Wunused-parameter]
     452 | static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
         |                                                     ^
   include/linux/kasan.h:452:74: warning: unused parameter 'size' [-Wunused-parameter]
     452 | static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
         |                                                                          ^
   include/linux/kasan.h:454:55: warning: unused parameter 'start' [-Wunused-parameter]
     454 | static inline void kasan_unpoison_vmalloc(const void *start, unsigned long size)
         |                                                       ^
   include/linux/kasan.h:454:76: warning: unused parameter 'size' [-Wunused-parameter]
     454 | static inline void kasan_unpoison_vmalloc(const void *start, unsigned long size)
         |                                                                            ^
   include/linux/kasan.h:456:56: warning: unused parameter 'start' [-Wunused-parameter]
     456 | static inline void kasan_release_vmalloc(unsigned long start,
         |                                                        ^
   include/linux/kasan.h:457:21: warning: unused parameter 'end' [-Wunused-parameter]
     457 |                                          unsigned long end,
         |                                                        ^
   include/linux/kasan.h:458:21: warning: unused parameter 'free_region_start' [-Wunused-parameter]
     458 |                                          unsigned long free_region_start,
         |                                                        ^
   include/linux/kasan.h:459:21: warning: unused parameter 'free_region_end' [-Wunused-parameter]
     459 |                                          unsigned long free_region_end) {}
         |                                                        ^
   include/linux/kasan.h:476:44: warning: unused parameter 'addr' [-Wunused-parameter]
     476 | static inline int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask) { return 0; }
         |                                            ^
   include/linux/kasan.h:476:57: warning: unused parameter 'size' [-Wunused-parameter]
     476 | static inline int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask) { return 0; }
         |                                                         ^
>> include/linux/kasan.h:476:69: warning: unused parameter 'gfp_mask' [-Wunused-parameter]
     476 | static inline int kasan_module_alloc(void *addr, size_t size, gfp_t gfp_mask) { return 0; }
         |                                                                     ^
   include/linux/kasan.h:477:62: warning: unused parameter 'vm' [-Wunused-parameter]
     477 | static inline void kasan_free_shadow(const struct vm_struct *vm) {}
         |                                                              ^
   include/linux/kasan.h:484:59: warning: unused parameter 'addr' [-Wunused-parameter]
     484 | static inline void kasan_non_canonical_hook(unsigned long addr) { }
         |                                                           ^
   In file included from drivers/gpu/drm/i915/gt/shmem_utils.c:6:
   In file included from include/linux/mm.h:35:
   include/linux/page_pinner.h:66:51: warning: unused parameter 'page' [-Wunused-parameter]
      66 | static inline void reset_page_pinner(struct page *page, unsigned int order)
         |                                                   ^
   include/linux/page_pinner.h:66:70: warning: unused parameter 'order' [-Wunused-parameter]
      66 | static inline void reset_page_pinner(struct page *page, unsigned int order)
         |                                                                      ^
   include/linux/page_pinner.h:69:50: warning: unused parameter 'page' [-Wunused-parameter]
      69 | static inline void free_page_pinner(struct page *page, unsigned int order)
         |                                                  ^
   include/linux/page_pinner.h:69:69: warning: unused parameter 'order' [-Wunused-parameter]
      69 | static inline void free_page_pinner(struct page *page, unsigned int order)
         |                                                                     ^
   include/linux/page_pinner.h:72:49: warning: unused parameter 'page' [-Wunused-parameter]
      72 | static inline void set_page_pinner(struct page *page, unsigned int order)
         |                                                 ^
   include/linux/page_pinner.h:72:68: warning: unused parameter 'order' [-Wunused-parameter]
      72 | static inline void set_page_pinner(struct page *page, unsigned int order)
         |                                                                    ^
   include/linux/page_pinner.h:75:50: warning: unused parameter 'page' [-Wunused-parameter]
      75 | static inline void dump_page_pinner(struct page *page)
         |                                                  ^
   include/linux/page_pinner.h:78:54: warning: unused parameter 'page' [-Wunused-parameter]
      78 | static inline void page_pinner_put_page(struct page *page)
         |                                                      ^
   include/linux/page_pinner.h:81:60: warning: unused parameter 'page' [-Wunused-parameter]
      81 | static inline void page_pinner_failure_detect(struct page *page)
         |                                                            ^
   include/linux/page_pinner.h:84:78: warning: unused parameter 'page_list' [-Wunused-parameter]
      84 | static inline void page_pinner_mark_migration_failed_pages(struct list_head *page_list)
         |                                                                              ^
   In file included from drivers/gpu/drm/i915/gt/shmem_utils.c:6:
   In file included from include/linux/mm.h:739:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   include/linux/xarray.h:1176:51: warning: unused parameter 'xa' [-Wunused-parameter]
    1176 | static inline void *xa_entry(const struct xarray *xa,
         |                                                   ^
   include/linux/xarray.h:1185:58: warning: unused parameter 'xa' [-Wunused-parameter]
    1185 | static inline void *xa_entry_locked(const struct xarray *xa,
         |                                                          ^
   include/linux/xarray.h:1194:62: warning: unused parameter 'xa' [-Wunused-parameter]
    1194 | static inline struct xa_node *xa_parent(const struct xarray *xa,
         |                                                              ^
   include/linux/xarray.h:1202:69: warning: unused parameter 'xa' [-Wunused-parameter]
    1202 | static inline struct xa_node *xa_parent_locked(const struct xarray *xa,
         |                                                                     ^
   include/linux/xarray.h:1515:47: warning: unused parameter 'xa' [-Wunused-parameter]
    1515 | static inline int xa_get_order(struct xarray *xa, unsigned long index)
         |                                               ^
   include/linux/xarray.h:1515:65: warning: unused parameter 'index' [-Wunused-parameter]
    1515 | static inline int xa_get_order(struct xarray *xa, unsigned long index)
         |                                                                 ^
   include/linux/xarray.h:1521:16: warning: unused parameter 'order' [-Wunused-parameter]
    1521 |                 unsigned int order)
         |                              ^
   include/linux/xarray.h:1526:53: warning: unused parameter 'xas' [-Wunused-parameter]
    1526 | static inline void xas_split_alloc(struct xa_state *xas, void *entry,
         |                                                     ^
   include/linux/xarray.h:1526:64: warning: unused parameter 'entry' [-Wunused-parameter]
    1526 | static inline void xas_split_alloc(struct xa_state *xas, void *entry,
         |                                                                ^
   include/linux/xarray.h:1527:16: warning: unused parameter 'order' [-Wunused-parameter]
    1527 |                 unsigned int order, gfp_t gfp)
         |                              ^
   include/linux/xarray.h:1527:29: warning: unused parameter 'gfp' [-Wunused-parameter]
    1527 |                 unsigned int order, gfp_t gfp)
         |                                           ^
   In file included from drivers/gpu/drm/i915/gt/shmem_utils.c:6:
   In file included from include/linux/mm.h:739:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:20:
   In file included from include/linux/local_lock.h:5:
   include/linux/local_lock_internal.h:45:53: warning: unused parameter 'l' [-Wunused-parameter]
      45 | static inline void local_lock_acquire(local_lock_t *l) { }
         |                                                     ^
   include/linux/local_lock_internal.h:46:53: warning: unused parameter 'l' [-Wunused-parameter]
      46 | static inline void local_lock_release(local_lock_t *l) { }
         |                                                     ^
   include/linux/local_lock_internal.h:47:56: warning: unused parameter 'l' [-Wunused-parameter]
      47 | static inline void local_lock_debug_init(local_lock_t *l) { }
         |                                                        ^
   In file included from drivers/gpu/drm/i915/gt/shmem_utils.c:6:
   In file included from include/linux/mm.h:739:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:15:
   include/linux/radix-tree.h:190:20: warning: unused parameter 'treelock' [-Wunused-parameter]
     190 |                                                         spinlock_t *treelock)
         |                                                                     ^
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
