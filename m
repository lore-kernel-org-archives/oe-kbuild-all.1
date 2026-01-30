Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0951334C24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 23:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769816141; cv=none; b=O3ZYbj/K5Qp7wQHpvm+yTae2e8HJLHrW79YUah0xXZ8ABZib9o9SaT/ukND9IYE3Y2+/KKRYaXz7DuskOFYSY43dmUAX2en294+cXjNw2MuWTFEXhKNsOvbygs2JawnQUgSLY1akOfdKka/RI6cHNloIGHguF+UboLL08lwaOvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769816141; c=relaxed/simple;
	bh=kQgT1lulZY55Sz1yP2VpWpSMOTg2cZjbmH869wE/SkY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JcIxZky2uumIc3XAFNLq1/gIxdSF3q3j48I0hOYM4Wp/q669O5yOjQ2VZHuZ2pGvtcauZ48My+EGEm0oT1G2rF9SIK48J4tGrqKXCc06QHcoLlG7p72zlWmLahR4BzQIPclfDhWpFlJgTVzx9w9yjn9m5OrfwJ7Lwmn7NonrHkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maJfN9Bw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maJfN9Bw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769816139; x=1801352139;
  h=date:from:to:cc:subject:message-id;
  bh=kQgT1lulZY55Sz1yP2VpWpSMOTg2cZjbmH869wE/SkY=;
  b=maJfN9BwQiN7ODBbO8SNo3ZLCla+uNgirjchZzvp0TulJZfRdXrQkarQ
   AyMchqNiaZEMyELet/ddlu8sMyPjh1nHzjLEp15CmDaYp1bih1CHkPbOO
   q7/Ue6aXhCH3x56LDLq3Mxx3/vPhTGYDhlh16l2WMrCOEuzhS3xV3Uqfq
   81TGjjpUGeMhTuAr9phCMCEYWf6E1pJN1eeeqpQlHa6gfPJLEqDDpw6yZ
   RpP9ezOegwUpt0yVmifTTlNZFrNqhj5Ty6Af5YhpFridozToQLJD5+cal
   iJlDY2n2xEfUd2Yq6ASlwT/8gGBOdNJ2vP3+vvDkzHxDmTwu+0IEpYxEV
   g==;
X-CSE-ConnectionGUID: 1WJ7dJMQQ7WmT/Ar90fLng==
X-CSE-MsgGUID: QMZl9Z0YQlepIe3vBykzSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="81805319"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="81805319"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 15:35:38 -0800
X-CSE-ConnectionGUID: yz68QSY0TpesnbNm6CJINQ==
X-CSE-MsgGUID: t+JewF3tRqK6l/81+W/xFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="213475402"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jan 2026 15:35:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vly1W-00000000dTg-28uv;
	Fri, 30 Jan 2026 23:35:34 +0000
