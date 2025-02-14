Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C86086328
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 17:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739554432; cv=none; b=cMneKtp9qw1mBoWsL0mqTXerqVIazF8yidbYZ+XjGPJygi5QNk/CKcNRr0fVn6V1Hxf5+SUycqImt4O3a1vKg0ev6P1WqbFzKGz30Jn8UtlkDQQ5wJuFK8vWFvMdJynf63L/XJpo/CseM/D0uoe8FG0m0JgW+YWqqPsyFRfTJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739554432; c=relaxed/simple;
	bh=XvE/z4lx2L1wPCI7SELSI/XidJHlSKkAx9ea75mo1hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f1VJJZsSHWmppKZd9t04dM+sOCocvGFbY0uAPD+lGbUxv0cD+LE4Uf21SALb6HRH5NpTg6yjzkBJv1oCImaTO1zzV8jJMtiAvmp1ZyY1M3woT5G7MmL/DwNrGI4aVa7OsRuy+nH6VCXoH84/lG0M9L5Hpv8seOGsxZ1q2rQ3XXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETa3JXMf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETa3JXMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739554430; x=1771090430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XvE/z4lx2L1wPCI7SELSI/XidJHlSKkAx9ea75mo1hs=;
  b=ETa3JXMflO2hmI69Y3/P9B/Qo8wwjzwidPnRD/wv8csRx3p0adCi9aV8
   rb3LTNU4hfuAGX4fFgOE67zCIkhRltFQ6qJ4mV3f2TtD7jUeh+24RZRiG
   l8kc7jt2wO6DtBKgV90p3cfAb7UAT7vyXDbh8d49lMJ7OY87C8fSJxcAs
   jbuBOU+CuBqPM6Xtf4dooQcYNt4Bhh9agOCdj++oAHeXO+pugLfXbArtU
   urzfEYeAce9Jlb1//9C6REVYxP3w1ooPTLF1jAxgrA3o/jdZ3fv+ah4ZN
   uviGX79ZkuBhu0YFVrYCsndUNL7lTpX+HKaNnjZ113HTy9sxVu8kVoay9
   w==;
X-CSE-ConnectionGUID: qa0iWHXDQhOl3h0x7ELGDA==
X-CSE-MsgGUID: Xy5vTSKTS32y2XRk+FOE4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50522106"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="50522106"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 09:33:50 -0800
X-CSE-ConnectionGUID: UTBKKyDvST6sQKs53iv8mQ==
X-CSE-MsgGUID: NJSKQJH1Txe35K4XdJoC/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144443169"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Feb 2025 09:33:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tizZS-0019wT-1v;
	Fri, 14 Feb 2025 17:33:46 +0000
Date: Sat, 15 Feb 2025 01:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2831/4011] include/linux/pgtable.h:186:38:
 warning: passing argument 1 of 'pud_offset' makes pointer from integer
 without a cast
