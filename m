Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDDC192B71
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 09:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741512204; cv=none; b=ur3LqOlHuuLisMsqJGdbabhVw5ddXxfXWhLPvSKZgfkAKR0OsAZPwJSOdqXV9uPVLn5Yk4frHAsgG4Fy0wSv9wkR6pQqJsxu9gdAYpY/P3pe0mSmp+3hrsJjkp+ePG8eR/R4c43raVgKA9sFas5vXWNHHhgNaUBBpj2vtsTIPfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741512204; c=relaxed/simple;
	bh=xUNl/zL0mRGPVFYaiJnWKZK8tVHtvOuDq/rI8weecYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ElWRG4nIqFLmZ5S3GshXpnFCffqpD8rx3i6IhhRHTkuOLaNPj9wHoJD9MNL71Obm7g1w/sdabiRH11HNSAtDcmsW2h2q8RuhaA/bZ4nkvz4RXv2iioVgyoU7hTCx6ksiFG6abIq6qwn/KAWgUKqOAsShcP7iH5IEm6fIViL9/jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdCX9NZx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdCX9NZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741512201; x=1773048201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xUNl/zL0mRGPVFYaiJnWKZK8tVHtvOuDq/rI8weecYs=;
  b=mdCX9NZxF2oORvjTfE1GOKtW7+kdA/23S6NcllAUAkQWv5QLW40dOaI6
   vyjTylgzvGyGMh74kTzwiYsjr7XS+Nkcu5Ym8Sh8dJ/wj7V3eSW0n+z0P
   tDowEyZStOSXAAwHg3Xe131OcvRIbADQmAO8KfzdxXbHDMJhbPeEg09yx
   IYBR4oBV2NgJaN9dXfzskiGZeKkVGtVE1vLuH7z+f74tr41GlqxoXn25S
   ziOl065hR9AcFmhCcii0VB2m4LnjuyDdlg1zjTFewYTbLKXo5vJV5qoxi
   lBHI+xVOJJEYWI5NrhvX0XfhDG0CHn5Ndok1/FBbCccTvZmNBnJpIT84A
   w==;
X-CSE-ConnectionGUID: yfOtRz46RGKGPczCx4XZwA==
X-CSE-MsgGUID: imkh9dX0QmOxD8kvKqkOww==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46171128"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="46171128"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 01:23:20 -0800
X-CSE-ConnectionGUID: lOqGlhaFQNuZxiltlsfRyw==
X-CSE-MsgGUID: Zi+lhBhQRUaK3R4/xKL7vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="124798964"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 09 Mar 2025 01:23:19 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trCsP-0002sm-0J;
	Sun, 09 Mar 2025 09:23:17 +0000
Date: Sun, 9 Mar 2025 17:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1473/1473] mm/khugepaged.c:974:21:
 sparse: sparse: invalid assignment: |=
