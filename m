Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53847176183
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 13:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717074354; cv=none; b=hH9YPp23ysoxXTqgjOm9OLR+S6S5WYbOE5/jK32sODA622KhLd2owzACilxtMO8SUOGs58RM9ESJ7aS+3Q8Q9JoLqqgxqRuPo/eQwK2Frhn37ibrdnBS5UWSXQx2BDV/V89Wwo9aShAVMoq75OO0TBOA+8KswoWonTni9OL4Z1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717074354; c=relaxed/simple;
	bh=lsQfV4cshyhWMewz9wzysSIAPJIY/VIgsi3xwtHw3Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=swI2Z5bNJaeqlbWU9MrrbeN3TgaBs/CwAtIE3aJjoP9T5BkMeUIEW/jq4Rwr67vXIFMfgZfn28R/8teIe+Zh/OtlGDqozEkxXA6xE26Lm/dawfj0fLK7pCsrW62M+wKEU2GVE3DZiuYS7vNuYvA5MzP5z808SS4W+us1CvwhYRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARvqvkT8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARvqvkT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717074351; x=1748610351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lsQfV4cshyhWMewz9wzysSIAPJIY/VIgsi3xwtHw3Lk=;
  b=ARvqvkT86+I522bRUbxWbGlXbTrxHjb31F4gEUPN4GqsGma1/82lAOkb
   ML/tZRod5uLzvAz7afp9mXzafrVCIdJvafwgiTe/r15gkM1abpy9wHrMc
   ghUGZEv+cu76rvTniuUmLDGEX1ozvjih6VkucpP5W5PItfZV4130iIFsC
   y0aAWsUR8WZRaMPzASswyIBau8ChP/ufr2MruWImIjmrBxMfrRXGw6N5V
   6JVSiPQQM5AF85xaRge3gD/4nE2kASkYB8vRPz3d1aWKTng+Hrys1+Q0F
   vH8AyWEwkEsb3WhdXJ1lCT4j1a9QN0pV1KiCH7IOpMX+J+jVg2kk9U2kU
   g==;
X-CSE-ConnectionGUID: x+uiydwzQr+AnJfTyW4ZSw==
X-CSE-MsgGUID: 9rDxn+wdR9q1ZeiKOm0U7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24963566"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="24963566"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 06:05:50 -0700
X-CSE-ConnectionGUID: dzxhYjl6R92fTWEQj5pMlw==
X-CSE-MsgGUID: NUY4Rmj9T0e5RVRVmN0OrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="35744329"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 May 2024 06:05:50 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCfTX-000FMJ-0y;
	Thu, 30 May 2024 13:05:47 +0000
Date: Thu, 30 May 2024 21:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-06-exp 10071/13266]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:570:5:
 warning: no previous prototype for 'smmu_domain_finalise'
Message-ID: <202405302157.NUuZ0pc0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-06-exp
head:   55abd4e47b51cc21408819285768808fbd2384ac
commit: 988736bbd276fe2f5fce9b78c453e2508b4f6150 [10071/13266] ANDROID: iommu/arm-smmu-v3-kvm: Move files out of KVM
config: arm64-randconfig-r054-20240529 (https://download.01.org/0day-ci/archive/20240530/202405302157.NUuZ0pc0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405302157.NUuZ0pc0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405302157.NUuZ0pc0-lkp@intel.com/

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
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:570:5: warning: no previous prototype for 'smmu_domain_finalise' [-Wmissing-prototypes]
     570 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:686:5: warning: no previous prototype for 'smmu_alloc_domain' [-Wmissing-prototypes]
     686 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain)
         |     ^~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:701:6: warning: no previous prototype for 'smmu_free_domain' [-Wmissing-prototypes]
     701 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:713:6: warning: no previous prototype for 'smmu_dabt_device' [-Wmissing-prototypes]
     713 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:756:6: warning: no previous prototype for 'smmu_dabt_handler' [-Wmissing-prototypes]
     756 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:768:5: warning: no previous prototype for 'smmu_suspend' [-Wmissing-prototypes]
     768 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:781:5: warning: no previous prototype for 'smmu_resume' [-Wmissing-prototypes]
     781 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9,
                    from include/linux/io-pgtable-arm.h:167,
                    from arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:11:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h: In function '__lse_refcount_fetch_add_16':
   arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:22: error: expected string literal before '__LSE_PREAMBLE'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c: At top level:
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:52:5: warning: no previous prototype for 'kvm_arm_io_pgtable_init' [-Wmissing-prototypes]
      52 | int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
         |     ^~~~~~~~~~~~~~~~~~~~~~~

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


