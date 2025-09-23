Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD8426C3A2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 03:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758599735; cv=none; b=EKOOwQMq88xL1e7eCVVulZPX3Qc8Hi2Khh2sJSFSY0WBszEc7QFmhnF4zhYUe+hDqY6982tJO2iEzURxzYCQFXy7SsZYoh5qpD6uVreSbed0+VnEAUeZ7hpGD1Ed9JUU/juJEQ3Te3rEGOfUe3DNxrQqjRwi2NdUCZRAqI55OEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758599735; c=relaxed/simple;
	bh=662XpNeq2uLr73Za4Fr79L41By29MpU4T2QTiUqN7hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iKw9hHPnKJKJ6N1bE9DQC0pNtuFYFC5S1SQlaG6mPRrFlXKF0yaREisf3O08vqAYdgENhd2+g+v+3pTKC7PULNus44V3OkIPjJRicXMSmMLkPlqtzax3f0+fS0TTaZJ9cIBl0yf6MJNaPUZjJFvG4iSx38vm8w91rFgOKCBe+hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INgdVKIq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INgdVKIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758599734; x=1790135734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=662XpNeq2uLr73Za4Fr79L41By29MpU4T2QTiUqN7hg=;
  b=INgdVKIqTuvu4VzQsid/mQBgCWuVfkgJF5O8g7IJKY0eZqLZ/t4TjkCB
   qMdSpYAK2YB1Xu+Vq86/MIBSiDmGLkpC3Iov027k71L+/FHT79e7Lces1
   iYqIt/FV0e5YB0SsOcu3JDKKx95Ix5RLrNa2MPQN1XDjn9jDu1vV7muYU
   CGkTuV2tGgqwH6VlHM7moSW0+l4ron4fy81BzCUJT1LSQzeY5chfiKLnP
   ZGv+4ANfDF3M+lHEhDCggyXjYHlskBodHh7I01f8QlN4xxH9R0hNydAhW
   hQ+FhyBTTvpcG0t/EPMNDzzQOqOLrx7bMN3gc5pTlOXtMzKuuYdhfavO8
   g==;
X-CSE-ConnectionGUID: WIZeMBTWTDSnjizqOmMc7w==
X-CSE-MsgGUID: E7mFm76nSmixYAjOLfNdMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64512161"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="64512161"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 20:55:33 -0700
X-CSE-ConnectionGUID: kjCU5+vLSuOVzyRpyjsfLA==
X-CSE-MsgGUID: rj7pBAljTmKLNbdzaejbqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="175937271"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Sep 2025 20:55:33 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0u7m-0002j5-0b;
	Tue, 23 Sep 2025 03:55:30 +0000
Date: Tue, 23 Sep 2025 11:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] mm/swap.c:488: warning: Function
 parameter or member 'vma_flags' not described in
 '__lru_cache_add_inactive_or_unevictable'
Message-ID: <202509231127.4MEr0l5S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   bd0e4cef233d7f95e320d36ced31a23b952ab0cd
commit: cbff8f39079ffd607e894aede8590d69cb6ba803 [1/1] FROMLIST: mm: introduce __lru_cache_add_active_or_unevictable
config: i386-buildonly-randconfig-001-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231127.4MEr0l5S-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231127.4MEr0l5S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231127.4MEr0l5S-lkp@intel.com/

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
