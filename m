Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A5C81723
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716371942; cv=none; b=CYyp2rfASZ0I013IgS+A8VpFXTPaJwzv84/+fFV0Ef7dOWukiIoYquLP0zCic6J2gG3SPjJdcBXTMVuF/B64txogWAPhmfaTU9wM9wnGEuC/9Lk3qgbRq4T0Q7TLb5nmBrrKaxlxIJ0sZFzm/7OJMY3HP7m/FEFyLvbijlJeYmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716371942; c=relaxed/simple;
	bh=nr4m4tJmIyeQ/e8EI8kiEKItAPn/iQhwEOdnkvZIe74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tzuqlZr7OLQLIm0Y9PLCWXlkn3jYzrk9kKAMJtZBb3/BvRO3dULI3c79wSZvt6e2rRlkvzLZJKccu/pK9Tqcx08PyXGKoLmWsKfFrabIHOi4W8PnFBJzJ+ok3SbdJGSxqkUKeJtfhU9n209h4mnj+A7k3sxsZHZ6Ja2INBAUdns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROwPydSr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROwPydSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716371940; x=1747907940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nr4m4tJmIyeQ/e8EI8kiEKItAPn/iQhwEOdnkvZIe74=;
  b=ROwPydSrqX9HBkWeF2nXr4iyAADyrMwtXV19h0YxDYjvxa8leud6QE/H
   vjS3kgwbgYIuw6Nv6/tciTV5mAsrISsMXXl0WmBTnYV3EmRVeQJgtVQri
   uPJ1nrqOCqjfCaaIOG3Ws4NB9jMfM0WGJXfLSO+Ue7KV3khAii6PNSOej
   amnPuqFj2TZjCUuXV2Lwb/ym8Nv/iIaJZwUDW4MjWbYzlowEOcRgkLgl3
   1iVAfxne4mZ1/5kdxSTRkRqqu+YU8IYooRjuWMxWy2hoadgApIWlcjR/b
   ozW0u/iGFRg2ccsUYRumcpv+50z5An8m7JzryLJ1/pO939KRIVSOrhpEz
   g==;
X-CSE-ConnectionGUID: G3hJTPXwQ8KdMs/OUoxwBQ==
X-CSE-MsgGUID: 7uJJXnfJTkqL4RiOUEC2mQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16440337"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="16440337"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 02:59:00 -0700
X-CSE-ConnectionGUID: gr1PLuKrSPqgx0fpGvmumA==
X-CSE-MsgGUID: KUJzVDoNQqS0nJDeX41wDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="38188119"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 May 2024 02:58:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9ik3-0001GL-0F;
	Wed, 22 May 2024 09:58:41 +0000
Date: Wed, 22 May 2024 17:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:page_mapcount 3/10] fs/proc/task_mmu.c:1463:22:
 warning: unused variable 'idx'
Message-ID: <202405221712.6XRDPiYK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux page_mapcount
head:   e9e926294eff582c5f6e5a5bf09b223f68c816da
commit: 5ed3f94b31c91afa6228ef79b9b29ac1f813339d [3/10] fs/proc/task_mmu: indicate PM_MMAP_EXCLUSIVE per subpage of PMD-mapped THPs
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240522/202405221712.6XRDPiYK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405221712.6XRDPiYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405221712.6XRDPiYK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/task_mmu.c: In function 'pagemap_pmd_range':
>> fs/proc/task_mmu.c:1463:22: warning: unused variable 'idx' [-Wunused-variable]
    1463 |         unsigned int idx = (addr & ~PMD_MASK) >> PAGE_SHIFT;
         |                      ^~~


