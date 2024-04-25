Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F39A84E19
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714038717; cv=none; b=oEszCvLmp6ompO+EtF23HJZx4uYctsCbLG1UlH9+KaUQccRW16XY9hq6CvmS0qow/DwTPR5C4DLeTaClfvP5UtURiHPrSbeEiiDoRfLLftod/dX18bNbal1FReoglmHX7XfDN41E/cUxpToHWXRzyI24VDK9aDKztuxyRq/39Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714038717; c=relaxed/simple;
	bh=fD9g4PY4GycsjxVtht7DTMPogo6gMNysEXw1yRFGeZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tr8U+ORnUynMjLThOgZWEmMgZmI7Bh0M6YLfi3TfE4VKE3ZKh5rIumPqPZy4Y2hyQSvUwSfDNSd1hE/OOwPIEi0hioid2pj7837hIpGls+tQed71zk6R62sfmXj/Xm52LeOEndqfz71fM0DNcVoFhEFROjZ67zj4YdoXCN7dv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELuRGk8D; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELuRGk8D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714038715; x=1745574715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fD9g4PY4GycsjxVtht7DTMPogo6gMNysEXw1yRFGeZM=;
  b=ELuRGk8D35v2sGuWsvj2+hoyyC/z2F5op0bQ8QkVvlbgZNXhAE8IfPl6
   2M7pqxVFfGPiwW9Yi0LlrG9qLKnhxtQrxGEvmnicrXRtCuElanivYMVuS
   lFEUaaFtRQ5wvUyWmD9GzqM+j+akoKV2+hPOw5jyb/45DpY9bi4A6SlNa
   h8qibKjEFJW0pW6kEBodmUsxvr4lHI5mzMEkUrC6qF/ktmmcIF0pKHeaQ
   fBVnoGeV2ck1pVeVaAZAefx1Aa2jJBFM8YIeI0/BJUF7EyR1GJ3ByLCja
   g/c11rObwT0I7WLSjdbYDoLFJPkSzbpUrgz9cUXfa9aNa73n6r6cUDNlU
   w==;
X-CSE-ConnectionGUID: d1SCcToDRKqMSKCte0iTMA==
X-CSE-MsgGUID: 9wia26roTderLtOJgwwkLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9931238"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9931238"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:51:55 -0700
X-CSE-ConnectionGUID: 6U/ieHL4Qjy1IthHiMAnFQ==
X-CSE-MsgGUID: 1QF0cAuET/WwWUg9lnJmLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="24961823"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Apr 2024 02:51:53 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzvle-0002EO-20;
	Thu, 25 Apr 2024 09:51:50 +0000
Date: Thu, 25 Apr 2024 17:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 17/30]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:690:5:
 warning: no previous prototype for function 'smmu_domain_config_s1'
