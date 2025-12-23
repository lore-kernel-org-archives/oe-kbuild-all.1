Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039DD212564
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 01:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766452010; cv=none; b=al7l2xcsPJjmTllgn8J1C7uqd8qDzmcdW1tfzEKKUwTi1a+S30GaRhpOV15lzeA4ooLAtHcNIlaZ+Q6nqs4ytF7TC+N+c6Ibke60AuQ5ivufy6uHOPNxaw/OOWqtbTaHQA5y34o7XlVNWlHkGgPcOVkOtldFdNnl3zCGIHSfjkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766452010; c=relaxed/simple;
	bh=yj4XQPjoIGlFwHJDQatYPFxUc3kUUe7c59LcwywcEL8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nnvF3uc9g91uRSjREkPbQx5wZZI2ydndhb1lm70bDCoZuMtoCSkviY7nVWHo96QuZ1MCyj+PT3rAj5eOmpqHp2hIsK9vCTsc6T7qxLnkNDiYtYSYKHQ9rTEg6LF49NpDOp/cnSumbRxd878wuKrbzRgosM7bkfcFd02AXjlswjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WW1PBr7U; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WW1PBr7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766452009; x=1797988009;
  h=date:from:to:cc:subject:message-id;
  bh=yj4XQPjoIGlFwHJDQatYPFxUc3kUUe7c59LcwywcEL8=;
  b=WW1PBr7U0A5/DjsY6vQJpfk0nUICuXgX9waURErSl9Pj+F4UIz9Mg9XU
   pommSYjfL5BUZ1LMN+Cig4gkurm75C8w2NAG9jUWWjnDuPdXfSFbpbcy9
   znr38s2JYwfKIk5skEr9j4c1CjqmcIGubeaxc9u288Nd7g99+8z78OW3Q
   kkEcvLLmYdZnnjb9MSuo1FW0NQE8e8vl+d21dcAj6PCxrugEwGplr9g6B
   pC3Im+ODP2BoZaBKIkSy2umpbvTFdRukwI5iOV8bLDpjvok4Em2Ls3JCn
   yurAlIMjqbdorSPJxPM8rR6UN3w+h9v1i479X+AHOh0JrzspLP2j9aM0s
   g==;
X-CSE-ConnectionGUID: grudUO0KSw2B2mXdIqGrcQ==
X-CSE-MsgGUID: qPg8mXIBQ1aXzsEn8E4pNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="93777691"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="93777691"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 17:06:47 -0800
X-CSE-ConnectionGUID: rlmAFzLgRnSIzKDbxU6PGw==
X-CSE-MsgGUID: xgZQBMcQSNWIA0Ewl+lXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199959615"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2025 17:06:45 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXqrL-000000001HN-0605;
	Tue, 23 Dec 2025 01:06:43 +0000
Date: Tue, 23 Dec 2025 09:06:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2/2] mm/vmalloc.c:4443: warning: Function
 parameter or member 'pgoff' not described in
 'remap_vmalloc_hugepage_range_partial'
Message-ID: <202512230928.obIRItp9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: 9b1283f2bec2134030e1e099b900579f1f03840e [2/2] mm/vmalloc: Extend vmalloc usage about hugepage
config: arm64-randconfig-004-20251223 (https://download.01.org/0day-ci/archive/20251223/202512230928.obIRItp9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230928.obIRItp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230928.obIRItp9-lkp@intel.com/

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
