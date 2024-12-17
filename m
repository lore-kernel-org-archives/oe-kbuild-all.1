Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00282595
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 03:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734404696; cv=none; b=u0vSAkBhLiofY8xUX7HcwchctV4zmJ9OrilOHiba35tRl2HwTY5GXLc1CAn7lp/Fx3scatY99fWHdo9kVmueRGyNqwrqBv4oTTkEYZEz61iG+iiFO0XC5k45AIafJnkodrClCUuwk9/k3RhTgG6yaeaI/wEgitvdTpNbofkKEpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734404696; c=relaxed/simple;
	bh=8090x8aJUz620M17k/44HNXZ9GSvQuUUzHe6V2Jhzzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EfoyhQjxcfU2rwX3XGfCG+fB033wTFJPdvR9ECX/Yiy8qPp1CCJVlX03siHbIx43ALaoRv69wQW7oCMU0cSUOBbj/SBO36zafXw2kyL2eMNDI9fty41VDCe/gisoaEqpRPa8pFwiKrBTxxZxGbZdGU9c7ZjEIgE8aLYGrVTbP2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1OR0rVZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1OR0rVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734404694; x=1765940694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8090x8aJUz620M17k/44HNXZ9GSvQuUUzHe6V2Jhzzs=;
  b=I1OR0rVZE55ivrO1nhuj2I0ug29EV7kas74cpO/56PglNvLU8nss8gF+
   oAYNyi/UcYRbScWxpsAQti73bUhiZgEoEs0e+cTKcXRegkGrY43DuoRIQ
   2fy47EjUWPIHotltR45dPl4Q8vOgCRmGftMUoe6QQ3eyQ/RZG4+7nKtqY
   YUR9nGV1+/77oexxGAV2N1fKnDEymRD4TuJCt7FS+uUz7RFm/cwPg+ahD
   HVK+5akQ/+jacMwbJBvun7sdJB2R7Xw8bTEJopLvzytIwqvWRbRorDNdO
   1dbxwK6YInOR1w4C0HO+HJLu06TNg7Y5nza39Fy4Jku/AkC9SFUtoAqTO
   A==;
X-CSE-ConnectionGUID: Ua+frKR/RLO77YAFQUG2jw==
X-CSE-MsgGUID: Bj1WqtDlQsachn4DVDcNJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46226872"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="46226872"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 19:04:53 -0800
X-CSE-ConnectionGUID: BSiDkGoeQRGnARSN/b4Fmw==
X-CSE-MsgGUID: KVF/vzxfSGaVB3hGRNYAmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; 
   d="scan'208";a="97845001"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Dec 2024 19:04:52 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNNtB-000EfI-33;
	Tue, 17 Dec 2024 03:04:49 +0000
Date: Tue, 17 Dec 2024 11:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2650/27816] ttm_bo_vm.c:undefined
 reference to `vmf_insert_pfn_prot'
Message-ID: <202412171056.7r4GEPhA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lee,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   e93c64d6832644195830f19c58408d3f8380bcf9
commit: 293f275f4da1b800731dc086a5ec64537c9e192b [2650/27816] Merge commit df8ba5f160335 ("Merge tag 'kgdb-5.14-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux") into android-mainline
config: arm-randconfig-003-20241217 (https://download.01.org/0day-ci/archive/20241217/202412171056.7r4GEPhA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412171056.7r4GEPhA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412171056.7r4GEPhA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: warning: arch/arm/lib/delay-loop.o: missing .note.GNU-stack section implies executable stack
   arm-linux-gnueabi-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   arm-linux-gnueabi-ld: warning: arch/arm/lib/delay-loop.o: missing .note.GNU-stack section implies executable stack
   arm-linux-gnueabi-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   arm-linux-gnueabi-ld: warning: vmlinux has a LOAD segment with RWX permissions
   arm-linux-gnueabi-ld: drivers/gpu/drm/ttm/ttm_bo_vm.o: in function `ttm_bo_vm_fault_reserved':
>> ttm_bo_vm.c:(.text+0x410): undefined reference to `vmf_insert_pfn_prot'
   arm-linux-gnueabi-ld: drivers/gpu/drm/ttm/ttm_bo_vm.o: in function `ttm_bo_vm_dummy_page':
   ttm_bo_vm.c:(.text+0x4a0): undefined reference to `vmf_insert_pfn_prot'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0xe8): undefined reference to `linkmode_resolve_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x1b0): undefined reference to `linkmode_resolve_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x23e): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x29c): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x2f8): undefined reference to `swphy_read_reg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x37e): undefined reference to `phy_get_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
   phylink.c:(.text+0x6a8): undefined reference to `netif_carrier_on'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x6ba): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x6c4): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x6e6): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x6f8): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x6fe): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x766): undefined reference to `phy_support_asym_pause'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x7e2): undefined reference to `phy_attached_info_irq'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x81c): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x83a): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x8ac): undefined reference to `phy_request_interrupt'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x9be): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xa16): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xa5e): undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xac8): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   phylink.c:(.text+0xb98): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xc5a): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xcb4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0xeae): undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xec4): undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0xf28): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0xf8e): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xfc4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: phylink.c:(.text+0xfcc): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x1120): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1128): undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x117e): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x119e): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x11ce): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x11d8): undefined reference to `phy_ethtool_ksettings_get'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x124c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1256): undefined reference to `phy_ethtool_ksettings_set'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x12d4): undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x13fc): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1404): undefined reference to `phy_restart_aneg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x1446): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x1470): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x14ce): undefined reference to `linkmode_set_pause'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1512): undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x1548): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x1572): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x1592): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x15b8): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x164c): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x1792): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x17b4): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x1886): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x1892): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   phylink.c:(.text+0x1976): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x198e): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x19a0): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x19e4): undefined reference to `mdiobus_modify'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x1a08): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x1a36): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0x27a): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   phylink.c:(.text+0x2be): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0xf62): undefined reference to `phy_disconnect'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
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
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
