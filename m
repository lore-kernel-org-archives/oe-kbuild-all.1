Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134E21F875A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753519; cv=none; b=PpWG9nvzog8JQ8PqBg0aWzhDEmpU6mbA704xYo4wiJCpf6Qe0X69dlsveQ9fvRPLjWc/KwdEkep7AdBeax7xJ74ZAggU6dabR8uMH/uK4UtaCAHBRu8hHpxHansmmKkdhaeq6RvT1QR27t54kZ/krbMCB38TED/rBC16ghl59+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753519; c=relaxed/simple;
	bh=LPKD44sppRACXOqkicviQBfmN7ijRr1i0zXEHSpxP5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SGB1kSOMQO5FI7vpBmcuq74thMcRMRkHVREp+Mn6GEn2c6Dzazghh75kz3FWtraU55CDmBDP2D/UVS966Jzfwp5gg8N43fwbMXBvoRJtVp6Bmmfoeh3kmQWBt/Rq5fJc9ss4RRZYZZXaWGB3ZNdxNBx29qYWhlW/9s8/xZBmJSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9TAFx10; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9TAFx10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790753517; x=1822289517;
  h=date:from:to:cc:subject:message-id;
  bh=LPKD44sppRACXOqkicviQBfmN7ijRr1i0zXEHSpxP5M=;
  b=G9TAFx10f6TdOhTGSs/oRzMdblHNUrBhuhm0Xj/f81b2lCgHD+lyj9Te
   EE3QPb2t89bHdbUjClFjFR0TC5+zyzNT4C8LhBPP6abIBJDoEQSCOT8sI
   GfAkA+4lsODqSmSaSLpusI/41wJ7ZW9MgEysAgVTrulcDkE9WiJXI7F67
   /zwaZvDWOzOMILU7NMMAwNEPWcUEUbqrUDc7SF17dtSVMvV5VbgQ4tBeW
   MPaywSOmjsi2XvgIdDZPOu0hJjC6Wyo9VA3Olr7XRVAQ52AHggrH8Dpc5
   K3Kuc04w20SThVu1p9uCPOkUwUZiCS8QMa2Rgmh1q+FLRjAAOAQR/Crpu
   Q==;
X-CSE-ConnectionGUID: YOpfAVClSRaVeBDNBVszHA==
X-CSE-MsgGUID: HuMFpmmgSA27ufnPuvGE9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="94363320"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="94363320"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 00:31:56 -0700
X-CSE-ConnectionGUID: I5j6bvl+SCOkMiIPVK2QPg==
X-CSE-MsgGUID: 4zhMJkJbSiG5BzjnGnvpRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="273392526"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Sep 2026 00:31:55 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBonA-00000000QHo-3VtI;
	Wed, 30 Sep 2026 07:31:52 +0000
