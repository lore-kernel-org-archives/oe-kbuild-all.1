Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523342901
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 08:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712392110; cv=none; b=ovTZjL3H2fartB+O8UhqkD4MlsHKBJNg5BcaKy6QEixSmOPplI4bY+FhKbXNOll81j5jpO0EAaL4p1/hqYeOOcLA1uRZcQI8pjqrTaJR9O1HyYfmEKmyeoUHu9PcpaM3fw9TTwICuTNzzXEDLi6bPN7Vlf/hKYFWIz5EbWRYAao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712392110; c=relaxed/simple;
	bh=ItRxAFfPxlH0UMmZRDG6ClN/Q4Xdil0kxxt/hloAS8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OshmqTpwZ8XXjjAzgkM98+VEy/MLJFsB4ZkSu8k02kGQz+74LsPsTLJioUFuU/L6zeZQuTENUDUgeDiiCAHcYRXFTcU68VOix+TLKOt9fpTvpBjAJJmEsPbdi3wfvu/biw3CCTBlIZbLor4HRB8A4/OFUGZHx5/lO3QXEbP4I4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqBLe/Ii; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqBLe/Ii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712392108; x=1743928108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ItRxAFfPxlH0UMmZRDG6ClN/Q4Xdil0kxxt/hloAS8c=;
  b=fqBLe/IiJJDSCmQkq+QOagrcEvWN59hVW5R/zbyYb8bzrJv1QXm5PohP
   qA9JDRsEpr+39o0Ewq9zNa9mOSRHITabJw210Xq8wQEVwB7I6URwvRPnu
   s38qlcpulpACmWPi/gEAYOWan7Wku4OBywuYVV6iqef9iIhmA1SFGJGBC
   LxqrrlQ1RD4XZW10V0pWz9W4rpwJt5UAT9MSBextND2w05j8AMl+eiG0k
   moPeiX34Ad06Uv1sieOn+HQ+LwOLOoVz4haxbknD2Dq8F4D8N49Ja6d8a
   L+vMGsPGpOTMM3D8NxJjpGpe2/dx1/y7NmtlnpedTz1QX0tjePPy0g3VR
   A==;
X-CSE-ConnectionGUID: TlHKmgeaQ1SCFJQ5wVdS8A==
X-CSE-MsgGUID: 0RywtLWOTb6M0ALuwpGf8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="33128683"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="33128683"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 01:28:28 -0700
X-CSE-ConnectionGUID: +i2slVX1QZangTXn7ClK7g==
X-CSE-MsgGUID: epA6+lq4Thqxf+h/QTo2hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="24140065"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Apr 2024 01:28:27 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rt1PU-0003Ho-0P;
	Sat, 06 Apr 2024 08:28:24 +0000
Date: Sat, 6 Apr 2024 16:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 9647/9933]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:338:17: error: no member named 'end'
 in 'struct iommu_iotlb_gather'
Message-ID: <202404061607.8MgWXryY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c3cf00be30d8b60731ea497f4e9e69513b63859e
commit: c220ef36a11e4fe05cc1e583f8e24d2a61541a87 [9647/9933] ANDROID: KVM: arm64: iommu: support iommu_iotlb_gather
config: arm64-randconfig-r063-20240406 (https://download.01.org/0day-ci/archive/20240406/202404061607.8MgWXryY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061607.8MgWXryY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061607.8MgWXryY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:8:
   In file included from arch/arm64/include/asm/kvm_hyp.h:11:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2180:
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
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:85:5: warning: no previous prototype for function 'kvm_iommu_refill' [-Wmissing-prototypes]
      85 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         |     ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      85 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:90:6: warning: no previous prototype for function 'kvm_iommu_reclaim' [-Wmissing-prototypes]
      90 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         |      ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:90:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      90 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:95:5: warning: no previous prototype for function 'kvm_iommu_reclaimable' [-Wmissing-prototypes]
      95 | int kvm_iommu_reclaimable(void)
         |     ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | int kvm_iommu_reclaimable(void)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:338:17: error: no member named 'end' in 'struct iommu_iotlb_gather'
     338 |         return gather->end != 0 &&
         |                ~~~~~~  ^
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:339:22: error: no member named 'start' in 'struct iommu_iotlb_gather'
     339 |                 (end + 1 < gather->start || start > gather->end + 1);
         |                            ~~~~~~  ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:339:47: error: no member named 'end' in 'struct iommu_iotlb_gather'
     339 |                 (end + 1 < gather->start || start > gather->end + 1);
         |                                                     ~~~~~~  ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:347:14: error: no member named 'start' in 'struct iommu_iotlb_gather'
     347 |         if (gather->start > iova)
         |             ~~~~~~  ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:348:11: error: no member named 'start' in 'struct iommu_iotlb_gather'
     348 |                 gather->start = iova;
         |                 ~~~~~~  ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:349:14: error: no member named 'end' in 'struct iommu_iotlb_gather'
     349 |         if (gather->end < end)
         |             ~~~~~~  ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:350:11: error: no member named 'end' in 'struct iommu_iotlb_gather'
     350 |                 gather->end = end;
         |                 ~~~~~~  ^
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:358:15: error: no member named 'pgsize' in 'struct iommu_iotlb_gather'
     358 |         if ((gather->pgsize && gather->pgsize != size) ||
         |              ~~~~~~  ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:358:33: error: no member named 'pgsize' in 'struct iommu_iotlb_gather'
     358 |         if ((gather->pgsize && gather->pgsize != size) ||
         |                                ~~~~~~  ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:362:10: error: no member named 'pgsize' in 'struct iommu_iotlb_gather'
     362 |         gather->pgsize = size;
         |         ~~~~~~  ^
   8 warnings and 10 errors generated.


vim +338 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

   332	
   333	static bool kvm_iommu_iotlb_gather_is_disjoint(struct iommu_iotlb_gather *gather,
   334						       unsigned long iova, size_t size)
   335	{
   336		unsigned long start = iova, end = start + size - 1;
   337	
 > 338		return gather->end != 0 &&
 > 339			(end + 1 < gather->start || start > gather->end + 1);
   340	}
   341	
   342	static inline void kvm_iommu_iotlb_gather_add_range(struct iommu_iotlb_gather *gather,
   343							    unsigned long iova, size_t size)
   344	{
   345		unsigned long end = iova + size - 1;
   346	
   347		if (gather->start > iova)
   348			gather->start = iova;
   349		if (gather->end < end)
   350			gather->end = end;
   351	}
   352	
   353	void kvm_iommu_iotlb_gather_add_page(void *cookie,
   354					     struct iommu_iotlb_gather *gather,
   355					     unsigned long iova,
   356					     size_t size)
   357	{
 > 358		if ((gather->pgsize && gather->pgsize != size) ||
   359		    kvm_iommu_iotlb_gather_is_disjoint(gather, iova, size))
   360			kvm_iommu_iotlb_sync(cookie, gather);
   361	
   362		gather->pgsize = size;
   363		kvm_iommu_iotlb_gather_add_range(gather, iova, size);
   364	}
   365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
