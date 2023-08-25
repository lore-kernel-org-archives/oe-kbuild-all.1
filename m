Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33546CA4E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 12:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692965202; x=1724501202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y7zGVKFeqN1c2IqEkju6x1hGyRGnm+ZB8AT5PifIFbM=;
  b=YW6NjTAcJ95tf6bz03vsg8SOkgc85vl+dOAr/pcxjP41qoU3INLUOt/Y
   s7hLGoHuMQw6etmqQ3yFo76qt4PSAingzGeGgZ0w/9DU362b0XDwOoktT
   jh7H4gji/Mp4nkMrNtCcRTPnkjrctnMaqvfTigJUuL7+xnp3VywUmVzqK
   CGmT0Ue2FxAZaKtvOfBBA+IkhRpDAH2/bHLe3lJxSlcqeOjVwCL2CuWgB
   iZAhJ61uVwqlztm8SlkcbCz8xiKS0kyt8KsPF73TRH9g7DmoUTwWpKp29
   2JJpFJTn3V7lba4jFt4pO5lOP3e8CHRdlXjpPY1kv2vwVAPH97O7rJ7NT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="441046253"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="441046253"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 05:05:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="911266448"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="911266448"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Aug 2023 05:05:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZVZS-0003Xf-0x;
	Fri, 25 Aug 2023 12:05:46 +0000
Date: Fri, 25 Aug 2023 20:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-0825 74/95]
 drivers/iommu/iommu.c:3399: warning: Function parameter or member 'dev' not
 described in 'iommu_replace_device_pasid'
Message-ID: <202308252039.hsMBt8Cz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-0825
head:   98c119bc01ddf99ad4ac7c3e93980e3d835c0901
commit: bc362b8aee2f543bb360945500d763dcb515eb78 [74/95] iommu: Introduce a replace API for device pasid
config: i386-buildonly-randconfig-003-20230823 (https://download.01.org/0day-ci/archive/20230825/202308252039.hsMBt8Cz-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252039.hsMBt8Cz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252039.hsMBt8Cz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/iommu.c:3238: warning: Function parameter or member 'group' not described in 'iommu_group_release_dma_owner'
   drivers/iommu/iommu.c:3238: warning: Excess function parameter 'dev' description in 'iommu_group_release_dma_owner'
   drivers/iommu/iommu.c:3252: warning: Function parameter or member 'dev' not described in 'iommu_device_release_dma_owner'
   drivers/iommu/iommu.c:3252: warning: Excess function parameter 'group' description in 'iommu_device_release_dma_owner'
>> drivers/iommu/iommu.c:3399: warning: Function parameter or member 'dev' not described in 'iommu_replace_device_pasid'
>> drivers/iommu/iommu.c:3399: warning: Excess function parameter 'device' description in 'iommu_replace_device_pasid'


vim +3399 drivers/iommu/iommu.c

  3385	
  3386	/**
  3387	 * iommu_replace_device_pasid - replace the domain that a pasid is attached to
  3388	 * @domain: new IOMMU domain to replace with
  3389	 * @device: the physical device
  3390	 * @pasid: pasid that will be attached to the new domain
  3391	 *
  3392	 * This API allows the pasid to switch domains. Return 0 on success, or an
  3393	 * error. The pasid will roll back to use the old domain if failure. The
  3394	 * caller could call iommu_detach_device_pasid() before free the old domain
  3395	 * in order to avoid use-after-free case.
  3396	 */
  3397	int iommu_replace_device_pasid(struct iommu_domain *domain,
  3398				       struct device *dev, ioasid_t pasid)
> 3399	{
  3400		struct iommu_group *group = dev->iommu_group;
  3401		int ret;
  3402	
  3403		if (!domain)
  3404			return -EINVAL;
  3405	
  3406		if (!group)
  3407			return -ENODEV;
  3408	
  3409		mutex_lock(&group->mutex);
  3410		__iommu_remove_group_pasid(group, pasid);
  3411		xa_erase(&group->pasid_array, pasid);
  3412		ret = __iommu_group_attach_pasid(domain, group, pasid);
  3413		mutex_unlock(&group->mutex);
  3414	
  3415		return ret;
  3416	}
  3417	EXPORT_SYMBOL_NS_GPL(iommu_replace_device_pasid, IOMMUFD_INTERNAL);
  3418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