Message-ID: <202503091715.gswAJqxr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1584a68cf2ef23ac87ba506e8ab8ca7e261813c1
commit: ff0fb9e816fac221fa24a1810dd895745406070b [1473/1473] mm: thp: Add memory reliable support for hugepaged collapse
config: arm64-randconfig-r113-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091715.gswAJqxr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250309/202503091715.gswAJqxr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091715.gswAJqxr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/khugepaged.c:974:21: sparse: sparse: invalid assignment: |=
   mm/khugepaged.c:974:21: sparse:    left side has type restricted gfp_t
   mm/khugepaged.c:974:21: sparse:    right side has type unsigned int
   mm/khugepaged.c:1352:21: sparse: sparse: invalid assignment: |=
   mm/khugepaged.c:1352:21: sparse:    left side has type restricted gfp_t
   mm/khugepaged.c:1352:21: sparse:    right side has type unsigned int
   mm/khugepaged.c:1378:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1378:9: sparse:     expected void **slot
   mm/khugepaged.c:1378:9: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c:1378:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1378:9: sparse:     expected void **slot
   mm/khugepaged.c:1378:9: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c:1409:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   mm/khugepaged.c:1409:56: sparse:     expected void [noderef] __rcu **slot
   mm/khugepaged.c:1409:56: sparse:     got void **slot
   mm/khugepaged.c:1458:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1458:22: sparse:     expected void **slot
   mm/khugepaged.c:1458:22: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c:1459:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   mm/khugepaged.c:1459:17: sparse:     expected void [noderef] __rcu **slot
   mm/khugepaged.c:1459:17: sparse:     got void **slot
   mm/khugepaged.c:1483:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   mm/khugepaged.c:1483:60: sparse:     expected void [noderef] __rcu **slot
   mm/khugepaged.c:1483:60: sparse:     got void **slot
   mm/khugepaged.c:1486:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   mm/khugepaged.c:1486:47: sparse:     expected void [noderef] __rcu **slot
   mm/khugepaged.c:1486:47: sparse:     got void **slot
   mm/khugepaged.c:1486:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1486:22: sparse:     expected void **slot
   mm/khugepaged.c:1486:22: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c:1378:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   mm/khugepaged.c:1378:9: sparse:     expected void [noderef] __rcu **slot
   mm/khugepaged.c:1378:9: sparse:     got void **slot
   mm/khugepaged.c:1378:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1378:9: sparse:     expected void **slot
   mm/khugepaged.c:1378:9: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c:1578:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1578:17: sparse:     expected void **slot
   mm/khugepaged.c:1578:17: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c:1578:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1578:17: sparse:     expected void **slot
   mm/khugepaged.c:1578:17: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c:1597:68: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   mm/khugepaged.c:1597:68: sparse:     expected void [noderef] __rcu **slot
   mm/khugepaged.c:1597:68: sparse:     got void **slot
   mm/khugepaged.c:1598:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   mm/khugepaged.c:1598:55: sparse:     expected void [noderef] __rcu **slot
   mm/khugepaged.c:1598:55: sparse:     got void **slot
   mm/khugepaged.c:1598:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1598:30: sparse:     expected void **slot
   mm/khugepaged.c:1598:30: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c:1578:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   mm/khugepaged.c:1578:17: sparse:     expected void [noderef] __rcu **slot
   mm/khugepaged.c:1578:17: sparse:     got void **slot
   mm/khugepaged.c:1578:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1578:17: sparse:     expected void **slot
   mm/khugepaged.c:1578:17: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c:1633:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1633:9: sparse:     expected void **slot
   mm/khugepaged.c:1633:9: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c:1633:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1633:9: sparse:     expected void **slot
   mm/khugepaged.c:1633:9: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c:1637:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   mm/khugepaged.c:1637:46: sparse:     expected void [noderef] __rcu **slot
   mm/khugepaged.c:1637:46: sparse:     got void **slot
   mm/khugepaged.c:1639:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1639:30: sparse:     expected void **slot
   mm/khugepaged.c:1639:30: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c:1682:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   mm/khugepaged.c:1682:55: sparse:     expected void [noderef] __rcu **slot
   mm/khugepaged.c:1682:55: sparse:     got void **slot
   mm/khugepaged.c:1682:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1682:30: sparse:     expected void **slot
   mm/khugepaged.c:1682:30: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c:1633:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   mm/khugepaged.c:1633:9: sparse:     expected void [noderef] __rcu **slot
   mm/khugepaged.c:1633:9: sparse:     got void **slot
   mm/khugepaged.c:1633:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   mm/khugepaged.c:1633:9: sparse:     expected void **slot
   mm/khugepaged.c:1633:9: sparse:     got void [noderef] __rcu **
   mm/khugepaged.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   In file included from arch/arm64/include/asm/atomic.h:36,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:18,
                    from arch/arm64/include/asm/bug.h:37,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:10,
                    from mm/khugepaged.c:4:
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,