vim +/idx +1463 fs/proc/task_mmu.c

  1459	
  1460	static int pagemap_pmd_range(pmd_t *pmdp, unsigned long addr, unsigned long end,
  1461				     struct mm_walk *walk)
  1462	{
> 1463		unsigned int idx = (addr & ~PMD_MASK) >> PAGE_SHIFT;
  1464		struct vm_area_struct *vma = walk->vma;
  1465		struct pagemapread *pm = walk->private;
  1466		spinlock_t *ptl;
  1467		pte_t *pte, *orig_pte;
  1468		int err = 0;
  1469	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  1470	
  1471		ptl = pmd_trans_huge_lock(pmdp, vma);
  1472		if (ptl) {
  1473			u64 flags = 0, frame = 0;
  1474			pmd_t pmd = *pmdp;
  1475			struct page *page = NULL;
  1476	
  1477			if (vma->vm_flags & VM_SOFTDIRTY)
  1478				flags |= PM_SOFT_DIRTY;
  1479	
  1480			if (pmd_present(pmd)) {
  1481				page = pmd_page(pmd);
  1482	
  1483				flags |= PM_PRESENT;
  1484				if (pmd_soft_dirty(pmd))
  1485					flags |= PM_SOFT_DIRTY;
  1486				if (pmd_uffd_wp(pmd))
  1487					flags |= PM_UFFD_WP;
  1488				if (pm->show_pfn)
  1489					frame = pmd_pfn(pmd) + idx;
  1490			}
  1491	#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
  1492			else if (is_swap_pmd(pmd)) {
  1493				swp_entry_t entry = pmd_to_swp_entry(pmd);
  1494				unsigned long offset;
  1495	
  1496				if (pm->show_pfn) {
  1497					if (is_pfn_swap_entry(entry))
  1498						offset = swp_offset_pfn(entry);
  1499					else
  1500						offset = swp_offset(entry);
  1501					offset += idx;
  1502					frame = swp_type(entry) |
  1503						(offset << MAX_SWAPFILES_SHIFT);
  1504				}
  1505				flags |= PM_SWAP;
  1506				if (pmd_swp_soft_dirty(pmd))
  1507					flags |= PM_SOFT_DIRTY;
  1508				if (pmd_swp_uffd_wp(pmd))
  1509					flags |= PM_UFFD_WP;
  1510				VM_BUG_ON(!is_pmd_migration_entry(pmd));
  1511				page = pfn_swap_entry_to_page(entry);
  1512			}
  1513	#endif
  1514	
  1515			if (page && !PageAnon(page))
  1516				flags |= PM_FILE;
  1517	
  1518			for (; addr != end; addr += PAGE_SIZE, idx++) {
  1519				unsigned long cur_flags = flags;
  1520				pagemap_entry_t pme;
  1521	
  1522				if (page && (flags & PM_PRESENT) &&
  1523				    page_mapcount(page + idx) == 1)
  1524					cur_flags |= PM_MMAP_EXCLUSIVE;
  1525	
  1526				pme = make_pme(frame, cur_flags);
  1527				err = add_to_pagemap(&pme, pm);
  1528				if (err)
  1529					break;
  1530				if (pm->show_pfn) {
  1531					if (flags & PM_PRESENT)
  1532						frame++;
  1533					else if (flags & PM_SWAP)
  1534						frame += (1 << MAX_SWAPFILES_SHIFT);
  1535				}
  1536			}
  1537			spin_unlock(ptl);
  1538			return err;
  1539		}
  1540	#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
  1541	
  1542		/*
  1543		 * We can assume that @vma always points to a valid one and @end never
  1544		 * goes beyond vma->vm_end.
  1545		 */
  1546		orig_pte = pte = pte_offset_map_lock(walk->mm, pmdp, addr, &ptl);
  1547		if (!pte) {
  1548			walk->action = ACTION_AGAIN;
  1549			return err;
  1550		}
  1551		for (; addr < end; pte++, addr += PAGE_SIZE) {
  1552			pagemap_entry_t pme;
  1553	
  1554			pme = pte_to_pagemap_entry(pm, vma, addr, ptep_get(pte));
  1555			err = add_to_pagemap(&pme, pm);
  1556			if (err)
  1557				break;
  1558		}
  1559		pte_unmap_unlock(orig_pte, ptl);
  1560	
  1561		cond_resched();
  1562	
  1563		return err;
  1564	}
  1565	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
