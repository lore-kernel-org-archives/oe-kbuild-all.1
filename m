Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0638BE8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721548455; cv=none; b=HHFGJeqO2SjtaQZujsqPPkePDuTWrYtfNvqyEyp0/LdRLheiZjL15RbwgTAlgP///fpzI1qXLQStd3ZvnIFZEsHFi5+5elYvo66Szgpo7v1i7UQGYcKgtf+RUoMBQPfpN0IBNcdWMIz07Tu5qg1ChFDIavGJRf6VbRsbqI6k8r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721548455; c=relaxed/simple;
	bh=W1caPSRyp7+qupoNVqty4HgTsHRI0+ed8y/1mwKcfdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pnorqvqd7iWLEJmgMUp+wq3IzQI5BU0pPcMqSJYjQ3QCctR4wUZ8D89ZY+0hcCb0/GUu3fPzTJLR+1Te8ESApbYVasZwJNKu4z6JGZH+OnSraUQlAiu/2ZqGGyYO7cb5aWR9gfHoVVf4GrHlAPCsEMgHL3XqB8OzgjyPtls4Iy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5nwIMRo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5nwIMRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721548454; x=1753084454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W1caPSRyp7+qupoNVqty4HgTsHRI0+ed8y/1mwKcfdY=;
  b=W5nwIMRoJkDmN1Fs47/mDKlHVBM+RPv6d9LFq6okLJjnn1tdzeeqpEoE
   Sriu531vT6BoMTSJRRnvrUKIewHl7vzbFYVKnv4K2gP5Zy+dNC1LOtTfM
   6noK0YIo+Rx8t3/n4yUCOwKuASHry9MD7w3pPmRIo62MuKtm+h8ZxaKyY
   9wfB+uhbJpaV1cZ25pZpjKJvw0HTlCyKA0VX58OdUkyLX4I5qAtOKp+uv
   3xUCqkQxSzZLWCKUrgyOKwQxTo7Pxodvswd6lACa+nYn5PnkycxL18MLM
   52U3WO2bp1MIBnx7JZ0/bnshTNY3NUh1KCSQMIfqrzJqA/5Di/venJAQ/
   w==;
X-CSE-ConnectionGUID: R4lTOrmSTw2D2A9xr+ozDw==
X-CSE-MsgGUID: qx4Z+XO4TlGfuf0V/BH2QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="29713457"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="29713457"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 00:54:11 -0700
X-CSE-ConnectionGUID: nsNoVaUxTfmSXsDa8RlhyQ==
X-CSE-MsgGUID: ZFAZUD1ETXydzJigDVFQrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="74763391"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jul 2024 00:54:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVROR-000k48-28;
	Sun, 21 Jul 2024 07:54:07 +0000
Date: Sun, 21 Jul 2024 15:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 42/42] mm/khugepaged.c:1226:16: error:
 assignment to 'struct ptdesc *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202407211545.FNM1uzKC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable2
head:   17ce8ec8001d3efaa81c659d6ec565025c3f42b0
commit: 17ce8ec8001d3efaa81c659d6ec565025c3f42b0 [42/42] mm/pgtable: use ptdesc in collapse_huge_page
config: loongarch-randconfig-001-20240721 (https://download.01.org/0day-ci/archive/20240721/202407211545.FNM1uzKC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211545.FNM1uzKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211545.FNM1uzKC-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/khugepaged.c: In function '__collapse_huge_page_copy_failed':
   mm/khugepaged.c:772:39: error: implicit declaration of function 'pmd_ptdesc'; did you mean 'pfn_ptdesc'? [-Wimplicit-function-declaration]
     772 |         pmd_populate(vma->vm_mm, pmd, pmd_ptdesc(&orig_pmd));
         |                                       ^~~~~~~~~~
         |                                       pfn_ptdesc
   mm/khugepaged.c:772:39: error: passing argument 3 of 'pmd_populate' makes pointer from integer without a cast [-Wint-conversion]
     772 |         pmd_populate(vma->vm_mm, pmd, pmd_ptdesc(&orig_pmd));
         |                                       ^~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
   In file included from mm/khugepaged.c:26:
   arch/loongarch/include/asm/pgalloc.h:21:82: note: expected 'struct ptdesc *' but argument is of type 'int'
      21 | static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd, struct ptdesc *pte)
         |                                                                   ~~~~~~~~~~~~~~~^~~
   mm/khugepaged.c: In function 'collapse_huge_page':
