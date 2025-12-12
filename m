Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C2A2874FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765524762; cv=none; b=CI2DKiOrL3zfHoTrlWPH3j8aSPjjkjRrYBCvhHRlpJjVHA4aZEQPlhULrdmUhmFE4YgB+6eE9wRctLEg0cEwqWqGh9EknituqZQU+h1buluikqOIDjW86h/MJSVz4+NSVpW8h0O0Ms3qT7WIsJUA9cXknl2JsAWIxzazfdOFoPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765524762; c=relaxed/simple;
	bh=pz2LtZm2cuo+jT3U7njXt+xIP4441WFbYlEHWRk6+to=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=knG7l6KRG0/UqQYndaQp59oyg79KQiw2nPdXp0Ch6H1lkv1iMoUXgWr2hJ1Yi6mJfEy7lkbHTQH9bJEBVBFFRNNuA7KGjwif1fviaq7rGjzV/28aL8HXE3SrvYgQpiqdJUsW/LkM5bOl1I41aM2JT/zhmNaakJ6c4OERYQIzsqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBb+p5lI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBb+p5lI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765524761; x=1797060761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pz2LtZm2cuo+jT3U7njXt+xIP4441WFbYlEHWRk6+to=;
  b=OBb+p5lIOKo8aGzdOhodOz5d8QuCTjYV4hBk34snjL8M0pfYFV3hdP3I
   EV7ns0PAA5RYO9S5H4SocX11AJzozHLW4ClADw0Qx5BSuopQWs1zW83SG
   p3a4vEL/80JK/vjkOXaMXaXLReSPBldgAIfJqoobQSEBmA8boWlIquXfD
   IAzVLued5cdXRcSYLl2CvoTZWuJ5Ce1uuD7ybojX5Q3qaetoeSaZZHi1P
   42F/Hndsh5KSVsUNbrn6PBkCGVj62opORrlrJ+hH14TO77xc7K9nQ/sdb
   eVleKFBE7P0nSVopxSwIDazK0sIAM/QKjz9/hFf2sqQUj1Qnzp1dJrV4Y
   Q==;
X-CSE-ConnectionGUID: s3HEiX71TSeiU2g1allbIw==
X-CSE-MsgGUID: PsriGQGUQoq9TISdcMbb8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71382968"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="71382968"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 23:32:37 -0800
X-CSE-ConnectionGUID: z9EtAh8NRySvk1LToLHR7A==
X-CSE-MsgGUID: Y/V85z6kS3aJQm6VsS4nGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196299071"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2025 23:32:35 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTxdh-000000005jd-0lSX;
	Fri, 12 Dec 2025 07:32:33 +0000
Date: Fri, 12 Dec 2025 15:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1] mm/compaction.c:823: warning:
 Function parameter or member 'cc_ext' not described in
 'isolate_migratepages_block'
Message-ID: <202512121501.9fIYqWlm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Minchan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   65eb5a4a2e961a9252cefa9936c221b340ba0370
commit: a934b92361fdf9949ac55200051e3ef56deb22f4 [0/1] ANDROID: mm: do not allow file-backed pages from CMA
config: x86_64-buildonly-randconfig-004-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121501.9fIYqWlm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121501.9fIYqWlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121501.9fIYqWlm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/compaction.c:823: warning: Function parameter or member 'cc_ext' not described in 'isolate_migratepages_block'
>> mm/compaction.c:823: warning: Excess function parameter 'cc' description in 'isolate_migratepages_block'


vim +823 mm/compaction.c

