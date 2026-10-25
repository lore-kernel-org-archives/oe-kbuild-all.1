Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792895903;
	b=Aw54KRYYNFhVudHZZ7LJFK18lP5uutbyipv8f1e132Pw3m2R4txcMlXxmcmjqCYm2P70
	 OyWGS1UuONvvAtMyydIKi5iJUUtZCRi1T4RSeoaSh/OK2XyfKZE/SjaTrSyh/sppctxpI
	 YO6tsjlqQYj5rNNY3dOw86qWY6sR7S3lN8+3mdPoEj+spR9+N3WGwWmwKX4wLKGSi9SP2
	 koXQTF1qLXAojdixWB+45FkSHThQ+HzCBsrpvVw3lf9KEB6ozmUrZLnQFuHAYprBoEVW1
	 BLLbaTqPPc9c2gq7RO6ZCeJhr88EDLtw1vwIYZCLQBmpL1uyWa3hf52FAatOcevriJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792895903;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UybKXThHjVDLOAmT3ipbRBovqk77kbT0LAQ6nrI/pUs=;
	b=kvx/3JIygyrHcMj/doMrTA6DlZYw4Ra68tqzrvg8Js5AnWKmGhKITQBGycI0BmQ+xhbC
	 pmSy/MWkfAXpuxs4kZl+lOSN5WlU924TEA3RNpkf+4Xe7v01KOch3rpI7mpndb+klbWdm
	 8YrI6GxuGr+SdgX/m8eQoa0TEXr4JJXp5gLaYQKDgGu8Al+OgbAbCkPFUQHAlJFu98GCc
	 /X8aA4ERS7PG6p77AywoyvJseMQy8HdE+/e3eZZC8f5gp4jpPGh8WZn5VwD0CUCWUCwO3
	 x/YRBuoT5GJJmHCWWVgTnI/G2xEb6B4ZUSAgYX4LK2M1AnEACgTPeP9qXelw61o0Tbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="TpxC7n/t";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9448606A31B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 02:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9448606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TpxC7n/t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792895902; x=1824431902;
  h=date:from:to:cc:subject:message-id;
  bh=UdUWhuYWULM5Lf6Qh1iWVnTdqy7vykAre6X1Jtk9crE=;
  b=TpxC7n/tzOACt79X6ro0w3Si8u8oKtT6n6VxX/+3NBM7jVhsm6/UfH09
   2mm/stybLRMb/Map20pC5Oagp3NkYea+NhBzJXCXJh8+68FihzWvK2c5R
   l7GMie7ZOCNXpECPhWggE9MEhXIycMTgLhxdZ8VMVD8oujHu0kEOW3eiY
   aSQu+B9OSKi8YFKqNaAdrE8T8LHtlYXzejaDzoLQdknz+mIepNRwOKKxL
   uwA/lYOVOsWzrbUkkXZP+4OYWj1Y/EhpAgqaDaYI9MeApiTZfXPHfoDWr
   rlEVexKRlkLyS7VdLSCOQ6OoGO9jdNb2Uoy97kG0oJTZOd60pVST7KG2F
   g==;
X-CSE-ConnectionGUID: gnwGZJ5lQSGEvfENW8NpYg==
X-CSE-MsgGUID: tuI3UAfhQW6XhlSBOqQgvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1495702"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1495702"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:38:22 -0700
X-CSE-ConnectionGUID: veiZCRhzTy2HyxwS7JzTQQ==
X-CSE-MsgGUID: fkFjXzwvShy5HvkitrEV5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="4326571"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Oct 2026 19:38:20 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKo7k-00000000UTi-3f3U;
	Sun, 25 Oct 2026 02:38:16 +0000
