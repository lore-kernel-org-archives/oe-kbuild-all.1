Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4E0126C02
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 14:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748354851; cv=none; b=BaiIXKcTC0CjYQ+u/74NKhUwn0Z+imRulUBVavmA6PM6JG8i7H+ZB6hReMZLooPaQ/uxFYqF2lhBCoDS5phnoui09/CKb+1nM1kUXLCDgc1oHmikOGqct7YgXlQJFAzXWTLTxkVYvNMWmIJ9GX8kCOsiE0gvirLb7wBSiVaLzfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748354851; c=relaxed/simple;
	bh=ihP5r0MLtrXYz/1uuGrifxEVofbvncbhYkjse9xh+eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JRgNcPx7GXq7u3BKH1onNUYmZnHT7nJTOvAGb/VvDbjy4EYzv+bIwtVuk4iIr7IxgqZWakZ+4eu3TmUiA6QSx0c9lXITgyuqPzX7x+yoMJG/bPg7LmcGbklqKapcYQ/pl1fdmPDN6BgWWJAqoMLczUsg7x8FdGqmkgpLPJnMbwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRkvgz1L; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRkvgz1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748354849; x=1779890849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ihP5r0MLtrXYz/1uuGrifxEVofbvncbhYkjse9xh+eQ=;
  b=cRkvgz1Lh3H4F2Z4lki7gpPpQXNBvylsnuuGBvRurfccqq0jwcT2wzdc
   yvI2066xBt5B3pzL36YyY3kgIMBadwjBXpqVgjsk0M13kQrIsuC8pkqUs
   /OAupTfICiAHNKP1Mdq4HuWLA1CkWgpXsX4DjUPRWyN6+hnnz6DRzYeiG
   T1eeIV9xvka3emdOJfDONMC4G8jvyZasPd+94jhk/aQLOFyidcrwBpVEC
   7a5SEHbsVbXg2j6z4MITj/ZobR8/dPHoUvx2ulxSpJI5rqLIBQ88xzZSC
   YOoVOOIHXdKRTV+m13tM08uDPEjF0RlwuEsItZ52/IwReEnajB3icK6vB
   Q==;
X-CSE-ConnectionGUID: I7Vi252OS1Si+baRVoSRmA==
X-CSE-MsgGUID: eG90CAPnQIm7pIsYvWTMHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49455545"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="49455545"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 07:07:23 -0700
X-CSE-ConnectionGUID: 1lXGmz+dQXOi8ntgC4TK/w==
X-CSE-MsgGUID: Dn12WXZjSLGFOUmnz1EL4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="143281872"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 May 2025 07:07:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJuxb-000TGQ-39;
	Tue, 27 May 2025 14:07:19 +0000
Date: Tue, 27 May 2025 22:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2304/2304] mm/vmalloc.c:4443: warning: Function
 parameter or member 'pgoff' not described in
 'remap_vmalloc_hugepage_range_partial'
Message-ID: <202505272122.LGw8kmAU-lkp@intel.com>
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
head:   c81824893b87edffa39389711d160c2dd5a03e1e
commit: 9b1283f2bec2134030e1e099b900579f1f03840e [2304/2304] mm/vmalloc: Extend vmalloc usage about hugepage
config: x86_64-buildonly-randconfig-005-20250527 (https://download.01.org/0day-ci/archive/20250527/202505272122.LGw8kmAU-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505272122.LGw8kmAU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505272122.LGw8kmAU-lkp@intel.com/

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
