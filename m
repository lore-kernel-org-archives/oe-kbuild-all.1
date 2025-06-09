Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99041221708
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 20:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749499560; cv=none; b=ssJRmH1wd/Gs8cjCqppBW8n5dV++mlkJRDlM7yl0scu6H/P2bWTI8/IHZd5fpIzQK0u8bXEgAm6jtJdAId8qdFwDvRGSqMTjkzHGXZ+jRRoLGTY/rTouRvruuwBa1qbbPTG+oqNMJPA7Y8La1Xz06zcIZmPLWsCsyLEj24iYH5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749499560; c=relaxed/simple;
	bh=0DTR65/nEAvSn2rgqfCsSACqxTCZiricThb2Em0KJU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V4gmUUvUbXpN9RjTQdT2V4vWlPYwzYFRAHs1qliMhJyjiypkfHqg7aeBbnn148gmxaLamATbt2uzwuDacGb3D8RK2/HPsx8eUH1A2oep45JHibPB73QLc4z8Tb4XKF+9ZibzhZLMhmEQMOFzOxwHhnPvuXPr8X28zfvH3CfKLd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddnYlAEu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddnYlAEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749499559; x=1781035559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0DTR65/nEAvSn2rgqfCsSACqxTCZiricThb2Em0KJU4=;
  b=ddnYlAEuepkb0fiGOEl9XmR0rUtP59XyPgMXd0RppIDWZKMfKdhWzXxo
   f2IvgZpa3A2DVmFNiLEYbXJcINNGOpLH4XFtbVUVY6T/klQwKzKOaqsJC
   tiEJwp9NjMhm5VFYx5rAXCC1M4klz+OudpvUGBkYij+tgF+sYPd3I8rcs
   dD0JnJvP1K6I6SLXzWsVeg5ogKHiXpzIQflqAaFE0+COHYojLRrNnCIWg
   1FJn0Cl+939Vcooa4FqyP+LHsDEN4wNlsWZGysig2MIR+maRK1995rzCH
   FhM3dIeDVyKv0PBgFEoBUs9e6RUtU4yXIMBxzQztNxoeXc6pGOq3KGzKB
   g==;
X-CSE-ConnectionGUID: Y2tvv7vtS5O7f+cci/vZ+w==
X-CSE-MsgGUID: +zpBfECYTwq/Vqtf3r19mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55256772"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="55256772"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 13:05:58 -0700
X-CSE-ConnectionGUID: idtUkKFvSnO2IrGYiPvUEA==
X-CSE-MsgGUID: 6AvkrxSTT6+LcITehV1Bsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="147550716"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jun 2025 13:05:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOikk-0007NN-2i;
	Mon, 09 Jun 2025 20:05:54 +0000
Date: Tue, 10 Jun 2025 04:05:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2380/2380] mm/pagewalk.c:816:undefined reference
 to `vm_normal_page_pmd'
Message-ID: <202506100341.pGF5A7BE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a7f4bf73c34996ee6cdda292e8f906a9c30879de
commit: eb6d298e49a22a61e4a25377329a81445bed4611 [2380/2380] mm/pagewalk: introduce folio_walk_start() + folio_walk_end()
config: arm64-randconfig-003-20250609 (https://download.01.org/0day-ci/archive/20250610/202506100341.pGF5A7BE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100341.pGF5A7BE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100341.pGF5A7BE-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: mm/pagewalk.o: in function `folio_walk_start':
>> mm/pagewalk.c:816:(.text+0x1cbc): undefined reference to `vm_normal_page_pmd'
>> mm/pagewalk.c:816:(.text+0x1cbc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `vm_normal_page_pmd'
   aarch64-linux-ld: mm/kasan/shadow.o: in function `memcpy_mc':
   shadow.c:(.text+0x7ac): undefined reference to `__memcpy_mc'
   shadow.c:(.text+0x7ac): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__memcpy_mc'


