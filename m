Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0189B7081E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jan 2025 17:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737047376; cv=none; b=fMHNA3zMpz7rEF9FE4LYXtdlO82okaxNrqu23TBjEiCYZqY+qMs3GdKlMeOkiRBMKp8eQiUuSlWr0HNDBNiRTxL+aHqSMtKpeHoaYKJPGkcHTzV4F1igdD0hIatfdb+raLzit77FiadCswlCMk6dAcufiVFfOrkrdm5tC2nLCFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737047376; c=relaxed/simple;
	bh=kSq3uFLMK3E334ktq1xOfy8FwRtEdmscoiOLBzbhkFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IqP7cesi6rIR38YOrKrhOQQazGDllONWiQBv8JLpUjW+mG2jRtJnDeeOYpBBemzlohbazBwSdxj1h5aCMR1IXnQCs2VzXcGr895YUScsirqadgbUlDC74ZTvw158dkiHhrJzJ38haUpplxHA3U/xYxB9nbtwAcmO7F96rUcvBfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcxJoC1x; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcxJoC1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737047374; x=1768583374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kSq3uFLMK3E334ktq1xOfy8FwRtEdmscoiOLBzbhkFQ=;
  b=mcxJoC1xxWvNy/l1tnL8e2yJyU9PH9zEqY0PiugB+GWmtwga7ZNtMrtm
   4GdTPSpRMfP+IpdinQvU3SA3YpEsWsttH+Zfj1Tl+iQhD449tODR6etus
   fOyWcg+i6kyHNne0HQI3BZlqr1pFZdF4xDprCE/VdtdSHo9riOmn/1eoL
   +Dj4mox8fJaiRy7jpunA742P3YcjpUFBzhFM7x37+xEYy7cXc7W+OJ0er
   x8UWExjzz5VT/TPkMzZZNhVSBGNml0hqTI7mw2JnWRucGJ7L6HTR3zreg
   m7Qu8Mg40X/JOp1VM66mxrAtcgmaHUGOfjoFxnOKkM8dILZ1uVB4XGqkO
   Q==;
X-CSE-ConnectionGUID: vnFB6jk7SBugts9xJ7PvkA==
X-CSE-MsgGUID: WeM0DiLITgi1ObgQonDMDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37332601"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="37332601"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 09:09:34 -0800
X-CSE-ConnectionGUID: SQ0mSVV8QZ63m/14yNUYPA==
X-CSE-MsgGUID: bb0hXDjVSFyBg3Tmo7lmKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="105514503"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jan 2025 09:09:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYTN3-000SBo-1n;
	Thu, 16 Jan 2025 17:09:29 +0000
Date: Fri, 17 Jan 2025 01:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2707/2707] include/linux/backing-dev.h:418:49:
 warning: declaration of 'struct cgroup_subsys' will not be visible outside
 of this function
