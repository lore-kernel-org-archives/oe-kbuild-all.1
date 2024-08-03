Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B043F9E8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 03:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722656904; cv=none; b=bQmnRcD8grIA+vux7a7H/zTPedw9V4/2BcbRRg66Lh3OhsdZe0gR7ZQIUMLWyx8YjYoA0xWNP3Vq2KeJgfOIP/Rzf9lD10K8bOODIPwRrO3pgV7C9kAa0YMBhXBi6Qc/C2vYewZfzzcf+180lQfIlBTc3JWF0TelYYVmscQuwn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722656904; c=relaxed/simple;
	bh=E/4eHXRDaBzlBLwi7OBCNIP32FZDMke16oaQeTbgyk8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rakmbv0whBtgvec01V9gBZGyy1O14IUX3vGid+xY5T7L5rKl6gN6P6mdhPJn3ZyqQaKpXSWukoGdsBBW+kamRP8xTaIHyHzrBx9NiK8+Zg1J/SU2fOXXnm8UXXguVY+C0TomRC4MsvGSbTt7VxP+AZ74MFcVutzJljCoVZGsxCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tf0Vjk+N; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tf0Vjk+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722656903; x=1754192903;
  h=date:from:cc:subject:message-id:mime-version;
  bh=E/4eHXRDaBzlBLwi7OBCNIP32FZDMke16oaQeTbgyk8=;
  b=Tf0Vjk+NDOFEBDg7boenNBLczh99L9UKk8n8IpeXsf3q9hgdWzPVt5hx
   RKrHeIOV5DQRIRXljQ7qYonWoBD695rsm1xFKWlLTXcC8sVNUW+85T5Bl
   05PVPQwj+oXE3Fby7aHjg9OnYqkpFG/E1rrlr1Mi8I6WAQGgjBfhKrFb0
   jXSvC+hYnHju5TIFd281kVpzK8hfnYdV/Y88TyK0qLrLqs9uhlwh1q4K1
   4NtJVKwDDutg2/FrhtlXDNnspcvE+K612S1E9e7jNdnGRzRS9VY686BSV
   BfHmzSFmEJyhzm3pA/D0LTJOS0lm1LhbzPCXEMKCRnNxnrI1e9W7kWpCd
   g==;
X-CSE-ConnectionGUID: +l+Kw2/0QTKJDIF32Mj9rg==
X-CSE-MsgGUID: LCKYbRZTTyOYf/GNIuakZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20840218"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="20840218"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 20:48:22 -0700
X-CSE-ConnectionGUID: enLnqu2GT7+XxcZMwfmymA==
X-CSE-MsgGUID: tI7B+K3oTQeSQjJARWepow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="60433687"
Received: from lkp-server01.sh.intel.com (HELO ea8965f09927) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Aug 2024 20:48:20 -0700
Received: from kbuild by ea8965f09927 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa5kg-00001O-03
	for oe-kbuild-all@lists.linux.dev;
	Sat, 03 Aug 2024 03:48:18 +0000
