Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F240C2E7BAE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 19:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752865969; cv=none; b=H6v4JLmk1D6HYdzu//kRu2XIsxnvTfA+8Bre0Dq7iL9cvaEgJlckuQeRSBjKNcWWl1ZRJxHtdlycdITAaVEpEhl1KxOuV9vOFV/5OkP9DV9eQJ61RjGgjQ6XWIX7QLCsZl00gX6VsBnJRuXADgq7/E0c1vlLaxZvAMjs5R9eBFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752865969; c=relaxed/simple;
	bh=RyTlJJWCSLEQCwXor+I7MWtgEDeFghjBMVSEnSASDRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTCNrGfuaOf1KLU+AColT1NWjKcwUWDoy30/or3G/QRjHnHSZHRnk/ULeUrfLvlXeG2rWF0WpHz09QUuhI+WmuysLB8tzXevn5nfD1u1CwrvvReIGHfdP0zySIgrdyA2V3i49WjNUcSwRVk+qSNh4Z1fC7XzqcDt6xxpdeXAevo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKQLZn6Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKQLZn6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752865968; x=1784401968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RyTlJJWCSLEQCwXor+I7MWtgEDeFghjBMVSEnSASDRE=;
  b=nKQLZn6Q3CA093rvqCDZTAdjuS9BKlkuuco7h+ydh5zg4Q8GUMyXIVQP
   wijARgwUjqIowVcxfYTl5K7i+gJoKnt217Nc2Oy9pIocsivvqH32QbYn3
   3sQ4yxNR+Yd9cmKTk0TAFRmRHDdUjeCeyBLnPLpgvNbE6sTZYK6cKDgmY
   ylXTQ45zKEnn1nW82zeVj0pc+8PHNNqseHNoZMY8Uuen33O6YQnpRj6sN
   UM3nCMvfitdCCroCB9nNTViAWZerUbkfQiJA0dwOrKDAbOL2q4HpbDG3h
   6yb9/nTfHlR3M2Y1Ll8Th9pSpF39/LreyOeMM7Xh+KRaK1nmIUsz1yU0D
   A==;
X-CSE-ConnectionGUID: Q0r1bwVATP6ttYy4wZhaCA==
X-CSE-MsgGUID: 5RguUpBER4O+L+3oCXj+mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55049281"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="55049281"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 12:12:47 -0700
X-CSE-ConnectionGUID: 5iS4jRLDRU+4TfJXKOmFeA==
X-CSE-MsgGUID: q76HfwqoRE+gywZTJOQ51A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="195258746"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2025 12:12:46 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucqVg-000Ey7-06;
	Fri, 18 Jul 2025 19:12:44 +0000
Date: Sat, 19 Jul 2025 03:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: Nico Pache <npache@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 05/14] khugepaged: generalize __collapse_huge_page_*
 for mTHP support
Message-ID: <202507190309.ejeMtIjX-lkp@intel.com>
References: <20250714003207.113275-6-npache@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714003207.113275-6-npache@redhat.com>

Hi Nico,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20250718]
[cannot apply to lwn/docs-next linus/master v6.16-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nico-Pache/khugepaged-rename-hpage_collapse_-to-collapse_/20250714-083735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250714003207.113275-6-npache%40redhat.com
patch subject: [PATCH v9 05/14] khugepaged: generalize __collapse_huge_page_* for mTHP support
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20250719/202507190309.ejeMtIjX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190309.ejeMtIjX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190309.ejeMtIjX-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/khugepaged.c: In function '__collapse_huge_page_swapin':
>> mm/khugepaged.c:1038:48: error: 'MTHP_STAT_COLLAPSE_EXCEED_SWAP' undeclared (first use in this function)
    1038 |                         count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_SWAP);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1038:48: note: each undeclared identifier is reported only once for each function it appears in


vim +/MTHP_STAT_COLLAPSE_EXCEED_SWAP +1038 mm/khugepaged.c

   990	
   991	/*
   992	 * Bring missing pages in from swap, to complete THP collapse.
   993	 * Only done if khugepaged_scan_pmd believes it is worthwhile.
   994	 *
   995	 * Called and returns without pte mapped or spinlocks held.
   996	 * Returns result: if not SCAN_SUCCEED, mmap_lock has been released.
   997	 */
   998	static int __collapse_huge_page_swapin(struct mm_struct *mm,
   999					       struct vm_area_struct *vma,
  1000					       unsigned long haddr, pmd_t *pmd,
  1001					       int referenced, u8 order)
  1002	{
  1003		int swapped_in = 0;
  1004		vm_fault_t ret = 0;
  1005		unsigned long address, end = haddr + (PAGE_SIZE << order);
  1006		int result;
  1007		pte_t *pte = NULL;
  1008		spinlock_t *ptl;
  1009	
  1010		for (address = haddr; address < end; address += PAGE_SIZE) {
  1011			struct vm_fault vmf = {
  1012				.vma = vma,
  1013				.address = address,
  1014				.pgoff = linear_page_index(vma, address),
  1015				.flags = FAULT_FLAG_ALLOW_RETRY,
  1016				.pmd = pmd,
  1017			};
  1018	
  1019			if (!pte++) {
  1020				/*
  1021				 * Here the ptl is only used to check pte_same() in
  1022				 * do_swap_page(), so readonly version is enough.
  1023				 */
  1024				pte = pte_offset_map_ro_nolock(mm, pmd, address, &ptl);
  1025				if (!pte) {
  1026					mmap_read_unlock(mm);
  1027					result = SCAN_PMD_NULL;
  1028					goto out;
  1029				}
  1030			}
  1031	
  1032			vmf.orig_pte = ptep_get_lockless(pte);
  1033			if (!is_swap_pte(vmf.orig_pte))
  1034				continue;
  1035	
  1036			/* Dont swapin for mTHP collapse */
  1037			if (order != HPAGE_PMD_ORDER) {
> 1038				count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_SWAP);
  1039				pte_unmap(pte);
  1040				mmap_read_unlock(mm);
  1041				result = SCAN_EXCEED_SWAP_PTE;
  1042				goto out;
  1043			}
  1044	
  1045			vmf.pte = pte;
  1046			vmf.ptl = ptl;
  1047			ret = do_swap_page(&vmf);
  1048			/* Which unmaps pte (after perhaps re-checking the entry) */
  1049			pte = NULL;
  1050	
  1051			/*
  1052			 * do_swap_page returns VM_FAULT_RETRY with released mmap_lock.
  1053			 * Note we treat VM_FAULT_RETRY as VM_FAULT_ERROR here because
  1054			 * we do not retry here and swap entry will remain in pagetable
  1055			 * resulting in later failure.
  1056			 */
  1057			if (ret & VM_FAULT_RETRY) {
  1058				/* Likely, but not guaranteed, that page lock failed */
  1059				result = SCAN_PAGE_LOCK;
  1060				goto out;
  1061			}
  1062			if (ret & VM_FAULT_ERROR) {
  1063				mmap_read_unlock(mm);
  1064				result = SCAN_FAIL;
  1065				goto out;
  1066			}
  1067			swapped_in++;
  1068		}
  1069	
  1070		if (pte)
  1071			pte_unmap(pte);
  1072	
  1073		/* Drain LRU cache to remove extra pin on the swapped in pages */
  1074		if (swapped_in)
  1075			lru_add_drain();
  1076	
  1077		result = SCAN_SUCCEED;
  1078	out:
  1079		trace_mm_collapse_huge_page_swapin(mm, swapped_in, referenced, result);
  1080		return result;
  1081	}
  1082	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
