Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9040215B2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 01:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzkSlhkj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699062672; x=1730598672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GIOs2FJg4U7WcDPDJ+5iPQyLJgbTT8/1C84O2ghTx0w=;
  b=TzkSlhkjaUna81Q24Jp5QLLHG6Z3cEI1+TN7SrO/OqcNRSFVB0Kexnn8
   8nhC6pIUsMO3ssXDM1Upzowvtv8mfbrcmDuZaANVagYTV8e7G3f37c6X3
   xEe5/lKPFF82x3SEp/WZEksKnjGgxzKvKUsB8gNy4jzJmYODmeOGnPasa
   0YO/V74NQvy0G+bRM4W55s+YorcLiEqGNbRlo8atQetdwaO71xMbMzYr2
   GuUu5PSGEjz6586pI0RKGkAFDQt/dqsY4TDW3sOKD9or5e0NzCBSWtlS6
   A6IhPAzsY+lwLYLbZU7zLUJGq2PbTTTapy3Jfu252udxDc+1DBk6Srt1S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="10588149"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="10588149"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 18:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="827668318"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="827668318"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Nov 2023 18:51:06 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz5oW-0003DI-0R;
	Sat, 04 Nov 2023 01:51:04 +0000
Date: Sat, 4 Nov 2023 09:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] mm/compaction.c:829: warning:
 Function parameter or member 'cc_ext' not described in
 'isolate_migratepages_block'
Message-ID: <202311040939.afr44wlq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   2fea3eca9608d8c14fb6963bfe830dfa5985d7de
commit: 80f43853cdeeaba03c9bd5480a723b47e6bebf11 [1/1] ANDROID: mm: do not allow file-backed pages from CMA
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231104/202311040939.afr44wlq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040939.afr44wlq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040939.afr44wlq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/compaction.c:829: warning: Function parameter or member 'cc_ext' not described in 'isolate_migratepages_block'
   mm/compaction.c:829: warning: Excess function parameter 'cc' description in 'isolate_migratepages_block'


vim +829 mm/compaction.c

