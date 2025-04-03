Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD3A1A76D4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 05:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743658885; cv=none; b=t6jOJ4/gwmzP5rAICAjIKWf3MzIL4xIeo2WpwGbCQ4wVT9YL45FMZN41WUAp1C7y0rl5OlIynGYpaGk7P80XN5DrxnE234wFxyPWAYkecEAzNQ3oMLCdfbwnbi5GU1LCaXRnXH6pOMf073p8pdfHksyrPX4iraj3maJDAl/cLnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743658885; c=relaxed/simple;
	bh=Gb1V3cYwdplWqRDFaIXTPZIRUKkcCMr1TfjU6hcZ7UE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tnIypqJLC404oDSiCSL7OhkmsfLoJ4xCWhemE6OWPn3AddcIL3zaE1sjGf4kmk6zUqjL8sB4UKiO/nYp53pqJHqTcy20SERn2b5qf1tXyvZMtZ2GeqCn6wvRHmzjjj5F8BkjoEecXi8UhnTTk6M9g4HxoFx550DFfPbS/JCUi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKLsNoY+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKLsNoY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743658883; x=1775194883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gb1V3cYwdplWqRDFaIXTPZIRUKkcCMr1TfjU6hcZ7UE=;
  b=XKLsNoY+YLpdLDTgX2Qt7cEAQy9cx8jFqirrzSB4u7a1g+n1SqOuSK1I
   fanm+1R+VN5ZlhqzyAiwXp3oO3qLAphuSsQ/Fg0e6zlJ/uY7Q8dQjQ5A9
   6ROeCb5VDl7Yr55U/BTNz466clUav+2SjFn2yC+TDuuO3/u0WxWn/nWBJ
   4+FJ6XOMTTuDHjrku+KkyOJJfG7eLyPAU9kVGzLfOpnnIgyhXzRE62NDW
   ty4rIb5fJ6oPWBM7PWGVZwR5jP+7E0JhgWnzADJjhNUONtks6QaINdBxY
   iKDD8QbY0jfINSJc6e8msrL/itGZHma5/83kx+DZ8BcC3CHdN5jbeq+xd
   g==;
X-CSE-ConnectionGUID: MsMvEgDnTLiQOgeC8gqZ9A==
X-CSE-MsgGUID: 3ze+sWaURZOhqmcKMOG4gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56413353"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="56413353"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 22:41:22 -0700
X-CSE-ConnectionGUID: RYj6bE9VQfKG0GsR/SXlbg==
X-CSE-MsgGUID: NUbcymSJQGmugiBO0JoqNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="150109535"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Apr 2025 22:41:21 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0DKJ-00006t-2e;
	Thu, 03 Apr 2025 05:41:19 +0000
Date: Thu, 3 Apr 2025 13:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:for_each_valid_pfn 2/3] mm/mm_init.c:782:8: error: macro
 "max_t" requires 3 arguments, but only 2 given
Message-ID: <202504031359.ztaDG2Zz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux for_each_valid_pfn
head:   d631358395f81d22f3df81ec055aa651c63b4e62
commit: 9b52dd6530f19b4948e6a5068c6870807349322d [2/3] mm: Implement for_each_valid_pfn() for CONFIG_FLATMEM
config: i386-buildonly-randconfig-004-20250403 (https://download.01.org/0day-ci/archive/20250403/202504031359.ztaDG2Zz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031359.ztaDG2Zz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031359.ztaDG2Zz-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mm_init.c: In function 'reserve_bootmem_region':
>> mm/mm_init.c:782:8: error: macro "max_t" requires 3 arguments, but only 2 given
     782 |         for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {
         | ^       ~~
   In file included from include/linux/kernel.h:28,
                    from mm/mm_init.c:9:
   include/linux/minmax.h:169: note: macro "max_t" defined here
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         | 
   In file included from arch/x86/include/asm/page.h:89,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/smp.h:118,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from mm/mm_init.c:11:
>> include/asm-generic/memory_model.h:53:20: error: 'max_t' undeclared (first use in this function); did you mean 'rmap_t'?
      53 |         for (pfn = max_t(unsigned long  start_pfn, ARCH_PFN_OFFSET);           \
         |                    ^~~~~
   mm/mm_init.c:782:9: note: in expansion of macro 'for_each_valid_pfn'
     782 |         for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:53:20: note: each undeclared identifier is reported only once for each function it appears in
      53 |         for (pfn = max_t(unsigned long  start_pfn, ARCH_PFN_OFFSET);           \
         |                    ^~~~~
   mm/mm_init.c:782:9: note: in expansion of macro 'for_each_valid_pfn'
     782 |         for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {
         |         ^~~~~~~~~~~~~~~~~~


vim +/max_t +782 mm/mm_init.c

9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  770) 
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  771) /*
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  772)  * Initialised pages do not have PageReserved set. This function is
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  773)  * called for each range allocated by the bootmem allocator and
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  774)  * marks the pages PageReserved. The remaining valid pages are later
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  775)  * sent to the buddy page allocator.
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  776)  */
61167ad5fecdea Yajun Deng          2023-06-19  777  void __meminit reserve_bootmem_region(phys_addr_t start,
61167ad5fecdea Yajun Deng          2023-06-19  778  				      phys_addr_t end, int nid)
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  779) {
928aaaa953c4b3 David Woodhouse     2025-04-02  780  	unsigned long pfn;
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  781) 
928aaaa953c4b3 David Woodhouse     2025-04-02 @782  	for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {
928aaaa953c4b3 David Woodhouse     2025-04-02  783  		struct page *page = pfn_to_page(pfn);
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  784) 
928aaaa953c4b3 David Woodhouse     2025-04-02  785  		init_deferred_page(pfn, nid);
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  786) 
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  787) 		/*
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  788) 		 * no need for atomic set_bit because the struct
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  789) 		 * page is not visible yet so nobody should
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  790) 		 * access it yet.
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  791) 		 */
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  792) 		__SetPageReserved(page);
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  793) 	}
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  794) }
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  795) 

:::::: The code at line 782 was first introduced by commit
:::::: 928aaaa953c4b3f31da75231989522934a140282 mm: Introduce for_each_valid_pfn() and use it from reserve_bootmem_region()

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: David Woodhouse <dwmw@amazon.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
