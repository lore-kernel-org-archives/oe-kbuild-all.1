Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DAF637
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 02:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683772196; x=1715308196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rULD72M4X9v88P55meXH06sDbKrMl4gJOhzMwHjNGnA=;
  b=G02+b4CO6Haj3YMYEbTl3eYA7gV1eMTK/gILfc9hPgPJbce/L8DrYzAF
   tEgXcSLZvAgHFobRMju+ykw85kHSBez4407umWIa+IEQRnVNNVrnChHNt
   Mcaz6MXeDJJTKltIpaNe2HbJnpTxeodsGXFEOTxFrUVIBcaWwkckH0kFb
   DD+0AHq48rAXKXVeLTWlBTrFYLcBksc9KVQefJzCraWOpHDZ/dU3I2gP+
   lnTcp5SHEWhGM2IJcTMm8ALGmOyJiNT7GR3L2CokmZMM+mr3katiHFSXY
   AaHzBxY/Pme+Lqh5OuK391ztX8yZlIxP+bycMFkY0C7JlGH0Fn2gq28SD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="352578341"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="352578341"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 19:29:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="873771986"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="873771986"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 May 2023 19:29:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pww3y-0003iK-2K;
	Thu, 11 May 2023 02:29:50 +0000
Date: Thu, 11 May 2023 10:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2601/10437] phylink.c:undefined
 reference to `linkmode_resolve_pause'
Message-ID: <202305111046.2RGWrbdT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chanho,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   119cead9cfbf00ef40fc675deb12cdb9f240dced
commit: 9c2efcb127bb2168f3f523892a41b969ee3070ce [2601/10437] ANDROID: GKI: Kconfig.gki: Add GKI_HIDDEN_ETHERNET_CONFIGS
config: arm64-randconfig-r034-20230509 (https://download.01.org/0day-ci/archive/20230511/202305111046.2RGWrbdT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 9c2efcb127bb2168f3f523892a41b969ee3070ce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305111046.2RGWrbdT-lkp@intel.com/

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
   aarch64-linux-ld: phylink.c:(.text+0x3298): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x3980): undefined reference to `netdev_printk'
>> aarch64-linux-ld: phylink.c:(.text+0x3a0c): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x3b74): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3d78): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
>> phylink.c:(.text+0x3eac): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x3fd8): undefined reference to `netdev_printk'
>> aarch64-linux-ld: phylink.c:(.text+0x40cc): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x41ec): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x43b8): undefined reference to `__dynamic_netdev_dbg'
>> aarch64-linux-ld: phylink.c:(.text+0x43f8): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
>> phylink.c:(.text+0x4de4): undefined reference to `phy_attach_direct'
>> aarch64-linux-ld: phylink.c:(.text+0x4e34): undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
>> phylink.c:(.text+0x4f94): undefined reference to `rtnl_is_locked'
>> aarch64-linux-ld: phylink.c:(.text+0x5044): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mac_change':
   phylink.c:(.text+0x5150): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x5240): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x536c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x5390): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x5730): undefined reference to `phy_start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x5900): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5960): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x5a84): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5b40): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x5b70): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5bd4): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x5c60): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5cc8): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x5e6c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5ed0): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x6084): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x6434): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x6494): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x64dc): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x6620): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x6828): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x6940): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x69b0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x6a10): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x6a6c): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x6aa0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x6b04): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x6b38): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x6b9c): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x6c2c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x6db0): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x6fc0): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x70a4): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x7250): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x72e8): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x7304): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x7394): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x7660): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x7678): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   phylink.c:(.text+0x7928): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x7948): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x7964): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x7a10): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x7aac): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x7ac4): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x7b48): undefined reference to `mdiobus_read'
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
