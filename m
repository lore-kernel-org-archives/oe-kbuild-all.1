Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47B13D388
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 07:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714031091; cv=none; b=KfwboWcZgHNDrIRUu2cMTZhPsM9jahDxoeeCXNldwY6ZqiIgoQ/awCXoZFfKy8JV7K3ORofvLaQA9eO7e3svbW9EGypfxvGRBViaLYyJ0X9+UlLMwbryyLfKy23aI1UKXq02xWzvY/1wjzQROgYM7+J/DfCJPEDweSzGHDoqJ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714031091; c=relaxed/simple;
	bh=6WJH5uHBomJUrIEU3qyRTE8ZvYPQYEJtyOOf36S+F2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PEZqEOloxTLqlBT3VfXT5pz6/7pJhPDwyq8GUlfd3QBcMZnnBgbTdmKWxSqlX7tK1UHE3c7v/ncqNwc1TwzyZ/rAWDje6ESyV/kysTp+3rprzV2CQHv9+BDGWXKfOjfy3Ki2QljjSWoq0NjhjvJ3WDdewnw2Rbz7B6+eL+SJbMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4ruf79S; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4ruf79S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714031090; x=1745567090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6WJH5uHBomJUrIEU3qyRTE8ZvYPQYEJtyOOf36S+F2o=;
  b=I4ruf79SJwGdkBvUueJXsW1TzYF2lmHCDm7MYQYK5XuWJfHG4OvsPAlC
   L2cMP/ENMrPL557/6eFfJ7NsABbtdCUOT4Wdfku5MCIxtXJBGr6+LOhQA
   6VDqfd5pnaG0hTYPf+MK7oiABloSzex/VY3SSLTgw//+RsENZnH9vRbrS
   6Irod6vA3sykuBtzDW8qyrVw323jbQZ/0rEvMg1t/unFIKo10rmxfscmg
   IDD1m+T8A4JKY+OWmxvte40Un6yJB5ModCtkQaJDpp/MbEyWXTwKPrpCI
   bmw6TZpQoa1k68HXAFo1U2Isxge52FmwDpmC8KVWUD/BPoZU8p37w7HBg
   w==;
X-CSE-ConnectionGUID: 878w+YyyRHenzVrCd5ypPQ==
X-CSE-MsgGUID: 8Axqf1iNS5S15cxjIZdv2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9863049"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9863049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 00:44:49 -0700
X-CSE-ConnectionGUID: dGzpZ9pVTDGX3Q2wGpGhDQ==
X-CSE-MsgGUID: FXA1gW4kTyS70a/O0GIoow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="25017440"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Apr 2024 00:44:48 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rztmf-00028Y-2q;
	Thu, 25 Apr 2024 07:44:45 +0000
Date: Thu, 25 Apr 2024 15:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 12/30]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:596:5:
 warning: no previous prototype for function 'smmu_domain_config_s2'
Message-ID: <202404251555.36c2rDYn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   fc203c3d8fb45cd037f8eee1f318d8ae07920897
commit: f69b877a4804dd60993b8318641ddb6f9558d2fa [12/30] ANDROID: drivers/arm-smmu-v3-kvm: Add smmu_domain_config_s2
config: arm64-randconfig-r064-20240425 (https://download.01.org/0day-ci/archive/20240425/202404251555.36c2rDYn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404251555.36c2rDYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251555.36c2rDYn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:7:
   In file included from arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h:5:
   In file included from arch/arm64/include/asm/kvm_asm.h:52:
   In file included from include/linux/mm.h:2025:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:11:
   In file included from arch/arm64/kvm/hyp/include/nvhe/iommu.h:9:
   In file included from include/linux/io-pgtable-arm.h:167:
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:15: error: expected string literal in 'asm'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:596:5: warning: no previous prototype for function 'smmu_domain_config_s2' [-Wmissing-prototypes]
     596 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:596:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     596 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:628:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
     628 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:628:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     628 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:726:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
     726 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:726:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     726 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:743:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
     743 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:743:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     743 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:755:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
     755 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:755:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     755 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:798:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
     798 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:798:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     798 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:810:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
     810 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:810:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     810 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:823:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
     823 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:823:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     823 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   9 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/smmu_domain_config_s2 +596 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

   595	
 > 596	int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
   597	{
   598		struct io_pgtable_cfg *cfg;
   599		u64 ts, sl, ic, oc, sh, tg, ps;
   600	
   601		cfg = &domain->pgtable->cfg;
   602		ps = cfg->arm_lpae_s2_cfg.vtcr.ps;
   603		tg = cfg->arm_lpae_s2_cfg.vtcr.tg;
   604		sh = cfg->arm_lpae_s2_cfg.vtcr.sh;
   605		oc = cfg->arm_lpae_s2_cfg.vtcr.orgn;
   606		ic = cfg->arm_lpae_s2_cfg.vtcr.irgn;
   607		sl = cfg->arm_lpae_s2_cfg.vtcr.sl;
   608		ts = cfg->arm_lpae_s2_cfg.vtcr.tsz;
   609	
   610		ent[0] = STRTAB_STE_0_V |
   611			 FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
   612		ent[1] = FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING);
   613		ent[2] = FIELD_PREP(STRTAB_STE_2_VTCR,
   614				FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, ps) |
   615				FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, tg) |
   616				FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, sh) |
   617				FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, oc) |
   618				FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, ic) |
   619				FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, sl) |
   620				FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, ts)) |
   621			 FIELD_PREP(STRTAB_STE_2_S2VMID, domain->domain_id) |
   622			 STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2R;
   623		ent[3] = cfg->arm_lpae_s2_cfg.vttbr & STRTAB_STE_3_S2TTB_MASK;
   624	
   625		return 0;
   626	}
   627	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
