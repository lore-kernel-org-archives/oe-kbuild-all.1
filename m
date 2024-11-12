Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7A2213135
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 23:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731454354; cv=none; b=f53bniy07/mWxB1bm+hV7oFYTxR6G8XAgoItCclwx0MaY9OZZIaQhn/YHPGkRwLw8fLngwR9TdimL7BMYvsK0Qbb9tWE7ykqjw3L+XH0qc7CCFKdargKJLJob1NJcfY9C/1COfP6h1BHvvRBFZSKZTFF22Q138CPQgJ0CvGeQmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731454354; c=relaxed/simple;
	bh=EIfqWucAhxJ5J4BlP9Kum2VBHWGBONbmCFP93j3leeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cMl0SoOlA+IBbK7SXi4dUed/psesninLLlHm11mVr2c3VwEVH605Vy9gEHhaCcCurQDCPHEqGxFrtixq2O2OgL6juVNa5QOSErkxvRl4HO83q1AJbsBverdPly5J0LHehu/6HCigVmHtIo48Re7Mg/jO3qnhw2rulIO5lrsh/4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMPr7AdE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMPr7AdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731454352; x=1762990352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EIfqWucAhxJ5J4BlP9Kum2VBHWGBONbmCFP93j3leeo=;
  b=JMPr7AdEAhGuHAxUe3IhFSqREyNd7vCURxYtJTiDtOks83Q5K+BSTLZK
   RU7ArWs1CqaXhOnqxqiAls0eqncZyZ2UbQHD9EicmAr2CRBGvy3k3Iepy
   PSacSCFZR34xYIVY/m0prSfK7gu2xK8/txsTj8c2jtjzppYgt3TsHSpNf
   o+pYv0R7LT+p4K0NbniZ7PUeARBsmaSBbQgJdBSXE3OqS6x978KlEi3lM
   09hkucbg0vJIZjdHBsPVLER4J40DySEw4y5Y8vaeJG6xjN+gxVB+HHnDp
   TDHDqg1XPTVrxwoyXMrP/vvu0vFPneuQo5PRqnCKrqP0a+tfsQiXS2/cd
   A==;
X-CSE-ConnectionGUID: KfyMca3zQ9aNdbmuj2eh/Q==
X-CSE-MsgGUID: jCEBNTD2SEmz+lx5zGJ5bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="56711088"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="56711088"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 15:32:29 -0800
X-CSE-ConnectionGUID: fSTanrcJT9252SIkhySjTw==
X-CSE-MsgGUID: 1Q0gYumJSuecDxqlXFEMag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="125201379"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Nov 2024 15:32:28 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB0Mz-0001pd-1S;
	Tue, 12 Nov 2024 23:32:25 +0000
Date: Wed, 13 Nov 2024 07:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1290/1290]
 drivers/iommu/arm-smmu-v3.c:2896:41: error: 'pci_bus_type' undeclared; did
 you mean 'pci_pcie_type'?
Message-ID: <202411130719.5GGQe3oi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi luochunsheng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   58ec866c31299a4b0d63a01cb026877c5f85e4d9
commit: d70a672bcf377261c1b9f07009d22aef935e7b92 [1290/1290] iommu: smmu-v3 support Virtualization feature when 3408iMR/3416iMRraid card exist
config: arm64-randconfig-001-20241112 (https://download.01.org/0day-ci/archive/20241113/202411130719.5GGQe3oi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130719.5GGQe3oi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130719.5GGQe3oi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/arm-smmu-v3.c: In function 'arm_smmu_init_strtab_2lvl':
>> drivers/iommu/arm-smmu-v3.c:2896:41: error: 'pci_bus_type' undeclared (first use in this function); did you mean 'pci_pcie_type'?
    2896 |                 ret = bus_for_each_dev(&pci_bus_type, NULL, (void *)smmu,
         |                                         ^~~~~~~~~~~~
         |                                         pci_pcie_type
   drivers/iommu/arm-smmu-v3.c:2896:41: note: each undeclared identifier is reported only once for each function it appears in
   drivers/iommu/arm-smmu-v3.c: In function 'arm_smmu_write_strtab_ent':
   drivers/iommu/arm-smmu-v3.c:1229:28: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1229 |                         if (disable_bypass)
         |                            ^
   drivers/iommu/arm-smmu-v3.c:1231:17: note: here
    1231 |                 default:
         |                 ^~~~~~~


vim +2896 drivers/iommu/arm-smmu-v3.c

  2861	
  2862		/* Calculate the L1 size, capped to the SIDSIZE. */
  2863		size = STRTAB_L1_SZ_SHIFT - (ilog2(STRTAB_L1_DESC_DWORDS) + 3);
  2864		size = min(size, smmu->sid_bits - STRTAB_SPLIT);
  2865		cfg->num_l1_ents = 1 << size;
  2866	
  2867		size += STRTAB_SPLIT;
  2868		if (size < smmu->sid_bits)
  2869			dev_warn(smmu->dev,
  2870				 "2-level strtab only covers %u/%u bits of SID\n",
  2871				 size, smmu->sid_bits);
  2872	
  2873		l1size = cfg->num_l1_ents * (STRTAB_L1_DESC_DWORDS << 3);
  2874		strtab = dmam_alloc_coherent(smmu->dev, l1size, &cfg->strtab_dma,
  2875					     GFP_KERNEL | __GFP_ZERO);
  2876		if (!strtab) {
  2877			dev_err(smmu->dev,
  2878				"failed to allocate l1 stream table (%u bytes)\n",
  2879				size);
  2880			return -ENOMEM;
  2881		}
  2882		cfg->strtab = strtab;
  2883	
  2884		/* Configure strtab_base_cfg for 2 levels */
  2885		reg  = FIELD_PREP(STRTAB_BASE_CFG_FMT, STRTAB_BASE_CFG_FMT_2LVL);
  2886		reg |= FIELD_PREP(STRTAB_BASE_CFG_LOG2SIZE, size);
  2887		reg |= FIELD_PREP(STRTAB_BASE_CFG_SPLIT, STRTAB_SPLIT);
  2888		cfg->strtab_base_cfg = reg;
  2889	
  2890	#ifdef CONFIG_SMMU_BYPASS_DEV
  2891		ret = arm_smmu_init_l1_strtab(smmu);
  2892		if (ret)
  2893			return ret;
  2894	
  2895		if (smmu_bypass_devices_num) {
> 2896			ret = bus_for_each_dev(&pci_bus_type, NULL, (void *)smmu,
  2897				arm_smmu_prepare_init_l2_strtab);
  2898		}
  2899		return ret;
  2900	#else
  2901		return arm_smmu_init_l1_strtab(smmu);
  2902	#endif
  2903	}
  2904	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
