Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9312676D8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 17:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739555756; cv=none; b=OvLmlWgD8jZ2mpaMVAqXs60C6hc7VA6Z+zBN3Q/R1bZYokH8yObm+ttewJoQRFKMOfwK43wCKE5CwXzO+3ln3fPLi2NqnHfq34sGLXkRkk+QWZTmNBhUgaOsZcEziimlicfLET9LEJEl5D2mdtsx/ZCQoQ+pH3di6aB3/7uO6Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739555756; c=relaxed/simple;
	bh=BJEmpDot1kUKvRHUCgVuZ8z6CYbCdSEaHjlXDReI4Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U5yEGuYO/DTWW9DaZPw1BddpQMXfQo4HTWnVMpwMxvbBn4z+5mkm7VwImc/dRKCuLPxJ2IgoDPvmDDj3b9sknC8I2tXjGqQw8/EVAi44eDil9W+tCrkdG5Ku1zzZLP47kiWIrmepLfw7kKc3pNENNLcluVdt5d3kDJrSI25/9Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hX6xOuq1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hX6xOuq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739555754; x=1771091754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BJEmpDot1kUKvRHUCgVuZ8z6CYbCdSEaHjlXDReI4Bw=;
  b=hX6xOuq1Q9CoIkFG956KtCtJVH/fmrQHrAh+efXDI1HJQMqeGu65TnJ3
   Zr6ME5dLwICFrnvyCrLKXN2wnlvERZ7MO9+8c3MqlC1inXt8g1n7ID627
   CmFqZwGgGj888ZYbx3AmHshhEMD0SBYylv2b3E5gBQ0JulgI7CMhtJRP9
   Mcej9WIZzHpD4eCL5NGDzEWx5tYZF/c7Mow7Mb70u24FgfdJps1Nh527w
   lj3RFiP2wPTv/5dUwDGjfEScWiFh+7txXfe1I+uwUOR9BUdg5TmXuIYMd
   4Ww3Xg9IrnsaJHWBG8NVuS6hx5k7KUqdlEA1hfu19N4AZELV0JKnJ2XKK
   A==;
X-CSE-ConnectionGUID: tTJOSXMERvSn/mA0crUxyg==
X-CSE-MsgGUID: 1ueErWjDRSiZqZywTm44Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50956817"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="50956817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 09:55:54 -0800
X-CSE-ConnectionGUID: nuujVbbnQVm0PIR4zGyA4g==
X-CSE-MsgGUID: el51m1YZTOyaPgYne4keVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="114030435"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Feb 2025 09:55:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tizuo-0019zX-2n;
	Fri, 14 Feb 2025 17:55:50 +0000
Date: Sat, 15 Feb 2025 01:55:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] mm/page_alloc.c:8680: warning:
 Function parameter or member 'info' not described in 'alloc_contig_range'
Message-ID: <202502150102.iFbKSu8E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   6b7c856caf89f4b82af7af2bb7d09b8c1112730b
commit: 675e5045983a35caf3578ff5fe8ee17e3b0ede4a [1/1] ANDROID: mm: add cma allocation statistics
config: arm-randconfig-002-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150102.iFbKSu8E-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150102.iFbKSu8E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150102.iFbKSu8E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:8680: warning: Function parameter or member 'info' not described in 'alloc_contig_range'


vim +8680 mm/page_alloc.c

