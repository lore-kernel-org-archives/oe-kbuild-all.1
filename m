Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018A43D1AA4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 01:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786671912; cv=none; b=US1r3TMvOkI1uGUYK2lx9w1pVQ8u/tjGVZDOPfpUAH5AKELa/TWkqVPAfBr355XmdthpUYm/k5qMqMe7Y31BTAsphPwY+1Fqwm9kylu5SrkYyWqtpeyQRMo09OnJnO/N/C4vE94HtJzPASnUfTtJl19xDjJDh6E/NF/aNXGNXL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786671912; c=relaxed/simple;
	bh=JZ+TckAA05v1FgD7RACUpf1NcIvWMiW0TbfxYy+Cs/k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EMdGJbG4Qs649PkVclnsx1/520FYkTuKbI2WyTd5BcPhbxwQGD+hx8rjb/kZaX6JBUSJMNqW7mr3hnOLAL20fbBhNY8yIU2u5miTCTqSZWoRQBLtNMXb+G7XZ5RLX1pINLBJoi/8iBuRtbtuPUbUtsIv1t8SoeEqkEKg0yFSWbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWXRHzt9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWXRHzt9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786671909; x=1818207909;
  h=date:from:to:cc:subject:message-id;
  bh=JZ+TckAA05v1FgD7RACUpf1NcIvWMiW0TbfxYy+Cs/k=;
  b=eWXRHzt9sZatLJsUoxm25ww9dCorAEo2QyK9QQojCwm5HLx+VTc/+EuZ
   4IlJwwtQhGKPtDiiP2evmKze0XTXekn1oSHXWuomEBN5lech41OW4r+ls
   3+05rHb6JM3kZTWZmJ7Agv9+l3+zcf7OfaF1Jhoe0QStHhbCXZVDz6ZTa
   6Jo+SmL1YRJF2M5oN6VSEuyU6zsHwfflcEcQ5BUaYeszctf8tA1wPunkS
   93CS5MakqoUSak7XcvcYcaevRYVYKbVrq6I2dS5Ywsi4ObjhQ3KlUWja9
   ZIjUBZPV8D3N6JbFTh7+JUCUJpeGxQxWPerpqOKUYAT0c4774aWvhlqx0
   A==;
X-CSE-ConnectionGUID: QF9OuVtRQJSB31xdxfaCDw==
X-CSE-MsgGUID: pwTfj82tQGmPKgRVTBQGsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87383915"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87383915"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 18:45:04 -0700
X-CSE-ConnectionGUID: Tmat4agCTF+v/n3Htrqcag==
X-CSE-MsgGUID: CBCgBvIkQC2dApQnqcmR+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="260301662"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2026 18:43:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wugxV-00000000XKq-1kUA;
	Fri, 14 Aug 2026 01:43:45 +0000
