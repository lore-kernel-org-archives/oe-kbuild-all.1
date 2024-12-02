Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6581FA244
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 09:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733131537; cv=none; b=svpkZFMPgEBmziyZlrlTq94+N0HV6nVVZdsEYO9cpt08hgFJSrC1//2T9B8awaPVjybQ6NKR9g3SsIF0QRlqvkTjuNgYlhrjg1BFQQbjB1qlJCeloL34xPR7GgNtErCkWK8SdtW9rPRpT/vxIdLQB95egoPi0MoRrMpivEE/rFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733131537; c=relaxed/simple;
	bh=CSisiopcbhpaC1CxeFnnlFg3x22Ky8BjiEGgoRkwleA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BplElN+8fYwB6miCOMvn30hU3XvHtOU7EEwDaqfGKO71rgHDnnLL5YJixmGqZDbeLZRJoOtqF7ZnHFtpn23eSl5gNsX1Y7JjfRqpq/wNWqkQ3nYUefjJ42lLfU7OTTiulCME3zmzyCHsJLLNCkYvpaWv8BHdJnEUXNrZ61bV6RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0gK9glw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0gK9glw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733131534; x=1764667534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSisiopcbhpaC1CxeFnnlFg3x22Ky8BjiEGgoRkwleA=;
  b=F0gK9glwjwGXHozxswTeldqgVFs/U6iPv8rtobBWCnrQXf5uzgVEwWex
   Sl2jvzPSVa5a9PzebCggBHkG4qdjZfto7f1Szt4barcExUWSUGCn5m3a5
   XfpQRHifGW40+1pKNWDzI7FMP/epSFgqLK4Lm5TcYqWW9S47fJH8SDwsT
   kkbKPi4f7YQ55244j4inkTKax8lWEeJDuOAN5EMdrymeM33zEEaGG2pOU
   OYQ8lfLOdyKd6sfv93GolVTtZQ/9DoqumhehIBGkl6WMeBanuIODiVuh7
   Zc1WF5Y98kgI4eRWf52wjbPUeu6RI2Oby1JNfkP9r+23GmWvWxHsdvWaf
   g==;
X-CSE-ConnectionGUID: 4OugkCWzSD6MirFgApcl5A==
X-CSE-MsgGUID: jmtM8HReSbmwTELp7n9ZpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33443408"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33443408"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 01:25:33 -0800
X-CSE-ConnectionGUID: QW6QLhZnSsyJL0lyq09CTQ==
X-CSE-MsgGUID: QG2m4UeiT5GmGSfQcNdPFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93892502"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Dec 2024 01:25:33 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI2gM-0002Fr-0S;
	Mon, 02 Dec 2024 09:25:30 +0000
Date: Mon, 2 Dec 2024 17:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangnaichuan <zhangnaichuan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1455/1455]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3168:41: error: 'pci_bus_type'
 undeclared; did you mean 'pci_pcie_type'?
Message-ID: <202412021733.qTBT4VOV-lkp@intel.com>
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
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: bbaaa756ad25c0e792fcd195d32acd5715f76b12 [1455/1455] iommu: Enable smmu-v3 when 3408iMR/3416iMRraid card exist
config: arm64-randconfig-001-20241112 (https://download.01.org/0day-ci/archive/20241202/202412021733.qTBT4VOV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021733.qTBT4VOV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021733.qTBT4VOV-lkp@intel.com/

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