041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8655  
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8656  /**
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8657   * alloc_contig_range() -- tries to allocate given range of pages
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8658   * @start:	start PFN to allocate
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8659   * @end:	one-past-the-last PFN to allocate
0815f3d81d76df Michal Nazarewicz       2012-04-03  8660   * @migratetype:	migratetype of the underlaying pageblocks (either
0815f3d81d76df Michal Nazarewicz       2012-04-03  8661   *			#MIGRATE_MOVABLE or #MIGRATE_CMA).  All pageblocks
0815f3d81d76df Michal Nazarewicz       2012-04-03  8662   *			in range must have the same migratetype and it must
0815f3d81d76df Michal Nazarewicz       2012-04-03  8663   *			be either of the two.
ca96b625341027 Lucas Stach             2017-02-24  8664   * @gfp_mask:	GFP mask to use during compaction
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8665   *
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8666   * The PFN range does not have to be pageblock or MAX_ORDER_NR_PAGES
2c7452a075d4db Mike Kravetz            2018-04-05  8667   * aligned.  The PFN range must belong to a single zone.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8668   *
2c7452a075d4db Mike Kravetz            2018-04-05  8669   * The first thing this routine does is attempt to MIGRATE_ISOLATE all
2c7452a075d4db Mike Kravetz            2018-04-05  8670   * pageblocks in the range.  Once isolated, the pageblocks should not
2c7452a075d4db Mike Kravetz            2018-04-05  8671   * be modified by others.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8672   *
a862f68a8b3600 Mike Rapoport           2019-03-05  8673   * Return: zero on success or negative error code.  On success all
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8674   * pages which PFN is in [start, end) are allocated for the caller and
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8675   * need to be freed with free_contig_range().
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8676   */
0815f3d81d76df Michal Nazarewicz       2012-04-03  8677  int alloc_contig_range(unsigned long start, unsigned long end,
675e5045983a35 Minchan Kim             2021-06-29  8678  		       unsigned migratetype, gfp_t gfp_mask,
675e5045983a35 Minchan Kim             2021-06-29  8679  		       struct acr_info *info)
041d3a8cdc18dc Michal Nazarewicz       2011-12-29 @8680  {
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8681  	unsigned long outer_start, outer_end;
d00181b96eb86c Kirill A. Shutemov      2015-11-06  8682  	unsigned int order;
d00181b96eb86c Kirill A. Shutemov      2015-11-06  8683  	int ret = 0;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8684  
bb13ffeb9f6bfe Mel Gorman              2012-10-08  8685  	struct compact_control cc = {
bb13ffeb9f6bfe Mel Gorman              2012-10-08  8686  		.nr_migratepages = 0,
bb13ffeb9f6bfe Mel Gorman              2012-10-08  8687  		.order = -1,
bb13ffeb9f6bfe Mel Gorman              2012-10-08  8688  		.zone = page_zone(pfn_to_page(start)),
20512940b87bdc Minchan Kim             2020-12-21  8689  		.mode = gfp_mask & __GFP_NORETRY ? MIGRATE_ASYNC : MIGRATE_SYNC,
bb13ffeb9f6bfe Mel Gorman              2012-10-08  8690  		.ignore_skip_hint = true,
2583d6713267a4 Vlastimil Babka         2017-11-17  8691  		.no_set_skip_hint = true,
7dea19f9ee636c Michal Hocko            2017-05-03  8692  		.gfp_mask = current_gfp_context(gfp_mask),
b06eda091e5d65 Rik van Riel            2020-04-01  8693  		.alloc_contig = true,
bb13ffeb9f6bfe Mel Gorman              2012-10-08  8694  	};
bb13ffeb9f6bfe Mel Gorman              2012-10-08  8695  	INIT_LIST_HEAD(&cc.migratepages);
bb13ffeb9f6bfe Mel Gorman              2012-10-08  8696  
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8697  	/*
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8698  	 * What we do here is we mark all pageblocks in range as
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8699  	 * MIGRATE_ISOLATE.  Because pageblock and max order pages may
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8700  	 * have different sizes, and due to the way page allocator
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8701  	 * work, we align the range to biggest of the two pages so
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8702  	 * that page allocator won't try to merge buddies from
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8703  	 * different pageblocks and change MIGRATE_ISOLATE to some
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8704  	 * other migration type.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8705  	 *
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8706  	 * Once the pageblocks are marked as MIGRATE_ISOLATE, we
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8707  	 * migrate the pages from an unaligned range (ie. pages that
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8708  	 * we are interested in).  This will put all the pages in
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8709  	 * range back to page allocator as MIGRATE_ISOLATE.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8710  	 *
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8711  	 * When this is done, we take the pages in range from page
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8712  	 * allocator removing them from the buddy system.  This way
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8713  	 * page allocator will never consider using them.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8714  	 *
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8715  	 * This lets us mark the pageblocks back as
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8716  	 * MIGRATE_CMA/MIGRATE_MOVABLE so that free pages in the
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8717  	 * aligned range but not in the unaligned, original range are
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8718  	 * put back to page allocator so that buddy can use them.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8719  	 */
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8720  
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8721  	ret = start_isolate_page_range(pfn_max_align_down(start),
d381c54760dcfa Michal Hocko            2018-12-28  8722  				       pfn_max_align_up(end), migratetype, 0);
675e5045983a35 Minchan Kim             2021-06-29  8723  	if (ret) {
675e5045983a35 Minchan Kim             2021-06-29  8724  		info->err |= ACR_ERR_ISOLATE;
86a595f961360c Bob Liu                 2012-10-25  8725  		return ret;
675e5045983a35 Minchan Kim             2021-06-29  8726  	}
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8727  
b1e4543c270135 Vlastimil Babka         2020-12-14  8728  	drain_all_pages(cc.zone);
b1e4543c270135 Vlastimil Babka         2020-12-14  8729  
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8730  	/*
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8731  	 * In case of -EBUSY, we'd like to know which page causes problem.
63cd448908b5eb Mike Kravetz            2017-11-29  8732  	 * So, just fall through. test_pages_isolated() has a tracepoint
63cd448908b5eb Mike Kravetz            2017-11-29  8733  	 * which will report the busy page.
63cd448908b5eb Mike Kravetz            2017-11-29  8734  	 *
63cd448908b5eb Mike Kravetz            2017-11-29  8735  	 * It is possible that busy pages could become available before
63cd448908b5eb Mike Kravetz            2017-11-29  8736  	 * the call to test_pages_isolated, and the range will actually be
63cd448908b5eb Mike Kravetz            2017-11-29  8737  	 * allocated.  So, if we fall through be sure to clear ret so that
63cd448908b5eb Mike Kravetz            2017-11-29  8738  	 * -EBUSY is not accidentally used or returned to caller.
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8739  	 */
675e5045983a35 Minchan Kim             2021-06-29  8740  	ret = __alloc_contig_migrate_range(&cc, start, end, info);
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8741  	if (ret && ret != -EBUSY)
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8742  		goto done;
63cd448908b5eb Mike Kravetz            2017-11-29  8743  	ret =0;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8744  
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8745  	/*
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8746  	 * Pages from [start, end) are within a MAX_ORDER_NR_PAGES
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8747  	 * aligned blocks that are marked as MIGRATE_ISOLATE.  What's
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8748  	 * more, all pages in [start, end) are free in page allocator.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8749  	 * What we are going to do is to allocate all pages from
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8750  	 * [start, end) (that is remove them from page allocator).
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8751  	 *
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8752  	 * The only problem is that pages at the beginning and at the
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8753  	 * end of interesting range may be not aligned with pages that
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8754  	 * page allocator holds, ie. they can be part of higher order
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8755  	 * pages.  Because of this, we reserve the bigger range and
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8756  	 * once this is done free the pages we are not interested in.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8757  	 *
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8758  	 * We don't have to hold zone->lock here because the pages are
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8759  	 * isolated thus they won't get removed from buddy.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8760  	 */
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8761  
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8762  	order = 0;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8763  	outer_start = start;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8764  	while (!PageBuddy(pfn_to_page(outer_start))) {
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8765  		if (++order >= MAX_ORDER) {
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8766  			outer_start = start;
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8767  			break;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8768  		}
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8769  		outer_start &= ~0UL << order;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8770  	}
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8771  
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8772  	if (outer_start != start) {
ab130f9108dcf2 Matthew Wilcox (Oracle  2020-10-15  8773) 		order = buddy_order(pfn_to_page(outer_start));
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8774  
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8775  		/*
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8776  		 * outer_start page could be small order buddy page and
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8777  		 * it doesn't include start page. Adjust outer_start
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8778  		 * in this case to report failed page properly
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8779  		 * on tracepoint in test_pages_isolated()
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8780  		 */
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8781  		if (outer_start + (1UL << order) <= start)
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8782  			outer_start = start;
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8783  	}
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  8784  
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8785  	/* Make sure the range is really isolated. */
756d25be457fc5 David Hildenbrand       2019-11-30  8786  	if (test_pages_isolated(outer_start, end, 0)) {
75dddef32514f7 Jonathan Toppins        2017-08-10  8787  		pr_info_ratelimited("%s: [%lx, %lx) PFNs busy\n",
dae803e165a11b Michal Nazarewicz       2014-11-13  8788  			__func__, outer_start, end);
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8789  		ret = -EBUSY;
675e5045983a35 Minchan Kim             2021-06-29  8790  		info->err |= ACR_ERR_TEST;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8791  		goto done;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8792  	}
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8793  
49f223a9cd96c7 Marek Szyprowski        2012-01-25  8794  	/* Grab isolated pages from freelists. */
bb13ffeb9f6bfe Mel Gorman              2012-10-08  8795  	outer_end = isolate_freepages_range(&cc, outer_start, end);
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8796  	if (!outer_end) {
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8797  		ret = -EBUSY;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8798  		goto done;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8799  	}
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8800  
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8801  	/* Free head and tail (if any) */
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8802  	if (start != outer_start)
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8803  		free_contig_range(outer_start, start - outer_start);
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8804  	if (end != outer_end)
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8805  		free_contig_range(end, outer_end - end);
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8806  
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8807  done:
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8808  	undo_isolate_page_range(pfn_max_align_down(start),
0815f3d81d76df Michal Nazarewicz       2012-04-03  8809  				pfn_max_align_up(end), migratetype);
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8810  	return ret;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  8811  }
255f5985070839 David Hildenbrand       2020-05-07  8812  EXPORT_SYMBOL(alloc_contig_range);
5e27a2df03b893 Anshuman Khandual       2019-11-30  8813  

:::::: The code at line 8680 was first introduced by commit
:::::: 041d3a8cdc18dc375a128d90bbb753949a81b1fb mm: page_alloc: introduce alloc_contig_range()

:::::: TO: Michal Nazarewicz <mina86@mina86.com>
:::::: CC: Marek Szyprowski <m.szyprowski@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