748446bb6b5a93 Mel Gorman              2010-05-24   802  
2fe86e00040761 Michal Nazarewicz       2012-01-30   803  /**
edc2ca61249679 Vlastimil Babka         2014-10-09   804   * isolate_migratepages_block() - isolate all migrate-able pages within
edc2ca61249679 Vlastimil Babka         2014-10-09   805   *				  a single pageblock
2fe86e00040761 Michal Nazarewicz       2012-01-30   806   * @cc:		Compaction control structure.
edc2ca61249679 Vlastimil Babka         2014-10-09   807   * @low_pfn:	The first PFN to isolate
edc2ca61249679 Vlastimil Babka         2014-10-09   808   * @end_pfn:	The one-past-the-last PFN to isolate, within same pageblock
c5eda6029cf909 Hugh Dickins            2022-03-22   809   * @mode:	Isolation mode to be used.
2fe86e00040761 Michal Nazarewicz       2012-01-30   810   *
2fe86e00040761 Michal Nazarewicz       2012-01-30   811   * Isolate all pages that can be migrated from the range specified by
edc2ca61249679 Vlastimil Babka         2014-10-09   812   * [low_pfn, end_pfn). The range is expected to be within same pageblock.
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04   813   * Returns errno, like -EAGAIN or -EINTR in case e.g signal pending or congestion,
369fa227c21949 Oscar Salvador          2021-05-04   814   * -ENOMEM in case we could not allocate a page, or 0.
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04   815   * cc->migrate_pfn will contain the next pfn to scan.
2fe86e00040761 Michal Nazarewicz       2012-01-30   816   *
edc2ca61249679 Vlastimil Babka         2014-10-09   817   * The pages are isolated on cc->migratepages list (not required to be empty),
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04   818   * and cc->nr_migratepages is updated accordingly.
748446bb6b5a93 Mel Gorman              2010-05-24   819   */
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04   820  static int
a934b92361fdf9 Minchan Kim             2023-01-12   821  isolate_migratepages_block(struct compact_control_ext *cc_ext, unsigned long low_pfn,
c5eda6029cf909 Hugh Dickins            2022-03-22   822  			unsigned long end_pfn, isolate_mode_t mode)
748446bb6b5a93 Mel Gorman              2010-05-24  @823  {
a934b92361fdf9 Minchan Kim             2023-01-12   824  	struct compact_control *cc = cc_ext->cc;
5f438eee8f2e97 Andrey Ryabinin         2019-03-05   825  	pg_data_t *pgdat = cc->zone->zone_pgdat;
b7aba6984dc048 Mel Gorman              2011-01-13   826  	unsigned long nr_scanned = 0, nr_isolated = 0;
fa9add641b1b1c Hugh Dickins            2012-05-29   827  	struct lruvec *lruvec;
b8b2d825323633 Xiubo Li                2014-10-09   828  	unsigned long flags = 0;
6168d0da2b479c Alex Shi                2020-12-15   829  	struct lruvec *locked = NULL;
bb13ffeb9f6bfe Mel Gorman              2012-10-08   830  	struct page *page = NULL, *valid_page = NULL;
c5eda6029cf909 Hugh Dickins            2022-03-22   831  	struct address_space *mapping;
e34d85f0e3c60f Joonsoo Kim             2015-02-11   832  	unsigned long start_pfn = low_pfn;
fdd048e12c9a46 Vlastimil Babka         2016-05-19   833  	bool skip_on_failure = false;
fdd048e12c9a46 Vlastimil Babka         2016-05-19   834  	unsigned long next_skip_pfn = 0;
e380bebe477154 Mel Gorman              2019-03-05   835  	bool skip_updated = false;
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04   836  	int ret = 0;
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04   837  
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04   838  	cc->migrate_pfn = low_pfn;
748446bb6b5a93 Mel Gorman              2010-05-24   839  
748446bb6b5a93 Mel Gorman              2010-05-24   840  	/*
748446bb6b5a93 Mel Gorman              2010-05-24   841  	 * Ensure that there are not too many pages isolated from the LRU
748446bb6b5a93 Mel Gorman              2010-05-24   842  	 * list by either parallel reclaimers or compaction. If there are,
748446bb6b5a93 Mel Gorman              2010-05-24   843  	 * delay for some time until fewer pages are isolated
748446bb6b5a93 Mel Gorman              2010-05-24   844  	 */
5f438eee8f2e97 Andrey Ryabinin         2019-03-05   845  	while (unlikely(too_many_isolated(pgdat))) {
d20bdd571ee5c9 Zi Yan                  2020-11-13   846  		/* stop isolation if there are still pages not migrated */
d20bdd571ee5c9 Zi Yan                  2020-11-13   847  		if (cc->nr_migratepages)
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04   848  			return -EAGAIN;
d20bdd571ee5c9 Zi Yan                  2020-11-13   849  
f9e35b3b41f47c Mel Gorman              2011-06-15   850  		/* async migration should just abort */
e0b9daeb453e60 David Rientjes          2014-06-04   851  		if (cc->mode == MIGRATE_ASYNC)
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04   852  			return -EAGAIN;
f9e35b3b41f47c Mel Gorman              2011-06-15   853  
748446bb6b5a93 Mel Gorman              2010-05-24   854  		congestion_wait(BLK_RW_ASYNC, HZ/10);
748446bb6b5a93 Mel Gorman              2010-05-24   855  
748446bb6b5a93 Mel Gorman              2010-05-24   856  		if (fatal_signal_pending(current))
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04   857  			return -EINTR;
748446bb6b5a93 Mel Gorman              2010-05-24   858  	}
748446bb6b5a93 Mel Gorman              2010-05-24   859  
cf66f0700c8f1d Mel Gorman              2019-03-05   860  	cond_resched();
aeef4b83806f49 David Rientjes          2014-06-04   861  
fdd048e12c9a46 Vlastimil Babka         2016-05-19   862  	if (cc->direct_compaction && (cc->mode == MIGRATE_ASYNC)) {
fdd048e12c9a46 Vlastimil Babka         2016-05-19   863  		skip_on_failure = true;
fdd048e12c9a46 Vlastimil Babka         2016-05-19   864  		next_skip_pfn = block_end_pfn(low_pfn, cc->order);
fdd048e12c9a46 Vlastimil Babka         2016-05-19   865  	}
fdd048e12c9a46 Vlastimil Babka         2016-05-19   866  
748446bb6b5a93 Mel Gorman              2010-05-24   867  	/* Time to isolate some pages for migration */
748446bb6b5a93 Mel Gorman              2010-05-24   868  	for (; low_pfn < end_pfn; low_pfn++) {
29c0dde830f8c0 Vlastimil Babka         2015-09-08   869  
fdd048e12c9a46 Vlastimil Babka         2016-05-19   870  		if (skip_on_failure && low_pfn >= next_skip_pfn) {
fdd048e12c9a46 Vlastimil Babka         2016-05-19   871  			/*
fdd048e12c9a46 Vlastimil Babka         2016-05-19   872  			 * We have isolated all migration candidates in the
fdd048e12c9a46 Vlastimil Babka         2016-05-19   873  			 * previous order-aligned block, and did not skip it due
fdd048e12c9a46 Vlastimil Babka         2016-05-19   874  			 * to failure. We should migrate the pages now and
fdd048e12c9a46 Vlastimil Babka         2016-05-19   875  			 * hopefully succeed compaction.
fdd048e12c9a46 Vlastimil Babka         2016-05-19   876  			 */
fdd048e12c9a46 Vlastimil Babka         2016-05-19   877  			if (nr_isolated)
fdd048e12c9a46 Vlastimil Babka         2016-05-19   878  				break;
fdd048e12c9a46 Vlastimil Babka         2016-05-19   879  
fdd048e12c9a46 Vlastimil Babka         2016-05-19   880  			/*
fdd048e12c9a46 Vlastimil Babka         2016-05-19   881  			 * We failed to isolate in the previous order-aligned
fdd048e12c9a46 Vlastimil Babka         2016-05-19   882  			 * block. Set the new boundary to the end of the
fdd048e12c9a46 Vlastimil Babka         2016-05-19   883  			 * current block. Note we can't simply increase
fdd048e12c9a46 Vlastimil Babka         2016-05-19   884  			 * next_skip_pfn by 1 << order, as low_pfn might have
fdd048e12c9a46 Vlastimil Babka         2016-05-19   885  			 * been incremented by a higher number due to skipping
fdd048e12c9a46 Vlastimil Babka         2016-05-19   886  			 * a compound or a high-order buddy page in the
fdd048e12c9a46 Vlastimil Babka         2016-05-19   887  			 * previous loop iteration.
fdd048e12c9a46 Vlastimil Babka         2016-05-19   888  			 */
fdd048e12c9a46 Vlastimil Babka         2016-05-19   889  			next_skip_pfn = block_end_pfn(low_pfn, cc->order);
fdd048e12c9a46 Vlastimil Babka         2016-05-19   890  		}
fdd048e12c9a46 Vlastimil Babka         2016-05-19   891  
8b44d2791f9125 Vlastimil Babka         2014-10-09   892  		/*
8b44d2791f9125 Vlastimil Babka         2014-10-09   893  		 * Periodically drop the lock (if held) regardless of its
670105a25608af Mel Gorman              2019-08-02   894  		 * contention, to give chance to IRQs. Abort completely if
670105a25608af Mel Gorman              2019-08-02   895  		 * a fatal signal is pending.
8b44d2791f9125 Vlastimil Babka         2014-10-09   896  		 */
6168d0da2b479c Alex Shi                2020-12-15   897  		if (!(low_pfn % SWAP_CLUSTER_MAX)) {
6168d0da2b479c Alex Shi                2020-12-15   898  			if (locked) {
6168d0da2b479c Alex Shi                2020-12-15   899  				unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479c Alex Shi                2020-12-15   900  				locked = NULL;
6168d0da2b479c Alex Shi                2020-12-15   901  			}
6168d0da2b479c Alex Shi                2020-12-15   902  
6168d0da2b479c Alex Shi                2020-12-15   903  			if (fatal_signal_pending(current)) {
6168d0da2b479c Alex Shi                2020-12-15   904  				cc->contended = true;
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04   905  				ret = -EINTR;
6168d0da2b479c Alex Shi                2020-12-15   906  
670105a25608af Mel Gorman              2019-08-02   907  				goto fatal_pending;
670105a25608af Mel Gorman              2019-08-02   908  			}
b2eef8c0d09101 Andrea Arcangeli        2011-03-22   909  
6168d0da2b479c Alex Shi                2020-12-15   910  			cond_resched();
6168d0da2b479c Alex Shi                2020-12-15   911  		}
6168d0da2b479c Alex Shi                2020-12-15   912  
b7aba6984dc048 Mel Gorman              2011-01-13   913  		nr_scanned++;
748446bb6b5a93 Mel Gorman              2010-05-24   914  
748446bb6b5a93 Mel Gorman              2010-05-24   915  		page = pfn_to_page(low_pfn);
dc9086004b3d5d Mel Gorman              2012-02-08   916  
e380bebe477154 Mel Gorman              2019-03-05   917  		/*
e380bebe477154 Mel Gorman              2019-03-05   918  		 * Check if the pageblock has already been marked skipped.
e380bebe477154 Mel Gorman              2019-03-05   919  		 * Only the aligned PFN is checked as the caller isolates
e380bebe477154 Mel Gorman              2019-03-05   920  		 * COMPACT_CLUSTER_MAX at a time so the second call must
e380bebe477154 Mel Gorman              2019-03-05   921  		 * not falsely conclude that the block should be skipped.
e380bebe477154 Mel Gorman              2019-03-05   922  		 */
e380bebe477154 Mel Gorman              2019-03-05   923  		if (!valid_page && IS_ALIGNED(low_pfn, pageblock_nr_pages)) {
e380bebe477154 Mel Gorman              2019-03-05   924  			if (!cc->ignore_skip_hint && get_pageblock_skip(page)) {
e380bebe477154 Mel Gorman              2019-03-05   925  				low_pfn = end_pfn;
9df41314390b81 Alex Shi                2020-12-15   926  				page = NULL;
e380bebe477154 Mel Gorman              2019-03-05   927  				goto isolate_abort;
e380bebe477154 Mel Gorman              2019-03-05   928  			}
bb13ffeb9f6bfe Mel Gorman              2012-10-08   929  			valid_page = page;
e380bebe477154 Mel Gorman              2019-03-05   930  		}
bb13ffeb9f6bfe Mel Gorman              2012-10-08   931  
369fa227c21949 Oscar Salvador          2021-05-04   932  		if (PageHuge(page) && cc->alloc_contig) {
ae37c7ff79f1f0 Oscar Salvador          2021-05-04   933  			ret = isolate_or_dissolve_huge_page(page, &cc->migratepages);
369fa227c21949 Oscar Salvador          2021-05-04   934  
369fa227c21949 Oscar Salvador          2021-05-04   935  			/*
369fa227c21949 Oscar Salvador          2021-05-04   936  			 * Fail isolation in case isolate_or_dissolve_huge_page()
369fa227c21949 Oscar Salvador          2021-05-04   937  			 * reports an error. In case of -ENOMEM, abort right away.
369fa227c21949 Oscar Salvador          2021-05-04   938  			 */
369fa227c21949 Oscar Salvador          2021-05-04   939  			if (ret < 0) {
369fa227c21949 Oscar Salvador          2021-05-04   940  				 /* Do not report -EBUSY down the chain */
369fa227c21949 Oscar Salvador          2021-05-04   941  				if (ret == -EBUSY)
369fa227c21949 Oscar Salvador          2021-05-04   942  					ret = 0;
369fa227c21949 Oscar Salvador          2021-05-04   943  				low_pfn += (1UL << compound_order(page)) - 1;
369fa227c21949 Oscar Salvador          2021-05-04   944  				goto isolate_fail;
369fa227c21949 Oscar Salvador          2021-05-04   945  			}
369fa227c21949 Oscar Salvador          2021-05-04   946  
ae37c7ff79f1f0 Oscar Salvador          2021-05-04   947  			if (PageHuge(page)) {
ae37c7ff79f1f0 Oscar Salvador          2021-05-04   948  				/*
ae37c7ff79f1f0 Oscar Salvador          2021-05-04   949  				 * Hugepage was successfully isolated and placed
ae37c7ff79f1f0 Oscar Salvador          2021-05-04   950  				 * on the cc->migratepages list.
ae37c7ff79f1f0 Oscar Salvador          2021-05-04   951  				 */
ae37c7ff79f1f0 Oscar Salvador          2021-05-04   952  				low_pfn += compound_nr(page) - 1;
ae37c7ff79f1f0 Oscar Salvador          2021-05-04   953  				goto isolate_success_no_list;
ae37c7ff79f1f0 Oscar Salvador          2021-05-04   954  			}
ae37c7ff79f1f0 Oscar Salvador          2021-05-04   955  
369fa227c21949 Oscar Salvador          2021-05-04   956  			/*
369fa227c21949 Oscar Salvador          2021-05-04   957  			 * Ok, the hugepage was dissolved. Now these pages are
369fa227c21949 Oscar Salvador          2021-05-04   958  			 * Buddy and cannot be re-allocated because they are
369fa227c21949 Oscar Salvador          2021-05-04   959  			 * isolated. Fall-through as the check below handles
369fa227c21949 Oscar Salvador          2021-05-04   960  			 * Buddy pages.
369fa227c21949 Oscar Salvador          2021-05-04   961  			 */
369fa227c21949 Oscar Salvador          2021-05-04   962  		}
369fa227c21949 Oscar Salvador          2021-05-04   963  
c122b2087ab941 Joonsoo Kim             2014-04-07   964  		/*
99c0fd5e51c447 Vlastimil Babka         2014-10-09   965  		 * Skip if free. We read page order here without zone lock
99c0fd5e51c447 Vlastimil Babka         2014-10-09   966  		 * which is generally unsafe, but the race window is small and
99c0fd5e51c447 Vlastimil Babka         2014-10-09   967  		 * the worst thing that can happen is that we skip some
99c0fd5e51c447 Vlastimil Babka         2014-10-09   968  		 * potential isolation targets.
99c0fd5e51c447 Vlastimil Babka         2014-10-09   969  		 */
99c0fd5e51c447 Vlastimil Babka         2014-10-09   970  		if (PageBuddy(page)) {
ab130f9108dcf2 Matthew Wilcox (Oracle  2020-10-15   971) 			unsigned long freepage_order = buddy_order_unsafe(page);
99c0fd5e51c447 Vlastimil Babka         2014-10-09   972  
99c0fd5e51c447 Vlastimil Babka         2014-10-09   973  			/*
99c0fd5e51c447 Vlastimil Babka         2014-10-09   974  			 * Without lock, we cannot be sure that what we got is
99c0fd5e51c447 Vlastimil Babka         2014-10-09   975  			 * a valid page order. Consider only values in the
99c0fd5e51c447 Vlastimil Babka         2014-10-09   976  			 * valid order range to prevent low_pfn overflow.
c122b2087ab941 Joonsoo Kim             2014-04-07   977  			 */
99c0fd5e51c447 Vlastimil Babka         2014-10-09   978  			if (freepage_order > 0 && freepage_order < MAX_ORDER)
99c0fd5e51c447 Vlastimil Babka         2014-10-09   979  				low_pfn += (1UL << freepage_order) - 1;
c122b2087ab941 Joonsoo Kim             2014-04-07   980  			continue;
99c0fd5e51c447 Vlastimil Babka         2014-10-09   981  		}
9927af740b1b9b Mel Gorman              2011-01-13   982  
bc835011afbea3 Andrea Arcangeli        2011-01-13   983  		/*
29c0dde830f8c0 Vlastimil Babka         2015-09-08   984  		 * Regardless of being on LRU, compound pages such as THP and
1da2f328fa643b Rik van Riel            2020-04-01   985  		 * hugetlbfs are not to be compacted unless we are attempting
1da2f328fa643b Rik van Riel            2020-04-01   986  		 * an allocation much larger than the huge page size (eg CMA).
1da2f328fa643b Rik van Riel            2020-04-01   987  		 * We can potentially save a lot of iterations if we skip them
1da2f328fa643b Rik van Riel            2020-04-01   988  		 * at once. The check is racy, but we can consider only valid
1da2f328fa643b Rik van Riel            2020-04-01   989  		 * values and the only danger is skipping too much.
bc835011afbea3 Andrea Arcangeli        2011-01-13   990  		 */
1da2f328fa643b Rik van Riel            2020-04-01   991  		if (PageCompound(page) && !cc->alloc_contig) {
21dc7e023611fb David Rientjes          2017-11-17   992  			const unsigned int order = compound_order(page);
edc2ca61249679 Vlastimil Babka         2014-10-09   993  
d3c85bad89b915 Vlastimil Babka         2017-11-17   994  			if (likely(order < MAX_ORDER))
21dc7e023611fb David Rientjes          2017-11-17   995  				low_pfn += (1UL << order) - 1;
fdd048e12c9a46 Vlastimil Babka         2016-05-19   996  			goto isolate_fail;
2a1402aa044b55 Mel Gorman              2012-10-08   997  		}
2a1402aa044b55 Mel Gorman              2012-10-08   998  
bda807d4445414 Minchan Kim             2016-07-26   999  		/*
bda807d4445414 Minchan Kim             2016-07-26  1000  		 * Check may be lockless but that's ok as we recheck later.
bda807d4445414 Minchan Kim             2016-07-26  1001  		 * It's possible to migrate LRU and non-lru movable pages.
bda807d4445414 Minchan Kim             2016-07-26  1002  		 * Skip any other type of page
bda807d4445414 Minchan Kim             2016-07-26  1003  		 */
bda807d4445414 Minchan Kim             2016-07-26  1004  		if (!PageLRU(page)) {
bda807d4445414 Minchan Kim             2016-07-26  1005  			/*
bda807d4445414 Minchan Kim             2016-07-26  1006  			 * __PageMovable can return false positive so we need
bda807d4445414 Minchan Kim             2016-07-26  1007  			 * to verify it under page_lock.
bda807d4445414 Minchan Kim             2016-07-26  1008  			 */
bda807d4445414 Minchan Kim             2016-07-26  1009  			if (unlikely(__PageMovable(page)) &&
bda807d4445414 Minchan Kim             2016-07-26  1010  					!PageIsolated(page)) {
bda807d4445414 Minchan Kim             2016-07-26  1011  				if (locked) {
6168d0da2b479c Alex Shi                2020-12-15  1012  					unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479c Alex Shi                2020-12-15  1013  					locked = NULL;
bda807d4445414 Minchan Kim             2016-07-26  1014  				}
bda807d4445414 Minchan Kim             2016-07-26  1015  
c5eda6029cf909 Hugh Dickins            2022-03-22  1016  				if (!isolate_movable_page(page, mode))
bda807d4445414 Minchan Kim             2016-07-26  1017  					goto isolate_success;
bda807d4445414 Minchan Kim             2016-07-26  1018  			}
bda807d4445414 Minchan Kim             2016-07-26  1019  
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1020  			goto isolate_fail;
bda807d4445414 Minchan Kim             2016-07-26  1021  		}
29c0dde830f8c0 Vlastimil Babka         2015-09-08  1022  
b951ab4b35ba15 Gavin Shan              2022-11-24  1023  		/*
b951ab4b35ba15 Gavin Shan              2022-11-24  1024  		 * Be careful not to clear PageLRU until after we're
b951ab4b35ba15 Gavin Shan              2022-11-24  1025  		 * sure the page is not being freed elsewhere -- the
b951ab4b35ba15 Gavin Shan              2022-11-24  1026  		 * page release code relies on it.
b951ab4b35ba15 Gavin Shan              2022-11-24  1027  		 */
b951ab4b35ba15 Gavin Shan              2022-11-24  1028  		if (unlikely(!get_page_unless_zero(page)))
b951ab4b35ba15 Gavin Shan              2022-11-24  1029  			goto isolate_fail;
b951ab4b35ba15 Gavin Shan              2022-11-24  1030  
119d6d59dcc098 David Rientjes          2014-04-03  1031  		/*
119d6d59dcc098 David Rientjes          2014-04-03  1032  		 * Migration will fail if an anonymous page is pinned in memory,
119d6d59dcc098 David Rientjes          2014-04-03  1033  		 * so avoid taking lru_lock and isolating it unnecessarily in an
119d6d59dcc098 David Rientjes          2014-04-03  1034  		 * admittedly racy check.
119d6d59dcc098 David Rientjes          2014-04-03  1035  		 */
c5eda6029cf909 Hugh Dickins            2022-03-22  1036  		mapping = page_mapping(page);
b951ab4b35ba15 Gavin Shan              2022-11-24  1037  		if (!mapping && (page_count(page) - 1) > total_mapcount(page))
b951ab4b35ba15 Gavin Shan              2022-11-24  1038  			goto isolate_fail_put;
119d6d59dcc098 David Rientjes          2014-04-03  1039  
73e64c51afc56d Michal Hocko            2016-12-14  1040  		/*
73e64c51afc56d Michal Hocko            2016-12-14  1041  		 * Only allow to migrate anonymous pages in GFP_NOFS context
73e64c51afc56d Michal Hocko            2016-12-14  1042  		 * because those do not depend on fs locks.
73e64c51afc56d Michal Hocko            2016-12-14  1043  		 */
c5eda6029cf909 Hugh Dickins            2022-03-22  1044  		if (!(cc->gfp_mask & __GFP_FS) && mapping)
b951ab4b35ba15 Gavin Shan              2022-11-24  1045  			goto isolate_fail_put;
9df41314390b81 Alex Shi                2020-12-15  1046  
c5eda6029cf909 Hugh Dickins            2022-03-22  1047  		/* Only take pages on LRU: a check now makes later tests safe */
c5eda6029cf909 Hugh Dickins            2022-03-22  1048  		if (!PageLRU(page))
9df41314390b81 Alex Shi                2020-12-15  1049  			goto isolate_fail_put;
9df41314390b81 Alex Shi                2020-12-15  1050  
c5eda6029cf909 Hugh Dickins            2022-03-22  1051  		/* Compaction might skip unevictable pages but CMA takes them */
c5eda6029cf909 Hugh Dickins            2022-03-22  1052  		if (!(mode & ISOLATE_UNEVICTABLE) && PageUnevictable(page))
c5eda6029cf909 Hugh Dickins            2022-03-22  1053  			goto isolate_fail_put;
73e64c51afc56d Michal Hocko            2016-12-14  1054  
9df41314390b81 Alex Shi                2020-12-15  1055  		/*
c5eda6029cf909 Hugh Dickins            2022-03-22  1056  		 * To minimise LRU disruption, the caller can indicate with
c5eda6029cf909 Hugh Dickins            2022-03-22  1057  		 * ISOLATE_ASYNC_MIGRATE that it only wants to isolate pages
c5eda6029cf909 Hugh Dickins            2022-03-22  1058  		 * it will be able to migrate without blocking - clean pages
c5eda6029cf909 Hugh Dickins            2022-03-22  1059  		 * for the most part.  PageWriteback would require blocking.
9df41314390b81 Alex Shi                2020-12-15  1060  		 */
c5eda6029cf909 Hugh Dickins            2022-03-22  1061  		if ((mode & ISOLATE_ASYNC_MIGRATE) && PageWriteback(page))
c5eda6029cf909 Hugh Dickins            2022-03-22  1062  			goto isolate_fail_put;
9df41314390b81 Alex Shi                2020-12-15  1063  
c5eda6029cf909 Hugh Dickins            2022-03-22  1064  		if ((mode & ISOLATE_ASYNC_MIGRATE) && PageDirty(page)) {
c5eda6029cf909 Hugh Dickins            2022-03-22  1065  			bool migrate_dirty;
c5eda6029cf909 Hugh Dickins            2022-03-22  1066  
c5eda6029cf909 Hugh Dickins            2022-03-22  1067  			/*
c5eda6029cf909 Hugh Dickins            2022-03-22  1068  			 * Only pages without mappings or that have a
c5eda6029cf909 Hugh Dickins            2022-03-22  1069  			 * ->migratepage callback are possible to migrate
c5eda6029cf909 Hugh Dickins            2022-03-22  1070  			 * without blocking. However, we can be racing with
c5eda6029cf909 Hugh Dickins            2022-03-22  1071  			 * truncation so it's necessary to lock the page
c5eda6029cf909 Hugh Dickins            2022-03-22  1072  			 * to stabilise the mapping as truncation holds
c5eda6029cf909 Hugh Dickins            2022-03-22  1073  			 * the page lock until after the page is removed
c5eda6029cf909 Hugh Dickins            2022-03-22  1074  			 * from the page cache.
c5eda6029cf909 Hugh Dickins            2022-03-22  1075  			 */
c5eda6029cf909 Hugh Dickins            2022-03-22  1076  			if (!trylock_page(page))
9df41314390b81 Alex Shi                2020-12-15  1077  				goto isolate_fail_put;
9df41314390b81 Alex Shi                2020-12-15  1078  
c5eda6029cf909 Hugh Dickins            2022-03-22  1079  			mapping = page_mapping(page);
c5eda6029cf909 Hugh Dickins            2022-03-22  1080  			migrate_dirty = !mapping || mapping->a_ops->migratepage;
c5eda6029cf909 Hugh Dickins            2022-03-22  1081  			unlock_page(page);
c5eda6029cf909 Hugh Dickins            2022-03-22  1082  			if (!migrate_dirty)
c5eda6029cf909 Hugh Dickins            2022-03-22  1083  				goto isolate_fail_put;
c5eda6029cf909 Hugh Dickins            2022-03-22  1084  		}
c5eda6029cf909 Hugh Dickins            2022-03-22  1085  
9df41314390b81 Alex Shi                2020-12-15  1086  		/* Try isolate the page */
9df41314390b81 Alex Shi                2020-12-15  1087  		if (!TestClearPageLRU(page))
9df41314390b81 Alex Shi                2020-12-15  1088  			goto isolate_fail_put;
9df41314390b81 Alex Shi                2020-12-15  1089  
a984226f457f84 Muchun Song             2021-06-28  1090  		lruvec = mem_cgroup_page_lruvec(page);
6168d0da2b479c Alex Shi                2020-12-15  1091  
69b7189f12e006 Vlastimil Babka         2014-10-09  1092  		/* If we already hold the lock, we can skip some rechecking */
6168d0da2b479c Alex Shi                2020-12-15  1093  		if (lruvec != locked) {
6168d0da2b479c Alex Shi                2020-12-15  1094  			if (locked)
6168d0da2b479c Alex Shi                2020-12-15  1095  				unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479c Alex Shi                2020-12-15  1096  
6168d0da2b479c Alex Shi                2020-12-15  1097  			compact_lock_irqsave(&lruvec->lru_lock, &flags, cc);
6168d0da2b479c Alex Shi                2020-12-15  1098  			locked = lruvec;
6168d0da2b479c Alex Shi                2020-12-15  1099  
6168d0da2b479c Alex Shi                2020-12-15  1100  			lruvec_memcg_debug(lruvec, page);
e380bebe477154 Mel Gorman              2019-03-05  1101  
e380bebe477154 Mel Gorman              2019-03-05  1102  			/* Try get exclusive access under lock */
e380bebe477154 Mel Gorman              2019-03-05  1103  			if (!skip_updated) {
e380bebe477154 Mel Gorman              2019-03-05  1104  				skip_updated = true;
e380bebe477154 Mel Gorman              2019-03-05  1105  				if (test_and_set_skip(cc, page, low_pfn))
e380bebe477154 Mel Gorman              2019-03-05  1106  					goto isolate_abort;
e380bebe477154 Mel Gorman              2019-03-05  1107  			}
2a1402aa044b55 Mel Gorman              2012-10-08  1108  
29c0dde830f8c0 Vlastimil Babka         2015-09-08  1109  			/*
29c0dde830f8c0 Vlastimil Babka         2015-09-08  1110  			 * Page become compound since the non-locked check,
29c0dde830f8c0 Vlastimil Babka         2015-09-08  1111  			 * and it's on LRU. It can only be a THP so the order
29c0dde830f8c0 Vlastimil Babka         2015-09-08  1112  			 * is safe to read and it's 0 for tail pages.
29c0dde830f8c0 Vlastimil Babka         2015-09-08  1113  			 */
1da2f328fa643b Rik van Riel            2020-04-01  1114  			if (unlikely(PageCompound(page) && !cc->alloc_contig)) {
d8c6546b1aea84 Matthew Wilcox (Oracle  2019-09-23  1115) 				low_pfn += compound_nr(page) - 1;
9df41314390b81 Alex Shi                2020-12-15  1116  				SetPageLRU(page);
9df41314390b81 Alex Shi                2020-12-15  1117  				goto isolate_fail_put;
bc835011afbea3 Andrea Arcangeli        2011-01-13  1118  			}
d99fd5feb0ac1d Alex Shi                2021-02-24  1119  		}
fa9add641b1b1c Hugh Dickins            2012-05-29  1120  
1da2f328fa643b Rik van Riel            2020-04-01  1121  		/* The whole page is taken off the LRU; skip the tail pages. */
1da2f328fa643b Rik van Riel            2020-04-01  1122  		if (PageCompound(page))
1da2f328fa643b Rik van Riel            2020-04-01  1123  			low_pfn += compound_nr(page) - 1;
bc835011afbea3 Andrea Arcangeli        2011-01-13  1124  
748446bb6b5a93 Mel Gorman              2010-05-24  1125  		/* Successfully isolated */
46ae6b2cc2a479 Yu Zhao                 2021-02-24  1126  		del_page_from_lru_list(page, lruvec);
1da2f328fa643b Rik van Riel            2020-04-01  1127  		mod_node_page_state(page_pgdat(page),
9de4f22a60f731 Huang Ying              2020-04-06  1128  				NR_ISOLATED_ANON + page_is_file_lru(page),
6c357848b44b40 Matthew Wilcox (Oracle  2020-08-14  1129) 				thp_nr_pages(page));
b6c750163c0d13 Joonsoo Kim             2014-04-07  1130  
b6c750163c0d13 Joonsoo Kim             2014-04-07  1131  isolate_success:
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1132  		list_add(&page->lru, &cc->migratepages);
ae37c7ff79f1f0 Oscar Salvador          2021-05-04  1133  isolate_success_no_list:
38935861d85a4d Zi Yan                  2020-11-13  1134  		cc->nr_migratepages += compound_nr(page);
a934b92361fdf9 Minchan Kim             2023-01-12  1135  		if (!PageAnon(page))
a934b92361fdf9 Minchan Kim             2023-01-12  1136  			cc_ext->nr_migrate_file_pages += compound_nr(page);
38935861d85a4d Zi Yan                  2020-11-13  1137  		nr_isolated += compound_nr(page);
748446bb6b5a93 Mel Gorman              2010-05-24  1138  
804d3121ba5f03 Mel Gorman              2019-03-05  1139  		/*
804d3121ba5f03 Mel Gorman              2019-03-05  1140  		 * Avoid isolating too much unless this block is being
cb2dcaf023c2cf Mel Gorman              2019-03-05  1141  		 * rescanned (e.g. dirty/writeback pages, parallel allocation)
cb2dcaf023c2cf Mel Gorman              2019-03-05  1142  		 * or a lock is contended. For contention, isolate quickly to
cb2dcaf023c2cf Mel Gorman              2019-03-05  1143  		 * potentially remove one source of contention.
804d3121ba5f03 Mel Gorman              2019-03-05  1144  		 */
38935861d85a4d Zi Yan                  2020-11-13  1145  		if (cc->nr_migratepages >= COMPACT_CLUSTER_MAX &&
cb2dcaf023c2cf Mel Gorman              2019-03-05  1146  		    !cc->rescan && !cc->contended) {
31b8384a555d94 Hillf Danton            2012-01-10  1147  			++low_pfn;
748446bb6b5a93 Mel Gorman              2010-05-24  1148  			break;
748446bb6b5a93 Mel Gorman              2010-05-24  1149  		}
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1150  
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1151  		continue;
9df41314390b81 Alex Shi                2020-12-15  1152  
9df41314390b81 Alex Shi                2020-12-15  1153  isolate_fail_put:
9df41314390b81 Alex Shi                2020-12-15  1154  		/* Avoid potential deadlock in freeing page under lru_lock */
9df41314390b81 Alex Shi                2020-12-15  1155  		if (locked) {
6168d0da2b479c Alex Shi                2020-12-15  1156  			unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479c Alex Shi                2020-12-15  1157  			locked = NULL;
9df41314390b81 Alex Shi                2020-12-15  1158  		}
9df41314390b81 Alex Shi                2020-12-15  1159  		put_page(page);
9df41314390b81 Alex Shi                2020-12-15  1160  
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1161  isolate_fail:
369fa227c21949 Oscar Salvador          2021-05-04  1162  		if (!skip_on_failure && ret != -ENOMEM)
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1163  			continue;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1164  
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1165  		/*
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1166  		 * We have isolated some pages, but then failed. Release them
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1167  		 * instead of migrating, as we cannot form the cc->order buddy
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1168  		 * page anyway.
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1169  		 */
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1170  		if (nr_isolated) {
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1171  			if (locked) {
6168d0da2b479c Alex Shi                2020-12-15  1172  				unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479c Alex Shi                2020-12-15  1173  				locked = NULL;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1174  			}
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1175  			putback_movable_pages(&cc->migratepages);
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1176  			cc->nr_migratepages = 0;
a934b92361fdf9 Minchan Kim             2023-01-12  1177  			cc_ext->nr_migrate_file_pages = 0;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1178  			nr_isolated = 0;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1179  		}
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1180  
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1181  		if (low_pfn < next_skip_pfn) {
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1182  			low_pfn = next_skip_pfn - 1;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1183  			/*
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1184  			 * The check near the loop beginning would have updated
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1185  			 * next_skip_pfn too, but this is a bit simpler.
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1186  			 */
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1187  			next_skip_pfn += 1UL << cc->order;
fdd048e12c9a46 Vlastimil Babka         2016-05-19  1188  		}
369fa227c21949 Oscar Salvador          2021-05-04  1189  
369fa227c21949 Oscar Salvador          2021-05-04  1190  		if (ret == -ENOMEM)
369fa227c21949 Oscar Salvador          2021-05-04  1191  			break;
31b8384a555d94 Hillf Danton            2012-01-10  1192  	}
748446bb6b5a93 Mel Gorman              2010-05-24  1193  
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1194  	/*
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1195  	 * The PageBuddy() check could have potentially brought us outside
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1196  	 * the range to be scanned.
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1197  	 */
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1198  	if (unlikely(low_pfn > end_pfn))
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1199  		low_pfn = end_pfn;
99c0fd5e51c447 Vlastimil Babka         2014-10-09  1200  
9df41314390b81 Alex Shi                2020-12-15  1201  	page = NULL;
9df41314390b81 Alex Shi                2020-12-15  1202  
e380bebe477154 Mel Gorman              2019-03-05  1203  isolate_abort:
c67fe3752abe6a Mel Gorman              2012-08-21  1204  	if (locked)
6168d0da2b479c Alex Shi                2020-12-15  1205  		unlock_page_lruvec_irqrestore(locked, flags);
9df41314390b81 Alex Shi                2020-12-15  1206  	if (page) {
9df41314390b81 Alex Shi                2020-12-15  1207  		SetPageLRU(page);
9df41314390b81 Alex Shi                2020-12-15  1208  		put_page(page);
9df41314390b81 Alex Shi                2020-12-15  1209  	}
748446bb6b5a93 Mel Gorman              2010-05-24  1210  
50b5b094e683f8 Vlastimil Babka         2014-01-21  1211  	/*
804d3121ba5f03 Mel Gorman              2019-03-05  1212  	 * Updated the cached scanner pfn once the pageblock has been scanned
804d3121ba5f03 Mel Gorman              2019-03-05  1213  	 * Pages will either be migrated in which case there is no point
804d3121ba5f03 Mel Gorman              2019-03-05  1214  	 * scanning in the near future or migration failed in which case the
804d3121ba5f03 Mel Gorman              2019-03-05  1215  	 * failure reason may persist. The block is marked for skipping if
804d3121ba5f03 Mel Gorman              2019-03-05  1216  	 * there were no pages isolated in the block or if the block is
804d3121ba5f03 Mel Gorman              2019-03-05  1217  	 * rescanned twice in a row.
50b5b094e683f8 Vlastimil Babka         2014-01-21  1218  	 */
804d3121ba5f03 Mel Gorman              2019-03-05  1219  	if (low_pfn == end_pfn && (!nr_isolated || cc->rescan)) {
e380bebe477154 Mel Gorman              2019-03-05  1220  		if (valid_page && !skip_updated)
e380bebe477154 Mel Gorman              2019-03-05  1221  			set_pageblock_skip(valid_page);
e380bebe477154 Mel Gorman              2019-03-05  1222  		update_cached_migrate(cc, low_pfn);
e380bebe477154 Mel Gorman              2019-03-05  1223  	}
bb13ffeb9f6bfe Mel Gorman              2012-10-08  1224  
e34d85f0e3c60f Joonsoo Kim             2015-02-11  1225  	trace_mm_compaction_isolate_migratepages(start_pfn, low_pfn,
e34d85f0e3c60f Joonsoo Kim             2015-02-11  1226  						nr_scanned, nr_isolated);
b7aba6984dc048 Mel Gorman              2011-01-13  1227  
670105a25608af Mel Gorman              2019-08-02  1228  fatal_pending:
7f354a548d1cb6 David Rientjes          2017-02-22  1229  	cc->total_migrate_scanned += nr_scanned;
397487db696cae Mel Gorman              2012-10-19  1230  	if (nr_isolated)
010fc29a45a2e8 Minchan Kim             2012-12-20  1231  		count_compact_events(COMPACTISOLATED, nr_isolated);
397487db696cae Mel Gorman              2012-10-19  1232  
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04  1233  	cc->migrate_pfn = low_pfn;
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04  1234  
c2ad7a1ffeafa3 Oscar Salvador          2021-05-04  1235  	return ret;
2fe86e00040761 Michal Nazarewicz       2012-01-30  1236  }
2fe86e00040761 Michal Nazarewicz       2012-01-30  1237  

:::::: The code at line 823 was first introduced by commit
:::::: 748446bb6b5a9390b546af38ec899c868a9dbcf0 mm: compaction: memory compaction core

:::::: TO: Mel Gorman <mel@csn.ul.ie>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