Message-ID: <202404251757.dH4iTW6a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   fc203c3d8fb45cd037f8eee1f318d8ae07920897
commit: 38124746c6a5f045d4608b787d00a7853826eca3 [17/30] ANDROID: KVM: arm: smmu-v3: Add stage-1 attach
config: arm64-randconfig-r064-20240425 (https://download.01.org/0day-ci/archive/20240425/202404251757.dH4iTW6a-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404251757.dH4iTW6a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251757.dH4iTW6a-lkp@intel.com/

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
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:658:5: warning: no previous prototype for function 'smmu_domain_config_s2' [-Wmissing-prototypes]
     658 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:658:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     658 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:690:5: warning: no previous prototype for function 'smmu_domain_config_s1' [-Wmissing-prototypes]
     690 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:690:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     690 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:764:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
     764 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:764:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     764 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:876:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
     876 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:876:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     876 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:893:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
     893 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:893:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     893 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:905:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
     905 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:905:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     905 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:948:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
     948 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:948:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     948 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:960:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
     960 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:960:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     960 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:973:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
     973 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:973:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     973 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   10 warnings and 1 error generated.

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


vim +/smmu_domain_config_s1 +690 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

   689	
 > 690	int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
   691				  struct kvm_hyp_iommu_domain *domain,
   692				  u32 sid, u32 pasid, u32 pasid_bits,
   693				  u64 *ent, bool *update_ste)
   694	{
   695		u64 *cd_table;
   696		u64 *ste;
   697		u32 nr_entries;
   698		u64 val;
   699		u64 *cd_entry;
   700		struct io_pgtable_cfg *cfg;
   701	
   702		cfg = &domain->pgtable->cfg;
   703		ste = smmu_get_ste_ptr(smmu, sid);
   704		val = le64_to_cpu(ste[0]);
   705	
   706		/* The host trying to attach stage-1 domain to an already stage-2 attached device. */
   707		if (FIELD_GET(STRTAB_STE_0_CFG, val) == STRTAB_STE_0_CFG_S2_TRANS)
   708			return -EBUSY;
   709	
   710		cd_table = (u64 *)(FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, val) << 6);
   711		nr_entries = 1 << FIELD_GET(STRTAB_STE_0_S1CDMAX, val);
   712		*update_ste = false;
   713		/* This is the first pasid attached to this device. */
   714		if (!cd_table) {
   715			cd_table = smmu_alloc_cd(pasid_bits);
   716			if (!cd_table)
   717				return -ENOMEM;
   718			nr_entries = 1 << pasid_bits;
   719			ent[1] = FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
   720				 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
   721				 FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
   722				 FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH);
   723			ent[0] = ((u64)cd_table & STRTAB_STE_0_S1CTXPTR_MASK) |
   724				 FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
   725				 FIELD_PREP(STRTAB_STE_0_S1CDMAX, pasid_bits) |
   726				 FIELD_PREP(STRTAB_STE_0_S1FMT, STRTAB_STE_0_S1FMT_LINEAR) |
   727				 STRTAB_STE_0_V;
   728			*update_ste = true;
   729		}
   730	
   731		if (pasid >= nr_entries)
   732			return -E2BIG;
   733		/* Write CD. */
   734		cd_entry = smmu_get_cd_ptr(hyp_phys_to_virt((u64)cd_table), pasid);
   735	
   736		/* CD already used by another device. */
   737		if (cd_entry[0])
   738			return -EBUSY;
   739	
   740		cd_entry[1] = cpu_to_le64(cfg->arm_lpae_s1_cfg.ttbr & CTXDESC_CD_1_TTB0_MASK);
   741		cd_entry[2] = 0;
   742		cd_entry[3] = cpu_to_le64(cfg->arm_lpae_s1_cfg.mair);
   743		/* STE is live. */
   744		if (!(*update_ste))
   745			smmu_sync_cd(smmu, sid, pasid);
   746		val =  FIELD_PREP(CTXDESC_CD_0_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz) |
   747		       FIELD_PREP(CTXDESC_CD_0_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
   748		       FIELD_PREP(CTXDESC_CD_0_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
   749		       FIELD_PREP(CTXDESC_CD_0_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
   750		       FIELD_PREP(CTXDESC_CD_0_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
   751		       FIELD_PREP(CTXDESC_CD_0_TCR_IPS, cfg->arm_lpae_s1_cfg.tcr.ips) |
   752		       CTXDESC_CD_0_TCR_EPD1 | CTXDESC_CD_0_AA64 |
   753		       CTXDESC_CD_0_R | CTXDESC_CD_0_A |
   754		       CTXDESC_CD_0_ASET |
   755		       FIELD_PREP(CTXDESC_CD_0_ASID, domain->domain_id) |
   756		       CTXDESC_CD_0_V;
   757		WRITE_ONCE(cd_entry[0], cpu_to_le64(val));
   758		/* STE is live. */
   759		if (!(*update_ste))
   760			smmu_sync_cd(smmu, sid, pasid);
   761		return 0;
   762	}
   763	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
