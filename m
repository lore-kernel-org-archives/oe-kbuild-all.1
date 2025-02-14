Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA16CB640
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 00:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739491971; cv=none; b=gssJUHqCtIkoWuInISfF17fhDP6iqVoN+ZocO2XEvLPVmOXhIc+50MGPPo6/9XnCI4pFwSfNWhkaXPFQ5A6yNUuWusZb8i3cfUMGRIiHIFkGo0TI84XdMBrWmJ4KpttoPQCneODtc7pthUboGo4bs6vyUQvoMv7AiMJ2zWyxUdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739491971; c=relaxed/simple;
	bh=WczRE9PDcWNUA2PnrD6OSdFBxyxWEOnm6f3GSc7xWKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nKNdEIcqdBAi793czfTXzc05l6kwXpLJv/rLbLaqKiJJ8B0mmAe69JF/U+ct5DJZJ9Xqmvg6lxZEWDkNhU0uIocVr26HRnrXpNVROAtmd6TwidtXhmJoIIeYRWo50R83YTgxz0FveIjtSthI4F1h3XqKhhVfIoigIe+AlKfJgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNVi0aYN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNVi0aYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739491969; x=1771027969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WczRE9PDcWNUA2PnrD6OSdFBxyxWEOnm6f3GSc7xWKg=;
  b=ZNVi0aYNXIme27KBkuz2ntWi8QQq9IIbXM2pw3mQakt/aPguvBeNfY98
   LlJJknchfFyf8CZoAwHiXFebo90d6Q3cA2RqfX2zy43OqSmEPSYgGXcfO
   7Dyg003J6KTGODBbANmOpeVgxcBWGo35/Ufsbp45aA8nqg2aA9Rp0yF3Q
   ivugclW3OQspAuny3QV8Gb54wMyZ4ow6TtN57gU0NQVTP/nV9DR6RRLGj
   966GxKAYD4/MyCXonyGuDVjtU/uyddDX+uhifbCGJuqIo42+/S2w80E6p
   9YUeAE2akeS5pCAIhmrvjgeMXObg+Whi5wEDTK1JoXDepEpdrCpLazm38
   g==;
X-CSE-ConnectionGUID: tshen9mDQnGCQxbP1lsuOA==
X-CSE-MsgGUID: HnISipS9S2KpEn3ExDDwAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51625590"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="51625590"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 16:12:48 -0800
X-CSE-ConnectionGUID: mvD82RnhRpWLxg/gdDZcjA==
X-CSE-MsgGUID: r6p3hr3kT56Rt31IeS7+Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117430631"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2025 16:12:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tijK1-0018r9-0Z;
	Fri, 14 Feb 2025 00:12:45 +0000
Date: Fri, 14 Feb 2025 08:11:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/iommu/iommu-pages.h:32:47: error: 'NR_IOMMU_PAGES' undeclared
Message-ID: <202502140842.Lw9qQEWc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   d1e655e4e5742c4dedc4d270d9bb6d5f0266cc1b
commit: 4cf63363a7649b5def11b6d6e40c08650981ae53 [1/1] Merge tag 'v6.10-rc1' into android-mainline
config: arm64-randconfig-004-20250214 (https://download.01.org/0day-ci/archive/20250214/202502140842.Lw9qQEWc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502140842.Lw9qQEWc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502140842.Lw9qQEWc-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


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
