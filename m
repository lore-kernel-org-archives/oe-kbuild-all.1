Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526592F28
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 22:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688769494; x=1720305494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oo8bKXi05BzBdS+Ftni8/gaf0QE2XPVps7yo/hgvIQ4=;
  b=CriFb6C3SQNn63d2drwasjxawN8gEwlRs5mlJKsWjEvK02GqwuOKGs58
   Z+crt2M/xjrgsV6jrEkVGsyUvTT/ioAhoO8uOuZVCHOc4vQUG+HHhmpd7
   l7wuym0UorhnlxYs6zOHGtKQQ75O8dzq9AJKlA6iPxUmQCInu5pWj0y5w
   ubdNOJI2sENBSkwj+N4jFw8xhzoJABDR5eOFImpEuUAXTBhhklrrlPLa9
   yimBTloGNv2Lh5fhaE7sL76VhEs2NfVuLKsxw8DDUpWNc7GkS3rxbDkNV
   A5lshQdy3etdbFvN4TgLR2uZTvh9GkoNsFYDRWdExdcJtGPKE09eE6n+L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="394763420"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="394763420"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 15:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="790128863"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="790128863"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2023 15:38:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHu5b-0002Lo-26;
	Fri, 07 Jul 2023 22:38:11 +0000
Date: Sat, 8 Jul 2023 06:37:59 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 8/37] arch/arm/mm/fault-armv.c:201:9:
 error: 'folio' undeclared
Message-ID: <202307080648.obDkc48w-lkp@intel.com>
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
commit: 6a318c90f141321a62598894caba1bdacf01eb9b [8/37] arm: Implement the new page table range API
config: arm-spear6xx_defconfig (https://download.01.org/0day-ci/archive/20230708/202307080648.obDkc48w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080648.obDkc48w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080648.obDkc48w-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/mm/fault-armv.c: In function 'update_mmu_cache_range':
>> arch/arm/mm/fault-armv.c:201:9: error: 'folio' undeclared (first use in this function)
     201 |         folio = page_folio(pfn_to_page(pfn));
         |         ^~~~~
   arch/arm/mm/fault-armv.c:201:9: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm/mm/fault-armv.c:202:39: error: passing argument 1 of 'folio_flush_mapping' from incompatible pointer type [-Werror=incompatible-pointer-types]
     202 |         mapping = folio_flush_mapping(page);
         |                                       ^~~~
         |                                       |
         |                                       struct page *
   In file included from arch/arm/mm/fault-armv.c:14:
   include/linux/pagemap.h:404:71: note: expected 'struct folio *' but argument is of type 'struct page *'
     404 | static inline struct address_space *folio_flush_mapping(struct folio *folio)
         |                                                         ~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +/folio +201 arch/arm/mm/fault-armv.c

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
   203		if (!test_and_set_bit(PG_dcache_clean, &folio->flags))
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
