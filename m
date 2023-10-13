Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17D2219E5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkiDa8GN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697224826; x=1728760826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xXtEO4DFd2Q7KgNuQOwmN1BRPkO7P3rG7fWoOezicCw=;
  b=WkiDa8GN/RJXNFJEcVGm7/rZe+VAfOvn/S1++naQBYGppLLS49BPlB2j
   hvV7SsJr1sgVpZn+dT2uelT0yM0BhAZnIUfdNacaKIUaL6HNPbaVqSD79
   4P3oLmQZkugUU4+wkRtht8qmsne6M/WGY6x1/iuHcv1knZyNHkq4e1zpO
   3jaNDGr/BW2NlYVmt1QXfDR6M781jMhY6I9sKmCwu6iDn8Un+S0a5Tuis
   vAzkfGjjGDfX4zrZhqL3Cp08jJLvJKrg2E3ntuRGvCMPEh8mBgWLRtlKh
   RRb+mJbzh5CTZnSnK1LFXrYueOtQwPZdf2dG6mgaPu32rsS6hk2JJSYWp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="416305979"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="416305979"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 12:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825160121"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="825160121"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Oct 2023 12:20:24 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrNht-0005JB-2d;
	Fri, 13 Oct 2023 19:20:21 +0000
Date: Sat, 14 Oct 2023 03:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [christoph:largepageprotect 3/3] mm/page_alloc.c:5818:17: warning:
 this 'for' clause does not guard...
Message-ID: <202310140336.6ExfGwqw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/christoph/linux.git largepageprotect
head:   8216937c02e2cc14d3005e5cff6c15bb72672ce7
commit: 8216937c02e2cc14d3005e5cff6c15bb72672ce7 [3/3] Updates watermarks calculation for page reservations
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140336.6ExfGwqw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140336.6ExfGwqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140336.6ExfGwqw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/swap.h:11,
                    from include/linux/suspend.h:5,
                    from mm/page_alloc.c:28:
   include/linux/node.h:176:49: error: unknown type name 'node_registration_func_t'
     176 | static inline void register_hugetlbfs_with_node(node_registration_func_t reg,
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/node.h:177:49: error: unknown type name 'node_registration_func_t'
     177 |                                                 node_registration_func_t unreg)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/node.h:192:46: error: unknown type name 'node_registration_func_t'
     192 | static inline void register_vmstat_with_node(node_registration_func_t doregister,
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/node.h:193:49: error: unknown type name 'node_registration_func_t'
     193 |                                                 node_registration_func_t unregister)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'set_page_order_min':
   mm/page_alloc.c:5082:39: error: invalid operands to binary + (have 'long int' and 'atomic_long_t' {aka 'atomic_t'})
    5082 |                         managed_pages += z->managed_pages;
         |                                       ^~ ~~~~~~~~~~~~~~~~
         |                                           |
         |                                           atomic_long_t {aka atomic_t}
   mm/page_alloc.c:5096:25: error: aggregate value used where an integer was expected
    5096 |                         tmp = (u64)z->managed_pages * (min << order);
         |                         ^~~
   mm/page_alloc.c: At top level:
   mm/page_alloc.c:5266:47: warning: 'enum memmap_context' declared inside parameter list will not be visible outside of this definition or declaration
    5266 |                 unsigned long start_pfn, enum memmap_context context,
         |                                               ^~~~~~~~~~~~~~
   mm/page_alloc.c:5266:62: error: parameter 5 ('context') has incomplete type
    5266 |                 unsigned long start_pfn, enum memmap_context context,
         |                                          ~~~~~~~~~~~~~~~~~~~~^~~~~~~
   mm/page_alloc.c:5265:16: error: function declaration isn't a prototype [-Werror=strict-prototypes]
    5265 | void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
         |                ^~~~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'memmap_init_zone':
   mm/page_alloc.c:5293:32: error: 'MEMMAP_EARLY' undeclared (first use in this function); did you mean 'MEMINIT_EARLY'?
    5293 |                 if (context != MEMMAP_EARLY)
         |                                ^~~~~~~~~~~~
         |                                MEMINIT_EARLY
   mm/page_alloc.c:5293:32: note: each undeclared identifier is reported only once for each function it appears in
   mm/page_alloc.c:5296:22: error: implicit declaration of function 'early_pfn_valid'; did you mean 'early_pfn_to_nid'? [-Werror=implicit-function-declaration]
    5296 |                 if (!early_pfn_valid(pfn))
         |                      ^~~~~~~~~~~~~~~
         |                      early_pfn_to_nid
   mm/page_alloc.c:5298:22: error: implicit declaration of function 'early_pfn_in_nid'; did you mean 'early_pfn_to_nid'? [-Werror=implicit-function-declaration]
    5298 |                 if (!early_pfn_in_nid(pfn, nid))
         |                      ^~~~~~~~~~~~~~~~
         |                      early_pfn_to_nid
   mm/page_alloc.c:5300:22: error: implicit declaration of function 'update_defer_init' [-Werror=implicit-function-declaration]
    5300 |                 if (!update_defer_init(pgdat, pfn, end_pfn, &nr_initialised))
         |                      ^~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5327:17: error: implicit declaration of function '__init_single_page' [-Werror=implicit-function-declaration]
    5327 |                 __init_single_page(page, pfn, zone, nid);
         |                 ^~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5328:32: error: 'MEMMAP_HOTPLUG' undeclared (first use in this function); did you mean 'MEMINIT_HOTPLUG'?
    5328 |                 if (context == MEMMAP_HOTPLUG)
         |                                ^~~~~~~~~~~~~~
         |                                MEMINIT_HOTPLUG
   mm/page_alloc.c: In function '__setup_per_zone_wmarks':
