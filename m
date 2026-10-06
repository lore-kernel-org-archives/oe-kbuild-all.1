Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAF84B26F6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 23:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328987; cv=none; b=tpy9zsFgfFGZTBejvtTbZg2zXwl1vYJRQhXwzTWCttjPKjM63xOFO9OoUD/HQN2SfvcDvb9qg7yPMtMPK7lIhOJvoUk+EUz2y0wFJgh61dH59r05cRRUE2z8OqtVIJmZej7Zj3XiZQ6huCLqYTQgEo9hfW3AavUQLH2KNh40bM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328987; c=relaxed/simple;
	bh=hFgAbbkEhN9HpIrwOcy0X9RG7GKURUMNqcytyHLPLLE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lFkH46kwhadWDvjir5Rtnse+1kGZ+plrllfJWSUAZwQose6aiIu5Bvzsd/T+EgN4c4ZGbCBB4B1kr33hFi2Sb1fwdrAzicOPcwzTcZ5gt14H2OvQKcSJMaTrgnTHUljfURRflBMUsyrq9Lp9JyCbBSey06Yz6pdghVXl9qu4D1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBDgwFjb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBDgwFjb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791328974; x=1822864974;
  h=date:from:to:cc:subject:message-id;
  bh=hFgAbbkEhN9HpIrwOcy0X9RG7GKURUMNqcytyHLPLLE=;
  b=JBDgwFjbCsWC0//TUuFKZ/VeUqC6oNGs0rVuq//UO+ww1XagirkgPU0U
   1Zsf97HlHXkylkQbPzNYApXWFT8WOtxIZUU3uV5Vp2cgh7j1cszEivIPz
   EvhTVqRNm1fiBws5jFdbdO2AEX7cLzucwDZk0mGdwyM8mdBwwJbkxrBBw
   qeKFtysvRXPUJUcHMIszlloEBnub8LWGa7ut7TPzWTv/VO8ElA0HDxwA7
   NUO+XA85TTaWw9yQ4xXko+2AsW1SJDlC2sGYqrAU0kJkzhvSPifWJxORK
   JENAreJ4lxeJvWBtDY3HuLqbBWAyKx9LR0FYTg5arCl4uh31q65nUv+3A
   Q==;
X-CSE-ConnectionGUID: NZzi4ZF7TimE/RtiwyZJyg==
X-CSE-MsgGUID: o+/r5YwzT4OOrGFsoPSWFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="76887"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="76887"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 16:22:53 -0700
X-CSE-ConnectionGUID: UFpqUFiuQFO5k5Cxd0XKuw==
X-CSE-MsgGUID: kxwGPTbCQhysITVSrtkPmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1352407"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 06 Oct 2026 16:22:52 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEEUj-0000000022F-3JhI;
	Tue, 06 Oct 2026 23:22:49 +0000
Date: Wed, 07 Oct 2026 01:22:15 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 15/15]
 include/trace/hooks/mm.h:318:1: sparse: sparse: incorrect type in argument 3
 (different base types)
