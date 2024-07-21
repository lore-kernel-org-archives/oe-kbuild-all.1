Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B29179CF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 07:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721545932; cv=none; b=a/0a+CkjlQpy+xhQPq54CRNOsLsLpHivB0yXg7HKtVlew6sE8QnzmvlErMHQv2hyNjnROepJilCFdzmPNPNerw/8x5aLC9DQQrl/SNcI6pLVwytG+lmb2KyrSKeTPPQAeLdNQuYKtqLuBZgCcIdJL+eC85h0JoY/NhyInVsgvD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721545932; c=relaxed/simple;
	bh=hHBNhwXESLC2JHy1547SYaJwjdTn0kVuKDBPCPuB6UY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f4O1o7bf7qPcqQYqVREUILlDMNsiAw1ZnxakQMb3JU4GyhpEdlKdToL/MU7F1G/JDNDvEDI2RDf25OrJvgmjB1+u6CbZuQzdCJ3Ty1qYGjOHg4e4FLI9YmuVMiKOlqRU0kt3Aac1K9UP74khTF5gNOvZ2+VKsFza1RkDiE0Cd64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FsT6I5V9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FsT6I5V9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721545931; x=1753081931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hHBNhwXESLC2JHy1547SYaJwjdTn0kVuKDBPCPuB6UY=;
  b=FsT6I5V9lOhe95WbmjRMw0avWUQDXRRpmZqWbk2oP/qOESDeQXjH4xlH
   GcGeB6F6BJNVkLKqQg6wuWq19k5/PCuHGAs8dc2gSpPqkRXEnQ/i+uWe2
   elEq+apiscYbFXBTTOjxZr9W643nBgttpO6xdRZ5IkB6QHDfCc9PYqNgv
   cwV5fnowpumZURYwVtRz61Rx1ulWqldz9k+6y0YOlNolRmNeeouV5OoHe
   YsaNdXg6YwKvEa6z76Xyj65ogoYPeAUm/FYzOsukHUfRneBNbZFLlX0Dr
   67EEiCcBQfv2sZQftXlmGP6e7lcuY35z91A7mR6U3JrVP5ofXbPV2yu6o
   A==;
X-CSE-ConnectionGUID: nHfSwi59Tv+h+1L9TbKLLA==
X-CSE-MsgGUID: lxAwEAxmRsuP8Z4iY8c/gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="19086116"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="19086116"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 00:12:11 -0700
X-CSE-ConnectionGUID: T1gtmLTVQAqMNpyUANwQcg==
X-CSE-MsgGUID: lU4h9vJmQmysGQjjI+sAjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="56664034"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jul 2024 00:12:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVQjm-000k2M-2L;
	Sun, 21 Jul 2024 07:12:06 +0000
Date: Sun, 21 Jul 2024 15:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 32/43] mm/huge_memory.c:987:46: error: passing
 argument 2 of 'pte_free' from incompatible pointer type
