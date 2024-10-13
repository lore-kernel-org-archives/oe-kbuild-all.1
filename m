Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F03C81AD7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728807047; cv=none; b=b1moLCUMkz3Q1uvLbRliToxRaUIaXM55gTb9qkOb4s2neSLkiVBWw2LNoRHm4Eq1+1YhhDFz9eXcRkPSqFW/IpKVprFLZ8zYd3h49e3Nsx9F+eKbtD/c2f68N7IWm0EzGzwhZtA7AuKqqtfIAl5ZSae/9YMKUBlnyNzuZtYBfUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728807047; c=relaxed/simple;
	bh=PrwuowS+fVKuvSfuS4pWzHZYwqlxm/OrbLQvFJPuUnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WnpZsy1pcQD7EcrBuF82MC3xt/H1lgTxMwNdubQosGlzAC4smwOp6+RIPv5WWkdoDvVZ/rY08QXZPa2RPijo77fnYbK3R6Fcgtc7MjafKNZ+HjqajLpwSSttM7e7hXfk0My7dTskF0Eq6p4wn/Wub1Jf34WxM+19i1SchV9gWak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4AdyG82; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4AdyG82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728807045; x=1760343045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PrwuowS+fVKuvSfuS4pWzHZYwqlxm/OrbLQvFJPuUnU=;
  b=d4AdyG82DoBOq0A9oRFMBCMQ/Bih+AIAmCNNWV43++0w4gtH/HLtpjQX
   aZusBNWT/r/CD7mD7zWPBmH445bxz0T+w4Lmog0NyLbRp38F9cVPE3Wxj
   u4ogzbBiZghA2Ojj9txf+nYGORdqi1QJvq83SAz4+Qt1PTv3zr+szsHGt
   wxFQF/8atFEy/sryFZQ4BK0+TgxX5AG61d0NswjktIWuu1upU5iuiVV8N
   8XIJeGH9QbzFV/e8Va71rYRag4fAvpzdsz29d7onHUk3SdDbJ8UPGDGzz
   ZAKfUSfPSgnnH/Noaw+vJpDbE8i4oWuY3pfVnaYGd2hpm9xxbD6M3SW2M
   w==;
X-CSE-ConnectionGUID: ifEgXpRISjOYwSEr1Oflmg==
X-CSE-MsgGUID: y6N/vCdwQmepYL+KokRCuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28292840"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28292840"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 01:10:42 -0700
X-CSE-ConnectionGUID: bBpGwXMpQG+dPOn5LU0C/Q==
X-CSE-MsgGUID: GbhXrvEpRJ6w+L0UjMw8HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="78113022"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Oct 2024 01:10:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sztgU-000ECs-0k;
	Sun, 13 Oct 2024 08:10:38 +0000
Date: Sun, 13 Oct 2024 16:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/7] net_dim.c:undefined reference
 to `lockdep_rtnl_is_held'
Message-ID: <202410131614.zrmcFobT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   4c2b12a9dad4728f1f4035725f60b9b0754ac027
commit: 1dfbe413d21f18f714cca818435299947bf5649a [1/7] Merge 6706415bf9f3 ("Merge tag 'gfs2-v6.10-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2") into android-mainline
config: arm64-randconfig-004-20241013 (https://download.01.org/0day-ci/archive/20241013/202410131614.zrmcFobT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131614.zrmcFobT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131614.zrmcFobT-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: lib/dim/net_dim.o: in function `net_dim_free_irq_moder':
>> net_dim.c:(.text+0x794): undefined reference to `lockdep_rtnl_is_held'
>> aarch64-linux-ld: net_dim.c:(.text+0x80c): undefined reference to `lockdep_rtnl_is_held'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x6dc): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x7b0): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x7f8): undefined reference to `tty_do_resize'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x95c): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x9d8): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0xa90): undefined reference to `tty_port_put'
   aarch64-linux-ld: hvc_console.c:(.text+0xa9c): undefined reference to `tty_vhangup'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xb78): undefined reference to `tty_std_termios'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `tty_std_termios' which may bind externally can not be used when making a shared object; recompile with -fPIC
   hvc_console.c:(.text+0xb78): dangerous relocation: unsupported relocation
   aarch64-linux-ld: hvc_console.c:(.text+0xb88): undefined reference to `tty_std_termios'
   aarch64-linux-ld: hvc_console.c:(.text+0xc30): undefined reference to `tty_register_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0xc60): undefined reference to `tty_driver_kref_put'
   aarch64-linux-ld: hvc_console.c:(.text+0xc84): undefined reference to `tty_driver_kref_put'
   aarch64-linux-ld: hvc_console.c:(.text+0xd10): undefined reference to `tty_port_init'
   aarch64-linux-ld: hvc_console.c:(.text+0xfb0): undefined reference to `__tty_alloc_driver'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x1100): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x1178): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0x11f4): undefined reference to `tty_hangup'
   aarch64-linux-ld: hvc_console.c:(.text+0x142c): undefined reference to `__tty_insert_flip_string_flags'
   aarch64-linux-ld: hvc_console.c:(.text+0x14ac): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0x14e8): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0x1524): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0x1558): undefined reference to `tty_flip_buffer_push'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0x1ae8): undefined reference to `tty_port_install'
   aarch64-linux-ld: hvc_console.c:(.text+0x1af8): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x1bec): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x1d0c): undefined reference to `tty_hung_up_p'
   aarch64-linux-ld: hvc_console.c:(.text+0x1d58): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x1dec): undefined reference to `tty_wait_until_sent'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0x1f08): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x804): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x88c): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x8e8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x994): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x9f8): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0xa24): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xa54): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0xa78): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xa90): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0xab8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xacc): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0xb0c): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0xb38): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xb50): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0xb7c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xb94): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0xbe8): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0xca8): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0xcd8): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0xd00): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xd30): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0xd50): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xd7c): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0xdec): undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: phylink.c:(.text+0xe3c): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   phylink.c:(.text+0xf80): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x14ec): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x1514): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x17a8): undefined reference to `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0x17e4): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x17f0): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x1834): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1860): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x186c): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x1a5c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1bdc): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1f34): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2014): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x23d4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x24bc): undefined reference to `linkmode_set_pause'

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
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
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
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
