Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4C81CAA8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 02:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712198748; cv=none; b=iabEryL+MkU3LWcVkZgoUTIT9w6poPOZP/IaXKEV2v7fRBkzqdej+grHHecClCATb2h68LMDsG5kC6TpyZPyQE579Ze4LEplN5HzrvwNUASDMLOre+Np8zC/NQSocK3NLUHCIEBAXcXdQgWDYEDJJGqvf71qhONapD3pxxOHA40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712198748; c=relaxed/simple;
	bh=82AvpGs4FjTag3ZLiK61SP9pdnQYbq10CAQnPkGcBgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/JrSYFyiy8KJhud+5gGWDTag5jDKpXaJItokebecPstfu+wfZ4ciFa26Vw6Iv0TNZz4mR5GPuzUJYn943r3oVbm7mos0PGhy8DFQ/k6p80ANE+m/hAjh//+cdk7y3bsd8oJvFLf20/tTsYLH9VTprTcpOarAAz7/3K7w+poZ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtIOzhGU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtIOzhGU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712198746; x=1743734746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=82AvpGs4FjTag3ZLiK61SP9pdnQYbq10CAQnPkGcBgo=;
  b=JtIOzhGUlf7kXKkFPX3mrRhMM2ri85qZEHJPO4jPPj3RgBR/Nh3cdi0y
   S+YV4+uD/qef8TWS23o4zBKCy6pUdyLVaRPJvT6i7GvcEgT0pq9GjjS5s
   Mtjyop9vljGjK9o5lBvRXAVmxXhRvDOaU9971Km2Do2ud7/nzlctoyrOp
   frMJubLUI9lDGs2vC2cRBUlrn/y+dFXn0PFQAkeThHOtO0QfwIE/j7boh
   d8TGlZxid3pZc3p12vKJv3GxAqIZAWO/vrQ9WGjrz+QG3eCqTO6gaS471
   A6fmhmCYDLGGUqNIwC12T5POReR5wNI8oEnZ6rhiVY45crQLViFBlCUZ9
   A==;
X-CSE-ConnectionGUID: sl6wiRD8Q6iidnMAFQn7Rw==
X-CSE-MsgGUID: R2krxkybScKstWSTrMpqDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11237563"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="11237563"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 19:45:25 -0700
X-CSE-ConnectionGUID: ZElGDPOiRyqfLv8RdmhCJw==
X-CSE-MsgGUID: ohZQwvsQSE2XTANwMTE+9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="23390866"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Apr 2024 19:45:22 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsD6O-0000Vy-13;
	Thu, 04 Apr 2024 02:45:20 +0000
