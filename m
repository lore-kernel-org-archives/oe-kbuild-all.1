Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAF3EEBA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 01:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709341338; cv=none; b=OOT6QpiHlfk1MAAWeaEqxOYnr/lN0m4IMiFBOvs8Ov70ke+crchwXFBv7WjUdQHd9eQI5a2HKzpFXn/4eXfAdIdOV1b2pAOYxr7Gko+AaaILte4XdmMXqk50YN9RGzJ8q6Oub7Q/efw8S3LcJO7UDzCGBFZRzGCt9H/EvXSB178=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709341338; c=relaxed/simple;
	bh=gFsDdtHWGYMcGdOBdyMvx6KqMsGWHHFx6lPra4Iooso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lxA41iAjCBNbTOaIwLGc5kK8Og4bgWOjS4vEPSselwlG5G9EeeFFrq/SsQWkeewxli9Yms7kAjX8U5Phx+AWjqmAFuYSg0pY5JW2TD0TospToEr2TDmGEW/lQn0xB/32CG+olMXbHlnTbV0M2uZImltSDoRYewTuizNko7yXu6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXcVnbaO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXcVnbaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709341337; x=1740877337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gFsDdtHWGYMcGdOBdyMvx6KqMsGWHHFx6lPra4Iooso=;
  b=bXcVnbaOw2irKeJZBJ+wyt5VoGhuLcYprO7NTCf8DEs+ghjm03HxZq6H
   6AIiIdBRwZ9BEx+9MCPQUem+mKOkTQ7PKf1kkrlfOL4KJXYtf5d0iBhsV
   FhzMYJYcq4aZ/MCdY9qMtjzSzflPtarZ3lX/zp1A54nzhpLcTa5F/OYLj
   P9/13uPF/8OAogmLdn7b5DU2KGJJeYkzIpmy9YSpvENcQ/Qaj5lrMfbDc
   5/nU0C2qdEahNqGwm9y6YVaVu5F7oN/Rq55xQm67AeBt8mUC3nlxTLRfL
   Fj2x2NLkxb4WxCq8WVA1m3DyRGDtTf1btm0gwK9eQjB5VH9jJq4Yli9Mo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="14544396"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="14544396"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 17:02:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="31538941"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2024 17:02:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgDlU-000ECr-0u;
	Sat, 02 Mar 2024 01:02:12 +0000
Date: Sat, 2 Mar 2024 09:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangnaichuan <zhangnaichuan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1873/3767]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3168:41: error: 'pci_bus_type'
 undeclared; did you mean 'pci_pcie_type'?
Message-ID: <202403020810.4S7gi6yq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   236cb940335e3542c9d5ac16b5d8546a0cbbdfc1
commit: bbaaa756ad25c0e792fcd195d32acd5715f76b12 [1873/3767] iommu: Enable smmu-v3 when 3408iMR/3416iMRraid card exist
config: arm64-randconfig-001-20240302 (https://download.01.org/0day-ci/archive/20240302/202403020810.4S7gi6yq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020810.4S7gi6yq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020810.4S7gi6yq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: In function 'arm_smmu_init_strtab_2lvl':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3168:41: error: 'pci_bus_type' undeclared (first use in this function); did you mean 'pci_pcie_type'?
    3168 |                 ret = bus_for_each_dev(&pci_bus_type, NULL, (void *)smmu,
         |                                         ^~~~~~~~~~~~
         |                                         pci_pcie_type
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3168:41: note: each undeclared identifier is reported only once for each function it appears in


vim +3168 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3129	
  3130	static int arm_smmu_init_strtab_2lvl(struct arm_smmu_device *smmu)
  3131	{
  3132		void *strtab;
  3133		u64 reg;
  3134		u32 size, l1size;
  3135		struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
  3136		int ret;
  3137	
  3138		/* Calculate the L1 size, capped to the SIDSIZE. */
  3139		size = STRTAB_L1_SZ_SHIFT - (ilog2(STRTAB_L1_DESC_DWORDS) + 3);
  3140		size = min(size, smmu->sid_bits - STRTAB_SPLIT);
  3141		cfg->num_l1_ents = 1 << size;
  3142	
  3143		size += STRTAB_SPLIT;
  3144		if (size < smmu->sid_bits)
  3145			dev_warn(smmu->dev,
  3146				 "2-level strtab only covers %u/%u bits of SID\n",
  3147				 size, smmu->sid_bits);
  3148	
  3149		l1size = cfg->num_l1_ents * (STRTAB_L1_DESC_DWORDS << 3);
  3150		strtab = dmam_alloc_coherent(smmu->dev, l1size, &cfg->strtab_dma,
  3151					     GFP_KERNEL);
  3152		if (!strtab) {
  3153			dev_err(smmu->dev,
  3154				"failed to allocate l1 stream table (%u bytes)\n",
  3155				l1size);
  3156			return -ENOMEM;
  3157		}
  3158		cfg->strtab = strtab;
  3159	
  3160		/* Configure strtab_base_cfg for 2 levels */
  3161		reg  = FIELD_PREP(STRTAB_BASE_CFG_FMT, STRTAB_BASE_CFG_FMT_2LVL);
  3162		reg |= FIELD_PREP(STRTAB_BASE_CFG_LOG2SIZE, size);
  3163		reg |= FIELD_PREP(STRTAB_BASE_CFG_SPLIT, STRTAB_SPLIT);
  3164		cfg->strtab_base_cfg = reg;
  3165		ret = arm_smmu_init_l1_strtab(smmu);
  3166	#ifdef CONFIG_SMMU_BYPASS_DEV
  3167		if (!ret && smmu_bypass_devices_num) {
> 3168			ret = bus_for_each_dev(&pci_bus_type, NULL, (void *)smmu,
  3169									arm_smmu_prepare_init_l2_strtab);
  3170		}
  3171	#endif
  3172		return ret;
  3173	}
  3174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