Date: Fri, 14 Aug 2026 09:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/1]
 drivers/net/phy/phy_package.c:78:undefined reference to `__mdiobus_read'
Message-ID: <202608140900.p9SUQl4c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Zhipeng,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   0f4d083e361a7bb3bc0b44d4d637df596344729d
commit: e720a50b14c5896defc425452f52d3ee1d2de1c5 [0/1] ANDROID: GKI: Select PHY_PACKAGE for vendor modules
config: i386-buildonly-randconfig-001-20260813 (https://download.01.org/0day-ci/archive/20260814/202608140900.p9SUQl4c-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140900.p9SUQl4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140900.p9SUQl4c-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode':
   phylink.c:(.text+0x589): undefined reference to `phy_inband_caps'
   ld: phylink.c:(.text+0x62e): undefined reference to `phy_inband_caps'
   ld: drivers/net/phy/phylink.o: in function `phylink_caps_to_linkmodes':
   phylink.c:(.text+0xa0a): undefined reference to `phy_caps_linkmodes'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0xa9f): undefined reference to `mdiobus_c45_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0xb1a): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0xb3a): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0xbbe): undefined reference to `mdiobus_modify'
   ld: phylink.c:(.text+0xbf8): undefined reference to `mdiobus_modify_changed'
   ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   phylink.c:(.text+0xcc5): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x10e7): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x10ff): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block':
   phylink.c:(.text+0x12aa): undefined reference to `phy_eee_rx_clock_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock':
   phylink.c:(.text+0x142d): undefined reference to `phy_eee_rx_clock_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x170a): undefined reference to `phy_disconnect'
   ld: drivers/net/phy/phylink.o: in function `phylink_prepare_resume':
   phylink.c:(.text+0x1893): undefined reference to `phy_resume'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x19ae): undefined reference to `phy_ethtool_get_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x1ae4): undefined reference to `phy_ethtool_set_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x1c1d): undefined reference to `phy_restart_aneg'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x1d5f): undefined reference to `phy_get_eee_err'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x1e96): undefined reference to `phy_ethtool_get_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x2077): undefined reference to `phy_ethtool_set_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x223f): undefined reference to `phy_speed_down'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x237a): undefined reference to `phy_speed_up'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x2597): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x25a1): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x25e0): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x25ea): undefined reference to `phy_speed_to_str'
   ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x2939): undefined reference to `phy_config_inband'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x2bd5): undefined reference to `linkmode_set_pause'
   ld: phylink.c:(.text+0x2c29): undefined reference to `phy_set_asym_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x2fef): undefined reference to `mdiobus_c45_read'
   ld: phylink.c:(.text+0x3055): undefined reference to `phy_mii_ioctl'
   ld: phylink.c:(.text+0x30b2): undefined reference to `mdiobus_c45_write'
   ld: phylink.c:(.text+0x313c): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x323e): undefined reference to `swphy_read_reg'
   ld: phylink.c:(.text+0x32a0): undefined reference to `mdiobus_write'
   ld: phylink.c:(.text+0x3316): undefined reference to `mdiobus_c45_read'
   ld: phylink.c:(.text+0x3338): undefined reference to `mdiobus_c45_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x33df): undefined reference to `phy_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   phylink.c:(.text+0x36d6): undefined reference to `phy_caps_from_interface'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x40ad): undefined reference to `phy_ethtool_ksettings_get'
   ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x4228): undefined reference to `phy_get_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   phylink.c:(.text+0x45a1): undefined reference to `phy_get_rate_matching'
   ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   phylink.c:(.text+0x4896): undefined reference to `phy_get_rate_matching'
   ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x4966): undefined reference to `phy_support_asym_pause'
   ld: phylink.c:(.text+0x4a2b): undefined reference to `phy_attached_info_irq'
   ld: phylink.c:(.text+0x4bc0): undefined reference to `phy_eee_tx_clock_stop_capable'
   ld: phylink.c:(.text+0x4bfa): undefined reference to `phy_eee_rx_clock_stop'
   ld: phylink.c:(.text+0x4c3c): undefined reference to `phy_disable_eee'
   ld: phylink.c:(.text+0x4c4b): undefined reference to `phy_request_interrupt'
   ld: phylink.c:(.text+0x4c63): undefined reference to `phy_support_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x4cfe): undefined reference to `phy_attach_direct'
   ld: phylink.c:(.text+0x4db3): undefined reference to `phy_detach'
   ld: drivers/net/phy/phylink.o: in function `phylink_fwnode_phy_connect':
   phylink.c:(.text+0x4e35): undefined reference to `fwnode_get_phy_node'
   ld: phylink.c:(.text+0x4e63): undefined reference to `fwnode_phy_find_device'
   ld: phylink.c:(.text+0x4ed8): undefined reference to `phy_attach_direct'
   ld: phylink.c:(.text+0x4ee1): undefined reference to `phy_device_free'
   ld: phylink.c:(.text+0x4f25): undefined reference to `phy_detach'
   ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x51fe): undefined reference to `phy_caps_lookup'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x5994): undefined reference to `phy_ethtool_ksettings_set'
   ld: phylink.c:(.text+0x5c04): undefined reference to `phy_caps_lookup'
   ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x5ef1): undefined reference to `phy_start'
   ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0x390b): undefined reference to `wext_handle_ioctl'
   ld: drivers/net/phy/phy_package.o: in function `__phy_package_read':
>> drivers/net/phy/phy_package.c:78:(.text+0x133): undefined reference to `__mdiobus_read'
   ld: drivers/net/phy/phy_package.o: in function `__phy_package_write':
>> drivers/net/phy/phy_package.c:90:(.text+0x1bb): undefined reference to `__mdiobus_write'
   ld: drivers/net/phy/phy_package.o: in function `__phy_package_read_mmd':
>> drivers/net/phy/phy_package.c:121:(.text+0x252): undefined reference to `mmd_phy_read'
   ld: drivers/net/phy/phy_package.o: in function `__phy_package_write_mmd':
