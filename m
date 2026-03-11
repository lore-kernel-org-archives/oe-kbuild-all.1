Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C873148CF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 15:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242653; cv=none; b=Y0MPZ8XhpX/3eqzwxEMYmNvN83ucIvFOFQqGoH8U7auAA6teRdpYERH27rymLhTjyu9Y8EyQ/FGn/074y42AWPSMmWKZBMUb+y+JQTuppolpfmTDuYsVXt4ZYeOVkLi3Rd91HLQuxxV61kEyzzZF6YgbYdUwTSYWHSwAqeXBzWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242653; c=relaxed/simple;
	bh=HctsUZPS/4M/lEJE90V9ju+5LUcPy44kEg50Ha0UZ5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=olmrB75qpAzr/pU0Abq4KU2TEceRaixliABL/ff4In6NeEuM14IHG+Ch2LIWV3EeG1qJY2Ksq3PbAcccDQZImngajnLwdswgUEyqO+2mPCH5DPRaS9hq/NApxwbIIPD69le5ZnXE+DwThmN0yiAcpWxzPEZS9rLhvmXHVcB6Jrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVuIvGb0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVuIvGb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773242648; x=1804778648;
  h=date:from:to:cc:subject:message-id;
  bh=HctsUZPS/4M/lEJE90V9ju+5LUcPy44kEg50Ha0UZ5M=;
  b=LVuIvGb0HC+yUHQ0ZEnm6D0DXrE7Ly8jRgVpU/r2FNA1rCOw/cpGgWnE
   wgBN81OVFIh/lMIFDTeFuzhb435KpXSmQTd0BDNVGy+tOlJ6fNmSJ76Dw
   mlYfFO5RMmInNnPquFq6Bsc0dvUp+iMeQ+BJT8/ic7XTwfql7MK9OPL5A
   ROfeEJCylvreCiqmIveDtlvITDIDtayllu1u4XYjr+0DIOkyV8WHz/NEv
   3RL/CjU2IPUEu8eawzF6mYYyTz+Ocj/iNcnS7bobUnLrG718CaGFiizVS
   3MFqT2wi6xf7Wx8AfCoH7r/pVM4CATTRy4lC+xlzzvT7uhjUsFN/4uzBv
   g==;
X-CSE-ConnectionGUID: fum1qW7rRZKl5iJvB0yqkQ==
X-CSE-MsgGUID: k3sIC+QGRdePlLP7tPTh8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85667552"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85667552"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 08:24:07 -0700
X-CSE-ConnectionGUID: r0UmmDJ2Rh6BiFqmqfksVg==
X-CSE-MsgGUID: bx5ErNY1RNubaGqohqKZkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="225477808"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Mar 2026 08:24:05 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0LPm-000000001LJ-47pF;
	Wed, 11 Mar 2026 15:24:02 +0000
Date: Wed, 11 Mar 2026 23:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/3]
 include/linux/page_pinner.h:73:78: warning: unused parameter 'page_list'
