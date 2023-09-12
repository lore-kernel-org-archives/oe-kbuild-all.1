Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9647A17D0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 04:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694493804; x=1726029804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ab/9dC/lMzgs1K9lW+9tGvGdps0y450zF9lYhOiBxvQ=;
  b=KbTbupZ5G539DqrriQOyjaYWb5fech//d6JLRpgrAbcQXcUfscz9LTSy
   8ApzHNQxhiaWV72ht0bwGuY85tAaFXSvzmwGxa8pxAVAd9aFRrOZoGePA
   Wy4VPr9q7tkuUZZ8F01dkAtvv21gn7zpzxTx1ZUoX6VXvX+XsbWKQicS5
   g9f4ZbtNa8MacI3PxswXGmeWx8z+1p9F0jask3r80PWhDC87j8JlCdvqf
   n9z68+KHg6COh84PpZr7So6ioBuvcySVEG/Wm63GwxwEagv/uD5QkulyR
   hA9aBbqZvxoIJmekLM0KUwqAMQopzCwiLjZCdcdbT+PyMN9BiL8kHJbI7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="464642920"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="464642920"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 21:43:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="746716494"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="746716494"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Sep 2023 21:43:19 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfvF7-0007KY-1l;
	Tue, 12 Sep 2023 04:43:17 +0000
Date: Tue, 12 Sep 2023 12:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/2] include/trace/hooks/mm.h:253:18:
 warning: declaration of 'struct cma' will not be visible outside of this
 function
