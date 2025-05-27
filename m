Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40D719F43A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 21:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748381316; cv=none; b=Hm/Tv1DQtWsu+5VPgDSG42BkeNKCJTc9fvynrdkLRLQBdDJE8kvD+eEkykNLgKQrzj/SXB1ZC/reHM9Hpq57YxWja2w964JfLstfOJ21mwI944iz0OqhqHiiOQUI18uWL8PAKyUkVtyOAG7+hdzEEcWwo8DuJMEmItPJxGUwVBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748381316; c=relaxed/simple;
	bh=fhfm7y7tiGy0If4J0GKF7ME1/co+3yaVDZ+zoPAwVVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gU0Q99rFSkKCCf7NGEFoervECC1JM/CXEy+tN9/Zvf38f/pnJ8dNn6uWwLcGeaWZl0+NauXRkLGk143UclEQw3fhfGMG9xUBZVqBbPgq1dGYiGYJzLVSb6Ui6NGFr0GBNVXXPVSuoGWRiZnx8loJQTqZVbL1jloX1kDXBMVeFNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyP7G8FJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyP7G8FJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748381315; x=1779917315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fhfm7y7tiGy0If4J0GKF7ME1/co+3yaVDZ+zoPAwVVM=;
  b=CyP7G8FJr5sJDPjAedpr6JxS6SJoNnUAFQpXv9MXlVywPXC1aNfilUbk
   hlJx54qik3q5O6jOmPaVh7V3AZRskuQ6UCGVYuhFqQTcQj2srmV+w71gb
   hHVYtaufYSmV1vj091lxqVVQr7shIDbiPFWR/4iHY6WkNa1vN/4E+/IeW
   A307pedT1a6dxZFwL1HniiyyIebeO6637fRU9H9DBeQdssVCgyuxaFHMb
   YHpfTPhiJPzmLDDhjGOo5Vq5OEZOLfz4LfgQM1M5GtM41Dfe/V7pysQ+w
   vznNEk1gniCLXIm/5169dViHSXR269LAxQJ94wT/+G0MNEa4ntQYVnntD
   w==;
X-CSE-ConnectionGUID: oFr6TgLZSPKv7cRKJxOnKg==
X-CSE-MsgGUID: wlTr0STcR9+/wn54aaEPaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50390355"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50390355"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 14:28:35 -0700
X-CSE-ConnectionGUID: aUJ04HkZQvesYwwg96BCTQ==
X-CSE-MsgGUID: SpY0bKXPRW6ZpOvV5cPgiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="143953216"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 May 2025 14:28:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK1qZ-000V1e-1b;
	Tue, 27 May 2025 21:28:31 +0000
Date: Wed, 28 May 2025 05:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1] mm/page_alloc.c:9247: warning:
 Function parameter or member 'info' not described in 'alloc_contig_range'
Message-ID: <202505280543.PiYii3En-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   14f411bb7352f0fa2c69841b8c2ed1584f9db6de
commit: a7f55c5c739a960c94858f9fbd4776e03ef05bbd [1/1] ANDROID: mm: add cma allocation statistics
config: arm-randconfig-004-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280543.PiYii3En-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280543.PiYii3En-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280543.PiYii3En-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:9247: warning: Function parameter or member 'info' not described in 'alloc_contig_range'


vim +9247 mm/page_alloc.c

