Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB77227EA7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765718715; cv=none; b=Hpe/xXv+vWPYbWAFfmj9bVbICJiEofb9yfLn8iPVderitaVOKLi8j6XlN28Te6CGXxCPtT7gd43iW8m6oFEtcctLy/L56C+RwjhMZl6yodPBHSH31iTh39aohT0VZ8UwYy+WDf0g2B25rd3LzBtfNf6cDsKf3qI+updtAhSi2hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765718715; c=relaxed/simple;
	bh=DlQMg90kaTwo2XTBw+DLYpejR3nlHjyeiP+Gp6qtD8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnRlI49fusO3LgyWB6hR+h37r6XNdbAoIGOwi7e5p3tt6NkI5MAeygpAKO1cqcn4hA+mijOV3B/28Gn5TvcKi2TeMock3jvDIS8jq+xvZ87Y/7gYUF/JN4G5pCFYJqltF3aDWakRkiR1xPpVoYjKL+Rde+T9J4Q31SAdV7Z2p5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4e69IWY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4e69IWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765718714; x=1797254714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DlQMg90kaTwo2XTBw+DLYpejR3nlHjyeiP+Gp6qtD8Y=;
  b=a4e69IWYWjDquqjJWtr+Oev5m+hnJfS5GIXChti1rCSxV8bSQorKukQ1
   cfQFJEQ05O2YUmf3QWm3son/kla4SYxAHCBaQwrWWdWVsKfyIfVqAkgMz
   8OxcVGTgr3IbIuY+4gK/RVKQ6MTZ+PZhhdzA6LMRJWRlRoboxaz1/FFHb
   ZxaqTYu9YhxfjsPfUNVnXBGglyKuoBDwY3M7SuY8k56bUqFjdJUQMrzDT
   2hxLRi4mSgJAHqT2Eq2dmLeC3cKUZgABW2ISpxLGQVCkdRrB27S7ZYwv+
   D2NaI0+MGEZ8VcVc14elDJkLDe3gmT/LrAfibMt+dZ4KnRcnNBzcndh9q
   w==;
X-CSE-ConnectionGUID: kWwdYmSsQQia5GyULDMYEg==
X-CSE-MsgGUID: HFv/whSVTueELdW5yI8SAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85236742"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="85236742"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 05:25:11 -0800
X-CSE-ConnectionGUID: /AkxIfneRTya1MjrhDMJcQ==
X-CSE-MsgGUID: 1REdOB1bSQaTrVzXuTLvmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="198008566"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Dec 2025 05:25:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUm60-0000000092f-1uG6;
	Sun, 14 Dec 2025 13:25:08 +0000
Date: Sun, 14 Dec 2025 21:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/3] mm/khugepaged: skip redundant IPI in
 collapse_huge_page()
Message-ID: <202512142156.cShiu6PU-lkp@intel.com>
References: <20251213080038.10917-4-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213080038.10917-4-lance.yang@linux.dev>