Message-ID: <202603112354.TX8DX0kb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   105c73abbf7684dce0bec06bf6c17645c20b6f04
commit: ddc4a48797352076586ef3ab79c6bfaba08fd06e [0/3] ANDROID: mm: page_pinner: introduce failure_tracking feature
config: i386-randconfig-016-20260311 (https://download.01.org/0day-ci/archive/20260311/202603112354.TX8DX0kb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7d47b695929cc7f85eeb0f87d0189adc04c1c629)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603112354.TX8DX0kb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603112354.TX8DX0kb-lkp@intel.com/

All warnings (new ones prefixed by >>):

     334 | static inline void *kasan_kmalloc_large(const void *ptr, size_t size, gfp_t flags)
         |                                                                 ^
   include/linux/kasan.h:334:77: warning: unused parameter 'flags' [-Wunused-parameter]
     334 | static inline void *kasan_kmalloc_large(const void *ptr, size_t size, gfp_t flags)
         |                                                                             ^
   include/linux/kasan.h:338:63: warning: unused parameter 'new_size' [-Wunused-parameter]
     338 | static inline void *kasan_krealloc(const void *object, size_t new_size,
         |                                                               ^
   include/linux/kasan.h:339:12: warning: unused parameter 'flags' [-Wunused-parameter]
     339 |                                  gfp_t flags)
         |                                        ^
   include/linux/kasan.h:343:49: warning: unused parameter 'address' [-Wunused-parameter]
     343 | static inline bool kasan_check_byte(const void *address)
         |                                                 ^
   include/linux/kasan.h:353:66: warning: unused parameter 'task' [-Wunused-parameter]
     353 | static inline void kasan_unpoison_task_stack(struct task_struct *task) {}
         |                                                                  ^
   include/linux/kasan.h:364:58: warning: unused parameter 'cache' [-Wunused-parameter]
     364 | static inline void kasan_cache_shrink(struct kmem_cache *cache) {}
         |                                                          ^
   include/linux/kasan.h:365:60: warning: unused parameter 'cache' [-Wunused-parameter]
     365 | static inline void kasan_cache_shutdown(struct kmem_cache *cache) {}
         |                                                            ^
   include/linux/kasan.h:366:49: warning: unused parameter 'ptr' [-Wunused-parameter]
     366 | static inline void kasan_record_aux_stack(void *ptr) {}
         |                                                 ^
   include/linux/kasan.h:427:56: warning: unused parameter 'start' [-Wunused-parameter]
     427 | static inline int kasan_populate_vmalloc(unsigned long start,
         |                                                        ^
   include/linux/kasan.h:428:20: warning: unused parameter 'size' [-Wunused-parameter]
     428 |                                         unsigned long size)
         |                                                       ^
   include/linux/kasan.h:433:53: warning: unused parameter 'start' [-Wunused-parameter]
     433 | static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
         |                                                     ^
   include/linux/kasan.h:433:74: warning: unused parameter 'size' [-Wunused-parameter]
     433 | static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
         |                                                                          ^
   include/linux/kasan.h:435:55: warning: unused parameter 'start' [-Wunused-parameter]
     435 | static inline void kasan_unpoison_vmalloc(const void *start, unsigned long size)
         |                                                       ^
   include/linux/kasan.h:435:76: warning: unused parameter 'size' [-Wunused-parameter]
     435 | static inline void kasan_unpoison_vmalloc(const void *start, unsigned long size)
         |                                                                            ^
   include/linux/kasan.h:437:56: warning: unused parameter 'start' [-Wunused-parameter]
     437 | static inline void kasan_release_vmalloc(unsigned long start,
         |                                                        ^
   include/linux/kasan.h:438:21: warning: unused parameter 'end' [-Wunused-parameter]
     438 |                                          unsigned long end,
         |                                                        ^
   include/linux/kasan.h:439:21: warning: unused parameter 'free_region_start' [-Wunused-parameter]
     439 |                                          unsigned long free_region_start,
         |                                                        ^
   include/linux/kasan.h:440:21: warning: unused parameter 'free_region_end' [-Wunused-parameter]
     440 |                                          unsigned long free_region_end) {}
         |                                                        ^
   include/linux/kasan.h:457:44: warning: unused parameter 'addr' [-Wunused-parameter]
     457 | static inline int kasan_module_alloc(void *addr, size_t size) { return 0; }
         |                                            ^
   include/linux/kasan.h:457:57: warning: unused parameter 'size' [-Wunused-parameter]
     457 | static inline int kasan_module_alloc(void *addr, size_t size) { return 0; }
         |                                                         ^
   include/linux/kasan.h:458:62: warning: unused parameter 'vm' [-Wunused-parameter]
     458 | static inline void kasan_free_shadow(const struct vm_struct *vm) {}
         |                                                              ^
   include/linux/kasan.h:465:59: warning: unused parameter 'addr' [-Wunused-parameter]
     465 | static inline void kasan_non_canonical_hook(unsigned long addr) { }
         |                                                           ^
   In file included from drivers/gpu/drm/i915/gt/gen6_engine_cs.c:7:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:5:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:29:
   In file included from include/linux/ftrace.h:11:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:35:
   include/linux/page_pinner.h:58:51: warning: unused parameter 'page' [-Wunused-parameter]
      58 | static inline void reset_page_pinner(struct page *page, unsigned int order)
         |                                                   ^
   include/linux/page_pinner.h:58:70: warning: unused parameter 'order' [-Wunused-parameter]
      58 | static inline void reset_page_pinner(struct page *page, unsigned int order)
         |                                                                      ^
   include/linux/page_pinner.h:61:50: warning: unused parameter 'page' [-Wunused-parameter]
      61 | static inline void free_page_pinner(struct page *page, unsigned int order)
         |                                                  ^
   include/linux/page_pinner.h:61:69: warning: unused parameter 'order' [-Wunused-parameter]
      61 | static inline void free_page_pinner(struct page *page, unsigned int order)
         |                                                                     ^
   include/linux/page_pinner.h:64:49: warning: unused parameter 'page' [-Wunused-parameter]
      64 | static inline void set_page_pinner(struct page *page, unsigned int order)
         |                                                 ^
   include/linux/page_pinner.h:64:68: warning: unused parameter 'order' [-Wunused-parameter]
      64 | static inline void set_page_pinner(struct page *page, unsigned int order)
         |                                                                    ^
   include/linux/page_pinner.h:67:50: warning: unused parameter 'page' [-Wunused-parameter]
      67 | static inline void dump_page_pinner(struct page *page)
         |                                                  ^
   include/linux/page_pinner.h:70:62: warning: unused parameter 'page' [-Wunused-parameter]
      70 | static inline void page_pinner_migration_failed(struct page *page)
         |                                                              ^
>> include/linux/page_pinner.h:73:78: warning: unused parameter 'page_list' [-Wunused-parameter]
      73 | static inline void page_pinner_mark_migration_failed_pages(struct list_head *page_list)
         |                                                                              ^
   In file included from drivers/gpu/drm/i915/gt/gen6_engine_cs.c:7:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:5:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:29:
   In file included from include/linux/ftrace.h:11:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:738:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
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
   In file included from drivers/gpu/drm/i915/gt/gen6_engine_cs.c:7:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:5:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:29:
   In file included from include/linux/ftrace.h:11:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:738:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:479:22: warning: unused parameter 'sig' [-Wunused-parameter]
     479 |                                                  unsigned long sig,
         |                                                                ^
   include/linux/signal.h:480:22: warning: unused parameter 'si_code' [-Wunused-parameter]
     480 |                                                  unsigned long si_code)
         |                                                                ^
   In file included from drivers/gpu/drm/i915/gt/gen6_engine_cs.c:7:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:5:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:29:
   In file included from include/linux/ftrace.h:11:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:738:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   include/linux/sched/task.h:150:78: warning: unused parameter 't' [-Wunused-parameter]
     150 | static inline struct vm_struct *task_stack_vm_area(const struct task_struct *t)
         |                                                                              ^
   In file included from drivers/gpu/drm/i915/gt/gen6_engine_cs.c:7:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:5:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:29:
   In file included from include/linux/ftrace.h:11:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:738:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:10:
   include/linux/cred.h:203:54: warning: unused parameter 'cred' [-Wunused-parameter]
     203 | static inline void validate_creds(const struct cred *cred)
         |                                                      ^
   include/linux/cred.h:206:67: warning: unused parameter 'tsk' [-Wunused-parameter]
     206 | static inline void validate_creds_for_do_exit(struct task_struct *tsk)
         |                                                                   ^
   In file included from drivers/gpu/drm/i915/gt/gen6_engine_cs.c:7:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:5:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:29:
   In file included from include/linux/ftrace.h:11:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:738:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   include/linux/percpu-rwsem.h:142:11: warning: unused parameter 'read' [-Wunused-parameter]
     142 |                                         bool read, unsigned long ip)
