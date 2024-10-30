Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B81AAD7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 00:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730247463; cv=none; b=RujhQDXTL8K5Zt/OjZDWIwnvx9EmiISp1pMdtUQmtEW0Yg1YwsxLG7vPxtIuNXMG3XcWN5cwJ5Ad5H1PgGssFLxu3aILOEnLJCHlelOPqOx0xOaqzwpChFnem/QLV96+IoLAbPyrOmBwPshwZJwhrL4eXy1m36W6QBSRh4BLvVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730247463; c=relaxed/simple;
	bh=0tXAYQtxl+WkcS1tw9bnrXqAzTeJe32XTyZZL7M1hLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QuJ72Hhe7wIEmzfGczWGtdRWn0VdNYooWIOULTs/Gc6C4804tY3sRFHZiZKrr63H/p90Ieq8zbqtEn+m21sYb9cIe/RIzKRzyPiDldYK1vl+AeyGhwSn3jTYUZLRICcJ2zC5TuIfSygXbea+ADwZjGejW9rE38pYM+vkK5KRTQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0/+7Rwd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0/+7Rwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730247460; x=1761783460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0tXAYQtxl+WkcS1tw9bnrXqAzTeJe32XTyZZL7M1hLw=;
  b=i0/+7RwdiOpVv8TMCawXqP7WVMZ+gFQzuhiFzXGXXKhSq08kfqaM5Jff
   4OlXFz8x+FJROh770PJL5VQsdeH8dHFz+tB+2tuvvzGBeeKoO0vZichjq
   qrGvnEarXMsSURqSEZH4iMXfH2r25J3xvl44IW6rMxwQt7+2mbOlXjert
   qMr0wsBCbHfqz6/R12UaJ974c0leJxnHJ0sFKWM7CClC5nImiUgbmDZWc
   Y05BAMFo37R3B7EHKxaKQ62GXLwpAcYc8TI6fkHWgEWu4hQDJRl/Yb8/p
   yTA8OLjCLqS5PBGFWZ29xjYTnq3XTWcTEhjtF1zi+h27RoSwrKdCZ1kAt
   w==;
X-CSE-ConnectionGUID: Z8e0tiMjQ8OfVs7EigdfKQ==
X-CSE-MsgGUID: yeiRTwuvS+GJUlYXj5EHMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33723310"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="33723310"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 17:17:38 -0700
X-CSE-ConnectionGUID: gS3tEPZkRViuHANhG7sraA==
X-CSE-MsgGUID: LDZGiXBaTvOTvtwIC+cbsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82237366"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Oct 2024 17:17:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5wP0-000eIu-2p;
	Wed, 30 Oct 2024 00:17:34 +0000
Date: Wed, 30 Oct 2024 08:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 42/68]
 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:987:5: warning: no previous
 prototype for function 'smmu_fix_up_domains'
