Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E158B7080C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 18:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732301769; cv=none; b=GRrilamxx9QyKuUDeK8gS4XR724GZLoGWn8CcxNyqQ2fIkwDiGWYs5NxSC7Vp8Zgp3qczKP900JRrwc4mwq6lVdloKExGb8hyNsSEt9d26BHzgFA0u7U+ZhmPl/jdOXwOTXeIkE7k3mu5EQXaLkAmBg013A3KZrMl/+6T61hPFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732301769; c=relaxed/simple;
	bh=iaM5SxpQzhfQ9Ia2ZC8gdi8Bwn5bdqUyox5EJjaNEo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eIiOcVdjMvIkxBduwAw5dyj0T13eqQn6cpzceUAfUeh+yDbRsruFu/sQH/1VjyTFu3Fm4MxWba5XTkcq8S9W1nM0zP4wXsjkYEmUVwuFDy7A6lyazJgZjj+wxLuxmcVdB6BNZs9yDlNLkM0lvqM7dOv3TEjE6BE0frrKiqxhh8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmvvRctf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmvvRctf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732301766; x=1763837766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iaM5SxpQzhfQ9Ia2ZC8gdi8Bwn5bdqUyox5EJjaNEo0=;
  b=YmvvRctfeEuXoP6/9TcH9HpVUGkOjIzBzS9p+//Aa+NtrvD+WIPUrqxS
   2O8mXLevTMtb8q7/f0AAw8jnnBFzmf3xvWb0nWxwxFWGbK0U8GvaTlmN7
   aOiTv2vfeUgRBk8BRtXZ6Yf2BK7XxkTVOucmbfiRwNtNtCBhV0k7W3e/1
   TWfnhdjcFNxx3ogHZQRQoyew/81Lym8QGDzQTvRUQgGf4u3flL6bh7u4u
   xG1Tp49QjCpqjYvPwzi3VabTCJrI1KdrKdigD0aS4IfemLKZEooeueMIX
   LkEw3OUZfooZxOh6maZbYkn83XHxLnoS09mBYZEX5zCXfLwi/5zKDpBbi
   Q==;
X-CSE-ConnectionGUID: BLqxCllTRte48i6+G9PecQ==
X-CSE-MsgGUID: NQpBtNyLQB6dyyZKKh3fzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="36132184"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="36132184"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 10:56:05 -0800
X-CSE-ConnectionGUID: syqErEAqRh60gmfEVRq1LQ==
X-CSE-MsgGUID: pkAI8V8fSMCGZodPwx4Kdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="91458004"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Nov 2024 10:56:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEYoy-00048t-1B;
	Fri, 22 Nov 2024 18:56:00 +0000
Date: Sat, 23 Nov 2024 02:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 4/4]
 kernel/module/gki_module.c:31:6: warning: no previous prototype for
 'gki_is_module_unprotected_symbol'
Message-ID: <202411230205.KCd4rb0l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   a7abc7bea75f5ea1fcf82706086a3a7fe6e41a42
commit: e9669eeb2f4580e44226cf1b582340f4b6388387 [4/4] ANDROID: GKI: Add module load time symbol protection
config: x86_64-buildonly-randconfig-005-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230205.KCd4rb0l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230205.KCd4rb0l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230205.KCd4rb0l-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/module/gki_module.c:31:6: warning: no previous prototype for 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   ld: vmlinux.o: in function `phylink_init_eee':
>> (.text+0xbe9898): undefined reference to `phy_init_eee'
   ld: vmlinux.o: in function `phylink_mii_c22_pcs_an_restart':
>> (.text+0xbe98f2): undefined reference to `mdiobus_read'
   ld: (.text+0xbe9933): undefined reference to `mdiobus_write'
   ld: vmlinux.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0xbe9a3f): undefined reference to `swphy_read_reg'
   ld: vmlinux.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0xbe9c0f): undefined reference to `linkmode_resolve_pause'
   ld: vmlinux.o: in function `phylink_disconnect_phy':
>> (.text+0xbe9ef8): undefined reference to `phy_disconnect'
   ld: vmlinux.o: in function `phylink_ethtool_get_wol':
>> (.text+0xbe9fa6): undefined reference to `phy_ethtool_get_wol'
   ld: vmlinux.o: in function `phylink_ethtool_set_wol':
>> (.text+0xbea026): undefined reference to `phy_ethtool_set_wol'
   ld: vmlinux.o: in function `phylink_get_eee_err':