>> mm/khugepaged.c:1226:16: error: assignment to 'struct ptdesc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1226 |         ptdesc = pmd_ptdesc(&_pmd);
         |                ^
   mm/khugepaged.c: In function 'collapse_pte_mapped_thp':
   mm/khugepaged.c:1667:28: error: passing argument 2 of 'pte_free_defer' makes pointer from integer without a cast [-Wint-conversion]
    1667 |         pte_free_defer(mm, pmd_ptdesc(&pgt_pmd));
         |                            ^~~~~~~~~~~~~~~~~~~~
         |                            |
         |                            int
   In file included from include/linux/mm.h:30,
                    from mm/khugepaged.c:4:
   include/linux/pgtable.h:119:58: note: expected 'struct ptdesc *' but argument is of type 'int'
     119 | void pte_free_defer(struct mm_struct *mm, struct ptdesc *ptdesc);
         |                                           ~~~~~~~~~~~~~~~^~~~~~
   mm/khugepaged.c: In function 'retract_page_tables':
   mm/khugepaged.c:1771:44: error: passing argument 2 of 'pte_free_defer' makes pointer from integer without a cast [-Wint-conversion]
    1771 |                         pte_free_defer(mm, pmd_ptdesc(&pgt_pmd));
         |                                            ^~~~~~~~~~~~~~~~~~~~
         |                                            |
         |                                            int
   include/linux/pgtable.h:119:58: note: expected 'struct ptdesc *' but argument is of type 'int'
     119 | void pte_free_defer(struct mm_struct *mm, struct ptdesc *ptdesc);
         |                                           ~~~~~~~~~~~~~~~^~~~~~


