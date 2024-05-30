Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFC341C93
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 04:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717042044; cv=none; b=e17OiQDGSjgdStoaQu8Wl5bMRajLFCDXn+C8HGyNIZirx71uaPjrHg4G8pPm2Eqqhrs7nHML0QKbiyhI1R4TFarfeazLPszUSHKH8lgZ0PRO20Yi/vvaWx3ME56LcHk+iodTrTWdlksCQttMQ3kVxf82fviNMdnHCojL2pFL9Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717042044; c=relaxed/simple;
	bh=hV8ewjrj4U6AxEmqb999awm+frfHlRw05KQKk9MI6js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mg63Rfqyk+fIYye2FJWxV1Qo1GQoIO8qob5awtmDL1rYRH8fPP3qOFoTn0Epa6/jn7eO0lRa+iEtaCvxTZnn5PzOFt0X1n9sCeLO96ffbBBaEErOPFwiBv6AtTRv3Tfy2DTkmW3jLBf+7CVqYQzqzar9xRU8NFBhfN/Gp8eFhS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEayP5dB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEayP5dB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717042041; x=1748578041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hV8ewjrj4U6AxEmqb999awm+frfHlRw05KQKk9MI6js=;
  b=SEayP5dBZSFDTkkyrbb7FNknFtrNl5VUXU0WyHkU+ywePj98Er5juA/J
   KZTYC2l19r5+NMUkWwpH24j/Htqlw5tlHWxkFyizSr0BAvBd/gJgFTQ31
   Mjgg6H/tSUHS+b97To9hD70mAsOofsp56/GGSgtobNNynKPGruifWMl/G
   YPlZRi9RowFjM31Xvv5LWTh8bFyqT8Ey400N27a+Q8PBCFERxjzZDosaq
   VxHsuhV2CCSNRcinxAG5CURRO744guT+x0UEv6b+S1UvfVIv0PK5iLPJn
   3teYJIy+LTTbF/VziVXKA0CIlBsVLeGDlOxIbEZt6TtkOJ50RJC2Q8ul1
   g==;
X-CSE-ConnectionGUID: FTppCuNzR6OzHixucWMeKw==
X-CSE-MsgGUID: NWdkB8UrQUqRaPsQi7w17g==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="38882552"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="38882552"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 21:07:20 -0700
X-CSE-ConnectionGUID: xloco4uPTkyQvBs58STldA==
X-CSE-MsgGUID: EcfgmAFbTbmTzk7jRDhjJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40133430"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 May 2024 21:07:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCX4N-000Eln-2A;
	Thu, 30 May 2024 04:07:15 +0000
Date: Thu, 30 May 2024 12:06:43 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Christoph Hellwig <hch@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>,
	Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH] mm: page_alloc: fix highatomic typing in multi-block
 buddies
Message-ID: <202405301134.V8IUApym-lkp@intel.com>
References: <20240530010419.GA1132939@cmpxchg.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530010419.GA1132939@cmpxchg.org>

