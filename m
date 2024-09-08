Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6C71DA26
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 12:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725798615; cv=none; b=AGX7PGGaQYKAQcV8Eb4YU2F1kxFxv/HBHThY+MBwpG5cCNUN7zgEquswSzlS8okySomIdl9ShnY85jc5C2CuiHHXg1bun6U8HurjKJnvGnfPIu1dSFinLcOFmudmdwQ463Yla5aNzdjdZDkHe2ZhRfMyhySpa9IHuZ0+bFT4z7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725798615; c=relaxed/simple;
	bh=7L5q/CJsm1nwo/pYIse7FQROVQII/fPVVySWyu7aGlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LyIXqeCj1sDIP/iYrrib2Uznp2y8kj4tBOLYOlmM+9zaWlcdP3BR4nx9N4cv3HK88W6I7bduNAvWYNX7yV3KcgsZyQm6/fjpeNE3/zhFEw+YAXl+dkmeWSkssaubUwm/8rzvkjh8lHyJ/TfDjl7QMkhivNfiv5iP36fxOj8gEuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7UrqgcA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7UrqgcA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725798613; x=1757334613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7L5q/CJsm1nwo/pYIse7FQROVQII/fPVVySWyu7aGlQ=;
  b=g7UrqgcAqHGdnMfjnLYy+SFqmVrCFSgdmlTE5Ed9VoR4/pldyzgcKFaU
   6fZeR8C11Rsl/ibap+0FMFhufiblW0hvOFxSq4bm7IeCwoDsk0IdOl0s5
   awpvSDgDiIxj4nHgwIUCZvX7Y1LvBivT2RfNjCgyqDGkF5EH6vdW3iuGb
   cXrJlC4Xg08Y1TyVYKJv0PJtqnUAjMDVIVSDmg0F/A6K7xv9Ki3oiCuDY
   UKtiOvyYYj4iuJDs/J+UCuwaH1KHSI7yB4mJiZ7/Ga3Fe/i0d3K2L8o4P
   gO62qbXxdpSM22pXK/a5/gdMxj5lHJ0u8T/HgiCZA7uwGg527hJRAx9EQ
   Q==;
X-CSE-ConnectionGUID: hgbnHAQzSlCAZ9P+L/00kQ==
X-CSE-MsgGUID: 0r7MocLfQuerKMR2LTvSOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35070251"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="35070251"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 05:30:12 -0700
X-CSE-ConnectionGUID: b3ywptqzS0aV6DuQX9v8KQ==
X-CSE-MsgGUID: MB7N4dppRyeqW9XewwYd7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="89673860"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Sep 2024 05:30:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snH3Q-000DWJ-0o;
	Sun, 08 Sep 2024 12:30:08 +0000
Date: Sun, 8 Sep 2024 20:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 10070/17452]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:570:5:
 warning: no previous prototype for function 'smmu_domain_finalise'
