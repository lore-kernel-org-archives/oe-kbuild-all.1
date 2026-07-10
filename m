Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609E24418EC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 16:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702172; cv=none; b=JEfRn/fhz2N+++aO069Dn6YFrgSQ/Bb4yYB0STElbO1gKoqr3HaFTuuIOlOMjbgYhTsaGxMyUJueGh1zBWJ+kDg6RrHlPuAUXriU74b7z+a751DtrZ2UaeK5tsUwm2M3zDA19aky6owKAw9x+Uqw4ixHkuY8OVR4arC1YaTcfW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702172; c=relaxed/simple;
	bh=fXKLytHIulhRgTTZW1IrYIr5r7Rl+CLUab4mYajQ/54=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V3cfc8oyW+4vfBNnXA4CdSrDQrpQdNaYoKhD1AFrMw1Dq27fUtBdVbSzd9qGAXDodYbTzE6zytenM4viFbHqFLsMVclEh6WWAJR+34RNsEkAXnw+iXouA7tK//jr+pVBPveR0cDroSHAacuPWWaTG3L3bWcVZ3xKBV3fvE7QK7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETWZR2Gd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETWZR2Gd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783702171; x=1815238171;
  h=date:from:to:cc:subject:message-id;
  bh=fXKLytHIulhRgTTZW1IrYIr5r7Rl+CLUab4mYajQ/54=;
  b=ETWZR2GdWoTdAgovCONQdTOyy1F4wqe5bW8Gw1DzZ9+YfHPQ66u8B1fF
   JbpDlmb5cVQDDj+H+J+qXn6VZdl4o+RMO12Jat/B0+k5hO+++r99z5LEK
   xJzd09O3Ql4jsBiy3ic3XEKoRB03jxneuP2Rz355JBOxu4kOTYDJZYb3U
   DevQmTre7mkpqzI/IFv7uKCmombBKGDFMCCBt+TTJn5ahHLSWaUFMs7n8
   SsP9mkBrQ1hp9yMZ6moBK+/XrhckDmbTkN2v7xvAZVi1JsO2BZcJXGNSY
   nM/hUfMDRXAwljJifawRIraeBBCZML/kqiYT2GsotHbTIi+vKS3dOM/Yq
   g==;
X-CSE-ConnectionGUID: 3D8D6QqdQxyvnhtZN8JhiQ==
X-CSE-MsgGUID: Tmuqo26sTtueAgOsC5TJsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84596741"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84596741"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 09:49:30 -0700
X-CSE-ConnectionGUID: UettO0FCRbOvmIRJ4aOJlA==
X-CSE-MsgGUID: pA3u9Z0MRbCkOd+r9PwF7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258530304"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 10 Jul 2026 09:49:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiEPl-00000000J8B-3H4w;
	Fri, 10 Jul 2026 16:49:25 +0000
Date: Sat, 11 Jul 2026 00:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3] arm-linux-gnueabi-ld:
 phylink.c:undefined reference to `fwnode_phy_find_device'
Message-ID: <202607110016.UK2IpYVu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   7bc9a2fb983f2f1c49c6e3f47478befd7ac1f94b
commit: da0d6fef4be114bfe8c8ffe7299762721d961077 [3/3] Merge 1b98f357dadd ("Merge tag 'net-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next") into android-mainline
config: arm-randconfig-002-20260710 (https://download.01.org/0day-ci/archive/20260711/202607110016.UK2IpYVu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110016.UK2IpYVu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110016.UK2IpYVu-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
   phylink.c:(.text+0x530): undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode':
   phylink.c:(.text+0x960): undefined reference to `phy_inband_caps'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xa28): undefined reference to `phy_inband_caps'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xae0): undefined reference to `phy_inband_caps'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x17e8): undefined reference to `phy_config_inband'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_up':
   phylink.c:(.text+0x1e54): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1e60): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1eb4): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1ec0): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_caps_to_linkmodes':
   phylink.c:(.text+0x2200): undefined reference to `phy_caps_linkmodes'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x23dc): undefined reference to `phy_disconnect'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_prepare_resume':
   phylink.c:(.text+0x24c0): undefined reference to `phy_resume'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x2550): undefined reference to `phy_ethtool_get_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x25b4): undefined reference to `phy_ethtool_set_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x262c): undefined reference to `phy_get_eee_err'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x26e8): undefined reference to `phy_ethtool_set_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x2834): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2874): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x29f8): undefined reference to `mdiobus_modify'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2a68): undefined reference to `mdiobus_modify_changed'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   phylink.c:(.text+0x2b80): undefined reference to `linkmode_resolve_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x3234): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x325c): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block':
   phylink.c:(.text+0x33a4): undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock':
   phylink.c:(.text+0x3520): undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x3670): undefined reference to `phy_ethtool_get_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x3778): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x38ec): undefined reference to `phy_speed_down'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x3960): undefined reference to `phy_speed_up'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x3bc8): undefined reference to `linkmode_set_pause'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x3c54): undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x4084): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x417c): undefined reference to `phy_mii_ioctl'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4238): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x42e0): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4304): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x43c0): undefined reference to `swphy_read_reg'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4450): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4478): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x4530): undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   phylink.c:(.text+0x4818): undefined reference to `phy_caps_from_interface'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x5608): undefined reference to `phy_get_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x5994): undefined reference to `phy_start'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x6010): undefined reference to `phy_ethtool_ksettings_get'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   phylink.c:(.text+0x6740): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   phylink.c:(.text+0x6bdc): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x6e08): undefined reference to `phy_support_asym_pause'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x6f00): undefined reference to `phy_attached_info_irq'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7108): undefined reference to `phy_eee_tx_clock_stop_capable'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7158): undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7198): undefined reference to `phy_disable_eee'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x71a8): undefined reference to `phy_support_eee'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x71b8): undefined reference to `phy_request_interrupt'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x74b8): undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7540): undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_fwnode_phy_connect':
   phylink.c:(.text+0x75dc): undefined reference to `fwnode_get_phy_node'
>> arm-linux-gnueabi-ld: phylink.c:(.text+0x75f4): undefined reference to `fwnode_phy_find_device'
>> arm-linux-gnueabi-ld: phylink.c:(.text+0x76dc): undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x76e8): undefined reference to `phy_device_free'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7744): undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x809c): undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x89f8): undefined reference to `phy_ethtool_ksettings_set'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x8d0c): undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x8f30): undefined reference to `phy_restart_aneg'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
