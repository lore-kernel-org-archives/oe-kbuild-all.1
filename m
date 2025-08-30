Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA15F263F5F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 08:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756542355; cv=none; b=mvsfGSWk2dEX5CTDv9VHkxbp2GI/tM9gaWz8dhnvt+iDQWtTIKzwyYDp8kPqErK4Twk48TsoFcsfl7fmqyJv2HX8viwAv03IgRnWUS3w/KhhTt9tOiQRujYjI5P02iPLbONo5cz3CKthlNxK7/lcjMWyvQ6CgxU5tEU74QEZ9es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756542355; c=relaxed/simple;
	bh=vRNX31FaPvG8p9t+SoiUr8jZvFPESMPpEs3EPZnc7Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hLTdSU173hKRT+oQW+0LjQaT7F2jk4RXXUBstmo8BtCZYThN+fdvmFEAPPI72IOsmZNP1ruKM/pjzgUo34Zqhkh/v5PsvjS4BQritynACw8Cbe+JwFlQb3PBPmxBM0c0nrx1IZpS6h1GJslnQ92ZRm9cW9MV2gyesKUWnqDFPws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSAuV0gv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSAuV0gv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756542353; x=1788078353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vRNX31FaPvG8p9t+SoiUr8jZvFPESMPpEs3EPZnc7Qk=;
  b=iSAuV0gvD9Bx8TqsGwDcCc97IxCl5hMDrbmyhEYb4xhv2bd6PCQ0AKrc
   LPd9i+0qSMShXU2eWQamwv3HMVQOoiQL5D+iZyL54AmHk5HZXvczVy6Fw
   pE9qKcxDAMEfmejaqdWQRDEVhIitVOXviZgx3EVGQS5ra+xsBfgkorwVK
   BUqnGoBexAXtZTkKVu+VD2aTbaIpc4GP9Dq2LIGkPMof6Ez5ggLFJmFqh
   VkusnVqwu+ym/1fSwI2loI30CQlOpvN28hpos3BTfErYc4Rws/uRrGbE7
   EvEqVVkjfca7JyhmIrDpS2DCTmkb4YvQi2vqaVx+vl+KLygnf5mbjNNy2
   A==;
X-CSE-ConnectionGUID: HPwls7RiQ1e0QMqmOXZTjQ==
X-CSE-MsgGUID: gOdyDWzdSdWG80/WFbtGqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58744389"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58744389"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 01:25:52 -0700
X-CSE-ConnectionGUID: monICyrJTGCCzwAJQzDYIw==
X-CSE-MsgGUID: QLUKZyo9RP2h3sLACrRUGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="194224193"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2025 01:25:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usGtu-000VFh-16;
	Sat, 30 Aug 2025 08:25:43 +0000
Date: Sat, 30 Aug 2025 16:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1768/1768] mm/khugepaged.c:1336:
 warning: Function parameter or member 'reliable' not described in
 'collapse_shmem'
Message-ID: <202508301637.4sfu6N2M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7dd09dff93e7ad921baf5cec4b58301d9aebb79a
commit: ff0fb9e816fac221fa24a1810dd895745406070b [1768/1768] mm: thp: Add memory reliable support for hugepaged collapse
config: x86_64-buildonly-randconfig-001-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301637.4sfu6N2M-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508301637.4sfu6N2M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508301637.4sfu6N2M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/khugepaged.c:1336: warning: Function parameter or member 'mm' not described in 'collapse_shmem'
   mm/khugepaged.c:1336: warning: Function parameter or member 'mapping' not described in 'collapse_shmem'
   mm/khugepaged.c:1336: warning: Function parameter or member 'start' not described in 'collapse_shmem'
   mm/khugepaged.c:1336: warning: Function parameter or member 'hpage' not described in 'collapse_shmem'
   mm/khugepaged.c:1336: warning: Function parameter or member 'node' not described in 'collapse_shmem'
>> mm/khugepaged.c:1336: warning: Function parameter or member 'reliable' not described in 'collapse_shmem'


vim +1336 mm/khugepaged.c