--
         |                                    ^
   include/linux/pgtable.h:1133:40: warning: unused parameter 'pud' [-Wunused-parameter]
    1133 | static inline int pud_trans_huge(pud_t pud)
         |                                        ^
   include/linux/pgtable.h:1154:45: warning: unused parameter 'pud' [-Wunused-parameter]
    1154 | static inline int pud_trans_unstable(pud_t *pud)
         |                                             ^
   include/linux/pgtable.h:1257:45: warning: unused parameter 'pmd' [-Wunused-parameter]
    1257 | static inline int pmd_trans_unstable(pmd_t *pmd)
         |                                             ^
   include/linux/pgtable.h:1286:38: warning: unused parameter 'pte' [-Wunused-parameter]
    1286 | static inline int pte_protnone(pte_t pte)
         |                                      ^
   include/linux/pgtable.h:1291:38: warning: unused parameter 'pmd' [-Wunused-parameter]
    1291 | static inline int pmd_protnone(pmd_t pmd)
         |                                      ^
   include/linux/pgtable.h:1323:39: warning: unused parameter 'p4d' [-Wunused-parameter]
    1323 | static inline int p4d_set_huge(p4d_t *p4d, phys_addr_t addr, pgprot_t prot)
         |                                       ^
   include/linux/pgtable.h:1323:56: warning: unused parameter 'addr' [-Wunused-parameter]
    1323 | static inline int p4d_set_huge(p4d_t *p4d, phys_addr_t addr, pgprot_t prot)
         |                                                        ^
   include/linux/pgtable.h:1323:71: warning: unused parameter 'prot' [-Wunused-parameter]
    1323 | static inline int p4d_set_huge(p4d_t *p4d, phys_addr_t addr, pgprot_t prot)
         |                                                                       ^
   include/linux/pgtable.h:1327:39: warning: unused parameter 'pud' [-Wunused-parameter]
    1327 | static inline int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
         |                                       ^
   include/linux/pgtable.h:1327:56: warning: unused parameter 'addr' [-Wunused-parameter]
    1327 | static inline int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
         |                                                        ^
   include/linux/pgtable.h:1327:71: warning: unused parameter 'prot' [-Wunused-parameter]
    1327 | static inline int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
         |                                                                       ^
   include/linux/pgtable.h:1331:39: warning: unused parameter 'pmd' [-Wunused-parameter]
    1331 | static inline int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
         |                                       ^
   include/linux/pgtable.h:1331:56: warning: unused parameter 'addr' [-Wunused-parameter]
    1331 | static inline int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
         |                                                        ^
   include/linux/pgtable.h:1331:71: warning: unused parameter 'prot' [-Wunused-parameter]
    1331 | static inline int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
         |                                                                       ^
   include/linux/pgtable.h:1335:41: warning: unused parameter 'p4d' [-Wunused-parameter]
    1335 | static inline int p4d_clear_huge(p4d_t *p4d)
         |                                         ^
   include/linux/pgtable.h:1339:41: warning: unused parameter 'pud' [-Wunused-parameter]
    1339 | static inline int pud_clear_huge(pud_t *pud)
         |                                         ^
   include/linux/pgtable.h:1343:41: warning: unused parameter 'pmd' [-Wunused-parameter]
    1343 | static inline int pmd_clear_huge(pmd_t *pmd)
         |                                         ^
   include/linux/pgtable.h:1347:44: warning: unused parameter 'p4d' [-Wunused-parameter]
    1347 | static inline int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
         |                                            ^
   include/linux/pgtable.h:1347:63: warning: unused parameter 'addr' [-Wunused-parameter]
    1347 | static inline int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
         |                                                               ^
   include/linux/pgtable.h:1351:44: warning: unused parameter 'pud' [-Wunused-parameter]
    1351 | static inline int pud_free_pmd_page(pud_t *pud, unsigned long addr)
         |                                            ^
   include/linux/pgtable.h:1351:63: warning: unused parameter 'addr' [-Wunused-parameter]
    1351 | static inline int pud_free_pmd_page(pud_t *pud, unsigned long addr)
         |                                                               ^
   include/linux/pgtable.h:1355:44: warning: unused parameter 'pmd' [-Wunused-parameter]
    1355 | static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
         |                                            ^
   include/linux/pgtable.h:1355:63: warning: unused parameter 'addr' [-Wunused-parameter]
    1355 | static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
         |                                                               ^
   In file included from drivers/gpu/drm/i915/i915_gem_gtt.c:18:
   In file included from drivers/gpu/drm/i915/display/intel_frontbuffer.h:30:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:10:
   In file included from include/drm/drm_gem.h:40:
   In file included from include/drm/drm_vma_manager.h:27:
   In file included from include/linux/mm.h:35:
   include/linux/page_pinner.h:58:51: warning: unused parameter 'page' [-Wunused-parameter]
      58 | static inline void reset_page_pinner(struct page *page, unsigned int order)
         |                                                   ^
   include/linux/page_pinner.h:58:70: warning: unused parameter 'order' [-Wunused-parameter]
      58 | static inline void reset_page_pinner(struct page *page, unsigned int order)
         |                                                                      ^
   include/linux/page_pinner.h:61:50: warning: unused parameter 'page' [-Wunused-parameter]
      61 | static inline void free_page_pinner(struct page *page, unsigned int order)
         |                                                  ^
   include/linux/page_pinner.h:61:69: warning: unused parameter 'order' [-Wunused-parameter]
      61 | static inline void free_page_pinner(struct page *page, unsigned int order)
         |                                                                     ^
   include/linux/page_pinner.h:64:49: warning: unused parameter 'page' [-Wunused-parameter]
      64 | static inline void set_page_pinner(struct page *page, unsigned int order)
         |                                                 ^
   include/linux/page_pinner.h:64:68: warning: unused parameter 'order' [-Wunused-parameter]
      64 | static inline void set_page_pinner(struct page *page, unsigned int order)
         |                                                                    ^
   include/linux/page_pinner.h:67:50: warning: unused parameter 'page' [-Wunused-parameter]
      67 | static inline void dump_page_pinner(struct page *page)
         |                                                  ^
   include/linux/page_pinner.h:70:62: warning: unused parameter 'page' [-Wunused-parameter]
      70 | static inline void page_pinner_migration_failed(struct page *page)
         |                                                              ^