Message-ID: <202502150146.ILQBiPJ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ae0fa3bf0b44c8611d114a9f69985bf451010c3
commit: 62ae45687e43574f6c13158f8b8c5e10d3d22fc4 [2831/4011] drm: ensure drm headers are self-contained and pass kernel-doc
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20250215/202502150146.ILQBiPJ1-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150146.ILQBiPJ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150146.ILQBiPJ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

      96 | PTE_BIT_FUNC(mkhuge,    |= (_PAGE_HW_SZ));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:98:15: error: unknown type name 'pte_t'
      98 | static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
         |               ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:98:32: error: unknown type name 'pte_t'
      98 | static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
         |                                ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:98:43: error: unknown type name 'pgprot_t'
      98 | static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
         |                                           ^~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:105:40: error: unknown type name 'pte_t'
     105 |                 unsigned long address, pte_t *ptep, unsigned int nr);
         |                                        ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:133:37: error: unknown type name 'pte_t'
     133 | static inline int pte_swp_exclusive(pte_t pte)
         |                                     ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:23: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                       ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:138:1: note: in expansion of macro 'PTE_BIT_FUNC'
     138 | PTE_BIT_FUNC(swp_mkexclusive, |= (_PAGE_SWP_EXCLUSIVE));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:38: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                                      ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:138:1: note: in expansion of macro 'PTE_BIT_FUNC'
     138 | PTE_BIT_FUNC(swp_mkexclusive, |= (_PAGE_SWP_EXCLUSIVE));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:23: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                       ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:139:1: note: in expansion of macro 'PTE_BIT_FUNC'
     139 | PTE_BIT_FUNC(swp_clear_exclusive, &= ~(_PAGE_SWP_EXCLUSIVE));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:38: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                                      ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:139:1: note: in expansion of macro 'PTE_BIT_FUNC'
     139 | PTE_BIT_FUNC(swp_clear_exclusive, &= ~(_PAGE_SWP_EXCLUSIVE));
         | ^~~~~~~~~~~~
   In file included from arch/arc/include/asm/pgtable-bits-arcv2.h:142:
   arch/arc/include/asm/hugepage.h:20:15: error: unknown type name 'pte_t'
      20 | static inline pte_t pmd_pte(pmd_t pmd)
         |               ^~~~~
   arch/arc/include/asm/hugepage.h: In function 'pmd_pte':
   arch/arc/include/asm/hugepage.h:22:16: error: implicit declaration of function '__pte'; did you mean 'mk_pte'? [-Werror=implicit-function-declaration]
      22 |         return __pte(pmd_val(pmd));
         |                ^~~~~
         |                mk_pte
   include/asm-generic/pgtable-nop4d.h:40:50: error: implicit declaration of function 'pgd_val'; did you mean 'pud_val'? [-Werror=implicit-function-declaration]
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/arc/include/asm/hugepage.h:22:22: note: in expansion of macro 'pmd_val'
      22 |         return __pte(pmd_val(pmd));
         |                      ^~~~~~~
   arch/arc/include/asm/hugepage.h: At top level:
   arch/arc/include/asm/hugepage.h:25:29: error: unknown type name 'pte_t'
      25 | static inline pmd_t pte_pmd(pte_t pte)
         |                             ^~~~~
   arch/arc/include/asm/hugepage.h:49:43: error: unknown type name 'pgprot_t'
      49 | static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
         |                                           ^~~~~~~~
   arch/arc/include/asm/hugepage.h:64:41: warning: 'struct vm_area_struct' declared inside parameter list will not be visible outside of this definition or declaration
      64 | extern void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
         |                                         ^~~~~~~~~~~~~~
   arch/arc/include/asm/hugepage.h:68:40: warning: 'struct vm_area_struct' declared inside parameter list will not be visible outside of this definition or declaration
      68 | extern void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
         |                                        ^~~~~~~~~~~~~~
   In file included from arch/arc/include/asm/pgtable.h:13:
   include/linux/pgtable.h: In function 'pte_offset_kernel':
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/arc/include/asm/pgtable-levels.h:160:34: note: in expansion of macro 'pmd_val'
     160 | #define pmd_page_vaddr(pmd)     (pmd_val(pmd) & PAGE_MASK)
         |                                  ^~~~~~~
   include/linux/pgtable.h:117:25: note: in expansion of macro 'pmd_page_vaddr'
     117 |         return (pte_t *)pmd_page_vaddr(*pmd) + pte_index(address);
         |                         ^~~~~~~~~~~~~~
   include/linux/pgtable.h: In function 'pmd_off':
   include/linux/pgtable.h:186:38: error: implicit declaration of function 'p4d_offset'; did you mean 'pmd_offset'? [-Werror=implicit-function-declaration]
     186 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~
         |                                      pmd_offset
