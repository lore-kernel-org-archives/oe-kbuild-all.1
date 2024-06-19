Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E57153561
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 16:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718815355; cv=none; b=bfxQq9PwbwIkq5vZd3VyJo5/j55/BgZkTx6f7jNrLNCELumUrf8xLb1CesIsTwfPuAW5nyMKepHrcXuOsegLRG0KqDqHIwWg2RLJ4ngqIaOSvKgzvew9VjSaBZd6mFvE+t7fWpCrf9svaPKOqsqIvFfVJBb4m4jsRtSDNTJoqMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718815355; c=relaxed/simple;
	bh=IVVebfjTgjpLfkluUn3HUtmcinUglfugOEPxFKSYUMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ODwO8H/Kkl8iMbu9ePmJMvE8z92EoctzMTK6EnOoTes0NtYo227QC3Aeo01HnpDfmTaJUML+Ge0lR2vePubJKJP35td7kQTEj731T0JM0bo3ZVQSnBhYBD3e1Z33QKTlu5FUCzWK1rOu2gCTrkhOJphgj8syor3AjljsRY25Knw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAa49h+U; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAa49h+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718815352; x=1750351352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IVVebfjTgjpLfkluUn3HUtmcinUglfugOEPxFKSYUMc=;
  b=oAa49h+U9nlGHUWEFvt1XfgTr0gUGFYUSioSmfjfaLQAlPcIo/rT+OfX
   C76PMNC3Exp0m2C0g4Xq+n622jDqtXn0puY/S8Hoz7STXeVB3OjaGv7DK
   2fyt1T2mQ2N39KijHKeBzPUA374/uhrwgng31+BG0GFN/BReDR6nLwaJ/
   BlIR+03VbGy/DIrTDU8wrsQRH4bzVDiOqp8gLnGAua5zPrSnxkNRmxZZK
   7eZ28pHRdOZ4OeoYjAkSt1v57ieJwag5DJdfmL73QZ3DOrMNqnk5NQSZn
   9mIWqCR8AyJD55sr2CYF45FEt/jMIoN5TV4FP5az8K9APBj2z/y2Jmk/R
   g==;
X-CSE-ConnectionGUID: 6GbzP0wOThSh9q2OG2vnsw==
X-CSE-MsgGUID: DaYpxlI9Reu92qcCN4Kt4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="27184725"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="27184725"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 09:42:30 -0700
X-CSE-ConnectionGUID: tyzHMkgqTBeBR2oW9ahqRQ==
X-CSE-MsgGUID: qn3FBSlvQHGxS2dgvoPGQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="73175083"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jun 2024 09:42:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJyOB-0006le-0X;
	Wed, 19 Jun 2024 16:42:27 +0000
Date: Thu, 20 Jun 2024 00:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <v-songbaohua@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6728/7105] mm/rmap.c:1413: warning: Function
 parameter or struct member 'flags' not described in
 'folio_add_new_anon_rmap'