f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1314  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1315  /**
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1316   * collapse_shmem - collapse small tmpfs/shmem pages into huge one.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1317   *
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1318   * Basic scheme is simple, details are more complex:
af24c01831e4e2 Hugh Dickins       2018-11-30  1319   *  - allocate and lock a new huge page;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1320   *  - scan over radix tree replacing old pages the new one
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1321   *    + swap in pages if necessary;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1322   *    + fill in gaps;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1323   *    + keep old pages around in case if rollback is required;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1324   *  - if replacing succeed:
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1325   *    + copy data over;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1326   *    + free old pages;
af24c01831e4e2 Hugh Dickins       2018-11-30  1327   *    + unlock huge page;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1328   *  - if replacing failed;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1329   *    + put all pages back and unfreeze them;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1330   *    + restore gaps in the radix-tree;
af24c01831e4e2 Hugh Dickins       2018-11-30  1331   *    + unlock and free huge page;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1332   */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1333  static void collapse_shmem(struct mm_struct *mm,
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1334  		struct address_space *mapping, pgoff_t start,
ff0fb9e816fac2 Ma Wupeng          2022-02-09  1335  		struct page **hpage, int node, bool reliable)
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26 @1336  {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1337  	gfp_t gfp;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1338  	struct page *page, *new_page, *tmp;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1339  	struct mem_cgroup *memcg;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1340  	pgoff_t index, end = start + HPAGE_PMD_NR;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1341  	LIST_HEAD(pagelist);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1342  	struct radix_tree_iter iter;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1343  	void **slot;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1344  	int nr_none = 0, result = SCAN_SUCCEED;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1345  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1346  	VM_BUG_ON(start & (HPAGE_PMD_NR - 1));
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1347  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1348  	/* Only allocate from the target node */
41b6167e8f746b Michal Hocko       2017-01-10  1349  	gfp = alloc_hugepage_khugepaged_gfpmask() | __GFP_THISNODE;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1350  
ff0fb9e816fac2 Ma Wupeng          2022-02-09  1351  	if (reliable)
ff0fb9e816fac2 Ma Wupeng          2022-02-09  1352  		gfp |= ___GFP_RELIABILITY;
ff0fb9e816fac2 Ma Wupeng          2022-02-09  1353  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1354  	new_page = khugepaged_alloc_page(hpage, gfp, node);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1355  	if (!new_page) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1356  		result = SCAN_ALLOC_HUGE_PAGE_FAIL;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1357  		goto out;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1358  	}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1359  
2a70f6a76bb86d Michal Hocko       2018-04-10  1360  	if (unlikely(mem_cgroup_try_charge(new_page, mm, gfp, &memcg, true))) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1361  		result = SCAN_CGROUP_CHARGE_FAIL;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1362  		goto out;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1363  	}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1364  
3e9646c76cb91d Hugh Dickins       2018-11-30  1365  	__SetPageLocked(new_page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1366  	__SetPageSwapBacked(new_page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1367  	new_page->index = start;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1368  	new_page->mapping = mapping;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1369  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1370  	/*
af24c01831e4e2 Hugh Dickins       2018-11-30  1371  	 * At this point the new_page is locked and not up-to-date.
af24c01831e4e2 Hugh Dickins       2018-11-30  1372  	 * It's safe to insert it into the page cache, because nobody would
af24c01831e4e2 Hugh Dickins       2018-11-30  1373  	 * be able to map it or use it in another way until we unlock it.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1374  	 */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1375  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1376  	index = start;
b93b016313b3ba Matthew Wilcox     2018-04-10  1377  	xa_lock_irq(&mapping->i_pages);
b93b016313b3ba Matthew Wilcox     2018-04-10  1378  	radix_tree_for_each_slot(slot, &mapping->i_pages, &iter, start) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1379  		int n = min(iter.index, end) - index;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1380  
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1381  		/*
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1382  		 * Stop if extent has been hole-punched, and is now completely
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1383  		 * empty (the more obvious i_size_read() check would take an
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1384  		 * irq-unsafe seqlock on 32-bit).
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1385  		 */
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1386  		if (n >= HPAGE_PMD_NR) {
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1387  			result = SCAN_TRUNCATED;
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1388  			goto tree_locked;
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1389  		}
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1390  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1391  		/*
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1392  		 * Handle holes in the radix tree: charge it from shmem and
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1393  		 * insert relevant subpage of new_page into the radix-tree.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1394  		 */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1395  		if (n && !shmem_charge(mapping->host, n)) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1396  			result = SCAN_FAIL;
3e9646c76cb91d Hugh Dickins       2018-11-30  1397  			goto tree_locked;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1398  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1399  		for (; index < min(iter.index, end); index++) {
b93b016313b3ba Matthew Wilcox     2018-04-10  1400  			radix_tree_insert(&mapping->i_pages, index,
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1401  					new_page + (index % HPAGE_PMD_NR));
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1402  		}
3e9646c76cb91d Hugh Dickins       2018-11-30  1403  		nr_none += n;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1404  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1405  		/* We are done. */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1406  		if (index >= end)
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1407  			break;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1408  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1409  		page = radix_tree_deref_slot_protected(slot,
b93b016313b3ba Matthew Wilcox     2018-04-10  1410  				&mapping->i_pages.xa_lock);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1411  		if (radix_tree_exceptional_entry(page) || !PageUptodate(page)) {
b93b016313b3ba Matthew Wilcox     2018-04-10  1412  			xa_unlock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1413  			/* swap in or instantiate fallocated page */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1414  			if (shmem_getpage(mapping->host, index, &page,
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1415  						SGP_NOHUGE)) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1416  				result = SCAN_FAIL;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1417  				goto tree_unlocked;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1418  			}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1419  		} else if (trylock_page(page)) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1420  			get_page(page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1421  			xa_unlock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1422  		} else {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1423  			result = SCAN_PAGE_LOCK;
3e9646c76cb91d Hugh Dickins       2018-11-30  1424  			goto tree_locked;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1425  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1426  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1427  		/*
b93b016313b3ba Matthew Wilcox     2018-04-10  1428  		 * The page must be locked, so we can drop the i_pages lock
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1429  		 * without racing with truncate.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1430  		 */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1431  		VM_BUG_ON_PAGE(!PageLocked(page), page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1432  		VM_BUG_ON_PAGE(!PageUptodate(page), page);
8b37c40503eadc Hugh Dickins       2018-11-30  1433  
8b37c40503eadc Hugh Dickins       2018-11-30  1434  		/*
8b37c40503eadc Hugh Dickins       2018-11-30  1435  		 * If file was truncated then extended, or hole-punched, before
8b37c40503eadc Hugh Dickins       2018-11-30  1436  		 * we locked the first page, then a THP might be there already.
8b37c40503eadc Hugh Dickins       2018-11-30  1437  		 */
8b37c40503eadc Hugh Dickins       2018-11-30  1438  		if (PageTransCompound(page)) {
8b37c40503eadc Hugh Dickins       2018-11-30  1439  			result = SCAN_PAGE_COMPOUND;
8b37c40503eadc Hugh Dickins       2018-11-30  1440  			goto out_unlock;
8b37c40503eadc Hugh Dickins       2018-11-30  1441  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1442  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1443  		if (page_mapping(page) != mapping) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1444  			result = SCAN_TRUNCATED;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1445  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1446  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1447  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1448  		if (isolate_lru_page(page)) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1449  			result = SCAN_DEL_PAGE_LRU;
3e9646c76cb91d Hugh Dickins       2018-11-30  1450  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1451  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1452  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1453  		if (page_mapped(page))
977fbdcd5986c9 Matthew Wilcox     2018-01-31  1454  			unmap_mapping_pages(mapping, index, 1, false);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1455  
b93b016313b3ba Matthew Wilcox     2018-04-10  1456  		xa_lock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1457  
b93b016313b3ba Matthew Wilcox     2018-04-10  1458  		slot = radix_tree_lookup_slot(&mapping->i_pages, index);
91a45f71078a65 Johannes Weiner    2016-12-12  1459  		VM_BUG_ON_PAGE(page != radix_tree_deref_slot_protected(slot,
b93b016313b3ba Matthew Wilcox     2018-04-10  1460  					&mapping->i_pages.xa_lock), page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1461  		VM_BUG_ON_PAGE(page_mapped(page), page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1462  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1463  		/*
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1464  		 * The page is expected to have page_count() == 3:
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1465  		 *  - we hold a pin on it;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1466  		 *  - one reference from radix tree;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1467  		 *  - one from isolate_lru_page;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1468  		 */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1469  		if (!page_ref_freeze(page, 3)) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1470  			result = SCAN_PAGE_COUNT;
3e9646c76cb91d Hugh Dickins       2018-11-30  1471  			xa_unlock_irq(&mapping->i_pages);
3e9646c76cb91d Hugh Dickins       2018-11-30  1472  			putback_lru_page(page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1473  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1474  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1475  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1476  		/*
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1477  		 * Add the page to the list to be able to undo the collapse if
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1478  		 * something go wrong.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1479  		 */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1480  		list_add_tail(&page->lru, &pagelist);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1481  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1482  		/* Finally, replace with the new page. */
b93b016313b3ba Matthew Wilcox     2018-04-10  1483  		radix_tree_replace_slot(&mapping->i_pages, slot,
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1484  				new_page + (index % HPAGE_PMD_NR));
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1485  
148deab223b237 Matthew Wilcox     2016-12-14  1486  		slot = radix_tree_iter_resume(slot, &iter);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1487  		index++;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1488  		continue;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1489  out_unlock:
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1490  		unlock_page(page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1491  		put_page(page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1492  		goto tree_unlocked;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1493  	}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1494  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1495  	/*
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1496  	 * Handle hole in radix tree at the end of the range.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1497  	 * This code only triggers if there's nothing in radix tree
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1498  	 * beyond 'end'.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1499  	 */
3e9646c76cb91d Hugh Dickins       2018-11-30  1500  	if (index < end) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1501  		int n = end - index;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1502  
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1503  		/* Stop if extent has been truncated, and is now empty */
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1504  		if (n >= HPAGE_PMD_NR) {
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1505  			result = SCAN_TRUNCATED;
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1506  			goto tree_locked;
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1507  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1508  		if (!shmem_charge(mapping->host, n)) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1509  			result = SCAN_FAIL;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1510  			goto tree_locked;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1511  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1512  		for (; index < end; index++) {
b93b016313b3ba Matthew Wilcox     2018-04-10  1513  			radix_tree_insert(&mapping->i_pages, index,
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1514  					new_page + (index % HPAGE_PMD_NR));
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1515  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1516  		nr_none += n;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1517  	}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1518  
3e9646c76cb91d Hugh Dickins       2018-11-30  1519  	__inc_node_page_state(new_page, NR_SHMEM_THPS);
3e9646c76cb91d Hugh Dickins       2018-11-30  1520  	if (nr_none) {
3e9646c76cb91d Hugh Dickins       2018-11-30  1521  		struct zone *zone = page_zone(new_page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1522  
3e9646c76cb91d Hugh Dickins       2018-11-30  1523  		__mod_node_page_state(zone->zone_pgdat, NR_FILE_PAGES, nr_none);
3e9646c76cb91d Hugh Dickins       2018-11-30  1524  		__mod_node_page_state(zone->zone_pgdat, NR_SHMEM, nr_none);
3e9646c76cb91d Hugh Dickins       2018-11-30  1525  	}
3e9646c76cb91d Hugh Dickins       2018-11-30  1526  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1527  tree_locked:
b93b016313b3ba Matthew Wilcox     2018-04-10  1528  	xa_unlock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1529  tree_unlocked:
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1530  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1531  	if (result == SCAN_SUCCEED) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1532  		/*
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1533  		 * Replacing old pages with new one has succeed, now we need to
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1534  		 * copy the content and free old pages.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1535  		 */
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1536  		index = start;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1537  		list_for_each_entry_safe(page, tmp, &pagelist, lru) {
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1538  			while (index < page->index) {
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1539  				clear_highpage(new_page + (index % HPAGE_PMD_NR));
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1540  				index++;
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1541  			}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1542  			copy_highpage(new_page + (page->index % HPAGE_PMD_NR),
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1543  					page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1544  			list_del(&page->lru);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1545  			page->mapping = NULL;
3e9646c76cb91d Hugh Dickins       2018-11-30  1546  			page_ref_unfreeze(page, 1);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1547  			ClearPageActive(page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1548  			ClearPageUnevictable(page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1549  			unlock_page(page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1550  			put_page(page);
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1551  			index++;
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1552  		}
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1553  		while (index < end) {
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1554  			clear_highpage(new_page + (index % HPAGE_PMD_NR));
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1555  			index++;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1556  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1557  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1558  		SetPageUptodate(new_page);
af24c01831e4e2 Hugh Dickins       2018-11-30  1559  		page_ref_add(new_page, HPAGE_PMD_NR - 1);
3e9646c76cb91d Hugh Dickins       2018-11-30  1560  		set_page_dirty(new_page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1561  		mem_cgroup_commit_charge(new_page, memcg, false, true);
9d5425af85abe3 Chris Down         2021-06-30  1562  		count_memcg_events(memcg, THP_COLLAPSE_ALLOC, 1);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1563  		lru_cache_add_anon(new_page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1564  
3e9646c76cb91d Hugh Dickins       2018-11-30  1565  		/*
3e9646c76cb91d Hugh Dickins       2018-11-30  1566  		 * Remove pte page tables, so we can re-fault the page as huge.
3e9646c76cb91d Hugh Dickins       2018-11-30  1567  		 */
3e9646c76cb91d Hugh Dickins       2018-11-30  1568  		retract_page_tables(mapping, start);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1569  		*hpage = NULL;
87aa752906ecf6 Yang Shi           2018-08-17  1570  
87aa752906ecf6 Yang Shi           2018-08-17  1571  		khugepaged_pages_collapsed++;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1572  	} else {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1573  		/* Something went wrong: rollback changes to the radix-tree */
b93b016313b3ba Matthew Wilcox     2018-04-10  1574  		xa_lock_irq(&mapping->i_pages);
78141aabfbb956 Hugh Dickins       2018-11-30  1575  		mapping->nrpages -= nr_none;
78141aabfbb956 Hugh Dickins       2018-11-30  1576  		shmem_uncharge(mapping->host, nr_none);
78141aabfbb956 Hugh Dickins       2018-11-30  1577  
b93b016313b3ba Matthew Wilcox     2018-04-10  1578  		radix_tree_for_each_slot(slot, &mapping->i_pages, &iter, start) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1579  			if (iter.index >= end)
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1580  				break;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1581  			page = list_first_entry_or_null(&pagelist,
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1582  					struct page, lru);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1583  			if (!page || iter.index < page->index) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1584  				if (!nr_none)
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1585  					break;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1586  				nr_none--;
59749e6ce53735 Johannes Weiner    2016-12-12  1587  				/* Put holes back where they were */
b93b016313b3ba Matthew Wilcox     2018-04-10  1588  				radix_tree_delete(&mapping->i_pages, iter.index);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1589  				continue;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1590  			}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1591  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1592  			VM_BUG_ON_PAGE(page->index != iter.index, page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1593  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1594  			/* Unfreeze the page. */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1595  			list_del(&page->lru);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1596  			page_ref_unfreeze(page, 2);
b93b016313b3ba Matthew Wilcox     2018-04-10  1597  			radix_tree_replace_slot(&mapping->i_pages, slot, page);
148deab223b237 Matthew Wilcox     2016-12-14  1598  			slot = radix_tree_iter_resume(slot, &iter);
b93b016313b3ba Matthew Wilcox     2018-04-10  1599  			xa_unlock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1600  			unlock_page(page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1601  			putback_lru_page(page);
b93b016313b3ba Matthew Wilcox     2018-04-10  1602  			xa_lock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1603  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1604  		VM_BUG_ON(nr_none);
b93b016313b3ba Matthew Wilcox     2018-04-10  1605  		xa_unlock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1606  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1607  		mem_cgroup_cancel_charge(new_page, memcg, true);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1608  		new_page->mapping = NULL;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1609  	}
3e9646c76cb91d Hugh Dickins       2018-11-30  1610  
3e9646c76cb91d Hugh Dickins       2018-11-30  1611  	unlock_page(new_page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1612  out:
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1613  	VM_BUG_ON(!list_empty(&pagelist));
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1614  	/* TODO: tracepoints */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1615  }
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1616  

:::::: The code at line 1336 was first introduced by commit
:::::: f3f0e1d2150b2b99da2cbdfaad000089efe9bf30 khugepaged: add support of collapse for tmpfs/shmem pages

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
