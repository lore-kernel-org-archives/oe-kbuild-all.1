Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF71D80C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 01:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710121696; cv=none; b=q2182NC/hLxcf9LjPyBkO5lRVKzYJnsrG9xQiQozNabXDdYiWJ8E9fyCPm+0hFNzqyG2SATjePEuG/qhqNC/6olzXb45VGG/sz8AUjrCLc+RmoRUqfaplDzU6J9hqKMcFFQKo+Jc7n4wt3seNm2guXoxTUx05YcArRt/7KmaqjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710121696; c=relaxed/simple;
	bh=sQwtHq9qX9T2QJqNLkll5mw+hz0L/xp+kgABzjubwUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BCMjlnCaBxbUmUOjzxzH6q2IGhbVH7knR0FZB5gWRObCP5LH7Ue7dDyrF9sIQXVCUy1xNvAAbNP3W4VdBOtEn8Iv0JXSOGg2VkYo9tD3u94nr5phNz+wPFoPhh72CzBD0GNKizFdmJNF+SzdUSizqEymJlYH8sa89kwC4uuPOhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VI7bf9md; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VI7bf9md"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710121696; x=1741657696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sQwtHq9qX9T2QJqNLkll5mw+hz0L/xp+kgABzjubwUo=;
  b=VI7bf9mdpSWcU09kTjXNcToxxH1v0ldbTfHXS1mOaaqdmlB3A/e+QlXc
   M/UEpKPoOTHASgdaxszPRJOjiOa/CrxpHxIDi3NeOLnhxaBTn80N8GpGd
   RgMUSRXiMFux+fBn3Oel+NkQLtrTIGMSeICZIn85Z1hAh0q2sWEhhysz0
   RytgG4CbkLx2FJB5NrTekTZe/T5LP6tjxxasCxtIaX9zWnH3S10bNzrqe
   YqfrmJVdzkZIPRHW99fSB2HTdH01cI3N5oSgrdtrX4fnKTd2qdH4xr0By
   SQRAB0FBsUVQsO2Q0mMqHlgOfRo067uMy8Y5oTwhuEuEQWXFrvfe0j4aN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4649634"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4649634"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 18:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="11419573"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Mar 2024 18:48:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjUlp-0008nP-2l;
	Mon, 11 Mar 2024 01:48:05 +0000
Date: Mon, 11 Mar 2024 09:47:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 34/57]
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c:528:5: warning: no previous
 prototype for function 'smmu_domain_finalise'
Message-ID: <202403110931.OCY6h8QP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   6ae8507d06126d72db9dad1e3c52567a3c07032d
commit: a7952d83baa4e664e9afd4c263571f9bcb95997d [34/57] ANDROID: KVM: arm64: iommu: Remove iommu from alloc_domain
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240311/202403110931.OCY6h8QP-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110931.OCY6h8QP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110931.OCY6h8QP-lkp@intel.com/

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
>> arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c:528:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
     528 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         |     ^
   arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c:528:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     528 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c:644:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
     644 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, unsigned long pgd_hva)
         |     ^
   arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c:644:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     644 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, unsigned long pgd_hva)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c:660:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
     660 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^
   arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c:660:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     660 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   8 warnings generated.


vim +/smmu_domain_finalise +528 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c

   527	
 > 528	int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
   529	{
   530		int ret;
   531		struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
   532		struct hyp_arm_smmu_v3_device *smmu = to_smmu(smmu_domain->iommu);
   533	
   534		domain->pgtable = kvm_arm_io_pgtable_alloc(&smmu->pgtable_cfg,
   535							   smmu_domain->pgd, domain, &ret);
   536	
   537		return ret;
   538	}
   539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
