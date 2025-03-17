Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909CF215040
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 03:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742182941; cv=none; b=R9RdTCZWVPM+9T8KbT7DjhB21T5S+SSjWjZpf3QO2wgdvaSVrYTXtbIe+lk+rDWYtxzFyBU/rRo6TVctl8wRKul6V2awZ+WmoEE//Y9RVJN23RJgKMvwrZ/zIjDZe6ad9g+98nykzDNanWa2Bc90WE4ntEXkgK8rty4ay1taFs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742182941; c=relaxed/simple;
	bh=/r/O0QVEFH0qySq7YpEQ+n1aAVUxAsiTFRfslsg0CvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ogZoNX+DZR12r8FqsPCoqdlDAcVvF5p9aJl6UQx+vjpnGhcb/TLNW7GiFtoFlrOJTrM8iqkO7SlG5XgdriZHJEZV4Sw/IUL1HJYwTrZZii9e7wJDhMJOtmxkyfsQGADpl+I8VsQgxUCpMgRdlxxmV155VIoA+rtOjJPnP1mqoaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xh6agnRh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xh6agnRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742182940; x=1773718940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/r/O0QVEFH0qySq7YpEQ+n1aAVUxAsiTFRfslsg0CvQ=;
  b=Xh6agnRhtroGvLG5Ia9RL4lJF5PUrkt5wydUb9417SOxlYlKDi3MsGL+
   D41QrWRazaYhKHH4glp0oFnZV9Q3jmFieYaLlTEkRY9fWMYzBvQylXQa1
   jRg9g5bYgKRq4wbmVRC7Z3C7Z1Gr2l5lm5lor8P+JOpVnhAI6uKK0zRmo
   p/QTyd16GzaDXwLzHaoJb58Q4uvWBBulCjOf+zltJ+2SSgv6QEpGUFSJW
   tORoaZAfpXhcyH9+8pjYwJmnrPi/n649aiMPk+T/vUYF9zG1iCT3Qs42R
   3RsB9XE4KPEU11sqf/Ca8/djVrw/GEFYyUugAQ8yPiNnIpzalXOoEI6L6
   Q==;
X-CSE-ConnectionGUID: BA4rxn5ORFKtzZV1gAUq1A==
X-CSE-MsgGUID: 42QwNfMoQbi9UaDsIttYZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="42440935"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="42440935"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 20:42:17 -0700
X-CSE-ConnectionGUID: CZVtBNSHS8KM0XbiA2B0jg==
X-CSE-MsgGUID: quPYWMtLTyi+boYFEPVduw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="121534266"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Mar 2025 20:42:15 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu1Mj-000CQx-11;
	Mon, 17 Mar 2025 03:42:13 +0000
Date: Mon, 17 Mar 2025 11:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] phylink.c:(.text+0xe48):
 relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol
 `rtnl_is_locked'
Message-ID: <202503171132.864HCdny-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   62297a33bc3822be1b7d874eef3186c072092cf8
commit: 51786e2d1bdd897c83474e3f445611d97995e30c [1/1] Merge 61401a8724c2 ("Merge tag 'kbuild-v6.6' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild") into android-mainline
config: arm64-randconfig-003-20250317 (https://download.01.org/0day-ci/archive/20250317/202503171132.864HCdny-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171132.864HCdny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503171132.864HCdny-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   phylink.c:(.text+0xb2c): undefined reference to `linkmode_resolve_pause'
   phylink.c:(.text+0xb2c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0xcf8): undefined reference to `netif_carrier_off'
   phylink.c:(.text+0xcf8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0xd80): undefined reference to `netdev_printk'
   phylink.c:(.text+0xd80): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0xe48): undefined reference to `rtnl_is_locked'
>> phylink.c:(.text+0xe48): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0xf80): undefined reference to `rtnl_is_locked'
   phylink.c:(.text+0xf80): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1030): undefined reference to `phy_disconnect'
>> phylink.c:(.text+0x1030): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x107c): undefined reference to `rtnl_is_locked'
   phylink.c:(.text+0x107c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x110c): undefined reference to `phy_ethtool_get_wol'
>> phylink.c:(.text+0x110c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x1150): undefined reference to `rtnl_is_locked'
   phylink.c:(.text+0x1150): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x11c4): undefined reference to `phy_ethtool_set_wol'
>> phylink.c:(.text+0x11c4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x1208): undefined reference to `rtnl_is_locked'
   phylink.c:(.text+0x1208): additional relocation overflows omitted from the output
   aarch64-linux-ld: phylink.c:(.text+0x1280): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x12d4): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x1314): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1394): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x13dc): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1454): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x14c4): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x15b4): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x15e4): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x162c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x16b8): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x16f4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1788): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x19a0): undefined reference to `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0x19d8): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x19e4): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x1a28): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1a3c): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x1a44): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x1b24): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1b90): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   phylink.c:(.text+0x1ca8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1d78): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x212c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x21a0): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x2584): undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: phylink.c:(.text+0x25d4): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   phylink.c:(.text+0x28a8): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   phylink.c:(.text+0x2ca4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x32f4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3364): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x33d0): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x3408): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: phylink.c:(.text+0x34f4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3528): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x35ac): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3678): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x37c0): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: phylink.c:(.text+0x37f0): undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x3860): undefined reference to `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x3b3c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3c88): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x3d28): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x40ec): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x4114): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x4314): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x4404): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x449c): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x44bc): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x4518): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: phylink.c:(.text+0x45ac): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: phylink.c:(.text+0x45d0): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x45e8): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: phylink.c:(.text+0x473c): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x48dc): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x4944): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x4ba0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x4d28): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x5030): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x50e0): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x5804): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x58ec): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x5994): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x5b34): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x5e98): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5f8c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x5fa0): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x60f4): undefined reference to `phy_start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   phylink.c:(.text+0x6140): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x645c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x6598): undefined reference to `netdev_printk'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
