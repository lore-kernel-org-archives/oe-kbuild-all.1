Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47913391512
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 03:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569399; cv=none; b=uXtPlQZrdJZcAQUFtQ4JShojW+S95dVnRGDIYkdV9T2BFn9MsXUDo2fIhj4jnnnkbDYVJ8GKooiKI69WRjsWGKFOEqH/KxnblmbjbY6sVAguvIvVm5Z/S/6scrtJ6DIzO20Z/nnC1oCIE4m62pgRS/1zWnBYh8nz/OYXsmyNXDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569399; c=relaxed/simple;
	bh=6slM+mtYdcvyvjnGxzH71J+HvSDBYpfb8dZcGEbmyT4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iQndYvroI+h5xPKz3+S30m5O+h+trXT1Yu6nLumomlv01O2FRRUDtCf84Q8O0KPAQKcZDlBhU2c3fOSRt5h2W+KntmVuGuhuisXReMPb6+Df97ojAseU5lGhMMS6o51jQJMo92mpWEGo3i6KYJAw/iZOmwMLZoRPmXs/m6uTknk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5oIE/pn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5oIE/pn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783569396; x=1815105396;
  h=date:from:to:cc:subject:message-id;
  bh=6slM+mtYdcvyvjnGxzH71J+HvSDBYpfb8dZcGEbmyT4=;
  b=g5oIE/pnb/Tbyx+1pDmC1GQ3ocUWuD/qyF9AmL7XsoHc3AopWrZoNqSZ
   YkX/CnYiT380Atshm5pA66U0aoIheAryc9QbikNCYqEiFB6IQge71g+Nm
   wpc0OYLU5t7ca9Jd22tJflpjkBrkNJBFXVWrffDTqYz8l602UEqYIyqLK
   frvpPvvqnvJe84a0bvA8tNFHphd7SOCCH6wbuZve/zrCyag05lOxf2Edx
   seBoLr+xFS8IpMY31mHE8y2k7SchPubUXVmAtJx8czkFDsxsxTMTNMNnI
   uAYYFUNEs+dGXKMh6OBtS+NPZMJxN9JtRAaPh4Q3r4E65tYI4cgH6wm4v
   w==;
X-CSE-ConnectionGUID: uL0cDw9qRQCRorFcFt5uew==
X-CSE-MsgGUID: 50eXPXmgTp6yWjNajoznyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83216553"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83216553"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 20:56:35 -0700
X-CSE-ConnectionGUID: d3s4LI9LSSyIWae+3jr6XA==
X-CSE-MsgGUID: jGFLvg4dSQ66bcH0x8cRlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="256380867"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jul 2026 20:56:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whfsB-00000000HFb-0YZ6;
	Thu, 09 Jul 2026 03:56:28 +0000
Date: Thu, 09 Jul 2026 11:55:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-06 6/6]
 drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c:38:5: warning: no previous
 prototype for 'pl011_hyp_init'
Message-ID: <202607091111.GZ7Jiqsp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-06
head:   390b7edeb81f88e84084ff2e63d8db892e9f2414
commit: 1a8bda12e0e953d8b55f264a3ca0e33a508965ab [6/6] ANDROID: drivers: misc: Add an example pl011 driver for pKVM
config: arm64-randconfig-r073-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091111.GZ7Jiqsp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091111.GZ7Jiqsp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091111.GZ7Jiqsp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c:38:5: warning: no previous prototype for 'pl011_hyp_init' [-Wmissing-prototypes]
      38 | int pl011_hyp_init(const struct pkvm_module_ops *ops)
         |     ^~~~~~~~~~~~~~
--
   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: lib/dim/net_dim.o: in function `net_dim_free_irq_moder':
   net_dim.c:(.text+0x23c): undefined reference to `lockdep_rtnl_is_held'
>> aarch64-linux-ld: net_dim.c:(.text+0x28c): undefined reference to `lockdep_rtnl_is_held'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
>> phylink.c:(.text+0x46c): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x534): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x5e8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x66c): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x694): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x6e0): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x704): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x74c): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x774): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x7b8): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x7f0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x834): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x860): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x888): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x8d0): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x8fc): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x944): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x9a0): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0xad8): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0xcc8): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0xd4c): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   phylink.c:(.text+0xe34): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x1110): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x114c): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
>> phylink.c:(.text+0x11f8): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x1260): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x12f4): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x1378): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x13a8): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: phylink.c:(.text+0x1414): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x1424): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x14d8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1528): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x1550): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x159c): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x168c): undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: phylink.c:(.text+0x16b8): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x17d8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1820): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x194c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x19e0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x19ec): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x1a74): undefined reference to `phy_start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   phylink.c:(.text+0x1b58): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x1c5c): undefined reference to `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x1cf4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1d38): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   phylink.c:(.text+0x1ddc): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1e54): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x1ea4): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x1ebc): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x1ef0): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x1f04): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x2010): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x20d8): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x2134): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
   phylink.c:(.text+0x2450): undefined reference to `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0x246c): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x247c): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x24b4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2540): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2550): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   phylink.c:(.text+0x2908): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
>> phylink.c:(.text+0x2a88): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x2c2c): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x2c90): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2cf8): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2db0): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x2df0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2e6c): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: phylink.c:(.text+0x2e94): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x3014): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: phylink.c:(.text+0x303c): undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x31b4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3274): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x32b8): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x33dc): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x343c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x34b0): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x351c): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x35b4): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   phylink.c:(.text+0x385c): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x3984): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3ae8): undefined reference to `netdev_printk'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +/pl011_hyp_init +38 drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c

    37	
  > 38	int pl011_hyp_init(const struct pkvm_module_ops *ops)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
