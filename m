Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792922634;
	b=gamdbFZAY6CrgJvlZULX15QmOrFiH5xzBa1uSANXtnZjiJZvgUTyguEhW5tc8PiozQOu
	 rlMXC3kYtBG10r8LuZRiwy8mYEvOLZLy/XbokHan9jNi5SfDKaqVDXvm/3Zm5xY1wGRmW
	 WrLCIJGcacbtF29iE3UMnbvY5hGAUgz++tEeVDFBalfsycj7d8B33CsBvfEm6pDiq0gh5
	 nI0DgW9XOgZBeB6x7d2ICxEtZ4PU3AJbuMh7GzmlBL+NxBT5dNmEeA9SL+xEYyxdwJg5v
	 EQtuvU1MaqZNBYGjinl0RXZWDZ6ddPslpExX79DfQi5iVZqt4FPSDxhs58rHhpabA6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792922634;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CmwN99FugVTMVHQGwBSPgfhUC1q46TBAYxy7zEBgYC4=;
	b=l1QXM9vR3C5zVqGulX/W8Ks8aOx8yTVI18Bvn64UBrruKu9zw/VAPP/xd3MGJ435EjbO
	 BdQk9VQmPvrBAXJlIxK46Nrnrq8H6l7aABO5mdEw7AvmBhsrGx/yGTVNN5QMEvMnyNkWz
	 V41W4IYH+7xkD2+Dj3uTsDFmNE3Z4RqkyadhfUzNRdYKhK7rrhBVhPFc7kMbLFSrQNkiP
	 wSqKJZUDB467TFtnF0WuwzzrxtlpZ+1cTn3Iln51ugaK2cA2vvxnRuN2f+9tOgRVUfiKI
	 mOR89+p9KuzB7mXn6oqSPrfbhbOvn08Xzmaf1JUS29cUyN9PZ1cnn5bkgI96/OSSsUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BppUvmmH;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F7F606A31B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 10:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F7F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BppUvmmH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792922631; x=1824458631;
  h=date:from:to:cc:subject:message-id;
  bh=+LxEVrkRX/vRrs7pfN8BEKzBURNoaFJwNkPm+0ngkT0=;
  b=BppUvmmHGYvx3VmowHRsFocF7znGZwCFNFnq2XC60XwoaJdWetLA2Qyv
   //0mn7i9meyyziS0wGLFkonYvlSW9lgwbpmDCHDLSscrgNSovcdS2M1x+
   CWeYV5jWcYPrVDAPyL+CWug+V0d1lp7pwcjZhMvXZQUpTtBAMZaAPRgEP
   qUIOu0VvnpSXrQsa0iWB/hNjSw69MOBRQp4zKoxyjDq1SOiPJCyYvwWPs
   PKD4frf+3QKBlMnvvZK/S17Qvd5bSgPXSxAjXvoPqLjMiNfBs5agv5EV/
   /rBeoS/wbEi0QmRoP3mpDKqJnMHRONF6ywX6vyePvG3DKr2CDoSFGSsNs
   w==;
X-CSE-ConnectionGUID: k7TT7HMdQGK1vDvvlgGn3A==
X-CSE-MsgGUID: 3iJIMUwjTEaeq/+phM2iPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1599746"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1599746"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 03:03:51 -0700
X-CSE-ConnectionGUID: c4QoOAe8TZ2IgwDNiv2U0g==
X-CSE-MsgGUID: mXrwu80ITSqtUzUEm3tWmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="3900541"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Oct 2026 03:03:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKv4t-00000000Uic-0oyR;
	Sun, 25 Oct 2026 10:03:47 +0000
Date: Sun, 25 Oct 2026 18:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] phy_package.c:undefined
 reference to `__mdiobus_write'
Message-ID: <202610251752.PUbMHA4w-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   533c1b80b8a9556fea6728bd85fa3a276bccbd15
commit: e720a50b14c5896defc425452f52d3ee1d2de1c5 [1/1] ANDROID: GKI: Select PHY_PACKAGE for vendor modules
config: arm-randconfig-1000-20261020 (https://download.01.org/0day-ci/archive/20261025/202610251752.PUbMHA4w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251752.PUbMHA4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251752.PUbMHA4w-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x2ab4): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x2bcc): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2c28): undefined reference to `phy_speed_up'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x2dd0): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2ea4): undefined reference to `linkmode_set_pause'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2f24): undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x304c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x306c): undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   phylink.c:(.text+0x3210): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x32e4): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   phylink.c:(.text+0x33d0): undefined reference to `phy_caps_from_interface'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x359c): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x3718): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x3a00): undefined reference to `phy_get_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   phylink.c:(.text+0x3f54): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x3fbc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   phylink.c:(.text+0x4194): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   phylink.c:(.text+0x4578): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4698): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x46b4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   phylink.c:(.text+0x4a48): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4a64): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4ad0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x4d20): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4dec): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4ec8): undefined reference to `phy_mii_ioctl'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4f6c): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5034): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5054): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5104): undefined reference to `swphy_read_reg'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x517c): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x51a0): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x53e4): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5408): undefined reference to `phy_ethtool_ksettings_get'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x5840): undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5b44): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5b7c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5bcc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5c2c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   phylink.c:(.text+0x5fd4): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x6720): undefined reference to `phy_config_inband'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x68c0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x6900): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x6984): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x69a4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x69c4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o:phylink.c:(.text+0x6a04): more undefined references to `netdev_printk' follow
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x6fd0): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7030): undefined reference to `phy_ethtool_ksettings_set'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x717c): undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x763c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x765c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x76cc): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x798c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x79d4): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7a74): undefined reference to `phy_start'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7c90): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   phylink.c:(.text+0x7d4c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x7f44): undefined reference to `phy_support_asym_pause'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x8020): undefined reference to `phy_attached_info_irq'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x8208): undefined reference to `phy_eee_tx_clock_stop_capable'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x8250): undefined reference to `phy_request_interrupt'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x8278): undefined reference to `phy_disable_eee'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x8284): undefined reference to `phy_support_eee'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x82a8): undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x8358): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x83e0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x85a0): undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x8628): undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_fwnode_phy_connect':
   phylink.c:(.text+0x86cc): undefined reference to `fwnode_get_phy_node'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x86dc): undefined reference to `fwnode_phy_find_device'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x879c): undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x87a8): undefined reference to `phy_device_free'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x87f8): undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phy_package.o: in function `__phy_package_read':
   phy_package.c:(.text+0xe8): undefined reference to `__mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phy_package.o: in function `__phy_package_write':
>> phy_package.c:(.text+0x1b0): undefined reference to `__mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phy_package.o: in function `__phy_package_read_mmd':
>> phy_package.c:(.text+0x29c): undefined reference to `mmd_phy_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phy_package.o: in function `__phy_package_write_mmd':
   phy_package.c:(.text+0x3a4): undefined reference to `mmd_phy_write'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHY_PACKAGE
   Depends on [n]: NETDEVICES [=n] && PHYLIB [=n]
   Selected by [y]:
   - GKI_HIDDEN_PHY_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
