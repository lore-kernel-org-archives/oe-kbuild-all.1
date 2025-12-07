Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7EA243956
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 21:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765143216; cv=none; b=a/hBIKE7YiY1bDqdQuuH6rbAOCLRKdWUY9u9y+wqp1mp1uOGkMWgGdQagknn8wzRZ9N1G7o7eN2IdeAEGxcOCN5cDx13h6OJ41UBHO1WULRlW2zNHGax41at5Uwssi3dmJQLVfKMjeW8Zo3xyNb+bCG5r8Q6q219Ev6B9kIVrAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765143216; c=relaxed/simple;
	bh=DYBg/FXOAx8D7AzMQbH9vsTXt8IlmWOn65ou7tOecsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fPE+xFMQ5UtAvubpMSvtQC8YpO26GsuHNfH1g2Wx4u/V9aoEmNNAZDfrmiB39dh2su6ninTNu86xZ9W36gziUeLM07DWmzUQ3pKt51V/GnzqiOklGblS8kqbb1Xg66XF/eQ/Sagc44BI2qdVVKo5jbNO9DNPCA8r5EnhtXb6cMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjLxZocT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjLxZocT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765143214; x=1796679214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DYBg/FXOAx8D7AzMQbH9vsTXt8IlmWOn65ou7tOecsw=;
  b=NjLxZocTBoI9s5cZ0Sq7P6Gc4q81tceX/Nfb+Z4XwGLLanS2VMdjWnGQ
   7qBq4BXGR0R54M59Xb8i09q+tHBKJoF2JLxB8ZiSOiEEJzUqQCG4pAWcr
   ngVxw/NCXrruSYNsTAjBLo4PSDDWRrxeIoPEexrUENAy4q8YoLDkRuVQB
   kaMy0pYFXh3WRbqwcMR1PNEDRZcN8s1UFqvxJsu0JjMq+5cWeMD6HcXih
   xqu87Ex5C0v1fDFrpg5BN9PwwQBYckQ6UA+GEGhDfTLINMT8n9MostH0d
   cej3updICJmqVvbAiNZl1KpO11Rzc/FsfBEdjuMaNA8G78mbvPFEQDEfU
   g==;
X-CSE-ConnectionGUID: 4cuixTXFTNmt17h8znKq2Q==
X-CSE-MsgGUID: LfSo/l7pRHO8TqVryACybw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66987200"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="66987200"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 13:33:32 -0800
X-CSE-ConnectionGUID: MwqKhC8XQ02B9YwO8uWl6Q==
X-CSE-MsgGUID: ua9F9z6RT6OqMofN8xyZZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="195681364"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Dec 2025 13:33:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSMNk-00000000Jej-3Fby;
	Sun, 07 Dec 2025 21:33:28 +0000
Date: Mon, 8 Dec 2025 05:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 3/3] aarch64-linux-ld:
 drivers/net/phy/phylink.c:2250: undefined reference to
 `fwnode_phy_find_device'
Message-ID: <202512080521.KChIWxb2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   05910bac2caf101403f079bba436ca4efd3b9bbf
commit: da0d6fef4be114bfe8c8ffe7299762721d961077 [3/3] Merge 1b98f357dadd ("Merge tag 'net-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next") into android-mainline
config: arm64-randconfig-004-20251206 (https://download.01.org/0day-ci/archive/20251208/202512080521.KChIWxb2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080521.KChIWxb2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512080521.KChIWxb2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/phylink.c:2664: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2667: undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   drivers/net/phy/phylink.c:2977: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2980: undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   drivers/net/phy/phylink.c:3103: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3106: undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   drivers/net/phy/phylink.c:3121: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3127: undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   drivers/net/phy/phylink.c:3148: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3164: undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   drivers/net/phy/phylink.c:3191: undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   drivers/net/phy/phylink.c:844: undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   drivers/net/phy/phylink.c:1551: undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1557: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   drivers/net/phy/phylink.c:4137: undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:3350: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3234: undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3238: undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3275: undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3279: undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3373: undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   drivers/net/phy/phylink.c:3421: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3424: undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   drivers/net/phy/phylink.c:3444: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3447: undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   drivers/net/phy/phylink.c:4086: undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   include/linux/mdio.h:642: undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   drivers/net/phy/phylink.c:2738: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2741: undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   drivers/net/phy/phylink.c:1922: undefined reference to `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   drivers/net/phy/phylink.c:2439: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2444: undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   drivers/net/phy/phylink.c:2533: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2549: undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   include/linux/mdio.h:630: undefined reference to `mdiobus_read'
   aarch64-linux-ld: include/linux/mdio.h:636: undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   include/linux/mdio.h:630: undefined reference to `mdiobus_read'
   aarch64-linux-ld: include/linux/mdio.h:630: undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   drivers/net/phy/phylink.c:3015: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3050: undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3073: undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   drivers/net/phy/phylink.c:2371: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2373: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2379: undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2419: undefined reference to `phy_start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   drivers/net/phy/phylink.c:2597: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
   drivers/net/phy/phylink.c:1484: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1537: undefined reference to `netif_carrier_on'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1539: undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1539: undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1539: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1539: undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1539: undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   drivers/net/phy/phylink.c:421: undefined reference to `phy_caps_from_interface'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   drivers/net/phy/phylink.c:518: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:530: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   drivers/net/phy/phylink.c:577: undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   drivers/net/phy/phylink.c:2043: undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1985: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2052: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2063: undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2064: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2092: undefined reference to `phy_support_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2122: undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2128: undefined reference to `phy_eee_tx_clock_stop_capable'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2134: undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2006: undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2109: undefined reference to `phy_disable_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   drivers/net/phy/phylink.c:2159: undefined reference to `phy_attach_direct'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2193: undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_fwnode_phy_connect':
   drivers/net/phy/phylink.c:2243: undefined reference to `fwnode_get_phy_node'
>> aarch64-linux-ld: drivers/net/phy/phylink.c:2250: undefined reference to `fwnode_phy_find_device'
>> aarch64-linux-ld: drivers/net/phy/phylink.c:2265: undefined reference to `phy_attach_direct'
>> aarch64-linux-ld: drivers/net/phy/phylink.c:2267: undefined reference to `phy_device_free'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2273: undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   drivers/net/phy/phylink.c:2810: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2837: undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2851: undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2680: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   drivers/net/phy/phylink.c:1815: undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.c:817: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:808: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:688: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:709: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:718: undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: drivers/net/phy/phylink.c:735: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   drivers/power/supply/isp1704_charger.c:399: undefined reference to `devm_usb_get_phy_by_phandle'
   aarch64-linux-ld: drivers/power/supply/isp1704_charger.c:401: undefined reference to `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   drivers/power/supply/bq25890_charger.c:1504: undefined reference to `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/bq256xx_charger.o: in function `bq256xx_probe':
   drivers/power/supply/bq256xx_charger.c:1730: undefined reference to `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/bq256xx_charger.c:1737: undefined reference to `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
