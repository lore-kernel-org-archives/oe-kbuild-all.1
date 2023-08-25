Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E26019883
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 22:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693002205; x=1724538205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ml8orwrF6O9pr5DbmMLl8AV+y2Ubapnubw+wn7tpDks=;
  b=ASUr1sIm0ZC/VrDaefwGSlSXZ97+5ZRrOqOYMkaHURSPOSLVSWpDOKcA
   l87U96h/HCnFknBFDyv4U7WCjL1BsPu8fjZKWEmA3aHtxSO6BklzPaG8/
   OG/HXaWSi16eKeeFSI49ImkKvKyYnpoe2x9aErs842nS1+hgsdX0pr5Jz
   2rXU4kS6BV9w/10oNVvMxoEolf0SsqGkT3yhnOOhrfIgJv91LX1XiUr8c
   jCD45B520ZLKG8kz8o80m9S6BySHzLberzSMzkis9flUAfQAyrw5nKXAq
   Y9xZwiBe/IArVyxy0dRuLiDzuf0bmJT2py4ZUMyQ6m73DF0wlxVXABZWn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="374789349"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="374789349"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 15:22:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="772640743"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="772640743"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Aug 2023 15:22:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZfBu-000443-0o;
	Fri, 25 Aug 2023 22:22:06 +0000
Date: Sat, 26 Aug 2023 06:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: Chanho Park <chanho61.park@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Subject: [sudeep-holla:android13-5.10/ffa 2111/9999] ld: phylink.c:undefined
 reference to `phy_duplex_to_str'
Message-ID: <202308260604.FPTEBDBd-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-004-20230824 (https://download.01.org/0day-ci/archive/20230826/202308260604.FPTEBDBd-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260604.FPTEBDBd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260604.FPTEBDBd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x7d: call to trace_hardirqs_off() leaves .noinstr.text section
   vmlinux.o: warning: objtool: match_held_lock()+0xef: call to rcu_read_lock_any_held() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_preemption_disabled.isra.0()+0x4a: return with instrumentation enabled
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0xa4): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x175): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x2cd): undefined reference to `swphy_read_reg'
   ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x452): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x50e): undefined reference to `phy_get_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x642): undefined reference to `netif_carrier_off'
   ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
   phylink.c:(.text+0x99c): undefined reference to `netif_carrier_on'
>> ld: phylink.c:(.text+0xb69): undefined reference to `phy_duplex_to_str'
>> ld: phylink.c:(.text+0xb71): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0xc0c): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0xc17): undefined reference to `phy_speed_to_str'
>> ld: phylink.c:(.text+0xc3a): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_create':
   phylink.c:(.text+0xec1): undefined reference to `netdev_printk'
   ld: phylink.c:(.text+0x1090): undefined reference to `netdev_printk'
   ld: phylink.c:(.text+0x11ce): undefined reference to `netdev_printk'
>> ld: phylink.c:(.text+0x138d): undefined reference to `phy_lookup_setting'
   ld: phylink.c:(.text+0x1466): undefined reference to `netdev_printk'
   ld: phylink.c:(.text+0x14c9): undefined reference to `netdev_printk'
   ld: phylink.c:(.text+0x14e4): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x15be): undefined reference to `phy_attach_direct'
>> ld: phylink.c:(.text+0x15d8): undefined reference to `phy_support_asym_pause'
>> ld: phylink.c:(.text+0x167e): undefined reference to `phy_detach'
>> ld: phylink.c:(.text+0x16ee): undefined reference to `phy_attached_info_irq'
>> ld: phylink.c:(.text+0x17b8): undefined reference to `phy_request_interrupt'
   ld: phylink.c:(.text+0x17fe): undefined reference to `netdev_printk'
   ld: phylink.c:(.text+0x184e): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x190f): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x1a02): undefined reference to `rtnl_is_locked'
>> ld: phylink.c:(.text+0x1a26): undefined reference to `netif_carrier_off'
>> ld: phylink.c:(.text+0x1a6e): undefined reference to `phy_start'
   ld: phylink.c:(.text+0x1cf7): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x1d1a): undefined reference to `rtnl_is_locked'
>> ld: phylink.c:(.text+0x1d2c): undefined reference to `phy_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x1dce): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x1e3e): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x1ed5): undefined reference to `rtnl_is_locked'
>> ld: phylink.c:(.text+0x1eee): undefined reference to `phy_ethtool_ksettings_get'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x1ff7): undefined reference to `rtnl_is_locked'
>> ld: phylink.c:(.text+0x2010): undefined reference to `phy_ethtool_ksettings_set'
   ld: phylink.c:(.text+0x21e1): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x22eb): undefined reference to `rtnl_is_locked'
>> ld: phylink.c:(.text+0x22ff): undefined reference to `phy_restart_aneg'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x235e): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x23e4): undefined reference to `rtnl_is_locked'
>> ld: phylink.c:(.text+0x2477): undefined reference to `linkmode_set_pause'
>> ld: phylink.c:(.text+0x24d7): undefined reference to `phy_set_asym_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x25aa): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x262e): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x269e): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x2739): undefined reference to `rtnl_is_locked'
>> ld: phylink.c:(.text+0x2774): undefined reference to `phy_mii_ioctl'
>> ld: phylink.c:(.text+0x2837): undefined reference to `mdiobus_write'
>> ld: phylink.c:(.text+0x28e2): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x2a2d): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x2a9a): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x2c38): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x2c4a): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   phylink.c:(.text+0x2d7c): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x2d97): undefined reference to `mdiobus_write'
   ld: phylink.c:(.text+0x2db5): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x2e13): undefined reference to `mdiobus_modify'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x2e5c): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x2e9c): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x439): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x67b): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x1970): undefined reference to `phy_disconnect'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x1ded): undefined reference to `phy_ethtool_get_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x1e55): undefined reference to `phy_ethtool_set_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x25bd): undefined reference to `phy_get_eee_err'
   ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x2613): undefined reference to `phy_init_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x2645): undefined reference to `phy_ethtool_get_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x26b5): undefined reference to `phy_ethtool_set_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x2a54): undefined reference to `phy_speed_down'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x2abb): undefined reference to `phy_speed_up'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x2e74): undefined reference to `mdiobus_write'

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
