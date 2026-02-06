Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66281A9F82
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 23:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770420144; cv=none; b=ccHFJieSmuz8MY3MxbXbdpix+ZqUWwtaK59qBZa8KaHbcszyRans/RQ0DRMAUZPxbBE9QDyoONTZiuVVwpBtMONdP3LCXo5VpyZyI1Aul8OPeNKZOnpPS3PyQ/U3dvVvIZhtGMBjYhZb/snAiT3XKAIyAIXhttC2+prK00tuBIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770420144; c=relaxed/simple;
	bh=BdmuCQYSySr0nALkywjdLk5Iv7oaQ3G7PYucPhzVmI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TCn6OyjMvsHU2R6e64IR4+B+8tqBwZKqkVJyguJQU3I5sUca9LF+FwmNPaQiwUSvXPLVvggRiv0QYFyxu7RqswMj8daPy378tr1AREYToR9LKXgHCopE4n+CVWcK/07aCraaMM+6+IoFwRxSBJ6G/8VCvS8/kxC6NFikytcQyWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DynBEYwM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DynBEYwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770420144; x=1801956144;
  h=date:from:to:cc:subject:message-id;
  bh=BdmuCQYSySr0nALkywjdLk5Iv7oaQ3G7PYucPhzVmI4=;
  b=DynBEYwM8lB5vwI1JbyeZaIv3RdVeS9xZKp9o6YTvx2+4SYNqi1Hjpyr
   C3xOMc9MoEw+rg5RxMyFomvzgE+4jcPbQ3XwS5jl6GNx5+C5TArgVibNq
   IsjcF6w2wRtGeAg1k5PoNX9CTlXWIK+fg75VW8aI3AD80h494xYHGic4E
   J0YQGM9XtGCYuehPsVnJjrZZdr7+MLm7VXh+nc2G2k7z+2BDszMq/JIan
   Oh/tlQiHvBx2sNFhn+JPlPkhT7WUAncW0Uk4iVRNY0a8qZiUQ8giU6gLE
   NjNGYA+x9M4jkSzcnKTO3AZ1RM4BkjR61CEEuRYFpRFErej1+HuYOowg9
   g==;
X-CSE-ConnectionGUID: j2b50JO+TZSkfxCGlBoc8Q==
X-CSE-MsgGUID: Dq3B+hI0QneatEwX5A+WHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="74233198"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="74233198"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 15:22:23 -0800
X-CSE-ConnectionGUID: aPEzU2w+To+oyiq4JPqyPA==
X-CSE-MsgGUID: /UgWdGDjQ/yQcL7pSkzdSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="211032186"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Feb 2026 15:22:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voV9X-00000000lFU-1APE;
	Fri, 06 Feb 2026 23:22:19 +0000
Date: Sat, 07 Feb 2026 07:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 6/6]
 include/trace/hooks/mm.h:209:1: sparse: sparse: incorrect type in argument 4
 (different base types)