Message-ID: <202409082011.anIJ0FF9-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   73613a1daf068f5a55ff6323171266d9af1d4403
commit: 988736bbd276fe2f5fce9b78c453e2508b4f6150 [10070/17452] ANDROID: iommu/arm-smmu-v3-kvm: Move files out of KVM
config: arm64-randconfig-r062-20240908 (https://download.01.org/0day-ci/archive/20240908/202409082011.anIJ0FF9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409082011.anIJ0FF9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409082011.anIJ0FF9-lkp@intel.com/

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
   In file included from include/linux/mm.h:2180:
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


vim +/smmu_domain_finalise +570 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  569  
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10 @570  int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  571  {
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  572  	int ret;
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  573  	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  574  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(smmu_domain->iommu);
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  575  
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  576  	domain->pgtable = kvm_arm_io_pgtable_alloc(&smmu->pgtable_cfg,
bf32ef94111174 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-04  577  						   domain, &ret);
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  578  
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  579  	return ret;
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  580  }
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  581  
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  582  static int smmu_attach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  583  			   u32 sid)
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  584  {
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  585  	int i;
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  586  	int ret = -EINVAL;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  587  	u64 *dst;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  588  	struct io_pgtable_cfg *cfg;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  589  	u64 ts, sl, ic, oc, sh, tg, ps;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  590  	u64 ent[STRTAB_STE_DWORDS] = {};
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  591  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  592  	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  593  
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  594  	hyp_spin_lock(&iommu->lock);
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  595  	dst = smmu_get_ste_ptr(smmu, sid);
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  596  	if (!dst || dst[0])
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  597  		goto out_unlock;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  598  
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  599  	/*
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  600  	 * First attach to the domain, this is over protected by the all domain locks,
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  601  	 * as there is no per-domain lock now, this can be improved later.
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  602  	 * However, as this operation is not on the hot path, it should be fine.
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  603  	 */
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  604  	if (!domain->pgtable) {
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  605  		smmu_domain->iommu = iommu;
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  606  		ret = smmu_domain_finalise(domain);
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  607  		if (ret)
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  608  			goto out_unlock;
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  609  	}
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  610  
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  611  	if (smmu_domain->iommu != iommu) {
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  612  		ret = -EBUSY;
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  613  		goto out_unlock;
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  614  	}
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  615  
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  616  	cfg = &domain->pgtable->cfg;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  617  	ps = cfg->arm_lpae_s2_cfg.vtcr.ps;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  618  	tg = cfg->arm_lpae_s2_cfg.vtcr.tg;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  619  	sh = cfg->arm_lpae_s2_cfg.vtcr.sh;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  620  	oc = cfg->arm_lpae_s2_cfg.vtcr.orgn;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  621  	ic = cfg->arm_lpae_s2_cfg.vtcr.irgn;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  622  	sl = cfg->arm_lpae_s2_cfg.vtcr.sl;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  623  	ts = cfg->arm_lpae_s2_cfg.vtcr.tsz;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  624  
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  625  	ent[0] = STRTAB_STE_0_V |
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  626  		 FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  627  	ent[1] = FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING);
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  628  	ent[2] = FIELD_PREP(STRTAB_STE_2_VTCR,
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  629  			FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, ps) |
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  630  			FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, tg) |
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  631  			FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, sh) |
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  632  			FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, oc) |
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  633  			FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, ic) |
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  634  			FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, sl) |
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  635  			FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, ts)) |
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  636  		 FIELD_PREP(STRTAB_STE_2_S2VMID, domain->domain_id) |
d762f92ae92ce3 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  637  		 STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2R;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  638  	ent[3] = cfg->arm_lpae_s2_cfg.vttbr & STRTAB_STE_3_S2TTB_MASK;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  639  
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  640  	/*
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  641  	 * The SMMU may cache a disabled STE.
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  642  	 * Initialize all fields, sync, then enable it.
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  643  	 */
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  644  	for (i = 1; i < STRTAB_STE_DWORDS; i++)
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  645  		dst[i] = cpu_to_le64(ent[i]);
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  646  
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  647  	ret = smmu_sync_ste(smmu, sid);
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  648  	if (ret)
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  649  		goto out_unlock;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  650  
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  651  	WRITE_ONCE(dst[0], cpu_to_le64(ent[0]));
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  652  	ret = smmu_sync_ste(smmu, sid);
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  653  	WARN_ON(ret);
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  654  
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  655  out_unlock:
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  656  	hyp_spin_unlock(&iommu->lock);
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  657  	return ret;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  658  }
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  659  
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  660  static int smmu_detach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  661  			   u32 sid)
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  662  {
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  663  	u64 *dst;
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  664  	int i, ret = -ENODEV;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  665  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  666  
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  667  	hyp_spin_lock(&iommu->lock);
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  668  	dst = smmu_get_ste_ptr(smmu, sid);
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  669  	if (!dst)
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  670  		goto out_unlock;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  671  
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  672  	dst[0] = 0;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  673  	ret = smmu_sync_ste(smmu, sid);
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  674  	if (ret)
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  675  		goto out_unlock;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  676  
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  677  	for (i = 1; i < STRTAB_STE_DWORDS; i++)
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  678  		dst[i] = 0;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  679  
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  680  	ret = smmu_sync_ste(smmu, sid);
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  681  out_unlock:
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  682  	hyp_spin_unlock(&iommu->lock);
e73b69a9d49fb8 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  683  	return ret;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  684  }
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  685  
bf32ef94111174 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-04 @686  int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain)
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  687  {
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  688  	struct hyp_arm_smmu_v3_domain *smmu_domain;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  689  
6dc5120525c9ed arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-11-02  690  	smmu_domain = smmu_alloc(sizeof(struct hyp_arm_smmu_v3_domain));
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  691  	if (!smmu_domain)
6dc5120525c9ed arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-11-02  692  		return -ENOMEM;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  693  
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  694  	/* Can't do much without the IOMMU. */
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  695  	smmu_domain->domain = domain;
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  696  	domain->priv = (void *)smmu_domain;
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  697  
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  698  	return 0;
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  699  }
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  700  
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26 @701  void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  702  {
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  703  	/*
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  704  	 * As page table allocation is decoupled from alloc_domain, free_domain can
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  705  	 * be called with a domain that have never been attached.
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  706  	 */
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  707  	if (domain->pgtable)
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  708  		kvm_arm_io_pgtable_free(domain->pgtable);
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  709  
28f2b00624d802 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  710  	hyp_free(domain->priv);
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  711  }
77efc595cc5d8a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  712  
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08 @713  bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  714  		      struct kvm_cpu_context *host_ctxt, u64 esr, u32 off)
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  715  {
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  716  	bool is_write = esr & ESR_ELx_WNR;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  717  	unsigned int len = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  718  	int rd = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  719  	const u32 no_access  = 0;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  720  	const u32 read_write = (u32)(-1);
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  721  	const u32 read_only = is_write ? no_access : read_write;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  722  	u32 mask = no_access;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  723  
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  724  	/*
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  725  	 * Only handle MMIO access with u32 size and alignment.
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  726  	 * We don't need to change 64-bit registers for now.
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  727  	 */
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  728  	if ((len != sizeof(u32)) || (off & (sizeof(u32) - 1)))
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  729  		return false;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  730  
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  731  	switch (off) {
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  732  	case ARM_SMMU_EVTQ_PROD + SZ_64K:
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  733  		mask = read_write;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  734  		break;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  735  	case ARM_SMMU_EVTQ_CONS + SZ_64K:
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  736  		mask = read_write;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  737  		break;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  738  	case ARM_SMMU_GERROR:
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  739  		mask = read_only;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  740  		break;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  741  	case ARM_SMMU_GERRORN:
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  742  		mask = read_write;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  743  		break;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  744  	};
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  745  
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  746  	if (!mask)
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  747  		return false;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  748  	if (is_write)
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  749  		writel_relaxed(cpu_reg(host_ctxt, rd) & mask, smmu->base + off);
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  750  	else
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  751  		cpu_reg(host_ctxt, rd) = readl_relaxed(smmu->base + off);
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  752  
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  753  	return true;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  754  }
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  755  
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08 @756  bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  757  {
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  758  	struct hyp_arm_smmu_v3_device *smmu;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  759  
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  760  	for_each_smmu(smmu) {
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  761  		if (addr < smmu->mmio_addr || addr >= smmu->mmio_addr + smmu->mmio_size)
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  762  			continue;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  763  		return smmu_dabt_device(smmu, host_ctxt, esr, addr - smmu->mmio_addr);
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  764  	}
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  765  	return false;
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  766  }
53fd27c427aae5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  767  
8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17 @768  int smmu_suspend(struct kvm_hyp_iommu *iommu)
8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  769  {
8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  770  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  771  
8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  772  	/*
8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  773  	 * Disable translation, GBPA is validated at probe to be set, so all transaltion
8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  774  	 * would be aborted when SMMU is disabled.
8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  775  	 */
8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  776  	if (iommu->power_domain.type == KVM_POWER_DOMAIN_HOST_HVC)
8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  777  		return smmu_write_cr0(smmu, 0);
8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  778  	return 0;
8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  779  }
8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  780  

:::::: The code at line 570 was first introduced by commit
:::::: 28f2b00624d802bc9cd31a5ae9a9da1760039a2b ANDROID: KVM: arm64: iommu: Remove iommu from alloc_domain

:::::: TO: Mostafa Saleh <smostafa@google.com>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
