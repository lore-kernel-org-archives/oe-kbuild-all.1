Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7CF17D34D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 20:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725915036; cv=none; b=UvNB5Jy8chbKpIv4DdcNUnGq0s1Hy63aqp+W9JmCUCcb/znuRXrbW9zSXWK7716EhAd0brkrXNwu0LaatlxMjj/ikDd0QtFSK6p0/i/rRBBZO68h9eSj+GkX2+7fmro4E/a5y4pkPrpb5z4xuEJU1t7RKgkFKiEnEav0Ega4DtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725915036; c=relaxed/simple;
	bh=Lb5iJ1SBu6/IwSR1hLNVItyBtKZ1mg+tPLgqSpwyOZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PwakpU8o57NYi7kdvFT8pXPDooIKC4LItnQvBVX1UVDUZZkwvxNl2SzGn9KMKmomMi8AMoZg9Sy1q/GyK+hNdoqKfYRlyRr39hx1LhXcUdrujCQtIcLQ/fG7C6rTNXcZd94tsclZYHj4766SRfWSc3VORwWOFQXMmRkBUTSGlh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKXK/sZ1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKXK/sZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725915034; x=1757451034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lb5iJ1SBu6/IwSR1hLNVItyBtKZ1mg+tPLgqSpwyOZ4=;
  b=DKXK/sZ1zi7iMIkq2J59fF6zEGivy5MOfvc5xJ6JYAghQoyRK1uUMqQz
   xPjg24ObHmmkAOSB3x997ke0JiOdzltCslWFGjIFaIS1/7CYKBFQN3k1d
   Kl2e6QwQtZiE/JvBs5ELpg/MjFniN4mU3PJEEiZrGEjx2il5NqsmIPjr4
   BmlsceMzMYSy0Wcr69E1OVzSSuynwapXqLNrg0YxfCZkbaVjLtrXKZoQ9
   kEI1ZI+kb0LtyafCLvhQGj3yZr+2p95JO+LTPRXkS6WJtVy1gZHOTLJCj
   CYRXyCYxI0Cmeu88597QXnML6vuNj618YNBq6g7yzuwkxc3snIyF2Vq7Z
   w==;
X-CSE-ConnectionGUID: GEbZuXabTJGwoYqaslUk0A==
X-CSE-MsgGUID: yFB6BwrSSAWhJEG4BU5s4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24451852"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24451852"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 13:50:34 -0700
X-CSE-ConnectionGUID: L3JuCZGaTmOaJFFH0eCoUg==
X-CSE-MsgGUID: BYltzIMHSHi84Doxs0yOvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="104252380"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Sep 2024 13:50:33 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snlLC-000FDA-1S;
	Mon, 09 Sep 2024 20:50:30 +0000
Date: Tue, 10 Sep 2024 04:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/7] net_dim.c:undefined reference
 to `lockdep_rtnl_is_held'
Message-ID: <202409100433.Fbypfldz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   e8ac88bbf71ba8c59a0fde1034cc9fddb17f9441
commit: 1dfbe413d21f18f714cca818435299947bf5649a [1/7] Merge 6706415bf9f3 ("Merge tag 'gfs2-v6.10-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2") into android-mainline
config: i386-buildonly-randconfig-006-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100433.Fbypfldz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100433.Fbypfldz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100433.Fbypfldz-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: lib/dim/net_dim.o: in function `net_dim_free_irq_moder':
>> net_dim.c:(.text+0x2e9): undefined reference to `lockdep_rtnl_is_held'
>> ld: net_dim.c:(.text+0x329): undefined reference to `lockdep_rtnl_is_held'
   ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   phylink.c:(.text+0x5a7): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x8b6): undefined reference to `netif_carrier_off'
   ld: phylink.c:(.text+0x8fd): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x946): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x9ac): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x9fa): undefined reference to `phy_disconnect'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0xa16): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0xa32): undefined reference to `phy_ethtool_get_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0xa4a): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0xa58): undefined reference to `phy_ethtool_set_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0xa77): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0xa83): undefined reference to `phy_get_eee_err'
   ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0xaa6): undefined reference to `phy_init_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0xac2): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0xad0): undefined reference to `phy_ethtool_get_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0xaf2): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0xb00): undefined reference to `phy_ethtool_set_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0xb32): undefined reference to `mdiobus_c45_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0xbb8): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0xbd0): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0xc1d): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0xc3d): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0xc90): undefined reference to `swphy_read_reg'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0xcba): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0xce9): undefined reference to `phy_speed_down'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0xcff): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0xd2c): undefined reference to `phy_speed_up'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0xd74): undefined reference to `mdiobus_modify'
   ld: phylink.c:(.text+0xdab): undefined reference to `mdiobus_modify_changed'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0xe6a): undefined reference to `netif_carrier_on'
   ld: phylink.c:(.text+0xe93): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0xe9d): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0xeb1): undefined reference to `netdev_printk'
   ld: phylink.c:(.text+0xef3): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0xefd): undefined reference to `phy_speed_to_str'
   ld: drivers/net/phy/phylink.o: in function `phylink_change_inband_advert.isra.0':
   phylink.c:(.text+0x108d): undefined reference to `__dynamic_netdev_dbg'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x1112): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x1197): undefined reference to `linkmode_set_pause'
   ld: phylink.c:(.text+0x11df): undefined reference to `phy_set_asym_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x126c): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x1278): undefined reference to `phy_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   phylink.c:(.text+0x1302): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x133c): undefined reference to `netif_carrier_off'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_changed':
   phylink.c:(.text+0x1880): undefined reference to `__dynamic_netdev_dbg'
   ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x1969): undefined reference to `phy_get_pause'
   ld: phylink.c:(.text+0x1a4d): undefined reference to `phy_rate_matching_to_str'
   ld: phylink.c:(.text+0x1a5b): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x1a69): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x1b04): undefined reference to `phy_rate_matching_to_str'
   ld: phylink.c:(.text+0x1b12): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x1b20): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x1b61): undefined reference to `__dynamic_netdev_dbg'
   ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   phylink.c:(.text+0x1d14): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x1d62): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x1d6e): undefined reference to `phy_restart_aneg'
   ld: drivers/net/phy/phylink.o: in function `phylink_mac_config':
   phylink.c:(.text+0x1e71): undefined reference to `phy_rate_matching_to_str'
   ld: phylink.c:(.text+0x1ed3): undefined reference to `phy_rate_matching_to_str'
   ld: phylink.c:(.text+0x1f1c): undefined reference to `__dynamic_netdev_dbg'
   ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x223e): undefined reference to `netdev_printk'
   ld: phylink.c:(.text+0x22c4): undefined reference to `__dynamic_netdev_dbg'
   ld: phylink.c:(.text+0x231e): undefined reference to `netdev_printk'
   ld: phylink.c:(.text+0x236e): undefined reference to `netdev_printk'
   ld: phylink.c:(.text+0x23c0): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x25a4): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x25e8): undefined reference to `netdev_printk'
   ld: phylink.c:(.text+0x25f6): undefined reference to `netif_carrier_off'
   ld: phylink.c:(.text+0x2637): undefined reference to `phy_start'
   ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   phylink.c:(.text+0x2764): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x2c5c): undefined reference to `rtnl_is_locked'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
