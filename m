Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E59B17C91
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 01:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734484594; cv=none; b=Ji40GZZVlQAE389M3/lCM1k68DMDLKYsNO1KGELElF7cJVkvRf9xRGLvgrmM+VThC2Q0MZJOKamJnOOh9d0LDykufrIaDPVut+Yf379jmPZ0QLP4A1tdKS0dUSP30EUpVD0qlURXbZIvvrmuI7rgvv4VJ7HUgjSIeNM8f+XJ5l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734484594; c=relaxed/simple;
	bh=dc69WPsM3bje7oQwxqHcc1Y+708bWWZ6A7vwU+Df5OU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+K9hnAhIlV6WVa6I8NIvL8nNkZDNVgNMk8hOVp+mLThXqYrN12k574kxPhX32rXxbXatwmR64L/dcguxaz1Pdff1tASLs8XiLBuTEvGb4F5ElsdziuBCC9QZvvxCJYIMK7gPyu4npsgrnT0UWSu2qOrl0+6lQoM/0EGhEWd+cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDjE6iv/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDjE6iv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734484592; x=1766020592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dc69WPsM3bje7oQwxqHcc1Y+708bWWZ6A7vwU+Df5OU=;
  b=lDjE6iv/2ybEDr8OKDF3XcTnLanmYDzzdSDiRfund0ewlLUYf68xa51f
   ofJ0/gDS5e+gTy77NOGRg2Zt8iNGLLeexrhU4rcNjP7cIMYYyBD1uf+av
   uV0y0x36APNL6MMoVCawJWzuCBPhlByMh3fRnppo6Av3VBuv3cDjb+fo/
   5h+vEY3MRYK4jFoMJASanx39IeXFWJoDYsGAaQGt5rJ9gsK5d9B3GOi0u
   rz5O+wdj0iQe2AykdeBNDvTVvzRuAq1J4iRQrl9ehneCTBBelZgiYU4ub
   npovvoHlMNZ/LI4iI1TOzQqrF40mFo3gZeD6fErVPsGRWPm5rtEMu2emB
   g==;
X-CSE-ConnectionGUID: dEHakYLeTUWBCXChjA2XBw==
X-CSE-MsgGUID: ezqRNf8gTMaM4V3KhViyAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45635123"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="45635123"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:16:32 -0800
X-CSE-ConnectionGUID: O+uQslTvRVGqpdotCAWiCg==
X-CSE-MsgGUID: TiPYSyahSMmCz/qptR14BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102699320"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Dec 2024 17:16:30 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNifr-000Fxe-2v;
	Wed, 18 Dec 2024 01:16:27 +0000
