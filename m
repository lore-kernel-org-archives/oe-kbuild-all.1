Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7E42A8B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 01:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730251339; cv=none; b=jfk6o8Fu8i+TaWM4PfUr/taSM4Kdsxjr2sKfb5O6aCUQMoxV9Xt9XY2RDarDUrB/0F2LsmuSE2gtAPalld7t9nTX0wEXxWq2vijeTKToY4xSdMOCtlGbnMwCmmRNV4KFM+dIYXGemO/cfYtFapBUdcNjTnodmkpo7q9D2Liiieg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730251339; c=relaxed/simple;
	bh=7p9dMFZ+tvTwH20yG2slNL4IxV5VzDvdKni13sMSTG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDwOdY6Cg3wHvwpseZHxOWgcV+T6JHDCTIluxsXwON/Lxkoof5OYHdI79tKC/acWZ2AO1ONxli5d9BVDgfNmJhKs+KJMVgD6gplhHV6r3t2Ofxem6Yd8rXLEQQOSiZPI0iwepHImxcLBas5/4L2me0wbTOryeejKffILgU2rhpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJbM3kRQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJbM3kRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730251336; x=1761787336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7p9dMFZ+tvTwH20yG2slNL4IxV5VzDvdKni13sMSTG0=;
  b=GJbM3kRQWYgyWomhjJuoT77k2Kh8H5Jhu7x8i1fpFZoAsJdMbeQXDWte
   khSzEocZbvDVBFDQmUrkH7UOTl6TV93jpK4uC0iP4Sv8E0GUdHBehR0Vh
   hGAJJNTKP9c3hLzjuSBsYzwjYR9mW2mcLN87+RAyOTPQcvCclY/rLiOiX
   HATkopR+4YUovbTR5pHEW/WA5x5DQCnagrhQCI40+cyrAySN1LxCbGMy5
   z5JPlHGzXBeXS0YW5812ktlDb1K3ySbID5kIN41Q1MXt4lJ+l1IvYhVOp
   IM4AvfdYzxxrf3I8A+87TXJ4xvwZz8X9gtxud9isXfgZrGGYmI7OqXXVa
   A==;
X-CSE-ConnectionGUID: uiK9HcmRT/yNHH+4e/fu5g==
X-CSE-MsgGUID: 7o459ydJRlivscjlsE8juQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33729357"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="33729357"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 18:22:12 -0700
X-CSE-ConnectionGUID: bzeF+JhiTYaf/J+PdpAaJw==
X-CSE-MsgGUID: BiwxJFzgTS63A5TXQD8uNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82567180"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Oct 2024 18:20:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5xO1-000eMo-05;
	Wed, 30 Oct 2024 01:20:37 +0000
Date: Wed, 30 Oct 2024 09:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 50/68]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:239:3: error: use of
 undeclared identifier 'max_domains'
Message-ID: <202410300902.zavWPRpQ-lkp@intel.com>
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
commit: 75569795daf3d6c017f84b7dd9cce142a64ea514 [50/68] ANDROID: drivers/arm-smmu-v3-kvm: Support IOMMU_DOMAIN_BLOCKED
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241030/202410300902.zavWPRpQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300902.zavWPRpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300902.zavWPRpQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:7:
   In file included from arch/arm64/include/asm/kvm_pkvm.h:11:
   In file included from include/linux/memblock.h:12:
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
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:239:3: error: use of undeclared identifier 'max_domains'
     239 |                 max_domains = KVM_IOMMU_MAX_DOMAINS;
         |                 ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:259:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     259 |         int ret;
         |             ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:887:5: warning: no previous prototype for function 'kvm_arm_smmu_suspend' [-Wmissing-prototypes]
     887 | int kvm_arm_smmu_suspend(struct device *dev)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:887:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     887 | int kvm_arm_smmu_suspend(struct device *dev)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:897:5: warning: no previous prototype for function 'kvm_arm_smmu_resume' [-Wmissing-prototypes]
     897 | int kvm_arm_smmu_resume(struct device *dev)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:897:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     897 | int kvm_arm_smmu_resume(struct device *dev)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:947:5: warning: no previous prototype for function 'smmu_put_device' [-Wmissing-prototypes]
     947 | int smmu_put_device(struct device *dev, void *data)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:947:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     947 | int smmu_put_device(struct device *dev, void *data)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:953:5: warning: no previous prototype for function 'smmu_unregister_smmu' [-Wmissing-prototypes]
     953 | int smmu_unregister_smmu(struct device *dev, void *data)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:953:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     953 | int smmu_unregister_smmu(struct device *dev, void *data)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1082:15: warning: no previous prototype for function 'kvm_arm_smmu_v3_id' [-Wmissing-prototypes]
    1082 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         |               ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1082:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1082 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         | ^
         | static 
   11 warnings and 1 error generated.
