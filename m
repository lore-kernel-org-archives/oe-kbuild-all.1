Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AD1189BAE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 23:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732317034; cv=none; b=Lb8JR8piy4AvJHZVHy+aFjhAQcRMWx7S6fWLlgYLzBdvWlZm94/6YtCSCFK/F7iNrQaczSOVoQ6e1ZiHlLes/oMuHG6HSHcM/mhKTWGwHK+71s35+SlP26+HxeQ8JPgSa4NC7EWeLtM9osnca1acL7gDL7pigOpNbcFtVjKofXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732317034; c=relaxed/simple;
	bh=LuGpnd1lAs8Ix25HIelIt0+DlnE2pVyIY4qgRpOaGMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hf6C/Tq4SnjxF/z2LKmimcKevqZIOYQDGei7h7EXok9iGIQ4MTqT+DSgg/O9MaamPz9oFtM8r3l7P1Pi85+UIXj1FChKXxKos8hDhVw48p6YibRM/cx9DL4XtVpYZK0ohsgVQ5xmqrWL2pXgpAav01BR5TI90xkD9MUW08UW8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brnGH14a; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brnGH14a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732317033; x=1763853033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LuGpnd1lAs8Ix25HIelIt0+DlnE2pVyIY4qgRpOaGMw=;
  b=brnGH14aSLbMpX3krWRk6+MfsS18kXPOI+B7Gku4Dn3Tn32Aor6jrB5x
   dBsk+MmddypEnDVcSQN6wp8wiFQJCdMoJCb5WhhozR23mDHJGOIlSqB2Z
   wk7ikGkxD1LnlhX50jB+LfYFok/FH/+K+dOm63oMTEiY2yjaW5LLjpF/I
   1XJguiTEUeBNhopnNh0UTB/n5KJu4ZzsvMTRNtApOPOY2LRVG8oA9W6Ii
   GySaZQxtIC3Eto/YxZ0/6e6/kuruf6upubalEqsatEQ9szJjxLbrdNwPK
   BtYSuDD/6ZsMma4Wk0EM2eDPS3Wb/N7gPfACXIUVr+S3rwvhX5bwqHK1v
   Q==;
X-CSE-ConnectionGUID: GRYpo4LBSsyOqdfytbCEfQ==
X-CSE-MsgGUID: tH+oG5yrSESSkqgROLajyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32415044"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="32415044"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 15:10:33 -0800
X-CSE-ConnectionGUID: tOPyvX1GRuiMkvSudLYn5w==
X-CSE-MsgGUID: VhuKqNU4SOWFN+bP55mRKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="91128128"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2024 15:10:31 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEcnE-0004H3-2g;
	Fri, 22 Nov 2024 23:10:28 +0000
Date: Sat, 23 Nov 2024 07:10:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/4] kernel/module/gki_module.c:35:6:
 warning: no previous prototype for 'gki_is_module_protected_export'
Message-ID: <202411230728.TFkV8LiJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   672918d43222e930e7f6c509f4b8ab6f6336bc6a
commit: 552a021d7dfdf4a12c3d2553b4da8919a2a29f3f [1/4] ANDROID: GKI: Protect exports of protected GKI modules
config: x86_64-buildonly-randconfig-005-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230728.TFkV8LiJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230728.TFkV8LiJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230728.TFkV8LiJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/module/gki_module.c:35:6: warning: no previous prototype for 'gki_is_module_protected_export' [-Wmissing-prototypes]
      35 | bool gki_is_module_protected_export(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/gki_module.c:46:6: warning: no previous prototype for 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      46 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   ld: vmlinux.o: in function `phylink_init_eee':
>> (.text+0xbe8598): undefined reference to `phy_init_eee'
   ld: vmlinux.o: in function `phylink_mii_c22_pcs_an_restart':
>> (.text+0xbe85f2): undefined reference to `mdiobus_read'
   ld: (.text+0xbe8633): undefined reference to `mdiobus_write'
   ld: vmlinux.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0xbe873f): undefined reference to `swphy_read_reg'
   ld: vmlinux.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0xbe890f): undefined reference to `linkmode_resolve_pause'
   ld: vmlinux.o: in function `phylink_disconnect_phy':
>> (.text+0xbe8bf8): undefined reference to `phy_disconnect'
   ld: vmlinux.o: in function `phylink_ethtool_get_wol':
>> (.text+0xbe8ca6): undefined reference to `phy_ethtool_get_wol'
   ld: vmlinux.o: in function `phylink_ethtool_set_wol':
>> (.text+0xbe8d26): undefined reference to `phy_ethtool_set_wol'
   ld: vmlinux.o: in function `phylink_get_eee_err':