Hi Johannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Weiner/mm-page_alloc-fix-highatomic-typing-in-multi-block-buddies/20240530-090639
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240530010419.GA1132939%40cmpxchg.org
patch subject: [PATCH] mm: page_alloc: fix highatomic typing in multi-block buddies
config: i386-buildonly-randconfig-001-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301134.V8IUApym-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301134.V8IUApym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301134.V8IUApym-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/page_alloc.c: In function 'get_page_from_freelist':
>> mm/page_alloc.c:3464:68: warning: passing argument 2 of 'reserve_highatomic_pageblock' makes integer from pointer without a cast [-Wint-conversion]
    3464 |                                 reserve_highatomic_pageblock(page, zone);
         |                                                                    ^~~~
         |                                                                    |
         |                                                                    struct zone *
   mm/page_alloc.c:1964:65: note: expected 'int' but argument is of type 'struct zone *'
    1964 | static void reserve_highatomic_pageblock(struct page *page, int order,
         |                                                             ~~~~^~~~~
>> mm/page_alloc.c:3464:33: error: too few arguments to function 'reserve_highatomic_pageblock'
    3464 |                                 reserve_highatomic_pageblock(page, zone);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1964:13: note: declared here
    1964 | static void reserve_highatomic_pageblock(struct page *page, int order,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/reserve_highatomic_pageblock +3464 mm/page_alloc.c

8510e69c8efef8 Joonsoo Kim        2020-08-06  3310  
7fb1d9fca5c6e3 Rohit Seth         2005-11-13  3311  /*
0798e5193cd70f Paul Jackson       2006-12-06  3312   * get_page_from_freelist goes through the zonelist trying to allocate
7fb1d9fca5c6e3 Rohit Seth         2005-11-13  3313   * a page.
7fb1d9fca5c6e3 Rohit Seth         2005-11-13  3314   */
7fb1d9fca5c6e3 Rohit Seth         2005-11-13  3315  static struct page *
a9263751e11a07 Vlastimil Babka    2015-02-11  3316  get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
a9263751e11a07 Vlastimil Babka    2015-02-11  3317  						const struct alloc_context *ac)
753ee728964e5a Martin Hicks       2005-06-21  3318  {
6bb154504f8b49 Mel Gorman         2018-12-28  3319  	struct zoneref *z;
5117f45d11a9ee Mel Gorman         2009-06-16  3320  	struct zone *zone;
8a87d6959f0d81 Wonhyuk Yang       2022-05-12  3321  	struct pglist_data *last_pgdat = NULL;
8a87d6959f0d81 Wonhyuk Yang       2022-05-12  3322  	bool last_pgdat_dirty_ok = false;
6bb154504f8b49 Mel Gorman         2018-12-28  3323  	bool no_fallback;
3b8c0be43cb844 Mel Gorman         2016-07-28  3324  
6bb154504f8b49 Mel Gorman         2018-12-28  3325  retry:
7fb1d9fca5c6e3 Rohit Seth         2005-11-13  3326  	/*
9276b1bc96a132 Paul Jackson       2006-12-06  3327  	 * Scan zonelist, looking for a zone with enough free.
8e4645226b4931 Haifeng Xu         2023-02-28  3328  	 * See also cpuset_node_allowed() comment in kernel/cgroup/cpuset.c.
7fb1d9fca5c6e3 Rohit Seth         2005-11-13  3329  	 */
6bb154504f8b49 Mel Gorman         2018-12-28  3330  	no_fallback = alloc_flags & ALLOC_NOFRAGMENT;
6bb154504f8b49 Mel Gorman         2018-12-28  3331  	z = ac->preferred_zoneref;
30d8ec73e8772b Mateusz Nosek      2020-10-13  3332  	for_next_zone_zonelist_nodemask(zone, z, ac->highest_zoneidx,
30d8ec73e8772b Mateusz Nosek      2020-10-13  3333  					ac->nodemask) {
be06af002f6d50 Mel Gorman         2016-05-19  3334  		struct page *page;
e085dbc52fad8d Johannes Weiner    2013-09-11  3335  		unsigned long mark;
e085dbc52fad8d Johannes Weiner    2013-09-11  3336  
664eeddeef6539 Mel Gorman         2014-06-04  3337  		if (cpusets_enabled() &&
664eeddeef6539 Mel Gorman         2014-06-04  3338  			(alloc_flags & ALLOC_CPUSET) &&
002f290627c270 Vlastimil Babka    2016-05-19  3339  			!__cpuset_zone_allowed(zone, gfp_mask))
cd38b115d5ad79 Mel Gorman         2011-07-25  3340  				continue;
a756cf5908530e Johannes Weiner    2012-01-10  3341  		/*
a756cf5908530e Johannes Weiner    2012-01-10  3342  		 * When allocating a page cache page for writing, we
281e37265f2826 Mel Gorman         2016-07-28  3343  		 * want to get it from a node that is within its dirty
281e37265f2826 Mel Gorman         2016-07-28  3344  		 * limit, such that no single node holds more than its
a756cf5908530e Johannes Weiner    2012-01-10  3345  		 * proportional share of globally allowed dirty pages.
281e37265f2826 Mel Gorman         2016-07-28  3346  		 * The dirty limits take into account the node's
a756cf5908530e Johannes Weiner    2012-01-10  3347  		 * lowmem reserves and high watermark so that kswapd
a756cf5908530e Johannes Weiner    2012-01-10  3348  		 * should be able to balance it without having to
a756cf5908530e Johannes Weiner    2012-01-10  3349  		 * write pages from its LRU list.
a756cf5908530e Johannes Weiner    2012-01-10  3350  		 *
a756cf5908530e Johannes Weiner    2012-01-10  3351  		 * XXX: For now, allow allocations to potentially
281e37265f2826 Mel Gorman         2016-07-28  3352  		 * exceed the per-node dirty limit in the slowpath
c9ab0c4fbeb020 Mel Gorman         2015-11-06  3353  		 * (spread_dirty_pages unset) before going into reclaim,
a756cf5908530e Johannes Weiner    2012-01-10  3354  		 * which is important when on a NUMA setup the allowed
281e37265f2826 Mel Gorman         2016-07-28  3355  		 * nodes are together not big enough to reach the
a756cf5908530e Johannes Weiner    2012-01-10  3356  		 * global limit.  The proper fix for these situations
281e37265f2826 Mel Gorman         2016-07-28  3357  		 * will require awareness of nodes in the
a756cf5908530e Johannes Weiner    2012-01-10  3358  		 * dirty-throttling and the flusher threads.
a756cf5908530e Johannes Weiner    2012-01-10  3359  		 */
3b8c0be43cb844 Mel Gorman         2016-07-28  3360  		if (ac->spread_dirty_pages) {
8a87d6959f0d81 Wonhyuk Yang       2022-05-12  3361  			if (last_pgdat != zone->zone_pgdat) {
8a87d6959f0d81 Wonhyuk Yang       2022-05-12  3362  				last_pgdat = zone->zone_pgdat;
8a87d6959f0d81 Wonhyuk Yang       2022-05-12  3363  				last_pgdat_dirty_ok = node_dirty_ok(zone->zone_pgdat);
8a87d6959f0d81 Wonhyuk Yang       2022-05-12  3364  			}
3b8c0be43cb844 Mel Gorman         2016-07-28  3365  
8a87d6959f0d81 Wonhyuk Yang       2022-05-12  3366  			if (!last_pgdat_dirty_ok)
800a1e750c7b04 Mel Gorman         2014-06-04  3367  				continue;
3b8c0be43cb844 Mel Gorman         2016-07-28  3368  		}
7fb1d9fca5c6e3 Rohit Seth         2005-11-13  3369  
6bb154504f8b49 Mel Gorman         2018-12-28  3370  		if (no_fallback && nr_online_nodes > 1 &&
6bb154504f8b49 Mel Gorman         2018-12-28  3371  		    zone != ac->preferred_zoneref->zone) {
6bb154504f8b49 Mel Gorman         2018-12-28  3372  			int local_nid;
6bb154504f8b49 Mel Gorman         2018-12-28  3373  
6bb154504f8b49 Mel Gorman         2018-12-28  3374  			/*
6bb154504f8b49 Mel Gorman         2018-12-28  3375  			 * If moving to a remote node, retry but allow
6bb154504f8b49 Mel Gorman         2018-12-28  3376  			 * fragmenting fallbacks. Locality is more important
6bb154504f8b49 Mel Gorman         2018-12-28  3377  			 * than fragmentation avoidance.
6bb154504f8b49 Mel Gorman         2018-12-28  3378  			 */
6bb154504f8b49 Mel Gorman         2018-12-28  3379  			local_nid = zone_to_nid(ac->preferred_zoneref->zone);
6bb154504f8b49 Mel Gorman         2018-12-28  3380  			if (zone_to_nid(zone) != local_nid) {
6bb154504f8b49 Mel Gorman         2018-12-28  3381  				alloc_flags &= ~ALLOC_NOFRAGMENT;
6bb154504f8b49 Mel Gorman         2018-12-28  3382  				goto retry;
6bb154504f8b49 Mel Gorman         2018-12-28  3383  			}
6bb154504f8b49 Mel Gorman         2018-12-28  3384  		}
6bb154504f8b49 Mel Gorman         2018-12-28  3385  
57c0419c5f0ea2 Huang Ying         2023-10-16  3386  		/*
57c0419c5f0ea2 Huang Ying         2023-10-16  3387  		 * Detect whether the number of free pages is below high
57c0419c5f0ea2 Huang Ying         2023-10-16  3388  		 * watermark.  If so, we will decrease pcp->high and free
57c0419c5f0ea2 Huang Ying         2023-10-16  3389  		 * PCP pages in free path to reduce the possibility of
57c0419c5f0ea2 Huang Ying         2023-10-16  3390  		 * premature page reclaiming.  Detection is done here to
57c0419c5f0ea2 Huang Ying         2023-10-16  3391  		 * avoid to do that in hotter free path.
57c0419c5f0ea2 Huang Ying         2023-10-16  3392  		 */
57c0419c5f0ea2 Huang Ying         2023-10-16  3393  		if (test_bit(ZONE_BELOW_HIGH, &zone->flags))
57c0419c5f0ea2 Huang Ying         2023-10-16  3394  			goto check_alloc_wmark;
57c0419c5f0ea2 Huang Ying         2023-10-16  3395  
57c0419c5f0ea2 Huang Ying         2023-10-16  3396  		mark = high_wmark_pages(zone);
57c0419c5f0ea2 Huang Ying         2023-10-16  3397  		if (zone_watermark_fast(zone, order, mark,
57c0419c5f0ea2 Huang Ying         2023-10-16  3398  					ac->highest_zoneidx, alloc_flags,
57c0419c5f0ea2 Huang Ying         2023-10-16  3399  					gfp_mask))
57c0419c5f0ea2 Huang Ying         2023-10-16  3400  			goto try_this_zone;
57c0419c5f0ea2 Huang Ying         2023-10-16  3401  		else
57c0419c5f0ea2 Huang Ying         2023-10-16  3402  			set_bit(ZONE_BELOW_HIGH, &zone->flags);
57c0419c5f0ea2 Huang Ying         2023-10-16  3403  
57c0419c5f0ea2 Huang Ying         2023-10-16  3404  check_alloc_wmark:
a921444382b49c Mel Gorman         2018-12-28  3405  		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK);
48ee5f3696f624 Mel Gorman         2016-05-19  3406  		if (!zone_watermark_fast(zone, order, mark,
f80b08fc44536a Charan Teja Reddy  2020-08-06  3407  				       ac->highest_zoneidx, alloc_flags,
f80b08fc44536a Charan Teja Reddy  2020-08-06  3408  				       gfp_mask)) {
e085dbc52fad8d Johannes Weiner    2013-09-11  3409  			int ret;
fa5e084e43eb14 Mel Gorman         2009-06-16  3410  
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  3411  			if (has_unaccepted_memory()) {
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  3412  				if (try_to_accept_memory(zone, order))
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  3413  					goto try_this_zone;
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  3414  			}
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  3415  
c9e97a1997fbf3 Pavel Tatashin     2018-04-05  3416  #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
c9e97a1997fbf3 Pavel Tatashin     2018-04-05  3417  			/*
c9e97a1997fbf3 Pavel Tatashin     2018-04-05  3418  			 * Watermark failed for this zone, but see if we can
c9e97a1997fbf3 Pavel Tatashin     2018-04-05  3419  			 * grow this zone if it contains deferred pages.
c9e97a1997fbf3 Pavel Tatashin     2018-04-05  3420  			 */
076cf7ea67010d Anshuman Khandual  2023-01-05  3421  			if (deferred_pages_enabled()) {
c9e97a1997fbf3 Pavel Tatashin     2018-04-05  3422  				if (_deferred_grow_zone(zone, order))
c9e97a1997fbf3 Pavel Tatashin     2018-04-05  3423  					goto try_this_zone;
c9e97a1997fbf3 Pavel Tatashin     2018-04-05  3424  			}
c9e97a1997fbf3 Pavel Tatashin     2018-04-05  3425  #endif
5dab29113ca563 Mel Gorman         2014-06-04  3426  			/* Checked here to keep the fast path fast */
5dab29113ca563 Mel Gorman         2014-06-04  3427  			BUILD_BUG_ON(ALLOC_NO_WATERMARKS < NR_WMARK);
5dab29113ca563 Mel Gorman         2014-06-04  3428  			if (alloc_flags & ALLOC_NO_WATERMARKS)
5dab29113ca563 Mel Gorman         2014-06-04  3429  				goto try_this_zone;
5dab29113ca563 Mel Gorman         2014-06-04  3430  
202e35db5e719e Dave Hansen        2021-05-04  3431  			if (!node_reclaim_enabled() ||
c33d6c06f60f71 Mel Gorman         2016-05-19  3432  			    !zone_allows_reclaim(ac->preferred_zoneref->zone, zone))
cd38b115d5ad79 Mel Gorman         2011-07-25  3433  				continue;
cd38b115d5ad79 Mel Gorman         2011-07-25  3434  
a5f5f91da6ad64 Mel Gorman         2016-07-28  3435  			ret = node_reclaim(zone->zone_pgdat, gfp_mask, order);
fa5e084e43eb14 Mel Gorman         2009-06-16  3436  			switch (ret) {
a5f5f91da6ad64 Mel Gorman         2016-07-28  3437  			case NODE_RECLAIM_NOSCAN:
fa5e084e43eb14 Mel Gorman         2009-06-16  3438  				/* did not scan */
cd38b115d5ad79 Mel Gorman         2011-07-25  3439  				continue;
a5f5f91da6ad64 Mel Gorman         2016-07-28  3440  			case NODE_RECLAIM_FULL:
fa5e084e43eb14 Mel Gorman         2009-06-16  3441  				/* scanned but unreclaimable */
cd38b115d5ad79 Mel Gorman         2011-07-25  3442  				continue;
fa5e084e43eb14 Mel Gorman         2009-06-16  3443  			default:
fa5e084e43eb14 Mel Gorman         2009-06-16  3444  				/* did we reclaim enough */
fed2719e7a8612 Mel Gorman         2013-04-29  3445  				if (zone_watermark_ok(zone, order, mark,
97a225e69a1f88 Joonsoo Kim        2020-06-03  3446  					ac->highest_zoneidx, alloc_flags))
fed2719e7a8612 Mel Gorman         2013-04-29  3447  					goto try_this_zone;
fed2719e7a8612 Mel Gorman         2013-04-29  3448  
fed2719e7a8612 Mel Gorman         2013-04-29  3449  				continue;
7fb1d9fca5c6e3 Rohit Seth         2005-11-13  3450  			}
0798e5193cd70f Paul Jackson       2006-12-06  3451  		}
7fb1d9fca5c6e3 Rohit Seth         2005-11-13  3452  
fa5e084e43eb14 Mel Gorman         2009-06-16  3453  try_this_zone:
066b23935578d3 Mel Gorman         2017-02-24  3454  		page = rmqueue(ac->preferred_zoneref->zone, zone, order,
0aaa29a56e4fb0 Mel Gorman         2015-11-06  3455  				gfp_mask, alloc_flags, ac->migratetype);
753791910e23a9 Vlastimil Babka    2015-02-11  3456  		if (page) {
479f854a207ce2 Mel Gorman         2016-05-19  3457  			prep_new_page(page, order, gfp_mask, alloc_flags);
0aaa29a56e4fb0 Mel Gorman         2015-11-06  3458  
0aaa29a56e4fb0 Mel Gorman         2015-11-06  3459  			/*
0aaa29a56e4fb0 Mel Gorman         2015-11-06  3460  			 * If this is a high-order atomic allocation then check
0aaa29a56e4fb0 Mel Gorman         2015-11-06  3461  			 * if the pageblock should be reserved for the future
0aaa29a56e4fb0 Mel Gorman         2015-11-06  3462  			 */
eb2e2b425c6984 Mel Gorman         2023-01-13  3463  			if (unlikely(alloc_flags & ALLOC_HIGHATOMIC))
368d983b985572 ZhangPeng          2023-08-09 @3464  				reserve_highatomic_pageblock(page, zone);
0aaa29a56e4fb0 Mel Gorman         2015-11-06  3465  
753791910e23a9 Vlastimil Babka    2015-02-11  3466  			return page;
c9e97a1997fbf3 Pavel Tatashin     2018-04-05  3467  		} else {
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  3468  			if (has_unaccepted_memory()) {
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  3469  				if (try_to_accept_memory(zone, order))
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  3470  					goto try_this_zone;
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  3471  			}
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  3472  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
