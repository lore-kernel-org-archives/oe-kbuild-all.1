Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1732C224F6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 05:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747459750; cv=none; b=DgTfyaAy74qYoj2tt/ApVJE/UtkOO7GIRIa8TdAhCLOjsMxvn1+mK/sWXasM9eUVRIchUey9EFptCN27oTFD28eDI+DlnU0nW+5+op9QQbqAscdm/w1m/3RAzqaOb7mRzTVeDPZyf0Gqy/ui71CKdIj6B1odhPTbxkltq93e7qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747459750; c=relaxed/simple;
	bh=sC2YczjAJilizTQTRb3YEj/4y00GFJAWWmzvI9tRBVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DhSaCNWF+ys6kBLl2Sl3KL4viSolxzu3WkkWl8TeRnF56axAGymuYaiqa80f+nKNwvq7+X7Teqe7dXGm2mXpdW4s0OxEHXn/1LbipO/BHPt2hQx4FwQYpqkBCAoZC28B8ZYM4AuqTnSOB0pKk4THJ/uMtJtxlXVzs9gbHQw+Gm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFErx2wU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFErx2wU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747459748; x=1778995748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sC2YczjAJilizTQTRb3YEj/4y00GFJAWWmzvI9tRBVE=;
  b=ZFErx2wUitp25Ikr8G3mzNAzyHcMA3J7xGjHFWdRtnpDnDn7clxnOHex
   Oj+0PswbsFVjdEDA24geiJsm8qItVJFrF37VaOayhyb0JVMWM9sFq2+i4
   NFeAu/6kmm4YXvmlpJaitQ1Z3YUtyUra09gMiLAxQuC3T6sYjk563L2Hx
   hyIH3e78UCWWmikYkwhXljKCFFn9T+f7QhqxEXq7aTd70Ze7pKea6GUha
   G1NrmXb5b+5BHyzpwtNBcpEh/LrqQNHZYWWksHO9vPjkqq9j9mG9ktZsB
   eU915nmInT9RKGCbuJy5uak2bGAkJSjCbcFeWwnMf8iSnIrCtrfWtVsJW
   A==;
X-CSE-ConnectionGUID: d4f81Gf9SXSLsk3+EK6XNw==
X-CSE-MsgGUID: ZaDl8SvWRWCc51/uCMEyCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="74833198"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="74833198"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 22:29:07 -0700
X-CSE-ConnectionGUID: De8ONOo8R3iJUiUXQmF75A==
X-CSE-MsgGUID: fM+U/fOQQ+GN4Ifw/0BibQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="139407713"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 May 2025 22:29:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGA6Z-000Jx7-2I;
	Sat, 17 May 2025 05:29:03 +0000
Date: Sat, 17 May 2025 13:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2025-05 2/2] aarch64-linux-ld:
 phylink.c:undefined reference to `linkmode_resolve_pause'
Message-ID: <202505171342.W6PnhnEG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-05
head:   b17f7a1bdf114452fc068ae019ebf918fcecb236
commit: 9c2efcb127bb2168f3f523892a41b969ee3070ce [2/2] ANDROID: GKI: Kconfig.gki: Add GKI_HIDDEN_ETHERNET_CONFIGS
config: arm64-randconfig-004-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171342.W6PnhnEG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171342.W6PnhnEG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171342.W6PnhnEG-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: phylink.c:(.text+0xbc8): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0xc38): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0xe24): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0xed0): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0xfec): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x105c): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x116c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x11d8): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x12e4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x134c): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x1470): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x14bc): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1528): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x163c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x16a8): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x17c0): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   phylink.c:(.text+0x18f4): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x192c): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x1960): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x19a0): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x19f0): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x1aa0): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x1acc): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x1b60): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x1c00): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1c80): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x1d74): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x1df0): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x1f30): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x2248): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: phylink.c:(.text+0x2340): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x23d4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x2458): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x2564): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x25cc): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_change_inband_advert':
   phylink.c:(.text+0x29d0): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x2a9c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2bb8): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x2c20): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
   phylink.c:(.text+0x2fd4): undefined reference to `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0x3000): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x300c): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x303c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3330): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x333c): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x3578): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x360c): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: phylink.c:(.text+0x3704): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x393c): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x3a6c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3ae8): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x3cb4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3d48): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x3dbc): undefined reference to `phy_start'
   aarch64-linux-ld: phylink.c:(.text+0x413c): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   phylink.c:(.text+0x47f4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x482c): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x4904): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x4ac8): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x4ba4): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x4d50): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x4df4): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x5010): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: phylink.c:(.text+0x5038): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x50e0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x5144): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x51a0): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x5240): undefined reference to `phy_detach'
   aarch64-linux-ld: phylink.c:(.text+0x5388): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: phylink.c:(.text+0x53cc): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x5600): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x566c): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x5914): undefined reference to `linkmode_resolve_pause'
>> aarch64-linux-ld: phylink.c:(.text+0x5988): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x5a80): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x5a94): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x5c58): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x5cc4): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x5ec4): undefined reference to `phy_lookup_setting'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
