Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD25017E9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 00:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710549752; cv=none; b=p1aA3lYfLesmv2jYN+PdyGPtoCcUm12H+LnfDz5tlqOadZ47hfAJQI4a/YR0R9VABXyPK2CVok6SeYyPPHXkPGFLCfmW8prDxpHo4lTvm4L1a0eGJiyb3FKFl8pn2CPNMS/BvXHD3d/U/l+oKPJB37RVZmySEudCOIZp7y+p0Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710549752; c=relaxed/simple;
	bh=GjyxF3T5EplX1LLy8JshMMZBSPuYTMTO2kec6mzJgVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VgjZjdVfJobhU/oCo2Qg5F7OF4zRqARXZDt9v86JdcZIJFW7JRfw4OEN1O210ZZtUoETDLK7Da506Fi5NWGztvzh9E/dUUQbr4pkS6V35NA8Yq7hWGS8LQPqO1oyAiA7TNHZogzhVGh2j5FWneoUgj0ltkkwJzadf/1dbpWjn1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lj2i2/Ed; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lj2i2/Ed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710549749; x=1742085749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GjyxF3T5EplX1LLy8JshMMZBSPuYTMTO2kec6mzJgVM=;
  b=lj2i2/EdDrB1hnP89ug8Opv3QgD1dT2rp3u5Ga9ZIpmjvmKBIJX6Zlvi
   5nld7u8NVraqUB3RKZEYJl4/PycujLYT5iId86CanDO9eMb2+HyFqbSw2
   dZz6XxGqx6iLK5H80CevaYr1mKjocdolQV6e45y7OT0bBcWm+qraxKGU6
   aK6sXAsoMBOOfW/JnTO+cACGCjUWKimfzV/Ya3PS1oHsuBdYrrN6co9Cl
   Zb5Cz7/kyaPIDuN7dnAUwrL1TGNJ23eWAwG7kf+LgRRcrfyL1lhzTmw1s
   jSKnUV+U79CMNbCG8drYJYS7j9GVRVZMgznLWJb6FksCBSCBnaXqhItzo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5570829"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5570829"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 17:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="43897562"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Mar 2024 17:42:27 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlI80-000Evh-2B;
	Sat, 16 Mar 2024 00:42:24 +0000
Date: Sat, 16 Mar 2024 08:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 53/57]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:713:5: warning: no previous
 prototype for function 'smmu_put_device'
Message-ID: <202403160842.X7XQxgyl-lkp@intel.com>
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
commit: d379ed5fd540e2a2c4784828504eafbb1829d906 [53/57] BACKPORT: FROMLIST: iommu/arm-smmu-v3-kvm: Enable runtime PM
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240316/202403160842.X7XQxgyl-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160842.X7XQxgyl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160842.X7XQxgyl-lkp@intel.com/

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
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:210:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     210 |         int ret;
         |             ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:645:5: warning: no previous prototype for function 'kvm_arm_smmu_suspend' [-Wmissing-prototypes]
     645 | int kvm_arm_smmu_suspend(struct device *dev)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:645:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     645 | int kvm_arm_smmu_suspend(struct device *dev)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:655:5: warning: no previous prototype for function 'kvm_arm_smmu_resume' [-Wmissing-prototypes]
     655 | int kvm_arm_smmu_resume(struct device *dev)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:655:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     655 | int kvm_arm_smmu_resume(struct device *dev)
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:713:5: warning: no previous prototype for function 'smmu_put_device' [-Wmissing-prototypes]
     713 | int smmu_put_device(struct device *dev, void *data)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:713:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     713 | int smmu_put_device(struct device *dev, void *data)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:770:15: warning: no previous prototype for function 'kvm_arm_smmu_v3_id' [-Wmissing-prototypes]
     770 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         |               ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:770:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     770 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         | ^
         | static 
   10 warnings generated.


vim +/smmu_put_device +713 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

   712	
 > 713	int smmu_put_device(struct device *dev, void *data)
   714	{
   715		pm_runtime_put_noidle(dev);
   716		return 0;
   717	}
   718	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
