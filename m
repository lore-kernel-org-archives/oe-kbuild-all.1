Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83DF3D5C38
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786805515; cv=none; b=jRy7W95M6EymjQiBBZVO6APp7ldEU+CBXcjbbqEU6urKRngJnZES4u2l4Bd3en+rnUlZJC7kqEXGX0ZYM/nzbWj+V+DGtReggI1lG5iepDQvyGQw3kVQavosORJTGlHiLV94CFtWRZJrOWPTKQE22p9jE0j2jK0svgq8b/ZB8hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786805515; c=relaxed/simple;
	bh=4NF6SwMsZVqa1TanHNZ0P5es4daWt71o4OA2MfIsORU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GhNog+ggLRijcOBHe9Wyw2T14W7NDjhMh8sR3l1zI7ilv8442cLrf82sKmbtGcqoDKzYCC8AGtFcj3iayXpcLbQpOM/EXmQ22GOgEcUrmypaCuQk2MKl/C+A8b5isSxiMIHVPmMuTgmxvgJCBkKg+Gv30rujAQNvbFdveIDATGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgzT7MWW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgzT7MWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786805513; x=1818341513;
  h=date:from:to:cc:subject:message-id;
  bh=4NF6SwMsZVqa1TanHNZ0P5es4daWt71o4OA2MfIsORU=;
  b=CgzT7MWWlJ48VS1skLmk+ZKUMi3iQVH4Ef/fUERhx4D/4bV6ZxpdSSbg
   lD7KkmEFcWRuAUk4jZJWy+JGvbd/4B7XVYUt8O02YkoWoqD2zBdxfaEGH
   ZIClizfkBWeMsr9LgPphww0ksKzolk+qe2TpIqh/oeaj8uH+yqYjBYwPN
   i4cfx7GmKv1ClhkLHvw9aicoJEVKnYqKhOtIh7zCGr/xcLL4OpFNiQDky
   aTnJz/9Utc1xYrjGTiyajF9bLmMNRH263GsA2RtnH7Jg+429biuiuQ2n8
   Jtk6Ex1QrW1KRuntgiY8nZw37RmdJ1dcgRqqTExWwbgchC7UZ9iPB2kVp
   Q==;
X-CSE-ConnectionGUID: 2lMd7iclTSKMli5s/2jpiA==
X-CSE-MsgGUID: XvMac1+wQNaoLg2FhA2s4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87481509"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="87481509"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 07:51:49 -0700
X-CSE-ConnectionGUID: uypRxh0KRDCU2udQq4lIBA==
X-CSE-MsgGUID: wTPet0RtSMeUSFV2hFe0eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="294410405"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Aug 2026 07:51:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvFjd-00000000cGU-30Zb;
	Sat, 15 Aug 2026 14:51:45 +0000