041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9222  
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9223  /**
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9224   * alloc_contig_range() -- tries to allocate given range of pages
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9225   * @start:	start PFN to allocate
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9226   * @end:	one-past-the-last PFN to allocate
f0953a1bbaca71e Ingo Molnar             2021-05-06  9227   * @migratetype:	migratetype of the underlying pageblocks (either
0815f3d81d76dfb Michal Nazarewicz       2012-04-03  9228   *			#MIGRATE_MOVABLE or #MIGRATE_CMA).  All pageblocks
0815f3d81d76dfb Michal Nazarewicz       2012-04-03  9229   *			in range must have the same migratetype and it must
0815f3d81d76dfb Michal Nazarewicz       2012-04-03  9230   *			be either of the two.
ca96b625341027f Lucas Stach             2017-02-24  9231   * @gfp_mask:	GFP mask to use during compaction
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9232   *
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9233   * The PFN range does not have to be pageblock or MAX_ORDER_NR_PAGES
2c7452a075d4db2 Mike Kravetz            2018-04-05  9234   * aligned.  The PFN range must belong to a single zone.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9235   *
2c7452a075d4db2 Mike Kravetz            2018-04-05  9236   * The first thing this routine does is attempt to MIGRATE_ISOLATE all
2c7452a075d4db2 Mike Kravetz            2018-04-05  9237   * pageblocks in the range.  Once isolated, the pageblocks should not
2c7452a075d4db2 Mike Kravetz            2018-04-05  9238   * be modified by others.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9239   *
a862f68a8b36008 Mike Rapoport           2019-03-05  9240   * Return: zero on success or negative error code.  On success all
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9241   * pages which PFN is in [start, end) are allocated for the caller and
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9242   * need to be freed with free_contig_range().
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9243   */
0815f3d81d76dfb Michal Nazarewicz       2012-04-03  9244  int alloc_contig_range(unsigned long start, unsigned long end,
a7f55c5c739a960 Minchan Kim             2021-06-29  9245  		       unsigned migratetype, gfp_t gfp_mask,
a7f55c5c739a960 Minchan Kim             2021-06-29  9246  		       struct acr_info *info)
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29 @9247  {
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9248  	unsigned long outer_start, outer_end;
d00181b96eb86c9 Kirill A. Shutemov      2015-11-06  9249  	unsigned int order;
d00181b96eb86c9 Kirill A. Shutemov      2015-11-06  9250  	int ret = 0;
a82943cdfbe8acb Peifeng Li              2022-03-15  9251  	bool skip_drain_all_pages = false;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9252  
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9253  	struct compact_control cc = {
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9254  		.nr_migratepages = 0,
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9255  		.order = -1,
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9256  		.zone = page_zone(pfn_to_page(start)),
9cb760bc6adde97 Minchan Kim             2020-12-21  9257  		.mode = gfp_mask & __GFP_NORETRY ? MIGRATE_ASYNC : MIGRATE_SYNC,
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9258  		.ignore_skip_hint = true,
2583d6713267a4c Vlastimil Babka         2017-11-17  9259  		.no_set_skip_hint = true,
7dea19f9ee636cb Michal Hocko            2017-05-03  9260  		.gfp_mask = current_gfp_context(gfp_mask),
b06eda091e5d65b Rik van Riel            2020-04-01  9261  		.alloc_contig = true,
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9262  	};
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9263  	INIT_LIST_HEAD(&cc.migratepages);
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9264  
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9265  	/*
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9266  	 * What we do here is we mark all pageblocks in range as
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9267  	 * MIGRATE_ISOLATE.  Because pageblock and max order pages may
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9268  	 * have different sizes, and due to the way page allocator
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9269  	 * work, we align the range to biggest of the two pages so
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9270  	 * that page allocator won't try to merge buddies from
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9271  	 * different pageblocks and change MIGRATE_ISOLATE to some
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9272  	 * other migration type.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9273  	 *
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9274  	 * Once the pageblocks are marked as MIGRATE_ISOLATE, we
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9275  	 * migrate the pages from an unaligned range (ie. pages that
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9276  	 * we are interested in).  This will put all the pages in
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9277  	 * range back to page allocator as MIGRATE_ISOLATE.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9278  	 *
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9279  	 * When this is done, we take the pages in range from page
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9280  	 * allocator removing them from the buddy system.  This way
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9281  	 * page allocator will never consider using them.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9282  	 *
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9283  	 * This lets us mark the pageblocks back as
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9284  	 * MIGRATE_CMA/MIGRATE_MOVABLE so that free pages in the
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9285  	 * aligned range but not in the unaligned, original range are
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9286  	 * put back to page allocator so that buddy can use them.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9287  	 */
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9288  
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9289  	ret = start_isolate_page_range(pfn_max_align_down(start),
d381c54760dcfad Michal Hocko            2018-12-28  9290  				       pfn_max_align_up(end), migratetype, 0);
a7f55c5c739a960 Minchan Kim             2021-06-29  9291  	if (ret) {
a7f55c5c739a960 Minchan Kim             2021-06-29  9292  		info->err |= ACR_ERR_ISOLATE;
86a595f961360c9 Bob Liu                 2012-10-25  9293  		return ret;
a7f55c5c739a960 Minchan Kim             2021-06-29  9294  	}
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9295  
a82943cdfbe8acb Peifeng Li              2022-03-15  9296  	trace_android_vh_cma_drain_all_pages_bypass(migratetype,
a82943cdfbe8acb Peifeng Li              2022-03-15  9297  						&skip_drain_all_pages);
c46b91c287e34cb Suren Baghdasaryan      2022-05-12  9298  	if (!skip_drain_all_pages)
7612921f2376d51 Vlastimil Babka         2020-12-14  9299  		drain_all_pages(cc.zone);
7612921f2376d51 Vlastimil Babka         2020-12-14  9300  
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9301  	/*
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9302  	 * In case of -EBUSY, we'd like to know which page causes problem.
63cd448908b5eb5 Mike Kravetz            2017-11-29  9303  	 * So, just fall through. test_pages_isolated() has a tracepoint
63cd448908b5eb5 Mike Kravetz            2017-11-29  9304  	 * which will report the busy page.
63cd448908b5eb5 Mike Kravetz            2017-11-29  9305  	 *
63cd448908b5eb5 Mike Kravetz            2017-11-29  9306  	 * It is possible that busy pages could become available before
63cd448908b5eb5 Mike Kravetz            2017-11-29  9307  	 * the call to test_pages_isolated, and the range will actually be
63cd448908b5eb5 Mike Kravetz            2017-11-29  9308  	 * allocated.  So, if we fall through be sure to clear ret so that
63cd448908b5eb5 Mike Kravetz            2017-11-29  9309  	 * -EBUSY is not accidentally used or returned to caller.
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9310  	 */
a7f55c5c739a960 Minchan Kim             2021-06-29  9311  	ret = __alloc_contig_migrate_range(&cc, start, end, info);
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9312  	if (ret && ret != -EBUSY)
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9313  		goto done;
63cd448908b5eb5 Mike Kravetz            2017-11-29  9314  	ret = 0;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9315  
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9316  	/*
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9317  	 * Pages from [start, end) are within a MAX_ORDER_NR_PAGES
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9318  	 * aligned blocks that are marked as MIGRATE_ISOLATE.  What's
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9319  	 * more, all pages in [start, end) are free in page allocator.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9320  	 * What we are going to do is to allocate all pages from
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9321  	 * [start, end) (that is remove them from page allocator).
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9322  	 *
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9323  	 * The only problem is that pages at the beginning and at the
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9324  	 * end of interesting range may be not aligned with pages that
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9325  	 * page allocator holds, ie. they can be part of higher order
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9326  	 * pages.  Because of this, we reserve the bigger range and
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9327  	 * once this is done free the pages we are not interested in.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9328  	 *
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9329  	 * We don't have to hold zone->lock here because the pages are
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9330  	 * isolated thus they won't get removed from buddy.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9331  	 */
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9332  
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9333  	order = 0;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9334  	outer_start = start;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9335  	while (!PageBuddy(pfn_to_page(outer_start))) {
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9336  		if (++order >= MAX_ORDER) {
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9337  			outer_start = start;
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9338  			break;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9339  		}
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9340  		outer_start &= ~0UL << order;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9341  	}
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9342  
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9343  	if (outer_start != start) {
ab130f9108dcf20 Matthew Wilcox (Oracle  2020-10-15  9344) 		order = buddy_order(pfn_to_page(outer_start));
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9345  
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9346  		/*
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9347  		 * outer_start page could be small order buddy page and
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9348  		 * it doesn't include start page. Adjust outer_start
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9349  		 * in this case to report failed page properly
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9350  		 * on tracepoint in test_pages_isolated()
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9351  		 */
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9352  		if (outer_start + (1UL << order) <= start)
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9353  			outer_start = start;
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9354  	}
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9355  
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9356  	/* Make sure the range is really isolated. */
756d25be457fc54 David Hildenbrand       2019-11-30  9357  	if (test_pages_isolated(outer_start, end, 0)) {
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9358  		ret = -EBUSY;
a7f55c5c739a960 Minchan Kim             2021-06-29  9359  		info->err |= ACR_ERR_TEST;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9360  		goto done;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9361  	}
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9362  
49f223a9cd96c72 Marek Szyprowski        2012-01-25  9363  	/* Grab isolated pages from freelists. */
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9364  	outer_end = isolate_freepages_range(&cc, outer_start, end);
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9365  	if (!outer_end) {
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9366  		ret = -EBUSY;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9367  		goto done;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9368  	}
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9369  
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9370  	/* Free head and tail (if any) */
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9371  	if (start != outer_start)
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9372  		free_contig_range(outer_start, start - outer_start);
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9373  	if (end != outer_end)
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9374  		free_contig_range(end, outer_end - end);
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9375  
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9376  done:
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9377  	undo_isolate_page_range(pfn_max_align_down(start),
0815f3d81d76dfb Michal Nazarewicz       2012-04-03  9378  				pfn_max_align_up(end), migratetype);
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9379  	return ret;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9380  }
255f59850708390 David Hildenbrand       2020-05-07  9381  EXPORT_SYMBOL(alloc_contig_range);
5e27a2df03b8933 Anshuman Khandual       2019-11-30  9382  

:::::: The code at line 9247 was first introduced by commit
:::::: 041d3a8cdc18dc375a128d90bbb753949a81b1fb mm: page_alloc: introduce alloc_contig_range()

:::::: TO: Michal Nazarewicz <mina86@mina86.com>
:::::: CC: Marek Szyprowski <m.szyprowski@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