Message-ID: <202610070130.bU3m1pla-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   efe665b77332621017fded6de1496bfff20ae5c6
commit: 4c8db444737a1b6080b86ed5fd5f57dad633c69e [15/15] ANDROID: page_alloc: add vendor hook to bypass free_pages_prepare
config: arm64-randconfig-r2307-20261006 (https://download.01.org/0day-ci/archive/20261007/202610070130.bU3m1pla-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project dbeca9a3a3ba0b46471efb339b0ea8f2194f6f68)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070130.bU3m1pla-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070130.bU3m1pla-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:1636:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1636:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1636:25: sparse:     got restricted fpi_t [usertype] fpi_flags
   mm/page_alloc.c:1644:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1644:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1644:25: sparse:     got restricted fpi_t [usertype] fpi_flags
   mm/page_alloc.c:1007:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:1007:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c: note: in included file:
>> include/trace/hooks/mm.h:318:1: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted int flags @@
   include/trace/hooks/mm.h:318:1: sparse:     expected restricted int flags
   include/trace/hooks/mm.h:318:1: sparse:     got restricted int flags
   include/trace/hooks/mm.h:318:1: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted int flags @@     got restricted int flags @@
   include/trace/hooks/mm.h:318:1: sparse:     expected restricted int flags
   include/trace/hooks/mm.h:318:1: sparse:     got restricted int flags
   include/trace/hooks/mm.h:322:1: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted int flags @@
   include/trace/hooks/mm.h:322:1: sparse:     expected restricted int flags
   include/trace/hooks/mm.h:322:1: sparse:     got restricted int flags
   include/trace/hooks/mm.h:322:1: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted int flags @@     got restricted int flags @@
   include/trace/hooks/mm.h:322:1: sparse:     expected restricted int flags
   include/trace/hooks/mm.h:322:1: sparse:     got restricted int flags
   mm/page_alloc.c:2991:13: sparse: sparse: context imbalance in '__free_frozen_pages' - different lock contexts for basic block
   mm/page_alloc.c:3103:33: sparse: sparse: context imbalance in 'free_unref_folios' - unexpected unlock
   mm/page_alloc.c:1007:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:3398:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:5311:9: sparse: sparse: context imbalance in 'alloc_pages_bulk_noprof' - different lock contexts for basic block
   mm/page_alloc.c:1007:31: sparse: sparse: cast from restricted fpi_t

vim +318 include/trace/hooks/mm.h

    32	
    33	DECLARE_RESTRICTED_HOOK(android_rvh_set_skip_swapcache_flags,
    34				TP_PROTO(gfp_t *flags),
    35				TP_ARGS(flags), 1);
    36	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    37				TP_PROTO(gfp_t *flags),
    38				TP_ARGS(flags), 1);
    39	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    40				TP_PROTO(gfp_t *flags),
    41				TP_ARGS(flags), 1);
    42	
    43	*/
    44	struct mem_cgroup;
    45	DECLARE_HOOK(android_vh_mem_cgroup_alloc,
    46		TP_PROTO(struct mem_cgroup *memcg),
    47		TP_ARGS(memcg));
    48	DECLARE_HOOK(android_vh_mem_cgroup_free,
    49		TP_PROTO(struct mem_cgroup *memcg),
    50		TP_ARGS(memcg));
    51	DECLARE_HOOK(android_vh_mem_cgroup_id_remove,
    52		TP_PROTO(struct mem_cgroup *memcg),
    53		TP_ARGS(memcg));
    54	struct cgroup_subsys_state;
    55	DECLARE_HOOK(android_vh_mem_cgroup_css_online,
    56		TP_PROTO(struct cgroup_subsys_state *css, struct mem_cgroup *memcg),
    57		TP_ARGS(css, memcg));
    58	DECLARE_HOOK(android_vh_mem_cgroup_css_offline,
    59		TP_PROTO(struct cgroup_subsys_state *css, struct mem_cgroup *memcg),
    60		TP_ARGS(css, memcg));
    61	DECLARE_HOOK(android_vh_slab_alloc_node,
    62		TP_PROTO(void *object, unsigned long addr, struct kmem_cache *s),
    63		TP_ARGS(object, addr, s));
    64	DECLARE_HOOK(android_vh_slab_free,
    65		TP_PROTO(unsigned long addr, struct kmem_cache *s),
    66		TP_ARGS(addr, s));
    67	DECLARE_HOOK(android_vh_meminfo_proc_show,
    68		TP_PROTO(struct seq_file *m),
    69		TP_ARGS(m));
    70	DECLARE_HOOK(android_vh_exit_mm,
    71		TP_PROTO(struct mm_struct *mm),
    72		TP_ARGS(mm));
    73	DECLARE_HOOK(android_vh_show_mem,
    74		TP_PROTO(unsigned int filter, nodemask_t *nodemask),
    75		TP_ARGS(filter, nodemask));
    76	DECLARE_HOOK(android_vh_print_slabinfo_header,
    77		TP_PROTO(struct seq_file *m),
    78		TP_ARGS(m));
    79	struct slabinfo;
    80	DECLARE_HOOK(android_vh_cache_show,
    81		TP_PROTO(struct seq_file *m, struct slabinfo *sinfo, struct kmem_cache *s),
    82		TP_ARGS(m, sinfo, s));
    83	DECLARE_HOOK(android_vh_ra_tuning_max_page,
    84		TP_PROTO(struct readahead_control *ractl, unsigned long *max_page),
    85		TP_ARGS(ractl, max_page));
    86	DECLARE_RESTRICTED_HOOK(android_rvh_vmalloc_node_bypass,
    87		TP_PROTO(unsigned long size, gfp_t gfp_mask, void **addr),
    88		TP_ARGS(size, gfp_mask, addr), 1);
    89	DECLARE_RESTRICTED_HOOK(android_rvh_vfree_bypass,
    90		TP_PROTO(const void *addr, bool *bypass),
    91		TP_ARGS(addr, bypass), 1);
    92	DECLARE_HOOK(android_vh_should_fault_around,
    93		TP_PROTO(struct vm_fault *vmf, bool *should_around),
    94		TP_ARGS(vmf, should_around));
    95	DECLARE_HOOK(android_vh_process_madvise_begin,
    96		TP_PROTO(struct task_struct *task, int behavior),
    97		TP_ARGS(task, behavior));
    98	DECLARE_HOOK(android_vh_process_madvise_iter,
    99		TP_PROTO(struct mm_struct *mm, int behavior, ssize_t *ret),
   100		TP_ARGS(mm, behavior, ret));
   101	DECLARE_HOOK(android_vh_madvise_swapin_walk_pmd_entry,
   102		TP_PROTO(swp_entry_t entry),
   103		TP_ARGS(entry));
   104	DECLARE_HOOK(android_vh_process_madvise,
   105		TP_PROTO(int behavior, ssize_t *ret, void *priv),
   106		TP_ARGS(behavior, ret, priv));
   107	DECLARE_RESTRICTED_HOOK(android_rvh_ctl_dirty_rate,
   108		TP_PROTO(struct inode *inode),
   109		TP_ARGS(inode), 1);
   110	DECLARE_HOOK(android_vh_adjust_kvmalloc_flags,
   111		TP_PROTO(unsigned int order, gfp_t *alloc_flags),
   112		TP_ARGS(order, alloc_flags));
   113	DECLARE_HOOK(android_vh_alloc_pages_reclaim_bypass,
   114	    TP_PROTO(gfp_t gfp_mask, int order, int alloc_flags,
   115		int migratetype, struct page **page),
   116		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, page));
   117	DECLARE_HOOK(android_vh_alloc_pages_failure_bypass,
   118		TP_PROTO(gfp_t gfp_mask, int order, int alloc_flags,
   119		int migratetype, struct page **page),
   120		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, page));
   121	DECLARE_HOOK(android_vh_kmalloc_large_alloced,
   122		TP_PROTO(struct folio *folio, unsigned int order, gfp_t flags),
   123		TP_ARGS(folio, order, flags));
   124	DECLARE_HOOK(android_vh_count_workingset_refault,
   125		TP_PROTO(struct folio *folio),
   126		TP_ARGS(folio));
   127	DECLARE_HOOK(android_vh_tune_mmap_readaround,
   128		TP_PROTO(unsigned int ra_pages, pgoff_t pgoff,
   129			pgoff_t *start, unsigned int *size, unsigned int *async_size),
   130		TP_ARGS(ra_pages, pgoff, start, size, async_size));
   131	DECLARE_HOOK(android_vh_page_should_be_protected,
   132		TP_PROTO(struct folio *folio, unsigned long nr_scanned,
   133		s8 priority, int *should_protect),
   134		TP_ARGS(folio, nr_scanned, priority, should_protect));
   135	DECLARE_HOOK(android_vh_slab_folio_alloced,
   136		TP_PROTO(unsigned int order, gfp_t flags),
   137		TP_ARGS(order, flags));
   138	DECLARE_HOOK(android_vh_rmqueue_smallest_bypass,
   139		TP_PROTO(struct page **page, struct zone *zone, int order, int migratetype),
   140		TP_ARGS(page, zone, order, migratetype));
   141	DECLARE_HOOK(android_vh_free_one_page_bypass,
   142		TP_PROTO(struct page *page, struct zone *zone, int order, int migratetype,
   143			int fpi_flags, bool *bypass),
   144		TP_ARGS(page, zone, order, migratetype, fpi_flags, bypass));
   145	DECLARE_HOOK(android_vh_reserve_highatomic_bypass,
   146		TP_PROTO(struct page *page, bool *bypass),
   147		TP_ARGS(page, bypass));
   148	DECLARE_HOOK(android_vh_migration_target_bypass,
   149		TP_PROTO(struct page *page, bool *bypass),
   150		TP_ARGS(page, bypass));
   151	DECLARE_HOOK(android_vh_watermark_fast_ok,
   152		TP_PROTO(unsigned int order, gfp_t gfp_mask, bool *is_watermark_ok),
   153		TP_ARGS(order, gfp_mask, is_watermark_ok));
   154	DECLARE_HOOK(android_vh_meminfo_cache_adjust,
   155		TP_PROTO(unsigned long *cached),
   156		TP_ARGS(cached));
   157	DECLARE_HOOK(android_vh_si_mem_available_adjust,
   158		TP_PROTO(unsigned long *available),
   159		TP_ARGS(available));
   160	DECLARE_HOOK(android_vh_si_meminfo_adjust,
   161		TP_PROTO(unsigned long *totalram, unsigned long *freeram),
   162		TP_ARGS(totalram, freeram));
   163	DECLARE_HOOK(android_vh_compact_finished,
   164		TP_PROTO(bool *abort_compact),
   165		TP_ARGS(abort_compact));
   166	DECLARE_HOOK(android_vh_madvise_cold_or_pageout_abort,
   167		TP_PROTO(struct vm_area_struct *vma, bool *abort_madvise),
   168		TP_ARGS(vma, abort_madvise));
   169	DECLARE_HOOK(android_vh_page_cache_ra_order_bypass,
   170		TP_PROTO(struct readahead_control *ractl, struct file_ra_state *ra,
   171			 int new_order, gfp_t *gfp, bool *bypass),
   172		TP_ARGS(ractl, ra, new_order, gfp, bypass));
   173	DECLARE_HOOK(android_vh_alloc_pages_slowpath_start,
   174		TP_PROTO(u64 *stime),
   175		TP_ARGS(stime));
   176	DECLARE_HOOK(android_vh_alloc_pages_slowpath_end,
   177		TP_PROTO(gfp_t *gfp_mask, unsigned int order, unsigned long alloc_start,
   178			u64 stime, unsigned long did_some_progress,
   179			unsigned long pages_reclaimed, int retry_loop_count),
   180		TP_ARGS(gfp_mask, order, alloc_start, stime, did_some_progress,
   181			pages_reclaimed, retry_loop_count));
   182	DECLARE_RESTRICTED_HOOK(android_rvh_alloc_pages_reclaim_start,
   183		TP_PROTO(gfp_t gfp_mask, int order, int *alloc_flags),
   184		TP_ARGS(gfp_mask, order, alloc_flags), 3);
   185	DECLARE_RESTRICTED_HOOK(android_rvh_alloc_pages_reclaim_cycle_end,
   186		TP_PROTO(gfp_t gfp_mask, int order, int *alloc_flags,
   187		unsigned long *did_some_progress, int *no_progress_loops,
   188		unsigned long direct_reclaim_retries),
   189		TP_ARGS(gfp_mask, order, alloc_flags, did_some_progress,
   190		no_progress_loops, direct_reclaim_retries), 6);
   191	DECLARE_HOOK(android_vh_add_lazyfree_bypass,
   192		TP_PROTO(struct lruvec *lruvec, struct folio *folio, bool *bypass),
   193		TP_ARGS(lruvec, folio, bypass));
   194	DECLARE_HOOK(android_vh_oom_reaper_delay_bypass,
   195		TP_PROTO(struct task_struct *tsk, bool *bypass),
   196		TP_ARGS(tsk, bypass));
   197	DECLARE_HOOK(android_vh_pagetypeinfo_show,
   198		TP_PROTO(struct seq_file *m),
   199		TP_ARGS(m));
   200	DECLARE_HOOK(android_vh_get_page_wmark,
   201		TP_PROTO(unsigned int alloc_flags, unsigned long *page_wmark),
   202		TP_ARGS(alloc_flags, page_wmark));
   203	DECLARE_HOOK(android_vh_page_add_new_anon_rmap,
   204		TP_PROTO(struct page *page, struct vm_area_struct *vma,
   205			unsigned long address),
   206		TP_ARGS(page, vma, address));
   207	struct page_vma_mapped_walk;
   208	DECLARE_HOOK(android_vh_test_clear_look_around_ref,
   209		TP_PROTO(struct page *page),
   210		TP_ARGS(page));
   211	DECLARE_HOOK(android_vh_look_around_migrate_folio,
   212		TP_PROTO(struct folio *old_folio, struct folio *new_folio),
   213		TP_ARGS(old_folio, new_folio));
   214	DECLARE_HOOK(android_vh_look_around,
   215		TP_PROTO(struct page_vma_mapped_walk *pvmw, struct folio *folio,
   216			struct vm_area_struct *vma, int *referenced),
   217		TP_ARGS(pvmw, folio, vma, referenced));
   218	DECLARE_HOOK(android_vh_free_unref_page_bypass,
   219		TP_PROTO(struct page *page, int order, int migratetype, bool *bypass),
   220		TP_ARGS(page, order, migratetype, bypass));
   221	DECLARE_HOOK(android_vh_kvmalloc_node_use_vmalloc,
   222		TP_PROTO(size_t size, gfp_t *kmalloc_flags, bool *use_vmalloc),
   223		TP_ARGS(size, kmalloc_flags, use_vmalloc));
   224	DECLARE_HOOK(android_vh_should_alloc_pages_retry,
   225		TP_PROTO(gfp_t gfp_mask, int order, int *alloc_flags,
   226		int migratetype, struct zone *preferred_zone, struct page **page, bool *should_alloc_retry),
   227		TP_ARGS(gfp_mask, order, alloc_flags,
   228			migratetype, preferred_zone, page, should_alloc_retry));
   229	DECLARE_HOOK(android_vh_unreserve_highatomic_bypass,
   230		TP_PROTO(bool force, struct zone *zone, bool *skip_unreserve_highatomic),
   231		TP_ARGS(force, zone, skip_unreserve_highatomic));
   232	DECLARE_HOOK(android_vh_rmqueue_bulk_bypass,
   233		TP_PROTO(unsigned int order, struct per_cpu_pages *pcp, int migratetype,
   234			struct list_head *list),
   235		TP_ARGS(order, pcp, migratetype, list));
   236	DECLARE_HOOK(android_vh_thaw_killed_process,
   237		TP_PROTO(bool *thaw),
   238		TP_ARGS(thaw));
   239	DECLARE_HOOK(android_vh_cma_alloc_retry,
   240		TP_PROTO(char *name, int *retry),
   241		TP_ARGS(name, retry));
   242	DECLARE_HOOK(android_vh_wp_page_reuse,
   243		TP_PROTO(struct vm_fault *vmf, struct folio *folio),
   244		TP_ARGS(vmf, folio));
   245	DECLARE_HOOK(android_vh_page_cache_readahead_start,
   246		TP_PROTO(struct file *file, pgoff_t pgoff,
   247			unsigned int size, bool sync),
   248		TP_ARGS(file, pgoff, size, sync));
   249	DECLARE_HOOK(android_vh_page_cache_readahead_end,
   250		TP_PROTO(struct file *file, pgoff_t pgoff),
   251		TP_ARGS(file, pgoff));
   252	DECLARE_HOOK(android_vh_filemap_fault_start,
   253		TP_PROTO(struct file *file, pgoff_t pgoff),
   254		TP_ARGS(file, pgoff));
   255	DECLARE_HOOK(android_vh_filemap_fault_end,
   256		TP_PROTO(struct file *file, pgoff_t pgoff),
   257		TP_ARGS(file, pgoff));
   258	DECLARE_HOOK(android_vh_free_unref_folios_to_pcp_bypass,
   259		TP_PROTO(struct folio_batch *folios, bool *bypass),
   260		TP_ARGS(folios, bypass));
   261	DECLARE_HOOK(android_vh_drain_all_pages_bypass,
   262		TP_PROTO(gfp_t gfp_mask, unsigned int order, unsigned long alloc_flags,
   263			int migratetype, unsigned long did_some_progress,
   264			bool *bypass),
   265		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, did_some_progress, bypass));
   266	DECLARE_HOOK(android_vh_save_track_hash,
   267		TP_PROTO(bool alloc, struct track *p),
   268		TP_ARGS(alloc, p));
   269	DECLARE_HOOK(android_vh_kmalloc_slab,
   270		TP_PROTO(unsigned int index, gfp_t flags, struct kmem_cache **s),
   271		TP_ARGS(index, flags, s));
   272	DECLARE_HOOK(android_vh_customize_alloc_gfp,
   273		TP_PROTO(gfp_t *alloc_gfp, unsigned int order),
   274		TP_ARGS(alloc_gfp, order));
   275	DECLARE_HOOK(android_vh_init_adjust_zone_wmark,
   276		TP_PROTO(struct zone *zone, u64 interval),
   277		TP_ARGS(zone, interval));
   278	DECLARE_HOOK(android_vh_oom_evaluate_task_bypass,
   279		TP_PROTO(struct task_struct *task, struct oom_control *oc, bool *bypass),
   280		TP_ARGS(task, oc, bypass));
   281	DECLARE_HOOK(android_vh_folio_add_lru_folio_activate,
   282		TP_PROTO(struct folio *folio, bool *bypass),
   283		TP_ARGS(folio, bypass));
   284	DECLARE_HOOK(android_vh_filemap_fault_pre_folio_locked,
   285		TP_PROTO(struct folio *folio),
   286		TP_ARGS(folio));
   287	DECLARE_HOOK(android_vh_filemap_folio_mapped,
   288		TP_PROTO(struct folio *folio),
   289		TP_ARGS(folio));
   290	DECLARE_HOOK(android_vh_folio_remove_rmap_ptes,
   291		TP_PROTO(struct folio *folio),
   292		TP_ARGS(folio));
   293	DECLARE_HOOK(android_vh_filemap_get_folio_end,
   294		TP_PROTO(struct address_space *mapping, struct folio *folio),
   295		TP_ARGS(mapping, folio));
   296	DECLARE_HOOK(android_vh_adjust_swap_info_flags,
   297		TP_PROTO(unsigned long *flags),
   298		TP_ARGS(flags));
   299	DECLARE_HOOK(android_vh_smaps_pte_entry,
   300		TP_PROTO(swp_entry_t entry, int mapcount,
   301			unsigned long *swap_shared, unsigned long *writeback,
   302			unsigned long *same, unsigned long *huge),
   303		TP_ARGS(entry, mapcount, swap_shared, writeback, same, huge));
   304	DECLARE_HOOK(android_vh_show_smap,
   305		TP_PROTO(struct seq_file *m,
   306			unsigned long swap_shared, unsigned long writeback,
   307			unsigned long same, unsigned long huge),
   308		TP_ARGS(m, swap_shared, writeback, same, huge));
   309	DECLARE_HOOK(android_vh_alloc_contig_range_not_isolated,
   310		TP_PROTO(unsigned long start, unsigned end),
   311		TP_ARGS(start, end));
   312	DECLARE_HOOK(android_vh_warn_alloc_tune_ratelimit,
   313		TP_PROTO(struct ratelimit_state *rs),
   314		TP_ARGS(rs));
   315	DECLARE_HOOK(android_vh_warn_alloc_show_mem_bypass,
   316		TP_PROTO(bool *bypass),
   317		TP_ARGS(bypass));
 > 318	DECLARE_HOOK(android_vh_free_pages_prepare_bypass,
   319		TP_PROTO(struct page *page, unsigned int order,
   320			int __bitwise flags, bool *skip_free_pages_prepare),
   321		TP_ARGS(page, order, flags, skip_free_pages_prepare));
   322	DECLARE_HOOK(android_vh_free_pages_ok_bypass,
   323		TP_PROTO(struct page *page, unsigned int order,
   324			int __bitwise flags, bool *skip_free_pages_ok),
   325		TP_ARGS(page, order, flags, skip_free_pages_ok));
   326	#endif /* _TRACE_HOOK_MM_H */
   327	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
