Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B27D502
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721552295; cv=none; b=WvImHT0Z653IyJFGZFiEnxiizbqnqIxS+nL32WqOiyZC5nPmI+tno8ia4avZEEP49BlXHpBAZquHQpnRPn0TkbLbv2SsXA5SZYa1WytwZvvE7t9B9Qeirj1zUMur+X8Hw+J0a6xT4+oM2g8P9/QI0wYjaAwlh27T9xPkQOLHmuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721552295; c=relaxed/simple;
	bh=rX+qS3QY/yz57D1rRYBAfJZPazMM0/saAOVXo+0QOlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ufc6KqLgS2+koeSmGewgjmBhgrNgeDiP0LCckNolpCRhpd2O8JgHg9SuFLf1ShlMMJTkU9BRKY2nYwu0gq5N8Nwxzv7D234GXdatRMxVTfypgpDG7sKXTStYzdFk+k/V/IjjwAph7RzMUktNt3DgcODG4H4LJxwP31+Qhp5LUR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnGLyFF3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnGLyFF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721552294; x=1753088294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rX+qS3QY/yz57D1rRYBAfJZPazMM0/saAOVXo+0QOlY=;
  b=FnGLyFF3vEQC5EG6w3HIrLdS8ZjJ7zgWGMS0nSIXe8xjxmWUFbOsQb57
   UIXROX9oELqcZnJlGyAAuDPxsCrTpyVPz4ieNhrLGNoIR3+dgL6MmTHQz
   iajuzKgwVVxtOZO8+FZoVWtNlLDKCCW248F6tcaO9FW4mYmRxJgjGOmPK
   YS72Uz9bhR01tWZvRtvXlZ1u9bdqwFzrnl146gZH3h9FxI0574yINvLqK
   lsB+WfrClhHc0JfYeO4g2EQOM52tP2J59g7QZUTkWTBMOjA6j1IRvYwIk
   RXai7KHSUDLNJfzwfGGBWUNuVugZ2HPg9Q6Z4MhEK5xRK549hUxrvb/8c
   Q==;
X-CSE-ConnectionGUID: mpbljGkmQh2x7q2skEazmQ==
X-CSE-MsgGUID: v7ZoE83YQcu8sTSvAV0xuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="30282495"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="30282495"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 01:58:13 -0700
X-CSE-ConnectionGUID: YZdrHNPURHCSM0GRlYTP1w==
X-CSE-MsgGUID: QfTdgzDOSCexvzKldG3C/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51452060"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jul 2024 01:58:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVSOP-000k6Y-0z;
	Sun, 21 Jul 2024 08:58:09 +0000
Date: Sun, 21 Jul 2024 16:57:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 35/43] mm/huge_memory.c:997:66: error: passing
 argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type
Message-ID: <202407211619.CFnZb7E7-lkp@intel.com>
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
commit: 7e49c7e572a22b165bd9a3f2e9e1fd4085a40fb8 [35/43] pgtable: use ptdesc in pgtable_trans_huge_deposit
config: powerpc64-randconfig-001-20240721 (https://download.01.org/0day-ci/archive/20240721/202407211619.CFnZb7E7-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211619.CFnZb7E7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211619.CFnZb7E7-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/huge_memory.c: In function '__do_huge_pmd_anonymous_page':
   mm/huge_memory.c:987:46: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
     987 |                         pte_free(vma->vm_mm, ptdesc);
         |                                              ^~~~~~
         |                                              |
         |                                              struct ptdesc *
   In file included from mm/huge_memory.c:45:
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
>> mm/huge_memory.c:997:66: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
     997 |                 pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, ptdesc);
         |                                                                  ^~~~~~
         |                                                                  |
         |                                                                  struct ptdesc *
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
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/huge_memory.c:8:
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
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
   mm/huge_memory.c: In function 'set_huge_zero_folio':
   mm/huge_memory.c:1064:45: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
    1064 |         pgtable_trans_huge_deposit(mm, pmd, ptdesc);
         |                                             ^~~~~~
         |                                             |
         |                                             struct ptdesc *
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                            ~~~~~~~~~~^~~~~~~
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
   mm/huge_memory.c:1120:46: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1120 |                         pte_free(vma->vm_mm, ptdesc);
         |                                              ^~~~~~
         |                                              |
         |                                              struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function 'insert_pfn_pmd':
   mm/huge_memory.c:1167:53: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
    1167 |                 pgtable_trans_huge_deposit(mm, pmd, ptdesc);
         |                                                     ^~~~~~
         |                                                     |
         |                                                     struct ptdesc *
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
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
   mm/huge_memory.c:1404:61: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
    1404 |                 pgtable_trans_huge_deposit(dst_mm, dst_pmd, ptdesc);
         |                                                             ^~~~~~
         |                                                             |
         |                                                             struct ptdesc *
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                            ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1414:34: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1414 |                 pte_free(dst_mm, ptdesc);
         |                                  ^~~~~~


vim +/pgtable_trans_huge_deposit +997 mm/huge_memory.c

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
 > 997			pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, ptdesc);
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
