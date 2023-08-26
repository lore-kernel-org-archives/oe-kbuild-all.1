Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A55037C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 06:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693033166; x=1724569166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xYiuZqdGKOToDqGkds6fn0XCr+9BUBPxNJQfz5xK5h8=;
  b=P+wzWRhZ0i9fVOAb3GMPHTONwYGXuP3HnrIDifO+Xlv7E30D4FHJ7C4H
   fEyV0L1wrOf4AYePiFWhho8EkGdCK9HiFsavyfmQYJr9goe4GbTQHfKk8
   BNKzeoKU0CMESKKCn0yxH+jl0X8bWz20cQJezq8fft9GibHYjAJcIFXis
   R4RkJUvDLSWikhLOZLyiWVmtYhAZjjNitP5aDZXjWwldqiCLRh47WDk8B
   jmiAzisuRgx0n83ql2BHY255x6Cj3F5CIbrgsSTHN6uQ/lfMfhfJDnrPh
   j+qePsZkw1VloOwz9EUHfSd79u98GSO6j+SxdrRoD4NIWyYW26zNUlx6U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373728843"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="373728843"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 23:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="861291302"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="861291302"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Aug 2023 23:59:23 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZnGU-0004RT-1M;
	Sat, 26 Aug 2023 06:59:22 +0000
Date: Sat, 26 Aug 2023 14:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/2] kernel/gki_module.c:35:6:
 warning: no previous prototype for 'gki_is_module_protected_export'
Message-ID: <202308261423.hRhv7rLZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   7b00dfafc960b9b46bcd0f431a4f52824eb9611b
commit: fd1e768866606ff230280f26faca797bb47bd8c0 [1/2] ANDROID: GKI: Protect exports of protected GKI modules
config: i386-buildonly-randconfig-001-20230826 (https://download.01.org/0day-ci/archive/20230826/202308261423.hRhv7rLZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261423.hRhv7rLZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261423.hRhv7rLZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/gki_module.c:35:6: warning: no previous prototype for 'gki_is_module_protected_export' [-Wmissing-prototypes]
      35 | bool gki_is_module_protected_export(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/gki_module.c:46:6: warning: no previous prototype for 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      46 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0x20d): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mac_config':
   phylink.c:(.text+0x2a6): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x2b4): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x348): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x356): undefined reference to `phy_speed_to_str'
   ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
>> (.text+0x6de): undefined reference to `phy_disconnect'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
>> (.text+0x74a): undefined reference to `phy_ethtool_get_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
>> (.text+0x7ac): undefined reference to `phy_ethtool_set_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
>> (.text+0x81a): undefined reference to `phy_restart_aneg'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
>> (.text+0x87b): undefined reference to `phy_get_eee_err'
   ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
>> (.text+0x8ce): undefined reference to `phy_init_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
>> (.text+0x8fc): undefined reference to `phy_ethtool_get_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
>> (.text+0x96c): undefined reference to `phy_ethtool_set_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
>> (.text+0x9d8): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   (.text+0xa48): undefined reference to `mdiobus_read'
   ld: (.text+0xa5e): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0xab0): undefined reference to `swphy_read_reg'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
>> (.text+0xb07): undefined reference to `phy_speed_down'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
>> (.text+0xb7a): undefined reference to `phy_speed_up'
   ld: drivers/net/phy/phylink.o: in function `phylink_stop':
>> (.text+0xbd7): undefined reference to `phy_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0xdc1): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0xdcc): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0xe0b): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0xe16): undefined reference to `phy_speed_to_str'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
>> (.text+0x102b): undefined reference to `linkmode_set_pause'
   ld: (.text+0x1073): undefined reference to `phy_set_asym_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   (.text+0x1192): undefined reference to `mdiobus_read'
   ld: (.text+0x11b2): undefined reference to `mdiobus_read'
   ld: (.text+0x11cb): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
>> (.text+0x123a): undefined reference to `mdiobus_modify'
   ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x12c8): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   (.text+0x1362): undefined reference to `mdiobus_read'
   ld: (.text+0x1373): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x17ab): undefined reference to `phy_get_pause'
   ld: phylink.c:(.text+0x1885): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x1893): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x1928): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x1936): undefined reference to `phy_speed_to_str'
   ld: drivers/net/phy/phylink.o: in function `phylink_start':
>> (.text+0x1a01): undefined reference to `phy_start'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
>> (.text+0x2058): undefined reference to `phy_mii_ioctl'
   ld: (.text+0x2121): undefined reference to `mdiobus_read'
   ld: (.text+0x21a6): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
>> (.text+0x2373): undefined reference to `phy_ethtool_ksettings_get'
   ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x256c): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x26c3): undefined reference to `phy_support_asym_pause'
   ld: phylink.c:(.text+0x279b): undefined reference to `phy_attached_info_irq'
   ld: phylink.c:(.text+0x287a): undefined reference to `phy_request_interrupt'
   ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
>> (.text+0x293a): undefined reference to `phy_attach_direct'
   ld: (.text+0x298b): undefined reference to `phy_detach'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
>> (.text+0x2ee4): undefined reference to `phy_ethtool_ksettings_set'
   ld: (.text+0x3064): undefined reference to `phy_lookup_setting'
   ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
   wm831x_power.c:(.text+0xa3e): undefined reference to `devm_usb_get_phy_by_phandle'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/gki_is_module_protected_export +35 kernel/gki_module.c

    29	
    30	/**
    31	 * gki_is_module_protected_export - Is a symbol exported from a protected GKI module?
    32	 *
    33	 * @name:	Symbol being checked against exported symbols from protected GKI modules
    34	 */
  > 35	bool gki_is_module_protected_export(const char *name)
    36	{
    37		return bsearch(name, gki_protected_exports_symbols, NR_PROTECTED_EXPORTS_SYMBOLS,
    38			       MAX_PROTECTED_EXPORTS_NAME_LEN, cmp_name) != NULL;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