Hi Lance,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20251212]
[cannot apply to tip/x86/core arnd-asm-generic/master linus/master v6.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lance-Yang/mm-tlb-allow-architectures-to-skip-redundant-TLB-sync-IPIs/20251213-160431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251213080038.10917-4-lance.yang%40linux.dev
patch subject: [PATCH RFC 3/3] mm/khugepaged: skip redundant IPI in collapse_huge_page()
config: arc-randconfig-001-20251214 (https://download.01.org/0day-ci/archive/20251214/202512142156.cShiu6PU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512142156.cShiu6PU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512142156.cShiu6PU-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/khugepaged.c: In function 'collapse_huge_page':
>> mm/khugepaged.c:1185:14: error: implicit declaration of function 'tlb_table_flush_implies_ipi_broadcast' [-Werror=implicit-function-declaration]
    1185 |         if (!tlb_table_flush_implies_ipi_broadcast())
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/tlb_table_flush_implies_ipi_broadcast +1185 mm/khugepaged.c

  1090	
  1091	static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
  1092				      int referenced, int unmapped,
  1093				      struct collapse_control *cc)
  1094	{
  1095		LIST_HEAD(compound_pagelist);
  1096		pmd_t *pmd, _pmd;
  1097		pte_t *pte;
  1098		pgtable_t pgtable;
  1099		struct folio *folio;
  1100		spinlock_t *pmd_ptl, *pte_ptl;
  1101		int result = SCAN_FAIL;
  1102		struct vm_area_struct *vma;
  1103		struct mmu_notifier_range range;
  1104	
  1105		VM_BUG_ON(address & ~HPAGE_PMD_MASK);
  1106	
  1107		/*
  1108		 * Before allocating the hugepage, release the mmap_lock read lock.
  1109		 * The allocation can take potentially a long time if it involves
  1110		 * sync compaction, and we do not need to hold the mmap_lock during
  1111		 * that. We will recheck the vma after taking it again in write mode.
  1112		 */
  1113		mmap_read_unlock(mm);
  1114	
  1115		result = alloc_charge_folio(&folio, mm, cc);
  1116		if (result != SCAN_SUCCEED)
  1117			goto out_nolock;
  1118	
  1119		mmap_read_lock(mm);
  1120		result = hugepage_vma_revalidate(mm, address, true, &vma, cc);
  1121		if (result != SCAN_SUCCEED) {
  1122			mmap_read_unlock(mm);
  1123			goto out_nolock;
  1124		}
  1125	
  1126		result = find_pmd_or_thp_or_none(mm, address, &pmd);
  1127		if (result != SCAN_SUCCEED) {
  1128			mmap_read_unlock(mm);
  1129			goto out_nolock;
  1130		}
  1131	
  1132		if (unmapped) {
  1133			/*
  1134			 * __collapse_huge_page_swapin will return with mmap_lock
  1135			 * released when it fails. So we jump out_nolock directly in
  1136			 * that case.  Continuing to collapse causes inconsistency.
  1137			 */
  1138			result = __collapse_huge_page_swapin(mm, vma, address, pmd,
  1139							     referenced);
  1140			if (result != SCAN_SUCCEED)
  1141				goto out_nolock;
  1142		}
  1143	
  1144		mmap_read_unlock(mm);
  1145		/*
  1146		 * Prevent all access to pagetables with the exception of
  1147		 * gup_fast later handled by the ptep_clear_flush and the VM
  1148		 * handled by the anon_vma lock + PG_lock.
  1149		 *
  1150		 * UFFDIO_MOVE is prevented to race as well thanks to the
  1151		 * mmap_lock.
  1152		 */
  1153		mmap_write_lock(mm);
  1154		result = hugepage_vma_revalidate(mm, address, true, &vma, cc);
  1155		if (result != SCAN_SUCCEED)
  1156			goto out_up_write;
  1157		/* check if the pmd is still valid */
  1158		vma_start_write(vma);
  1159		result = check_pmd_still_valid(mm, address, pmd);
  1160		if (result != SCAN_SUCCEED)
  1161			goto out_up_write;
  1162	
  1163		anon_vma_lock_write(vma->anon_vma);
  1164	
  1165		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, address,
  1166					address + HPAGE_PMD_SIZE);
  1167		mmu_notifier_invalidate_range_start(&range);
  1168	
  1169		pmd_ptl = pmd_lock(mm, pmd); /* probably unnecessary */
  1170		/*
  1171		 * This removes any huge TLB entry from the CPU so we won't allow
  1172		 * huge and small TLB entries for the same virtual address to
  1173		 * avoid the risk of CPU bugs in that area.
  1174		 *
  1175		 * Parallel GUP-fast is fine since GUP-fast will back off when
  1176		 * it detects PMD is changed.
  1177		 */
  1178		_pmd = pmdp_collapse_flush(vma, address, pmd);
  1179		spin_unlock(pmd_ptl);
  1180		mmu_notifier_invalidate_range_end(&range);
  1181		/*
  1182		 * Skip the second IPI if the TLB flush above already synchronized
  1183		 * with concurrent GUP-fast via broadcast IPIs.
  1184		 */
> 1185		if (!tlb_table_flush_implies_ipi_broadcast())
  1186			tlb_remove_table_sync_one();
  1187	
  1188		pte = pte_offset_map_lock(mm, &_pmd, address, &pte_ptl);
  1189		if (pte) {
  1190			result = __collapse_huge_page_isolate(vma, address, pte, cc,
  1191							      &compound_pagelist);
  1192			spin_unlock(pte_ptl);
  1193		} else {
  1194			result = SCAN_NO_PTE_TABLE;
  1195		}
  1196	
  1197		if (unlikely(result != SCAN_SUCCEED)) {
  1198			if (pte)
  1199				pte_unmap(pte);
  1200			spin_lock(pmd_ptl);
  1201			BUG_ON(!pmd_none(*pmd));
  1202			/*
  1203			 * We can only use set_pmd_at when establishing
  1204			 * hugepmds and never for establishing regular pmds that
  1205			 * points to regular pagetables. Use pmd_populate for that
  1206			 */
  1207			pmd_populate(mm, pmd, pmd_pgtable(_pmd));
  1208			spin_unlock(pmd_ptl);
  1209			anon_vma_unlock_write(vma->anon_vma);
  1210			goto out_up_write;
  1211		}
  1212	
  1213		/*
  1214		 * All pages are isolated and locked so anon_vma rmap
  1215		 * can't run anymore.
  1216		 */
  1217		anon_vma_unlock_write(vma->anon_vma);
  1218	
  1219		result = __collapse_huge_page_copy(pte, folio, pmd, _pmd,
  1220						   vma, address, pte_ptl,
  1221						   &compound_pagelist);
  1222		pte_unmap(pte);
  1223		if (unlikely(result != SCAN_SUCCEED))
  1224			goto out_up_write;
  1225	
  1226		/*
  1227		 * The smp_wmb() inside __folio_mark_uptodate() ensures the
  1228		 * copy_huge_page writes become visible before the set_pmd_at()
  1229		 * write.
  1230		 */
  1231		__folio_mark_uptodate(folio);
  1232		pgtable = pmd_pgtable(_pmd);
  1233	
  1234		spin_lock(pmd_ptl);
  1235		BUG_ON(!pmd_none(*pmd));
  1236		pgtable_trans_huge_deposit(mm, pmd, pgtable);
  1237		map_anon_folio_pmd_nopf(folio, pmd, vma, address);
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
