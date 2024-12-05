Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6997F218ABF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406664; cv=none; b=qMwZvZhUEFuswsTMSL+arKdqBYk+HwkWmHPIUzEP88ukmJ9aBKFT3Q951kovuK4Ngw6exvZUgLh6eUflFQNRCP9o8P1aMF0CwjMt3WWbe5RhQvu7l79cdVRr2gItvGVJKaB6aTPOkRbXrdqr6ojN61k33/8tx5pr8GMcCSxt27Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406664; c=relaxed/simple;
	bh=HabANso4b8uxc+y3kv1QWpVxs9VEGU3u9lSzhMlBBE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SC9ix//PB+A25mXRscFUQY9ilcJQXn0eSsEKktG9muCQI0nSoug5fvj2bBWSecPjJ2Th1duWVB3/QCOnBduIvdU/dvaDE1wjDvFkFIhpQmZOHo2L8twuWw547VY6EVM2NBPgOFpg8/m78bm7wzJeOEYi5bw7Cg0Y0pQEW5HLVtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTny86yc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTny86yc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733406663; x=1764942663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HabANso4b8uxc+y3kv1QWpVxs9VEGU3u9lSzhMlBBE8=;
  b=XTny86ycOMUkMEaHRQ2FGIwlSjyf0aT5yIZT43oLg5JoiPcOh8BIvIl/
   Ka0YDvEkloCJpsmt2uOwEZgY22+Du5Ke+Dy5MBV+N8b0oUXwy+HX8CRVM
   jCDF09jMdOWl034TOeVheA2czgwpxAryV3CibaAPdZwXI+AMbrm6L2sSr
   9PBcqVa7dU/VhVUYiP7giocC67iPU5HaIHK0glPPQVGyhSukF36rRWDwW
   bKSr3b2MpsSxZtd6Sd1WPC3cCtYy63C2uK+bRDL0xozjzOWWN6znmFEo8
   jYLToTZQXbxIPyjwSVo0HlCrOrXTjz1rIjLeQuTreTiF+c5YqNK3vhS+s
   w==;
X-CSE-ConnectionGUID: OsBb6vQPRLq8Rq48p6MC+g==
X-CSE-MsgGUID: xwTz8ZbVR5alc5QxsNeb8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33636233"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33636233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 05:51:02 -0800
X-CSE-ConnectionGUID: qLGX/uVTSXmWhjc+lqgGDw==
X-CSE-MsgGUID: RCJv/InLRM2OmI5s4ETN5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="93980474"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Dec 2024 05:51:00 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJCFu-00002R-07;
	Thu, 05 Dec 2024 13:50:58 +0000
Date: Thu, 5 Dec 2024 21:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 10081/20170]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:597:5:
 warning: no previous prototype for function 'smmu_domain_config_s2'
Message-ID: <202412052143.nTkqml8t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a8515ba19cb4ad9441001ea72d3375a9883d567f
commit: edb183c2b760b28788587e86644d8a83b024be15 [10081/20170] ANDROID: drivers/arm-smmu-v3-kvm: Add smmu_domain_config_s2
config: arm64-randconfig-001-20241205 (https://download.01.org/0day-ci/archive/20241205/202412052143.nTkqml8t-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412052143.nTkqml8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412052143.nTkqml8t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:597:5: warning: no previous prototype for function 'smmu_domain_config_s2' [-Wmissing-prototypes]
   int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
       ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:597:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:629:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
   int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
       ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:629:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:727:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
   int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
       ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:727:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:744:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
   void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
        ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:744:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:756:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
   bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
        ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:756:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:799:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
   bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
        ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:799:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:811:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
   int smmu_suspend(struct kvm_hyp_iommu *iommu)
       ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:811:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_suspend(struct kvm_hyp_iommu *iommu)
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:824:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
   int smmu_resume(struct kvm_hyp_iommu *iommu)
       ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:824:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_resume(struct kvm_hyp_iommu *iommu)
   ^
   static 
   8 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +/smmu_domain_config_s2 +597 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

   596	
 > 597	int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
   598	{
   599		struct io_pgtable_cfg *cfg;
   600		u64 ts, sl, ic, oc, sh, tg, ps;
   601	
   602		cfg = &domain->pgtable->cfg;
   603		ps = cfg->arm_lpae_s2_cfg.vtcr.ps;
   604		tg = cfg->arm_lpae_s2_cfg.vtcr.tg;
   605		sh = cfg->arm_lpae_s2_cfg.vtcr.sh;
   606		oc = cfg->arm_lpae_s2_cfg.vtcr.orgn;
   607		ic = cfg->arm_lpae_s2_cfg.vtcr.irgn;
   608		sl = cfg->arm_lpae_s2_cfg.vtcr.sl;
   609		ts = cfg->arm_lpae_s2_cfg.vtcr.tsz;
   610	
   611		ent[0] = STRTAB_STE_0_V |
   612			 FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
   613		ent[1] = FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING);
   614		ent[2] = FIELD_PREP(STRTAB_STE_2_VTCR,
   615				FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, ps) |
   616				FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, tg) |
   617				FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, sh) |
   618				FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, oc) |
   619				FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, ic) |
   620				FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, sl) |
   621				FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, ts)) |
   622			 FIELD_PREP(STRTAB_STE_2_S2VMID, domain->domain_id) |
   623			 STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2R;
   624		ent[3] = cfg->arm_lpae_s2_cfg.vttbr & STRTAB_STE_3_S2TTB_MASK;
   625	
   626		return 0;
   627	}
   628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
