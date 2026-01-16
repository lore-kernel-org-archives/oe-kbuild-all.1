Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AAF3101B8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 22:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768602268; cv=none; b=EBhvH027pfNOLUgnrjaNzIuD/Lm+haxWc+98s+BnIPOFEBUBQJnYIA1p/HHO45W99hPsDUJy59vUChvd8PP9qz+oewSwvMnmWIhMo51ftEEXMOqmU8hwanGBzzxu52kNPk+1FXpSI2BK4d6BSVIfG4J6n6EkxrxUYaRHvk0fgkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768602268; c=relaxed/simple;
	bh=706mAGUHSd5RxOBfuyLZitKSpKzoLxbMrnUxNJRcXvA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rtfb+OHNIbsue7fJZkNgH57xbkhryFpwFPAXL9uVTwuvxiK/47fAZk3A4dwQVuNLijylHCeHLk9Nmu62uE1RpUb2flIp2h4RTosVIDYSQIMBNdvBRiEvh34GHgL1/7MxInzrp5udTmizFw+5M08VeZO5JPHheT2IZyL8Xn9eI0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpoXQwvA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpoXQwvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768602266; x=1800138266;
  h=date:from:to:cc:subject:message-id;
  bh=706mAGUHSd5RxOBfuyLZitKSpKzoLxbMrnUxNJRcXvA=;
  b=MpoXQwvAXmhK3DjQOqdbn2kO6g0ehAgrp8Aa3Y/qfc5bbXlAMNPXDU5l
   L3gr92uoe04vONLHthfUDr7zdB1lFWkbgHv6kqTp3ZJZWV+U3yQSKhBmf
   2PBN6L8vj4L3H4Z9+EwqYa7hvHsH4iBJpIrK8oOrUQTsA5I7TytqVav4h
   f4nUVvNdy3EL1gDJhcMqMUL7NoykWn6DGc5Q3h+4eAK9fslbFOrSc/2oV
   lzDpw+ly7nHn4eBP3OQ4fIeaMZrlKpoCkyMgxGJwi7b7mFw53hSiB14qp
   5p3kEqVeppVcysmhOPFE/DdqXd6WU187PRzFCqoMFZg/FityXtJfxU/at
   Q==;
X-CSE-ConnectionGUID: pTKKQKB6SM+7PiCa7NOGUg==
X-CSE-MsgGUID: 3plijeXDTHikYNp5xUaXZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87495092"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="87495092"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 14:24:26 -0800
X-CSE-ConnectionGUID: OHgzq6RxSi6pqJfuOr2AGQ==
X-CSE-MsgGUID: F+JnkjRUSnCCKTVj0ND8zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="204583217"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jan 2026 14:24:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgsEv-00000000LJI-2VvK;
	Fri, 16 Jan 2026 22:24:21 +0000
Date: Sat, 17 Jan 2026 06:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 drivers/platform/x86/p2sb.c:89:14: warning: assignment to 'struct pci_dev *'
 from 'int' makes pointer from integer without a cast
