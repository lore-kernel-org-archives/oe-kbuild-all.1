Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AE02C11E6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767532814; cv=none; b=TdWEt1Yk/iHJJelGS7xtduwlckVnR1+NGzU/o6G3jekDU4vvcXgq0Ly45SrvoWXNqy7xsfw5LghiOckcgF6gksaxk/6dM20RnnkEQFixAVEkvhRDysdgCUrGqI5KG/aL15BgnJRRMd/bwLBVp+Bm65AJJw+0MJZ71J+GxOKyFS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767532814; c=relaxed/simple;
	bh=2Uba3XouBCYbmycXAopvPJjYWL46ZVHnj/G4LPuhBV0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J6drm0ByTsJ+scG2C8U2ROA40t3hj3KGfOCTw64yBsSnuhZAsKgRi93t1Q9VM93DZh2OdhZ4OVNH8lSgHPAZ5fOomMUbZBO99RIIQTDxlEwWMxIrLo0XXNI/WJD3ux6dIgo9dULAa6q/bQjhy7UTwEBuqsUrM3SE6zPnw4A1WRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eo8EjNS7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eo8EjNS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767532811; x=1799068811;
  h=date:from:to:cc:subject:message-id;
  bh=2Uba3XouBCYbmycXAopvPJjYWL46ZVHnj/G4LPuhBV0=;
  b=eo8EjNS7JQIqBmWfI0usmv7M7LI8ACU0msf2oO1Ang+xCiqYoQT5QjOk
   A5+ncFbgjUTClWO7NjtZ/50g/cC7BetxBl+VcNziKMctQUelVEtyZ6Ji+
   mbNWPo8OGASrc0fAr5OZKX1DNWjEQ+9dhneXs5WYwGlW/WXbE8FP6NWoH
   qwKyswnZDGN14/91qjU3FNlChV48AFplhTtUaYc2B9xCmpPIrhD5zmQKS
   1JQxkIIUnVi5ZBX/WojMTBRNiWR0iVoKQJNqf+QbDpVEccrrK36lemVNJ
   8GaglDwrcXAzv9P90Y3bs08ZN0Sy4yTyUtSL2s0WUhm7h8RJ3miGabocC
   A==;
X-CSE-ConnectionGUID: 6Qry/0BwQc6viWeuxVW5zA==
X-CSE-MsgGUID: 1iAmfwqTQcitvjrmh6dR7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="72774530"
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="72774530"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 05:20:11 -0800
X-CSE-ConnectionGUID: JBix0DtwQ3CIujuwBQM/gA==
X-CSE-MsgGUID: 6NV6dtrvSCCvWLstv9g4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="233295463"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jan 2026 05:20:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcO1g-000000000ZN-3qQl;
	Sun, 04 Jan 2026 13:20:08 +0000
Date: Sun, 04 Jan 2026 21:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 190/190] mm/swap.c:488:
 warning: Function parameter or member 'vma_flags' not described in
 '__lru_cache_add_inactive_or_unevictable'
Message-ID: <202601042105.shrYKgsz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Laurent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   c9b5876b7945ef9caec188f04f7125b1c01d5a1d
commit: cbff8f39079ffd607e894aede8590d69cb6ba803 [190/190] FROMLIST: mm: introduce __lru_cache_add_active_or_unevictable
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260104/202601042105.shrYKgsz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601042105.shrYKgsz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601042105.shrYKgsz-lkp@intel.com/

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