Date: Thu, 4 Apr 2024 10:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3462/3504] mm/huge_memory.c:207:13: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202404041017.bDUZVz4r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   727900b675b749c40ba1f6669c7ae5eb7eb8e837
commit: 284f5619c605dadceadcad1e807cd08503ae13c5 [3462/3504] Merge branch 'rcu/next' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
config: riscv-randconfig-r112-20240403 (https://download.01.org/0day-ci/archive/20240404/202404041017.bDUZVz4r-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240404/202404041017.bDUZVz4r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041017.bDUZVz4r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/huge_memory.c:207:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct folio *__old @@
   mm/huge_memory.c:207:13: sparse:     expected unsigned long [usertype] old
   mm/huge_memory.c:207:13: sparse:     got struct folio *__old
>> mm/huge_memory.c:207:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct folio *__new @@
   mm/huge_memory.c:207:13: sparse:     expected unsigned long [usertype] new
   mm/huge_memory.c:207:13: sparse:     got struct folio *__new
>> mm/huge_memory.c:207:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct folio *__ret @@     got unsigned long @@
   mm/huge_memory.c:207:13: sparse:     expected struct folio *__ret
   mm/huge_memory.c:207:13: sparse:     got unsigned long
>> mm/huge_memory.c:207:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct folio *__old @@
   mm/huge_memory.c:207:13: sparse:     expected unsigned long [usertype] old
   mm/huge_memory.c:207:13: sparse:     got struct folio *__old
>> mm/huge_memory.c:207:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct folio *__new @@
   mm/huge_memory.c:207:13: sparse:     expected unsigned long [usertype] new
   mm/huge_memory.c:207:13: sparse:     got struct folio *__new
>> mm/huge_memory.c:207:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct folio *__ret @@     got unsigned long @@
   mm/huge_memory.c:207:13: sparse:     expected struct folio *__ret
   mm/huge_memory.c:207:13: sparse:     got unsigned long
   mm/huge_memory.c:1743:20: sparse: sparse: context imbalance in 'madvise_free_huge_pmd' - unexpected unlock
   mm/huge_memory.c:1781:28: sparse: sparse: context imbalance in 'zap_huge_pmd' - unexpected unlock
   mm/huge_memory.c:1892:28: sparse: sparse: context imbalance in 'move_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2033:20: sparse: sparse: context imbalance in 'change_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2068:28: sparse: sparse: context imbalance in 'move_pages_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2183:12: sparse: sparse: context imbalance in '__pmd_trans_huge_lock' - wrong count at exit
   mm/huge_memory.c:2303:18: sparse: sparse: context imbalance in '__split_huge_zero_page_pmd' - unexpected unlock
   mm/huge_memory.c:2514:18: sparse: sparse: context imbalance in '__split_huge_pmd_locked' - unexpected unlock
   mm/huge_memory.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   mm/huge_memory.c:2841:9: sparse: sparse: context imbalance in '__split_huge_page' - different lock contexts for basic block
   mm/huge_memory.c:3098:17: sparse: sparse: context imbalance in 'split_huge_page_to_list_to_order' - different lock contexts for basic block
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +207 mm/huge_memory.c

7635d9cbe8327e Michal Hocko            2018-12-28  192  
aaa9705b4af360 Miaohe Lin              2021-05-04  193  static bool get_huge_zero_page(void)
97ae17497e996f Kirill A. Shutemov      2012-12-12  194  {
6c768b74689de7 Matthew Wilcox (Oracle  2024-03-26  195) 	struct folio *zero_folio;
97ae17497e996f Kirill A. Shutemov      2012-12-12  196  retry:
97ae17497e996f Kirill A. Shutemov      2012-12-12  197  	if (likely(atomic_inc_not_zero(&huge_zero_refcount)))
aaa9705b4af360 Miaohe Lin              2021-05-04  198  		return true;
97ae17497e996f Kirill A. Shutemov      2012-12-12  199  
6c768b74689de7 Matthew Wilcox (Oracle  2024-03-26  200) 	zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO) & ~__GFP_MOVABLE,
4a6c1297268c91 Kirill A. Shutemov      2012-12-12  201  			HPAGE_PMD_ORDER);
6c768b74689de7 Matthew Wilcox (Oracle  2024-03-26  202) 	if (!zero_folio) {
d8a8e1f0da3d29 Kirill A. Shutemov      2012-12-12  203  		count_vm_event(THP_ZERO_PAGE_ALLOC_FAILED);
aaa9705b4af360 Miaohe Lin              2021-05-04  204  		return false;
d8a8e1f0da3d29 Kirill A. Shutemov      2012-12-12  205  	}
97ae17497e996f Kirill A. Shutemov      2012-12-12  206  	preempt_disable();
6c768b74689de7 Matthew Wilcox (Oracle  2024-03-26 @207) 	if (cmpxchg(&huge_zero_folio, NULL, zero_folio)) {
97ae17497e996f Kirill A. Shutemov      2012-12-12  208  		preempt_enable();
6c768b74689de7 Matthew Wilcox (Oracle  2024-03-26  209) 		folio_put(zero_folio);
97ae17497e996f Kirill A. Shutemov      2012-12-12  210  		goto retry;
4a6c1297268c91 Kirill A. Shutemov      2012-12-12  211  	}
6c768b74689de7 Matthew Wilcox (Oracle  2024-03-26  212) 	WRITE_ONCE(huge_zero_pfn, folio_pfn(zero_folio));
4a6c1297268c91 Kirill A. Shutemov      2012-12-12  213  
97ae17497e996f Kirill A. Shutemov      2012-12-12  214  	/* We take additional reference here. It will be put back by shrinker */
97ae17497e996f Kirill A. Shutemov      2012-12-12  215  	atomic_set(&huge_zero_refcount, 2);
97ae17497e996f Kirill A. Shutemov      2012-12-12  216  	preempt_enable();
f4981502088f8e Liu Shixin              2022-09-09  217  	count_vm_event(THP_ZERO_PAGE_ALLOC);
aaa9705b4af360 Miaohe Lin              2021-05-04  218  	return true;
97ae17497e996f Kirill A. Shutemov      2012-12-12  219  }
97ae17497e996f Kirill A. Shutemov      2012-12-12  220  

:::::: The code at line 207 was first introduced by commit
:::::: 6c768b74689de72ea86a428597acc9f0ef0c9236 mm: convert huge_zero_page to huge_zero_folio

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
