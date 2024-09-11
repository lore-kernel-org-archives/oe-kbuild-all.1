Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779891865EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726060822; cv=none; b=OqqcU3eZcH5mlXs1Vr4mvAAH0AXWZ7E2M4BtPQcg7DkPos/LdSRJ/5x27Cy6OtYZOZ87fOOmg3sJqSilx2UWbJXqt8qWqUKVJS7i6anIteS3CiUepOMbn3rebEYiHfc+8a7OxCXYvHxjmT60rUEUxAZOJ+F8b2rUzmTQ5Cq3YKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726060822; c=relaxed/simple;
	bh=zVkuZyzYTshCvmyT0UYeYmeBfOS1fMoih3JdFwufMew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DVWvQDKFlzdK2yZMeR6YIMIbrVqXfJ61xcsu8niAcYly3O1u8urZuo7h1Eg5TbTZ4r55GDMnoml5a945DtzXTZ7B8UFihBz3xldYNS/GZT2ZH5CMZKD0gOivS+5X/oy0zH3GT9e5dEVhCRgILFiFm/8EPSUMnhOyKumx76pVpwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mCCQjHgE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mCCQjHgE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726060820; x=1757596820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zVkuZyzYTshCvmyT0UYeYmeBfOS1fMoih3JdFwufMew=;
  b=mCCQjHgEuTxu7JAQf1ujnzZaNi9PCv23NXzYbzVcXdJHyvCEPnpgZggp
   FVyaQ9PTM9pQEAiY5AkSx9VBbC1aJfh3MPJUUPWo6Y5ZhCkjIY2Uu60a5
   /Z87Xdze6vr+jbIc2J2hcjGhF8L8RTAWa+37u5J+sqOcRbNgTPnEaon/p
   J49+YhWwGVTVNH6Xt7UqfTO51gNOXF4z1QsJpESoI05GURs6PXwmTiVj9
   4jHozAXh7JWelFgAZrem7IlkzDxSTNBhq5oVh6dAEv8hge92gU9dm71cK
   4xjYT7Wf+eUt32VbviLIHg5dbyTYH6UzZTsbHnhU6ijv6DwchE74QyQpE
   Q==;
X-CSE-ConnectionGUID: QhRgrnQPTQmEzQcPz4y5cg==
X-CSE-MsgGUID: zlZuLb4AT2KMpIRB+3JgCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35997648"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="35997648"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 06:18:55 -0700
X-CSE-ConnectionGUID: HKCmlkPYSFaYs3Z4CkZe5A==
X-CSE-MsgGUID: yOe78GcSQea3U/UawoBdfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="66990881"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Sep 2024 06:18:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soNFE-0003bi-0U;
	Wed, 11 Sep 2024 13:18:52 +0000
Date: Wed, 11 Sep 2024 21:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240910 19/37]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3044:26: error: initialization
 of 'int (*)(struct iommu_domain *, struct device *, ioasid_t,  struct
 iommu_domain *)' {aka 'int (*)(struct iommu_domain *, struct device *,
 unsigned int,  struct iommu_domain *)'}...
Message-ID: <202409112127.PDP6dDp0-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240911/202409112127.PDP6dDp0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409112127.PDP6dDp0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409112127.PDP6dDp0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3044:26: error: initialization of 'int (*)(struct iommu_domain *, struct device *, ioasid_t,  struct iommu_domain *)' {aka 'int (*)(struct iommu_domain *, struct device *, unsigned int,  struct iommu_domain *)'} from incompatible pointer type 'int (*)(struct iommu_domain *, struct iommu_domain *, struct device *, ioasid_t)' {aka 'int (*)(struct iommu_domain *, struct iommu_domain *, struct device *, unsigned int)'} [-Wincompatible-pointer-types]
    3044 |         .set_dev_pasid = arm_smmu_blocking_set_dev_pasid,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3044:26: note: (near initialization for 'arm_smmu_blocked_ops.set_dev_pasid')


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
