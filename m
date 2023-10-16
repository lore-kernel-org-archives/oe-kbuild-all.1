Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07930347AA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 22:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCB+js/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697493875; x=1729029875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xwkULhVS/LXbN9tzu0ZY4V5P+H23XA7neUuVG1QXyds=;
  b=fCB+js/WYMWZUME8kxUY+WPqLXSTZuZnN2KvbZITni4AIUvsuQbS1hC6
   GPOZhd6pI6jrNXvC3QFH+ICqh3ssBjhTdj0+C/g88GIXLk2IbAGSFvsJb
   pLorjBYDKfJxoZJHRm9p2luEjk1pyoqs/9Wsec1TNPuJNPFGkt9dhcNSC
   m8sFGvq6JVl/+LX4sEroeZNKXIueoRU+8vgIJslqGwIZ4XZFyy2tPd8bJ
   O57/Q3V3eMA+dkOxNEowSd/SlnDsT82r6Ult85Ty58u/7J70qbCHkXYfF
   kIUtvtJwrJQ16JkMkOPO30eF7MmyNrDMrvp398/ZSJX0QrFQXLUZ8dZKl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="365908284"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="365908284"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 15:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="755845539"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="755845539"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Oct 2023 15:04:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsVhO-0008hb-0f;
	Mon, 16 Oct 2023 22:04:30 +0000
Date: Tue, 17 Oct 2023 06:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ramji Jiyani <ramjiyani@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:android13-5.15/ffa 2523/4062]
 kernel/gki_module.c:35:6: warning: no previous prototype for
 'gki_is_module_protected_symbol'
Message-ID: <202310170528.E7z4vtWl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: f8bd6cf70dec3961c8b15b987866af33be2ce82b [2523/4062] ANDROID: GKI: Add module load time protected symbol lookup
config: arm-randconfig-001-20231017 (https://download.01.org/0day-ci/archive/20231017/202310170528.E7z4vtWl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170528.E7z4vtWl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170528.E7z4vtWl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   phylink.c:(.text+0x916): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x92a): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x94a): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x978): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x9d4): undefined reference to `swphy_read_reg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0xa08): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xa6a): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0xc30): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0xcc4): undefined reference to `mdiobus_modify'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0xe40): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xe60): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_change_inband_advert':
   phylink.c:(.text+0xf9c): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x102e): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x108c): undefined reference to `linkmode_set_pause'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x10c6): undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x115a): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x11ce): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x1236): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1240): undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   phylink.c:(.text+0x12dc): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1306): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x1382): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1392): undefined reference to `phy_ethtool_ksettings_set'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x14ae): undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x15aa): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x1784): undefined reference to `linkmode_resolve_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x17d2): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x17de): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x19a0): undefined reference to `phy_get_pause'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1a4a): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1a56): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1abe): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1aca): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1af8): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x1b2e): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1b48): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1c7a): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   phylink.c:(.text+0x1cb2): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x1fc8): undefined reference to `phy_support_asym_pause'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x203a): undefined reference to `phy_attached_info_irq'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x20ce): undefined reference to `phy_request_interrupt'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2144): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2192): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x21b2): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x223e): undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2290): undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   phylink.c:(.text+0x2474): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2480): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x248c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x25d0): undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2720): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x272c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2750): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x293a): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2944): undefined reference to `phy_restart_aneg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x2ac): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_up':
   phylink.c:(.text+0x3d0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x570): undefined reference to `phy_disconnect'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x5d4): undefined reference to `phy_ethtool_get_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x636): undefined reference to `phy_ethtool_set_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x7c2): undefined reference to `phy_get_eee_err'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x80c): undefined reference to `phy_init_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x836): undefined reference to `phy_ethtool_get_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x89a): undefined reference to `phy_ethtool_set_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x9a2): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
>> phylink.c:(.text+0xa9a): undefined reference to `phy_mii_ioctl'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xae4): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0xc5e): undefined reference to `phy_speed_down'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0xe54): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x11fa): undefined reference to `phy_speed_up'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mac_change':
   phylink.c:(.text+0x1962): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x1b80): undefined reference to `phy_start'
   arm-linux-gnueabi-ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   rt9455_charger.c:(.text+0xcc8): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0x7e8): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: drivers/android/android_debug_symbols.o:(.rodata+0x14): undefined reference to `__per_cpu_start'
   arm-linux-gnueabi-ld: drivers/android/android_debug_symbols.o:(.rodata+0x1c): undefined reference to `__per_cpu_end'
>> arm-linux-gnueabi-ld: drivers/android/android_debug_symbols.o:(.rodata+0x74): undefined reference to `stack_guard_gap'
--
>> kernel/gki_module.c:35:6: warning: no previous prototype for 'gki_is_module_protected_symbol' [-Wmissing-prototypes]
      35 | bool gki_is_module_protected_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/gki_module.c:46:6: warning: no previous prototype for 'gki_is_module_exported_symbol' [-Wmissing-prototypes]
      46 | bool gki_is_module_exported_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/gki_is_module_protected_symbol +35 kernel/gki_module.c

    29	
    30	/**
    31	 * gki_is_module_protected_symbol - Is a symbol protected from unsigned module?
    32	 *
    33	 * @name:	Symbol being checked against protection from unsigned module
    34	 */
  > 35	bool gki_is_module_protected_symbol(const char *name)
    36	{
    37		return bsearch(name, gki_protected_symbols, NO_OF_PROTECTED_SYMBOLS,
    38			       MAX_PROTECTED_NAME_LEN, cmp_name) != NULL;
    39	}
    40	
    41	/**
    42	 * gki_is_module_exported_symbol - Is a symbol exported from a GKI module?
    43	 *
    44	 * @name:	Symbol being checked against exported symbols from GKI modules
    45	 */
  > 46	bool gki_is_module_exported_symbol(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
