Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66CB41C62
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762009826; cv=none; b=mTeE4olL+icclxmfx6luG95MYMOFaWL31QojDqa5guPQEKF7Uw+MiFw3dz4xxNerhH1Ph2U/AOc4CQgUPHM/w7DFNZ412om4bCRgJI71Ap54NXFkWHA85GDoEp3vIGrEzQUY9h1+Ap57/2gqfFHUpfZKZt1xL1XqmGFJLQ4M5HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762009826; c=relaxed/simple;
	bh=FsQAnuEDWZIFfL2WtRTQwvO8kFoJa72mT7ZZamNN7Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FcOziuy5XqhFmqlffmoqw83Uo2V9OZCayUS6Bwi8gx66cHAnrgBVkXh1pEnxZw/HdGNT87CHLy/rKthGTfTJCg00G1GWnRr12mgX0n3/CFLEURd40KrwgSsjgLV0QpS7+uce/PzpJbD6bZOfM0Vbqkh1UDVKz/JYGNun3top+NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=De8vFVRt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="De8vFVRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762009825; x=1793545825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FsQAnuEDWZIFfL2WtRTQwvO8kFoJa72mT7ZZamNN7Xo=;
  b=De8vFVRtLgO0j03uQitfdR0R2FUOqI1Ys4aD5Mgt7Vw86KI6Aun6bPFF
   U5+HFYZU0XjrIZlUZW3Eo60I7Qf3g3JvJXZC2mNdsRgPUbAUwGZBFgcvU
   XQ/9g/oumMvAM41P1Hhy9p1LhQYDs7+FUSIJ2YnTXYdlEhNEZ/ww234VL
   2hGzwi9gZ95MPlI4N4P6az38h5Ri7Klqo78mTrqk3N2JVuTLz7aRjtH2F
   CUnkTBBk0emULYc7FBp0YF9rcSceMoq46oYzxzxM2r6CkYcT0+slYz1mT
   ttajxinrL+rIvJbDb1zCz7+G7QWRiAf67PFAz8NBjGTf+9whj6gnQUmAX
   w==;
X-CSE-ConnectionGUID: DAAj6Lg+RuSEQUSsAvCq5Q==
X-CSE-MsgGUID: oWeBdPz8S+e0gQz7IIcueQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="64298825"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="64298825"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 08:10:24 -0700
X-CSE-ConnectionGUID: Tr5h0VHiQUKHTw7V9FyZMA==
X-CSE-MsgGUID: +670qn8QTianXeHJAst26A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186140769"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Nov 2025 08:10:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFDEy-000ONM-0l;
	Sat, 01 Nov 2025 15:10:12 +0000
Date: Sat, 1 Nov 2025 23:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: [linux-next:master 2080/5383] mm/page_alloc.c:6985:23: error:
 implicit declaration of function 'find_large_buddy'; did you mean
 'split_large_buddy'?
Message-ID: <202511012349.OBGxzv72-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
commit: fce217449075d59b29052b8cdac567f0f3e22641 [2080/5383] ASoC: spacemit: add i2s support for K1 SoC
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20251101/202511012349.OBGxzv72-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511012349.OBGxzv72-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511012349.OBGxzv72-lkp@intel.com/

