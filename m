Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15D13D9DAC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 23:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593106; cv=none; b=CHm2p2nDSGpIy6WwrZPXy2Of3nyCtBaFeKOhVZBDqEG3bwr3hmyQK1Flqk8l4LncWU3KFGSB7RCQIxm3dexBg2zkka34VSmo8syMjsijuVUgljE/JxCgud4evx3VLhE3sa/zjSs4frUK8clTHd3ZpqTf0BLDUWKe5ysrcymeswM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593106; c=relaxed/simple;
	bh=p7d8s+P2BiYhDv2jVvbOJ4v6vhoKVxAWhnxgcFTF1Ss=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QER2CWH0A/3orChcUoYaMEJV1rEwdHAB15M4V5nPjqOtFTPIylQ+vFybbYndA/4gjgXfhwsotnQjZWaRgPelrBHwHxYZQV7SzL9MmRtXUn3ukFxMaUm8q9cAV7uen+clIlbN6JhelxIMg1JMfgDi9A3Wp2XCojwQbYi5kcBP290=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GoznIBsm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GoznIBsm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777593104; x=1809129104;
  h=date:from:to:cc:subject:message-id;
  bh=p7d8s+P2BiYhDv2jVvbOJ4v6vhoKVxAWhnxgcFTF1Ss=;
  b=GoznIBsmZHBs2/au/7J04ugAxM7ITFYUNCQzUIqma06H9lSivO3DtjHY
   bhGzBEkwbZjLpszXXZMFD1nq+sLyblVf+2Tp7Dy7Adpho0AcSZuC8+gNM
   Uf6+ASFS1HKZJE8UthqH1jFpWF935v/zhj0XBvwY7W6YBTBOcnl9y7bT3
   8lcOaVmKe2WuDgj83rjYperBwXl7QqOLBFND5d/AqLqgwWxEm38BU+50U
   cTkk+tUhuBhLAUtgFJHV6d5EoVvIKymP3IzN6JRLkrI58WfZ/sLLsS8DM
   kVzAt4xdfGhUA8WIRWGFHkCsCqRsGH0OYeF4F5fOhs/dnioHVeyScB43T
   w==;
X-CSE-ConnectionGUID: y9alvDcURd65Wg+XiGec3g==
X-CSE-MsgGUID: V+0ph1IySbyD4BhGV6F5WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="101227629"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="101227629"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 16:51:44 -0700
X-CSE-ConnectionGUID: 8xCR8zgeQYGd9Qbd30tB0g==
X-CSE-MsgGUID: gsAW4fwdSyKMTBbX6lJWqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="230377609"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 30 Apr 2026 16:51:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIbAS-000000004vV-03Il;
	Thu, 30 Apr 2026 23:51:40 +0000
Date: Fri, 01 May 2026 01:51:31 +0200
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/huge_memory.c:1955:31: error: incompatible types when
 assigning to type 'pmd_t' from type 'int'
Message-ID: <202605010106.uGZeTjBw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-add-softleaf_to_pmd-and-convert-existing-callers/20260430-233124
head:   62010337c75b14016955c092466110e39a5ee1a0
commit: a99c093cd5fcb79435fff99eb172227f89676ba0 mm: handle PMD swap entries in fork path
date:   8 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260501/202605010106.uGZeTjBw-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010106.uGZeTjBw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605010106.uGZeTjBw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/userfaultfd_k.h:19,
                    from ./include/linux/hugetlb.h:16,
                    from mm/huge_memory.c:13:
   ./include/linux/leafops.h: In function 'softleaf_from_pmd':
   ./include/linux/leafops.h:105:13: error: implicit declaration of function 'pmd_swp_exclusive'; did you mean 'pte_swp_exclusive'? [-Wimplicit-function-declaration]
     105 |         if (pmd_swp_exclusive(pmd))
         |             ^~~~~~~~~~~~~~~~~
         |             pte_swp_exclusive
   ./include/linux/leafops.h:106:23: error: implicit declaration of function 'pmd_swp_clear_exclusive'; did you mean 'pte_swp_clear_exclusive'? [-Wimplicit-function-declaration]
     106 |                 pmd = pmd_swp_clear_exclusive(pmd);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
         |                       pte_swp_clear_exclusive
   ./include/linux/leafops.h:106:23: error: incompatible types when assigning to type 'pmd_t' from type 'int'
   mm/huge_memory.c: In function 'copy_huge_non_present_pmd':
