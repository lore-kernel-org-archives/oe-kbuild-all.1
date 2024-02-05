Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10B01AB801
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 21:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707167625; cv=none; b=V0xdZ/obSAMhFzks3VQ+lFAVCUH5Azg/HRlbDUZijWHzLSeP/1qBcfDqMKCw8YXc9MAhymoN5ZK5JIiRYQ8u/nLKfqPSmabakpVM9mcynTfEtGDiaVZr1LOHkFT1ZeK5IlKEqP7K0M8o0mWwwQhN9NWO82Orr8IG7OYEK7JWrwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707167625; c=relaxed/simple;
	bh=dTVNxod5i+De2RHMFb1Eu4TXTBG8QWkKOu9iXSRb1GE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D02kOyyStqjL+8tyq98RgBL+yO3BCiIL3dOH8dKI0LMqKN4mFhiykt32UhtZDYbBw1ZdqgPVlNTNXPfDj6C+yb4/f/JI2ROkGC1rPAnqqDptQvpxcIIfqgQR/6r3xuJae0upxKN9RDdQXIUKVuWyKiQv3mWdNnyXl1dDoDScJ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jewwEdrW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jewwEdrW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707167624; x=1738703624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dTVNxod5i+De2RHMFb1Eu4TXTBG8QWkKOu9iXSRb1GE=;
  b=jewwEdrWKHZ8GMKBL+HeyXbIbmqQlOlgkmegcUr/imJg53TKXXnlBWrv
   Ceib3nLWZm3qwhYCHKW/drOziKNcfxNr+8Zr8kJxNUe+dFinTIy1l1MLs
   myhPrfCOS6dKw51NC3nVX4G4RCQhJH1uday7oi86qJ7nwkCwCA1xK+bfD
   lyzgwHermSRQN28LZ77a4C3RighRdr5hKKqtYDAQk2zWa/oL+KsaHVELB
   H+bhPDleMPm6gxHBTbvS2BRqy7C2sR2qG5z0bodpbqY0OTOfmSJ86gmuj
   JSbKJ+w12C0z609FCO5JHoBLWE+HugQnvZ3DuOxcOwjG6F0wvbxCkTSXa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11195580"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="11195580"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 13:13:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1130882"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Feb 2024 13:13:42 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX6Hb-0000om-2S;
	Mon, 05 Feb 2024 21:13:39 +0000
Date: Tue, 6 Feb 2024 05:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:smmuv3_newapi 58/61]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3161:16: sparse: sparse:
 restricted __le64 degrades to integer
Message-ID: <202402060554.Do0o9kTt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux smmuv3_newapi
head:   4bddce673b0cff10f87c4ffde9cbf4870bb81b1b
commit: 579f80dbad77a8d8e1a496134b6a7e4aed0296fb [58/61] iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED
config: arm64-randconfig-r123-20240204 (https://download.01.org/0day-ci/archive/20240206/202402060554.Do0o9kTt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240206/202402060554.Do0o9kTt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060554.Do0o9kTt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3161:16: sparse: sparse: cast to restricted __le64
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3161:16: sparse: sparse: restricted __le64 degrades to integer
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3161:16: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)

vim +3161 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3123	
  3124	static struct iommu_domain *
  3125	arm_smmu_domain_alloc_nesting(struct device *dev, u32 flags,
  3126				      struct iommu_domain *parent,
  3127				      const struct iommu_user_data *user_data)
  3128	{
  3129		struct arm_smmu_master *master = dev_iommu_priv_get(dev);
  3130		struct arm_smmu_nested_domain *nested_domain;
  3131		struct arm_smmu_domain *smmu_parent;
  3132		struct iommu_hwpt_arm_smmuv3 arg;
  3133		unsigned int eats;
  3134		int ret;
  3135	
  3136		if (!(master->smmu->features & ARM_SMMU_FEAT_NESTING))
  3137			return ERR_PTR(-EOPNOTSUPP);
  3138	
  3139		ret = iommu_copy_struct_from_user(&arg, user_data,
  3140						  IOMMU_HWPT_DATA_ARM_SMMUV3, ste);
  3141		if (ret)
  3142			return ERR_PTR(ret);
  3143	
  3144		if (flags || !(master->smmu->features & ARM_SMMU_FEAT_TRANS_S1))
  3145			return ERR_PTR(-EOPNOTSUPP);
  3146	
  3147		if (!(parent->type & __IOMMU_DOMAIN_PAGING))
  3148			return ERR_PTR(-EINVAL);
  3149	
  3150		smmu_parent = to_smmu_domain(parent);
  3151		if (smmu_parent->stage != ARM_SMMU_DOMAIN_S2 ||
  3152		    smmu_parent->smmu != master->smmu)
  3153			return ERR_PTR(-EINVAL);
  3154	
  3155		/* EIO is reserved for invalid STE data. */
  3156		if ((arg.ste[0] & ~STRTAB_STE_0_NESTING_ALLOWED) ||
  3157		    (arg.ste[1] & ~STRTAB_STE_1_NESTING_ALLOWED))
  3158			return ERR_PTR(-EIO);
  3159	
  3160		/* Only Full ATS or ATS UR is supported */
> 3161		eats = FIELD_GET(STRTAB_STE_1_EATS, arg.ste[1]);
  3162		if (eats != STRTAB_STE_1_EATS_ABT && eats != STRTAB_STE_1_EATS_TRANS)
  3163			return ERR_PTR(-EIO);
  3164	
  3165		nested_domain = kzalloc(sizeof(*nested_domain), GFP_KERNEL_ACCOUNT);
  3166		if (!nested_domain)
  3167			return ERR_PTR(-ENOMEM);
  3168	
  3169		nested_domain->domain.type = IOMMU_DOMAIN_NESTED;
  3170		nested_domain->domain.ops = &arm_smmu_nested_ops;
  3171		nested_domain->s2_parent = smmu_parent;
  3172		nested_domain->enable_ats = eats == STRTAB_STE_1_EATS_TRANS;
  3173		nested_domain->ste[0] = arg.ste[0];
  3174		nested_domain->ste[1] = arg.ste[1] & ~cpu_to_le64(STRTAB_STE_1_EATS);
  3175	
  3176		return &nested_domain->domain;
  3177	}
  3178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
