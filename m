Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859E14A81
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 17:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683739305; x=1715275305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WTRpkUaxs4uiSPQxPVTwKUEIcBoEw5I+LE88CUTAyaM=;
  b=kIGld7gDEPivX4aRDwwmns0uousYMaNoY/z9fuwwRKK7rOBf3+rHfw7b
   wiKERYIc3m1u4JlRcL09IEgafo70vwkEsQoxdy80pMReoKudiTN8H62ku
   aybgXA6pV9y8KnJoCcSfCc4jo5sQvixiBREFFUewHxRnjPf3k4ReF0yWJ
   xHHa9KDM3oQLoM6pf8I1tePRJRepAub9CFzoxaUQjYWQ4OP21Ni4hAiB1
   JxTRWt0wS3MhBNX0dXYZDu3BRdW14UKN7FXt4FCaGFQFLfSJep6RIRWrd
   hbNNJdg/HB4jhd0nFrjGXAQzu3Mr7NURk50U1fvDbe+nhli1dBHNY4NMD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="330633084"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="330633084"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 10:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="730018073"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="730018073"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 May 2023 10:21:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwnVU-0003Se-04;
	Wed, 10 May 2023 17:21:40 +0000
Date: Thu, 11 May 2023 01:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Chanho Park <chanho61.park@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Subject: [sudeep-holla:android13-5.10/ffa 2111/9999] phylink.c:undefined
 reference to `linkmode_resolve_pause'
Message-ID: <202305110100.JyLnU4Kw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: 36ab8cea47b0d4a3c5067577430c147a903b5261 [2111/9999] ANDROID: GKI: Kconfig.gki: Add GKI_HIDDEN_ETHERNET_CONFIGS
config: arm64-randconfig-r034-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110100.JyLnU4Kw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/commit/?id=36ab8cea47b0d4a3c5067577430c147a903b5261
        git remote add sudeep-holla https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git
        git fetch --no-tags sudeep-holla android13-5.10/ffa
        git checkout 36ab8cea47b0d4a3c5067577430c147a903b5261
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110100.JyLnU4Kw-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
>> phylink.c:(.text+0x4c0): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x71c): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mac_config':
>> phylink.c:(.text+0x95c): undefined reference to `phy_speed_to_str'
>> aarch64-linux-ld: phylink.c:(.text+0x988): undefined reference to `phy_duplex_to_str'
>> aarch64-linux-ld: phylink.c:(.text+0xa28): undefined reference to `__dynamic_netdev_dbg'
>> aarch64-linux-ld: phylink.c:(.text+0xb7c): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0xba8): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
>> phylink.c:(.text+0xc90): undefined reference to `netif_carrier_off'
>> aarch64-linux-ld: phylink.c:(.text+0xdb4): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
>> phylink.c:(.text+0xf54): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
>> phylink.c:(.text+0x1234): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: phylink.c:(.text+0x1370): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x15e0): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_change_inband_advert.isra.0':
   phylink.c:(.text+0x1c78): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
>> phylink.c:(.text+0x1ff8): undefined reference to `phy_get_pause'
   aarch64-linux-ld: phylink.c:(.text+0x2290): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x22c4): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x22e0): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: phylink.c:(.text+0x23cc): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2400): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
>> phylink.c:(.text+0x2b84): undefined reference to `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0x2bf4): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2c04): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2c5c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2c94): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2ca4): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
>> phylink.c:(.text+0x3064): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3250): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x3928): undefined reference to `netdev_printk'
>> aarch64-linux-ld: phylink.c:(.text+0x39b4): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x3b1c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3d20): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
>> phylink.c:(.text+0x3e54): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x3f80): undefined reference to `netdev_printk'
>> aarch64-linux-ld: phylink.c:(.text+0x4074): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x4194): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x4360): undefined reference to `__dynamic_netdev_dbg'
>> aarch64-linux-ld: phylink.c:(.text+0x43a0): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
>> phylink.c:(.text+0x4d8c): undefined reference to `phy_attach_direct'
>> aarch64-linux-ld: phylink.c:(.text+0x4ddc): undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
>> phylink.c:(.text+0x4f3c): undefined reference to `rtnl_is_locked'
>> aarch64-linux-ld: phylink.c:(.text+0x4fec): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mac_change':
   phylink.c:(.text+0x50f8): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x51e8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5314): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x5338): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x56d8): undefined reference to `phy_start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x58a8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5908): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x5a2c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5ae8): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x5b18): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5b7c): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x5c08): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5c70): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x5e14): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5e78): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x602c): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x63dc): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x643c): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x6484): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x65c8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x67d0): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x68e8): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x6958): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x69b8): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x6a14): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x6a48): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x6aac): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x6ae0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x6b44): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x6bd4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x6d58): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x6f68): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x704c): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x71f8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x7290): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x72ac): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x733c): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x7608): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x7620): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   phylink.c:(.text+0x78d0): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x78f0): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x790c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x79b8): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x7a54): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x7a6c): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x7af0): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   rt9455_charger.c:(.text+0x1ba0): undefined reference to `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0x22c4): undefined reference to `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