Message-ID: <202407211525.io5mRtso-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   6c298a18633e397b8be4d6f48fc8cd1f860dd896
commit: dfd6e54129e6900af4a60fccebed4ebb9f1dbacf [32/43] mm/pgtable: return ptdesc in pte_free
config: powerpc64-randconfig-001-20240721 (https://download.01.org/0day-ci/archive/20240721/202407211525.io5mRtso-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211525.io5mRtso-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211525.io5mRtso-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function '__pte_alloc':
   mm/memory.c:454:30: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
     454 |                 pte_free(mm, ptdesc);
         |                              ^~~~~~
         |                              |
         |                              struct ptdesc *
   In file included from mm/memory.c:86:
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/memory.c: In function '__do_fault':
   mm/memory.c:4650:35: error: assignment to 'pgtable_t' {aka 'pte_t *'} from incompatible pointer type 'struct page *' [-Wincompatible-pointer-types]
    4650 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                   ^
   mm/memory.c: In function 'do_set_pmd':
   mm/memory.c:4728:35: error: assignment to 'pgtable_t' {aka 'pte_t *'} from incompatible pointer type 'struct page *' [-Wincompatible-pointer-types]
    4728 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                   ^
   mm/memory.c: In function 'do_fault_around':
   mm/memory.c:5013:35: error: assignment to 'pgtable_t' {aka 'pte_t *'} from incompatible pointer type 'struct page *' [-Wincompatible-pointer-types]
    5013 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
         |                                   ^
   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from arch/powerpc/include/asm/hardirq.h:6,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
   mm/memory.c: In function 'do_fault':
>> include/linux/mm_types.h:510:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/memory.c:5199:33: note: in expansion of macro 'page_ptdesc'
    5199 |                 pte_free(vm_mm, page_ptdesc(vmf->prealloc_pte));
         |                                 ^~~~~~~~~~~
--
   mm/huge_memory.c: In function '__do_huge_pmd_anonymous_page':
>> mm/huge_memory.c:987:46: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
     987 |                         pte_free(vma->vm_mm, ptdesc);
         |                                              ^~~~~~
         |                                              |
         |                                              struct ptdesc *
   In file included from mm/huge_memory.c:45:
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/huge_memory.c:8:
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:997:66: note: in expansion of macro 'ptdesc_page'
     997 |                 pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, ptdesc_page(ptdesc));
         |                                                                  ^~~~~~~~~~~
   In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                    from arch/powerpc/include/asm/book3s/64/mmu.h:32,
                    from arch/powerpc/include/asm/mmu.h:385,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:23,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8:
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                            ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1013:38: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1013 |                 pte_free(vma->vm_mm, ptdesc);
         |                                      ^~~~~~
         |                                      |
         |                                      struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function 'do_huge_pmd_anonymous_page':
   mm/huge_memory.c:1096:46: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1096 |                         pte_free(vma->vm_mm, ptdesc);
         |                                              ^~~~~~
         |                                              |
         |                                              struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1106:54: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1106 |                                 pte_free(vma->vm_mm, ptdesc);
         |                                                      ^~~~~~
         |                                                      |
         |                                                      struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1109:54: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1109 |                                 pte_free(vma->vm_mm, ptdesc);
         |                                                      ^~~~~~
         |                                                      |
         |                                                      struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   include/linux/mm_types.h:504:41: error: passing argument 1 of 'set_huge_zero_folio' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:1113:53: note: in expansion of macro 'ptdesc_page'
    1113 |                                 set_huge_zero_folio(ptdesc_page(ptdesc), vma->vm_mm, vma,
         |                                                     ^~~~~~~~~~~
   mm/huge_memory.c:1055:43: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1055 | static void set_huge_zero_folio(pgtable_t pgtable, struct mm_struct *mm,
         |                                 ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1120:46: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1120 |                         pte_free(vma->vm_mm, ptdesc);
         |                                              ^~~~~~
         |                                              |
         |                                              struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function 'insert_pfn_pmd':
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:1167:53: note: in expansion of macro 'ptdesc_page'
    1167 |                 pgtable_trans_huge_deposit(mm, pmd, ptdesc_page(ptdesc));
         |                                                     ^~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                            ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1178:30: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1178 |                 pte_free(mm, ptdesc);
         |                              ^~~~~~
         |                              |
         |                              struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function 'copy_huge_pmd':
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:1404:61: note: in expansion of macro 'ptdesc_page'
    1404 |                 pgtable_trans_huge_deposit(dst_mm, dst_pmd, ptdesc_page(ptdesc));
         |                                                             ^~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                            ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1414:34: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1414 |                 pte_free(dst_mm, ptdesc);
         |                                  ^~~~~~
         |                                  |
         |                                  struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1440:34: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1440 |                 pte_free(dst_mm, ptdesc);
         |                                  ^~~~~~
         |                                  |
         |                                  struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:1449:53: note: in expansion of macro 'ptdesc_page'
    1449 |         pgtable_trans_huge_deposit(dst_mm, dst_pmd, ptdesc_page(ptdesc));
         |                                                     ^~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                            ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function 'zap_deposited_table':
>> include/linux/mm_types.h:510:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/huge_memory.c:1830:22: note: in expansion of macro 'page_ptdesc'
    1830 |         pte_free(mm, page_ptdesc(pgtable));
         |                      ^~~~~~~~~~~


vim +/pte_free +987 mm/huge_memory.c

   937	
   938	static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
   939				struct page *page, gfp_t gfp)
   940	{
   941		struct vm_area_struct *vma = vmf->vma;
   942		struct folio *folio = page_folio(page);
   943		struct ptdesc *ptdesc;
   944		unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
   945		vm_fault_t ret = 0;
   946	
   947		VM_BUG_ON_FOLIO(!folio_test_large(folio), folio);
   948	
   949		if (mem_cgroup_charge(folio, vma->vm_mm, gfp)) {
   950			folio_put(folio);
   951			count_vm_event(THP_FAULT_FALLBACK);
   952			count_vm_event(THP_FAULT_FALLBACK_CHARGE);
   953			count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_FALLBACK);
   954			count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_FALLBACK_CHARGE);
   955			return VM_FAULT_FALLBACK;
   956		}
   957		folio_throttle_swaprate(folio, gfp);
   958	
   959		ptdesc = pte_alloc_one(vma->vm_mm);
   960		if (unlikely(!ptdesc)) {
   961			ret = VM_FAULT_OOM;
   962			goto release;
   963		}
   964	
   965		folio_zero_user(folio, vmf->address);
   966		/*
   967		 * The memory barrier inside __folio_mark_uptodate makes sure that
   968		 * folio_zero_user writes become visible before the set_pmd_at()
   969		 * write.
   970		 */
   971		__folio_mark_uptodate(folio);
   972	
   973		vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
   974		if (unlikely(!pmd_none(*vmf->pmd))) {
   975			goto unlock_release;
   976		} else {
   977			pmd_t entry;
   978	
   979			ret = check_stable_address_space(vma->vm_mm);
   980			if (ret)
   981				goto unlock_release;
   982	
   983			/* Deliver the page fault to userland */
   984			if (userfaultfd_missing(vma)) {
   985				spin_unlock(vmf->ptl);
   986				folio_put(folio);
 > 987				pte_free(vma->vm_mm, ptdesc);
   988				ret = handle_userfault(vmf, VM_UFFD_MISSING);
   989				VM_BUG_ON(ret & VM_FAULT_FALLBACK);
   990				return ret;
   991			}
   992	
   993			entry = mk_huge_pmd(page, vma->vm_page_prot);
   994			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
   995			folio_add_new_anon_rmap(folio, vma, haddr, RMAP_EXCLUSIVE);
   996			folio_add_lru_vma(folio, vma);
   997			pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, ptdesc_page(ptdesc));
   998			set_pmd_at(vma->vm_mm, haddr, vmf->pmd, entry);
   999			update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
  1000			add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
  1001			mm_inc_nr_ptes(vma->vm_mm);
  1002			spin_unlock(vmf->ptl);
  1003			count_vm_event(THP_FAULT_ALLOC);
  1004			count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_ALLOC);
  1005			count_memcg_event_mm(vma->vm_mm, THP_FAULT_ALLOC);
  1006		}
  1007	
  1008		return 0;
  1009	unlock_release:
  1010		spin_unlock(vmf->ptl);
  1011	release:
  1012		if (ptdesc)
  1013			pte_free(vma->vm_mm, ptdesc);
  1014		folio_put(folio);
  1015		return ret;
  1016	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
