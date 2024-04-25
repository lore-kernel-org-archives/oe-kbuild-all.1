Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A2023CE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 05:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714021788; cv=none; b=lPEnjc9SRFuF937cnQFedmyjunsRzyOVO3QZyGQ7Znuk9Y9ZBg5dX9HL6EjxXShzk3k3EtjBlSeg3snQLikY5v60wPPBHfmFF7i/g9nGbwrifMfCX7dMWO6SAPZr+RXZBMoB9afcddh3A/4zJAzkci/YLUAcZCgeEDB4HKNyFG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714021788; c=relaxed/simple;
	bh=ZwLLPmU9m56Q/ZkArAkQM5sg6ywg6jzD6Ku5Pt2h8q8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eSj8rpJeWv4ei3WwrHqSF/UMFYcvZ3vcJ+wNxjLCrGkbUts3NwPXYycGRu2qi5NUBvD8zdWg3IQjJiMieCLvieYFu/SYJOx+Qm1hbfz4swcS9rLQtrJaouxgjOcknrgiUt31KMT8nsCHwEXxiwRcVJxVA90SeZ50D8RBZ9OXZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhxyonUD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhxyonUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714021784; x=1745557784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZwLLPmU9m56Q/ZkArAkQM5sg6ywg6jzD6Ku5Pt2h8q8=;
  b=GhxyonUDOUvE7/nQ8/hTWK9al8tUX08twUKgfUOwVAN4bQzb+6Ro2CF3
   +TvSZMSk1qG4PfLxq0SHah7r4zWysU5ylFutPgC7VMhH44q0rMkq3Gzrc
   22Bkz3+EvL5srvl/ugAsgcWwhkZm4TiPtoj68VtA4wKSVNL6+lsNhiK82
   EtgobLGCXfUedR4kIZeCmrU5j1q0vd8mi853wDHb/MJDcPCFrJc3l4mO6
   Ng9k5y0zLgsmfKF3gVXVwIbvKkLnjqzGnpGS31xUBUd+xMmmybsZzN+A3
   l8ByW1OhJzRIfd+RNyp8zBaHTxrqc6IFgqTChNlw9JU07jtzUPzWhCMbB
   Q==;
X-CSE-ConnectionGUID: mGK908o8SZWNModQTHjXsQ==
X-CSE-MsgGUID: IVlXUXxgT2eTYQ4pO4hmFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12620645"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="12620645"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 22:09:43 -0700
X-CSE-ConnectionGUID: RosUtyPBSLqDjSyDOjKdFA==
X-CSE-MsgGUID: KE6JdvBUR26CE7Y5O1gywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="48190854"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Apr 2024 22:09:43 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzrMa-0001yc-2V;
	Thu, 25 Apr 2024 05:09:40 +0000
Date: Thu, 25 Apr 2024 13:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 1/30]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:570:5:
 warning: no previous prototype for function 'smmu_domain_finalise'
