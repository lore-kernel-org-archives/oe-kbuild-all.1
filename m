Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E6F29D291
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 22:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765924058; cv=none; b=ue2kbJAZO4A9MFEiQ2tWjYtbrtyZ8U3PBlnWWCXQjg+EL9a6mNR69km3rhlqyyE+bGSX1hfAPtvhDtrmWtAEM1hGn+3yqMPuq4sLnbC9cQnxdN/azo3LCAIqOJX/74gD9SkFCziUP5d/P/EXySAUzYBZLO6xvnmuUwNvX3y3kwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765924058; c=relaxed/simple;
	bh=idZsU4LnkEZUfMPveiLUWEKIyS6IOZPSfY1PCAaskdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5A4aXaxyTxsEd87Q4EiCQDVLe4nnxj2OY1b3wderAgj/8LR9GS/3NJsQLPnSirAURSD614sFIaxnytkP0N6Wo3rnktAMqUyENqST2ojPItAThgBHb27FEQeIsDfqm9cjvyV4pUWYvOCUEn3uKRiPt00KLhIhVzws1dNjtkEBkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9RtTGgQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9RtTGgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765924056; x=1797460056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=idZsU4LnkEZUfMPveiLUWEKIyS6IOZPSfY1PCAaskdk=;
  b=B9RtTGgQ089sy61FIgiWcg0OT7wDD5sA/sDnuhqloREu3yOgP6ufMmnt
   aNtfGjaUUIW7JGKP5YuuGb4u4o8zvp9e2NK93xZSau0ZtCFzZlZ4a6/N/
   YBTWGkYgALvy6n5ohOLUq6Iooozn3Eb5wtpY2V0RMBwSBMxHUyjokQ2yi
   CylLCWLwy/eNAahIFJNPSrS8BUp+ucCV640btWxIxPoLLpJoLaYykELMq
   aA0b60kdXxsj0zt08gI9rcCcPIKVR+9aNTj08of/1GkDETEf/A6zMb7Hx
   nbsfIgSCJiJDr49+feU9xB14ab2ZbZpBkdKs+tIIi7/zftm19xn4On/Lm
   Q==;
X-CSE-ConnectionGUID: Zu5SREGOQ2u5HiBaNgIBkA==
X-CSE-MsgGUID: tfVvTiQTQViNcRcwzpdXfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78565351"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="78565351"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 14:27:35 -0800
X-CSE-ConnectionGUID: RW0Ru0F1Qoe9Fb6refW4oA==
X-CSE-MsgGUID: cWWY3cVaQqa7zzSYPVy2oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="198026465"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 16 Dec 2025 14:27:34 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVdW0-000000003u6-1O4u;
	Tue, 16 Dec 2025 22:27:32 +0000
Date: Wed, 17 Dec 2025 06:27:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 3/3] aarch64-linux-ld:
 drivers/net/phy/phylink.c:2250: undefined reference to
 `fwnode_phy_find_device'
Message-ID: <202512170617.GMAqs89r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   fbfd6aedcdb51da80c81b27b298b8691212febac
commit: da0d6fef4be114bfe8c8ffe7299762721d961077 [3/3] Merge 1b98f357dadd ("Merge tag 'net-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next") into android-mainline
config: arm64-randconfig-004-20251206 (https://download.01.org/0day-ci/archive/20251217/202512170617.GMAqs89r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170617.GMAqs89r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170617.GMAqs89r-lkp@intel.com/

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
