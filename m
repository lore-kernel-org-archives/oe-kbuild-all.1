Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5481B4AEE1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 19:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710357485; cv=none; b=PKesWSmk49Ktkjdi3CPX6RwtViIm051GqPV0GL5Mgj6/QacaR5zTjrgYaMRZDmtlcZhNtt6eizVFHI74omdhQHxvVc2tLfh6fDRAlcZNKkR8afRV/Yx/8pXHCZxyA4rGGW7c9i5VasxlkxEzUnFeWEpAXKaBNn9eZjYj5HTMlnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710357485; c=relaxed/simple;
	bh=of0gQE5D5KDM3WpPfLRfOtBsrvIkKuFNrc5q1YUhht4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ntcCDmN6DhXEKM00wStK6Dne32IA9GPyqra7H3t9i9jzFI7pttk1QtQQl56mzH0o3NDvBnNXk0QybPCOJjy/0X1L9ELmYATqJkogXlrzQScPlXeQs9V8sdnEGmPNWpj5iRz1swoDdJqhhQNV8c+F0bPWUJQyBFwgsYB0QZpATEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyGBGJ5t; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyGBGJ5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710357483; x=1741893483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=of0gQE5D5KDM3WpPfLRfOtBsrvIkKuFNrc5q1YUhht4=;
  b=QyGBGJ5tSTqLQi0+B8vVaSZH0Wa9EXEtJY3EX7ZZQbMCugBF5/64LsGA
   rWm3tzjRh7aPrwGpDLkw6c6u54GKjECglX5aL6O3M3m3SwKMY3vgahweV
   X99qCCXNo+DJT1sf+//tuZPD7/NowVD2F0+x7Dd+ggu+PXRj3QmuIjFVi
   IB/ustLuUaukud7m8qp6cBJNSbqTR/JvL67iU0YcweRz52wdnmrFErhuN
   K0bpnNVXuhW6E5VWJH3G9XTGK7rlztQYEbOXI3IUIU3s6zE0EPvL+rBVe
   PPYymJ5IWu1+qQ2mAKK+LyM1xmYgd28MSNEFXkQ/iaj3sYb84g6wtOKs4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15703083"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="15703083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 12:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="11920106"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Mar 2024 12:18:01 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkU6x-000ChH-14;
	Wed, 13 Mar 2024 19:17:59 +0000
Date: Thu, 14 Mar 2024 03:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 43/57]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:55:5: warning: no previous prototype
 for function 'kvm_iommu_refill'
Message-ID: <202403140318.dk2qmjF6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   fa975f82b9c30fd12f806958c8f8e56388f6d7eb
commit: aceff10b565a25855e8b24f3e26105db8cfeb77b [43/57] ANDROID: KVM: arm64: iommu: Use unified allocator interface
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240314/202403140318.dk2qmjF6-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140318.dk2qmjF6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140318.dk2qmjF6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:8:
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
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:55:5: warning: no previous prototype for function 'kvm_iommu_refill' [-Wmissing-prototypes]
      55 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         |     ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:55:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      55 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:60:6: warning: no previous prototype for function 'kvm_iommu_reclaim' [-Wmissing-prototypes]
      60 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         |      ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:60:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      60 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:65:5: warning: no previous prototype for function 'kvm_iommu_reclaimable' [-Wmissing-prototypes]
      65 | int kvm_iommu_reclaimable(void)
         |     ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:65:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      65 | int kvm_iommu_reclaimable(void)
         | ^
         | static 
   8 warnings generated.


vim +/kvm_iommu_refill +55 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    54	
  > 55	int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
    56	{
    57		return refill_hyp_pool(&iommu_host_pool, host_mc);
    58	}
    59	
  > 60	void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
    61	{
    62		reclaim_hyp_pool(&iommu_host_pool, host_mc, target);
    63	}
    64	
  > 65	int kvm_iommu_reclaimable(void)
    66	{
    67		return hyp_pool_free_pages(&iommu_host_pool);
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