>> drivers/net/phy/phy_package.c:154:(.text+0x315): undefined reference to `mmd_phy_write'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
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
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHY_PACKAGE
   Depends on [n]: NETDEVICES [=n] && PHYLIB [=n]
   Selected by [y]:
   - GKI_HIDDEN_PHY_CONFIGS [=y]


vim +78 drivers/net/phy/phy_package.c

e7f984e925d23f Heiner Kallweit 2025-03-03   69  
e7f984e925d23f Heiner Kallweit 2025-03-03   70  int __phy_package_read(struct phy_device *phydev, unsigned int addr_offset,
e7f984e925d23f Heiner Kallweit 2025-03-03   71  		       u32 regnum)
e7f984e925d23f Heiner Kallweit 2025-03-03   72  {
e7f984e925d23f Heiner Kallweit 2025-03-03   73  	int addr = phy_package_address(phydev, addr_offset);
e7f984e925d23f Heiner Kallweit 2025-03-03   74  
e7f984e925d23f Heiner Kallweit 2025-03-03   75  	if (addr < 0)
e7f984e925d23f Heiner Kallweit 2025-03-03   76  		return addr;
e7f984e925d23f Heiner Kallweit 2025-03-03   77  
e7f984e925d23f Heiner Kallweit 2025-03-03  @78  	return __mdiobus_read(phydev->mdio.bus, addr, regnum);
e7f984e925d23f Heiner Kallweit 2025-03-03   79  }
e7f984e925d23f Heiner Kallweit 2025-03-03   80  EXPORT_SYMBOL_GPL(__phy_package_read);
e7f984e925d23f Heiner Kallweit 2025-03-03   81  
e7f984e925d23f Heiner Kallweit 2025-03-03   82  int __phy_package_write(struct phy_device *phydev, unsigned int addr_offset,
e7f984e925d23f Heiner Kallweit 2025-03-03   83  			u32 regnum, u16 val)
e7f984e925d23f Heiner Kallweit 2025-03-03   84  {
e7f984e925d23f Heiner Kallweit 2025-03-03   85  	int addr = phy_package_address(phydev, addr_offset);
e7f984e925d23f Heiner Kallweit 2025-03-03   86  
e7f984e925d23f Heiner Kallweit 2025-03-03   87  	if (addr < 0)
e7f984e925d23f Heiner Kallweit 2025-03-03   88  		return addr;
e7f984e925d23f Heiner Kallweit 2025-03-03   89  
e7f984e925d23f Heiner Kallweit 2025-03-03  @90  	return __mdiobus_write(phydev->mdio.bus, addr, regnum, val);
e7f984e925d23f Heiner Kallweit 2025-03-03   91  }
e7f984e925d23f Heiner Kallweit 2025-03-03   92  EXPORT_SYMBOL_GPL(__phy_package_write);
e7f984e925d23f Heiner Kallweit 2025-03-03   93  
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12   94  /**
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12   95   * __phy_package_read_mmd - read MMD reg relative to PHY package base addr
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12   96   * @phydev: The phy_device struct
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12   97   * @addr_offset: The offset to be added to PHY package base_addr
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12   98   * @devad: The MMD to read from
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12   99   * @regnum: The register on the MMD to read
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  100   *
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  101   * Convenience helper for reading a register of an MMD on a given PHY
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  102   * using the PHY package base address. The base address is added to
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  103   * the addr_offset value.
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  104   *
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  105   * Same calling rules as for __phy_read();
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  106   *
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  107   * NOTE: It's assumed that the entire PHY package is either C22 or C45.
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  108   */
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  109  int __phy_package_read_mmd(struct phy_device *phydev,
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  110  			   unsigned int addr_offset, int devad,
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  111  			   u32 regnum)
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  112  {
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  113  	int addr = phy_package_address(phydev, addr_offset);
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  114  
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  115  	if (addr < 0)
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  116  		return addr;
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  117  
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  118  	if (regnum > (u16)~0 || devad > 32)
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  119  		return -EINVAL;
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  120  
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12 @121  	return mmd_phy_read(phydev->mdio.bus, addr, phydev->is_c45, devad,
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  122  			    regnum);
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  123  }
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  124  EXPORT_SYMBOL(__phy_package_read_mmd);
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  125  
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  126  /**
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  127   * __phy_package_write_mmd - write MMD reg relative to PHY package base addr
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  128   * @phydev: The phy_device struct
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  129   * @addr_offset: The offset to be added to PHY package base_addr
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  130   * @devad: The MMD to write to
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  131   * @regnum: The register on the MMD to write
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  132   * @val: value to write to @regnum
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  133   *
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  134   * Convenience helper for writing a register of an MMD on a given PHY
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  135   * using the PHY package base address. The base address is added to
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  136   * the addr_offset value.
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  137   *
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  138   * Same calling rules as for __phy_write();
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  139   *
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  140   * NOTE: It's assumed that the entire PHY package is either C22 or C45.
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  141   */
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  142  int __phy_package_write_mmd(struct phy_device *phydev,
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  143  			    unsigned int addr_offset, int devad,
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  144  			    u32 regnum, u16 val)
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  145  {
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  146  	int addr = phy_package_address(phydev, addr_offset);
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  147  
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  148  	if (addr < 0)
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  149  		return addr;
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  150  
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  151  	if (regnum > (u16)~0 || devad > 32)
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  152  		return -EINVAL;
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  153  
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12 @154  	return mmd_phy_write(phydev->mdio.bus, addr, phydev->is_c45, devad,
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  155  			     regnum, val);
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  156  }
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  157  EXPORT_SYMBOL(__phy_package_write_mmd);
cbd1ab0ce8f651 Heiner Kallweit 2025-06-12  158  

:::::: The code at line 78 was first introduced by commit
:::::: e7f984e925d23f8fd0469e344a8dc225e1a1b0ab net: phy: move PHY package related code from phy.h to phy_package.c

:::::: TO: Heiner Kallweit <hkallweit1@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
