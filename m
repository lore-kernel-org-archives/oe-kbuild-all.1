Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B881547DC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730495767; cv=none; b=k4Tg3JdlOi7UsRtMU66E+2TDmrALHRqLT9lCQ3m55mAAgoineJN6MMDHpJ/txCfoi+uDhHailWTwoSmvOubr7NiSJ3W3+onivDVAdfJxU+EvLPrw3hXLA2uBdg1FrZDU/HJwP/YFXNNmz83E60Tk0Bwi/B0uc9V7D1JX571jDEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730495767; c=relaxed/simple;
	bh=mJqmy8BCNeI7/Z4ZWlx3qZDKPn8gOKiTvqvEiIbRwEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kot4VBzIF+XSEvrOy/gxaOIH1E9diIE6c7xwDYh52X+o+h+249WW7v7vckOnJqvDJRcMilq0obInS3MU1D/JY7NTZBTTR+Bbv1+8qrgPnZEDt3gxLTpXQQqax7ywv+7PqF1e2GlAKAl/DJ/R9dDBlyIb+3o3lGLVuYRziOVo3U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGCIY+Ev; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGCIY+Ev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730495765; x=1762031765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mJqmy8BCNeI7/Z4ZWlx3qZDKPn8gOKiTvqvEiIbRwEY=;
  b=CGCIY+EvL8mzxLo0E4GWMPTIGW6gy3T/a2awRTyi7cwsfftkuJb/GvFU
   lzO4/8mo0xKJgZKlezKEAisO4lCHBlbWImwSp/jupkdvxNAa4V2s6hfDh
   Fg2tu0gkW5BxERyS5ccgda8FVQSXjEmyPZZgd2GbE0QlKUsm20rswIy4Y
   TSIHnTY9uaC9qxK6CcaBuJHx35NT4OdByGrH2oLzIXYH9dktsWOcZvyTK
   IOPA4OwL2yHQpADgcXDEv/WAKefTaq2f6fIlvqWHAUSv1YQinyOCROZgX
   XO3RabvCNLYmbeqg9i18NRIxpaV/JjdZmmSgjkOO/CArWEL3ouskb+sa2
   w==;
X-CSE-ConnectionGUID: A1s8cT8RTa+E2Exk3la8pQ==
X-CSE-MsgGUID: H4WVk0pcQY2vLnHBaq9f4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30227846"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30227846"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 14:16:03 -0700
X-CSE-ConnectionGUID: SWiRxCwKRduquS7ndQXzbw==
X-CSE-MsgGUID: 7VsCmRSlR5+OpTPSRTzS2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="83418804"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Nov 2024 14:16:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6yzu-000i33-0F;
	Fri, 01 Nov 2024 21:15:58 +0000
Date: Sat, 2 Nov 2024 05:15:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 5/5]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:691:5:
 warning: no previous prototype for 'smmu_domain_config_s1'
Message-ID: <202411020531.PzJqdqnF-lkp@intel.com>
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
head:   bd8c55b43849f4d02471b635b95ebbc6f10d820b
commit: 026ea239f05bdca1d76b79f72336d570c3bae5fd [5/5] ANDROID: KVM: arm: smmu-v3: Add stage-1 attach
config: arm64-randconfig-r061-20241101 (https://download.01.org/0day-ci/archive/20241102/202411020531.PzJqdqnF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020531.PzJqdqnF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020531.PzJqdqnF-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
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
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
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
