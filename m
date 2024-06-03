Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80AD6BFA7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 09:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406374; cv=none; b=Kiv0wXVQu1HHMrgaGmSMtP3/Zz0rnQyXpZutxT6gij5Dr2r91M3y38YVpdA/ymy4O242xbs12rVJFpC01Gv5pBvM+g+oa2KtKtjh0DHbmr7HARqUyLA0VczmmkK5tLWyNE4ZMUQEvMxqx7qkyRj83If7ZnuKDuUHz2vTZxhIBX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406374; c=relaxed/simple;
	bh=sJi1cnv1A8UlAqVBTCvsknQjEJDHz76h/HjQ4shQ01s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L9e77fZXpy3KN6OyAHhiQ8XyElWc75tboT29ISxECJ+oMdCFQgRZcQcxeneKe59Xt/6MiWBOf1n8cDWZVKoi1ww0Kk59lCBnqBwrqtVpHphrq04uhIYBKy7fMgvcYCV04RllmEkukmKNqTTaXxYcYQeAKK9QsjjoF+RyVewsmcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsh/aMJg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsh/aMJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717406372; x=1748942372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sJi1cnv1A8UlAqVBTCvsknQjEJDHz76h/HjQ4shQ01s=;
  b=hsh/aMJgvGNemiDljW2DQnNBksIHRm6ZEA6jCDM6ATYL6zBpqJn5GekU
   meFKqeGCeSNbHPklQJyPgVPQtVgEowQIZbivZqPxPP5SNJNhrpgLbCGa7
   Gt1ahMWy+gMAUM3oIBiKdhQ8gxLEJLTYNzSY0gzuN7d9ZPMD9+B8HBCfh
   X7SQiiDBZ/6XBN77/nwmYvTLrT5YjyBRFiGN4kMAFJTiyMVeswU//2WZ0
   6vgNoqcoAPhNjp8Tpbt1GGObd+1hjjKSkebgeDpczSxd2KdlVx/gNaKai
   pTSiMFdV6DGOu2BnVnEkYcjev9roMrBSV+sClOPnwthv/kM/dicGJP1MF
   w==;
X-CSE-ConnectionGUID: o7Lj2j78Rs6t5JksjSmoWQ==
X-CSE-MsgGUID: 7e82dZZGRZSrebcRFfb94Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13833460"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="13833460"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 02:19:32 -0700
X-CSE-ConnectionGUID: 8zkFlSAGRnGFT/EE7asqEg==
X-CSE-MsgGUID: JaDKCgSpRiit1qWBACDI+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="67665075"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Jun 2024 02:19:30 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE3qh-000LGy-2u;
	Mon, 03 Jun 2024 09:19:27 +0000
Date: Mon, 3 Jun 2024 17:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 43/60]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1260:5:
 warning: no previous prototype for 'smmu_map_pages'
Message-ID: <202406031736.nwgesdcj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   58d0038d0aa470ce6ed548889f8ae80892194290
commit: a737b7d0e7214b258b75010404de3de09d2d5c0d [43/60] ANDROID: KVM: arm64: iommu: Reduce the logic in generic code
config: arm64-randconfig-r054-20240529 (https://download.01.org/0day-ci/archive/20240603/202406031736.nwgesdcj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406031736.nwgesdcj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406031736.nwgesdcj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:768:5: warning: no previous prototype for 'smmu_domain_config_s2' [-Wmissing-prototypes]
     768 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:800:5: warning: no previous prototype for 'smmu_domain_config_s1' [-Wmissing-prototypes]
     800 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:874:5: warning: no previous prototype for 'smmu_domain_finalise' [-Wmissing-prototypes]
     874 | int smmu_domain_finalise(struct hyp_arm_smmu_v3_device *smmu,
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1149:5: warning: no previous prototype for 'smmu_alloc_domain' [-Wmissing-prototypes]
    1149 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         |     ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1168:6: warning: no previous prototype for 'smmu_free_domain' [-Wmissing-prototypes]
    1168 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1180:6: warning: no previous prototype for 'smmu_dabt_device' [-Wmissing-prototypes]
    1180 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1223:6: warning: no previous prototype for 'smmu_dabt_handler' [-Wmissing-prototypes]
    1223 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1235:5: warning: no previous prototype for 'smmu_suspend' [-Wmissing-prototypes]
    1235 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1248:5: warning: no previous prototype for 'smmu_resume' [-Wmissing-prototypes]
    1248 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1260:5: warning: no previous prototype for 'smmu_map_pages' [-Wmissing-prototypes]
    1260 | int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
         |     ^~~~~~~~~~~~~~

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


vim +/smmu_map_pages +1260 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

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
