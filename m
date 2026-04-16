Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A752165F16
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 03:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776308722; cv=none; b=Pr93JwCccPuIP1zoiSZVv2AHFDsntk61EmJiJ2cRMKYl0pbc8hHpgFrJgoaDGodaTZBqxGr3Vn9MRTvj0qG1t/76tM5gqr2jN5GJCnOk0+CCh5o6d/Byg4/P0+tsd4wmkpxkOzx3kbjNPk7rTD+4bC+dCGe9jiWZnpfm4gPkcck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776308722; c=relaxed/simple;
	bh=CkC1ZBtjoa390TyIPnCBQnO93FlAx3bHfZRJSYFuP7U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WTbMpErMNRIwGxWlZmUtxYJm2QAdUxvh/vDVZmOV5oqHlUQKnnIXA25FOGRaiMESPcF0wPvsMiUuHCHUdw++NxPKaFauqt07LqHtEfoOBCKJ7uCz8+RxCrctlcxEv4f1342/LfUqh74RdpT3zTQzh/XdLfETRfuZuCyqNLA8nsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTIANOaY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTIANOaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776308720; x=1807844720;
  h=date:from:to:cc:subject:message-id;
  bh=CkC1ZBtjoa390TyIPnCBQnO93FlAx3bHfZRJSYFuP7U=;
  b=YTIANOaY16FOadvyAWDJzH+yK9r8NYn7nerZG0jz7cWKQt5hdXK77Fqt
   LI2tsldY8KviSAtvKdtovyAQhftjeVTJzJpvC68bOUsIgl3af+R62c8uB
   mOJsyFDyyTXQ95W96Ydg/21PBSBHWheubr8RB8KJP3M5XlTXnfsGaNy9h
   yYxiITF8hEJaoG77TvQ8te+ZmJn5sNaoziUolkul0fURQw5r9z0ctyGM4
   QpBtJP1RXLcznWB4b04dsIm3/OJdbzYaZOFUmoPj+JXxz0Fn7pWkPdyzh
   KzQYHJiWUlYdjp0Fp5GJQHC79ZrZQ5crih3SXyQWcSLFrMHvx2jy76Ivt
   Q==;
X-CSE-ConnectionGUID: xLfsa3nuQvG4/v1boWeWAQ==
X-CSE-MsgGUID: NCXUIYeXS++AvomFmowf4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87601999"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="87601999"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 20:05:19 -0700
X-CSE-ConnectionGUID: PWenkvx9Q7OK+M3B/o0EEA==
X-CSE-MsgGUID: gmi43Cx7RRqwlyx/vQNS9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="230534843"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Apr 2026 20:05:19 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDD2Z-000000001E6-3mb4;
	Thu, 16 Apr 2026 03:05:15 +0000
Date: Thu, 16 Apr 2026 11:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-04 1/1] mm/swap.c:488:
 warning: Function parameter or member 'vma_flags' not described in
 '__lru_cache_add_inactive_or_unevictable'
Message-ID: <202604161154.hAdy1M03-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Laurent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-04
head:   f782563dd4b9e9f005d55d232946ffaa340a1f61
commit: cbff8f39079ffd607e894aede8590d69cb6ba803 [1/1] FROMLIST: mm: introduce __lru_cache_add_active_or_unevictable
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260416/202604161154.hAdy1M03-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161154.hAdy1M03-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161154.hAdy1M03-lkp@intel.com/

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
