Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DB3C8E0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 05:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739597646; cv=none; b=fZs64F+/hSa1wUEWm7I4LOAYdxJKUjEV9fjCReFrur5GBhabm3PNsfw7LJAZ92a25+AfkwH7M6CkxYxBWUdW3fDSYZ3rZ15b1sq2gl9Jf632bjIPjTrVrIfU6F9BSSdyLyyUebhyAVAhQViffkDIEMjr2Z8eSIe6YwIL8RxonLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739597646; c=relaxed/simple;
	bh=zldxl8eaxwKY6BqCx5d2Pf42Ar8atDrLyj6E16M2X0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OqtYQLb1/HlyG3hqRTduvEYPomnetKR8rv8tWjFXcEPZE0xlKcJw+4zqn0MdHkc0J2lmaVI+C7XeyGXmBOxS8B+vK4kErNVeOro013i1q+P6ZpLGl3SI8YGy7ZGAPetFmfZKPaUPVzXep+pDvdmk/cMSYuKh62w/5L6fyvFx23A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYnc7SGg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYnc7SGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739597644; x=1771133644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zldxl8eaxwKY6BqCx5d2Pf42Ar8atDrLyj6E16M2X0Y=;
  b=hYnc7SGgKVr+Fxb6OktYkYHOaVVk2JBMfMYDpd+EMsIzXJE28XmjYnth
   I1/qqih/fPUJWkgpF1bPwSd8e7X27A5eh6FPIVB53CZCUBcHCNY5Kfvcv
   UwphtudfJIYYbEGAlkLciIkyTFueuTjP0OeaehKd2S1HggWTj+c2pYQZL
   WIM+hQ3Oav29Zgylnn/EIF8OQv8nClmxVyMEDTVLxMbxVq1QxdYRSNZ9E
   a0d+JTuEZiUI3s2fuA9zlAdgL44Td2EFGJF41mrU6y2qhvSpb4zh/jnzK
   FIpSIbxj7U4RE5P/6FNeM/rNQf6gzWyh6nePLIz1jGlNnsBORPnM1n31c
   w==;
X-CSE-ConnectionGUID: bVop8gDYRS6okTj6D36+jQ==
X-CSE-MsgGUID: 1PD+IqxiTVuvSOrlcwQawA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51781046"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51781046"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 21:34:03 -0800
X-CSE-ConnectionGUID: TwDFcmofRxiNK/2IMhPXgA==
X-CSE-MsgGUID: ep9/UiUzRuumHUF+FczWaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114548678"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Feb 2025 21:34:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjAoR-001AX9-20;
	Sat, 15 Feb 2025 05:33:59 +0000
Date: Sat, 15 Feb 2025 13:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] aarch64-linux-ld:
 decompress_unzstd.c:undefined reference to `zstd_get_frame_header'
Message-ID: <202502151331.9lrKg2tm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   4ffa3d30bc8e1b18dd57ffcd8763055715be1d36
commit: d31eda960d587e7797f948cb91d5cc9cf951e9b2 [1/1] Merge 4cece7649650 ("Linux 6.9-rc1") into android-mainline
config: arm64-randconfig-002-20250214 (https://download.01.org/0day-ci/archive/20250215/202502151331.9lrKg2tm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502151331.9lrKg2tm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502151331.9lrKg2tm-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0xb98): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xbe4): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   phylink.c:(.text+0xcd4): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0xe54): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x1010): undefined reference to `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0x109c): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x10a8): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x10e0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x10f0): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x1100): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x1200): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1210): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   phylink.c:(.text+0x131c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1390): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x18c4): undefined reference to `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x1a38): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1a4c): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x1c90): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: phylink.c:(.text+0x1ce0): undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x1f68): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1ff4): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x203c): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x239c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x23b0): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   phylink.c:(.text+0x25cc): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   phylink.c:(.text+0x26c4): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x29b8): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x2ad0): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x2b6c): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: phylink.c:(.text+0x2b98): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: phylink.c:(.text+0x2c90): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2d14): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2d8c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2dc8): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x2e3c): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: phylink.c:(.text+0x2eb4): undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x30d0): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x32bc): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x32f4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3310): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x3480): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x34f0): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x355c): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: phylink.c:(.text+0x360c): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: phylink.c:(.text+0x3638): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x370c): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: phylink.c:(.text+0x372c): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x3784): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x37a0): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x38e0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x38f4): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   phylink.c:(.text+0x3c44): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3c68): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3cc0): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   phylink.c:(.text+0x3f00): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x43c0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x43e0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x4400): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x4420): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x47f8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x4860): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x4a04): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x4b58): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x4cc0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x4ce4): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x4d38): undefined reference to `phy_start'
   aarch64-linux-ld: phylink.c:(.text+0x4ec4): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   phylink.c:(.text+0x4f24): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: lib/decompress_unzstd.o: in function `handle_zstd_error':
   decompress_unzstd.c:(.init.text+0x20): undefined reference to `zstd_get_error_code'
   aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x2c): undefined reference to `zstd_is_error'
   aarch64-linux-ld: lib/decompress_unzstd.o: in function `__unzstd.constprop.0':
   decompress_unzstd.c:(.init.text+0x12c): undefined reference to `zstd_dctx_workspace_bound'
   aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x140): undefined reference to `zstd_init_dctx'
   aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x164): undefined reference to `zstd_find_frame_compressed_size'
   aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x194): undefined reference to `zstd_decompress_dctx'
>> aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x274): undefined reference to `zstd_get_frame_header'
   aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x2c8): undefined reference to `zstd_dstream_workspace_bound'
   aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x2e4): undefined reference to `zstd_init_dstream'
   aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x35c): undefined reference to `zstd_decompress_stream'

Kconfig warnings: (for reference only)
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
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
