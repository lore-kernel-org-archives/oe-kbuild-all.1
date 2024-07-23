Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BED13D520
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 06:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721717303; cv=none; b=iok2DGB+WIh3vXl/eEhnoPhJYXRAYW3zR6tUF4DHvj1VgrNOmW1zNQM1mCT/PKHvsRaB00S3ggl5Q4mAK/mKZgCIomF3V7WGm0OyfqdrV32AzDYjE/GS/7Iv45ud2EYyeoAwN/MEqRG47xe0XkIZIZXRsX6vUUIhk/Tw0ZaFcrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721717303; c=relaxed/simple;
	bh=0WBNI2ZLYrVPGwfRwD2eX4SsIqn3nSXZeIid7O0Qftc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NxenxgjJ0rEsO/XJS80FV2tbRwRzrSrWDSiks2iuz7IZj8mECcZ90viQMx5TAIUkeo3ZlSuzwdbzHD1PXbf52N4CReGGkZqeeAaOdMYdDY8xEzgwOuytoVlnlGUW6ozpRFf5O3zaHuNPojgPYxDxYcDwXECrmREtAYboANfUIF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/Y37W9e; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/Y37W9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721717301; x=1753253301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0WBNI2ZLYrVPGwfRwD2eX4SsIqn3nSXZeIid7O0Qftc=;
  b=P/Y37W9e2Gywu+682aQutSHBCPOYMOv1wJXgsMMk4Q1vfucq30Z9qgEJ
   eNfoY2+6y1o0ZjjaDaMjtyDFM3palkV6T6nHGxRZ6aeynKniPYAZhGaw1
   uthuB/ODxZtK3i5lATpvskC0DQ52f+Iek5FwSK1WgP1Ni8QVDYG+WdkW1
   RXwTy7TOFVhOyKLspkREuScdFGUZpFQ91nqYzKtgHIJ6WBo+KAEL1VjcO
   DKZ3CJQGcR/aREBuaIIeXu1Bs1IjZChKcBI597M0ksrRHgXKuL6JJDOyL
   3XoYRFIBkgmaMSPTJB2wwwJxZ3MPNb/fVxuRgMY/N4Gw8LRuk3cZom6Q+
   A==;
X-CSE-ConnectionGUID: sa3T/bwkT923VIKmabi3/g==
X-CSE-MsgGUID: /mLLxI/zTW+5k7l3ooyosA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30473170"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="30473170"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 23:48:21 -0700
X-CSE-ConnectionGUID: 4Mya0vBeSFO9hL2/IgNVmQ==
X-CSE-MsgGUID: D8Kpmu7kSH+eFRdQZsHvLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="56291733"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2024 23:48:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW9Jp-000lia-0N;
	Tue, 23 Jul 2024 06:48:17 +0000
