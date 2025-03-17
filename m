Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20D12E3373
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212902; cv=none; b=rmkiw6vTlxvtRaVg48tt4L0DbqNXwSE5OmYuZB06RdzNqKGKFj5MxZoHg0IXhqmdAeGtqdprHNWdcTJLaf8xnb5+UUFQbgNYgOMihvDMRDzWHXEaMHDVURcTfRWe9mC78qN0zUJdPLeg3lwQDPIgVPuU+R7D3dLQIFbnG5ywGNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212902; c=relaxed/simple;
	bh=AhYS//3QEFqDGxiLozF3fUGq1eWf4sNwMgmG1tPJyvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PWs5xfxXvCIYjYXs31YINEGxxOoPulYu7y8KxmQ/wpaiqsSGlKuqMX3wnkz+Xp6CLdXvF0fkXXMzh7MbCjCk+qmXzlzpEg8t8AI+BW4nl4sfkjLJB5b/08EXNdB/zVCspUWmvijS31njMqgEn3lyDKIUVtL6NqArQpFERlxudOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5rqDfRI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5rqDfRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742212901; x=1773748901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AhYS//3QEFqDGxiLozF3fUGq1eWf4sNwMgmG1tPJyvQ=;
  b=B5rqDfRIN8TG0hdVhHxASeabkB8/5DWs1wa3LcOvNKHN/FupMzGMGBka
   caE24QS+bOY8f7RVhs5GKCqb74UEL4T6JFbwJobwGLZGGBEf8h6bhfqKl
   Sxapbch7bNUbnq0/UE9WhNcCSDT5lx/q+JovkdVDgvVpBBvMFPzJg4jCo
   zMQu0Kc1hHB+kjrWewKHjyt7cnQc9pJ7MQ7Pe2huHyphk/reyZ55qVYVt
   ymMOdplUsk0KibiQTMqL+jWTT8i5GywCVA78o8nZaLAoRpbpAIfOGDhSK
   SeKbX2LxXawqHVZ/Sp7K4fizbsxyaZ5dgpvlWxvSwxrrHtImaV5MPxuDu
   w==;
X-CSE-ConnectionGUID: /Tj6wsEiSkOrNF+f+tBqeg==
X-CSE-MsgGUID: y87bpF24REOuHlT0jThsRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="60840482"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="60840482"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 05:01:40 -0700
X-CSE-ConnectionGUID: WsQRrvmYTxe2oMVL3JNUhw==
X-CSE-MsgGUID: RhGLAc13T/KEU4fCkZGrRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="126949881"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Mar 2025 05:01:38 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu9A0-000Cif-22;
	Mon, 17 Mar 2025 12:01:36 +0000
Date: Mon, 17 Mar 2025 20:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2025-03 1/1] phylink.c:(.text+0x450):
 relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol
 `swphy_read_reg'
Message-ID: <202503171926.zvgzjKPJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-03
head:   14ee4828e57f886ca93128706f80d0520e4a3a31
commit: 9c2efcb127bb2168f3f523892a41b969ee3070ce [1/1] ANDROID: GKI: Kconfig.gki: Add GKI_HIDDEN_ETHERNET_CONFIGS
config: arm64-randconfig-003-20250317 (https://download.01.org/0day-ci/archive/20250317/202503171926.zvgzjKPJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171926.zvgzjKPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503171926.zvgzjKPJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0x100): undefined reference to `linkmode_resolve_pause'
   phylink.c:(.text+0x100): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x1fc): undefined reference to `linkmode_resolve_pause'
   phylink.c:(.text+0x1fc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x2ac): undefined reference to `netdev_printk'
   phylink.c:(.text+0x2ac): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x31c): undefined reference to `netdev_printk'
   phylink.c:(.text+0x31c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x37c): undefined reference to `netdev_printk'
   phylink.c:(.text+0x37c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x3bc): undefined reference to `netif_carrier_off'
   phylink.c:(.text+0x3bc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x3f8): undefined reference to `netdev_printk'
   phylink.c:(.text+0x3f8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x450): undefined reference to `swphy_read_reg'
>> phylink.c:(.text+0x450): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x5c8): undefined reference to `phy_get_pause'
>> phylink.c:(.text+0x5c8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
   phylink.c:(.text+0xa4c): undefined reference to `netif_carrier_on'
>> phylink.c:(.text+0xa4c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0xa64): undefined reference to `phy_speed_to_str'
   phylink.c:(.text+0xa64): additional relocation overflows omitted from the output
   aarch64-linux-ld: phylink.c:(.text+0xa74): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0xab8): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0xad4): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0xadc): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0xb70): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0xc14): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0xc80): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0xcb4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0xd38): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   phylink.c:(.text+0xe34): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0xf44): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0xfcc): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x116c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1214): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1280): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x1314): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x1668): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: phylink.c:(.text+0x1688): undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x1774): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x17f8): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x1874): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1920): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x192c): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x1ac8): undefined reference to `phy_start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x1b00): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1b48): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x1bd8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1c30): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x1c5c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1cac): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x1ce0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1d2c): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x1dc4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1e0c): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x1eb0): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x2078): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x20cc): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x2158): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x21e4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x22b0): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x2310): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x2380): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x23d0): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x23fc): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x2438): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x248c): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x24c0): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x250c): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x2548): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2654): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x26f0): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x2700): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x2818): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x287c): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x28a4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x28f8): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x2a3c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x2a50): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   phylink.c:(.text+0x2b9c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x2bc8): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x2be4): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x2c04): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x2c6c): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x2cb4): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x2ccc): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x2d04): undefined reference to `mdiobus_read'

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
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
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
