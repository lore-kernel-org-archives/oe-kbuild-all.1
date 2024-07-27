Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ADC28E0F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 23:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722123348; cv=none; b=fJGukdo8aK4XFS6G7RzISvGhvU9Ib1YOqW5aDGhgeNa8t9xgZzjQpbSHQyfxoqd82oSXPDse2XtwhNMHIyQeCVeRHLmAYSsEed0V4N+U9WnqZFPW8dwp2ROwJv5+j6kcwKNTVmQOKVJ5ozT+ta//CYOu7EQIPbYb4pZsJMMWtJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722123348; c=relaxed/simple;
	bh=R91kqOmlNYziF8UuRDvsQ0LkdYzvKe/0zNx9tBrryeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XyA5tu9cqARaTo58oABmYXI11LwAtNWcQTb2SOSG2x5tF3TQlH5yPaoLOWovvGuynyEBuhWb5Qmkpgtr7v8Z5IuS2d4Ln3xaa75bw02wsms8VwjICdn8p5et8rexUCac5nrF04vVEajQh0lflI+l1hJ6SXVYuHjLNMpTYtWeOQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auw8NeK6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auw8NeK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722123345; x=1753659345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R91kqOmlNYziF8UuRDvsQ0LkdYzvKe/0zNx9tBrryeI=;
  b=auw8NeK60LTbnPBC74hVJ3wRfrSU+bYsgyvIx9tu4YLrsxibgZUaFKpT
   51YaD19u1namX2cjvwe6V5nNk2TTnJ2vKjxxB+mZNKD6IVYE5XpmrVrnx
   cTAE70loO4QgPHIzZRIFC4ywh7A2nm3vm8mz4AGBjNqEGH/5RR3nHHtF7
   dABINltwogRST9bIfjJZo+C6oYOqOMy6tkIrex4yKjGwEZOBVoI4kagnL
   5TQYA6O3jLAAG5n7PK6Y2sbAibCjyQFUIrY2psY7lvPrwdo+wc2frzdLi
   HZ2CkUhp0Cpbg1lbymrnwKmLeig2IdIxwC4RAIbVFzSq/KxMHxOPs7gNI
   A==;
X-CSE-ConnectionGUID: 7m6eRf3jSoWeH5lB7hVQ/g==
X-CSE-MsgGUID: pg4lmatwQumrqX0THd3QCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="19769622"
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="19769622"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 16:35:44 -0700
X-CSE-ConnectionGUID: SvQvW7fBQsSteQgHPxSFrw==
X-CSE-MsgGUID: BUTUuc9bTamK/Nm+gtPWpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="58178577"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jul 2024 16:35:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXqwv-000qKy-1V;
	Sat, 27 Jul 2024 23:35:41 +0000
Date: Sun, 28 Jul 2024 07:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 5/14] include/trace/hooks/mm.h:316:1:
 sparse: sparse: incorrect type in argument 4 (different base types)
