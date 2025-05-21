Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F023125DD0B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 11:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826093; cv=none; b=tCTnTh2o/h3VXq3aWxz3yhrQ6rn4JushdZk3V9pNTQJoIh8pTHUOGQFMlCv2Pt7M1/viBl2YBt2jvplsf7LQC0hmw9F2/JVU749I0JGl6KmUKGIerLP56eboAqkQ4OX/cVDRr14Jng866ngtCExxTdihEF5MygjOSZ8ULtlMKQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826093; c=relaxed/simple;
	bh=OM7dB4LToEtnzlkjkUdHZHRMojIp0geDL+9TCcr87xU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dntQyzk4GOvEdMWCqJVoqbcqx7FuAqKST9UaUH5F8K6EYhiiPMX6tzMDIB70usfo4N2n3LUgViiXA5NLg2f0C/oVdosv7dXz+g/gYY12nhfShMkDk729c2qaLC5KVVJfQG3FoMwvSmrCTg9SCNgx3Y55ssBEIgPJOr6GFFOIGHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3EORq1u; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3EORq1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747826093; x=1779362093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OM7dB4LToEtnzlkjkUdHZHRMojIp0geDL+9TCcr87xU=;
  b=h3EORq1uwD7605Z0D5+hjXHIDpYSO2cNc6anQntlAtz2IIYrMoWYI52g
   ZmL24nSKhtuAy4dt7emm0n3ogNUx3joMPC+MiBM+QltpXr8/6TVc+BejC
   x/G5Zcg81wgM862RbAKh1fQwFsROXlN8ktvRmUtQrZCAjHD/rbpg6JXPh
   d7Itdvq+0exbgyDtyI6KwUp3CCHA24NTl2xqBDp6IfDG44IO2AfEE72hG
   qMKr7KRpzirStx+IKdraG1Ym6VNd/9ScNjXBr3p08/G9AgcCFlZf+Rzf2
   hiILkTKGrCgP/ekKtEmxea2PhYHB1jlNUqzzi1MFQlkFOYSYmjROBq0Gj
   A==;
X-CSE-ConnectionGUID: 1Tn6wvSnTxSdYufXfyEqcA==
X-CSE-MsgGUID: xie+JMEiQ+aEfE5WlIx5VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60033544"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60033544"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 04:14:52 -0700
X-CSE-ConnectionGUID: Y01RcL5qSB6smKNTlj1c9w==
X-CSE-MsgGUID: UHeDbh4CRV6Yb2BtIaxXMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="171023087"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 May 2025 04:14:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHhPM-000OAy-03;
	Wed, 21 May 2025 11:14:48 +0000
Date: Wed, 21 May 2025 19:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] phylink.c:undefined reference
 to `phy_eee_rx_clock_stop'
Message-ID: <202505211953.Lw9hb9UD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   64f98507f5d334d943915b754f15e9df4fc673fc
commit: add2a3ec5fa37f0c1be4022f4b51178803463a24 [2/2] Merge 1a9239bb4253 ("Merge tag 'net-next-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next") into android-mainline
config: arm64-randconfig-003-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211953.Lw9hb9UD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211953.Lw9hb9UD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211953.Lw9hb9UD-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x420): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x4cc): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x504): undefined reference to `tty_do_resize'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x600): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x660): undefined reference to `tty_hung_up_p'
   aarch64-linux-ld: hvc_console.c:(.text+0x6a8): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x6fc): undefined reference to `tty_wait_until_sent'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x764): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x7bc): undefined reference to `tty_port_put'
   aarch64-linux-ld: hvc_console.c:(.text+0x7c8): undefined reference to `tty_vhangup'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x828): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x9ac): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0xa00): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0xa60): undefined reference to `__tty_insert_flip_string_flags'
   aarch64-linux-ld: hvc_console.c:(.text+0xb28): undefined reference to `tty_flip_buffer_push'
   aarch64-linux-ld: hvc_console.c:(.text+0xba4): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0xc34): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0xc7c): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0xcd8): undefined reference to `tty_hangup'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xebc): undefined reference to `__tty_alloc_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0xed0): undefined reference to `tty_std_termios'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `tty_std_termios' which may bind externally can not be used when making a shared object; recompile with -fPIC
   hvc_console.c:(.text+0xed0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: hvc_console.c:(.text+0xed4): undefined reference to `tty_std_termios'
   aarch64-linux-ld: hvc_console.c:(.text+0xf5c): undefined reference to `tty_driver_kref_put'
   aarch64-linux-ld: hvc_console.c:(.text+0xfac): undefined reference to `tty_port_init'
   aarch64-linux-ld: hvc_console.c:(.text+0x11b0): undefined reference to `tty_register_driver'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0x1580): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0x15cc): undefined reference to `tty_port_install'
   aarch64-linux-ld: hvc_console.c:(.text+0x15f0): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
   phylink.c:(.text+0x354): undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode':
   phylink.c:(.text+0x544): undefined reference to `phy_inband_caps'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0xb1c): undefined reference to `phy_config_inband'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_caps_to_linkmodes':
   phylink.c:(.text+0xd40): undefined reference to `phy_caps_linkmodes'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block':
>> phylink.c:(.text+0xe14): undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock':
   phylink.c:(.text+0xeec): undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x101c): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_prepare_resume':
>> phylink.c:(.text+0x10b4): undefined reference to `phy_resume'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x1128): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x1198): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x120c): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x128c): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x1308): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x13d8): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x1498): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x14b0): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x1504): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x1628): undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: phylink.c:(.text+0x1668): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: phylink.c:(.text+0x1698): undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x1824): undefined reference to `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause.part.27':
   phylink.c:(.text+0x18f8): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x1a00): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x1e58): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x1e6c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   phylink.c:(.text+0x1f90): undefined reference to `phy_caps_from_interface'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   phylink.c:(.text+0x235c): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x2630): undefined reference to `phy_ethtool_ksettings_set'
>> aarch64-linux-ld: phylink.c:(.text+0x27e8): undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x29b4): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x29fc): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
   phylink.c:(.text+0x2e1c): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2e2c): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2f30): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2f38): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x3020): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: phylink.c:(.text+0x303c): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x3120): undefined reference to `phy_detach'
   aarch64-linux-ld: phylink.c:(.text+0x318c): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x3258): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: phylink.c:(.text+0x3278): undefined reference to `phy_eee_tx_clock_stop_capable'
   aarch64-linux-ld: phylink.c:(.text+0x32b8): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: phylink.c:(.text+0x3340): undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: phylink.c:(.text+0x338c): undefined reference to `phy_support_eee'
   aarch64-linux-ld: phylink.c:(.text+0x3398): undefined reference to `phy_disable_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x3424): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x34e0): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: phylink.c:(.text+0x35ec): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: phylink.c:(.text+0x362c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x36e0): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x36f4): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x3718): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x3740): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x37bc): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x3840): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x38a8): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x3bc8): undefined reference to `phy_start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   phylink.c:(.text+0x4374): undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0x31e4): undefined reference to `wext_handle_ioctl'
   aarch64-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
   net-procfs.c:(.ref.text+0x40): undefined reference to `wext_proc_exit'
   aarch64-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_init':
   net-procfs.c:(.init.text+0xdc): undefined reference to `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
