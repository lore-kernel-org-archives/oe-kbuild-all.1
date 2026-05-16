Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5462B191
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778960042; cv=none; b=lpOEl+0dBGoCJNZ8pqeEt3UC5IlxANroJF5MtB2Rf7utjNlQfu6RMj2bRrkiqP1B9VZ+hQMfnMINsdPncS3a/O8+7tBYm56yDu+/Zp3DEpn1SHrZKBSwGsq95ewjFsgRLkTtJ6i43XQgdrnq0eLQzwK4Xt80vysA7y20k3hjVsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778960042; c=relaxed/simple;
	bh=ZZfnK+XMgdVIJ6HMiuHs3WIBjupEtzqRfvb2232Ys34=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W1TSmaO8nHD9AWGjvGi18m49QNtZS5iBH7sW/5tOVHmHIUmT+05dvz0QKk/B3oc3de6ZTXNcuKQUFpjx2Rq58fIrj3+ssQ9dgzvf4N5X9HLOYq26Vvo3nZ3zicQlXKePpYUyxjkg6/d2YjuXPUl19qd+bLkunPNMHc5ZPQSBWII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIv3EOmY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIv3EOmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778960037; x=1810496037;
  h=date:from:to:cc:subject:message-id;
  bh=ZZfnK+XMgdVIJ6HMiuHs3WIBjupEtzqRfvb2232Ys34=;
  b=hIv3EOmYRYFqQB/m7j144XT5VRMi2mjKuOtuR99N/QaGDklnAbpIFBmN
   YN/q/92A7wlqmbPIBCzN6o6xYbJNenw1KSt2CMsfUc629lEPulwocSEIa
   BtbBJgoo3SOfCPxYoP33Y/5VrIoQ1lhFY8mGhlsOcl1pCmOUiBlJQZTN+
   fwIxcYeDuyD0uHMfNKDBlnfryz/+9aNrq/rrZcICr9fCOhp0ERamUzFXL
   v2EltutZgQFvgN7MwMJ+vAi+Io2uhYx7TAIOFr6POmSWwoQI4dG6D+pag
   tYVk0UjCfTRLDnBCdTCvYPHcCSpAO5lEmfgMOoxrVUggZq/K5bD+KDnZA
   A==;
X-CSE-ConnectionGUID: pNWYWV2aRzaKn7TVeR4etA==
X-CSE-MsgGUID: Yq2Zkvp3Q6Gv7+fOk/FRig==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="102549804"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="102549804"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 12:33:57 -0700
X-CSE-ConnectionGUID: 3X/mA6lhTfaatEi6XQ9jVg==
X-CSE-MsgGUID: 5uOizl8SSr6fB46yZC9kug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="243991272"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 May 2026 12:33:55 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOKlk-00000000154-2kt6;
	Sat, 16 May 2026 19:33:52 +0000
Date: Sun, 17 May 2026 03:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] mm/compaction.c:882:
 warning: Function parameter or struct member 'cc_ext' not described in
 'isolate_migratepages_block'
Message-ID: <202605170340.cojPIyGq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   be343ff665e27b4c09246301de4eb7372153f9fc
commit: be343ff665e27b4c09246301de4eb7372153f9fc [2/2] ANDROID: GKI: fixup ABI breakage from changing struct compact_control
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260517/202605170340.cojPIyGq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605170340.cojPIyGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605170340.cojPIyGq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/compaction.c:882: warning: Function parameter or struct member 'cc_ext' not described in 'isolate_migratepages_block'
   mm/compaction.c:882: warning: Excess function parameter 'cc' description in 'isolate_migratepages_block'


vim +882 mm/compaction.c

