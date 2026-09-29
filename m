Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE212DC789
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669228; cv=none; b=uRUe2QbklxBVcyBLaRTjWk7kUCxz+m1ak0RkfKoaCDmSKkMceb4RFbXte98LYaDVAKJFZfAZCaOu/W2LTcsXlE2q2fwkp+hwgPAn6ohW6Kk497p8YX1kPr38kfCsLUuPL/if73U+YLN/WEltiWCp6V6NVH9ubC7mpkFB7jli11E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669228; c=relaxed/simple;
	bh=iS5seP7bM3E6LGfOYClsbZVx6I08uAC6+7cf0JWl7oE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hj8q0s42OEvONF4ndg1aZ96UKMbiKYRtQK/SmDgRqTIvL9heuXqgHFtH46hFWfsx4VCZC+Iv5bjtSkR7RlEZb2o2uiW6LmdeLYH7x2eGGDk4F9T4WTPuarf/eVUYzbHIjwAUUeQh+hC2y8deuLD8UIvzMKLGjXY/hpD0FKQfDi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmJvgfvt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmJvgfvt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790669226; x=1822205226;
  h=date:from:to:cc:subject:message-id;
  bh=iS5seP7bM3E6LGfOYClsbZVx6I08uAC6+7cf0JWl7oE=;
  b=SmJvgfvtIzkxBhQiGYqcp0Crfe+o2IVEMZsMfFevWDwizhdrEBpqd3V+
   WEOgc1zQ4G0QdDQGwnii5hZg8yzc9voicpX0QMmA6+rq9vBVuEhnmuFsu
   xbMcnrtxChd5Fj74lOxi5n/ZCLbtz09tN9hkJz3a0gkQzIBoem7NDhSyq
   BPOlMcpu4IL5F5cccY9PfYPmV2mZyGF3aTXpwu/jfSf3x4ugNoA1xvb46
   KN2tMnXMcMS9FmbMQWLiDf9srR4JN+uSEhtkerhHqSiDae2tVOAS1qspV
   rPjv5fbzdHbMNbl6Fjg5ElMQW2S5urMhyOz5+DEBZPvRIM6iYGdp1v5bC
   g==;
X-CSE-ConnectionGUID: lgx0gY8CTEyqLu9/9AQlpA==
X-CSE-MsgGUID: aoNCylCiQhWd+Eyji0thbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90145812"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90145812"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 01:07:05 -0700
X-CSE-ConnectionGUID: OLQ8Yr2ARx6+c8xntq5gIA==
X-CSE-MsgGUID: C33wUrwtR/64PbJ2G/IyTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="274521738"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Sep 2026 01:07:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBSrd-00000000P51-0Ehb;
	Tue, 29 Sep 2026 08:07:01 +0000
