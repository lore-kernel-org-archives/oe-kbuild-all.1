Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BA97E2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 02:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711766721; cv=none; b=sjCTniFjySrwy11fPyXXCMDUcVjJFlrKqEZI6pobaU475feH3AnQJ9Si0hT09nqocxtVzzFIcETIx3agrqIF50ZpvxGtBM6GT5R1lHMg9cSZXFphYxFXLbBmy9Lp8FLFY8cpd7AKdPXbojrujImdx7Qhcs2Ivzcn2UkHFktXr3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711766721; c=relaxed/simple;
	bh=mF1Wz+mKs1hMCPEMrd7RUauNT1n8zXsKJQh5G1dU53c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u6wFqm7Mkqwu8Dj0Tz27vXBW9OM1fJwdE0Un3vYGvUIzanPDSabR27zDAkYbNllcUDA85s1qcVHuW+qvbeZkbidc3+YRY6wnhuANjvs8Cxal5cSB397Vy7yzjHH2/bOdMJ0wIn1ROWNtF33RnsPa9FrMJfdItahvGTZPLG2/2Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuqOaSOy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuqOaSOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711766720; x=1743302720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mF1Wz+mKs1hMCPEMrd7RUauNT1n8zXsKJQh5G1dU53c=;
  b=iuqOaSOyY/805yISclP8w+I4K5puv9YFWjOYY4BVmkQMxkYChHiy3Fzw
   Pt1VH7hAFWwkC75XnoVnKyQNPgH2sEH0twoNZel9wGJTEntTUUYGVDujM
   zJj7AabTdAVOpfKEoWjInkQVTzapoxqoE4+jHK8fsYnVZD+gfctKNQF08
   xLQBNJvNulKNRDsy1tnWOOhou9PQHBaIvgNi37iG/K2LzDXQKzPc+j1dU
   fyQC6jp9xbwmDPOXyFC4Lpbb8g4uV3ULmep+Guct78im0afGT7lrsJ339
   eVtVb65YhLkJO6S5N2XhqBubBxYYOwutoM1NecgCapo8SU9c2ou6CtMXd
   Q==;
X-CSE-ConnectionGUID: GWGsDQtFTgqOlbCRCBBu5g==
X-CSE-MsgGUID: h1DPCPhPRxKnO3heoUFs3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="7150083"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="7150083"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 19:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17204802"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Mar 2024 19:45:17 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqOiX-0003sc-2t;
	Sat, 30 Mar 2024 02:45:13 +0000
Date: Sat, 30 Mar 2024 10:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangnaichuan <zhangnaichuan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1873/7119]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3168:27: error: use of
 undeclared identifier 'pci_bus_type'; did you mean 'pci_pcie_type'?
Message-ID: <202403301058.nroo7WqN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   37c147918739a33605b64cbc25702e3247cec71c
commit: bbaaa756ad25c0e792fcd195d32acd5715f76b12 [1873/7119] iommu: Enable smmu-v3 when 3408iMR/3416iMRraid card exist
config: arm64-randconfig-004-20240330 (https://download.01.org/0day-ci/archive/20240330/202403301058.nroo7WqN-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240330/202403301058.nroo7WqN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403301058.nroo7WqN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3168:27: error: use of undeclared identifier 'pci_bus_type'; did you mean 'pci_pcie_type'?
                   ret = bus_for_each_dev(&pci_bus_type, NULL, (void *)smmu,
                                           ^~~~~~~~~~~~
                                           pci_pcie_type
   include/linux/pci.h:2453:19: note: 'pci_pcie_type' declared here
   static inline int pci_pcie_type(const struct pci_dev *dev)
                     ^
   1 error generated.


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