vim +816 mm/pagewalk.c

   682	
   683	/**
   684	 * folio_walk_start - walk the page tables to a folio
   685	 * @fw: filled with information on success.
   686	 * @vma: the VMA.
   687	 * @addr: the virtual address to use for the page table walk.
   688	 * @flags: flags modifying which folios to walk to.
   689	 *
   690	 * Walk the page tables using @addr in a given @vma to a mapped folio and
   691	 * return the folio, making sure that the page table entry referenced by
   692	 * @addr cannot change until folio_walk_end() was called.
   693	 *
   694	 * As default, this function returns only folios that are not special (e.g., not
   695	 * the zeropage) and never returns folios that are supposed to be ignored by the
   696	 * VM as documented by vm_normal_page(). If requested, zeropages will be
   697	 * returned as well.
   698	 *
   699	 * As default, this function only considers present page table entries.
   700	 * If requested, it will also consider migration entries.
   701	 *
   702	 * If this function returns NULL it might either indicate "there is nothing" or
   703	 * "there is nothing suitable".
   704	 *
   705	 * On success, @fw is filled and the function returns the folio while the PTL
   706	 * is still held and folio_walk_end() must be called to clean up,
   707	 * releasing any held locks. The returned folio must *not* be used after the
   708	 * call to folio_walk_end(), unless a short-term folio reference is taken before
   709	 * that call.
   710	 *
   711	 * @fw->page will correspond to the page that is effectively referenced by
   712	 * @addr. However, for migration entries and shared zeropages @fw->page is
   713	 * set to NULL. Note that large folios might be mapped by multiple page table
   714	 * entries, and this function will always only lookup a single entry as
   715	 * specified by @addr, which might or might not cover more than a single page of
   716	 * the returned folio.
   717	 *
   718	 * This function must *not* be used as a naive replacement for
   719	 * get_user_pages() / pin_user_pages(), especially not to perform DMA or
   720	 * to carelessly modify page content. This function may *only* be used to grab
   721	 * short-term folio references, never to grab long-term folio references.
   722	 *
   723	 * Using the page table entry pointers in @fw for reading or modifying the
   724	 * entry should be avoided where possible: however, there might be valid
   725	 * use cases.
   726	 *
   727	 * WARNING: Modifying page table entries in hugetlb VMAs requires a lot of care.
   728	 * For example, PMD page table sharing might require prior unsharing. Also,
   729	 * logical hugetlb entries might span multiple physical page table entries,
   730	 * which *must* be modified in a single operation (set_huge_pte_at(),
   731	 * huge_ptep_set_*, ...). Note that the page table entry stored in @fw might
   732	 * not correspond to the first physical entry of a logical hugetlb entry.
   733	 *
   734	 * The mmap lock must be held in read mode.
   735	 *
   736	 * Return: folio pointer on success, otherwise NULL.
   737	 */
   738	struct folio *folio_walk_start(struct folio_walk *fw,
   739			struct vm_area_struct *vma, unsigned long addr,
   740			folio_walk_flags_t flags)
   741	{
   742		unsigned long entry_size;
   743		bool expose_page = true;
   744		struct page *page;
   745		pud_t *pudp, pud;
   746		pmd_t *pmdp, pmd;
   747		pte_t *ptep, pte;
   748		spinlock_t *ptl;
   749		pgd_t *pgdp;
   750		p4d_t *p4dp;
   751	
   752		mmap_assert_locked(vma->vm_mm);
   753		vma_pgtable_walk_begin(vma);
   754	
   755		if (WARN_ON_ONCE(addr < vma->vm_start || addr >= vma->vm_end))
   756			goto not_found;
   757	
   758		pgdp = pgd_offset(vma->vm_mm, addr);
   759		if (pgd_none_or_clear_bad(pgdp))
   760			goto not_found;
   761	
   762		p4dp = p4d_offset(pgdp, addr);
   763		if (p4d_none_or_clear_bad(p4dp))
   764			goto not_found;
   765	
   766		pudp = pud_offset(p4dp, addr);
   767		pud = pudp_get(pudp);
   768		if (pud_none(pud))
   769			goto not_found;
   770		if (IS_ENABLED(CONFIG_PGTABLE_HAS_HUGE_LEAVES) && pud_leaf(pud)) {
   771			ptl = pud_lock(vma->vm_mm, pudp);
   772			pud = pudp_get(pudp);
   773	
   774			entry_size = PUD_SIZE;
   775			fw->level = FW_LEVEL_PUD;
   776			fw->pudp = pudp;
   777			fw->pud = pud;
   778	
   779			if (!pud_present(pud) || pud_devmap(pud)) {
   780				spin_unlock(ptl);
   781				goto not_found;
   782			} else if (!pud_leaf(pud)) {
   783				spin_unlock(ptl);
   784				goto pmd_table;
   785			}
   786			/*
   787			 * TODO: vm_normal_page_pud() will be handy once we want to
   788			 * support PUD mappings in VM_PFNMAP|VM_MIXEDMAP VMAs.
   789			 */
   790			page = pud_page(pud);
   791			goto found;
   792		}
   793	
   794	pmd_table:
   795		VM_WARN_ON_ONCE(pud_leaf(*pudp));
   796		pmdp = pmd_offset(pudp, addr);
   797		pmd = pmdp_get_lockless(pmdp);
   798		if (pmd_none(pmd))
   799			goto not_found;
   800		if (IS_ENABLED(CONFIG_PGTABLE_HAS_HUGE_LEAVES) && pmd_leaf(pmd)) {
   801			ptl = pmd_lock(vma->vm_mm, pmdp);
   802			pmd = pmdp_get(pmdp);
   803	
   804			entry_size = PMD_SIZE;
   805			fw->level = FW_LEVEL_PMD;
   806			fw->pmdp = pmdp;
   807			fw->pmd = pmd;
   808	
   809			if (pmd_none(pmd)) {
   810				spin_unlock(ptl);
   811				goto not_found;
   812			} else if (!pmd_leaf(pmd)) {
   813				spin_unlock(ptl);
   814				goto pte_table;
   815			} else if (pmd_present(pmd)) {
 > 816				page = vm_normal_page_pmd(vma, addr, pmd);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