Note: the linux-next/master HEAD 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   mm/page_alloc.c: In function 'alloc_contig_range_noprof':
>> mm/page_alloc.c:6985:23: error: implicit declaration of function 'find_large_buddy'; did you mean 'split_large_buddy'? [-Wimplicit-function-declaration]
    6985 |         outer_start = find_large_buddy(start);
         |                       ^~~~~~~~~~~~~~~~
         |                       split_large_buddy

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CMA
   Depends on [n]: MMU [=n]
   Selected by [y]:
   - SND_SOC_K1_I2S [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (COMPILE_TEST [=y] || ARCH_SPACEMIT) && HAVE_CLK [=y]
   WARNING: unmet direct dependencies detected for DMA_CMA
   Depends on [n]: HAVE_DMA_CONTIGUOUS [=n] && CMA [=y]
   Selected by [y]:
   - SND_SOC_K1_I2S [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (COMPILE_TEST [=y] || ARCH_SPACEMIT) && HAVE_CLK [=y]


vim +6985 mm/page_alloc.c

f6037a4a686523 David Hildenbrand       2024-12-03  6863  
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6864  /**
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6865   * alloc_contig_range() -- tries to allocate given range of pages
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6866   * @start:	start PFN to allocate
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6867   * @end:	one-past-the-last PFN to allocate
d1554fb6302093 Zi Yan                  2025-06-16  6868   * @alloc_flags:	allocation information
f6037a4a686523 David Hildenbrand       2024-12-03  6869   * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some
f6037a4a686523 David Hildenbrand       2024-12-03  6870   *		action and reclaim modifiers are supported. Reclaim modifiers
f6037a4a686523 David Hildenbrand       2024-12-03  6871   *		control allocation behavior during compaction/migration/reclaim.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6872   *
11ac3e87ce09c2 Zi Yan                  2022-05-12  6873   * The PFN range does not have to be pageblock aligned. The PFN range must
11ac3e87ce09c2 Zi Yan                  2022-05-12  6874   * belong to a single zone.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6875   *
2c7452a075d4db Mike Kravetz            2018-04-05  6876   * The first thing this routine does is attempt to MIGRATE_ISOLATE all
2c7452a075d4db Mike Kravetz            2018-04-05  6877   * pageblocks in the range.  Once isolated, the pageblocks should not
2c7452a075d4db Mike Kravetz            2018-04-05  6878   * be modified by others.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6879   *
a862f68a8b3600 Mike Rapoport           2019-03-05  6880   * Return: zero on success or negative error code.  On success all
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6881   * pages which PFN is in [start, end) are allocated for the caller and
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6882   * need to be freed with free_contig_range().
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6883   */
b951aaff503502 Suren Baghdasaryan      2024-03-21  6884  int alloc_contig_range_noprof(unsigned long start, unsigned long end,
d1554fb6302093 Zi Yan                  2025-06-16  6885  			      acr_flags_t alloc_flags, gfp_t gfp_mask)
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6886  {
0bf2edf041dcb0 David Hildenbrand       2025-09-01  6887  	const unsigned int order = ilog2(end - start);
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6888  	unsigned long outer_start, outer_end;
d00181b96eb86c Kirill A. Shutemov      2015-11-06  6889  	int ret = 0;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6890  
bb13ffeb9f6bfe Mel Gorman              2012-10-08  6891  	struct compact_control cc = {
bb13ffeb9f6bfe Mel Gorman              2012-10-08  6892  		.nr_migratepages = 0,
bb13ffeb9f6bfe Mel Gorman              2012-10-08  6893  		.order = -1,
bb13ffeb9f6bfe Mel Gorman              2012-10-08  6894  		.zone = page_zone(pfn_to_page(start)),
e0b9daeb453e60 David Rientjes          2014-06-04  6895  		.mode = MIGRATE_SYNC,
bb13ffeb9f6bfe Mel Gorman              2012-10-08  6896  		.ignore_skip_hint = true,
2583d6713267a4 Vlastimil Babka         2017-11-17  6897  		.no_set_skip_hint = true,
b06eda091e5d65 Rik van Riel            2020-04-01  6898  		.alloc_contig = true,
bb13ffeb9f6bfe Mel Gorman              2012-10-08  6899  	};
bb13ffeb9f6bfe Mel Gorman              2012-10-08  6900  	INIT_LIST_HEAD(&cc.migratepages);
d1554fb6302093 Zi Yan                  2025-06-16  6901  	enum pb_isolate_mode mode = (alloc_flags & ACR_FLAGS_CMA) ?
d1554fb6302093 Zi Yan                  2025-06-16  6902  					    PB_ISOLATE_MODE_CMA_ALLOC :
d1554fb6302093 Zi Yan                  2025-06-16  6903  					    PB_ISOLATE_MODE_OTHER;
bb13ffeb9f6bfe Mel Gorman              2012-10-08  6904  
0bf2edf041dcb0 David Hildenbrand       2025-09-01  6905  	/*
0bf2edf041dcb0 David Hildenbrand       2025-09-01  6906  	 * In contrast to the buddy, we allow for orders here that exceed
0bf2edf041dcb0 David Hildenbrand       2025-09-01  6907  	 * MAX_PAGE_ORDER, so we must manually make sure that we are not
0bf2edf041dcb0 David Hildenbrand       2025-09-01  6908  	 * exceeding the maximum folio order.
0bf2edf041dcb0 David Hildenbrand       2025-09-01  6909  	 */
0bf2edf041dcb0 David Hildenbrand       2025-09-01  6910  	if (WARN_ON_ONCE((gfp_mask & __GFP_COMP) && order > MAX_FOLIO_ORDER))
0bf2edf041dcb0 David Hildenbrand       2025-09-01  6911  		return -EINVAL;
0bf2edf041dcb0 David Hildenbrand       2025-09-01  6912  
f6037a4a686523 David Hildenbrand       2024-12-03  6913  	gfp_mask = current_gfp_context(gfp_mask);
f6037a4a686523 David Hildenbrand       2024-12-03  6914  	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
f6037a4a686523 David Hildenbrand       2024-12-03  6915  		return -EINVAL;
f6037a4a686523 David Hildenbrand       2024-12-03  6916  
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6917  	/*
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6918  	 * What we do here is we mark all pageblocks in range as
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6919  	 * MIGRATE_ISOLATE.  Because pageblock and max order pages may
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6920  	 * have different sizes, and due to the way page allocator
b2c9e2fbba3253 Zi Yan                  2022-05-12  6921  	 * work, start_isolate_page_range() has special handlings for this.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6922  	 *
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6923  	 * Once the pageblocks are marked as MIGRATE_ISOLATE, we
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6924  	 * migrate the pages from an unaligned range (ie. pages that
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6925  	 * we are interested in). This will put all the pages in
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6926  	 * range back to page allocator as MIGRATE_ISOLATE.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6927  	 *
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6928  	 * When this is done, we take the pages in range from page
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6929  	 * allocator removing them from the buddy system.  This way
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6930  	 * page allocator will never consider using them.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6931  	 *
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6932  	 * This lets us mark the pageblocks back as
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6933  	 * MIGRATE_CMA/MIGRATE_MOVABLE so that free pages in the
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6934  	 * aligned range but not in the unaligned, original range are
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6935  	 * put back to page allocator so that buddy can use them.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6936  	 */
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6937  
d1554fb6302093 Zi Yan                  2025-06-16  6938  	ret = start_isolate_page_range(start, end, mode);
3fa0c7c79d2499 David Hildenbrand       2020-10-15  6939  	if (ret)
b2c9e2fbba3253 Zi Yan                  2022-05-12  6940  		goto done;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6941  
7612921f2376d5 Vlastimil Babka         2020-12-14  6942  	drain_all_pages(cc.zone);
7612921f2376d5 Vlastimil Babka         2020-12-14  6943  
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  6944  	/*
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  6945  	 * In case of -EBUSY, we'd like to know which page causes problem.
63cd448908b5eb Mike Kravetz            2017-11-29  6946  	 * So, just fall through. test_pages_isolated() has a tracepoint
63cd448908b5eb Mike Kravetz            2017-11-29  6947  	 * which will report the busy page.
63cd448908b5eb Mike Kravetz            2017-11-29  6948  	 *
63cd448908b5eb Mike Kravetz            2017-11-29  6949  	 * It is possible that busy pages could become available before
63cd448908b5eb Mike Kravetz            2017-11-29  6950  	 * the call to test_pages_isolated, and the range will actually be
63cd448908b5eb Mike Kravetz            2017-11-29  6951  	 * allocated.  So, if we fall through be sure to clear ret so that
63cd448908b5eb Mike Kravetz            2017-11-29  6952  	 * -EBUSY is not accidentally used or returned to caller.
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  6953  	 */
48e6561b667e7f Zi Yan                  2025-07-22  6954  	ret = __alloc_contig_migrate_range(&cc, start, end);
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  6955  	if (ret && ret != -EBUSY)
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6956  		goto done;
04f13d241b8b14 yangge                  2025-01-11  6957  
04f13d241b8b14 yangge                  2025-01-11  6958  	/*
04f13d241b8b14 yangge                  2025-01-11  6959  	 * When in-use hugetlb pages are migrated, they may simply be released
04f13d241b8b14 yangge                  2025-01-11  6960  	 * back into the free hugepage pool instead of being returned to the
04f13d241b8b14 yangge                  2025-01-11  6961  	 * buddy system.  After the migration of in-use huge pages is completed,
04f13d241b8b14 yangge                  2025-01-11  6962  	 * we will invoke replace_free_hugepage_folios() to ensure that these
04f13d241b8b14 yangge                  2025-01-11  6963  	 * hugepages are properly released to the buddy system.
04f13d241b8b14 yangge                  2025-01-11  6964  	 */
04f13d241b8b14 yangge                  2025-01-11  6965  	ret = replace_free_hugepage_folios(start, end);
04f13d241b8b14 yangge                  2025-01-11  6966  	if (ret)
04f13d241b8b14 yangge                  2025-01-11  6967  		goto done;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6968  
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6969  	/*
b2c9e2fbba3253 Zi Yan                  2022-05-12  6970  	 * Pages from [start, end) are within a pageblock_nr_pages
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6971  	 * aligned blocks that are marked as MIGRATE_ISOLATE.  What's
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6972  	 * more, all pages in [start, end) are free in page allocator.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6973  	 * What we are going to do is to allocate all pages from
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6974  	 * [start, end) (that is remove them from page allocator).
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6975  	 *
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6976  	 * The only problem is that pages at the beginning and at the
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6977  	 * end of interesting range may be not aligned with pages that
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6978  	 * page allocator holds, ie. they can be part of higher order
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6979  	 * pages.  Because of this, we reserve the bigger range and
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6980  	 * once this is done free the pages we are not interested in.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6981  	 *
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6982  	 * We don't have to hold zone->lock here because the pages are
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6983  	 * isolated thus they won't get removed from buddy.
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6984  	 */
fd919a85cd55be Johannes Weiner         2024-03-20 @6985  	outer_start = find_large_buddy(start);
8ef5849fa8a2c7 Joonsoo Kim             2016-01-14  6986  
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6987  	/* Make sure the range is really isolated. */
d1554fb6302093 Zi Yan                  2025-06-16  6988  	if (test_pages_isolated(outer_start, end, mode)) {
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6989  		ret = -EBUSY;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6990  		goto done;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6991  	}
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6992  
49f223a9cd96c7 Marek Szyprowski        2012-01-25  6993  	/* Grab isolated pages from freelists. */
bb13ffeb9f6bfe Mel Gorman              2012-10-08  6994  	outer_end = isolate_freepages_range(&cc, outer_start, end);
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6995  	if (!outer_end) {
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6996  		ret = -EBUSY;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6997  		goto done;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6998  	}
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  6999  
e98337d11bbdfa Yu Zhao                 2024-08-13  7000  	if (!(gfp_mask & __GFP_COMP)) {
7b755570064fcb David Hildenbrand       2024-12-03  7001  		split_free_pages(cc.freepages, gfp_mask);
e98337d11bbdfa Yu Zhao                 2024-08-13  7002  
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  7003  		/* Free head and tail (if any) */
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  7004  		if (start != outer_start)
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  7005  			free_contig_range(outer_start, start - outer_start);
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  7006  		if (end != outer_end)
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  7007  			free_contig_range(end, outer_end - end);
e98337d11bbdfa Yu Zhao                 2024-08-13  7008  	} else if (start == outer_start && end == outer_end && is_power_of_2(end - start)) {
e98337d11bbdfa Yu Zhao                 2024-08-13  7009  		struct page *head = pfn_to_page(start);
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  7010  
e98337d11bbdfa Yu Zhao                 2024-08-13  7011  		check_new_pages(head, order);
e98337d11bbdfa Yu Zhao                 2024-08-13  7012  		prep_new_page(head, order, gfp_mask, 0);
ee66e9c34fd3ae Matthew Wilcox (Oracle  2024-11-25  7013) 		set_page_refcounted(head);
e98337d11bbdfa Yu Zhao                 2024-08-13  7014  	} else {
e98337d11bbdfa Yu Zhao                 2024-08-13  7015  		ret = -EINVAL;
e98337d11bbdfa Yu Zhao                 2024-08-13  7016  		WARN(true, "PFN range: requested [%lu, %lu), allocated [%lu, %lu)\n",
e98337d11bbdfa Yu Zhao                 2024-08-13  7017  		     start, end, outer_start, outer_end);
e98337d11bbdfa Yu Zhao                 2024-08-13  7018  	}
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  7019  done:
7a3324eb66f616 Zi Yan                  2025-06-16  7020  	undo_isolate_page_range(start, end);
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  7021  	return ret;
041d3a8cdc18dc Michal Nazarewicz       2011-12-29  7022  }
b951aaff503502 Suren Baghdasaryan      2024-03-21  7023  EXPORT_SYMBOL(alloc_contig_range_noprof);
5e27a2df03b893 Anshuman Khandual       2019-11-30  7024  

:::::: The code at line 6985 was first introduced by commit
:::::: fd919a85cd55be5d00a6a7372071f44c8eafb825 mm: page_isolation: prepare for hygienic freelists

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
