Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4021B80C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710503110; cv=none; b=fL2ioEv+r4K2hL6eojl+XoOMBBO8fQce+O0c+AtCJaNOaVNnhx80tFIduLjwePL1d7dol3PG5tvXkO8Y5VPU8/5IVqqqyD4q7FGE9Qz0uX5K9Pmh484l4W8TYpYDPVyT6o3LlZ4MTccVIq12PgTJHbrnBt5weNSqvUOXh4vrxHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710503110; c=relaxed/simple;
	bh=9xb7TF+ST6DkZsUGguQTpaqLK30buDGObGRiojxTRSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L79UUSaCL0BZUUEKPZR7IArWIGAVx7Ikiym579cseLqGAbqAnPC1s0/Vc4wiayrwIbLquCBSf9glAMlXJpWg6mREMpkXBOQULKs+VToFJRjAkS5du/c612JjCVRFfsxgQl5qxfEBDpO24HmyoF5W4I2JWVywPHtsyiubzSusXZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMteY3/t; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMteY3/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710503108; x=1742039108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9xb7TF+ST6DkZsUGguQTpaqLK30buDGObGRiojxTRSE=;
  b=YMteY3/tJOBxgw7+pCR9Sfqr13gkThvOlFWJZHOaWkDXiLpdYrg9HiKY
   MAOBzghBiaFJ1ho0t5t0xMoplCagjdOWcdUIEDo0O6/F5quibGtrvy75W
   09AjTdJ1WGjzQrSxwJqv8ttnaSot/4VID1/ziWJ2PiVgLtuvsK1tJKlAE
   6xC7+Z3WalqwJtKf9aLcue+QqT3a5JaX1KQjloMp3+wRJphPA7WNFOUrL
   jJKdtYSUTlXSC0nMaznfS6rVwVWq0hJNXWJD3zFS0t+lTH1uGtgKUVXJ0
   gHebg8Os5V41O1XdQ1njgbjOmqZLVcWcFivjw5g5WlXbWcKs2OnpXbEVJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22886808"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="22886808"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 04:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="17260324"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2024 04:45:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl5zk-000EOb-1z;
	Fri, 15 Mar 2024 11:45:04 +0000
Date: Fri, 15 Mar 2024 19:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 52/57]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:606:5: warning: no previous
 prototype for function 'kvm_arm_smmu_suspend'
Message-ID: <202403151944.B4TKaW4g-lkp@intel.com>
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
commit: f6b7f1d8d57db14d0bdca42b6065ca957b6bba48 [52/57] ANDROID: iommu/arm-smmu-v3-kvm: Use HOST_HVC PD if possible
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240315/202403151944.B4TKaW4g-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151944.B4TKaW4g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151944.B4TKaW4g-lkp@intel.com/

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
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:197:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     197 |         int ret;
         |             ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:606:5: warning: no previous prototype for function 'kvm_arm_smmu_suspend' [-Wmissing-prototypes]
     606 | int kvm_arm_smmu_suspend(struct device *dev)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:606:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     606 | int kvm_arm_smmu_suspend(struct device *dev)
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:616:5: warning: no previous prototype for function 'kvm_arm_smmu_resume' [-Wmissing-prototypes]
     616 | int kvm_arm_smmu_resume(struct device *dev)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:616:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     616 | int kvm_arm_smmu_resume(struct device *dev)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:722:15: warning: no previous prototype for function 'kvm_arm_smmu_v3_id' [-Wmissing-prototypes]
     722 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         |               ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:722:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     722 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         | ^
         | static 
   9 warnings generated.


vim +/kvm_arm_smmu_suspend +606 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

   605	
 > 606	int kvm_arm_smmu_suspend(struct device *dev)
   607	{
   608		struct arm_smmu_device *smmu = dev_get_drvdata(dev);
   609		struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
   610	
   611		if (host_smmu->hvc_pd)
   612			return pkvm_iommu_suspend(dev);
   613		return 0;
   614	}
   615	
 > 616	int kvm_arm_smmu_resume(struct device *dev)
   617	{
   618		struct arm_smmu_device *smmu = dev_get_drvdata(dev);
   619		struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
   620	
   621		if (host_smmu->hvc_pd)
   622			return pkvm_iommu_resume(dev);
   623		return 0;
   624	}
   625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
