Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224B51CD29
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 00:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725927556; cv=none; b=s5PpKzbEQJ7oB4+dP2jKQHdaZZHEV2jc4dcR+gol8lUN5dFZ3DZl9E2lsp+59TDTnkHdWfvFRz0Xu//qYCyCctjcHtlbFY15b05JXOTTLBc1+nTZuct3TjmrxVH6wGP0On0D6HUYtjgOgSr5nn9elTuhlyXuSjHtcees/Nx60U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725927556; c=relaxed/simple;
	bh=AC24r+5iLKC8H+bQ608lCLeQ5TKaS9MgpZGwnaufGD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YzgmexMTIynv4xWkyKFbLeE+kvGsoab3pnOXVYtr8Kx4PE4vPZBHBcytA7vKzecdKOUIiJp6y3Dm0lmjM379Ja/A4NWKF+3U9beGebmEk6eDGXCpJNy5Xx5yWJYbAmXAt9bjcXdy5J34zBiHsZPgtZy+PHjisbS9vDu208ylPK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPCyOAXh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPCyOAXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725927554; x=1757463554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AC24r+5iLKC8H+bQ608lCLeQ5TKaS9MgpZGwnaufGD4=;
  b=aPCyOAXhm5kr1PufDjZFSVO9cmtdOorYD19D7xww6dYNRT25Iy+kbt2N
   Mi4PlqjU4P+cKfzzs8BE2O2RiDq84C4cHR7XJsCoMJkbwydOge9hkshPe
   wP9HSipMkb7X1dtqKaL8HxojT5pi5jzJvlrHdHopT8qMWutXBOFsqoJfr
   4p1gEu4M/errXi0gUkHlc+vzLZrRdGxnyb+YrQjO4rSdmobQGan2Eklg0
   tjbciWEDA6sSLlNmv+d6Kgi2EQZPbu/dbXOG4gj987j1DTQibsNnAXkFU
   uCgOmjeCFh5CZsgAI+69sTeGimYeHzVSNfpIJt57rI8CyFFoOVKeKFcof
   Q==;
X-CSE-ConnectionGUID: zkTyuzACTaOVu/rCQv896Q==
X-CSE-MsgGUID: UJSFlTZOQqqZ4s/LdD283w==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24762661"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24762661"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 17:19:11 -0700
X-CSE-ConnectionGUID: StCHeyZtT0m7ai55Am+ycQ==
X-CSE-MsgGUID: HvKOk6KqSIadRfwscIt8VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="67131178"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2024 17:19:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snob5-000FNd-2a;
	Tue, 10 Sep 2024 00:19:07 +0000
