Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6021B186E40
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739531223; cv=none; b=ip9CtqYG2tNVe1fswXAzvOwYdioq7DPWZ0Zo97wQ6pNJkdw63sEIfwCd9y97FvZwV5vKEwbnOzyprPBrtA+oGB6Wmiv+voi8IqLWztbshk4j5RCjPo/5NCzTJDlxzMD3bBPDYw6ud5bgoB+xHWI5gEPGbBcZ9Zc8hdIqRqFD79U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739531223; c=relaxed/simple;
	bh=08q9F42NCnyJbkL+2RMGPGqGh+WWfGUeJOEU+kBGcxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9TdDmIMCPPN2e4HEWqovM8DFY9c52esudxKP3e1WSg6ne8Z3iBBqxUa6tS8PJEFnV5CqBaH9RAHACFDV6i398ISTMtIC5G26Y+Jh4YFqJWKD1uaqgcFgEx7+fr9rpPFKgRIaRFfxL6oYp3nrtM8xV2d63ub7KaBP4h/TYvdN5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eefmObmY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eefmObmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739531222; x=1771067222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=08q9F42NCnyJbkL+2RMGPGqGh+WWfGUeJOEU+kBGcxk=;
  b=eefmObmYDz9lUsqi4vUjbeYmovAEaDBBj3TLrG3/uAkAXyWuB4A6Vv0T
   54LcWjkoU5xVmbuAtSw0ga+c9VAXeVjWyUGZ3EJe8Yer9p6Av6NnoTqXS
   EdO7c5ZV8L3tjJQqdqR/fT/kaCP72Ia8DR+ybyJhWFuyDj96PGB2Yi0Vs
   bAMiypLbsA/jrWNXkWU5LwgoYNIXWdb3zjOTCAlzv8naFQinlmJpVryfr
   oyr+Gh46gKJMa3zPbV+Ub22ooWMudPBqXUwkAL/hcRIdPZbvEJyShdRyZ
   hRHkDHW2WvjyXDjIMpnZqMh76c07rYDkjiKu65HQp8ivNDOK3HGJYRPm9
   Q==;
X-CSE-ConnectionGUID: 9+N308wNQ5qUD6HbUyJGUQ==
X-CSE-MsgGUID: LgJRHtZjTL2AoRWqvgwu/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="43113672"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="43113672"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 03:07:01 -0800
X-CSE-ConnectionGUID: 0PafUOfXS/+pDH66rnMC2Q==
X-CSE-MsgGUID: 88V3qMJbSYKR0TT5hLcI/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118636406"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Feb 2025 03:07:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1titX7-0019Qd-0j;
	Fri, 14 Feb 2025 11:06:57 +0000
Date: Fri, 14 Feb 2025 19:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1924/1924] mm/vmalloc.c:4443: warning: Function
 parameter or member 'pgoff' not described in
 'remap_vmalloc_hugepage_range_partial'
Message-ID: <202502141816.L1NkVPgB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   254b433462607f511039b75693d9314822538f20
commit: 9b1283f2bec2134030e1e099b900579f1f03840e [1924/1924] mm/vmalloc: Extend vmalloc usage about hugepage
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250214/202502141816.L1NkVPgB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141816.L1NkVPgB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141816.L1NkVPgB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmalloc.c:4443: warning: Function parameter or member 'pgoff' not described in 'remap_vmalloc_hugepage_range_partial'


vim +4443 mm/vmalloc.c

  4423	
  4424	/**
  4425	 *      remap_vmalloc_hugepage_range_partial - map vmalloc hugepages
  4426	 *      to userspace
  4427	 *      @vma:           vma to cover
  4428	 *      @uaddr:         target user address to start at
  4429	 *      @kaddr:         virtual address of vmalloc hugepage kernel memory
  4430	 *      @size:          size of map area
  4431	 *
  4432	 *      Returns:        0 for success, -Exxx on failure
  4433	 *
  4434	 *      This function checks that @kaddr is a valid vmalloc'ed area,
  4435	 *      and that it is big enough to cover the range starting at
  4436	 *      @uaddr in @vma. Will return failure if that criteria isn't
  4437	 *      met.
  4438	 *
  4439	 *      Similar to remap_pfn_range() (see mm/memory.c)
  4440	 */
  4441	int remap_vmalloc_hugepage_range_partial(struct vm_area_struct *vma, unsigned long uaddr,
  4442						 void *kaddr, unsigned long pgoff, unsigned long size)
> 4443	{
  4444		struct vm_struct *area;
  4445		unsigned long off;
  4446		unsigned long end_index;
  4447	
  4448		if (check_shl_overflow(pgoff, PMD_SHIFT, &off))
  4449			return -EINVAL;
  4450	
  4451		size = ALIGN(size, PMD_SIZE);
  4452	
  4453		if (!IS_ALIGNED(uaddr, PMD_SIZE) || !IS_ALIGNED((unsigned long)kaddr, PMD_SIZE))
  4454			return -EINVAL;
  4455	
  4456		area = find_vm_area(kaddr);
  4457		if (!area)
  4458			return -EINVAL;
  4459	
  4460		if (!(area->flags & VM_USERMAP))
  4461			return -EINVAL;
  4462	
  4463		if (check_add_overflow(size, off, &end_index) ||
  4464				end_index > get_vm_area_size(area))
  4465			return -EINVAL;
  4466		kaddr += off;
  4467	
  4468		do {
  4469			struct page *page = vmalloc_to_page(kaddr);
  4470			int ret;
  4471	
  4472			ret = hugetlb_insert_hugepage_pte_by_pa(vma->vm_mm, uaddr,
  4473					vma->vm_page_prot, page_to_phys(page));
  4474			if (ret)
  4475				return ret;
  4476	
  4477			uaddr += PMD_SIZE;
  4478			kaddr += PMD_SIZE;
  4479			size -= PMD_SIZE;
  4480		} while (size > 0);
  4481	
  4482		vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
  4483	
  4484		return 0;
  4485	}
  4486	EXPORT_SYMBOL(remap_vmalloc_hugepage_range_partial);
  4487	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
