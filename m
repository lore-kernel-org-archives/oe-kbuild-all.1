Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C7579D2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 01:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744594652; cv=none; b=iHL2KHlatYskAtrksmBWwZKUtU2A+FDoTwZ4VUYxmeM5qJyJu4Su4L4f4FSRTC0zZYLl0LQi8MbGEUfROkuY2XuEmREH2a5MtddKlqLVCU7Tbf1QzH3MLoZBjHVUU0fKF0PSaegSf5BMJ/JxvV+Sx11tTcVmbzl0x6g1+urHRWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744594652; c=relaxed/simple;
	bh=6IlL9q7lUp5Izr9p3lUm9RtHREoS6M5ztWvh/07GqN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lUi45TNjKvGDQeeNNZAeC/WQ0/unBxy5l6ru7wqTiPNdm3uwwsaT7cG5VyRVybHj5iPoSSIFxBzBkRLytWPdrA12zyiqv36yoX4R81i1vOFf2gWjsmsybMuPBkcBiGLbZnOpx7ziLLXvgdQQaRYJQ4Zii++1Uv/y7GPuXjcN1k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyzKqTMD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyzKqTMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744594650; x=1776130650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6IlL9q7lUp5Izr9p3lUm9RtHREoS6M5ztWvh/07GqN8=;
  b=iyzKqTMDxZ/ZUSnYOPrpMt2hX5y6bPmoGTgWTP3hUsgowKH49WwQogk5
   xqsPnMqDSF7pn19t0m1vKnxJKxIMxarNUPsLcYQO6IMicVe72J5vnRZ7/
   HkGjDXLGTny04xLJkvszmzobsD5hTHMX+oo75pby2xbIXUTQt89SXgOSS
   XVy5KwgNpaeuEiroUB+04cIRuC8PvbeS/gyDvmIQJez5tsLHozlfpUqBo
   9LHvs0V5rlPAyoAaLuXf1SaKqwnBTgGpAWeaVLr2ZqwsSTbXZySq6UMq0
   qDVcMpuFUWAZQNR5Vl0XvYbY6Yml9Bop9PzeW/Amz4lOjqalrw92fmGPg
   w==;
X-CSE-ConnectionGUID: dHXuz5hSSaq3TB0n7MfWew==
X-CSE-MsgGUID: iKtBuww6SWOK+2rar44cnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45936006"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="45936006"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 18:37:30 -0700
X-CSE-ConnectionGUID: AjFWkhDuS7u27L7c9lCZBg==
X-CSE-MsgGUID: 78qRFZZXRsu9Rcm8zoo+WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="134427528"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Apr 2025 18:37:28 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u48lK-000D3y-1c;
	Mon, 14 Apr 2025 01:37:26 +0000
Date: Mon, 14 Apr 2025 09:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 16/16] mm/compaction.c:508:8: error:
 dereferencing pointer to incomplete type 'struct compact_control'
