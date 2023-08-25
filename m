Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F471C02
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 22:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693002990; x=1724538990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IC+g9XnEHCL49krEuuJWpMekK4o/yMDgAbOkOVN2S94=;
  b=UjAHr7F3NQuDrGwkkxDJi+KAZxvTOqR6a4Q8FnRYzk0ds2WNtPkO7xHI
   OD7l0Kp87eXmKT3M/5hoQSluf0ngDl6mTr8vV4UO7wdjOMq1dsEl60j5t
   CNVLQQH2rGBCsug9ku9Sgyy3vCis2VCTVP3IOv6L3DaLm0HV5uR7IM+WK
   0N1BeiChNE+8iWwtCjyTWRNI99k4yzHytDFAw2qQlEVomRFwG5ZrNmMnA
   IlO639wJTjCo2FBg/mar70SNHurxNVQKLFj1mXD4qJiR+R6FnO/GQipcg
   PWyNSg9fA7SE+9AcMdB25rzU9W6SEXL2SNNQEdxnlhOY8T77CjiUM9i5W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="372221564"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="372221564"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 15:33:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="714487671"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="714487671"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Aug 2023 15:33:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZfMY-00044p-1z;
	Fri, 25 Aug 2023 22:33:06 +0000
Date: Sat, 26 Aug 2023 06:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ramji Jiyani <ramjiyani@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:android13-5.10/ffa 8677/9999]
 kernel/gki_module.c:35:6: warning: no previous prototype for
 'gki_is_module_protected_symbol'
Message-ID: <202308260656.nW00VBCI-lkp@intel.com>
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
commit: 9ab6a242258a9ac17506b74c6ed7332703d536f4 [8677/9999] ANDROID: GKI: Add module load time protected symbol lookup
config: i386-buildonly-randconfig-001-20230826 (https://download.01.org/0day-ci/archive/20230826/202308260656.nW00VBCI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260656.nW00VBCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260656.nW00VBCI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   ld: warning: drivers/of/unittest-data/testcases.dtb.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: drivers/of/unittest-data/testcases.dtb.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0x20d): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mac_config':
   phylink.c:(.text+0x2a6): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x2b4): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x348): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x356): undefined reference to `phy_speed_to_str'
   ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
>> (.text+0x72e): undefined reference to `phy_disconnect'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
>> (.text+0x79a): undefined reference to `phy_ethtool_get_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
>> (.text+0x7fc): undefined reference to `phy_ethtool_set_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
>> (.text+0x86b): undefined reference to `phy_get_eee_err'
   ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
>> (.text+0x8be): undefined reference to `phy_init_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
>> (.text+0x8ec): undefined reference to `phy_ethtool_get_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
>> (.text+0x95c): undefined reference to `phy_ethtool_set_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
>> (.text+0x9c8): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   (.text+0xa38): undefined reference to `mdiobus_read'
   ld: (.text+0xa4e): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0xaa0): undefined reference to `swphy_read_reg'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
>> (.text+0xaf7): undefined reference to `phy_speed_down'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
>> (.text+0xb6a): undefined reference to `phy_speed_up'
   ld: drivers/net/phy/phylink.o: in function `phylink_stop':
>> (.text+0xbc7): undefined reference to `phy_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0xd01): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0xd0c): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0xd4b): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0xd56): undefined reference to `phy_speed_to_str'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
>> (.text+0xf6b): undefined reference to `linkmode_set_pause'
   ld: (.text+0xfb3): undefined reference to `phy_set_asym_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   (.text+0x10d2): undefined reference to `mdiobus_read'
   ld: (.text+0x10f2): undefined reference to `mdiobus_read'
   ld: (.text+0x110b): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
>> (.text+0x117a): undefined reference to `mdiobus_modify'
   ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x1208): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   (.text+0x12a2): undefined reference to `mdiobus_read'
   ld: (.text+0x12b3): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x156b): undefined reference to `phy_get_pause'
   ld: phylink.c:(.text+0x1625): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x1633): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x16a7): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x16b5): undefined reference to `phy_speed_to_str'
   ld: drivers/net/phy/phylink.o: in function `phylink_start':
>> (.text+0x1789): undefined reference to `phy_start'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
>> (.text+0x1e58): undefined reference to `phy_mii_ioctl'
   ld: (.text+0x1f21): undefined reference to `mdiobus_read'
   ld: (.text+0x1fa6): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
>> (.text+0x2173): undefined reference to `phy_ethtool_ksettings_get'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
>> (.text+0x224a): undefined reference to `phy_restart_aneg'
   ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x240c): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x2563): undefined reference to `phy_support_asym_pause'
   ld: phylink.c:(.text+0x263b): undefined reference to `phy_attached_info_irq'
   ld: phylink.c:(.text+0x271e): undefined reference to `phy_request_interrupt'
   ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
>> (.text+0x27ba): undefined reference to `phy_attach_direct'
   ld: (.text+0x280b): undefined reference to `phy_detach'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
>> (.text+0x2854): undefined reference to `phy_ethtool_ksettings_set'
   ld: (.text+0x29fe): undefined reference to `phy_lookup_setting'
   ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
   wm831x_power.c:(.text+0xa3e): undefined reference to `devm_usb_get_phy_by_phandle'
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
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
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
