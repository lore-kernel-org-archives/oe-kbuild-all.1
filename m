Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255783D96D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 23:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727654362; cv=none; b=WmH9v/AK7mo8NCG93B+LhQcJ2MrnMXtGWiT3GLhUUd0GGU1BNvU9ktiygvxnQ1HlOAicToUKH0181a4ZQEP3QfQLoJrhfKb8m4rr3mAYC/qeNJKFHCSR/5LKdShi6dKxKN1BMnugRXnFh6bpduF+KHN2190GBT0PCsIurc+Ey8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727654362; c=relaxed/simple;
	bh=rDiF+4RhXXdsw8ULUPSBBnK/HaY2zudyswZZDLwM868=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=esgyZ4Eiga5gTYCnK/POR65G0McgdVQK8nENyWMzKnX+jkYa+YEmafFM3woioHhK4w/xxxhj+Jtv+6AOgIKAzVYCA2UAtI1U8lRdHmv1gOuIgKDmc/sEgnjzAEWutCI5/lhlBKEYDJMJEPfzpPZfKZ9javdn+gkQSA/LwuGUMbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mq8pUvZ/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mq8pUvZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727654362; x=1759190362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rDiF+4RhXXdsw8ULUPSBBnK/HaY2zudyswZZDLwM868=;
  b=Mq8pUvZ/OzkESgQixO6nNF94nik/3GpDo/nuRnocP8HHnWmS824MhWli
   3iQNVir1F5juzY0IFKu6ra/SBPD0Z9UcH1Ho3Q7X2VaLNub3acDPx+DNS
   PI4q4fI85RXiSws/MzES3gx06vlVwJNXAYj99H0e/g5IiVxamWOcoargj
   6Im5fm1K9Onj5/ua8TZ8DghvXoq0rpAh0UCmBFCdeTNPubcNBHQV/rPTK
   AvLPxCxohFYAIh3uM9PfpM7LLPtTYdiCL46zWhLsjdbPF7tlBKBY6dio5
   2op/P9QZ28Q16wcV8UGVTFZSfVIWY3Ryc8oktFnFq2e9lo2SbguYELxtk
   A==;
X-CSE-ConnectionGUID: OkDja6c5QRiTqEIxzbqn2w==
X-CSE-MsgGUID: BllcajEYToaCzba+hGi6+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26859436"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="26859436"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 16:59:21 -0700
X-CSE-ConnectionGUID: xtX+o1TDTCauMGf851MqyA==
X-CSE-MsgGUID: jT7AVBnTTAiV+zVv/Mrhcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="77879817"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2024 16:59:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv3or-000Oov-1B;
	Sun, 29 Sep 2024 23:59:17 +0000
Date: Mon, 30 Sep 2024 07:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangnaichuan <zhangnaichuan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1873/14244]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3168:27: error: use of
 undeclared identifier 'pci_bus_type'; did you mean 'pci_pcie_type'?
Message-ID: <202409300716.0blXmgwd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi zhangnaichuan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   91ff8f4b711382909faa289c49735e0514af6f76
commit: bbaaa756ad25c0e792fcd195d32acd5715f76b12 [1873/14244] iommu: Enable smmu-v3 when 3408iMR/3416iMRraid card exist
config: arm64-randconfig-002-20240930 (https://download.01.org/0day-ci/archive/20240930/202409300716.0blXmgwd-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300716.0blXmgwd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300716.0blXmgwd-lkp@intel.com/

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
