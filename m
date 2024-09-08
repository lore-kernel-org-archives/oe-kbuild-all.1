Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AF4339A8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 19:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725822636; cv=none; b=tQ9yP5cOWL82C4OoMVOpH5XMwNZ8lDh2LDbgoF5OlLj3zyT0HiNnrWDXlqcoOAp7kymx8Ngt8g3QXBr+OtUJ2Qb9u1Uczm8vIWbGttuuAtn7FcHfw9pVat4fPhvG5AGDJyqc9EGncX1sJxTg0/wWeVtuP0rz7JEGFV1I65qKa14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725822636; c=relaxed/simple;
	bh=NVoSJsL2AX5pOH4YHNJeOuId+TlRma4+/fcx++ycWhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UiK+A3sBtuyZwilXVaD+QzhlFVBm9HyUC8noW2im+LpXMU+M+VEwVtJ9OTtNuwWuPga7q2eS3aa1AeefRhosWShjVsf00eeqcs/Hnpkwv8RD4A+tSVQFdRZt53hEIzdIVboewli4j3TBFJmBaUdIUVXXY8TQLyAIa6TK7VBR6jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwBYfkAh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwBYfkAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725822634; x=1757358634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NVoSJsL2AX5pOH4YHNJeOuId+TlRma4+/fcx++ycWhM=;
  b=jwBYfkAhf3lDVrgqa7duxNniN3xC3usfDitx5mIePQUSb/DS/SBW8fsY
   qdSGnPhW6r4zVXC2L6x0uT1gRC+zBPp2vEKIm++xEy7mYKZs6WjM3Zag8
   G/t/b8tmpyJUWj0CsQT6pbDR9/vXWyn3NdjEZuGVf7qIr3koAcfh/l4HH
   U8Dr4+OBRR3lN1w3iCQPOuKQYXUBnB8IFVyz1k7Rd4H4oBKLhQFM+tAqI
   2K/3L1VSr3m10Z3Gf+iQcG1/Apkd0qKjnwj4gf0iwreFoW4QtEqja8/7S
   wJnig4rfwQr6SdL2vsmDSIoX/yGsVnapVjRyl1R4zHo2Npg9oEUWC09ma
   w==;
X-CSE-ConnectionGUID: LlUJzzTvSzSn7tdg7JB6Lg==
X-CSE-MsgGUID: xc+rtTHDQ7Gm//Bjydph4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24703072"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="24703072"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 12:10:33 -0700
X-CSE-ConnectionGUID: Bks5y80HQAKWEDcLNs1sKw==
X-CSE-MsgGUID: I+9OU+QiRdC4q0k/XRbEsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66450887"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2024 12:10:32 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snNIs-000Drv-0O;
	Sun, 08 Sep 2024 19:10:30 +0000
Date: Mon, 9 Sep 2024 03:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 10086/17452]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:691:5:
 warning: no previous prototype for function 'smmu_domain_config_s1'
Message-ID: <202409090344.JKkkbJrc-lkp@intel.com>
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
commit: 026ea239f05bdca1d76b79f72336d570c3bae5fd [10086/17452] ANDROID: KVM: arm: smmu-v3: Add stage-1 attach
config: arm64-randconfig-r062-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090344.JKkkbJrc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090344.JKkkbJrc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090344.JKkkbJrc-lkp@intel.com/

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
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:659:5: warning: no previous prototype for function 'smmu_domain_config_s2' [-Wmissing-prototypes]
     659 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:659:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     659 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:691:5: warning: no previous prototype for function 'smmu_domain_config_s1' [-Wmissing-prototypes]
     691 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:691:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     691 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:765:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
     765 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:765:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     765 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:877:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
     877 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:877:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     877 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:894:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
     894 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:894:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     894 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:906:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
     906 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:906:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     906 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:949:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
     949 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:949:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     949 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:961:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
     961 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:961:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     961 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:974:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
     974 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:974:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     974 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   10 warnings and 1 error generated.

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
