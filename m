Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B26022576E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994140; cv=none; b=FuknNbDls5C1JKDQlQ+deeMtuOgMLqwcL8CYxr0Im96Tgk2Z19KcZoe2+i6MgjiCqv/3nsbAOybgmz7ur8mi58OHgBKQD7uv14l085KBZcivZmCx6tDxzL1jtZueojWk8yuXtR/OF6at2W30Ah2FjyH5WBtNyUm5BQbh7yN+Vxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994140; c=relaxed/simple;
	bh=Lz4hf3XEIlOvsJeL7I5vHokE/8kfv/dLZf80LIXlR6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d9hr0DmlP6tNdA6Xua0PVnc77i1SQDwrTFjIh/B7pK/5KV12a7Hwosy1Ix5RYBH7d4EmSNfWVlDJOaAM/ecWUL2K4yu54eRd5R4K8vOtGE7eatA9fGCbOEJOT+b3oZU4+amRdizJ4tlwUDXVwUa4sitlP0DxuDUk53S1aMieX4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8IH/31S; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8IH/31S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747994138; x=1779530138;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Lz4hf3XEIlOvsJeL7I5vHokE/8kfv/dLZf80LIXlR6Q=;
  b=d8IH/31SfbmNVho0xO/lmmE4LHxPUndAQsC+136TPiKPxvV3ZWVDOnMo
   juFA8XHJpbdfqzH/c5xihB6KSvkJfyjPzsEPR9kRJakmuWWC7ke+QIRFd
   i5iNsKx947dsmh4JkdqbUrMJD8xAK3x2O+kDGuBu76ev55yaARJdpOROS
   Q3Ae4vsOr9kAuHQVItcQiGC1QzCUL6UAklPFM3LN9GnwGruAPEVIRnrP4
   /x5DBsFLUcyrm6YxSokJjwVj25rChzyB3hDDlrhe3YPGZETN2sK/SDNle
   tdLFjUhGPKBLvyqXLB9MMq0KBtglJoHKoNHfitQG96XsK+88VtGaRyd4F
   g==;
X-CSE-ConnectionGUID: osLSMN5XTFiR3eiTb444Ew==
X-CSE-MsgGUID: z7Fvs4yRQeyINYqOrrkDeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="37670252"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="37670252"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:55:37 -0700
X-CSE-ConnectionGUID: 6XxKJfa+Qs6RYX9ivxHMDw==
X-CSE-MsgGUID: kNJwFmiFTwOyOz0kDuP4Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="141637306"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 May 2025 02:55:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIP7m-000QGq-0k;
	Fri, 23 May 2025 09:55:34 +0000
