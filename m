Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71AC621
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 22:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710456953; cv=none; b=A3SjX0XiAuX3ZXXxixocmF5euJvR0z9qde2vwOMG+cHSAKfyhfL7p/PteVJJzT4IiND9aauKtC+DO9vgx1XPdrbXMzruDncLrYVnRbFDkemuAv7LygPIcwJ8fhQVmpMthKOk6O0h/cQeFlG1/uTRvKXssMG7t49qiYaUeopWMfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710456953; c=relaxed/simple;
	bh=R1vCGDWOZJnnK0ubK8otqmpCadIwpla9G9iwT5L8Iwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZSPebR5niLEU1MrCGRoJfyNzyobP7ZuTaq74HW0wD1kk9Rv1chR4dZd/qFxt2yxfJ4qEdiQ9mZ3mz4mUwpsPI/2DixcOatqR/5ynxrJuCGRN1RTUmT8inw3uY+2D47WIwiyP7+Q5GifEplCV9DgE/NTgu4qQxqdmH1xxP74Pgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qa+ZEf7O; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qa+ZEf7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710456951; x=1741992951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R1vCGDWOZJnnK0ubK8otqmpCadIwpla9G9iwT5L8Iwk=;
  b=Qa+ZEf7Omd1llygE5tT4JELcIFqgbQkAjxb1IisLGtVyCt80kIRRJcRk
   /Xp0RoBWU5KhIm/MPMKZ2rpv/wuFAt4uQK3tKAaxnXLn08C45ALGNfjnE
   dewrPhc7ll+PrqrJVimjGbtalA4Wkeqakdv+GA0vVdOsE8lpxfvYjhL1v
   BmA5Lbt796xkJhcF9LFHvIAavGEuT64jpNLfmAGK1tLRN+v37TU8eB4eP
   S/QEm1cUFmMXnl55QgQORKa739cCp1P+qoT6sIUPE79qVMrDWQNYNkCED
   h81+x+nKZRytSISLWAAgfuUlOvGimSrrSHQ/1TihNDlenyG5SUI9c0wgY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5437795"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5437795"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 15:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="43489650"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Mar 2024 15:55:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rktzE-000DrX-0x;
	Thu, 14 Mar 2024 22:55:44 +0000
Date: Fri, 15 Mar 2024 06:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 51/57] arch/arm64/kvm/iommu.c:63:15:
 warning: no previous prototype for function 'kvm_get_iommu_id'
Message-ID: <202403150615.zkaIrs1B-lkp@intel.com>
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
commit: 5bd3e9df88b8f755a3300c68fbad1b7facdaef86 [51/57] ANDROID: KVM: arm64: iommu: Add kernel wrapper for HOST_HVC PD
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240315/202403150615.zkaIrs1B-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403150615.zkaIrs1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403150615.zkaIrs1B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/iommu.c:7:
   In file included from arch/arm64/include/asm/kvm_mmu.h:116:
   In file included from arch/arm64/include/asm/pgalloc.h:13:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
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
>> arch/arm64/kvm/iommu.c:63:15: warning: no previous prototype for function 'kvm_get_iommu_id' [-Wmissing-prototypes]
      63 | pkvm_handle_t kvm_get_iommu_id(struct device *dev)
         |               ^
   arch/arm64/kvm/iommu.c:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      63 | pkvm_handle_t kvm_get_iommu_id(struct device *dev)
         | ^
         | static 
   6 warnings generated.
--
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
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:195:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     195 |         int ret;
         |             ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:671:15: warning: no previous prototype for function 'kvm_arm_smmu_v3_id' [-Wmissing-prototypes]
     671 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         |               ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:671:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     671 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         | ^
         | static 
   7 warnings generated.


vim +/kvm_get_iommu_id +63 arch/arm64/kvm/iommu.c

    62	
  > 63	pkvm_handle_t kvm_get_iommu_id(struct device *dev)
    64	{
    65		return iommu_driver->get_iommu_id(dev);
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