Date: Sat, 15 Aug 2026 22:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1] ld:
 phylink.c:undefined reference to `phy_may_wakeup'
Message-ID: <202608152224.FzIiprOz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   65f3b8dfdda3b8bb9f5e3ae0b5192ba2b8422c80
commit: ccf4fe000a868fef218d481fde838e6c5927faf2 [1/1] Merge 477e31fd1e81 ("Merge tag 'erofs-for-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs") into android-mainline
config: i386-buildonly-randconfig-002-20260815 (https://download.01.org/0day-ci/archive/20260815/202608152224.FzIiprOz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608152224.FzIiprOz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608152224.FzIiprOz-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
   phylink.c:(.text+0x37c): undefined reference to `phy_caps_lookup'
   ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   phylink.c:(.text+0x44f): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode':
   phylink.c:(.text+0x8cc): undefined reference to `phy_inband_caps'
   ld: phylink.c:(.text+0x96e): undefined reference to `phy_inband_caps'
   ld: drivers/net/phy/phylink.o: in function `phylink_caps_to_linkmodes':
   phylink.c:(.text+0xd4a): undefined reference to `phy_caps_linkmodes'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0xd91): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block':
   phylink.c:(.text+0xe0c): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0xe48): undefined reference to `phy_eee_rx_clock_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock':
   phylink.c:(.text+0xe8c): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0xec9): undefined reference to `phy_eee_rx_clock_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0xf58): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0xfc6): undefined reference to `phy_disconnect'
   ld: drivers/net/phy/phylink.o: in function `phylink_prepare_resume':
   phylink.c:(.text+0x1012): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x103c): undefined reference to `phy_resume'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x1094): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x10d5): undefined reference to `phy_ethtool_get_wol'
   ld: phylink.c:(.text+0x1131): undefined reference to `phy_ethtool_get_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x11bb): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x11f1): undefined reference to `phy_ethtool_set_wol'
   ld: phylink.c:(.text+0x122f): undefined reference to `phy_ethtool_get_wol'
   ld: phylink.c:(.text+0x12c1): undefined reference to `phy_ethtool_set_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x1307): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x1313): undefined reference to `phy_get_eee_err'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x1354): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x1374): undefined reference to `phy_ethtool_get_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x141b): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x1432): undefined reference to `phy_ethtool_set_eee'
   ld: phylink.c:(.text+0x148f): undefined reference to `phy_ethtool_set_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x14e4): undefined reference to `mdiobus_c45_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x15a8): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x15c0): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x165a): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x167c): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x16d1): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x1701): undefined reference to `phy_speed_down'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x1747): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x176c): undefined reference to `phy_speed_up'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x17c4): undefined reference to `mdiobus_modify'
   ld: phylink.c:(.text+0x17f5): undefined reference to `mdiobus_modify_changed'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x1907): undefined reference to `netif_carrier_on'
   ld: phylink.c:(.text+0x19ae): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x19b8): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x19de): undefined reference to `netdev_printk'
   ld: phylink.c:(.text+0x1a03): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x1a0d): undefined reference to `phy_speed_to_str'
   ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x1cf9): undefined reference to `phy_config_inband'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x1ece): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x1f53): undefined reference to `linkmode_set_pause'
   ld: phylink.c:(.text+0x1f9b): undefined reference to `phy_set_asym_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x21a0): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x222e): undefined reference to `mdiobus_c45_read'
   ld: phylink.c:(.text+0x22cd): undefined reference to `phy_mii_ioctl'
   ld: phylink.c:(.text+0x232f): undefined reference to `mdiobus_c45_write'
   ld: phylink.c:(.text+0x23bc): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x2458): undefined reference to `swphy_read_reg'
   ld: phylink.c:(.text+0x2485): undefined reference to `mdiobus_write'
   ld: phylink.c:(.text+0x2500): undefined reference to `mdiobus_c45_read'
   ld: phylink.c:(.text+0x252e): undefined reference to `mdiobus_c45_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x2588): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x2594): undefined reference to `phy_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   phylink.c:(.text+0x2654): undefined reference to `phy_caps_from_interface'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x27d1): undefined reference to `netif_carrier_off'
   ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   phylink.c:(.text+0x2c0a): undefined reference to `rtnl_is_locked'
>> ld: phylink.c:(.text+0x2c5d): undefined reference to `phy_may_wakeup'
>> ld: phylink.c:(.text+0x2c66): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x2c7e): undefined reference to `phy_speed_down'
   ld: phylink.c:(.text+0x2cc3): undefined reference to `netif_carrier_off'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x3029): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x3037): undefined reference to `phy_ethtool_ksettings_get'
   ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x312c): undefined reference to `phy_get_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x324b): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x3271): undefined reference to `netif_carrier_off'
   ld: phylink.c:(.text+0x32ae): undefined reference to `phy_start'
   ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   phylink.c:(.text+0x3388): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x33e0): undefined reference to `phy_may_wakeup'
   ld: phylink.c:(.text+0x33e9): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x33ff): undefined reference to `phy_speed_up'
   ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   phylink.c:(.text+0x3655): undefined reference to `phy_get_rate_matching'
   ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   phylink.c:(.text+0x391e): undefined reference to `phy_get_rate_matching'
   ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x3a0d): undefined reference to `phy_support_asym_pause'
   ld: phylink.c:(.text+0x3adb): undefined reference to `phy_attached_info_irq'
   ld: phylink.c:(.text+0x3c42): undefined reference to `phy_eee_tx_clock_stop_capable'
   ld: phylink.c:(.text+0x3c68): undefined reference to `phy_request_interrupt'
   ld: phylink.c:(.text+0x3c84): undefined reference to `phy_disable_eee'
   ld: phylink.c:(.text+0x3c93): undefined reference to `phy_support_eee'
   ld: phylink.c:(.text+0x3caa): undefined reference to `phy_eee_rx_clock_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x3d4b): undefined reference to `phy_attach_direct'
   ld: phylink.c:(.text+0x3d9b): undefined reference to `phy_detach'
   ld: drivers/net/phy/phylink.o: in function `phylink_fwnode_phy_connect':
   phylink.c:(.text+0x3def): undefined reference to `fwnode_get_phy_node'
   ld: phylink.c:(.text+0x3e02): undefined reference to `fwnode_phy_find_device'
   ld: phylink.c:(.text+0x3e52): undefined reference to `phy_attach_direct'
   ld: phylink.c:(.text+0x3e5b): undefined reference to `phy_device_free'
   ld: phylink.c:(.text+0x3e8d): undefined reference to `phy_detach'
   ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x4299): undefined reference to `phy_caps_lookup'
   ld: drivers/net/phy/phylink.o: in function `phylink_create':
   phylink.c:(.text+0x46ea): undefined reference to `netif_carrier_off'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x47d7): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x4809): undefined reference to `phy_ethtool_ksettings_set'
   ld: phylink.c:(.text+0x4a87): undefined reference to `phy_caps_lookup'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x4c4f): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x4c5d): undefined reference to `phy_restart_aneg'
   ld: drivers/net/phy/phylink.o: in function `phylink_activate_lpi.cold':
   phylink.c:(.text.unlikely+0x52): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode.cold':
   phylink.c:(.text.unlikely+0xa1): undefined reference to `netdev_printk'
   ld: phylink.c:(.text.unlikely+0x194): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block.cold':
   phylink.c:(.text.unlikely+0x1cf): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock.cold':
   phylink.c:(.text.unlikely+0x22f): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o:phylink.c:(.text.unlikely+0x2a5): more undefined references to `netdev_printk' follow

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