>> mm/huge_memory.c:1955:31: error: incompatible types when assigning to type 'pmd_t' from type 'int'
    1955 |                         pmd = pmd_swp_clear_exclusive(pmd);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~


vim +1955 mm/huge_memory.c

  1894	
  1895	static int copy_huge_non_present_pmd(
  1896			struct mm_struct *dst_mm, struct mm_struct *src_mm,
  1897			pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
  1898			struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
  1899			pmd_t pmd, pgtable_t pgtable)
  1900	{
  1901		softleaf_t entry = softleaf_from_pmd(pmd);
  1902		struct folio *src_folio;
  1903	
  1904		VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(pmd));
  1905	
  1906		if (softleaf_is_migration_write(entry) ||
  1907		    softleaf_is_migration_read_exclusive(entry)) {
  1908			entry = make_readable_migration_entry(swp_offset(entry));
  1909			pmd = softleaf_to_pmd(entry);
  1910			if (pmd_swp_soft_dirty(*src_pmd))
  1911				pmd = pmd_swp_mksoft_dirty(pmd);
  1912			if (pmd_swp_uffd_wp(*src_pmd))
  1913				pmd = pmd_swp_mkuffd_wp(pmd);
  1914			set_pmd_at(src_mm, addr, src_pmd, pmd);
  1915		} else if (softleaf_is_device_private(entry)) {
  1916			/*
  1917			 * For device private entries, since there are no
  1918			 * read exclusive entries, writable = !readable
  1919			 */
  1920			if (softleaf_is_device_private_write(entry)) {
  1921				entry = make_readable_device_private_entry(swp_offset(entry));
  1922				pmd = softleaf_to_pmd(entry);
  1923	
  1924				if (pmd_swp_soft_dirty(*src_pmd))
  1925					pmd = pmd_swp_mksoft_dirty(pmd);
  1926				if (pmd_swp_uffd_wp(*src_pmd))
  1927					pmd = pmd_swp_mkuffd_wp(pmd);
  1928				set_pmd_at(src_mm, addr, src_pmd, pmd);
  1929			}
  1930	
  1931			src_folio = softleaf_to_folio(entry);
  1932			VM_WARN_ON(!folio_test_large(src_folio));
  1933	
  1934			folio_get(src_folio);
  1935			/*
  1936			 * folio_try_dup_anon_rmap_pmd does not fail for
  1937			 * device private entries.
  1938			 */
  1939			folio_try_dup_anon_rmap_pmd(src_folio, &src_folio->page,
  1940						    dst_vma, src_vma);
  1941		} else if (softleaf_is_swap(entry)) {
  1942			int err;
  1943	
  1944			/*
  1945			 * PMD swap entry: duplicate swap references and clear
  1946			 * exclusive on source, matching copy_nonpresent_pte().
  1947			 */
  1948			err = swap_dup_entries_direct(entry, HPAGE_PMD_NR);
  1949			if (err < 0)
  1950				return err;
  1951	
  1952			ensure_on_mmlist(dst_mm);
  1953	
  1954			if (pmd_swp_exclusive(pmd)) {
> 1955				pmd = pmd_swp_clear_exclusive(pmd);
  1956				set_pmd_at(src_mm, addr, src_pmd, pmd);
  1957			}
  1958		}
  1959	
  1960		if (softleaf_is_swap(entry))
  1961			add_mm_counter(dst_mm, MM_SWAPENTS, HPAGE_PMD_NR);
  1962		else
  1963			add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
  1964		mm_inc_nr_ptes(dst_mm);
  1965		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
  1966		if (!userfaultfd_wp(dst_vma))
  1967			pmd = pmd_swp_clear_uffd_wp(pmd);
  1968		set_pmd_at(dst_mm, addr, dst_pmd, pmd);
  1969		return 0;
  1970	}
  1971	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
