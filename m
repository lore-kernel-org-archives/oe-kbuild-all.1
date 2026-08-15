Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775131E5018
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 04:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786766604; cv=none; b=BuyKwVBueqYxJeIgE/O+TTeAASWQIgTW1GTBC1gHfIq2fZj3aTWTJXRXYJyDCk7dahKQh+psxiYDB7vnlJOdqf8RtgLQbSuRl8M9tk3RpfDLaWoXz2fuAZEqwOGKGPajJ+zy6DOibOWHpMRnp/lWlS3pxu1gIqQfhVgUBVSGSJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786766604; c=relaxed/simple;
	bh=Wq1jfBHU6G3uulk8pRmQz8jPI3a4+td5cTZ2TDYBu2g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O9Xow3XJDRUfNk7NJQUtwAnqKRo7fEtCh/OTlgPnO0yhQZ71E43r/XcR9chz0Rd3WGqklhgs85icxvL5EU+NAXHmrCSnpWDO9oQR92qlaWJh2AxNOm3C+3PCwC1rgCQ2PU6JYvj9gWWHzOV8XKO66zpOkzj7+xGW1BVWJR7CiLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mX0uRIPu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mX0uRIPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786766601; x=1818302601;
  h=date:from:to:cc:subject:message-id;
  bh=Wq1jfBHU6G3uulk8pRmQz8jPI3a4+td5cTZ2TDYBu2g=;
  b=mX0uRIPuqvIkcelN/LkRF2JjIL6DyvUFY3v0lTYXEBcL8heDbjs7A9jM
   mQ9Pzmh8srtbFRlvB24AWU2OlAsEYP3QJ/nlh2CZFqa5L2hIPRqxj4YS5
   gbQcClXpDe6iL4VxWfAHCyW4T4WVwP3emPh7dr51uPU1yngfydlhdD1W5
   BcXxqXz6rOY3vb2UGcySvR4SpLEvKN3vEhXbCGX/j6IgSyzEoYorRc2vI
   BN1IhmUQrhBQHXjsiG9pJvGc+cvfwM+Vb9DZ/Vp6cvYNcWc0Xoenq7o3b
   mC93cAhJavcM8K+5Ati2W9ucEZ5p4RrADAbyYpeBznipD1v+ljVsh/kmi
   A==;
X-CSE-ConnectionGUID: CBypy1wXS/Op082nZtu7AQ==
X-CSE-MsgGUID: pyzgO0QDR9SlTjbQl30mPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87552819"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="87552819"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 21:03:21 -0700
X-CSE-ConnectionGUID: tfYMij6pS8aGo2sArPdNiA==
X-CSE-MsgGUID: JyCESE63R/yKwzR1M5bP6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="261115580"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Aug 2026 21:03:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv5c3-00000000b3Y-3t2C;
	Sat, 15 Aug 2026 04:03:15 +0000
