Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190773E7631
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 22:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786745132; cv=none; b=sXrr48Bj1G8ygYgy7jWk+1SlA6KQnNYEI9kAboIc9VbiB2q9hTUFsf9Iho71OWJra8v+E2XADvU3gy357ieBXHs0dDaivMQZpkNB1wbPRgyvVciqy5m6pz0hbMckHraKkOWdcZu/0/wzguvNl6UbewvZLfBQGFdU3Y0apzS2Zso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786745132; c=relaxed/simple;
	bh=eIW6uKbv+iLVxaCJYYQmTRoAaGvKldZo+ovCW9VJ4H4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dWNRvZGDQJpdYAcGxVGKvbs8E58Jbo0Imc3tE0ImMiB91UZnAWlpaZ+wEA+SznwzEppxV89EG6YOdaT7wOTNPqXk+k5T1JVme6g9wCV7zWwxa3AlcMQLr9u98x5Byc7rUy2hM7WgP4F5x8sPiNVackPnXjgFz68xMpuYeemZkYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQ+FcT52; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQ+FcT52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786745129; x=1818281129;
  h=date:from:to:cc:subject:message-id;
  bh=eIW6uKbv+iLVxaCJYYQmTRoAaGvKldZo+ovCW9VJ4H4=;
  b=mQ+FcT52F9/V97vkG+/y837ikDv3sJ3G9ctYyFAvkFmTm/NH6oMiEUWR
   2Nn+8brsjZQuOTvrcTn+KdM6y2iwmburbBVpZKBiIKrfxLrG2asnHTuUz
   QdcVMmVpxeeTu8XYHkxQAfcgWnKFr+I4xFIqZ5+TeCnYplcYMsWYpbJm2
   9eGXJ9matBHFI3S8LbGIkDZ9kaJFQQJlRWxhX0Yu0X+BEHAEY40Y/hrDm
   tOmT1XAlAOLOB0l+R3p8/Fe5aakVVJeVKZDFVSZdMqeKbzWOCCglMwlui
   gTwaTV2aoIdesbZMgBO6+OXC9tMq7jylcKXIl/yjJSTGUJLCGsooIzXmX
   w==;
X-CSE-ConnectionGUID: bzhWFWuVSw6LIrcJ0eZUHA==
X-CSE-MsgGUID: 0jLYtysvQLuSHip9goDKGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="104860983"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="104860983"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 15:05:29 -0700
X-CSE-ConnectionGUID: MS4w11q8SzKhoQKVao0AGw==
X-CSE-MsgGUID: U0zhRFAHQRWkVcx9NW0e1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="261064276"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Aug 2026 15:05:27 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv01k-00000000aLu-3TP3;
	Fri, 14 Aug 2026 22:05:24 +0000
Date: Sat, 15 Aug 2026 06:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 0/1] slot.c:undefined
 reference to `of_regulator_bulk_get_all'
Message-ID: <202608150504.0VlbR5fh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Manivannan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   56f164d7f06bd11dfa205c568ed165eff6a03fe4
commit: c61d3053974a917407ce02ff923505d45dd5b5bd [0/1] UPSTREAM: PCI/pwrctrl: Add pwrctrl driver for PCI slots
config: i386-buildonly-randconfig-003-20260815 (https://download.01.org/0day-ci/archive/20260815/202608150504.0VlbR5fh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150504.0VlbR5fh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150504.0VlbR5fh-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x70e): undefined reference to `phy_init_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x764): undefined reference to `mdiobus_c45_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x7da): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x7fe): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x884): undefined reference to `mdiobus_modify'
   ld: phylink.c:(.text+0x8bd): undefined reference to `mdiobus_modify_changed'
   ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   phylink.c:(.text+0x9b1): undefined reference to `linkmode_resolve_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0xd25): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0xd3d): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0xee4): undefined reference to `phy_disconnect'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0xf71): undefined reference to `phy_ethtool_get_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0xfe3): undefined reference to `phy_ethtool_set_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x10a1): undefined reference to `phy_restart_aneg'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x1120): undefined reference to `phy_get_eee_err'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x11a3): undefined reference to `phy_ethtool_get_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x1263): undefined reference to `phy_ethtool_set_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x133d): undefined reference to `phy_speed_down'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x13fa): undefined reference to `phy_speed_up'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x15db): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x15e5): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x1630): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x163a): undefined reference to `phy_speed_to_str'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x1815): undefined reference to `linkmode_set_pause'
   ld: phylink.c:(.text+0x1869): undefined reference to `phy_set_asym_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x199f): undefined reference to `phy_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x1fa2): undefined reference to `phy_get_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   phylink.c:(.text+0x2221): undefined reference to `phy_get_rate_matching'
   ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   phylink.c:(.text+0x2509): undefined reference to `phy_get_rate_matching'
   ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x2605): undefined reference to `phy_support_asym_pause'
   ld: phylink.c:(.text+0x2691): undefined reference to `phy_attached_info_irq'
   ld: phylink.c:(.text+0x2743): undefined reference to `phy_request_interrupt'
   ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x27d8): undefined reference to `phy_attach_direct'
   ld: phylink.c:(.text+0x2823): undefined reference to `phy_detach'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x2b61): undefined reference to `mdiobus_c45_read'
   ld: phylink.c:(.text+0x2c13): undefined reference to `swphy_read_reg'
   ld: phylink.c:(.text+0x2c35): undefined reference to `phy_mii_ioctl'
   ld: phylink.c:(.text+0x2c9e): undefined reference to `mdiobus_c45_write'
   ld: phylink.c:(.text+0x2d37): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x2dda): undefined reference to `mdiobus_write'
   ld: phylink.c:(.text+0x2e37): undefined reference to `mdiobus_c45_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x2fb3): undefined reference to `phy_ethtool_ksettings_get'
   ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
   phylink.c:(.text+0x30b2): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x388c): undefined reference to `phy_ethtool_ksettings_set'
   ld: phylink.c:(.text+0x3a31): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x3c72): undefined reference to `phy_start'
   ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x4056): undefined reference to `phy_lookup_setting'
   ld: drivers/pci/pwrctrl/slot.o: in function `pci_pwrctrl_slot_probe':
>> slot.c:(.text+0x6f): undefined reference to `of_regulator_bulk_get_all'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
