Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE31329E5D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 23:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723903; cv=none; b=CfyHg7GToXgCb2Y5SIu1dvXc9q/ifd5TS/TgNYARRzaoh1p/RHFYkvDKhplD0HA4nikfx1VTt6v3jooxaj0zh2u/NJLQuDgthzWqfzxn25en6dXxsTs/Z4rlgD/alnxZak6izPboA99JBunQex1QktOjPKVm/Xi6Jk/fiyK1aiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723903; c=relaxed/simple;
	bh=sCPXvEEEs5yIaiZFy93hedMoHhyuYIT9seT1b0r6Om0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n5epLyK1aljElUZCcolSv7fDDQp7HZdPo1wcb6EN5vBfuXYydRvhwn+yQa8JrFikqHkaToS0AyZPDSa9ofBeZv82Zg1VTYkMurAADDMid8wq1tZhmoW3MQ3WmOvnysfS+bZ++3bcAe3mv7HXR8fm1eUBMX5LdUJ7fjkshMmyhsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/uc3PHz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/uc3PHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790723901; x=1822259901;
  h=date:from:to:cc:subject:message-id;
  bh=sCPXvEEEs5yIaiZFy93hedMoHhyuYIT9seT1b0r6Om0=;
  b=A/uc3PHzrW1kEiqppK1bhndD1aSfoj/JL6JQvn/9zcLGCP6HUeRycjQc
   DqCWvQYYuPeFLS0rWZLGi316SEXE+AaIBKoIwGnsfYJr67/qrmtnaOegQ
   nEOewdChbaKHOSjeUG7jMMLVo01Q+XAXHEVpcYhxYKMHabd7dE1OXxqFI
   uc/bAzAQnN3HqExh/4qn8lPNev1Vg+VqkQd3uX/EzVbxcdmMgUSxtaQP7
   pvpFENbDV2HHq1JxjHppUcFOsdqok1Dl3/9RPbetHO1uiAkCmWU5+3eC9
   4ACx6PEXKqQ0jgIj77z49/F8m2ml3fF36grzMYBECp2po5aEOBVuPIS/L
   A==;
X-CSE-ConnectionGUID: cFJauOkoT7elvUTgCM5bPQ==
X-CSE-MsgGUID: f0U1Otv8Q9G9/VUN7MbnYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90672911"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90672911"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 16:18:21 -0700
X-CSE-ConnectionGUID: 9zcKkgsWQEWhRyRdG+5ZhA==
X-CSE-MsgGUID: xC1lieIFSviQvuVUXF7G3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="279319531"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2026 16:18:19 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBh5U-00000000PsQ-0nWT;
	Tue, 29 Sep 2026 23:18:16 +0000
Date: Wed, 30 Sep 2026 07:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 drivers/net/phy/phylink.c:1759:(.text.phylink_set_fixed_link+0xf0): undefined
 reference to `phy_caps_lookup'
Message-ID: <202609300753.2h0Y0EnF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   d26d03d72731ff281605b9c99f1acecaa0556bfc
commit: add2a3ec5fa37f0c1be4022f4b51178803463a24 [1/1] Merge 1a9239bb4253 ("Merge tag 'net-next-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next") into android-mainline
config: arm-randconfig-1000-20260929 (https://download.01.org/0day-ci/archive/20260930/202609300753.2h0Y0EnF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300753.2h0Y0EnF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300753.2h0Y0EnF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: lib/dim/net_dim.o: in function `net_dim_free_irq_moder':
   lib/dim/net_dim.c:156:(.text.net_dim_free_irq_moder+0x54): undefined reference to `lockdep_rtnl_is_held'
   arm-linux-gnueabi-ld: lib/dim/net_dim.c:157:(.text.net_dim_free_irq_moder+0xc4): undefined reference to `lockdep_rtnl_is_held'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
>> drivers/net/phy/phylink.c:1759:(.text.phylink_set_fixed_link+0xf0): undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   drivers/net/phy/phylink.c:850:(.text.phylink_resolve_an_pause+0x44): undefined reference to `linkmode_resolve_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   drivers/net/phy/phylink.c:1557:(.text.phylink_link_down+0x34): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1563:(.text.phylink_link_down+0xa4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_activate_lpi':
   drivers/net/phy/phylink.c:1490:(.text.phylink_activate_lpi+0x110): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode':
   drivers/net/phy/phylink.c:1082:(.text.phylink_pcs_neg_mode+0xac): undefined reference to `phy_inband_caps'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1118:(.text.phylink_pcs_neg_mode+0x2cc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1181:(.text.phylink_pcs_neg_mode+0x4d8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_caps_to_linkmodes':
