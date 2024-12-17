Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A564A17BEA2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 20:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734465875; cv=none; b=eMH8npqoEUrlTO0d/JhPv5LPTwu6VrRSfK+rtxV7XHLneBP+hpx0Afjdf8qOYauJiNae50H5f6od/WI699HMldy4mbcUyT3RXubEm1Y/P/g3ebj1P1fbDQHYKCysPhgSN1q11hCQyAdVy081DogoLNJfKC2ftSjNC3sPuUy5520=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734465875; c=relaxed/simple;
	bh=G9d1hRW5T5Et32nH+thE+gQ/UfH/bziz0vUYWD01URc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oemlcOOEIV6Wved6A6h5NBvAH25BR6R9IobTabjdhXryNeK3utDlAyxjYKLD1Hg1j2YuEi+NIBjRUuJiTcPmX7g76uVt9wSdn7Ndx+iITniJyzC4bAl+ZlWWJBv/TOXzMr4hf3D0NlQc09TqhmqRnm7g73sXAYbAjbzPH8adwcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H72sXaol; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H72sXaol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734465872; x=1766001872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G9d1hRW5T5Et32nH+thE+gQ/UfH/bziz0vUYWD01URc=;
  b=H72sXaolXd4mwhqK029ZoLp1rBl/2sioSQfQjDrNtZxk58pqj6U8qfzf
   FX95YTZOUhg5QwhWS0YL23La4L7PQzrcSRgjmYeM/QKg3uEdVH+RXnzew
   QXgC1jf9bHee/MTAeJhRBqpYS+/j3lxfP6GmTWoEPv8vBLcIyXQnUWREP
   1FmPNe1l3KbbYLNG2QqxZG2wst4aodNRX6bSzqk+WMayj/nnuHu3Llv4c
   X+PLpQapXGTdbR+/Gni/l2NsseKC1vORZ7AnnZXElDT/o8mcuTJ3M4ysN
   njAbOdUbmGd3KaSpSWCo3oZAeSfo7zHw5igGG0UCFubV0T5GD+BPQs0g3
   Q==;
X-CSE-ConnectionGUID: AA+JrN77SEmnzAi6cVItmQ==
X-CSE-MsgGUID: K05niTylTF+R71EHkMagjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="52431521"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="52431521"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 12:04:32 -0800
X-CSE-ConnectionGUID: Dlw6Go29T3+DZHxkigKt6Q==
X-CSE-MsgGUID: M6Y6mMCTQfKdRAGiVfxusw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="102640070"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Dec 2024 12:04:31 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNdnw-000Fli-27;
	Tue, 17 Dec 2024 20:04:28 +0000
Date: Wed, 18 Dec 2024 04:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2023-02 2/4]
 arch/arm64/mm/dma-mapping-noalias.c:550:6: warning: no previous prototype
 for 'arm64_noalias_setup_dma_ops'
Message-ID: <202412180319.hAUIokxu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2023-02
head:   11518ebf9bcc5beef148d8016900a407ea88dbda
commit: 3c75a6fb7fd1cd149d7af1a2e200b064a2d12782 [2/4] ANDROID: arm64: Work around Cortex-A510 erratum 2454944
config: arm64-randconfig-004-20241218 (https://download.01.org/0day-ci/archive/20241218/202412180319.hAUIokxu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412180319.hAUIokxu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412180319.hAUIokxu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0xf0): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mac_config':
   phylink.c:(.text+0x290): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x29c): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x330): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x33c): undefined reference to `phy_duplex_to_str'
>> aarch64-linux-ld: phylink.c:(.text+0x38c): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x40c): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x460): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x5ac): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x84c): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: phylink.c:(.text+0x884): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x8a4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x8e8): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x998): undefined reference to `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0x9d0): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x9e0): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0xa24): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0xa30): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0xa68): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_change_inband_advert.isra.0':
   phylink.c:(.text+0xc3c): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x10a0): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x1210): undefined reference to `phy_get_pause'
   aarch64-linux-ld: phylink.c:(.text+0x1314): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x1324): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x13ac): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x13bc): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x13e0): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x1468): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x14f8): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x1644): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: phylink.c:(.text+0x166c): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: phylink.c:(.text+0x16d4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1774): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x1990): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x1b38): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1b94): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1bcc): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   phylink.c:(.text+0x1e08): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1e94): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o:phylink.c:(.text+0x1f10): more undefined references to `netdev_printk' follow
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x225c): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: phylink.c:(.text+0x22a4): undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x239c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x23f0): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mac_change':
   phylink.c:(.text+0x2528): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x2560): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2584): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x2668): undefined reference to `phy_start'
   aarch64-linux-ld: phylink.c:(.text+0x2830): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x289c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x28ac): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x2988): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x29a0): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x2a0c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2a20): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x2ac4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2ad8): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x2c08): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2c1c): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x2de4): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x2f30): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x2f5c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2f70): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x3040): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x30e4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3174): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x31bc): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x329c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x32b4): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x3320): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x3360): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3374): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x33e8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x33fc): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x348c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3504): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x3584): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: phylink.c:(.text+0x3610): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x3650): undefined reference to `mdiobus_read'
--
>> arch/arm64/mm/dma-mapping-noalias.c:550:6: warning: no previous prototype for 'arm64_noalias_setup_dma_ops' [-Wmissing-prototypes]
     550 | void arm64_noalias_setup_dma_ops(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~

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
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/arm64_noalias_setup_dma_ops +550 arch/arm64/mm/dma-mapping-noalias.c

   549	
 > 550	void arm64_noalias_setup_dma_ops(struct device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
