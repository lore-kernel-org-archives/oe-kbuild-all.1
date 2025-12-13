Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F74354774
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 14:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765637152; cv=none; b=OxWonQJHPaoFs/9V6ekoljzgx+2DX7h3y54FVC4w8nsU6CbXpEWN2DCh5USyRgE9kXkbZFfGAcwOSBn69jO2zLNW38yGlF7Y4Slh1sUdDNkBiqar99uV5pceCxjQ9NHH19LlPozIWpK4ItfKtxqtNegwEUH7xde8ZovEShg0hsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765637152; c=relaxed/simple;
	bh=z7vP4VavKDpz4dYBP3qXpNIdqWSav1g0MoCvRU/rAmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R3KiZ5H2XyUsJEGAmgHMi+nsUcpA2BsAZCcpeXICBY0x4RLwHn7vn3+LgqbX5sh0fciZ7+rYRh/4J/bxDbrY+z1Dn8EoM7RI4YO2g7hRs2zOUtfKeLiRqrnLpIAa6FJHmfYlv8+nbJ17dppvxW1SI62NFxvzAv53etDoOV65C6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAVZ6Pp6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAVZ6Pp6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765637151; x=1797173151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z7vP4VavKDpz4dYBP3qXpNIdqWSav1g0MoCvRU/rAmc=;
  b=kAVZ6Pp6X3jRlobN3l4czKU7iRrzhpGaubptoKDvLCbHldw8unBN0o+n
   dGihrn4o38B30pRD4W8vXv2f3cHEMhf/ZkmfybW2JbRaKnK1h1OBOQl4/
   0KYh/Jyf3rGOlCEtEHQmrWFDfxA0v49V2xV0YtLDwJXM3Zi3e+33swJVd
   Yjtl0BsYAGBIxCeFDaxR8Fk3W42tuiCaVobv533b20UAptXUdhGHyIihK
   3F+QuqAx9ogJNS1dpuDu7vmsBxTscGI8XzYHuZpZXC5LP+CtIpNhjLTD0
   3W3GlbmKKy3XyP3mAy30qPPjQOvOulFR4EYLhnStzANL9nmEuQZJ8nWEg
   Q==;
X-CSE-ConnectionGUID: 5BB5AphqQ82joDw3qOZGQw==
X-CSE-MsgGUID: AAnsnBLVQJKt2xNnAF8/gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78727483"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78727483"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 06:45:50 -0800
X-CSE-ConnectionGUID: jhhWlW6LQT2GjqA24KrPpA==
X-CSE-MsgGUID: 2SKKd5KcQZG5qUYZetJCsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201502892"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2025 06:45:48 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUQsU-000000007kX-0sru;
	Sat, 13 Dec 2025 14:45:46 +0000
Date: Sat, 13 Dec 2025 22:45:10 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pgtable20251213 1/2] mm/migrate_device.c:886:48: error:
 incompatible pointer types passing 'pgtable_t' (aka 'pte_t *') to parameter
 of type 'struct ptdesc *'
Message-ID: <202512132208.yMSCbUEP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git pgtable20251213
head:   71f843b5f777eb8b0945aec4cf5844fb4e4105c5
commit: 977a6e01539decdd817dbbc6106a67ec19128bba [1/2] mm/pgtable: use ptdesc for pgtable pointer-6.19
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512132208.yMSCbUEP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132208.yMSCbUEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132208.yMSCbUEP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/migrate_device.c:886:48: error: incompatible pointer types passing 'pgtable_t' (aka 'pte_t *') to parameter of type 'struct ptdesc *' [-Werror,-Wincompatible-pointer-types]
     886 |                 pgtable_trans_huge_deposit(vma->vm_mm, pmdp, pgtable);
         |                                                              ^~~~~~~
   arch/s390/include/asm/pgtable.h:1754:20: note: passing argument to parameter 'pgtable' here
    1754 |                                 struct ptdesc *pgtable);
         |                                                ^
   1 error generated.


vim +886 mm/migrate_device.c

