Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68FB21A0B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720165662; cv=none; b=rWuiFK0dI0kdmGZpSm9vC3+i5ymTYQWqAacirGY9wakoybuld0cXsvpbEXyLuC4vOts/CYpWShR/TENvTIkFx3RkbR3xub5wTcvH/qU753MDCh64aTuwfJx66qhvxik1E+QWinOeu/2e2aweGePnvDViVkVUgYA+rx8RpJ+st2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720165662; c=relaxed/simple;
	bh=JoFntHUOkMWTIJmeXCzBMGkCg94ecQGfUTxsUPLXYcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E7rmrACHDhAfbbPTvYqZ5iwLB84LmKI+A3yx+bbFS0aBWA9F+4gLyxXnRwLnbSj1PlLY3KQjQKc5QJpv2sWDanaRi7yvZaEbHWQPSQD15NRYIlwmm9bi1JrJIaxQX/aaPGP7snx9GFwqApjVxq+kPIuSqzAYTWxAdMg8dw42WD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jR9Dr1no; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jR9Dr1no"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720165659; x=1751701659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JoFntHUOkMWTIJmeXCzBMGkCg94ecQGfUTxsUPLXYcw=;
  b=jR9Dr1nozCuWBHy7lLPBJXDGtkeQBkvYyS17ZseV34g6hoLQMWNM5Ef8
   jUaP3pfMgAtYaX4zXSnVZn4u8CgA8M1y2oPLcoeYgedl1T9OQz9cT6fvB
   bGVjtyM/NOf0kpnkj8aMHk/xQY8S8QfWnynJjby2iKHX1GVixoX/DUze2
   fbbcmcHkZWxqctlmfcKCAKNwZwDCIU5UARAHAkPvCZxqpFaIXmuG7/VYr
   4TD8RmPYyjRm7Aztr7fRwbb/6XM81rAlH7pfBs3wPX/TfGYtTqbyBdPho
   ID1lcuBDEnpjtSemgRdcAFEju7m6KJr/0fvKUCoI0uZEkaNMXZSAlPvlM
   w==;
X-CSE-ConnectionGUID: PVkqDXwxRnyBWdBF/Hgb5Q==
X-CSE-MsgGUID: iuo93x9ySxeHFAivPHhgaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28051352"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="28051352"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 00:47:39 -0700
X-CSE-ConnectionGUID: Lm0OamMmTGKNbIO35WMPyw==
X-CSE-MsgGUID: t+cKvFisTTCrTDNl6QDztg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="46773299"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jul 2024 00:47:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPdfL-000S6Z-2K;
	Fri, 05 Jul 2024 07:47:35 +0000
Date: Fri, 5 Jul 2024 15:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folio_walk 1/10] mm/pagewalk.c:779: warning:
 Function parameter or struct member 'flags' not described in
 'folio_walk_start'