Message-ID: <202501170155.aI4YWysc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi wangyigen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   08e54ea5e4a4948874ca30d91be3e5cca4ecbeec
commit: 13e5c52d7cec7621f78bce452b78785e689ed0b2 [2707/2707] cgroup_writeback: bind blkcg and memcg
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250117/202501170155.aI4YWysc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501170155.aI4YWysc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501170155.aI4YWysc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:15:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:1581:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/filemap.c:32:
>> include/linux/backing-dev.h:418:49: warning: declaration of 'struct cgroup_subsys' will not be visible outside of this function [-Wvisibility]
     418 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^
   mm/filemap.c:823:14: warning: no previous prototype for function '__add_to_page_cache_locked' [-Wmissing-prototypes]
     823 | noinline int __add_to_page_cache_locked(struct page *page,
         |              ^
   mm/filemap.c:823:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
     823 | noinline int __add_to_page_cache_locked(struct page *page,
         |          ^
         |          static 
   3 warnings generated.
--
   In file included from mm/fadvise.c:14:
   In file included from include/linux/mm.h:1581:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/fadvise.c:16:
>> include/linux/backing-dev.h:418:49: warning: declaration of 'struct cgroup_subsys' will not be visible outside of this function [-Wvisibility]
     418 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^
   2 warnings generated.
--
   In file included from mm/page-writeback.c:19:
   In file included from include/linux/mm.h:1581:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page-writeback.c:25:
>> include/linux/backing-dev.h:418:49: warning: declaration of 'struct cgroup_subsys' will not be visible outside of this function [-Wvisibility]
     418 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^
   In file included from mm/page-writeback.c:40:
   include/linux/mm_inline.h:34:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      34 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:36:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      36 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   4 warnings generated.
--
   In file included from mm/swap.c:17:
   In file included from include/linux/mm.h:1581:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/swap.c:26:
   include/linux/mm_inline.h:34:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      34 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:36:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      36 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/swap.c:32:
>> include/linux/backing-dev.h:418:49: warning: declaration of 'struct cgroup_subsys' will not be visible outside of this function [-Wvisibility]
     418 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^
   4 warnings generated.
--
   In file included from mm/vmscan.c:17:
   In file included from include/linux/mm.h:1581:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:33:
   include/linux/mm_inline.h:34:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      34 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:36:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      36 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:34:
>> include/linux/backing-dev.h:418:49: warning: declaration of 'struct cgroup_subsys' will not be visible outside of this function [-Wvisibility]
     418 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^
   mm/vmscan.c:569:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     569 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1936:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1936 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2430:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2430 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2431:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2431 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:3263:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3263 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   9 warnings generated.
--
   In file included from mm/page_alloc.c:19:
   In file included from include/linux/mm.h:1581:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:50:
>> include/linux/backing-dev.h:418:49: warning: declaration of 'struct cgroup_subsys' will not be visible outside of this function [-Wvisibility]
     418 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^
   In file included from mm/page_alloc.c:59:
   include/linux/mm_inline.h:34:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      34 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:36:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      36 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/page_alloc.c:2609:5: warning: no previous prototype for function 'find_suitable_fallback' [-Wmissing-prototypes]
    2609 | int find_suitable_fallback(struct free_area *area, unsigned int order,
         |     ^
   mm/page_alloc.c:2609:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2609 | int find_suitable_fallback(struct free_area *area, unsigned int order,
         | ^
         | static 
   mm/page_alloc.c:3040:6: warning: no previous prototype for function '__drain_all_pages' [-Wmissing-prototypes]
    3040 | void __drain_all_pages(struct zone *zone, bool force_all_cpus)
         |      ^
   mm/page_alloc.c:3040:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3040 | void __drain_all_pages(struct zone *zone, bool force_all_cpus)
         | ^
         | static 
   mm/page_alloc.c:3449:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3449 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:3510:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3510 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:3603:15: warning: no previous prototype for function 'should_fail_alloc_page' [-Wmissing-prototypes]
    3603 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^
   mm/page_alloc.c:3603:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3603 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |          ^
         |          static 
   mm/page_alloc.c:5221:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    5221 |                 __count_zid_vm_events(PGALLOC, zone_idx(zone), 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:6753:20: warning: no previous prototype for function 'memmap_init' [-Wmissing-prototypes]
    6753 | void __init __weak memmap_init(void)
         |                    ^
   mm/page_alloc.c:6753:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6753 | void __init __weak memmap_init(void)
         | ^
         | static 
   mm/page_alloc.c:6791:23: warning: no previous prototype for function 'arch_memmap_init' [-Wmissing-prototypes]
    6791 | void __meminit __weak arch_memmap_init(unsigned long size, int nid,
         |                       ^
   mm/page_alloc.c:6791:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6791 | void __meminit __weak arch_memmap_init(unsigned long size, int nid,
         | ^
         | static 
   mm/page_alloc.c:6909:6: warning: no previous prototype for function '__zone_set_pageset_high_and_batch' [-Wmissing-prototypes]
    6909 | void __zone_set_pageset_high_and_batch(struct zone *zone, unsigned long high,
         |      ^
   mm/page_alloc.c:6909:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6909 | void __zone_set_pageset_high_and_batch(struct zone *zone, unsigned long high,
         | ^
         | static 
   13 warnings generated.


vim +418 include/linux/backing-dev.h

   417	
 > 418	static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
   419						   struct css_set *cset)
   420	{
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
