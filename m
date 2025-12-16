Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAE93644B7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765899554; cv=none; b=b5bHs8iRjfaSQD+Lm0ls2rCQeMEQxvx/hD/tZmC4NuLSn5yvJ9jutAJGvuM3BTVPyuycOl24P9OeM5OXrzECP0khdtG20CvnzKRpTIZI70jQkNtdWj5OuExPH41qqQ3QT+fXNKt3o2+ezbJWHpR4+1WJXVIpCBDWWttHC2fuGEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765899554; c=relaxed/simple;
	bh=Oblp68YcBvgBDT46nzPcNiYEICfG6glFQW9YtdF/GbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kFGJwAJRfp8zet7sAdbCCy09JLp7a6hNOoZq5gPyArD50qGjUHYoDq9keIEGoWl+AGKc3OGX4YN6U6hZeBCkzz6EqmYxM34AL1GCb9kgGV0+H0+ZNdiyomrajv1zGTXTX+VVoGLkTRmeOpkzxZgAHBumZQV9UzbJjGFiR2DZJEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOhSLCRQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOhSLCRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765899552; x=1797435552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oblp68YcBvgBDT46nzPcNiYEICfG6glFQW9YtdF/GbQ=;
  b=DOhSLCRQum7BbNsuODvlUBq/WVeV178oJyDDK6fK2fAQB0VveoBBoQhg
   2W9KuBj3tXQMZiVNq7WK7bgKyhkq8xUWwzSQKglhB0Lk72bA3zR0WIFa7
   /7X1+Hxyao3slxoIkV97gF/aR9MVVBgiGs6kWGC495MNs6ipcMZ6fW1rJ
   +kkWysECS1FgJla2qcF1/Y4INSDobN+1mtUv12bAT/BOuzmHnSI9vtb0z
   A6EeJ3Zh93mEDKU1ikpk66MZogbsefqRBnj3KYtBu7krc0krc19DSL03P
   qrIz5hvTKLkRQzoCiVSLdNxQA1vjL91Emwlyav9EX1gfsYrNJ3UERRCXQ
   A==;
X-CSE-ConnectionGUID: OAMtN5lSSCmSh/EGxBM+Zg==
X-CSE-MsgGUID: WvVGg/5vRe2gv43DmJtk2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67702363"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67702363"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 07:39:10 -0800
X-CSE-ConnectionGUID: Nzsg/Yr0SAytot369mSuFA==
X-CSE-MsgGUID: OHi8LLCoQyeq/nAgPmh/bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="228727402"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Dec 2025 07:39:09 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVX8k-000000003Rc-3x8p;
	Tue, 16 Dec 2025 15:39:06 +0000
