Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF1447043B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448539; cv=none; b=fHyta0IKCfnNI0dE+LXNILC5dTUt98CQgMru0tJVTftfEVXbV/WkjEAQ68lQKJfU9z08DOaHhcxMM01CelKEU1KrEuCXWEPASuaFp6BkwBcci0wcnOIior/wY3aPyOzAOJA/exgepF5aGxiVZFhmxEsx+cFJ0Rf18i49uYxn1qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448539; c=relaxed/simple;
	bh=uHrZemjB4LY/DJd0pEKQG8onSRGpm8Yj6A7tlbNQxEI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZlB6wu1o+JsAI7M39x1x4cDqgVzlvMuB4yEk9MKoJjVCiVKUasw0Kt8xcSQRwXnaVvIIggnfHv0W/BLsSD1u7gr044Muv5uHEztAvTJH+hF975FHKbClJOJBVSM+yVtUarXRVAxn4BnrYvnn/CadqINV1vQSdjsS3FiK14Rq/RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPhOBQ3z; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPhOBQ3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791448537; x=1822984537;
  h=date:from:to:cc:subject:message-id;
  bh=uHrZemjB4LY/DJd0pEKQG8onSRGpm8Yj6A7tlbNQxEI=;
  b=RPhOBQ3ztVhEsp+5N/owIlfoPfvvJACwHjt5EKz1tu2zqcUPabGye7vy
   LWX+RA3JetCvFMy9wfg1b0T8Rm+jCqXAFcpA5exKR23C/2oRfLgQH3dn8
   kOMEfftE5FWoPD4KZp6cUeqYJuTrmiBXnIKLoRgC1odem0mMOBUfs8f7Z
   9xoqmNq8uZTXX/Y6XVE/99xHtyaP8u0hcNteykxz1olYY6+IbwO/vYJaP
   zh3u6pSp4rHOMZBx8M2d01z6ETlH76FWLlB3l+mlkdq3s9RMFebhiKnUE
   vahf7JaOYeR2jaqPGkxNs6PwZC1pvE8aMMaFA6tuQlCHdNuIMgrOxonqt
   w==;
X-CSE-ConnectionGUID: cGxQYocZSuOm6IATU7ZI4Q==
X-CSE-MsgGUID: d/pHNcPZSC+AC+Kv+y0dwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="108747"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="108747"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:35:36 -0700
X-CSE-ConnectionGUID: 8i86jp8gQlK6/r/W+VMbYQ==
X-CSE-MsgGUID: shlpaUINQbiXF4tkuaB2Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1807637"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 08 Oct 2026 01:35:35 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEjbA-0000000058x-1Hoj;
	Thu, 08 Oct 2026 08:35:32 +0000
Date: Thu, 08 Oct 2026 10:35:11 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 4/4] mm/rmap.c:902
 folio_referenced_one() warn: inconsistent indenting
