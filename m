Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287FB6EB6E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710428377; cv=none; b=X+kbM5EfYM5gdUstbtRCryTAQPcPXmbuCbKVjunLGO4WQwywIhjI7MndN3wk12Cesn4SCjKL7jdmbM5eMUgbpsDDgAz6vR9oPUJyZdKm5QTVl7TSteLRSwpHBqSNyPj9WGL8m7POCo91e7IMOlRxB4U7eWxjuiI1VEQJMq1dTdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710428377; c=relaxed/simple;
	bh=TeSUuwF6aHpuNb9+mVfSbWuH2ZhtVyVmdfb1fQp7QNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JCD+DTj+FIyIuc2m0+XI8ybj/K0/dLjlDumg1N8t752FPBXc9L+wxyVHQBJUkf3RIMkvcEV4GOHUrcmW8T/pKFE5eFOQ9P97e8zfQc//RhHu6l0TcvfabZQERNKXgqeTq/YcjMtdN0f173j3BfjyiciU6hWCNdFrckb3J7B8OuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQYjezKv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQYjezKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710428374; x=1741964374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TeSUuwF6aHpuNb9+mVfSbWuH2ZhtVyVmdfb1fQp7QNg=;
  b=VQYjezKvLkG1LABMjwCRa1BLG4MFbjKd5+2zyyaTQosj5/VkPemD4ebX
   q+609NZKj/2wbTWqoL6gR7V7iwenRbjICrickfrUhMNst+2N6RiYiDcei
   4dDL/s/+NfGAGA0wdasebe8876YRV4HtTlnjv1n55lZ7pmB9L9fEt88Ww
   VxXa7+91luGaKmoL6KLqTzqMpacmg7ow8UPOyTDgwm/l7h4yej1r1oZGu
   tp5QPlN6fE+4rxM6ndoOFlhP1zqmJNtYmf7HEf+IElKw9b6o0yQ9Q+6MD
   h3jq/gthaobfyp6Z4eoCdGFY/rdeTC7q/+oVpzKp0xQAksYVyXyVkzjL9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="9073603"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="9073603"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 07:59:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="43343154"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Mar 2024 07:59:31 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkmYL-000DVz-2O;
	Thu, 14 Mar 2024 14:59:29 +0000
Date: Thu, 14 Mar 2024 22:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 9/30]
 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:595:5: warning: no previous
 prototype for function 'smmu_domain_finalise'
Message-ID: <202403142214.6d8uZhIs-lkp@intel.com>
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
head:   31de4c08caf04886df7ee001c8b8af82824daab6
commit: d88b856410269e29b62444c90dc10bca914880ba [9/30] ANDROID: drivers/arm-smmu-v3-kvm: Modularize driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240314/202403142214.6d8uZhIs-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403142214.6d8uZhIs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403142214.6d8uZhIs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:7:
   In file included from drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h:5:
   In file included from arch/arm64/include/asm/kvm_asm.h:52:
   In file included from include/linux/mm.h:2025:
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
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:595:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
     595 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:595:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     595 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:711:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
     711 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:711:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     711 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:726:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
     726 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:726:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     726 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:738:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
     738 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:738:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     738 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:781:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
     781 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:781:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     781 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:793:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
     793 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:793:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     793 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:806:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
     806 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:806:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     806 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:819:5: warning: no previous prototype for function 'smmu_init_hyp_module' [-Wmissing-prototypes]
     819 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:819:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     819 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         | ^
         | static 
   13 warnings generated.
--
   In file included from drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:5:
   In file included from drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h:5:
   In file included from arch/arm64/include/asm/kvm_asm.h:52:
   In file included from include/linux/mm.h:2025:
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
>> drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:54:5: warning: no previous prototype for function 'kvm_arm_io_pgtable_init' [-Wmissing-prototypes]
      54 | int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      54 | int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
         | ^
         | static 
   6 warnings generated.
--
   In file included from drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:11:
   In file included from include/linux/io-pgtable-arm.h:5:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2025:
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
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:145:5: warning: no previous prototype for function '__arm_lpae_map' [-Wmissing-prototypes]
     145 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     145 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:266:5: warning: no previous prototype for function 'arm_lpae_map_pages' [-Wmissing-prototypes]
     266 | int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:266:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     266 | int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:470:8: warning: no previous prototype for function '__arm_lpae_unmap_pages' [-Wmissing-prototypes]
     470 | size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:470:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     470 | size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:492:13: warning: no previous prototype for function 'arm_lpae_iova_to_phys' [-Wmissing-prototypes]
     492 | phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
         |             ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:492:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     492 | phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:528:8: warning: no previous prototype for function 'arm_lpae_unmap_pages' [-Wmissing-prototypes]
     528 | size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:528:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     528 | size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:535:8: warning: no previous prototype for function 'arm_lpae_unmap_pages_walk' [-Wmissing-prototypes]
     535 | size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:535:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     535 | size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
   11 warnings generated.


