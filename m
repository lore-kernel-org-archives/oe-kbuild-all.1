Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636A31DED67
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 08:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739955037; cv=none; b=Lg/C54/UKk9AX3KJ7g1Vg2b72eRRgjZCz1iHHkX8fVy+YNgQ9YvR1yxkKGBToyYZQ2tqmP2/fORQbWxoByFrw8sZWi+T1G4pN206VTeOup/2+3WJokvQZRwIalVR8crWNrMGToJCic0sTcbMSC3Li10f6biRnLaeahfl1dqdjAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739955037; c=relaxed/simple;
	bh=3WR0MNCmxFa/u+qF9NirqFQ/YSTu19kF2zt31LWVWWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sa58OtfzzN4yTZJBLVsk0A9WeWSGCRbPfBB+EH04tyla/pxbY0YAPzVDzSGKyrnvUsLny6flt4wkorTmT2lOX3oRm8AmR5mP4+1n9FN8ED+1KDa3bwrByM3LcFR7VLqftiD70aavfjMDRe1arIIK/rtHMgZUzWHZ0Hnndqjy74w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ef9FWIT1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ef9FWIT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739955031; x=1771491031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3WR0MNCmxFa/u+qF9NirqFQ/YSTu19kF2zt31LWVWWM=;
  b=ef9FWIT1FvsHdevfnQAQwgmL7drk5BhqexMN2ZsUpJd37ewCBBHE7V9M
   b7mLJH0pihMJDxzMwiQFEEHC0CIv5dunTtr6OIbmvX4m3+85LhwRVTL24
   hGkSO5XaxN6LRXRWRTz23t/d5NopsL/4rYyqSzbG2nr1gge/EXX/2EwlE
   WE72/i4A3fUZ0Pg+RGIW+asFy0At8V+mGpIizLLk+yCedCqPQAZav9Re6
   KD/VCV7MpenA7kYh0qAOhBXcWpR3UlJaVfMvL6EO/xhDmcfpA//td7X/w
   dnPQ33b7LyFfETmjW3OuRt+Gycy4GuiGJ9a+ePOQGi40ali6J0xbBbnPc
   A==;
X-CSE-ConnectionGUID: eB34cEkzQh2BUwkQA/YIsA==
X-CSE-MsgGUID: CLG9zmEkTYG1meuaBi5IrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28279430"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="28279430"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 00:50:30 -0800
X-CSE-ConnectionGUID: weahot/TS7COV94XUCEWng==
X-CSE-MsgGUID: B6cKjNjyT2OsO/DBixyvOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137900859"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Feb 2025 00:50:25 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkfmh-0001d5-0s;
	Wed, 19 Feb 2025 08:50:23 +0000
Date: Wed, 19 Feb 2025 16:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:322:2: error: call to undeclared
 function '_iommu_iotlb_add_page'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202502191650.dV1QVTUi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   df6f686ad391ff4f857a7ee9bd60c44c27ecd78c
commit: 561f9e328538b6f1abb7b17faae3db6505172925 [1/1] BACKPORT: FROMLIST: KVM: arm64: iommu: support iommu_iotlb_gather
config: arm64-randconfig-r063-20250219 (https://download.01.org/0day-ci/archive/20250219/202502191650.dV1QVTUi-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191650.dV1QVTUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191650.dV1QVTUi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:322:2: error: call to undeclared function '_iommu_iotlb_add_page'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           _iommu_iotlb_add_page(domain, gather, iova, size, kvm_iommu_iotlb_sync);
           ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]


vim +/_iommu_iotlb_add_page +322 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

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