ee6f62fd34f0bb99 Zi Yan                  2024-02-20   861  
2fe86e0004076128 Michal Nazarewicz       2012-01-30   862  /**
edc2ca6124967929 Vlastimil Babka         2014-10-09   863   * isolate_migratepages_block() - isolate all migrate-able pages within
edc2ca6124967929 Vlastimil Babka         2014-10-09   864   *				  a single pageblock
2fe86e0004076128 Michal Nazarewicz       2012-01-30   865   * @cc:		Compaction control structure.
edc2ca6124967929 Vlastimil Babka         2014-10-09   866   * @low_pfn:	The first PFN to isolate
edc2ca6124967929 Vlastimil Babka         2014-10-09   867   * @end_pfn:	The one-past-the-last PFN to isolate, within same pageblock
89f6c88a6ab4a11d Hugh Dickins            2022-03-22   868   * @mode:	Isolation mode to be used.
2fe86e0004076128 Michal Nazarewicz       2012-01-30   869   *
2fe86e0004076128 Michal Nazarewicz       2012-01-30   870   * Isolate all pages that can be migrated from the range specified by
edc2ca6124967929 Vlastimil Babka         2014-10-09   871   * [low_pfn, end_pfn). The range is expected to be within same pageblock.
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04   872   * Returns errno, like -EAGAIN or -EINTR in case e.g signal pending or congestion,
369fa227c21949b2 Oscar Salvador          2021-05-04   873   * -ENOMEM in case we could not allocate a page, or 0.
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04   874   * cc->migrate_pfn will contain the next pfn to scan.
2fe86e0004076128 Michal Nazarewicz       2012-01-30   875   *
edc2ca6124967929 Vlastimil Babka         2014-10-09   876   * The pages are isolated on cc->migratepages list (not required to be empty),
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04   877   * and cc->nr_migratepages is updated accordingly.
748446bb6b5a9390 Mel Gorman              2010-05-24   878   */
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04   879  static int
be343ff665e27b4c Suren Baghdasaryan      2026-05-15   880  isolate_migratepages_block(struct compact_control_ext *cc_ext, unsigned long low_pfn,
89f6c88a6ab4a11d Hugh Dickins            2022-03-22   881  			unsigned long end_pfn, isolate_mode_t mode)
748446bb6b5a9390 Mel Gorman              2010-05-24  @882  {
be343ff665e27b4c Suren Baghdasaryan      2026-05-15   883  	struct compact_control *cc = cc_ext->cc;
5f438eee8f2e972e Andrey Ryabinin         2019-03-05   884  	pg_data_t *pgdat = cc->zone->zone_pgdat;
b7aba6984dc04850 Mel Gorman              2011-01-13   885  	unsigned long nr_scanned = 0, nr_isolated = 0;
fa9add641b1b1c56 Hugh Dickins            2012-05-29   886  	struct lruvec *lruvec;
b8b2d8253236331c Xiubo Li                2014-10-09   887  	unsigned long flags = 0;
6168d0da2b479ce2 Alex Shi                2020-12-15   888  	struct lruvec *locked = NULL;
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19   889  	struct folio *folio = NULL;
bb13ffeb9f6bfeb3 Mel Gorman              2012-10-08   890  	struct page *page = NULL, *valid_page = NULL;
89f6c88a6ab4a11d Hugh Dickins            2022-03-22   891  	struct address_space *mapping;
e34d85f0e3c60f72 Joonsoo Kim             2015-02-11   892  	unsigned long start_pfn = low_pfn;
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   893  	bool skip_on_failure = false;
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   894  	unsigned long next_skip_pfn = 0;
e380bebe4771548d Mel Gorman              2019-03-05   895  	bool skip_updated = false;
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04   896  	int ret = 0;
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04   897  
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04   898  	cc->migrate_pfn = low_pfn;
748446bb6b5a9390 Mel Gorman              2010-05-24   899  
748446bb6b5a9390 Mel Gorman              2010-05-24   900  	/*
748446bb6b5a9390 Mel Gorman              2010-05-24   901  	 * Ensure that there are not too many pages isolated from the LRU
748446bb6b5a9390 Mel Gorman              2010-05-24   902  	 * list by either parallel reclaimers or compaction. If there are,
748446bb6b5a9390 Mel Gorman              2010-05-24   903  	 * delay for some time until fewer pages are isolated
748446bb6b5a9390 Mel Gorman              2010-05-24   904  	 */
4fbbb3fde3c69879 Johannes Weiner         2023-05-19   905  	while (unlikely(too_many_isolated(cc))) {
d20bdd571ee5c996 Zi Yan                  2020-11-13   906  		/* stop isolation if there are still pages not migrated */
d20bdd571ee5c996 Zi Yan                  2020-11-13   907  		if (cc->nr_migratepages)
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04   908  			return -EAGAIN;
d20bdd571ee5c996 Zi Yan                  2020-11-13   909  
f9e35b3b41f47c4e Mel Gorman              2011-06-15   910  		/* async migration should just abort */
e0b9daeb453e602a David Rientjes          2014-06-04   911  		if (cc->mode == MIGRATE_ASYNC)
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04   912  			return -EAGAIN;
f9e35b3b41f47c4e Mel Gorman              2011-06-15   913  
c3f4a9a2b082c539 Mel Gorman              2021-11-05   914  		reclaim_throttle(pgdat, VMSCAN_THROTTLE_ISOLATED);
748446bb6b5a9390 Mel Gorman              2010-05-24   915  
748446bb6b5a9390 Mel Gorman              2010-05-24   916  		if (fatal_signal_pending(current))
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04   917  			return -EINTR;
748446bb6b5a9390 Mel Gorman              2010-05-24   918  	}
748446bb6b5a9390 Mel Gorman              2010-05-24   919  
cf66f0700c8f1d7c Mel Gorman              2019-03-05   920  	cond_resched();
aeef4b83806f49a0 David Rientjes          2014-06-04   921  
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   922  	if (cc->direct_compaction && (cc->mode == MIGRATE_ASYNC)) {
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   923  		skip_on_failure = true;
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   924  		next_skip_pfn = block_end_pfn(low_pfn, cc->order);
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   925  	}
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   926  
748446bb6b5a9390 Mel Gorman              2010-05-24   927  	/* Time to isolate some pages for migration */
748446bb6b5a9390 Mel Gorman              2010-05-24   928  	for (; low_pfn < end_pfn; low_pfn++) {
0003e2a414687fff Sean Christopherson     2023-10-27   929  		bool is_dirty, is_unevictable;
29c0dde830f8c08c Vlastimil Babka         2015-09-08   930  
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   931  		if (skip_on_failure && low_pfn >= next_skip_pfn) {
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   932  			/*
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   933  			 * We have isolated all migration candidates in the
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   934  			 * previous order-aligned block, and did not skip it due
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   935  			 * to failure. We should migrate the pages now and
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   936  			 * hopefully succeed compaction.
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   937  			 */
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   938  			if (nr_isolated)
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   939  				break;
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   940  
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   941  			/*
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   942  			 * We failed to isolate in the previous order-aligned
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   943  			 * block. Set the new boundary to the end of the
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   944  			 * current block. Note we can't simply increase
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   945  			 * next_skip_pfn by 1 << order, as low_pfn might have
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   946  			 * been incremented by a higher number due to skipping
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   947  			 * a compound or a high-order buddy page in the
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   948  			 * previous loop iteration.
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   949  			 */
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   950  			next_skip_pfn = block_end_pfn(low_pfn, cc->order);
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   951  		}
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19   952  
8b44d2791f912566 Vlastimil Babka         2014-10-09   953  		/*
8b44d2791f912566 Vlastimil Babka         2014-10-09   954  		 * Periodically drop the lock (if held) regardless of its
670105a25608affe Mel Gorman              2019-08-02   955  		 * contention, to give chance to IRQs. Abort completely if
670105a25608affe Mel Gorman              2019-08-02   956  		 * a fatal signal is pending.
8b44d2791f912566 Vlastimil Babka         2014-10-09   957  		 */
c036ddffe4acb0a3 Miaohe Lin              2022-04-28   958  		if (!(low_pfn % COMPACT_CLUSTER_MAX)) {
6168d0da2b479ce2 Alex Shi                2020-12-15   959  			if (locked) {
6168d0da2b479ce2 Alex Shi                2020-12-15   960  				unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479ce2 Alex Shi                2020-12-15   961  				locked = NULL;
6168d0da2b479ce2 Alex Shi                2020-12-15   962  			}
6168d0da2b479ce2 Alex Shi                2020-12-15   963  
6168d0da2b479ce2 Alex Shi                2020-12-15   964  			if (fatal_signal_pending(current)) {
6168d0da2b479ce2 Alex Shi                2020-12-15   965  				cc->contended = true;
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04   966  				ret = -EINTR;
6168d0da2b479ce2 Alex Shi                2020-12-15   967  
670105a25608affe Mel Gorman              2019-08-02   968  				goto fatal_pending;
670105a25608affe Mel Gorman              2019-08-02   969  			}
b2eef8c0d09101bb Andrea Arcangeli        2011-03-22   970  
6168d0da2b479ce2 Alex Shi                2020-12-15   971  			cond_resched();
6168d0da2b479ce2 Alex Shi                2020-12-15   972  		}
6168d0da2b479ce2 Alex Shi                2020-12-15   973  
b7aba6984dc04850 Mel Gorman              2011-01-13   974  		nr_scanned++;
748446bb6b5a9390 Mel Gorman              2010-05-24   975  
748446bb6b5a9390 Mel Gorman              2010-05-24   976  		page = pfn_to_page(low_pfn);
dc9086004b3d5db7 Mel Gorman              2012-02-08   977  
e380bebe4771548d Mel Gorman              2019-03-05   978  		/*
e380bebe4771548d Mel Gorman              2019-03-05   979  		 * Check if the pageblock has already been marked skipped.
493614da0d4e8d8b Johannes Weiner         2023-07-31   980  		 * Only the first PFN is checked as the caller isolates
e380bebe4771548d Mel Gorman              2019-03-05   981  		 * COMPACT_CLUSTER_MAX at a time so the second call must
e380bebe4771548d Mel Gorman              2019-03-05   982  		 * not falsely conclude that the block should be skipped.
e380bebe4771548d Mel Gorman              2019-03-05   983  		 */
493614da0d4e8d8b Johannes Weiner         2023-07-31   984  		if (!valid_page && (pageblock_aligned(low_pfn) ||
493614da0d4e8d8b Johannes Weiner         2023-07-31   985  				    low_pfn == cc->zone->zone_start_pfn)) {
4af12d04e71c2d0d Miaohe Lin              2022-04-28   986  			if (!isolation_suitable(cc, page)) {
e380bebe4771548d Mel Gorman              2019-03-05   987  				low_pfn = end_pfn;
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19   988  				folio = NULL;
e380bebe4771548d Mel Gorman              2019-03-05   989  				goto isolate_abort;
e380bebe4771548d Mel Gorman              2019-03-05   990  			}
bb13ffeb9f6bfeb3 Mel Gorman              2012-10-08   991  			valid_page = page;
e380bebe4771548d Mel Gorman              2019-03-05   992  		}
bb13ffeb9f6bfeb3 Mel Gorman              2012-10-08   993  
ee6f62fd34f0bb99 Zi Yan                  2024-02-20   994  		if (PageHuge(page)) {
4f34d6f979bce5df Vishal Moola (Oracle    2025-03-31   995) 			const unsigned int order = compound_order(page);
ee6f62fd34f0bb99 Zi Yan                  2024-02-20   996  			/*
ee6f62fd34f0bb99 Zi Yan                  2024-02-20   997  			 * skip hugetlbfs if we are not compacting for pages
ee6f62fd34f0bb99 Zi Yan                  2024-02-20   998  			 * bigger than its order. THPs and other compound pages
ee6f62fd34f0bb99 Zi Yan                  2024-02-20   999  			 * are handled below.
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1000  			 */
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1001  			if (!cc->alloc_contig) {
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1002  
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1003  				if (order <= MAX_PAGE_ORDER) {
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1004  					low_pfn += (1UL << order) - 1;
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1005  					nr_scanned += (1UL << order) - 1;
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1006  				}
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1007  				goto isolate_fail;
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1008  			}
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1009  			/* for alloc_contig case */
1c06b6a599b5b7be Baolin Wang             2023-03-16  1010  			if (locked) {
1c06b6a599b5b7be Baolin Wang             2023-03-16  1011  				unlock_page_lruvec_irqrestore(locked, flags);
1c06b6a599b5b7be Baolin Wang             2023-03-16  1012  				locked = NULL;
1c06b6a599b5b7be Baolin Wang             2023-03-16  1013  			}
1c06b6a599b5b7be Baolin Wang             2023-03-16  1014  
ae37c7ff79f1f030 Oscar Salvador          2021-05-04  1015  			ret = isolate_or_dissolve_huge_page(page, &cc->migratepages);
369fa227c21949b2 Oscar Salvador          2021-05-04  1016  
369fa227c21949b2 Oscar Salvador          2021-05-04  1017  			/*
369fa227c21949b2 Oscar Salvador          2021-05-04  1018  			 * Fail isolation in case isolate_or_dissolve_huge_page()
369fa227c21949b2 Oscar Salvador          2021-05-04  1019  			 * reports an error. In case of -ENOMEM, abort right away.
369fa227c21949b2 Oscar Salvador          2021-05-04  1020  			 */
369fa227c21949b2 Oscar Salvador          2021-05-04  1021  			if (ret < 0) {
369fa227c21949b2 Oscar Salvador          2021-05-04  1022  				 /* Do not report -EBUSY down the chain */
369fa227c21949b2 Oscar Salvador          2021-05-04  1023  				if (ret == -EBUSY)
369fa227c21949b2 Oscar Salvador          2021-05-04  1024  					ret = 0;
4f34d6f979bce5df Vishal Moola (Oracle    2025-03-31  1025) 				low_pfn += (1UL << order) - 1;
4f34d6f979bce5df Vishal Moola (Oracle    2025-03-31  1026) 				nr_scanned += (1UL << order) - 1;
369fa227c21949b2 Oscar Salvador          2021-05-04  1027  				goto isolate_fail;
369fa227c21949b2 Oscar Salvador          2021-05-04  1028  			}
369fa227c21949b2 Oscar Salvador          2021-05-04  1029  
ae37c7ff79f1f030 Oscar Salvador          2021-05-04  1030  			if (PageHuge(page)) {
ae37c7ff79f1f030 Oscar Salvador          2021-05-04  1031  				/*
ae37c7ff79f1f030 Oscar Salvador          2021-05-04  1032  				 * Hugepage was successfully isolated and placed
ae37c7ff79f1f030 Oscar Salvador          2021-05-04  1033  				 * on the cc->migratepages list.
ae37c7ff79f1f030 Oscar Salvador          2021-05-04  1034  				 */
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1035  				folio = page_folio(page);
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1036  				low_pfn += folio_nr_pages(folio) - 1;
ae37c7ff79f1f030 Oscar Salvador          2021-05-04  1037  				goto isolate_success_no_list;
ae37c7ff79f1f030 Oscar Salvador          2021-05-04  1038  			}
ae37c7ff79f1f030 Oscar Salvador          2021-05-04  1039  
369fa227c21949b2 Oscar Salvador          2021-05-04  1040  			/*
369fa227c21949b2 Oscar Salvador          2021-05-04  1041  			 * Ok, the hugepage was dissolved. Now these pages are
369fa227c21949b2 Oscar Salvador          2021-05-04  1042  			 * Buddy and cannot be re-allocated because they are
369fa227c21949b2 Oscar Salvador          2021-05-04  1043  			 * isolated. Fall-through as the check below handles
369fa227c21949b2 Oscar Salvador          2021-05-04  1044  			 * Buddy pages.
369fa227c21949b2 Oscar Salvador          2021-05-04  1045  			 */
369fa227c21949b2 Oscar Salvador          2021-05-04  1046  		}
369fa227c21949b2 Oscar Salvador          2021-05-04  1047  
c122b2087ab94192 Joonsoo Kim             2014-04-07  1048  		/*
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1049  		 * Skip if free. We read page order here without zone lock
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1050  		 * which is generally unsafe, but the race window is small and
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1051  		 * the worst thing that can happen is that we skip some
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1052  		 * potential isolation targets.
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1053  		 */
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1054  		if (PageBuddy(page)) {
ab130f9108dcf206 Matthew Wilcox (Oracle  2020-10-15  1055) 			unsigned long freepage_order = buddy_order_unsafe(page);
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1056  
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1057  			/*
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1058  			 * Without lock, we cannot be sure that what we got is
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1059  			 * a valid page order. Consider only values in the
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1060  			 * valid order range to prevent low_pfn overflow.
c122b2087ab94192 Joonsoo Kim             2014-04-07  1061  			 */
5e0a760b44417f7c Kirill A. Shutemov      2023-12-28  1062  			if (freepage_order > 0 && freepage_order <= MAX_PAGE_ORDER) {
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1063  				low_pfn += (1UL << freepage_order) - 1;
56d48d8dbefb1cae Baolin Wang             2023-03-16  1064  				nr_scanned += (1UL << freepage_order) - 1;
56d48d8dbefb1cae Baolin Wang             2023-03-16  1065  			}
c122b2087ab94192 Joonsoo Kim             2014-04-07  1066  			continue;
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1067  		}
9927af740b1b9b1e Mel Gorman              2011-01-13  1068  
bc835011afbea395 Andrea Arcangeli        2011-01-13  1069  		/*
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1070  		 * Regardless of being on LRU, compound pages such as THP
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1071  		 * (hugetlbfs is handled above) are not to be compacted unless
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1072  		 * we are attempting an allocation larger than the compound
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1073  		 * page size. We can potentially save a lot of iterations if we
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1074  		 * skip them at once. The check is racy, but we can consider
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1075  		 * only valid values and the only danger is skipping too much.
bc835011afbea395 Andrea Arcangeli        2011-01-13  1076  		 */
1da2f328fa643bd7 Rik van Riel            2020-04-01  1077  		if (PageCompound(page) && !cc->alloc_contig) {
21dc7e023611fbcf David Rientjes          2017-11-17  1078  			const unsigned int order = compound_order(page);
edc2ca6124967929 Vlastimil Babka         2014-10-09  1079  
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1080  			/* Skip based on page order and compaction target order. */
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1081  			if (skip_isolation_on_order(order, cc->order)) {
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1082  				if (order <= MAX_PAGE_ORDER) {
21dc7e023611fbcf David Rientjes          2017-11-17  1083  					low_pfn += (1UL << order) - 1;
56d48d8dbefb1cae Baolin Wang             2023-03-16  1084  					nr_scanned += (1UL << order) - 1;
56d48d8dbefb1cae Baolin Wang             2023-03-16  1085  				}
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1086  				goto isolate_fail;
2a1402aa044b55c2 Mel Gorman              2012-10-08  1087  			}
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1088  		}
2a1402aa044b55c2 Mel Gorman              2012-10-08  1089  
bda807d4445414e8 Minchan Kim             2016-07-26  1090  		/*
bda807d4445414e8 Minchan Kim             2016-07-26  1091  		 * Check may be lockless but that's ok as we recheck later.
bda807d4445414e8 Minchan Kim             2016-07-26  1092  		 * It's possible to migrate LRU and non-lru movable pages.
bda807d4445414e8 Minchan Kim             2016-07-26  1093  		 * Skip any other type of page
bda807d4445414e8 Minchan Kim             2016-07-26  1094  		 */
bda807d4445414e8 Minchan Kim             2016-07-26  1095  		if (!PageLRU(page)) {
bda807d4445414e8 Minchan Kim             2016-07-26  1096  			/*
bda807d4445414e8 Minchan Kim             2016-07-26  1097  			 * __PageMovable can return false positive so we need
bda807d4445414e8 Minchan Kim             2016-07-26  1098  			 * to verify it under page_lock.
bda807d4445414e8 Minchan Kim             2016-07-26  1099  			 */
bda807d4445414e8 Minchan Kim             2016-07-26  1100  			if (unlikely(__PageMovable(page)) &&
bda807d4445414e8 Minchan Kim             2016-07-26  1101  					!PageIsolated(page)) {
bda807d4445414e8 Minchan Kim             2016-07-26  1102  				if (locked) {
6168d0da2b479ce2 Alex Shi                2020-12-15  1103  					unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479ce2 Alex Shi                2020-12-15  1104  					locked = NULL;
bda807d4445414e8 Minchan Kim             2016-07-26  1105  				}
bda807d4445414e8 Minchan Kim             2016-07-26  1106  
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1107  				if (isolate_movable_page(page, mode)) {
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1108  					folio = page_folio(page);
bda807d4445414e8 Minchan Kim             2016-07-26  1109  					goto isolate_success;
bda807d4445414e8 Minchan Kim             2016-07-26  1110  				}
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1111  			}
bda807d4445414e8 Minchan Kim             2016-07-26  1112  
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1113  			goto isolate_fail;
bda807d4445414e8 Minchan Kim             2016-07-26  1114  		}
29c0dde830f8c08c Vlastimil Babka         2015-09-08  1115  
829ae0f81ce093d6 Gavin Shan              2022-11-24  1116  		/*
829ae0f81ce093d6 Gavin Shan              2022-11-24  1117  		 * Be careful not to clear PageLRU until after we're
829ae0f81ce093d6 Gavin Shan              2022-11-24  1118  		 * sure the page is not being freed elsewhere -- the
829ae0f81ce093d6 Gavin Shan              2022-11-24  1119  		 * page release code relies on it.
829ae0f81ce093d6 Gavin Shan              2022-11-24  1120  		 */
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1121  		folio = folio_get_nontail_page(page);
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1122  		if (unlikely(!folio))
829ae0f81ce093d6 Gavin Shan              2022-11-24  1123  			goto isolate_fail;
829ae0f81ce093d6 Gavin Shan              2022-11-24  1124  
119d6d59dcc0980d David Rientjes          2014-04-03  1125  		/*
119d6d59dcc0980d David Rientjes          2014-04-03  1126  		 * Migration will fail if an anonymous page is pinned in memory,
119d6d59dcc0980d David Rientjes          2014-04-03  1127  		 * so avoid taking lru_lock and isolating it unnecessarily in an
119d6d59dcc0980d David Rientjes          2014-04-03  1128  		 * admittedly racy check.
119d6d59dcc0980d David Rientjes          2014-04-03  1129  		 */
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1130  		mapping = folio_mapping(folio);
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1131  		if (!mapping && (folio_ref_count(folio) - 1) > folio_mapcount(folio))
829ae0f81ce093d6 Gavin Shan              2022-11-24  1132  			goto isolate_fail_put;
119d6d59dcc0980d David Rientjes          2014-04-03  1133  
73e64c51afc56d48 Michal Hocko            2016-12-14  1134  		/*
73e64c51afc56d48 Michal Hocko            2016-12-14  1135  		 * Only allow to migrate anonymous pages in GFP_NOFS context
73e64c51afc56d48 Michal Hocko            2016-12-14  1136  		 * because those do not depend on fs locks.
73e64c51afc56d48 Michal Hocko            2016-12-14  1137  		 */
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1138  		if (!(cc->gfp_mask & __GFP_FS) && mapping)
829ae0f81ce093d6 Gavin Shan              2022-11-24  1139  			goto isolate_fail_put;
9df41314390b81a5 Alex Shi                2020-12-15  1140  
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1141  		/* Only take pages on LRU: a check now makes later tests safe */
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1142  		if (!folio_test_lru(folio))
9df41314390b81a5 Alex Shi                2020-12-15  1143  			goto isolate_fail_put;
9df41314390b81a5 Alex Shi                2020-12-15  1144  
0003e2a414687fff Sean Christopherson     2023-10-27  1145  		is_unevictable = folio_test_unevictable(folio);
0003e2a414687fff Sean Christopherson     2023-10-27  1146  
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1147  		/* Compaction might skip unevictable pages but CMA takes them */
0003e2a414687fff Sean Christopherson     2023-10-27  1148  		if (!(mode & ISOLATE_UNEVICTABLE) && is_unevictable)
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1149  			goto isolate_fail_put;
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1150  
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1151  		/*
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1152  		 * To minimise LRU disruption, the caller can indicate with
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1153  		 * ISOLATE_ASYNC_MIGRATE that it only wants to isolate pages
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1154  		 * it will be able to migrate without blocking - clean pages
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1155  		 * for the most part.  PageWriteback would require blocking.
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1156  		 */
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1157  		if ((mode & ISOLATE_ASYNC_MIGRATE) && folio_test_writeback(folio))
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1158  			goto isolate_fail_put;
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1159  
0003e2a414687fff Sean Christopherson     2023-10-27  1160  		is_dirty = folio_test_dirty(folio);
0003e2a414687fff Sean Christopherson     2023-10-27  1161  
0003e2a414687fff Sean Christopherson     2023-10-27  1162  		if (((mode & ISOLATE_ASYNC_MIGRATE) && is_dirty) ||
0003e2a414687fff Sean Christopherson     2023-10-27  1163  		    (mapping && is_unevictable)) {
0003e2a414687fff Sean Christopherson     2023-10-27  1164  			bool migrate_dirty = true;
27e6a24a4cf3d254 Paolo Bonzini           2024-07-11  1165  			bool is_inaccessible;
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1166  
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1167  			/*
866ff80176aa1f9c Matthew Wilcox          2023-07-27  1168  			 * Only folios without mappings or that have
0003e2a414687fff Sean Christopherson     2023-10-27  1169  			 * a ->migrate_folio callback are possible to migrate
0003e2a414687fff Sean Christopherson     2023-10-27  1170  			 * without blocking.
0003e2a414687fff Sean Christopherson     2023-10-27  1171  			 *
27e6a24a4cf3d254 Paolo Bonzini           2024-07-11  1172  			 * Folios from inaccessible mappings are not migratable.
0003e2a414687fff Sean Christopherson     2023-10-27  1173  			 *
0003e2a414687fff Sean Christopherson     2023-10-27  1174  			 * However, we can be racing with truncation, which can
0003e2a414687fff Sean Christopherson     2023-10-27  1175  			 * free the mapping that we need to check. Truncation
0003e2a414687fff Sean Christopherson     2023-10-27  1176  			 * holds the folio lock until after the folio is removed
0003e2a414687fff Sean Christopherson     2023-10-27  1177  			 * from the page so holding it ourselves is sufficient.
0003e2a414687fff Sean Christopherson     2023-10-27  1178  			 *
27e6a24a4cf3d254 Paolo Bonzini           2024-07-11  1179  			 * To avoid locking the folio just to check inaccessible,
27e6a24a4cf3d254 Paolo Bonzini           2024-07-11  1180  			 * assume every inaccessible folio is also unevictable,
0003e2a414687fff Sean Christopherson     2023-10-27  1181  			 * which is a cheaper test.  If our assumption goes
0003e2a414687fff Sean Christopherson     2023-10-27  1182  			 * wrong, it's not a correctness bug, just potentially
0003e2a414687fff Sean Christopherson     2023-10-27  1183  			 * wasted cycles.
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1184  			 */
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1185  			if (!folio_trylock(folio))
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1186  				goto isolate_fail_put;
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1187  
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1188  			mapping = folio_mapping(folio);
0003e2a414687fff Sean Christopherson     2023-10-27  1189  			if ((mode & ISOLATE_ASYNC_MIGRATE) && is_dirty) {
5490da4f06d182ba Matthew Wilcox (Oracle  2022-06-06  1190) 				migrate_dirty = !mapping ||
9d0ddc0cb575fd41 Matthew Wilcox (Oracle  2022-06-06  1191) 						mapping->a_ops->migrate_folio;
0003e2a414687fff Sean Christopherson     2023-10-27  1192  			}
27e6a24a4cf3d254 Paolo Bonzini           2024-07-11  1193  			is_inaccessible = mapping && mapping_inaccessible(mapping);
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1194  			folio_unlock(folio);
27e6a24a4cf3d254 Paolo Bonzini           2024-07-11  1195  			if (!migrate_dirty || is_inaccessible)
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1196  				goto isolate_fail_put;
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1197  		}
89f6c88a6ab4a11d Hugh Dickins            2022-03-22  1198  
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1199  		/* Try isolate the folio */
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1200  		if (!folio_test_clear_lru(folio))
9df41314390b81a5 Alex Shi                2020-12-15  1201  			goto isolate_fail_put;
9df41314390b81a5 Alex Shi                2020-12-15  1202  
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1203  		lruvec = folio_lruvec(folio);
6168d0da2b479ce2 Alex Shi                2020-12-15  1204  
69b7189f12e00642 Vlastimil Babka         2014-10-09  1205  		/* If we already hold the lock, we can skip some rechecking */
6168d0da2b479ce2 Alex Shi                2020-12-15  1206  		if (lruvec != locked) {
6168d0da2b479ce2 Alex Shi                2020-12-15  1207  			if (locked)
6168d0da2b479ce2 Alex Shi                2020-12-15  1208  				unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479ce2 Alex Shi                2020-12-15  1209  
6168d0da2b479ce2 Alex Shi                2020-12-15  1210  			compact_lock_irqsave(&lruvec->lru_lock, &flags, cc);
6168d0da2b479ce2 Alex Shi                2020-12-15  1211  			locked = lruvec;
6168d0da2b479ce2 Alex Shi                2020-12-15  1212  
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1213  			lruvec_memcg_debug(lruvec, folio);
e380bebe4771548d Mel Gorman              2019-03-05  1214  
590ccea80af95068 Mel Gorman              2023-05-15  1215  			/*
590ccea80af95068 Mel Gorman              2023-05-15  1216  			 * Try get exclusive access under lock. If marked for
590ccea80af95068 Mel Gorman              2023-05-15  1217  			 * skip, the scan is aborted unless the current context
590ccea80af95068 Mel Gorman              2023-05-15  1218  			 * is a rescan to reach the end of the pageblock.
590ccea80af95068 Mel Gorman              2023-05-15  1219  			 */
590ccea80af95068 Mel Gorman              2023-05-15  1220  			if (!skip_updated && valid_page) {
e380bebe4771548d Mel Gorman              2019-03-05  1221  				skip_updated = true;
590ccea80af95068 Mel Gorman              2023-05-15  1222  				if (test_and_set_skip(cc, valid_page) &&
590ccea80af95068 Mel Gorman              2023-05-15  1223  				    !cc->finish_pageblock) {
7545e2f20aebf4da Kemeng Shi              2023-08-04  1224  					low_pfn = end_pfn;
e380bebe4771548d Mel Gorman              2019-03-05  1225  					goto isolate_abort;
e380bebe4771548d Mel Gorman              2019-03-05  1226  				}
590ccea80af95068 Mel Gorman              2023-05-15  1227  			}
2a1402aa044b55c2 Mel Gorman              2012-10-08  1228  
29c0dde830f8c08c Vlastimil Babka         2015-09-08  1229  			/*
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1230  			 * Check LRU folio order under the lock
29c0dde830f8c08c Vlastimil Babka         2015-09-08  1231  			 */
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1232  			if (unlikely(skip_isolation_on_order(folio_order(folio),
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1233  							     cc->order) &&
ee6f62fd34f0bb99 Zi Yan                  2024-02-20  1234  				     !cc->alloc_contig)) {
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1235  				low_pfn += folio_nr_pages(folio) - 1;
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1236  				nr_scanned += folio_nr_pages(folio) - 1;
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1237  				folio_set_lru(folio);
9df41314390b81a5 Alex Shi                2020-12-15  1238  				goto isolate_fail_put;
bc835011afbea395 Andrea Arcangeli        2011-01-13  1239  			}
d99fd5feb0ac1d56 Alex Shi                2021-02-24  1240  		}
fa9add641b1b1c56 Hugh Dickins            2012-05-29  1241  
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1242  		/* The folio is taken off the LRU */
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1243  		if (folio_test_large(folio))
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1244  			low_pfn += folio_nr_pages(folio) - 1;
bc835011afbea395 Andrea Arcangeli        2011-01-13  1245  
748446bb6b5a9390 Mel Gorman              2010-05-24  1246  		/* Successfully isolated */
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1247  		lruvec_del_folio(lruvec, folio);
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1248  		node_stat_mod_folio(folio,
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1249  				NR_ISOLATED_ANON + folio_is_file_lru(folio),
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1250  				folio_nr_pages(folio));
b6c750163c0d138f Joonsoo Kim             2014-04-07  1251  
b6c750163c0d138f Joonsoo Kim             2014-04-07  1252  isolate_success:
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1253  		list_add(&folio->lru, &cc->migratepages);
ae37c7ff79f1f030 Oscar Salvador          2021-05-04  1254  isolate_success_no_list:
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1255  		cc->nr_migratepages += folio_nr_pages(folio);
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1256  		nr_isolated += folio_nr_pages(folio);
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1257  		nr_scanned += folio_nr_pages(folio) - 1;
a6f8e2add2e3c53c Minchan Kim             2023-01-12  1258  		if (!folio_test_anon(folio))
be343ff665e27b4c Suren Baghdasaryan      2026-05-15  1259  			cc_ext->nr_migrate_file_pages += folio_nr_pages(folio);
748446bb6b5a9390 Mel Gorman              2010-05-24  1260  
804d3121ba5f03af Mel Gorman              2019-03-05  1261  		/*
804d3121ba5f03af Mel Gorman              2019-03-05  1262  		 * Avoid isolating too much unless this block is being
48731c8436c68ce5 Mel Gorman              2023-01-25  1263  		 * fully scanned (e.g. dirty/writeback pages, parallel allocation)
cb2dcaf023c2cf12 Mel Gorman              2019-03-05  1264  		 * or a lock is contended. For contention, isolate quickly to
cb2dcaf023c2cf12 Mel Gorman              2019-03-05  1265  		 * potentially remove one source of contention.
804d3121ba5f03af Mel Gorman              2019-03-05  1266  		 */
38935861d85a4d9a Zi Yan                  2020-11-13  1267  		if (cc->nr_migratepages >= COMPACT_CLUSTER_MAX &&
48731c8436c68ce5 Mel Gorman              2023-01-25  1268  		    !cc->finish_pageblock && !cc->contended) {
31b8384a555d94c7 Hillf Danton            2012-01-10  1269  			++low_pfn;
748446bb6b5a9390 Mel Gorman              2010-05-24  1270  			break;
748446bb6b5a9390 Mel Gorman              2010-05-24  1271  		}
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1272  
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1273  		continue;
9df41314390b81a5 Alex Shi                2020-12-15  1274  
9df41314390b81a5 Alex Shi                2020-12-15  1275  isolate_fail_put:
9df41314390b81a5 Alex Shi                2020-12-15  1276  		/* Avoid potential deadlock in freeing page under lru_lock */
9df41314390b81a5 Alex Shi                2020-12-15  1277  		if (locked) {
6168d0da2b479ce2 Alex Shi                2020-12-15  1278  			unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479ce2 Alex Shi                2020-12-15  1279  			locked = NULL;
9df41314390b81a5 Alex Shi                2020-12-15  1280  		}
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1281  		folio_put(folio);
9df41314390b81a5 Alex Shi                2020-12-15  1282  
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1283  isolate_fail:
369fa227c21949b2 Oscar Salvador          2021-05-04  1284  		if (!skip_on_failure && ret != -ENOMEM)
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1285  			continue;
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1286  
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1287  		/*
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1288  		 * We have isolated some pages, but then failed. Release them
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1289  		 * instead of migrating, as we cannot form the cc->order buddy
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1290  		 * page anyway.
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1291  		 */
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1292  		if (nr_isolated) {
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1293  			if (locked) {
6168d0da2b479ce2 Alex Shi                2020-12-15  1294  				unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479ce2 Alex Shi                2020-12-15  1295  				locked = NULL;
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1296  			}
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1297  			putback_movable_pages(&cc->migratepages);
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1298  			cc->nr_migratepages = 0;
be343ff665e27b4c Suren Baghdasaryan      2026-05-15  1299  			cc_ext->nr_migrate_file_pages = 0;
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1300  			nr_isolated = 0;
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1301  		}
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1302  
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1303  		if (low_pfn < next_skip_pfn) {
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1304  			low_pfn = next_skip_pfn - 1;
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1305  			/*
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1306  			 * The check near the loop beginning would have updated
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1307  			 * next_skip_pfn too, but this is a bit simpler.
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1308  			 */
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1309  			next_skip_pfn += 1UL << cc->order;
fdd048e12c9a46d0 Vlastimil Babka         2016-05-19  1310  		}
369fa227c21949b2 Oscar Salvador          2021-05-04  1311  
369fa227c21949b2 Oscar Salvador          2021-05-04  1312  		if (ret == -ENOMEM)
369fa227c21949b2 Oscar Salvador          2021-05-04  1313  			break;
31b8384a555d94c7 Hillf Danton            2012-01-10  1314  	}
748446bb6b5a9390 Mel Gorman              2010-05-24  1315  
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1316  	/*
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1317  	 * The PageBuddy() check could have potentially brought us outside
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1318  	 * the range to be scanned.
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1319  	 */
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1320  	if (unlikely(low_pfn > end_pfn))
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1321  		low_pfn = end_pfn;
99c0fd5e51c44791 Vlastimil Babka         2014-10-09  1322  
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1323  	folio = NULL;
9df41314390b81a5 Alex Shi                2020-12-15  1324  
e380bebe4771548d Mel Gorman              2019-03-05  1325  isolate_abort:
c67fe3752abe6ab4 Mel Gorman              2012-08-21  1326  	if (locked)
6168d0da2b479ce2 Alex Shi                2020-12-15  1327  		unlock_page_lruvec_irqrestore(locked, flags);
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1328  	if (folio) {
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1329  		folio_set_lru(folio);
56ae0bb349b4eeb1 Kefeng Wang             2023-06-19  1330  		folio_put(folio);
9df41314390b81a5 Alex Shi                2020-12-15  1331  	}
748446bb6b5a9390 Mel Gorman              2010-05-24  1332  
50b5b094e683f8e5 Vlastimil Babka         2014-01-21  1333  	/*
48731c8436c68ce5 Mel Gorman              2023-01-25  1334  	 * Update the cached scanner pfn once the pageblock has been scanned.
804d3121ba5f03af Mel Gorman              2019-03-05  1335  	 * Pages will either be migrated in which case there is no point
804d3121ba5f03af Mel Gorman              2019-03-05  1336  	 * scanning in the near future or migration failed in which case the
804d3121ba5f03af Mel Gorman              2019-03-05  1337  	 * failure reason may persist. The block is marked for skipping if
804d3121ba5f03af Mel Gorman              2019-03-05  1338  	 * there were no pages isolated in the block or if the block is
804d3121ba5f03af Mel Gorman              2019-03-05  1339  	 * rescanned twice in a row.
50b5b094e683f8e5 Vlastimil Babka         2014-01-21  1340  	 */
48731c8436c68ce5 Mel Gorman              2023-01-25  1341  	if (low_pfn == end_pfn && (!nr_isolated || cc->finish_pageblock)) {
8b71b499ff98fdcd Baolin Wang             2023-05-25  1342  		if (!cc->no_set_skip_hint && valid_page && !skip_updated)
e380bebe4771548d Mel Gorman              2019-03-05  1343  			set_pageblock_skip(valid_page);
e380bebe4771548d Mel Gorman              2019-03-05  1344  		update_cached_migrate(cc, low_pfn);
e380bebe4771548d Mel Gorman              2019-03-05  1345  	}
bb13ffeb9f6bfeb3 Mel Gorman              2012-10-08  1346  
e34d85f0e3c60f72 Joonsoo Kim             2015-02-11  1347  	trace_mm_compaction_isolate_migratepages(start_pfn, low_pfn,
e34d85f0e3c60f72 Joonsoo Kim             2015-02-11  1348  						nr_scanned, nr_isolated);
b7aba6984dc04850 Mel Gorman              2011-01-13  1349  
670105a25608affe Mel Gorman              2019-08-02  1350  fatal_pending:
7f354a548d1cb6bb David Rientjes          2017-02-22  1351  	cc->total_migrate_scanned += nr_scanned;
397487db696cae0b Mel Gorman              2012-10-19  1352  	if (nr_isolated)
010fc29a45a2e8db Minchan Kim             2012-12-20  1353  		count_compact_events(COMPACTISOLATED, nr_isolated);
397487db696cae0b Mel Gorman              2012-10-19  1354  
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04  1355  	cc->migrate_pfn = low_pfn;
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04  1356  
c2ad7a1ffeafa32e Oscar Salvador          2021-05-04  1357  	return ret;
2fe86e0004076128 Michal Nazarewicz       2012-01-30  1358  }
2fe86e0004076128 Michal Nazarewicz       2012-01-30  1359  

:::::: The code at line 882 was first introduced by commit
:::::: 748446bb6b5a9390b546af38ec899c868a9dbcf0 mm: compaction: memory compaction core

:::::: TO: Mel Gorman <mel@csn.ul.ie>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
