Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561D6FC1C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Apr 2024 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713612913; cv=none; b=O14RAdT1dmh8+aOmGMLWOSgKCEiiFp2+8KirYlNQJiziwAjPIRyK3e3B98r5MZg2c4d2N9E/UuZyPLlC9C7oFA4gwUos0O7T+pdXkb5ZNpeLyDnOyD0m4uNFvGr5HSTAoHO1EzBkkDVKkB7NOZXJJ/IfSLW+0TaF6X8GhtS4YRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713612913; c=relaxed/simple;
	bh=4yXOGtDIwI60JBDsRMtFuZK93LGwI9atxePI5Tnzkug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uDwwrCSHtHavC79cYOnwtNevAe3+E9Mc/wLtg8qvu5g3pm2aPf/pb9zr57dwcvQ/J5gg9VQff8YjJ3cTYGaGLedCy+2AVXrztrfjEnR96F5fNgdTR+i4D0gxTKZXZ+/+bZtPBDFSp0TG2IsSlDEFanSYViUfHeo2h8eoNsSNEEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nk+qK0Uq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nk+qK0Uq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713612911; x=1745148911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4yXOGtDIwI60JBDsRMtFuZK93LGwI9atxePI5Tnzkug=;
  b=Nk+qK0Uq+FJ96KTlIPHr2qSZ0qxGxts2J3VJCayj/n/0TC+wWx0WiapF
   op0ozk8/8WyjEDS/MphOJWwP03wPQAW2NtZaNuC4VmqTsLtiIC7fsTaz1
   MYeMZwe0J8VprwJV4t/WZ3D7HX/DTxHTfPyjAdS0hyqkBYVebusi/2KTn
   hR2XImI5sL0PhGQt2q2HrcNZxIhRHVwqJbLJq9RITrpusTkIfLXJ74tox
   dhf8qTCPEGRdcOEbBsDIXqhMaryEZ3FmauWPUyG88sW5btftJNONS5fNs
   PhIl/hZHnDNzRioiQ3yOQe/0T2gabZvPlNFOIaBK6dSmqH1K5ItJ+POP4
   A==;
X-CSE-ConnectionGUID: LuGUnuGQS+2UiAODr9efdg==
X-CSE-MsgGUID: 1iv81/vLQpy9iSDEgGSPFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9368987"
X-IronPort-AV: E=Sophos;i="6.07,216,1708416000"; 
   d="scan'208";a="9368987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 04:35:09 -0700
X-CSE-ConnectionGUID: 4obho8FHSd2spgH3DWxOyw==
X-CSE-MsgGUID: 1YfyWps5RIWee5wjsyOnKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,216,1708416000"; 
   d="scan'208";a="28237325"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 Apr 2024 04:35:08 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ry8zq-000B1c-0Z;
	Sat, 20 Apr 2024 11:35:06 +0000
Date: Sat, 20 Apr 2024 19:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 10624/10636]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:951:5: warning: no previous
 prototype for function 'smmu_unregister_smmu'
Message-ID: <202404201957.WpONyLMB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ce08a08a3e673173c1a01945538659e3f18d9fca
commit: 3957c33199557d04f41b0be930f941bcc6b06ee6 [10624/10636] ANDROID: KVM: arm64: Cleanup fail path
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240420/202404201957.WpONyLMB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404201957.WpONyLMB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404201957.WpONyLMB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:7:
   In file included from arch/arm64/include/asm/kvm_pkvm.h:11:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2191:
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
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:256:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     256 |         int ret;
         |             ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:885:5: warning: no previous prototype for function 'kvm_arm_smmu_suspend' [-Wmissing-prototypes]
     885 | int kvm_arm_smmu_suspend(struct device *dev)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:885:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     885 | int kvm_arm_smmu_suspend(struct device *dev)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:895:5: warning: no previous prototype for function 'kvm_arm_smmu_resume' [-Wmissing-prototypes]
     895 | int kvm_arm_smmu_resume(struct device *dev)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:895:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     895 | int kvm_arm_smmu_resume(struct device *dev)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:945:5: warning: no previous prototype for function 'smmu_put_device' [-Wmissing-prototypes]
     945 | int smmu_put_device(struct device *dev, void *data)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:945:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     945 | int smmu_put_device(struct device *dev, void *data)
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:951:5: warning: no previous prototype for function 'smmu_unregister_smmu' [-Wmissing-prototypes]
     951 | int smmu_unregister_smmu(struct device *dev, void *data)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:951:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     951 | int smmu_unregister_smmu(struct device *dev, void *data)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1069:15: warning: no previous prototype for function 'kvm_arm_smmu_v3_id' [-Wmissing-prototypes]
    1069 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         |               ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1069:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1069 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         | ^
         | static 
   11 warnings generated.


vim +/smmu_unregister_smmu +951 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

   950	
 > 951	int smmu_unregister_smmu(struct device *dev, void *data)
   952	{
   953		struct arm_smmu_device *smmu = dev_get_drvdata(dev);
   954	
   955		arm_smmu_unregister_iommu(smmu);
   956		return 0;
   957	}
   958	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
