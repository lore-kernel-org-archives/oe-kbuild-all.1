Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BAE2018C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 21:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692740049; x=1724276049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WbXlrkQezR0OLBTSXt88HkF1tO2tP50EXjHAuD8Q2/Q=;
  b=ng+eV9nJuKwvLE1AJT1DETbaesD/cLYuXv9UjC0bcnKg8QY4HbKd695U
   Ngo9lMo81BkSgqf91HPSFugZ6xFa3QGKmi209+pneMijrsgZOIp/DIMIa
   XvbLEUF+NGe0moUB0uuanFUTrZermt71P/hfo6BqUZ7UqJqVaxH2WLV57
   OwPfI4gRk5iZZaK72dL/IuVCl2MfifZ4Yj1SUMMcdNbBKnkGaG6dckPNM
   pdxPIDFdIuHVY0Kju4+DYtjgltpu89kzyWmbaEnCMwNZKJye/tJw6/KLY
   FtXLcRGYqXFNvsaI+rApwVO8Kcw/YcAB+ctUVNwNsKF5sZh9MfRfmGLBU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="437932836"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="437932836"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 14:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765897415"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="765897415"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Aug 2023 14:34:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYZ0o-0000Xk-1f;
	Tue, 22 Aug 2023 21:34:06 +0000
Date: Wed, 23 Aug 2023 05:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-0822 74/86]
 drivers/iommu/iommu.c:3399: warning: Function parameter or member 'dev' not
 described in 'iommu_replace_device_pasid'
Message-ID: <202308230531.yhkrblo3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-0822
head:   426d61ce13f336809ba8d8720761c165b1de60fc
commit: bc362b8aee2f543bb360945500d763dcb515eb78 [74/86] iommu: Introduce a replace API for device pasid
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230823/202308230531.yhkrblo3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230531.yhkrblo3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230531.yhkrblo3-lkp@intel.com/

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
