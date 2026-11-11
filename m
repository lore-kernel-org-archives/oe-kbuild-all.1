Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357807;
	b=PAh/VyCGBmzSOOmh5qq/PYz6no1qDdGRbFyXSFDtjcCXy5sSBI0cBZy05U1aGwEx33A8
	 jBvCXq4C+I9iXf4UX70H+iiW7OO/1QykQ52Qz1KDL075nnn6XbKhRoKtV9ZaHkFjuH2Lk
	 rxyagj+mhBmW9SZs5NGCgv/bxpIph9t4DzOx4JviQdBVcUY0/vuRXDAcIGXisMTqrkd/f
	 ns2USFXqPdgs4PwYdN30eCJemEGThqFcIYV8T5Xl8V0CT/l79/wlQpxnrFikGRspwOXVR
	 QLCOzjYa6TDBPnNBmLyMymZgHVM950RfX0BEoUjvDzVLKHvCA5lKn5fDt2OooqHBcwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357807;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hmtig1bHRzJ1b2Ga3n2W9NJi+IcnnOtn+2QOG3AaDgk=;
	b=5q/1ocpo+GStCLJi0uBL9TKenNdEMWKn46yxVY/ifj0JL38uYuhLY9feure2xAn0G+EI
	 6mPvQpkbAhodx0xH8eyc4RIYhAqaJDThNmIUDiClJoKxFYW0V1wHBi5tr4JENDuq1ipp9
	 38i5+10GbTl2wiZbu3Fm5sGhAInnNbOZfeW6SIReIo13rNS+7Qc3Y22ntLRAi9vXPrFAh
	 yqUYa/K8KB9lHpKFjztkqM243gS1wbD6u/Dxt3cBuYO9YSq02GlFZub29XpjE4+ukVy5X
	 nm4iGUqfl9XkZLuGOonVyHzseC9eD8BZpNmdOkMnbHDv5zTNogDXN3L4bptgD+UhyYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MuPaAUbo;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B7360A2611
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 00:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B7360A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MuPaAUbo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794357807; x=1825893807;
  h=date:from:to:cc:subject:message-id;
  bh=9lvmaKesNR9G5d8AI/zjRujdwrBnLs57xXvXSfJEqUA=;
  b=MuPaAUboFHkAp6lqr1mkM7mGxNIsofsG33LsOlcDcMhq5mt0e0/GwhFU
   j9QkOmbSNgzoGD3CZuoCp0tdMumSRnuiiswwAxSOiHX2/ky3TzSbru78M
   I0oe/vfVkX3yTCUMCokGF+N9FsA42OHy2orimZyZFEeKPDD1HPMUKzcPt
   SA2wnubwcOPJAmGgWPH1j6xLuRd4uHi3s56GIqwUMVMYPtB+tBWZNG9/j
   PfnlyS1GCOcJWotrvTf171ecNpi3o7/0qnoEkXwlGkxL8GldVccWg/9Pm
   BwxrDZWiR3ZpH0vm86Uwy8/pwUPqCeOkX6wyaV73lAXre+Bzy1L3u2d/g
   A==;
X-CSE-ConnectionGUID: LCna4UqkQci7do2OiOOiDg==
X-CSE-MsgGUID: mquvxcTVSc+Vaec7y2kCHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3012396"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3012396"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 16:43:26 -0800
X-CSE-ConnectionGUID: j2nAE4+5QBqfIkz+tdb/Lg==
X-CSE-MsgGUID: oheOw2R/TyadAOMAh67LlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8626326"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2026 16:43:25 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQwQs-00000000xmP-12sN;
	Wed, 11 Nov 2026 00:43:22 +0000
