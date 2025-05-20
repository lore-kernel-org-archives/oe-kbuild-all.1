Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CAE25F7BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747729033; cv=none; b=qd/Kr6WCft7801UO5a+ArCCjSzHcRZrK1msgYbI7ebG0IgDE6fIU+al2jwFKygMrE9ZeM3s4CroyVJgFfhEUJBXCFPMVZPCvZ6oQOvwRkESqNqjZ1H3jzmPj8rljdyJCLoW709ybUMRLj5xpwF6+khZmMzRHr+d8jV/ZCbC0JS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747729033; c=relaxed/simple;
	bh=m3i7C98hADgVcfaqyn2uQ1NYJ8BQqNWCEabJO/NkTOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HxZRx/z0OT0Lmd10uBLrajdG64LaROo7Ct2G8312sbOFvyiuitP/DjhmeoJInflj3ke2wc7LLuOQi7xd4+fEMkQ3B7MEqioQnIuaKuSokQbunXis9eEYBRiWjjtXqNDUAzJnl/x7RPjykey9W7nyTeqcNtQiFHsIjc4aCRA1CZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrfqU4qB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrfqU4qB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747729030; x=1779265030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m3i7C98hADgVcfaqyn2uQ1NYJ8BQqNWCEabJO/NkTOI=;
  b=SrfqU4qBlqLoZXKhr57UQrzUAgwzi589bx1wca14Ireh1L3pRn5e0jn6
   IiRHK6h0vKDDS5ZcvEf/4Ua+yYfdZSty4tHWWzAcKNYRBNdy581eGxo/F
   E2S2UtvsJI0aDSP6gA5kcmTN0HWnJpvGkZhm7giilQK71zG/xCK75eKC4
   d9Wkq/SLsV6HtgDCEQrAr1DIuAuL52jc+JQHeim3wLrmnkmcp8Sw6vZWP
   EU9tpGMhWQoL9Qq7uxb5oQniToXtlon4IPoDa1aCXK7DkAjVlZJ8d2F/N
   e/Z4MrV65P/pGAkc663BiCStHZX75J/SAS8MjBR+jxLKvIS6FQwpwFXyP
   A==;
X-CSE-ConnectionGUID: JXjgy9/aSZyXtIO16Q1QDQ==
X-CSE-MsgGUID: g0HoIqGsS6qLgMTKwEpUpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49525053"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49525053"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 01:17:10 -0700
X-CSE-ConnectionGUID: dO5uZ2jQRf2d7ylHFnyJ2A==
X-CSE-MsgGUID: hK2DWm6KQlCb61o4zkwxPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="143621083"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2025 01:17:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHI9p-000MKM-34;
	Tue, 20 May 2025 08:17:05 +0000
Date: Tue, 20 May 2025 16:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1646/1646] mm/khugepaged.c:1307:
 warning: Function parameter or member 'mm' not described in 'collapse_shmem'
Message-ID: <202505201642.9kWf73yF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paulo,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8ef0a44ca2d0533e47597c06656a95d56aecc0c3
commit: 71e217e85c3dff8a9151707ed3afc7b4b054a2d4 [1646/1646] selinux: use kernel linux/socket.h for genheaders and mdp
config: x86_64-buildonly-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201642.9kWf73yF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201642.9kWf73yF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201642.9kWf73yF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/khugepaged.c:1307: warning: Function parameter or member 'mm' not described in 'collapse_shmem'
>> mm/khugepaged.c:1307: warning: Function parameter or member 'mapping' not described in 'collapse_shmem'
>> mm/khugepaged.c:1307: warning: Function parameter or member 'start' not described in 'collapse_shmem'
>> mm/khugepaged.c:1307: warning: Function parameter or member 'hpage' not described in 'collapse_shmem'
>> mm/khugepaged.c:1307: warning: Function parameter or member 'node' not described in 'collapse_shmem'
   mm/khugepaged.o: warning: objtool: start_stop_khugepaged()+0x185: sibling call from callable instruction with modified stack frame
   mm/khugepaged.o: warning: objtool: start_stop_khugepaged.cold()+0x0: call without frame pointer save/setup
