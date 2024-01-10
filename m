Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D9E1D683
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOFkDifO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704875901; x=1736411901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LHZZIQJ+hSIDsyTIXGvuqRjDKEnC/3RUOoBNAJXFIiY=;
  b=lOFkDifO9q1Qm0kfkibaY4IzCCVT0V1NduVL71YybpUFzlOJoxD2BVb5
   f8lYJdL9VuZCBkQ4cZDv53HmzxaQoxuyz/GnzVtvqcs/NIiVuTI/N5cl1
   Vx7l8Oc0IpipXdMZvFbXFKdCyxy/ceT4nq/YyadQiXjMKHHxnZtbzVtw5
   iN6zYlJHt7FDh+FNzGMHFrCtcj95MzqBveXo5gSTtXZVXzetR/jb/0p2r
   kKbswFdramZv9jDdcseW5K+3yy4dZbIe2c2+sAI3ZkkagandpnxThLb2C
   6sTNyCSetFph5rQwExwNBO51svZ78u0b9BrEhag8reWAtN8Q+8sPCsE8t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5537334"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5537334"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 00:38:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1113375681"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="1113375681"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jan 2024 00:38:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNU6C-0006nA-2Y;
	Wed, 10 Jan 2024 08:38:08 +0000
Date: Wed, 10 Jan 2024 16:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1354/2321] mm/vmalloc.c:4443: warning: Function
 parameter or member 'pgoff' not described in
 'remap_vmalloc_hugepage_range_partial'
Message-ID: <202401101651.ebtN53S1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a59ffde9407fbe724d2a9871f618bc1bb631cc53
commit: 9b1283f2bec2134030e1e099b900579f1f03840e [1354/2321] mm/vmalloc: Extend vmalloc usage about hugepage
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240110/202401101651.ebtN53S1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401101651.ebtN53S1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401101651.ebtN53S1-lkp@intel.com/

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
