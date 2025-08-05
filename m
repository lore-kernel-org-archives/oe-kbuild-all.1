Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447D1274FFC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754408637; cv=none; b=TYiAI9GlBjdeld3SnC+9vkj3/DrmkOKhyxMgfOfGLB3yC8DB+AtwUuRSOgFOFdvQS8l8D28TIzpX5/THVwz5v8mJ5IcLjXCRZogdxXOvkfZYSVzdzqWmoLHqYtbdmgGWXRNY4ySgX1BifGMfCvLiMr/PI2CYNk1aiOKB99OklAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754408637; c=relaxed/simple;
	bh=DDzkclF9I/JYpvvFUNwywuGMPJdF74Qm8CvqyrdsIUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BtnjNqPI9GLhxKdSZYkwOM6dT7qZQ2N9GBpAa3k7tUddVRpkOwyFtoWWsCvxwmbB/SlcrLsrrMeu8xu7mvDKVXscHle1Yu1BYOJ0iDnRA/iDULeVkOqFishKjf0GQaSTm/A/DM/D6DTzfANxhOsiFYYB7JdlOpFUtoZG+NNXxek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nqR5Ei8U; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqR5Ei8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754408635; x=1785944635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DDzkclF9I/JYpvvFUNwywuGMPJdF74Qm8CvqyrdsIUg=;
  b=nqR5Ei8Uu/i2i4dOhsf0eYQPIDuUct1kO5T58PbkyFsnNdYwzy3z7f/7
   iAE0wBQ15i/yp+erxXdYNrAsSu+vaiGyRj3V4XJLFdNQfZ7LuQ5B5DHKl
   EdCUb0/QPzyxmg27mdiEcId946FEJHoaB92ik8U23DUaLGElD7jqgb+H2
   K440wR32Gj70cist4nrkoyD9iKOIgsNaJ+I+xwfu7634oWCSFALlIgxZh
   vupXQLzBcU8isMU5Cfh0NqgJ3/oVByVXFP3RVlr5K3Fu6oqLzsxEcL1T+
   Y3Rny9xORuNfPfP1Yst20RPU4qUpyliMqryTFCVYev7AoQJvkkEjT0A61
   A==;
X-CSE-ConnectionGUID: tZ2m+C2dQIez4PaJ0lvaUA==
X-CSE-MsgGUID: TIA35KWVSUyjRMx+DYdsSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="82156428"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="82156428"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 08:43:54 -0700
X-CSE-ConnectionGUID: uXoizLkhS6aYc8DPhxPstQ==
X-CSE-MsgGUID: 1Y0iVysRR0KImz0RMdI3YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164202519"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Aug 2025 08:43:53 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujJpO-0000e2-31;
	Tue, 05 Aug 2025 15:43:50 +0000
Date: Tue, 5 Aug 2025 23:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] aarch64-linux-ld:
 phylink.c:undefined reference to `phy_resume'
Message-ID: <202508052345.ReXhW8GA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   c47064085b01b8e8acc3d8ecc51b3d985f2d37f1
commit: add2a3ec5fa37f0c1be4022f4b51178803463a24 [2/2] Merge 1a9239bb4253 ("Merge tag 'net-next-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next") into android-mainline
config: arm64-randconfig-r111-20250805 (https://download.01.org/0day-ci/archive/20250805/202508052345.ReXhW8GA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250805/202508052345.ReXhW8GA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508052345.ReXhW8GA-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: aarch64-linux-ld: DWARF error: could not find abbrev number 53
   drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
   phylink.c:(.text+0x28c): undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode':
   phylink.c:(.text+0x428): undefined reference to `phy_inband_caps'
   aarch64-linux-ld: phylink.c:(.text+0x4f0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x5ac): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x694): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x7f4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x87c): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o:phylink.c:(.text+0x8e0): more undefined references to `netdev_printk' follow
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x8fc): undefined reference to `phy_config_inband'
   aarch64-linux-ld: phylink.c:(.text+0x928): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_caps_to_linkmodes':
   phylink.c:(.text+0xa0c): undefined reference to `phy_caps_linkmodes'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block':
   phylink.c:(.text+0xa28): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xa98): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0xad4): undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock':
   phylink.c:(.text+0xaec): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xb5c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0xb9c): undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0xbb8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0xc70): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xcfc): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_prepare_resume':
   phylink.c:(.text+0xd24): undefined reference to `rtnl_is_locked'
>> aarch64-linux-ld: phylink.c:(.text+0xd7c): undefined reference to `phy_resume'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0xda0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xdec): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0xe10): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xe58): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0xe80): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xec4): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0xefc): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xf40): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0xf70): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xfc8): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x1024): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1090): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x110c): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   phylink.c:(.text+0x11b8): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x14d0): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x1530): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x15b8): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x1620): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x16b4): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x1740): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x1770): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: phylink.c:(.text+0x17e4): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x17f4): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x18a8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x18f8): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x1920): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x196c): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x19c0): undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: phylink.c:(.text+0x19ec): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x1ab0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1af8): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x1c84): undefined reference to `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x1d38): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1d7c): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   phylink.c:(.text+0x1e20): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1e98): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x1ee8): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x1f00): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x1f90): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x1fa4): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x20a8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2164): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x21c0): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x22d0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2364): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2370): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x23f8): undefined reference to `phy_start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   phylink.c:(.text+0x2468): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
   phylink.c:(.text+0x2868): undefined reference to `netdev_printk'
>> aarch64-linux-ld: phylink.c:(.text+0x2874): undefined reference to `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0x2890): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x28a0): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x28d8): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x295c): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2964): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   phylink.c:(.text+0x2988): undefined reference to `phy_caps_from_interface'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   phylink.c:(.text+0x2b5c): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   phylink.c:(.text+0x2cf4): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x2f04): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: phylink.c:(.text+0x2f1c): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x2fc4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2fcc): undefined reference to `phy_detach'
   aarch64-linux-ld: phylink.c:(.text+0x2fe8): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3054): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x3094): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3100): undefined reference to `phy_support_eee'
   aarch64-linux-ld: phylink.c:(.text+0x3164): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: phylink.c:(.text+0x3184): undefined reference to `phy_eee_tx_clock_stop_capable'
   aarch64-linux-ld: phylink.c:(.text+0x31a8): undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: phylink.c:(.text+0x31c8): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: phylink.c:(.text+0x3224): undefined reference to `phy_disable_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x325c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x32cc): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x3334): undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: phylink.c:(.text+0x33c8): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   phylink.c:(.text+0x3604): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x376c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3984): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x39f0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3ab0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3af4): undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: phylink.c:(.text+0x3bd4): undefined reference to `netdev_printk'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
