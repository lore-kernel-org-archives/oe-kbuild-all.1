Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0192A320F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 00:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754613181; cv=none; b=GqgQLDrRQkkVn9XlSIXrwD1Ax143c3ZYYsR3vezIv1aIJ980V6cDjMH1XBGIgEOu7zkfydnZlGPAhy1OThfJ37QDNeKat0xEgtfKqtzbl1ToELdqPGEj6VTTplr3v6wDXIk6mG3bPO15fvmPdc2U0bo4Is7LWx89Z9Q78KazyBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754613181; c=relaxed/simple;
	bh=tQNkifgP6qzQiJz2MRPWncBVg60SYpOqwqCb6DNEMoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QFgvDhNe0j9Eryez7BYf2INAJ1QcuYvtP3P337RTSjxhW3p1EJNBe0Uc8qorN/RL9m6PY8XHc3QY0flzsChc/7UTPkhc8n2o9miq9wCpvwrfuqcUlWvCLBq/J9nNCWtWGlciNwnVicQNwU2my2hyxtgJA1xJru/e8LpHcjBf5po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHi8U3E/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHi8U3E/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754613180; x=1786149180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tQNkifgP6qzQiJz2MRPWncBVg60SYpOqwqCb6DNEMoo=;
  b=FHi8U3E/ZnP9kkvFkVl/mDo5NJ6Yw7BaADSvtugMh96yRzZ20Tf8d/6e
   c/7kcxQLRAw8proPbuNfhvu0NkkpNUhSH1YAgPoxns0kc2IlVgrrlsGj8
   EJGRehVS+qSL5Ug6PJCQD/UoLW6N/CAagLynNg6hnsU2PDksXBcujfIEI
   SZ518DeBw9R5y5ntlUfnb9hv9uZZxBg6j5+Rej+lSJBSRiJFoDllKVNx5
   1Gxt6bGvs5vlVTjRaoLSX15lzC9oXLa1fRx2OqoMfwM0sxyBSXqo8vlQC
   dRBo0DC/UT80KrxTwJ7t6GGh1i28m698EY5+xo8TZbPo+Cn4GvNcNZvTv
   A==;
X-CSE-ConnectionGUID: 9kniVWBQQxuw1gA+hJ8SXw==
X-CSE-MsgGUID: NnRE5OE9TaS2uGB+AEHuWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67655814"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="67655814"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 17:32:58 -0700
X-CSE-ConnectionGUID: Vo8t14XsSymLomKCuJkBfQ==
X-CSE-MsgGUID: Z3dcMzkNTWaRB46TnHSISQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="170451417"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 07 Aug 2025 17:32:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukB2U-0003Oc-32;
	Fri, 08 Aug 2025 00:32:54 +0000
Date: Fri, 8 Aug 2025 08:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1712/1712] mm/memory.c:1546:10: error:
 implicit declaration of function 'hugetlb_insert_hugepage_pte_by_pa'; did
 you mean 'hugetlb_insert__hugepage_pte_by_pa'?
Message-ID: <202508080851.7XV55Lp7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weilong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   748957057cef2d3b3e35d749c9a1ade66e2b5e73
commit: 18f49509eef01d1ee6ed81899298994f2f88dd2a [1712/1712] ascend: share_pool: Use remap_pfn_range to share kva to uva
config: arm64-randconfig-001-20250705 (https://download.01.org/0day-ci/archive/20250808/202508080851.7XV55Lp7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080851.7XV55Lp7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080851.7XV55Lp7-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'vm_insert_page':
>> mm/memory.c:1546:10: error: implicit declaration of function 'hugetlb_insert_hugepage_pte_by_pa'; did you mean 'hugetlb_insert__hugepage_pte_by_pa'? [-Werror=implicit-function-declaration]
    1546 |   return hugetlb_insert_hugepage_pte_by_pa(vma->vm_mm, addr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          hugetlb_insert__hugepage_pte_by_pa
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
