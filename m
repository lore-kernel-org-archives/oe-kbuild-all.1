Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BE515489
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 15:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692285264; x=1723821264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aNkxXHi2g8Z4XWXnp0K+3JRdDsBuL7qkTfJbEPN0PUo=;
  b=evGhTw3pTcAZ6PPIaAwhYbXmNlGmIjFPFeRAGepyw8h+hHVsdLhD6vja
   wStfsbF826OepUMBFZdPXetYeHCKehYfKVFZ0y/mGJrHlhxwsSLP5Sl1i
   OXel22Xod3IzI+hpmBDK3aIm0JqhwH8uj7xfw00kLI4nqebx+IqqOC26q
   5uESfsjXCDZwC5dgSl5Lsbk5foV3sK9w9QWHS6lSPX30yUGFnlGdDeqJ8
   wQuDbkDEpPs266THARmQdlXIDMKYjqPuieh8SSD30+2f3pPw+n4TiZiPD
   U56PjKPzaUrE+B6XbFhI9nsHkeIfgG2DjVSTVuMUmBbPI62H7UNdrY0b5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="439215544"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="439215544"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 08:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="908426954"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="908426954"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 08:14:21 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWehY-0001G1-0u;
	Thu, 17 Aug 2023 15:14:20 +0000
Date: Thu, 17 Aug 2023 23:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid 75/88]
 drivers/iommu/iommu.c:3399: warning: Function parameter or member 'dev' not
 described in 'iommu_replace_device_pasid'
Message-ID: <202308172315.iKkCLF1P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid
head:   f345e08bed2bf9a6885eb1b641261621d6ba3181
commit: 49058b0b98c7528867cf736260f586f7f0ef2ec3 [75/88] iommu: Introduce a replace API for device pasid
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230817/202308172315.iKkCLF1P-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172315.iKkCLF1P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172315.iKkCLF1P-lkp@intel.com/

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