Date: Wed, 30 Sep 2026 15:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 drivers/net/phy/phylink.c:718:(.text.phylink_parse_fixedlink+0x5e8):
 undefined reference to `phy_caps_lookup'
Message-ID: <202609301540.iDwZzoMr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   d26d03d72731ff281605b9c99f1acecaa0556bfc
commit: da0d6fef4be114bfe8c8ffe7299762721d961077 [1/1] Merge 1b98f357dadd ("Merge tag 'net-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next") into android-mainline
config: arm-randconfig-1000-20260929 (https://download.01.org/0day-ci/archive/20260930/202609301540.iDwZzoMr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301540.iDwZzoMr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301540.iDwZzoMr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/phylink.c:2575:(.text.phylink_prepare_resume+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2584:(.text.phylink_prepare_resume+0x74): undefined reference to `phy_resume'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   drivers/net/phy/phylink.c:2639:(.text.phylink_ethtool_get_wol+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2645:(.text.phylink_ethtool_get_wol+0x64): undefined reference to `phy_ethtool_get_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   drivers/net/phy/phylink.c:2664:(.text.phylink_ethtool_set_wol+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2667:(.text.phylink_ethtool_set_wol+0x58): undefined reference to `phy_ethtool_set_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   drivers/net/phy/phylink.c:2977:(.text.phylink_ethtool_nway_reset+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2980:(.text.phylink_ethtool_nway_reset+0x50): undefined reference to `phy_restart_aneg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   drivers/net/phy/phylink.c:3015:(.text.phylink_ethtool_set_pauseparam+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3050:(.text.phylink_ethtool_set_pauseparam+0x144): undefined reference to `linkmode_set_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3073:(.text.phylink_ethtool_set_pauseparam+0x1bc): undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   drivers/net/phy/phylink.c:3103:(.text.phylink_get_eee_err+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3106:(.text.phylink_get_eee_err+0x50): undefined reference to `phy_get_eee_err'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   drivers/net/phy/phylink.c:3121:(.text.phylink_ethtool_get_eee+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3127:(.text.phylink_ethtool_get_eee+0x94): undefined reference to `phy_ethtool_get_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   drivers/net/phy/phylink.c:3148:(.text.phylink_ethtool_set_eee+0x20): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3164:(.text.phylink_ethtool_set_eee+0xc0): undefined reference to `phy_ethtool_set_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   drivers/net/phy/phylink.c:4137:(.text.phylink_mii_c45_pcs_get_state+0x2c): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_read':
   include/linux/mdio.h:630:(.text.phylink_mii_c22_pcs_get_state+0x2c): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: include/linux/mdio.h:630:(.text.phylink_mii_c22_pcs_get_state+0x44): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_read':
   drivers/net/phy/phylink.c:3208:(.text.phylink_phy_read+0x50): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3238:(.text.phylink_phy_read+0xa8): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3234:(.text.phylink_phy_read+0x128): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_write':
   drivers/net/phy/phylink.c:3250:(.text.phylink_phy_write+0x60): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3279:(.text.phylink_phy_write+0xbc): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3275:(.text.phylink_phy_write+0x148): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_read':
   include/linux/mdio.h:630:(.text.phylink_mii_c22_pcs_an_restart+0x24): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_write':
   include/linux/mdio.h:636:(.text.phylink_mii_c22_pcs_an_restart+0x54): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   drivers/net/phy/phylink.c:3191:(.text.phylink_mii_emul_read+0x60): undefined reference to `swphy_read_reg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:3350:(.text.phylink_mii_ioctl+0x24): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3373:(.text.phylink_mii_ioctl+0x130): undefined reference to `phy_mii_ioctl'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   drivers/net/phy/phylink.c:3421:(.text.phylink_speed_down+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3424:(.text.phylink_speed_down+0x64): undefined reference to `phy_speed_down'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   drivers/net/phy/phylink.c:3444:(.text.phylink_speed_up+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3447:(.text.phylink_speed_up+0x5c): undefined reference to `phy_speed_up'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   drivers/net/phy/phylink.c:4086:(.text.phylink_mii_c22_pcs_config+0x60): undefined reference to `mdiobus_modify_changed'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_modify':
   include/linux/mdio.h:642:(.text.phylink_mii_c22_pcs_config+0xe4): undefined reference to `mdiobus_modify'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   drivers/net/phy/phylink.c:2439:(.text.phylink_stop+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2444:(.text.phylink_stop+0x68): undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   drivers/net/phy/phylink.c:2533:(.text.phylink_suspend+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2549:(.text.phylink_suspend+0x124): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   drivers/net/phy/phylink.c:421:(.text.phylink_get_capabilities+0x20): undefined reference to `phy_caps_from_interface'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   drivers/net/phy/phylink.c:1219:(.text.phylink_major_config+0xf0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1243:(.text.phylink_major_config+0x1d8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1272:(.text.phylink_major_config+0x408): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1285:(.text.phylink_major_config+0x4f4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1298:(.text.phylink_major_config+0x5fc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1306:(.text.phylink_major_config+0x658): undefined reference to `phy_config_inband'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1308:(.text.phylink_major_config+0x6c4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_up':
   drivers/net/phy/phylink.c:1537:(.text.phylink_link_up+0x1b0): undefined reference to `netif_carrier_on'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1539:(.text.phylink_link_up+0x1dc): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1539:(.text.phylink_link_up+0x1f0): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1539:(.text.phylink_link_up+0x23c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1539:(.text.phylink_link_up+0x254): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1539:(.text.phylink_link_up+0x25c): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   drivers/net/phy/phylink.c:2371:(.text.phylink_start+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2373:(.text.phylink_start+0xb0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2379:(.text.phylink_start+0xe4): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2419:(.text.phylink_start+0x2b4): undefined reference to `phy_start'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   drivers/net/phy/phylink.c:2597:(.text.phylink_resume+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   drivers/net/phy/phylink.c:518:(.text.phylink_validate_mac_and_pcs+0x178): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:530:(.text.phylink_validate_mac_and_pcs+0x214): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   drivers/net/phy/phylink.c:577:(.text.phylink_validate_one+0x88): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   drivers/net/phy/phylink.c:767:(.text.phylink_parse_mode+0x17c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:808:(.text.phylink_parse_mode+0x2c0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:817:(.text.phylink_parse_mode+0x33c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   drivers/net/phy/phylink.c:688:(.text.phylink_parse_fixedlink+0x2b4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:709:(.text.phylink_parse_fixedlink+0x3e4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o:drivers/net/phy/phylink.c:735: more undefined references to `netdev_printk' follow
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
>> drivers/net/phy/phylink.c:718:(.text.phylink_parse_fixedlink+0x5e8): undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   drivers/net/phy/phylink.c:1815:(.text.phylink_create+0x114): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   drivers/net/phy/phylink.c:2006:(.text.phylink_validate_phy+0x94): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1973:(.text.phylink_validate_phy+0x10c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1985:(.text.phylink_validate_phy+0x1dc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   drivers/net/phy/phylink.c:2043:(.text.phylink_bringup_phy+0x28): undefined reference to `phy_support_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2063:(.text.phylink_bringup_phy+0xdc): undefined reference to `phy_attached_info_irq'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2052:(.text.phylink_bringup_phy+0x15c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2064:(.text.phylink_bringup_phy+0x1bc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2092:(.text.phylink_bringup_phy+0x314): undefined reference to `phy_support_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2109:(.text.phylink_bringup_phy+0x38c): undefined reference to `phy_disable_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2122:(.text.phylink_bringup_phy+0x3d0): undefined reference to `phy_request_interrupt'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2134:(.text.phylink_bringup_phy+0x42c): undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2128:(.text.phylink_bringup_phy+0x474): undefined reference to `phy_eee_tx_clock_stop_capable'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_attach_phy':
   drivers/net/phy/phylink.c:2159:(.text.phylink_connect_phy+0xd0): undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   drivers/net/phy/phylink.c:2193:(.text.phylink_connect_phy+0x120): undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   drivers/net/phy/phylink.c:2810:(.text.phylink_ethtool_ksettings_set+0x20): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2837:(.text.phylink_ethtool_ksettings_set+0x88): undefined reference to `phy_ethtool_ksettings_set'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2851:(.text.phylink_ethtool_ksettings_set+0x10c): undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_sfp_select_interface':
   drivers/net/phy/phylink.c:2680:(.text.phylink_ethtool_ksettings_set+0x2c8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   drivers/net/phy/phylink.c:2738:(.text.phylink_ethtool_ksettings_get+0x20): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2741:(.text.phylink_ethtool_ksettings_get+0x5c): undefined reference to `phy_ethtool_ksettings_get'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_fwnode_phy_connect':
>> drivers/net/phy/phylink.c:2250:(.text.phylink_fwnode_phy_connect+0x6c): undefined reference to `fwnode_phy_find_device'
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2273:(.text.phylink_fwnode_phy_connect+0x1c8): undefined reference to `phy_detach'
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2265:(.text.phylink_fwnode_phy_connect+0x1ec): undefined reference to `phy_attach_direct'
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2267:(.text.phylink_fwnode_phy_connect+0x1f8): undefined reference to `phy_device_free'
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2243:(.text.phylink_fwnode_phy_connect+0x254): undefined reference to `fwnode_get_phy_node'
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


vim +718 drivers/net/phy/phylink.c

de7d3f87be3cba Maxime Chevallier     2025-03-07  637  
8fa7b9b6af252c Russell King          2017-12-01  638  static int phylink_parse_fixedlink(struct phylink *pl,
a0b7955310a445 Russell King (Oracle  2023-05-12  639) 				   const struct fwnode_handle *fwnode)
9525ae83959b60 Russell King          2017-07-25  640  {
de7d3f87be3cba Maxime Chevallier     2025-03-07  641  	__ETHTOOL_DECLARE_LINK_MODE_MASK(match) = { 0, };
e0e918494c3cfd Russell King (Oracle  2024-10-22  642) 	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
de7d3f87be3cba Maxime Chevallier     2025-03-07  643  	const struct link_capabilities *c;
8fa7b9b6af252c Russell King          2017-12-01  644  	struct fwnode_handle *fixed_node;
9525ae83959b60 Russell King          2017-07-25  645  	struct gpio_desc *desc;
9525ae83959b60 Russell King          2017-07-25  646  	u32 speed;
8fa7b9b6af252c Russell King          2017-12-01  647  	int ret;
9525ae83959b60 Russell King          2017-07-25  648  
8fa7b9b6af252c Russell King          2017-12-01  649  	fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
9525ae83959b60 Russell King          2017-07-25  650  	if (fixed_node) {
8fa7b9b6af252c Russell King          2017-12-01  651  		ret = fwnode_property_read_u32(fixed_node, "speed", &speed);
9525ae83959b60 Russell King          2017-07-25  652  
9525ae83959b60 Russell King          2017-07-25  653  		pl->link_config.speed = speed;
9525ae83959b60 Russell King          2017-07-25  654  		pl->link_config.duplex = DUPLEX_HALF;
9525ae83959b60 Russell King          2017-07-25  655  
8fa7b9b6af252c Russell King          2017-12-01  656  		if (fwnode_property_read_bool(fixed_node, "full-duplex"))
9525ae83959b60 Russell King          2017-07-25  657  			pl->link_config.duplex = DUPLEX_FULL;
9525ae83959b60 Russell King          2017-07-25  658  
9525ae83959b60 Russell King          2017-07-25  659  		/* We treat the "pause" and "asym-pause" terminology as
1953feb022154e Wenpeng Liang         2021-06-16  660  		 * defining the link partner's ability.
1953feb022154e Wenpeng Liang         2021-06-16  661  		 */
8fa7b9b6af252c Russell King          2017-12-01  662  		if (fwnode_property_read_bool(fixed_node, "pause"))
4e5aeb4157c879 Russell King          2020-02-15  663  			__set_bit(ETHTOOL_LINK_MODE_Pause_BIT,
4e5aeb4157c879 Russell King          2020-02-15  664  				  pl->link_config.lp_advertising);
8fa7b9b6af252c Russell King          2017-12-01  665  		if (fwnode_property_read_bool(fixed_node, "asym-pause"))
4e5aeb4157c879 Russell King          2020-02-15  666  			__set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT,
4e5aeb4157c879 Russell King          2020-02-15  667  				  pl->link_config.lp_advertising);
9525ae83959b60 Russell King          2017-07-25  668  
9525ae83959b60 Russell King          2017-07-25  669  		if (ret == 0) {
b605c9abc4d2e7 Dmitry Torokhov       2020-01-02  670  			desc = fwnode_gpiod_get_index(fixed_node, "link", 0,
b605c9abc4d2e7 Dmitry Torokhov       2020-01-02  671  						      GPIOD_IN, "?");
9525ae83959b60 Russell King          2017-07-25  672  
9525ae83959b60 Russell King          2017-07-25  673  			if (!IS_ERR(desc))
9525ae83959b60 Russell King          2017-07-25  674  				pl->link_gpio = desc;
9525ae83959b60 Russell King          2017-07-25  675  			else if (desc == ERR_PTR(-EPROBE_DEFER))
9525ae83959b60 Russell King          2017-07-25  676  				ret = -EPROBE_DEFER;
9525ae83959b60 Russell King          2017-07-25  677  		}
8fa7b9b6af252c Russell King          2017-12-01  678  		fwnode_handle_put(fixed_node);
9525ae83959b60 Russell King          2017-07-25  679  
9525ae83959b60 Russell King          2017-07-25  680  		if (ret)
9525ae83959b60 Russell King          2017-07-25  681  			return ret;
9525ae83959b60 Russell King          2017-07-25  682  	} else {
8fa7b9b6af252c Russell King          2017-12-01  683  		u32 prop[5];
8fa7b9b6af252c Russell King          2017-12-01  684  
8fa7b9b6af252c Russell King          2017-12-01  685  		ret = fwnode_property_read_u32_array(fwnode, "fixed-link",
8fa7b9b6af252c Russell King          2017-12-01  686  						     NULL, 0);
8fa7b9b6af252c Russell King          2017-12-01  687  		if (ret != ARRAY_SIZE(prop)) {
17091180b1521e Ioana Ciornei         2019-05-28  688  			phylink_err(pl, "broken fixed-link?\n");
9525ae83959b60 Russell King          2017-07-25  689  			return -EINVAL;
9525ae83959b60 Russell King          2017-07-25  690  		}
8fa7b9b6af252c Russell King          2017-12-01  691  
8fa7b9b6af252c Russell King          2017-12-01  692  		ret = fwnode_property_read_u32_array(fwnode, "fixed-link",
8fa7b9b6af252c Russell King          2017-12-01  693  						     prop, ARRAY_SIZE(prop));
8fa7b9b6af252c Russell King          2017-12-01  694  		if (!ret) {
8fa7b9b6af252c Russell King          2017-12-01  695  			pl->link_config.duplex = prop[1] ?
9525ae83959b60 Russell King          2017-07-25  696  						DUPLEX_FULL : DUPLEX_HALF;
8fa7b9b6af252c Russell King          2017-12-01  697  			pl->link_config.speed = prop[2];
8fa7b9b6af252c Russell King          2017-12-01  698  			if (prop[3])
4e5aeb4157c879 Russell King          2020-02-15  699  				__set_bit(ETHTOOL_LINK_MODE_Pause_BIT,
4e5aeb4157c879 Russell King          2020-02-15  700  					  pl->link_config.lp_advertising);
8fa7b9b6af252c Russell King          2017-12-01  701  			if (prop[4])
4e5aeb4157c879 Russell King          2020-02-15  702  				__set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT,
4e5aeb4157c879 Russell King          2020-02-15  703  					  pl->link_config.lp_advertising);
9525ae83959b60 Russell King          2017-07-25  704  		}
9525ae83959b60 Russell King          2017-07-25  705  	}
9525ae83959b60 Russell King          2017-07-25  706  
9525ae83959b60 Russell King          2017-07-25  707  	if (pl->link_config.speed > SPEED_1000 &&
9525ae83959b60 Russell King          2017-07-25  708  	    pl->link_config.duplex != DUPLEX_FULL)
17091180b1521e Ioana Ciornei         2019-05-28  709  		phylink_warn(pl, "fixed link specifies half duplex for %dMbps link?\n",
9525ae83959b60 Russell King          2017-07-25  710  			     pl->link_config.speed);
9525ae83959b60 Russell King          2017-07-25  711  
de7d3f87be3cba Maxime Chevallier     2025-03-07  712  	linkmode_zero(pl->supported);
de7d3f87be3cba Maxime Chevallier     2025-03-07  713  	phylink_fill_fixedlink_supported(pl->supported);
de7d3f87be3cba Maxime Chevallier     2025-03-07  714  
9525ae83959b60 Russell King          2017-07-25  715  	linkmode_copy(pl->link_config.advertising, pl->supported);
9525ae83959b60 Russell King          2017-07-25  716  	phylink_validate(pl, pl->supported, &pl->link_config);
9525ae83959b60 Russell King          2017-07-25  717  
de7d3f87be3cba Maxime Chevallier     2025-03-07 @718  	c = phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
3c1bcc8614db10 Andrew Lunn           2018-11-10  719  			    pl->supported, true);
de7d3f87be3cba Maxime Chevallier     2025-03-07  720  	if (c)
de7d3f87be3cba Maxime Chevallier     2025-03-07  721  		linkmode_and(match, pl->supported, c->linkmodes);
894341ad3ad7df Ivan Bornyakov        2023-02-10  722  
e0e918494c3cfd Russell King (Oracle  2024-10-22  723) 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, mask);
e0e918494c3cfd Russell King (Oracle  2024-10-22  724) 	linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, mask);
e0e918494c3cfd Russell King (Oracle  2024-10-22  725) 	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, mask);
e0e918494c3cfd Russell King (Oracle  2024-10-22  726) 	linkmode_and(pl->supported, pl->supported, mask);
894341ad3ad7df Ivan Bornyakov        2023-02-10  727  
e0e918494c3cfd Russell King (Oracle  2024-10-22  728) 	phylink_set(pl->supported, MII);
894341ad3ad7df Ivan Bornyakov        2023-02-10  729  
de7d3f87be3cba Maxime Chevallier     2025-03-07  730  	if (c) {
de7d3f87be3cba Maxime Chevallier     2025-03-07  731  		linkmode_or(pl->supported, pl->supported, match);
de7d3f87be3cba Maxime Chevallier     2025-03-07  732  		linkmode_or(pl->link_config.lp_advertising,
de7d3f87be3cba Maxime Chevallier     2025-03-07  733  			    pl->link_config.lp_advertising, match);
9525ae83959b60 Russell King          2017-07-25  734  	} else {
17091180b1521e Ioana Ciornei         2019-05-28  735  		phylink_warn(pl, "fixed link %s duplex %dMbps not recognised\n",
9525ae83959b60 Russell King          2017-07-25  736  			     pl->link_config.duplex == DUPLEX_FULL ? "full" : "half",
9525ae83959b60 Russell King          2017-07-25  737  			     pl->link_config.speed);
9525ae83959b60 Russell King          2017-07-25  738  	}
9525ae83959b60 Russell King          2017-07-25  739  
9525ae83959b60 Russell King          2017-07-25  740  	linkmode_and(pl->link_config.advertising, pl->link_config.advertising,
9525ae83959b60 Russell King          2017-07-25  741  		     pl->supported);
9525ae83959b60 Russell King          2017-07-25  742  
9525ae83959b60 Russell King          2017-07-25  743  	pl->link_config.link = 1;
9525ae83959b60 Russell King          2017-07-25  744  	pl->link_config.an_complete = 1;
9525ae83959b60 Russell King          2017-07-25  745  
9525ae83959b60 Russell King          2017-07-25  746  	return 0;
9525ae83959b60 Russell King          2017-07-25  747  }
9525ae83959b60 Russell King          2017-07-25  748  

:::::: The code at line 718 was first introduced by commit
:::::: de7d3f87be3cba8ad06978271a3135bd08810c97 net: phylink: Use phy_caps_lookup for fixed-link configuration

:::::: TO: Maxime Chevallier <maxime.chevallier@bootlin.com>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
