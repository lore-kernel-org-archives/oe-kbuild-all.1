Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF4F3B1EE2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758601; cv=none; b=KaDpFn4GX646vkyL7mJxU3GPjmrNXT/KUJBS+Bd9hl65vLEAi5UjjyRktpB4GuHiCaUUoBcwohxBI57OlTsgw+qpPMku4I0dO56CqVxuIQOP9A8qTW1v0qpsF87TlYrkmVI841xj4a2c8riV2nUksDKbeNj2LPU6pVbwW63r35s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758601; c=relaxed/simple;
	bh=3uyt1RCHxCSbTYTvw9H22AC1+EDjAyzbdV+Y6iTKKJE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k6u5eS/ycxH9xUMBRlr6SV9XiPg8AJRuYPulSRvwh4iyUKvUNVjRfeC+c17pPt516PNn7hRNNEo8yIlW89+RKIY8UZ6J7+sXa/sZti6XS3bqEvWm+Y+9bSvb8V6VpsCUP0z8xU2KdXOVZCkMn/BcYp9bRfe1kotddtKRroOiI0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnvvL5Qu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnvvL5Qu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778758600; x=1810294600;
  h=date:from:to:cc:subject:message-id;
  bh=3uyt1RCHxCSbTYTvw9H22AC1+EDjAyzbdV+Y6iTKKJE=;
  b=bnvvL5QuYdfWdOTj4dSKmWV8Ahja2yPfbMm7GFvE4rQCbGPDKhnaz+8K
   t0CabMeGUdkPvK11S7G7rXsaHV7Egq4rSpfRYgXTqkvRlwGWpU8bHO3Zn
   F7AFPL4K2Pt0Eh5mEYLs3kYATyzGlvU5WKS7wGKMGeKpfyXzGAgbFWQRi
   97WZ2UorN+do8XvA+E1WS4J2sYgeEdjjC6YS7I21sNDTXYf5ubnsWnatf
   Tibi3NkbVGsMZpoJnzIoB+UVYXE3qHB3y2qr5e2ds/c1Ae5FFNK1yfqT4
   8V8qdRF36ON9/mwIE9OLbQHjI3gEvAEDwJ7SUWwqkdRZCV36v2W4o+ZWA
   A==;
X-CSE-ConnectionGUID: veeVxfsaRfWtCEtOM6ApAQ==
X-CSE-MsgGUID: tsLKpCiOSUW4/m3Z6ze4fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79411741"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79411741"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 04:36:40 -0700
X-CSE-ConnectionGUID: +OdASjehRaGNTWQLwi4Ryw==
X-CSE-MsgGUID: 6zjDxPMlToK+jUajAQQ0rQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 May 2026 04:36:38 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNUMl-000000006RT-2XXD;
	Thu, 14 May 2026 11:36:35 +0000
Date: Thu, 14 May 2026 19:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:62:6: sparse: sparse: symbol
 '__kvm_iommu_reclaim_pages' was not declared. Should it be static?
Message-ID: <202605141938.OGFufsvB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5346453405bf12d7ed6003f45dd47b71744fe1be
commit: 4ad0b651d058e1858771f56a77a1118863f594aa [2/2] ANDROID: KVM: arm64: iommu: Add pgtable allocation functions
config: arm64-randconfig-r122-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141938.OGFufsvB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141938.OGFufsvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141938.OGFufsvB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:44:6: sparse: sparse: symbol '__kvm_iommu_donate_pages' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:62:6: sparse: sparse: symbol '__kvm_iommu_reclaim_pages' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:106:5: sparse: sparse: symbol 'kvm_iommu_refill' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:116:6: sparse: sparse: symbol 'kvm_iommu_reclaim' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:125:5: sparse: sparse: symbol 'kvm_iommu_reclaimable' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:163:21: sparse: sparse: Using plain integer as NULL pointer

vim +/__kvm_iommu_reclaim_pages +62 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    61	
  > 62	void __kvm_iommu_reclaim_pages(struct hyp_pool *pool, void *p, u8 order)
    63	{
    64		/*
    65		 * Order MUST be same allocated page, however the buddy allocator
    66		 * is allowed to give higher order pages.
    67		 */
    68		BUG_ON(order > hyp_virt_to_page(p)->order);
    69	
    70		hyp_put_page(pool, p);
    71	}
    72	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
