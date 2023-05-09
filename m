Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EDD14A81
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 19:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683659852; x=1715195852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+wmHoKtQj6NUx+nqAOQgG4iGAigNxBe9B4CsdZG75UM=;
  b=Pullba20UPzwlrrM4HCc0jtzZxOMuHf1DL2A2A9h+dyOmK/p+x7OH2L5
   AQJrAwi72C2p3kKzVVpsK+qbWqrQtuYJFxGo+qGmwP1fZGSDODK33+9Yf
   AEQJCjjQrgxcPG6kEmfVz3z+sw3aQ943+kL5VkijPk63u8iz2KwR1CtkL
   cGKWC5VfFM6BDaPZqxVMyKoEc1McK2RQkq4EpoMGfsyft5Vec1tWJzY6i
   5iHQyQlnlGB2lLqB/CvV5eYQXmzxZiHFasKEvi87I1fO7vao9Xbu88heO
   1jppAEoKDbe9yKceHEznfCz/r/kMi/txZeWt6IxObB8++5tjJoGbBKyrS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="436349056"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="436349056"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 12:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="768629780"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="768629780"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 May 2023 12:17:30 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwSq1-0002QY-1c;
	Tue, 09 May 2023 19:17:29 +0000
Date: Wed, 10 May 2023 03:17:13 +0800
From: kernel test robot <lkp@intel.com>
To: Chanho Park <chanho61.park@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Subject: [sudeep-holla:android13-5.10/ffa 2111/9999] undefined reference to
 `linkmode_resolve_pause'
Message-ID: <202305100345.NKZXJDga-lkp@intel.com>
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
config: microblaze-buildonly-randconfig-r001-20230509 (https://download.01.org/0day-ci/archive/20230510/202305100345.NKZXJDga-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/commit/?id=36ab8cea47b0d4a3c5067577430c147a903b5261
        git remote add sudeep-holla https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git
        git fetch --no-tags sudeep-holla android13-5.10/ffa
        git checkout 36ab8cea47b0d4a3c5067577430c147a903b5261
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100345.NKZXJDga-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
>> (.text+0x1e0): undefined reference to `linkmode_resolve_pause'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
>> (.text+0x3a8): undefined reference to `netif_carrier_off'
>> microblaze-linux-ld: (.text+0x468): undefined reference to `netdev_printk'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_read':
>> (.text+0x638): undefined reference to `mdiobus_read'
>> microblaze-linux-ld: (.text+0x738): undefined reference to `mdiobus_read'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_write':
>> (.text+0xa20): undefined reference to `mdiobus_write'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
>> (.text+0xe64): undefined reference to `swphy_read_reg'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
>> (.text+0x1360): undefined reference to `netdev_printk'
   microblaze-linux-ld: (.text+0x13b4): undefined reference to `netdev_printk'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
>> (.text+0x147c): undefined reference to `phy_get_pause'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
>> (.text+0x16ac): undefined reference to `netif_carrier_on'
>> microblaze-linux-ld: (.text+0x1740): undefined reference to `phy_speed_to_str'
>> microblaze-linux-ld: (.text+0x174c): undefined reference to `phy_duplex_to_str'
   microblaze-linux-ld: (.text+0x17a0): undefined reference to `phy_speed_to_str'
   microblaze-linux-ld: (.text+0x17b0): undefined reference to `phy_duplex_to_str'
   microblaze-linux-ld: (.text+0x1804): undefined reference to `netdev_printk'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   (.text+0x208c): undefined reference to `linkmode_resolve_pause'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
>> (.text+0x2250): undefined reference to `phy_support_asym_pause'
>> microblaze-linux-ld: (.text+0x23e0): undefined reference to `phy_attached_info_irq'
>> microblaze-linux-ld: (.text+0x2684): undefined reference to `phy_request_interrupt'
   microblaze-linux-ld: (.text+0x2730): undefined reference to `netdev_printk'
   microblaze-linux-ld: (.text+0x27b4): undefined reference to `netdev_printk'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
>> (.text+0x2d80): undefined reference to `phy_lookup_setting'
   microblaze-linux-ld: (.text+0x312c): undefined reference to `netdev_printk'
   microblaze-linux-ld: (.text+0x317c): undefined reference to `netdev_printk'
   microblaze-linux-ld: (.text+0x31b4): undefined reference to `netdev_printk'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   (.text+0x3668): undefined reference to `netdev_printk'
   microblaze-linux-ld: (.text+0x36a0): undefined reference to `netdev_printk'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
>> (.text+0x3c48): undefined reference to `phy_attach_direct'
>> microblaze-linux-ld: (.text+0x3d88): undefined reference to `phy_detach'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
>> (.text+0x3fd8): undefined reference to `rtnl_is_locked'
>> microblaze-linux-ld: (.text+0x40f8): undefined reference to `phy_disconnect'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   (.text+0x4214): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x431c): undefined reference to `netif_carrier_off'
   microblaze-linux-ld: (.text+0x43e0): undefined reference to `phy_start'
   microblaze-linux-ld: (.text+0x47a0): undefined reference to `netdev_printk'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   (.text+0x47ec): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x48d4): undefined reference to `phy_stop'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   (.text+0x4a14): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x4ae8): undefined reference to `phy_ethtool_get_wol'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   (.text+0x4b54): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x4c20): undefined reference to `phy_ethtool_set_wol'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   (.text+0x4c90): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x4d60): undefined reference to `phy_ethtool_ksettings_get'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   (.text+0x4ee8): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x4fb4): undefined reference to `phy_ethtool_ksettings_set'
   microblaze-linux-ld: (.text+0x53a8): undefined reference to `phy_lookup_setting'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   (.text+0x5650): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x571c): undefined reference to `phy_restart_aneg'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   (.text+0x5794): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   (.text+0x58c0): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x5c2c): undefined reference to `linkmode_set_pause'
   microblaze-linux-ld: (.text+0x5e3c): undefined reference to `phy_set_asym_pause'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   (.text+0x5fec): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x60bc): undefined reference to `phy_get_eee_err'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   (.text+0x6124): undefined reference to `phy_init_eee'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   (.text+0x6174): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x6240): undefined reference to `phy_ethtool_get_eee'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   (.text+0x6294): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x6360): undefined reference to `phy_ethtool_set_eee'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   (.text+0x63c4): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x64b8): undefined reference to `phy_mii_ioctl'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   (.text+0x6754): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x6854): undefined reference to `phy_speed_down'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   (.text+0x688c): undefined reference to `rtnl_is_locked'
   microblaze-linux-ld: (.text+0x6988): undefined reference to `phy_speed_up'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   (.text+0x6bc8): undefined reference to `mdiobus_read'
   microblaze-linux-ld: (.text+0x6be0): undefined reference to `mdiobus_read'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   (.text+0x6efc): undefined reference to `mdiobus_read'
   microblaze-linux-ld: (.text+0x6f48): undefined reference to `mdiobus_write'
   microblaze-linux-ld: (.text+0x6f90): undefined reference to `mdiobus_read'
   microblaze-linux-ld: (.text+0x6fdc): undefined reference to `mdiobus_write'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   (.text+0x7138): undefined reference to `mdiobus_modify'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   (.text+0x7300): undefined reference to `mdiobus_read'
   microblaze-linux-ld: (.text+0x7338): undefined reference to `mdiobus_write'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   (.text+0x739c): undefined reference to `mdiobus_read'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
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
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
