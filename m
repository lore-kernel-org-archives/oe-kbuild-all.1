Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FBC1917E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730213589; cv=none; b=agsiU4AkSL9FrphwJBM6KtuNVst1YCgZb17ECZZkChelmVZe5S7l6USbAQR7hXuV8EJht+Njkgbk5O2tulmdG6WfyrAag2jaIG2nO5AzrKq3eqcKqYVY0HEthqa3dwr6J/y0js0LApyhcmUuQtkD0ITP8nMvsEkO78SwJvA+gaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730213589; c=relaxed/simple;
	bh=jI8AtTVje0By9oSOIcIMaWuiIxWf8Mql973MNuekwNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uMhwe2YmZeHxrN1hqvfe01yfxRl3SeBO4rsKXpDxN61xOM/gq9v5AGKsWktAiIiFzOQ5YLmMkNMdLC9BfcfL6I1ZkOzmOnX3bCLUzSmuQKqAU1pFfJd5k/Ut1AcUyGCIYmIoATpR9ZRICayLkwJmZsfOQl23ItygCTzg4BguNR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eQ3ksuNG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eQ3ksuNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730213587; x=1761749587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jI8AtTVje0By9oSOIcIMaWuiIxWf8Mql973MNuekwNY=;
  b=eQ3ksuNG03mdEPLfQ/B5T613X3Ku6FcCd1K4xamtadpH8q5FGQ4M+3KL
   IeRVmng6Bn9cz/Pk2g++T30+4wzbeTUy2tPIEGtT+sh7N7urK933leTBT
   IMx94KbNtb1EvNvJMH8Aj5CjBYvr3XJucAGzk46IHNsDUcW1qX6UmgFGQ
   IdgeRx+LGhb11PsoYFeLbx3akN0SHKYsMVSNhFMt/F3ct8X6zcclehB9d
   wBtOEKoUbN851HqvH1D2uxZXgJzT/1T4LI10QEvP7LMA9KUsMysRK65gY
   1Tx9U+JNHTZDljphHOgmtssLy0LT1HC4bFWtyXruBC8YuI81jDlF7WfZn
   g==;
X-CSE-ConnectionGUID: GtLnccRaQVOmr0Oi4N4yvg==
X-CSE-MsgGUID: EOoODTXgS2GnZNv71SZ0wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40955940"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40955940"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 07:53:06 -0700
X-CSE-ConnectionGUID: OUvSbND1T7+s44QLez1bNA==
X-CSE-MsgGUID: YQbMuXBkTmySUf1rpNaOZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="86538724"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Oct 2024 07:53:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5nah-000dnA-1G;
	Tue, 29 Oct 2024 14:53:03 +0000
Date: Tue, 29 Oct 2024 22:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 7/68]
 include/linux/kvm_host.h:1575:6: warning: no previous prototype for function
 'kvm_arch_reclaim_device'
Message-ID: <202410292259.w785LjWY-lkp@intel.com>
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
commit: 6f86b0b0d35ef8ed8a18b9012d5c4909c90dc50f [7/68] ANDROID: KVM: Add arch function for device assignment
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241029/202410292259.w785LjWY-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410292259.w785LjWY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410292259.w785LjWY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/events/intel/core.c:17:
   In file included from include/linux/kvm_host.h:16:
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
   In file included from arch/x86/events/intel/core.c:17:
>> include/linux/kvm_host.h:1575:6: warning: no previous prototype for function 'kvm_arch_reclaim_device' [-Wmissing-prototypes]
    1575 | void kvm_arch_reclaim_device(struct device *dev)
         |      ^
   include/linux/kvm_host.h:1575:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1575 | void kvm_arch_reclaim_device(struct device *dev)
         | ^
         | static 
>> include/linux/kvm_host.h:1579:6: warning: no previous prototype for function 'kvm_arch_reclaim_group' [-Wmissing-prototypes]
    1579 | void kvm_arch_reclaim_group(struct iommu_group *group)
         |      ^
   include/linux/kvm_host.h:1579:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1579 | void kvm_arch_reclaim_group(struct iommu_group *group)
         | ^
         | static 
   7 warnings generated.


vim +/kvm_arch_reclaim_device +1575 include/linux/kvm_host.h

  1574	
> 1575	void kvm_arch_reclaim_device(struct device *dev)
  1576	{
  1577	}
  1578	
> 1579	void kvm_arch_reclaim_group(struct iommu_group *group)
  1580	{
  1581	}
  1582	#endif
  1583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