vim +974 mm/khugepaged.c

   949	
   950	static void collapse_huge_page(struct mm_struct *mm,
   951					   unsigned long address,
   952					   struct page **hpage,
   953					   int node, int referenced, int unmapped,
   954					   bool reliable)
   955	{
   956		pmd_t *pmd, _pmd;
   957		pte_t *pte;
   958		pgtable_t pgtable;
   959		struct page *new_page;
   960		spinlock_t *pmd_ptl, *pte_ptl;
   961		int isolated = 0, result = 0;
   962		struct mem_cgroup *memcg;
   963		struct vm_area_struct *vma;
   964		unsigned long mmun_start;	/* For mmu_notifiers */
   965		unsigned long mmun_end;		/* For mmu_notifiers */
   966		gfp_t gfp;
   967	
   968		VM_BUG_ON(address & ~HPAGE_PMD_MASK);
   969	
   970		/* Only allocate from the target node */
   971		gfp = alloc_hugepage_khugepaged_gfpmask() | __GFP_THISNODE;
   972	
   973		if (reliable)
 > 974			gfp |= ___GFP_RELIABILITY;
   975	
   976		/*
   977		 * Before allocating the hugepage, release the mmap_sem read lock.
   978		 * The allocation can take potentially a long time if it involves
   979		 * sync compaction, and we do not need to hold the mmap_sem during
   980		 * that. We will recheck the vma after taking it again in write mode.
   981		 */
   982		up_read(&mm->mmap_sem);
   983		new_page = khugepaged_alloc_page(hpage, gfp, node);
   984		if (!new_page) {
   985			result = SCAN_ALLOC_HUGE_PAGE_FAIL;
   986			goto out_nolock;
   987		}
   988	
   989		if (unlikely(mem_cgroup_try_charge(new_page, mm, gfp, &memcg, true))) {
   990			result = SCAN_CGROUP_CHARGE_FAIL;
   991			goto out_nolock;
   992		}
   993	
   994		down_read(&mm->mmap_sem);
   995		result = hugepage_vma_revalidate(mm, address, &vma);
   996		if (result) {
   997			mem_cgroup_cancel_charge(new_page, memcg, true);
   998			up_read(&mm->mmap_sem);
   999			goto out_nolock;
  1000		}
  1001	
  1002		pmd = mm_find_pmd(mm, address);
  1003		if (!pmd) {
  1004			result = SCAN_PMD_NULL;
  1005			mem_cgroup_cancel_charge(new_page, memcg, true);
  1006			up_read(&mm->mmap_sem);
  1007			goto out_nolock;
  1008		}
  1009	
  1010		/*
  1011		 * __collapse_huge_page_swapin always returns with mmap_sem locked.
  1012		 * If it fails, we release mmap_sem and jump out_nolock.
  1013		 * Continuing to collapse causes inconsistency.
  1014		 */
  1015		if (unmapped && !__collapse_huge_page_swapin(mm, vma, address,
  1016							     pmd, referenced)) {
  1017			mem_cgroup_cancel_charge(new_page, memcg, true);
  1018			up_read(&mm->mmap_sem);
  1019			goto out_nolock;
  1020		}
  1021	
  1022		up_read(&mm->mmap_sem);
  1023		/*
  1024		 * Prevent all access to pagetables with the exception of
  1025		 * gup_fast later handled by the ptep_clear_flush and the VM
  1026		 * handled by the anon_vma lock + PG_lock.
  1027		 */
  1028		down_write(&mm->mmap_sem);
  1029		result = hugepage_vma_revalidate(mm, address, &vma);
  1030		if (result)
  1031			goto out;
  1032		/* check if the pmd is still valid */
  1033		if (mm_find_pmd(mm, address) != pmd)
  1034			goto out;
  1035	
  1036		anon_vma_lock_write(vma->anon_vma);
  1037	
  1038		pte = pte_offset_map(pmd, address);
  1039		pte_ptl = pte_lockptr(mm, pmd);
  1040	
  1041		mmun_start = address;
  1042		mmun_end   = address + HPAGE_PMD_SIZE;
  1043		mmu_notifier_invalidate_range_start(mm, mmun_start, mmun_end);
  1044		pmd_ptl = pmd_lock(mm, pmd); /* probably unnecessary */
  1045		/*
  1046		 * After this gup_fast can't run anymore. This also removes
  1047		 * any huge TLB entry from the CPU so we won't allow
  1048		 * huge and small TLB entries for the same virtual address
  1049		 * to avoid the risk of CPU bugs in that area.
  1050		 */
  1051		_pmd = pmdp_collapse_flush(vma, address, pmd);
  1052		spin_unlock(pmd_ptl);
  1053		mmu_notifier_invalidate_range_end(mm, mmun_start, mmun_end);
  1054	
  1055		spin_lock(pte_ptl);
  1056		isolated = __collapse_huge_page_isolate(vma, address, pte);
  1057		spin_unlock(pte_ptl);
  1058	
  1059		if (unlikely(!isolated)) {
  1060			pte_unmap(pte);
  1061			spin_lock(pmd_ptl);
  1062			BUG_ON(!pmd_none(*pmd));
  1063			/*
  1064			 * We can only use set_pmd_at when establishing
  1065			 * hugepmds and never for establishing regular pmds that
  1066			 * points to regular pagetables. Use pmd_populate for that
  1067			 */
  1068			pmd_populate(mm, pmd, pmd_pgtable(_pmd));
  1069			spin_unlock(pmd_ptl);
  1070			anon_vma_unlock_write(vma->anon_vma);
  1071			result = SCAN_FAIL;
  1072			goto out;
  1073		}
  1074	
  1075		/*
  1076		 * All pages are isolated and locked so anon_vma rmap
  1077		 * can't run anymore.
  1078		 */
  1079		anon_vma_unlock_write(vma->anon_vma);
  1080	
  1081		__collapse_huge_page_copy(pte, new_page, vma, address, pte_ptl);
  1082		pte_unmap(pte);
  1083		__SetPageUptodate(new_page);
  1084		pgtable = pmd_pgtable(_pmd);
  1085	
  1086		_pmd = mk_huge_pmd(new_page, vma->vm_page_prot);
  1087		_pmd = maybe_pmd_mkwrite(pmd_mkdirty(_pmd), vma);
  1088	
  1089		/*
  1090		 * spin_lock() below is not the equivalent of smp_wmb(), so
  1091		 * this is needed to avoid the copy_huge_page writes to become
  1092		 * visible after the set_pmd_at() write.
  1093		 */
  1094		smp_wmb();
  1095	
  1096		spin_lock(pmd_ptl);
  1097		BUG_ON(!pmd_none(*pmd));
  1098		page_add_new_anon_rmap(new_page, vma, address, true);
  1099		mem_cgroup_commit_charge(new_page, memcg, false, true);
  1100		count_memcg_events(memcg, THP_COLLAPSE_ALLOC, 1);
  1101		lru_cache_add_active_or_unevictable(new_page, vma);
  1102		pgtable_trans_huge_deposit(mm, pmd, pgtable);
  1103		set_pmd_at(mm, address, pmd, _pmd);
  1104		update_mmu_cache_pmd(vma, address, pmd);
  1105		spin_unlock(pmd_ptl);
  1106	
  1107		*hpage = NULL;
  1108	
  1109		khugepaged_pages_collapsed++;
  1110		result = SCAN_SUCCEED;
  1111	out_up_write:
  1112		up_write(&mm->mmap_sem);
  1113	out_nolock:
  1114		trace_mm_collapse_huge_page(mm, isolated, result);
  1115		return;
  1116	out:
  1117		mem_cgroup_cancel_charge(new_page, memcg, true);
  1118		goto out_up_write;
  1119	}
  1120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
