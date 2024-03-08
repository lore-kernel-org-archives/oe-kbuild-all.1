Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056323610A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 06:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709878005; cv=none; b=eopmRpxCqGXi9lSZBmWd6Sccu+L4dJ5uoU8ac81TERhmztME2cp9Jw4xV7qI4wN6fjChA81BFyGvPHI6fJh05R6mF/Esu2Ir4cnqv20c5YoCCCXv72UBlnO7JmE0z/9sARf53p9p27xSQdA691zEN1C5JWzCjIa/y/skqbvlH5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709878005; c=relaxed/simple;
	bh=1DjVK6iEJU4Rac2HlsPkZppEXAWPyI/Z+x9SvegwTjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SRpFEK8NuxAVwZlb2Jc+8+pRhJzIdIr1mO3tWinDvvSsSdrpLSf79zvQDg7FUOECXoXOcT9oBQJCcRM+VRA2HwZA0ktJrsan5DFKs6tlUOB1t0+2OGfac9uZn8bIwN09chiB0W9uzJtKmDP9HHKjl3eYNHuYI7BvU0uBBIv+LtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdAP8ApT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdAP8ApT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709878003; x=1741414003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1DjVK6iEJU4Rac2HlsPkZppEXAWPyI/Z+x9SvegwTjQ=;
  b=CdAP8ApTW7yFCCvVDoCXK5VMpCZjKAtKCUhkNu/rQvSTQRmCLWx1a0Pi
   znERJstKDwEqvmp5CZDzumWmQbxWQTCAu9FGN3rqXgvhmFKzUvljl+YVv
   m/lwTFl6IPfjMYlIwbojvjca0nMywoMURXWwApfCmehuGgg8x7j9Z49sC
   OMOBAQdrWXL2ILRQ7a96QJnJ4ZbHsuyPaBke8WmdoXpr7Vqj8iBDNiVAJ
   JtCie1yGdA7tGci4UyVh6khsQS2nTUL6jRcjZXlb0AGl4FqM1pdJWOYii
   78PS9Wir5APw7XMXZguKP1eNVTK4UEpmzu3FqwlqZ8iLdjcUiw2ozq8tW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4711623"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4711623"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 22:06:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="10302014"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Mar 2024 22:06:39 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riTNM-00065T-2m;
	Fri, 08 Mar 2024 06:06:36 +0000
Date: Fri, 8 Mar 2024 14:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 15/57]
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c:602:5: warning: no previous
 prototype for function 'smmu_alloc_domain'
Message-ID: <202403081455.9X9B3J8N-lkp@intel.com>
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
commit: 10b340ac53ba3b565aec3d8d1ab22d23ffa84d34 [15/57] BACKPORT: FROMLIST: KVM: arm64: smmu-v3: Setup domains and page table configuration
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240308/202403081455.9X9B3J8N-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081455.9X9B3J8N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081455.9X9B3J8N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c:8:
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
>> arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c:602:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
     602 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, unsigned long pgd_hva)
         |     ^
   arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c:602:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     602 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, unsigned long pgd_hva)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c:613:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
     613 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^
   arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c:613:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     613 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   7 warnings generated.


vim +/smmu_alloc_domain +602 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c

   601	
 > 602	int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, unsigned long pgd_hva)
   603	{
   604		int ret;
   605		struct hyp_arm_smmu_v3_device *smmu = to_smmu(domain->iommu);
   606	
   607		domain->pgtable = kvm_arm_io_pgtable_alloc(&smmu->pgtable_cfg,
   608							   pgd_hva, domain, &ret);
   609	
   610		return ret;
   611	}
   612	
 > 613	void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
   614	{
   615		kvm_arm_io_pgtable_free(domain->pgtable);
   616	}
   617	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
