Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17A285CB9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871768; cv=none; b=XtVgB9WBxyG0nWLVfiiz6ua60CHfw6Hgid3Xlybqb7vqP3KWtPFSuEnHYLWzDspvlX0CrWsXn+4wFXkt0WpiKJ8YtluEeVjD7uEank+aO0Jy5Ms64xBKGX030HeONpl6wEBffLg11C/ruTAFxBtn6FTnydd75n/MemJ33ItyCfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871768; c=relaxed/simple;
	bh=v2KjCxETieDPmCRzOVYC/j19qZHo98OYfGbKdrgq7LE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V1/ytGOm53jZ51hxO+TEMxB+CXLVz4TCvAwh1oipgVtOTg8BXYX7Unn3pvR11y+dTAtJIEV5b00nyfAuuGNPgOdmA9o+ucYDMzNaKEhhy9jygV0jKwHsjqXrslOLtqyt5zzjzmS+bow+brR+uMXD+F1WwbII0wo4/NfQI5cyoEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K52WoPnh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K52WoPnh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774871766; x=1806407766;
  h=date:from:to:cc:subject:message-id;
  bh=v2KjCxETieDPmCRzOVYC/j19qZHo98OYfGbKdrgq7LE=;
  b=K52WoPnhBTJji60n12RW6M27/3/44NglM/HgstDZ5MfWi3jEpcYjCoDe
   HYLAsNhJOy0Zt/el8C+Da4UnSH6BoAzJtzKggQnRuGhvWPiCP4aDXGfLy
   h0HHo5K1n2XNIyq+KB6TtFMRFNc9udQWhc6jLdZXcTc0a4up8s04KHQ82
   HzAeFqcwD51PME6LJpfSvy9TbrGMA3GQuKYYpabZ+jTzCzpP8Y91fGvDk
   nJZRj0MSx/74dKYHGf3ueW6NdGiqMFcSIBcsThpvXqgD3wod+FNmcPn21
   SGvTcoZMU+lpVng/tjvJIGdWOMA03GAkewUMx7lvQa3dE6OGcE5VREnlF
   w==;
X-CSE-ConnectionGUID: ItxhcyANQxaAaAH2W8nhqQ==
X-CSE-MsgGUID: q57F7jg5Q3mqubDus3gnfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86552293"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86552293"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:56:05 -0700
X-CSE-ConnectionGUID: I60/rmwQSjSIONq2Nj6SMg==
X-CSE-MsgGUID: 3BOaOMsERLW5gu+AH1eD6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="225210793"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Mar 2026 04:56:04 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7BDt-0000000012h-23Lo;
	Mon, 30 Mar 2026 11:56:01 +0000
Date: Mon, 30 Mar 2026 19:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:338:22: error: 'struct
 iommu_iotlb_gather' has no member named 'end'
Message-ID: <202603301946.xRVI2dde-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5fdbbd61a3cbdca7ac1034dc16723bdbc7ece8cc
commit: c220ef36a11e4fe05cc1e583f8e24d2a61541a87 [2/2] ANDROID: KVM: arm64: iommu: support iommu_iotlb_gather
config: arm64-randconfig-r122-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301946.xRVI2dde-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301946.xRVI2dde-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301946.xRVI2dde-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:85:5: warning: no previous prototype for 'kvm_iommu_refill' [-Wmissing-prototypes]
      85 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         |     ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:90:6: warning: no previous prototype for 'kvm_iommu_reclaim' [-Wmissing-prototypes]
      90 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:95:5: warning: no previous prototype for 'kvm_iommu_reclaimable' [-Wmissing-prototypes]
      95 | int kvm_iommu_reclaimable(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c: In function 'kvm_iommu_iotlb_gather_is_disjoint':
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:338:22: error: 'struct iommu_iotlb_gather' has no member named 'end'
     338 |         return gather->end != 0 &&
         |                      ^~
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:339:34: error: 'struct iommu_iotlb_gather' has no member named 'start'
     339 |                 (end + 1 < gather->start || start > gather->end + 1);
         |                                  ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:339:59: error: 'struct iommu_iotlb_gather' has no member named 'end'
     339 |                 (end + 1 < gather->start || start > gather->end + 1);
         |                                                           ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c: In function 'kvm_iommu_iotlb_gather_add_range':
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:347:19: error: 'struct iommu_iotlb_gather' has no member named 'start'
     347 |         if (gather->start > iova)
         |                   ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:348:23: error: 'struct iommu_iotlb_gather' has no member named 'start'
     348 |                 gather->start = iova;
         |                       ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:349:19: error: 'struct iommu_iotlb_gather' has no member named 'end'
     349 |         if (gather->end < end)
         |                   ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:350:23: error: 'struct iommu_iotlb_gather' has no member named 'end'
     350 |                 gather->end = end;
         |                       ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c: In function 'kvm_iommu_iotlb_gather_add_page':
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:358:20: error: 'struct iommu_iotlb_gather' has no member named 'pgsize'
     358 |         if ((gather->pgsize && gather->pgsize != size) ||
         |                    ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:358:38: error: 'struct iommu_iotlb_gather' has no member named 'pgsize'
     358 |         if ((gather->pgsize && gather->pgsize != size) ||
         |                                      ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:362:15: error: 'struct iommu_iotlb_gather' has no member named 'pgsize'
     362 |         gather->pgsize = size;
         |               ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


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
