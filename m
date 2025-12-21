Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485E81E0DE8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 17:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766339559; cv=none; b=LsCXvXZSvIsmx/cBbkyCmyPMB72gV4+2hj9gBJM5PBT6jS65PKNVVb83M3c9jpy6z8i4JogRqPsjLYR8T5pE6y/zrsC1B/iH6RkSvbiwwwiev7+hBIKaIc9F0B5ps1xt4MpQfnKEpMVLuO1ldEv991QqeaWOMinGfSmxDbTQC3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766339559; c=relaxed/simple;
	bh=bZSdbyYC5Xw/dRW23ikYCorzI1HU4+SysE1mVq1thCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UEY40vJR6e4PVRAhTvz/JWVHJMG9SL1Lorq3tqrYAdRvK2PN+BKPyaUMk2D23XZ2b8maECXQI0NQRAhQtxCffQuk9nmp8vAUITR89o4twcRRTU5ye+wRhw4/fvEtjKiS8xpZ8OekoF7k0wHNQHEeCcGLU5hi8Ku1viNCmOtb398=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcITlkUF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcITlkUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766339558; x=1797875558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bZSdbyYC5Xw/dRW23ikYCorzI1HU4+SysE1mVq1thCk=;
  b=BcITlkUFdQBQQWvBHEf9VQprzDLVDVgDLhkQIZw3/GHmBOHQOzuBPvVv
   +Nun2sADWI3Xg9RH3JBkx4Ll5Lq1eq6iUvrBYYDZORThBKSUSXpyyxCNG
   3YSJ+gEjeWzG9JlU0CplCySP1NModlpQ4kVFkLsxxJ17xWaroZJv7i+li
   2v4cmFpoRhacy3RbcTiBmLg+VotekRM94MxbfvBuV1gt2px0qcT28D6vD
   1tObjJGvSaZeDDBG5d/yQAZdyTkqLvSlv3JpEuI2reDrI720up2btTG99
   U2/rhuaZvb0leis5OXcJdvKoh+h0vIupvWPqLVJTwJRLkTHpgsnfwN733
   g==;
X-CSE-ConnectionGUID: D12ghfdIS36SctUTaIiKwA==
X-CSE-MsgGUID: +pO4uK7uRQGbAyKtFZC8bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67968138"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="67968138"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 09:52:37 -0800
X-CSE-ConnectionGUID: iGQtKACLSeGtAqtKwyWdpA==
X-CSE-MsgGUID: ePu8ZUoJTxu5DmlLcF+7kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199364078"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2025 09:52:36 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXNbd-000000005un-24Bq;
	Sun, 21 Dec 2025 17:52:33 +0000
Date: Mon, 22 Dec 2025 01:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1] mm/page_isolation.c:186:
 warning: Function parameter or member 'failed_pfn' not described in
 'start_isolate_page_range'
Message-ID: <202512220158.vq9e4Fpo-lkp@intel.com>
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
head:   bcde9d2273f3b1f7b610e1a6705da841ec4024d6
commit: 60d2dad38e3dce7359b318c436dd06e5a55da15a [1/1] ANDROID: mm: cma: skip problematic pageblock
config: i386-randconfig-141-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220158.vq9e4Fpo-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 42b3483ac4987cae1bdb632398e8a3ce2dea6633)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220158.vq9e4Fpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220158.vq9e4Fpo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_isolation.c:186: warning: Function parameter or member 'failed_pfn' not described in 'start_isolate_page_range'


vim +186 mm/page_isolation.c