vim +/smmu_domain_finalise +570 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  569  
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10 @570  int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  571  {
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  572  	int ret;
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  573  	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  574  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(smmu_domain->iommu);
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  575  
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  576  	domain->pgtable = kvm_arm_io_pgtable_alloc(&smmu->pgtable_cfg,
bf32ef941111747 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-04  577  						   domain, &ret);
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  578  
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  579  	return ret;
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  580  }
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  581  
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  582  static int smmu_attach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  583  			   u32 sid)
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  584  {
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  585  	int i;
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  586  	int ret = -EINVAL;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  587  	u64 *dst;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  588  	struct io_pgtable_cfg *cfg;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  589  	u64 ts, sl, ic, oc, sh, tg, ps;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  590  	u64 ent[STRTAB_STE_DWORDS] = {};
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  591  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  592  	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  593  
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  594  	hyp_spin_lock(&iommu->lock);
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  595  	dst = smmu_get_ste_ptr(smmu, sid);
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  596  	if (!dst || dst[0])
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  597  		goto out_unlock;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  598  
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  599  	/*
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  600  	 * First attach to the domain, this is over protected by the all domain locks,
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  601  	 * as there is no per-domain lock now, this can be improved later.
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  602  	 * However, as this operation is not on the hot path, it should be fine.
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  603  	 */
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  604  	if (!domain->pgtable) {
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  605  		smmu_domain->iommu = iommu;
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  606  		ret = smmu_domain_finalise(domain);
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  607  		if (ret)
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  608  			goto out_unlock;
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  609  	}
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  610  
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  611  	if (smmu_domain->iommu != iommu) {
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  612  		ret = -EBUSY;
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  613  		goto out_unlock;
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  614  	}
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  615  
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  616  	cfg = &domain->pgtable->cfg;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  617  	ps = cfg->arm_lpae_s2_cfg.vtcr.ps;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  618  	tg = cfg->arm_lpae_s2_cfg.vtcr.tg;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  619  	sh = cfg->arm_lpae_s2_cfg.vtcr.sh;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  620  	oc = cfg->arm_lpae_s2_cfg.vtcr.orgn;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  621  	ic = cfg->arm_lpae_s2_cfg.vtcr.irgn;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  622  	sl = cfg->arm_lpae_s2_cfg.vtcr.sl;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  623  	ts = cfg->arm_lpae_s2_cfg.vtcr.tsz;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  624  
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  625  	ent[0] = STRTAB_STE_0_V |
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  626  		 FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  627  	ent[1] = FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING);
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  628  	ent[2] = FIELD_PREP(STRTAB_STE_2_VTCR,
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  629  			FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, ps) |
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  630  			FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, tg) |
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  631  			FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, sh) |
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  632  			FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, oc) |
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  633  			FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, ic) |
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  634  			FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, sl) |
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  635  			FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, ts)) |
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  636  		 FIELD_PREP(STRTAB_STE_2_S2VMID, domain->domain_id) |
d762f92ae92ce32 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  637  		 STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2R;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  638  	ent[3] = cfg->arm_lpae_s2_cfg.vttbr & STRTAB_STE_3_S2TTB_MASK;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  639  
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  640  	/*
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  641  	 * The SMMU may cache a disabled STE.
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  642  	 * Initialize all fields, sync, then enable it.
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  643  	 */
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  644  	for (i = 1; i < STRTAB_STE_DWORDS; i++)
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  645  		dst[i] = cpu_to_le64(ent[i]);
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  646  
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  647  	ret = smmu_sync_ste(smmu, sid);
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  648  	if (ret)
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  649  		goto out_unlock;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  650  
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  651  	WRITE_ONCE(dst[0], cpu_to_le64(ent[0]));
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  652  	ret = smmu_sync_ste(smmu, sid);
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  653  	WARN_ON(ret);
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  654  
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  655  out_unlock:
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  656  	hyp_spin_unlock(&iommu->lock);
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  657  	return ret;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  658  }
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  659  
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  660  static int smmu_detach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  661  			   u32 sid)
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  662  {
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  663  	u64 *dst;
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  664  	int i, ret = -ENODEV;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  665  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  666  
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  667  	hyp_spin_lock(&iommu->lock);
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  668  	dst = smmu_get_ste_ptr(smmu, sid);
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  669  	if (!dst)
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  670  		goto out_unlock;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  671  
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  672  	dst[0] = 0;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  673  	ret = smmu_sync_ste(smmu, sid);
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  674  	if (ret)
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  675  		goto out_unlock;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  676  
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  677  	for (i = 1; i < STRTAB_STE_DWORDS; i++)
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  678  		dst[i] = 0;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  679  
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  680  	ret = smmu_sync_ste(smmu, sid);
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  681  out_unlock:
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  682  	hyp_spin_unlock(&iommu->lock);
e73b69a9d49fb83 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  683  	return ret;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  684  }
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  685  
bf32ef941111747 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-04 @686  int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain)
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  687  {
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  688  	struct hyp_arm_smmu_v3_domain *smmu_domain;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  689  
6dc5120525c9ede arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-11-02  690  	smmu_domain = smmu_alloc(sizeof(struct hyp_arm_smmu_v3_domain));
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  691  	if (!smmu_domain)
6dc5120525c9ede arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-11-02  692  		return -ENOMEM;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  693  
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  694  	/* Can't do much without the IOMMU. */
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  695  	smmu_domain->domain = domain;
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  696  	domain->priv = (void *)smmu_domain;
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  697  
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  698  	return 0;
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  699  }
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  700  
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26 @701  void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  702  {
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  703  	/*
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  704  	 * As page table allocation is decoupled from alloc_domain, free_domain can
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  705  	 * be called with a domain that have never been attached.
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  706  	 */
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  707  	if (domain->pgtable)
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  708  		kvm_arm_io_pgtable_free(domain->pgtable);
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  709  
28f2b00624d802b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  710  	hyp_free(domain->priv);
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  711  }
77efc595cc5d8a7 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  712  
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08 @713  bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  714  		      struct kvm_cpu_context *host_ctxt, u64 esr, u32 off)
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  715  {
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  716  	bool is_write = esr & ESR_ELx_WNR;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  717  	unsigned int len = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  718  	int rd = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  719  	const u32 no_access  = 0;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  720  	const u32 read_write = (u32)(-1);
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  721  	const u32 read_only = is_write ? no_access : read_write;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  722  	u32 mask = no_access;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  723  
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  724  	/*
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  725  	 * Only handle MMIO access with u32 size and alignment.
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  726  	 * We don't need to change 64-bit registers for now.
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  727  	 */
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  728  	if ((len != sizeof(u32)) || (off & (sizeof(u32) - 1)))
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  729  		return false;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  730  
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  731  	switch (off) {
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  732  	case ARM_SMMU_EVTQ_PROD + SZ_64K:
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  733  		mask = read_write;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  734  		break;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  735  	case ARM_SMMU_EVTQ_CONS + SZ_64K:
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  736  		mask = read_write;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  737  		break;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  738  	case ARM_SMMU_GERROR:
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  739  		mask = read_only;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  740  		break;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  741  	case ARM_SMMU_GERRORN:
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  742  		mask = read_write;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  743  		break;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  744  	};
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  745  
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  746  	if (!mask)
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  747  		return false;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  748  	if (is_write)
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  749  		writel_relaxed(cpu_reg(host_ctxt, rd) & mask, smmu->base + off);
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  750  	else
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  751  		cpu_reg(host_ctxt, rd) = readl_relaxed(smmu->base + off);
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  752  
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  753  	return true;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  754  }
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  755  
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08 @756  bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  757  {
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  758  	struct hyp_arm_smmu_v3_device *smmu;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  759  
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  760  	for_each_smmu(smmu) {
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  761  		if (addr < smmu->mmio_addr || addr >= smmu->mmio_addr + smmu->mmio_size)
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  762  			continue;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  763  		return smmu_dabt_device(smmu, host_ctxt, esr, addr - smmu->mmio_addr);
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  764  	}
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  765  	return false;
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  766  }
53fd27c427aae5f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  767  
8af4fb14929c1c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17 @768  int smmu_suspend(struct kvm_hyp_iommu *iommu)
8af4fb14929c1c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  769  {
8af4fb14929c1c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  770  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
8af4fb14929c1c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  771  
8af4fb14929c1c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  772  	/*
8af4fb14929c1c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  773  	 * Disable translation, GBPA is validated at probe to be set, so all transaltion
8af4fb14929c1c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  774  	 * would be aborted when SMMU is disabled.
8af4fb14929c1c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  775  	 */
8af4fb14929c1c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  776  	if (iommu->power_domain.type == KVM_POWER_DOMAIN_HOST_HVC)
8af4fb14929c1c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  777  		return smmu_write_cr0(smmu, 0);
8af4fb14929c1c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  778  	return 0;
8af4fb14929c1c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  779  }
8af4fb14929c1c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  780  

:::::: The code at line 570 was first introduced by commit
:::::: 28f2b00624d802bc9cd31a5ae9a9da1760039a2b ANDROID: KVM: arm64: iommu: Remove iommu from alloc_domain

:::::: TO: Mostafa Saleh <smostafa@google.com>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
