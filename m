Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A04D1BD9E9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 22:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732313850; cv=none; b=KHD7CojGRG5JWr8bOFgcAkAuyON94tdRCH2cRLzpYid2VhsK8aSmEODop/WXkY5Ug+Tk7QbxzGES5BNCVWu8KEuF+RisVVnkV9LVg0KyGOhdScfU3Pjn1x30x9wBRi6drQ3Mxtbsd6F8EU5/XVgGbmCM9sLfC1w00LLHI4X81ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732313850; c=relaxed/simple;
	bh=SK+wtZq1o3BfRmqpKiL1gI4aBUasFHdfNF0Rajxgu1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XdHEWETngMvOWjaIk1AhLEr8amL2g1fvuuqnv9/woTefQnTnzGUyFIGqT4uqvWncajAmkkEfrX7tLzh4uDo0BaODbjXGcW55jaKhYtFWlzBr1juCfeDBxNCTccl62zprioHTciVPo2T3KNfdBEdgywKZJl9T6iw9Z5/4DaiCKds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iABoiISh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iABoiISh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732313848; x=1763849848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SK+wtZq1o3BfRmqpKiL1gI4aBUasFHdfNF0Rajxgu1I=;
  b=iABoiIShnVZ54voZtdmWw7TNI7WJmZwg/qXtuti+RxuVYQn1QIbcAPxX
   PhYrDK5fl767BkK0o2sJKrv7fsqgrf6CS+cLlZbOt/6pt8IS3JLhzj3F4
   /NJrie61Ku/V4bZxWqsmj4itmsK1ABaA0/tIn1WQs161XiG0bCGLh/1gP
   r1P8KVdxswGwIuvykVrBkGS7B69SBn7GQExC0rblTPyU1f/9svhvVFRAS
   Q2lq1eJ3C4GupcHXmOI/h2Lh4sajXDO9W/bInqJarIOUX7wWUFXAYSjNE
   Wj6sj8vk7yZJL6fJ6J5pOlypiF+E+y+s6WOske2vF2hdPczXtXEgi306Q
   g==;
X-CSE-ConnectionGUID: SCb0/aquQt28Je3UlPTmeA==
X-CSE-MsgGUID: 99SDRTnsSX60mBe71uZhkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="50002157"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="50002157"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 14:17:26 -0800
X-CSE-ConnectionGUID: GnI0Gn0cSDSkmzDn237DdA==
X-CSE-MsgGUID: Wa7+LapcTe6ZH/WDWjbpMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="95632472"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Nov 2024 14:17:25 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEbxq-0004FZ-3A;
	Fri, 22 Nov 2024 22:17:22 +0000
Date: Sat, 23 Nov 2024 06:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 218/30000] aarch64-linux-ld:
 phylink.c:undefined reference to `__dynamic_netdev_dbg'
Message-ID: <202411230623.sEUNEFq6-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   952e16e5fc486c3a3fdaffef3fe643decedbea16
commit: 9c2efcb127bb2168f3f523892a41b969ee3070ce [218/30000] ANDROID: GKI: Kconfig.gki: Add GKI_HIDDEN_ETHERNET_CONFIGS
config: arm64-randconfig-003-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230623.sEUNEFq6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230623.sEUNEFq6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230623.sEUNEFq6-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0x2c0): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mac_config':
   phylink.c:(.text+0x404): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x418): undefined reference to `phy_duplex_to_str'
>> aarch64-linux-ld: phylink.c:(.text+0x47c): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: phylink.c:(.text+0x54c): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x560): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x610): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x6b4): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x6f8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x8a0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x900): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x964): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x998): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x9f4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xa10): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0xa70): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xa90): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0xb08): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0xb34): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xb50): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0xbb4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xbd0): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   phylink.c:(.text+0xc94): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0xcb8): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0xce0): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0xd00): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0xd58): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0xd70): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0xe44): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0xeb4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xef0): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0xf50): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xf88): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x102c): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x1140): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x11f4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x120c): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x15c0): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: phylink.c:(.text+0x1710): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1738): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1760): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x18b0): undefined reference to `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0x1904): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x1914): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x1960): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x1970): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x19a4): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_change_inband_advert.isra.0':
   phylink.c:(.text+0x1b94): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x1cd4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1dbc): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x1e3c): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x204c): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x211c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x2134): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mac_change':
   phylink.c:(.text+0x241c): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x2514): undefined reference to `phy_get_pause'
   aarch64-linux-ld: phylink.c:(.text+0x2678): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x268c): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x26b4): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: phylink.c:(.text+0x2738): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x274c): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x27e4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2828): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x2964): undefined reference to `phy_start'
   aarch64-linux-ld: phylink.c:(.text+0x2bb4): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x3308): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x33c0): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x3448): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: phylink.c:(.text+0x3518): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x3710): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3730): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x3850): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x386c): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   phylink.c:(.text+0x3ccc): undefined reference to `netdev_printk'

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
