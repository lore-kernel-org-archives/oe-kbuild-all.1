Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D0A2BD5BF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 00:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772756672; cv=none; b=kT76CSCEXFFpmdPyj0WwRHl9dJPy3n2+RfkmxtP/gaNdzLFXpotsTKGjQZcnKdfG/R9/hE3/dD6fFr3T1H+SvGf+F7R0an4FSW5wop3cgJzJBVp2IPDTTPxa0gIeZiP9nRk8Nqn0R13Jf8cCoe4xfUiqHZowVi8yEc1pfXlv7QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772756672; c=relaxed/simple;
	bh=QqpIVVRYfpwVCS62S0PrxkqodUHsKqTit+dNNS+PDVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TDk/MpMgGmMJJDF8afps6Tg7QQMBIh9ehPVlfUai8nfh9Fqml1es/CQUzKElNlR9M7JtpUZEm3Tcnxt0PxtsrIdOmeNnZp7Id0t3Nd2rDtU0aOEn3SXiD5NQ2Ar50EBCLjcRX4H1ORWUdAgYtMg8BBUVC1ZL4WpIf8Q13LXYuF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVJApGzn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVJApGzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772756670; x=1804292670;
  h=date:from:to:cc:subject:message-id;
  bh=QqpIVVRYfpwVCS62S0PrxkqodUHsKqTit+dNNS+PDVs=;
  b=lVJApGznWQpK4myhSEzfluNLYWwCYOtY0bUJDpqQ2K6J2Rwkv26iCmEG
   Eqsx3hmATR3P2tAfEBwGR4pIWtBijT5Bs9sHU0dCeIYl4LBZnf8lXhYKr
   HRQzyELi767h9JkIj12waAPeEC9qGQCTdjOUNyhEC6MgiBQUa8IaSjIiY
   P1bLoVdUkYGfUxdkZIEqcKmghC6AngkKlI5a/MZ/Qvv8Xtr0irkA2a/bH
   H7KCSgfysk7VOrOrMMMYUCwN0vznXSs8QOPUF56b6A7aOud5k5V9UsMhL
   TXWDznkdxzZePb2mvX+GiiHP20qwGtx91cRhZmGKnPefJFReJzotgvAl6
   w==;
X-CSE-ConnectionGUID: 9aO1DPVJQE2i8y68bPEU6g==
X-CSE-MsgGUID: MO/+kLi2SlCzY7rS5N4Iqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="72886266"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="72886266"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 16:24:29 -0800
X-CSE-ConnectionGUID: 9QmOvlUzTMqvy+m9E/P73A==
X-CSE-MsgGUID: zl9stA+xTiiyr7vR8YO8vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="222981574"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Mar 2026 16:24:28 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyIzR-0000000006T-18oy;
	Fri, 06 Mar 2026 00:24:25 +0000
Date: Fri, 06 Mar 2026 08:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] ERROR: modpost:
 "__kvm_nvhe_memcpy" [drivers/iommu/arm/arm-smmu-v3/arm_smmu_v3_kvm.ko]
 undefined!
Message-ID: <202603060804.9wiSKSTK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   6a6bc2e596fed8d1574eca852772273befbb255e
commit: e0abda8b771ca9dd97fd815b4be3bc9711fa3a5c [2/2] ANDROID: drivers/arm-smmu-v3-kvm: Modularize driver
config: arm64-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260306/202603060804.9wiSKSTK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060804.9wiSKSTK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060804.9wiSKSTK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iommu/arm/arm-smmu-v3/arm_smmu_v3_kvm.o
>> ERROR: modpost: "__kvm_nvhe_memcpy" [drivers/iommu/arm/arm-smmu-v3/arm_smmu_v3_kvm.ko] undefined!
ERROR: modpost: "devm_usb_get_phy_by_phandle" [drivers/power/supply/isp1704_charger.ko] undefined!
ERROR: modpost: "devm_usb_get_phy" [drivers/power/supply/isp1704_charger.ko] undefined!
ERROR: modpost: "devm_usb_get_phy_by_phandle" [drivers/power/supply/sc2731_charger.ko] undefined!
ERROR: modpost: "usb_phy_get_charger_current" [drivers/power/supply/sc2731_charger.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
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
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
