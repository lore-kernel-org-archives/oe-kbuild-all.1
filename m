Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6565008FA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419642; cv=none; b=MCebumJ2+k14t+2d7BnK6FE9MhyH6ycevvRhc2pTqBL1pCyBYT3DR0dSSp4JfzV5Zl25RRHgtU/9NvJEfMQDVGh9pttM+DzVkUrWbzJfDVYJ+zzae/QZjiqoIFNXMFmmjnuwwspN+i/FWnAj+fj4SF8AuynHIyUddsNEbBvQsM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419642; c=relaxed/simple;
	bh=tKmt9/o6H574iBcej7rcEwxQRJDX1+lqr8CYS5O5vzc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XeR4uKcEdl+zU/FtjzayGKItsOBH0MbeNW3lMLFe1I8czNP2/HGvItnffRyF/Fs6gbBukAhsblZh9APXAiR526R7A4roGiCyzO2IMK+aYEvdZDRf9G2fcVPY7MGm9qizlzOfgzFhdps9FDYz0DZYF1rdMJ29rYa3eLsaohexc0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkp/9l6s; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkp/9l6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792419639; x=1823955639;
  h=date:from:to:cc:subject:message-id;
  bh=tKmt9/o6H574iBcej7rcEwxQRJDX1+lqr8CYS5O5vzc=;
  b=mkp/9l6sYmNOETG/X3GQDfjrSS21Rz5B0MN9ukjnr62dlORgWc2OOtPL
   yDOXHzIf+eEP2c73icA7R1JkOG5bIrcg82c/ARcIoKr4wvEAFRhGCWc6Z
   fDCztfpcLZizeq/15L5irK4iGHCFscI9shfi3kQ2QVJxdo98xL/EnF4Mr
   hN3Hw8xs+e41cLip0DHUFFvVWkPbCZEsE5T3Z/cRLkSfFhp6qrGts4ThR
   LWtJxUEq41dIsl0667YGsHaWioVl8H5dXLi3GRCRrerghABb24r2rgEit
   gmIbkN9hQ+9/tfLDlvSmlojhItdrExzV/nY0oEjEKhhYZtB3RyGBQ1L+t
   A==;
X-CSE-ConnectionGUID: G+y52WudT3yCZ5Y7+gYglQ==
X-CSE-MsgGUID: Pk49tje5SuqLHoC3wGAWPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="998031"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="998031"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 07:20:36 -0700
X-CSE-ConnectionGUID: 7i5MRl/yT5Gf3aZdTJqy/g==
X-CSE-MsgGUID: L3ZzerV5TbeK6raneUFjeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2969108"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 19 Oct 2026 07:20:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIoE4-000000005eL-2Q3r;
	Mon, 19 Oct 2026 14:20:32 +0000
Date: Mon, 19 Oct 2026 16:19:43 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 336/336]
 mm/compaction.c:816: warning: Function parameter or member 'cc_ext' not
 described in 'isolate_migratepages_block'
Message-ID: <202610191640.fwTK8mIG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   85239205a20932568f405bb06f7dc3187e755674
commit: d6f18f121b7c664094629f6af4d9f43acb7185cc [336/336] ANDROID: mm: do not allow file-backed pages from CMA
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261019/202610191640.fwTK8mIG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191640.fwTK8mIG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191640.fwTK8mIG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/compaction.c:816: warning: Function parameter or member 'cc_ext' not described in 'isolate_migratepages_block'
>> mm/compaction.c:816: warning: Excess function parameter 'cc' description in 'isolate_migratepages_block'


vim +816 mm/compaction.c

