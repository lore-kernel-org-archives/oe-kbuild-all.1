Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF31927F3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689952947; x=1721488947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i7tQhfjWDcv/jxeinBDNy/STDBqlkRQoi2UKiGBQqtk=;
  b=DG5OySALW95MSnfwJP3MxpaxGU7uMmusmNxzN1GhIDP15xJEL+TDPnX9
   /CRMyGy62P/k04KhgSJ60CaLk/vMKlv5S8EDt7QtAxDUfRs0rIn7Zfvq7
   bmcOnzL/U0revWKK4tnsVLUMg3tBvmKqe11D7RoS3ggncDluXL7W7B05a
   wGbnmzDfWZgqc3ARpyvPKbQHGg0c+Hp5u/73cHfY2YBd81tuKAWGfe2Ui
   0dqQTsbkvTlC1sCewSFp1x/gRXchKZmZi2myoHjHQwNc1CZXtbI2HD607
   xftQg7a3RIZblXIP0/jHQo4UwQIKwMxz2lFf89hPYdU3GuT2s1hqgHg6m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="369716440"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="369716440"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:22:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="848855351"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="848855351"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Jul 2023 08:22:25 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMrxZ-0007Oz-0Q;
	Fri, 21 Jul 2023 15:22:25 +0000
Date: Fri, 21 Jul 2023 23:21:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/2] kernel/gki_module.c:35:6:
 warning: no previous prototype for 'gki_is_module_protected_export'
Message-ID: <202307212311.6kWX3OxG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   c2591e463d937595aebfd99397a2a13de0624af1
commit: fd1e768866606ff230280f26faca797bb47bd8c0 [1/2] ANDROID: GKI: Protect exports of protected GKI modules
config: arm64-randconfig-m041-20230721 (https://download.01.org/0day-ci/archive/20230721/202307212311.6kWX3OxG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307212311.6kWX3OxG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307212311.6kWX3OxG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x1dc): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x244): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
>> (.text+0x3e4): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
>> (.text+0x470): undefined reference to `mdiobus_read'
   aarch64-linux-ld: (.text+0x490): undefined reference to `mdiobus_write'
   aarch64-linux-ld: (.text+0x4cc): undefined reference to `mdiobus_read'
   aarch64-linux-ld: (.text+0x514): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   (.text+0x544): undefined reference to `mdiobus_read'
   aarch64-linux-ld: (.text+0x55c): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x5c4): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
>> (.text+0x658): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0x798): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
>> (.text+0x848): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   (.text+0x910): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0x95c): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   (.text+0xa04): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0xa1c): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   (.text+0xac4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0xad8): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   (.text+0xb94): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0xba8): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   (.text+0xce0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0xcf8): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   (.text+0xd98): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0xdac): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   (.text+0xe54): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0xe68): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   (.text+0xf14): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0xf58): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   (.text+0xff4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0x1034): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   (.text+0x1170): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   (.text+0x1230): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0x1240): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   (.text+0x1368): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0x13d0): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x167c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x169c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x16e4): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   (.text+0x1700): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0x1714): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   (.text+0x17cc): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0x1808): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: (.text+0x1890): undefined reference to `mdiobus_read'
   aarch64-linux-ld: (.text+0x18cc): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x1be0): undefined reference to `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0x1c40): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x1c50): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x1c94): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x1ca4): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x1cd8): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   (.text+0x1e08): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0x1ea0): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: (.text+0x1ee8): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   (.text+0x1ffc): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0x2010): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: (.text+0x20bc): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: (.text+0x2360): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x2680): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   (.text+0x2758): undefined reference to `mdiobus_read'
   aarch64-linux-ld: (.text+0x276c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x2910): undefined reference to `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   (.text+0x2a34): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: (.text+0x2a58): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: (.text+0x2afc): undefined reference to `phy_start'
   aarch64-linux-ld: (.text+0x2ccc): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   (.text+0x2d70): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x3290): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x3310): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x339c): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: phylink.c:(.text+0x3524): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x35bc): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
>> (.text+0x3648): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: (.text+0x36d4): undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   phylink.c:(.text+0x39fc): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3a2c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3a9c): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x3c7c): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x3e4c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3e84): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3ec0): undefined reference to `netdev_printk'
--
>> kernel/gki_module.c:35:6: warning: no previous prototype for 'gki_is_module_protected_export' [-Wmissing-prototypes]
      35 | bool gki_is_module_protected_export(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/gki_module.c:46:6: warning: no previous prototype for 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      46 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


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