Message-ID: <202404251328.V7lWYyEJ-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   fc203c3d8fb45cd037f8eee1f318d8ae07920897
commit: 417ecdd3fe9adee15eec74bbab178e2617bf6c4b [1/30] ANDROID: iommu/arm-smmu-v3-kvm: Move files out of KVM
config: arm64-randconfig-r064-20240425 (https://download.01.org/0day-ci/archive/20240425/202404251328.V7lWYyEJ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404251328.V7lWYyEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251328.V7lWYyEJ-lkp@intel.com/

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
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:570:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
     570 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:570:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     570 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:686:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
     686 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:686:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     686 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:701:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
     701 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:701:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     701 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:713:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
     713 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:713:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     713 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:756:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
     756 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:756:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     756 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:768:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
     768 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:768:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     768 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:781:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
     781 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:781:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     781 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   8 warnings and 1 error generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:5:
   In file included from arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h:5:
   In file included from arch/arm64/include/asm/kvm_asm.h:52:
   In file included from include/linux/mm.h:2025:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:11:
   In file included from include/linux/io-pgtable-arm.h:167:
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:15: error: expected string literal in 'asm'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:52:5: warning: no previous prototype for function 'kvm_arm_io_pgtable_init' [-Wmissing-prototypes]
      52 | int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:52:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      52 | int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
         | ^
         | static 
   2 warnings and 1 error generated.

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


vim +/smmu_domain_finalise +570 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  569  
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10 @570  int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  571  {
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  572  	int ret;
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  573  	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  574  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(smmu_domain->iommu);
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  575  
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  576  	domain->pgtable = kvm_arm_io_pgtable_alloc(&smmu->pgtable_cfg,
65c39348604eb4 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-04  577  						   domain, &ret);
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  578  
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  579  	return ret;
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  580  }
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  581  
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  582  static int smmu_attach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  583  			   u32 sid)
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  584  {
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  585  	int i;
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  586  	int ret = -EINVAL;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  587  	u64 *dst;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  588  	struct io_pgtable_cfg *cfg;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  589  	u64 ts, sl, ic, oc, sh, tg, ps;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  590  	u64 ent[STRTAB_STE_DWORDS] = {};
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  591  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  592  	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  593  
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  594  	hyp_spin_lock(&iommu->lock);
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  595  	dst = smmu_get_ste_ptr(smmu, sid);
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  596  	if (!dst || dst[0])
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  597  		goto out_unlock;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  598  
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  599  	/*
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  600  	 * First attach to the domain, this is over protected by the all domain locks,
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  601  	 * as there is no per-domain lock now, this can be improved later.
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  602  	 * However, as this operation is not on the hot path, it should be fine.
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  603  	 */
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  604  	if (!domain->pgtable) {
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  605  		smmu_domain->iommu = iommu;
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  606  		ret = smmu_domain_finalise(domain);
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  607  		if (ret)
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  608  			goto out_unlock;
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  609  	}
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  610  
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  611  	if (smmu_domain->iommu != iommu) {
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  612  		ret = -EBUSY;
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  613  		goto out_unlock;
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  614  	}
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  615  
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  616  	cfg = &domain->pgtable->cfg;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  617  	ps = cfg->arm_lpae_s2_cfg.vtcr.ps;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  618  	tg = cfg->arm_lpae_s2_cfg.vtcr.tg;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  619  	sh = cfg->arm_lpae_s2_cfg.vtcr.sh;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  620  	oc = cfg->arm_lpae_s2_cfg.vtcr.orgn;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  621  	ic = cfg->arm_lpae_s2_cfg.vtcr.irgn;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  622  	sl = cfg->arm_lpae_s2_cfg.vtcr.sl;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  623  	ts = cfg->arm_lpae_s2_cfg.vtcr.tsz;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  624  
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  625  	ent[0] = STRTAB_STE_0_V |
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  626  		 FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  627  	ent[1] = FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING);
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  628  	ent[2] = FIELD_PREP(STRTAB_STE_2_VTCR,
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  629  			FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, ps) |
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  630  			FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, tg) |
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  631  			FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, sh) |
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  632  			FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, oc) |
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  633  			FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, ic) |
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  634  			FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, sl) |
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  635  			FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, ts)) |
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  636  		 FIELD_PREP(STRTAB_STE_2_S2VMID, domain->domain_id) |
e38eaba127198f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  637  		 STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2R;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  638  	ent[3] = cfg->arm_lpae_s2_cfg.vttbr & STRTAB_STE_3_S2TTB_MASK;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  639  
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  640  	/*
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  641  	 * The SMMU may cache a disabled STE.
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  642  	 * Initialize all fields, sync, then enable it.
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  643  	 */
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  644  	for (i = 1; i < STRTAB_STE_DWORDS; i++)
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  645  		dst[i] = cpu_to_le64(ent[i]);
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  646  
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  647  	ret = smmu_sync_ste(smmu, sid);
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  648  	if (ret)
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  649  		goto out_unlock;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  650  
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  651  	WRITE_ONCE(dst[0], cpu_to_le64(ent[0]));
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  652  	ret = smmu_sync_ste(smmu, sid);
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  653  	WARN_ON(ret);
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  654  
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  655  out_unlock:
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  656  	hyp_spin_unlock(&iommu->lock);
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  657  	return ret;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  658  }
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  659  
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  660  static int smmu_detach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  661  			   u32 sid)
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  662  {
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  663  	u64 *dst;
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  664  	int i, ret = -ENODEV;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  665  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  666  
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  667  	hyp_spin_lock(&iommu->lock);
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  668  	dst = smmu_get_ste_ptr(smmu, sid);
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  669  	if (!dst)
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  670  		goto out_unlock;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  671  
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  672  	dst[0] = 0;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  673  	ret = smmu_sync_ste(smmu, sid);
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  674  	if (ret)
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  675  		goto out_unlock;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  676  
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  677  	for (i = 1; i < STRTAB_STE_DWORDS; i++)
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  678  		dst[i] = 0;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  679  
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  680  	ret = smmu_sync_ste(smmu, sid);
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  681  out_unlock:
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  682  	hyp_spin_unlock(&iommu->lock);
36725847a2bff9 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  683  	return ret;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  684  }
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  685  
65c39348604eb4 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-04 @686  int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain)
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  687  {
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  688  	struct hyp_arm_smmu_v3_domain *smmu_domain;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  689  
121d5cd12222fc arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-11-02  690  	smmu_domain = smmu_alloc(sizeof(struct hyp_arm_smmu_v3_domain));
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  691  	if (!smmu_domain)
121d5cd12222fc arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-11-02  692  		return -ENOMEM;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  693  
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  694  	/* Can't do much without the IOMMU. */
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  695  	smmu_domain->domain = domain;
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  696  	domain->priv = (void *)smmu_domain;
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  697  
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  698  	return 0;
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  699  }
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  700  
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26 @701  void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  702  {
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  703  	/*
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  704  	 * As page table allocation is decoupled from alloc_domain, free_domain can
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  705  	 * be called with a domain that have never been attached.
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  706  	 */
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  707  	if (domain->pgtable)
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  708  		kvm_arm_io_pgtable_free(domain->pgtable);
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  709  
a7952d83baa4e6 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  710  	hyp_free(domain->priv);
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  711  }
10b340ac53ba3b arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  712  
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08 @713  bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  714  		      struct kvm_cpu_context *host_ctxt, u64 esr, u32 off)
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  715  {
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  716  	bool is_write = esr & ESR_ELx_WNR;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  717  	unsigned int len = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  718  	int rd = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  719  	const u32 no_access  = 0;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  720  	const u32 read_write = (u32)(-1);
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  721  	const u32 read_only = is_write ? no_access : read_write;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  722  	u32 mask = no_access;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  723  
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  724  	/*
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  725  	 * Only handle MMIO access with u32 size and alignment.
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  726  	 * We don't need to change 64-bit registers for now.
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  727  	 */
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  728  	if ((len != sizeof(u32)) || (off & (sizeof(u32) - 1)))
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  729  		return false;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  730  
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  731  	switch (off) {
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  732  	case ARM_SMMU_EVTQ_PROD + SZ_64K:
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  733  		mask = read_write;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  734  		break;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  735  	case ARM_SMMU_EVTQ_CONS + SZ_64K:
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  736  		mask = read_write;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  737  		break;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  738  	case ARM_SMMU_GERROR:
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  739  		mask = read_only;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  740  		break;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  741  	case ARM_SMMU_GERRORN:
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  742  		mask = read_write;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  743  		break;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  744  	};
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  745  
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  746  	if (!mask)
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  747  		return false;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  748  	if (is_write)
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  749  		writel_relaxed(cpu_reg(host_ctxt, rd) & mask, smmu->base + off);
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  750  	else
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  751  		cpu_reg(host_ctxt, rd) = readl_relaxed(smmu->base + off);
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  752  
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  753  	return true;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  754  }
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  755  
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08 @756  bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  757  {
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  758  	struct hyp_arm_smmu_v3_device *smmu;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  759  
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  760  	for_each_smmu(smmu) {
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  761  		if (addr < smmu->mmio_addr || addr >= smmu->mmio_addr + smmu->mmio_size)
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  762  			continue;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  763  		return smmu_dabt_device(smmu, host_ctxt, esr, addr - smmu->mmio_addr);
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  764  	}
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  765  	return false;
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  766  }
76a1c655cb41c2 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  767  
6fc13d361a93aa arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17 @768  int smmu_suspend(struct kvm_hyp_iommu *iommu)
6fc13d361a93aa arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  769  {
6fc13d361a93aa arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  770  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
6fc13d361a93aa arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  771  
6fc13d361a93aa arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  772  	/*
6fc13d361a93aa arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  773  	 * Disable translation, GBPA is validated at probe to be set, so all transaltion
6fc13d361a93aa arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  774  	 * would be aborted when SMMU is disabled.
6fc13d361a93aa arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  775  	 */
6fc13d361a93aa arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  776  	if (iommu->power_domain.type == KVM_POWER_DOMAIN_HOST_HVC)
6fc13d361a93aa arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  777  		return smmu_write_cr0(smmu, 0);
6fc13d361a93aa arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  778  	return 0;
6fc13d361a93aa arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  779  }
6fc13d361a93aa arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  780  

:::::: The code at line 570 was first introduced by commit
:::::: a7952d83baa4e664e9afd4c263571f9bcb95997d ANDROID: KVM: arm64: iommu: Remove iommu from alloc_domain

:::::: TO: Mostafa Saleh <smostafa@google.com>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
