Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340988;
	b=F1oGyWMD7fGqgACFaHNcgEGjs8GtKYeIHkYwfsA92ddmrBBrddZHTq2AAhBKyeuBDmRC
	 wXX5fSakrWWHqfgNR/NUbbPLyLZWsGZR+8a/Hd+LXckTgIDyHZwabKywi8Qm+S/EnJbNJ
	 wYBiO19rv75qWESQLJ2+bV/kGGwoKh3XRZRyiQFrt6JOuehhXd/HWZnXaPVXmP44/kD59
	 8hMnQkFq67NtEUGzBbuKeARRy+u+LjlfSSgJdFghCNtI8PxBJcqDrjJLklSn99gEzNLUq
	 TH1tMEeo8GeKHRIFeoyflxJNTD1ULL2Q0ScjqK7vxotxWCWQ5LtPJ6F1qOFolWEA1RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340988;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6z2e7RDUtvq+OPj8atSdg3kp0Yf5aM9inbbCFhR+6OM=;
	b=tX7vEupKamfaIW3J8lTLos/GMkGvfsxbYtTVeMXGVYclByssaaU42dAZJ6FHyzpkUT6f
	 70TdUuwIgMojnFgbwWkc1v0YXpjQTo6tVmwjCvHBcXoMth2li2sK+ZqpMiKBv6HsAC86f
	 65DJS+tntMM/vjAUU83SncaPGvFKmKVBYe5e1idfXXpex6mLTAx/dXTTSJevIj4LkmcUw
	 Xcul2fzeOE3bS8F6iv3HWa/AAe7GPDWQmnk+kMeQgJJA/FT8po7uXeOUvDIzA8sVgKoD8
	 6wDYkruSa8VtOEDLhO+pS9GNOyzMckcMKzJbTFRxO1sPZzCoUHHxlnS/xRDkELBKPeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KzGBgrCY;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2476E606A325
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 06:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2476E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KzGBgrCY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793340987; x=1824876987;
  h=date:from:to:cc:subject:message-id;
  bh=8p+XAkYDGvYa5zco4aRQHxLhsYAmzYlqFJJ98OleFvk=;
  b=KzGBgrCYZ9NKvk7LcOQREr+2ZAB5ixfFzojWnTvCqLvkuhyT2iyh2Dx4
   QsJGgJV1+vcnEA/g/6U5DMp/+zWpOnE5dXJBMZlzqNYvBjxBrFPSB+mqY
   owYyQKNskZiA7azxUq4IvkGbnQROD0nhLCvh+Yh/ZwUwV0uGbRU0UglyD
   S6lbNU/pvNlr/q47JkDGJx2mUj3JyP+yrbiX3aMUecDD1C5PL5ooH+sWF
   4cd9u1iWduKE4YDo4QBFzyPcEdGlej/rDfULwXhFxPt7s4nvX8Yz6udBb
   X1Dkch9rnILGBJ1mtrPWVAEOlowH255GOlwAv4cV8WfidruyXhDsPBUEK
   Q==;
X-CSE-ConnectionGUID: 62Cva6ojRd+2DhIHjN0Rkw==
X-CSE-MsgGUID: IJUkAcZYSPmmR5P5nKRhqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2123864"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2123864"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 23:16:26 -0700
X-CSE-ConnectionGUID: BEAuwTruS4+SotB2VWsWYg==
X-CSE-MsgGUID: Z1NKiJTlSWKAIzQQ0ba14w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5233462"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 Oct 2026 23:16:25 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMfuZ-000000005Vb-14Gf;
	Fri, 30 Oct 2026 06:16:23 +0000
Date: Fri, 30 Oct 2026 07:16:15 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-p3s 1/1]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:322:9: error: implicit declaration of
 function '_iommu_iotlb_add_page'; did you mean 'iommu_iotlb_gather_add_page'?
Message-ID: <202610300753.NDLI2Tec-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-p3s
head:   19f89117d8d335493422e7d44b06d1cd97f0279a
commit: 561f9e328538b6f1abb7b17faae3db6505172925 [1/1] BACKPORT: FROMLIST: KVM: arm64: iommu: support iommu_iotlb_gather
config: arm64-randconfig-r2108-20261030 (https://download.01.org/0day-ci/archive/20261030/202610300753.NDLI2Tec-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300753.NDLI2Tec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300753.NDLI2Tec-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c: In function 'kvm_iommu_iotlb_gather_add_page':
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:322:9: error: implicit declaration of function '_iommu_iotlb_add_page'; did you mean 'iommu_iotlb_gather_add_page'? [-Werror=implicit-function-declaration]
     322 |         _iommu_iotlb_add_page(domain, gather, iova, size, kvm_iommu_iotlb_sync);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         iommu_iotlb_gather_add_page
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]


vim +322 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

   316	
   317	void kvm_iommu_iotlb_gather_add_page(struct kvm_hyp_iommu_domain *domain,
   318					     struct iommu_iotlb_gather *gather,
   319					     unsigned long iova,
   320					     size_t size)
   321	{
 > 322		_iommu_iotlb_add_page(domain, gather, iova, size, kvm_iommu_iotlb_sync);
   323	}
   324	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
