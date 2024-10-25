Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A9717C210
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 03:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729827103; cv=none; b=FuWctLgrGRAuY5gsG95ZKbkn2XGh4Vi5w9wpNsEB8AkfqFAxsHCeOCTqrXYyUALaXPTWUFWJNNVB/5ZfgpoBjXHHLqhji4AdK9d7feq24iSmP8uHAiLXJdH2amzXm9THiASsIV/nq7frBlStGnjWUxQBRH4P1JQI50ynUZNobAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729827103; c=relaxed/simple;
	bh=U9fJwHFEPcJh6eUI44285Pa02YwhfTnoS+eLZx3hFBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AkTDf8wJgN4XfdDx/LM331wNvuoKvLYMzA1ZBY7+XIcFc+EPsyull78iKzciI4tkK5bnF+Z5VTulUXBkQOC8b/uzaVAHeBGmpcaRvho0Q/+m8Z3TCEJzjVcff1nGyfkNw9C9RXzNuIo8j4rKdXAvYxAG0HjNTGCGZ73rDSybrZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFR9vYUU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFR9vYUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729827101; x=1761363101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U9fJwHFEPcJh6eUI44285Pa02YwhfTnoS+eLZx3hFBI=;
  b=MFR9vYUU+CyluzNivmNTmd5DNdbhm7oz2fIcCuOs05tYI6PudM6gdC8J
   pM5KSwJ6ySe0V/HTxUlV4eAXMTMV13kWeIxW34UpRs6066xSj19gzsU75
   4oc5BUqanqeHNwitVITT5xoKSHdvNgF6gXdwgDzbUIHK2+Wl8YDcIfFPP
   ueR3CvqHjJ57nrvRO+rFtMkv7oRpFId+EfxbFBIZn0vzo8z2dXtEvGJgR
   3zC6tvHVJpBWIFRlMD1NTse3efR7TcOvUg7KWaF0EcDNxFETl/IJAZKoe
   TPTj/6icz308NAqk/UYDZV5cHBZ6p0oCOH5uqlqHzYsjrQu2DMJEctP9f
   A==;
X-CSE-ConnectionGUID: p4xtUNY1SX+8k1CUGRevSQ==
X-CSE-MsgGUID: l3bayr7sTaeNyYhPVjrs0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="17116469"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="17116469"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 20:31:40 -0700
X-CSE-ConnectionGUID: 1i6qQiTaTQSmcJRFzun4kg==
X-CSE-MsgGUID: 6JHxb3y8Q0m5CPq+JgWmYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80452206"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Oct 2024 20:31:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4B33-000XXK-0U;
	Fri, 25 Oct 2024 03:31:37 +0000
Date: Fri, 25 Oct 2024 11:30:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/4]
 drivers/iommu/iommu-pages.h:32:40: error: use of undeclared identifier
 'NR_IOMMU_PAGES'
Message-ID: <202410251130.RhhDJt1B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   ee2881f331b2577bd0d275e7f713ad71147a2f77
commit: 4cf63363a7649b5def11b6d6e40c08650981ae53 [1/4] Merge tag 'v6.10-rc1' into android-mainline
config: arm64-randconfig-003-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251130.RhhDJt1B-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251130.RhhDJt1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251130.RhhDJt1B-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/io-pgtable-arm.c:14:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/iommu/io-pgtable-arm.c:24:
>> drivers/iommu/iommu-pages.h:32:40: error: use of undeclared identifier 'NR_IOMMU_PAGES'
      32 |         mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
         |                                               ^
   drivers/iommu/iommu-pages.h:45:40: error: use of undeclared identifier 'NR_IOMMU_PAGES'
      45 |         mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
         |                                               ^
   1 warning and 2 errors generated.

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
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
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
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
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

06c375053cefc3a Pasha Tatashin 2024-04-13  13  
06c375053cefc3a Pasha Tatashin 2024-04-13  14  /*
06c375053cefc3a Pasha Tatashin 2024-04-13  15   * All page allocations that should be reported to as "iommu-pagetables" to
06c375053cefc3a Pasha Tatashin 2024-04-13  16   * userspace must use one of the functions below.  This includes allocations of
06c375053cefc3a Pasha Tatashin 2024-04-13  17   * page-tables and other per-iommu_domain configuration structures.
06c375053cefc3a Pasha Tatashin 2024-04-13  18   *
06c375053cefc3a Pasha Tatashin 2024-04-13  19   * This is necessary for the proper accounting as IOMMU state can be rather
06c375053cefc3a Pasha Tatashin 2024-04-13  20   * large, i.e. multiple gigabytes in size.
06c375053cefc3a Pasha Tatashin 2024-04-13  21   */
06c375053cefc3a Pasha Tatashin 2024-04-13  22  
bd3520a93a84cd8 Pasha Tatashin 2024-04-13  23  /**
bd3520a93a84cd8 Pasha Tatashin 2024-04-13  24   * __iommu_alloc_account - account for newly allocated page.
bd3520a93a84cd8 Pasha Tatashin 2024-04-13  25   * @page: head struct page of the page.
bd3520a93a84cd8 Pasha Tatashin 2024-04-13  26   * @order: order of the page
bd3520a93a84cd8 Pasha Tatashin 2024-04-13  27   */
bd3520a93a84cd8 Pasha Tatashin 2024-04-13  28  static inline void __iommu_alloc_account(struct page *page, int order)
bd3520a93a84cd8 Pasha Tatashin 2024-04-13  29  {
bd3520a93a84cd8 Pasha Tatashin 2024-04-13  30  	const long pgcnt = 1l << order;
bd3520a93a84cd8 Pasha Tatashin 2024-04-13  31  
bd3520a93a84cd8 Pasha Tatashin 2024-04-13 @32  	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
212c5c078d83d78 Pasha Tatashin 2024-04-13  33  	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, pgcnt);
bd3520a93a84cd8 Pasha Tatashin 2024-04-13  34  }
bd3520a93a84cd8 Pasha Tatashin 2024-04-13  35  

:::::: The code at line 32 was first introduced by commit
:::::: bd3520a93a84cd8c3897283e5891a9106fcf5acc iommu: observability of the IOMMU allocations

:::::: TO: Pasha Tatashin <pasha.tatashin@soleen.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
