Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A1E1C01
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725812789; cv=none; b=NBFYtBzPvJhiZjlge+84GMSGXRszNlyMd4XzTSOY5+fTYK2B9KS4Qnl2kz+aElPoff9x84nzY4aCr8Ap7EpnHeAFM+pM1aW/OPHqT/U2v/vwJZ+ZVFmRb6bR1t9V/qy24FZP4YUYGcbqmU0oR8nJt0c7/J6ghYZI5alJzTwwLD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725812789; c=relaxed/simple;
	bh=Rz6usoxRhwHQOiy1AvH7Q2q2e75EtVYFHwUezsthlgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GfjQ46NpooPQfwt7sEpZgubEiLLgwB5XDrK2jxLz5rhc/L5VISE9sGi5p3s9wnD1VBuT9XkOc9/kU62fIIEHfmtu1Cpae3pBQ84H+5UIHZm3FVJHxVTM3qMlMZJpQKQ6tu9fV4SXj7i6cqm+xxVmGj+VlS6uB9kqdcmrcrGcxpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+lUHfh9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+lUHfh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725812787; x=1757348787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rz6usoxRhwHQOiy1AvH7Q2q2e75EtVYFHwUezsthlgE=;
  b=Y+lUHfh9AYmzwTxx4dXz3umUJNo8XuQQ+ToyQ8UWALEzbjxnHUkW6DuX
   SwMaqK9tc9p4R5GoTZ/m1lIM12F8mD+B4w7HJLWHVk0LI20PWkFAyMH2W
   WQq2JLUoRfFQteOKoOKEZ85CtbsINWv9xPCQQ2qOtcUo/2CmIurD07+hd
   yJtqxVO/rbR5PsqRgDfRLOO21mhilM43ZbsZRV4kRUMiUdlM0vmqfeoL/
   N+GdOoRi4JMThBCbjgt9AaAEffRQWjUYqfbYd4RmWUwO4E+MNFwe5NyQE
   2XUFNYIfH4azW26K5mF03Bq7u3+eLHz7oSYx8LnInjPAale1RPAAROQgw
   A==;
X-CSE-ConnectionGUID: WzYIkL17SpK5o/4rg3fZLA==
X-CSE-MsgGUID: qzJg1niHTOuciSxj1JU2ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24447935"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="24447935"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 09:26:26 -0700
X-CSE-ConnectionGUID: u4ZopyoySVi8zGxKcgE23Q==
X-CSE-MsgGUID: r6ppsFHFRQOE2jzFYXiJVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66670263"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Sep 2024 09:26:25 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snKk3-000Dj3-0p;
	Sun, 08 Sep 2024 16:26:23 +0000
Date: Mon, 9 Sep 2024 00:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 10081/17452]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:597:5:
 warning: no previous prototype for function 'smmu_domain_config_s2'
Message-ID: <202409090027.Yf9WO67N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   73613a1daf068f5a55ff6323171266d9af1d4403
commit: edb183c2b760b28788587e86644d8a83b024be15 [10081/17452] ANDROID: drivers/arm-smmu-v3-kvm: Add smmu_domain_config_s2
config: arm64-randconfig-r062-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090027.Yf9WO67N-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090027.Yf9WO67N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090027.Yf9WO67N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:7:
   In file included from arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h:5:
   In file included from arch/arm64/include/asm/kvm_asm.h:52:
   In file included from include/linux/mm.h:2180:
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
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:597:5: warning: no previous prototype for function 'smmu_domain_config_s2' [-Wmissing-prototypes]
     597 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:597:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     597 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:629:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
     629 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:629:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     629 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:727:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
     727 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:727:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     727 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:744:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
     744 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:744:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     744 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:756:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
     756 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:756:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     756 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:799:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
     799 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:799:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     799 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:811:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
     811 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:811:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     811 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:824:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
     824 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:824:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     824 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   9 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
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
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


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