>> (.text+0xbea09c): undefined reference to `phy_get_eee_err'
   ld: vmlinux.o: in function `phylink_ethtool_get_eee':
>> (.text+0xbea116): undefined reference to `phy_ethtool_get_eee'
   ld: vmlinux.o: in function `phylink_ethtool_set_eee':
>> (.text+0xbea196): undefined reference to `phy_ethtool_set_eee'
   ld: vmlinux.o: in function `phylink_speed_down':
>> (.text+0xbea233): undefined reference to `phy_speed_down'
   ld: vmlinux.o: in function `phylink_speed_up':
>> (.text+0xbea2c7): undefined reference to `phy_speed_up'
   ld: vmlinux.o: in function `phylink_mii_c45_pcs_get_state':
   (.text+0xbea351): undefined reference to `mdiobus_read'
   ld: vmlinux.o: in function `phylink_ethtool_nway_reset':
>> (.text+0xbea8ec): undefined reference to `phy_restart_aneg'
   ld: vmlinux.o: in function `phylink_stop':
>> (.text+0xbea970): undefined reference to `phy_stop'
   ld: vmlinux.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0xbead7c): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0xbead88): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0xbeadf5): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0xbeae01): undefined reference to `phy_speed_to_str'
   ld: vmlinux.o: in function `phylink_ethtool_set_pauseparam':
>> (.text+0xbeb0d0): undefined reference to `linkmode_set_pause'
   ld: (.text+0xbeb16f): undefined reference to `phy_set_asym_pause'
   ld: vmlinux.o: in function `phylink_phy_change':
   phylink.c:(.text+0xbeba54): undefined reference to `phy_get_pause'
   ld: vmlinux.o: in function `phylink_start':
>> (.text+0xbebed6): undefined reference to `phy_start'
   ld: vmlinux.o: in function `phylink_mii_c22_pcs_config':
>> (.text+0xbec1d4): undefined reference to `mdiobus_modify'
>> ld: (.text+0xbec233): undefined reference to `mdiobus_modify_changed'
   ld: vmlinux.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0xbec3d9): undefined reference to `linkmode_resolve_pause'
   ld: vmlinux.o: in function `phylink_mii_c22_pcs_get_state':
   (.text+0xbec64a): undefined reference to `mdiobus_read'
   ld: (.text+0xbec677): undefined reference to `mdiobus_read'
   ld: vmlinux.o: in function `phylink_mii_ioctl':
>> (.text+0xbec98b): undefined reference to `phy_mii_ioctl'
   ld: (.text+0xbecaaf): undefined reference to `mdiobus_read'
   ld: (.text+0xbecb9c): undefined reference to `mdiobus_write'
   ld: (.text+0xbeccf0): undefined reference to `mdiobus_read'
   ld: (.text+0xbecdde): undefined reference to `mdiobus_write'
   ld: (.text+0xbece4f): undefined reference to `mdiobus_read'
   ld: (.text+0xbece8f): undefined reference to `mdiobus_write'
   ld: vmlinux.o: in function `phylink_ethtool_ksettings_get':
>> (.text+0xbecf44): undefined reference to `phy_ethtool_ksettings_get'
   ld: vmlinux.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0xbedbe6): undefined reference to `phy_lookup_setting'
   ld: vmlinux.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0xbeeaad): undefined reference to `phy_support_asym_pause'
   ld: phylink.c:(.text+0xbeeb3d): undefined reference to `phy_get_rate_matching'
   ld: phylink.c:(.text+0xbeebff): undefined reference to `phy_attached_info_irq'
   ld: phylink.c:(.text+0xbeed65): undefined reference to `phy_request_interrupt'
   ld: vmlinux.o: in function `phylink_connect_phy':
>> (.text+0xbeedfa): undefined reference to `phy_attach_direct'
   ld: (.text+0xbeee5e): undefined reference to `phy_detach'
   ld: vmlinux.o: in function `phylink_ethtool_ksettings_set':
>> (.text+0xbeef3a): undefined reference to `phy_ethtool_ksettings_set'
   ld: (.text+0xbef041): undefined reference to `phy_lookup_setting'

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


vim +/gki_is_module_unprotected_symbol +31 kernel/module/gki_module.c

    25	
    26	/**
    27	 * gki_is_module_unprotected_symbol - Is a symbol unprotected for unsigned module?
    28	 *
    29	 * @name:	Symbol being checked in list of unprotected symbols
    30	 */
  > 31	bool gki_is_module_unprotected_symbol(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