a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  141  
9b7ea46a82b31c Qian Cai          2019-03-28  142  /**
9b7ea46a82b31c Qian Cai          2019-03-28  143   * start_isolate_page_range() - make page-allocation-type of range of pages to
9b7ea46a82b31c Qian Cai          2019-03-28  144   * be MIGRATE_ISOLATE.
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  145   * @start_pfn:		The lower PFN of the range to be isolated.
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  146   * @end_pfn:		The upper PFN of the range to be isolated.
9b7ea46a82b31c Qian Cai          2019-03-28  147   *			start_pfn/end_pfn must be aligned to pageblock_order.
9b7ea46a82b31c Qian Cai          2019-03-28  148   * @migratetype:	Migrate type to set in error recovery.
9b7ea46a82b31c Qian Cai          2019-03-28  149   * @flags:		The following flags are allowed (they can be combined in
9b7ea46a82b31c Qian Cai          2019-03-28  150   *			a bit mask)
756d25be457fc5 David Hildenbrand 2019-11-30  151   *			MEMORY_OFFLINE - isolate to offline (!allocate) memory
756d25be457fc5 David Hildenbrand 2019-11-30  152   *					 e.g., skip over PageHWPoison() pages
aa218795cb5fd5 David Hildenbrand 2020-05-07  153   *					 and PageOffline() pages.
9b7ea46a82b31c Qian Cai          2019-03-28  154   *			REPORT_FAILURE - report details about the failure to
9b7ea46a82b31c Qian Cai          2019-03-28  155   *			isolate the range
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  156   *
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  157   * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  158   * the range will never be allocated. Any free pages and pages freed in the
9b7ea46a82b31c Qian Cai          2019-03-28  159   * future will not be allocated again. If specified range includes migrate types
9b7ea46a82b31c Qian Cai          2019-03-28  160   * other than MOVABLE or CMA, this will fail with -EBUSY. For isolating all
9b7ea46a82b31c Qian Cai          2019-03-28  161   * pages in the range finally, the caller have to free all pages in the range.
9b7ea46a82b31c Qian Cai          2019-03-28  162   * test_page_isolated() can be used for test it.
2c7452a075d4db Mike Kravetz      2018-04-05  163   *
2c7452a075d4db Mike Kravetz      2018-04-05  164   * There is no high level synchronization mechanism that prevents two threads
2c7452a075d4db Mike Kravetz      2018-04-05  165   * from trying to isolate overlapping ranges. If this happens, one thread
2c7452a075d4db Mike Kravetz      2018-04-05  166   * will notice pageblocks in the overlapping range already set to isolate.
2c7452a075d4db Mike Kravetz      2018-04-05  167   * This happens in set_migratetype_isolate, and set_migratetype_isolate
2c7452a075d4db Mike Kravetz      2018-04-05  168   * returns an error. We then clean up by restoring the migration type on
2c7452a075d4db Mike Kravetz      2018-04-05  169   * pageblocks we may have modified and return -EBUSY to caller. This
2c7452a075d4db Mike Kravetz      2018-04-05  170   * prevents two threads from simultaneously working on overlapping ranges.
9b7ea46a82b31c Qian Cai          2019-03-28  171   *
9683182612214a Pavel Tatashin    2020-09-18  172   * Please note that there is no strong synchronization with the page allocator
9683182612214a Pavel Tatashin    2020-09-18  173   * either. Pages might be freed while their page blocks are marked ISOLATED.
7612921f2376d5 Vlastimil Babka   2020-12-14  174   * A call to drain_all_pages() after isolation can flush most of them. However
7612921f2376d5 Vlastimil Babka   2020-12-14  175   * in some cases pages might still end up on pcp lists and that would allow
9683182612214a Pavel Tatashin    2020-09-18  176   * for their allocation even when they are in fact isolated already. Depending
ec6e8c7e03147c Vlastimil Babka   2020-12-14  177   * on how strong of a guarantee the caller needs, zone_pcp_disable/enable()
ec6e8c7e03147c Vlastimil Babka   2020-12-14  178   * might be used to flush and disable pcplist before isolation and enable after
ec6e8c7e03147c Vlastimil Babka   2020-12-14  179   * unisolation.
9683182612214a Pavel Tatashin    2020-09-18  180   *
3fa0c7c79d2499 David Hildenbrand 2020-10-15  181   * Return: 0 on success and -EBUSY if any part of range cannot be isolated.
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  182   */
0815f3d81d76df Michal Nazarewicz 2012-04-03  183  int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
60d2dad38e3dce Minchan Kim       2021-06-29  184  			     unsigned migratetype, int flags,
60d2dad38e3dce Minchan Kim       2021-06-29  185  			     unsigned long *failed_pfn)
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16 @186  {
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  187  	unsigned long pfn;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  188  	unsigned long undo_pfn;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  189  	struct page *page;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  190  
fec174d6699e2e Naoya Horiguchi   2016-01-14  191  	BUG_ON(!IS_ALIGNED(start_pfn, pageblock_nr_pages));
fec174d6699e2e Naoya Horiguchi   2016-01-14  192  	BUG_ON(!IS_ALIGNED(end_pfn, pageblock_nr_pages));
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  193  
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  194  	for (pfn = start_pfn;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  195  	     pfn < end_pfn;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  196  	     pfn += pageblock_nr_pages) {
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  197  		page = __first_valid_page(pfn, pageblock_nr_pages);
9b7ea46a82b31c Qian Cai          2019-03-28  198  		if (page) {
9b7ea46a82b31c Qian Cai          2019-03-28  199  			if (set_migratetype_isolate(page, migratetype, flags)) {
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  200  				undo_pfn = pfn;
60d2dad38e3dce Minchan Kim       2021-06-29  201  				if (failed_pfn)
60d2dad38e3dce Minchan Kim       2021-06-29  202  					*failed_pfn = page_to_pfn(page);
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  203  				goto undo;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  204  			}
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  205  		}
9b7ea46a82b31c Qian Cai          2019-03-28  206  	}
3fa0c7c79d2499 David Hildenbrand 2020-10-15  207  	return 0;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  208  undo:
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  209  	for (pfn = start_pfn;
dbc0e4cefd0038 KAMEZAWA Hiroyuki 2007-11-14  210  	     pfn < undo_pfn;
2ce13640b3f4c8 Michal Hocko      2017-07-06  211  	     pfn += pageblock_nr_pages) {
2ce13640b3f4c8 Michal Hocko      2017-07-06  212  		struct page *page = pfn_to_online_page(pfn);
2ce13640b3f4c8 Michal Hocko      2017-07-06  213  		if (!page)
2ce13640b3f4c8 Michal Hocko      2017-07-06  214  			continue;
2ce13640b3f4c8 Michal Hocko      2017-07-06  215  		unset_migratetype_isolate(page, migratetype);
2ce13640b3f4c8 Michal Hocko      2017-07-06  216  	}
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  217  
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  218  	return -EBUSY;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  219  }
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  220  

:::::: The code at line 186 was first introduced by commit
:::::: a5d76b54a3f3a40385d7f76069a2feac9f1bad63 memory unplug: page isolation

:::::: TO: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
