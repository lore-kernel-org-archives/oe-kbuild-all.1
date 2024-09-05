Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6C2152166
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 04:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509985; cv=none; b=B5M866IOykWrd9lTFgll/Vc8Ah7bp1d24s3MW8BOh9/sAUNfozfK8IVevcrg4sp/2kCy5mPTKRsi58vxyFDvEMkgzNqShXxC4CqrRLLBbsn+dCbSKx4rkcfiS+rzR2BlOSstEQZJLKOOZCWvo3jN2n+ypzlGiHDnYural/xycCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509985; c=relaxed/simple;
	bh=NtwU9Y350mNGwhaKGap02D3ErF0Bxco1vbj/ToJQPwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XYtTxhfLSz1l0feoumVtLdW2AdMVGr2vVaJDLQdcbt5UXm5Vi0jYGAnlyZCVP9VGERG8aMQ/kPrruwIvFRvMzWUH62VNX5WElquZnW+/tbhBGnPl6/FOujeY68g9nsw17cfzj9SMssQtmcWnfsTr3fyuIBcBxDFyf/OSrWCTYuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2YzjvOC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2YzjvOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725509983; x=1757045983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NtwU9Y350mNGwhaKGap02D3ErF0Bxco1vbj/ToJQPwk=;
  b=X2YzjvOCVyoJywguuCM1T7o3+1G/4GKVPrppe01YY9Wjn83tDgqORHD7
   9FKdihfi+oE4Ak4axRDYsHSi7tQp7WjWY2ga1gYCuZl2/YNE7fruJedvh
   qwj1k0+YPivbPDdmlzezA8NU1FG1rUZqkhDSbs0ome6sDO5AHD2I3DgTD
   qutYJtfBhLrysnQrWPwITMGFYJC0jcfWwo047O1612uuMU5rVKy33kmwu
   7z7V4mdxHhzFZcq+tNZ9vDkIict62xw2SwgyoZT8uF9BHB2yQKnQccAmP
   yXT8rbvCWpVTDIW32vcUYWNhjO5UfevNq5pGI0KSlcwarppkR3UkLGO73
   w==;
X-CSE-ConnectionGUID: H+O+dXeiQQSgR2ehrdkLMw==
X-CSE-MsgGUID: V+9fwqTkTBGZs6l5vnghzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27993458"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="27993458"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 21:19:43 -0700
X-CSE-ConnectionGUID: 4v7bP3shSbWibpNYmZQJdA==
X-CSE-MsgGUID: s6s9wVH7TIieEW1fogWS4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="65330320"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Sep 2024 21:19:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm3y7-0008vP-1q;
	Thu, 05 Sep 2024 04:19:39 +0000
Date: Thu, 5 Sep 2024 12:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/4]
 drivers/iommu/iommu-pages.h:32:47: error: 'NR_IOMMU_PAGES' undeclared
Message-ID: <202409051236.mW61E8y8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   49bf3b3e80e08693e9d79d860e69b9210134a80e
commit: 4cf63363a7649b5def11b6d6e40c08650981ae53 [1/4] Merge tag 'v6.10-rc1' into android-mainline
config: arm64-randconfig-002-20240905 (https://download.01.org/0day-ci/archive/20240905/202409051236.mW61E8y8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051236.mW61E8y8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409051236.mW61E8y8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/io-pgtable-arm.c:24:
   drivers/iommu/iommu-pages.h: In function '__iommu_alloc_account':
>> drivers/iommu/iommu-pages.h:32:47: error: 'NR_IOMMU_PAGES' undeclared (first use in this function)
      32 |         mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
         |                                               ^~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.h:32:47: note: each undeclared identifier is reported only once for each function it appears in
   drivers/iommu/iommu-pages.h: In function '__iommu_free_account':
   drivers/iommu/iommu-pages.h:45:47: error: 'NR_IOMMU_PAGES' undeclared (first use in this function)
      45 |         mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
         |                                               ^~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for INTERCONNECT_QCOM
   Depends on [n]: INTERCONNECT [=n] && ARCH_QCOM [=y]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/NR_IOMMU_PAGES +32 drivers/iommu/iommu-pages.h

06c375053cefc3 Pasha Tatashin 2024-04-13  13  
06c375053cefc3 Pasha Tatashin 2024-04-13  14  /*
06c375053cefc3 Pasha Tatashin 2024-04-13  15   * All page allocations that should be reported to as "iommu-pagetables" to
06c375053cefc3 Pasha Tatashin 2024-04-13  16   * userspace must use one of the functions below.  This includes allocations of
06c375053cefc3 Pasha Tatashin 2024-04-13  17   * page-tables and other per-iommu_domain configuration structures.
06c375053cefc3 Pasha Tatashin 2024-04-13  18   *
06c375053cefc3 Pasha Tatashin 2024-04-13  19   * This is necessary for the proper accounting as IOMMU state can be rather
06c375053cefc3 Pasha Tatashin 2024-04-13  20   * large, i.e. multiple gigabytes in size.
06c375053cefc3 Pasha Tatashin 2024-04-13  21   */
06c375053cefc3 Pasha Tatashin 2024-04-13  22  
bd3520a93a84cd Pasha Tatashin 2024-04-13  23  /**
bd3520a93a84cd Pasha Tatashin 2024-04-13  24   * __iommu_alloc_account - account for newly allocated page.
bd3520a93a84cd Pasha Tatashin 2024-04-13  25   * @page: head struct page of the page.
bd3520a93a84cd Pasha Tatashin 2024-04-13  26   * @order: order of the page
bd3520a93a84cd Pasha Tatashin 2024-04-13  27   */
bd3520a93a84cd Pasha Tatashin 2024-04-13  28  static inline void __iommu_alloc_account(struct page *page, int order)
bd3520a93a84cd Pasha Tatashin 2024-04-13  29  {
bd3520a93a84cd Pasha Tatashin 2024-04-13  30  	const long pgcnt = 1l << order;
bd3520a93a84cd Pasha Tatashin 2024-04-13  31  
bd3520a93a84cd Pasha Tatashin 2024-04-13 @32  	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
212c5c078d83d7 Pasha Tatashin 2024-04-13  33  	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, pgcnt);
bd3520a93a84cd Pasha Tatashin 2024-04-13  34  }
bd3520a93a84cd Pasha Tatashin 2024-04-13  35  

:::::: The code at line 32 was first introduced by commit
:::::: bd3520a93a84cd8c3897283e5891a9106fcf5acc iommu: observability of the IOMMU allocations

:::::: TO: Pasha Tatashin <pasha.tatashin@soleen.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
