Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A5B372
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721495558; cv=none; b=Cml7mRHPFwZQGm5niUOSnGSyLXZOwQAh16yQ8WKVlsIauQ1YMIdZbrdk00d+IbBUBelNFsHE96x7hadSo2UXHFSu76tQrnrSYR6mX7NSUG7jMzeTi/c5I0GElh3BAQwp58UZdYCP1+v6/gqwy69ZUkFOAJQHukPwm5bGZfwTbOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721495558; c=relaxed/simple;
	bh=U0/zcU0kycVCEsI5WZHjokWOaVzRs3MBbLs6/SB3KD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZzF13ErENB/DbwSW2ZK4lvFg/9WlhfOnZdxtkKeprKBXQQfDYP7GCL0O+AuVWdq2AUsP13Oifuoi9W9f8FVkDXQBT9SgfnusMehXOaqUqz3bFUV/r9/iJlbg9miRNqd14yyueYOQDLzHurEh82a/O3l4TpYdxrIXX5rumVD8WUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIuTG3z/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIuTG3z/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721495556; x=1753031556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U0/zcU0kycVCEsI5WZHjokWOaVzRs3MBbLs6/SB3KD4=;
  b=aIuTG3z/bZ4v0fpTIT24kAYKc64npOmNudv6PVJs4QJ2gguYfGwfyu9p
   cgUfNG2PEac7VolxjVB8Jm92vDkH/IjYh8WiZhTXGrHzFmckrhYOsEwi+
   4+da/rdQaueh0omd8BeQ9qHk0praukctO/V7umG3ucSp0bE31n5aK/H2O
   Nzxhs3oS+yMewlVT1ZpLe6+cerF4nXELtO3aqY/w7tCD89IYb0EE6Q0Ri
   IS/d+QlB3UTXPWTdRYBYNiX5T5zOxBeIKftpmmJ97vRDg2QilaRMUkLZ+
   4eBzGbUqvJ9+YLsFxADPMRf5kEah7o1yFq/pRWCdc/9CNN9QMgYt1oC+a
   w==;
X-CSE-ConnectionGUID: P5gSmXQrSWSwcP40qG2gQQ==
X-CSE-MsgGUID: YYqcSzL1T4euDasnkEtNxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="22971691"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="22971691"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 10:12:36 -0700
X-CSE-ConnectionGUID: 5QbFZCMuSZO+nRaGGfxivw==
X-CSE-MsgGUID: j048GYCzQEiwmYXgIRVvFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="55970718"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jul 2024 10:12:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVDdI-000jSb-2H;
	Sat, 20 Jul 2024 17:12:32 +0000
Date: Sun, 21 Jul 2024 01:12:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 40/42] mm/khugepaged.c:1667:28: warning:
 passing argument 2 of 'pte_free_defer' makes pointer from integer without a
 cast
