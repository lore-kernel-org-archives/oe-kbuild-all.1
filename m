Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE96F22D4E3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 19:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733426108; cv=none; b=m+MWGJitcpEpYQskmfkCrNRP+6EW24XHN/JQ+bBM4+wIJupBt8oUTTBA6zcsNLFUs/yqKrdRPjU33JeVxYuVUm8jhAxjGcLI19suC5bgjq9prWc/n4Pmg4spTwX7+yFQpQKoo1BslufIh4h4kFdD3LBVlM8xFyuvVoxUcS8nQg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733426108; c=relaxed/simple;
	bh=fG6UqYeMRWkqfX6tDyigifc6XOTYxWiTjdTOC7UaVDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UgCpufvRJ8wiYEX4dThMJP9ANB2h5UQno51Co93kmdH0Zo5q9Ff0n88Vm+sDA+AIdYGNI1JOFiPqMAi0mFYqD7BwhBtq4hjkvY6x6R16VaHdEt/L3a3q1fy06W82RjwHy3IjYbjOro9GTylgseG/B9hc6fVYEDdaB5CHaNeZV2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4OWIYZ+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4OWIYZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733426106; x=1764962106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fG6UqYeMRWkqfX6tDyigifc6XOTYxWiTjdTOC7UaVDc=;
  b=P4OWIYZ+iV1FRYh8MajOwUw8cbeE2pekOH47qeNKFd69w89jjYykSAkD
   lWvOKph3n1HA9eyQdJu8dHFaeh5tZDzrI8uGNr6v4cqp6i3gcAqnfUKJB
   Q0KjZs/yDHvwBHKrOUzQXG8SNEjU3lMUls2w3FE81mTV6+DSafI9fwxTO
   OPTjKKQfY5hzXA7Ad70qSoge8qtGmWFekinSrKkevfRkwwUNh+u6W2IVD
   hx51TRyjjLBc6lKNreI/o1l288DPIwXCCbfE6rlBfymSwapreW2ThJ9G0
   /MvYujW8gsGxJKVsl4XM/JbcQd3drIHKeqnS/Ss+11cY1uRmrO9JPyjuD
   Q==;
X-CSE-ConnectionGUID: /3TUX7ZURR+/DY+vn4TASQ==
X-CSE-MsgGUID: 7uwxWsQ1RuaUQ2DpuTeorw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="51302315"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="51302315"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 11:15:05 -0800
X-CSE-ConnectionGUID: K2Nv5wxpRaWSOFfrN7b9ZA==
X-CSE-MsgGUID: Cr7KYkyMTDKxabGGAUotOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="94052557"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Dec 2024 11:15:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJHJV-0000Jj-0L;
	Thu, 05 Dec 2024 19:15:01 +0000
Date: Fri, 6 Dec 2024 03:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 10086/20170]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:691:5:
 warning: no previous prototype for function 'smmu_domain_config_s1'