vim +1226 mm/khugepaged.c

  1089	
  1090	static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
  1091				      int referenced, int unmapped,
  1092				      struct collapse_control *cc)
  1093	{
  1094		LIST_HEAD(compound_pagelist);
  1095		pmd_t *pmd, _pmd;
  1096		pte_t *pte;
  1097		struct ptdesc *ptdesc;
  1098		struct folio *folio;
  1099		spinlock_t *pmd_ptl, *pte_ptl;
  1100		int result = SCAN_FAIL;
  1101		struct vm_area_struct *vma;
  1102		struct mmu_notifier_range range;
  1103	
  1104		VM_BUG_ON(address & ~HPAGE_PMD_MASK);
  1105	
  1106		/*
  1107		 * Before allocating the hugepage, release the mmap_lock read lock.
  1108		 * The allocation can take potentially a long time if it involves
  1109		 * sync compaction, and we do not need to hold the mmap_lock during
  1110		 * that. We will recheck the vma after taking it again in write mode.
  1111		 */
  1112		mmap_read_unlock(mm);
  1113	
  1114		result = alloc_charge_folio(&folio, mm, cc);
  1115		if (result != SCAN_SUCCEED)
  1116			goto out_nolock;
  1117	
  1118		mmap_read_lock(mm);
  1119		result = hugepage_vma_revalidate(mm, address, true, &vma, cc);
  1120		if (result != SCAN_SUCCEED) {
  1121			mmap_read_unlock(mm);
  1122			goto out_nolock;
  1123		}
  1124	
  1125		result = find_pmd_or_thp_or_none(mm, address, &pmd);
  1126		if (result != SCAN_SUCCEED) {
  1127			mmap_read_unlock(mm);
  1128			goto out_nolock;
  1129		}
  1130	
  1131		if (unmapped) {
  1132			/*
  1133			 * __collapse_huge_page_swapin will return with mmap_lock
  1134			 * released when it fails. So we jump out_nolock directly in
  1135			 * that case.  Continuing to collapse causes inconsistency.
  1136			 */
  1137			result = __collapse_huge_page_swapin(mm, vma, address, pmd,
  1138							     referenced);
  1139			if (result != SCAN_SUCCEED)
  1140				goto out_nolock;
  1141		}
  1142	
  1143		mmap_read_unlock(mm);
  1144		/*
  1145		 * Prevent all access to pagetables with the exception of
  1146		 * gup_fast later handled by the ptep_clear_flush and the VM
  1147		 * handled by the anon_vma lock + PG_lock.
  1148		 *
  1149		 * UFFDIO_MOVE is prevented to race as well thanks to the
  1150		 * mmap_lock.
  1151		 */
  1152		mmap_write_lock(mm);
  1153		result = hugepage_vma_revalidate(mm, address, true, &vma, cc);
  1154		if (result != SCAN_SUCCEED)
  1155			goto out_up_write;
  1156		/* check if the pmd is still valid */
  1157		result = check_pmd_still_valid(mm, address, pmd);
  1158		if (result != SCAN_SUCCEED)
  1159			goto out_up_write;
  1160	
  1161		vma_start_write(vma);
  1162		anon_vma_lock_write(vma->anon_vma);
  1163	
  1164		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, address,
  1165					address + HPAGE_PMD_SIZE);
  1166		mmu_notifier_invalidate_range_start(&range);
  1167	
  1168		pmd_ptl = pmd_lock(mm, pmd); /* probably unnecessary */
  1169		/*
  1170		 * This removes any huge TLB entry from the CPU so we won't allow
  1171		 * huge and small TLB entries for the same virtual address to
  1172		 * avoid the risk of CPU bugs in that area.
  1173		 *
  1174		 * Parallel GUP-fast is fine since GUP-fast will back off when
  1175		 * it detects PMD is changed.
  1176		 */
  1177		_pmd = pmdp_collapse_flush(vma, address, pmd);
  1178		spin_unlock(pmd_ptl);
  1179		mmu_notifier_invalidate_range_end(&range);
  1180		tlb_remove_table_sync_one();
  1181	
  1182		pte = pte_offset_map_lock(mm, &_pmd, address, &pte_ptl);
  1183		if (pte) {
  1184			result = __collapse_huge_page_isolate(vma, address, pte, cc,
  1185							      &compound_pagelist);
  1186			spin_unlock(pte_ptl);
  1187		} else {
  1188			result = SCAN_PMD_NULL;
  1189		}
  1190	
  1191		if (unlikely(result != SCAN_SUCCEED)) {
  1192			if (pte)
  1193				pte_unmap(pte);
  1194			spin_lock(pmd_ptl);
  1195			BUG_ON(!pmd_none(*pmd));
  1196			/*
  1197			 * We can only use set_pmd_at when establishing
  1198			 * hugepmds and never for establishing regular pmds that
  1199			 * points to regular pagetables. Use pmd_populate for that
  1200			 */
  1201			pmd_populate(mm, pmd, page_ptdesc(pmd_pgtable(_pmd)));
  1202			spin_unlock(pmd_ptl);
  1203			anon_vma_unlock_write(vma->anon_vma);
  1204			goto out_up_write;
  1205		}
  1206	
  1207		/*
  1208		 * All pages are isolated and locked so anon_vma rmap
  1209		 * can't run anymore.
  1210		 */
  1211		anon_vma_unlock_write(vma->anon_vma);
  1212	
  1213		result = __collapse_huge_page_copy(pte, folio, pmd, _pmd,
  1214						   vma, address, pte_ptl,
  1215						   &compound_pagelist);
  1216		pte_unmap(pte);
  1217		if (unlikely(result != SCAN_SUCCEED))
  1218			goto out_up_write;
  1219	
  1220		/*
  1221		 * The smp_wmb() inside __folio_mark_uptodate() ensures the
  1222		 * copy_huge_page writes become visible before the set_pmd_at()
  1223		 * write.
  1224		 */
  1225		__folio_mark_uptodate(folio);
> 1226		ptdesc = pmd_ptdesc(&_pmd);
  1227	
  1228		_pmd = mk_huge_pmd(&folio->page, vma->vm_page_prot);
  1229		_pmd = maybe_pmd_mkwrite(pmd_mkdirty(_pmd), vma);
  1230	
  1231		spin_lock(pmd_ptl);
  1232		BUG_ON(!pmd_none(*pmd));
  1233		folio_add_new_anon_rmap(folio, vma, address, RMAP_EXCLUSIVE);
  1234		folio_add_lru_vma(folio, vma);
  1235		pgtable_trans_huge_deposit(mm, pmd, ptdesc);
  1236		set_pmd_at(mm, address, pmd, _pmd);
  1237		update_mmu_cache_pmd(vma, address, pmd);
  1238		spin_unlock(pmd_ptl);
  1239	
  1240		folio = NULL;
  1241	
  1242		result = SCAN_SUCCEED;
  1243	out_up_write:
  1244		mmap_write_unlock(mm);
  1245	out_nolock:
  1246		if (folio)
  1247			folio_put(folio);
  1248		trace_mm_collapse_huge_page(mm, result == SCAN_SUCCEED, result);
  1249		return result;
  1250	}
  1251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