Date: Wed, 11 Nov 2026 08:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1] arm-linux-gnueabi-ld:
 drivers/net/phy/phylink.c:2250: undefined reference to
 `fwnode_phy_find_device'
Message-ID: <202611110855.M9e61suV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   08a3efe1ff960a381689797f790dda3070ffe70f
commit: da0d6fef4be114bfe8c8ffe7299762721d961077 [1/1] Merge 1b98f357dadd ("Merge tag 'net-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next") into android-mainline
config: arm-randconfig-1002-20261102 (https://download.01.org/0day-ci/archive/20261111/202611110855.M9e61suV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110855.M9e61suV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611110855.M9e61suV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
   drivers/net/phy/phylink.c:1753: undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   drivers/net/phy/phylink.c:844: undefined reference to `linkmode_resolve_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode':
   drivers/net/phy/phylink.c:1076: undefined reference to `phy_inband_caps'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mac_config':
   drivers/net/phy/phylink.c:985: undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:985: undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   drivers/net/phy/phylink.c:1306: undefined reference to `phy_config_inband'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_up':
   drivers/net/phy/phylink.c:1539: undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1539: undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1539: undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1539: undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   drivers/net/phy/phylink.c:421: undefined reference to `phy_caps_from_interface'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   drivers/net/phy/phylink.c:577: undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:580: undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:580: undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   drivers/net/phy/phylink.c:1922: undefined reference to `phy_get_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1945: undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1945: undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1945: undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1945: undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1945: undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1945: undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   drivers/net/phy/phylink.c:2741: undefined reference to `phy_ethtool_ksettings_get'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   drivers/net/phy/phylink.c:2980: undefined reference to `phy_restart_aneg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   drivers/net/phy/phylink.c:3050: undefined reference to `linkmode_set_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3073: undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   drivers/net/phy/phylink.c:3127: undefined reference to `phy_ethtool_get_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   drivers/net/phy/phylink.c:3164: undefined reference to `phy_ethtool_set_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   drivers/net/phy/phylink.c:4137: undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   drivers/net/phy/phylink.c:3191: undefined reference to `swphy_read_reg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:3234: undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3238: undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3275: undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   drivers/net/phy/phylink.c:2444: undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   drivers/net/phy/phylink.c:4086: undefined reference to `mdiobus_modify_changed'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   include/linux/mdio.h:642: undefined reference to `mdiobus_modify'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   drivers/net/phy/phylink.c:718: undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   drivers/net/phy/phylink.c:2006: undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   drivers/net/phy/phylink.c:2043: undefined reference to `phy_support_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2063: undefined reference to `phy_attached_info_irq'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2092: undefined reference to `phy_support_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2109: undefined reference to `phy_disable_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2122: undefined reference to `phy_request_interrupt'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2128: undefined reference to `phy_eee_tx_clock_stop_capable'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2134: undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   drivers/net/phy/phylink.c:2159: undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2193: undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_fwnode_phy_connect':
   drivers/net/phy/phylink.c:2243: undefined reference to `fwnode_get_phy_node'
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2250: undefined reference to `fwnode_phy_find_device'
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2265: undefined reference to `phy_attach_direct'
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2267: undefined reference to `phy_device_free'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2273: undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   drivers/net/phy/phylink.c:2837: undefined reference to `phy_ethtool_ksettings_set'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2851: undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_caps_to_linkmodes':
   drivers/net/phy/phylink.c:363: undefined reference to `phy_caps_linkmodes'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block':
   drivers/net/phy/phylink.c:2484: undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock':
   drivers/net/phy/phylink.c:2513: undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   drivers/net/phy/phylink.c:2303: undefined reference to `phy_disconnect'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_prepare_resume':
   drivers/net/phy/phylink.c:2584: undefined reference to `phy_resume'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   drivers/net/phy/phylink.c:2645: undefined reference to `phy_ethtool_get_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   drivers/net/phy/phylink.c:2667: undefined reference to `phy_ethtool_set_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   drivers/net/phy/phylink.c:3106: undefined reference to `phy_get_eee_err'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_read':
   include/linux/mdio.h:630: undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:3279: undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3373: undefined reference to `phy_mii_ioctl'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   drivers/net/phy/phylink.c:3424: undefined reference to `phy_speed_down'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   drivers/net/phy/phylink.c:3447: undefined reference to `phy_speed_up'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   include/linux/mdio.h:636: undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   drivers/net/phy/phylink.c:2419: undefined reference to `phy_start'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