Message-ID: <202309121208.wjU751jW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   cc960d6cc5cd48687ca1ed32b72de9da1a9c6128
commit: d1051298accfaf483bfbf82cb667ce3ead2206b4 [1/2] ANDROID: vendor_hooks: add vendor hook in cma_alloc()
config: arm-randconfig-001-20230912 (https://download.01.org/0day-ci/archive/20230912/202309121208.wjU751jW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121208.wjU751jW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121208.wjU751jW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from init/main.c:61:
   In file included from include/linux/rmap.h:16:
   In file included from include/trace/hooks/mm.h:6:
>> include/trace/hooks/mm.h:253:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^
   init/main.c:779:20: warning: no previous prototype for function 'arch_post_acpi_subsys_init' [-Wmissing-prototypes]
     779 | void __init __weak arch_post_acpi_subsys_init(void) { }
         |                    ^
   init/main.c:779:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     779 | void __init __weak arch_post_acpi_subsys_init(void) { }
         | ^
         | static 
   init/main.c:791:20: warning: no previous prototype for function 'mem_encrypt_init' [-Wmissing-prototypes]
     791 | void __init __weak mem_encrypt_init(void) { }
         |                    ^
   init/main.c:791:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     791 | void __init __weak mem_encrypt_init(void) { }
         | ^
         | static 
   init/main.c:793:20: warning: no previous prototype for function 'poking_init' [-Wmissing-prototypes]
     793 | void __init __weak poking_init(void) { }
         |                    ^
   init/main.c:793:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     793 | void __init __weak poking_init(void) { }
         | ^
         | static 
   4 warnings generated.
--
   In file included from fs/proc/meminfo.c:21:
>> include/trace/hooks/mm.h:253:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^
   fs/proc/meminfo.c:22:28: warning: no previous prototype for function 'arch_report_meminfo' [-Wmissing-prototypes]
      22 | void __attribute__((weak)) arch_report_meminfo(struct seq_file *m)
         |                            ^
   fs/proc/meminfo.c:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      22 | void __attribute__((weak)) arch_report_meminfo(struct seq_file *m)
         | ^
         | static 
   2 warnings generated.
--
   In file included from kernel/sys.c:10:
   In file included from include/linux/mm_inline.h:10:
   In file included from include/trace/hooks/mm.h:6:
>> include/trace/hooks/mm.h:253:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^
   1 warning generated.
--
   In file included from kernel/fork.c:45:
   In file included from include/linux/mm_inline.h:10:
   In file included from include/trace/hooks/mm.h:6:
>> include/trace/hooks/mm.h:253:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^
   kernel/fork.c:169:13: warning: no previous prototype for function 'arch_release_task_struct' [-Wmissing-prototypes]
     169 | void __weak arch_release_task_struct(struct task_struct *tsk)
         |             ^
   kernel/fork.c:169:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     169 | void __weak arch_release_task_struct(struct task_struct *tsk)
         | ^
         | static 
   kernel/fork.c:813:20: warning: no previous prototype for function 'arch_task_cache_init' [-Wmissing-prototypes]
     813 | void __init __weak arch_task_cache_init(void) { }
         |                    ^
   kernel/fork.c:813:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     813 | void __init __weak arch_task_cache_init(void) { }
         | ^
         | static 
   kernel/fork.c:908:12: warning: no previous prototype for function 'arch_dup_task_struct' [-Wmissing-prototypes]
     908 | int __weak arch_dup_task_struct(struct task_struct *dst,
         |            ^
   kernel/fork.c:908:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     908 | int __weak arch_dup_task_struct(struct task_struct *dst,
         | ^
         | static 
   4 warnings generated.
--
   In file included from mm/page_alloc.c:59:
   In file included from include/linux/mm_inline.h:10:
   In file included from include/trace/hooks/mm.h:6:
>> include/trace/hooks/mm.h:253:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^
   mm/page_alloc.c:4126:15: warning: no previous prototype for function 'should_fail_alloc_page' [-Wmissing-prototypes]
    4126 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^
   mm/page_alloc.c:4126:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4126 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |          ^
         |          static 
   2 warnings generated.
--
   In file included from mm/vmscan.c:31:
   In file included from include/linux/mm_inline.h:10:
   In file included from include/trace/hooks/mm.h:6:
>> include/trace/hooks/mm.h:253:18: warning: declaration of 'struct cma' will not be visible outside of this function [-Wvisibility]
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^
   mm/vmscan.c:909:15: warning: no previous prototype for function 'shrink_slab' [-Wmissing-prototypes]
     909 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^
   mm/vmscan.c:909:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     909 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         | ^
         | static 
   mm/vmscan.c:1383:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1383 |         int err;
         |             ^
   3 warnings generated.


vim +253 include/trace/hooks/mm.h

    34	
    35	DECLARE_RESTRICTED_HOOK(android_rvh_set_skip_swapcache_flags,
    36				TP_PROTO(gfp_t *flags),
    37				TP_ARGS(flags), 1);
    38	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    39				TP_PROTO(gfp_t *flags),
    40				TP_ARGS(flags), 1);
    41	DECLARE_RESTRICTED_HOOK(android_rvh_update_readahead_gfp_mask,
    42				TP_PROTO(struct address_space *mapping, gfp_t *flags),
    43				TP_ARGS(mapping, flags), 2);
    44	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    45				TP_PROTO(gfp_t *flags),
    46				TP_ARGS(flags), 1);
    47	DECLARE_RESTRICTED_HOOK(android_rvh_rmqueue_bulk,
    48				TP_PROTO(void *unused),
    49				TP_ARGS(unused), 1);
    50	DECLARE_HOOK(android_vh_meminfo_proc_show,
    51		TP_PROTO(struct seq_file *m),
    52		TP_ARGS(m));
    53	DECLARE_HOOK(android_vh_exit_mm,
    54		TP_PROTO(struct mm_struct *mm),
    55		TP_ARGS(mm));
    56	DECLARE_HOOK(android_vh_show_mem,
    57		TP_PROTO(unsigned int filter, nodemask_t *nodemask),
    58		TP_ARGS(filter, nodemask));
    59	DECLARE_HOOK(android_vh_alloc_pages_slowpath,
    60		TP_PROTO(gfp_t gfp_mask, unsigned int order, unsigned long delta),
    61		TP_ARGS(gfp_mask, order, delta));
    62	DECLARE_HOOK(android_vh_print_slabinfo_header,
    63		TP_PROTO(struct seq_file *m),
    64		TP_ARGS(m));
    65	DECLARE_HOOK(android_vh_cache_show,
    66		TP_PROTO(struct seq_file *m, struct slabinfo *sinfo, struct kmem_cache *s),
    67		TP_ARGS(m, sinfo, s));
    68	DECLARE_HOOK(android_vh_oom_check_panic,
    69		TP_PROTO(struct oom_control *oc, int *ret),
    70		TP_ARGS(oc, ret));
    71	DECLARE_HOOK(android_vh_drain_all_pages_bypass,
    72		TP_PROTO(gfp_t gfp_mask, unsigned int order, unsigned long alloc_flags,
    73			int migratetype, unsigned long did_some_progress,
    74			bool *bypass),
    75		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, did_some_progress, bypass));
    76	DECLARE_HOOK(android_vh_dm_bufio_shrink_scan_bypass,
    77		TP_PROTO(unsigned long dm_bufio_current_allocated, bool *bypass),
    78		TP_ARGS(dm_bufio_current_allocated, bypass));
    79	DECLARE_HOOK(android_vh_cleanup_old_buffers_bypass,
    80		TP_PROTO(unsigned long dm_bufio_current_allocated,
    81			unsigned long *max_age_hz,
    82			bool *bypass),
    83		TP_ARGS(dm_bufio_current_allocated, max_age_hz, bypass));
    84	DECLARE_HOOK(android_vh_cma_drain_all_pages_bypass,
    85		TP_PROTO(unsigned int migratetype, bool *bypass),
    86		TP_ARGS(migratetype, bypass));
    87	DECLARE_HOOK(android_vh_pcplist_add_cma_pages_bypass,
    88		TP_PROTO(int migratetype, bool *bypass),
    89		TP_ARGS(migratetype, bypass));
    90	DECLARE_HOOK(android_vh_free_unref_page_bypass,
    91		TP_PROTO(struct page *page, int order, int migratetype, bool *bypass),
    92		TP_ARGS(page, order, migratetype, bypass));
    93	DECLARE_HOOK(android_vh_kvmalloc_node_use_vmalloc,
    94		TP_PROTO(size_t size, gfp_t *kmalloc_flags, bool *use_vmalloc),
    95		TP_ARGS(size, kmalloc_flags, use_vmalloc));
    96	DECLARE_HOOK(android_vh_should_alloc_pages_retry,
    97		TP_PROTO(gfp_t gfp_mask, int order, int *alloc_flags,
    98		int migratetype, struct zone *preferred_zone, struct page **page, bool *should_alloc_retry),
    99		TP_ARGS(gfp_mask, order, alloc_flags,
   100			migratetype, preferred_zone, page, should_alloc_retry));
   101	DECLARE_HOOK(android_vh_unreserve_highatomic_bypass,
   102		TP_PROTO(bool force, struct zone *zone, bool *skip_unreserve_highatomic),
   103		TP_ARGS(force, zone, skip_unreserve_highatomic));
   104	DECLARE_HOOK(android_vh_rmqueue_bulk_bypass,
   105		TP_PROTO(unsigned int order, struct per_cpu_pages *pcp, int migratetype,
   106			struct list_head *list),
   107		TP_ARGS(order, pcp, migratetype, list));
   108	DECLARE_HOOK(android_vh_ra_tuning_max_page,
   109		TP_PROTO(struct readahead_control *ractl, unsigned long *max_page),
   110		TP_ARGS(ractl, max_page));
   111	DECLARE_HOOK(android_vh_tune_mmap_readaround,
   112		TP_PROTO(unsigned int ra_pages, pgoff_t pgoff,
   113			pgoff_t *start, unsigned int *size, unsigned int *async_size),
   114		TP_ARGS(ra_pages, pgoff, start, size, async_size));
   115	DECLARE_HOOK(android_vh_mmap_region,
   116		TP_PROTO(struct vm_area_struct *vma, unsigned long addr),
   117		TP_ARGS(vma, addr));
   118	DECLARE_HOOK(android_vh_try_to_unmap_one,
   119		TP_PROTO(struct vm_area_struct *vma, struct page *page, unsigned long addr, bool ret),
   120		TP_ARGS(vma, page, addr, ret));
   121	DECLARE_HOOK(android_vh_cma_alloc_retry,
   122		TP_PROTO(char *name, int *retry),
   123		TP_ARGS(name, retry));
   124	struct mem_cgroup;
   125	DECLARE_HOOK(android_vh_mem_cgroup_alloc,
   126		TP_PROTO(struct mem_cgroup *memcg),
   127		TP_ARGS(memcg));
   128	DECLARE_HOOK(android_vh_mem_cgroup_free,
   129		TP_PROTO(struct mem_cgroup *memcg),
   130		TP_ARGS(memcg));
   131	DECLARE_HOOK(android_vh_mem_cgroup_id_remove,
   132		TP_PROTO(struct mem_cgroup *memcg),
   133		TP_ARGS(memcg));
   134	struct cgroup_subsys_state;
   135	DECLARE_HOOK(android_vh_mem_cgroup_css_online,
   136		TP_PROTO(struct cgroup_subsys_state *css, struct mem_cgroup *memcg),
   137		TP_ARGS(css, memcg));
   138	DECLARE_HOOK(android_vh_mem_cgroup_css_offline,
   139		TP_PROTO(struct cgroup_subsys_state *css, struct mem_cgroup *memcg),
   140		TP_ARGS(css, memcg));
   141	DECLARE_HOOK(android_vh_vmpressure,
   142		TP_PROTO(struct mem_cgroup *memcg, bool *bypass),
   143		TP_ARGS(memcg, bypass));
   144	DECLARE_HOOK(android_vh_do_page_trylock,
   145		TP_PROTO(struct page *page, struct rw_semaphore *sem,
   146			bool *got_lock, bool *success),
   147		TP_ARGS(page, sem, got_lock, success));
   148	DECLARE_HOOK(android_vh_update_page_mapcount,
   149		TP_PROTO(struct page *page, bool inc_size, bool compound,
   150				bool *first_mapping, bool *success),
   151		TP_ARGS(page, inc_size, compound, first_mapping, success));
   152	DECLARE_HOOK(android_vh_add_page_to_lrulist,
   153		TP_PROTO(struct page *page, bool compound, enum lru_list lru),
   154		TP_ARGS(page, compound, lru));
   155	DECLARE_HOOK(android_vh_del_page_from_lrulist,
   156		TP_PROTO(struct page *page, bool compound, enum lru_list lru),
   157		TP_ARGS(page, compound, lru));
   158	DECLARE_HOOK(android_vh_show_mapcount_pages,
   159		TP_PROTO(void *unused),
   160		TP_ARGS(unused));
   161	DECLARE_HOOK(android_vh_do_traversal_lruvec,
   162		TP_PROTO(struct lruvec *lruvec),
   163		TP_ARGS(lruvec));
   164	DECLARE_HOOK(android_vh_page_should_be_protected,
   165		TP_PROTO(struct page *page, bool *should_protect),
   166		TP_ARGS(page, should_protect));
   167	DECLARE_HOOK(android_vh_mark_page_accessed,
   168		TP_PROTO(struct page *page),
   169		TP_ARGS(page));
   170	DECLARE_HOOK(android_vh_page_cache_forced_ra,
   171		TP_PROTO(struct readahead_control *ractl, unsigned long req_count, bool *do_forced_ra),
   172		TP_ARGS(ractl, req_count, do_forced_ra));
   173	DECLARE_HOOK(android_vh_alloc_pages_reclaim_bypass,
   174		TP_PROTO(gfp_t gfp_mask, int order, int alloc_flags,
   175		int migratetype, struct page **page),
   176		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, page));
   177	DECLARE_HOOK(android_vh_alloc_pages_failure_bypass,
   178		TP_PROTO(gfp_t gfp_mask, int order, int alloc_flags,
   179		int migratetype, struct page **page),
   180		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, page));
   181	DECLARE_HOOK(android_vh_save_track_hash,
   182		TP_PROTO(bool alloc, struct track *p),
   183		TP_ARGS(alloc, p));
   184	DECLARE_HOOK(android_vh_rmqueue,
   185		TP_PROTO(struct zone *preferred_zone, struct zone *zone,
   186			unsigned int order, gfp_t gfp_flags,
   187			unsigned int alloc_flags, int migratetype),
   188		TP_ARGS(preferred_zone, zone, order,
   189			gfp_flags, alloc_flags, migratetype));
   190	DECLARE_HOOK(android_vh_kmalloc_slab,
   191		TP_PROTO(unsigned int index, gfp_t flags, struct kmem_cache **s),
   192		TP_ARGS(index, flags, s));
   193	DECLARE_HOOK(android_vh_madvise_cold_or_pageout,
   194		TP_PROTO(struct vm_area_struct *vma, bool *allow_shared),
   195		TP_ARGS(vma, allow_shared));
   196	DECLARE_RESTRICTED_HOOK(android_rvh_ctl_dirty_rate,
   197		TP_PROTO(void *unused),
   198		TP_ARGS(unused), 1);
   199	DECLARE_HOOK(android_vh_rmqueue_smallest_bypass,
   200		TP_PROTO(struct page **page, struct zone *zone, int order, int migratetype),
   201		TP_ARGS(page, zone, order, migratetype));
   202	DECLARE_HOOK(android_vh_free_one_page_bypass,
   203		TP_PROTO(struct page *page, struct zone *zone, int order, int migratetype,
   204			int fpi_flags, bool *bypass),
   205		TP_ARGS(page, zone, order, migratetype, fpi_flags, bypass));
   206	DECLARE_HOOK(android_vh_use_cma_first_check,
   207		TP_PROTO(bool *use_cma_first_check),
   208		TP_ARGS(use_cma_first_check));
   209	DECLARE_HOOK(android_vh_alloc_highpage_movable_gfp_adjust,
   210	        TP_PROTO(gfp_t *gfp_mask),
   211	        TP_ARGS(gfp_mask));
   212	DECLARE_HOOK(android_vh_anon_gfp_adjust,
   213		TP_PROTO(gfp_t *gfp_mask),
   214		TP_ARGS(gfp_mask));
   215	DECLARE_HOOK(android_vh_slab_page_alloced,
   216		TP_PROTO(struct page *page, size_t size, gfp_t flags),
   217		TP_ARGS(page, size, flags));
   218	DECLARE_HOOK(android_vh_kmalloc_order_alloced,
   219	        TP_PROTO(struct page *page, size_t size, gfp_t flags),
   220	        TP_ARGS(page, size, flags));
   221	DECLARE_HOOK(android_vh_compact_finished,
   222		TP_PROTO(bool *abort_compact),
   223		TP_ARGS(abort_compact));
   224	DECLARE_HOOK(android_vh_madvise_cold_or_pageout_abort,
   225		TP_PROTO(struct vm_area_struct *vma, bool *abort_madvise),
   226		TP_ARGS(vma, abort_madvise));
   227	DECLARE_HOOK(android_vh_alloc_flags_cma_adjust,
   228		TP_PROTO(gfp_t gfp_mask, unsigned int *alloc_flags),
   229		TP_ARGS(gfp_mask, alloc_flags));
   230	DECLARE_HOOK(android_vh_rmqueue_cma_fallback,
   231		TP_PROTO(struct zone *zone, unsigned int order, struct page **page),
   232		TP_ARGS(zone, order, page));
   233	DECLARE_HOOK(android_vh_test_clear_look_around_ref,
   234		TP_PROTO(struct page *page),
   235		TP_ARGS(page));
   236	DECLARE_HOOK(android_vh_look_around_migrate_page,
   237		TP_PROTO(struct page *old_page, struct page *new_page),
   238		TP_ARGS(old_page, new_page));
   239	DECLARE_HOOK(android_vh_look_around,
   240		TP_PROTO(struct page_vma_mapped_walk *pvmw, struct page *page,
   241			struct vm_area_struct *vma, int *referenced),
   242		TP_ARGS(pvmw, page, vma, referenced));
   243	DECLARE_HOOK(android_vh_try_cma_fallback,
   244		TP_PROTO(struct zone *zone, unsigned int order, bool *try_cma),
   245		TP_ARGS(zone, order, try_cma));
   246	DECLARE_HOOK(android_vh_set_page_migrating,
   247		TP_PROTO(struct page *page),
   248		TP_ARGS(page));
   249	DECLARE_HOOK(android_vh_clear_page_migrating,
   250		TP_PROTO(struct page *page),
   251		TP_ARGS(page));
   252	DECLARE_HOOK(android_vh_cma_alloc_bypass,
 > 253		TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
   254			bool no_warn, struct page **page, bool *bypass),
   255		TP_ARGS(cma, count, align, no_warn, page, bypass));
   256	#endif /* _TRACE_HOOK_MM_H */
   257	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
