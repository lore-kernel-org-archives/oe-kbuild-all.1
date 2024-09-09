Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F87216D30B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 04:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725855629; cv=none; b=lTLxtuVGrtO02nvM1f/jUOJeX5FpwwNDh15UCyyIZ0487s7Cd6Kq2D2ReofMGAZ1rWW1B1lF7RkKl0f+kFRqjTW9rshDl2EVslYl4w8srb5HG6vsJD6SbeycfVt1K3fTHz8xjOZo1qgmC/FQuXWSm3yZlkmYo8kAHdLtFKxezu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725855629; c=relaxed/simple;
	bh=G6/2H4jXsFU7sL3uLTKiXCCl4Oudpr7dHexxsABBRDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HLD7Qw/csLIHau5WeqmvEsLlYm0U7AgLrMcWFSH3PtK0LjYVZXYZtD4BOtLbJ0k+LxzwKWFbZV2iXAcOJV96FXFphahmf+wNkocukActhV2cTNiJFS0b2tU8lGGdfhXWk/v08HKqB0kXUaz52fx1vveGkp2zR+NlEjEj3AODv6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6kkGbpb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6kkGbpb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725855628; x=1757391628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G6/2H4jXsFU7sL3uLTKiXCCl4Oudpr7dHexxsABBRDM=;
  b=e6kkGbpbcMClD5mDLZ6KI2FA19Jd5YbA6l+KPWLnNMR56K0hI2ussVW2
   6Qtw3rFVrIXvrsaw7nYC1RHnrN5t2J8FlK7YQxZ8x/HgaBfcILT89dSwM
   F3RizuHDaYeGoYBQeSl7/ex7ggApZm0Zx9JMP88zGyFsMmDIv2DAaAdgj
   1klQXgb0QeYnjRwCDC6TZVKsrGMorNqIB7maLAtCRfk2W2e73vChOtX7Q
   Auxbe1ZoopI7PhPn6qawjfWb5XpkCXvNsK23sZ3n8TkAQnTh2JOvMWdsu
   H8gM9+iQen0yc0ihWJqDdMwI53lMVKNq/nT/fUwW9ROwcxP2tg1SLTBAU
   Q==;
X-CSE-ConnectionGUID: Okmu5rNrRcKNhaCtI8W2Tg==
X-CSE-MsgGUID: WOXHSYUIQMCTCw4pVpsRrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24470005"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24470005"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 21:20:24 -0700
X-CSE-ConnectionGUID: r587FNIeRC6A21zL+JmtPw==
X-CSE-MsgGUID: OAPf5QjqS/mM1urb1qEArg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66763709"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Sep 2024 21:20:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snVsy-000EHV-1Q;
	Mon, 09 Sep 2024 04:20:20 +0000
Date: Mon, 9 Sep 2024 12:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 43/60]
 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1260:5:
 warning: no previous prototype for function 'smmu_map_pages'
Message-ID: <202409091202.C2mRvWzy-lkp@intel.com>
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
commit: a737b7d0e7214b258b75010404de3de09d2d5c0d [43/60] ANDROID: KVM: arm64: iommu: Reduce the logic in generic code
config: arm64-randconfig-r062-20240908 (https://download.01.org/0day-ci/archive/20240909/202409091202.C2mRvWzy-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091202.C2mRvWzy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091202.C2mRvWzy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:7:
   In file included from arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h:5:
   In file included from arch/arm64/include/asm/kvm_asm.h:52:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:768:5: warning: no previous prototype for function 'smmu_domain_config_s2' [-Wmissing-prototypes]
     768 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:768:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     768 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:800:5: warning: no previous prototype for function 'smmu_domain_config_s1' [-Wmissing-prototypes]
     800 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:800:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     800 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:874:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
     874 | int smmu_domain_finalise(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:874:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     874 | int smmu_domain_finalise(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1149:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
    1149 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1149 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1168:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
    1168 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1168:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1168 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1180:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
    1180 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1180:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1180 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1223:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
    1223 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1223:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1223 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1235:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
    1235 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1235 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1248:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
    1248 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1248:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1248 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1260:5: warning: no previous prototype for function 'smmu_map_pages' [-Wmissing-prototypes]
    1260 | int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1260:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1260 | int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
         | ^
         | static 
   11 warnings generated.

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