748446bb6b5a939 Mel Gorman              2010-05-24   795  
2fe86e000407612 Michal Nazarewicz       2012-01-30   796  /**
edc2ca612496792 Vlastimil Babka         2014-10-09   797   * isolate_migratepages_block() - isolate all migrate-able pages within
edc2ca612496792 Vlastimil Babka         2014-10-09   798   *				  a single pageblock
2fe86e000407612 Michal Nazarewicz       2012-01-30   799   * @cc:		Compaction control structure.
edc2ca612496792 Vlastimil Babka         2014-10-09   800   * @low_pfn:	The first PFN to isolate
edc2ca612496792 Vlastimil Babka         2014-10-09   801   * @end_pfn:	The one-past-the-last PFN to isolate, within same pageblock
89f6c88a6ab4a11 Hugh Dickins            2022-03-22   802   * @mode:	Isolation mode to be used.
2fe86e000407612 Michal Nazarewicz       2012-01-30   803   *
2fe86e000407612 Michal Nazarewicz       2012-01-30   804   * Isolate all pages that can be migrated from the range specified by
edc2ca612496792 Vlastimil Babka         2014-10-09   805   * [low_pfn, end_pfn). The range is expected to be within same pageblock.
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04   806   * Returns errno, like -EAGAIN or -EINTR in case e.g signal pending or congestion,
369fa227c21949b Oscar Salvador          2021-05-04   807   * -ENOMEM in case we could not allocate a page, or 0.
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04   808   * cc->migrate_pfn will contain the next pfn to scan.
2fe86e000407612 Michal Nazarewicz       2012-01-30   809   *
edc2ca612496792 Vlastimil Babka         2014-10-09   810   * The pages are isolated on cc->migratepages list (not required to be empty),
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04   811   * and cc->nr_migratepages is updated accordingly.
748446bb6b5a939 Mel Gorman              2010-05-24   812   */
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04   813  static int
d6f18f121b7c664 Minchan Kim             2023-01-12   814  isolate_migratepages_block(struct compact_control_ext *cc_ext, unsigned long low_pfn,
89f6c88a6ab4a11 Hugh Dickins            2022-03-22   815  			unsigned long end_pfn, isolate_mode_t mode)
748446bb6b5a939 Mel Gorman              2010-05-24  @816  {
d6f18f121b7c664 Minchan Kim             2023-01-12   817  	struct compact_control *cc = cc_ext->cc;
5f438eee8f2e972 Andrey Ryabinin         2019-03-05   818  	pg_data_t *pgdat = cc->zone->zone_pgdat;
b7aba6984dc0485 Mel Gorman              2011-01-13   819  	unsigned long nr_scanned = 0, nr_isolated = 0;
fa9add641b1b1c5 Hugh Dickins            2012-05-29   820  	struct lruvec *lruvec;
b8b2d8253236331 Xiubo Li                2014-10-09   821  	unsigned long flags = 0;
6168d0da2b479ce Alex Shi                2020-12-15   822  	struct lruvec *locked = NULL;
bb13ffeb9f6bfeb Mel Gorman              2012-10-08   823  	struct page *page = NULL, *valid_page = NULL;
89f6c88a6ab4a11 Hugh Dickins            2022-03-22   824  	struct address_space *mapping;
e34d85f0e3c60f7 Joonsoo Kim             2015-02-11   825  	unsigned long start_pfn = low_pfn;
fdd048e12c9a46d Vlastimil Babka         2016-05-19   826  	bool skip_on_failure = false;
fdd048e12c9a46d Vlastimil Babka         2016-05-19   827  	unsigned long next_skip_pfn = 0;
e380bebe4771548 Mel Gorman              2019-03-05   828  	bool skip_updated = false;
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04   829  	int ret = 0;
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04   830  
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04   831  	cc->migrate_pfn = low_pfn;
748446bb6b5a939 Mel Gorman              2010-05-24   832  
748446bb6b5a939 Mel Gorman              2010-05-24   833  	/*
748446bb6b5a939 Mel Gorman              2010-05-24   834  	 * Ensure that there are not too many pages isolated from the LRU
748446bb6b5a939 Mel Gorman              2010-05-24   835  	 * list by either parallel reclaimers or compaction. If there are,
748446bb6b5a939 Mel Gorman              2010-05-24   836  	 * delay for some time until fewer pages are isolated
748446bb6b5a939 Mel Gorman              2010-05-24   837  	 */
5f438eee8f2e972 Andrey Ryabinin         2019-03-05   838  	while (unlikely(too_many_isolated(pgdat))) {
d20bdd571ee5c99 Zi Yan                  2020-11-13   839  		/* stop isolation if there are still pages not migrated */
d20bdd571ee5c99 Zi Yan                  2020-11-13   840  		if (cc->nr_migratepages)
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04   841  			return -EAGAIN;
d20bdd571ee5c99 Zi Yan                  2020-11-13   842  
f9e35b3b41f47c4 Mel Gorman              2011-06-15   843  		/* async migration should just abort */
e0b9daeb453e602 David Rientjes          2014-06-04   844  		if (cc->mode == MIGRATE_ASYNC)
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04   845  			return -EAGAIN;
f9e35b3b41f47c4 Mel Gorman              2011-06-15   846  
c3f4a9a2b082c53 Mel Gorman              2021-11-05   847  		reclaim_throttle(pgdat, VMSCAN_THROTTLE_ISOLATED);
748446bb6b5a939 Mel Gorman              2010-05-24   848  
748446bb6b5a939 Mel Gorman              2010-05-24   849  		if (fatal_signal_pending(current))
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04   850  			return -EINTR;
748446bb6b5a939 Mel Gorman              2010-05-24   851  	}
748446bb6b5a939 Mel Gorman              2010-05-24   852  
cf66f0700c8f1d7 Mel Gorman              2019-03-05   853  	cond_resched();
aeef4b83806f49a David Rientjes          2014-06-04   854  
fdd048e12c9a46d Vlastimil Babka         2016-05-19   855  	if (cc->direct_compaction && (cc->mode == MIGRATE_ASYNC)) {
fdd048e12c9a46d Vlastimil Babka         2016-05-19   856  		skip_on_failure = true;
fdd048e12c9a46d Vlastimil Babka         2016-05-19   857  		next_skip_pfn = block_end_pfn(low_pfn, cc->order);
fdd048e12c9a46d Vlastimil Babka         2016-05-19   858  	}
fdd048e12c9a46d Vlastimil Babka         2016-05-19   859  
748446bb6b5a939 Mel Gorman              2010-05-24   860  	/* Time to isolate some pages for migration */
748446bb6b5a939 Mel Gorman              2010-05-24   861  	for (; low_pfn < end_pfn; low_pfn++) {
29c0dde830f8c08 Vlastimil Babka         2015-09-08   862  
fdd048e12c9a46d Vlastimil Babka         2016-05-19   863  		if (skip_on_failure && low_pfn >= next_skip_pfn) {
fdd048e12c9a46d Vlastimil Babka         2016-05-19   864  			/*
fdd048e12c9a46d Vlastimil Babka         2016-05-19   865  			 * We have isolated all migration candidates in the
fdd048e12c9a46d Vlastimil Babka         2016-05-19   866  			 * previous order-aligned block, and did not skip it due
fdd048e12c9a46d Vlastimil Babka         2016-05-19   867  			 * to failure. We should migrate the pages now and
fdd048e12c9a46d Vlastimil Babka         2016-05-19   868  			 * hopefully succeed compaction.
fdd048e12c9a46d Vlastimil Babka         2016-05-19   869  			 */
fdd048e12c9a46d Vlastimil Babka         2016-05-19   870  			if (nr_isolated)
fdd048e12c9a46d Vlastimil Babka         2016-05-19   871  				break;
fdd048e12c9a46d Vlastimil Babka         2016-05-19   872  
fdd048e12c9a46d Vlastimil Babka         2016-05-19   873  			/*
fdd048e12c9a46d Vlastimil Babka         2016-05-19   874  			 * We failed to isolate in the previous order-aligned
fdd048e12c9a46d Vlastimil Babka         2016-05-19   875  			 * block. Set the new boundary to the end of the
fdd048e12c9a46d Vlastimil Babka         2016-05-19   876  			 * current block. Note we can't simply increase
fdd048e12c9a46d Vlastimil Babka         2016-05-19   877  			 * next_skip_pfn by 1 << order, as low_pfn might have
fdd048e12c9a46d Vlastimil Babka         2016-05-19   878  			 * been incremented by a higher number due to skipping
fdd048e12c9a46d Vlastimil Babka         2016-05-19   879  			 * a compound or a high-order buddy page in the
fdd048e12c9a46d Vlastimil Babka         2016-05-19   880  			 * previous loop iteration.
fdd048e12c9a46d Vlastimil Babka         2016-05-19   881  			 */
fdd048e12c9a46d Vlastimil Babka         2016-05-19   882  			next_skip_pfn = block_end_pfn(low_pfn, cc->order);
fdd048e12c9a46d Vlastimil Babka         2016-05-19   883  		}
fdd048e12c9a46d Vlastimil Babka         2016-05-19   884  
8b44d2791f91256 Vlastimil Babka         2014-10-09   885  		/*
8b44d2791f91256 Vlastimil Babka         2014-10-09   886  		 * Periodically drop the lock (if held) regardless of its
670105a25608aff Mel Gorman              2019-08-02   887  		 * contention, to give chance to IRQs. Abort completely if
670105a25608aff Mel Gorman              2019-08-02   888  		 * a fatal signal is pending.
8b44d2791f91256 Vlastimil Babka         2014-10-09   889  		 */
c036ddffe4acb0a Miaohe Lin              2022-04-28   890  		if (!(low_pfn % COMPACT_CLUSTER_MAX)) {
6168d0da2b479ce Alex Shi                2020-12-15   891  			if (locked) {
6168d0da2b479ce Alex Shi                2020-12-15   892  				unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479ce Alex Shi                2020-12-15   893  				locked = NULL;
6168d0da2b479ce Alex Shi                2020-12-15   894  			}
6168d0da2b479ce Alex Shi                2020-12-15   895  
6168d0da2b479ce Alex Shi                2020-12-15   896  			if (fatal_signal_pending(current)) {
6168d0da2b479ce Alex Shi                2020-12-15   897  				cc->contended = true;
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04   898  				ret = -EINTR;
6168d0da2b479ce Alex Shi                2020-12-15   899  
670105a25608aff Mel Gorman              2019-08-02   900  				goto fatal_pending;
670105a25608aff Mel Gorman              2019-08-02   901  			}
b2eef8c0d09101b Andrea Arcangeli        2011-03-22   902  
6168d0da2b479ce Alex Shi                2020-12-15   903  			cond_resched();
6168d0da2b479ce Alex Shi                2020-12-15   904  		}
6168d0da2b479ce Alex Shi                2020-12-15   905  
b7aba6984dc0485 Mel Gorman              2011-01-13   906  		nr_scanned++;
748446bb6b5a939 Mel Gorman              2010-05-24   907  
748446bb6b5a939 Mel Gorman              2010-05-24   908  		page = pfn_to_page(low_pfn);
dc9086004b3d5db Mel Gorman              2012-02-08   909  
e380bebe4771548 Mel Gorman              2019-03-05   910  		/*
e380bebe4771548 Mel Gorman              2019-03-05   911  		 * Check if the pageblock has already been marked skipped.
e380bebe4771548 Mel Gorman              2019-03-05   912  		 * Only the aligned PFN is checked as the caller isolates
e380bebe4771548 Mel Gorman              2019-03-05   913  		 * COMPACT_CLUSTER_MAX at a time so the second call must
e380bebe4771548 Mel Gorman              2019-03-05   914  		 * not falsely conclude that the block should be skipped.
e380bebe4771548 Mel Gorman              2019-03-05   915  		 */
ee0913c47196102 Kefeng Wang             2022-09-07   916  		if (!valid_page && pageblock_aligned(low_pfn)) {
4af12d04e71c2d0 Miaohe Lin              2022-04-28   917  			if (!isolation_suitable(cc, page)) {
e380bebe4771548 Mel Gorman              2019-03-05   918  				low_pfn = end_pfn;
9df41314390b81a Alex Shi                2020-12-15   919  				page = NULL;
e380bebe4771548 Mel Gorman              2019-03-05   920  				goto isolate_abort;
e380bebe4771548 Mel Gorman              2019-03-05   921  			}
bb13ffeb9f6bfeb Mel Gorman              2012-10-08   922  			valid_page = page;
e380bebe4771548 Mel Gorman              2019-03-05   923  		}
bb13ffeb9f6bfeb Mel Gorman              2012-10-08   924  
369fa227c21949b Oscar Salvador          2021-05-04   925  		if (PageHuge(page) && cc->alloc_contig) {
ae37c7ff79f1f03 Oscar Salvador          2021-05-04   926  			ret = isolate_or_dissolve_huge_page(page, &cc->migratepages);
369fa227c21949b Oscar Salvador          2021-05-04   927  
369fa227c21949b Oscar Salvador          2021-05-04   928  			/*
369fa227c21949b Oscar Salvador          2021-05-04   929  			 * Fail isolation in case isolate_or_dissolve_huge_page()
369fa227c21949b Oscar Salvador          2021-05-04   930  			 * reports an error. In case of -ENOMEM, abort right away.
369fa227c21949b Oscar Salvador          2021-05-04   931  			 */
369fa227c21949b Oscar Salvador          2021-05-04   932  			if (ret < 0) {
369fa227c21949b Oscar Salvador          2021-05-04   933  				 /* Do not report -EBUSY down the chain */
369fa227c21949b Oscar Salvador          2021-05-04   934  				if (ret == -EBUSY)
369fa227c21949b Oscar Salvador          2021-05-04   935  					ret = 0;
66fe1cf7f581593 Miaohe Lin              2022-04-28   936  				low_pfn += compound_nr(page) - 1;
369fa227c21949b Oscar Salvador          2021-05-04   937  				goto isolate_fail;
369fa227c21949b Oscar Salvador          2021-05-04   938  			}
369fa227c21949b Oscar Salvador          2021-05-04   939  
ae37c7ff79f1f03 Oscar Salvador          2021-05-04   940  			if (PageHuge(page)) {
ae37c7ff79f1f03 Oscar Salvador          2021-05-04   941  				/*
ae37c7ff79f1f03 Oscar Salvador          2021-05-04   942  				 * Hugepage was successfully isolated and placed
ae37c7ff79f1f03 Oscar Salvador          2021-05-04   943  				 * on the cc->migratepages list.
ae37c7ff79f1f03 Oscar Salvador          2021-05-04   944  				 */
ae37c7ff79f1f03 Oscar Salvador          2021-05-04   945  				low_pfn += compound_nr(page) - 1;
ae37c7ff79f1f03 Oscar Salvador          2021-05-04   946  				goto isolate_success_no_list;
ae37c7ff79f1f03 Oscar Salvador          2021-05-04   947  			}
ae37c7ff79f1f03 Oscar Salvador          2021-05-04   948  
369fa227c21949b Oscar Salvador          2021-05-04   949  			/*
369fa227c21949b Oscar Salvador          2021-05-04   950  			 * Ok, the hugepage was dissolved. Now these pages are
369fa227c21949b Oscar Salvador          2021-05-04   951  			 * Buddy and cannot be re-allocated because they are
369fa227c21949b Oscar Salvador          2021-05-04   952  			 * isolated. Fall-through as the check below handles
369fa227c21949b Oscar Salvador          2021-05-04   953  			 * Buddy pages.
369fa227c21949b Oscar Salvador          2021-05-04   954  			 */
369fa227c21949b Oscar Salvador          2021-05-04   955  		}
369fa227c21949b Oscar Salvador          2021-05-04   956  
c122b2087ab9419 Joonsoo Kim             2014-04-07   957  		/*
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   958  		 * Skip if free. We read page order here without zone lock
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   959  		 * which is generally unsafe, but the race window is small and
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   960  		 * the worst thing that can happen is that we skip some
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   961  		 * potential isolation targets.
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   962  		 */
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   963  		if (PageBuddy(page)) {
ab130f9108dcf20 Matthew Wilcox (Oracle  2020-10-15   964) 			unsigned long freepage_order = buddy_order_unsafe(page);
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   965  
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   966  			/*
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   967  			 * Without lock, we cannot be sure that what we got is
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   968  			 * a valid page order. Consider only values in the
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   969  			 * valid order range to prevent low_pfn overflow.
c122b2087ab9419 Joonsoo Kim             2014-04-07   970  			 */
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   971  			if (freepage_order > 0 && freepage_order < MAX_ORDER)
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   972  				low_pfn += (1UL << freepage_order) - 1;
c122b2087ab9419 Joonsoo Kim             2014-04-07   973  			continue;
99c0fd5e51c4479 Vlastimil Babka         2014-10-09   974  		}
9927af740b1b9b1 Mel Gorman              2011-01-13   975  
bc835011afbea39 Andrea Arcangeli        2011-01-13   976  		/*
29c0dde830f8c08 Vlastimil Babka         2015-09-08   977  		 * Regardless of being on LRU, compound pages such as THP and
1da2f328fa643bd Rik van Riel            2020-04-01   978  		 * hugetlbfs are not to be compacted unless we are attempting
1da2f328fa643bd Rik van Riel            2020-04-01   979  		 * an allocation much larger than the huge page size (eg CMA).
1da2f328fa643bd Rik van Riel            2020-04-01   980  		 * We can potentially save a lot of iterations if we skip them
1da2f328fa643bd Rik van Riel            2020-04-01   981  		 * at once. The check is racy, but we can consider only valid
1da2f328fa643bd Rik van Riel            2020-04-01   982  		 * values and the only danger is skipping too much.
bc835011afbea39 Andrea Arcangeli        2011-01-13   983  		 */
1da2f328fa643bd Rik van Riel            2020-04-01   984  		if (PageCompound(page) && !cc->alloc_contig) {
21dc7e023611fbc David Rientjes          2017-11-17   985  			const unsigned int order = compound_order(page);
edc2ca612496792 Vlastimil Babka         2014-10-09   986  
d3c85bad89b9153 Vlastimil Babka         2017-11-17   987  			if (likely(order < MAX_ORDER))
21dc7e023611fbc David Rientjes          2017-11-17   988  				low_pfn += (1UL << order) - 1;
fdd048e12c9a46d Vlastimil Babka         2016-05-19   989  			goto isolate_fail;
2a1402aa044b55c Mel Gorman              2012-10-08   990  		}
2a1402aa044b55c Mel Gorman              2012-10-08   991  
bda807d4445414e Minchan Kim             2016-07-26   992  		/*
bda807d4445414e Minchan Kim             2016-07-26   993  		 * Check may be lockless but that's ok as we recheck later.
bda807d4445414e Minchan Kim             2016-07-26   994  		 * It's possible to migrate LRU and non-lru movable pages.
bda807d4445414e Minchan Kim             2016-07-26   995  		 * Skip any other type of page
bda807d4445414e Minchan Kim             2016-07-26   996  		 */
bda807d4445414e Minchan Kim             2016-07-26   997  		if (!PageLRU(page)) {
bda807d4445414e Minchan Kim             2016-07-26   998  			/*
bda807d4445414e Minchan Kim             2016-07-26   999  			 * __PageMovable can return false positive so we need
bda807d4445414e Minchan Kim             2016-07-26  1000  			 * to verify it under page_lock.
bda807d4445414e Minchan Kim             2016-07-26  1001  			 */
bda807d4445414e Minchan Kim             2016-07-26  1002  			if (unlikely(__PageMovable(page)) &&
bda807d4445414e Minchan Kim             2016-07-26  1003  					!PageIsolated(page)) {
bda807d4445414e Minchan Kim             2016-07-26  1004  				if (locked) {
6168d0da2b479ce Alex Shi                2020-12-15  1005  					unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479ce Alex Shi                2020-12-15  1006  					locked = NULL;
bda807d4445414e Minchan Kim             2016-07-26  1007  				}
bda807d4445414e Minchan Kim             2016-07-26  1008  
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1009  				if (!isolate_movable_page(page, mode))
bda807d4445414e Minchan Kim             2016-07-26  1010  					goto isolate_success;
bda807d4445414e Minchan Kim             2016-07-26  1011  			}
bda807d4445414e Minchan Kim             2016-07-26  1012  
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1013  			goto isolate_fail;
bda807d4445414e Minchan Kim             2016-07-26  1014  		}
29c0dde830f8c08 Vlastimil Babka         2015-09-08  1015  
829ae0f81ce093d Gavin Shan              2022-11-24  1016  		/*
829ae0f81ce093d Gavin Shan              2022-11-24  1017  		 * Be careful not to clear PageLRU until after we're
829ae0f81ce093d Gavin Shan              2022-11-24  1018  		 * sure the page is not being freed elsewhere -- the
829ae0f81ce093d Gavin Shan              2022-11-24  1019  		 * page release code relies on it.
829ae0f81ce093d Gavin Shan              2022-11-24  1020  		 */
829ae0f81ce093d Gavin Shan              2022-11-24  1021  		if (unlikely(!get_page_unless_zero(page)))
829ae0f81ce093d Gavin Shan              2022-11-24  1022  			goto isolate_fail;
829ae0f81ce093d Gavin Shan              2022-11-24  1023  
119d6d59dcc0980 David Rientjes          2014-04-03  1024  		/*
119d6d59dcc0980 David Rientjes          2014-04-03  1025  		 * Migration will fail if an anonymous page is pinned in memory,
119d6d59dcc0980 David Rientjes          2014-04-03  1026  		 * so avoid taking lru_lock and isolating it unnecessarily in an
119d6d59dcc0980 David Rientjes          2014-04-03  1027  		 * admittedly racy check.
119d6d59dcc0980 David Rientjes          2014-04-03  1028  		 */
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1029  		mapping = page_mapping(page);
829ae0f81ce093d Gavin Shan              2022-11-24  1030  		if (!mapping && (page_count(page) - 1) > total_mapcount(page))
829ae0f81ce093d Gavin Shan              2022-11-24  1031  			goto isolate_fail_put;
119d6d59dcc0980 David Rientjes          2014-04-03  1032  
73e64c51afc56d4 Michal Hocko            2016-12-14  1033  		/*
73e64c51afc56d4 Michal Hocko            2016-12-14  1034  		 * Only allow to migrate anonymous pages in GFP_NOFS context
73e64c51afc56d4 Michal Hocko            2016-12-14  1035  		 * because those do not depend on fs locks.
73e64c51afc56d4 Michal Hocko            2016-12-14  1036  		 */
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1037  		if (!(cc->gfp_mask & __GFP_FS) && mapping)
829ae0f81ce093d Gavin Shan              2022-11-24  1038  			goto isolate_fail_put;
9df41314390b81a Alex Shi                2020-12-15  1039  
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1040  		/* Only take pages on LRU: a check now makes later tests safe */
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1041  		if (!PageLRU(page))
9df41314390b81a Alex Shi                2020-12-15  1042  			goto isolate_fail_put;
9df41314390b81a Alex Shi                2020-12-15  1043  
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1044  		/* Compaction might skip unevictable pages but CMA takes them */
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1045  		if (!(mode & ISOLATE_UNEVICTABLE) && PageUnevictable(page))
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1046  			goto isolate_fail_put;
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1047  
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1048  		/*
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1049  		 * To minimise LRU disruption, the caller can indicate with
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1050  		 * ISOLATE_ASYNC_MIGRATE that it only wants to isolate pages
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1051  		 * it will be able to migrate without blocking - clean pages
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1052  		 * for the most part.  PageWriteback would require blocking.
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1053  		 */
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1054  		if ((mode & ISOLATE_ASYNC_MIGRATE) && PageWriteback(page))
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1055  			goto isolate_fail_put;
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1056  
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1057  		if ((mode & ISOLATE_ASYNC_MIGRATE) && PageDirty(page)) {
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1058  			bool migrate_dirty;
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1059  
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1060  			/*
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1061  			 * Only pages without mappings or that have a
9d0ddc0cb575fd4 Matthew Wilcox (Oracle  2022-06-06  1062) 			 * ->migrate_folio callback are possible to migrate
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1063  			 * without blocking. However, we can be racing with
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1064  			 * truncation so it's necessary to lock the page
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1065  			 * to stabilise the mapping as truncation holds
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1066  			 * the page lock until after the page is removed
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1067  			 * from the page cache.
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1068  			 */
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1069  			if (!trylock_page(page))
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1070  				goto isolate_fail_put;
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1071  
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1072  			mapping = page_mapping(page);
5490da4f06d182b Matthew Wilcox (Oracle  2022-06-06  1073) 			migrate_dirty = !mapping ||
9d0ddc0cb575fd4 Matthew Wilcox (Oracle  2022-06-06  1074) 					mapping->a_ops->migrate_folio;
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1075  			unlock_page(page);
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1076  			if (!migrate_dirty)
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1077  				goto isolate_fail_put;
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1078  		}
89f6c88a6ab4a11 Hugh Dickins            2022-03-22  1079  
9df41314390b81a Alex Shi                2020-12-15  1080  		/* Try isolate the page */
9df41314390b81a Alex Shi                2020-12-15  1081  		if (!TestClearPageLRU(page))
9df41314390b81a Alex Shi                2020-12-15  1082  			goto isolate_fail_put;
9df41314390b81a Alex Shi                2020-12-15  1083  
b1baabd995ab8e8 Matthew Wilcox (Oracle  2021-06-28  1084) 		lruvec = folio_lruvec(page_folio(page));
6168d0da2b479ce Alex Shi                2020-12-15  1085  
69b7189f12e0064 Vlastimil Babka         2014-10-09  1086  		/* If we already hold the lock, we can skip some rechecking */
6168d0da2b479ce Alex Shi                2020-12-15  1087  		if (lruvec != locked) {
6168d0da2b479ce Alex Shi                2020-12-15  1088  			if (locked)
6168d0da2b479ce Alex Shi                2020-12-15  1089  				unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479ce Alex Shi                2020-12-15  1090  
6168d0da2b479ce Alex Shi                2020-12-15  1091  			compact_lock_irqsave(&lruvec->lru_lock, &flags, cc);
6168d0da2b479ce Alex Shi                2020-12-15  1092  			locked = lruvec;
6168d0da2b479ce Alex Shi                2020-12-15  1093  
e809c3fedeeb806 Matthew Wilcox (Oracle  2021-06-28  1094) 			lruvec_memcg_debug(lruvec, page_folio(page));
e380bebe4771548 Mel Gorman              2019-03-05  1095  
e380bebe4771548 Mel Gorman              2019-03-05  1096  			/* Try get exclusive access under lock */
e380bebe4771548 Mel Gorman              2019-03-05  1097  			if (!skip_updated) {
e380bebe4771548 Mel Gorman              2019-03-05  1098  				skip_updated = true;
e380bebe4771548 Mel Gorman              2019-03-05  1099  				if (test_and_set_skip(cc, page, low_pfn))
e380bebe4771548 Mel Gorman              2019-03-05  1100  					goto isolate_abort;
e380bebe4771548 Mel Gorman              2019-03-05  1101  			}
2a1402aa044b55c Mel Gorman              2012-10-08  1102  
29c0dde830f8c08 Vlastimil Babka         2015-09-08  1103  			/*
29c0dde830f8c08 Vlastimil Babka         2015-09-08  1104  			 * Page become compound since the non-locked check,
29c0dde830f8c08 Vlastimil Babka         2015-09-08  1105  			 * and it's on LRU. It can only be a THP so the order
29c0dde830f8c08 Vlastimil Babka         2015-09-08  1106  			 * is safe to read and it's 0 for tail pages.
29c0dde830f8c08 Vlastimil Babka         2015-09-08  1107  			 */
1da2f328fa643bd Rik van Riel            2020-04-01  1108  			if (unlikely(PageCompound(page) && !cc->alloc_contig)) {
d8c6546b1aea843 Matthew Wilcox (Oracle  2019-09-23  1109) 				low_pfn += compound_nr(page) - 1;
9df41314390b81a Alex Shi                2020-12-15  1110  				SetPageLRU(page);
9df41314390b81a Alex Shi                2020-12-15  1111  				goto isolate_fail_put;
bc835011afbea39 Andrea Arcangeli        2011-01-13  1112  			}
d99fd5feb0ac1d5 Alex Shi                2021-02-24  1113  		}
fa9add641b1b1c5 Hugh Dickins            2012-05-29  1114  
1da2f328fa643bd Rik van Riel            2020-04-01  1115  		/* The whole page is taken off the LRU; skip the tail pages. */
1da2f328fa643bd Rik van Riel            2020-04-01  1116  		if (PageCompound(page))
1da2f328fa643bd Rik van Riel            2020-04-01  1117  			low_pfn += compound_nr(page) - 1;
bc835011afbea39 Andrea Arcangeli        2011-01-13  1118  
748446bb6b5a939 Mel Gorman              2010-05-24  1119  		/* Successfully isolated */
46ae6b2cc2a4790 Yu Zhao                 2021-02-24  1120  		del_page_from_lru_list(page, lruvec);
1da2f328fa643bd Rik van Riel            2020-04-01  1121  		mod_node_page_state(page_pgdat(page),
9de4f22a60f7319 Huang Ying              2020-04-06  1122  				NR_ISOLATED_ANON + page_is_file_lru(page),
6c357848b44b401 Matthew Wilcox (Oracle  2020-08-14  1123) 				thp_nr_pages(page));
b6c750163c0d138 Joonsoo Kim             2014-04-07  1124  
b6c750163c0d138 Joonsoo Kim             2014-04-07  1125  isolate_success:
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1126  		list_add(&page->lru, &cc->migratepages);
ae37c7ff79f1f03 Oscar Salvador          2021-05-04  1127  isolate_success_no_list:
38935861d85a4d9 Zi Yan                  2020-11-13  1128  		cc->nr_migratepages += compound_nr(page);
d6f18f121b7c664 Minchan Kim             2023-01-12  1129  		if (!PageAnon(page))
d6f18f121b7c664 Minchan Kim             2023-01-12  1130  			cc_ext->nr_migrate_file_pages += compound_nr(page);
38935861d85a4d9 Zi Yan                  2020-11-13  1131  		nr_isolated += compound_nr(page);
b717d6b93b54ec2 William Lam             2022-07-11  1132  		nr_scanned += compound_nr(page) - 1;
748446bb6b5a939 Mel Gorman              2010-05-24  1133  
804d3121ba5f03a Mel Gorman              2019-03-05  1134  		/*
804d3121ba5f03a Mel Gorman              2019-03-05  1135  		 * Avoid isolating too much unless this block is being
cb2dcaf023c2cf1 Mel Gorman              2019-03-05  1136  		 * rescanned (e.g. dirty/writeback pages, parallel allocation)
cb2dcaf023c2cf1 Mel Gorman              2019-03-05  1137  		 * or a lock is contended. For contention, isolate quickly to
cb2dcaf023c2cf1 Mel Gorman              2019-03-05  1138  		 * potentially remove one source of contention.
804d3121ba5f03a Mel Gorman              2019-03-05  1139  		 */
38935861d85a4d9 Zi Yan                  2020-11-13  1140  		if (cc->nr_migratepages >= COMPACT_CLUSTER_MAX &&
cb2dcaf023c2cf1 Mel Gorman              2019-03-05  1141  		    !cc->rescan && !cc->contended) {
31b8384a555d94c Hillf Danton            2012-01-10  1142  			++low_pfn;
748446bb6b5a939 Mel Gorman              2010-05-24  1143  			break;
748446bb6b5a939 Mel Gorman              2010-05-24  1144  		}
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1145  
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1146  		continue;
9df41314390b81a Alex Shi                2020-12-15  1147  
9df41314390b81a Alex Shi                2020-12-15  1148  isolate_fail_put:
9df41314390b81a Alex Shi                2020-12-15  1149  		/* Avoid potential deadlock in freeing page under lru_lock */
9df41314390b81a Alex Shi                2020-12-15  1150  		if (locked) {
6168d0da2b479ce Alex Shi                2020-12-15  1151  			unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479ce Alex Shi                2020-12-15  1152  			locked = NULL;
9df41314390b81a Alex Shi                2020-12-15  1153  		}
9df41314390b81a Alex Shi                2020-12-15  1154  		put_page(page);
9df41314390b81a Alex Shi                2020-12-15  1155  
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1156  isolate_fail:
369fa227c21949b Oscar Salvador          2021-05-04  1157  		if (!skip_on_failure && ret != -ENOMEM)
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1158  			continue;
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1159  
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1160  		/*
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1161  		 * We have isolated some pages, but then failed. Release them
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1162  		 * instead of migrating, as we cannot form the cc->order buddy
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1163  		 * page anyway.
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1164  		 */
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1165  		if (nr_isolated) {
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1166  			if (locked) {
6168d0da2b479ce Alex Shi                2020-12-15  1167  				unlock_page_lruvec_irqrestore(locked, flags);
6168d0da2b479ce Alex Shi                2020-12-15  1168  				locked = NULL;
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1169  			}
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1170  			putback_movable_pages(&cc->migratepages);
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1171  			cc->nr_migratepages = 0;
d6f18f121b7c664 Minchan Kim             2023-01-12  1172  			cc_ext->nr_migrate_file_pages = 0;
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1173  			nr_isolated = 0;
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1174  		}
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1175  
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1176  		if (low_pfn < next_skip_pfn) {
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1177  			low_pfn = next_skip_pfn - 1;
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1178  			/*
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1179  			 * The check near the loop beginning would have updated
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1180  			 * next_skip_pfn too, but this is a bit simpler.
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1181  			 */
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1182  			next_skip_pfn += 1UL << cc->order;
fdd048e12c9a46d Vlastimil Babka         2016-05-19  1183  		}
369fa227c21949b Oscar Salvador          2021-05-04  1184  
369fa227c21949b Oscar Salvador          2021-05-04  1185  		if (ret == -ENOMEM)
369fa227c21949b Oscar Salvador          2021-05-04  1186  			break;
31b8384a555d94c Hillf Danton            2012-01-10  1187  	}
748446bb6b5a939 Mel Gorman              2010-05-24  1188  
99c0fd5e51c4479 Vlastimil Babka         2014-10-09  1189  	/*
99c0fd5e51c4479 Vlastimil Babka         2014-10-09  1190  	 * The PageBuddy() check could have potentially brought us outside
99c0fd5e51c4479 Vlastimil Babka         2014-10-09  1191  	 * the range to be scanned.
99c0fd5e51c4479 Vlastimil Babka         2014-10-09  1192  	 */
99c0fd5e51c4479 Vlastimil Babka         2014-10-09  1193  	if (unlikely(low_pfn > end_pfn))
99c0fd5e51c4479 Vlastimil Babka         2014-10-09  1194  		low_pfn = end_pfn;
99c0fd5e51c4479 Vlastimil Babka         2014-10-09  1195  
9df41314390b81a Alex Shi                2020-12-15  1196  	page = NULL;
9df41314390b81a Alex Shi                2020-12-15  1197  
e380bebe4771548 Mel Gorman              2019-03-05  1198  isolate_abort:
c67fe3752abe6ab Mel Gorman              2012-08-21  1199  	if (locked)
6168d0da2b479ce Alex Shi                2020-12-15  1200  		unlock_page_lruvec_irqrestore(locked, flags);
9df41314390b81a Alex Shi                2020-12-15  1201  	if (page) {
9df41314390b81a Alex Shi                2020-12-15  1202  		SetPageLRU(page);
9df41314390b81a Alex Shi                2020-12-15  1203  		put_page(page);
9df41314390b81a Alex Shi                2020-12-15  1204  	}
748446bb6b5a939 Mel Gorman              2010-05-24  1205  
50b5b094e683f8e Vlastimil Babka         2014-01-21  1206  	/*
804d3121ba5f03a Mel Gorman              2019-03-05  1207  	 * Updated the cached scanner pfn once the pageblock has been scanned
804d3121ba5f03a Mel Gorman              2019-03-05  1208  	 * Pages will either be migrated in which case there is no point
804d3121ba5f03a Mel Gorman              2019-03-05  1209  	 * scanning in the near future or migration failed in which case the
804d3121ba5f03a Mel Gorman              2019-03-05  1210  	 * failure reason may persist. The block is marked for skipping if
804d3121ba5f03a Mel Gorman              2019-03-05  1211  	 * there were no pages isolated in the block or if the block is
804d3121ba5f03a Mel Gorman              2019-03-05  1212  	 * rescanned twice in a row.
50b5b094e683f8e Vlastimil Babka         2014-01-21  1213  	 */
804d3121ba5f03a Mel Gorman              2019-03-05  1214  	if (low_pfn == end_pfn && (!nr_isolated || cc->rescan)) {
e380bebe4771548 Mel Gorman              2019-03-05  1215  		if (valid_page && !skip_updated)
e380bebe4771548 Mel Gorman              2019-03-05  1216  			set_pageblock_skip(valid_page);
e380bebe4771548 Mel Gorman              2019-03-05  1217  		update_cached_migrate(cc, low_pfn);
e380bebe4771548 Mel Gorman              2019-03-05  1218  	}
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  1219  
e34d85f0e3c60f7 Joonsoo Kim             2015-02-11  1220  	trace_mm_compaction_isolate_migratepages(start_pfn, low_pfn,
e34d85f0e3c60f7 Joonsoo Kim             2015-02-11  1221  						nr_scanned, nr_isolated);
b7aba6984dc0485 Mel Gorman              2011-01-13  1222  
670105a25608aff Mel Gorman              2019-08-02  1223  fatal_pending:
7f354a548d1cb6b David Rientjes          2017-02-22  1224  	cc->total_migrate_scanned += nr_scanned;
397487db696cae0 Mel Gorman              2012-10-19  1225  	if (nr_isolated)
010fc29a45a2e8d Minchan Kim             2012-12-20  1226  		count_compact_events(COMPACTISOLATED, nr_isolated);
397487db696cae0 Mel Gorman              2012-10-19  1227  
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04  1228  	cc->migrate_pfn = low_pfn;
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04  1229  
c2ad7a1ffeafa32 Oscar Salvador          2021-05-04  1230  	return ret;
2fe86e000407612 Michal Nazarewicz       2012-01-30  1231  }
2fe86e000407612 Michal Nazarewicz       2012-01-30  1232  

:::::: The code at line 816 was first introduced by commit
:::::: 748446bb6b5a9390b546af38ec899c868a9dbcf0 mm: compaction: memory compaction core

:::::: TO: Mel Gorman <mel@csn.ul.ie>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
