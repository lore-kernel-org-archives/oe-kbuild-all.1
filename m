Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937537F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 00:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688776337; x=1720312337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O8bjMnnf1Cx2ClFDuQpT4PnnoXRoFQJHzeEZElQMmbk=;
  b=bRRN7Wj8XCrOduxrUUKHGYqSBghxlwu/E9YwCM8KYnNNmCNmqCKvOKCJ
   ErnPtqEifYhBSYFsOcJkXW6Lx09IsGfB+ZEH9zDkPQ1pKmtyPOQB9EUye
   BOuCEYPwlwaFWxV1QcZxJIkzmITaMpPXGMjg84N6uavaWxCS1rtSiFOtg
   TtBY8rfwWtMtQNwACG+Raywe7nx1yaEMoNYlg89Hxgxm21kgiilD+a4H/
   6H1CBMFSuvo6uhirEKaoyqfuM73bPBEuosNdkaiC3/SysKK7az9sNJ3ik
   9y5J3y+xKY2uvVGSjS17znxl6FkMun5CMU+65nL09oEc3DqEESYBtZrmE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="427696833"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="427696833"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 17:32:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="864724582"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="864724582"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2023 17:32:15 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHvry-0002QQ-3C;
	Sat, 08 Jul 2023 00:32:14 +0000
Date: Sat, 8 Jul 2023 08:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 9/38] arch/arm/mm/fault-armv.c:201:2:
 error: must use 'struct' tag to refer to type 'folio'
Message-ID: <202307080809.g6EnqjvD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   72c34bd0b2a432506d992bdc1e3a89260461667d
commit: 440dacbb8de713a54c1f2c71e070576dee31424e [9/38] arm: Implement the new page table range API
config: arm-am200epdkit_defconfig (https://download.01.org/0day-ci/archive/20230708/202307080809.g6EnqjvD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080809.g6EnqjvD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080809.g6EnqjvD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mm/fault-armv.c:201:2: error: must use 'struct' tag to refer to type 'folio'
     201 |         folio = page_folio(pfn_to_page(pfn));
         |         ^
         |         struct 
>> arch/arm/mm/fault-armv.c:201:8: error: expected identifier or '('
     201 |         folio = page_folio(pfn_to_page(pfn));
         |               ^
>> arch/arm/mm/fault-armv.c:202:32: error: incompatible pointer types passing 'struct page *' to parameter of type 'struct folio *' [-Werror,-Wincompatible-pointer-types]
     202 |         mapping = folio_flush_mapping(page);
         |                                       ^~~~
   include/linux/pagemap.h:404:71: note: passing argument to parameter 'folio' here
     404 | static inline struct address_space *folio_flush_mapping(struct folio *folio)
         |                                                                       ^
>> arch/arm/mm/fault-armv.c:203:42: error: use of undeclared identifier 'folio'
     203 |         if (!test_and_set_bit(PG_dcache_clean, &folio->flags))
         |                                                 ^
>> arch/arm/mm/fault-armv.c:203:42: error: use of undeclared identifier 'folio'
   arch/arm/mm/fault-armv.c:204:33: error: use of undeclared identifier 'folio'
     204 |                 __flush_dcache_folio(mapping, folio);
         |                                               ^
   6 errors generated.


vim +201 arch/arm/mm/fault-armv.c

   170	
   171	/*
   172	 * Take care of architecture specific things when placing a new PTE into
   173	 * a page table, or changing an existing PTE.  Basically, there are two
   174	 * things that we need to take care of:
   175	 *
   176	 *  1. If PG_dcache_clean is not set for the page, we need to ensure
   177	 *     that any cache entries for the kernels virtual memory
   178	 *     range are written back to the page.
   179	 *  2. If we have multiple shared mappings of the same space in
   180	 *     an object, we need to deal with the cache aliasing issues.
   181	 *
   182	 * Note that the pte lock will be held.
   183	 */
   184	void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
   185			unsigned long addr, pte_t *ptep, unsigned int nr)
   186	{
   187		unsigned long pfn = pte_pfn(*ptep);
   188		struct address_space *mapping;
   189		struct page *page;
   190	
   191		if (!pfn_valid(pfn))
   192			return;
   193	
   194		/*
   195		 * The zero page is never written to, so never has any dirty
   196		 * cache lines, and therefore never needs to be flushed.
   197		 */
   198		if (is_zero_pfn(pfn))
   199			return;
   200	
 > 201		folio = page_folio(pfn_to_page(pfn));
 > 202		mapping = folio_flush_mapping(page);
 > 203		if (!test_and_set_bit(PG_dcache_clean, &folio->flags))
   204			__flush_dcache_folio(mapping, folio);
   205		if (mapping) {
   206			if (cache_is_vivt())
   207				make_coherent(mapping, vma, addr, ptep, pfn);
   208			else if (vma->vm_flags & VM_EXEC)
   209				__flush_icache_all();
   210		}
   211	}
   212	#endif	/* __LINUX_ARM_ARCH__ < 6 */
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