>> include/linux/page_pinner.h:73:78: warning: unused parameter 'page_list' [-Wunused-parameter]
      73 | static inline void page_pinner_mark_migration_failed_pages(struct list_head *page_list)
         |                                                                              ^
   In file included from drivers/gpu/drm/i915/i915_gem_gtt.c:18:
   In file included from drivers/gpu/drm/i915/display/intel_frontbuffer.h:30:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:10:
   In file included from include/drm/drm_gem.h:40:
   In file included from include/drm/drm_vma_manager.h:27:
   In file included from include/linux/mm.h:738:
   include/linux/huge_mm.h:22:59: warning: unused parameter 'vmf' [-Wunused-parameter]
      22 | static inline void huge_pud_set_accessed(struct vm_fault *vmf, pud_t orig_pud)
         |                                                           ^
   include/linux/huge_mm.h:22:70: warning: unused parameter 'orig_pud' [-Wunused-parameter]
      22 | static inline void huge_pud_set_accessed(struct vm_fault *vmf, pud_t orig_pud)
         |                                                                      ^
   include/linux/huge_mm.h:362:74: warning: unused parameter 'vma' [-Wunused-parameter]
     362 | static inline bool __transparent_hugepage_enabled(struct vm_area_struct *vma)
         |                                                                          ^
   include/linux/huge_mm.h:367:72: warning: unused parameter 'vma' [-Wunused-parameter]
     367 | static inline bool transparent_hugepage_enabled(struct vm_area_struct *vma)
         |                                                                        ^
   include/linux/huge_mm.h:372:66: warning: unused parameter 'vma' [-Wunused-parameter]
     372 | static inline bool transhuge_vma_suitable(struct vm_area_struct *vma,
         |                                                                  ^
   include/linux/huge_mm.h:373:17: warning: unused parameter 'haddr' [-Wunused-parameter]
     373 |                 unsigned long haddr)
         |                               ^
   include/linux/huge_mm.h:378:53: warning: unused parameter 'page' [-Wunused-parameter]
     378 | static inline void prep_transhuge_page(struct page *page) {}
         |                                                     ^
   include/linux/huge_mm.h:380:57: warning: unused parameter 'page' [-Wunused-parameter]
     380 | static inline bool is_transparent_hugepage(struct page *page)
         |                                                         ^
   include/linux/huge_mm.h:390:34: warning: unused parameter 'page' [-Wunused-parameter]
     390 | can_split_huge_page(struct page *page, int *pextra_pins)
         |                                  ^
   include/linux/huge_mm.h:390:45: warning: unused parameter 'pextra_pins' [-Wunused-parameter]
     390 | can_split_huge_page(struct page *page, int *pextra_pins)
         |                                             ^
   include/linux/huge_mm.h:396:38: warning: unused parameter 'page' [-Wunused-parameter]
     396 | split_huge_page_to_list(struct page *page, struct list_head *list)
         |                                      ^
   include/linux/huge_mm.h:396:62: warning: unused parameter 'list' [-Wunused-parameter]
     396 | split_huge_page_to_list(struct page *page, struct list_head *list)
         |                                                              ^
   include/linux/huge_mm.h:400:48: warning: unused parameter 'page' [-Wunused-parameter]
     400 | static inline int split_huge_page(struct page *page)
         |                                                ^
   include/linux/huge_mm.h:404:58: warning: unused parameter 'page' [-Wunused-parameter]
     404 | static inline void deferred_split_huge_page(struct page *page) {}
         |                                                          ^
   include/linux/huge_mm.h:408:60: warning: unused parameter 'vma' [-Wunused-parameter]
     408 | static inline void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
         |                                                            ^
   include/linux/huge_mm.h:408:72: warning: unused parameter 'pmd' [-Wunused-parameter]
     408 | static inline void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
         |                                                                        ^
   include/linux/huge_mm.h:409:17: warning: unused parameter 'address' [-Wunused-parameter]
     409 |                 unsigned long address, bool freeze, struct page *page) {}
         |                               ^
   include/linux/huge_mm.h:409:31: warning: unused parameter 'freeze' [-Wunused-parameter]
     409 |                 unsigned long address, bool freeze, struct page *page) {}
         |                                             ^
   include/linux/huge_mm.h:409:52: warning: unused parameter 'page' [-Wunused-parameter]
     409 |                 unsigned long address, bool freeze, struct page *page) {}
         |                                                                  ^
   include/linux/huge_mm.h:410:66: warning: unused parameter 'vma' [-Wunused-parameter]
     410 | static inline void split_huge_pmd_address(struct vm_area_struct *vma,
         |                                                                  ^
   include/linux/huge_mm.h:411:17: warning: unused parameter 'address' [-Wunused-parameter]
     411 |                 unsigned long address, bool freeze, struct page *page) {}
         |                               ^
   include/linux/huge_mm.h:411:31: warning: unused parameter 'freeze' [-Wunused-parameter]
     411 |                 unsigned long address, bool freeze, struct page *page) {}
         |                                             ^
   include/linux/huge_mm.h:411:52: warning: unused parameter 'page' [-Wunused-parameter]
     411 |                 unsigned long address, bool freeze, struct page *page) {}
         |                                                                  ^
   include/linux/huge_mm.h:416:59: warning: unused parameter 'vma' [-Wunused-parameter]
     416 | static inline int hugepage_madvise(struct vm_area_struct *vma,
         |                                                           ^
   include/linux/huge_mm.h:417:23: warning: unused parameter 'vm_flags' [-Wunused-parameter]
     417 |                                    unsigned long *vm_flags, int advice)
         |                                                   ^
   include/linux/huge_mm.h:417:37: warning: unused parameter 'advice' [-Wunused-parameter]
     417 |                                    unsigned long *vm_flags, int advice)
         |                                                                 ^
   include/linux/huge_mm.h:422:65: warning: unused parameter 'vma' [-Wunused-parameter]
     422 | static inline void vma_adjust_trans_huge(struct vm_area_struct *vma,
         |                                                                 ^
   include/linux/huge_mm.h:423:21: warning: unused parameter 'start' [-Wunused-parameter]
     423 |                                          unsigned long start,
         |                                                        ^
   include/linux/huge_mm.h:424:21: warning: unused parameter 'end' [-Wunused-parameter]
     424 |                                          unsigned long end,
         |                                                        ^
   include/linux/huge_mm.h:425:12: warning: unused parameter 'adjust_next' [-Wunused-parameter]
     425 |                                          long adjust_next)
         |                                               ^
   include/linux/huge_mm.h:428:37: warning: unused parameter 'pmd' [-Wunused-parameter]
     428 | static inline int is_swap_pmd(pmd_t pmd)
..


vim +/page_list +73 include/linux/page_pinner.h

    49	
    50	static inline void page_pinner_mark_migration_failed_pages(struct list_head *page_list)
    51	{
    52		if (!static_branch_unlikely(&failure_tracking))
    53			return;
    54	
    55		__page_pinner_mark_migration_failed_pages(page_list);
    56	}
    57	#else
    58	static inline void reset_page_pinner(struct page *page, unsigned int order)
    59	{
    60	}
    61	static inline void free_page_pinner(struct page *page, unsigned int order)
    62	{
    63	}
  > 64	static inline void set_page_pinner(struct page *page, unsigned int order)
    65	{
    66	}
    67	static inline void dump_page_pinner(struct page *page)
    68	{
    69	}
    70	static inline void page_pinner_migration_failed(struct page *page)
    71	{
    72	}
  > 73	static inline void page_pinner_mark_migration_failed_pages(struct list_head *page_list)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