--
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
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:780:5: warning: no previous prototype for function 'smmu_domain_config_s2' [-Wmissing-prototypes]
     780 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:780:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     780 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:813:5: warning: no previous prototype for function 'smmu_domain_config_s1' [-Wmissing-prototypes]
     813 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:813:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     813 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:888:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
     888 | int smmu_domain_finalise(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:888:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     888 | int smmu_domain_finalise(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:997:5: warning: no previous prototype for function 'smmu_fix_up_domains' [-Wmissing-prototypes]
     997 | int smmu_fix_up_domains(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:997:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     997 | int smmu_fix_up_domains(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1024:6: warning: no previous prototype for function 'is_device_blocked' [-Wmissing-prototypes]
    1024 | bool is_device_blocked(struct hyp_arm_smmu_v3_device *smmu, u32 sid, u32 pasid)
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1024:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1024 | bool is_device_blocked(struct hyp_arm_smmu_v3_device *smmu, u32 sid, u32 pasid)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1235:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
    1235 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1235 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1254:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
    1254 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1254:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1254 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1267:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
    1267 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1267:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1267 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1315:5: warning: no previous prototype for function 'smmu_block_dev' [-Wmissing-prototypes]
    1315 | int smmu_block_dev(struct kvm_hyp_iommu *iommu, u32 sid, bool is_host2guest)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1315:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1315 | int smmu_block_dev(struct kvm_hyp_iommu *iommu, u32 sid, bool is_host2guest)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1349:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
    1349 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1349:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1349 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1361:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
    1361 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1361:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1361 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1374:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
    1374 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1374:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1374 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1386:5: warning: no previous prototype for function 'smmu_map_pages' [-Wmissing-prototypes]
    1386 | int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1386:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1386 | int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1543:5: warning: no previous prototype for function 'smmu_init_hyp_module' [-Wmissing-prototypes]
    1543 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1543:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1543 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         | ^
         | static 
   19 warnings generated.


vim +/max_domains +239 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

   204	
   205	static int kvm_arm_smmu_domain_finalize(struct kvm_arm_smmu_domain *kvm_smmu_domain,
   206						struct kvm_arm_smmu_master *master)
   207	{
   208		int ret = 0;
   209		struct arm_smmu_device *smmu = master->smmu;
   210		struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
   211	
   212		if (kvm_smmu_domain->smmu) {
   213			if (kvm_smmu_domain->smmu != smmu)
   214				return -EINVAL;
   215			return 0;
   216		}
   217	
   218		kvm_smmu_domain->smmu = smmu;
   219	
   220		if (kvm_smmu_domain->domain.type == IOMMU_DOMAIN_IDENTITY) {
   221			kvm_smmu_domain->id = KVM_IOMMU_DOMAIN_IDMAP_ID;
   222			/*
   223			 * Identity domains doesn't use the DMA API, so no need to
   224			 * set the  domain aperture.
   225			 */
   226			return 0;
   227		}
   228	
   229		ret = ida_alloc_range(&kvm_arm_smmu_domain_ida, KVM_IOMMU_DOMAIN_NR_START,
   230				      KVM_IOMMU_MAX_DOMAINS - 1, GFP_KERNEL);
   231		if (ret < 0)
   232			return ret;
   233	
   234		kvm_smmu_domain->id = ret;
   235	
   236		/* Default to stage-1. */
   237		if (kvm_smmu_domain->domain.type == IOMMU_DOMAIN_BLOCKED) {
   238			kvm_smmu_domain->type = KVM_ARM_SMMU_DOMAIN_BLOCKED;
 > 239			max_domains = KVM_IOMMU_MAX_DOMAINS;
   240		} else if (smmu->features & ARM_SMMU_FEAT_TRANS_S1) {
   241			kvm_smmu_domain->type = KVM_ARM_SMMU_DOMAIN_S1;
   242			kvm_smmu_domain->domain.pgsize_bitmap = host_smmu->cfg_s1.pgsize_bitmap;
   243			kvm_smmu_domain->domain.geometry.aperture_end = (1UL << host_smmu->cfg_s1.ias) - 1;
   244		} else {
   245			kvm_smmu_domain->type = KVM_ARM_SMMU_DOMAIN_S2;
   246			kvm_smmu_domain->domain.pgsize_bitmap = host_smmu->cfg_s2.pgsize_bitmap;
   247			kvm_smmu_domain->domain.geometry.aperture_end = (1UL << host_smmu->cfg_s2.ias) - 1;
   248		}
   249		kvm_smmu_domain->domain.geometry.force_aperture = true;
   250	
   251		ret = kvm_call_hyp_nvhe_mc(__pkvm_host_iommu_alloc_domain,
   252					   kvm_smmu_domain->id, kvm_smmu_domain->type);
   253	
   254		return ret;
   255	}
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
