Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DCAE55A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 05:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765689273; cv=none; b=aOkAsl6zxFl8ZJe6avk498s2Xmx3jyNDkXh3LLvzECdbMlfaL7T8Lp0Gc5Jx8leaPqZyDeD6vkNElMORB9dNIqsQK0QugyF+VVr3TY5PZIMLhXfPtG1DgjzwnS+klXxBAUmT0GNiQa/woyagy7DNo44jdfB/XVRak8l8C9b/c8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765689273; c=relaxed/simple;
	bh=05SwO7k6SG0ThQ70DcmCjstvw5B+cTlQEr6xxcepYoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CANuFenFbp+Nxf8fleZbENNuffmKFsnwRshF/0JYghrm4s0z1FM2+uxf3XdfbSg3BZhTCw/a1yZRF3/LX0yExpUCponj6DVQIE8TXTNiy0FHr/wwW1IQoyXjMINbYDpHVWdzX/9KFxVptJE8LmM4BJItmW4KmTH9cI2CTUqRjto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxeJA6mp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxeJA6mp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765689272; x=1797225272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=05SwO7k6SG0ThQ70DcmCjstvw5B+cTlQEr6xxcepYoA=;
  b=IxeJA6mpaHX36tfXCgxO6/0Dk3kCAYtFA/sxX5klhpmSZsAskbe+7l1S
   BjkuyH9Mzcbqf0xwpdPBFjT5HxOHR3ERxEqU6dzZk/q2b4gkMxqNTjUMc
   bDYb3rzs95ajgqorw21dwHbAdEs1PiCvTAjYlF6UkUjuGw4zQYWsyGpT+
   3Rp2f8cHLlZOgFizG0PrawXmqZE9j0wIsrtljGMXjtPJoxx/8i6W7zzA8
   hxaCyN9RYgIwUm3SLQkqc4gBjnNCJbNJZtWFAJQkE67p5oiriBbPQGTFq
   SKr0RGXy5hCaPmcbXywliv1egnySnh/wYE+BAP4Z5XFqzqQn6w67ZyU2i
   w==;
X-CSE-ConnectionGUID: rlXhorsRRx6MWjuzQ/GP4g==
X-CSE-MsgGUID: QHCqSAlnS7iOnAdu4FOmXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67593144"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67593144"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 21:14:32 -0800
X-CSE-ConnectionGUID: tguvwA4vRD64Q/pFehpZRg==
X-CSE-MsgGUID: zl71H7K6TeeVt5ABEIjiAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="228507763"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Dec 2025 21:14:30 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUeRA-000000008bl-0Sh5;
	Sun, 14 Dec 2025 05:14:28 +0000
Date: Sun, 14 Dec 2025 13:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 drivers/iommu/arm-smmu-v3.c:4373:5: warning: no previous prototype for
 'arm_smmu_get_dev_user_mpam_en'
Message-ID: <202512141348.7mzFhAqc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xingang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 129938f5dfc8b2d8aaaeda0c565d57076bf5c1cc [1942/1942] iommu/arm-smmu-v3: Add support to enable/disable SMMU user_mpam_en
config: arm64-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141348.7mzFhAqc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141348.7mzFhAqc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141348.7mzFhAqc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/arm-smmu-v3.c:4299:5: warning: no previous prototype for 'arm_smmu_set_dev_mpam' [-Wmissing-prototypes]
    4299 | int arm_smmu_set_dev_mpam(struct device *dev, int ssid, int partid, int pmg,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4341:5: warning: no previous prototype for 'arm_smmu_get_dev_mpam' [-Wmissing-prototypes]
    4341 | int arm_smmu_get_dev_mpam(struct device *dev, int ssid, int *partid, int *pmg,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4355:5: warning: no previous prototype for 'arm_smmu_set_dev_user_mpam_en' [-Wmissing-prototypes]
    4355 | int arm_smmu_set_dev_user_mpam_en(struct device *dev, int user_mpam_en)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu-v3.c:4373:5: warning: no previous prototype for 'arm_smmu_get_dev_user_mpam_en' [-Wmissing-prototypes]
    4373 | int arm_smmu_get_dev_user_mpam_en(struct device *dev, int *user_mpam_en)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4301: warning: Function parameter or member 'dev' not described in 'arm_smmu_set_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4301: warning: Function parameter or member 'ssid' not described in 'arm_smmu_set_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4301: warning: Function parameter or member 'partid' not described in 'arm_smmu_set_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4301: warning: Function parameter or member 'pmg' not described in 'arm_smmu_set_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4301: warning: Function parameter or member 's1mpam' not described in 'arm_smmu_set_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4343: warning: Function parameter or member 'ssid' not described in 'arm_smmu_get_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4343: warning: Function parameter or member 'partid' not described in 'arm_smmu_get_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4343: warning: Function parameter or member 'pmg' not described in 'arm_smmu_get_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4343: warning: Function parameter or member 's1mpam' not described in 'arm_smmu_get_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4356: warning: Function parameter or member 'dev' not described in 'arm_smmu_set_dev_user_mpam_en'
   drivers/iommu/arm-smmu-v3.c:4356: warning: Function parameter or member 'user_mpam_en' not described in 'arm_smmu_set_dev_user_mpam_en'
   drivers/iommu/arm-smmu-v3.c:4374: warning: Function parameter or member 'dev' not described in 'arm_smmu_get_dev_user_mpam_en'
   drivers/iommu/arm-smmu-v3.c:4374: warning: Function parameter or member 'user_mpam_en' not described in 'arm_smmu_get_dev_user_mpam_en'


vim +/arm_smmu_get_dev_user_mpam_en +4373 drivers/iommu/arm-smmu-v3.c

  4369	
  4370	/**
  4371	 * arm_smmu_get_dev_user_mpam_en() - get user_mpam_en from smmu user cfg0
  4372	 */
> 4373	int arm_smmu_get_dev_user_mpam_en(struct device *dev, int *user_mpam_en)
  4374	{
  4375		struct arm_smmu_master_data *master = dev->iommu_fwspec->iommu_priv;
  4376		struct arm_smmu_device *smmu = master->domain->smmu;
  4377		u32 reg, __iomem *cfg = smmu->base + ARM_SMMU_USER_CFG0;
  4378	
  4379		reg = readl_relaxed(cfg);
  4380		*user_mpam_en = FIELD_GET(ARM_SMMU_USER_MPAM_EN, reg);
  4381	
  4382		return 0;
  4383	}
  4384	EXPORT_SYMBOL(arm_smmu_get_dev_user_mpam_en);
  4385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
