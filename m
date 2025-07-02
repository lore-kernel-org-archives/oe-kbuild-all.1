Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAB3F4F1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 00:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751415796; cv=none; b=C76IY2RyIRTirDlPsA27X6YZGN5EQcwJZKnB3+ToZ46204EA7MPmTRZgLsoijswCpar3oRUcp0TMK++rl4VGKeK8d0l/thfDQavrHM83YPBboFkMQQakK6bcIThpj9l9kywoTfC240VHWFNK0ni/RZ0xh3CA284yHtbVjZ286uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751415796; c=relaxed/simple;
	bh=wIj41q+vRPln/VD0jzn+G/3rf/zv9TEI3VCdsJvzTXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jAdnxEKbcAT0X0o4BcRyA6006s1YblwxeB8okXkGo0ludarDdBCOfzXyo6vTqSPJ0MeR1AaNbryDH5So1tPYvEMlNRLAMqrm5lheFXyCAXZ7E2uaDpm2IB9zDmwAEXk+fyW+aQ9O2bOMD6w2r6ili7sc0aRvGSp0KRpWleXyF1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNDzDf93; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNDzDf93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751415794; x=1782951794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wIj41q+vRPln/VD0jzn+G/3rf/zv9TEI3VCdsJvzTXY=;
  b=lNDzDf93CxkBCLrqeb7TVDLRmWA5+MS8c+WqNxyy7GDBI09iv+MaM3gE
   nfAiAzw3YtN7lNzt273l2y25ReLCcojksU2wKPsqlJQO/H7KzLb1F1SRv
   Ryt2gI0mlrIf78NrNp7Wh4YGPEmVGzQgIAdE4SM791WL8aSrdcE0E9h1y
   xGMCzYGQ3EZLYuWmlGBg9OEdUcX9U0m1gEHNTvhIL5PUvrhbJp+/F6nJo
   rHs1CGBI8yexibhqBQStPAelt0l4fibZbRlK9dtUpEcHkR7Z28KOlzaqY
   v67tajA7kGUuFJC24ynZIMid3bEVxYEfkoQRXMVVpSNe3xl3MzhZqMaWG
   A==;
X-CSE-ConnectionGUID: dsC3aePYT3Sr9PwfqH3img==
X-CSE-MsgGUID: FLaxb7TsQHu5dReBdqqoeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79139155"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="79139155"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 17:23:13 -0700
X-CSE-ConnectionGUID: QmGQXC6dScyXdyWnKTefzQ==
X-CSE-MsgGUID: 3N88ZNiiSy2tvSJdoDUmYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="153320887"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 17:23:11 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWlFl-0000BR-0j;
	Wed, 02 Jul 2025 00:23:09 +0000
Date: Wed, 2 Jul 2025 02:23:00 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] mm/khugepaged.c:1646: warning:
 Function parameter or member 'reliable' not described in 'collapse_file'
Message-ID: <202507020242.QTMPao2J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c90dc8f5217147c6c3cfb99d952cfdcaf7e194e1
commit: 6263994761a3d3ad6e5fa3beff9ca8cbd38d3bf3 [2882/2882] mm: thp: Add memory reliable support for hugepaged collapse
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507020242.QTMPao2J-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020242.QTMPao2J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020242.QTMPao2J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/khugepaged.c:102: warning: Function parameter or member 'nr_pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:102: warning: Function parameter or member 'pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:1443: warning: Function parameter or member 'mm' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:1443: warning: Function parameter or member 'addr' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:1646: warning: Function parameter or member 'mm' not described in 'collapse_file'
   mm/khugepaged.c:1646: warning: Function parameter or member 'file' not described in 'collapse_file'
   mm/khugepaged.c:1646: warning: Function parameter or member 'start' not described in 'collapse_file'
   mm/khugepaged.c:1646: warning: Function parameter or member 'hpage' not described in 'collapse_file'
   mm/khugepaged.c:1646: warning: Function parameter or member 'node' not described in 'collapse_file'
>> mm/khugepaged.c:1646: warning: Function parameter or member 'reliable' not described in 'collapse_file'


