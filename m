Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0823F384
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 00:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694566341; x=1726102341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=awi8ncSAyO+5iEZzYJukVGjG58BR4xoLXcmn72Zn7Rg=;
  b=HmeNRMEfeiva7gkVjlUcZ01N1AOZTX+4P4JccgxJmndK2xaft0k+yU+D
   D2GpbZ9LSwxeg8TZ4RcPkvWzcNEZwS+U+nVOGP0Akeae9fbIjDcIJ0bTm
   nuWzY9zyAyd1wZ0EysPHK6WRT7/0JJWJOR0PNpkzqugAo+U3pXtEU9/1z
   Ki0pBVToCc5XO0msKNrf/sRtYmFT3rxaw4OzERqbhKhoRxrZ9QElbLVWk
   otJA5U+AarL/1mxaxBFNdAGUeu/ZB0rvKFdOlzkmHrdkBRDPDYDxjUw4d
   zMtO3mWVGTjgw3WxgVGEnHAXF1YxWne99MtfI9hB9WIlqxsb5hR1iPg2k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381234703"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="381234703"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 17:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="867571646"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="867571646"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Sep 2023 17:52:18 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgE76-0000Wp-1u;
	Wed, 13 Sep 2023 00:52:16 +0000
Date: Wed, 13 Sep 2023 08:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting_09082023-yi 57/63]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3007:23: error: incompatible
 function pointer types initializing 'struct iommu_domain *(*)(struct device
 *, enum iommu_hwpt_type, u32, struct iommu_domain *, const struct
 iommu_user_data *)' (aka 'struct iommu_d...
Message-ID: <202309130815.Lp23UyGo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting_09082023-yi
head:   2a038227662a29be3bfe0364ca1e5cac51cfa5b4
commit: 63938d23860ef6c010ff72e1dda6e977a9714e82 [57/63] iommu/arm-smmu-v3: Add arm_smmu_domain_alloc_user
config: arm64-randconfig-r011-20230913 (https://download.01.org/0day-ci/archive/20230913/202309130815.Lp23UyGo-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130815.Lp23UyGo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130815.Lp23UyGo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3007:23: error: incompatible function pointer types initializing 'struct iommu_domain *(*)(struct device *, enum iommu_hwpt_type, u32, struct iommu_domain *, const struct iommu_user_data *)' (aka 'struct iommu_domain *(*)(struct device *, enum iommu_hwpt_type, unsigned int, struct iommu_domain *, const struct iommu_user_data *)') with an expression of type 'struct iommu_domain *(struct device *, enum iommu_hwpt_type, struct iommu_domain *, const struct iommu_user_data *)' [-Wincompatible-function-pointer-types]
           .domain_alloc_user      = arm_smmu_domain_alloc_user,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +3007 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3002	
  3003	static struct iommu_ops arm_smmu_ops = {
  3004		.capable		= arm_smmu_capable,
  3005		.hw_info		= arm_smmu_hw_info,
  3006		.domain_alloc		= arm_smmu_domain_alloc,
> 3007		.domain_alloc_user	= arm_smmu_domain_alloc_user,
  3008		.probe_device		= arm_smmu_probe_device,
  3009		.release_device		= arm_smmu_release_device,
  3010		.set_dev_user_data	= arm_smmu_set_dev_user_data,
  3011		.unset_dev_user_data	= arm_smmu_unset_dev_user_data,
  3012		.device_group		= arm_smmu_device_group,
  3013		.of_xlate		= arm_smmu_of_xlate,
  3014		.get_resv_regions	= arm_smmu_get_resv_regions,
  3015		.remove_dev_pasid	= arm_smmu_remove_dev_pasid,
  3016		.dev_enable_feat	= arm_smmu_dev_enable_feature,
  3017		.dev_disable_feat	= arm_smmu_dev_disable_feature,
  3018		.page_response		= arm_smmu_page_response,
  3019		.def_domain_type	= arm_smmu_def_domain_type,
  3020		.pgsize_bitmap		= -1UL, /* Restricted during device attach */
  3021		.owner			= THIS_MODULE,
  3022		.default_domain_ops = &(const struct iommu_domain_ops) {
  3023			.attach_dev		= arm_smmu_attach_dev,
  3024			.map_pages		= arm_smmu_map_pages,
  3025			.unmap_pages		= arm_smmu_unmap_pages,
  3026			.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
  3027			.iotlb_sync		= arm_smmu_iotlb_sync,
  3028			.iova_to_phys		= arm_smmu_iova_to_phys,
  3029			.free			= arm_smmu_domain_free,
  3030		}
  3031	};
  3032	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