--
   mm/huge_memory.c:501:15: warning: no previous prototype for '__thp_get_unmapped_area' [-Wmissing-prototypes]
     501 | unsigned long __thp_get_unmapped_area(struct file *filp, unsigned long len,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c: In function 'zap_huge_pud':
>> mm/huge_memory.c:1997:15: warning: variable 'orig_pud' set but not used [-Wunused-but-set-variable]
    1997 |         pud_t orig_pud;
         |               ^~~~~~~~
   mm/huge_memory.o: warning: objtool: split_huge_pages_set.part.0()+0x23: sibling call from callable instruction with modified stack frame
   mm/huge_memory.o: warning: objtool: split_huge_pages_set.part.0.cold()+0xa: call without frame pointer save/setup
--
   In file included from include/linux/page_counter.h:6,
                    from mm/memcontrol.c:34:
   mm/memcontrol.c: In function 'mem_cgroup_get_max':
   include/linux/kernel.h:879:45: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     879 | #define min(x, y)       __careful_cmp(x, y, <)
         |                                             ^
   include/linux/kernel.h:862:30: note: in definition of macro '__cmp'
     862 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                              ^~
   include/linux/kernel.h:879:25: note: in expansion of macro '__careful_cmp'
     879 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   mm/memcontrol.c:1373:28: note: in expansion of macro 'min'
    1373 |                 swap_max = min(swap_max, (unsigned long)total_swap_pages);
         |                            ^~~
>> mm/memcontrol.c:5790: warning: bad line:                | 0, otherwise.
   mm/memcontrol.o: warning: objtool: mem_cgroup_print_oom_info()+0x3a: sibling call from callable instruction with modified stack frame
   mm/memcontrol.o: warning: objtool: mem_cgroup_print_oom_info.cold()+0x7: call without frame pointer save/setup


vim +1307 mm/khugepaged.c

f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1285  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1286  /**
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1287   * collapse_shmem - collapse small tmpfs/shmem pages into huge one.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1288   *
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1289   * Basic scheme is simple, details are more complex:
af24c01831e4e2 Hugh Dickins       2018-11-30  1290   *  - allocate and lock a new huge page;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1291   *  - scan over radix tree replacing old pages the new one
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1292   *    + swap in pages if necessary;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1293   *    + fill in gaps;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1294   *    + keep old pages around in case if rollback is required;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1295   *  - if replacing succeed:
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1296   *    + copy data over;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1297   *    + free old pages;
af24c01831e4e2 Hugh Dickins       2018-11-30  1298   *    + unlock huge page;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1299   *  - if replacing failed;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1300   *    + put all pages back and unfreeze them;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1301   *    + restore gaps in the radix-tree;
af24c01831e4e2 Hugh Dickins       2018-11-30  1302   *    + unlock and free huge page;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1303   */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1304  static void collapse_shmem(struct mm_struct *mm,
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1305  		struct address_space *mapping, pgoff_t start,
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1306  		struct page **hpage, int node)
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26 @1307  {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1308  	gfp_t gfp;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1309  	struct page *page, *new_page, *tmp;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1310  	struct mem_cgroup *memcg;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1311  	pgoff_t index, end = start + HPAGE_PMD_NR;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1312  	LIST_HEAD(pagelist);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1313  	struct radix_tree_iter iter;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1314  	void **slot;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1315  	int nr_none = 0, result = SCAN_SUCCEED;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1316  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1317  	VM_BUG_ON(start & (HPAGE_PMD_NR - 1));
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1318  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1319  	/* Only allocate from the target node */
41b6167e8f746b Michal Hocko       2017-01-10  1320  	gfp = alloc_hugepage_khugepaged_gfpmask() | __GFP_THISNODE;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1321  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1322  	new_page = khugepaged_alloc_page(hpage, gfp, node);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1323  	if (!new_page) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1324  		result = SCAN_ALLOC_HUGE_PAGE_FAIL;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1325  		goto out;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1326  	}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1327  
2a70f6a76bb86d Michal Hocko       2018-04-10  1328  	if (unlikely(mem_cgroup_try_charge(new_page, mm, gfp, &memcg, true))) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1329  		result = SCAN_CGROUP_CHARGE_FAIL;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1330  		goto out;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1331  	}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1332  
3e9646c76cb91d Hugh Dickins       2018-11-30  1333  	__SetPageLocked(new_page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1334  	__SetPageSwapBacked(new_page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1335  	new_page->index = start;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1336  	new_page->mapping = mapping;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1337  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1338  	/*
af24c01831e4e2 Hugh Dickins       2018-11-30  1339  	 * At this point the new_page is locked and not up-to-date.
af24c01831e4e2 Hugh Dickins       2018-11-30  1340  	 * It's safe to insert it into the page cache, because nobody would
af24c01831e4e2 Hugh Dickins       2018-11-30  1341  	 * be able to map it or use it in another way until we unlock it.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1342  	 */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1343  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1344  	index = start;
b93b016313b3ba Matthew Wilcox     2018-04-10  1345  	xa_lock_irq(&mapping->i_pages);
b93b016313b3ba Matthew Wilcox     2018-04-10  1346  	radix_tree_for_each_slot(slot, &mapping->i_pages, &iter, start) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1347  		int n = min(iter.index, end) - index;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1348  
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1349  		/*
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1350  		 * Stop if extent has been hole-punched, and is now completely
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1351  		 * empty (the more obvious i_size_read() check would take an
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1352  		 * irq-unsafe seqlock on 32-bit).
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1353  		 */
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1354  		if (n >= HPAGE_PMD_NR) {
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1355  			result = SCAN_TRUNCATED;
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1356  			goto tree_locked;
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1357  		}
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1358  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1359  		/*
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1360  		 * Handle holes in the radix tree: charge it from shmem and
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1361  		 * insert relevant subpage of new_page into the radix-tree.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1362  		 */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1363  		if (n && !shmem_charge(mapping->host, n)) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1364  			result = SCAN_FAIL;
3e9646c76cb91d Hugh Dickins       2018-11-30  1365  			goto tree_locked;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1366  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1367  		for (; index < min(iter.index, end); index++) {
b93b016313b3ba Matthew Wilcox     2018-04-10  1368  			radix_tree_insert(&mapping->i_pages, index,
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1369  					new_page + (index % HPAGE_PMD_NR));
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1370  		}
3e9646c76cb91d Hugh Dickins       2018-11-30  1371  		nr_none += n;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1372  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1373  		/* We are done. */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1374  		if (index >= end)
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1375  			break;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1376  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1377  		page = radix_tree_deref_slot_protected(slot,
b93b016313b3ba Matthew Wilcox     2018-04-10  1378  				&mapping->i_pages.xa_lock);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1379  		if (radix_tree_exceptional_entry(page) || !PageUptodate(page)) {
b93b016313b3ba Matthew Wilcox     2018-04-10  1380  			xa_unlock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1381  			/* swap in or instantiate fallocated page */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1382  			if (shmem_getpage(mapping->host, index, &page,
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1383  						SGP_NOHUGE)) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1384  				result = SCAN_FAIL;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1385  				goto tree_unlocked;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1386  			}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1387  		} else if (trylock_page(page)) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1388  			get_page(page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1389  			xa_unlock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1390  		} else {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1391  			result = SCAN_PAGE_LOCK;
3e9646c76cb91d Hugh Dickins       2018-11-30  1392  			goto tree_locked;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1393  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1394  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1395  		/*
b93b016313b3ba Matthew Wilcox     2018-04-10  1396  		 * The page must be locked, so we can drop the i_pages lock
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1397  		 * without racing with truncate.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1398  		 */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1399  		VM_BUG_ON_PAGE(!PageLocked(page), page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1400  		VM_BUG_ON_PAGE(!PageUptodate(page), page);
8b37c40503eadc Hugh Dickins       2018-11-30  1401  
8b37c40503eadc Hugh Dickins       2018-11-30  1402  		/*
8b37c40503eadc Hugh Dickins       2018-11-30  1403  		 * If file was truncated then extended, or hole-punched, before
8b37c40503eadc Hugh Dickins       2018-11-30  1404  		 * we locked the first page, then a THP might be there already.
8b37c40503eadc Hugh Dickins       2018-11-30  1405  		 */
8b37c40503eadc Hugh Dickins       2018-11-30  1406  		if (PageTransCompound(page)) {
8b37c40503eadc Hugh Dickins       2018-11-30  1407  			result = SCAN_PAGE_COMPOUND;
8b37c40503eadc Hugh Dickins       2018-11-30  1408  			goto out_unlock;
8b37c40503eadc Hugh Dickins       2018-11-30  1409  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1410  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1411  		if (page_mapping(page) != mapping) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1412  			result = SCAN_TRUNCATED;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1413  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1414  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1415  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1416  		if (isolate_lru_page(page)) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1417  			result = SCAN_DEL_PAGE_LRU;
3e9646c76cb91d Hugh Dickins       2018-11-30  1418  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1419  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1420  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1421  		if (page_mapped(page))
977fbdcd5986c9 Matthew Wilcox     2018-01-31  1422  			unmap_mapping_pages(mapping, index, 1, false);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1423  
b93b016313b3ba Matthew Wilcox     2018-04-10  1424  		xa_lock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1425  
b93b016313b3ba Matthew Wilcox     2018-04-10  1426  		slot = radix_tree_lookup_slot(&mapping->i_pages, index);
91a45f71078a65 Johannes Weiner    2016-12-12  1427  		VM_BUG_ON_PAGE(page != radix_tree_deref_slot_protected(slot,
b93b016313b3ba Matthew Wilcox     2018-04-10  1428  					&mapping->i_pages.xa_lock), page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1429  		VM_BUG_ON_PAGE(page_mapped(page), page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1430  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1431  		/*
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1432  		 * The page is expected to have page_count() == 3:
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1433  		 *  - we hold a pin on it;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1434  		 *  - one reference from radix tree;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1435  		 *  - one from isolate_lru_page;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1436  		 */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1437  		if (!page_ref_freeze(page, 3)) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1438  			result = SCAN_PAGE_COUNT;
3e9646c76cb91d Hugh Dickins       2018-11-30  1439  			xa_unlock_irq(&mapping->i_pages);
3e9646c76cb91d Hugh Dickins       2018-11-30  1440  			putback_lru_page(page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1441  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1442  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1443  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1444  		/*
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1445  		 * Add the page to the list to be able to undo the collapse if
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1446  		 * something go wrong.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1447  		 */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1448  		list_add_tail(&page->lru, &pagelist);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1449  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1450  		/* Finally, replace with the new page. */
b93b016313b3ba Matthew Wilcox     2018-04-10  1451  		radix_tree_replace_slot(&mapping->i_pages, slot,
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1452  				new_page + (index % HPAGE_PMD_NR));
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1453  
148deab223b237 Matthew Wilcox     2016-12-14  1454  		slot = radix_tree_iter_resume(slot, &iter);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1455  		index++;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1456  		continue;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1457  out_unlock:
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1458  		unlock_page(page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1459  		put_page(page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1460  		goto tree_unlocked;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1461  	}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1462  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1463  	/*
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1464  	 * Handle hole in radix tree at the end of the range.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1465  	 * This code only triggers if there's nothing in radix tree
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1466  	 * beyond 'end'.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1467  	 */
3e9646c76cb91d Hugh Dickins       2018-11-30  1468  	if (index < end) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1469  		int n = end - index;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1470  
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1471  		/* Stop if extent has been truncated, and is now empty */
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1472  		if (n >= HPAGE_PMD_NR) {
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1473  			result = SCAN_TRUNCATED;
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1474  			goto tree_locked;
8797f2f4fe0d55 Hugh Dickins       2018-11-30  1475  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1476  		if (!shmem_charge(mapping->host, n)) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1477  			result = SCAN_FAIL;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1478  			goto tree_locked;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1479  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1480  		for (; index < end; index++) {
b93b016313b3ba Matthew Wilcox     2018-04-10  1481  			radix_tree_insert(&mapping->i_pages, index,
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1482  					new_page + (index % HPAGE_PMD_NR));
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1483  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1484  		nr_none += n;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1485  	}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1486  
3e9646c76cb91d Hugh Dickins       2018-11-30  1487  	__inc_node_page_state(new_page, NR_SHMEM_THPS);
3e9646c76cb91d Hugh Dickins       2018-11-30  1488  	if (nr_none) {
3e9646c76cb91d Hugh Dickins       2018-11-30  1489  		struct zone *zone = page_zone(new_page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1490  
3e9646c76cb91d Hugh Dickins       2018-11-30  1491  		__mod_node_page_state(zone->zone_pgdat, NR_FILE_PAGES, nr_none);
3e9646c76cb91d Hugh Dickins       2018-11-30  1492  		__mod_node_page_state(zone->zone_pgdat, NR_SHMEM, nr_none);
3e9646c76cb91d Hugh Dickins       2018-11-30  1493  	}
3e9646c76cb91d Hugh Dickins       2018-11-30  1494  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1495  tree_locked:
b93b016313b3ba Matthew Wilcox     2018-04-10  1496  	xa_unlock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1497  tree_unlocked:
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1498  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1499  	if (result == SCAN_SUCCEED) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1500  		/*
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1501  		 * Replacing old pages with new one has succeed, now we need to
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1502  		 * copy the content and free old pages.
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1503  		 */
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1504  		index = start;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1505  		list_for_each_entry_safe(page, tmp, &pagelist, lru) {
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1506  			while (index < page->index) {
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1507  				clear_highpage(new_page + (index % HPAGE_PMD_NR));
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1508  				index++;
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1509  			}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1510  			copy_highpage(new_page + (page->index % HPAGE_PMD_NR),
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1511  					page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1512  			list_del(&page->lru);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1513  			page->mapping = NULL;
3e9646c76cb91d Hugh Dickins       2018-11-30  1514  			page_ref_unfreeze(page, 1);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1515  			ClearPageActive(page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1516  			ClearPageUnevictable(page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1517  			unlock_page(page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1518  			put_page(page);
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1519  			index++;
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1520  		}
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1521  		while (index < end) {
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1522  			clear_highpage(new_page + (index % HPAGE_PMD_NR));
ee13d69bc1e8a5 Hugh Dickins       2018-11-30  1523  			index++;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1524  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1525  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1526  		SetPageUptodate(new_page);
af24c01831e4e2 Hugh Dickins       2018-11-30  1527  		page_ref_add(new_page, HPAGE_PMD_NR - 1);
3e9646c76cb91d Hugh Dickins       2018-11-30  1528  		set_page_dirty(new_page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1529  		mem_cgroup_commit_charge(new_page, memcg, false, true);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1530  		lru_cache_add_anon(new_page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1531  
3e9646c76cb91d Hugh Dickins       2018-11-30  1532  		/*
3e9646c76cb91d Hugh Dickins       2018-11-30  1533  		 * Remove pte page tables, so we can re-fault the page as huge.
3e9646c76cb91d Hugh Dickins       2018-11-30  1534  		 */
3e9646c76cb91d Hugh Dickins       2018-11-30  1535  		retract_page_tables(mapping, start);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1536  		*hpage = NULL;
87aa752906ecf6 Yang Shi           2018-08-17  1537  
87aa752906ecf6 Yang Shi           2018-08-17  1538  		khugepaged_pages_collapsed++;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1539  	} else {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1540  		/* Something went wrong: rollback changes to the radix-tree */
b93b016313b3ba Matthew Wilcox     2018-04-10  1541  		xa_lock_irq(&mapping->i_pages);
78141aabfbb956 Hugh Dickins       2018-11-30  1542  		mapping->nrpages -= nr_none;
78141aabfbb956 Hugh Dickins       2018-11-30  1543  		shmem_uncharge(mapping->host, nr_none);
78141aabfbb956 Hugh Dickins       2018-11-30  1544  
b93b016313b3ba Matthew Wilcox     2018-04-10  1545  		radix_tree_for_each_slot(slot, &mapping->i_pages, &iter, start) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1546  			if (iter.index >= end)
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1547  				break;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1548  			page = list_first_entry_or_null(&pagelist,
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1549  					struct page, lru);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1550  			if (!page || iter.index < page->index) {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1551  				if (!nr_none)
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1552  					break;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1553  				nr_none--;
59749e6ce53735 Johannes Weiner    2016-12-12  1554  				/* Put holes back where they were */
b93b016313b3ba Matthew Wilcox     2018-04-10  1555  				radix_tree_delete(&mapping->i_pages, iter.index);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1556  				continue;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1557  			}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1558  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1559  			VM_BUG_ON_PAGE(page->index != iter.index, page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1560  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1561  			/* Unfreeze the page. */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1562  			list_del(&page->lru);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1563  			page_ref_unfreeze(page, 2);
b93b016313b3ba Matthew Wilcox     2018-04-10  1564  			radix_tree_replace_slot(&mapping->i_pages, slot, page);
148deab223b237 Matthew Wilcox     2016-12-14  1565  			slot = radix_tree_iter_resume(slot, &iter);
b93b016313b3ba Matthew Wilcox     2018-04-10  1566  			xa_unlock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1567  			unlock_page(page);
3e9646c76cb91d Hugh Dickins       2018-11-30  1568  			putback_lru_page(page);
b93b016313b3ba Matthew Wilcox     2018-04-10  1569  			xa_lock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1570  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1571  		VM_BUG_ON(nr_none);
b93b016313b3ba Matthew Wilcox     2018-04-10  1572  		xa_unlock_irq(&mapping->i_pages);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1573  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1574  		mem_cgroup_cancel_charge(new_page, memcg, true);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1575  		new_page->mapping = NULL;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1576  	}
3e9646c76cb91d Hugh Dickins       2018-11-30  1577  
3e9646c76cb91d Hugh Dickins       2018-11-30  1578  	unlock_page(new_page);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1579  out:
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1580  	VM_BUG_ON(!list_empty(&pagelist));
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1581  	/* TODO: tracepoints */
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1582  }
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1583  

:::::: The code at line 1307 was first introduced by commit
:::::: f3f0e1d2150b2b99da2cbdfaad000089efe9bf30 khugepaged: add support of collapse for tmpfs/shmem pages

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
