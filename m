Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1312943B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPquZ/P4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705275499; x=1736811499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RIyTNdcyw0CL7u+5FV6QkJLE1fCnO7yaxxec8vIGgdA=;
  b=YPquZ/P40NJaSc5u5jQcJLQbKxJ8ID9jJXPjR9Pndo9QE7LQstFTfu6G
   LOvU/LmsTNW4NxiWiLJUrdIm9jXpA1/oHvXtRiJcQwJ5v3EzzyOUCy5QN
   jh/1a3F2aLohIHF2l4QA0muu1T0m8qn/FKO6DU/VRyp1KbdUqZyQO8scI
   IwMNtNXMmha9HyBlmuMCNLy/AqdkXYvNifWIA6+1pcIn+syqroBYQAu7c
   jOXaPzEV/CsO9UJbuftUt9vqNb64sVoNeM5jpyqVoXcvpg41yU2/WqvHC
   vo9Z4MG17hACdt0IimdSh/2/zGI59wfvR4DFQLnFiRLoX+KNn6Wo/KavZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6252665"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="6252665"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 15:38:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="1114758641"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="1114758641"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jan 2024 15:38:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPA3T-000Bvu-1Q;
	Sun, 14 Jan 2024 23:38:15 +0000
Date: Mon, 15 Jan 2024 07:38:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18113/21544]
 drivers/iommu/arm-smmu-v3.c:4355:5: warning: no previous prototype for
 'arm_smmu_set_dev_user_mpam_en'
Message-ID: <202401150754.d2iI1vG3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 129938f5dfc8b2d8aaaeda0c565d57076bf5c1cc [18113/21544] iommu/arm-smmu-v3: Add support to enable/disable SMMU user_mpam_en
config: arm64-randconfig-001-20240112 (https://download.01.org/0day-ci/archive/20240115/202401150754.d2iI1vG3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150754.d2iI1vG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150754.d2iI1vG3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/arm-smmu-v3.c:4299:5: warning: no previous prototype for 'arm_smmu_set_dev_mpam' [-Wmissing-prototypes]
    4299 | int arm_smmu_set_dev_mpam(struct device *dev, int ssid, int partid, int pmg,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4341:5: warning: no previous prototype for 'arm_smmu_get_dev_mpam' [-Wmissing-prototypes]
    4341 | int arm_smmu_get_dev_mpam(struct device *dev, int ssid, int *partid, int *pmg,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu-v3.c:4355:5: warning: no previous prototype for 'arm_smmu_set_dev_user_mpam_en' [-Wmissing-prototypes]
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
>> drivers/iommu/arm-smmu-v3.c:4356: warning: Function parameter or member 'dev' not described in 'arm_smmu_set_dev_user_mpam_en'
>> drivers/iommu/arm-smmu-v3.c:4356: warning: Function parameter or member 'user_mpam_en' not described in 'arm_smmu_set_dev_user_mpam_en'
>> drivers/iommu/arm-smmu-v3.c:4374: warning: Function parameter or member 'dev' not described in 'arm_smmu_get_dev_user_mpam_en'
>> drivers/iommu/arm-smmu-v3.c:4374: warning: Function parameter or member 'user_mpam_en' not described in 'arm_smmu_get_dev_user_mpam_en'


vim +/arm_smmu_set_dev_user_mpam_en +4355 drivers/iommu/arm-smmu-v3.c

  4351	
  4352	/**
  4353	 * arm_smmu_set_dev_user_mpam_en() - set user_mpam_en to smmu user cfg0
  4354	 */
> 4355	int arm_smmu_set_dev_user_mpam_en(struct device *dev, int user_mpam_en)
> 4356	{
  4357		struct arm_smmu_master_data *master = dev->iommu_fwspec->iommu_priv;
  4358		struct arm_smmu_device *smmu = master->domain->smmu;
  4359		u32 reg, __iomem *cfg = smmu->base + ARM_SMMU_USER_CFG0;
  4360	
  4361		reg = readl_relaxed(cfg);
  4362		reg &= ~ARM_SMMU_USER_MPAM_EN;
  4363		reg |= FIELD_PREP(ARM_SMMU_USER_MPAM_EN, user_mpam_en);
  4364		writel_relaxed(reg, cfg);
  4365	
  4366		return 0;
  4367	}
  4368	EXPORT_SYMBOL(arm_smmu_set_dev_user_mpam_en);
  4369	
  4370	/**
  4371	 * arm_smmu_get_dev_user_mpam_en() - get user_mpam_en from smmu user cfg0
  4372	 */
> 4373	int arm_smmu_get_dev_user_mpam_en(struct device *dev, int *user_mpam_en)
> 4374	{
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