Date: Wed, 18 Dec 2024 09:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: Chanho Park <chanho61.park@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Subject: [sudeep-holla:android13-5.10/ffa 2111/9999] phylink.c:undefined
 reference to `phy_duplex_to_str'
Message-ID: <202412180901.nqQ0SKiA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: 36ab8cea47b0d4a3c5067577430c147a903b5261 [2111/9999] ANDROID: GKI: Kconfig.gki: Add GKI_HIDDEN_ETHERNET_CONFIGS
config: i386-buildonly-randconfig-004-20241218 (https://download.01.org/0day-ci/archive/20241218/202412180901.nqQ0SKiA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412180901.nqQ0SKiA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412180901.nqQ0SKiA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x3ca): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x42b): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x45c): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x549): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x5b1): undefined reference to `tty_hung_up_p'
   ld: hvc_console.c:(.text+0x5ee): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x648): undefined reference to `tty_wait_until_sent'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x6e8): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x728): undefined reference to `tty_buffer_request_room'
   ld: hvc_console.c:(.text+0x77c): undefined reference to `__tty_insert_flip_char'
   ld: hvc_console.c:(.text+0x812): undefined reference to `tty_flip_buffer_push'
   ld: hvc_console.c:(.text+0x89a): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x8e9): undefined reference to `tty_wakeup'
   ld: hvc_console.c:(.text+0x942): undefined reference to `tty_hangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0xd03): undefined reference to `tty_port_install'
   ld: hvc_console.c:(.text+0xd1b): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0xd80): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0xe81): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xf55): undefined reference to `__tty_alloc_driver'
   ld: hvc_console.c:(.text+0xf99): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xfa8): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xfb0): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xfb8): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xfc0): undefined reference to `tty_std_termios'
   ld: drivers/tty/hvc/hvc_console.o:hvc_console.c:(.text+0xfc8): more undefined references to `tty_std_termios' follow
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xffa): undefined reference to `tty_set_operations'
   ld: hvc_console.c:(.text+0x102f): undefined reference to `tty_register_driver'
   ld: hvc_console.c:(.text+0x1097): undefined reference to `tty_port_init'
   ld: hvc_console.c:(.text+0x1230): undefined reference to `put_tty_driver'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x124f): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x1293): undefined reference to `tty_port_put'
   ld: hvc_console.c:(.text+0x129e): undefined reference to `tty_vhangup'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0x11d): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x2cb): undefined reference to `swphy_read_reg'
   ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x3f0): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x5ef): undefined reference to `phy_get_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
>> phylink.c:(.text+0xb2c): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0xb34): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0xc14): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0xc1f): undefined reference to `phy_speed_to_str'
   ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0xce0): undefined reference to `phy_support_asym_pause'
   ld: phylink.c:(.text+0xdbb): undefined reference to `phy_attached_info_irq'
   ld: phylink.c:(.text+0xe70): undefined reference to `phy_request_interrupt'
   ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0xfd3): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x171d): undefined reference to `phy_attach_direct'
   ld: phylink.c:(.text+0x175b): undefined reference to `phy_detach'
   ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x185a): undefined reference to `phy_disconnect'
   ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x1980): undefined reference to `phy_start'
   ld: drivers/net/phy/phylink.o: in function `phylink_stop':
>> phylink.c:(.text+0x1b73): undefined reference to `phy_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x1c06): undefined reference to `phy_ethtool_get_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x1c38): undefined reference to `phy_ethtool_set_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
>> phylink.c:(.text+0x1cd3): undefined reference to `phy_ethtool_ksettings_get'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
>> phylink.c:(.text+0x1de9): undefined reference to `phy_ethtool_ksettings_set'
   ld: phylink.c:(.text+0x1ec2): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
>> phylink.c:(.text+0x20b6): undefined reference to `phy_restart_aneg'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
>> phylink.c:(.text+0x21fb): undefined reference to `linkmode_set_pause'
   ld: phylink.c:(.text+0x2243): undefined reference to `phy_set_asym_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x22f3): undefined reference to `phy_get_eee_err'
   ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x232e): undefined reference to `phy_init_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x2358): undefined reference to `phy_ethtool_get_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x2398): undefined reference to `phy_ethtool_set_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
>> phylink.c:(.text+0x240b): undefined reference to `phy_mii_ioctl'
   ld: phylink.c:(.text+0x24c1): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x2554): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x27b1): undefined reference to `phy_speed_down'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x27ec): undefined reference to `phy_speed_up'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x2922): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x2933): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   phylink.c:(.text+0x2a6e): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x2a8a): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x2ab4): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x2b1a): undefined reference to `mdiobus_modify'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x2b78): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x2b8e): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x2bb8): undefined reference to `mdiobus_read'
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   videobuf2-core.c:(.text+0x2a63): undefined reference to `v4l_vb2q_enable_media_source'
   ld: drivers/power/supply/da9150-charger.o: in function `da9150_charger_probe':
   da9150-charger.c:(.text+0x64c): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   rt9455_charger.c:(.text+0xeac): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0x159): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: isp1704_charger.c:(.text+0x2d8): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/twl4030_charger.o: in function `twl4030_bci_probe':
   twl4030_charger.c:(.text+0x12fb): undefined reference to `devm_usb_get_phy_by_node'
   ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0xa32): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/sc2731_charger.o: in function `sc2731_charger_probe':
   sc2731_charger.c:(.text+0x542): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: sc2731_charger.c:(.text+0x588): undefined reference to `usb_phy_get_charger_current'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
