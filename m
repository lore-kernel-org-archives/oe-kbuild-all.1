Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B32312C48A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721491775; cv=none; b=Yc0KM0BN4q6Po71xo3bTCLSdWaM1n34cnQEWVt3IzvIYjI8qCA0dKa1HbKUlrDWXjWiegbgknb3k5bgDxUAkLcqg32Kap31jhC+INgeby6jLvdWmI1UTfXRQ2fOohYhdls1HJBMHOiyzMF2MZOHyg8B0f8nH19aqohkLmyIcPlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721491775; c=relaxed/simple;
	bh=7eYVsn1FiolPQPGiXevASB2Zj/Z9jbRhE817rr5OgZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YyxnrfTgAuGi9GlLv6uiWCuHl/hw3ED75xwQunb5ieeUXk+P9V96W4j2aiEnbMBfmG2ViBNY19NyGayFi60iyAQWF7v9HvV0kFElVk9rEgYEfmsCsHx1rPRMxF9YNJ9h7u2km7DiVUgWLihrAHVjZ28iKIiCEG3K8h3etjWyyWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NaOJGqGn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NaOJGqGn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721491773; x=1753027773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7eYVsn1FiolPQPGiXevASB2Zj/Z9jbRhE817rr5OgZk=;
  b=NaOJGqGn7A1xtjjMo1mJzrkFRleHG4Is9Af12Erne97tjeEmPpHXnjIk
   xYq4UIMxlJki9xghwj3A+uZqtZbC/LMIMkOapJF5Bp0COaobtV8bj4lRY
   H/mb3lWNIWqLFPFzSEhOD8OMjRGP6r7HS6FCRTgUFLTzWrhA6g7XWaSQ3
   A7Mr0xr9hNPyiBi2XVX6jAALmqn+XW7KbIcwuWP6jNJ+a+G8SaWepD7Uh
   +SqEnI5SHp+vQGBHL6DMpy9eRqWcYZi0FJOAIIlBGk2rTSzuFitjoRvTq
   kl9yVTZ0Z/2cJpATPsLX8Va9hLo4ozBrfkqiIOV2tA+u/3CTeUchSI6qM
   A==;
X-CSE-ConnectionGUID: xmz5PV7UTwKHweUglS9rtg==
X-CSE-MsgGUID: CBi6P0m2ROO4kt+8DUv0jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="36539989"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="36539989"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 09:09:32 -0700
X-CSE-ConnectionGUID: XmFXa6bpQZG7iGWNhTiDYQ==
X-CSE-MsgGUID: n6wr7BxYTmONsrJ1dGPbAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="82457948"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Jul 2024 09:09:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVCeG-000jNM-0D;
	Sat, 20 Jul 2024 16:09:28 +0000
Date: Sun, 21 Jul 2024 00:08:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 42/42] mm/khugepaged.c:1226:16: warning:
 assignment to 'struct ptdesc *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202407210048.b2uakSi7-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20240720 (https://download.01.org/0day-ci/archive/20240721/202407210048.b2uakSi7-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407210048.b2uakSi7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407210048.b2uakSi7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/khugepaged.c: In function '__collapse_huge_page_copy_failed':
   mm/khugepaged.c:772:39: error: implicit declaration of function 'pmd_ptdesc'; did you mean 'pfn_ptdesc'? [-Werror=implicit-function-declaration]
     772 |         pmd_populate(vma->vm_mm, pmd, pmd_ptdesc(&orig_pmd));
         |                                       ^~~~~~~~~~
         |                                       pfn_ptdesc
   mm/khugepaged.c:772:39: warning: passing argument 3 of 'pmd_populate' makes pointer from integer without a cast [-Wint-conversion]
     772 |         pmd_populate(vma->vm_mm, pmd, pmd_ptdesc(&orig_pmd));
         |                                       ^~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
   In file included from mm/khugepaged.c:26:
   arch/x86/include/asm/pgalloc.h:79:48: note: expected 'struct ptdesc *' but argument is of type 'int'
      79 |                                 struct ptdesc *pte)
         |                                 ~~~~~~~~~~~~~~~^~~
   mm/khugepaged.c: In function 'collapse_huge_page':
>> mm/khugepaged.c:1226:16: warning: assignment to 'struct ptdesc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1226 |         ptdesc = pmd_ptdesc(&_pmd);
         |                ^
   cc1: some warnings being treated as errors


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
