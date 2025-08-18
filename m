Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E29234984
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526045; cv=none; b=PDFMH0xXCVozrDGxGGmApwuhbjn/+b4e3OOhMw+4s5TXWqanI62KkC28IX4jNRByAOgciM7kZuYm/vWFCuIhwOqIHtyv7WidZpnp3bL4W61XjxkKSLKxJjD/RJwfNsECr9rDvQHWweq/Cen2CJyW/UQG5QZ+5oHslj04dAUZEws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526045; c=relaxed/simple;
	bh=CADhhB95ptN9jRnsUXZWxWoiewKOskOBc/uP99JXOng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gQfiK6OInMMng3FWubIZ7uHRN1Bhm9nX2UV8bh2CB0kacJ3ymJwhXSgISYuidnSYlD9SpBelzJi1lFzX3uGbfNKScMRfAcaKp+w1zGzuFKcvEMn8eBAK5UygzPR55IlJY1RBjXe6etkRyXhgeJFPWUHPs7HPju5kmSysD1X7m04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZZaUk3o; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZZaUk3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755526042; x=1787062042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CADhhB95ptN9jRnsUXZWxWoiewKOskOBc/uP99JXOng=;
  b=lZZaUk3okbxpU1YYsDQPgef9B9ocbmLhSft6nw+mmnyRKd37uvM+vKNe
   oPH22PgMZrOA7KovLwUh6nS7+LNFDG8ot5fOFA4SrxtzjsOLnhhUUbMhi
   aXAGsDxapUa2dNF+UMZ6Ye88TsP+uiR8R2bhuiRLxqkgnrtsSCRNnBwaF
   0WW6ySFjFQkF+eK8/Vb/NFRtIce6rcW8dKGgTqq/J8isRKiPEt8BGpos0
   gDjkjrNNEwcF6McOLTCliQKSN0zp0smo1sTeQ+4j5p+ZwE+fadD6j3Bxs
   XOW0eF9757gZf6Th75+rHj6Y466Tlx1L52MuCeWP1xx0DJ60iXcOBA512
   g==;
X-CSE-ConnectionGUID: nHNfa6GwSuivz4M8gAYboA==
X-CSE-MsgGUID: XyYnqJRNSB6dyCYRegtXXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75203115"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="75203115"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 07:07:22 -0700
X-CSE-ConnectionGUID: s+LfQn73SCyAgPxH63WcJQ==
X-CSE-MsgGUID: IybmiP33SbCylA3M5wpAoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167495384"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 18 Aug 2025 07:07:21 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo0W6-00015r-2y;
	Mon, 18 Aug 2025 14:07:18 +0000
Date: Mon, 18 Aug 2025 16:07:02 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687] mm/vmalloc.c:4443: warning: Function
 parameter or member 'pgoff' not described in
 'remap_vmalloc_hugepage_range_partial'
Message-ID: <202508181645.yPRDUNGN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dc90c923fed4944f134644261022885c12631518
commit: 9b1283f2bec2134030e1e099b900579f1f03840e [2687/2687] mm/vmalloc: Extend vmalloc usage about hugepage
config: x86_64-buildonly-randconfig-2001-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181645.yPRDUNGN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181645.yPRDUNGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181645.yPRDUNGN-lkp@intel.com/

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