>> (.text+0xbe8d9c): undefined reference to `phy_get_eee_err'
   ld: vmlinux.o: in function `phylink_ethtool_get_eee':
>> (.text+0xbe8e16): undefined reference to `phy_ethtool_get_eee'
   ld: vmlinux.o: in function `phylink_ethtool_set_eee':
>> (.text+0xbe8e96): undefined reference to `phy_ethtool_set_eee'
   ld: vmlinux.o: in function `phylink_speed_down':
>> (.text+0xbe8f33): undefined reference to `phy_speed_down'
   ld: vmlinux.o: in function `phylink_speed_up':
>> (.text+0xbe8fc7): undefined reference to `phy_speed_up'
   ld: vmlinux.o: in function `phylink_mii_c45_pcs_get_state':
   (.text+0xbe9051): undefined reference to `mdiobus_read'
   ld: vmlinux.o: in function `phylink_ethtool_nway_reset':
>> (.text+0xbe95ec): undefined reference to `phy_restart_aneg'
   ld: vmlinux.o: in function `phylink_stop':
>> (.text+0xbe9670): undefined reference to `phy_stop'
   ld: vmlinux.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0xbe9a7c): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0xbe9a88): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0xbe9af5): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0xbe9b01): undefined reference to `phy_speed_to_str'
   ld: vmlinux.o: in function `phylink_ethtool_set_pauseparam':
>> (.text+0xbe9dd0): undefined reference to `linkmode_set_pause'
   ld: (.text+0xbe9e6f): undefined reference to `phy_set_asym_pause'
   ld: vmlinux.o: in function `phylink_phy_change':
   phylink.c:(.text+0xbea754): undefined reference to `phy_get_pause'
   ld: vmlinux.o: in function `phylink_start':
>> (.text+0xbeabd6): undefined reference to `phy_start'
   ld: vmlinux.o: in function `phylink_mii_c22_pcs_config':
>> (.text+0xbeaed4): undefined reference to `mdiobus_modify'
   ld: (.text+0xbeaf33): undefined reference to `mdiobus_modify_changed'
   ld: vmlinux.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0xbeb0d9): undefined reference to `linkmode_resolve_pause'
   ld: vmlinux.o: in function `phylink_mii_c22_pcs_get_state':
   (.text+0xbeb34a): undefined reference to `mdiobus_read'
   ld: (.text+0xbeb377): undefined reference to `mdiobus_read'
   ld: vmlinux.o: in function `phylink_mii_ioctl':
>> (.text+0xbeb68b): undefined reference to `phy_mii_ioctl'
   ld: (.text+0xbeb7af): undefined reference to `mdiobus_read'
   ld: (.text+0xbeb89c): undefined reference to `mdiobus_write'
   ld: (.text+0xbeb9f0): undefined reference to `mdiobus_read'
   ld: (.text+0xbebade): undefined reference to `mdiobus_write'
   ld: (.text+0xbebb4f): undefined reference to `mdiobus_read'
   ld: (.text+0xbebb8f): undefined reference to `mdiobus_write'
   ld: vmlinux.o: in function `phylink_ethtool_ksettings_get':
>> (.text+0xbebc44): undefined reference to `phy_ethtool_ksettings_get'
   ld: vmlinux.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0xbec8e6): undefined reference to `phy_lookup_setting'
   ld: vmlinux.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0xbed7b5): undefined reference to `phy_support_asym_pause'
   ld: phylink.c:(.text+0xbed802): undefined reference to `phy_get_rate_matching'
   ld: phylink.c:(.text+0xbed924): undefined reference to `phy_attached_info_irq'
   ld: phylink.c:(.text+0xbeda8a): undefined reference to `phy_request_interrupt'
   ld: vmlinux.o: in function `phylink_connect_phy':
>> (.text+0xbedb6a): undefined reference to `phy_attach_direct'
   ld: (.text+0xbedbce): undefined reference to `phy_detach'
   ld: vmlinux.o: in function `phylink_ethtool_ksettings_set':
>> (.text+0xbedcaa): undefined reference to `phy_ethtool_ksettings_set'
   ld: (.text+0xbeddb1): undefined reference to `phy_lookup_setting'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/gki_is_module_protected_export +35 kernel/module/gki_module.c

    29	
    30	/**
    31	 * gki_is_module_protected_export - Is a symbol exported from a protected GKI module?
    32	 *
    33	 * @name:	Symbol being checked against exported symbols from protected GKI modules
    34	 */
  > 35	bool gki_is_module_protected_export(const char *name)
    36	{
    37		return bsearch(name, gki_protected_exports_symbols, NR_PROTECTED_EXPORTS_SYMBOLS,
    38			       MAX_PROTECTED_EXPORTS_NAME_LEN, cmp_name) != NULL;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
