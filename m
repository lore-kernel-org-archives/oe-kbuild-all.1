Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E10F137B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 02:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mt0j3/tS"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696472740; x=1728008740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dnJnX5hAff+ManegapEbrynGyUo4W6bZFDhKV/0ekJs=;
  b=Mt0j3/tSAkpf+uksznZD+jugEA/nLnWSiX6UKcAniKhs2NzOwMFA4xC/
   bhheyBYH1QpFj1QMlTYdQtcqC5RMkMMsLCVZI7n0sb2U95igAtte1GXzb
   AVXl9Lc9G4f+GXmx89mY6sqcq7CtuM/dCAc9DpZAF61Ihi6n4GNeHD+Ja
   eMJo9LW3w6V1H4VOyys3QyLjPIlaQQw+YsSN/VXavZYWDkQIuXWj4ojLc
   sctY130Raoa0jqdcERbTDc+mv2pWn8yZoDJwDr+Bs5vX8R0wDX9iZ9BsR
   YmhQxsjPSRGn4k+6SvIpWkjB0N5xJqSkAUpZAFxNPFSGYIkYfIKlGqO6z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="387250967"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="387250967"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 19:25:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="786769385"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="786769385"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 04 Oct 2023 19:25:38 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoE3T-000Ksm-22;
	Thu, 05 Oct 2023 02:25:35 +0000
Date: Thu, 5 Oct 2023 10:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-nicolin 70/77]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3271:35: error: initialization
 of 'struct iommu_domain * (*)(struct device *, struct mm_struct *)' from
 incompatible pointer type 'struct iommu_domain * (*)(void)'
Message-ID: <202310051053.XhCAKLkq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-nicolin
head:   8dd48fa77a5ca024bb65d8e6c8314ce913765386
commit: cb3febb63e999ddd4e972b313f3b8b2dba29528d [70/77] iommu: Add ops->domain_alloc_sva()
config: arm64-randconfig-004-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051053.XhCAKLkq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051053.XhCAKLkq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051053.XhCAKLkq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3271:35: error: initialization of 'struct iommu_domain * (*)(struct device *, struct mm_struct *)' from incompatible pointer type 'struct iommu_domain * (*)(void)' [-Werror=incompatible-pointer-types]
    3271 |         .domain_alloc_sva       = arm_smmu_sva_domain_alloc,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3271:35: note: (near initialization for 'arm_smmu_ops.domain_alloc_sva')
   cc1: some warnings being treated as errors


vim +3271 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3265	
  3266	static struct iommu_ops arm_smmu_ops = {
  3267		.identity_domain	= &arm_smmu_identity_domain,
  3268		.blocked_domain		= &arm_smmu_blocked_domain,
  3269		.capable		= arm_smmu_capable,
  3270		.domain_alloc_paging    = arm_smmu_domain_alloc_paging,
> 3271		.domain_alloc_sva       = arm_smmu_sva_domain_alloc,
  3272		.probe_device		= arm_smmu_probe_device,
  3273		.release_device		= arm_smmu_release_device,
  3274		.device_group		= arm_smmu_device_group,
  3275		.of_xlate		= arm_smmu_of_xlate,
  3276		.get_resv_regions	= arm_smmu_get_resv_regions,
  3277		.remove_dev_pasid	= arm_smmu_remove_dev_pasid,
  3278		.dev_enable_feat	= arm_smmu_dev_enable_feature,
  3279		.dev_disable_feat	= arm_smmu_dev_disable_feature,
  3280		.page_response		= arm_smmu_page_response,
  3281		.def_domain_type	= arm_smmu_def_domain_type,
  3282		.pgsize_bitmap		= -1UL, /* Restricted during device attach */
  3283		.owner			= THIS_MODULE,
  3284		.default_domain_ops = &(const struct iommu_domain_ops) {
  3285			.attach_dev		= arm_smmu_attach_dev,
  3286			.map_pages		= arm_smmu_map_pages,
  3287			.unmap_pages		= arm_smmu_unmap_pages,
  3288			.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
  3289			.iotlb_sync		= arm_smmu_iotlb_sync,
  3290			.iova_to_phys		= arm_smmu_iova_to_phys,
  3291			.enable_nesting		= arm_smmu_enable_nesting,
  3292			.free			= arm_smmu_domain_free,
  3293		}
  3294	};
  3295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
