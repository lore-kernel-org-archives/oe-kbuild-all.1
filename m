Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D48C1097D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 21:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVvWPUIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705266299; x=1736802299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bnldWYHLDtzGlXCbYp1zmIjqaidgkFbiQA7mW+A1a1o=;
  b=EVvWPUIar3rLmRbs4wr0oFXdBfaVNOtNOGf7nIJC6YnqolEtd0lhdkSV
   v3MehyICgh8td5udlONytRkZMC+hTFKRcXhhUnee6CZb+DKc7cGCswNOa
   YKOsk0FciAxjNuELpI7T7ZN2wG29XKpWWBu3IHngrrH2ENzXV9IButHCq
   bEqaRUh+AmoWdd6Xz0EwfijO9OjL3Q6KmAFrK9RtuvXOFvF1HnhxQAMvE
   yIcuXncnLCuaanp7x450cPY1JLZQ/o0uWRLm0FRoZqGdn8ktxTRZQe5hz
   ThO+1SJMJTmWBhYX792sqO9GZBNTfy4SJjUH6TKBMZoFnXLkPUKSQ00Dk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6859560"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="6859560"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 13:04:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="956646221"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="956646221"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Jan 2024 13:04:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP7di-000BqK-26;
	Sun, 14 Jan 2024 21:04:41 +0000
Date: Mon, 15 Jan 2024 05:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18192/21544] mm/memory.c:1546:24:
 error: implicit declaration of function 'hugetlb_insert_hugepage_pte_by_pa';
 did you mean 'hugetlb_insert__hugepage_pte_by_pa'?
Message-ID: <202401150459.fFshvuVQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 18f49509eef01d1ee6ed81899298994f2f88dd2a [18192/21544] ascend: share_pool: Use remap_pfn_range to share kva to uva
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240115/202401150459.fFshvuVQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150459.fFshvuVQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150459.fFshvuVQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'vm_insert_page':
>> mm/memory.c:1546:24: error: implicit declaration of function 'hugetlb_insert_hugepage_pte_by_pa'; did you mean 'hugetlb_insert__hugepage_pte_by_pa'? [-Werror=implicit-function-declaration]
    1546 |                 return hugetlb_insert_hugepage_pte_by_pa(vma->vm_mm, addr,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        hugetlb_insert__hugepage_pte_by_pa
   cc1: some warnings being treated as errors


vim +1546 mm/memory.c

  1504	
  1505	/**
  1506	 * vm_insert_page - insert single page into user vma
  1507	 * @vma: user vma to map to
  1508	 * @addr: target user address of this page
  1509	 * @page: source kernel page
  1510	 *
  1511	 * This allows drivers to insert individual pages they've allocated
  1512	 * into a user vma.
  1513	 *
  1514	 * The page has to be a nice clean _individual_ kernel allocation.
  1515	 * If you allocate a compound page, you need to have marked it as
  1516	 * such (__GFP_COMP), or manually just split the page up yourself
  1517	 * (see split_page()).
  1518	 *
  1519	 * NOTE! Traditionally this was done with "remap_pfn_range()" which
  1520	 * took an arbitrary page protection parameter. This doesn't allow
  1521	 * that. Your vma protection will have to be set up correctly, which
  1522	 * means that if you want a shared writable mapping, you'd better
  1523	 * ask for a shared writable mapping!
  1524	 *
  1525	 * The page does not need to be reserved.
  1526	 *
  1527	 * Usually this function is called from f_op->mmap() handler
  1528	 * under mm->mmap_sem write-lock, so it can change vma->vm_flags.
  1529	 * Caller must set VM_MIXEDMAP on vma if it wants to call this
  1530	 * function from other places, for example from page-fault handler.
  1531	 */
  1532	int vm_insert_page(struct vm_area_struct *vma, unsigned long addr,
  1533				struct page *page)
  1534	{
  1535		if (addr < vma->vm_start || addr >= vma->vm_end)
  1536			return -EFAULT;
  1537		if (!page_count(page))
  1538			return -EINVAL;
  1539		if (!(vma->vm_flags & VM_MIXEDMAP)) {
  1540			BUG_ON(down_read_trylock(&vma->vm_mm->mmap_sem));
  1541			BUG_ON(vma->vm_flags & VM_PFNMAP);
  1542			vma->vm_flags |= VM_MIXEDMAP;
  1543		}
  1544	
  1545		if (sp_check_hugepage(page))
> 1546			return hugetlb_insert_hugepage_pte_by_pa(vma->vm_mm, addr,
  1547						vma->vm_page_prot, page_to_phys(page));
  1548		else
  1549			return insert_page(vma, addr, page, vma->vm_page_prot);
  1550	}
  1551	EXPORT_SYMBOL(vm_insert_page);
  1552	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