Date: Sat, 31 Jan 2026 07:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/net/phy/phylink.c:1960:undefined reference to `phy_attached_info_irq'
Message-ID: <202601310713.noBSmfeu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d60ccb82b419ae625a635f08d37b28a238178e1d
commit: 8b9a794068e9fe10f91796ee053afdbd5c01782c [1/1] Revert "ANDROID: suppress GKI configs for 32-bit builds"
config: arm-randconfig-r052-20260130 (https://download.01.org/0day-ci/archive/20260131/202601310713.noBSmfeu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310713.noBSmfeu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310713.noBSmfeu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/phylink.c:2428:(.text+0xa8a): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2431:(.text+0xab4): undefined reference to `phy_ethtool_set_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   drivers/net/phy/phylink.c:2693:(.text+0xad4): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2696:(.text+0xafc): undefined reference to `phy_restart_aneg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   drivers/net/phy/phylink.c:2819:(.text+0xb1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2822:(.text+0xb44): undefined reference to `phy_get_eee_err'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   drivers/net/phy/phylink.c:2840:(.text+0xb6e): undefined reference to `phy_init_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   drivers/net/phy/phylink.c:2855:(.text+0xb8c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2858:(.text+0xbb6): undefined reference to `phy_ethtool_get_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   drivers/net/phy/phylink.c:2873:(.text+0xbda): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2876:(.text+0xc04): undefined reference to `phy_ethtool_set_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   drivers/net/phy/phylink.c:2900:(.text+0xc6a): undefined reference to `swphy_read_reg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   drivers/net/phy/phylink.c:1203:(.text+0xd96): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1241:(.text+0xf82): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1253:(.text+0xffa): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   drivers/net/phy/phylink.c:1825:(.text+0x120c): undefined reference to `phy_get_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   drivers/net/phy/phylink.c:2731:(.text+0x12a6): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2766:(.text+0x13a8): undefined reference to `linkmode_set_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2789:(.text+0x1410): undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   drivers/net/phy/phylink.c:981:(.text+0x14a4): undefined reference to `linkmode_resolve_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   drivers/net/phy/phylink.c:2476:(.text+0x1570): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2479:(.text+0x159a): undefined reference to `phy_ethtool_ksettings_get'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:3059:(.text+0x1624): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_read':
   drivers/net/phy/phylink.c:2943:(.text+0x16b0): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2947:(.text+0x1768): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_write':
   drivers/net/phy/phylink.c:2984:(.text+0x17a4): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2988:(.text+0x1838): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:3082:(.text+0x1848): undefined reference to `phy_mii_ioctl'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   drivers/net/phy/phylink.c:1456:(.text+0x1c20): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1459:(.text+0x1c4e): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   drivers/net/phy/phylink.c:678:(.text+0x1eb8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   drivers/net/phy/phylink.c:726:(.text+0x1fda): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_up':
   drivers/net/phy/phylink.c:1442:(.text+0x220c): undefined reference to `netif_carrier_on'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1444:(.text+0x222c): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1444:(.text+0x2234): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1444:(.text+0x226c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1444:(.text+0x22b6): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1444:(.text+0x22bc): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   drivers/net/phy/phylink.c:954:(.text+0x26fa): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:945:(.text+0x27da): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   drivers/net/phy/phylink.c:3853:(.text+0x28c2): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   drivers/net/phy/phylink.c:3130:(.text+0x294c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3133:(.text+0x298c): undefined reference to `phy_speed_down'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   drivers/net/phy/phylink.c:3153:(.text+0x29a0): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3156:(.text+0x29de): undefined reference to `phy_speed_up'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   drivers/net/phy/phylink.c:2291:(.text+0x2a2c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2296:(.text+0x2a54): undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   drivers/net/phy/phylink.c:2327:(.text+0x2ada): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2341:(.text+0x2b62): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   drivers/net/phy/phylink.c:3802:(.text+0x2c6a): undefined reference to `mdiobus_modify_changed'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_modify':
   include/linux/mdio.h:664:(.text+0x2cb4): undefined reference to `mdiobus_modify'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_write':
   include/linux/mdio.h:658:(.text+0x2d0c): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   drivers/net/phy/phylink.c:2223:(.text+0x2d20): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2225:(.text+0x2d84): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2231:(.text+0x2d96): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2271:(.text+0x2e20): undefined reference to `phy_start'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   drivers/net/phy/phylink.c:823:(.text+0x2ff0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:844:(.text+0x30b2): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:854:(.text+0x30f4): undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:872:(.text+0x3224): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   drivers/net/phy/phylink.c:1727:(.text+0x3360): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_register_sfp':
   drivers/net/phy/phylink.c:1626:(.text+0x34c2): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   drivers/net/phy/phylink.c:1940:(.text+0x35a0): undefined reference to `phy_support_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1949:(.text+0x3650): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   drivers/net/phy/phylink.c:1870:(.text+0x366a): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
>> drivers/net/phy/phylink.c:1960:(.text+0x3702): undefined reference to `phy_attached_info_irq'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1961:(.text+0x374e): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1989:(.text+0x37d0): undefined reference to `phy_request_interrupt'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   drivers/net/phy/phylink.c:1903:(.text+0x3804): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_attach_phy':
   drivers/net/phy/phylink.c:2013:(.text+0x3916): undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   drivers/net/phy/phylink.c:2047:(.text+0x3948): undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   drivers/net/phy/phylink.c:2364:(.text+0x3990): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   drivers/net/phy/phylink.c:2528:(.text+0x3a1a): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2555:(.text+0x3a60): undefined reference to `phy_ethtool_ksettings_set'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2569:(.text+0x3aca): undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2622:(.text+0x3b76): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_read':
   include/linux/mdio.h:652:(.text+0xc34): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   drivers/power/supply/rt9455_charger.c:1638:(.text+0x1244): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   drivers/power/supply/isp1704_charger.c:399:(.text+0x534): undefined reference to `devm_usb_get_phy_by_phandle'
   arm-linux-gnueabi-ld: drivers/power/supply/isp1704_charger.c:401:(.text+0x562): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   drivers/power/supply/bq25890_charger.c:1504:(.text+0x1690): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: drivers/power/supply/bq256xx_charger.o: in function `bq256xx_probe':
   drivers/power/supply/bq256xx_charger.c:1730:(.text+0x1306): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: drivers/power/supply/bq256xx_charger.c:1737:(.text+0x1368): undefined reference to `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +1960 drivers/net/phy/phylink.c

