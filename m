Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648F44F8BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 03:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726110571; cv=none; b=uBKPOK+DqpfkdZd251tBOzsBkxVLjJsQP4r7VZ5sDjIzVdnp6t7Y8tVq7CEsRhZnS7EfQogu5UWYgptnEp/esz3AZfK7ALzTijsGH2aCRcTtpFsSFZqsUmXdz9Jlxjt3eRIHKkW56sRvDQI0nnjvg8F5l1oElQKcg894kp+4UFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726110571; c=relaxed/simple;
	bh=xWwl2yGv/5soPVP2dk1tDBfCAmCDU5LbtgauLTA5oKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KLdBDX+wf1MdZPjKBuQVDGW7RcTbKgZ9vub6EWnuM1iZPAdeT6i+V/wTfM19pZJc1Jeccw6ed53esd72iu8OiflB0fxbK2Uh7Vw4EwfTUDetr9bqQXgLgpNeCFDH35e6W6g0ZooKOs8yPzolIbSz5iVCPV0d79iOWnNe9Mc5KYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hg6nb5hy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hg6nb5hy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726110570; x=1757646570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xWwl2yGv/5soPVP2dk1tDBfCAmCDU5LbtgauLTA5oKs=;
  b=hg6nb5hyqDttZ1PQNxH7gOR8VfT8gUWY1p9kisn45XTudYCJ4P1bMKJN
   wzyikzEXI784WFPYDT9v6SLD/1hGguM7doZRNPTM+DFVIK97LJqiAnUfp
   zX5cTnCy4abgZklPZEGq/NwY6GLp9Mw9fosx3wmOQ6z5JjDfI4XLpTqhM
   je+Fh+qvHTYzzGYCNbeRCjRRvD1VIzR06vYZof7yECT86nzctpA8nF68z
   C8KTLo9IBrANbA7LjjjEE28FkVAy4myr5GWogBdlhaGwQreEhw5HqeX4V
   kIStRhe0ET3FaNFHJoVt3Pu6ctNk4kBSzfUQmuXZkQf3dVz4hcuEJYAPk
   g==;
X-CSE-ConnectionGUID: 64fAfVQbTxq4RORZXpqGVA==
X-CSE-MsgGUID: 6u7gJecdRROihIMctBOtYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24877651"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="24877651"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 20:09:29 -0700
X-CSE-ConnectionGUID: 1JfKmYlRQw2P9JgwE69u8w==
X-CSE-MsgGUID: qfnCP7GvTp+E9ank3PWZBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="67804799"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2024 20:09:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soaCz-0004Qo-1h;
	Thu, 12 Sep 2024 03:09:25 +0000
Date: Thu, 12 Sep 2024 11:09:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 3/6] phy-rtk-usb3.c:undefined
 reference to `usb_debug_root'
Message-ID: <202409121028.CdRS24Sc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   3547af4e0e2c12d5a4ff98c0f0a643e6aa8847f7
commit: 6e97af079d7960bc7b60265e233f04ec8e218f98 [3/6] FROMGIT: phy: realtek: usb: Add driver for the Realtek SoC USB 3.0 PHY
config: i386-buildonly-randconfig-003-20240912 (https://download.01.org/0day-ci/archive/20240912/202409121028.CdRS24Sc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409121028.CdRS24Sc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409121028.CdRS24Sc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/phy/realtek/phy-rtk-usb3.o: in function `rtk_usb3phy_probe':
>> phy-rtk-usb3.c:(.text+0x4e7): undefined reference to `usb_debug_root'
>> ld: phy-rtk-usb3.c:(.text+0x582): undefined reference to `usb_debug_root'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x1ba): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x211): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x242): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x34e): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x3ba): undefined reference to `tty_hung_up_p'
   ld: hvc_console.c:(.text+0x41c): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x476): undefined reference to `tty_wait_until_sent'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x4f8): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x538): undefined reference to `tty_buffer_request_room'
   ld: hvc_console.c:(.text+0x587): undefined reference to `__tty_insert_flip_char'
   ld: hvc_console.c:(.text+0x6ae): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x700): undefined reference to `tty_wakeup'
   ld: hvc_console.c:(.text+0x740): undefined reference to `tty_flip_buffer_push'
   ld: hvc_console.c:(.text+0x757): undefined reference to `tty_hangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0xa0f): undefined reference to `tty_port_install'
   ld: hvc_console.c:(.text+0xa33): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0xa99): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0xfa1): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0x1047): undefined reference to `__tty_alloc_driver'
   ld: hvc_console.c:(.text+0x107e): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0x10d8): undefined reference to `tty_register_driver'
   ld: hvc_console.c:(.text+0x113b): undefined reference to `tty_port_init'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x1308): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x134b): undefined reference to `tty_port_put'
   ld: hvc_console.c:(.text+0x1356): undefined reference to `tty_vhangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc.cold':
   hvc_console.c:(.text.unlikely+0x57): undefined reference to `tty_driver_kref_put'
   ld: hvc_console.c:(.text.unlikely+0x91): undefined reference to `tty_driver_kref_put'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0x8f): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x29b): undefined reference to `swphy_read_reg'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x4e6): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x4f0): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x53c): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x546): undefined reference to `phy_speed_to_str'
   ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x69e): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x91e): undefined reference to `phy_support_asym_pause'
   ld: phylink.c:(.text+0xa14): undefined reference to `phy_attached_info_irq'
   ld: phylink.c:(.text+0xad5): undefined reference to `phy_request_interrupt'
   ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0xc68): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x126f): undefined reference to `phy_get_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x1933): undefined reference to `phy_attach_direct'
   ld: phylink.c:(.text+0x1983): undefined reference to `phy_detach'
   ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x1a94): undefined reference to `phy_disconnect'
   ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x1b82): undefined reference to `phy_start'
   ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x1cac): undefined reference to `phy_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x1f31): undefined reference to `phy_ethtool_get_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x1fa3): undefined reference to `phy_ethtool_set_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x2046): undefined reference to `phy_ethtool_ksettings_get'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x217c): undefined reference to `phy_ethtool_ksettings_set'
   ld: phylink.c:(.text+0x21f1): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x24d1): undefined reference to `phy_restart_aneg'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x2645): undefined reference to `linkmode_set_pause'
   ld: phylink.c:(.text+0x269d): undefined reference to `phy_set_asym_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x2780): undefined reference to `phy_get_eee_err'
   ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x27de): undefined reference to `phy_init_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x2813): undefined reference to `phy_ethtool_get_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x2893): undefined reference to `phy_ethtool_set_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x2943): undefined reference to `phy_mii_ioctl'
   ld: phylink.c:(.text+0x2a09): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x2a8c): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x2cdd): undefined reference to `phy_speed_down'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x2d6a): undefined reference to `phy_speed_up'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x2ec8): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x2ed9): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
