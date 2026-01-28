Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B154286418
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 05:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769576902; cv=none; b=A5e2C2jNbCKNKQAfblQ2sMjglBk8budD8tVojW0GrnRShMjDK+8NNaxX2h7MiqQYvrEEcu5dE/ISIcqInkjGMgGmddffLkwmz4Cz/sNctXv6kSGI1jfXiCWR2B5qTugoYQ9gDvOOxahDTYMnn5z1UWM4X6zmXbl7gTUy5Qcmbrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769576902; c=relaxed/simple;
	bh=km7Tg+IB8G6Qj5wWJUV3VP+Ze2+10s7MuifK2fnsL5o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tx8AoaKzb+NU4wvF4WBcy0bFecn7piquXMjye/l1md42bCEfGNNePVp4YvP7bDnXqyxKo/PKubQjlUnziQQS+nWMEKQTPeLhv95PyMIAT06cmwkxOt7OohTYIPwlHJVTx+LvIbJtW+RHr6Wn8/ozilBGbXP4KuY6HKGsmiimyok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3jUJddz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3jUJddz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769576899; x=1801112899;
  h=date:from:to:cc:subject:message-id;
  bh=km7Tg+IB8G6Qj5wWJUV3VP+Ze2+10s7MuifK2fnsL5o=;
  b=H3jUJddzT3i2Vfy2lIILUJx9x04d6awkWNgfb9nyjGAL8TIJC/3wH2S5
   W8ZbRc9qVQE6yi+rk2Nwkq4gDihFzb89xXMSpI1+Df3kxuhyIJrsNW+dl
   dBH1eQUrKIlzw5T3wim/ABMSYP4L+qhX9LNxSAFe9CcrTGy8JdCQdGDQ+
   vtG5drT57CJnCXb5EAO8Vtkr2RqqjWPN/B4xw90K7G5tm+cXCgILao6kK
   zua3TAMWcbDt5YPM7ybRptKP6oJzTGyPuDgGLeg4vizAwqooZsNb5FTR8
   6awLcy0fx3HXVtbZUQz3xEfd2shExlDUWdblb62BsAGBY1D7GYTpODHfP
   g==;
X-CSE-ConnectionGUID: rw8N7Y2WTj6xS1qzrU2H8w==
X-CSE-MsgGUID: y7l2xF0mTFmzWMWqtAyHeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="73376498"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="73376498"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 21:08:18 -0800
X-CSE-ConnectionGUID: kecpGV4WRPWUvmXpBD9eJw==
X-CSE-MsgGUID: Mw/iKteYTr6gpiMlTDwUFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208239193"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jan 2026 21:08:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkxmo-00000000ZJs-1kwB;
	Wed, 28 Jan 2026 05:08:14 +0000
Date: Wed, 28 Jan 2026 13:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 1/1]
 drivers/iommu/iommu-pages.h:32:47: error: 'NR_IOMMU_PAGES' undeclared
Message-ID: <202601281248.kEn0Fube-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   46c82cca3818ea70efcbe62840729ef313c95635
commit: 4cf63363a7649b5def11b6d6e40c08650981ae53 [1/1] Merge tag 'v6.10-rc1' into android-mainline
config: arm64-randconfig-r122-20260127 (https://download.01.org/0day-ci/archive/20260128/202601281248.kEn0Fube-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281248.kEn0Fube-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281248.kEn0Fube-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


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
