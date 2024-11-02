Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D747602D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730540672; cv=none; b=Dnw98WfNa0dMTZ1dObrveSo6EcXYkWkOLTSTF5QSVmBdPC0KrFyX3m3CwVTQkcieXTaTQlQucpEijoP/yjLNz5GUv+SvVDPWeeCkKpJe15eY1ZfochXNGk3aLHMagNnWl01CI8EnV8bZe+x9QpUhPpfWrn70tUNfKYll3mzC1Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730540672; c=relaxed/simple;
	bh=OBAL+M3wcn0ZhvbPy1Bw2ewJyaH58cHbQahpeaS86qI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uzqe8yXSX14840S9wpbnDxZ8YIMlheiYqgh2UEJgugaOqWxFIEjKrYvkDrNH+dkSMfoxHpFZw45w7pLZHFwpYzs7pekyTLpvoydwcQSYL7az1aen8/SaZGWfW5bnIOtFQsxHlqii2GT7pcaEPSsotifP789yTf2BS+kVAgcrhp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDZDYUw1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDZDYUw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730540670; x=1762076670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OBAL+M3wcn0ZhvbPy1Bw2ewJyaH58cHbQahpeaS86qI=;
  b=KDZDYUw1M8TQpDsfM/YpHzGiy0D97aO6eDztRnM5buJ95V83AumDA6gM
   UXLMxX6Z806ZjHhSSZb+JEFFszFc/SxyM9U+/hkR4SQEExUXCl5aS60zq
   3ijPqoNP+QrYcEzfCMYGehTNWnQrB+sDkBHm5AIOHjinDvcCLYcFAAx9k
   I5v7x3t/B/NgHJH7HLEdCJQWZHI2Jc0k4oBa3imC/Ehy1hirBL4k8F2ns
   vid+pzHVYh4HjFAvzFTz6NkcJLD4H0rB3/NfBOFUx20WJsgKLd63TxXjd
   6J2FCnwatusVMiRqlXg/dEbG9VfGrLHpmbvvOBleLiZgwj+/EhcB4YMep
   A==;
X-CSE-ConnectionGUID: 0bQat1UvQ7q5ad3IgCqOgw==
X-CSE-MsgGUID: 7yzOEQSYQZSbvejNTVEgUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30254036"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30254036"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 02:44:28 -0700
X-CSE-ConnectionGUID: yUT3UIH9Qquhi4vY2psiBQ==
X-CSE-MsgGUID: LpzSlK18TeqvdnBfqO6Yrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="83293541"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Nov 2024 02:44:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7AgC-000ihN-2P;
	Sat, 02 Nov 2024 09:44:24 +0000
Date: Sat, 2 Nov 2024 17:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [jgunthorpe:smmuv3_nesting 21/39]
 drivers/iommu/iommufd/driver.c:40:16: error: redefinition of
 'iommufd_viommu_find_dev'
Message-ID: <202411021725.OB4bSSNw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux smmuv3_nesting
head:   23c28de51f2158aaebfd545a42cc2f015c98b8c4
commit: fad3fdebd11ef61f1991deea8761fde681b2fec3 [21/39] iommufd/viommu: Add iommufd_viommu_find_dev helper
config: i386-buildonly-randconfig-001-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021725.OB4bSSNw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021725.OB4bSSNw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021725.OB4bSSNw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/iommufd/driver.c:6:24: error: redefinition of '_iommufd_object_alloc'
       6 | struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/iommufd/iommufd_private.h:8,
                    from drivers/iommu/iommufd/driver.c:4:
   include/linux/iommufd.h:189:1: note: previous definition of '_iommufd_object_alloc' with type 'struct iommufd_object *(struct iommufd_ctx *, size_t,  enum iommufd_object_type)' {aka 'struct iommufd_object *(struct iommufd_ctx *, unsigned int,  enum iommufd_object_type)'}
     189 | _iommufd_object_alloc(struct iommufd_ctx *ictx, size_t size,
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/iommufd/driver.c:40:16: error: redefinition of 'iommufd_viommu_find_dev'
      40 | struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iommufd.h:196:1: note: previous definition of 'iommufd_viommu_find_dev' with type 'struct device *(struct iommufd_viommu *, long unsigned int)'
     196 | iommufd_viommu_find_dev(struct iommufd_viommu *viommu, unsigned long vdev_id)
         | ^~~~~~~~~~~~~~~~~~~~~~~


vim +/iommufd_viommu_find_dev +40 drivers/iommu/iommufd/driver.c

    38	
    39	/* Caller should xa_lock(&viommu->vdevs) to protect the return value */
  > 40	struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
    41					       unsigned long vdev_id)
    42	{
    43		struct iommufd_vdevice *vdev;
    44	
    45		lockdep_assert_held(&viommu->vdevs.xa_lock);
    46	
    47		vdev = xa_load(&viommu->vdevs, vdev_id);
    48		return vdev ? vdev->dev : NULL;
    49	}
    50	EXPORT_SYMBOL_NS_GPL(iommufd_viommu_find_dev, IOMMUFD);
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
