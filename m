Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B004210E2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 05:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693286612; x=1724822612;
  h=date:from:cc:subject:message-id:mime-version;
  bh=lkPTYICtUGyrdJu3DLzKhaTXKV8kNIrQF5BZ+2++mHE=;
  b=mtaSEiYnunZ2BKyY928paBPcuOnoxKzZXDbkIHlcTXs9fKG+cWPblWmm
   PHnlCKi1PJm8zvhrY3pPa328F+os55cMp7tQ6dSBkOGoASH+cNM8Oug7Q
   jicXOcLDYeirobx+x7Z967hOgCjfkbQYlHko++Cc/RhLhjDWfosqLigCI
   RFjBEBJ/yKxITxid9Pa0+XOjoZkYxeXS3hLsvUYR0nCVa3i/rizA9hfJ1
   Zu+ZnBwXMntjFF/QJFhhpqGqKDNgPSUqoAibTJEdZtWuxekBtDo6X65Yz
   ZE3XMNDxxlN+wR9VO9eVrJNnDr9SsY7uzL+Cy01BG6ijHz2u/8Ofba7S0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="372695091"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="372695091"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 22:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="773538173"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="773538173"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Aug 2023 22:23:17 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qarC8-0008QI-1Y
	for oe-kbuild-all@lists.linux.dev;
	Tue, 29 Aug 2023 05:23:16 +0000
Date: Tue, 29 Aug 2023 13:22:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/dovetail-xenomai 2297/26832]
 arch/arm/mm/fault.c:160:15: warning: no previous prototype for function
 'fault_entry'
Message-ID: <202308291313.LaheCtKO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philippe,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/dovetail-xenomai
head:   ef4cd214d7c9836eb64fced61f30c02eadf8a91c
commit: 609f24eceac5bc30ee8dabb2168eba914c1a18e0 [2297/26832] ARM: dovetail: route traps
config: arm-randconfig-r033-20230828 (https://download.01.org/0day-ci/archive/20230829/202308291313.LaheCtKO-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291313.LaheCtKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291313.LaheCtKO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mm/fault.c:160:15: warning: no previous prototype for function 'fault_entry' [-Wmissing-prototypes]
   unsigned long fault_entry(int exception, struct pt_regs *regs)
                 ^
   arch/arm/mm/fault.c:160:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long fault_entry(int exception, struct pt_regs *regs)
   ^
   static 
   arch/arm/mm/fault.c:609:1: warning: no previous prototype for function 'do_DataAbort' [-Wmissing-prototypes]
   do_DataAbort(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
   ^
   arch/arm/mm/fault.c:608:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void
              ^
              static 
   arch/arm/mm/fault.c:642:1: warning: no previous prototype for function 'do_PrefetchAbort' [-Wmissing-prototypes]
   do_PrefetchAbort(unsigned long addr, unsigned int ifsr, struct pt_regs *regs)
   ^
   arch/arm/mm/fault.c:641:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void
              ^
              static 
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GENERIC_CLOCKSOURCE_VDSO
   Depends on [n]: HAVE_GENERIC_VDSO [=n]
   Selected by [y]:
   - CLKSRC_EXYNOS_MCT [=y] && GENERIC_CLOCKEVENTS [=y] && (ARM [=y] || ARM64)
   - CLKSRC_IMX_GPT [=y] && GENERIC_CLOCKEVENTS [=y] && (ARM [=y] || ARM64) && HAVE_CLK [=y]
   - CLKSRC_ST_LPC [=y] && GENERIC_CLOCKEVENTS [=y] && HAS_IOMEM [=y]


vim +/fault_entry +160 arch/arm/mm/fault.c

    89	
    90	/*
    91	 * This is useful to dump out the page tables associated with
    92	 * 'addr' in mm 'mm'.
    93	 */
    94	void show_pte(const char *lvl, struct mm_struct *mm, unsigned long addr)
    95	{
    96		pgd_t *pgd;
    97	
    98		if (!mm)
    99			mm = &init_mm;
   100	
   101		printk("%spgd = %p\n", lvl, mm->pgd);
   102		pgd = pgd_offset(mm, addr);
   103		printk("%s[%08lx] *pgd=%08llx", lvl, addr, (long long)pgd_val(*pgd));
   104	
   105		do {
   106			p4d_t *p4d;
   107			pud_t *pud;
   108			pmd_t *pmd;
   109			pte_t *pte;
   110	
   111			p4d = p4d_offset(pgd, addr);
   112			if (p4d_none(*p4d))
   113				break;
   114	
   115			if (p4d_bad(*p4d)) {
   116				pr_cont("(bad)");
   117				break;
   118			}
   119	
   120			pud = pud_offset(p4d, addr);
   121			if (PTRS_PER_PUD != 1)
   122				pr_cont(", *pud=%08llx", (long long)pud_val(*pud));
   123	
   124			if (pud_none(*pud))
   125				break;
   126	
   127			if (pud_bad(*pud)) {
   128				pr_cont("(bad)");
   129				break;
   130			}
   131	
   132			pmd = pmd_offset(pud, addr);
   133			if (PTRS_PER_PMD != 1)
   134				pr_cont(", *pmd=%08llx", (long long)pmd_val(*pmd));
   135	
   136			if (pmd_none(*pmd))
   137				break;
   138	
   139			if (pmd_bad(*pmd)) {
   140				pr_cont("(bad)");
   141				break;
   142			}
   143	
   144			/* We must not map this if we have highmem enabled */
   145			if (PageHighMem(pfn_to_page(pmd_val(*pmd) >> PAGE_SHIFT)))
   146				break;
   147	
   148			pte = pte_offset_map(pmd, addr);
   149			pr_cont(", *pte=%08llx", (long long)pte_val(*pte));
   150	#ifndef CONFIG_ARM_LPAE
   151			pr_cont(", *ppte=%08llx",
   152			       (long long)pte_val(pte[PTE_HWTABLE_PTRS]));
   153	#endif
   154			pte_unmap(pte);
   155		} while(0);
   156	
   157		pr_cont("\n");
   158	}
   159	#else					/* CONFIG_MMU */
 > 160	unsigned long fault_entry(int exception, struct pt_regs *regs)
   161	{
   162		return 0;
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