>> drivers/net/phy/phylink.c:369:(.text.phylink_caps_to_linkmodes+0xcc): undefined reference to `phy_caps_linkmodes'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   drivers/net/phy/phylink.c:1928:(.text.phylink_phy_change+0x30): undefined reference to `phy_get_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block':
>> drivers/net/phy/phylink.c:2475:(.text.phylink_rx_clk_stop_block+0x18): undefined reference to `rtnl_is_locked'
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2478:(.text.phylink_rx_clk_stop_block+0xa4): undefined reference to `netdev_printk'
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2490:(.text.phylink_rx_clk_stop_block+0x10c): undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock':
>> drivers/net/phy/phylink.c:2504:(.text.phylink_rx_clk_stop_unblock+0x18): undefined reference to `rtnl_is_locked'
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2507:(.text.phylink_rx_clk_stop_unblock+0xa8): undefined reference to `netdev_printk'
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2519:(.text.phylink_rx_clk_stop_unblock+0x114): undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   drivers/net/phy/phylink.c:2996:(.text.phylink_ethtool_get_pauseparam+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   drivers/net/phy/phylink.c:2296:(.text.phylink_disconnect_phy+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2309:(.text.phylink_disconnect_phy+0xa0): undefined reference to `phy_disconnect'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_prepare_resume':
>> drivers/net/phy/phylink.c:2579:(.text.phylink_prepare_resume+0x1c): undefined reference to `rtnl_is_locked'
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2588:(.text.phylink_prepare_resume+0x74): undefined reference to `phy_resume'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   drivers/net/phy/phylink.c:2640:(.text.phylink_ethtool_get_wol+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2646:(.text.phylink_ethtool_get_wol+0x64): undefined reference to `phy_ethtool_get_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   drivers/net/phy/phylink.c:2665:(.text.phylink_ethtool_set_wol+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2668:(.text.phylink_ethtool_set_wol+0x58): undefined reference to `phy_ethtool_set_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   drivers/net/phy/phylink.c:2978:(.text.phylink_ethtool_nway_reset+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2981:(.text.phylink_ethtool_nway_reset+0x50): undefined reference to `phy_restart_aneg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   drivers/net/phy/phylink.c:3016:(.text.phylink_ethtool_set_pauseparam+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3051:(.text.phylink_ethtool_set_pauseparam+0x144): undefined reference to `linkmode_set_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3074:(.text.phylink_ethtool_set_pauseparam+0x1bc): undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   drivers/net/phy/phylink.c:3104:(.text.phylink_get_eee_err+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3107:(.text.phylink_get_eee_err+0x50): undefined reference to `phy_get_eee_err'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   drivers/net/phy/phylink.c:3122:(.text.phylink_ethtool_get_eee+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3128:(.text.phylink_ethtool_get_eee+0x94): undefined reference to `phy_ethtool_get_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   drivers/net/phy/phylink.c:3149:(.text.phylink_ethtool_set_eee+0x20): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3165:(.text.phylink_ethtool_set_eee+0xc0): undefined reference to `phy_ethtool_set_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   drivers/net/phy/phylink.c:4138:(.text.phylink_mii_c45_pcs_get_state+0x2c): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_read':
   include/linux/mdio.h:633:(.text.phylink_mii_c22_pcs_get_state+0x2c): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: include/linux/mdio.h:633:(.text.phylink_mii_c22_pcs_get_state+0x44): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_read':
   drivers/net/phy/phylink.c:3209:(.text.phylink_phy_read+0x50): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3239:(.text.phylink_phy_read+0xa8): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3235:(.text.phylink_phy_read+0x128): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_write':
   drivers/net/phy/phylink.c:3251:(.text.phylink_phy_write+0x60): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3280:(.text.phylink_phy_write+0xbc): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3276:(.text.phylink_phy_write+0x148): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_read':
   include/linux/mdio.h:633:(.text.phylink_mii_c22_pcs_an_restart+0x24): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_write':
   include/linux/mdio.h:639:(.text.phylink_mii_c22_pcs_an_restart+0x54): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   drivers/net/phy/phylink.c:3192:(.text.phylink_mii_emul_read+0x60): undefined reference to `swphy_read_reg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:3351:(.text.phylink_mii_ioctl+0x24): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3374:(.text.phylink_mii_ioctl+0x130): undefined reference to `phy_mii_ioctl'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   drivers/net/phy/phylink.c:3422:(.text.phylink_speed_down+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3425:(.text.phylink_speed_down+0x64): undefined reference to `phy_speed_down'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   drivers/net/phy/phylink.c:3445:(.text.phylink_speed_up+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3448:(.text.phylink_speed_up+0x5c): undefined reference to `phy_speed_up'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   drivers/net/phy/phylink.c:4087:(.text.phylink_mii_c22_pcs_config+0x60): undefined reference to `mdiobus_modify_changed'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_modify':
   include/linux/mdio.h:645:(.text.phylink_mii_c22_pcs_config+0xe4): undefined reference to `mdiobus_modify'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   drivers/net/phy/phylink.c:2445:(.text.phylink_stop+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2450:(.text.phylink_stop+0x68): undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   drivers/net/phy/phylink.c:2539:(.text.phylink_suspend+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2553:(.text.phylink_suspend+0xc0): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   drivers/net/phy/phylink.c:1225:(.text.phylink_major_config+0xf0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1249:(.text.phylink_major_config+0x1d8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1278:(.text.phylink_major_config+0x408): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1291:(.text.phylink_major_config+0x4f4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1304:(.text.phylink_major_config+0x5fc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1312:(.text.phylink_major_config+0x658): undefined reference to `phy_config_inband'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1314:(.text.phylink_major_config+0x6c4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
>> drivers/net/phy/phylink.c:427:(.text.phylink_get_capabilities+0x20): undefined reference to `phy_caps_from_interface'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_up':
   drivers/net/phy/phylink.c:1543:(.text.phylink_link_up+0x1b0): undefined reference to `netif_carrier_on'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1545:(.text.phylink_link_up+0x1dc): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1545:(.text.phylink_link_up+0x1f0): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1545:(.text.phylink_link_up+0x23c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1545:(.text.phylink_link_up+0x254): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1545:(.text.phylink_link_up+0x25c): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   drivers/net/phy/phylink.c:2377:(.text.phylink_start+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2379:(.text.phylink_start+0xb0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2385:(.text.phylink_start+0xe4): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2425:(.text.phylink_start+0x2b4): undefined reference to `phy_start'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   drivers/net/phy/phylink.c:2601:(.text.phylink_resume+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   drivers/net/phy/phylink.c:524:(.text.phylink_validate_mac_and_pcs+0x178): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:536:(.text.phylink_validate_mac_and_pcs+0x214): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   drivers/net/phy/phylink.c:583:(.text.phylink_validate_one+0x88): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   drivers/net/phy/phylink.c:773:(.text.phylink_parse_mode+0x184): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:814:(.text.phylink_parse_mode+0x2c8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:823:(.text.phylink_parse_mode+0x344): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   drivers/net/phy/phylink.c:2012:(.text.phylink_validate_phy+0x94): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1979:(.text.phylink_validate_phy+0x10c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1991:(.text.phylink_validate_phy+0x1dc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   drivers/net/phy/phylink.c:2049:(.text.phylink_bringup_phy+0x28): undefined reference to `phy_support_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2069:(.text.phylink_bringup_phy+0xdc): undefined reference to `phy_attached_info_irq'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2058:(.text.phylink_bringup_phy+0x15c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2070:(.text.phylink_bringup_phy+0x1bc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2098:(.text.phylink_bringup_phy+0x314): undefined reference to `phy_support_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2115:(.text.phylink_bringup_phy+0x38c): undefined reference to `phy_disable_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2128:(.text.phylink_bringup_phy+0x3d0): undefined reference to `phy_request_interrupt'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2140:(.text.phylink_bringup_phy+0x42c): undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2134:(.text.phylink_bringup_phy+0x474): undefined reference to `phy_eee_tx_clock_stop_capable'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_attach_phy':
   drivers/net/phy/phylink.c:2165:(.text.phylink_connect_phy+0xd0): undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   drivers/net/phy/phylink.c:2199:(.text.phylink_connect_phy+0x120): undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   drivers/net/phy/phylink.c:2811:(.text.phylink_ethtool_ksettings_set+0x20): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2838:(.text.phylink_ethtool_ksettings_set+0x88): undefined reference to `phy_ethtool_ksettings_set'
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2852:(.text.phylink_ethtool_ksettings_set+0x10c): undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_sfp_select_interface':
   drivers/net/phy/phylink.c:2681:(.text.phylink_ethtool_ksettings_set+0x2c8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   drivers/net/phy/phylink.c:2739:(.text.phylink_ethtool_ksettings_get+0x20): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2742:(.text.phylink_ethtool_ksettings_get+0x5c): undefined reference to `phy_ethtool_ksettings_get'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   drivers/net/phy/phylink.c:694:(.text.phylink_parse_fixedlink+0x2bc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:715:(.text.phylink_parse_fixedlink+0x3ec): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:741:(.text.phylink_parse_fixedlink+0x534): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:724:(.text.phylink_parse_fixedlink+0x5f0): undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   drivers/net/phy/phylink.c:1821:(.text.phylink_create+0x114): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/power/supply/da9150-charger.o: in function `da9150_charger_probe':
   drivers/power/supply/da9150-charger.c:567:(.text.da9150_charger_probe+0x2cc): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   drivers/power/supply/rt9455_charger.c:1638:(.text.rt9455_probe+0x200): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   drivers/power/supply/bq25890_charger.c:1504:(.text.bq25890_probe+0x3e0): undefined reference to `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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


vim +1759 drivers/net/phy/phylink.c

ce0aa27ff3f68e Russell King          2017-07-25  1738  
4b3fc475c61fa8 Russell King          2024-09-06  1739  /**
4b3fc475c61fa8 Russell King          2024-09-06  1740   * phylink_set_fixed_link() - set the fixed link
4b3fc475c61fa8 Russell King          2024-09-06  1741   * @pl: a pointer to a &struct phylink returned from phylink_create()
4b3fc475c61fa8 Russell King          2024-09-06  1742   * @state: a pointer to a struct phylink_link_state.
4b3fc475c61fa8 Russell King          2024-09-06  1743   *
4b3fc475c61fa8 Russell King          2024-09-06  1744   * This function is used when the link parameters are known and do not change,
4b3fc475c61fa8 Russell King          2024-09-06  1745   * making it suitable for certain types of network connections.
4b3fc475c61fa8 Russell King          2024-09-06  1746   *
4b3fc475c61fa8 Russell King          2024-09-06  1747   * Returns: zero on success or negative error code.
4b3fc475c61fa8 Russell King          2024-09-06  1748   */
4b3fc475c61fa8 Russell King          2024-09-06  1749  int phylink_set_fixed_link(struct phylink *pl,
4b3fc475c61fa8 Russell King          2024-09-06  1750  			   const struct phylink_link_state *state)
4b3fc475c61fa8 Russell King          2024-09-06  1751  {
de7d3f87be3cba Maxime Chevallier     2025-03-07  1752  	const struct link_capabilities *c;
4b3fc475c61fa8 Russell King          2024-09-06  1753  	unsigned long *adv;
4b3fc475c61fa8 Russell King          2024-09-06  1754  
4b3fc475c61fa8 Russell King          2024-09-06  1755  	if (pl->cfg_link_an_mode != MLO_AN_PHY || !state ||
4b3fc475c61fa8 Russell King          2024-09-06  1756  	    !test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state))
4b3fc475c61fa8 Russell King          2024-09-06  1757  		return -EINVAL;
4b3fc475c61fa8 Russell King          2024-09-06  1758  
de7d3f87be3cba Maxime Chevallier     2025-03-07 @1759  	c = phy_caps_lookup(state->speed, state->duplex,
4b3fc475c61fa8 Russell King          2024-09-06  1760  			    pl->supported, true);
de7d3f87be3cba Maxime Chevallier     2025-03-07  1761  	if (!c)
4b3fc475c61fa8 Russell King          2024-09-06  1762  		return -EINVAL;
4b3fc475c61fa8 Russell King          2024-09-06  1763  
4b3fc475c61fa8 Russell King          2024-09-06  1764  	adv = pl->link_config.advertising;
de7d3f87be3cba Maxime Chevallier     2025-03-07  1765  	linkmode_and(adv, pl->supported, c->linkmodes);
4b3fc475c61fa8 Russell King          2024-09-06  1766  	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, adv);
4b3fc475c61fa8 Russell King          2024-09-06  1767  
4b3fc475c61fa8 Russell King          2024-09-06  1768  	pl->link_config.speed = state->speed;
4b3fc475c61fa8 Russell King          2024-09-06  1769  	pl->link_config.duplex = state->duplex;
4b3fc475c61fa8 Russell King          2024-09-06  1770  	pl->link_config.link = 1;
4b3fc475c61fa8 Russell King          2024-09-06  1771  	pl->link_config.an_complete = 1;
4b3fc475c61fa8 Russell King          2024-09-06  1772  
4b3fc475c61fa8 Russell King          2024-09-06  1773  	pl->cfg_link_an_mode = MLO_AN_FIXED;
1f92ead7e15003 Russell King (Oracle  2024-12-03  1774) 	pl->req_link_an_mode = pl->cfg_link_an_mode;
4b3fc475c61fa8 Russell King          2024-09-06  1775  
4b3fc475c61fa8 Russell King          2024-09-06  1776  	return 0;
4b3fc475c61fa8 Russell King          2024-09-06  1777  }
4b3fc475c61fa8 Russell King          2024-09-06  1778  EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
4b3fc475c61fa8 Russell King          2024-09-06  1779  
8796c8923d9c42 Russell King          2017-12-01  1780  /**
8796c8923d9c42 Russell King          2017-12-01  1781   * phylink_create() - create a phylink instance
9db74e51ec08d7 Randy Dunlap          2019-10-08  1782   * @config: a pointer to the target &struct phylink_config
8fa7b9b6af252c Russell King          2017-12-01  1783   * @fwnode: a pointer to a &struct fwnode_handle describing the network
8fa7b9b6af252c Russell King          2017-12-01  1784   *	interface
8796c8923d9c42 Russell King          2017-12-01  1785   * @iface: the desired link mode defined by &typedef phy_interface_t
e7765d634aaa9d Russell King          2020-03-30  1786   * @mac_ops: a pointer to a &struct phylink_mac_ops for the MAC.
8796c8923d9c42 Russell King          2017-12-01  1787   *
8796c8923d9c42 Russell King          2017-12-01  1788   * Create a new phylink instance, and parse the link parameters found in @np.
8796c8923d9c42 Russell King          2017-12-01  1789   * This will parse in-band modes, fixed-link or SFP configuration.
8796c8923d9c42 Russell King          2017-12-01  1790   *
269a6b5f23a688 Russell King          2019-11-19  1791   * Note: the rtnl lock must not be held when calling this function.
269a6b5f23a688 Russell King          2019-11-19  1792   *
8796c8923d9c42 Russell King          2017-12-01  1793   * Returns a pointer to a &struct phylink, or an error-pointer value. Users
8796c8923d9c42 Russell King          2017-12-01  1794   * must use IS_ERR() to check for errors from this function.
8796c8923d9c42 Russell King          2017-12-01  1795   */
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  1796  struct phylink *phylink_create(struct phylink_config *config,
a0b7955310a445 Russell King (Oracle  2023-05-12  1797) 			       const struct fwnode_handle *fwnode,
516b29edc3b332 Florian Fainelli      2017-10-30  1798  			       phy_interface_t iface,
e7765d634aaa9d Russell King          2020-03-30  1799  			       const struct phylink_mac_ops *mac_ops)
9525ae83959b60 Russell King          2017-07-25  1800  {
9525ae83959b60 Russell King          2017-07-25  1801  	struct phylink *pl;
9525ae83959b60 Russell King          2017-07-25  1802  	int ret;
9525ae83959b60 Russell King          2017-07-25  1803  
1054457006d4a1 Russell King (Oracle  2022-02-21  1804) 	/* Validate the supplied configuration */
de5c9bf40c4582 Russell King (Oracle  2023-05-20  1805) 	if (phy_interface_empty(config->supported_interfaces)) {
d1e86325af3771 Russell King (Oracle  2021-12-15  1806) 		dev_err(config->dev,
de5c9bf40c4582 Russell King (Oracle  2023-05-20  1807) 			"phylink: error: empty supported_interfaces\n");
d1e86325af3771 Russell King (Oracle  2021-12-15  1808) 		return ERR_PTR(-EINVAL);
d1e86325af3771 Russell King (Oracle  2021-12-15  1809) 	}
d1e86325af3771 Russell King (Oracle  2021-12-15  1810) 
9525ae83959b60 Russell King          2017-07-25  1811  	pl = kzalloc(sizeof(*pl), GFP_KERNEL);
9525ae83959b60 Russell King          2017-07-25  1812  	if (!pl)
9525ae83959b60 Russell King          2017-07-25  1813  		return ERR_PTR(-ENOMEM);
9525ae83959b60 Russell King          2017-07-25  1814  
9525ae83959b60 Russell King          2017-07-25  1815  	mutex_init(&pl->state_mutex);
9525ae83959b60 Russell King          2017-07-25  1816  	INIT_WORK(&pl->resolve, phylink_resolve);
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  1817  
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  1818  	pl->config = config;
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  1819  	if (config->type == PHYLINK_NETDEV) {
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  1820  		pl->netdev = to_net_dev(config->dev);
02d5fdbf4f2b8c Klaus Kudielka        2023-11-07  1821  		netif_carrier_off(pl->netdev);
43de61959b9992 Ioana Ciornei         2019-05-28  1822  	} else if (config->type == PHYLINK_DEV) {
43de61959b9992 Ioana Ciornei         2019-05-28  1823  		pl->dev = config->dev;
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  1824  	} else {
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  1825  		kfree(pl);
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  1826  		return ERR_PTR(-EINVAL);
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  1827  	}
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  1828  
2001d21592e5eb Russell King (Oracle  2025-02-10  1829) 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
03abf2a7c65451 Russell King (Oracle  2025-01-15  1830) 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
03abf2a7c65451 Russell King (Oracle  2025-01-15  1831) 			       pl->config->lpi_capabilities &&
03abf2a7c65451 Russell King (Oracle  2025-01-15  1832) 			       !phy_interface_empty(pl->config->lpi_interfaces);
03abf2a7c65451 Russell King (Oracle  2025-01-15  1833) 
03abf2a7c65451 Russell King (Oracle  2025-01-15  1834) 	/* Set the default EEE configuration */
03abf2a7c65451 Russell King (Oracle  2025-01-15  1835) 	pl->eee_cfg.eee_enabled = pl->config->eee_enabled_default;
03abf2a7c65451 Russell King (Oracle  2025-01-15  1836) 	pl->eee_cfg.tx_lpi_enabled = pl->eee_cfg.eee_enabled;
03abf2a7c65451 Russell King (Oracle  2025-01-15  1837) 	pl->eee_cfg.tx_lpi_timer = pl->config->lpi_timer_default;
03abf2a7c65451 Russell King (Oracle  2025-01-15  1838) 
9525ae83959b60 Russell King          2017-07-25  1839  	pl->phy_state.interface = iface;
9525ae83959b60 Russell King          2017-07-25  1840  	pl->link_interface = iface;
4be11ef0bdf5b3 Florian Fainelli      2017-12-12  1841  	if (iface == PHY_INTERFACE_MODE_MOCA)
4be11ef0bdf5b3 Florian Fainelli      2017-12-12  1842  		pl->link_port = PORT_BNC;
4be11ef0bdf5b3 Florian Fainelli      2017-12-12  1843  	else
9525ae83959b60 Russell King          2017-07-25  1844  		pl->link_port = PORT_MII;
9525ae83959b60 Russell King          2017-07-25  1845  	pl->link_config.interface = iface;
9525ae83959b60 Russell King          2017-07-25  1846  	pl->link_config.pause = MLO_PAUSE_AN;
9525ae83959b60 Russell King          2017-07-25  1847  	pl->link_config.speed = SPEED_UNKNOWN;
9525ae83959b60 Russell King          2017-07-25  1848  	pl->link_config.duplex = DUPLEX_UNKNOWN;
90ef0a7b0622c6 Russell King (Oracle  2023-07-13  1849) 	pl->pcs_state = PCS_STATE_DOWN;
e7765d634aaa9d Russell King          2020-03-30  1850  	pl->mac_ops = mac_ops;
9525ae83959b60 Russell King          2017-07-25  1851  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
9cd00a8aa42e44 Russell King          2018-05-10  1852  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
9525ae83959b60 Russell King          2017-07-25  1853  
ba50a8d4025808 Russell King (Oracle  2023-11-15  1854) 	linkmode_fill(pl->supported);
9525ae83959b60 Russell King          2017-07-25  1855  	linkmode_copy(pl->link_config.advertising, pl->supported);
9525ae83959b60 Russell King          2017-07-25  1856  	phylink_validate(pl, pl->supported, &pl->link_config);
9525ae83959b60 Russell King          2017-07-25  1857  
8fa7b9b6af252c Russell King          2017-12-01  1858  	ret = phylink_parse_mode(pl, fwnode);
9525ae83959b60 Russell King          2017-07-25  1859  	if (ret < 0) {
9525ae83959b60 Russell King          2017-07-25  1860  		kfree(pl);
9525ae83959b60 Russell King          2017-07-25  1861  		return ERR_PTR(ret);
9525ae83959b60 Russell King          2017-07-25  1862  	}
9525ae83959b60 Russell King          2017-07-25  1863  
24cf0e693bb50a Russell King          2019-12-11  1864  	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
8fa7b9b6af252c Russell King          2017-12-01  1865  		ret = phylink_parse_fixedlink(pl, fwnode);
9525ae83959b60 Russell King          2017-07-25  1866  		if (ret < 0) {
9525ae83959b60 Russell King          2017-07-25  1867  			kfree(pl);
9525ae83959b60 Russell King          2017-07-25  1868  			return ERR_PTR(ret);
9525ae83959b60 Russell King          2017-07-25  1869  		}
9525ae83959b60 Russell King          2017-07-25  1870  	}
9525ae83959b60 Russell King          2017-07-25  1871  
1f92ead7e15003 Russell King (Oracle  2024-12-03  1872) 	pl->req_link_an_mode = pl->cfg_link_an_mode;
24cf0e693bb50a Russell King          2019-12-11  1873  
8fa7b9b6af252c Russell King          2017-12-01  1874  	ret = phylink_register_sfp(pl, fwnode);
ce0aa27ff3f68e Russell King          2017-07-25  1875  	if (ret < 0) {
ce0aa27ff3f68e Russell King          2017-07-25  1876  		kfree(pl);
ce0aa27ff3f68e Russell King          2017-07-25  1877  		return ERR_PTR(ret);
ce0aa27ff3f68e Russell King          2017-07-25  1878  	}
ce0aa27ff3f68e Russell King          2017-07-25  1879  
9525ae83959b60 Russell King          2017-07-25  1880  	return pl;
9525ae83959b60 Russell King          2017-07-25  1881  }
9525ae83959b60 Russell King          2017-07-25  1882  EXPORT_SYMBOL_GPL(phylink_create);
9525ae83959b60 Russell King          2017-07-25  1883  
8796c8923d9c42 Russell King          2017-12-01  1884  /**
8796c8923d9c42 Russell King          2017-12-01  1885   * phylink_destroy() - cleanup and destroy the phylink instance
8796c8923d9c42 Russell King          2017-12-01  1886   * @pl: a pointer to a &struct phylink returned from phylink_create()
8796c8923d9c42 Russell King          2017-12-01  1887   *
8796c8923d9c42 Russell King          2017-12-01  1888   * Destroy a phylink instance. Any PHY that has been attached must have been
8796c8923d9c42 Russell King          2017-12-01  1889   * cleaned up via phylink_disconnect_phy() prior to calling this function.
269a6b5f23a688 Russell King          2019-11-19  1890   *
269a6b5f23a688 Russell King          2019-11-19  1891   * Note: the rtnl lock must not be held when calling this function.
8796c8923d9c42 Russell King          2017-12-01  1892   */
9525ae83959b60 Russell King          2017-07-25  1893  void phylink_destroy(struct phylink *pl)
9525ae83959b60 Russell King          2017-07-25  1894  {
727b3668b73063 Russell King          2019-11-08  1895  	sfp_bus_del_upstream(pl->sfp_bus);
7b3b0e89bcf3ac Russell King          2019-05-28  1896  	if (pl->link_gpio)
daab3349ad1a69 Florian Fainelli      2018-05-10  1897  		gpiod_put(pl->link_gpio);
ce0aa27ff3f68e Russell King          2017-07-25  1898  
9525ae83959b60 Russell King          2017-07-25  1899  	cancel_work_sync(&pl->resolve);
9525ae83959b60 Russell King          2017-07-25  1900  	kfree(pl);
9525ae83959b60 Russell King          2017-07-25  1901  }
9525ae83959b60 Russell King          2017-07-25  1902  EXPORT_SYMBOL_GPL(phylink_destroy);
9525ae83959b60 Russell King          2017-07-25  1903  
653a180957a85c Michael Sit Wei Hong  2023-03-30  1904  /**
653a180957a85c Michael Sit Wei Hong  2023-03-30  1905   * phylink_expects_phy() - Determine if phylink expects a phy to be attached
653a180957a85c Michael Sit Wei Hong  2023-03-30  1906   * @pl: a pointer to a &struct phylink returned from phylink_create()
653a180957a85c Michael Sit Wei Hong  2023-03-30  1907   *
653a180957a85c Michael Sit Wei Hong  2023-03-30  1908   * When using fixed-link mode, or in-band mode with 1000base-X or 2500base-X,
653a180957a85c Michael Sit Wei Hong  2023-03-30  1909   * no PHY is needed.
653a180957a85c Michael Sit Wei Hong  2023-03-30  1910   *
653a180957a85c Michael Sit Wei Hong  2023-03-30  1911   * Returns true if phylink will be expecting a PHY.
653a180957a85c Michael Sit Wei Hong  2023-03-30  1912   */
653a180957a85c Michael Sit Wei Hong  2023-03-30  1913  bool phylink_expects_phy(struct phylink *pl)
653a180957a85c Michael Sit Wei Hong  2023-03-30  1914  {
653a180957a85c Michael Sit Wei Hong  2023-03-30  1915  	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
653a180957a85c Michael Sit Wei Hong  2023-03-30  1916  	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
b63263555eaafb Choong Yong Liang     2025-02-27  1917  	     phy_interface_mode_is_8023z(pl->link_interface)))
653a180957a85c Michael Sit Wei Hong  2023-03-30  1918  		return false;
653a180957a85c Michael Sit Wei Hong  2023-03-30  1919  	return true;
653a180957a85c Michael Sit Wei Hong  2023-03-30  1920  }
653a180957a85c Michael Sit Wei Hong  2023-03-30  1921  EXPORT_SYMBOL_GPL(phylink_expects_phy);
653a180957a85c Michael Sit Wei Hong  2023-03-30  1922  
a307593a644443 Doug Berger           2020-05-18  1923  static void phylink_phy_change(struct phy_device *phydev, bool up)
9525ae83959b60 Russell King          2017-07-25  1924  {
9525ae83959b60 Russell King          2017-07-25  1925  	struct phylink *pl = phydev->phylink;
33faac8e03ac24 Russell King          2020-02-15  1926  	bool tx_pause, rx_pause;
33faac8e03ac24 Russell King          2020-02-15  1927  
33faac8e03ac24 Russell King          2020-02-15 @1928  	phy_get_pause(phydev, &tx_pause, &rx_pause);
9525ae83959b60 Russell King          2017-07-25  1929  
9525ae83959b60 Russell King          2017-07-25  1930  	mutex_lock(&pl->state_mutex);
9525ae83959b60 Russell King          2017-07-25  1931  	pl->phy_state.speed = phydev->speed;
9525ae83959b60 Russell King          2017-07-25  1932  	pl->phy_state.duplex = phydev->duplex;
ae0e4bb2a0e0e4 Sean Anderson         2022-09-20  1933  	pl->phy_state.rate_matching = phydev->rate_matching;
9525ae83959b60 Russell King          2017-07-25  1934  	pl->phy_state.pause = MLO_PAUSE_NONE;
33faac8e03ac24 Russell King          2020-02-15  1935  	if (tx_pause)
33faac8e03ac24 Russell King          2020-02-15  1936  		pl->phy_state.pause |= MLO_PAUSE_TX;
33faac8e03ac24 Russell King          2020-02-15  1937  	if (rx_pause)
33faac8e03ac24 Russell King          2020-02-15  1938  		pl->phy_state.pause |= MLO_PAUSE_RX;
9525ae83959b60 Russell King          2017-07-25  1939  	pl->phy_state.interface = phydev->interface;
9525ae83959b60 Russell King          2017-07-25  1940  	pl->phy_state.link = up;
671154f174e0e7 Russell King (Oracle  2024-11-12  1941) 	if (!up)
671154f174e0e7 Russell King (Oracle  2024-11-12  1942) 		pl->link_failed = true;
03abf2a7c65451 Russell King (Oracle  2025-01-15  1943) 
03abf2a7c65451 Russell King (Oracle  2025-01-15  1944) 	/* Get the LPI state from phylib */
03abf2a7c65451 Russell King (Oracle  2025-01-15  1945) 	pl->phy_enable_tx_lpi = phydev->enable_tx_lpi;
03abf2a7c65451 Russell King (Oracle  2025-01-15  1946) 	pl->mac_tx_lpi_timer = phydev->eee_cfg.tx_lpi_timer;
9525ae83959b60 Russell King          2017-07-25  1947  	mutex_unlock(&pl->state_mutex);
9525ae83959b60 Russell King          2017-07-25  1948  
9525ae83959b60 Russell King          2017-07-25  1949  	phylink_run_resolve(pl);
9525ae83959b60 Russell King          2017-07-25  1950  
03abf2a7c65451 Russell King (Oracle  2025-01-15  1951) 	phylink_dbg(pl, "phy link %s %s/%s/%s/%s/%s/%slpi\n",
03abf2a7c65451 Russell King (Oracle  2025-01-15  1952) 		    up ? "up" : "down",
9525ae83959b60 Russell King          2017-07-25  1953  		    phy_modes(phydev->interface),
9525ae83959b60 Russell King          2017-07-25  1954  		    phy_speed_to_str(phydev->speed),
d34869b44a174b Russell King (Oracle  2021-07-20  1955) 		    phy_duplex_to_str(phydev->duplex),
ae0e4bb2a0e0e4 Sean Anderson         2022-09-20  1956  		    phy_rate_matching_to_str(phydev->rate_matching),
03abf2a7c65451 Russell King (Oracle  2025-01-15  1957) 		    phylink_pause_to_str(pl->phy_state.pause),
03abf2a7c65451 Russell King (Oracle  2025-01-15  1958) 		    phydev->enable_tx_lpi ? "" : "no");
9525ae83959b60 Russell King          2017-07-25  1959  }
9525ae83959b60 Russell King          2017-07-25  1960  

:::::: The code at line 1759 was first introduced by commit
:::::: de7d3f87be3cba8ad06978271a3135bd08810c97 net: phylink: Use phy_caps_lookup for fixed-link configuration

:::::: TO: Maxime Chevallier <maxime.chevallier@bootlin.com>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
