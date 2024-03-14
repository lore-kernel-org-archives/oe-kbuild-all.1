Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DF26BFA9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710411635; cv=none; b=EhztcCJs7nN4FFiOlsh1NYg6e4ktRWnX2lt5YBYjsBALppeFZLeETHYOW/GgjHUXY4chG+6FWcayey6IkL4cWg6XePgbv20gxz37RiawAk9YvGImEbaBCNwfmZ0C7HCV7TZZfO1rgST3GJ54E7iXSFDhwL+rWs7IvYaPm7jIhTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710411635; c=relaxed/simple;
	bh=8pRa47efHY5e7zWhppQVeEvvmHW9XT1dVwHcp0609sk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yix5oMTGu9uSlz+tr/qjlJAuMcT8HAzHlsetPRh8XNT4sdOe3c90BzvXu4gm3HR4KBWnNByz9pxs5gLsoU8o6l/RFIWzL4BQ2Yk2LQTeaRGLF94wIfeYu+2VdvAqt+bLIPKCbgjVxKdrLoRSc+o1qeZiX96b0zoXRQicRT7nzF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnvucZNe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnvucZNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710411634; x=1741947634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8pRa47efHY5e7zWhppQVeEvvmHW9XT1dVwHcp0609sk=;
  b=QnvucZNeZrfCA+ft9K8aDwaQDtabpC3DrFXmLNSGLqol/HppwUCXEPGU
   HCEmfVBCi4h4jFE1Zc5LfXdy5Vf2bu5nXdt2n/eIDw89ZMoxA1S4qGJ2F
   Lp9WnYAjGCh9QGaq8Eflicw5SKtFTCyHNyA6l7RHkD1w6hjohOHXmbBVA
   wlfebb81CjhzFqqnM801vuGZAq5oeytyQPG0cYu5WMo5Atl+XzHDmWSOU
   q/mrAtP/a+4ro8OLnxb4H+SglI/rxgurnnZJ9iYHLkeEm20K176OjbS43
   I1ZEmuJQZfS2Bj7R/g60A2+3bsIu/hhATL5UH44fIECVLhoRHUlQYItGQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5343415"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5343415"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 03:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="12312952"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Mar 2024 03:18:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkiAI-000DKi-05;
	Thu, 14 Mar 2024 10:18:22 +0000
Date: Thu, 14 Mar 2024 18:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 45/57]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:195:6: warning: variable
 'ret' set but not used
Message-ID: <202403141827.XHuh1939-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   31de4c08caf04886df7ee001c8b8af82824daab6
commit: 65c39348604eb499cdd016959adb1ad6d66bb85e [45/57] ANDROID: KVM: arm64: iommu: Alloc domain memory from the pool
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240314/202403141827.XHuh1939-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141827.XHuh1939-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141827.XHuh1939-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:7:
   In file included from arch/arm64/include/asm/kvm_pkvm.h:11:
   In file included from include/linux/memblock.h:12:
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
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:195:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     195 |         int ret;
         |             ^
   6 warnings generated.


vim +/ret +195 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

603ad1e83713bb Jean-Philippe Brucker 2022-02-17  192  
603ad1e83713bb Jean-Philippe Brucker 2022-02-17  193  static void kvm_arm_smmu_domain_free(struct iommu_domain *domain)
603ad1e83713bb Jean-Philippe Brucker 2022-02-17  194  {
603ad1e83713bb Jean-Philippe Brucker 2022-02-17 @195  	int ret;
603ad1e83713bb Jean-Philippe Brucker 2022-02-17  196  	struct kvm_arm_smmu_domain *kvm_smmu_domain = to_kvm_smmu_domain(domain);
603ad1e83713bb Jean-Philippe Brucker 2022-02-17  197  	struct arm_smmu_device *smmu = kvm_smmu_domain->smmu;
603ad1e83713bb Jean-Philippe Brucker 2022-02-17  198  
603ad1e83713bb Jean-Philippe Brucker 2022-02-17  199  	if (smmu) {
87ab57a08574b7 Mostafa Saleh         2023-07-27  200  		ret = kvm_call_hyp_nvhe(__pkvm_host_iommu_free_domain, kvm_smmu_domain->id);
603ad1e83713bb Jean-Philippe Brucker 2022-02-17  201  		ida_free(&kvm_arm_smmu_domain_ida, kvm_smmu_domain->id);
603ad1e83713bb Jean-Philippe Brucker 2022-02-17  202  	}
603ad1e83713bb Jean-Philippe Brucker 2022-02-17  203  	kfree(kvm_smmu_domain);
603ad1e83713bb Jean-Philippe Brucker 2022-02-17  204  }
603ad1e83713bb Jean-Philippe Brucker 2022-02-17  205  

:::::: The code at line 195 was first introduced by commit
:::::: 603ad1e83713bbc962a5e41913284c90b487dbe3 BACKPORT: FROMLIST: iommu/arm-smmu-v3-kvm: Add IOMMU ops

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
