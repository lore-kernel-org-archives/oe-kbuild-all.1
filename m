Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99F1194A76
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 05:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765688611; cv=none; b=qALAT9b+vqZdxhyYX07n+5XjVE5h+/n0E9IiL1fS2YzH+0/eehjnOtNEu9oftm5opKhzUTsWq4HEnDfFb6GnPM+b6FbamMPFs4K/ZoxHOc92LSGhVz70IzmFuA5i2FloksAxMUKRbDiWoH10bkWI2C8+JNolfft7mgw6YB3JWZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765688611; c=relaxed/simple;
	bh=Pji5FbAB1TMwLIy1si1ZbZS9K+rGyXslZ+wBuldBVms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ifPNs4zEqhk6q0iW5RN49PNtrhuew4DrTClz3DYlWcMbfLs7SJ+89fhltO/yNi30ZdRdb/KtUzhAh/5z4dL2m7Y8SLDTOjEtBE00DzqAdh0TJPSGmHsiQbHpvobqsbT8HXwQC9cSecyVs7CFW4Yyf4bfE2WdZ4LfkcWpbVAeF2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGoQI+GB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGoQI+GB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765688609; x=1797224609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pji5FbAB1TMwLIy1si1ZbZS9K+rGyXslZ+wBuldBVms=;
  b=SGoQI+GBI658fY/EBlFBADS5P5/t+wn63wUOzcdqJ1cKL7SYuqCeYgM+
   bp5N9NminsOCH8BoloahAX4UUXTMLIkBfwON1r/tyu8NwFneno2CMkxbv
   ZJGQf1n1DAlPChZubjSRW3LivudqtA8B7Wb5776iSk6Gh7IL2kU6p+7yO
   oFqGzlAsaxvQe7dZ0TuiQqDQPEefmpokfn2FAkninFKLB0WszjMqy7MD9
   GuJsf5v2ixswM9pe2uFC1uj/csg2SoZ1kUbja+jpqRznJlmm9f7yEHJIJ
   JgGqK4P8lFt6qKZZx31wY0Ntwupq1E/kCZ+FoFyk0g8ksTQC27myU5opP
   Q==;
X-CSE-ConnectionGUID: EUiA3dslSqGbTZQ8iwYIng==
X-CSE-MsgGUID: S0dnY32ZRk2DXqE8/hEUqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85042188"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="85042188"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 21:03:28 -0800
X-CSE-ConnectionGUID: qSuyr08WSuChzjmuiL97Hw==
X-CSE-MsgGUID: uzEWBQWrTjKyBVrGVYSa4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="220821611"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 21:03:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUeGT-000000008az-0eOs;
	Sun, 14 Dec 2025 05:03:25 +0000
Date: Sun, 14 Dec 2025 13:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pgtable14 1/2] mm/migrate_device.c:886:48: error:
 controlling expression type 'pgtable_t' (aka 'pte_t *') not compatible with
 any generic association type
Message-ID: <202512141546.ruFBzpaA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git pgtable14
head:   d9bb8deea009b236ba354e09f922bfa97741bced
commit: 75736837bf306bf5c2a2d52cc5ac9e74f187a116 [1/2] mm/pgtable: use ptdesc for pgtable pointer-6.19
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512141546.ruFBzpaA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141546.ruFBzpaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141546.ruFBzpaA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/migrate_device.c:886:48: error: controlling expression type 'pgtable_t' (aka 'pte_t *') not compatible with any generic association type
     886 |                 pgtable_trans_huge_deposit(vma->vm_mm, pmdp, page_ptdesc(pgtable));
         |                                                              ^~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:633:36: note: expanded from macro 'page_ptdesc'
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^~~
   1 error generated.


