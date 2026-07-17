Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A0C3064A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 23:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332706; cv=none; b=rLsaaD6+x81SBZCqQSHX53hPC5r9b1iB24qXmWdWXKQYR0+m2/Cyl5GIhWcY3GPdgNve2MdiZE80iOaoqxrjItkQgI+GbIxLpgROBO0czLMMQMXFr2OZn2373iXQrgaWzIfNwNvG/f1AGF+0j0d3Hs0ENe3+2nx1Yy8YwM5F26k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332706; c=relaxed/simple;
	bh=oPUxHBpwCA25hU8nJG/N+uDLZHiQ12hJGfdP+OkcnYc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jZQZK2TGT8RD+5iWkaIb2B6tRQ3Mkp48MFfC+/29Sdj3tgrM0VPJCd5xR7vcII9XLGwB8yYpyUcJeZiLDRm5TRrZXWwQAjjxJ9Vqrq1V83T6n1nuHfIh/dfdCnmaKjF50dNVs2WArBOAFTIhKvVfwwSuNA3koKhaWLNtOY+ztc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LB7ywA1A; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LB7ywA1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784332705; x=1815868705;
  h=date:from:to:cc:subject:message-id;
  bh=oPUxHBpwCA25hU8nJG/N+uDLZHiQ12hJGfdP+OkcnYc=;
  b=LB7ywA1AJZ0wRy13JEf82jj3nJJaEPoO0XO97qM5HQgmIlEokv1MbwC2
   gv+ilCEOCLHkBjtJOweoWTAw8ITPXt7UBctTG8Cw8Bf44kW5o/pDHK2Pn
   ziX2HPMf9PueLxwZNc6ceZSXrByRk7UyAC/I5IWfOwO/+PJrINx+lzMxG
   CwgFJtjWph4MnygnztcgVvDjpeoZTyASsVgNNdpE/TqIvpNdqpxyKcTaD
   beYhAL8wQcABzL7sMuf6AIm3nj5AsLIdCkCvjcpo50oy66zA7+kGpkI4g
   cuPBD9Gvewf7a3MHj2WhSUlpmCdBAeYP/t98OZfucVgzbeHGlolxuhBrJ
   A==;
X-CSE-ConnectionGUID: WfytSKnzRYuFd5zxcjvP5Q==
X-CSE-MsgGUID: +8LJmLOaTUO8y9MLDCUYgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="102430156"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="102430156"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 16:58:24 -0700
X-CSE-ConnectionGUID: 4kO8koC7T8m0+lpmD9/JBw==
X-CSE-MsgGUID: +ef5owkMQHuxVQY1lXM8vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="255141596"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Jul 2026 16:58:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wksRb-00000000TGQ-24tM;
	Fri, 17 Jul 2026 23:58:16 +0000
Date: Sat, 18 Jul 2026 07:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 2/2]
 phylink.c:undefined reference to `phy_may_wakeup'
Message-ID: <202607180721.9PoH41qP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   7100382cb0b69db6c24a055ca4df75c9cc45fe50
commit: ccf4fe000a868fef218d481fde838e6c5927faf2 [2/2] Merge 477e31fd1e81 ("Merge tag 'erofs-for-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs") into android-mainline
config: arm64-randconfig-002-20260717 (https://download.01.org/0day-ci/archive/20260718/202607180721.9PoH41qP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180721.9PoH41qP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180721.9PoH41qP-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
   phylink.c:(.text+0x2c0): undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode':
   phylink.c:(.text+0x3f8): undefined reference to `phy_inband_caps'
   aarch64-linux-ld: phylink.c:(.text+0x49c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x690): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_caps_to_linkmodes':
   phylink.c:(.text+0x8ac): undefined reference to `phy_caps_linkmodes'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block':
   phylink.c:(.text+0x8d0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x95c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x9a0): undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock':
   phylink.c:(.text+0xa10): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xa9c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0xb10): undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0xb54): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0xc54): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xcbc): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_pm_speed_ctrl':
>> phylink.c:(.text+0xd68): undefined reference to `phy_may_wakeup'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_prepare_resume':
   phylink.c:(.text+0xdd4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xe0c): undefined reference to `phy_resume'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0xe94): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xf20): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: phylink.c:(.text+0xf3c): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0xfe0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x101c): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: phylink.c:(.text+0x1048): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: phylink.c:(.text+0x10d0): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x1150): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1164): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x11d0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x11e8): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x1258): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1274): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x135c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1378): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x145c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x1474): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x1508): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x1650): undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: phylink.c:(.text+0x1690): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: phylink.c:(.text+0x16c0): undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x1924): undefined reference to `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause.part.27':
   phylink.c:(.text+0x1a1c): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x1ea8): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x1ebc): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x1f58): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x1fd4): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   phylink.c:(.text+0x209c): undefined reference to `phy_caps_from_interface'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   phylink.c:(.text+0x23b0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2400): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x2558): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x25e4): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x262c): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x2720): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x27d4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2804): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x2890): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x28bc): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x2950): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2960): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   phylink.c:(.text+0x2a54): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2b14): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x2e7c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2ed8): undefined reference to `phy_config_inband'
   aarch64-linux-ld: phylink.c:(.text+0x2f4c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2f6c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2fa4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2fc4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2fe4): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x3250): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3274): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x32b0): undefined reference to `phy_start'
   aarch64-linux-ld: phylink.c:(.text+0x330c): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   phylink.c:(.text+0x3490): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   phylink.c:(.text+0x3694): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
   phylink.c:(.text+0x3aec): undefined reference to `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0x3ccc): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x3cdc): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x3d14): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3de4): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x3df4): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x3e98): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x3f1c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3f58): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: phylink.c:(.text+0x4064): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: phylink.c:(.text+0x40a4): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x4158): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x416c): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x4190): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x41b8): undefined reference to `mdiobus_c45_write'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
