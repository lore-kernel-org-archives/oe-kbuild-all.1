Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A027F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 02:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688610017; x=1720146017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hriqH5lwXIcP5IRh6qNw2jm+L4AedwNBnlRcup7jB0c=;
  b=bxqaiJh7ZaFnPXnJ5uNwmmK0w/sMwf7chrLgBkXTBmVPOPLgO4+7OD1q
   eSJ2wQKPzpFGjdvUPNtGJkDAi4q8teqyQQ220iw49uMpGsCXnrIDPuOuB
   RkYueOcYT/IFm8dU6Sx+m1J8rwLLO1xQx6CRcbuJWC+zdS0Rs/asF3luy
   rFjzJk51X/ChJ8lHt7AUN0LodEZt8lvzB9E9r1td1OCNCrcMHgOvzAVNX
   cfbTa8EIm8zgvSeJnJucZqpz7cCzSO3NZRKmyBJvTRx740zh7uPXZHFGc
   71V1kGVdO9trh3RuS9rPW/lXvatiWj5Fd03T8VAWdI39qCEQt4sLasNgx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="449847274"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="449847274"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 19:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="754585410"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="754585410"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Jul 2023 19:20:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHEbL-0000yu-2x;
	Thu, 06 Jul 2023 02:20:11 +0000
Date: Thu, 6 Jul 2023 10:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Hugh Dickins <hughd@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: arch/m68k/include/asm/mmu_context.h:164 load_ksp_mmu() warn:
 unsigned 'mmuar' is never less than zero.
Message-ID: <202307061010.9IbhSZb6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6843306689aff3aea608e4d2630b2a5a0137f827
commit: e67b37c368b7cc24b8c0fe5ab6c44422312eab37 m68k: allow pte_offset_map[_lock]() to fail
date:   2 weeks ago
config: m68k-randconfig-m031-20230706 (https://download.01.org/0day-ci/archive/20230706/202307061010.9IbhSZb6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307061010.9IbhSZb6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307061010.9IbhSZb6-lkp@intel.com/

New smatch warnings:
arch/m68k/include/asm/mmu_context.h:164 load_ksp_mmu() warn: unsigned 'mmuar' is never less than zero.

Old smatch warnings:
arch/m68k/include/asm/mmu_context.h:114 load_ksp_mmu() warn: always true condition '(mmuar >= (0)) => (0-u32max >= 0)'
arch/m68k/include/asm/mmu_context.h:140 load_ksp_mmu() warn: always true condition '(mmuar >= (0)) => (0-u32max >= 0)'

vim +/mmuar +164 arch/m68k/include/asm/mmu_context.h

    92	
    93	static inline void load_ksp_mmu(struct task_struct *task)
    94	{
    95		unsigned long flags;
    96		struct mm_struct *mm;
    97		int asid;
    98		pgd_t *pgd;
    99		p4d_t *p4d;
   100		pud_t *pud;
   101		pmd_t *pmd;
   102		pte_t *pte = NULL;
   103		unsigned long mmuar;
   104	
   105		local_irq_save(flags);
   106		mmuar = task->thread.ksp;
   107	
   108		/* Search for a valid TLB entry, if one is found, don't remap */
   109		mmu_write(MMUAR, mmuar);
   110		mmu_write(MMUOR, MMUOR_STLB | MMUOR_ADR);
   111		if (mmu_read(MMUSR) & MMUSR_HIT)
   112			goto end;
   113	
   114		if (mmuar >= PAGE_OFFSET) {
   115			mm = &init_mm;
   116		} else {
   117			pr_info("load_ksp_mmu: non-kernel mm found: 0x%p\n", task->mm);
   118			mm = task->mm;
   119		}
   120	
   121		if (!mm)
   122			goto bug;
   123	
   124		pgd = pgd_offset(mm, mmuar);
   125		if (pgd_none(*pgd))
   126			goto bug;
   127	
   128		p4d = p4d_offset(pgd, mmuar);
   129		if (p4d_none(*p4d))
   130			goto bug;
   131	
   132		pud = pud_offset(p4d, mmuar);
   133		if (pud_none(*pud))
   134			goto bug;
   135	
   136		pmd = pmd_offset(pud, mmuar);
   137		if (pmd_none(*pmd))
   138			goto bug;
   139	
   140		pte = (mmuar >= PAGE_OFFSET) ? pte_offset_kernel(pmd, mmuar)
   141					     : pte_offset_map(pmd, mmuar);
   142		if (!pte || pte_none(*pte) || !pte_present(*pte))
   143			goto bug;
   144	
   145		set_pte(pte, pte_mkyoung(*pte));
   146		asid = mm->context & 0xff;
   147		if (!pte_dirty(*pte) && mmuar <= PAGE_OFFSET)
   148			set_pte(pte, pte_wrprotect(*pte));
   149	
   150		mmu_write(MMUTR, (mmuar & PAGE_MASK) | (asid << MMUTR_IDN) |
   151			(((int)(pte->pte) & (int)CF_PAGE_MMUTR_MASK)
   152			>> CF_PAGE_MMUTR_SHIFT) | MMUTR_V);
   153	
   154		mmu_write(MMUDR, (pte_val(*pte) & PAGE_MASK) |
   155			((pte->pte) & CF_PAGE_MMUDR_MASK) | MMUDR_SZ_8KB | MMUDR_X);
   156	
   157		mmu_write(MMUOR, MMUOR_ACC | MMUOR_UAA);
   158	
   159		goto end;
   160	
   161	bug:
   162		pr_info("ksp load failed: mm=0x%p ksp=0x08%lx\n", mm, mmuar);
   163	end:
 > 164		if (pte && mmuar < PAGE_OFFSET)
   165			pte_unmap(pte);
   166		local_irq_restore(flags);
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
