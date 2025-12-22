Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD4721E087
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 06:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766385911; cv=none; b=LibSVHAf6KpWrR2Vcl5JmxdKOSzPpuDFvzNFStS8m6MQn8mCuWhuYCJGaVWGVehiWSn+uZeNQpq7jlm9pUIBYlGEgneY/li19hecBrZO7AhtvkcTukB/lNXr1hXbU5HwmEzQ20y8HyPCaM5ErI1s3XzdrNJ1VqxuzBY7DU/9DR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766385911; c=relaxed/simple;
	bh=rKd8/uTv9voYEdAjUwIn6csleW3U4KO/t+89hDuAWEU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rVSieBYMuEBAI5/SZ8IP44gCoc7DmOM9Y05ixvnvJa5Ity7nbDLayZs4LRfcqqMcbrneJ8ZC1KgLTbPCZ3IGchlFgW1kK1YW6FmNhB233VYaZFRt4VDDnaLrqScCg8AW7WlfZMUaV0scM2+J/ztT6lrJiuhwu0N8d9+MMH53rXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSyc13Nh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSyc13Nh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766385908; x=1797921908;
  h=date:from:to:cc:subject:message-id;
  bh=rKd8/uTv9voYEdAjUwIn6csleW3U4KO/t+89hDuAWEU=;
  b=bSyc13NhOAke06I73i7zQ5OxRAMa/i1zxhEqC0zcpp8P+7RIb9TwgHaf
   Q5TLtA1zsvyKFPwGbysyW/+Yus8yWGL2WuKYmLwIelhpTRnSAwio5Zy2a
   l4gWEJAQxMuEICweJFHBzDHGYUzY9i/SJSKHF7/HXpZGSL38Ff8r/ewuA
   UvIyqw9zXjLZgmh6Z+htGGfLwHw0lr7HKjVCs0StpNesecphByeIN55z5
   exmIVY213SplEohdGymd5J43UZ35m8uJHr3I4PujLDL78+8DfhFij2e3s
   6rvm5P7orIIV1sg9D3253u+RI1otjTOaebIIXZF1aajgx2W5E2KE2+Iy9
   w==;
X-CSE-ConnectionGUID: jcYX3xhFQguuSo2C4ornug==
X-CSE-MsgGUID: 0QImPe1yRRecT2D5DbExqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78875931"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="78875931"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 22:45:07 -0800
X-CSE-ConnectionGUID: N9VVqbbHQL+qU2uVqHuvTw==
X-CSE-MsgGUID: GiA07hM3Q+GZn3huxaNkUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199960729"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Dec 2025 22:45:06 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXZfD-000000000AR-3cbW;
	Mon, 22 Dec 2025 06:45:03 +0000
Date: Mon, 22 Dec 2025 14:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 4/4] aarch64-linux-ld:
 Unexpected GOT/PLT entries detected!
Message-ID: <202512221427.9vmCwkr2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   3ce6827ad16244f83976f3267e13d63da0613660
commit: bfd28658709aaa278a02758cae08f972c41bcf52 [4/4] Merge tag 'v6.13-rc5' into android-mainline
config: arm64-randconfig-003-20251220 (https://download.01.org/0day-ci/archive/20251222/202512221427.9vmCwkr2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221427.9vmCwkr2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221427.9vmCwkr2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
   phylink.c:(.text+0x3d0): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x6bc): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x730): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x79c): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x808): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x884): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x8b0): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x920): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x994): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0xa00): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   phylink.c:(.text+0xd78): undefined reference to `phy_rate_matching_to_str'
>> aarch64-linux-ld: phylink.c:(.text+0xee0): undefined reference to `phy_rate_matching_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   phylink.c:(.text+0x10cc): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x14a8): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x15b4): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x1648): undefined reference to `mdiobus_read'
>> aarch64-linux-ld: phylink.c:(.text+0x1678): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: phylink.c:(.text+0x16e4): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x16f4): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x1808): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x187c): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x18d0): undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: phylink.c:(.text+0x18fc): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x1aa4): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x1d28): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x1e78): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x1e90): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x1ec4): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x1ed8): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x214c): undefined reference to `phy_start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x24ac): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x2508): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
   phylink.c:(.text+0x2914): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2924): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x29e8): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x29f8): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   phylink.c:(.text+0x2f7c): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: phylink.c:(.text+0x2fc4): undefined reference to `phy_rate_matching_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x3068): undefined reference to `phy_rate_matching_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x32bc): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: phylink.c:(.text+0x32d4): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x33b8): undefined reference to `phy_detach'
   aarch64-linux-ld: phylink.c:(.text+0x3494): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x35e8): undefined reference to `phy_get_rate_matching'
   aarch64-linux-ld: phylink.c:(.text+0x376c): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x3a9c): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x3ca0): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x3d18): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x43b4): undefined reference to `phy_get_pause'
   aarch64-linux-ld: phylink.c:(.text+0x4484): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x4490): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x449c): undefined reference to `phy_rate_matching_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x457c): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x4588): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x4594): undefined reference to `phy_rate_matching_to_str'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
