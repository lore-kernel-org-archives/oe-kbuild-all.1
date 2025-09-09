Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE2423D2AB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757404593; cv=none; b=p7jdBWm/cTOPsJqrAmCH4+VaTrPI/4acRnlq/w9NzWGQ4pE10XUCXjB6tkCrK5HSfPE2nVbrJ5sVQcuVorhAcRwIp/80CQHvD5IhdZS7ruXKEpbAGI5nyk8NgYM6Ck0XyjM/eyZ/hs2V8fAFEKhPiO5wLub7D3K7xfDKcJ5gyf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757404593; c=relaxed/simple;
	bh=RB75qbD5s/YjAIrT4C30TUaE2F2UyRiK6nCRbxlJKQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pUuqg0EppDnuOLMItexofvmV2WNtMJ7lDt+pEFAfRY0DsgsJSQA91jTBvGzl4tuwGW1MNOMJKOhN2drofZmv9F3Myv9ujv7+HnGFLWgZLwN7EGIq+qh1+nrrM0Tl7Kn3V5FKW+PlhUGVPYuCPflEdD99/Ife6e29X+0weUpeBSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rsh8VTYf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rsh8VTYf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757404592; x=1788940592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RB75qbD5s/YjAIrT4C30TUaE2F2UyRiK6nCRbxlJKQo=;
  b=Rsh8VTYftgTXRdWrS2YosszVEryoRST5I8N70uRbxPUiWNC497yv3+iv
   4c6TT1V6IV96H/m1tx2VJ2RGMnFeWhNCzNOihsRvdy5U5aAn5HWMbTybO
   Oc6HUuUOT7as3PaqqfPs/KDcVTbX43AAOzBKZJ1XgbIBAm5Jc2e4Nyy19
   Hq6W+qM0V8Hl9a8AfsNV3cG6JHbF6sUtQQe0BhvB8/i3YFysbLMX96BKq
   ttp3JuFoNgWDwR1sUNpeCjCbZqu+rYbFWKIohi5DS34yEEn3duHpsP2NS
   RsfspvFLjIi6BLOYUQGSTUCrxRgV1C07v/ytICOfYcKiVp4cPQg5KiHlq
   Q==;
X-CSE-ConnectionGUID: 8Ze9NSh7TliXBrKzl/LsSA==
X-CSE-MsgGUID: buZIU5AoQFCdTUzX/prNtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59786514"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59786514"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 00:56:29 -0700
X-CSE-ConnectionGUID: w/gl8B1lRwCjHvoW07MMKg==
X-CSE-MsgGUID: 67WS6GPzTAKg+DyHISS2eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="203792272"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Sep 2025 00:56:28 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvtDF-0004cC-2J;
	Tue, 09 Sep 2025 07:56:25 +0000
Date: Tue, 9 Sep 2025 15:55:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2870/2870] mm/vmalloc.c:4443: warning: Function
 parameter or member 'pgoff' not described in
 'remap_vmalloc_hugepage_range_partial'
Message-ID: <202509091546.3rklFVnn-lkp@intel.com>
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
head:   56b56ac9eef7eb836517da7cac03b570a664b49b
commit: 9b1283f2bec2134030e1e099b900579f1f03840e [2870/2870] mm/vmalloc: Extend vmalloc usage about hugepage
config: x86_64-buildonly-randconfig-001-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091546.3rklFVnn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091546.3rklFVnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091546.3rklFVnn-lkp@intel.com/

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
