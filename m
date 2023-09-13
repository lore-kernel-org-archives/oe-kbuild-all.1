Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D391F17C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 20:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694638212; x=1726174212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wM8uN68G3J8+q2J5ZJbltzMFL7AyedeCLYN4EVE/9Sc=;
  b=YBiAo2GiEg0GTo0tft9r+JLqDnIiaxG6mdeCeDbqb2GQiLvBle2rt8li
   ZdCxqnm5hHVlgkjVm8EGnBsPvB2ZmaR+Yaog7KP5WZlGaW7MkbdD5fzTg
   5HobJBkv6b8RHkEjSq0I2O/gAJ6HBd2M9mh+mk6BD3qeds8eSKzArhNVi
   R8eB8RKlQP0sSahd6EoBMYp6AgavluXKk3Tpqruwfpmg2LuhjwXX0kExA
   TVF1kN+nFpvc7jVyIPaMJQDQCi5IkunvZYh40+YFqV//UpezEEFSk1xUl
   AQwKj72TSnPPNJxVOte0P39Gw2ihlgZxWp1ZAyuzEH9WyvlnCFumc0swS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377690772"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="377690772"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 13:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="834464314"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="834464314"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Sep 2023 13:50:10 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgWoK-0000cK-0H;
	Wed, 13 Sep 2023 20:50:08 +0000
Date: Thu, 14 Sep 2023 04:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-0911 57/84]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3007:35: error: initialization
 of 'struct iommu_domain * (*)(struct device *, enum iommu_hwpt_type,  u32,
  struct iommu_domain *, const struct iommu_user_data *)' {aka 'struct
 iommu_domain * (*)(struct device *,...
Message-ID: <202309140403.Ep5lj1Ep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-0911
head:   4c10aafdf2543a20df9745ed3fc57bb6075597e4
commit: 58248c304edad4a82bd26e3161d13a004820c0ac [57/84] iommu/arm-smmu-v3: Add arm_smmu_domain_alloc_user
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230914/202309140403.Ep5lj1Ep-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140403.Ep5lj1Ep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140403.Ep5lj1Ep-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3007:35: error: initialization of 'struct iommu_domain * (*)(struct device *, enum iommu_hwpt_type,  u32,  struct iommu_domain *, const struct iommu_user_data *)' {aka 'struct iommu_domain * (*)(struct device *, enum iommu_hwpt_type,  unsigned int,  struct iommu_domain *, const struct iommu_user_data *)'} from incompatible pointer type 'struct iommu_domain * (*)(struct device *, enum iommu_hwpt_type,  struct iommu_domain *, const struct iommu_user_data *)' [-Werror=incompatible-pointer-types]
    3007 |         .domain_alloc_user      = arm_smmu_domain_alloc_user,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3007:35: note: (near initialization for 'arm_smmu_ops.domain_alloc_user')
   cc1: some warnings being treated as errors


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
