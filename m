Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EC31ABEA3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 18:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731349238; cv=none; b=J+TQ33Uc8kKaHgiyk3G5eGzjGRa8PHNoiEb1PjVNNDelNltH6mUQruy+kB7Xa8P8jCwCIV7t0+L3ZwbHn5Id8tR4+SDNuaRXhg4nZB6DHYS0Z6Gu4DhGKptzRJel9yJr0ocIi0ivzbFqiSO3AJArpqronqj0K0MnanxmgYXIYeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731349238; c=relaxed/simple;
	bh=Q/kz3ScP7p+Kn/J4ksN32V0Kyo/JvDMmqM6ZkTJ/QK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rCCbLP8p+vmmbyFt/0eGmDJHonn+JBBR/xTVgIWvwgD5JY975iq2QDhNeCpHcFlP85vYOHs31YuHYm06C2S2aJ+ndT4wc0oc6FKlbbHy0PuTZAy/3OpGpT2kFajElh4zdABu3EEN/hqdxuCWFmkg0ruDsWv8ihCFYanryCT+ywg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Smbh/THw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Smbh/THw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731349237; x=1762885237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q/kz3ScP7p+Kn/J4ksN32V0Kyo/JvDMmqM6ZkTJ/QK8=;
  b=Smbh/THwITm82Kb102aaT6oSAZYU9UYffvFGddHZ2+kcEB66RZ4OVqym
   weGOxB1hlt4GQoNmEbba80YRjTkLxCaWHiTvRTZOj2kTsz5SmOSOFchVM
   WDJ3O45l1ydgfd/+6Ayn3PxO+HbLpmZA8ZSU28AjPFC1nNuO96M6guUoP
   0d9pdrAx9uMETmn2gpxZ7ruq2t/LprU50qHwYhKKpUAvS0ThCdz/XNIA8
   bl1tgzahSbmcuwiBuahSSXRLKdcQmtOiBNxuDgfdDhbAHyefDI3zLudX2
   aRnB+3KbgMqXO6g6Ni6HNzZtmZhwjFspXJAPDKALHpiGTKwEt5MZSI9kP
   Q==;
X-CSE-ConnectionGUID: QrXYGFr6RkqRh3CC0rK4/A==
X-CSE-MsgGUID: u2BRnCdFSrm+xx0MJGk58A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53725091"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53725091"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 10:20:36 -0800
X-CSE-ConnectionGUID: 9v4637DzRWaqo1+Y8FQ+dg==
X-CSE-MsgGUID: 9nC1Vh8gQh2drgNMfGAwiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="117956314"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Nov 2024 10:20:35 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAZ1c-00006j-1q;
	Mon, 11 Nov 2024 18:20:32 +0000
Date: Tue, 12 Nov 2024 02:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 10091/19773]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:338:17: error: no member named 'end'
 in 'struct iommu_iotlb_gather'
Message-ID: <202411120235.GnUH2O75-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b0e595da6a08d490a69939a0e547347f3ee333ba
commit: c220ef36a11e4fe05cc1e583f8e24d2a61541a87 [10091/19773] ANDROID: KVM: arm64: iommu: support iommu_iotlb_gather
config: arm64-randconfig-004-20241111 (https://download.01.org/0day-ci/archive/20241112/202411120235.GnUH2O75-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411120235.GnUH2O75-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411120235.GnUH2O75-lkp@intel.com/

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
