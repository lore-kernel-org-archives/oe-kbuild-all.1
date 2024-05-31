Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D79C360
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 00:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717114106; cv=none; b=I3IlZisPnfwrHJpKLaIkPRyRVZk7W0cEKqHjog52l5OzQ1pFWaeQsfZrff1pi+yimNwNFTebPS7+7Y0+5zQkdj9Lc9hVJSAwAppWTQPF4nlaVQOttXL7zkomLilReA0TuUKeGefXVGK4uf8n0+CIAQCkvVkhcBpbP168Mdl2jtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717114106; c=relaxed/simple;
	bh=sXffO9GwbKm570bV7qD4kRrBq+O3OIMlErorNlRUL+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ddme5akQZHjCY7zU5wuxgtblC5/h8A0Jr1Dy1doRAjXer4K8eBlNHHOh2GUwMsSmdP8s6pYQZyt98k/EEAgJBqPUtSFhVaqdUvZjblZ/IQ2mmRDdKYbbhfaUyZYflVMFhbeyvgN0V4tlwucn/enSCPP4Ouuf+O1L9dJZe7LBAi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICm5s1kW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICm5s1kW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717114103; x=1748650103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXffO9GwbKm570bV7qD4kRrBq+O3OIMlErorNlRUL+s=;
  b=ICm5s1kWNPy7R7ZKAiZ1lRjzfaagazpUbamhukt2ch7qot4YWQeJB1MP
   E0aFKr+VmRcAAapgldXHcEDTdtUZCcwpN0nmKNlg70GjlpEAe5x9HTq03
   u7ptLs7QuIuQ8Rres9K2DKAu1Vha4Pn9inkEJosB/sInx/+H8CVwtmjNw
   8DO48lwiHTmXBjkcoHrNxd7LL5/ww3YikgFu9OPMqHyEQ6JnOTxmjuT2J
   t+Bd/XYqECzYWkUXbFds1SocE0TE9iGyXTcnjHB8L+am1k8xdln5mL5hF
   dt2pati1PNnbV3GFhMDoYeAnVbOz3io17oF9Qq6tQSoSv0tr+6WK5hRWH
   g==;
X-CSE-ConnectionGUID: 9CGh3+wfSrOHVJuyDGWOqA==
X-CSE-MsgGUID: B4O5QZxOTBqFO6i0C0XVdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25046381"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="25046381"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 17:08:23 -0700
X-CSE-ConnectionGUID: js+yU0NtTy6OMVksj3gOlQ==
X-CSE-MsgGUID: ycqtFK9lR+OU/Gauq690Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="36092290"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 May 2024 17:08:22 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCpoh-000GEl-1x;
	Fri, 31 May 2024 00:08:19 +0000
Date: Fri, 31 May 2024 08:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-06-exp 10082/13266]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:597:5:
 warning: no previous prototype for 'smmu_domain_config_s2'
Message-ID: <202405310818.XaqXqNyK-lkp@intel.com>
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
commit: edb183c2b760b28788587e86644d8a83b024be15 [10082/13266] ANDROID: drivers/arm-smmu-v3-kvm: Add smmu_domain_config_s2
config: arm64-randconfig-r054-20240529 (https://download.01.org/0day-ci/archive/20240531/202405310818.XaqXqNyK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405310818.XaqXqNyK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310818.XaqXqNyK-lkp@intel.com/

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
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:597:5: warning: no previous prototype for 'smmu_domain_config_s2' [-Wmissing-prototypes]
     597 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:629:5: warning: no previous prototype for 'smmu_domain_finalise' [-Wmissing-prototypes]
     629 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:727:5: warning: no previous prototype for 'smmu_alloc_domain' [-Wmissing-prototypes]
     727 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         |     ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:744:6: warning: no previous prototype for 'smmu_free_domain' [-Wmissing-prototypes]
     744 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:756:6: warning: no previous prototype for 'smmu_dabt_device' [-Wmissing-prototypes]
     756 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:799:6: warning: no previous prototype for 'smmu_dabt_handler' [-Wmissing-prototypes]
     799 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:811:5: warning: no previous prototype for 'smmu_suspend' [-Wmissing-prototypes]
     811 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:824:5: warning: no previous prototype for 'smmu_resume' [-Wmissing-prototypes]
     824 | int smmu_resume(struct kvm_hyp_iommu *iommu)
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