Message-ID: <202504140937.cQIKssQy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   07b1b56f4f50e3b2ce6818d9ca0fbdbcd138d66f
commit: 07b1b56f4f50e3b2ce6818d9ca0fbdbcd138d66f [16/16] tmp
config: arm-randconfig-002-20250414 (https://download.01.org/0day-ci/archive/20250414/202504140937.cQIKssQy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504140937.cQIKssQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504140937.cQIKssQy-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/compaction.c:468:46: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
    static inline bool isolation_suitable(struct compact_control *cc,
                                                 ^~~~~~~~~~~~~~~
   mm/compaction.c:479:49: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void update_pageblock_skip(struct compact_control *cc,
                                                    ^~~~~~~~~~~~~~~
   mm/compaction.c:484:42: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
    static void update_cached_migrate(struct compact_control *cc, unsigned long pfn)
                                             ^~~~~~~~~~~~~~~
   mm/compaction.c:488:38: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
    static bool test_and_set_skip(struct compact_control *cc, struct page *page)
                                         ^~~~~~~~~~~~~~~
   mm/compaction.c:504:14: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
          struct compact_control *cc)
                 ^~~~~~~~~~~~~~~
   mm/compaction.c: In function 'compact_lock_irqsave':
>> mm/compaction.c:508:8: error: dereferencing pointer to incomplete type 'struct compact_control'
     if (cc->mode == MIGRATE_ASYNC && !cc->contended) {
           ^~
   mm/compaction.c: At top level:
   mm/compaction.c:532:45: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
      unsigned long flags, bool *locked, struct compact_control *cc)
                                                ^~~~~~~~~~~~~~~
   mm/compaction.c: In function 'compact_unlock_should_abort':
   mm/compaction.c:540:5: error: dereferencing pointer to incomplete type 'struct compact_control'
      cc->contended = true;
        ^~
   mm/compaction.c: At top level:
   mm/compaction.c:554:53: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
    static unsigned long isolate_freepages_block(struct compact_control *cc,
                                                        ^~~~~~~~~~~~~~~
   mm/compaction.c: In function 'isolate_freepages_block':
   mm/compaction.c:584:41: error: dereferencing pointer to incomplete type 'struct compact_control'
          && compact_unlock_should_abort(&cc->zone->lock, flags,
                                            ^~
   mm/compaction.c:585:18: error: passing argument 4 of 'compact_unlock_should_abort' from incompatible pointer type [-Werror=incompatible-pointer-types]
            &locked, cc))
                     ^~
   mm/compaction.c:531:13: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
    static bool compact_unlock_should_abort(spinlock_t *lock,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:615:17: error: passing argument 3 of 'compact_lock_irqsave' from incompatible pointer type [-Werror=incompatible-pointer-types]
            &flags, cc);
                    ^~
   mm/compaction.c:503:13: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
    static bool compact_lock_irqsave(spinlock_t *lock, unsigned long *flags,
                ^~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:658:2: error: implicit declaration of function 'trace_mm_compaction_isolate_freepages' [-Werror=implicit-function-declaration]
     trace_mm_compaction_isolate_freepages(*start_pfn, blockpfn,
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c: At top level:
   mm/compaction.c:693:32: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
    isolate_freepages_range(struct compact_control *cc,
                                   ^~~~~~~~~~~~~~~
   mm/compaction.c: In function 'isolate_freepages_range':
   mm/compaction.c:700:21: error: dereferencing pointer to incomplete type 'struct compact_control'
      INIT_LIST_HEAD(&cc->freepages[order]);
                        ^~
   mm/compaction.c:730:38: error: passing argument 1 of 'isolate_freepages_block' from incompatible pointer type [-Werror=incompatible-pointer-types]
      isolated = isolate_freepages_block(cc, &isolate_start_pfn,
                                         ^~
   mm/compaction.c:554:22: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
    static unsigned long isolate_freepages_block(struct compact_control *cc,
                         ^~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:750:3: error: implicit declaration of function 'release_free_list'; did you mean 'release_region'? [-Werror=implicit-function-declaration]
      release_free_list(cc->freepages);
      ^~~~~~~~~~~~~~~~~
      release_region
   mm/compaction.c: At top level:
   mm/compaction.c:759:38: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
    static bool too_many_isolated(struct compact_control *cc)
                                         ^~~~~~~~~~~~~~~
   mm/compaction.c: In function 'too_many_isolated':
   mm/compaction.c:761:23: error: dereferencing pointer to incomplete type 'struct compact_control'
     pg_data_t *pgdat = cc->zone->zone_pgdat;
                          ^~
   mm/compaction.c: At top level:
   mm/compaction.c:835:35: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
    isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
                                      ^~~~~~~~~~~~~~~
   mm/compaction.c: In function 'isolate_migratepages_block':
   mm/compaction.c:838:23: error: dereferencing pointer to incomplete type 'struct compact_control'
     pg_data_t *pgdat = cc->zone->zone_pgdat;
                          ^~
   In file included from include/linux/dev_printk.h:14:0,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from mm/compaction.c:11:
   mm/compaction.c:859:36: error: passing argument 1 of 'too_many_isolated' from incompatible pointer type [-Werror=incompatible-pointer-types]
     while (unlikely(too_many_isolated(cc))) {
                                       ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   mm/compaction.c:759:13: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
    static bool too_many_isolated(struct compact_control *cc)
                ^~~~~~~~~~~~~~~~~
   mm/compaction.c:878:19: error: implicit declaration of function 'block_end_pfn'; did you mean 'zone_end_pfn'? [-Werror=implicit-function-declaration]
      next_skip_pfn = block_end_pfn(low_pfn, cc->order);
                      ^~~~~~~~~~~~~
                      zone_end_pfn
   mm/compaction.c:940:28: error: passing argument 1 of 'isolation_suitable' from incompatible pointer type [-Werror=incompatible-pointer-types]
       if (!isolation_suitable(cc, page)) {
                               ^~
   mm/compaction.c:468:20: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
    static inline bool isolation_suitable(struct compact_control *cc,
                       ^~~~~~~~~~~~~~~~~~
   mm/compaction.c:1159:52: error: passing argument 3 of 'compact_lock_irqsave' from incompatible pointer type [-Werror=incompatible-pointer-types]
       compact_lock_irqsave(&lruvec->lru_lock, &flags, cc);
                                                       ^~
   mm/compaction.c:503:13: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
    static bool compact_lock_irqsave(spinlock_t *lock, unsigned long *flags,
                ^~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:1171:27: error: passing argument 1 of 'test_and_set_skip' from incompatible pointer type [-Werror=incompatible-pointer-types]
        if (test_and_set_skip(cc, valid_page) &&
                              ^~


vim +508 mm/compaction.c

bb13ffeb9f6bfe Mel Gorman      2012-10-08  493  
1f9efdef4f3f1d Vlastimil Babka 2014-10-09  494  /*
8b44d2791f9125 Vlastimil Babka 2014-10-09  495   * Compaction requires the taking of some coarse locks that are potentially
cb2dcaf023c2cf Mel Gorman      2019-03-05  496   * very heavily contended. For async compaction, trylock and record if the
cb2dcaf023c2cf Mel Gorman      2019-03-05  497   * lock is contended. The lock will still be acquired but compaction will
cb2dcaf023c2cf Mel Gorman      2019-03-05  498   * abort when the current block is finished regardless of success rate.
cb2dcaf023c2cf Mel Gorman      2019-03-05  499   * Sync compaction acquires the lock.
8b44d2791f9125 Vlastimil Babka 2014-10-09  500   *
cb2dcaf023c2cf Mel Gorman      2019-03-05  501   * Always returns true which makes it easier to track lock state in callers.
1f9efdef4f3f1d Vlastimil Babka 2014-10-09  502   */
cb2dcaf023c2cf Mel Gorman      2019-03-05  503  static bool compact_lock_irqsave(spinlock_t *lock, unsigned long *flags,
8b44d2791f9125 Vlastimil Babka 2014-10-09  504  						struct compact_control *cc)
77337edee7598d Jules Irenge    2020-04-06  505  	__acquires(lock)
8b44d2791f9125 Vlastimil Babka 2014-10-09  506  {
cb2dcaf023c2cf Mel Gorman      2019-03-05  507  	/* Track if the lock is contended in async mode */
cb2dcaf023c2cf Mel Gorman      2019-03-05 @508  	if (cc->mode == MIGRATE_ASYNC && !cc->contended) {
cb2dcaf023c2cf Mel Gorman      2019-03-05  509  		if (spin_trylock_irqsave(lock, *flags))
cb2dcaf023c2cf Mel Gorman      2019-03-05  510  			return true;
cb2dcaf023c2cf Mel Gorman      2019-03-05  511  
c3486f53766960 Vlastimil Babka 2016-07-28  512  		cc->contended = true;
8b44d2791f9125 Vlastimil Babka 2014-10-09  513  	}
1f9efdef4f3f1d Vlastimil Babka 2014-10-09  514  
cb2dcaf023c2cf Mel Gorman      2019-03-05  515  	spin_lock_irqsave(lock, *flags);
8b44d2791f9125 Vlastimil Babka 2014-10-09  516  	return true;
2a1402aa044b55 Mel Gorman      2012-10-08  517  }
2a1402aa044b55 Mel Gorman      2012-10-08  518  

:::::: The code at line 508 was first introduced by commit
:::::: cb2dcaf023c2cf12d45289c82d4030d33f7df73e mm, compaction: finish pageblock scanning on contention

:::::: TO: Mel Gorman <mgorman@techsingularity.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
