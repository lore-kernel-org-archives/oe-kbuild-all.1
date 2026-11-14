Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645282;
	b=KIrE7uW/g0poUOS794WWk9PBr4lMNA1d/Enctj5sBYSXoy1pBGN0Y/dWa/mJOE3sBqJ6
	 Ig+byQTJ0rfAtcCnuJHVj2Yac5O97umm4VTirpV3ff57NAw0lTXl9SMUL/RQhC2XbcUos
	 KgfEepOhKfMMMykIhVkodHVXE4LXNjOkHmJxjsT1m1JBR29mkddh4M8YmfL8F4feITitR
	 UWtvb8mCaSaFIVash2GQm4PAtOG2QBR9PALTg6TYUgln/ERkFh2Rg+/ZERGiEPnAjMhOO
	 UT4zX2bCXgfylW1Bou6OPCWTXgZlU5YAZQrxhJ1RUb1qwkyvbsgAeDz/68UyQd4wrUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645282;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6ZmHG4PF+nBxknrdE5Tf1FPscX4AsXN+f4t/YD80bOs=;
	b=Y+kq8sjGkr0Dlb/oV9aVTqJGtlaSdUcAXVgKTUj5MQIbtDIKS85q2aW+cbaEboh6MNlQ
	 ptW4r5sz9vxkoqKooUTbPjYvhhs6yYH2QPws3vKIX71Nr+UMSviUdryDn/BCav28TsPc2
	 KwlM0hjfJ1NBETmwNlbvxCaZxKPSdlxtAtjbUjDq42qdMk/wXEEHCGzFcXtpU1gpC9jNe
	 1AivCDXKHcuLMf4P21w6TWHC+0no70+XVi11EbKGT0VJlgIrSctdYbYF3hKfXtqzS8pTs
	 AndUxt58cQDLyRMZW2axBMK25aNLg4bZ/0TKPgbkRwwjRVNWpw2Fk8fJIGj3TuCC0wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hNuUBTMs;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1226606A323
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 08:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1226606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hNuUBTMs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794645280; x=1826181280;
  h=date:from:to:cc:subject:message-id;
  bh=tKR+7TYufZbPEYf2iix4WPbuGnbDM43evhSRfEd+pEk=;
  b=hNuUBTMswl5Aon1QYexJnRChNVVtKt76A4HL+W6bjGUYkgrBBerWWOX2
   6od/TkmmkrsYqzZnVvQqCqs8qF7Yrxa0eReP3KjEOPOzSEDjxSRjtWgYn
   0DLuKQmVjE8M+hDutY2FfX231LX7G/3sPRUWHXFtodn6avWxiD6dtYkoo
   oE53qtNRfPVv5k4LVq2oH6+lRKy9s2JCcuc7g+tAEZ0vUXWG3FZVR2PFz
   2w++fi2TK9t8efi/4FYzdXmrqMCFOgusR448rW2uQQvHMXHk7gwl5Nr4A
   Dde6HCXkLGXBNoqisdLlgqjZ3ZWMilbsYZBEHzwlAb/OMPwu4SdU91Q6F
   A==;
X-CSE-ConnectionGUID: lwzvoBg2Q923JaCaNKVuKQ==
X-CSE-MsgGUID: nwM14JsCQ3SuOQHwa+iquw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3318485"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3318485"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 00:34:40 -0800
X-CSE-ConnectionGUID: ezcK9bR7Rs6xl99iAct9aA==
X-CSE-MsgGUID: QeQ2o3OpQR2vgk3uNrdZ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9368120"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 Nov 2026 00:34:39 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS9DY-000000001Wh-2wVE;
	Sat, 14 Nov 2026 08:34:36 +0000
Date: Sat, 14 Nov 2026 09:34:11 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2/2]
 arch/arm64/mm/dma-mapping-noalias.c:550:6: warning: no previous prototype for
 'arm64_noalias_setup_dma_ops'
Message-ID: <202611140930.74ri9goN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   21d85af22b5c6677ca6d2f9bd71ccc634a9c2554
commit: 3c75a6fb7fd1cd149d7af1a2e200b064a2d12782 [2/2] ANDROID: arm64: Work around Cortex-A510 erratum 2454944
config: arm64-randconfig-r2103-20261114 (https://download.01.org/0day-ci/archive/20261114/202611140930.74ri9goN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140930.74ri9goN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140930.74ri9goN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   aarch64-linux-ld: phylink.c:(.text+0x6b8): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x6cc): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x71c): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x730): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x76c): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x9a0): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0xb78): undefined reference to `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x11f8): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x12a4): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x13ac): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: phylink.c:(.text+0x144c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1508): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x1774): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x19a8): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x19cc): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1a30): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   phylink.c:(.text+0x1c68): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1d68): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o:phylink.c:(.text+0x1dcc): more undefined references to `netdev_printk' follow
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x2278): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: phylink.c:(.text+0x22f4): undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x245c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x24b8): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x25e0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2618): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x2694): undefined reference to `phy_start'
   aarch64-linux-ld: phylink.c:(.text+0x292c): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x2a1c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2a38): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x2b60): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2b84): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x2c20): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2c40): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x2ce4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2d04): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x2e64): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2e84): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x30ac): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x3218): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x32a0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x32c0): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x33e0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x34a4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3568): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x35c0): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x371c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x373c): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x37f4): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x3860): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3880): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x3920): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3940): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x39e8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3a38): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: phylink.c:(.text+0x3b40): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x3c70): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x3d34): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x3e60): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3ea4): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x3f5c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3f9c): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x4238): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x424c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   phylink.c:(.text+0x444c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x4478): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x44b4): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x44e0): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x45ac): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x4634): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x4654): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x46b0): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
>> (.text+0x53ac): undefined reference to `v4l_vb2q_enable_media_source'
   aarch64-linux-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0xda0): undefined reference to `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/sc2731_charger.o: in function `sc2731_charger_probe':
   sc2731_charger.c:(.text+0x6ec): undefined reference to `devm_usb_get_phy_by_phandle'
   aarch64-linux-ld: sc2731_charger.c:(.text+0x768): undefined reference to `usb_phy_get_charger_current'
--
>> arch/arm64/mm/dma-mapping-noalias.c:550:6: warning: no previous prototype for 'arm64_noalias_setup_dma_ops' [-Wmissing-prototypes]
     550 | void arm64_noalias_setup_dma_ops(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/arm64_noalias_setup_dma_ops +550 arch/arm64/mm/dma-mapping-noalias.c

   549	
 > 550	void arm64_noalias_setup_dma_ops(struct device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