2c62ff83ee14da Russell King (Oracle  2023-11-24  1924) 
e45d1f5288b81e Russell King          2019-12-11  1925  static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
e45d1f5288b81e Russell King          2019-12-11  1926  			       phy_interface_t interface)
9525ae83959b60 Russell King          2017-07-25  1927  {
9525ae83959b60 Russell King          2017-07-25  1928  	struct phylink_link_state config;
9525ae83959b60 Russell King          2017-07-25  1929  	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
e27f178793de16 Florian Fainelli      2020-01-12  1930  	char *irq_str;
9525ae83959b60 Russell King          2017-07-25  1931  	int ret;
9525ae83959b60 Russell King          2017-07-25  1932  
9525ae83959b60 Russell King          2017-07-25  1933  	/*
9525ae83959b60 Russell King          2017-07-25  1934  	 * This is the new way of dealing with flow control for PHYs,
9525ae83959b60 Russell King          2017-07-25  1935  	 * as described by Timur Tabi in commit 529ed1275263 ("net: phy:
9525ae83959b60 Russell King          2017-07-25  1936  	 * phy drivers should not set SUPPORTED_[Asym_]Pause") except
9525ae83959b60 Russell King          2017-07-25  1937  	 * using our validate call to the MAC, we rely upon the MAC
9525ae83959b60 Russell King          2017-07-25  1938  	 * clearing the bits from both supported and advertising fields.
9525ae83959b60 Russell King          2017-07-25  1939  	 */
725ea4bff9ad6d Russell King          2019-11-15  1940  	phy_support_asym_pause(phy);
725ea4bff9ad6d Russell King          2019-11-15  1941  
725ea4bff9ad6d Russell King          2019-11-15  1942  	memset(&config, 0, sizeof(config));
725ea4bff9ad6d Russell King          2019-11-15  1943  	linkmode_copy(supported, phy->supported);
725ea4bff9ad6d Russell King          2019-11-15  1944  	linkmode_copy(config.advertising, phy->advertising);
e45d1f5288b81e Russell King          2019-12-11  1945  	config.interface = interface;
9525ae83959b60 Russell King          2017-07-25  1946  
2c62ff83ee14da Russell King (Oracle  2023-11-24  1947) 	ret = phylink_validate_phy(pl, phy, supported, &config);
20d8bb0d172d87 Hauke Mehrtens        2020-03-02  1948  	if (ret) {
ab1198e5a1dc02 Russell King (Oracle  2022-03-01  1949) 		phylink_warn(pl, "validation of %s with support %*pb and advertisement %*pb failed: %pe\n",
20d8bb0d172d87 Hauke Mehrtens        2020-03-02  1950  			     phy_modes(config.interface),
20d8bb0d172d87 Hauke Mehrtens        2020-03-02  1951  			     __ETHTOOL_LINK_MODE_MASK_NBITS, phy->supported,
20d8bb0d172d87 Hauke Mehrtens        2020-03-02  1952  			     __ETHTOOL_LINK_MODE_MASK_NBITS, config.advertising,
ab1198e5a1dc02 Russell King (Oracle  2022-03-01  1953) 			     ERR_PTR(ret));
9525ae83959b60 Russell King          2017-07-25  1954  		return ret;
20d8bb0d172d87 Hauke Mehrtens        2020-03-02  1955  	}
9525ae83959b60 Russell King          2017-07-25  1956  
9525ae83959b60 Russell King          2017-07-25  1957  	phy->phylink = pl;
9525ae83959b60 Russell King          2017-07-25  1958  	phy->phy_link_change = phylink_phy_change;
9525ae83959b60 Russell King          2017-07-25  1959  
e27f178793de16 Florian Fainelli      2020-01-12 @1960  	irq_str = phy_attached_info_irq(phy);
17091180b1521e Ioana Ciornei         2019-05-28  1961  	phylink_info(pl,
e27f178793de16 Florian Fainelli      2020-01-12  1962  		     "PHY [%s] driver [%s] (irq=%s)\n",
e27f178793de16 Florian Fainelli      2020-01-12  1963  		     dev_name(&phy->mdio.dev), phy->drv->name, irq_str);
e27f178793de16 Florian Fainelli      2020-01-12  1964  	kfree(irq_str);
9525ae83959b60 Russell King          2017-07-25  1965  
9525ae83959b60 Russell King          2017-07-25  1966  	mutex_lock(&phy->lock);
9525ae83959b60 Russell King          2017-07-25  1967  	mutex_lock(&pl->state_mutex);
9525ae83959b60 Russell King          2017-07-25  1968  	pl->phydev = phy;
e45d1f5288b81e Russell King          2019-12-11  1969  	pl->phy_state.interface = interface;
97fec51fe79b13 Russell King          2020-02-15  1970  	pl->phy_state.pause = MLO_PAUSE_NONE;
97fec51fe79b13 Russell King          2020-02-15  1971  	pl->phy_state.speed = SPEED_UNKNOWN;
97fec51fe79b13 Russell King          2020-02-15  1972  	pl->phy_state.duplex = DUPLEX_UNKNOWN;
ae0e4bb2a0e0e4 Sean Anderson         2022-09-20  1973  	pl->phy_state.rate_matching = RATE_MATCH_NONE;
9525ae83959b60 Russell King          2017-07-25  1974  	linkmode_copy(pl->supported, supported);
9525ae83959b60 Russell King          2017-07-25  1975  	linkmode_copy(pl->link_config.advertising, config.advertising);
9525ae83959b60 Russell King          2017-07-25  1976  
cc1122b00d624e Colin Ian King        2018-03-01  1977  	/* Restrict the phy advertisement according to the MAC support. */
3c1bcc8614db10 Andrew Lunn           2018-11-10  1978  	linkmode_copy(phy->advertising, config.advertising);
9525ae83959b60 Russell King          2017-07-25  1979  	mutex_unlock(&pl->state_mutex);
9525ae83959b60 Russell King          2017-07-25  1980  	mutex_unlock(&phy->lock);
9525ae83959b60 Russell King          2017-07-25  1981  
17091180b1521e Ioana Ciornei         2019-05-28  1982  	phylink_dbg(pl,
a18e6521a7d95d Russell King (Oracle  2021-11-19  1983) 		    "phy: %s setting supported %*pb advertising %*pb\n",
a18e6521a7d95d Russell King (Oracle  2021-11-19  1984) 		    phy_modes(interface),
9525ae83959b60 Russell King          2017-07-25  1985  		    __ETHTOOL_LINK_MODE_MASK_NBITS, pl->supported,
3c1bcc8614db10 Andrew Lunn           2018-11-10  1986  		    __ETHTOOL_LINK_MODE_MASK_NBITS, phy->advertising);
9525ae83959b60 Russell King          2017-07-25  1987  
434a4315b9617b Heiner Kallweit       2019-01-23  1988  	if (phy_interrupt_is_valid(phy))
434a4315b9617b Heiner Kallweit       2019-01-23  1989  		phy_request_interrupt(phy);
9525ae83959b60 Russell King          2017-07-25  1990  
96de900ae78e7d Shenwei Wang          2022-10-14  1991  	if (pl->config->mac_managed_pm)
96de900ae78e7d Shenwei Wang          2022-10-14  1992  		phy->mac_managed_pm = true;
96de900ae78e7d Shenwei Wang          2022-10-14  1993  
9525ae83959b60 Russell King          2017-07-25  1994  	return 0;
9525ae83959b60 Russell King          2017-07-25  1995  }
9525ae83959b60 Russell King          2017-07-25  1996  

:::::: The code at line 1960 was first introduced by commit
:::::: e27f178793de16ca1b421f2c3f4bc3497b2ce723 net: phy: Added IRQ print to phylink_bringup_phy()

:::::: TO: Florian Fainelli <f.fainelli@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