76cbbead253ddc Christoph Hellwig 2022-02-16  776  
a30b48bf1b244f Balbir Singh      2025-10-01  777  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
a30b48bf1b244f Balbir Singh      2025-10-01  778  /**
a30b48bf1b244f Balbir Singh      2025-10-01  779   * migrate_vma_insert_huge_pmd_page: Insert a huge folio into @migrate->vma->vm_mm
a30b48bf1b244f Balbir Singh      2025-10-01  780   * at @addr. folio is already allocated as a part of the migration process with
a30b48bf1b244f Balbir Singh      2025-10-01  781   * large page.
a30b48bf1b244f Balbir Singh      2025-10-01  782   *
a30b48bf1b244f Balbir Singh      2025-10-01  783   * @page needs to be initialized and setup after it's allocated. The code bits
a30b48bf1b244f Balbir Singh      2025-10-01  784   * here follow closely the code in __do_huge_pmd_anonymous_page(). This API does
a30b48bf1b244f Balbir Singh      2025-10-01  785   * not support THP zero pages.
a30b48bf1b244f Balbir Singh      2025-10-01  786   *
a30b48bf1b244f Balbir Singh      2025-10-01  787   * @migrate: migrate_vma arguments
a30b48bf1b244f Balbir Singh      2025-10-01  788   * @addr: address where the folio will be inserted
a30b48bf1b244f Balbir Singh      2025-10-01  789   * @page: page to be inserted at @addr
a30b48bf1b244f Balbir Singh      2025-10-01  790   * @src: src pfn which is being migrated
a30b48bf1b244f Balbir Singh      2025-10-01  791   * @pmdp: pointer to the pmd
a30b48bf1b244f Balbir Singh      2025-10-01  792   */
a30b48bf1b244f Balbir Singh      2025-10-01  793  static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
a30b48bf1b244f Balbir Singh      2025-10-01  794  					 unsigned long addr,
a30b48bf1b244f Balbir Singh      2025-10-01  795  					 struct page *page,
a30b48bf1b244f Balbir Singh      2025-10-01  796  					 unsigned long *src,
a30b48bf1b244f Balbir Singh      2025-10-01  797  					 pmd_t *pmdp)
a30b48bf1b244f Balbir Singh      2025-10-01  798  {
a30b48bf1b244f Balbir Singh      2025-10-01  799  	struct vm_area_struct *vma = migrate->vma;
a30b48bf1b244f Balbir Singh      2025-10-01  800  	gfp_t gfp = vma_thp_gfp_mask(vma);
a30b48bf1b244f Balbir Singh      2025-10-01  801  	struct folio *folio = page_folio(page);
a30b48bf1b244f Balbir Singh      2025-10-01  802  	int ret;
a30b48bf1b244f Balbir Singh      2025-10-01  803  	vm_fault_t csa_ret;
a30b48bf1b244f Balbir Singh      2025-10-01  804  	spinlock_t *ptl;
a30b48bf1b244f Balbir Singh      2025-10-01  805  	pgtable_t pgtable;
a30b48bf1b244f Balbir Singh      2025-10-01  806  	pmd_t entry;
a30b48bf1b244f Balbir Singh      2025-10-01  807  	bool flush = false;
a30b48bf1b244f Balbir Singh      2025-10-01  808  	unsigned long i;
a30b48bf1b244f Balbir Singh      2025-10-01  809  
a30b48bf1b244f Balbir Singh      2025-10-01  810  	VM_WARN_ON_FOLIO(!folio, folio);
a30b48bf1b244f Balbir Singh      2025-10-01  811  	VM_WARN_ON_ONCE(!pmd_none(*pmdp) && !is_huge_zero_pmd(*pmdp));
a30b48bf1b244f Balbir Singh      2025-10-01  812  
a30b48bf1b244f Balbir Singh      2025-10-01  813  	if (!thp_vma_suitable_order(vma, addr, HPAGE_PMD_ORDER))
a30b48bf1b244f Balbir Singh      2025-10-01  814  		return -EINVAL;
a30b48bf1b244f Balbir Singh      2025-10-01  815  
a30b48bf1b244f Balbir Singh      2025-10-01  816  	ret = anon_vma_prepare(vma);
a30b48bf1b244f Balbir Singh      2025-10-01  817  	if (ret)
a30b48bf1b244f Balbir Singh      2025-10-01  818  		return ret;
a30b48bf1b244f Balbir Singh      2025-10-01  819  
a30b48bf1b244f Balbir Singh      2025-10-01  820  	folio_set_order(folio, HPAGE_PMD_ORDER);
a30b48bf1b244f Balbir Singh      2025-10-01  821  	folio_set_large_rmappable(folio);
a30b48bf1b244f Balbir Singh      2025-10-01  822  
a30b48bf1b244f Balbir Singh      2025-10-01  823  	if (mem_cgroup_charge(folio, migrate->vma->vm_mm, gfp)) {
a30b48bf1b244f Balbir Singh      2025-10-01  824  		count_vm_event(THP_FAULT_FALLBACK);
a30b48bf1b244f Balbir Singh      2025-10-01  825  		count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_FALLBACK_CHARGE);
a30b48bf1b244f Balbir Singh      2025-10-01  826  		ret = -ENOMEM;
a30b48bf1b244f Balbir Singh      2025-10-01  827  		goto abort;
a30b48bf1b244f Balbir Singh      2025-10-01  828  	}
a30b48bf1b244f Balbir Singh      2025-10-01  829  
a30b48bf1b244f Balbir Singh      2025-10-01  830  	__folio_mark_uptodate(folio);
a30b48bf1b244f Balbir Singh      2025-10-01  831  
a30b48bf1b244f Balbir Singh      2025-10-01  832  	pgtable = pte_alloc_one(vma->vm_mm);
a30b48bf1b244f Balbir Singh      2025-10-01  833  	if (unlikely(!pgtable))
a30b48bf1b244f Balbir Singh      2025-10-01  834  		goto abort;
a30b48bf1b244f Balbir Singh      2025-10-01  835  
a30b48bf1b244f Balbir Singh      2025-10-01  836  	if (folio_is_device_private(folio)) {
a30b48bf1b244f Balbir Singh      2025-10-01  837  		swp_entry_t swp_entry;
a30b48bf1b244f Balbir Singh      2025-10-01  838  
a30b48bf1b244f Balbir Singh      2025-10-01  839  		if (vma->vm_flags & VM_WRITE)
a30b48bf1b244f Balbir Singh      2025-10-01  840  			swp_entry = make_writable_device_private_entry(
a30b48bf1b244f Balbir Singh      2025-10-01  841  						page_to_pfn(page));
a30b48bf1b244f Balbir Singh      2025-10-01  842  		else
a30b48bf1b244f Balbir Singh      2025-10-01  843  			swp_entry = make_readable_device_private_entry(
a30b48bf1b244f Balbir Singh      2025-10-01  844  						page_to_pfn(page));
a30b48bf1b244f Balbir Singh      2025-10-01  845  		entry = swp_entry_to_pmd(swp_entry);
a30b48bf1b244f Balbir Singh      2025-10-01  846  	} else {
a30b48bf1b244f Balbir Singh      2025-10-01  847  		if (folio_is_zone_device(folio) &&
a30b48bf1b244f Balbir Singh      2025-10-01  848  		    !folio_is_device_coherent(folio)) {
a30b48bf1b244f Balbir Singh      2025-10-01  849  			goto abort;
a30b48bf1b244f Balbir Singh      2025-10-01  850  		}
a30b48bf1b244f Balbir Singh      2025-10-01  851  		entry = folio_mk_pmd(folio, vma->vm_page_prot);
a30b48bf1b244f Balbir Singh      2025-10-01  852  		if (vma->vm_flags & VM_WRITE)
a30b48bf1b244f Balbir Singh      2025-10-01  853  			entry = pmd_mkwrite(pmd_mkdirty(entry), vma);
a30b48bf1b244f Balbir Singh      2025-10-01  854  	}
a30b48bf1b244f Balbir Singh      2025-10-01  855  
a30b48bf1b244f Balbir Singh      2025-10-01  856  	ptl = pmd_lock(vma->vm_mm, pmdp);
a30b48bf1b244f Balbir Singh      2025-10-01  857  	csa_ret = check_stable_address_space(vma->vm_mm);
a30b48bf1b244f Balbir Singh      2025-10-01  858  	if (csa_ret)
a30b48bf1b244f Balbir Singh      2025-10-01  859  		goto abort;
a30b48bf1b244f Balbir Singh      2025-10-01  860  
a30b48bf1b244f Balbir Singh      2025-10-01  861  	/*
a30b48bf1b244f Balbir Singh      2025-10-01  862  	 * Check for userfaultfd but do not deliver the fault. Instead,
a30b48bf1b244f Balbir Singh      2025-10-01  863  	 * just back off.
a30b48bf1b244f Balbir Singh      2025-10-01  864  	 */
a30b48bf1b244f Balbir Singh      2025-10-01  865  	if (userfaultfd_missing(vma))
a30b48bf1b244f Balbir Singh      2025-10-01  866  		goto unlock_abort;
a30b48bf1b244f Balbir Singh      2025-10-01  867  
a30b48bf1b244f Balbir Singh      2025-10-01  868  	if (!pmd_none(*pmdp)) {
a30b48bf1b244f Balbir Singh      2025-10-01  869  		if (!is_huge_zero_pmd(*pmdp))
a30b48bf1b244f Balbir Singh      2025-10-01  870  			goto unlock_abort;
a30b48bf1b244f Balbir Singh      2025-10-01  871  		flush = true;
a30b48bf1b244f Balbir Singh      2025-10-01  872  	} else if (!pmd_none(*pmdp))
a30b48bf1b244f Balbir Singh      2025-10-01  873  		goto unlock_abort;
a30b48bf1b244f Balbir Singh      2025-10-01  874  
a30b48bf1b244f Balbir Singh      2025-10-01  875  	add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
a30b48bf1b244f Balbir Singh      2025-10-01  876  	folio_add_new_anon_rmap(folio, vma, addr, RMAP_EXCLUSIVE);
a30b48bf1b244f Balbir Singh      2025-10-01  877  	if (!folio_is_zone_device(folio))
a30b48bf1b244f Balbir Singh      2025-10-01  878  		folio_add_lru_vma(folio, vma);
a30b48bf1b244f Balbir Singh      2025-10-01  879  	folio_get(folio);
a30b48bf1b244f Balbir Singh      2025-10-01  880  
a30b48bf1b244f Balbir Singh      2025-10-01  881  	if (flush) {
a30b48bf1b244f Balbir Singh      2025-10-01  882  		pte_free(vma->vm_mm, pgtable);
a30b48bf1b244f Balbir Singh      2025-10-01  883  		flush_cache_page(vma, addr, addr + HPAGE_PMD_SIZE);
a30b48bf1b244f Balbir Singh      2025-10-01  884  		pmdp_invalidate(vma, addr, pmdp);
a30b48bf1b244f Balbir Singh      2025-10-01  885  	} else {
a30b48bf1b244f Balbir Singh      2025-10-01 @886  		pgtable_trans_huge_deposit(vma->vm_mm, pmdp, pgtable);
a30b48bf1b244f Balbir Singh      2025-10-01  887  		mm_inc_nr_ptes(vma->vm_mm);
a30b48bf1b244f Balbir Singh      2025-10-01  888  	}
a30b48bf1b244f Balbir Singh      2025-10-01  889  	set_pmd_at(vma->vm_mm, addr, pmdp, entry);
a30b48bf1b244f Balbir Singh      2025-10-01  890  	update_mmu_cache_pmd(vma, addr, pmdp);
a30b48bf1b244f Balbir Singh      2025-10-01  891  
a30b48bf1b244f Balbir Singh      2025-10-01  892  	spin_unlock(ptl);
a30b48bf1b244f Balbir Singh      2025-10-01  893  
a30b48bf1b244f Balbir Singh      2025-10-01  894  	count_vm_event(THP_FAULT_ALLOC);
a30b48bf1b244f Balbir Singh      2025-10-01  895  	count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_ALLOC);
a30b48bf1b244f Balbir Singh      2025-10-01  896  	count_memcg_event_mm(vma->vm_mm, THP_FAULT_ALLOC);
a30b48bf1b244f Balbir Singh      2025-10-01  897  
a30b48bf1b244f Balbir Singh      2025-10-01  898  	return 0;
a30b48bf1b244f Balbir Singh      2025-10-01  899  
a30b48bf1b244f Balbir Singh      2025-10-01  900  unlock_abort:
a30b48bf1b244f Balbir Singh      2025-10-01  901  	spin_unlock(ptl);
a30b48bf1b244f Balbir Singh      2025-10-01  902  abort:
a30b48bf1b244f Balbir Singh      2025-10-01  903  	for (i = 0; i < HPAGE_PMD_NR; i++)
a30b48bf1b244f Balbir Singh      2025-10-01  904  		src[i] &= ~MIGRATE_PFN_MIGRATE;
a30b48bf1b244f Balbir Singh      2025-10-01  905  	return 0;
a30b48bf1b244f Balbir Singh      2025-10-01  906  }
4265d67e405a41 Balbir Singh      2025-10-01  907  

:::::: The code at line 886 was first introduced by commit
:::::: a30b48bf1b244f11bf9b6d20cdccfe0c2264130c mm/migrate_device: implement THP migration of zone device pages

:::::: TO: Balbir Singh <balbirs@nvidia.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