>> mm/page_alloc.c:5818:17: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
    5818 |                 for (order = 0; order < MAX_ORDER; order++)
         |                 ^~~
   mm/page_alloc.c:5830:25: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'for'
    5830 |                         unsigned long min_pages;
         |                         ^~~~~~~~
   mm/page_alloc.c: At top level:
   mm/page_alloc.c:5353:23: warning: 'zone_init_free_lists' defined but not used [-Wunused-function]
    5353 | static void __meminit zone_init_free_lists(struct zone *zone)
         |                       ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/for +5818 mm/page_alloc.c

  5795	
  5796	static void __setup_per_zone_wmarks(void)
  5797	{
  5798		unsigned long pages_min = min_free_kbytes >> (PAGE_SHIFT - 10);
  5799		unsigned long lowmem_pages = 0;
  5800		struct zone *zone;
  5801		int order;
  5802		unsigned long flags;
  5803	
  5804		/* Calculate total number of !ZONE_HIGHMEM and !ZONE_MOVABLE pages */
  5805		for_each_zone(zone) {
  5806			if (!is_highmem(zone) && zone_idx(zone) != ZONE_MOVABLE)
  5807				lowmem_pages += zone_managed_pages(zone);
  5808		}
  5809	
  5810		for_each_zone(zone) {
  5811			u64 tmp;
  5812	
  5813			spin_lock_irqsave(&zone->lock, flags);
  5814			tmp = (u64)pages_min * zone_managed_pages(zone);
  5815			do_div(tmp, lowmem_pages);
  5816			if (is_highmem(zone)) {
  5817	
> 5818			for (order = 0; order < MAX_ORDER; order++)
  5819				tmp += ((u64)zone->free_area[order].min) << order;
  5820	
  5821				/*
  5822				 * __GFP_HIGH and PF_MEMALLOC allocations usually don't
  5823				 * need highmem and movable zones pages, so cap pages_min
  5824				 * to a small  value here.
  5825				 *
  5826				 * The WMARK_HIGH-WMARK_LOW and (WMARK_LOW-WMARK_MIN)
  5827				 * deltas control async page reclaim, and so should
  5828				 * not be capped for highmem and movable zones.
  5829				 */
  5830				unsigned long min_pages;
  5831	
  5832				min_pages = zone_managed_pages(zone) / 1024;
  5833				min_pages = clamp(min_pages, SWAP_CLUSTER_MAX, 128UL);
  5834				zone->_watermark[WMARK_MIN] = min_pages;
  5835			} else {
  5836				/*
  5837				 * If it's a lowmem zone, reserve a number of pages
  5838				 * proportionate to the zone's size.
  5839				 */
  5840				zone->_watermark[WMARK_MIN] = tmp;
  5841			}
  5842	
  5843			/*
  5844			 * Set the kswapd watermarks distance according to the
  5845			 * scale factor in proportion to available memory, but
  5846			 * ensure a minimum size on small systems.
  5847			 */
  5848			tmp = max_t(u64, tmp >> 2,
  5849				    mult_frac(zone_managed_pages(zone),
  5850					      watermark_scale_factor, 10000));
  5851	
  5852			zone->watermark_boost = 0;
  5853			zone->_watermark[WMARK_LOW]  = min_wmark_pages(zone) + tmp;
  5854			zone->_watermark[WMARK_HIGH] = low_wmark_pages(zone) + tmp;
  5855			zone->_watermark[WMARK_PROMO] = high_wmark_pages(zone) + tmp;
  5856	
  5857			spin_unlock_irqrestore(&zone->lock, flags);
  5858		}
  5859	
  5860		/* update totalreserve_pages */
  5861		calculate_totalreserve_pages();
  5862	}
  5863	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