vim +886 mm/migrate_device.c

   776	
   777	#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
   778	/**
   779	 * migrate_vma_insert_huge_pmd_page: Insert a huge folio into @migrate->vma->vm_mm
   780	 * at @addr. folio is already allocated as a part of the migration process with
   781	 * large page.
   782	 *
   783	 * @page needs to be initialized and setup after it's allocated. The code bits
   784	 * here follow closely the code in __do_huge_pmd_anonymous_page(). This API does
   785	 * not support THP zero pages.
   786	 *
   787	 * @migrate: migrate_vma arguments
   788	 * @addr: address where the folio will be inserted
   789	 * @page: page to be inserted at @addr
   790	 * @src: src pfn which is being migrated
   791	 * @pmdp: pointer to the pmd
   792	 */
   793	static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
   794						 unsigned long addr,
   795						 struct page *page,
   796						 unsigned long *src,
   797						 pmd_t *pmdp)
   798	{
   799		struct vm_area_struct *vma = migrate->vma;
   800		gfp_t gfp = vma_thp_gfp_mask(vma);
   801		struct folio *folio = page_folio(page);
   802		int ret;
   803		vm_fault_t csa_ret;
   804		spinlock_t *ptl;
   805		pgtable_t pgtable;
   806		pmd_t entry;
   807		bool flush = false;
   808		unsigned long i;
   809	
   810		VM_WARN_ON_FOLIO(!folio, folio);
   811		VM_WARN_ON_ONCE(!pmd_none(*pmdp) && !is_huge_zero_pmd(*pmdp));
   812	
   813		if (!thp_vma_suitable_order(vma, addr, HPAGE_PMD_ORDER))
   814			return -EINVAL;
   815	
   816		ret = anon_vma_prepare(vma);
   817		if (ret)
   818			return ret;
   819	
   820		folio_set_order(folio, HPAGE_PMD_ORDER);
   821		folio_set_large_rmappable(folio);
   822	
   823		if (mem_cgroup_charge(folio, migrate->vma->vm_mm, gfp)) {
   824			count_vm_event(THP_FAULT_FALLBACK);
   825			count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_FALLBACK_CHARGE);
   826			ret = -ENOMEM;
   827			goto abort;
   828		}
   829	
   830		__folio_mark_uptodate(folio);
   831	
   832		pgtable = pte_alloc_one(vma->vm_mm);
   833		if (unlikely(!pgtable))
   834			goto abort;
   835	
   836		if (folio_is_device_private(folio)) {
   837			swp_entry_t swp_entry;
   838	
   839			if (vma->vm_flags & VM_WRITE)
   840				swp_entry = make_writable_device_private_entry(
   841							page_to_pfn(page));
   842			else
   843				swp_entry = make_readable_device_private_entry(
   844							page_to_pfn(page));
   845			entry = swp_entry_to_pmd(swp_entry);
   846		} else {
   847			if (folio_is_zone_device(folio) &&
   848			    !folio_is_device_coherent(folio)) {
   849				goto abort;
   850			}
   851			entry = folio_mk_pmd(folio, vma->vm_page_prot);
   852			if (vma->vm_flags & VM_WRITE)
   853				entry = pmd_mkwrite(pmd_mkdirty(entry), vma);
   854		}
   855	
   856		ptl = pmd_lock(vma->vm_mm, pmdp);
   857		csa_ret = check_stable_address_space(vma->vm_mm);
   858		if (csa_ret)
   859			goto abort;
   860	
   861		/*
   862		 * Check for userfaultfd but do not deliver the fault. Instead,
   863		 * just back off.
   864		 */
   865		if (userfaultfd_missing(vma))
   866			goto unlock_abort;
   867	
   868		if (!pmd_none(*pmdp)) {
   869			if (!is_huge_zero_pmd(*pmdp))
   870				goto unlock_abort;
   871			flush = true;
   872		} else if (!pmd_none(*pmdp))
   873			goto unlock_abort;
   874	
   875		add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
   876		folio_add_new_anon_rmap(folio, vma, addr, RMAP_EXCLUSIVE);
   877		if (!folio_is_zone_device(folio))
   878			folio_add_lru_vma(folio, vma);
   879		folio_get(folio);
   880	
   881		if (flush) {
   882			pte_free(vma->vm_mm, pgtable);
   883			flush_cache_page(vma, addr, addr + HPAGE_PMD_SIZE);
   884			pmdp_invalidate(vma, addr, pmdp);
   885		} else {
 > 886			pgtable_trans_huge_deposit(vma->vm_mm, pmdp, page_ptdesc(pgtable));
   887			mm_inc_nr_ptes(vma->vm_mm);
   888		}
   889		set_pmd_at(vma->vm_mm, addr, pmdp, entry);
   890		update_mmu_cache_pmd(vma, addr, pmdp);
   891	
   892		spin_unlock(ptl);
   893	
   894		count_vm_event(THP_FAULT_ALLOC);
   895		count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_ALLOC);
   896		count_memcg_event_mm(vma->vm_mm, THP_FAULT_ALLOC);
   897	
   898		return 0;
   899	
   900	unlock_abort:
   901		spin_unlock(ptl);
   902	abort:
   903		for (i = 0; i < HPAGE_PMD_NR; i++)
   904			src[i] &= ~MIGRATE_PFN_MIGRATE;
   905		return 0;
   906	}
   907	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