748446bb6b5a93 Mel Gorman              2010-05-24   807  
2fe86e00040761 Michal Nazarewicz       2012-01-30   808  /**
edc2ca61249679 Vlastimil Babka         2014-10-09   809   * isolate_migratepages_block() - isolate all migrate-able pages within
edc2ca61249679 Vlastimil Babka         2014-10-09   810   *				  a single pageblock
2fe86e00040761 Michal Nazarewicz       2012-01-30   811   * @cc:		Compaction control structure.
edc2ca61249679 Vlastimil Babka         2014-10-09   812   * @low_pfn:	The first PFN to isolate
edc2ca61249679 Vlastimil Babka         2014-10-09   813   * @end_pfn:	The one-past-the-last PFN to isolate, within same pageblock
edc2ca61249679 Vlastimil Babka         2014-10-09   814   * @isolate_mode: Isolation mode to be used.
2fe86e00040761 Michal Nazarewicz       2012-01-30   815   *
2fe86e00040761 Michal Nazarewicz       2012-01-30   816   * Isolate all pages that can be migrated from the range specified by
edc2ca61249679 Vlastimil Babka         2014-10-09   817   * [low_pfn, end_pfn). The range is expected to be within same pageblock.
edc2ca61249679 Vlastimil Babka         2014-10-09   818   * Returns zero if there is a fatal signal pending, otherwise PFN of the
edc2ca61249679 Vlastimil Babka         2014-10-09   819   * first page that was not scanned (which may be both less, equal to or more
edc2ca61249679 Vlastimil Babka         2014-10-09   820   * than end_pfn).
2fe86e00040761 Michal Nazarewicz       2012-01-30   821   *
edc2ca61249679 Vlastimil Babka         2014-10-09   822   * The pages are isolated on cc->migratepages list (not required to be empty),
edc2ca61249679 Vlastimil Babka         2014-10-09   823   * and cc->nr_migratepages is updated accordingly. The cc->migrate_pfn field
edc2ca61249679 Vlastimil Babka         2014-10-09   824   * is neither read nor updated.
748446bb6b5a93 Mel Gorman              2010-05-24   825   */
edc2ca61249679 Vlastimil Babka         2014-10-09   826  static unsigned long
80f43853cdeeab Minchan Kim             2023-01-12   827  isolate_migratepages_block(struct compact_control_ext *cc_ext, unsigned long low_pfn,
edc2ca61249679 Vlastimil Babka         2014-10-09   828  			unsigned long end_pfn, isolate_mode_t isolate_mode)
748446bb6b5a93 Mel Gorman              2010-05-24  @829  {
80f43853cdeeab Minchan Kim             2023-01-12   830  	struct compact_control *cc = cc_ext->cc;
5f438eee8f2e97 Andrey Ryabinin         2019-03-05   831  	pg_data_t *pgdat = cc->zone->zone_pgdat;
b7aba6984dc048 Mel Gorman              2011-01-13   832  	unsigned long nr_scanned = 0, nr_isolated = 0;
fa9add641b1b1c Hugh Dickins            2012-05-29   833  	struct lruvec *lruvec;
b8b2d825323633 Xiubo Li                2014-10-09   834  	unsigned long flags = 0;
2a1402aa044b55 Mel Gorman              2012-10-08   835  	bool locked = false;
bb13ffeb9f6bfe Mel Gorman              2012-10-08   836  	struct page *page = NULL, *valid_page = NULL;
e34d85f0e3c60f Joonsoo Kim             2015-02-11   837  	unsigned long start_pfn = low_pfn;
fdd048e12c9a46 Vlastimil Babka         2016-05-19   838  	bool skip_on_failure = false;
fdd048e12c9a46 Vlastimil Babka         2016-05-19   839  	unsigned long next_skip_pfn = 0;
e380bebe477154 Mel Gorman              2019-03-05   840  	bool skip_updated = false;
748446bb6b5a93 Mel Gorman              2010-05-24   841  
748446bb6b5a93 Mel Gorman              2010-05-24   842  	/*
748446bb6b5a93 Mel Gorman              2010-05-24   843  	 * Ensure that there are not too many pages isolated from the LRU
748446bb6b5a93 Mel Gorman              2010-05-24   844  	 * list by either parallel reclaimers or compaction. If there are,
748446bb6b5a93 Mel Gorman              2010-05-24   845  	 * delay for some time until fewer pages are isolated
748446bb6b5a93 Mel Gorman              2010-05-24   846  	 */
5f438eee8f2e97 Andrey Ryabinin         2019-03-05   847  	while (unlikely(too_many_isolated(pgdat))) {
d20bdd571ee5c9 Zi Yan                  2020-11-13   848  		/* stop isolation if there are still pages not migrated */
d20bdd571ee5c9 Zi Yan                  2020-11-13   849  		if (cc->nr_migratepages)
d20bdd571ee5c9 Zi Yan                  2020-11-13   850  			return 0;
d20bdd571ee5c9 Zi Yan                  2020-11-13   851  
f9e35b3b41f47c Mel Gorman              2011-06-15   852  		/* async migration should just abort */
e0b9daeb453e60 David Rientjes          2014-06-04   853  		if (cc->mode == MIGRATE_ASYNC)
2fe86e00040761 Michal Nazarewicz       2012-01-30   854  			return 0;
f9e35b3b41f47c Mel Gorman              2011-06-15   855  
748446bb6b5a93 Mel Gorman              2010-05-24   856  		congestion_wait(BLK_RW_ASYNC, HZ/10);
748446bb6b5a93 Mel Gorman              2010-05-24   857  
748446bb6b5a93 Mel Gorman              2010-05-24   858  		if (fatal_signal_pending(current))
2fe86e00040761 Michal Nazarewicz       2012-01-30   859  			return 0;
748446bb6b5a93 Mel Gorman              2010-05-24   860  	}
748446bb6b5a93 Mel Gorman              2010-05-24   861  
cf66f0700c8f1d Mel Gorman              2019-03-05   862  	cond_resched();
aeef4b83806f49 David Rientjes          2014-06-04   863  
fdd048e12c9a46 Vlastimil Babka         2016-05-19   864  	if (cc->direct_compaction && (cc->mode == MIGRATE_ASYNC)) {
fdd048e12c9a46 Vlastimil Babka         2016-05-19   865  		skip_on_failure = true;
fdd048e12c9a46 Vlastimil Babka         2016-05-19   866  		next_skip_pfn = block_end_pfn(low_pfn, cc->order);
fdd048e12c9a46 Vlastimil Babka         2016-05-19   867  	}
fdd048e12c9a46 Vlastimil Babka         2016-05-19   868  
748446bb6b5a93 Mel Gorman              2010-05-24   869  	/* Time to isolate some pages for migration */
748446bb6b5a93 Mel Gorman              2010-05-24   870  	for (; low_pfn < end_pfn; low_pfn++) {
29c0dde830f8c0 Vlastimil Babka         2015-09-08   871  
fdd048e12c9a46 Vlastimil Babka         2016-05-19   872  		if (skip_on_failure && low_pfn >= next_skip_pfn) {
fdd048e12c9a46 Vlastimil Babka         2016-05-19   873  			/*
fdd048e12c9a46 Vlastimil Babka         2016-05-19   874  			 * We have isolated all migration candidates in the
fdd048e12c9a46 Vlastimil Babka         2016-05-19   875  			 * previous order-aligned block, and did not skip it due
fdd048e12c9a46 Vlastimil Babka         2016-05-19   876  			 * to failure. We should migrate the pages now and
fdd048e12c9a46 Vlastimil Babka         2016-05-19   877  			 * hopefully succeed compaction.
fdd048e12c9a46 Vlastimil Babka         2016-05-19   878  			 */
fdd048e12c9a46 Vlastimil Babka         2016-05-19   879  			if (nr_isolated)
fdd048e12c9a46 Vlastimil Babka         2016-05-19   880  				break;
fdd048e12c9a46 Vlastimil Babka         2016-05-19   881  
fdd048e12c9a46 Vlastimil Babka         2016-05-19   882  			/*
fdd048e12c9a46 Vlastimil Babka         2016-05-19   883  			 * We failed to isolate in the previous order-aligned
fdd048e12c9a46 Vlastimil Babka         2016-05-19   884  			 * block. Set the new boundary to the end of the
fdd048e12c9a46 Vlastimil Babka         2016-05-19   885  			 * current block. Note we can't simply increase
fdd048e12c9a46 Vlastimil Babka         2016-05-19   886  			 * next_skip_pfn by 1 << order, as low_pfn might have
fdd048e12c9a46 Vlastimil Babka         2016-05-19   887  			 * been incremented by a higher number due to skipping
fdd048e12c9a46 Vlastimil Babka         2016-05-19   888  			 * a compound or a high-order buddy page in the
fdd048e12c9a46 Vlastimil Babka         2016-05-19   889  			 * previous loop iteration.
fdd048e12c9a46 Vlastimil Babka         2016-05-19   890  			 */
fdd048e12c9a46 Vlastimil Babka         2016-05-19   891  			next_skip_pfn = block_end_pfn(low_pfn, cc->order);
fdd048e12c9a46 Vlastimil Babka         2016-05-19   892  		}
fdd048e12c9a46 Vlastimil Babka         2016-05-19   893  
8b44d2791f9125 Vlastimil Babka         2014-10-09   894  		/*
8b44d2791f9125 Vlastimil Babka         2014-10-09   895  		 * Periodically drop the lock (if held) regardless of its
670105a25608af Mel Gorman              2019-08-02   896  		 * contention, to give chance to IRQs. Abort completely if
670105a25608af Mel Gorman              2019-08-02   897  		 * a fatal signal is pending.
8b44d2791f9125 Vlastimil Babka         2014-10-09   898  		 */
8b44d2791f9125 Vlastimil Babka         2014-10-09   899  		if (!(low_pfn % SWAP_CLUSTER_MAX)
f4b7e272b5c042 Andrey Ryabinin         2019-03-05   900  		    && compact_unlock_should_abort(&pgdat->lru_lock,
670105a25608af Mel Gorman              2019-08-02   901  					    flags, &locked, cc)) {
670105a25608af Mel Gorman              2019-08-02   902  			low_pfn = 0;
670105a25608af Mel Gorman              2019-08-02   903  			goto fatal_pending;
670105a25608af Mel Gorman              2019-08-02   904  		}
b2eef8c0d09101 Andrea Arcangeli        2011-03-22   905  
748446bb6b5a93 Mel Gorman              2010-05-24   906  		if (!pfn_valid_within(low_pfn))
fdd048e12c9a46 Vlastimil Babka         2016-05-19   907  			goto isolate_fail;
b7aba6984dc048 Mel Gorman              2011-01-13   908  		nr_scanned++;
748446bb6b5a93 Mel Gorman              2010-05-24   909  
748446bb6b5a93 Mel Gorman              2010-05-24   910  		page = pfn_to_page(low_pfn);
dc9086004b3d5d Mel Gorman              2012-02-08   911  
e380bebe477154 Mel Gorman              2019-03-05   912  		/*
e380bebe477154 Mel Gorman              2019-03-05   913  		 * Check if the pageblock has already been marked skipped.
e380bebe477154 Mel Gorman              2019-03-05   914  		 * Only the aligned PFN is checked as the caller isolates
e380bebe477154 Mel Gorman              2019-03-05   915  		 * COMPACT_CLUSTER_MAX at a time so the second call must
e380bebe477154 Mel Gorman              2019-03-05   916  		 * not falsely conclude that the block should be skipped.
e380bebe477154 Mel Gorman              2019-03-05   917  		 */
e380bebe477154 Mel Gorman              2019-03-05   918  		if (!valid_page && IS_ALIGNED(low_pfn, pageblock_nr_pages)) {
e380bebe477154 Mel Gorman              2019-03-05   919  			if (!cc->ignore_skip_hint && get_pageblock_skip(page)) {
e380bebe477154 Mel Gorman              2019-03-05   920  				low_pfn = end_pfn;
e380bebe477154 Mel Gorman              2019-03-05   921  				goto isolate_abort;
e380bebe477154 Mel Gorman              2019-03-05   922  			}
bb13ffeb9f6bfe Mel Gorman              2012-10-08   923  			valid_page = page;
e380bebe477154 Mel Gorman              2019-03-05   924  		}
bb13ffeb9f6bfe Mel Gorman              2012-10-08   925  
c122b2087ab941 Joonsoo Kim             2014-04-07   926  		/*
99c0fd5e51c447 Vlastimil Babka         2014-10-09   927  		 * Skip if free. We read page order here without zone lock
99c0fd5e51c447 Vlastimil Babka         2014-10-09   928  		 * which is generally unsafe, but the race window is small and
99c0fd5e51c447 Vlastimil Babka         2014-10-09   929  		 * the worst thing that can happen is that we skip some
99c0fd5e51c447 Vlastimil Babka         2014-10-09   930  		 * potential isolation targets.
99c0fd5e51c447 Vlastimil Babka         2014-10-09   931  		 */
99c0fd5e51c447 Vlastimil Babka         2014-10-09   932  		if (PageBuddy(page)) {
ab130f9108dcf2 Matthew Wilcox (Oracle  2020-10-15   933) 			unsigned long freepage_order = buddy_order_unsafe(page);
99c0fd5e51c447 Vlastimil Babka         2014-10-09   934  
99c0fd5e51c447 Vlastimil Babka         2014-10-09   935  			/*
99c0fd5e51c447 Vlastimil Babka         2014-10-09   936  			 * Without lock, we cannot be sure that what we got is
99c0fd5e51c447 Vlastimil Babka         2014-10-09   937  			 * a valid page order. Consider only values in the
99c0fd5e51c447 Vlastimil Babka         2014-10-09   938  			 * valid order range to prevent low_pfn overflow.
c122b2087ab941 Joonsoo Kim             2014-04-07   939  			 */
99c0fd5e51c447 Vlastimil Babka         2014-10-09   940  			if (freepage_order > 0 && freepage_order < MAX_ORDER)
99c0fd5e51c447 Vlastimil Babka         2014-10-09   941  				low_pfn += (1UL << freepage_order) - 1;
c122b2087ab941 Joonsoo Kim             2014-04-07   942  			continue;
99c0fd5e51c447 Vlastimil Babka         2014-10-09   943  		}
9927af740b1b9b Mel Gorman              2011-01-13   944  
bc835011afbea3 Andrea Arcangeli        2011-01-13   945  		/*
29c0dde830f8c0 Vlastimil Babka         2015-09-08   946  		 * Regardless of being on LRU, compound pages such as THP and
1da2f328fa643b Rik van Riel            2020-04-01   947  		 * hugetlbfs are not to be compacted unless we are attempting
1da2f328fa643b Rik van Riel            2020-04-01   948  		 * an allocation much larger than the huge page size (eg CMA).
1da2f328fa643b Rik van Riel            2020-04-01   949  		 * We can potentially save a lot of iterations if we skip them
1da2f328fa643b Rik van Riel            2020-04-01   950  		 * at once. The check is racy, but we can consider only valid
1da2f328fa643b Rik van Riel            2020-04-01   951  		 * values and the only danger is skipping too much.
bc835011afbea3 Andrea Arcangeli        2011-01-13   952  		 */
1da2f328fa643b Rik van Riel            2020-04-01   953  		if (PageCompound(page) && !cc->alloc_contig) {
21dc7e023611fb David Rientjes          2017-11-17   954  			const unsigned int order = compound_order(page);
edc2ca61249679 Vlastimil Babka         2014-10-09   955  
d3c85bad89b915 Vlastimil Babka         2017-11-17   956  			if (likely(order < MAX_ORDER))
21dc7e023611fb David Rientjes          2017-11-17   957  				low_pfn += (1UL << order) - 1;
fdd048e12c9a46 Vlastimil Babka         2016-05-19   958  			goto isolate_fail;
2a1402aa044b55 Mel Gorman              2012-10-08   959  		}
2a1402aa044b55 Mel Gorman              2012-10-08   960  
bda807d4445414 Minchan Kim             2016-07-26   961  		/*
bda807d4445414 Minchan Kim             2016-07-26   962  		 * Check may be lockless but that's ok as we recheck later.
bda807d4445414 Minchan Kim             2016-07-26   963  		 * It's possible to migrate LRU and non-lru movable pages.
bda807d4445414 Minchan Kim             2016-07-26   964  		 * Skip any other type of page
bda807d4445414 Minchan Kim             2016-07-26   965  		 */
bda807d4445414 Minchan Kim             2016-07-26   966  		if (!PageLRU(page)) {
bda807d4445414 Minchan Kim             2016-07-26   967  			/*
bda807d4445414 Minchan Kim             2016-07-26   968  			 * __PageMovable can return false positive so we need
bda807d4445414 Minchan Kim             2016-07-26   969  			 * to verify it under page_lock.
bda807d4445414 Minchan Kim             2016-07-26   970  			 */
bda807d4445414 Minchan Kim             2016-07-26   971  			if (unlikely(__PageMovable(page)) &&
bda807d4445414 Minchan Kim             2016-07-26   972  					!PageIsolated(page)) {
bda807d4445414 Minchan Kim             2016-07-26   973  				if (locked) {
f4b7e272b5c042 Andrey Ryabinin         2019-03-05   974  					spin_unlock_irqrestore(&pgdat->lru_lock,
bda807d4445414 Minchan Kim             2016-07-26   975  									flags);
bda807d4445414 Minchan Kim             2016-07-26   976  					locked = false;
bda807d4445414 Minchan Kim             2016-07-26   977  				}
bda807d4445414 Minchan Kim             2016-07-26   978  
9e5bcd610ffced Yisheng Xie             2017-02-24   979  				if (!isolate_movable_page(page, isolate_mode))
bda807d4445414 Minchan Kim             2016-07-26   980  					goto isolate_success;
bda807d4445414 Minchan Kim             2016-07-26   981  			}
bda807d4445414 Minchan Kim             2016-07-26   982  
fdd048e12c9a46 Vlastimil Babka         2016-05-19   983  			goto isolate_fail;
bda807d4445414 Minchan Kim             2016-07-26   984  		}
29c0dde830f8c0 Vlastimil Babka         2015-09-08   985  
119d6d59dcc098 David Rientjes          2014-04-03   986  		/*
119d6d59dcc098 David Rientjes          2014-04-03   987  		 * Migration will fail if an anonymous page is pinned in memory,
119d6d59dcc098 David Rientjes          2014-04-03   988  		 * so avoid taking lru_lock and isolating it unnecessarily in an
119d6d59dcc098 David Rientjes          2014-04-03   989  		 * admittedly racy check.
119d6d59dcc098 David Rientjes          2014-04-03   990  		 */
119d6d59dcc098 David Rientjes          2014-04-03   991  		if (!page_mapping(page) &&
119d6d59dcc098 David Rientjes          2014-04-03   992  		    page_count(page) > page_mapcount(page))
fdd048e12c9a46 Vlastimil Babka         2016-05-19   993  			goto isolate_fail;
119d6d59dcc098 David Rientjes          2014-04-03   994  
73e64c51afc56d Michal Hocko            2016-12-14   995  		/*
73e64c51afc56d Michal Hocko            2016-12-14   996  		 * Only allow to migrate anonymous pages in GFP_NOFS context
73e64c51afc56d Michal Hocko            2016-12-14   997  		 * because those do not depend on fs locks.
73e64c51afc56d Michal Hocko            2016-12-14   998  		 */
73e64c51afc56d Michal Hocko            2016-12-14   999  		if (!(cc->gfp_mask & __GFP_FS) && page_mapping(page))
73e64c51afc56d Michal Hocko            2016-12-14  1000  			goto isolate_fail;
73e64c51afc56d Michal Hocko            2016-12-14  1001  
69b7189f12e006 Vlastimil Babka         2014-10-09  1002  		/* If we already hold the lock, we can skip some rechecking */
69b7189f12e006 Vlastimil Babka         2014-10-09  1003  		if (!locked) {
f4b7e272b5c042 Andrey Ryabinin         2019-03-05  1004  			locked = compact_lock_irqsave(&pgdat->lru_lock,
8b44d2791f9125 Vlastimil Babka         2014-10-09  1005  								&flags, cc);
e380bebe477154 Mel Gorman              2019-03-05  1006  
e380bebe477154 Mel Gorman              2019-03-05  1007  			/* Try get exclusive access under lock */
e380bebe477154 Mel Gorman              2019-03-05  1008  			if (!skip_updated) {
e380bebe477154 Mel Gorman              2019-03-05  1009  				skip_updated = true;
e380bebe477154 Mel Gorman              2019-03-05  1010  				if (test_and_set_skip(cc, page, low_pfn))
e380bebe477154 Mel Gorman              2019-03-05  1011  					goto isolate_abort;
e380bebe477154 Mel Gorman              2019-03-05  1012  			}
2a1402aa044b55 Mel Gorman              2012-10-08  1013  
29c0dde830f8c0 Vlastimil Babka         2015-09-08  1014  			/* Recheck PageLRU and PageCompound under lock */
2a1402aa044b55 Mel Gorman              2012-10-08  1015  			if (!PageLRU(page))
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1016  				goto isolate_fail;
29c0dde830f8c0 Vlastimil Babka         2015-09-08  1017  
29c0dde830f8c0 Vlastimil Babka         2015-09-08  1018  			/*
29c0dde830f8c0 Vlastimil Babka         2015-09-08  1019  			 * Page become compound since the non-locked check,
29c0dde830f8c0 Vlastimil Babka         2015-09-08  1020  			 * and it's on LRU. It can only be a THP so the order
29c0dde830f8c0 Vlastimil Babka         2015-09-08  1021  			 * is safe to read and it's 0 for tail pages.
29c0dde830f8c0 Vlastimil Babka         2015-09-08  1022  			 */
1da2f328fa643b Rik van Riel            2020-04-01  1023  			if (unlikely(PageCompound(page) && !cc->alloc_contig)) {
d8c6546b1aea84 Matthew Wilcox (Oracle  2019-09-23  1024) 				low_pfn += compound_nr(page) - 1;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1025  				goto isolate_fail;
bc835011afbea3 Andrea Arcangeli        2011-01-13  1026  			}
69b7189f12e006 Vlastimil Babka         2014-10-09  1027  		}
bc835011afbea3 Andrea Arcangeli        2011-01-13  1028  
f4b7e272b5c042 Andrey Ryabinin         2019-03-05  1029  		lruvec = mem_cgroup_page_lruvec(page, pgdat);
fa9add641b1b1c Hugh Dickins            2012-05-29  1030  
748446bb6b5a93 Mel Gorman              2010-05-24  1031  		/* Try isolate the page */
edc2ca61249679 Vlastimil Babka         2014-10-09  1032  		if (__isolate_lru_page(page, isolate_mode) != 0)
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1033  			goto isolate_fail;
748446bb6b5a93 Mel Gorman              2010-05-24  1034  
1da2f328fa643b Rik van Riel            2020-04-01  1035  		/* The whole page is taken off the LRU; skip the tail pages. */
1da2f328fa643b Rik van Riel            2020-04-01  1036  		if (PageCompound(page))
1da2f328fa643b Rik van Riel            2020-04-01  1037  			low_pfn += compound_nr(page) - 1;
bc835011afbea3 Andrea Arcangeli        2011-01-13  1038  
748446bb6b5a93 Mel Gorman              2010-05-24  1039  		/* Successfully isolated */
552f416558737f Yu Zhao                 2021-02-24  1040  		del_page_from_lru_list(page, lruvec);
1da2f328fa643b Rik van Riel            2020-04-01  1041  		mod_node_page_state(page_pgdat(page),
9de4f22a60f731 Huang Ying              2020-04-06  1042  				NR_ISOLATED_ANON + page_is_file_lru(page),
6c357848b44b40 Matthew Wilcox (Oracle  2020-08-14  1043) 				thp_nr_pages(page));
b6c750163c0d13 Joonsoo Kim             2014-04-07  1044  
b6c750163c0d13 Joonsoo Kim             2014-04-07  1045  isolate_success:
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1046  		list_add(&page->lru, &cc->migratepages);
38935861d85a4d Zi Yan                  2020-11-13  1047  		cc->nr_migratepages += compound_nr(page);
80f43853cdeeab Minchan Kim             2023-01-12  1048  		if (!PageAnon(page))
80f43853cdeeab Minchan Kim             2023-01-12  1049  			cc_ext->nr_migrate_file_pages += compound_nr(page);
38935861d85a4d Zi Yan                  2020-11-13  1050  		nr_isolated += compound_nr(page);
748446bb6b5a93 Mel Gorman              2010-05-24  1051  
804d3121ba5f03 Mel Gorman              2019-03-05  1052  		/*
804d3121ba5f03 Mel Gorman              2019-03-05  1053  		 * Avoid isolating too much unless this block is being
cb2dcaf023c2cf Mel Gorman              2019-03-05  1054  		 * rescanned (e.g. dirty/writeback pages, parallel allocation)
cb2dcaf023c2cf Mel Gorman              2019-03-05  1055  		 * or a lock is contended. For contention, isolate quickly to
cb2dcaf023c2cf Mel Gorman              2019-03-05  1056  		 * potentially remove one source of contention.
804d3121ba5f03 Mel Gorman              2019-03-05  1057  		 */
38935861d85a4d Zi Yan                  2020-11-13  1058  		if (cc->nr_migratepages >= COMPACT_CLUSTER_MAX &&
cb2dcaf023c2cf Mel Gorman              2019-03-05  1059  		    !cc->rescan && !cc->contended) {
31b8384a555d94 Hillf Danton            2012-01-10  1060  			++low_pfn;
748446bb6b5a93 Mel Gorman              2010-05-24  1061  			break;
748446bb6b5a93 Mel Gorman              2010-05-24  1062  		}
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1063  
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1064  		continue;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1065  isolate_fail:
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1066  		if (!skip_on_failure)
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1067  			continue;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1068  
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1069  		/*
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1070  		 * We have isolated some pages, but then failed. Release them
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1071  		 * instead of migrating, as we cannot form the cc->order buddy
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1072  		 * page anyway.
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1073  		 */
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1074  		if (nr_isolated) {
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1075  			if (locked) {
f4b7e272b5c042 Andrey Ryabinin         2019-03-05  1076  				spin_unlock_irqrestore(&pgdat->lru_lock, flags);
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1077  				locked = false;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1078  			}
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1079  			putback_movable_pages(&cc->migratepages);
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1080  			cc->nr_migratepages = 0;
80f43853cdeeab Minchan Kim             2023-01-12  1081  			cc_ext->nr_migrate_file_pages = 0;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1082  			nr_isolated = 0;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1083  		}
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1084  
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1085  		if (low_pfn < next_skip_pfn) {
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1086  			low_pfn = next_skip_pfn - 1;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1087  			/*
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1088  			 * The check near the loop beginning would have updated
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1089  			 * next_skip_pfn too, but this is a bit simpler.
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1090  			 */
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1091  			next_skip_pfn += 1UL << cc->order;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1092  		}
31b8384a555d94 Hillf Danton            2012-01-10  1093  	}
748446bb6b5a93 Mel Gorman              2010-05-24  1094  
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1095  	/*
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1096  	 * The PageBuddy() check could have potentially brought us outside
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1097  	 * the range to be scanned.
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1098  	 */
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1099  	if (unlikely(low_pfn > end_pfn))
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1100  		low_pfn = end_pfn;
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1101  
e380bebe477154 Mel Gorman              2019-03-05  1102  isolate_abort:
c67fe3752abe6a Mel Gorman              2012-08-21  1103  	if (locked)
f4b7e272b5c042 Andrey Ryabinin         2019-03-05  1104  		spin_unlock_irqrestore(&pgdat->lru_lock, flags);
748446bb6b5a93 Mel Gorman              2010-05-24  1105  
50b5b094e683f8 Vlastimil Babka         2014-01-21  1106  	/*
804d3121ba5f03 Mel Gorman              2019-03-05  1107  	 * Updated the cached scanner pfn once the pageblock has been scanned
804d3121ba5f03 Mel Gorman              2019-03-05  1108  	 * Pages will either be migrated in which case there is no point
804d3121ba5f03 Mel Gorman              2019-03-05  1109  	 * scanning in the near future or migration failed in which case the
804d3121ba5f03 Mel Gorman              2019-03-05  1110  	 * failure reason may persist. The block is marked for skipping if
804d3121ba5f03 Mel Gorman              2019-03-05  1111  	 * there were no pages isolated in the block or if the block is
804d3121ba5f03 Mel Gorman              2019-03-05  1112  	 * rescanned twice in a row.
50b5b094e683f8 Vlastimil Babka         2014-01-21  1113  	 */
804d3121ba5f03 Mel Gorman              2019-03-05  1114  	if (low_pfn == end_pfn && (!nr_isolated || cc->rescan)) {
e380bebe477154 Mel Gorman              2019-03-05  1115  		if (valid_page && !skip_updated)
e380bebe477154 Mel Gorman              2019-03-05  1116  			set_pageblock_skip(valid_page);
e380bebe477154 Mel Gorman              2019-03-05  1117  		update_cached_migrate(cc, low_pfn);
e380bebe477154 Mel Gorman              2019-03-05  1118  	}
bb13ffeb9f6bfe Mel Gorman              2012-10-08  1119  
e34d85f0e3c60f Joonsoo Kim             2015-02-11  1120  	trace_mm_compaction_isolate_migratepages(start_pfn, low_pfn,
e34d85f0e3c60f Joonsoo Kim             2015-02-11  1121  						nr_scanned, nr_isolated);
b7aba6984dc048 Mel Gorman              2011-01-13  1122  
670105a25608af Mel Gorman              2019-08-02  1123  fatal_pending:
7f354a548d1cb6 David Rientjes          2017-02-22  1124  	cc->total_migrate_scanned += nr_scanned;
397487db696cae Mel Gorman              2012-10-19  1125  	if (nr_isolated)
010fc29a45a2e8 Minchan Kim             2012-12-20  1126  		count_compact_events(COMPACTISOLATED, nr_isolated);
397487db696cae Mel Gorman              2012-10-19  1127  
2fe86e00040761 Michal Nazarewicz       2012-01-30  1128  	return low_pfn;
2fe86e00040761 Michal Nazarewicz       2012-01-30  1129  }
2fe86e00040761 Michal Nazarewicz       2012-01-30  1130  

:::::: The code at line 829 was first introduced by commit
:::::: 748446bb6b5a9390b546af38ec899c868a9dbcf0 mm: compaction: memory compaction core

:::::: TO: Mel Gorman <mel@csn.ul.ie>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