Date: Fri, 23 May 2025 17:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 3/3]
 drivers/tty/hvc/hvc_console.c:1008: undefined reference to `tty_vhangup'
Message-ID: <202505232057.vlnY6geu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   b168489c8a6bc37bac898a99559b86cd507332a4
commit: 66942fe0c9148cf125a25aeb6961b2bb690f6d8e [3/3] Merge 8c94ccc7cd69 ("Merge tag 'usb-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb") into android-mainline
config: arm-randconfig-r051-20250522 (https://download.01.org/0day-ci/archive/20250523/202505232057.vlnY6geu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505232057.vlnY6geu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505232057.vlnY6geu-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   drivers/tty/hvc/hvc_console.c:572: undefined reference to `tty_port_tty_get'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.c:580: undefined reference to `tty_do_resize'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   drivers/tty/hvc/hvc_console.c:464: undefined reference to `tty_port_tty_set'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   drivers/tty/hvc/hvc_console.c:982: undefined reference to `tty_port_tty_get'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.c:1002: undefined reference to `tty_port_put'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   drivers/tty/hvc/hvc_console.c:661: undefined reference to `tty_port_tty_get'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.c:677: undefined reference to `tty_buffer_request_room'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.c:690: undefined reference to `tty_hangup'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `tty_insert_flip_char':
   include/linux/tty_flip.h:77: undefined reference to `__tty_insert_flip_string_flags'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   drivers/tty/hvc/hvc_console.c:745: undefined reference to `tty_wakeup'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.c:755: undefined reference to `tty_flip_buffer_push'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_init':
   drivers/tty/hvc/hvc_console.c:1021: undefined reference to `__tty_alloc_driver'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.c:1045: undefined reference to `tty_register_driver'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.c:1063: undefined reference to `tty_driver_kref_put'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   drivers/tty/hvc/hvc_console.c:934: undefined reference to `tty_port_init'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.c:974: undefined reference to `tty_std_termios'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   drivers/tty/hvc/hvc_console.c:298: undefined reference to `tty_port_put'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   drivers/tty/hvc/hvc_console.c:337: undefined reference to `tty_port_install'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.c:339: undefined reference to `tty_port_put'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   drivers/tty/hvc/hvc_console.c:394: undefined reference to `tty_hung_up_p'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.c:402: undefined reference to `tty_port_tty_set'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.c:422: undefined reference to `tty_wait_until_sent'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   drivers/tty/hvc/hvc_console.c:362: undefined reference to `tty_port_tty_set'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   drivers/tty/hvc/hvc_console.c:436: undefined reference to `tty_port_put'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
>> drivers/tty/hvc/hvc_console.c:1008: undefined reference to `tty_vhangup'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_changed':
   drivers/net/phy/phylink.c:2083: undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   drivers/net/phy/phylink.c:1429: undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   drivers/net/phy/phylink.c:3770: undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_read':
   include/linux/mdio.h:596: undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   drivers/net/phy/phylink.c:2818: undefined reference to `swphy_read_reg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   drivers/net/phy/phylink.c:3719: undefined reference to `mdiobus_modify_changed'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_modify':
   include/linux/mdio.h:608: undefined reference to `mdiobus_modify'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   drivers/net/phy/phylink.c:970: undefined reference to `linkmode_resolve_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_change_inband_advert':
   drivers/net/phy/phylink.c:1253: undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   drivers/net/phy/phylink.c:673: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   drivers/net/phy/phylink.c:1756: undefined reference to `phy_get_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1773: undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1773: undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1773: undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1773: undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1773: undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1773: undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1773: undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   drivers/net/phy/phylink.c:2629: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   drivers/net/phy/phylink.c:2062: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   drivers/net/phy/phylink.c:2321: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   drivers/net/phy/phylink.c:2346: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   drivers/net/phy/phylink.c:2611: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2614: undefined reference to `phy_restart_aneg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   drivers/net/phy/phylink.c:2649: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2684: undefined reference to `linkmode_set_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2707: undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   drivers/net/phy/phylink.c:2737: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   drivers/net/phy/phylink.c:2773: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   drivers/net/phy/phylink.c:2791: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   drivers/net/phy/phylink.c:3048: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   drivers/net/phy/phylink.c:3071: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o:drivers/net/phy/phylink.c:2209: more undefined references to `rtnl_is_locked' follow
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   drivers/net/phy/phylink.c:2214: undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   drivers/net/phy/phylink.c:2245: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2259: undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_read':
   include/linux/mdio.h:596: undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: include/linux/mdio.h:596: undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   drivers/net/phy/phylink.c:1152: undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1161: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1176: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mac_config':
   drivers/net/phy/phylink.c:1057: undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1057: undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1057: undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   drivers/net/phy/phylink.c:1214: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1226: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   drivers/net/phy/phylink.c:2141: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2143: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2149: undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   drivers/net/phy/phylink.c:2282: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:2977: undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_read':
   drivers/net/phy/phylink.c:2835: undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2861: undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2865: undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_write':
   drivers/net/phy/phylink.c:2877: undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2902: undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2906: undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:3000: undefined reference to `phy_mii_ioctl'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_up':
   drivers/net/phy/phylink.c:1415: undefined reference to `netif_carrier_on'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1417: undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1417: undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1417: undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1417: undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1417: undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +1008 drivers/tty/hvc/hvc_console.c