Message-ID: <202407280706.t5G86lwf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   af55892f201c8f709725d75d306b1cdd20984b97
commit: a85227c886b7a22cd53bdfcf0740b6e0bd623351 [5/14] ANDROID: page_alloc: add vendor hook to bypass free_pages_prepare
config: i386-randconfig-r133-20240728 (https://download.01.org/0day-ci/archive/20240728/202407280706.t5G86lwf-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407280706.t5G86lwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407280706.t5G86lwf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:194:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
   mm/page_alloc.c:1363:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1363:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1363:25: sparse:     got restricted fpi_t [usertype] fpi_flags
   mm/page_alloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c: note: in included file (through include/linux/mm_inline.h):
>> include/trace/hooks/mm.h:316:1: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted int flags @@     got restricted int flags @@
   include/trace/hooks/mm.h:316:1: sparse:     expected restricted int flags
   include/trace/hooks/mm.h:316:1: sparse:     got restricted int flags
   mm/page_alloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c:2539:6: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2670:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c:2904:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4641:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false

vim +316 include/trace/hooks/mm.h

    19	
    20	DECLARE_RESTRICTED_HOOK(android_rvh_shmem_get_folio,
    21				TP_PROTO(struct shmem_inode_info *info, struct folio **folio),
    22				TP_ARGS(info, folio), 2);
    23	
    24	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    25				TP_PROTO(unsigned int *flags),	/* gfp_t *flags */
    26				TP_ARGS(flags), 1);
    27	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    28				TP_PROTO(unsigned int *flags),	/* gfp_t *flags */
    29				TP_ARGS(flags), 1);
    30	DECLARE_HOOK(android_vh_slab_alloc_node,
    31		TP_PROTO(void *object, unsigned long addr, struct kmem_cache *s),
    32		TP_ARGS(object, addr, s));
    33	DECLARE_HOOK(android_vh_slab_free,
    34		TP_PROTO(unsigned long addr, struct kmem_cache *s),
    35		TP_ARGS(addr, s));
    36	DECLARE_HOOK(android_vh_meminfo_cache_adjust,
    37		TP_PROTO(unsigned long *cached),
    38		TP_ARGS(cached));
    39	DECLARE_HOOK(android_vh_si_mem_available_adjust,
    40		TP_PROTO(unsigned long *available),
    41		TP_ARGS(available));
    42	DECLARE_HOOK(android_vh_si_meminfo_adjust,
    43		TP_PROTO(unsigned long *totalram, unsigned long *freeram),
    44		TP_ARGS(totalram, freeram));
    45	DECLARE_HOOK(android_vh_slab_folio_alloced,
    46		TP_PROTO(unsigned int order, gfp_t flags),
    47		TP_ARGS(order, flags));
    48	DECLARE_HOOK(android_vh_kmalloc_large_alloced,
    49		TP_PROTO(struct page *page, unsigned int order, gfp_t flags),
    50		TP_ARGS(page, order, flags));
    51	DECLARE_RESTRICTED_HOOK(android_rvh_ctl_dirty_rate,
    52		TP_PROTO(struct inode *inode),
    53		TP_ARGS(inode), 1);
    54	DECLARE_HOOK(android_vh_test_clear_look_around_ref,
    55		TP_PROTO(struct page *page),
    56		TP_ARGS(page));
    57	DECLARE_HOOK(android_vh_look_around_migrate_folio,
    58		TP_PROTO(struct folio *old_folio, struct folio *new_folio),
    59		TP_ARGS(old_folio, new_folio));
    60	DECLARE_HOOK(android_vh_look_around,
    61		TP_PROTO(struct page_vma_mapped_walk *pvmw, struct folio *folio,
    62			struct vm_area_struct *vma, int *referenced),
    63		TP_ARGS(pvmw, folio, vma, referenced));
    64	DECLARE_HOOK(android_vh_free_unref_page_bypass,
    65		TP_PROTO(struct page *page, int order, int migratetype, bool *bypass),
    66		TP_ARGS(page, order, migratetype, bypass));
    67	DECLARE_HOOK(android_vh_kvmalloc_node_use_vmalloc,
    68		TP_PROTO(size_t size, gfp_t *kmalloc_flags, bool *use_vmalloc),
    69		TP_ARGS(size, kmalloc_flags, use_vmalloc));
    70	DECLARE_HOOK(android_vh_should_alloc_pages_retry,
    71		TP_PROTO(gfp_t gfp_mask, int order, int *alloc_flags,
    72		int migratetype, struct zone *preferred_zone, struct page **page, bool *should_alloc_retry),
    73		TP_ARGS(gfp_mask, order, alloc_flags,
    74			migratetype, preferred_zone, page, should_alloc_retry));
    75	DECLARE_HOOK(android_vh_alloc_pages_adjust_wmark,
    76		TP_PROTO(gfp_t gfp_mask, int order, int *alloc_flags),
    77		TP_ARGS(gfp_mask, order, alloc_flags));
    78	DECLARE_HOOK(android_vh_alloc_pages_reset_wmark,
    79		TP_PROTO(gfp_t gfp_mask, int order, int *alloc_flags,
    80		unsigned long *did_some_progress, int *no_progress_loops,
    81		unsigned long direct_reclaim_retries),
    82		TP_ARGS(gfp_mask, order, alloc_flags, did_some_progress,
    83		no_progress_loops, direct_reclaim_retries));
    84	DECLARE_HOOK(android_vh_unreserve_highatomic_bypass,
    85		TP_PROTO(bool force, struct zone *zone, bool *skip_unreserve_highatomic),
    86		TP_ARGS(force, zone, skip_unreserve_highatomic));
    87	DECLARE_HOOK(android_vh_rmqueue_bulk_bypass,
    88		TP_PROTO(unsigned int order, struct per_cpu_pages *pcp, int migratetype,
    89			struct list_head *list),
    90		TP_ARGS(order, pcp, migratetype, list));
    91	DECLARE_HOOK(android_vh_ra_tuning_max_page,
    92		TP_PROTO(struct readahead_control *ractl, unsigned long *max_page),
    93		TP_ARGS(ractl, max_page));
    94	DECLARE_HOOK(android_vh_tune_mmap_readaround,
    95		TP_PROTO(unsigned int ra_pages, pgoff_t pgoff,
    96			pgoff_t *start, unsigned int *size, unsigned int *async_size),
    97		TP_ARGS(ra_pages, pgoff, start, size, async_size));
    98	DECLARE_HOOK(android_vh_madvise_cold_pageout_skip,
    99		TP_PROTO(struct vm_area_struct *vma, struct folio *folio, bool pageout, bool *need_skip),
   100		TP_ARGS(vma, folio, pageout, need_skip));
   101	struct mem_cgroup;
   102	DECLARE_HOOK(android_vh_mem_cgroup_alloc,
   103		TP_PROTO(struct mem_cgroup *memcg),
   104		TP_ARGS(memcg));
   105	DECLARE_HOOK(android_vh_mem_cgroup_free,
   106		TP_PROTO(struct mem_cgroup *memcg),
   107		TP_ARGS(memcg));
   108	DECLARE_HOOK(android_vh_mem_cgroup_id_remove,
   109		TP_PROTO(struct mem_cgroup *memcg),
   110		TP_ARGS(memcg));
   111	struct cgroup_subsys_state;
   112	DECLARE_HOOK(android_vh_mem_cgroup_css_online,
   113		TP_PROTO(struct cgroup_subsys_state *css, struct mem_cgroup *memcg),
   114		TP_ARGS(css, memcg));
   115	DECLARE_HOOK(android_vh_mem_cgroup_css_offline,
   116		TP_PROTO(struct cgroup_subsys_state *css, struct mem_cgroup *memcg),
   117		TP_ARGS(css, memcg));
   118	DECLARE_HOOK(android_vh_save_track_hash,
   119		TP_PROTO(bool alloc, struct track *p),
   120		TP_ARGS(alloc, p));
   121	DECLARE_HOOK(android_vh_kmalloc_slab,
   122		TP_PROTO(unsigned int index, gfp_t flags, struct kmem_cache **s),
   123		TP_ARGS(index, flags, s));
   124	DECLARE_HOOK(android_vh_adjust_kvmalloc_flags,
   125		TP_PROTO(unsigned int order, gfp_t *alloc_flags),
   126		TP_ARGS(order, alloc_flags));
   127	DECLARE_HOOK(android_vh_alloc_pages_slowpath,
   128		TP_PROTO(gfp_t gfp_mask, unsigned int order, unsigned long delta),
   129		TP_ARGS(gfp_mask, order, delta));
   130	DECLARE_HOOK(android_vh_alloc_pages_slowpath_start,
   131		TP_PROTO(u64 *stime),
   132		TP_ARGS(stime));
   133	DECLARE_HOOK(android_vh_alloc_pages_slowpath_end,
   134		TP_PROTO(gfp_t *gfp_mask, unsigned int order, unsigned long alloc_start,
   135			u64 stime, unsigned long did_some_progress,
   136			unsigned long pages_reclaimed, int retry_loop_count),
   137		TP_ARGS(gfp_mask, order, alloc_start, stime, did_some_progress,
   138			pages_reclaimed, retry_loop_count));
   139	DECLARE_HOOK(android_vh_dm_bufio_shrink_scan_bypass,
   140		TP_PROTO(unsigned long dm_bufio_current_allocated, bool *bypass),
   141		TP_ARGS(dm_bufio_current_allocated, bypass));
   142	DECLARE_HOOK(android_vh_cleanup_old_buffers_bypass,
   143		TP_PROTO(unsigned long dm_bufio_current_allocated,
   144			unsigned long *max_age_hz,
   145			bool *bypass),
   146		TP_ARGS(dm_bufio_current_allocated, max_age_hz, bypass));
   147	DECLARE_HOOK(android_vh_mmap_region,
   148		TP_PROTO(struct vm_area_struct *vma, unsigned long addr),
   149		TP_ARGS(vma, addr));
   150	DECLARE_HOOK(android_vh_try_to_unmap_one,
   151		TP_PROTO(struct folio *folio, struct vm_area_struct *vma,
   152			unsigned long addr, void *arg, bool ret),
   153		TP_ARGS(folio, vma, addr, arg, ret));
   154	DECLARE_HOOK(android_vh_mm_direct_reclaim_enter,
   155		TP_PROTO(unsigned int order),
   156		TP_ARGS(order));
   157	DECLARE_HOOK(android_vh_mm_direct_reclaim_exit,
   158		TP_PROTO(unsigned long did_some_progress, int retry_times),
   159		TP_ARGS(did_some_progress, retry_times));
   160	struct oom_control;
   161	DECLARE_HOOK(android_vh_mm_may_oom_exit,
   162		TP_PROTO(struct oom_control *oc, unsigned long did_some_progress),
   163		TP_ARGS(oc, did_some_progress));
   164	DECLARE_HOOK(android_vh_do_anonymous_page,
   165		TP_PROTO(struct vm_area_struct *vma, struct folio *folio),
   166		TP_ARGS(vma, folio));
   167	DECLARE_HOOK(android_vh_do_swap_page,
   168		TP_PROTO(struct folio *folio, pte_t *pte, struct vm_fault *vmf,
   169			swp_entry_t entry),
   170		TP_ARGS(folio, pte, vmf, entry));
   171	DECLARE_HOOK(android_vh_do_wp_page,
   172		TP_PROTO(struct folio *folio),
   173		TP_ARGS(folio));
   174	DECLARE_HOOK(android_vh_uprobes_replace_page,
   175		TP_PROTO(struct folio *new_folio, struct folio *old_folio),
   176		TP_ARGS(new_folio, old_folio));
   177	DECLARE_HOOK(android_vh_shmem_swapin_folio,
   178		TP_PROTO(struct folio *folio),
   179		TP_ARGS(folio));
   180	DECLARE_HOOK(android_vh_get_page_wmark,
   181		TP_PROTO(unsigned int alloc_flags, unsigned long *page_wmark),
   182		TP_ARGS(alloc_flags, page_wmark));
   183	DECLARE_HOOK(android_vh_page_add_new_anon_rmap,
   184		TP_PROTO(struct page *page, struct vm_area_struct *vma,
   185			unsigned long address),
   186		TP_ARGS(page, vma, address));
   187	DECLARE_HOOK(android_vh_meminfo_proc_show,
   188		TP_PROTO(struct seq_file *m),
   189		TP_ARGS(m));
   190	DECLARE_HOOK(android_vh_exit_mm,
   191		TP_PROTO(struct mm_struct *mm),
   192		TP_ARGS(mm));
   193	DECLARE_HOOK(android_vh_show_mem,
   194		TP_PROTO(unsigned int filter, nodemask_t *nodemask),
   195		TP_ARGS(filter, nodemask));
   196	DECLARE_HOOK(android_vh_print_slabinfo_header,
   197		TP_PROTO(struct seq_file *m),
   198		TP_ARGS(m));
   199	struct slabinfo;
   200	DECLARE_HOOK(android_vh_cache_show,
   201		TP_PROTO(struct seq_file *m, struct slabinfo *sinfo, struct kmem_cache *s),
   202		TP_ARGS(m, sinfo, s));
   203	DECLARE_HOOK(android_vh_customize_alloc_gfp,
   204		TP_PROTO(gfp_t *alloc_gfp, unsigned int order),
   205		TP_ARGS(alloc_gfp, order));
   206	DECLARE_HOOK(android_vh_madvise_pageout_swap_entry,
   207		TP_PROTO(swp_entry_t entry, int swapcount, void *priv),
   208		TP_ARGS(entry, swapcount, priv));
   209	DECLARE_HOOK(android_vh_madvise_swapin_walk_pmd_entry,
   210		TP_PROTO(swp_entry_t entry),
   211		TP_ARGS(entry));
   212	DECLARE_HOOK(android_vh_process_madvise,
   213		TP_PROTO(int behavior, ssize_t *ret, void *priv),
   214		TP_ARGS(behavior, ret, priv));
   215	DECLARE_HOOK(android_vh_smaps_pte_entry,
   216		TP_PROTO(swp_entry_t entry, unsigned long *writeback,
   217			unsigned long *same, unsigned long *huge),
   218		TP_ARGS(entry, writeback, same, huge));
   219	DECLARE_HOOK(android_vh_show_smap,
   220		TP_PROTO(struct seq_file *m, unsigned long writeback,
   221			unsigned long same, unsigned long huge),
   222		TP_ARGS(m, writeback, same, huge));
   223	DECLARE_HOOK(android_vh_smaps_swap_shared,
   224		TP_PROTO(unsigned long *swap_shared),
   225		TP_ARGS(swap_shared));
   226	DECLARE_HOOK(android_vh_show_smap_swap_shared,
   227		TP_PROTO(struct seq_file *m, unsigned long swap_shared),
   228		TP_ARGS(m, swap_shared));
   229	DECLARE_HOOK(android_vh_count_workingset_refault,
   230		TP_PROTO(struct folio *folio),
   231		TP_ARGS(folio));
   232	DECLARE_HOOK(android_vh_alloc_pages_reclaim_bypass,
   233	    TP_PROTO(gfp_t gfp_mask, int order, int alloc_flags,
   234		int migratetype, struct page **page),
   235		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, page));
   236	DECLARE_HOOK(android_vh_alloc_pages_failure_bypass,
   237		TP_PROTO(gfp_t gfp_mask, int order, int alloc_flags,
   238		int migratetype, struct page **page),
   239		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, page));
   240	DECLARE_HOOK(android_vh_swapmem_gather_init,
   241		TP_PROTO(struct mm_struct *mm),
   242		TP_ARGS(mm));
   243	DECLARE_HOOK(android_vh_swapmem_gather_add_bypass,
   244		TP_PROTO(struct mm_struct *mm, swp_entry_t entry, int nr, bool *bypass),
   245		TP_ARGS(mm, entry, nr, bypass));
   246	DECLARE_HOOK(android_vh_swapmem_gather_finish,
   247		TP_PROTO(struct mm_struct *mm),
   248		TP_ARGS(mm));
   249	DECLARE_HOOK(android_vh_oom_swapmem_gather_init,
   250		TP_PROTO(struct mm_struct *mm),
   251		TP_ARGS(mm));
   252	DECLARE_HOOK(android_vh_oom_swapmem_gather_finish,
   253		TP_PROTO(struct mm_struct *mm),
   254		TP_ARGS(mm));
   255	DECLARE_HOOK(android_vh_drain_all_pages_bypass,
   256		TP_PROTO(gfp_t gfp_mask, unsigned int order, unsigned long alloc_flags,
   257			int migratetype, unsigned long did_some_progress,
   258			bool *bypass),
   259		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, did_some_progress, bypass));
   260	DECLARE_HOOK(android_vh_save_vmalloc_stack,
   261		TP_PROTO(unsigned long flags, struct vm_struct *vm),
   262		TP_ARGS(flags, vm));
   263	DECLARE_HOOK(android_vh_show_stack_hash,
   264		TP_PROTO(struct seq_file *m, struct vm_struct *v),
   265		TP_ARGS(m, v));
   266	DECLARE_HOOK(android_vh_update_page_mapcount,
   267		TP_PROTO(struct page *page, bool inc_size, bool compound,
   268				int *first_mapping, bool *success),
   269		TP_ARGS(page, inc_size, compound, first_mapping, success));
   270	DECLARE_HOOK(android_vh_add_page_to_lrulist,
   271		TP_PROTO(struct folio *folio, bool compound, enum lru_list lru),
   272		TP_ARGS(folio, compound, lru));
   273	DECLARE_HOOK(android_vh_del_page_from_lrulist,
   274		TP_PROTO(struct folio *folio, bool compound, enum lru_list lru),
   275		TP_ARGS(folio, compound, lru));
   276	DECLARE_HOOK(android_vh_show_mapcount_pages,
   277		TP_PROTO(void *unused),
   278		TP_ARGS(unused));
   279	DECLARE_HOOK(android_vh_do_traversal_lruvec,
   280		TP_PROTO(struct lruvec *lruvec),
   281		TP_ARGS(lruvec));
   282	DECLARE_HOOK(android_vh_page_should_be_protected,
   283		TP_PROTO(struct folio *folio, unsigned long nr_scanned,
   284		s8 priority, u64 *ext, int *should_protect),
   285		TP_ARGS(folio, nr_scanned, priority, ext, should_protect));
   286	DECLARE_HOOK(android_vh_mark_page_accessed,
   287		TP_PROTO(struct folio *folio),
   288		TP_ARGS(folio));
   289	
   290	DECLARE_HOOK(android_vh_lock_folio_drop_mmap_start,
   291		TP_PROTO(struct task_struct **tsk, struct vm_fault *vmf,
   292			struct folio *folio, struct file *file),
   293		TP_ARGS(tsk, vmf, folio, file));
   294	
   295	DECLARE_HOOK(android_vh_lock_folio_drop_mmap_end,
   296		TP_PROTO(bool success, struct task_struct **tsk, struct vm_fault *vmf,
   297			struct folio *folio, struct file *file),
   298		TP_ARGS(success, tsk, vmf, folio, file));
   299	
   300	DECLARE_HOOK(android_vh_filemap_update_page,
   301		TP_PROTO(struct address_space *mapping, struct folio *folio,
   302			struct file *file),
   303		TP_ARGS(mapping, folio, file));
   304	DECLARE_HOOK(android_vh_cma_debug_show_areas,
   305		TP_PROTO(bool *show),
   306		TP_ARGS(show));
   307	DECLARE_HOOK(android_vh_alloc_contig_range_not_isolated,
   308		TP_PROTO(unsigned long start, unsigned end),
   309		TP_ARGS(start, end));
   310	DECLARE_HOOK(android_vh_warn_alloc_tune_ratelimit,
   311		TP_PROTO(struct ratelimit_state *rs),
   312		TP_ARGS(rs));
   313	DECLARE_HOOK(android_vh_warn_alloc_show_mem_bypass,
   314		TP_PROTO(bool *bypass),
   315		TP_ARGS(bypass));
 > 316	DECLARE_HOOK(android_vh_free_pages_prepare_bypass,
   317		TP_PROTO(struct page *page, unsigned int order,
   318			int __bitwise flags, bool *skip_free_pages_prepare),
   319		TP_ARGS(page, order, flags, skip_free_pages_prepare));
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