Date: Sun, 25 Oct 2026 10:37:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] arm-linux-gnueabi-ld:
 phylink.c:undefined reference to `phy_resume'
Message-ID: <202610251015.h7PxR4J1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Tudor,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   533c1b80b8a9556fea6728bd85fa3a276bccbd15
commit: add2a3ec5fa37f0c1be4022f4b51178803463a24 [1/1] Merge 1a9239bb4253 ("Merge tag 'net-next-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next") into android-mainline
config: arm-randconfig-1000-20261020 (https://download.01.org/0day-ci/archive/20261025/202610251015.h7PxR4J1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251015.h7PxR4J1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251015.h7PxR4J1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
   phylink.c:(.text+0x4a8): undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_activate_lpi':
   phylink.c:(.text+0x78c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode':
   phylink.c:(.text+0x880): undefined reference to `phy_inband_caps'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x998): undefined reference to `phy_inband_caps'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xa20): undefined reference to `phy_inband_caps'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xa88): undefined reference to `phy_inband_caps'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xce4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xd5c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_up':
   phylink.c:(.text+0x1110): undefined reference to `netif_carrier_on'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x11c0): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x11cc): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1218): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1224): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1250): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_caps_to_linkmodes':
   phylink.c:(.text+0x138c): undefined reference to `phy_caps_linkmodes'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block':
   phylink.c:(.text+0x13cc): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1460): undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x14f8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock':
   phylink.c:(.text+0x154c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x15e0): undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1678): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x16d0): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x180c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x18a4): undefined reference to `phy_disconnect'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_prepare_resume':
   phylink.c:(.text+0x1958): undefined reference to `rtnl_is_locked'
>> arm-linux-gnueabi-ld: phylink.c:(.text+0x19d0): undefined reference to `phy_resume'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x1a50): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1a98): undefined reference to `phy_ethtool_get_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x1b10): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1b3c): undefined reference to `phy_ethtool_set_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x1bcc): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1bf0): undefined reference to `phy_restart_aneg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x1c8c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1cb4): undefined reference to `phy_get_eee_err'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x1d50): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1da4): undefined reference to `phy_ethtool_get_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x1ea4): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1edc): undefined reference to `phy_ethtool_set_eee'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1fac): undefined reference to `phy_ethtool_set_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x2070): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x20d4): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x2110): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2170): undefined reference to `phy_speed_down'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x22e8): undefined reference to `mdiobus_modify'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2348): undefined reference to `mdiobus_modify_changed'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   phylink.c:(.text+0x2434): undefined reference to `linkmode_resolve_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x2a30): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2a58): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x2af4): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x2c0c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2c68): undefined reference to `phy_speed_up'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x2e90): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2f64): undefined reference to `linkmode_set_pause'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x2fe4): undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x318c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x31ac): undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   phylink.c:(.text+0x3350): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x33dc): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   phylink.c:(.text+0x3490): undefined reference to `phy_caps_from_interface'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x365c): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x37d8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x3ac0): undefined reference to `phy_get_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   phylink.c:(.text+0x4014): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x407c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   phylink.c:(.text+0x4254): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   phylink.c:(.text+0x4638): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4758): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4774): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   phylink.c:(.text+0x4ab0): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4b10): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4b6c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x4da0): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4e6c): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4f48): undefined reference to `phy_mii_ioctl'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x4fec): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x50b4): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x50d4): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5184): undefined reference to `swphy_read_reg'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x51fc): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5220): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x5464): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5488): undefined reference to `phy_ethtool_ksettings_get'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x58c0): undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5ba8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5c18): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x5c50): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   phylink.c:(.text+0x5ff8): undefined reference to `netif_carrier_off'
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
>> arm-linux-gnueabi-ld: phylink.c:(.text+0x72e0): undefined reference to `phy_caps_lookup'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7458): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x768c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x76d4): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7774): undefined reference to `phy_start'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7990): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   phylink.c:(.text+0x7a4c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x7c04): undefined reference to `phy_support_asym_pause'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7ce0): undefined reference to `phy_attached_info_irq'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7ebc): undefined reference to `phy_eee_tx_clock_stop_capable'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7f0c): undefined reference to `phy_eee_rx_clock_stop'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7f40): undefined reference to `phy_disable_eee'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7f4c): undefined reference to `phy_support_eee'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7f58): undefined reference to `phy_request_interrupt'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7ff8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x8080): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x8220): undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x82a8): undefined reference to `phy_detach'

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
