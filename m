Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97555143C7E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 06:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730442614; cv=none; b=EfkjXsUTCAVk/qAoICfW+mRqaXO21rqaa3F9hciui3Oit20eWRu3Jrdh7dWZ4QA79E3Gy67Ilr6CP6deXGgfcuPT6RTw5KdaWPDmDi9N1RXWy3MhKDxeZvY78fJklBn+405tfqeZZWSEZEf/QzDf/2pVwClvnAlXGdWketl/a9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730442614; c=relaxed/simple;
	bh=6mIatFLtTmu9197U2tj0RoDJSMA97q3rU8kxVPKAtkc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HcKioRmtnPGmx/bfedKppJeMeIMFnfCSb3GpxMxH3zv8s+uLp4sZcj4EyGBrIkOvNldX6+fpRJYggfm0mCqudBdnJ1rvzkmnZkwZmFavW6+9OorOpMfhydF0htOCBHhb6gFDWoIehdmmxgPWhPY9JhnmAP6oD55lyleceBir/g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpteEdkd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpteEdkd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730442611; x=1761978611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6mIatFLtTmu9197U2tj0RoDJSMA97q3rU8kxVPKAtkc=;
  b=lpteEdkdi8SKjG8+f9rbx6wjRSOld1VN4h/mpJk4C2ImhyBIbtAzGMOm
   nPNn0fhXrgPNQAUBw9kc6Y8jTXs5+33OLcroGy/8l5e/hlpp3plV+U1AL
   wPJsRfMfE69UTQjJiqCGjsplrzd6RMnzBk4A+d2Ef1EclV6iOEA9lKbif
   QlPz/tLUmjMMHr5e9Q357+LTewP07EHPxEMm6glf92WRdgFMDEq2bImrK
   Vlx+k+fBsx8Oy3jqrr1hIf6LpnV1TRo13VXvypkGSRCLJj9tap0m3XSFz
   ud81JbdzEdofl51xAHY+WgisY+vEW2LvxBsVfAWm+oOaAMP5kbUdCV3+e
   w==;
X-CSE-ConnectionGUID: 9gJHI58rSKmfaad+z700Ug==
X-CSE-MsgGUID: pxLoVVMlT0emqsfKzSD9zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17839797"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="17839797"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 23:30:11 -0700
X-CSE-ConnectionGUID: 62zfgNY7T6Wh2ZyI9rFPZA==
X-CSE-MsgGUID: bATfZxFcSG6/p7uzhn45xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="87470467"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2024 23:30:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6lAd-000hDp-3B;
	Fri, 01 Nov 2024 06:30:07 +0000
Date: Fri, 1 Nov 2024 14:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 10081/19729]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:597:5:
 warning: no previous prototype for 'smmu_domain_config_s2'
Message-ID: <202411011438.2NPAn6tn-lkp@intel.com>
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
head:   4254247bbfb5a2a3e61f6241a113e2b7cf0a9e36
commit: edb183c2b760b28788587e86644d8a83b024be15 [10081/19729] ANDROID: drivers/arm-smmu-v3-kvm: Add smmu_domain_config_s2
config: arm64-randconfig-r061-20241101 (https://download.01.org/0day-ci/archive/20241101/202411011438.2NPAn6tn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011438.2NPAn6tn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011438.2NPAn6tn-lkp@intel.com/

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