>> include/linux/pgtable.h:186:38: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     186 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   include/linux/pgtable.h: In function 'pmd_off_k':
   include/linux/pgtable.h:191:38: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     191 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   include/linux/pgtable.h: In function 'virt_to_kpte':
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/arc/include/asm/pgtable-levels.h:156:35: note: in expansion of macro 'pmd_val'
     156 | #define pmd_none(x)             (!pmd_val(x))
         |                                   ^~~~~~~
   include/linux/pgtable.h:198:16: note: in expansion of macro 'pmd_none'
     198 |         return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
         |                ^~~~~~~~
   include/linux/pgtable.h: In function 'ptep_test_and_clear_young':
   include/linux/pgtable.h:380:55: error: implicit declaration of function 'pte_mkold'; did you mean 'pmd_mkold'? [-Werror=implicit-function-declaration]
     380 |                 set_pte_at(vma->vm_mm, address, ptep, pte_mkold(pte));
         |                                                       ^~~~~~~~~
   include/linux/pgtable.h:301:66: note: in definition of macro 'set_pte_at'
     301 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
         |                                                                  ^~~
   include/linux/pgtable.h:380:55: error: incompatible type for argument 4 of 'set_ptes'
     380 |                 set_pte_at(vma->vm_mm, address, ptep, pte_mkold(pte));
         |                                                       ^~~~~~~~~~~~~~
         |                                                       |
         |                                                       int
   include/linux/pgtable.h:301:66: note: in definition of macro 'set_pte_at'
     301 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
         |                                                                  ^~~
   include/linux/pgtable.h:286:36: note: expected 'pte_t' but argument is of type 'int'
     286 |                 pte_t *ptep, pte_t pte, unsigned int nr)
         |                              ~~~~~~^~~
   include/linux/pgtable.h: In function 'pmdp_test_and_clear_young':
   arch/arc/include/asm/page.h:74:29: error: request for member 'pte' in something not a structure or union
      74 | #define pte_val(x)      ((x).pte)
         |                             ^
   arch/arc/include/asm/pgtable-bits-arcv2.h:82:34: note: in expansion of macro 'pte_val'
      82 | #define pte_young(pte)          (pte_val(pte) & _PAGE_ACCESSED)
         |                                  ^~~~~~~
   arch/arc/include/asm/hugepage.h:40:33: note: in expansion of macro 'pte_young'
      40 | #define pmd_young(pmd)          pte_young(pmd_pte(pmd))
         |                                 ^~~~~~~~~
   include/linux/pgtable.h:393:14: note: in expansion of macro 'pmd_young'
     393 |         if (!pmd_young(pmd))
         |              ^~~~~~~~~
   arch/arc/include/asm/hugepage.h:33:33: error: implicit declaration of function 'pte_pmd'; did you mean 'pfn_pmd'? [-Werror=implicit-function-declaration]
      33 | #define pmd_mkold(pmd)          pte_pmd(pte_mkold(pmd_pte(pmd)))
         |                                 ^~~~~~~
   include/linux/pgtable.h:396:55: note: in expansion of macro 'pmd_mkold'
     396 |                 set_pmd_at(vma->vm_mm, address, pmdp, pmd_mkold(pmd));
         |                                                       ^~~~~~~~~
   arch/arc/include/asm/hugepage.h:33:33: error: incompatible type for argument 4 of 'set_pmd_at'
      33 | #define pmd_mkold(pmd)          pte_pmd(pte_mkold(pmd_pte(pmd)))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 int
   include/linux/pgtable.h:396:55: note: in expansion of macro 'pmd_mkold'
     396 |                 set_pmd_at(vma->vm_mm, address, pmdp, pmd_mkold(pmd));
         |                                                       ^~~~~~~~~
   arch/arc/include/asm/hugepage.h:59:50: note: expected 'pmd_t' but argument is of type 'int'
      59 |                               pmd_t *pmdp, pmd_t pmd)
         |                                            ~~~~~~^~~
   include/linux/pgtable.h: In function 'clear_young_dirty_ptes':
   include/linux/pgtable.h:520:39: error: incompatible types when assigning to type 'pte_t' from type 'int'
     520 |                                 pte = pte_mkold(pte);
         |                                       ^~~~~~~~~
   include/linux/pgtable.h:522:39: error: implicit declaration of function 'pte_mkclean'; did you mean 'pmd_mkclean'? [-Werror=implicit-function-declaration]
     522 |                                 pte = pte_mkclean(pte);
         |                                       ^~~~~~~~~~~
         |                                       pmd_mkclean
   include/linux/pgtable.h:522:39: error: incompatible types when assigning to type 'pte_t' from type 'int'
   include/linux/pgtable.h: In function 'pmdp_huge_get_and_clear':
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'


vim +/pud_offset +186 include/linux/pgtable.h

974b9b2c68f3d3 Mike Rapoport 2020-06-08  176  
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  177  /*
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  178   * In many cases it is known that a virtual address is mapped at PMD or PTE
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  179   * level, so instead of traversing all the page table levels, we can get a
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  180   * pointer to the PMD entry in user or kernel page table or translate a virtual
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  181   * address to the pointer in the PTE in the kernel page tables with simple
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  182   * helpers.
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  183   */
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  184  static inline pmd_t *pmd_off(struct mm_struct *mm, unsigned long va)
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  185  {
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08 @186  	return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  187  }
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  188  

:::::: The code at line 186 was first introduced by commit
:::::: e05c7b1f2bc4b7b28199b9a7572f73436d97317e mm: pgtable: add shortcuts for accessing kernel PMD and PTE

:::::: TO: Mike Rapoport <rppt@linux.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
