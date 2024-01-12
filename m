Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114E96A019
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbRbKwU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705064352; x=1736600352;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Juo712WWsb8sIVDGDsmK9FIje3DXE2p3vOV1XTwcHNw=;
  b=PbRbKwU5GYUYPQimdUpKZXdeQ+RDwX2f8ltA8h6c/K/zBsKwltSo3Gzq
   vKRk+CbzbOgRohgH+Iu2r+g09c56OqzGpf991uf6vlx3C4aP4yv/O2422
   ITJfSpar47rSzY25h3Q61RfwvZW5NcR/hQmnv0MV7FYSbp+NgZYPf2vjM
   ELSPong+DuoA0dNDL/UeUS7tXXkie5jFGly5Gm2Pexx/NAsGFGzCvIZq/
   X9lGNaHh34pcPpzj5rLY9IRptC/0jZ9lZ8WgLRAC8d1QCJqdFGxbZzBfy
   Cdhp+JqXivzRbKM+GKENEobULVVuhH/jUfR0pm4V/AlSp+vebDB25t9ra
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="430342456"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="430342456"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 04:59:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="956094577"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="956094577"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Jan 2024 04:59:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOH7r-0009U4-02;
	Fri, 12 Jan 2024 12:59:07 +0000
Date: Fri, 12 Jan 2024 20:59:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:6.1/dovetail-xenomai 15659/15708]
 arch/arm/mm/fault.c:158:15: warning: no previous prototype for function
 'fault_entry'
Message-ID: <202401122003.msBO6ufy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: aa0b4997697a45275adce7baf2abc76a69973778 [15659/15708] ARM: dovetail: route traps
config: arm-randconfig-001-20240112 (https://download.01.org/0day-ci/archive/20240112/202401122003.msBO6ufy-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401122003.msBO6ufy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401122003.msBO6ufy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mm/fault.c:158:15: warning: no previous prototype for function 'fault_entry' [-Wmissing-prototypes]
     158 | unsigned long fault_entry(int exception, struct pt_regs *regs)
         |               ^
   arch/arm/mm/fault.c:158:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     158 | unsigned long fault_entry(int exception, struct pt_regs *regs)
         | ^
         | static 
   arch/arm/mm/fault.c:607:1: warning: no previous prototype for function 'do_DataAbort' [-Wmissing-prototypes]
     607 | do_DataAbort(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
         | ^
   arch/arm/mm/fault.c:606:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
     606 | asmlinkage void
         |            ^
         |            static 
   arch/arm/mm/fault.c:640:1: warning: no previous prototype for function 'do_PrefetchAbort' [-Wmissing-prototypes]
     640 | do_PrefetchAbort(unsigned long addr, unsigned int ifsr, struct pt_regs *regs)
         | ^
   arch/arm/mm/fault.c:639:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
     639 | asmlinkage void
         |            ^
         |            static 
   3 warnings generated.


vim +/fault_entry +158 arch/arm/mm/fault.c

    88	
    89	/*
    90	 * This is useful to dump out the page tables associated with
    91	 * 'addr' in mm 'mm'.
    92	 */
    93	void show_pte(const char *lvl, struct mm_struct *mm, unsigned long addr)
    94	{
    95		pgd_t *pgd;
    96	
    97		if (!mm)
    98			mm = &init_mm;
    99	
   100		pgd = pgd_offset(mm, addr);
   101		printk("%s[%08lx] *pgd=%08llx", lvl, addr, (long long)pgd_val(*pgd));
   102	
   103		do {
   104			p4d_t *p4d;
   105			pud_t *pud;
   106			pmd_t *pmd;
   107			pte_t *pte;
   108	
   109			p4d = p4d_offset(pgd, addr);
   110			if (p4d_none(*p4d))
   111				break;
   112	
   113			if (p4d_bad(*p4d)) {
   114				pr_cont("(bad)");
   115				break;
   116			}
   117	
   118			pud = pud_offset(p4d, addr);
   119			if (PTRS_PER_PUD != 1)
   120				pr_cont(", *pud=%08llx", (long long)pud_val(*pud));
   121	
   122			if (pud_none(*pud))
   123				break;
   124	
   125			if (pud_bad(*pud)) {
   126				pr_cont("(bad)");
   127				break;
   128			}
   129	
   130			pmd = pmd_offset(pud, addr);
   131			if (PTRS_PER_PMD != 1)
   132				pr_cont(", *pmd=%08llx", (long long)pmd_val(*pmd));
   133	
   134			if (pmd_none(*pmd))
   135				break;
   136	
   137			if (pmd_bad(*pmd)) {
   138				pr_cont("(bad)");
   139				break;
   140			}
   141	
   142			/* We must not map this if we have highmem enabled */
   143			if (PageHighMem(pfn_to_page(pmd_val(*pmd) >> PAGE_SHIFT)))
   144				break;
   145	
   146			pte = pte_offset_map(pmd, addr);
   147			pr_cont(", *pte=%08llx", (long long)pte_val(*pte));
   148	#ifndef CONFIG_ARM_LPAE
   149			pr_cont(", *ppte=%08llx",
   150			       (long long)pte_val(pte[PTE_HWTABLE_PTRS]));
   151	#endif
   152			pte_unmap(pte);
   153		} while(0);
   154	
   155		pr_cont("\n");
   156	}
   157	#else					/* CONFIG_MMU */
 > 158	unsigned long fault_entry(int exception, struct pt_regs *regs)
   159	{
   160		return 0;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
