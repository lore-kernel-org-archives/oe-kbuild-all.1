Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740F212837E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 02:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711421089; cv=none; b=fExxcppjmoJJe1vozzcVX6m+uBnspOkliiQbohWsDh0XxaY7bxlx/i71+dLwK3ayFlyD+LRZ5c1TXs2inkoiXiJteGZANKsLivcLxFN8IPtR6bdHJ8bSjgyPIUwNXeW3rtA4K/yDRw6kkvxNJy/rM7Reos+XWrsINJKRiivgp7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711421089; c=relaxed/simple;
	bh=cjd0mX7euuv810l/pIIkP8fU1MxI1wEExOtoFfsnn3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kp/8QTNUH+kpZ7xkXjhOhoZ0gH2UkIg+0FYyrkxgGpZiR4pxp4n7Ru9jljUYrsItN3647XjxdfEjHsFjLIU+VHc1+32QhN1HpgpVeq8wBvxTBpKG+qapVCw+EPT5PiHLlknF+fqm2Efr+cnLR3wjAJDBL+QZJnahY4BkCYo30PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJXwtNrd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJXwtNrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711421087; x=1742957087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cjd0mX7euuv810l/pIIkP8fU1MxI1wEExOtoFfsnn3k=;
  b=HJXwtNrdriRs5c5eRk6Q/r6JfwHJtbovtIliS3cG4Ssd7JY4FM4WmQlP
   AxxGiYzSX2Po1W7y+VTmpVjtfr4zIjLEEeQlSeNouxVpBFsXm9lTUzbeH
   eW/EJXFGftAUr1lir2Q8xm4hrSkHXWtsKl1frOE3mZKy1kV+e/frt3YTD
   D4gZQ83Facvi9JllOaYnaZiKKs0TbQmXlP2AvdAwlokYAPi/P2puz46dh
   NJ0YIicwh1gGHgGinhox9y4Z5lhTYGj37+yyAZluQ1LziicOhVATrP7F0
   ykNXhAxsHFcU66XN4wIHlcM6LSKNu629balXACrMDkZOidzn+UXPulo1l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6564124"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6564124"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 19:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="15854724"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Mar 2024 19:44:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rownr-000N4M-3D;
	Tue, 26 Mar 2024 02:44:43 +0000
Date: Tue, 26 Mar 2024 10:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid+siov-20240322 11/33]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:585:35: error:
 initialization of 'int (*)(struct iommu_domain *, struct device *, ioasid_t,
  struct iommu_domain *)' {aka 'int (*)(struct iommu_domain *, struct device
 *, unsigned int,  struct iommu_domain *...
Message-ID: <202403261057.1yVsAJ8l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid+siov-20240322
head:   c9ef695821f4d45f43706cbef0a60283f6040390
commit: a49f010700846ab583ef43419527f60b3ea2ae4e [11/33] iommu: Pass existing domain for set_dev_pasid op
config: arm64-randconfig-r131-20240325 (https://download.01.org/0day-ci/archive/20240326/202403261057.1yVsAJ8l-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240326/202403261057.1yVsAJ8l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403261057.1yVsAJ8l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:585:35: error: initialization of 'int (*)(struct iommu_domain *, struct device *, ioasid_t,  struct iommu_domain *)' {aka 'int (*)(struct iommu_domain *, struct device *, unsigned int,  struct iommu_domain *)'} from incompatible pointer type 'int (*)(struct iommu_domain *, struct device *, ioasid_t)' {aka 'int (*)(struct iommu_domain *, struct device *, unsigned int)'} [-Werror=incompatible-pointer-types]
     585 |         .set_dev_pasid          = arm_smmu_sva_set_dev_pasid,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:585:35: note: (near initialization for 'arm_smmu_sva_domain_ops.set_dev_pasid')
   cc1: some warnings being treated as errors


vim +585 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c

386fa64fd52baa Lu Baolu 2022-10-31  583  
386fa64fd52baa Lu Baolu 2022-10-31  584  static const struct iommu_domain_ops arm_smmu_sva_domain_ops = {
386fa64fd52baa Lu Baolu 2022-10-31 @585  	.set_dev_pasid		= arm_smmu_sva_set_dev_pasid,
386fa64fd52baa Lu Baolu 2022-10-31  586  	.free			= arm_smmu_sva_domain_free
386fa64fd52baa Lu Baolu 2022-10-31  587  };
386fa64fd52baa Lu Baolu 2022-10-31  588  

:::::: The code at line 585 was first introduced by commit
:::::: 386fa64fd52baadb849ed60c78b024fd1618278e arm-smmu-v3/sva: Add SVA domain support

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