Date: Tue, 10 Sep 2024 08:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 3/3] ld: v4l2-mem2mem.c:undefined
 reference to `vb2_prepare_buf'
Message-ID: <202409100834.ZCXsEJDk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   2c00661c3fd09957c17ac18651c4cda4990dd174
commit: 6def3a5ed8ee24465edf6b30cdbe4b27c6d4e1df [3/3] BACKPORT: media: v4l2-mem2mem: Apply DST_QUEUE_OFF_BASE on MMAP buffers across ioctls
config: x86_64-buildonly-randconfig-005-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100834.ZCXsEJDk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100834.ZCXsEJDk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100834.ZCXsEJDk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: phylink.c:(.text+0x907): undefined reference to `linkmode_set_pause'
   ld: phylink.c:(.text+0x95e): undefined reference to `phy_set_asym_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   phylink.c:(.text+0xa34): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0xa4f): undefined reference to `mdiobus_write'
   ld: phylink.c:(.text+0xa6d): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0xad3): undefined reference to `mdiobus_modify'
   ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0xb78): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0xbf8): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0xc0a): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0xe41): undefined reference to `phy_get_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0xf08): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0xf24): undefined reference to `netif_carrier_off'
   ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
   phylink.c:(.text+0x142b): undefined reference to `netif_carrier_on'
   ld: phylink.c:(.text+0x1452): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x145a): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x1691): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x169c): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x16bf): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x16fd): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x170e): undefined reference to `phy_ethtool_ksettings_get'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x17b1): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x188a): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x1a8e): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x1a9e): undefined reference to `phy_restart_aneg'
   ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x1b4a): undefined reference to `phy_support_asym_pause'
   ld: phylink.c:(.text+0x1c2e): undefined reference to `phy_attached_info_irq'
   ld: phylink.c:(.text+0x1d06): undefined reference to `phy_request_interrupt'
   ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x1d6a): undefined reference to `phy_attach_direct'
   ld: phylink.c:(.text+0x1da0): undefined reference to `phy_detach'
   ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x1f53): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x2602): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x2613): undefined reference to `phy_ethtool_ksettings_set'
   ld: phylink.c:(.text+0x26f2): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x30c): undefined reference to `phy_disconnect'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x349): undefined reference to `phy_ethtool_get_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x371): undefined reference to `phy_ethtool_set_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x399): undefined reference to `phy_get_eee_err'
   ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x3c3): undefined reference to `phy_init_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x3f1): undefined reference to `phy_ethtool_get_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x421): undefined reference to `phy_ethtool_set_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x467): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x637): undefined reference to `phy_speed_up'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x670): undefined reference to `phy_speed_down'
   ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0xf82): undefined reference to `phy_start'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x17f3): undefined reference to `phy_mii_ioctl'
   ld: phylink.c:(.text+0x192b): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_major_config.cold':
   phylink.c:(.text.unlikely+0x49): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_start.cold':
   phylink.c:(.text.unlikely+0x93): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy.cold':
   phylink.c:(.text.unlikely+0xee): undefined reference to `netdev_printk'
   ld: phylink.c:(.text.unlikely+0x13a): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink.cold':
   phylink.c:(.text.unlikely+0x172): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o:phylink.c:(.text.unlikely+0x1ad): more undefined references to `netdev_printk' follow
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_poll':
   v4l2-mem2mem.c:(.text+0xd69): undefined reference to `video_devdata'
   ld: v4l2-mem2mem.c:(.text+0xdc3): undefined reference to `v4l2_event_pending'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ctx_release':
   v4l2-mem2mem.c:(.text+0x10e3): undefined reference to `vb2_queue_release'
   ld: v4l2-mem2mem.c:(.text+0x10ef): undefined reference to `vb2_queue_release'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_reqbufs':
   v4l2-mem2mem.c:(.text+0x1660): undefined reference to `vb2_reqbufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_querybuf':
   v4l2-mem2mem.c:(.text+0x16c2): undefined reference to `vb2_querybuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_reqbufs':
   v4l2-mem2mem.c:(.text+0x173e): undefined reference to `vb2_reqbufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_querybuf':
   v4l2-mem2mem.c:(.text+0x17ad): undefined reference to `vb2_querybuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_dqbuf':
   v4l2-mem2mem.c:(.text+0x182b): undefined reference to `vb2_dqbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   v4l2-mem2mem.c:(.text+0x1892): undefined reference to `video_devdata'
>> ld: v4l2-mem2mem.c:(.text+0x18c2): undefined reference to `vb2_prepare_buf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamoff':
   v4l2-mem2mem.c:(.text+0x1a2d): undefined reference to `vb2_streamoff'
   ld: v4l2-mem2mem.c:(.text+0x1a52): undefined reference to `vb2_streamoff'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamon':
   v4l2-mem2mem.c:(.text+0x2276): undefined reference to `vb2_streamon'
   ld: v4l2-mem2mem.c:(.text+0x228c): undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_streamon':
   v4l2-mem2mem.c:(.text+0x2301): undefined reference to `vb2_streamon'
   ld: v4l2-mem2mem.c:(.text+0x2317): undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_qbuf':
   v4l2-mem2mem.c:(.text+0x2372): undefined reference to `video_devdata'
   ld: v4l2-mem2mem.c:(.text+0x23d1): undefined reference to `vb2_qbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   v4l2-mem2mem.c:(.text+0x1556): undefined reference to `vb2_create_bufs'
   ld: v4l2-mem2mem.c:(.text+0x155f): undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_expbuf':
   v4l2-mem2mem.c:(.text+0x1595): undefined reference to `vb2_expbuf'
   ld: v4l2-mem2mem.c:(.text+0x159e): undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_create_bufs':
   v4l2-mem2mem.c:(.text+0x15e1): undefined reference to `vb2_create_bufs'
   ld: v4l2-mem2mem.c:(.text+0x15ea): undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_expbuf':
   v4l2-mem2mem.c:(.text+0x1620): undefined reference to `vb2_expbuf'
   ld: v4l2-mem2mem.c:(.text+0x1629): undefined reference to `vb2_expbuf'
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   videobuf2-core.c:(.text+0x206b): undefined reference to `v4l_vb2q_enable_media_source'

Kconfig warnings: (for reference only)
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
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
