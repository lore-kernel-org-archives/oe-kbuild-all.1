Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6832940D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 02:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770861844; cv=none; b=ViB4GCdY1wX8Km3l7qOvS/5tQp/61QNdtHCM6y7XetBidG2tti730JBntDTsp1wIvBmES3m5rZcTYQU398YK2SYcq2AFLVanY5txQhsLkrlnX7BaE4oWVnCImMw+dDw+RcNJx9mAhZhJdvjWQ1fTKjFRVY5vYPP7Xikz2vhRVT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770861844; c=relaxed/simple;
	bh=C1zoZYyHjK3yk254ZbatPgWWDFUKnSHZEsOuOn8NdqU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=unUPZ3rUZPtRB78duB6Aswllv++sXfmR2SGw50XcFXUFToAIrjWCLCe7QwjolaPDn7eGL4dFnij8WvAVrfrfXiipZt656jvYaRUwrRDe8Rz6InUwDbOsaXTDI+u26ThParpCtcpz80Osa/rO05ovGfpnrFstRgnBnYLcXsOE6hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvUBjN2R; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvUBjN2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770861841; x=1802397841;
  h=date:from:to:cc:subject:message-id;
  bh=C1zoZYyHjK3yk254ZbatPgWWDFUKnSHZEsOuOn8NdqU=;
  b=kvUBjN2R5XKdhku30VClaao/cUzX5t3n7px3IyPN/KKBDOB/CtT22Sul
   +YSXwyWA9lXLBd6S61ZKPqtfH8kt/yl30FZMXyR+xXMm+y9wA9TxlaG6d
   N8d4uFv3T8jtSYSUtWdLWuQPZHdjmptKf9fM2RDmMU07yHObr9JkhALjU
   VQeiq+u4RKN5gcSbynHQTbE70EprOH5iCx6KeGa6Lh3Mvvu9pyFoM/TxP
   aK+nsn3U2iiMDYisrDmboZliE8tFFaq8hdL3SXJI0JYy4rYX7SE307nf2
   /7Ld5LyCGVf/tvwAL9KjqVQ8Kmgh0BkRwqSbQoYtWNn67fSQ+75Z1BXQq
   Q==;
X-CSE-ConnectionGUID: hCds27VdT7CvckwdP2bUcQ==
X-CSE-MsgGUID: 7Yocl5Z4QTa2CGR3aIbqsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75871719"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="75871719"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 18:04:00 -0800
X-CSE-ConnectionGUID: GoWDUKyERn2i/o+rKf6GxQ==
X-CSE-MsgGUID: W9MuDjtKQjehcK8E/3mkUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="243038302"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Feb 2026 18:03:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqM3g-00000000qYq-0t4o;
	Thu, 12 Feb 2026 02:03:56 +0000
Date: Thu, 12 Feb 2026 10:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 1/1]
 aarch64-linux-ld: phylink.c:undefined reference to `phy_may_wakeup'
Message-ID: <202602120953.E6SoqIF5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   d54667ebbea7f05b4ea63f3f66d7cb4909b330c3
commit: ccf4fe000a868fef218d481fde838e6c5927faf2 [1/1] Merge 477e31fd1e81 ("Merge tag 'erofs-for-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs") into android-mainline
config: arm64-randconfig-004-20260211 (https://download.01.org/0day-ci/archive/20260212/202602120953.E6SoqIF5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120953.E6SoqIF5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120953.E6SoqIF5-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_activate_lpi':
   phylink.c:(.text+0x11bc): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode':
   phylink.c:(.text+0x1404): undefined reference to `phy_inband_caps'
   aarch64-linux-ld: phylink.c:(.text+0x1580): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x17b4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1864): undefined reference to `phy_inband_caps'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_caps_to_linkmodes':
   phylink.c:(.text+0x1928): undefined reference to `phy_caps_linkmodes'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block':
   phylink.c:(.text+0x1964): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x19c0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1a60): undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock':
   phylink.c:(.text+0x1aa4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1afc): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1ba0): undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x1be8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x1d24): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1dc0): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_prepare_resume':
   phylink.c:(.text+0x1e28): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1e68): undefined reference to `phy_resume'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x1eac): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1f44): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: phylink.c:(.text+0x1fe4): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x2050): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x20c8): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: phylink.c:(.text+0x20f0): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: phylink.c:(.text+0x21f0): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x225c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2274): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x22e8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x232c): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x23b0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2414): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x2508): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x2614): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x263c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x2708): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x2738): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x27a0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x27d0): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x281c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2848): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x28f4): undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: phylink.c:(.text+0x2948): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x2b48): undefined reference to `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0x2b78): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2b84): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2bd0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2bf4): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2c00): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x2d54): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2eb8): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x310c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3264): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x335c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x33c4): undefined reference to `phy_config_inband'
   aarch64-linux-ld: phylink.c:(.text+0x340c): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x36e0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x37e8): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x3888): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x3b30): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3bd0): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x3c68): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x3c88): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x3ce4): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: phylink.c:(.text+0x3d78): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: phylink.c:(.text+0x3d9c): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x3db4): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: phylink.c:(.text+0x3f58): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x4020): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x4034): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   phylink.c:(.text+0x4170): undefined reference to `phy_caps_from_interface'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x4334): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x4444): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   phylink.c:(.text+0x4ba4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x4cb8): undefined reference to `netif_carrier_off'
>> aarch64-linux-ld: phylink.c:(.text+0x4d2c): undefined reference to `phy_may_wakeup'
>> aarch64-linux-ld: phylink.c:(.text+0x4d34): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x4d5c): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x503c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5054): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x5198): undefined reference to `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x5324): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x53c8): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x5470): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x55d0): undefined reference to `phy_start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   phylink.c:(.text+0x561c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5660): undefined reference to `phy_may_wakeup'
   aarch64-linux-ld: phylink.c:(.text+0x5668): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x568c): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   phylink.c:(.text+0x588c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x59a0): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   phylink.c:(.text+0x5c34): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x5f1c): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x5fe4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x6080): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x60dc): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: phylink.c:(.text+0x61e0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x6284): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x6308): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x6488): undefined reference to `phy_support_eee'
   aarch64-linux-ld: phylink.c:(.text+0x6518): undefined reference to `phy_disable_eee'
   aarch64-linux-ld: phylink.c:(.text+0x656c): undefined reference to `phy_eee_tx_clock_stop_capable'
   aarch64-linux-ld: phylink.c:(.text+0x65cc): undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: phylink.c:(.text+0x65ec): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x6724): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: phylink.c:(.text+0x6754): undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_fwnode_phy_connect':
   phylink.c:(.text+0x67f0): undefined reference to `fwnode_get_phy_node'
   aarch64-linux-ld: phylink.c:(.text+0x6818): undefined reference to `fwnode_phy_find_device'
   aarch64-linux-ld: phylink.c:(.text+0x68bc): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: phylink.c:(.text+0x68c8): undefined reference to `phy_device_free'
   aarch64-linux-ld: phylink.c:(.text+0x68f4): undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   phylink.c:(.text+0x6b2c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x6cc4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x6d54): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x70ac): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x7108): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o:phylink.c:(.text+0x7268): more undefined references to `netdev_printk' follow
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x7308): undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: phylink.c:(.text+0x7414): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   phylink.c:(.text+0x76e0): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x7a00): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x7a8c): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x7b38): undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: phylink.c:(.text+0x7cf0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x7e48): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x7f44): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x8264): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x8278): undefined reference to `phy_restart_aneg'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
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
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