Date: Tue, 29 Sep 2026 16:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 drivers/net/phy/phylink.c:2410:(.text.phylink_ethtool_ksettings_set+0x2c8):
 undefined reference to `netdev_printk'
Message-ID: <202609291608.OIdtcq6l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   4f02a973d94c2e1b76391568aaf9d316067b9322
commit: dd99bb34c52de463398910adc71917769dde6f54 [1/1] Revert "ANDROID: suppress GKI configs for 32-bit builds"
config: arm-randconfig-1000-20260929 (https://download.01.org/0day-ci/archive/20260929/202609291608.OIdtcq6l-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609291608.OIdtcq6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609291608.OIdtcq6l-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2683:(.text.phylink_ethtool_nway_reset+0x50): undefined reference to `phy_restart_aneg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   drivers/net/phy/phylink.c:2718:(.text.phylink_ethtool_set_pauseparam+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2753:(.text.phylink_ethtool_set_pauseparam+0x144): undefined reference to `linkmode_set_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2776:(.text.phylink_ethtool_set_pauseparam+0x1bc): undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   drivers/net/phy/phylink.c:2806:(.text.phylink_get_eee_err+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2809:(.text.phylink_get_eee_err+0x50): undefined reference to `phy_get_eee_err'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   drivers/net/phy/phylink.c:2827:(.text.phylink_init_eee+0x30): undefined reference to `phy_init_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   drivers/net/phy/phylink.c:2842:(.text.phylink_ethtool_get_eee+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2845:(.text.phylink_ethtool_get_eee+0x58): undefined reference to `phy_ethtool_get_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   drivers/net/phy/phylink.c:2860:(.text.phylink_ethtool_set_eee+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2863:(.text.phylink_ethtool_set_eee+0x58): undefined reference to `phy_ethtool_set_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   drivers/net/phy/phylink.c:3820:(.text.phylink_mii_c45_pcs_get_state+0x2c): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_read':
   include/linux/mdio.h:633:(.text.phylink_mii_c22_pcs_get_state+0x28): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: include/linux/mdio.h:633:(.text.phylink_mii_c22_pcs_get_state+0x40): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_read':
   drivers/net/phy/phylink.c:2904:(.text.phylink_phy_read+0x50): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2934:(.text.phylink_phy_read+0xa8): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2930:(.text.phylink_phy_read+0x128): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_write':
   drivers/net/phy/phylink.c:2946:(.text.phylink_phy_write+0x60): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2975:(.text.phylink_phy_write+0xbc): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2971:(.text.phylink_phy_write+0x148): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_read':
   include/linux/mdio.h:633:(.text.phylink_mii_c22_pcs_an_restart+0x24): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_write':
   include/linux/mdio.h:639:(.text.phylink_mii_c22_pcs_an_restart+0x54): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   drivers/net/phy/phylink.c:2887:(.text.phylink_mii_emul_read+0x60): undefined reference to `swphy_read_reg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:3046:(.text.phylink_mii_ioctl+0x24): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3069:(.text.phylink_mii_ioctl+0x130): undefined reference to `phy_mii_ioctl'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   drivers/net/phy/phylink.c:3117:(.text.phylink_speed_down+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3120:(.text.phylink_speed_down+0x64): undefined reference to `phy_speed_down'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   drivers/net/phy/phylink.c:3140:(.text.phylink_speed_up+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:3143:(.text.phylink_speed_up+0x5c): undefined reference to `phy_speed_up'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   drivers/net/phy/phylink.c:3769:(.text.phylink_mii_c22_pcs_config+0x60): undefined reference to `mdiobus_modify_changed'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_modify':
   include/linux/mdio.h:645:(.text.phylink_mii_c22_pcs_config+0xe4): undefined reference to `mdiobus_modify'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   drivers/net/phy/phylink.c:2257:(.text.phylink_stop+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2262:(.text.phylink_stop+0x68): undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   drivers/net/phy/phylink.c:2293:(.text.phylink_suspend+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2307:(.text.phylink_suspend+0xc0): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   drivers/net/phy/phylink.c:1171:(.text.phylink_major_config+0xfc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1186:(.text.phylink_major_config+0x1d8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1224:(.text.phylink_major_config+0x4b0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1236:(.text.phylink_major_config+0x5b0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_up':
   drivers/net/phy/phylink.c:1425:(.text.phylink_link_up+0x15c): undefined reference to `netif_carrier_on'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1427:(.text.phylink_link_up+0x188): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1427:(.text.phylink_link_up+0x194): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1427:(.text.phylink_link_up+0x1e8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1427:(.text.phylink_link_up+0x200): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1427:(.text.phylink_link_up+0x208): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   drivers/net/phy/phylink.c:2189:(.text.phylink_start+0x1c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2191:(.text.phylink_start+0xb0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2197:(.text.phylink_start+0xe4): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2237:(.text.phylink_start+0x2b4): undefined reference to `phy_start'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   drivers/net/phy/phylink.c:2330:(.text.phylink_resume+0x18): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   drivers/net/phy/phylink.c:668:(.text.phylink_validate_mac_and_pcs+0x170): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   drivers/net/phy/phylink.c:716:(.text.phylink_validate_one+0x88): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   drivers/net/phy/phylink.c:887:(.text.phylink_parse_mode+0x184): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:928:(.text.phylink_parse_mode+0x2d4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:937:(.text.phylink_parse_mode+0x350): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   drivers/net/phy/phylink.c:1869:(.text.phylink_validate_phy+0x94): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1836:(.text.phylink_validate_phy+0x10c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1848:(.text.phylink_validate_phy+0x1dc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   drivers/net/phy/phylink.c:1906:(.text.phylink_bringup_phy+0x28): undefined reference to `phy_support_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1926:(.text.phylink_bringup_phy+0xdc): undefined reference to `phy_attached_info_irq'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1915:(.text.phylink_bringup_phy+0x15c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1927:(.text.phylink_bringup_phy+0x1bc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1955:(.text.phylink_bringup_phy+0x2f0): undefined reference to `phy_request_interrupt'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_attach_phy':
   drivers/net/phy/phylink.c:1979:(.text.phylink_connect_phy+0xd0): undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   drivers/net/phy/phylink.c:2013:(.text.phylink_connect_phy+0x120): undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   drivers/net/phy/phylink.c:2520:(.text.phylink_ethtool_ksettings_set+0x20): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2547:(.text.phylink_ethtool_ksettings_set+0x88): undefined reference to `phy_ethtool_ksettings_set'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2561:(.text.phylink_ethtool_ksettings_set+0x10c): undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_sfp_select_interface':
>> drivers/net/phy/phylink.c:2410:(.text.phylink_ethtool_ksettings_set+0x2c8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   drivers/net/phy/phylink.c:2468:(.text.phylink_ethtool_ksettings_get+0x20): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2471:(.text.phylink_ethtool_ksettings_get+0x5c): undefined reference to `phy_ethtool_ksettings_get'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   drivers/net/phy/phylink.c:813:(.text.phylink_parse_fixedlink+0x2ac): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:834:(.text.phylink_parse_fixedlink+0x3dc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:855:(.text.phylink_parse_fixedlink+0x4a8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:841:(.text.phylink_parse_fixedlink+0x554): undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   drivers/net/phy/phylink.c:1694:(.text.phylink_create+0x108): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/power/supply/da9150-charger.o: in function `da9150_charger_probe':
   drivers/power/supply/da9150-charger.c:567:(.text.da9150_charger_probe+0x2cc): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   drivers/power/supply/rt9455_charger.c:1638:(.text.rt9455_probe+0x200): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   drivers/power/supply/bq25890_charger.c:1504:(.text.bq25890_probe+0x3e0): undefined reference to `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
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


vim +2410 drivers/net/phy/phylink.c

9525ae83959b60c Russell King          2017-07-25  2402  
280ed44982ff478 Russell King (Oracle  2024-10-23  2403) static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
280ed44982ff478 Russell King (Oracle  2024-10-23  2404) 						const unsigned long *link_modes)
280ed44982ff478 Russell King (Oracle  2024-10-23  2405) {
280ed44982ff478 Russell King (Oracle  2024-10-23  2406) 	phy_interface_t interface;
280ed44982ff478 Russell King (Oracle  2024-10-23  2407) 
280ed44982ff478 Russell King (Oracle  2024-10-23  2408) 	interface = sfp_select_interface(pl->sfp_bus, link_modes);
41caa7e81b9732a Russell King (Oracle  2024-10-23  2409) 	if (interface == PHY_INTERFACE_MODE_NA) {
280ed44982ff478 Russell King (Oracle  2024-10-23 @2410) 		phylink_err(pl,
280ed44982ff478 Russell King (Oracle  2024-10-23  2411) 			    "selection of interface failed, advertisement %*pb\n",
280ed44982ff478 Russell King (Oracle  2024-10-23  2412) 			    __ETHTOOL_LINK_MODE_MASK_NBITS,
280ed44982ff478 Russell King (Oracle  2024-10-23  2413) 			    link_modes);
41caa7e81b9732a Russell King (Oracle  2024-10-23  2414) 		return interface;
41caa7e81b9732a Russell King (Oracle  2024-10-23  2415) 	}
41caa7e81b9732a Russell King (Oracle  2024-10-23  2416) 
41caa7e81b9732a Russell King (Oracle  2024-10-23  2417) 	if (!test_bit(interface, pl->config->supported_interfaces)) {
41caa7e81b9732a Russell King (Oracle  2024-10-23  2418) 		phylink_err(pl,
41caa7e81b9732a Russell King (Oracle  2024-10-23  2419) 			    "selection of interface failed, SFP selected %s (%u) but MAC supports %*pbl\n",
41caa7e81b9732a Russell King (Oracle  2024-10-23  2420) 			    phy_modes(interface), interface,
41caa7e81b9732a Russell King (Oracle  2024-10-23  2421) 			    (int)PHY_INTERFACE_MODE_MAX,
41caa7e81b9732a Russell King (Oracle  2024-10-23  2422) 			    pl->config->supported_interfaces);
41caa7e81b9732a Russell King (Oracle  2024-10-23  2423) 		return PHY_INTERFACE_MODE_NA;
41caa7e81b9732a Russell King (Oracle  2024-10-23  2424) 	}
280ed44982ff478 Russell King (Oracle  2024-10-23  2425) 
280ed44982ff478 Russell King (Oracle  2024-10-23  2426) 	return interface;
280ed44982ff478 Russell King (Oracle  2024-10-23  2427) }
280ed44982ff478 Russell King (Oracle  2024-10-23  2428) 

:::::: The code at line 2410 was first introduced by commit
:::::: 280ed44982ff478a949a810f9ddfb4adb8207b57 net: phylink: add common validation for sfp_select_interface()

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
