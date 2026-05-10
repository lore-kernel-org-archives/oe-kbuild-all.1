Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735FF39E178
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778424030; cv=none; b=Cb2+i1yr+bk1g1bWY5n+GpfI4rIlMlrabCDcs5gm1I/w6F5S26TVH7dbaa1qSQDJGvX9VKmK91Y6z8dcEof8EM2XcAN20JnOiKCaXjwMNOh14e6+PTYw9s33NUAiERSdFYEx9GFTDexxymIN9PH1TvNQwlfXTksiUvzoR/PCBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778424030; c=relaxed/simple;
	bh=4fUQdeqUEw55jBoUqMjzL9pXO0A39AJw49b/ZkQpEFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WwI/MKbZ5DufYfhPS1FJ4eWQz5HWNiGtD405QrXHnCo1/NHEG1pB/cwyib6WkLgazflHeSGQzARw2BRlCdrOgLTv/i50bDTFHTEc5e0iPL+wXntb7GuB3lOGTxsThwVElsF8WWbssTlY/q2XhU8ug0qpoMo80UNbitzI/Fys8lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXvOINQR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXvOINQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778424029; x=1809960029;
  h=date:from:to:cc:subject:message-id;
  bh=4fUQdeqUEw55jBoUqMjzL9pXO0A39AJw49b/ZkQpEFA=;
  b=FXvOINQR8ZFUBUrjhnGAi3du2/+7N6Fg6XR0aLEcdWZ9zyjq1PwrkXRE
   pOOw85bKxgKc83FJPlxvj8IDZEAk8ZOGfhROR5hYGp4r/3Of+SPk7tEe9
   FeiYzZHhSTwuRgr++ZP49HLrffoncvTwoTotnF9OgmMYz8wckIkbiEU02
   udPPlnJowP+wc+7/nrexpnnhE6LWksUAAqEEdsbyibUHsVaNIZEz0hLtD
   VL+1K3rTL7bTwJspW3Q+2CkMno/8Zg+9wL9eCdrwdX4yr5jeZqDGXt4uD
   R8nHZeRVBQTyvddWPaFzaoxKsZ6COtX7h1cQb8bupXHtA9o8pFFP5ebhh
   A==;
X-CSE-ConnectionGUID: 8n0If3ZjQ+6av1SPblL79A==
X-CSE-MsgGUID: 313LERLdQ3CeygQP3s5TEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90030344"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="90030344"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 07:40:26 -0700
X-CSE-ConnectionGUID: s/XJ9KhISKWKANPJ2Cilvg==
X-CSE-MsgGUID: VBnQKD8OTx6VqAnWYhWTqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="267593737"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 May 2026 07:40:23 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM5KP-000000002JR-1z7L;
	Sun, 10 May 2026 14:40:21 +0000
Date: Sun, 10 May 2026 22:40:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 193/193]
 aarch64-linux-ld: drivers/net/phy/phylink.c:2585: undefined reference to
 `phy_may_wakeup'
Message-ID: <202605102249.DpJe5T5N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   ece4652a5be31153d1133e5872847cee6263b74e
commit: ccf4fe000a868fef218d481fde838e6c5927faf2 [193/193] Merge 477e31fd1e81 ("Merge tag 'erofs-for-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs") into android-mainline
config: arm64-randconfig-003-20260508 (https://download.01.org/0day-ci/archive/20260510/202605102249.DpJe5T5N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605102249.DpJe5T5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605102249.DpJe5T5N-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   include/linux/tty_flip.h:77: undefined reference to `__tty_insert_flip_string_flags'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   drivers/tty/hvc/hvc_console.c:755: undefined reference to `tty_flip_buffer_push'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.c:677: undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.c:745: undefined reference to `tty_wakeup'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.c:690: undefined reference to `tty_hangup'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   drivers/tty/hvc/hvc_console.c:337: undefined reference to `tty_port_install'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.c:339: undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   drivers/tty/hvc/hvc_console.c:298: undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
   drivers/net/phy/phylink.c:1800: undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_activate_lpi':
   drivers/net/phy/phylink.c:1523: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_sfp_select_interface_speed':
   drivers/net/phy/phylink.c:2861: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode':
   drivers/net/phy/phylink.c:1110: undefined reference to `phy_inband_caps'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1146: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1209: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_caps_to_linkmodes':
   drivers/net/phy/phylink.c:379: undefined reference to `phy_caps_linkmodes'
   aarch64-linux-ld: drivers/net/phy/phylink.c:379: undefined reference to `phy_caps_linkmodes'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block':
   drivers/net/phy/phylink.c:2523: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2526: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2538: undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock':
   drivers/net/phy/phylink.c:2552: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2555: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2567: undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   drivers/net/phy/phylink.c:3169: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   drivers/net/phy/phylink.c:2340: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2357: undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_prepare_resume':
   drivers/net/phy/phylink.c:2655: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2664: undefined reference to `phy_resume'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   drivers/net/phy/phylink.c:2722: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2729: undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2743: undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   drivers/net/phy/phylink.c:2766: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2772: undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2801: undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2776: undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   drivers/net/phy/phylink.c:3277: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3280: undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   drivers/net/phy/phylink.c:3322: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3338: undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3338: undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   include/linux/mdio.h:629: undefined reference to `mdiobus_read'
   aarch64-linux-ld: include/linux/mdio.h:635: undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   drivers/net/phy/phylink.c:3365: undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   include/linux/mdio.h:641: undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   drivers/net/phy/phylink.c:4288: undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_c73':
   drivers/net/phy/phylink.c:869: undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   drivers/net/phy/phylink.c:3295: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3301: undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   drivers/net/phy/phylink.c:4339: undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   drivers/net/phy/phylink.c:3618: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3621: undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   drivers/net/phy/phylink.c:3595: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3598: undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   drivers/net/phy/phylink.c:1576: undefined reference to `netif_carrier_on'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1578: undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1578: undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1578: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1578: undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1578: undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   drivers/net/phy/phylink.c:3189: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3224: undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3247: undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   drivers/net/phy/phylink.c:2493: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2498: undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_capabilities':
   drivers/net/phy/phylink.c:437: undefined reference to `phy_caps_from_interface'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   drivers/net/phy/phylink.c:1590: undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1596: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   drivers/net/phy/phylink.c:2607: undefined reference to `rtnl_is_locked'