vim +1646 mm/khugepaged.c

f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1623  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1624  /**
99cb0dbd47a15d Song Liu                2019-09-23  1625   * collapse_file - collapse filemap/tmpfs/shmem pages into huge one.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1626   *
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1627   * Basic scheme is simple, details are more complex:
87c460a0bded56 Hugh Dickins            2018-11-30  1628   *  - allocate and lock a new huge page;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1629   *  - scan page cache replacing old pages with the new one
99cb0dbd47a15d Song Liu                2019-09-23  1630   *    + swap/gup in pages if necessary;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1631   *    + fill in gaps;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1632   *    + keep old pages around in case rollback is required;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1633   *  - if replacing succeeds:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1634   *    + copy data over;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1635   *    + free old pages;
87c460a0bded56 Hugh Dickins            2018-11-30  1636   *    + unlock huge page;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1637   *  - if replacing failed;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1638   *    + put all pages back and unfreeze them;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1639   *    + restore gaps in the page cache;
87c460a0bded56 Hugh Dickins            2018-11-30  1640   *    + unlock and free huge page;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1641   */
579c571e2efdb8 Song Liu                2019-09-23  1642  static void collapse_file(struct mm_struct *mm,
579c571e2efdb8 Song Liu                2019-09-23  1643  		struct file *file, pgoff_t start,
6263994761a3d3 Ma Wupeng               2022-11-11  1644  		struct page **hpage, int node,
6263994761a3d3 Ma Wupeng               2022-11-11  1645  		bool reliable)
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26 @1646  {
579c571e2efdb8 Song Liu                2019-09-23  1647  	struct address_space *mapping = file->f_mapping;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1648  	gfp_t gfp;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1649  	struct page *new_page;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1650  	pgoff_t index, end = start + HPAGE_PMD_NR;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1651  	LIST_HEAD(pagelist);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1652  	XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1653  	int nr_none = 0, result = SCAN_SUCCEED;
99cb0dbd47a15d Song Liu                2019-09-23  1654  	bool is_shmem = shmem_file(file);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1655  
99cb0dbd47a15d Song Liu                2019-09-23  1656  	VM_BUG_ON(!IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) && !is_shmem);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1657  	VM_BUG_ON(start & (HPAGE_PMD_NR - 1));
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1658  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1659  	/* Only allocate from the target node */
41b6167e8f746b Michal Hocko            2017-01-10  1660  	gfp = alloc_hugepage_khugepaged_gfpmask() | __GFP_THISNODE;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1661  
6263994761a3d3 Ma Wupeng               2022-11-11  1662  	if (reliable)
6263994761a3d3 Ma Wupeng               2022-11-11  1663  		gfp |= GFP_RELIABLE;
6263994761a3d3 Ma Wupeng               2022-11-11  1664  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1665  	new_page = khugepaged_alloc_page(hpage, gfp, node);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1666  	if (!new_page) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1667  		result = SCAN_ALLOC_HUGE_PAGE_FAIL;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1668  		goto out;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1669  	}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1670  
d9eb1ea2bf8734 Johannes Weiner         2020-06-03  1671  	if (unlikely(mem_cgroup_charge(new_page, mm, gfp))) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1672  		result = SCAN_CGROUP_CHARGE_FAIL;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1673  		goto out;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1674  	}
9d82c69438d0df Johannes Weiner         2020-06-03  1675  	count_memcg_page_event(new_page, THP_COLLAPSE_ALLOC);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1676  
95feeabb77149f Hugh Dickins            2018-11-30  1677  	/* This will be less messy when we use multi-index entries */
95feeabb77149f Hugh Dickins            2018-11-30  1678  	do {
95feeabb77149f Hugh Dickins            2018-11-30  1679  		xas_lock_irq(&xas);
95feeabb77149f Hugh Dickins            2018-11-30  1680  		xas_create_range(&xas);
95feeabb77149f Hugh Dickins            2018-11-30  1681  		if (!xas_error(&xas))
95feeabb77149f Hugh Dickins            2018-11-30  1682  			break;
95feeabb77149f Hugh Dickins            2018-11-30  1683  		xas_unlock_irq(&xas);
95feeabb77149f Hugh Dickins            2018-11-30  1684  		if (!xas_nomem(&xas, GFP_KERNEL)) {
95feeabb77149f Hugh Dickins            2018-11-30  1685  			result = SCAN_FAIL;
95feeabb77149f Hugh Dickins            2018-11-30  1686  			goto out;
95feeabb77149f Hugh Dickins            2018-11-30  1687  		}
95feeabb77149f Hugh Dickins            2018-11-30  1688  	} while (1);
95feeabb77149f Hugh Dickins            2018-11-30  1689  
042a30824871fa Hugh Dickins            2018-11-30  1690  	__SetPageLocked(new_page);
99cb0dbd47a15d Song Liu                2019-09-23  1691  	if (is_shmem)
042a30824871fa Hugh Dickins            2018-11-30  1692  		__SetPageSwapBacked(new_page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1693  	new_page->index = start;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1694  	new_page->mapping = mapping;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1695  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1696  	/*
87c460a0bded56 Hugh Dickins            2018-11-30  1697  	 * At this point the new_page is locked and not up-to-date.
87c460a0bded56 Hugh Dickins            2018-11-30  1698  	 * It's safe to insert it into the page cache, because nobody would
87c460a0bded56 Hugh Dickins            2018-11-30  1699  	 * be able to map it or use it in another way until we unlock it.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1700  	 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1701  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1702  	xas_set(&xas, start);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1703  	for (index = start; index < end; index++) {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1704  		struct page *page = xas_next(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1705  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1706  		VM_BUG_ON(index != xas.xa_index);
99cb0dbd47a15d Song Liu                2019-09-23  1707  		if (is_shmem) {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1708  			if (!page) {
701270fa193aad Hugh Dickins            2018-11-30  1709  				/*
99cb0dbd47a15d Song Liu                2019-09-23  1710  				 * Stop if extent has been truncated or
99cb0dbd47a15d Song Liu                2019-09-23  1711  				 * hole-punched, and is now completely
99cb0dbd47a15d Song Liu                2019-09-23  1712  				 * empty.
701270fa193aad Hugh Dickins            2018-11-30  1713  				 */
701270fa193aad Hugh Dickins            2018-11-30  1714  				if (index == start) {
701270fa193aad Hugh Dickins            2018-11-30  1715  					if (!xas_next_entry(&xas, end - 1)) {
701270fa193aad Hugh Dickins            2018-11-30  1716  						result = SCAN_TRUNCATED;
042a30824871fa Hugh Dickins            2018-11-30  1717  						goto xa_locked;
701270fa193aad Hugh Dickins            2018-11-30  1718  					}
701270fa193aad Hugh Dickins            2018-11-30  1719  					xas_set(&xas, index);
701270fa193aad Hugh Dickins            2018-11-30  1720  				}
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1721  				if (!shmem_charge(mapping->host, 1)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1722  					result = SCAN_FAIL;
042a30824871fa Hugh Dickins            2018-11-30  1723  					goto xa_locked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1724  				}
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  1725) 				xas_store(&xas, new_page);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1726  				nr_none++;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1727  				continue;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1728  			}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1729  
3159f943aafdba Matthew Wilcox          2017-11-03  1730  			if (xa_is_value(page) || !PageUptodate(page)) {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1731  				xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1732  				/* swap in or instantiate fallocated page */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1733  				if (shmem_getpage(mapping->host, index, &page,
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1734  						  SGP_NOHUGE)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1735  					result = SCAN_FAIL;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1736  					goto xa_unlocked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1737  				}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1738  			} else if (trylock_page(page)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1739  				get_page(page);
042a30824871fa Hugh Dickins            2018-11-30  1740  				xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1741  			} else {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1742  				result = SCAN_PAGE_LOCK;
042a30824871fa Hugh Dickins            2018-11-30  1743  				goto xa_locked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1744  			}
99cb0dbd47a15d Song Liu                2019-09-23  1745  		} else {	/* !is_shmem */
99cb0dbd47a15d Song Liu                2019-09-23  1746  			if (!page || xa_is_value(page)) {
99cb0dbd47a15d Song Liu                2019-09-23  1747  				xas_unlock_irq(&xas);
99cb0dbd47a15d Song Liu                2019-09-23  1748  				page_cache_sync_readahead(mapping, &file->f_ra,
99cb0dbd47a15d Song Liu                2019-09-23  1749  							  file, index,
e5a59d308f52bb David Howells           2020-09-04  1750  							  end - index);
99cb0dbd47a15d Song Liu                2019-09-23  1751  				/* drain pagevecs to help isolate_lru_page() */
99cb0dbd47a15d Song Liu                2019-09-23  1752  				lru_add_drain();
99cb0dbd47a15d Song Liu                2019-09-23  1753  				page = find_lock_page(mapping, index);
99cb0dbd47a15d Song Liu                2019-09-23  1754  				if (unlikely(page == NULL)) {
99cb0dbd47a15d Song Liu                2019-09-23  1755  					result = SCAN_FAIL;
99cb0dbd47a15d Song Liu                2019-09-23  1756  					goto xa_unlocked;
99cb0dbd47a15d Song Liu                2019-09-23  1757  				}
75f360696ce9d8 Song Liu                2019-11-30  1758  			} else if (PageDirty(page)) {
75f360696ce9d8 Song Liu                2019-11-30  1759  				/*
75f360696ce9d8 Song Liu                2019-11-30  1760  				 * khugepaged only works on read-only fd,
75f360696ce9d8 Song Liu                2019-11-30  1761  				 * so this page is dirty because it hasn't
75f360696ce9d8 Song Liu                2019-11-30  1762  				 * been flushed since first write. There
75f360696ce9d8 Song Liu                2019-11-30  1763  				 * won't be new dirty pages.
75f360696ce9d8 Song Liu                2019-11-30  1764  				 *
75f360696ce9d8 Song Liu                2019-11-30  1765  				 * Trigger async flush here and hope the
75f360696ce9d8 Song Liu                2019-11-30  1766  				 * writeback is done when khugepaged
75f360696ce9d8 Song Liu                2019-11-30  1767  				 * revisits this page.
75f360696ce9d8 Song Liu                2019-11-30  1768  				 *
75f360696ce9d8 Song Liu                2019-11-30  1769  				 * This is a one-off situation. We are not
75f360696ce9d8 Song Liu                2019-11-30  1770  				 * forcing writeback in loop.
75f360696ce9d8 Song Liu                2019-11-30  1771  				 */
75f360696ce9d8 Song Liu                2019-11-30  1772  				xas_unlock_irq(&xas);
75f360696ce9d8 Song Liu                2019-11-30  1773  				filemap_flush(mapping);
75f360696ce9d8 Song Liu                2019-11-30  1774  				result = SCAN_FAIL;
75f360696ce9d8 Song Liu                2019-11-30  1775  				goto xa_unlocked;
ca1ab8b4a53297 Rongwei Wang            2021-11-15  1776  			} else if (PageWriteback(page)) {
ca1ab8b4a53297 Rongwei Wang            2021-11-15  1777  				xas_unlock_irq(&xas);
ca1ab8b4a53297 Rongwei Wang            2021-11-15  1778  				result = SCAN_FAIL;
ca1ab8b4a53297 Rongwei Wang            2021-11-15  1779  				goto xa_unlocked;
99cb0dbd47a15d Song Liu                2019-09-23  1780  			} else if (trylock_page(page)) {
99cb0dbd47a15d Song Liu                2019-09-23  1781  				get_page(page);
99cb0dbd47a15d Song Liu                2019-09-23  1782  				xas_unlock_irq(&xas);
99cb0dbd47a15d Song Liu                2019-09-23  1783  			} else {
99cb0dbd47a15d Song Liu                2019-09-23  1784  				result = SCAN_PAGE_LOCK;
99cb0dbd47a15d Song Liu                2019-09-23  1785  				goto xa_locked;
99cb0dbd47a15d Song Liu                2019-09-23  1786  			}
99cb0dbd47a15d Song Liu                2019-09-23  1787  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1788  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1789  		/*
b93b016313b3ba Matthew Wilcox          2018-04-10  1790  		 * The page must be locked, so we can drop the i_pages lock
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1791  		 * without racing with truncate.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1792  		 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1793  		VM_BUG_ON_PAGE(!PageLocked(page), page);
4655e5e5f38726 Song Liu                2019-11-15  1794  
4655e5e5f38726 Song Liu                2019-11-15  1795  		/* make sure the page is up to date */
4655e5e5f38726 Song Liu                2019-11-15  1796  		if (unlikely(!PageUptodate(page))) {
4655e5e5f38726 Song Liu                2019-11-15  1797  			result = SCAN_FAIL;
4655e5e5f38726 Song Liu                2019-11-15  1798  			goto out_unlock;
4655e5e5f38726 Song Liu                2019-11-15  1799  		}
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1800  
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1801  		/*
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1802  		 * If file was truncated then extended, or hole-punched, before
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1803  		 * we locked the first page, then a THP might be there already.
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1804  		 */
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1805  		if (PageTransCompound(page)) {
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1806  			result = SCAN_PAGE_COMPOUND;
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1807  			goto out_unlock;
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1808  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1809  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1810  		if (page_mapping(page) != mapping) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1811  			result = SCAN_TRUNCATED;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1812  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1813  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1814  
ca1ab8b4a53297 Rongwei Wang            2021-11-15  1815  		if (!is_shmem && (PageDirty(page) ||
ca1ab8b4a53297 Rongwei Wang            2021-11-15  1816  				  PageWriteback(page))) {
4655e5e5f38726 Song Liu                2019-11-15  1817  			/*
4655e5e5f38726 Song Liu                2019-11-15  1818  			 * khugepaged only works on read-only fd, so this
4655e5e5f38726 Song Liu                2019-11-15  1819  			 * page is dirty because it hasn't been flushed
4655e5e5f38726 Song Liu                2019-11-15  1820  			 * since first write.
4655e5e5f38726 Song Liu                2019-11-15  1821  			 */
4655e5e5f38726 Song Liu                2019-11-15  1822  			result = SCAN_FAIL;
4655e5e5f38726 Song Liu                2019-11-15  1823  			goto out_unlock;
4655e5e5f38726 Song Liu                2019-11-15  1824  		}
4655e5e5f38726 Song Liu                2019-11-15  1825  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1826  		if (isolate_lru_page(page)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1827  			result = SCAN_DEL_PAGE_LRU;
042a30824871fa Hugh Dickins            2018-11-30  1828  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1829  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1830  
99cb0dbd47a15d Song Liu                2019-09-23  1831  		if (page_has_private(page) &&
99cb0dbd47a15d Song Liu                2019-09-23  1832  		    !try_to_release_page(page, GFP_KERNEL)) {
99cb0dbd47a15d Song Liu                2019-09-23  1833  			result = SCAN_PAGE_HAS_PRIVATE;
2f33a706027c94 Hugh Dickins            2020-05-27  1834  			putback_lru_page(page);
99cb0dbd47a15d Song Liu                2019-09-23  1835  			goto out_unlock;
99cb0dbd47a15d Song Liu                2019-09-23  1836  		}
99cb0dbd47a15d Song Liu                2019-09-23  1837  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1838  		if (page_mapped(page))
977fbdcd5986c9 Matthew Wilcox          2018-01-31  1839  			unmap_mapping_pages(mapping, index, 1, false);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1840  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1841  		xas_lock_irq(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1842  		xas_set(&xas, index);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1843  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1844  		VM_BUG_ON_PAGE(page != xas_load(&xas), page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1845  		VM_BUG_ON_PAGE(page_mapped(page), page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1846  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1847  		/*
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1848  		 * The page is expected to have page_count() == 3:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1849  		 *  - we hold a pin on it;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1850  		 *  - one reference from page cache;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1851  		 *  - one from isolate_lru_page;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1852  		 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1853  		if (!page_ref_freeze(page, 3)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1854  			result = SCAN_PAGE_COUNT;
042a30824871fa Hugh Dickins            2018-11-30  1855  			xas_unlock_irq(&xas);
042a30824871fa Hugh Dickins            2018-11-30  1856  			putback_lru_page(page);
042a30824871fa Hugh Dickins            2018-11-30  1857  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1858  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1859  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1860  		/*
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1861  		 * Add the page to the list to be able to undo the collapse if
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1862  		 * something go wrong.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1863  		 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1864  		list_add_tail(&page->lru, &pagelist);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1865  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1866  		/* Finally, replace with the new page. */
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  1867) 		xas_store(&xas, new_page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1868  		continue;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1869  out_unlock:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1870  		unlock_page(page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1871  		put_page(page);
042a30824871fa Hugh Dickins            2018-11-30  1872  		goto xa_unlocked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1873  	}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1874  
99cb0dbd47a15d Song Liu                2019-09-23  1875  	if (is_shmem)
042a30824871fa Hugh Dickins            2018-11-30  1876  		__inc_node_page_state(new_page, NR_SHMEM_THPS);
09d91cda0e8207 Song Liu                2019-09-23  1877  	else {
99cb0dbd47a15d Song Liu                2019-09-23  1878  		__inc_node_page_state(new_page, NR_FILE_THPS);
09d91cda0e8207 Song Liu                2019-09-23  1879  		filemap_nr_thps_inc(mapping);
09d91cda0e8207 Song Liu                2019-09-23  1880  	}
99cb0dbd47a15d Song Liu                2019-09-23  1881  
042a30824871fa Hugh Dickins            2018-11-30  1882  	if (nr_none) {
9d82c69438d0df Johannes Weiner         2020-06-03  1883  		__mod_lruvec_page_state(new_page, NR_FILE_PAGES, nr_none);
99cb0dbd47a15d Song Liu                2019-09-23  1884  		if (is_shmem)
9d82c69438d0df Johannes Weiner         2020-06-03  1885  			__mod_lruvec_page_state(new_page, NR_SHMEM, nr_none);
042a30824871fa Hugh Dickins            2018-11-30  1886  	}
042a30824871fa Hugh Dickins            2018-11-30  1887  
042a30824871fa Hugh Dickins            2018-11-30  1888  xa_locked:
042a30824871fa Hugh Dickins            2018-11-30  1889  	xas_unlock_irq(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1890  xa_unlocked:
042a30824871fa Hugh Dickins            2018-11-30  1891  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1892  	if (result == SCAN_SUCCEED) {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1893  		struct page *page, *tmp;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1894  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1895  		/*
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1896  		 * Replacing old pages with new one has succeeded, now we
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1897  		 * need to copy the content and free the old pages.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1898  		 */
2af8ff291848cc Hugh Dickins            2018-11-30  1899  		index = start;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1900  		list_for_each_entry_safe(page, tmp, &pagelist, lru) {
2af8ff291848cc Hugh Dickins            2018-11-30  1901  			while (index < page->index) {
2af8ff291848cc Hugh Dickins            2018-11-30  1902  				clear_highpage(new_page + (index % HPAGE_PMD_NR));
2af8ff291848cc Hugh Dickins            2018-11-30  1903  				index++;
2af8ff291848cc Hugh Dickins            2018-11-30  1904  			}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1905  			copy_highpage(new_page + (page->index % HPAGE_PMD_NR),
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1906  					page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1907  			list_del(&page->lru);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1908  			page->mapping = NULL;
042a30824871fa Hugh Dickins            2018-11-30  1909  			page_ref_unfreeze(page, 1);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1910  			ClearPageActive(page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1911  			ClearPageUnevictable(page);
042a30824871fa Hugh Dickins            2018-11-30  1912  			unlock_page(page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1913  			put_page(page);
2af8ff291848cc Hugh Dickins            2018-11-30  1914  			index++;
2af8ff291848cc Hugh Dickins            2018-11-30  1915  		}
2af8ff291848cc Hugh Dickins            2018-11-30  1916  		while (index < end) {
2af8ff291848cc Hugh Dickins            2018-11-30  1917  			clear_highpage(new_page + (index % HPAGE_PMD_NR));
2af8ff291848cc Hugh Dickins            2018-11-30  1918  			index++;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1919  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1920  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1921  		SetPageUptodate(new_page);
87c460a0bded56 Hugh Dickins            2018-11-30  1922  		page_ref_add(new_page, HPAGE_PMD_NR - 1);
6058eaec816f29 Johannes Weiner         2020-06-03  1923  		if (is_shmem)
99cb0dbd47a15d Song Liu                2019-09-23  1924  			set_page_dirty(new_page);
6058eaec816f29 Johannes Weiner         2020-06-03  1925  		lru_cache_add(new_page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1926  
042a30824871fa Hugh Dickins            2018-11-30  1927  		/*
042a30824871fa Hugh Dickins            2018-11-30  1928  		 * Remove pte page tables, so we can re-fault the page as huge.
042a30824871fa Hugh Dickins            2018-11-30  1929  		 */
042a30824871fa Hugh Dickins            2018-11-30  1930  		retract_page_tables(mapping, start);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1931  		*hpage = NULL;
87aa752906ecf6 Yang Shi                2018-08-17  1932  
87aa752906ecf6 Yang Shi                2018-08-17  1933  		khugepaged_pages_collapsed++;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1934  	} else {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1935  		struct page *page;
aaa52e340073b7 Hugh Dickins            2018-11-30  1936  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1937  		/* Something went wrong: roll back page cache changes */
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1938  		xas_lock_irq(&xas);
aaa52e340073b7 Hugh Dickins            2018-11-30  1939  		mapping->nrpages -= nr_none;
99cb0dbd47a15d Song Liu                2019-09-23  1940  
99cb0dbd47a15d Song Liu                2019-09-23  1941  		if (is_shmem)
aaa52e340073b7 Hugh Dickins            2018-11-30  1942  			shmem_uncharge(mapping->host, nr_none);
aaa52e340073b7 Hugh Dickins            2018-11-30  1943  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1944  		xas_set(&xas, start);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1945  		xas_for_each(&xas, page, end - 1) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1946  			page = list_first_entry_or_null(&pagelist,
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1947  					struct page, lru);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1948  			if (!page || xas.xa_index < page->index) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1949  				if (!nr_none)
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1950  					break;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1951  				nr_none--;
59749e6ce53735 Johannes Weiner         2016-12-12  1952  				/* Put holes back where they were */
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1953  				xas_store(&xas, NULL);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1954  				continue;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1955  			}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1956  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1957  			VM_BUG_ON_PAGE(page->index != xas.xa_index, page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1958  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1959  			/* Unfreeze the page. */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1960  			list_del(&page->lru);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1961  			page_ref_unfreeze(page, 2);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1962  			xas_store(&xas, page);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1963  			xas_pause(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1964  			xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1965  			unlock_page(page);
042a30824871fa Hugh Dickins            2018-11-30  1966  			putback_lru_page(page);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1967  			xas_lock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1968  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1969  		VM_BUG_ON(nr_none);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1970  		xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1971  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1972  		new_page->mapping = NULL;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1973  	}
042a30824871fa Hugh Dickins            2018-11-30  1974  
042a30824871fa Hugh Dickins            2018-11-30  1975  	unlock_page(new_page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1976  out:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1977  	VM_BUG_ON(!list_empty(&pagelist));
9d82c69438d0df Johannes Weiner         2020-06-03  1978  	if (!IS_ERR_OR_NULL(*hpage))
9d82c69438d0df Johannes Weiner         2020-06-03  1979  		mem_cgroup_uncharge(*hpage);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1980  	/* TODO: tracepoints */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1981  }
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1982  

:::::: The code at line 1646 was first introduced by commit
:::::: f3f0e1d2150b2b99da2cbdfaad000089efe9bf30 khugepaged: add support of collapse for tmpfs/shmem pages

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
