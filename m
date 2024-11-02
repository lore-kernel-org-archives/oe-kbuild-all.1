Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5065A920
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 00:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730508190; cv=none; b=u+WJmnhi2DHGxoREUgSBGfHNWx7yiUKF2ZDU73QV0U9OA8aFRu9phW+xPV+F0RizRoP6LhEpy6g/W4CMsXB8odJNCE3FelL+3GTDn9ouN0I7w46lZ4JOxqbwUctms8wQv+s8wYHvUJp+FnKcmg2QSUzPaM02gZbX2OHmrNBgCIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730508190; c=relaxed/simple;
	bh=2Df7QsxULX8UpNjuYa3pDnlRbxp41kOakL/RV0piv3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fJ/A5Kq9Rl91LNcDPT+jTM7Gv7PTUi+PE3uDJdu9YrGSPq7+rleALr7TLXDgqq4zEb6Rm8mvAgasdsQtt0i84kXwuaSbuS4hRwShlE03Jej6ROFAuw3anEM6jpG2SL9poKhlTlUj2NYuKnXrUMQNy52ybHNfU2EokfcivIqzo5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOCQi7Gx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOCQi7Gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730508189; x=1762044189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Df7QsxULX8UpNjuYa3pDnlRbxp41kOakL/RV0piv3s=;
  b=cOCQi7GxOvANOl2fGZcREnxX4vJmXP/8hT8Js6Wer+iiOoImgSugbGgE
   XytXGyHlE3RNgrVoxWR9C5nYVa1KU1frWVdo72x8vErdfGIMrh46yKRu9
   0M5S+w2UShXAbKLZjBIv5fRwZDA1NtF6EiELB6HqjbvKrzSfDEg4Q9ptG
   exPnyY1g7EAdFAUoAN1SnA+5kqmSFDaf6asZ8Rj7bij10vr88TPweKwoS
   22YGkRS2L1FwZBhV+VgY1YX+cef6ywoBnO5Au6UymnbeEgSKy6Xn2lM+T
   IRewahkchn1gFjF5Z/nU324Vwc4Ofw8mDurjP7c/aVv3aBVEBQt+8QMAo
   w==;
X-CSE-ConnectionGUID: LxOo4WJnRJWD1uYsv4qtUg==
X-CSE-MsgGUID: ifSZxrkyTHCWFQMw4fVILQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41379906"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41379906"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 17:43:09 -0700
X-CSE-ConnectionGUID: HNtEnrLPS9STWvcu7smuSQ==
X-CSE-MsgGUID: gVtdInzXTXy5Sr6P1VXAtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="87640649"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Nov 2024 17:43:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t72EK-000iER-37;
	Sat, 02 Nov 2024 00:43:04 +0000
Date: Sat, 2 Nov 2024 08:42:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 5/5]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1260:5:
 warning: no previous prototype for 'smmu_map_pages'
Message-ID: <202411020826.0PIkMfew-lkp@intel.com>
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
head:   4996d55916ef7ac29e8741314de1320e5bdc8bf9
commit: a737b7d0e7214b258b75010404de3de09d2d5c0d [5/5] ANDROID: KVM: arm64: iommu: Reduce the logic in generic code
config: arm64-randconfig-r061-20241101 (https://download.01.org/0day-ci/archive/20241102/202411020826.0PIkMfew-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020826.0PIkMfew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020826.0PIkMfew-lkp@intel.com/

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
