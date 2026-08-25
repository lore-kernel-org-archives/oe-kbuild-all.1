Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC10378D64
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 14:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666663; cv=none; b=B04fqW47BmF0lF7DrpHYcNpvMo2iQzq7toY/ls6Ll4kpLmYDMl7HHUyhIWLI/R90ulM+n73m9j2m2OTTds7jhRhUpKSgCpb+NAhrBsIevyVJCTGHF0FKsx88n4es1mkAqEGIdqNTFevH1pv9cKmwkHBHQy+Vlie8lWp72GXJFVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666663; c=relaxed/simple;
	bh=1e1/+UhZAMfYJxkdErOfEXbsqxmSXWzW/9stE9mPvN4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ex8nc3/j+OQINiad6IbbLXIskKjwCKTFy77jDJvM6oqYZre0wvs88jesx6gShC7HnvM9696FTdsSxfuK9iaSjKtkUfRjQmb8coZARyO66nQj3I8vxTHc9xP/X7wboATeM6y/p6Y5Vc/19UrEXK27zWda1XzNRW/OU7BgHsLgmG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVdnL1v/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVdnL1v/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787666662; x=1819202662;
  h=date:from:to:cc:subject:message-id;
  bh=1e1/+UhZAMfYJxkdErOfEXbsqxmSXWzW/9stE9mPvN4=;
  b=MVdnL1v/Mv7iMNktk/fdJDqmatVkTMoCY5f7idu5GAsvZa7F1RcYIKQB
   pq7BpXESTXyz9x0+7JUGaW/N+tKPSbEfAtFiY8uOkxqnnmwajXglIix7R
   wfMtKnNh6jlhKrY3G4k2+y7/RIJOSPlEgHIpFjSmKRmpwMW/PM1UScRRW
   4J0f1X9jYJb8zxuDmHYho7SRrV8h6pf1Oct6hU3m+r7s2FDnEwf6WOXsT
   Ek08I68kqXjXGDEAwmpanhZACwqXq/Wi6qblxGhUOXr33ayZt3DAvF16U
   sz9K817vZayL4aZLeb7BlDokEyhICELX0oTWSTAHCsVCVRREXxcV/EpWG
   w==;
X-CSE-ConnectionGUID: LnAMZQqTSAyfPQxH6WwsWw==
X-CSE-MsgGUID: BtTXmrkJQE+P35O5zMu7eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87993543"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="87993543"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 07:04:22 -0700
X-CSE-ConnectionGUID: CzruBr/6SYOaiRYhcdE4Eg==
X-CSE-MsgGUID: YXaVh/aNTR+i+i0/uZCfWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="264025539"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Aug 2026 07:04:20 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyrlB-000000005wU-2Hca;
	Tue, 25 Aug 2026 14:04:17 +0000
Date: Tue, 25 Aug 2026 22:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:headers 16/21]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:236:2: error: call to
 undeclared function 'unlock_page'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202608252110.deAyQBf3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   2c16f123eb253c5d93edfe0e5439120f8f7e3afa
commit: 8f4b7541e27a9da8c5d1d0908af1e739b6e05e05 [16/21] drm/amd: Remove pagemap.h includes
config: x86_64-randconfig-005-20260825 (https://download.01.org/0day-ci/archive/20260825/202608252110.deAyQBf3-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608252110.deAyQBf3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608252110.deAyQBf3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:236:2: error: call to undeclared function 'unlock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     236 |         unlock_page(page);
         |         ^
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:256:3: error: call to undeclared function 'lock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     256 |                 lock_page(page);
         |                 ^
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:256:3: note: did you mean 'copy_page'?
   arch/x86/include/asm/page_64.h:117:6: note: 'copy_page' declared here
     117 | void copy_page(void *to, void *from);
         |      ^
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:266:2: error: call to undeclared function 'unlock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     266 |         unlock_page(page);
         |         ^
   3 errors generated.


vim +/unlock_page +236 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c

0b0e518d61af8e1 Felix Kuehling 2021-02-24  229  
0b0e518d61af8e1 Felix Kuehling 2021-02-24  230  static void
0b0e518d61af8e1 Felix Kuehling 2021-02-24  231  svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
0b0e518d61af8e1 Felix Kuehling 2021-02-24  232  {
0b0e518d61af8e1 Felix Kuehling 2021-02-24  233  	struct page *page;
0b0e518d61af8e1 Felix Kuehling 2021-02-24  234  
0b0e518d61af8e1 Felix Kuehling 2021-02-24  235  	page = pfn_to_page(svm_migrate_addr_to_pfn(adev, addr));
0b0e518d61af8e1 Felix Kuehling 2021-02-24 @236  	unlock_page(page);
0b0e518d61af8e1 Felix Kuehling 2021-02-24  237  	put_page(page);
0b0e518d61af8e1 Felix Kuehling 2021-02-24  238  }
0b0e518d61af8e1 Felix Kuehling 2021-02-24  239  
48ff079b28d82db Felix Kuehling 2021-03-17  240  static unsigned long
48ff079b28d82db Felix Kuehling 2021-03-17  241  svm_migrate_addr(struct amdgpu_device *adev, struct page *page)
48ff079b28d82db Felix Kuehling 2021-03-17  242  {
48ff079b28d82db Felix Kuehling 2021-03-17  243  	unsigned long addr;
48ff079b28d82db Felix Kuehling 2021-03-17  244  
48ff079b28d82db Felix Kuehling 2021-03-17  245  	addr = page_to_pfn(page) << PAGE_SHIFT;
610dab118ff5013 Philip Yang    2023-03-31  246  	return (addr - adev->kfd.pgmap.range.start);
48ff079b28d82db Felix Kuehling 2021-03-17  247  }
48ff079b28d82db Felix Kuehling 2021-03-17  248  
48ff079b28d82db Felix Kuehling 2021-03-17  249  static struct page *
48ff079b28d82db Felix Kuehling 2021-03-17  250  svm_migrate_get_sys_page(struct vm_area_struct *vma, unsigned long addr)
48ff079b28d82db Felix Kuehling 2021-03-17  251  {
48ff079b28d82db Felix Kuehling 2021-03-17  252  	struct page *page;
48ff079b28d82db Felix Kuehling 2021-03-17  253  
48ff079b28d82db Felix Kuehling 2021-03-17  254  	page = alloc_page_vma(GFP_HIGHUSER, vma, addr);
48ff079b28d82db Felix Kuehling 2021-03-17  255  	if (page)
48ff079b28d82db Felix Kuehling 2021-03-17 @256  		lock_page(page);
48ff079b28d82db Felix Kuehling 2021-03-17  257  
48ff079b28d82db Felix Kuehling 2021-03-17  258  	return page;
48ff079b28d82db Felix Kuehling 2021-03-17  259  }
48ff079b28d82db Felix Kuehling 2021-03-17  260  

:::::: The code at line 236 was first introduced by commit
:::::: 0b0e518d61af8e1cb73cbbfb313b215640c8a6f3 drm/amdkfd: HMM migrate ram to vram

:::::: TO: Felix Kuehling <Felix.Kuehling@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