^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16   976  
7f30c19caf94b9 drivers/tty/hvc/hvc_console.c Uwe Kleine-König       2023-11-05   977  void hvc_remove(struct hvc_struct *hp)
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16   978  {
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16   979  	unsigned long flags;
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16   980  	struct tty_struct *tty;
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16   981  
85bbc003b24335 drivers/tty/hvc/hvc_console.c Jiri Slaby             2012-04-02   982  	tty = tty_port_tty_get(&hp->port);
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16   983  
19fa6e601b251f drivers/tty/hvc/hvc_console.c Denis Kirjanov         2017-03-30   984  	console_lock();
85bbc003b24335 drivers/tty/hvc/hvc_console.c Jiri Slaby             2012-04-02   985  	spin_lock_irqsave(&hp->lock, flags);
92057a493af4bb drivers/tty/hvc/hvc_console.c Benjamin Herrenschmidt 2012-07-23   986  	if (hp->index < MAX_NR_HVC_CONSOLES) {
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16   987  		vtermnos[hp->index] = -1;
92057a493af4bb drivers/tty/hvc/hvc_console.c Benjamin Herrenschmidt 2012-07-23   988  		cons_ops[hp->index] = NULL;
92057a493af4bb drivers/tty/hvc/hvc_console.c Benjamin Herrenschmidt 2012-07-23   989  	}
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16   990  
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16   991  	/* Don't whack hp->irq because tty_hangup() will need to free the irq. */
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16   992  
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16   993  	spin_unlock_irqrestore(&hp->lock, flags);
19fa6e601b251f drivers/tty/hvc/hvc_console.c Denis Kirjanov         2017-03-30   994  	console_unlock();
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16   995  
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16   996  	/*
12b20ded6f980d drivers/char/hvc_console.c    Greg Kroah-Hartman     2007-11-28   997  	 * We 'put' the instance that was grabbed when the kref instance
12b20ded6f980d drivers/char/hvc_console.c    Greg Kroah-Hartman     2007-11-28   998  	 * was initialized using kref_init().  Let the last holder of this
e74d098c66543d drivers/char/hvc_console.c    Amit Shah              2010-03-12   999  	 * kref cause it to be removed, which will probably be the tty_vhangup
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16  1000  	 * below.
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16  1001  	 */
f3d9f25097b62e drivers/tty/hvc/hvc_console.c Jiri Slaby             2012-04-02  1002  	tty_port_put(&hp->port);
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16  1003  
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16  1004  	/*
e74d098c66543d drivers/char/hvc_console.c    Amit Shah              2010-03-12  1005  	 * This function call will auto chain call hvc_hangup.
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16  1006  	 */
e74d098c66543d drivers/char/hvc_console.c    Amit Shah              2010-03-12  1007  	if (tty) {
e74d098c66543d drivers/char/hvc_console.c    Amit Shah              2010-03-12 @1008  		tty_vhangup(tty);
e74d098c66543d drivers/char/hvc_console.c    Amit Shah              2010-03-12  1009  		tty_kref_put(tty);
e74d098c66543d drivers/char/hvc_console.c    Amit Shah              2010-03-12  1010  	}
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16  1011  }
c0cefebc0b6ae1 drivers/char/hvc_console.c    Amit Shah              2009-11-27  1012  EXPORT_SYMBOL_GPL(hvc_remove);
^1da177e4c3f41 drivers/char/hvc_console.c    Linus Torvalds         2005-04-16  1013  

:::::: The code at line 1008 was first introduced by commit
:::::: e74d098c66543d0731de62eb747ccd5b636a6f4c hvc_console: Fix race between hvc_close and hvc_remove

:::::: TO: Amit Shah <amit.shah@redhat.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