Message-ID: <202406200059.tVU9semU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2102cb0d050d34d50b9642a3a50861787527e922
commit: 41bb9aa5f614423659ced668d0f1ff0c1da6552e [6728/7105] mm: extend rmap flags arguments for folio_add_new_anon_rmap
config: arm-pxa910_defconfig (https://download.01.org/0day-ci/archive/20240620/202406200059.tVU9semU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200059.tVU9semU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200059.tVU9semU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/rmap.c:1413: warning: Function parameter or struct member 'flags' not described in 'folio_add_new_anon_rmap'


vim +1413 mm/rmap.c

8bd5130070fbf2 David Hildenbrand       2023-12-20  1398  
43d8eac44f28d3 Randy Dunlap            2008-03-19  1399  /**
4d510f3da4c216 Matthew Wilcox (Oracle  2023-01-11  1400)  * folio_add_new_anon_rmap - Add mapping to a new anonymous folio.
4d510f3da4c216 Matthew Wilcox (Oracle  2023-01-11  1401)  * @folio:	The folio to add the mapping to.
9617d95e6e9ffd Nicholas Piggin         2006-01-06  1402   * @vma:	the vm area in which the mapping is added
9617d95e6e9ffd Nicholas Piggin         2006-01-06  1403   * @address:	the user virtual address mapped
40f2bbf71161fa David Hildenbrand       2022-05-09  1404   *
84f0169e6c8a61 David Hildenbrand       2023-12-20  1405   * Like folio_add_anon_rmap_*() but must only be called on *new* folios.
9617d95e6e9ffd Nicholas Piggin         2006-01-06  1406   * This means the inc-and-test can be bypassed.
4d510f3da4c216 Matthew Wilcox (Oracle  2023-01-11  1407)  * The folio does not have to be locked.
4d510f3da4c216 Matthew Wilcox (Oracle  2023-01-11  1408)  *
41bb9aa5f61442 Barry Song              2024-06-18  1409   * If the folio is pmd-mappable, it is accounted as a THP.
9617d95e6e9ffd Nicholas Piggin         2006-01-06  1410   */
4d510f3da4c216 Matthew Wilcox (Oracle  2023-01-11  1411) void folio_add_new_anon_rmap(struct folio *folio, struct vm_area_struct *vma,
41bb9aa5f61442 Barry Song              2024-06-18  1412  		unsigned long address, rmap_t flags)
9617d95e6e9ffd Nicholas Piggin         2006-01-06 @1413  {
372cbd4d5a0665 Ryan Roberts            2023-12-07  1414  	int nr = folio_nr_pages(folio);
c2784aaa21dc56 Yosry Ahmed             2024-05-06  1415  	int nr_pmdmapped = 0;
41bb9aa5f61442 Barry Song              2024-06-18  1416  	bool exclusive = flags & RMAP_EXCLUSIVE;
d281ee61451835 Kirill A. Shutemov      2016-01-15  1417  
a4ea18641d8330 David Hildenbrand       2023-12-20  1418  	VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
372cbd4d5a0665 Ryan Roberts            2023-12-07  1419  	VM_BUG_ON_VMA(address < vma->vm_start ||
372cbd4d5a0665 Ryan Roberts            2023-12-07  1420  			address + (nr << PAGE_SHIFT) > vma->vm_end, vma);
4d510f3da4c216 Matthew Wilcox (Oracle  2023-01-11  1421) 	__folio_set_swapbacked(folio);
41bb9aa5f61442 Barry Song              2024-06-18  1422  	__folio_set_anon(folio, vma, address, exclusive);
d8dd5e979d09c7 Hugh Dickins            2022-11-09  1423  
372cbd4d5a0665 Ryan Roberts            2023-12-07  1424  	if (likely(!folio_test_large(folio))) {
d8dd5e979d09c7 Hugh Dickins            2022-11-09  1425  		/* increment count (starts at -1) */
4d510f3da4c216 Matthew Wilcox (Oracle  2023-01-11  1426) 		atomic_set(&folio->_mapcount, 0);
41bb9aa5f61442 Barry Song              2024-06-18  1427  		if (exclusive)
372cbd4d5a0665 Ryan Roberts            2023-12-07  1428  			SetPageAnonExclusive(&folio->page);
372cbd4d5a0665 Ryan Roberts            2023-12-07  1429  	} else if (!folio_test_pmd_mappable(folio)) {
372cbd4d5a0665 Ryan Roberts            2023-12-07  1430  		int i;
372cbd4d5a0665 Ryan Roberts            2023-12-07  1431  
372cbd4d5a0665 Ryan Roberts            2023-12-07  1432  		for (i = 0; i < nr; i++) {
372cbd4d5a0665 Ryan Roberts            2023-12-07  1433  			struct page *page = folio_page(folio, i);
372cbd4d5a0665 Ryan Roberts            2023-12-07  1434  
372cbd4d5a0665 Ryan Roberts            2023-12-07  1435  			/* increment count (starts at -1) */
372cbd4d5a0665 Ryan Roberts            2023-12-07  1436  			atomic_set(&page->_mapcount, 0);
41bb9aa5f61442 Barry Song              2024-06-18  1437  			if (exclusive)
372cbd4d5a0665 Ryan Roberts            2023-12-07  1438  				SetPageAnonExclusive(page);
372cbd4d5a0665 Ryan Roberts            2023-12-07  1439  		}
372cbd4d5a0665 Ryan Roberts            2023-12-07  1440  
05c5323b2a344c David Hildenbrand       2024-04-09  1441  		/* increment count (starts at -1) */
05c5323b2a344c David Hildenbrand       2024-04-09  1442  		atomic_set(&folio->_large_mapcount, nr - 1);
372cbd4d5a0665 Ryan Roberts            2023-12-07  1443  		atomic_set(&folio->_nr_pages_mapped, nr);
d8dd5e979d09c7 Hugh Dickins            2022-11-09  1444  	} else {
53f9263baba69f Kirill A. Shutemov      2016-01-15  1445  		/* increment count (starts at -1) */
4d510f3da4c216 Matthew Wilcox (Oracle  2023-01-11  1446) 		atomic_set(&folio->_entire_mapcount, 0);
05c5323b2a344c David Hildenbrand       2024-04-09  1447  		/* increment count (starts at -1) */
05c5323b2a344c David Hildenbrand       2024-04-09  1448  		atomic_set(&folio->_large_mapcount, 0);
e78a13fd16bb9d David Hildenbrand       2023-12-20  1449  		atomic_set(&folio->_nr_pages_mapped, ENTIRELY_MAPPED);
41bb9aa5f61442 Barry Song              2024-06-18  1450  		if (exclusive)
372cbd4d5a0665 Ryan Roberts            2023-12-07  1451  			SetPageAnonExclusive(&folio->page);
c2784aaa21dc56 Yosry Ahmed             2024-05-06  1452  		nr_pmdmapped = nr;
d281ee61451835 Kirill A. Shutemov      2016-01-15  1453  	}
d8dd5e979d09c7 Hugh Dickins            2022-11-09  1454  
c2784aaa21dc56 Yosry Ahmed             2024-05-06  1455  	__folio_mod_stat(folio, nr, nr_pmdmapped);
9617d95e6e9ffd Nicholas Piggin         2006-01-06  1456  }
9617d95e6e9ffd Nicholas Piggin         2006-01-06  1457  

:::::: The code at line 1413 was first introduced by commit
:::::: 9617d95e6e9ffd883cf90a89724fe60d7ab22f9a [PATCH] mm: rmap optimisation

:::::: TO: Nick Piggin <nickpiggin@yahoo.com.au>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
