Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE101EEEA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709826966; cv=none; b=DLXYR3RkqUYGuY5or/W6TsmwIIAZHZLazuljZ4UBUkj3yAJeP+DYnmhuJilz9XgFk7VfPUxuLzGEqSAHD6Kz9eCAHpwZFMOvXbsn/uUHWoUU34ggqz3iuV8wbeJEHJz2KVW1RJVNB6WOWOgkkCuEufUJ3quuC/Ww9HdGGXFrPcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709826966; c=relaxed/simple;
	bh=trhi25RuLxrmsJcGvxn5fZG3+whkfzdIg3uMrBc/8Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b8qZdzh2gCxhN+qjtLt4JjaLnn8SAQitL4F9E74j7/mmV4ahu426S+1EYUEl9V4BpaSAtv90nLkw9vEXVrlHALy8P3SGXKikqsDnB+hcdq8Gvev+B8R6IKCQWHUvYS/nECnZ1d/0+L2+RhzAtwYrhYAIb/P3HftFhDgnZbmv1IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYt/V83v; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYt/V83v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709826965; x=1741362965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=trhi25RuLxrmsJcGvxn5fZG3+whkfzdIg3uMrBc/8Cg=;
  b=EYt/V83v/0UE2YPdUHNGNXrpdnHJYRxdYnp4k09FVUfH56HQi8P/i/0i
   0d8F5pV1ve46xOMrhiHnTbD4bL9PuXnuWhuWEti3lo/gX3IdfamQu+DKh
   wve80knmXcyhrLK2nkVteJsMOnHdi858WxwdyIFC1binKYsH8H8vCs6GR
   AdVcAwd+HT+PwJn21VxGx5AfMdsuIFFkcXeteEDthVrq20PFbewTr0pbW
   1XacdguGuo4gLmaX8/l5mo/26Fy3I1GeA6bU9OFqYP4ToJgoGWTh6noXO
   gsBA25CmZec81O8k7Krrd31Li75SJOpa7UCz63wiNXQP0vnEuLrbV9Ls4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15148082"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="15148082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 07:56:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="41049481"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Mar 2024 07:56:02 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riG6B-0005JL-33;
	Thu, 07 Mar 2024 15:55:59 +0000
Date: Thu, 7 Mar 2024 23:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 14/57]
 arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c:48:5: warning: no previous
 prototype for function 'kvm_arm_io_pgtable_init'
Message-ID: <202403072337.7mH9g3RT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   6872638c2ef3e7439a7f074a8757cbf3060db80e
commit: 933ecf6aeb5761783505c30dbe2f646007fc7740 [14/57] BACKPORT: FROMLIST: KVM: arm64: smmu-v3: Support io-pgtable
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240307/202403072337.7mH9g3RT-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403072337.7mH9g3RT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403072337.7mH9g3RT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c:5:
   In file included from arch/arm64/include/asm/kvm_hyp.h:11:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:1959:
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
>> arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c:48:5: warning: no previous prototype for function 'kvm_arm_io_pgtable_init' [-Wmissing-prototypes]
      48 | int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
         |     ^
   arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c:48:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      48 | int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
         | ^
         | static 
   6 warnings generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:11:
   In file included from include/linux/io-pgtable-arm.h:5:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1959:
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
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:143:5: warning: no previous prototype for function '__arm_lpae_map' [-Wmissing-prototypes]
     143 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:143:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     143 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:264:5: warning: no previous prototype for function 'arm_lpae_map_pages' [-Wmissing-prototypes]
     264 | int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |     ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:264:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     264 | int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:471:8: warning: no previous prototype for function '__arm_lpae_unmap_pages' [-Wmissing-prototypes]
     471 | size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:471:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     471 | size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:493:13: warning: no previous prototype for function 'arm_lpae_iova_to_phys' [-Wmissing-prototypes]
     493 | phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
         |             ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:493:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     493 | phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:529:8: warning: no previous prototype for function 'arm_lpae_unmap_pages' [-Wmissing-prototypes]
     529 | size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:529:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     529 | size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:536:8: warning: no previous prototype for function 'arm_lpae_unmap_pages_walk' [-Wmissing-prototypes]
     536 | size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/io-pgtable-arm-common.c:536:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     536 | size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
   11 warnings generated.


vim +/kvm_arm_io_pgtable_init +48 arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c

    47	
  > 48	int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
    49				    struct arm_lpae_io_pgtable *data)
    50	{
    51		int ret = arm_lpae_init_pgtable_s2(cfg, data);
    52	
    53		if (ret)
    54			return ret;
    55	
    56		data->iop.cfg = *cfg;
    57		data->iop.fmt	= cfg->fmt;
    58	
    59		return 0;
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
