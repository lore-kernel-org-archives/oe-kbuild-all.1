Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5864431
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 01:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721611165; cv=none; b=CEMCL4bChV+NlOFAWIN8CMAQsNVDaTRfHZy7wSPCi4Noa2ENsvYFlHBegIVBMKqanGNEZCfGZeAWT6DFrmT6xjKD7s6ArIfpUpg72S2n60pfSem1MZftYUn+gZwdLS1wftZLPbABAeHarrpYGvmYqNCyh9qXniz2CnN2FsqfTMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721611165; c=relaxed/simple;
	bh=ABqk2w8cgnhY+lr+BG5a5szRvEE1uPviBnJ/vrKswq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JRGdXaANDkwmVnKvUJXmn2owkTmMzM3c35I0rw+YIvmCvnMB2XZ0IU2zFvdpfV9YZ89onLMWkpQj3VvjeIE7NYo8+lnzI0eNyzwD5NgsMHly1p+Bf1I6013N2TVao88jPeiS428pkeeyNIcHCXXvNj7C88+CcjLLZ1+lSlm8oes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RViXMxt2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RViXMxt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721611163; x=1753147163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ABqk2w8cgnhY+lr+BG5a5szRvEE1uPviBnJ/vrKswq4=;
  b=RViXMxt29LGjSAhuUmp2Ca+GWFri4HFg6gYNs0mq8IbeqN0UQizdNUCt
   pDRmYVvnO8PKIkTTDQaXu6eOw42QDvzcxoJm8HkrNrmGnw2AqMKqQXn/Z
   0VWKhQAPln1Z86a1Z6jiaa4IuMOUMqU4VEHw/L0H8bxQtAD0uPd2ZEfF1
   h3jYOViL784Q4flxeI0ZNG6ieALpZJd2b4dEAU2GFVKvLBdttbWAMqlVC
   uJ0obmwpOJapU3a+bN+7gVq+6aJ9Cb+xOKmfmmF1oFMuoBITpAb3iNDGC
   8lHlVmyYgEi1W+X1+6VHDKU2GC3bn8kU47rtqfUyNO1s19LhWkNWzpGw/
   A==;
X-CSE-ConnectionGUID: 6+plD3C+RgWH1hicO1wf1Q==
X-CSE-MsgGUID: QUWsReckRkae/ICQnpz/yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="41682735"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="41682735"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 18:19:22 -0700
X-CSE-ConnectionGUID: ki8lcZ/qTSuICdRvzccVuQ==
X-CSE-MsgGUID: MTkdB6MPROqYFz7IJR9f7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="74935914"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jul 2024 18:19:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVhhu-000kmG-1R;
	Mon, 22 Jul 2024 01:19:18 +0000
Date: Mon, 22 Jul 2024 09:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 43/60]
 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1260:5: sparse: sparse:
 symbol 'smmu_map_pages' was not declared. Should it be static?
