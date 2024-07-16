Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37001B812
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 22:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721169742; cv=none; b=sdRjEamSGlFTo0NE+6P4PYcrjfbRISYvRfWX5UVz3zx7EG/5PIiMRI8IUKrjXqZf5a7Mfys2B47RyOlRx980PNXRvTNnnGDA5biGnIt07ZkuBDgUaYZadhG1Q1QrVlaQfjf3P3/2O/3VTr4S0fVvodZzfEqgmvwZA2oZ5habXEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721169742; c=relaxed/simple;
	bh=WrQNaCdnVxYgVaU6UffE8P+AXQNBiQkLpFQ1w4JSlew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lhe2LHWofnK1lY7pCJuwsmr0Ib1yMxcKLvOG3jU/m6Y6uejPuqvPJohiTfpbXdHoz9tHNsE8fvH/nwmB1q2yV909f3bmVawNuWRZxav5eK8XKFwcFVQVfpqUnExta0ocMtoKilQlzldHBe9fqsG+DYuv9zm/M4Ol4EKDA/rBvCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n++CP9Fy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n++CP9Fy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721169741; x=1752705741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WrQNaCdnVxYgVaU6UffE8P+AXQNBiQkLpFQ1w4JSlew=;
  b=n++CP9FylkBfIbP5bPhliX9r3qjiE2DlKFHIbJjfgBieD+2nZFX3UoBg
   RJH/3fjnyDrXvBv45KyS3j7OM6Q1WbAXtQGdjwsUVl/CXMEQWZAf6qkFD
   7DOspCuf6HVnaAeBJWYHHuLbgyosRcH68IPhaDpBmBe7BL2qOYVls5IzE
   cIDG5MM+g0Qc0rHJmi5ZJ0htNTZoN6fq8pKaJTwCWJLRiP4pWvPQTs2Lz
   z8OE22ceDq9RmIvTocX8rPO7uNZS+iLyUDg69u5XOOBh8H0z4yVXKBvtz
   AW2FSqyeCjg2tZLdm851LqxXoYyyrvfRXpEvPQC8FRvCoj47jbq6hhyoX
   Q==;
X-CSE-ConnectionGUID: qiqIoudGR2W54GBk53eERw==
X-CSE-MsgGUID: 2AhCsFBFRfOqZq9zXLeRag==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="21549761"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="21549761"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 15:42:20 -0700
X-CSE-ConnectionGUID: Mr6vUNghRauSwPQ4hFsPZw==
X-CSE-MsgGUID: /O2qWcECTMmOeZ6SBGpD4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="81223848"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jul 2024 15:42:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTqsC-000fjK-2e;
	Tue, 16 Jul 2024 22:42:16 +0000
Date: Wed, 17 Jul 2024 06:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:smmuv3_nesting 15/19]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3470:10: sparse: sparse:
 Initializer entry defined twice
Message-ID: <202407170654.PIUlYz43-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux smmuv3_nesting
head:   1ee034158fa9e77d094ecafa02c82c32800862ce
commit: bb5724174c5b2c69cedd40f606284b484ed44666 [15/19] iommu/arm-smmu-v3: Implement IOMMU_HWPT_ALLOC_NEST_PARENT
config: arm64-randconfig-r112-20240716 (https://download.01.org/0day-ci/archive/20240717/202407170654.PIUlYz43-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240717/202407170654.PIUlYz43-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170654.PIUlYz43-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through include/linux/resource_ext.h, include/linux/acpi.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3470:10: sparse: sparse: Initializer entry defined twice
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3472:10: sparse:   also defined here

vim +3470 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3463	
  3464	static struct iommu_ops arm_smmu_ops = {
  3465		.identity_domain	= &arm_smmu_identity_domain,
  3466		.blocked_domain		= &arm_smmu_blocked_domain,
  3467		.capable		= arm_smmu_capable,
  3468		.hw_info		= arm_smmu_hw_info,
  3469		.domain_alloc_paging    = arm_smmu_domain_alloc_paging,
> 3470		.domain_alloc_user	= arm_smmu_domain_alloc_user,
  3471		.domain_alloc_sva       = arm_smmu_sva_domain_alloc,
  3472		.domain_alloc_user	= arm_smmu_domain_alloc_user,
  3473		.probe_device		= arm_smmu_probe_device,
  3474		.release_device		= arm_smmu_release_device,
  3475		.device_group		= arm_smmu_device_group,
  3476		.of_xlate		= arm_smmu_of_xlate,
  3477		.get_resv_regions	= arm_smmu_get_resv_regions,
  3478		.remove_dev_pasid	= arm_smmu_remove_dev_pasid,
  3479		.dev_enable_feat	= arm_smmu_dev_enable_feature,
  3480		.dev_disable_feat	= arm_smmu_dev_disable_feature,
  3481		.page_response		= arm_smmu_page_response,
  3482		.def_domain_type	= arm_smmu_def_domain_type,
  3483		.pgsize_bitmap		= -1UL, /* Restricted during device attach */
  3484		.owner			= THIS_MODULE,
  3485		.default_domain_ops = &(const struct iommu_domain_ops) {
  3486			.attach_dev		= arm_smmu_attach_dev,
  3487			.set_dev_pasid		= arm_smmu_s1_set_dev_pasid,
  3488			.map_pages		= arm_smmu_map_pages,
  3489			.unmap_pages		= arm_smmu_unmap_pages,
  3490			.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
  3491			.iotlb_sync		= arm_smmu_iotlb_sync,
  3492			.iova_to_phys		= arm_smmu_iova_to_phys,
  3493			.free			= arm_smmu_domain_free_paging,
  3494		}
  3495	};
  3496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