Date: Sat, 15 Aug 2026 12:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/net/phy/phylink.c:1658: undefined reference to `phy_lookup_setting'
Message-ID: <202608151246.AYHWUmTH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alistair,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c3360dde0a9e76954535eba2b9cb287adf4d6444
commit: 8b9a794068e9fe10f91796ee053afdbd5c01782c [1/1] Revert "ANDROID: suppress GKI configs for 32-bit builds"
config: arm-randconfig-002-20260815 (https://download.01.org/0day-ci/archive/20260815/202608151246.AYHWUmTH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608151246.AYHWUmTH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151246.AYHWUmTH-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: arch/arm/mach-omap1/irq.o: in function `omap1_init_irq':
   arch/arm/mach-omap1/irq.c:171: undefined reference to `irq_alloc_generic_chip'
   arm-linux-gnueabi-ld: arch/arm/mach-omap1/irq.c:179: undefined reference to `irq_setup_generic_chip'
   arm-linux-gnueabi-ld: arch/arm/mach-omap1/irq.c:207: undefined reference to `irq_gc_mask_set_bit'
   arm-linux-gnueabi-ld: arch/arm/mach-omap1/irq.c:207: undefined reference to `irq_gc_mask_clr_bit'
   arm-linux-gnueabi-ld: arch/arm/mach-omap1/irq.c:207: undefined reference to `irq_gc_set_wake'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
>> drivers/net/phy/phylink.c:1658: undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   drivers/net/phy/phylink.c:1456: undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1459: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   drivers/net/phy/phylink.c:2840: undefined reference to `phy_init_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   drivers/net/phy/phylink.c:3853: undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   drivers/net/phy/phylink.c:2900: undefined reference to `swphy_read_reg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   drivers/net/phy/phylink.c:981: undefined reference to `linkmode_resolve_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   drivers/net/phy/phylink.c:1203: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1241: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1253: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   drivers/net/phy/phylink.c:2711: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   drivers/net/phy/phylink.c:2144: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2155: undefined reference to `phy_disconnect'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   drivers/net/phy/phylink.c:2403: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2409: undefined reference to `phy_ethtool_get_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   drivers/net/phy/phylink.c:2428: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2431: undefined reference to `phy_ethtool_set_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   drivers/net/phy/phylink.c:2693: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2696: undefined reference to `phy_restart_aneg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   drivers/net/phy/phylink.c:2819: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2822: undefined reference to `phy_get_eee_err'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   drivers/net/phy/phylink.c:2855: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2858: undefined reference to `phy_ethtool_get_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   drivers/net/phy/phylink.c:2873: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2876: undefined reference to `phy_ethtool_set_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:3059: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2943: undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2947: undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2984: undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2988: undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3082: undefined reference to `phy_mii_ioctl'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   drivers/net/phy/phylink.c:3130: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3133: undefined reference to `phy_speed_down'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   drivers/net/phy/phylink.c:3153: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3156: undefined reference to `phy_speed_up'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   drivers/net/phy/phylink.c:3802: undefined reference to `mdiobus_modify_changed'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   include/linux/mdio.h:664: undefined reference to `mdiobus_modify'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   drivers/net/phy/phylink.c:2476: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2479: undefined reference to `phy_ethtool_ksettings_get'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   include/linux/mdio.h:652: undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: include/linux/mdio.h:658: undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   include/linux/mdio.h:652: undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: include/linux/mdio.h:652: undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   drivers/net/phy/phylink.c:2223: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2225: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2231: undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2271: undefined reference to `phy_start'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   drivers/net/phy/phylink.c:2364: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   drivers/net/phy/phylink.c:1825: undefined reference to `phy_get_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   drivers/net/phy/phylink.c:2291: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2296: undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   drivers/net/phy/phylink.c:2327: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2341: undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   drivers/net/phy/phylink.c:2731: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2766: undefined reference to `linkmode_set_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2789: undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   drivers/net/phy/phylink.c:678: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   drivers/net/phy/phylink.c:726: undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   drivers/net/phy/phylink.c:2013: undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1940: undefined reference to `phy_support_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1882: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1903: undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1949: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1960: undefined reference to `phy_attached_info_irq'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1961: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1989: undefined reference to `phy_request_interrupt'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2047: undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   drivers/net/phy/phylink.c:2528: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2555: undefined reference to `phy_ethtool_ksettings_set'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +1658 drivers/net/phy/phylink.c