Date: Tue, 23 Jul 2024 14:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folio_walk 1/11] mm/pagewalk.c:797:undefined
 reference to `vm_normal_page_pmd'
Message-ID: <202407231416.Oshw2fXQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux folio_walk
head:   d67d4b815e12f5db41251e2d60b4930f4d3c9e31
commit: 68d25ad59a06bda87b5dc92a9a6e6fa43034c889 [1/11] mm/pagewalk: introduce folio_walk_start() + folio_walk_end()
config: i386-randconfig-003-20240723 (https://download.01.org/0day-ci/archive/20240723/202407231416.Oshw2fXQ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407231416.Oshw2fXQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407231416.Oshw2fXQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/pagewalk.o: in function `folio_walk_start':
>> mm/pagewalk.c:797:(.text+0xe5a): undefined reference to `vm_normal_page_pmd'


vim +797 mm/pagewalk.c

   676	
   677	/**
   678	 * folio_walk_start - walk the page tables to a folio
   679	 * @vma: the VMA.
   680	 * @addr: the virtual address to use for the page table walk.
   681	 * @fw: filled with information on success.
   682	 *
   683	 * Walk the page tables and lookup a mapped folio, making sure the page table
   684	 * cannot be modified until folio_walk_end() was called.
   685	 *
   686	 * As default, this function returns only folios that are not special (e.g., not
   687	 * the zeropage) and never returns folios that are supposed to be ignored by the
   688	 * VM as documented by vm_normal_page(). If requested, zeropages will be
   689	 * returned as well.
   690	 *
   691	 * As default, this function only considers present page table entries.
   692	 * If requested, it will also consider migration entries.
   693	 *
   694	 * Other entries are ignored. Similarly if no suitable folio is mapped,
   695	 * NULL is returned. That is, NULL might either indicate "there is nothing" or
   696	 * "there is nothing suitable we can return".
   697	 *
   698	 * On success, @fw is filled and the function returns the folio while the PTL
   699	 * is still held and folio_walk_end() must be called to clean up,
   700	 * releasing any held locks. The returned folio must *not* be used after the
   701	 * call to folio_walk_end(), unless a short-term folio reference is taken before
   702	 * that call.
   703	 *
   704	 * @fw->page corresponds to the page that is effectively referenced by "addr".
   705	 * However, for hugetlb folios, migration entries and the shared zeropage,
   706	 * @fw->page is set to NULL. Note that large folios might be mapped by
   707	 * multiple page table entries, and this function will always only lookup a
   708	 * single entry as specified by "addr", that might or might not cover more than
   709	 * a single page of the returned folio.
   710	 *
   711	 * This function must *not* be used as a naive replacement for
   712	 * get_user_pages() / pin_user_pages(), especially not to perform DMA or
   713	 * to carelessly modify page content. This function may *only* be used to grab
   714	 * short-term folio references, never to grab long-term folio references.
   715	 *
   716	 * Using the page table entry pointers in @fw for reading or modifying the
   717	 * entry should be avoided where possible: however, there might be valid
   718	 * use cases.
   719	 *
   720	 * WARNING: Modifying page table entries in hugetlb VMAs requires a lot of care.
   721	 * For example, PMD page table sharing might require prior unsharing. Also,
   722	 * logical hugetlb entries might span multiple physical page table entries,
   723	 * which all *must* be modified in a single operation (set_huge_pte_at(),
   724	 * huge_ptep_set_*, ...). Note that the page table entry stored in @fw might
   725	 * not correspond to the first physical entry of a logical hugetlb entry.
   726	 *
   727	 * The mmap lock must be held in read mode.
   728	 *
   729	 * Return: folio pointer on success, otherwise NULL.
   730	 */
   731	struct folio *folio_walk_start(struct vm_area_struct *vma, unsigned long addr,
   732			struct folio_walk *fw, folio_walk_flags_t flags)
   733	{
   734		bool expose_page = !is_vm_hugetlb_page(vma);
   735		struct page *page;
   736		pud_t *pudp, pud;
   737		pmd_t *pmdp, pmd;
   738		pte_t *ptep, pte;
   739		spinlock_t *ptl;
   740		pgd_t *pgdp;
   741		p4d_t *p4dp;
   742	
   743		mmap_assert_locked(vma->vm_mm);
   744	
   745		if (WARN_ON_ONCE(addr < vma->vm_start || addr >= vma->vm_end))
   746			return NULL;
   747	
   748		if (is_vm_hugetlb_page(vma))
   749			hugetlb_vma_lock_read(vma);
   750	
   751		pgdp = pgd_offset(vma->vm_mm, addr);
   752		if (pgd_none_or_clear_bad(pgdp))
   753			goto not_found;
   754	
   755		p4dp = p4d_offset(pgdp, addr);
   756		if (p4d_none_or_clear_bad(p4dp))
   757			goto not_found;
   758	
   759		pudp = pud_offset(p4dp, addr);
   760		if (pud_none_or_clear_bad(pudp))
   761			goto not_found;
   762		if (pud_leaf(*pudp)) {
   763			ptl = pud_lock(vma->vm_mm, pudp);
   764			pud = pudp_get(pudp);
   765	
   766			if (!pud_present(pud) || pud_devmap(pud)) {
   767				spin_unlock(ptl);
   768				goto not_found;
   769			} else if (!pud_leaf(pud)) {
   770				spin_unlock(ptl);
   771				goto pmd_table;
   772			}
   773			/*
   774			 * TODO: vm_normal_page_pud() will be handy once we want to
   775			 * support PUD mappings in VM_PFNMAP|VM_MIXEDMAP VMAs.
   776			 */
   777			page = pud_page(pud);
   778			goto found_pud;
   779		}
   780	
   781	pmd_table:
   782		pmdp = pmd_offset(pudp, addr);
   783		pmd = pmdp_get_lockless(pmdp);
   784		if (pmd_none(pmd))
   785			goto not_found;
   786		if (pmd_leaf(pmd)) {
   787			ptl = pmd_lock(vma->vm_mm, pmdp);
   788			pmd = pmdp_get(pmdp);
   789	
   790			if (pmd_none(pmd)) {
   791				spin_unlock(ptl);
   792				goto not_found;
   793			} else if (!pmd_leaf(pmd)) {
   794				spin_unlock(ptl);
   795				goto pte_table;
   796			} else if (pmd_present(pmd)) {
 > 797				page = vm_normal_page_pmd(vma, addr, pmd);
   798				if (page) {
   799					goto found_pmd;
   800				} else if ((flags & FW_ZEROPAGE) &&
   801					    is_huge_zero_pmd(pmd)) {
   802					page = pfn_to_page(pmd_pfn(pmd));
   803					expose_page = false;
   804					goto found_pmd;
   805				}
   806			} else if ((flags & FW_MIGRATION_ENTRIES) &&
   807				   is_pmd_migration_entry(pmd)) {
   808				swp_entry_t entry = pmd_to_swp_entry(pmd);
   809	
   810				page = pfn_swap_entry_to_page(entry);
   811				expose_page = false;
   812				goto found_pmd;
   813			}
   814			spin_unlock(ptl);
   815			goto not_found;
   816		}
   817	
   818	pte_table:
   819		ptep = pte_offset_map_lock(vma->vm_mm, pmdp, addr, &ptl);
   820		if (!ptep)
   821			goto not_found;
   822	
   823		pte = ptep_get(ptep);
   824		if (pte_present(pte)) {
   825			page = vm_normal_page(vma, addr, pte);
   826			if (page)
   827				goto found_pte;
   828			if ((flags & FW_ZEROPAGE) &&
   829			    is_zero_pfn(pte_pfn(pte))) {
   830				page = pfn_to_page(pte_pfn(pte));
   831				expose_page = false;
   832				goto found_pte;
   833			}
   834		} else if (!pte_none(pte)) {
   835			swp_entry_t entry = pte_to_swp_entry(pte);
   836	
   837			if ((flags & FW_MIGRATION_ENTRIES) &&
   838			    is_migration_entry(entry)) {
   839				page = pfn_swap_entry_to_page(entry);
   840				expose_page = false;
   841				goto found_pte;
   842			}
   843		}
   844		pte_unmap_unlock(ptep, ptl);
   845	not_found:
   846		if (is_vm_hugetlb_page(vma))
   847			hugetlb_vma_unlock_read(vma);
   848		return NULL;
   849	found_pte:
   850		fw->level = FW_LEVEL_PTE;
   851		fw->ptep = ptep;
   852		fw->pte = pte;
   853		return __folio_walk_fill(fw, page, expose_page, 0, vma, ptl);
   854	found_pmd:
   855		fw->level = FW_LEVEL_PMD;
   856		fw->pmdp = pmdp;
   857		fw->pmd = pmd;
   858		return __folio_walk_fill(fw, page, expose_page, addr & (PMD_SIZE - 1),
   859					 vma, ptl);
   860	found_pud:
   861		fw->level = FW_LEVEL_PUD;
   862		fw->pudp = pudp;
   863		fw->pud = pud;
   864		return __folio_walk_fill(fw, page, expose_page, addr & (PUD_SIZE - 1),
   865					 vma, ptl);
   866	}
   867	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
