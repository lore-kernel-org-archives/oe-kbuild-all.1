Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA471862A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 03:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751340835; cv=none; b=R6/pzJ1lV9uFFGe1bsZ2Sv0XIRWOt+ze9QvXFU0lJQsRYXHWBYrcPS8EBIDBxStAVsdw81BQ7cuuCy2J7YF+jYV29+4gosBpPLTVF6l0H7y+tO/NejCYjOxJl80h0MkRmCEf59wfFKzxBsCDt7elnNwUZvPHTaHP9hEA2BtPbkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751340835; c=relaxed/simple;
	bh=NdJf8wM6IHCV86eUEYod0WH+53XA8+83gu7pSclhNlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UN3OchZvt69lbRX2zgjmCnawKcLOg2kk4V7y23e8bDWDIAapSMKOtwSDoSW8Wr3WG6l+eOzSFy29lVA5fsYJcDvWcayFgXtItq3HwYQFfebvva1WUzuS4Tk92ZAK0qOnlztKDzfNWBjdTsxFpi+tyap5iHeUsOaEF9aK4+nrXps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0nNFi6F; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0nNFi6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751340833; x=1782876833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NdJf8wM6IHCV86eUEYod0WH+53XA8+83gu7pSclhNlI=;
  b=W0nNFi6Fo7ODvkeNaGO0ZsZ9OQp1ykDJzNbg0SDkDVBQAR2ySL07dMCb
   OGzpVZXnPagPz6JuYv7neCnR3eorf75Bz9rY6ufv57Ysro5kM9AEoLAmt
   VUESZiXJC69yV9PKGvv3dWWaqWaVdXauC2ioFmR0q94u63QhwjEo9T3SZ
   ucexU8vxo5zggXhvV7c8ovULKxIqgBW2Dyrz9CNDnmG2c2UoYvMUNoV0r
   nYF4+K0wsW+reVT0lZtoLA4o875FuGyENzjyyjLzqXeHCOVp0J6VNk3bO
   eTGOXMZG7wHy3oTuQTzcxypsXEj99EFb9lxT9gi33mIHzomtbUKHC93D7
   A==;
X-CSE-ConnectionGUID: xt2kzJMjRXCxumlksi9Reg==
X-CSE-MsgGUID: sjz0uJaJQYyvAxK6+wqdJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="41213552"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="41213552"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 20:33:53 -0700
X-CSE-ConnectionGUID: Nfw351EwSw+rORUT7aNQhQ==
X-CSE-MsgGUID: pq6N+jSXQTKCZQJOqSwPnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="159151737"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jun 2025 20:33:52 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWRki-0001P5-34;
	Tue, 01 Jul 2025 03:33:48 +0000
Date: Tue, 1 Jul 2025 05:33:39 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] mm/vmalloc.c:3632: warning: Function
 parameter or member 'pgoff' not described in
 'remap_vmalloc_hugepage_range_partial'
Message-ID: <202507010521.S5M6UUnr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0655af1b703c5ae3de3a1ba80e5e31690ccfae93
commit: a3425d4173784e41644abc3cc70d41aa2aef16fd [2882/2882] vmalloc: Extend for hugepages mapping
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250701/202507010521.S5M6UUnr-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010521.S5M6UUnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010521.S5M6UUnr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmalloc.c:3632: warning: Function parameter or member 'pgoff' not described in 'remap_vmalloc_hugepage_range_partial'
   mm/vmalloc.c:3760: warning: Function parameter or member 'align' not described in 'pvm_determine_end_from_reverse'


vim +3632 mm/vmalloc.c

  3612	
  3613	/**
  3614	 *	remap_vmalloc_hugepage_range_partial - map vmalloc hugepages
  3615	 *	to userspace
  3616	 *	@vma:		vma to cover
  3617	 *	@uaddr:		target user address to start at
  3618	 *	@kaddr:		virtual address of vmalloc hugepage kernel memory
  3619	 *	@size:		size of map area
  3620	 *
  3621	 *	Returns:	0 for success, -Exxx on failure
  3622	 *
  3623	 *	This function checks that @kaddr is a valid vmalloc'ed area,
  3624	 *	and that it is big enough to cover the range starting at
  3625	 *	@uaddr in @vma. Will return failure if that criteria isn't
  3626	 *	met.
  3627	 *
  3628	 *	Similar to remap_pfn_range() (see mm/memory.c)
  3629	 */
  3630	int remap_vmalloc_hugepage_range_partial(struct vm_area_struct *vma, unsigned long uaddr,
  3631						 void *kaddr, unsigned long pgoff, unsigned long size)
> 3632	{
  3633		struct vm_struct *area;
  3634		unsigned long off;
  3635		unsigned long end_index;
  3636	
  3637		if (check_shl_overflow(pgoff, PMD_SHIFT, &off))
  3638			return -EINVAL;
  3639	
  3640		size = PMD_ALIGN(size);
  3641	
  3642		if (!PMD_ALIGNED(uaddr) || !PMD_ALIGNED(kaddr))
  3643			return -EINVAL;
  3644	
  3645		area = find_vm_area(kaddr);
  3646		if (!area)
  3647			return -EINVAL;
  3648	
  3649		if (!(area->flags & VM_USERMAP))
  3650			return -EINVAL;
  3651	
  3652		if (check_add_overflow(size, off, &end_index) ||
  3653		    end_index > get_vm_area_size(area))
  3654			return -EINVAL;
  3655		kaddr += off;
  3656	
  3657		do {
  3658			struct page *page = vmalloc_to_page(kaddr);
  3659			int ret;
  3660	
  3661			ret = hugetlb_insert_hugepage_pte_by_pa(vma->vm_mm, uaddr,
  3662						vma->vm_page_prot, page_to_phys(page));
  3663			if (ret)
  3664				return ret;
  3665	
  3666			uaddr += PMD_SIZE;
  3667			kaddr += PMD_SIZE;
  3668			size -= PMD_SIZE;
  3669		} while (size > 0);
  3670	
  3671		vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
  3672	
  3673		return 0;
  3674	}
  3675	EXPORT_SYMBOL(remap_vmalloc_hugepage_range_partial);
  3676	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