Date: Tue, 16 Dec 2025 23:39:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 3/3] aarch64-linux-ld:
 drivers/net/phy/phylink.c:2588: undefined reference to `phy_resume'
Message-ID: <202512162330.6oMV1bhc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tudor,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   fbfd6aedcdb51da80c81b27b298b8691212febac
commit: add2a3ec5fa37f0c1be4022f4b51178803463a24 [3/3] Merge 1a9239bb4253 ("Merge tag 'net-next-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next") into android-mainline
config: arm64-randconfig-004-20251206 (https://download.01.org/0day-ci/archive/20251216/202512162330.6oMV1bhc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162330.6oMV1bhc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162330.6oMV1bhc-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
   drivers/net/phy/phylink.c:1759: undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode':
   drivers/net/phy/phylink.c:1082: undefined reference to `phy_inband_caps'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1118: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1181: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   drivers/net/phy/phylink.c:1249: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1278: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1291: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o:drivers/net/phy/phylink.c:1304: more undefined references to `netdev_printk' follow
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   drivers/net/phy/phylink.c:1312: undefined reference to `phy_config_inband'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1314: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_caps_to_linkmodes':
   drivers/net/phy/phylink.c:369: undefined reference to `phy_caps_linkmodes'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block':
   drivers/net/phy/phylink.c:2475: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2478: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2490: undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock':
   drivers/net/phy/phylink.c:2504: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2507: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2519: undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   drivers/net/phy/phylink.c:2996: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   drivers/net/phy/phylink.c:2296: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2309: undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_prepare_resume':
   drivers/net/phy/phylink.c:2579: undefined reference to `rtnl_is_locked'
>> aarch64-linux-ld: drivers/net/phy/phylink.c:2588: undefined reference to `phy_resume'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   drivers/net/phy/phylink.c:2640: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2646: undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   drivers/net/phy/phylink.c:2665: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2668: undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   drivers/net/phy/phylink.c:2978: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2981: undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   drivers/net/phy/phylink.c:3104: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3107: undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   drivers/net/phy/phylink.c:3122: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3128: undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   drivers/net/phy/phylink.c:3149: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3165: undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   drivers/net/phy/phylink.c:3192: undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   drivers/net/phy/phylink.c:850: undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   drivers/net/phy/phylink.c:1557: undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1563: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   drivers/net/phy/phylink.c:4138: undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:3351: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3235: undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3239: undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3276: undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3280: undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3374: undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   drivers/net/phy/phylink.c:3422: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3425: undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   drivers/net/phy/phylink.c:3445: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3448: undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   drivers/net/phy/phylink.c:4087: undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   include/linux/mdio.h:645: undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   drivers/net/phy/phylink.c:2739: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2742: undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   drivers/net/phy/phylink.c:1928: undefined reference to `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   drivers/net/phy/phylink.c:2445: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2450: undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   drivers/net/phy/phylink.c:2539: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2553: undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   include/linux/mdio.h:633: undefined reference to `mdiobus_read'
   aarch64-linux-ld: include/linux/mdio.h:639: undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   include/linux/mdio.h:633: undefined reference to `mdiobus_read'
   aarch64-linux-ld: include/linux/mdio.h:633: undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   drivers/net/phy/phylink.c:3016: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3051: undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3074: undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   drivers/net/phy/phylink.c:2377: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2379: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2385: undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2425: undefined reference to `phy_start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   drivers/net/phy/phylink.c:2601: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
   drivers/net/phy/phylink.c:1490: undefined reference to `netdev_printk'
>> aarch64-linux-ld: drivers/net/phy/phylink.c:1543: undefined reference to `netif_carrier_on'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1545: undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1545: undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1545: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1545: undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1545: undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   drivers/net/phy/phylink.c:427: undefined reference to `phy_caps_from_interface'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   drivers/net/phy/phylink.c:524: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:536: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   drivers/net/phy/phylink.c:583: undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   drivers/net/phy/phylink.c:2165: undefined reference to `phy_attach_direct'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2049: undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1991: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2058: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2199: undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2069: undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2070: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2098: undefined reference to `phy_support_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2128: undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2134: undefined reference to `phy_eee_tx_clock_stop_capable'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2140: undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2012: undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2115: undefined reference to `phy_disable_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   drivers/net/phy/phylink.c:2811: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2838: undefined reference to `phy_ethtool_ksettings_set'
>> aarch64-linux-ld: drivers/net/phy/phylink.c:2852: undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2681: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   drivers/net/phy/phylink.c:1821: undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.c:823: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:814: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:694: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:715: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:724: undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: drivers/net/phy/phylink.c:741: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   drivers/power/supply/isp1704_charger.c:399: undefined reference to `devm_usb_get_phy_by_phandle'
   aarch64-linux-ld: drivers/power/supply/isp1704_charger.c:401: undefined reference to `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   drivers/power/supply/bq25890_charger.c:1504: undefined reference to `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/bq256xx_charger.o: in function `bq256xx_probe':
   drivers/power/supply/bq256xx_charger.c:1730: undefined reference to `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/bq256xx_charger.c:1737: undefined reference to `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