Message-ID: <202602070728.PalLRgur-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d370994ba023ff99b9ddab815c6e190e10b3403
commit: 01cd1509e6a2dd1721ad5dc4dad660513e828691 [6/6] ANDROID: page_alloc: add vendor hook to bypass free_pages_prepare
config: arm64-randconfig-r123-20260207 (https://download.01.org/0day-ci/archive/20260207/202602070728.PalLRgur-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070728.PalLRgur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070728.PalLRgur-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:189:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
   mm/page_alloc.c:1411:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1411:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1411:25: sparse:     got restricted fpi_t [usertype] fpi_flags
   mm/page_alloc.c:837:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:837:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c: note: in included file:
>> include/trace/hooks/mm.h:209:1: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted int flags @@     got restricted int flags @@
   include/trace/hooks/mm.h:209:1: sparse:     expected restricted int flags
   include/trace/hooks/mm.h:209:1: sparse:     got restricted int flags
   mm/page_alloc.c:2827:6: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2928:33: sparse: sparse: context imbalance in 'free_unref_folios' - unexpected unlock
   mm/page_alloc.c:837:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:3246:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4964:9: sparse: sparse: context imbalance in 'alloc_pages_bulk_noprof' - different lock contexts for basic block
   mm/page_alloc.c:837:31: sparse: sparse: cast from restricted fpi_t

vim +209 include/trace/hooks/mm.h

    21	
    22	DECLARE_RESTRICTED_HOOK(android_rvh_set_skip_swapcache_flags,
    23				TP_PROTO(gfp_t *flags),
    24				TP_ARGS(flags), 1);
    25	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    26				TP_PROTO(gfp_t *flags),
    27				TP_ARGS(flags), 1);
    28	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    29				TP_PROTO(gfp_t *flags),
    30				TP_ARGS(flags), 1);
    31	*/
    32	struct mem_cgroup;
    33	DECLARE_HOOK(android_vh_mem_cgroup_alloc,
    34		TP_PROTO(struct mem_cgroup *memcg),
    35		TP_ARGS(memcg));
    36	DECLARE_HOOK(android_vh_mem_cgroup_free,
    37		TP_PROTO(struct mem_cgroup *memcg),
    38		TP_ARGS(memcg));
    39	DECLARE_HOOK(android_vh_mem_cgroup_id_remove,
    40		TP_PROTO(struct mem_cgroup *memcg),
    41		TP_ARGS(memcg));
    42	struct cgroup_subsys_state;
    43	DECLARE_HOOK(android_vh_mem_cgroup_css_online,
    44		TP_PROTO(struct cgroup_subsys_state *css, struct mem_cgroup *memcg),
    45		TP_ARGS(css, memcg));
    46	DECLARE_HOOK(android_vh_mem_cgroup_css_offline,
    47		TP_PROTO(struct cgroup_subsys_state *css, struct mem_cgroup *memcg),
    48		TP_ARGS(css, memcg));
    49	DECLARE_HOOK(android_vh_io_statistics,
    50		TP_PROTO(struct address_space *mapping, unsigned int index,
    51			unsigned int nr_page, bool read, bool direct),
    52		TP_ARGS(mapping, index, nr_page, read, direct));
    53	DECLARE_HOOK(android_vh_pagetypeinfo_show,
    54		TP_PROTO(struct seq_file *m),
    55		TP_ARGS(m));
    56	
    57	struct cma;
    58	DECLARE_HOOK(android_vh_cma_alloc_bypass,
    59		TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
    60			gfp_t gfp_mask, struct page **page, bool *bypass),
    61		TP_ARGS(cma, count, align, gfp_mask, page, bypass));
    62	
    63	struct compact_control;
    64	DECLARE_HOOK(android_vh_isolate_freepages,
    65		TP_PROTO(struct compact_control *cc, struct page *page, bool *bypass),
    66		TP_ARGS(cc, page, bypass));
    67	
    68	struct oom_control;
    69	DECLARE_HOOK(android_vh_oom_check_panic,
    70		TP_PROTO(struct oom_control *oc, int *ret),
    71		TP_ARGS(oc, ret));
    72	
    73	DECLARE_HOOK(android_vh_rmqueue_smallest_bypass,
    74		TP_PROTO(struct page **page, struct zone *zone, int order, int migratetype),
    75		TP_ARGS(page, zone, order, migratetype));
    76	DECLARE_HOOK(android_vh_free_one_page_bypass,
    77		TP_PROTO(struct page *page, struct zone *zone, int order, int migratetype,
    78			int fpi_flags, bool *bypass),
    79		TP_ARGS(page, zone, order, migratetype, fpi_flags, bypass));
    80	DECLARE_HOOK(android_vh_migration_target_bypass,
    81		TP_PROTO(struct page *page, bool *bypass),
    82		TP_ARGS(page, bypass));
    83	
    84	struct page_vma_mapped_walk;
    85	DECLARE_HOOK(android_vh_slab_alloc_node,
    86		TP_PROTO(void *object, unsigned long addr, struct kmem_cache *s),
    87		TP_ARGS(object, addr, s));
    88	DECLARE_HOOK(android_vh_slab_free,
    89		TP_PROTO(unsigned long addr, struct kmem_cache *s),
    90		TP_ARGS(addr, s));
    91	DECLARE_HOOK(android_vh_process_madvise_begin,
    92		TP_PROTO(struct task_struct *task, int behavior),
    93		TP_ARGS(task, behavior));
    94	DECLARE_HOOK(android_vh_process_madvise_iter,
    95		TP_PROTO(struct task_struct *task, int behavior, ssize_t *ret),
    96		TP_ARGS(task, behavior, ret));
    97	DECLARE_HOOK(android_vh_meminfo_cache_adjust,
    98		TP_PROTO(unsigned long *cached),
    99		TP_ARGS(cached));
   100	DECLARE_HOOK(android_vh_si_mem_available_adjust,
   101		TP_PROTO(unsigned long *available),
   102		TP_ARGS(available));
   103	DECLARE_HOOK(android_vh_si_meminfo_adjust,
   104		TP_PROTO(unsigned long *totalram, unsigned long *freeram),
   105		TP_ARGS(totalram, freeram));
   106	DECLARE_HOOK(android_vh_test_clear_look_around_ref,
   107		TP_PROTO(struct page *page),
   108		TP_ARGS(page));
   109	DECLARE_HOOK(android_vh_look_around_migrate_folio,
   110		TP_PROTO(struct folio *old_folio, struct folio *new_folio),
   111		TP_ARGS(old_folio, new_folio));
   112	DECLARE_HOOK(android_vh_look_around,
   113		TP_PROTO(struct page_vma_mapped_walk *pvmw, struct folio *folio,
   114			struct vm_area_struct *vma, int *referenced),
   115		TP_ARGS(pvmw, folio, vma, referenced));
   116	DECLARE_HOOK(android_vh_meminfo_proc_show,
   117		TP_PROTO(struct seq_file *m),
   118		TP_ARGS(m));
   119	DECLARE_HOOK(android_vh_exit_mm,
   120		TP_PROTO(struct mm_struct *mm),
   121		TP_ARGS(mm));
   122	DECLARE_HOOK(android_vh_show_mem,
   123		TP_PROTO(unsigned int filter, nodemask_t *nodemask),
   124		TP_ARGS(filter, nodemask));
   125	DECLARE_HOOK(android_vh_print_slabinfo_header,
   126		TP_PROTO(struct seq_file *m),
   127		TP_ARGS(m));
   128	struct slabinfo;
   129	DECLARE_HOOK(android_vh_cache_show,
   130		TP_PROTO(struct seq_file *m, struct slabinfo *sinfo, struct kmem_cache *s),
   131		TP_ARGS(m, sinfo, s));
   132	DECLARE_HOOK(android_vh_count_workingset_refault,
   133		TP_PROTO(struct folio *folio),
   134		TP_ARGS(folio));
   135	DECLARE_HOOK(android_vh_calc_alloc_flags,
   136		TP_PROTO(gfp_t gfp_mask, unsigned int *alloc_flags,
   137			bool *bypass),
   138		TP_ARGS(gfp_mask, alloc_flags, bypass));
   139	
   140	DECLARE_HOOK(android_vh_should_fault_around,
   141		TP_PROTO(struct vm_fault *vmf, bool *should_around),
   142		TP_ARGS(vmf, should_around));
   143	DECLARE_HOOK(android_vh_slab_folio_alloced,
   144		TP_PROTO(unsigned int order, gfp_t flags),
   145		TP_ARGS(order, flags));
   146	DECLARE_HOOK(android_vh_kmalloc_large_alloced,
   147		TP_PROTO(struct folio *folio, unsigned int order, gfp_t flags),
   148		TP_ARGS(folio, order, flags));
   149	DECLARE_RESTRICTED_HOOK(android_rvh_ctl_dirty_rate,
   150		TP_PROTO(struct inode *inode),
   151		TP_ARGS(inode), 1);
   152	
   153	DECLARE_HOOK(android_vh_reserve_highatomic_bypass,
   154		TP_PROTO(struct page *page, bool *bypass),
   155		TP_ARGS(page, bypass));
   156	
   157	DECLARE_HOOK(android_vh_alloc_pages_entry,
   158		TP_PROTO(gfp_t *gfp, unsigned int order, int preferred_nid,
   159			nodemask_t *nodemask),
   160		TP_ARGS(gfp, order, preferred_nid, nodemask));
   161	
   162	DECLARE_HOOK(android_vh_watermark_fast_ok,
   163		TP_PROTO(unsigned int order, gfp_t gfp_mask, bool *is_watermark_ok),
   164		TP_ARGS(order, gfp_mask, is_watermark_ok));
   165	
   166	DECLARE_HOOK(android_vh_free_unref_folios_to_pcp_bypass,
   167		TP_PROTO(struct folio_batch *folios, bool *bypass),
   168		TP_ARGS(folios, bypass));
   169	DECLARE_HOOK(android_vh_cma_alloc_fail,
   170		TP_PROTO(char *name, unsigned long count, unsigned long req_count),
   171		TP_ARGS(name, count, req_count));
   172	DECLARE_RESTRICTED_HOOK(android_rvh_vmalloc_node_bypass,
   173		TP_PROTO(unsigned long size, gfp_t gfp_mask, void **addr),
   174		TP_ARGS(size, gfp_mask, addr), 1);
   175	DECLARE_RESTRICTED_HOOK(android_rvh_vfree_bypass,
   176		TP_PROTO(const void *addr, bool *bypass),
   177		TP_ARGS(addr, bypass), 1);
   178	DECLARE_HOOK(android_vh_cma_alloc_retry,
   179		TP_PROTO(char *name, int *retry),
   180		TP_ARGS(name, retry));
   181	DECLARE_HOOK(android_vh_smaps_pte_entry,
   182		TP_PROTO(swp_entry_t entry, int mapcount,
   183			unsigned long *swap_shared, unsigned long *writeback,
   184			unsigned long *same, unsigned long *huge),
   185		TP_ARGS(entry, mapcount, swap_shared, writeback, same, huge));
   186	DECLARE_HOOK(android_vh_show_smap,
   187		TP_PROTO(struct seq_file *m,
   188			unsigned long swap_shared, unsigned long writeback,
   189			unsigned long same, unsigned long huge),
   190		TP_ARGS(m, swap_shared, writeback, same, huge));
   191	DECLARE_HOOK(android_vh_alloc_pages_slowpath_start,
   192		TP_PROTO(u64 *stime),
   193		TP_ARGS(stime));
   194	DECLARE_HOOK(android_vh_alloc_pages_slowpath_end,
   195		TP_PROTO(gfp_t *gfp_mask, unsigned int order, unsigned long alloc_start,
   196			u64 stime, unsigned long did_some_progress,
   197			unsigned long pages_reclaimed, int retry_loop_count),
   198		TP_ARGS(gfp_mask, order, alloc_start, stime, did_some_progress,
   199			pages_reclaimed, retry_loop_count));
   200	DECLARE_HOOK(android_vh_alloc_contig_range_not_isolated,
   201		TP_PROTO(unsigned long start, unsigned end),
   202		TP_ARGS(start, end));
   203	DECLARE_HOOK(android_vh_warn_alloc_tune_ratelimit,
   204		TP_PROTO(struct ratelimit_state *rs),
   205		TP_ARGS(rs));
   206	DECLARE_HOOK(android_vh_warn_alloc_show_mem_bypass,
   207		TP_PROTO(bool *bypass),
   208		TP_ARGS(bypass));
 > 209	DECLARE_HOOK(android_vh_free_pages_prepare_bypass,
   210		TP_PROTO(struct page *page, unsigned int order,
   211			int __bitwise flags, bool *skip_free_pages_prepare),
   212		TP_ARGS(page, order, flags, skip_free_pages_prepare));
   213	#endif /* _TRACE_HOOK_MM_H */
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