Date: Sat, 3 Aug 2024 11:48:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_t 2601/29299] undefined reference to
 `rtnl_is_locked'
Message-ID: <202408031115.Aj6DcIja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   9485d66da87d67d1efc4a5f2d357616c6501dc72
commit: 9c2efcb127bb2168f3f523892a41b969ee3070ce [2601/29299] ANDROID: GKI: Kconfig.gki: Add GKI_HIDDEN_ETHERNET_CONFIGS
config: x86_64-buildonly-randconfig-001-20240803 (https://download.01.org/0day-ci/archive/20240803/202408031115.Aj6DcIja-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031115.Aj6DcIja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031115.Aj6DcIja-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0x4a2): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x75e): undefined reference to `netif_carrier_off'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
>> (.text+0x8d0): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   (.text+0x985): undefined reference to `rtnl_is_locked'
>> ld: (.text+0x9f4): undefined reference to `phy_disconnect'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   (.text+0xa1e): undefined reference to `rtnl_is_locked'
>> ld: (.text+0xa5a): undefined reference to `phy_ethtool_get_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   (.text+0xa7e): undefined reference to `rtnl_is_locked'
>> ld: (.text+0xa9a): undefined reference to `phy_ethtool_set_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   (.text+0xaba): undefined reference to `rtnl_is_locked'
>> ld: (.text+0xad2): undefined reference to `phy_get_eee_err'
   ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
>> (.text+0xb04): undefined reference to `phy_init_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   (.text+0xb1e): undefined reference to `rtnl_is_locked'
>> ld: (.text+0xb3a): undefined reference to `phy_ethtool_get_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   (.text+0xb5e): undefined reference to `rtnl_is_locked'
>> ld: (.text+0xb7a): undefined reference to `phy_ethtool_set_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
>> (.text+0xbcd): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   (.text+0xc87): undefined reference to `mdiobus_read'
>> ld: (.text+0xca2): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0xdb1): undefined reference to `swphy_read_reg'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   (.text+0xe0d): undefined reference to `rtnl_is_locked'
>> ld: (.text+0xe45): undefined reference to `phy_speed_down'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   (.text+0xe5a): undefined reference to `rtnl_is_locked'
>> ld: (.text+0xe8c): undefined reference to `phy_speed_up'
   ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   (.text+0xe9d): undefined reference to `rtnl_is_locked'
>> ld: (.text+0xeb4): undefined reference to `phy_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x108e): undefined reference to `netif_carrier_on'
   ld: phylink.c:(.text+0x10f5): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x1101): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x116e): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x117a): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x11b2): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   (.text+0x12da): undefined reference to `rtnl_is_locked'
>> ld: (.text+0x13e6): undefined reference to `linkmode_set_pause'
>> ld: (.text+0x1485): undefined reference to `phy_set_asym_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   (.text+0x1608): undefined reference to `mdiobus_read'
   ld: (.text+0x1623): undefined reference to `mdiobus_write'
>> ld: (.text+0x1643): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
>> (.text+0x16c1): undefined reference to `mdiobus_modify'
   ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x1822): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   (.text+0x1943): undefined reference to `mdiobus_read'
   ld: (.text+0x1959): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x1c2d): undefined reference to `phy_get_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_start':
   (.text+0x1dda): undefined reference to `rtnl_is_locked'
>> ld: (.text+0x1e1d): undefined reference to `netif_carrier_off'
>> ld: (.text+0x1ece): undefined reference to `phy_start'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   (.text+0x29c8): undefined reference to `rtnl_is_locked'
>> ld: (.text+0x29e1): undefined reference to `phy_ethtool_ksettings_get'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   (.text+0x2b1c): undefined reference to `rtnl_is_locked'
   ld: (.text+0x2b5f): undefined reference to `phy_mii_ioctl'
   ld: (.text+0x2c77): undefined reference to `mdiobus_read'
   ld: (.text+0x2d6b): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   (.text+0x2fbf): undefined reference to `rtnl_is_locked'
   ld: (.text+0x2fd6): undefined reference to `phy_restart_aneg'
   ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x3157): undefined reference to `phy_support_asym_pause'
   ld: phylink.c:(.text+0x3276): undefined reference to `phy_attached_info_irq'
   ld: phylink.c:(.text+0x33d1): undefined reference to `phy_request_interrupt'
   ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   (.text+0x34df): undefined reference to `phy_attach_direct'
   ld: (.text+0x3525): undefined reference to `phy_detach'
   ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x37ac): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   (.text+0x460e): undefined reference to `rtnl_is_locked'
   ld: (.text+0x4628): undefined reference to `phy_ethtool_ksettings_set'
   ld: (.text+0x4781): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_major_config.cold':
   phylink.c:(.text.unlikely+0x2b): undefined reference to `netdev_printk'
   ld: phylink.c:(.text.unlikely+0x4c): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_down.cold':
   phylink.c:(.text.unlikely+0xfd): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_start.cold':
   phylink.c:(.text.unlikely+0x23a): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy.cold':
   phylink.c:(.text.unlikely+0x3ea): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o:phylink.c:(.text.unlikely+0x484): more undefined references to `netdev_printk' follow
   ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
   wm831x_power.c:(.text+0xdef): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0x295): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: isp1704_charger.c:(.text+0x6d1): undefined reference to `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