Message-ID: <202407051504.WPDmSDjH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux folio_walk
head:   2f4d7091b83580a58b19e7fc497222c294793b18
commit: 914e56a47b49153899cfb85dbb2e6494f974a4e9 [1/10] mm/pagewalk: introduce folio_walk_start() + folio_walk_end()
config: x86_64-sof-customedconfig-atom-defconfig (https://download.01.org/0day-ci/archive/20240705/202407051504.WPDmSDjH-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051504.WPDmSDjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051504.WPDmSDjH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/pagewalk.c:779: warning: Function parameter or struct member 'flags' not described in 'folio_walk_start'


vim +779 mm/pagewalk.c

   720	
   721	/**
   722	 * folio_walk_start - walk the page tables to a folio
   723	 * @vma: the VMA.
   724	 * @addr: the virtual address to use for the page table walk.
   725	 * @fw: filled with information on success.
   726	 *
   727	 * Walk the page tables and lookup a mapped folio, making sure the page table
   728	 * cannot be modified until folio_walk_end() was called.
   729	 *
   730	 * As default, this function returns only folios that are not special (e.g., not
   731	 * the zeropage) and never returns folios that are supposed to be ignored by the
   732	 * VM (e.g., VM_PFNMAP) as documented by vm_normal_page(). If requested,
   733	 * zeropages will be returned as well.
   734	 *
   735	 * As default, this function only considers present page table entries.
   736	 * If requested, it will also consider migration entries, but one has to
   737	 * be a bit careful, especially with large folios that might get concurrently
   738	 * split.
   739	 *
   740	 * Other entries are ignored and result in -ENOENT. Similarly if no suitable
   741	 * folio is mapped (e.g., zeropage without FW_ZEROPAGE), -ENOENT is returned.
   742	 * That is, -ENOENT might either indicate "there is nothing" or "there is
   743	 * nothing applicable we can return".
   744	 *
   745	 * On success, @fw is filled and the function returns the folio while the PTL
   746	 * is still held and folio_walk_end() must be called to clean up,
   747	 * releasing any held locks. The returned folio must *not* be used after the
   748	 * call to folio_walk_end(), unless a short-term folio reference is taken before
   749	 * that call. Note that the folio may get unmapped and freed immediately after
   750	 * the call to folio_walk_end().
   751	 *
   752	 * @fw->idx corresponds to the index into a large folio that is effectively
   753	 * referenced by "addr". Note that large folios might be mapped by multiple
   754	 * page table entries, and this function will always only lookup a single
   755	 * entry as specified by "addr", that might or might not cover more than
   756	 * a single page of the returned folio.
   757	 *
   758	 * This function must *not* be used as a naive replacement for
   759	 * get_user_pages() / pin_user_pages(), especially not to perform DMA or
   760	 * carelessly modify page content. This function may *only* be used to grab
   761	 * short-term folio references, never to grab long-term folio references.
   762	 *
   763	 * Using the page table entry pointers in @fw for reading or modifying the
   764	 * entry should be avoided where possible: however, there might be valid
   765	 * use cases where it is unavoidable.
   766	 *
   767	 * WARNING: Special care is required when using the page table entry pointers in
   768	 * @fw with hugetlb folios: these might be cont-PTE/cont-PMD entries that
   769	 * absolutely must be modified using the proper hugetlb functions as a single
   770	 * unit.
   771	 *
   772	 * The mmap lock must be held in read mode.
   773	 *
   774	 * Return: folio pointer on success. -ENOENT if no suitable folio was found and
   775	 * -EAGAIN on invalid inputs. Never returns 0.
   776	 */
   777	struct folio *folio_walk_start(struct vm_area_struct *vma, unsigned long addr,
   778			struct folio_walk *fw, folio_walk_flags_t flags)
 > 779	{
   780		struct page *page;
   781		pud_t *pudp, pud;
   782		pmd_t *pmdp, pmd;
   783		pte_t *ptep, pte;
   784		spinlock_t *ptl;
   785		pgd_t *pgdp;
   786		p4d_t *p4dp;
   787	
   788		mmap_assert_locked(vma->vm_mm);
   789	
   790		if (addr < vma->vm_start || addr >= vma->vm_end)
   791			return ERR_PTR(-EINVAL);
   792	
   793		if (is_vm_hugetlb_page(vma))
   794			return folio_walk_start_hugetlb(vma, addr, fw, flags);
   795	
   796		pgdp = pgd_offset(vma->vm_mm, addr);
   797		if (pgd_none_or_clear_bad(pgdp))
   798			return ERR_PTR(-ENOENT);
   799		p4dp = p4d_offset(pgdp, addr);
   800		if (p4d_none_or_clear_bad(p4dp))
   801			return ERR_PTR(-ENOENT);
   802		pudp = pud_offset(p4dp, addr);
   803		if (pud_none_or_clear_bad(pudp))
   804			return ERR_PTR(-ENOENT);
   805		if (pud_leaf(*pudp)) {
   806			ptl = pud_lock(vma->vm_mm, pudp);
   807			pud = pudp_get(pudp);
   808	
   809			/*
   810			 * We might have raced with split_huge_pud() that zapped the
   811			 * page table.
   812			 */
   813			if (!pud_present(pud) || !pud_leaf(pud) || pud_devmap(pud)) {
   814				spin_unlock(ptl);
   815				return ERR_PTR(-ENOENT);
   816			}
   817			page = pud_page(pud);
   818			goto found_pud;
   819		}
   820		pmdp = pmd_offset(pudp, addr);
   821		if (pmd_none(*pmdp))
   822			return ERR_PTR(-ENOENT);
   823	
   824		ptl = pmd_trans_huge_lock(pmdp, vma);
   825		if (ptl) {
   826			pmd = pmdp_get(pmdp);
   827			if (pmd_none(pmd)) {
   828				spin_unlock(ptl);
   829				return ERR_PTR(-ENOENT);
   830			}
   831	
   832			if (pmd_present(pmd)) {
   833				page = vm_normal_page_pmd(vma, addr, pmd);
   834				if (page) {
   835					goto found_pmd;
   836				} else if ((flags & FW_ZEROPAGE) &&
   837					    is_huge_zero_pmd(pmd)) {
   838					page = pfn_to_page(pmd_pfn(pmd));
   839					goto found_pmd;
   840				}
   841			} else if ((flags & FW_MIGRATION_ENTRIES) &&
   842				   is_pmd_migration_entry(pmd)) {
   843				swp_entry_t entry = pmd_to_swp_entry(pmd);
   844	
   845				page = pfn_swap_entry_to_page(entry);
   846				goto found_pmd;
   847			}
   848			spin_unlock(ptl);
   849			return ERR_PTR(-ENOENT);
   850		}
   851	
   852		ptep = pte_offset_map_lock(vma->vm_mm, pmdp, addr, &ptl);
   853		if (!ptep)
   854			return ERR_PTR(-ENOENT);
   855	
   856		pte = ptep_get(ptep);
   857		if (pte_present(pte)) {
   858			page = vm_normal_page(vma, addr, pte);
   859			if (page)
   860				goto found_pte;
   861			if ((flags & FW_ZEROPAGE) &&
   862			    is_zero_pfn(pte_pfn(pte))) {
   863				page = pfn_to_page(pte_pfn(pte));
   864				goto found_pte;
   865			}
   866		} else if (!pte_none(pte)) {
   867			swp_entry_t entry = pte_to_swp_entry(pte);
   868	
   869			if ((flags & FW_MIGRATION_ENTRIES) &&
   870			    is_migration_entry(entry)) {
   871				page = pfn_swap_entry_to_page(entry);
   872				goto found_pte;
   873			}
   874		}
   875		pte_unmap_unlock(ptep, ptl);
   876		return ERR_PTR(-ENOENT);
   877	found_pte:
   878		fw->level = FW_LEVEL_PTE;
   879		fw->ptep = ptep;
   880		fw->pte = pte;
   881		return __folio_walk_fill(fw, page, 0, vma, ptl);
   882	found_pmd:
   883		fw->level = FW_LEVEL_PMD;
   884		fw->pmdp = pmdp;
   885		fw->pmd = pmd;
   886		return __folio_walk_fill(fw, page, addr & (PMD_SIZE - 1), vma, ptl);
   887	found_pud:
   888		fw->level = FW_LEVEL_PUD;
   889		fw->pudp = pudp;
   890		fw->pud = pud;
   891		return __folio_walk_fill(fw, page, addr & (PUD_SIZE - 1), vma, ptl);
   892	}
   893	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
