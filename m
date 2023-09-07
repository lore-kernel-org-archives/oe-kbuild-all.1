Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541F714018
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 19:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694115933; x=1725651933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WlvYNkYYZPov+3ryxTMtgnZUFh7XIOGkF3AKH5QUpCk=;
  b=eROy/R03Oc6+G0CCvEfNTvUGq7GIp9GtfLm+CyFT/MWBRTQQgXS4nPWT
   qcalj9u2fOud2NGMYglFZkOIcapjBcnyKOBvbeUNLzqGqdjhgmrH1bBeH
   5zYT5akzd+Ldihsktgp1xxw1i8j7g+RAZu8JFb2b1TllgiGuhh+TXPxjd
   JmDaVPw4AaThJAWWLtB2fA9gcRcmqrX4F0EoI9WW7JVR74gjZyW7EcMZy
   M0Dcx95lj2EeZ5NLl8ECtMxhE9o3gZ8lDF7b//atJwskyO6SKrL+3GGCL
   ZDBAvrUiNz3qu8VPYnkD9OIvQjDPeUL4pLCeD/hxWSYhoiGsb+PaSIHen
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463844537"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="463844537"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 12:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="777200028"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="777200028"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Sep 2023 12:45:30 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeKwS-0001WW-0t;
	Thu, 07 Sep 2023 19:45:28 +0000
Date: Fri, 8 Sep 2023 03:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting_09072023-yi 57/63]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3000:29: error: redefinition of
 'arm_smmu_domain_alloc'
Message-ID: <202309080335.O2wbGI0Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting_09072023-yi
head:   460a16348f1eeb401a169d0ad1815f8ac4d8c3b2
commit: 8edfc9bba9237d52efb488511659a6a534d4d0e6 [57/63] iommu/arm-smmu-v3: Add arm_smmu_domain_alloc_user
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230908/202309080335.O2wbGI0Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080335.O2wbGI0Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080335.O2wbGI0Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3000:29: error: redefinition of 'arm_smmu_domain_alloc'
    3000 | static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
         |                             ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2069:29: note: previous definition of 'arm_smmu_domain_alloc' with type 'struct iommu_domain *(unsigned int)'
    2069 | static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
         |                             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3036:35: error: initialization of 'struct iommu_domain * (*)(struct device *, enum iommu_hwpt_type,  u32,  struct iommu_domain *, const struct iommu_user_data *)' {aka 'struct iommu_domain * (*)(struct device *, enum iommu_hwpt_type,  unsigned int,  struct iommu_domain *, const struct iommu_user_data *)'} from incompatible pointer type 'struct iommu_domain * (*)(struct device *, enum iommu_hwpt_type,  struct iommu_domain *, const struct iommu_user_data *)' [-Werror=incompatible-pointer-types]
    3036 |         .domain_alloc_user      = arm_smmu_domain_alloc_user,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3036:35: note: (near initialization for 'arm_smmu_ops.domain_alloc_user')
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2069:29: warning: 'arm_smmu_domain_alloc' defined but not used [-Wunused-function]
    2069 | static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
         |                             ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/arm_smmu_domain_alloc +3000 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  2999	
> 3000	static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
  3001	{
  3002		return __arm_smmu_domain_alloc(type, NULL, NULL);
  3003	}
  3004	
  3005	static struct iommu_domain *
  3006	arm_smmu_domain_alloc_user(struct device *dev, enum iommu_hwpt_type hwpt_type,
  3007				   struct iommu_domain *parent,
  3008				   const struct iommu_user_data *user_data)
  3009	{
  3010		const size_t min_len = offsetofend(struct iommu_hwpt_arm_smmuv3, out_event_uptr);
  3011		struct arm_smmu_master *master = dev_iommu_priv_get(dev);
  3012		struct iommu_hwpt_arm_smmuv3 data, *user_cfg = NULL;
  3013		unsigned type = IOMMU_DOMAIN_UNMANAGED;
  3014	
  3015		if (hwpt_type != IOMMU_HWPT_TYPE_DEFAULT &&
  3016		    hwpt_type != IOMMU_HWPT_TYPE_ARM_SMMUV3)
  3017			return ERR_PTR(-EINVAL);
  3018		if (hwpt_type == IOMMU_HWPT_TYPE_DEFAULT && user_data)
  3019			return ERR_PTR(-EINVAL);
  3020	
  3021		if (user_data) {
  3022			int ret = iommu_copy_user_data(&data, user_data,
  3023						       sizeof(data), min_len);
  3024			if (ret)
  3025				return ERR_PTR(ret);
  3026			user_cfg = &data;
  3027		}
  3028	
  3029		return __arm_smmu_domain_alloc(type, master, user_cfg);
  3030	}
  3031	
  3032	static struct iommu_ops arm_smmu_ops = {
  3033		.capable		= arm_smmu_capable,
  3034		.hw_info		= arm_smmu_hw_info,
  3035		.domain_alloc		= arm_smmu_domain_alloc,
> 3036		.domain_alloc_user	= arm_smmu_domain_alloc_user,
  3037		.probe_device		= arm_smmu_probe_device,
  3038		.release_device		= arm_smmu_release_device,
  3039		.set_dev_user_data	= arm_smmu_set_dev_user_data,
  3040		.unset_dev_user_data	= arm_smmu_unset_dev_user_data,
  3041		.device_group		= arm_smmu_device_group,
  3042		.of_xlate		= arm_smmu_of_xlate,
  3043		.get_resv_regions	= arm_smmu_get_resv_regions,
  3044		.remove_dev_pasid	= arm_smmu_remove_dev_pasid,
  3045		.dev_enable_feat	= arm_smmu_dev_enable_feature,
  3046		.dev_disable_feat	= arm_smmu_dev_disable_feature,
  3047		.page_response		= arm_smmu_page_response,
  3048		.def_domain_type	= arm_smmu_def_domain_type,
  3049		.pgsize_bitmap		= -1UL, /* Restricted during device attach */
  3050		.owner			= THIS_MODULE,
  3051		.default_domain_ops = &(const struct iommu_domain_ops) {
  3052			.attach_dev		= arm_smmu_attach_dev,
  3053			.map_pages		= arm_smmu_map_pages,
  3054			.unmap_pages		= arm_smmu_unmap_pages,
  3055			.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
  3056			.iotlb_sync		= arm_smmu_iotlb_sync,
  3057			.iova_to_phys		= arm_smmu_iova_to_phys,
  3058			.free			= arm_smmu_domain_free,
  3059		}
  3060	};
  3061	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