Message-ID: <202412060331.XAsbzFlG-lkp@intel.com>
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
commit: 026ea239f05bdca1d76b79f72336d570c3bae5fd [10086/20170] ANDROID: KVM: arm: smmu-v3: Add stage-1 attach
config: arm64-randconfig-001-20241205 (https://download.01.org/0day-ci/archive/20241206/202412060331.XAsbzFlG-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060331.XAsbzFlG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060331.XAsbzFlG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:659:5: warning: no previous prototype for function 'smmu_domain_config_s2' [-Wmissing-prototypes]
   int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
       ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:659:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
   ^
   static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:691:5: warning: no previous prototype for function 'smmu_domain_config_s1' [-Wmissing-prototypes]
   int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
       ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:691:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:765:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
   int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
       ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:765:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:877:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
   int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
       ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:877:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:894:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
   void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
        ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:894:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:906:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
   bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
        ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:906:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:949:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
   bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
        ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:949:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:961:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
   int smmu_suspend(struct kvm_hyp_iommu *iommu)
       ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:961:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_suspend(struct kvm_hyp_iommu *iommu)
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:974:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
   int smmu_resume(struct kvm_hyp_iommu *iommu)
       ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:974:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_resume(struct kvm_hyp_iommu *iommu)
   ^
   static 
   9 warnings generated.

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


vim +/smmu_domain_config_s1 +691 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

   690	
 > 691	int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
   692				  struct kvm_hyp_iommu_domain *domain,
   693				  u32 sid, u32 pasid, u32 pasid_bits,
   694				  u64 *ent, bool *update_ste)
   695	{
   696		u64 *cd_table;
   697		u64 *ste;
   698		u32 nr_entries;
   699		u64 val;
   700		u64 *cd_entry;
   701		struct io_pgtable_cfg *cfg;
   702	
   703		cfg = &domain->pgtable->cfg;
   704		ste = smmu_get_ste_ptr(smmu, sid);
   705		val = le64_to_cpu(ste[0]);
   706	
   707		/* The host trying to attach stage-1 domain to an already stage-2 attached device. */
   708		if (FIELD_GET(STRTAB_STE_0_CFG, val) == STRTAB_STE_0_CFG_S2_TRANS)
   709			return -EBUSY;
   710	
   711		cd_table = (u64 *)(FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, val) << 6);
   712		nr_entries = 1 << FIELD_GET(STRTAB_STE_0_S1CDMAX, val);
   713		*update_ste = false;
   714		/* This is the first pasid attached to this device. */
   715		if (!cd_table) {
   716			cd_table = smmu_alloc_cd(pasid_bits);
   717			if (!cd_table)
   718				return -ENOMEM;
   719			nr_entries = 1 << pasid_bits;
   720			ent[1] = FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
   721				 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
   722				 FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
   723				 FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH);
   724			ent[0] = ((u64)cd_table & STRTAB_STE_0_S1CTXPTR_MASK) |
   725				 FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
   726				 FIELD_PREP(STRTAB_STE_0_S1CDMAX, pasid_bits) |
   727				 FIELD_PREP(STRTAB_STE_0_S1FMT, STRTAB_STE_0_S1FMT_LINEAR) |
   728				 STRTAB_STE_0_V;
   729			*update_ste = true;
   730		}
   731	
   732		if (pasid >= nr_entries)
   733			return -E2BIG;
   734		/* Write CD. */
   735		cd_entry = smmu_get_cd_ptr(hyp_phys_to_virt((u64)cd_table), pasid);
   736	
   737		/* CD already used by another device. */
   738		if (cd_entry[0])
   739			return -EBUSY;
   740	
   741		cd_entry[1] = cpu_to_le64(cfg->arm_lpae_s1_cfg.ttbr & CTXDESC_CD_1_TTB0_MASK);
   742		cd_entry[2] = 0;
   743		cd_entry[3] = cpu_to_le64(cfg->arm_lpae_s1_cfg.mair);
   744		/* STE is live. */
   745		if (!(*update_ste))
   746			smmu_sync_cd(smmu, sid, pasid);
   747		val =  FIELD_PREP(CTXDESC_CD_0_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz) |
   748		       FIELD_PREP(CTXDESC_CD_0_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
   749		       FIELD_PREP(CTXDESC_CD_0_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
   750		       FIELD_PREP(CTXDESC_CD_0_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
   751		       FIELD_PREP(CTXDESC_CD_0_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
   752		       FIELD_PREP(CTXDESC_CD_0_TCR_IPS, cfg->arm_lpae_s1_cfg.tcr.ips) |
   753		       CTXDESC_CD_0_TCR_EPD1 | CTXDESC_CD_0_AA64 |
   754		       CTXDESC_CD_0_R | CTXDESC_CD_0_A |
   755		       CTXDESC_CD_0_ASET |
   756		       FIELD_PREP(CTXDESC_CD_0_ASID, domain->domain_id) |
   757		       CTXDESC_CD_0_V;
   758		WRITE_ONCE(cd_entry[0], cpu_to_le64(val));
   759		/* STE is live. */
   760		if (!(*update_ste))
   761			smmu_sync_cd(smmu, sid, pasid);
   762		return 0;
   763	}
   764	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