Message-ID: <202601170614.cVTWvkqH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   4c0f893f0f427f91ae490c421696a148200f410b
commit: ddaaf24f47eb2f4ca3f4a431b9482baad3bbfef9 [1/1] ANDROID: GKI: x86: Enable P2SB device as x86 hidden
config: i386-buildonly-randconfig-003-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170614.cVTWvkqH-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170614.cVTWvkqH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170614.cVTWvkqH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/p2sb.c: In function 'p2sb_scan_and_cache_devfn':
   drivers/platform/x86/p2sb.c:89:16: error: implicit declaration of function 'pci_scan_single_device'; did you mean 'pci_disable_device'? [-Werror=implicit-function-declaration]
      89 |         pdev = pci_scan_single_device(bus, devfn);
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                pci_disable_device
>> drivers/platform/x86/p2sb.c:89:14: warning: assignment to 'struct pci_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      89 |         pdev = pci_scan_single_device(bus, devfn);
         |              ^
   drivers/platform/x86/p2sb.c:96:9: error: implicit declaration of function 'pci_stop_and_remove_bus_device' [-Werror=implicit-function-declaration]
      96 |         pci_stop_and_remove_bus_device(pdev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/p2sb.c: In function 'p2sb_scan_and_cache':
   drivers/platform/x86/p2sb.c:105:9: error: implicit declaration of function 'pci_bus_write_config_dword'; did you mean 'pci_write_config_dword'? [-Werror=implicit-function-declaration]
     105 |         pci_bus_write_config_dword(bus, devfn, P2SBC, 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         pci_write_config_dword
   drivers/platform/x86/p2sb.c: In function 'p2sb_get_bus':
   drivers/platform/x86/p2sb.c:131:20: error: implicit declaration of function 'pci_find_bus'; did you mean 'pci_find_next_bus'? [-Werror=implicit-function-declaration]
     131 |         p2sb_bus = pci_find_bus(0, 0);
         |                    ^~~~~~~~~~~~
         |                    pci_find_next_bus
>> drivers/platform/x86/p2sb.c:131:18: warning: assignment to 'struct pci_bus *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     131 |         p2sb_bus = pci_find_bus(0, 0);
         |                  ^
   drivers/platform/x86/p2sb.c: In function 'p2sb_cache_resources':
   drivers/platform/x86/p2sb.c:154:9: error: implicit declaration of function 'pci_bus_read_config_word'; did you mean 'pci_read_config_word'? [-Werror=implicit-function-declaration]
     154 |         pci_bus_read_config_word(bus, devfn_p2sb, PCI_CLASS_DEVICE, &class);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         pci_read_config_word
   drivers/platform/x86/p2sb.c:162:9: error: implicit declaration of function 'pci_lock_rescan_remove' [-Werror=implicit-function-declaration]
     162 |         pci_lock_rescan_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/p2sb.c:164:9: error: implicit declaration of function 'pci_bus_read_config_dword'; did you mean 'pci_read_config_dword'? [-Werror=implicit-function-declaration]
     164 |         pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         pci_read_config_dword
   drivers/platform/x86/p2sb.c:174:9: error: implicit declaration of function 'pci_unlock_rescan_remove' [-Werror=implicit-function-declaration]
     174 |         pci_unlock_rescan_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for P2SB
   Depends on [n]: PCI [=n] && X86 [=y]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +89 drivers/platform/x86/p2sb.c

9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   83  
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   84  static void p2sb_scan_and_cache_devfn(struct pci_bus *bus, unsigned int devfn)
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   85  {
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   86  	struct p2sb_res_cache *cache = &p2sb_resources[PCI_FUNC(devfn)];
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   87  	struct pci_dev *pdev;
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   88  
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  @89  	pdev = pci_scan_single_device(bus, devfn);
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   90  	if (!pdev)
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   91  		return;
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   92  
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   93  	p2sb_read_bar0(pdev, &cache->res);
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   94  	cache->bus_dev_id = bus->dev.id;
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   95  
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   96  	pci_stop_and_remove_bus_device(pdev);
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   97  }
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   98  
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   99  static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  100  {
0286070c74ee483 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-11-28  101  	/*
0286070c74ee483 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-11-28  102  	 * The BIOS prevents the P2SB device from being enumerated by the PCI
0286070c74ee483 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-11-28  103  	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
0286070c74ee483 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-11-28  104  	 */
0286070c74ee483 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-11-28  105  	pci_bus_write_config_dword(bus, devfn, P2SBC, 0);
0286070c74ee483 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-11-28  106  
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  107  	/* Scan the P2SB device and cache its BAR0 */
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  108  	p2sb_scan_and_cache_devfn(bus, devfn);
aec7d25b497ce4a drivers/platform/x86/p2sb.c       Hans de Goede        2024-03-04  109  
aec7d25b497ce4a drivers/platform/x86/p2sb.c       Hans de Goede        2024-03-04  110  	/* On Goldmont p2sb_bar() also gets called for the SPI controller */
aec7d25b497ce4a drivers/platform/x86/p2sb.c       Hans de Goede        2024-03-04  111  	if (devfn == P2SB_DEVFN_GOLDMONT)
aec7d25b497ce4a drivers/platform/x86/p2sb.c       Hans de Goede        2024-03-04  112  		p2sb_scan_and_cache_devfn(bus, SPI_DEVFN_GOLDMONT);
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  113  
0286070c74ee483 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-11-28  114  	pci_bus_write_config_dword(bus, devfn, P2SBC, P2SBC_HIDE);
0286070c74ee483 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-11-28  115  
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  116  	if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  117  		return -ENOENT;
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  118  
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  119  	return 0;
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  120  }
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  121  
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  122  static struct pci_bus *p2sb_get_bus(struct pci_bus *bus)
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  123  {
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  124  	static struct pci_bus *p2sb_bus;
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  125  
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  126  	bus = bus ?: p2sb_bus;
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  127  	if (bus)
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  128  		return bus;
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  129  
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  130  	/* Assume P2SB is on the bus 0 in domain 0 */
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08 @131  	p2sb_bus = pci_find_bus(0, 0);
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  132  	return p2sb_bus;
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  133  }
5913320eb0b3ec8 drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  134  

:::::: The code at line 89 was first introduced by commit
:::::: 9745fb07474f4501eff62130a78a42a8b8c18b05 platform/x86/intel: Add Primary to Sideband (P2SB) bridge support

:::::: TO: Jonathan Yong <jonathan.yong@intel.com>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