Message-ID: <202407220941.1SHdmo8J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   7b5e8812b147cc88f178851a17b21d05e67ab15d
commit: a737b7d0e7214b258b75010404de3de09d2d5c0d [43/60] ANDROID: KVM: arm64: iommu: Reduce the logic in generic code
config: arm64-randconfig-r113-20240716 (https://download.01.org/0day-ci/archive/20240722/202407220941.1SHdmo8J-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240722/202407220941.1SHdmo8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407220941.1SHdmo8J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:213:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:213:25: sparse:     expected unsigned long long [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:213:25: sparse:     got restricted __le64 [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:717:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *base @@     got void * @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:717:20: sparse:     expected void [noderef] __iomem *base
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:717:20: sparse:     got void *
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:768:5: sparse: sparse: symbol 'smmu_domain_config_s2' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:814:15: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:850:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:850:21: sparse:     expected unsigned long long [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:850:21: sparse:     got restricted __le64 [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:852:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:852:21: sparse:     expected unsigned long long [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:852:21: sparse:     got restricted __le64 [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:867:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long volatile @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:867:9: sparse:     expected unsigned long long volatile
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:867:9: sparse:     got restricted __le64 [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:800:5: sparse: sparse: symbol 'smmu_domain_config_s1' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:874:5: sparse: sparse: symbol 'smmu_domain_finalise' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1072:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1072:24: sparse:     expected unsigned long long [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1072:24: sparse:     got restricted __le64 [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1078:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long volatile @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1078:9: sparse:     expected unsigned long long volatile
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1078:9: sparse:     got restricted __le64 [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1149:5: sparse: sparse: symbol 'smmu_alloc_domain' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1168:6: sparse: sparse: symbol 'smmu_free_domain' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1180:6: sparse: sparse: symbol 'smmu_dabt_device' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1223:6: sparse: sparse: symbol 'smmu_dabt_handler' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1235:5: sparse: sparse: symbol 'smmu_suspend' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1248:5: sparse: sparse: symbol 'smmu_resume' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1260:5: sparse: sparse: symbol 'smmu_map_pages' was not declared. Should it be static?

vim +/smmu_map_pages +1260 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

   982	
   983	static int smmu_attach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
   984				   u32 sid, u32 pasid, u32 pasid_bits)
   985	{
   986		int i;
   987		int ret = -EINVAL;
   988		u64 *dst;
   989		u64 ent[STRTAB_STE_DWORDS] = {};
   990		struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
   991		struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
   992		bool update_ste = true; /* Some S1 attaches might not update STE. */
   993		struct domain_iommu_node *iommu_node = NULL;
   994	
   995		hyp_write_lock(&smmu_domain->lock);
   996		hyp_spin_lock(&iommu->lock);
   997		dst = smmu_get_ste_ptr(smmu, sid);
   998		if (!dst)
   999			goto out_unlock;
  1000	
  1001	
  1002		/*
  1003		 * BYPASS domains only supported on stage-2 instances, that is over restrictive
  1004		 * but for now as stage-1 is limited to VA_BITS to match the kernel, it might
  1005		 * not cover the ia bits, we don't support it.
  1006		 */
  1007		if (smmu_domain->type == KVM_ARM_SMMU_DOMAIN_BYPASS) {
  1008			if (smmu->features & ARM_SMMU_FEAT_TRANS_S2) {
  1009				smmu_domain->type = KVM_ARM_SMMU_DOMAIN_S2;
  1010			} else {
  1011				ret = -EINVAL;
  1012				goto out_unlock;
  1013			}
  1014		}
  1015	
  1016		if (!smmu_existing_in_domain(smmu, smmu_domain)) {
  1017			if (!smmu_domain_compat(smmu, smmu_domain)) {
  1018				ret = -EBUSY;
  1019				goto out_unlock;
  1020			}
  1021			iommu_node = smmu_alloc(sizeof(struct domain_iommu_node));
  1022			if (!iommu_node) {
  1023				ret = -ENOMEM;
  1024				goto out_unlock;
  1025			}
  1026			iommu_node->iommu = iommu;
  1027			iommu_node->ref = 1;
  1028		} else {
  1029			smmu_get_ref_domain(smmu, smmu_domain);
  1030		}
  1031	
  1032		/*
  1033		 * First attach to the domain, this is over protected by the all domain locks,
  1034		 * as there is no per-domain lock now, this can be improved later.
  1035		 * However, as this operation is not on the hot path, it should be fine.
  1036		 */
  1037		if (!domain->pgtable) {
  1038			ret = smmu_domain_finalise(smmu, domain);
  1039			if (ret)
  1040				goto out_unlock;
  1041		}
  1042	
  1043		if (smmu_domain->type == KVM_ARM_SMMU_DOMAIN_S2) {
  1044			/* Device already attached or pasid for s2. */
  1045			if ((dst[0] & ~STRTAB_STE_0_S1CTXPTR_MASK) || pasid) {
  1046				ret = -EBUSY;
  1047				goto out_unlock;
  1048			}
  1049			ret = smmu_domain_config_s2(domain, ent);
  1050	
  1051			/* Don't lost the CD as we never free it. */
  1052			ent[0] |= dst[0];
  1053		} else {
  1054			/*
  1055			 * One drawback to this is that the first attach to this sid dictates
  1056			 * how many pasid bits needed as we don't relocated CDs.
  1057			 */
  1058			pasid_bits = min(pasid_bits, smmu->ssid_bits);
  1059			ret = smmu_domain_config_s1(smmu, domain, sid, pasid, pasid_bits,
  1060						    ent, &update_ste);
  1061		}
  1062		if (ret)
  1063			goto out_unlock;
  1064	
  1065		if (!update_ste)
  1066			goto out_unlock;
  1067		/*
  1068		 * The SMMU may cache a disabled STE.
  1069		 * Initialize all fields, sync, then enable it.
  1070		 */
  1071		for (i = 1; i < STRTAB_STE_DWORDS; i++)
  1072			dst[i] = cpu_to_le64(ent[i]);
  1073	
  1074		ret = smmu_sync_ste(smmu, dst, sid);
  1075		if (ret)
  1076			goto out_unlock;
  1077	
> 1078		WRITE_ONCE(dst[0], cpu_to_le64(ent[0]));
  1079		ret = smmu_sync_ste(smmu, dst, sid);
  1080		WARN_ON(ret);
  1081		if (iommu_node)
  1082			list_add_tail(&iommu_node->list, &smmu_domain->iommu_list);
  1083	out_unlock:
  1084		if (ret && iommu_node)
  1085			hyp_free(iommu_node);
  1086		hyp_spin_unlock(&iommu->lock);
  1087		hyp_write_unlock(&smmu_domain->lock);
  1088		return ret;
  1089	}
  1090	
  1091	static int smmu_detach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
  1092				   u32 sid, u32 pasid)
  1093	{
  1094		u64 *dst;
  1095		int i, ret = -ENODEV;
  1096		struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
  1097		struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
  1098		u32 nr_ssid;
  1099		u64 *cd_table, *cd;
  1100	
  1101		hyp_write_lock(&smmu_domain->lock);
  1102		hyp_spin_lock(&iommu->lock);
  1103		dst = smmu_get_ste_ptr(smmu, sid);
  1104		if (!dst)
  1105			goto out_unlock;
  1106	
  1107		if (smmu_domain->type == KVM_ARM_SMMU_DOMAIN_S1) {
  1108			nr_ssid = 1 << FIELD_GET(STRTAB_STE_0_S1CDMAX, dst[0]);
  1109			if (pasid >= nr_ssid) {
  1110				ret = -E2BIG;
  1111				goto out_unlock;
  1112			}
  1113			cd_table = (u64 *)(FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, dst[0]) << 6);
  1114			/* This shouldn't happen*/
  1115			BUG_ON(!cd_table);
  1116	
  1117			cd_table = hyp_phys_to_virt((phys_addr_t)cd_table);
  1118			cd = smmu_get_cd_ptr(cd_table, pasid);
  1119	
  1120			WARN_ON(!FIELD_GET(CTXDESC_CD_0_V, cd[0]));
  1121	
  1122			/* Invalidate CD. */
  1123			cd[0] = 0;
  1124			smmu_sync_cd(smmu, cd, sid, pasid);
  1125			cd[1] = 0;
  1126			cd[2] = 0;
  1127			cd[3] = 0;
  1128			ret = smmu_sync_cd(smmu, cd, sid, pasid);
  1129		} else {
  1130			/* Don't clear CD ptr, as it would leak memory. */
  1131			dst[0] &= STRTAB_STE_0_S1CTXPTR_MASK;
  1132			ret = smmu_sync_ste(smmu, dst, sid);
  1133			if (ret)
  1134				goto out_unlock;
  1135	
  1136			for (i = 1; i < STRTAB_STE_DWORDS; i++)
  1137				dst[i] = 0;
  1138	
  1139			ret = smmu_sync_ste(smmu, dst, sid);
  1140		}
  1141	
  1142		smmu_put_ref_domain(smmu, smmu_domain);
  1143	out_unlock:
  1144		hyp_spin_unlock(&iommu->lock);
  1145		hyp_write_unlock(&smmu_domain->lock);
  1146		return ret;
  1147	}
  1148	
  1149	int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
  1150	{
  1151		struct hyp_arm_smmu_v3_domain *smmu_domain;
  1152	
  1153		smmu_domain = smmu_alloc(sizeof(struct hyp_arm_smmu_v3_domain));
  1154		if (!smmu_domain)
  1155			return -ENOMEM;
  1156	
  1157		/* Can't do much without the IOMMU. */
  1158		INIT_LIST_HEAD(&smmu_domain->iommu_list);
  1159		smmu_domain->domain = domain;
  1160		smmu_domain->type = type;
  1161		hyp_rwlock_init(&smmu_domain->lock);
  1162		hyp_spin_lock_init(&smmu_domain->pgt_lock);
  1163		domain->priv = (void *)smmu_domain;
  1164	
  1165		return 0;
  1166	}
  1167	
  1168	void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
  1169	{
  1170		/*
  1171		 * As page table allocation is decoupled from alloc_domain, free_domain can
  1172		 * be called with a domain that have never been attached.
  1173		 */
  1174		if (domain->pgtable)
  1175			kvm_arm_io_pgtable_free(domain->pgtable);
  1176	
  1177		hyp_free(domain->priv);
  1178	}
  1179	
  1180	bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
  1181			      struct kvm_cpu_context *host_ctxt, u64 esr, u32 off)
  1182	{
  1183		bool is_write = esr & ESR_ELx_WNR;
  1184		unsigned int len = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
  1185		int rd = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
  1186		const u32 no_access  = 0;
  1187		const u32 read_write = (u32)(-1);
  1188		const u32 read_only = is_write ? no_access : read_write;
  1189		u32 mask = no_access;
  1190	
  1191		/*
  1192		 * Only handle MMIO access with u32 size and alignment.
  1193		 * We don't need to change 64-bit registers for now.
  1194		 */
  1195		if ((len != sizeof(u32)) || (off & (sizeof(u32) - 1)))
  1196			return false;
  1197	
  1198		switch (off) {
  1199		case ARM_SMMU_EVTQ_PROD + SZ_64K:
  1200			mask = read_write;
  1201			break;
  1202		case ARM_SMMU_EVTQ_CONS + SZ_64K:
  1203			mask = read_write;
  1204			break;
  1205		case ARM_SMMU_GERROR:
  1206			mask = read_only;
  1207			break;
  1208		case ARM_SMMU_GERRORN:
  1209			mask = read_write;
  1210			break;
  1211		};
  1212	
  1213		if (!mask)
  1214			return false;
  1215		if (is_write)
  1216			writel_relaxed(cpu_reg(host_ctxt, rd) & mask, smmu->base + off);
  1217		else
  1218			cpu_reg(host_ctxt, rd) = readl_relaxed(smmu->base + off);
  1219	
  1220		return true;
  1221	}
  1222	
  1223	bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
  1224	{
  1225		struct hyp_arm_smmu_v3_device *smmu;
  1226	
  1227		for_each_smmu(smmu) {
  1228			if (addr < smmu->mmio_addr || addr >= smmu->mmio_addr + smmu->mmio_size)
  1229				continue;
  1230			return smmu_dabt_device(smmu, host_ctxt, esr, addr - smmu->mmio_addr);
  1231		}
  1232		return false;
  1233	}
  1234	
  1235	int smmu_suspend(struct kvm_hyp_iommu *iommu)
  1236	{
  1237		struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
  1238	
  1239		/*
  1240		 * Disable translation, GBPA is validated at probe to be set, so all transaltion
  1241		 * would be aborted when SMMU is disabled.
  1242		 */
  1243		if (iommu->power_domain.type == KVM_POWER_DOMAIN_HOST_HVC)
  1244			return smmu_write_cr0(smmu, 0);
  1245		return 0;
  1246	}
  1247	
  1248	int smmu_resume(struct kvm_hyp_iommu *iommu)
  1249	{
  1250		struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
  1251	
  1252		/*
  1253		 * Re-enable and clean all caches.
  1254		 */
  1255		if (iommu->power_domain.type == KVM_POWER_DOMAIN_HOST_HVC)
  1256			return smmu_reset_device(smmu);
  1257		return 0;
  1258	}
  1259	
> 1260	int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
  1261			   phys_addr_t paddr, size_t pgsize,
  1262			   size_t pgcount, int prot, size_t *total_mapped)
  1263	{
  1264		size_t mapped;
  1265		size_t granule;
  1266		int ret;
  1267		struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
  1268	
  1269		granule = 1UL << __ffs(domain->pgtable->cfg.pgsize_bitmap);
  1270		if (!IS_ALIGNED(iova | paddr | pgsize, granule))
  1271			return -EINVAL;
  1272	
  1273		hyp_spin_lock(&smmu_domain->pgt_lock);
  1274		while (pgcount && !ret) {
  1275			mapped = 0;
  1276			ret = domain->pgtable->ops.map_pages(&domain->pgtable->ops, iova, paddr, pgsize,
  1277							     pgcount, prot, 0, &mapped);
  1278			if (ret)
  1279				break;
  1280			WARN_ON(!IS_ALIGNED(mapped, pgsize));
  1281			WARN_ON(mapped > pgcount * pgsize);
  1282	
  1283			pgcount -= mapped / pgsize;
  1284			*total_mapped += mapped;
  1285			iova += mapped;
  1286			paddr += mapped;
  1287		}
  1288		hyp_spin_unlock(&smmu_domain->pgt_lock);
  1289	
  1290		return 0;
  1291	}
  1292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
