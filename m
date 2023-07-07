Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F3E17AA5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 21:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688765115; x=1720301115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TLTbgCvMu+DNJur6D6e5BOfXPxsfog9PXnjBzLV4nRc=;
  b=e+gZ5W8eEyCBgh+SeXX9+t2A9FPyPmg8Fde/ztxk2Rvd7BeKYkn7AfNt
   qukbnYS5kbyHLGaG3iM0o4a5DKuigZu13QgkQvy/uDOZ+S7umQW0Cym/o
   S9H1o9o6i5GOrnuxoEO1QNxwgIk4UZCZ81OY+KpvJiokgwekqvX+aIdR+
   BSf73STcBC8BWckudsQTRJ5U0dWCklqvoa+EgPcKCsgqjSZcerOpy3Z+M
   ixiPFxlG5EKaLsIT9CN4ldATAf8hIZCc4sW3omubEr8BehQGBb1N6aGhY
   p0yTvXsKnJt+LlLhvjSAuA46ExiNM8Zbwj1IJYE8OSRg3KUlQAn4H9Mb5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="348781535"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="348781535"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 14:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="894122168"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="894122168"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Jul 2023 14:25:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHsww-0002JS-15;
	Fri, 07 Jul 2023 21:25:10 +0000
Date: Sat, 8 Jul 2023 05:24:22 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 31/37] include/linux/pgtable.h:208:52:
 error: 'PFN_PTE_SHIFT' undeclared; did you mean 'PTE_SHIFT'?
Message-ID: <202307080543.d2TRA8uW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   a357c8502e070a8a7aa2fa94492fd040ae053b78
commit: 5e7663635fb6939b5a22d2f8046195e3e0754477 [31/37] mm: Tidy up set_ptes definition
config: microblaze-randconfig-m041-20230705 (https://download.01.org/0day-ci/archive/20230708/202307080543.d2TRA8uW-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080543.d2TRA8uW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080543.d2TRA8uW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:16,
                    from arch/microblaze/kernel/asm-offsets.c:13:
   include/linux/pgtable.h: In function 'set_ptes':
>> include/linux/pgtable.h:208:52: error: 'PFN_PTE_SHIFT' undeclared (first use in this function); did you mean 'PTE_SHIFT'?
     208 |                 pte = __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
         |                                                    ^~~~~~~~~~~~~
   arch/microblaze/include/asm/page.h:69:37: note: in definition of macro '__pte'
      69 | # define __pte(x)       ((pte_t) { (x) })
         |                                     ^
   include/linux/pgtable.h:208:52: note: each undeclared identifier is reported only once for each function it appears in
     208 |                 pte = __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
         |                                                    ^~~~~~~~~~~~~
   arch/microblaze/include/asm/page.h:69:37: note: in definition of macro '__pte'
      69 | # define __pte(x)       ((pte_t) { (x) })
         |                                     ^
   make[3]: *** [scripts/Makefile.build:116: arch/microblaze/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +208 include/linux/pgtable.h

6617da8fb56544 Juergen Gross           2022-11-30  182  
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  183) #ifndef set_ptes
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  184) /**
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  185)  * set_ptes - Map consecutive pages to a contiguous range of addresses.
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  186)  * @mm: Address space to map the pages into.
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  187)  * @addr: Address to map the first page at.
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  188)  * @ptep: Page table pointer for the first entry.
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  189)  * @pte: Page table entry for the first page.
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  190)  * @nr: Number of pages to map.
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  191)  *
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  192)  * May be overridden by the architecture, or the architecture can define
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  193)  * set_pte() and PFN_PTE_SHIFT.
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  194)  *
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  195)  * Context: The caller holds the page table lock.  The pages all belong
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  196)  * to the same folio.  The PTEs are all in the same PMD.
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  197)  */
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  198) static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  199) 		pte_t *ptep, pte_t pte, unsigned int nr)
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  200) {
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  201) 	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  202) 
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  203) 	for (;;) {
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  204) 		set_pte(ptep, pte);
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  205) 		if (--nr == 0)
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  206) 			break;
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  207) 		ptep++;
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03 @208) 		pte = __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  209) 	}
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  210) }
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  211) #endif
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  212) #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
f50e63c09c18bc Matthew Wilcox (Oracle  2023-03-03  213) 

:::::: The code at line 208 was first introduced by commit
:::::: f50e63c09c18bc7c16a2c19053a2811c1028bd80 mm: Add default definition of set_ptes()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
