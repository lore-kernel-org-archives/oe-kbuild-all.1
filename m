Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229773DBB7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717151137; cv=none; b=NYjVS1GDHs4EDX+3x8jCsj1Z8RoVHe87yrGmeokJMlr4WUY9SxGQ0oSxIp/4cjr+YlH0GqV8q8/DjLM3x7XJfE/LiICOTHzf3PV02Y2A4g681m2UI8oXDNNVB/8LDGv2r6gvmo+M5cQQ5DA4vnnpwO/5Tf7dslt8CkN76Y4xJOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717151137; c=relaxed/simple;
	bh=Ssl+w3NJXjJEaQfncn6CZp9iQyoFzgUCDCu1GRWaz/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O+CPOoFInfZ3pemwz0W2lWvrQcMTM7Y1jTsewrX700yCLTd9CmFPdDD9+CYKn0aB+mM1QoYLxOHtQqcrT1wuCtMYBDPLFv+7d87Vdm/6B0GOgdvkXfgWon+NrR3pQpUPIm8Y//2oe5zIkKQ/4fOL/LDwaG4I/9uwq+QkZ2wcMIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOOtq3Pz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOOtq3Pz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717151135; x=1748687135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ssl+w3NJXjJEaQfncn6CZp9iQyoFzgUCDCu1GRWaz/8=;
  b=gOOtq3Pzk5oFSMryE/++aE8hCagEEhnKNp2paeoGGaOcaKE/GGM6rSSn
   Otxucyl1Ag/BqFZ+iXO83D2qNRWOHTqlXi2Ab/E5GcTZ5843oOnz1blb9
   jZy9SJ1LZEpjvLXL+H27SlTP0T33i2v2kvGxe4wCIg4qAmM7QrLLlt7sV
   b5ZniInBftZbCvRTbgbu+Uo5Z6q8Ulp9FChfCIyIq1/UkhDFHflNeDRON
   Nnp53xtcDHwAkfHqM/kx5PlxPCSSO8Q28m9VmFXbaSJnqmW81Qi71f2wZ
   VfJod35kATd7oaJXp+5R2dm0GNCe4RikauJm1CAousSirkfwiFM1Wqjsm
   A==;
X-CSE-ConnectionGUID: aXbrdgXuRFCFbj7XfMF3Zg==
X-CSE-MsgGUID: nhlZLvcdT1aclvYMbBx/1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13449549"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13449549"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 03:25:34 -0700
X-CSE-ConnectionGUID: dlJElr2kSiefPNreAEVlJQ==
X-CSE-MsgGUID: co4kwSWsRDiI8/iGMWF3TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="40560389"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 May 2024 03:25:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCzRz-000GwQ-0D;
	Fri, 31 May 2024 10:25:31 +0000
Date: Fri, 31 May 2024 18:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-06-exp 10087/13266]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:691:5:
 warning: no previous prototype for 'smmu_domain_config_s1'
Message-ID: <202405311841.lvJITLDq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-06-exp
head:   55abd4e47b51cc21408819285768808fbd2384ac
commit: 026ea239f05bdca1d76b79f72336d570c3bae5fd [10087/13266] ANDROID: KVM: arm: smmu-v3: Add stage-1 attach
config: arm64-randconfig-r054-20240529 (https://download.01.org/0day-ci/archive/20240531/202405311841.lvJITLDq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311841.lvJITLDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311841.lvJITLDq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9,
                    from include/linux/io-pgtable-arm.h:167,
                    from arch/arm64/kvm/hyp/include/nvhe/iommu.h:9,
                    from arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:11:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h: In function '__lse_refcount_fetch_add_16':
   arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:22: error: expected string literal before '__LSE_PREAMBLE'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c: At top level:
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:659:5: warning: no previous prototype for 'smmu_domain_config_s2' [-Wmissing-prototypes]
     659 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:691:5: warning: no previous prototype for 'smmu_domain_config_s1' [-Wmissing-prototypes]
     691 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:765:5: warning: no previous prototype for 'smmu_domain_finalise' [-Wmissing-prototypes]
     765 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:877:5: warning: no previous prototype for 'smmu_alloc_domain' [-Wmissing-prototypes]
     877 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         |     ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:894:6: warning: no previous prototype for 'smmu_free_domain' [-Wmissing-prototypes]
     894 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:906:6: warning: no previous prototype for 'smmu_dabt_device' [-Wmissing-prototypes]
     906 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:949:6: warning: no previous prototype for 'smmu_dabt_handler' [-Wmissing-prototypes]
     949 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:961:5: warning: no previous prototype for 'smmu_suspend' [-Wmissing-prototypes]
     961 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:974:5: warning: no previous prototype for 'smmu_resume' [-Wmissing-prototypes]
     974 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


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