>> aarch64-linux-ld: drivers/net/phy/phylink.c:2585: undefined reference to `phy_may_wakeup'
>> aarch64-linux-ld: drivers/net/phy/phylink.c:3595: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3598: undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2626: undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   drivers/net/phy/phylink.c:1970: undefined reference to `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   drivers/net/phy/phylink.c:869: undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   drivers/net/phy/phylink.c:3151: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3154: undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   drivers/net/phy/phylink.c:869: undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   include/linux/mdio.h:629: undefined reference to `mdiobus_read'
   aarch64-linux-ld: include/linux/mdio.h:629: undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   drivers/net/phy/phylink.c:546: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:534: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   drivers/net/phy/phylink.c:1332: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1340: undefined reference to `phy_config_inband'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1319: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1277: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1306: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1342: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:1253: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   drivers/net/phy/phylink.c:2425: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2427: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2433: undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2473: undefined reference to `phy_start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   drivers/net/phy/phylink.c:2677: undefined reference to `rtnl_is_locked'
>> aarch64-linux-ld: drivers/net/phy/phylink.c:2585: undefined reference to `phy_may_wakeup'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3618: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3621: undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   drivers/net/phy/phylink.c:593: undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   drivers/net/phy/phylink.c:2054: undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2033: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2021: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:3524: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3547: undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3408: undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3449: undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3412: undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3453: undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3382: undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3424: undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   drivers/net/phy/phylink.c:2906: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2909: undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   drivers/net/phy/phylink.c:2091: undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2100: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2111: undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2112: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2175: undefined reference to `phy_eee_tx_clock_stop_capable'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2188: undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2181: undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2158: undefined reference to `phy_disable_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2141: undefined reference to `phy_support_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   drivers/net/phy/phylink.c:2209: undefined reference to `phy_attach_direct'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2243: undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_fwnode_phy_connect.part.0':
   drivers/net/phy/phylink.c:2293: undefined reference to `fwnode_get_phy_node'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2300: undefined reference to `fwnode_phy_find_device'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2315: undefined reference to `phy_attach_direct'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2317: undefined reference to `phy_device_free'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2323: undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   drivers/net/phy/phylink.c:740: undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: drivers/net/phy/phylink.c:711: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:731: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:757: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:707: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   drivers/net/phy/phylink.c:833: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o:drivers/net/phy/phylink.c:789: more undefined references to `netdev_printk' follow
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_create.part.0':
   drivers/net/phy/phylink.c:1863: undefined reference to `netif_carrier_off'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   drivers/net/phy/phylink.c:2978: undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3005: undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3019: undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: drivers/net/phy/phylink.c:2815: undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.c:3083: undefined reference to `netdev_printk'
   aarch64-linux-ld: lib/decompress_unlz4.o: in function `unlz4':
   lib/decompress_unlz4.c:165: undefined reference to `LZ4_decompress_safe'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
