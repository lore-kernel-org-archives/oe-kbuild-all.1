Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002DC18C91D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726059476; cv=none; b=Ai8llzjKkpfW12wYTGpVAB59wydqbpuSZ+X3tHgV70b8PQ04w6/iQKpDvwS52uop/vbaao27P4bQg65wyP39LA+WBUVu4SzHUBcBUUIK2tFBlNfMW1lzbbqvMecju1xWdBvCC76r6ofB9h96+0wZrPfdcHGK3E90CXhjhiMHirg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726059476; c=relaxed/simple;
	bh=aNcn/SX8vWG5UuNLH8Sgn+O4TKkpVygQFQ6IDRehroc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hxV6NkjeeZGKFeXPIOFzabwRtN6dYpeU/rE2lT8jqK+099I8TJGxFMEGhEvzS7lDJC6fGNRoO1v7t7lPxcp+8F9xqYxePmvvXZ8CXLdkJceA2ECLSyeJzxMO/tDzMx8vMmsvnIHBTHJaO3aLNTFbjqXTUMi1/blGZL8+Gh2qmLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/etFyss; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/etFyss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726059474; x=1757595474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aNcn/SX8vWG5UuNLH8Sgn+O4TKkpVygQFQ6IDRehroc=;
  b=m/etFyssA1bhoT59eTiToSSh9t4Io6o7YZj4yhKTQU8MvPQlnb44BcjI
   R7ocIlNXJ8k2LaC4E8/7KaDWNUoKEihy68psl8IhhSy8YeoqQ4HIsmZZX
   ePEzfypY9cAUC12UwwE6KWr2VF2NRGoEjolh4H6iKJOXpRbgEbZuQQheg
   u3de4HqIiLJo2ngUgjQBcSeG86xbQBldZy2qq4Fi1GWBgo1RVoz4DkvKZ
   Z38/MWdoGw5oSJQC2ul2qquNbWfwETAGNgf4K2PahFlykoKL2cAlvgNVJ
   W7IUiIizUc1xA6OLGsbFE6skl1XInJWdJhAU6yj0387w4IXNixWMYedu7
   w==;
X-CSE-ConnectionGUID: JzeV8xR/Rdu8WL5+gppyHw==
X-CSE-MsgGUID: OKp6/32hQ/eE3KH708ovmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36209932"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="36209932"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 05:57:53 -0700
X-CSE-ConnectionGUID: kB4qUzZVSTCWaMYk8pbLsQ==
X-CSE-MsgGUID: Vpg9q8drQxCJrOtF3D+uig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="71497934"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Sep 2024 05:57:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soMus-0003Ze-0j;
	Wed, 11 Sep 2024 12:57:50 +0000
Date: Wed, 11 Sep 2024 20:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240910 19/37]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3044:19: error: incompatible
 function pointer types initializing 'int (*)(struct iommu_domain *, struct
 device *, ioasid_t, struct iommu_domain *)' (aka 'int (*)(struct
 iommu_domain *, struct device *, unsigned ...
Message-ID: <202409112006.YMXPT87F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240910
head:   47bd94563684b36d40cac3c558ca963539dd5980
commit: 40f580261cf35cef57fc7ad2060f485e104a0967 [19/37] iommu/arm-smmu-v3: Make smmuv3 blocked domain support PASID
config: arm64-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240911/202409112006.YMXPT87F-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409112006.YMXPT87F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409112006.YMXPT87F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3044:19: error: incompatible function pointer types initializing 'int (*)(struct iommu_domain *, struct device *, ioasid_t, struct iommu_domain *)' (aka 'int (*)(struct iommu_domain *, struct device *, unsigned int, struct iommu_domain *)') with an expression of type 'int (struct iommu_domain *, struct iommu_domain *, struct device *, ioasid_t)' (aka 'int (struct iommu_domain *, struct iommu_domain *, struct device *, unsigned int)') [-Werror,-Wincompatible-function-pointer-types]
           .set_dev_pasid = arm_smmu_blocking_set_dev_pasid,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +3044 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3041	
  3042	static const struct iommu_domain_ops arm_smmu_blocked_ops = {
  3043		.attach_dev = arm_smmu_attach_dev_blocked,
> 3044		.set_dev_pasid = arm_smmu_blocking_set_dev_pasid,
  3045	};
  3046	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