Message-ID: <202410300807.26WsebWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   0db30a10b0076364f5db3533414a8aea94f662d6
commit: 05677971216f9e9ae52e61fafcf38ff9b4e196bd [42/68] ANDROID: drivers/arm-smmu-v3-kvm: Support KVM_IOMMU_DOMAIN_ANY_TYPE
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241030/202410300807.26WsebWV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300807.26WsebWV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300807.26WsebWV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:7:
   In file included from drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h:5:
   In file included from arch/arm64/include/asm/kvm_asm.h:52:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:770:5: warning: no previous prototype for function 'smmu_domain_config_s2' [-Wmissing-prototypes]
     770 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:770:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     770 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:803:5: warning: no previous prototype for function 'smmu_domain_config_s1' [-Wmissing-prototypes]
     803 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:803:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     803 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:878:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
     878 | int smmu_domain_finalise(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:878:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     878 | int smmu_domain_finalise(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:987:5: warning: no previous prototype for function 'smmu_fix_up_domains' [-Wmissing-prototypes]
     987 | int smmu_fix_up_domains(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:987:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     987 | int smmu_fix_up_domains(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1178:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
    1178 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1178:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1178 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1197:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
    1197 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1197:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1197 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1210:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
    1210 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1210:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1210 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1258:5: warning: no previous prototype for function 'smmu_block_dev' [-Wmissing-prototypes]
    1258 | int smmu_block_dev(struct kvm_hyp_iommu *iommu, u32 sid, bool is_host2guest)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1258 | int smmu_block_dev(struct kvm_hyp_iommu *iommu, u32 sid, bool is_host2guest)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1292:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
    1292 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1292:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1292 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1304:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
    1304 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1304:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1304 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1317:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
    1317 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1317:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1317 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1329:5: warning: no previous prototype for function 'smmu_map_pages' [-Wmissing-prototypes]
    1329 | int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1329:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1329 | int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1486:5: warning: no previous prototype for function 'smmu_init_hyp_module' [-Wmissing-prototypes]
    1486 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1486:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1486 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         | ^
         | static 
   18 warnings generated.


vim +/smmu_fix_up_domains +987 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

   986	
 > 987	int smmu_fix_up_domains(struct hyp_arm_smmu_v3_device *smmu,
   988				struct hyp_arm_smmu_v3_domain *smmu_domain)
   989	{
   990		/*
   991		 * Try to map domain type to a translation stage.
   992		 * In theory we can have identity mapped domain (bypass)
   993		 * with stage-1, however that have some problem with ias
   994		 * as we idmap the whole memory, while linux limit it
   995		 * to the VA space.
   996		 */
   997		if (smmu_domain->type == KVM_ARM_SMMU_DOMAIN_BYPASS) {
   998			if (smmu->features & ARM_SMMU_FEAT_TRANS_S2)
   999				smmu_domain->type = KVM_ARM_SMMU_DOMAIN_S2;
  1000			else
  1001				return -EINVAL;
  1002		} else if (smmu_domain->type == KVM_ARM_SMMU_DOMAIN_ANY) {
  1003			/* Any domain defaults to S1 as we don't know if guest needs pasid. */
  1004			if (smmu->features & ARM_SMMU_FEAT_TRANS_S1) {
  1005				smmu_domain->type = KVM_ARM_SMMU_DOMAIN_S1;
  1006			} else {
  1007				smmu_domain->type = KVM_ARM_SMMU_DOMAIN_S2;
  1008			}
  1009		}
  1010	
  1011		return 0;
  1012	}
  1013	static int smmu_attach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
  1014				   u32 sid, u32 pasid, u32 pasid_bits)
  1015	{
  1016		int i;
  1017		int ret = -EINVAL;
  1018		u64 *dst;
  1019		u64 ent[STRTAB_STE_DWORDS] = {};
  1020		struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
  1021		struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
  1022		bool update_ste = true; /* Some S1 attaches might not update STE. */
  1023		struct domain_iommu_node *iommu_node = NULL;
  1024	
  1025		hyp_write_lock(&smmu_domain->lock);
  1026		kvm_iommu_lock(iommu);
  1027		dst = smmu_get_ste_ptr(smmu, sid);
  1028		if (!dst)
  1029			goto out_unlock;
  1030	
  1031		/* Map domain type to an SMMUv3 stage. */
  1032		ret = smmu_fix_up_domains(smmu, smmu_domain);
  1033		if (ret)
  1034			goto out_unlock;
  1035	
  1036		if (!smmu_existing_in_domain(smmu, smmu_domain)) {
  1037			if (!smmu_domain_compat(smmu, smmu_domain)) {
  1038				ret = -EBUSY;
  1039				goto out_unlock;
  1040			}
  1041			iommu_node = smmu_alloc(sizeof(struct domain_iommu_node));
  1042			if (!iommu_node) {
  1043				ret = -ENOMEM;
  1044				goto out_unlock;
  1045			}
  1046			iommu_node->iommu = iommu;
  1047			iommu_node->ref = 1;
  1048		} else {
  1049			smmu_get_ref_domain(smmu, smmu_domain);
  1050		}
  1051	
  1052		/*
  1053		 * First attach to the domain, this is over protected by the all domain locks,
  1054		 * as there is no per-domain lock now, this can be improved later.
  1055		 * However, as this operation is not on the hot path, it should be fine.
  1056		 */
  1057		if (!smmu_domain->pgtable) {
  1058			ret = smmu_domain_finalise(smmu, domain);
  1059			if (ret)
  1060				goto out_unlock;
  1061		}
  1062	
  1063		if (smmu_domain->type == KVM_ARM_SMMU_DOMAIN_S2) {
  1064			/* Device already attached or pasid for s2. */
  1065			if ((dst[0] & ~STRTAB_STE_0_S1CTXPTR_MASK) || pasid) {
  1066				ret = -EBUSY;
  1067				goto out_unlock;
  1068			}
  1069			ret = smmu_domain_config_s2(domain, ent);
  1070	
  1071			/* Don't lost the CD as we never free it. */
  1072			ent[0] |= dst[0];
  1073		} else {
  1074			/*
  1075			 * One drawback to this is that the first attach to this sid dictates
  1076			 * how many pasid bits needed as we don't relocated CDs.
  1077			 */
  1078			pasid_bits = min(pasid_bits, smmu->ssid_bits);
  1079			ret = smmu_domain_config_s1(smmu, domain, sid, pasid, pasid_bits,
  1080						    ent, &update_ste);
  1081		}
  1082		if (ret)
  1083			goto out_unlock;
  1084	
  1085		if (!update_ste)
  1086			goto out_unlock;
  1087		/*
  1088		 * The SMMU may cache a disabled STE.
  1089		 * Initialize all fields, sync, then enable it.
  1090		 */
  1091		for (i = 1; i < STRTAB_STE_DWORDS; i++)
  1092			dst[i] = cpu_to_le64(ent[i]);
  1093	
  1094		ret = smmu_sync_ste(smmu, dst, sid);
  1095		if (ret)
  1096			goto out_unlock;
  1097	
  1098		WRITE_ONCE(dst[0], cpu_to_le64(ent[0]));
  1099		ret = smmu_sync_ste(smmu, dst, sid);
  1100		WARN_ON(ret);
  1101		if (iommu_node)
  1102			list_add_tail(&iommu_node->list, &smmu_domain->iommu_list);
  1103	out_unlock:
  1104		if (ret && iommu_node)
  1105			hyp_free(iommu_node);
  1106		kvm_iommu_unlock(iommu);
  1107		hyp_write_unlock(&smmu_domain->lock);
  1108		return ret;
  1109	}
  1110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