ce0aa27ff3f68ed Russell King 2017-07-25  1637  
4b3fc475c61fa87 Russell King 2024-09-06  1638  /**
4b3fc475c61fa87 Russell King 2024-09-06  1639   * phylink_set_fixed_link() - set the fixed link
4b3fc475c61fa87 Russell King 2024-09-06  1640   * @pl: a pointer to a &struct phylink returned from phylink_create()
4b3fc475c61fa87 Russell King 2024-09-06  1641   * @state: a pointer to a struct phylink_link_state.
4b3fc475c61fa87 Russell King 2024-09-06  1642   *
4b3fc475c61fa87 Russell King 2024-09-06  1643   * This function is used when the link parameters are known and do not change,
4b3fc475c61fa87 Russell King 2024-09-06  1644   * making it suitable for certain types of network connections.
4b3fc475c61fa87 Russell King 2024-09-06  1645   *
4b3fc475c61fa87 Russell King 2024-09-06  1646   * Returns: zero on success or negative error code.
4b3fc475c61fa87 Russell King 2024-09-06  1647   */
4b3fc475c61fa87 Russell King 2024-09-06  1648  int phylink_set_fixed_link(struct phylink *pl,
4b3fc475c61fa87 Russell King 2024-09-06  1649  			   const struct phylink_link_state *state)
4b3fc475c61fa87 Russell King 2024-09-06  1650  {
4b3fc475c61fa87 Russell King 2024-09-06  1651  	const struct phy_setting *s;
4b3fc475c61fa87 Russell King 2024-09-06  1652  	unsigned long *adv;
4b3fc475c61fa87 Russell King 2024-09-06  1653  
4b3fc475c61fa87 Russell King 2024-09-06  1654  	if (pl->cfg_link_an_mode != MLO_AN_PHY || !state ||
4b3fc475c61fa87 Russell King 2024-09-06  1655  	    !test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state))
4b3fc475c61fa87 Russell King 2024-09-06  1656  		return -EINVAL;
4b3fc475c61fa87 Russell King 2024-09-06  1657  
4b3fc475c61fa87 Russell King 2024-09-06 @1658  	s = phy_lookup_setting(state->speed, state->duplex,
4b3fc475c61fa87 Russell King 2024-09-06  1659  			       pl->supported, true);
4b3fc475c61fa87 Russell King 2024-09-06  1660  	if (!s)
4b3fc475c61fa87 Russell King 2024-09-06  1661  		return -EINVAL;
4b3fc475c61fa87 Russell King 2024-09-06  1662  
4b3fc475c61fa87 Russell King 2024-09-06  1663  	adv = pl->link_config.advertising;
4b3fc475c61fa87 Russell King 2024-09-06  1664  	linkmode_zero(adv);
4b3fc475c61fa87 Russell King 2024-09-06  1665  	linkmode_set_bit(s->bit, adv);
4b3fc475c61fa87 Russell King 2024-09-06  1666  	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, adv);
4b3fc475c61fa87 Russell King 2024-09-06  1667  
4b3fc475c61fa87 Russell King 2024-09-06  1668  	pl->link_config.speed = state->speed;
4b3fc475c61fa87 Russell King 2024-09-06  1669  	pl->link_config.duplex = state->duplex;
4b3fc475c61fa87 Russell King 2024-09-06  1670  	pl->link_config.link = 1;
4b3fc475c61fa87 Russell King 2024-09-06  1671  	pl->link_config.an_complete = 1;
4b3fc475c61fa87 Russell King 2024-09-06  1672  
4b3fc475c61fa87 Russell King 2024-09-06  1673  	pl->cfg_link_an_mode = MLO_AN_FIXED;
4b3fc475c61fa87 Russell King 2024-09-06  1674  	pl->cur_link_an_mode = pl->cfg_link_an_mode;
4b3fc475c61fa87 Russell King 2024-09-06  1675  
4b3fc475c61fa87 Russell King 2024-09-06  1676  	return 0;
4b3fc475c61fa87 Russell King 2024-09-06  1677  }
4b3fc475c61fa87 Russell King 2024-09-06  1678  EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
4b3fc475c61fa87 Russell King 2024-09-06  1679  

:::::: The code at line 1658 was first introduced by commit
:::::: 4b3fc475c61fa8733a9acc9d743f6cc9ca4915f5 net: phylink: Add phylink_set_fixed_link() to configure fixed link state in phylink

:::::: TO: Russell King <linux@armlinux.org.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