vim +/smmu_domain_finalise +595 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  594  
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10 @595  int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  596  {
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  597  	int ret;
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  598  	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  599  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(smmu_domain->iommu);
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  600  
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  601  	domain->pgtable = kvm_arm_io_pgtable_alloc(&smmu->pgtable_cfg,
65c39348604eb49 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-04  602  						   domain, &ret);
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  603  
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  604  	return ret;
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  605  }
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  606  
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  607  static int smmu_attach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  608  			   u32 sid)
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  609  {
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  610  	int i;
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  611  	int ret = -EINVAL;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  612  	u64 *dst;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  613  	struct io_pgtable_cfg *cfg;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  614  	u64 ts, sl, ic, oc, sh, tg, ps;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  615  	u64 ent[STRTAB_STE_DWORDS] = {};
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  616  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  617  	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  618  
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  619  	hyp_spin_lock(&iommu->lock);
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  620  	dst = smmu_get_ste_ptr(smmu, sid);
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  621  	if (!dst || dst[0])
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  622  		goto out_unlock;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  623  
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  624  	/*
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  625  	 * First attach to the domain, this is over protected by the all domain locks,
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  626  	 * as there is no per-domain lock now, this can be improved later.
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  627  	 * However, as this operation is not on the hot path, it should be fine.
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  628  	 */
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  629  	if (!domain->pgtable) {
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  630  		smmu_domain->iommu = iommu;
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  631  		ret = smmu_domain_finalise(domain);
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  632  		if (ret)
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  633  			goto out_unlock;
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  634  	}
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  635  
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  636  	if (smmu_domain->iommu != iommu) {
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  637  		ret = -EBUSY;
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  638  		goto out_unlock;
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  639  	}
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  640  
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  641  	cfg = &domain->pgtable->cfg;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  642  	ps = cfg->arm_lpae_s2_cfg.vtcr.ps;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  643  	tg = cfg->arm_lpae_s2_cfg.vtcr.tg;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  644  	sh = cfg->arm_lpae_s2_cfg.vtcr.sh;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  645  	oc = cfg->arm_lpae_s2_cfg.vtcr.orgn;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  646  	ic = cfg->arm_lpae_s2_cfg.vtcr.irgn;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  647  	sl = cfg->arm_lpae_s2_cfg.vtcr.sl;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  648  	ts = cfg->arm_lpae_s2_cfg.vtcr.tsz;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  649  
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  650  	ent[0] = STRTAB_STE_0_V |
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  651  		 FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  652  	ent[1] = FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING);
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  653  	ent[2] = FIELD_PREP(STRTAB_STE_2_VTCR,
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  654  			FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, ps) |
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  655  			FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, tg) |
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  656  			FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, sh) |
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  657  			FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, oc) |
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  658  			FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, ic) |
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  659  			FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, sl) |
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  660  			FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, ts)) |
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  661  		 FIELD_PREP(STRTAB_STE_2_S2VMID, domain->domain_id) |
e38eaba127198fb arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  662  		 STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2R;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  663  	ent[3] = cfg->arm_lpae_s2_cfg.vttbr & STRTAB_STE_3_S2TTB_MASK;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  664  
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  665  	/*
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  666  	 * The SMMU may cache a disabled STE.
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  667  	 * Initialize all fields, sync, then enable it.
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  668  	 */
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  669  	for (i = 1; i < STRTAB_STE_DWORDS; i++)
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  670  		dst[i] = cpu_to_le64(ent[i]);
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  671  
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  672  	ret = smmu_sync_ste(smmu, sid);
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  673  	if (ret)
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  674  		goto out_unlock;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  675  
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  676  	WRITE_ONCE(dst[0], cpu_to_le64(ent[0]));
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  677  	ret = smmu_sync_ste(smmu, sid);
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  678  	WARN_ON(ret);
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  679  
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  680  out_unlock:
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  681  	hyp_spin_unlock(&iommu->lock);
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  682  	return ret;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  683  }
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  684  
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  685  static int smmu_detach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  686  			   u32 sid)
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  687  {
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  688  	u64 *dst;
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  689  	int i, ret = -ENODEV;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  690  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  691  
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  692  	hyp_spin_lock(&iommu->lock);
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  693  	dst = smmu_get_ste_ptr(smmu, sid);
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  694  	if (!dst)
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  695  		goto out_unlock;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  696  
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  697  	dst[0] = 0;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  698  	ret = smmu_sync_ste(smmu, sid);
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  699  	if (ret)
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  700  		goto out_unlock;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  701  
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  702  	for (i = 1; i < STRTAB_STE_DWORDS; i++)
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  703  		dst[i] = 0;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  704  
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  705  	ret = smmu_sync_ste(smmu, sid);
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  706  out_unlock:
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  707  	hyp_spin_unlock(&iommu->lock);
36725847a2bff9a arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  708  	return ret;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  709  }
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  710  
65c39348604eb49 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-04 @711  int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain)
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  712  {
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  713  	struct hyp_arm_smmu_v3_domain *smmu_domain;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  714  
121d5cd12222fcf arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-11-02  715  	smmu_domain = smmu_alloc(sizeof(struct hyp_arm_smmu_v3_domain));
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  716  	if (!smmu_domain)
121d5cd12222fcf arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-11-02  717  		return -ENOMEM;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  718  
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  719  	/* Can't do much without the IOMMU. */
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  720  	smmu_domain->domain = domain;
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  721  	domain->priv = (void *)smmu_domain;
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  722  
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  723  	return 0;
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  724  }
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  725  
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26 @726  void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  727  {
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  728  	/*
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  729  	 * As page table allocation is decoupled from alloc_domain, free_domain can
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  730  	 * be called with a domain that have never been attached.
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  731  	 */
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  732  	if (domain->pgtable)
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  733  		kvm_arm_io_pgtable_free(domain->pgtable);
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  734  
a7952d83baa4e66 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-08-10  735  	hyp_free(domain->priv);
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  736  }
10b340ac53ba3b5 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Jean-Philippe Brucker 2023-01-26  737  
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08 @738  bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  739  		      struct kvm_cpu_context *host_ctxt, u64 esr, u32 off)
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  740  {
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  741  	bool is_write = esr & ESR_ELx_WNR;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  742  	unsigned int len = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  743  	int rd = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  744  	const u32 no_access  = 0;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  745  	const u32 read_write = (u32)(-1);
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  746  	const u32 read_only = is_write ? no_access : read_write;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  747  	u32 mask = no_access;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  748  
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  749  	/*
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  750  	 * Only handle MMIO access with u32 size and alignment.
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  751  	 * We don't need to change 64-bit registers for now.
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  752  	 */
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  753  	if ((len != sizeof(u32)) || (off & (sizeof(u32) - 1)))
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  754  		return false;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  755  
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  756  	switch (off) {
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  757  	case ARM_SMMU_EVTQ_PROD + SZ_64K:
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  758  		mask = read_write;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  759  		break;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  760  	case ARM_SMMU_EVTQ_CONS + SZ_64K:
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  761  		mask = read_write;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  762  		break;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  763  	case ARM_SMMU_GERROR:
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  764  		mask = read_only;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  765  		break;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  766  	case ARM_SMMU_GERRORN:
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  767  		mask = read_write;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  768  		break;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  769  	};
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  770  
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  771  	if (!mask)
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  772  		return false;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  773  	if (is_write)
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  774  		writel_relaxed(cpu_reg(host_ctxt, rd) & mask, smmu->base + off);
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  775  	else
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  776  		cpu_reg(host_ctxt, rd) = readl_relaxed(smmu->base + off);
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  777  
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  778  	return true;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  779  }
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  780  
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08 @781  bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  782  {
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  783  	struct hyp_arm_smmu_v3_device *smmu;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  784  
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  785  	for_each_smmu(smmu) {
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  786  		if (addr < smmu->mmio_addr || addr >= smmu->mmio_addr + smmu->mmio_size)
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  787  			continue;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  788  		return smmu_dabt_device(smmu, host_ctxt, esr, addr - smmu->mmio_addr);
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  789  	}
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  790  	return false;
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  791  }
76a1c655cb41c2f arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-09-08  792  
6fc13d361a93aac arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17 @793  int smmu_suspend(struct kvm_hyp_iommu *iommu)
6fc13d361a93aac arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  794  {
6fc13d361a93aac arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  795  	struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
6fc13d361a93aac arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  796  
6fc13d361a93aac arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  797  	/*
6fc13d361a93aac arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  798  	 * Disable translation, GBPA is validated at probe to be set, so all transaltion
6fc13d361a93aac arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  799  	 * would be aborted when SMMU is disabled.
6fc13d361a93aac arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  800  	 */
6fc13d361a93aac arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  801  	if (iommu->power_domain.type == KVM_POWER_DOMAIN_HOST_HVC)
6fc13d361a93aac arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  802  		return smmu_write_cr0(smmu, 0);
6fc13d361a93aac arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  803  	return 0;
6fc13d361a93aac arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  804  }
6fc13d361a93aac arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c Mostafa Saleh         2023-10-17  805  

:::::: The code at line 595 was first introduced by commit
:::::: a7952d83baa4e664e9afd4c263571f9bcb95997d ANDROID: KVM: arm64: iommu: Remove iommu from alloc_domain

:::::: TO: Mostafa Saleh <smostafa@google.com>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