Message-ID: <202407210109.PIqMtZUD-lkp@intel.com>
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
commit: 5977eb978554280c83da90a90ef2916b90b65a5f [40/42] mm/pgtable: pass ptdesc in pte_free_defer()
config: i386-buildonly-randconfig-006-20240720 (https://download.01.org/0day-ci/archive/20240721/202407210109.PIqMtZUD-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407210109.PIqMtZUD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407210109.PIqMtZUD-lkp@intel.com/

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
   mm/khugepaged.c: In function 'collapse_pte_mapped_thp':
>> mm/khugepaged.c:1667:28: warning: passing argument 2 of 'pte_free_defer' makes pointer from integer without a cast [-Wint-conversion]
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
   mm/khugepaged.c:1771:44: warning: passing argument 2 of 'pte_free_defer' makes pointer from integer without a cast [-Wint-conversion]
    1771 |                         pte_free_defer(mm, pmd_ptdesc(&pgt_pmd));
         |                                            ^~~~~~~~~~~~~~~~~~~~
         |                                            |
         |                                            int
   In file included from include/linux/mm.h:30,
                    from mm/khugepaged.c:4:
   include/linux/pgtable.h:119:58: note: expected 'struct ptdesc *' but argument is of type 'int'
     119 | void pte_free_defer(struct mm_struct *mm, struct ptdesc *ptdesc);
         |                                           ~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +/pte_free_defer +1667 mm/khugepaged.c

  1475	
  1476	/**
  1477	 * collapse_pte_mapped_thp - Try to collapse a pte-mapped THP for mm at
  1478	 * address haddr.
  1479	 *
  1480	 * @mm: process address space where collapse happens
  1481	 * @addr: THP collapse address
  1482	 * @install_pmd: If a huge PMD should be installed
  1483	 *
  1484	 * This function checks whether all the PTEs in the PMD are pointing to the
  1485	 * right THP. If so, retract the page table so the THP can refault in with
  1486	 * as pmd-mapped. Possibly install a huge PMD mapping the THP.
  1487	 */
  1488	int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
  1489				    bool install_pmd)
  1490	{
  1491		struct mmu_notifier_range range;
  1492		bool notified = false;
  1493		unsigned long haddr = addr & HPAGE_PMD_MASK;
  1494		struct vm_area_struct *vma = vma_lookup(mm, haddr);
  1495		struct folio *folio;
  1496		pte_t *start_pte, *pte;
  1497		pmd_t *pmd, pgt_pmd;
  1498		spinlock_t *pml = NULL, *ptl;
  1499		int nr_ptes = 0, result = SCAN_FAIL;
  1500		int i;
  1501	
  1502		mmap_assert_locked(mm);
  1503	
  1504		/* First check VMA found, in case page tables are being torn down */
  1505		if (!vma || !vma->vm_file ||
  1506		    !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
  1507			return SCAN_VMA_CHECK;
  1508	
  1509		/* Fast check before locking page if already PMD-mapped */
  1510		result = find_pmd_or_thp_or_none(mm, haddr, &pmd);
  1511		if (result == SCAN_PMD_MAPPED)
  1512			return result;
  1513	
  1514		/*
  1515		 * If we are here, we've succeeded in replacing all the native pages
  1516		 * in the page cache with a single hugepage. If a mm were to fault-in
  1517		 * this memory (mapped by a suitably aligned VMA), we'd get the hugepage
  1518		 * and map it by a PMD, regardless of sysfs THP settings. As such, let's
  1519		 * analogously elide sysfs THP settings here.
  1520		 */
  1521		if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
  1522			return SCAN_VMA_CHECK;
  1523	
  1524		/* Keep pmd pgtable for uffd-wp; see comment in retract_page_tables() */
  1525		if (userfaultfd_wp(vma))
  1526			return SCAN_PTE_UFFD_WP;
  1527	
  1528		folio = filemap_lock_folio(vma->vm_file->f_mapping,
  1529				       linear_page_index(vma, haddr));
  1530		if (IS_ERR(folio))
  1531			return SCAN_PAGE_NULL;
  1532	
  1533		if (folio_order(folio) != HPAGE_PMD_ORDER) {
  1534			result = SCAN_PAGE_COMPOUND;
  1535			goto drop_folio;
  1536		}
  1537	
  1538		result = find_pmd_or_thp_or_none(mm, haddr, &pmd);
  1539		switch (result) {
  1540		case SCAN_SUCCEED:
  1541			break;
  1542		case SCAN_PMD_NONE:
  1543			/*
  1544			 * All pte entries have been removed and pmd cleared.
  1545			 * Skip all the pte checks and just update the pmd mapping.
  1546			 */
  1547			goto maybe_install_pmd;
  1548		default:
  1549			goto drop_folio;
  1550		}
  1551	
  1552		result = SCAN_FAIL;
  1553		start_pte = pte_offset_map_lock(mm, pmd, haddr, &ptl);
  1554		if (!start_pte)		/* mmap_lock + page lock should prevent this */
  1555			goto drop_folio;
  1556	
  1557		/* step 1: check all mapped PTEs are to the right huge page */
  1558		for (i = 0, addr = haddr, pte = start_pte;
  1559		     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
  1560			struct page *page;
  1561			pte_t ptent = ptep_get(pte);
  1562	
  1563			/* empty pte, skip */
  1564			if (pte_none(ptent))
  1565				continue;
  1566	
  1567			/* page swapped out, abort */
  1568			if (!pte_present(ptent)) {
  1569				result = SCAN_PTE_NON_PRESENT;
  1570				goto abort;
  1571			}
  1572	
  1573			page = vm_normal_page(vma, addr, ptent);
  1574			if (WARN_ON_ONCE(page && is_zone_device_page(page)))
  1575				page = NULL;
  1576			/*
  1577			 * Note that uprobe, debugger, or MAP_PRIVATE may change the
  1578			 * page table, but the new page will not be a subpage of hpage.
  1579			 */
  1580			if (folio_page(folio, i) != page)
  1581				goto abort;
  1582		}
  1583	
  1584		pte_unmap_unlock(start_pte, ptl);
  1585		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm,
  1586					haddr, haddr + HPAGE_PMD_SIZE);
  1587		mmu_notifier_invalidate_range_start(&range);
  1588		notified = true;
  1589	
  1590		/*
  1591		 * pmd_lock covers a wider range than ptl, and (if split from mm's
  1592		 * page_table_lock) ptl nests inside pml. The less time we hold pml,
  1593		 * the better; but userfaultfd's mfill_atomic_pte() on a private VMA
  1594		 * inserts a valid as-if-COWed PTE without even looking up page cache.
  1595		 * So page lock of folio does not protect from it, so we must not drop
  1596		 * ptl before pgt_pmd is removed, so uffd private needs pml taken now.
  1597		 */
  1598		if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
  1599			pml = pmd_lock(mm, pmd);
  1600	
  1601		start_pte = pte_offset_map_nolock(mm, pmd, haddr, &ptl);
  1602		if (!start_pte)		/* mmap_lock + page lock should prevent this */
  1603			goto abort;
  1604		if (!pml)
  1605			spin_lock(ptl);
  1606		else if (ptl != pml)
  1607			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
  1608	
  1609		/* step 2: clear page table and adjust rmap */
  1610		for (i = 0, addr = haddr, pte = start_pte;
  1611		     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
  1612			struct page *page;
  1613			pte_t ptent = ptep_get(pte);
  1614	
  1615			if (pte_none(ptent))
  1616				continue;
  1617			/*
  1618			 * We dropped ptl after the first scan, to do the mmu_notifier:
  1619			 * page lock stops more PTEs of the folio being faulted in, but
  1620			 * does not stop write faults COWing anon copies from existing
  1621			 * PTEs; and does not stop those being swapped out or migrated.
  1622			 */
  1623			if (!pte_present(ptent)) {
  1624				result = SCAN_PTE_NON_PRESENT;
  1625				goto abort;
  1626			}
  1627			page = vm_normal_page(vma, addr, ptent);
  1628			if (folio_page(folio, i) != page)
  1629				goto abort;
  1630	
  1631			/*
  1632			 * Must clear entry, or a racing truncate may re-remove it.
  1633			 * TLB flush can be left until pmdp_collapse_flush() does it.
  1634			 * PTE dirty? Shmem page is already dirty; file is read-only.
  1635			 */
  1636			ptep_clear(mm, addr, pte);
  1637			folio_remove_rmap_pte(folio, page, vma);
  1638			nr_ptes++;
  1639		}
  1640	
  1641		pte_unmap(start_pte);
  1642		if (!pml)
  1643			spin_unlock(ptl);
  1644	
  1645		/* step 3: set proper refcount and mm_counters. */
  1646		if (nr_ptes) {
  1647			folio_ref_sub(folio, nr_ptes);
  1648			add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
  1649		}
  1650	
  1651		/* step 4: remove empty page table */
  1652		if (!pml) {
  1653			pml = pmd_lock(mm, pmd);
  1654			if (ptl != pml)
  1655				spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
  1656		}
  1657		pgt_pmd = pmdp_collapse_flush(vma, haddr, pmd);
  1658		pmdp_get_lockless_sync();
  1659		if (ptl != pml)
  1660			spin_unlock(ptl);
  1661		spin_unlock(pml);
  1662	
  1663		mmu_notifier_invalidate_range_end(&range);
  1664	
  1665		mm_dec_nr_ptes(mm);
  1666		page_table_check_pte_clear_range(mm, haddr, pgt_pmd);
> 1667		pte_free_defer(mm, pmd_ptdesc(&pgt_pmd));
  1668	
  1669	maybe_install_pmd:
  1670		/* step 5: install pmd entry */
  1671		result = install_pmd
  1672				? set_huge_pmd(vma, haddr, pmd, &folio->page)
  1673				: SCAN_SUCCEED;
  1674		goto drop_folio;
  1675	abort:
  1676		if (nr_ptes) {
  1677			flush_tlb_mm(mm);
  1678			folio_ref_sub(folio, nr_ptes);
  1679			add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
  1680		}
  1681		if (start_pte)
  1682			pte_unmap_unlock(start_pte, ptl);
  1683		if (pml && pml != ptl)
  1684			spin_unlock(pml);
  1685		if (notified)
  1686			mmu_notifier_invalidate_range_end(&range);
  1687	drop_folio:
  1688		folio_unlock(folio);
  1689		folio_put(folio);
  1690		return result;
  1691	}
  1692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
