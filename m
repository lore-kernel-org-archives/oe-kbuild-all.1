Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E079BE56A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 05:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758863407; cv=none; b=B9UFWStlSQsD00GKAZCcBDDhpbP60hYLSuLj7VeYmSnm2aRDdSDRJ7VaiKJUyV3ZVCBayRnpgtfDNcrO/+oHDY/+/zbHuP+/Vu2rq38JPR6lyL3JprSWCIUXE7Nzz0+FGtjdd/v4UNNuVqOk3CLVds9J/hbkO5oVf7QvVmgqKNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758863407; c=relaxed/simple;
	bh=ID7in5Y7WH7S3WVpRbAxc5VGf47/mUXoF85uoqM1qd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a+i4iHWX9w6ewp4Qx9liZiRd4O7NY5qjTKHJUqqtR4tI63IVCxeQqGeEqKhRVwmnBpMsIFJ14EcGy6huNuJ7p3Di1EQtJAvcHOzh8CUL6BMb+4ic3O0ul1nznXRg/1b6Mgyg9yVVLPtXFZ0PYkhzW4/dCr49YgcVLLFFJEopAqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2nq5PEa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2nq5PEa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758863405; x=1790399405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ID7in5Y7WH7S3WVpRbAxc5VGf47/mUXoF85uoqM1qd4=;
  b=m2nq5PEaqwr/jNnlekS7D1RMp701sNoSFO1+9l4zKOcrDcwbLk1O7d4n
   n1d0AYZkvFvOZ63Ta0Jq4qhjBCflv74lCCTxrePU9pYZ/lf38rGi6Se6E
   hEXNMjdcjKU27yW9m9GYkmDsQ6BHE0uh5CXLsGCfrrrBTPyZs1ziac4Fv
   Vm0ky0jBO06FmG1QcI/1rEVhCR/uLNgbjkQ92mRGuUXKiwzVADPsXOQ3z
   23WxZQ9sdQHD1DgRSs6EaplYDU6P15Z0sKrtPku02l9H/OnzBzP0iK6gW
   J4aHa2kndlrQ/rQ5M4ifY6Y6CYLi7t0MCuCwjIjm5Ga/v/3Diawe8pzvW
   g==;
X-CSE-ConnectionGUID: UTlBRMApTKukhg+2Wo+VPw==
X-CSE-MsgGUID: 543gcmJ+QH678TVwTLw84Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65003957"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65003957"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 22:10:04 -0700
X-CSE-ConnectionGUID: RcUNdpMQQ/OYrBpmjw1kZg==
X-CSE-MsgGUID: WMm+rMMlSNSQFOfcdK4BaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="176790157"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Sep 2025 22:10:03 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v20iT-0005vN-2E;
	Fri, 26 Sep 2025 05:09:58 +0000
Date: Fri, 26 Sep 2025 13:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangnaichuan <zhangnaichuan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2938/2938]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3168:26: error: incompatible
 pointer types passing 'int (*)(const struct pci_dev *)' to parameter of type
 'const struct bus_type *'
Message-ID: <202509261305.DCaV219R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3e16741023a15d92f4be3343cb4d8b508327dda3
commit: bbaaa756ad25c0e792fcd195d32acd5715f76b12 [2938/2938] iommu: Enable smmu-v3 when 3408iMR/3416iMRraid card exist
config: arm64-randconfig-004-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261305.DCaV219R-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261305.DCaV219R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509261305.DCaV219R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:15:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/crash_core.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3168:27: error: use of undeclared identifier 'pci_bus_type'; did you mean 'pci_pcie_type'?
    3168 |                 ret = bus_for_each_dev(&pci_bus_type, NULL, (void *)smmu,
         |                                         ^~~~~~~~~~~~
         |                                         pci_pcie_type
   include/linux/pci.h:2453:19: note: 'pci_pcie_type' declared here
    2453 | static inline int pci_pcie_type(const struct pci_dev *dev)
         |                   ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3168:26: error: incompatible pointer types passing 'int (*)(const struct pci_dev *)' to parameter of type 'const struct bus_type *' [-Wincompatible-pointer-types]
    3168 |                 ret = bus_for_each_dev(&pci_bus_type, NULL, (void *)smmu,
         |                                        ^~~~~~~~~~~~~
   include/linux/device/bus.h:144:45: note: passing argument to parameter 'bus' here
     144 | int bus_for_each_dev(const struct bus_type *bus, struct device *start, void *data,
         |                                             ^
   5 warnings and 2 errors generated.


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