Message-ID: <202610081003.EEmOmKcn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   9d29ba85d8a2c505b2d049568c3b1d29c4e0c2fd
commit: 45aaa4d09fecd1c6fa743c38c14d66789640dd4d [4/4] ANDROID: vendor_hooks: Add hooks for lookaround
config: i386-randconfig-2200-20261008 (https://download.01.org/0day-ci/archive/20261008/202610081003.EEmOmKcn-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081003.EEmOmKcn-lkp@intel.com/

smatch warnings:
mm/rmap.c:902 folio_referenced_one() warn: inconsistent indenting

vim +902 mm/rmap.c

1acbc3f936146d1 Yin Fengwei             2023-09-18  847  
8749cfea11f3fff Vladimir Davydov        2016-01-15  848  /*
b3ac04132c4b9bc Matthew Wilcox (Oracle  2022-01-21  849)  * arg: folio_referenced_arg will be passed
8749cfea11f3fff Vladimir Davydov        2016-01-15  850   */
2f031c6f042cb8a Matthew Wilcox (Oracle  2022-01-29  851) static bool folio_referenced_one(struct folio *folio,
2f031c6f042cb8a Matthew Wilcox (Oracle  2022-01-29  852) 		struct vm_area_struct *vma, unsigned long address, void *arg)
8749cfea11f3fff Vladimir Davydov        2016-01-15  853  {
b3ac04132c4b9bc Matthew Wilcox (Oracle  2022-01-21  854) 	struct folio_referenced_arg *pra = arg;
b3ac04132c4b9bc Matthew Wilcox (Oracle  2022-01-21  855) 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
a2880202767dade Kiryl Shutsemau         2025-09-23  856  	int ptes = 0, referenced = 0;
8749cfea11f3fff Vladimir Davydov        2016-01-15  857  
8eaedede825a02d Kiryl Shutsemau         2017-02-24  858  	while (page_vma_mapped_walk(&pvmw)) {
8eaedede825a02d Kiryl Shutsemau         2017-02-24  859  		address = pvmw.address;
71e3aac0724ffe8 Andrea Arcangeli        2011-01-13  860  
1acbc3f936146d1 Yin Fengwei             2023-09-18  861  		if (vma->vm_flags & VM_LOCKED) {
a2880202767dade Kiryl Shutsemau         2025-09-23  862  			ptes++;
a2880202767dade Kiryl Shutsemau         2025-09-23  863  			pra->mapcount--;
a2880202767dade Kiryl Shutsemau         2025-09-23  864  
a2880202767dade Kiryl Shutsemau         2025-09-23  865  			/* Only mlock fully mapped pages */
a2880202767dade Kiryl Shutsemau         2025-09-23  866  			if (pvmw.pte && ptes != pvmw.nr_pages)
a2880202767dade Kiryl Shutsemau         2025-09-23  867  				continue;
a2880202767dade Kiryl Shutsemau         2025-09-23  868  
a2880202767dade Kiryl Shutsemau         2025-09-23  869  			/*
a2880202767dade Kiryl Shutsemau         2025-09-23  870  			 * All PTEs must be protected by page table lock in
a2880202767dade Kiryl Shutsemau         2025-09-23  871  			 * order to mlock the page.
a2880202767dade Kiryl Shutsemau         2025-09-23  872  			 *
a2880202767dade Kiryl Shutsemau         2025-09-23  873  			 * If page table boundary has been cross, current ptl
a2880202767dade Kiryl Shutsemau         2025-09-23  874  			 * only protect part of ptes.
a2880202767dade Kiryl Shutsemau         2025-09-23  875  			 */
a2880202767dade Kiryl Shutsemau         2025-09-23  876  			if (pvmw.flags & PVMW_PGTABLE_CROSSED)
a2880202767dade Kiryl Shutsemau         2025-09-23  877  				continue;
a2880202767dade Kiryl Shutsemau         2025-09-23  878  
47d4f3eeef5f7fd Hugh Dickins            2022-02-14  879  			/* Restore the mlock which got missed */
1acbc3f936146d1 Yin Fengwei             2023-09-18  880  			mlock_vma_folio(folio, vma);
8eaedede825a02d Kiryl Shutsemau         2017-02-24  881  			page_vma_mapped_walk_done(&pvmw);
9f32624be943538 Joonsoo Kim             2014-01-21  882  			pra->vm_flags |= VM_LOCKED;
e4b82222712ed15 Minchan Kim             2017-05-03  883  			return false; /* To break the loop */
2da28bfd9665f49 Andrea Arcangeli        2011-03-11  884  		}
2da28bfd9665f49 Andrea Arcangeli        2011-03-11  885  
c495b97624d0c05 Zhiguo Jiang            2024-07-10  886  		/*
c495b97624d0c05 Zhiguo Jiang            2024-07-10  887  		 * Skip the non-shared swapbacked folio mapped solely by
c495b97624d0c05 Zhiguo Jiang            2024-07-10  888  		 * the exiting or OOM-reaped process. This avoids redundant
c495b97624d0c05 Zhiguo Jiang            2024-07-10  889  		 * swap-out followed by an immediate unmap.
c495b97624d0c05 Zhiguo Jiang            2024-07-10  890  		 */
c495b97624d0c05 Zhiguo Jiang            2024-07-10  891  		if ((!atomic_read(&vma->vm_mm->mm_users) ||
c495b97624d0c05 Zhiguo Jiang            2024-07-10  892  		    check_stable_address_space(vma->vm_mm)) &&
c495b97624d0c05 Zhiguo Jiang            2024-07-10  893  		    folio_test_anon(folio) && folio_test_swapbacked(folio) &&
003fde4492c88ac David Hildenbrand       2025-03-03  894  		    !folio_maybe_mapped_shared(folio)) {
c495b97624d0c05 Zhiguo Jiang            2024-07-10  895  			pra->referenced = -1;
c495b97624d0c05 Zhiguo Jiang            2024-07-10  896  			page_vma_mapped_walk_done(&pvmw);
c495b97624d0c05 Zhiguo Jiang            2024-07-10  897  			return false;
c495b97624d0c05 Zhiguo Jiang            2024-07-10  898  		}
c495b97624d0c05 Zhiguo Jiang            2024-07-10  899  
1d4832becdc2cdb Yu Zhao                 2024-10-19  900  		if (lru_gen_enabled() && pvmw.pte) {
45aaa4d09fecd1c Peifeng Li              2022-09-13  901  				trace_android_vh_look_around(&pvmw, folio, vma, &referenced);
1d4832becdc2cdb Yu Zhao                 2024-10-19 @902  			if (lru_gen_look_around(&pvmw))
018ee47f14893d5 Yu Zhao                 2022-09-18  903  				referenced++;
1d4832becdc2cdb Yu Zhao                 2024-10-19  904  		} else if (pvmw.pte) {
8eaedede825a02d Kiryl Shutsemau         2017-02-24  905  			if (ptep_clear_flush_young_notify(vma, address,
8788f6781486769 Yu Zhao                 2022-12-30  906  						pvmw.pte))
^1da177e4c3f415 Linus Torvalds          2005-04-16  907  				referenced++;
8749cfea11f3fff Vladimir Davydov        2016-01-15  908  		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
8eaedede825a02d Kiryl Shutsemau         2017-02-24  909  			if (pmdp_clear_flush_young_notify(vma, address,
8eaedede825a02d Kiryl Shutsemau         2017-02-24  910  						pvmw.pmd))
8749cfea11f3fff Vladimir Davydov        2016-01-15  911  				referenced++;
8749cfea11f3fff Vladimir Davydov        2016-01-15  912  		} else {
b3ac04132c4b9bc Matthew Wilcox (Oracle  2022-01-21  913) 			/* unexpected pmd-mapped folio? */
8749cfea11f3fff Vladimir Davydov        2016-01-15  914  			WARN_ON_ONCE(1);
8749cfea11f3fff Vladimir Davydov        2016-01-15  915  		}
8eaedede825a02d Kiryl Shutsemau         2017-02-24  916  
8eaedede825a02d Kiryl Shutsemau         2017-02-24  917  		pra->mapcount--;
8eaedede825a02d Kiryl Shutsemau         2017-02-24  918  	}
^1da177e4c3f415 Linus Torvalds          2005-04-16  919  
33c3fc71c8cfa3c Vladimir Davydov        2015-09-09  920  	if (referenced)
b3ac04132c4b9bc Matthew Wilcox (Oracle  2022-01-21  921) 		folio_clear_idle(folio);
b3ac04132c4b9bc Matthew Wilcox (Oracle  2022-01-21  922) 	if (folio_test_clear_young(folio))
33c3fc71c8cfa3c Vladimir Davydov        2015-09-09  923  		referenced++;
33c3fc71c8cfa3c Vladimir Davydov        2015-09-09  924  
9f32624be943538 Joonsoo Kim             2014-01-21  925  	if (referenced) {
9f32624be943538 Joonsoo Kim             2014-01-21  926  		pra->referenced++;
47d4f3eeef5f7fd Hugh Dickins            2022-02-14  927  		pra->vm_flags |= vma->vm_flags & ~VM_LOCKED;
^1da177e4c3f415 Linus Torvalds          2005-04-16  928  	}
^1da177e4c3f415 Linus Torvalds          2005-04-16  929  
9f32624be943538 Joonsoo Kim             2014-01-21  930  	if (!pra->mapcount)
e4b82222712ed15 Minchan Kim             2017-05-03  931  		return false; /* To break the loop */
34bbd704051c9d0 Oleg Nesterov           2007-02-28  932  
e4b82222712ed15 Minchan Kim             2017-05-03  933  	return true;
^1da177e4c3f415 Linus Torvalds          2005-04-16  934  }
^1da177e4c3f415 Linus Torvalds          2005-04-16  935  

:::::: The code at line 902 was first introduced by commit
:::::: 1d4832becdc2cdb2cffe2a6050c9d9fd8ff1c58c mm: multi-gen LRU: use {ptep,pmdp}_clear_young_notify()

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
