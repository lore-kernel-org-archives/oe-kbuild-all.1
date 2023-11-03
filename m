Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C662374F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 22:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqiq11An"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699052368; x=1730588368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TJJ0zDnL5na/TtB9tkVmp3zaW/jnPJO45sAocb7k2Hw=;
  b=mqiq11AnyDoNu5m1jGsCiUIi8m8nTjGRm9pN3XpEqaZ8ez+66NOw/wvK
   sKVUmPN1zurPVMtCgLsSKRx4znTzNzEwZz5PxO2qgVl1IUgwL0pSrkFta
   Azy2bgY4XmyYs/XRptKXMKeFXY0CJ+U75jpKa+GRUaee3oaj5yVg2NgTL
   3F39o/sI+MYMfDN7Ow3i8vFtsH9otg7SWFONv6Rs2ZKYCOquARWnXEm5O
   tN9qtaqZkX2J41ZCbRaDAvnXhmghx38XkC3zie5jdy77j4Ip6FmA2g4UB
   0eBTOTTxAztUMcM9G9yFcbB/7ZtyZPg2F7Ap5//xgaNl9N4ecOOhTzrXq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387923837"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="387923837"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 15:59:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="852408232"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="852408232"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2023 15:59:26 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz38O-000320-1G;
	Fri, 03 Nov 2023 22:59:24 +0000
Date: Sat, 4 Nov 2023 06:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 3314/30000] mm/swap.c:488: warning:
 Function parameter or member 'vma_flags' not described in
 '__lru_cache_add_inactive_or_unevictable'
Message-ID: <202311040644.8s6ACe40-lkp@intel.com>
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
commit: cbff8f39079ffd607e894aede8590d69cb6ba803 [3314/30000] FROMLIST: mm: introduce __lru_cache_add_active_or_unevictable
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231104/202311040644.8s6ACe40-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040644.8s6ACe40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040644.8s6ACe40-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap.c:488: warning: Function parameter or member 'vma_flags' not described in '__lru_cache_add_inactive_or_unevictable'
>> mm/swap.c:488: warning: Excess function parameter 'vma' description in '__lru_cache_add_inactive_or_unevictable'


vim +488 mm/swap.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  477  
00501b531c4723 Johannes Weiner 2014-08-08  478  /**
b518154e59aab3 Joonsoo Kim     2020-08-11  479   * lru_cache_add_inactive_or_unevictable
00501b531c4723 Johannes Weiner 2014-08-08  480   * @page:  the page to be added to LRU
00501b531c4723 Johannes Weiner 2014-08-08  481   * @vma:   vma in which page is mapped for determining reclaimability
00501b531c4723 Johannes Weiner 2014-08-08  482   *
b518154e59aab3 Joonsoo Kim     2020-08-11  483   * Place @page on the inactive or unevictable LRU list, depending on its
12eab4289d3203 Miaohe Lin      2020-10-13  484   * evictability.
00501b531c4723 Johannes Weiner 2014-08-08  485   */
cbff8f39079ffd Laurent Dufour  2018-04-17  486  void __lru_cache_add_inactive_or_unevictable(struct page *page,
cbff8f39079ffd Laurent Dufour  2018-04-17  487  					 unsigned long vma_flags)
00501b531c4723 Johannes Weiner 2014-08-08 @488  {
b518154e59aab3 Joonsoo Kim     2020-08-11  489  	bool unevictable;
b518154e59aab3 Joonsoo Kim     2020-08-11  490  
00501b531c4723 Johannes Weiner 2014-08-08  491  	VM_BUG_ON_PAGE(PageLRU(page), page);
00501b531c4723 Johannes Weiner 2014-08-08  492  
cbff8f39079ffd Laurent Dufour  2018-04-17  493  	unevictable = (vma_flags & (VM_LOCKED | VM_SPECIAL)) == VM_LOCKED;
b518154e59aab3 Joonsoo Kim     2020-08-11  494  	if (unlikely(unevictable) && !TestSetPageMlocked(page)) {
0964730bf46b4e Hugh Dickins    2020-09-18  495  		int nr_pages = thp_nr_pages(page);
00501b531c4723 Johannes Weiner 2014-08-08  496  		/*
00501b531c4723 Johannes Weiner 2014-08-08  497  		 * We use the irq-unsafe __mod_zone_page_stat because this
00501b531c4723 Johannes Weiner 2014-08-08  498  		 * counter is not modified from interrupt context, and the pte
00501b531c4723 Johannes Weiner 2014-08-08  499  		 * lock is held(spinlock), which implies preemption disabled.
00501b531c4723 Johannes Weiner 2014-08-08  500  		 */
0964730bf46b4e Hugh Dickins    2020-09-18  501  		__mod_zone_page_state(page_zone(page), NR_MLOCK, nr_pages);
0964730bf46b4e Hugh Dickins    2020-09-18  502  		count_vm_events(UNEVICTABLE_PGMLOCKED, nr_pages);
00501b531c4723 Johannes Weiner 2014-08-08  503  	}
9c4e6b1a7027f1 Shakeel Butt    2018-02-21  504  	lru_cache_add(page);
00501b531c4723 Johannes Weiner 2014-08-08  505  }
00501b531c4723 Johannes Weiner 2014-08-08  506  

:::::: The code at line 488 was first introduced by commit
:::::: 00501b531c4723972aa11d6d4ebcf8d6552007c8 mm: memcontrol: rewrite charge API

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
