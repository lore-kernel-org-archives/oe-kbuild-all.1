Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8076781ACA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 03:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765163693; cv=none; b=eSK3UqKBj/L4SYRDMuWgrhyCR9HUWhfB33C3fL4qzu07U8XR1NZOgtrZX0Ole3VT64OXpdxhiHGpt+avscpeHVPNQ3mFpAUxR6EYcnZB5KKra71I1HCYZGuiGpQ/lNLbjX4RizMdHMwY6iNUwTGGbtGSoIeGyBwivLvb+aIPu40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765163693; c=relaxed/simple;
	bh=K1oP2J3ZRX6VoINQZ/w4TuOm2fkEZ52FHFdXbsZWl7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RraDnPJyKDLmLijkRiUzHbTVDcXu+y4mxj9O5h/rZubr8TaJHZhi+cBUOD1aL8wSu33gFzPEYArBS8Mng/MeUYex4gyfbthHoCgJq0IK9WWUSQqO5OUmabT55FbuPgwgHA/zpUu5mimbXpJu21FAo8TOzsjI6T82Zy7FkT77cSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lClDl0nX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lClDl0nX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765163690; x=1796699690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K1oP2J3ZRX6VoINQZ/w4TuOm2fkEZ52FHFdXbsZWl7g=;
  b=lClDl0nX7XmoKb5OcOE+Mk74jH7DhA7REc/Hd1TjGCfPzXtHSRyCE6Jy
   W326ucCXDuFjLZi59MlGlPsfsFkCbhlxluUxepvnOzqNrqiSgH1hkiv4i
   gDDbXOPJc9vqXjn6Zyd9BS1PPzejNvtisDcwmxLhnrmNKYYnKgA5dQ2g1
   RUWAj7c1++WNwArMCG16NorxAhtUjxKsi+befOufmUYLoqbEatMekc0lN
   3jBygrR39OFZsFY6MhalAuZK7VLO9cEzQ1x2R7eHDPwM+QVGEzcQZxAug
   W4Xv/oyHlExXYEwUV/x62gbi/Y92wKjxnz+l2svNX4AYDFz3ajiIf771a
   Q==;
X-CSE-ConnectionGUID: BHdZFLjTTOiBGLavCUYqeQ==
X-CSE-MsgGUID: RhZs9lJQRweLzMASvCyC5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="77787620"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="77787620"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 19:14:50 -0800
X-CSE-ConnectionGUID: LjiU47xXStCEu5LbC+HbhQ==
X-CSE-MsgGUID: /Boqn5w6R42d04z65CheMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200952050"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Dec 2025 19:14:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSRi1-00000000JtR-3LtL;
	Mon, 08 Dec 2025 03:14:45 +0000
Date: Mon, 8 Dec 2025 11:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 3/3]
 drivers/net/phy/phylink.c:1631:(.text+0x3dc): dangerous relocation:
 unsupported relocation
Message-ID: <202512081145.Ix1KVaFX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   05910bac2caf101403f079bba436ca4efd3b9bbf
commit: dd99bb34c52de463398910adc71917769dde6f54 [3/3] Revert "ANDROID: suppress GKI configs for 32-bit builds"
config: arm-randconfig-004-20251112 (https://download.01.org/0day-ci/archive/20251208/202512081145.Ix1KVaFX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081145.Ix1KVaFX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081145.Ix1KVaFX-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
   drivers/net/phy/phylink.c:1631:(.text+0x3dc): undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: (phy_lookup_setting): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
>> drivers/net/phy/phylink.c:1631:(.text+0x3dc): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_changed':
>> drivers/net/phy/phylink.c:2131:(.text+0x4f0): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: (__dynamic_netdev_dbg): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2131:(.text+0x4f0): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_down':
   drivers/net/phy/phylink.c:1439:(.text+0x550): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: (netif_carrier_off): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1439:(.text+0x550): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mac_config':
   drivers/net/phy/phylink.c:1066:(.text+0x5fc): undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: (phy_rate_matching_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1066:(.text+0x5fc): dangerous relocation: unsupported relocation
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1066:(.text+0x61a): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: (__dynamic_netdev_dbg): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1066:(.text+0x61a): dangerous relocation: unsupported relocation
>> arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1066:(.text+0x644): undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: (phy_rate_matching_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1066:(.text+0x644): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   drivers/net/phy/phylink.c:3820:(.text+0x7e8): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: (mdiobus_c45_read): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:3820:(.text+0x7e8): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   drivers/net/phy/phylink.c:964:(.text+0x876): undefined reference to `linkmode_resolve_pause'
   arm-linux-gnueabi-ld: (linkmode_resolve_pause): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:964:(.text+0x876): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_change_inband_advert':
   drivers/net/phy/phylink.c:1263:(.text+0xaf2): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: (__dynamic_netdev_dbg): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1263:(.text+0xaf2): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_major_config':
   drivers/net/phy/phylink.c:1162:(.text+0xbb6): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: (__dynamic_netdev_dbg): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1162:(.text+0xbb6): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1224:(.text+0xcfe): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: (netdev_printk): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1224:(.text+0xcfe): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1236:(.text+0xd44): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: (netdev_printk): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1236:(.text+0xd44): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_mac_and_pcs':
   drivers/net/phy/phylink.c:668:(.text+0xf7a): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: (netdev_printk): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:668:(.text+0xf7a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_one':
   drivers/net/phy/phylink.c:716:(.text+0x1068): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: (phy_get_rate_matching): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:716:(.text+0x1068): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:719:(.text+0x1098): undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: (phy_rate_matching_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:719:(.text+0x1098): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:719:(.text+0x10b2): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: (__dynamic_netdev_dbg): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:719:(.text+0x10b2): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:719:(.text+0x10d2): undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: (phy_rate_matching_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:719:(.text+0x10d2): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_link_up':
   drivers/net/phy/phylink.c:1425:(.text+0x1274): undefined reference to `netif_carrier_on'
   arm-linux-gnueabi-ld: (netif_carrier_on): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1425:(.text+0x1274): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1427:(.text+0x1282): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: (phy_speed_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1427:(.text+0x1282): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1427:(.text+0x128a): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: (phy_duplex_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1427:(.text+0x128a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1427:(.text+0x12b6): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: (phy_speed_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1427:(.text+0x12b6): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1427:(.text+0x12be): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: (phy_duplex_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1427:(.text+0x12be): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   drivers/net/phy/phylink.c:928:(.text+0x15d2): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: (netdev_printk): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:928:(.text+0x15d2): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:937:(.text+0x15fa): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: (netdev_printk): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:937:(.text+0x15fa): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   drivers/net/phy/phylink.c:1791:(.text+0x164a): undefined reference to `phy_get_pause'
   arm-linux-gnueabi-ld: (phy_get_pause): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1791:(.text+0x164a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1810:(.text+0x170c): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: (phy_speed_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1810:(.text+0x170c): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1810:(.text+0x1716): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: (phy_duplex_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1810:(.text+0x1716): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1810:(.text+0x1720): undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: (phy_rate_matching_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1810:(.text+0x1720): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1810:(.text+0x1740): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: (__dynamic_netdev_dbg): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1810:(.text+0x1740): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1810:(.text+0x1772): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: (phy_speed_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1810:(.text+0x1772): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1810:(.text+0x177c): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: (phy_duplex_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1810:(.text+0x177c): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1810:(.text+0x1786): undefined reference to `phy_rate_matching_to_str'
   arm-linux-gnueabi-ld: (phy_rate_matching_to_str): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1810:(.text+0x1786): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   drivers/net/phy/phylink.c:2698:(.text+0x17ce): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2698:(.text+0x17ce): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   drivers/net/phy/phylink.c:2110:(.text+0x1834): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2110:(.text+0x1834): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   drivers/net/phy/phylink.c:2369:(.text+0x18ba): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2369:(.text+0x18ba): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   drivers/net/phy/phylink.c:2394:(.text+0x191a): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2394:(.text+0x191a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   drivers/net/phy/phylink.c:2468:(.text+0x197c): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2468:(.text+0x197c): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2471:(.text+0x19b2): undefined reference to `phy_ethtool_ksettings_get'
   arm-linux-gnueabi-ld: (phy_ethtool_ksettings_get): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2471:(.text+0x19b2): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   drivers/net/phy/phylink.c:2680:(.text+0x1a10): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2680:(.text+0x1a10): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2683:(.text+0x1a44): undefined reference to `phy_restart_aneg'
   arm-linux-gnueabi-ld: (phy_restart_aneg): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2683:(.text+0x1a44): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   drivers/net/phy/phylink.c:2718:(.text+0x1a70): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2718:(.text+0x1a70): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2753:(.text+0x1af6): undefined reference to `linkmode_set_pause'
   arm-linux-gnueabi-ld: (linkmode_set_pause): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2753:(.text+0x1af6): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2776:(.text+0x1b3a): undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: (phy_set_asym_pause): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2776:(.text+0x1b3a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   drivers/net/phy/phylink.c:2806:(.text+0x1b74): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2806:(.text+0x1b74): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   drivers/net/phy/phylink.c:2842:(.text+0x1bce): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2842:(.text+0x1bce): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   drivers/net/phy/phylink.c:2860:(.text+0x1c2e): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2860:(.text+0x1c2e): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   drivers/net/phy/phylink.c:3117:(.text+0x1c8e): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:3117:(.text+0x1c8e): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   drivers/net/phy/phylink.c:3140:(.text+0x1cf0): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:3140:(.text+0x1cf0): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o:drivers/net/phy/phylink.c:2257: more undefined references to `rtnl_is_locked' follow
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.o: in function `phylink_stop':
   drivers/net/phy/phylink.c:2257:(.text+0x1d50): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2262:(.text+0x1d84): undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: (phy_stop): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2262:(.text+0x1d84): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   drivers/net/phy/phylink.c:2293:(.text+0x1df6): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2293:(.text+0x1df6): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2307:(.text+0x1e4c): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: (netif_carrier_off): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2307:(.text+0x1e4c): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   drivers/net/phy/phylink.c:3769:(.text+0x1ea8): undefined reference to `mdiobus_modify_changed'
   arm-linux-gnueabi-ld: (mdiobus_modify_changed): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:3769:(.text+0x1ea8): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `mdiodev_modify':
   include/linux/mdio.h:645:(.text+0x1ed4): undefined reference to `mdiobus_modify'
   arm-linux-gnueabi-ld: (mdiobus_modify): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
>> include/linux/mdio.h:645:(.text+0x1ed4): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   drivers/net/phy/phylink.c:813:(.text+0x1fc4): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: (netdev_printk): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:813:(.text+0x1fc4): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:834:(.text+0x202a): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: (netdev_printk): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:834:(.text+0x202a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:841:(.text+0x206a): undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: (phy_lookup_setting): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:841:(.text+0x206a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:855:(.text+0x20de): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: (netdev_printk): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:855:(.text+0x20de): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_create':
   drivers/net/phy/phylink.c:1694:(.text+0x21c0): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: (netif_carrier_off): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1694:(.text+0x21c0): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_validate_phy':
   drivers/net/phy/phylink.c:1848:(.text+0x231e): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: (netdev_printk): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1848:(.text+0x231e): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1853:(.text+0x2352): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: (__dynamic_netdev_dbg): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1853:(.text+0x2352): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1863:(.text+0x23aa): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: (__dynamic_netdev_dbg): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1863:(.text+0x23aa): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1869:(.text+0x23d2): undefined reference to `phy_get_rate_matching'
   arm-linux-gnueabi-ld: (phy_get_rate_matching): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1869:(.text+0x23d2): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   drivers/net/phy/phylink.c:1906:(.text+0x2446): undefined reference to `phy_support_asym_pause'
   arm-linux-gnueabi-ld: (phy_support_asym_pause): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1906:(.text+0x2446): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1915:(.text+0x24a2): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: (netdev_printk): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1915:(.text+0x24a2): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1926:(.text+0x24da): undefined reference to `phy_attached_info_irq'
   arm-linux-gnueabi-ld: (phy_attached_info_irq): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1926:(.text+0x24da): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1927:(.text+0x24fe): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: (netdev_printk): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1927:(.text+0x24fe): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1948:(.text+0x25b6): undefined reference to `__dynamic_netdev_dbg'
   arm-linux-gnueabi-ld: (__dynamic_netdev_dbg): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1948:(.text+0x25b6): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:1955:(.text+0x25f6): undefined reference to `phy_request_interrupt'
   arm-linux-gnueabi-ld: (phy_request_interrupt): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1955:(.text+0x25f6): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_attach_phy':
   drivers/net/phy/phylink.c:1979:(.text+0x26a4): undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: (phy_attach_direct): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:1979:(.text+0x26a4): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   drivers/net/phy/phylink.c:2013:(.text+0x26bc): undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: (phy_detach): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2013:(.text+0x26bc): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   drivers/net/phy/phylink.c:2189:(.text+0x276a): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2189:(.text+0x276a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2191:(.text+0x27ba): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: (netdev_printk): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2191:(.text+0x27ba): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2197:(.text+0x27e6): undefined reference to `netif_carrier_off'
   arm-linux-gnueabi-ld: (netif_carrier_off): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2197:(.text+0x27e6): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   drivers/net/phy/phylink.c:2330:(.text+0x28a4): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2330:(.text+0x28a4): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   drivers/net/phy/phylink.c:2520:(.text+0x292a): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2520:(.text+0x292a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2547:(.text+0x297c): undefined reference to `phy_ethtool_ksettings_set'
   arm-linux-gnueabi-ld: (phy_ethtool_ksettings_set): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2547:(.text+0x297c): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2561:(.text+0x29c2): undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: (phy_lookup_setting): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2561:(.text+0x29c2): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_sfp_select_interface':
   drivers/net/phy/phylink.c:2410:(.text+0x2a44): undefined reference to `netdev_printk'
   arm-linux-gnueabi-ld: (netdev_printk): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2410:(.text+0x2a44): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   drivers/net/phy/phylink.c:3046:(.text+0x2b24): undefined reference to `rtnl_is_locked'
   arm-linux-gnueabi-ld: (rtnl_is_locked): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:3046:(.text+0x2b24): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_read':
   drivers/net/phy/phylink.c:2930:(.text+0x2bda): undefined reference to `mdiobus_c45_read'
   arm-linux-gnueabi-ld: (mdiobus_c45_read): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2930:(.text+0x2bda): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.c:2934:(.text+0x2be6): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: (mdiobus_read): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2934:(.text+0x2be6): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_write':
   drivers/net/phy/phylink.c:2971:(.text+0x2c4e): undefined reference to `mdiobus_c45_write'
   arm-linux-gnueabi-ld: (mdiobus_c45_write): Unknown destination type (ARM/Thumb) in drivers/net/phy/phylink.o
   drivers/net/phy/phylink.c:2971:(.text+0x2c4e): dangerous relocation: unsupported relocation

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +1631 drivers/net/phy/phylink.c

27755ff88c0ecb Ioana Ciornei         2019-05-28  1433  
4c0d6d3a7a81fc Russell King          2020-03-30  1434  static void phylink_link_down(struct phylink *pl)
27755ff88c0ecb Ioana Ciornei         2019-05-28  1435  {
27755ff88c0ecb Ioana Ciornei         2019-05-28  1436  	struct net_device *ndev = pl->netdev;
27755ff88c0ecb Ioana Ciornei         2019-05-28  1437  
43de61959b9992 Ioana Ciornei         2019-05-28  1438  	if (ndev)
27755ff88c0ecb Ioana Ciornei         2019-05-28 @1439  		netif_carrier_off(ndev);
e7765d634aaa9d Russell King          2020-03-30  1440  	pl->mac_ops->mac_link_down(pl->config, pl->cur_link_an_mode,
b4b12b0d2f0261 David S. Miller       2019-05-31  1441  				   pl->cur_interface);
17091180b1521e Ioana Ciornei         2019-05-28  1442  	phylink_info(pl, "Link is Down\n");
27755ff88c0ecb Ioana Ciornei         2019-05-28  1443  }
27755ff88c0ecb Ioana Ciornei         2019-05-28  1444  
9525ae83959b60 Russell King          2017-07-25  1445  static void phylink_resolve(struct work_struct *w)
9525ae83959b60 Russell King          2017-07-25  1446  {
9525ae83959b60 Russell King          2017-07-25  1447  	struct phylink *pl = container_of(w, struct phylink, resolve);
9525ae83959b60 Russell King          2017-07-25  1448  	struct phylink_link_state link_state;
9525ae83959b60 Russell King          2017-07-25  1449  	struct net_device *ndev = pl->netdev;
319bfafe3494b6 Russell King          2020-07-21  1450  	bool mac_config = false;
80662f4fd4771b Russell King (Oracle  2021-11-23  1451) 	bool retrigger = false;
b06e5cac213cff Russell King          2020-07-21  1452  	bool cur_link_state;
9525ae83959b60 Russell King          2017-07-25  1453  
9525ae83959b60 Russell King          2017-07-25  1454  	mutex_lock(&pl->state_mutex);
b06e5cac213cff Russell King          2020-07-21  1455  	if (pl->netdev)
b06e5cac213cff Russell King          2020-07-21  1456  		cur_link_state = netif_carrier_ok(ndev);
b06e5cac213cff Russell King          2020-07-21  1457  	else
b06e5cac213cff Russell King          2020-07-21  1458  		cur_link_state = pl->old_link_state;
b06e5cac213cff Russell King          2020-07-21  1459  
9525ae83959b60 Russell King          2017-07-25  1460  	if (pl->phylink_disable_state) {
671154f174e0e7 Russell King (Oracle  2024-11-12  1461) 		pl->link_failed = false;
9525ae83959b60 Russell King          2017-07-25  1462  		link_state.link = false;
671154f174e0e7 Russell King (Oracle  2024-11-12  1463) 	} else if (pl->link_failed) {
9525ae83959b60 Russell King          2017-07-25  1464  		link_state.link = false;
80662f4fd4771b Russell King (Oracle  2021-11-23  1465) 		retrigger = true;
92abfcb4ced482 Russell King (Oracle  2024-11-08  1466) 	} else if (pl->cur_link_an_mode == MLO_AN_FIXED) {
92abfcb4ced482 Russell King (Oracle  2024-11-08  1467) 		phylink_get_fixed_state(pl, &link_state);
92abfcb4ced482 Russell King (Oracle  2024-11-08  1468) 		mac_config = link_state.link;
f0f46c2a3d8ea9 Russell King (Oracle  2024-11-08  1469) 	} else if (pl->cur_link_an_mode == MLO_AN_PHY) {
9525ae83959b60 Russell King          2017-07-25  1470  		link_state = pl->phy_state;
319bfafe3494b6 Russell King          2020-07-21  1471  		mac_config = link_state.link;
f0f46c2a3d8ea9 Russell King (Oracle  2024-11-08  1472) 	} else {
d46b7e4fb06037 Russell King          2019-11-21  1473  		phylink_mac_pcs_get_state(pl, &link_state);
9525ae83959b60 Russell King          2017-07-25  1474  
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1475) 		/* The PCS may have a latching link-fail indicator. If the link
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1476) 		 * was up, bring the link down and re-trigger the resolve.
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1477) 		 * Otherwise, re-read the PCS state to get the current status
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1478) 		 * of the link.
dbae3388ea9ca3 Russell King (Oracle  2021-11-23  1479) 		 */
dbae3388ea9ca3 Russell King (Oracle  2021-11-23  1480) 		if (!link_state.link) {
dbae3388ea9ca3 Russell King (Oracle  2021-11-23  1481) 			if (cur_link_state)
dbae3388ea9ca3 Russell King (Oracle  2021-11-23  1482) 				retrigger = true;
dbae3388ea9ca3 Russell King (Oracle  2021-11-23  1483) 			else
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1484) 				phylink_mac_pcs_get_state(pl, &link_state);
dbae3388ea9ca3 Russell King (Oracle  2021-11-23  1485) 		}
dbae3388ea9ca3 Russell King (Oracle  2021-11-23  1486) 
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1487) 		/* If we have a phy, the "up" state is the union of both the
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1488) 		 * PHY and the MAC
1953feb022154e Wenpeng Liang         2021-06-16  1489  		 */
406cb0c4d16ac5 Russell King          2019-05-20  1490  		if (pl->phydev)
406cb0c4d16ac5 Russell King          2019-05-20  1491  			link_state.link &= pl->phy_state.link;
9525ae83959b60 Russell King          2017-07-25  1492  
406cb0c4d16ac5 Russell King          2019-05-20  1493  		/* Only update if the PHY link is up */
406cb0c4d16ac5 Russell King          2019-05-20  1494  		if (pl->phydev && pl->phy_state.link) {
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1495) 			/* If the interface has changed, force a link down
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1496) 			 * event if the link isn't already down, and re-resolve.
80662f4fd4771b Russell King (Oracle  2021-11-23  1497) 			 */
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1498) 			if (link_state.interface != pl->phy_state.interface) {
80662f4fd4771b Russell King (Oracle  2021-11-23  1499) 				retrigger = true;
80662f4fd4771b Russell King (Oracle  2021-11-23  1500) 				link_state.link = false;
80662f4fd4771b Russell King (Oracle  2021-11-23  1501) 			}
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1502) 
9525ae83959b60 Russell King          2017-07-25  1503  			link_state.interface = pl->phy_state.interface;
9525ae83959b60 Russell King          2017-07-25  1504  
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1505) 			/* If we are doing rate matching, then the link
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1506) 			 * speed/duplex comes from the PHY
ae0e4bb2a0e0e4 Sean Anderson         2022-09-20  1507  			 */
ae0e4bb2a0e0e4 Sean Anderson         2022-09-20  1508  			if (pl->phy_state.rate_matching) {
ae0e4bb2a0e0e4 Sean Anderson         2022-09-20  1509  				link_state.rate_matching =
ae0e4bb2a0e0e4 Sean Anderson         2022-09-20  1510  					pl->phy_state.rate_matching;
ae0e4bb2a0e0e4 Sean Anderson         2022-09-20  1511  				link_state.speed = pl->phy_state.speed;
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1512) 				link_state.duplex = pl->phy_state.duplex;
ae0e4bb2a0e0e4 Sean Anderson         2022-09-20  1513  			}
ae0e4bb2a0e0e4 Sean Anderson         2022-09-20  1514  
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1515) 			/* If we have a PHY, we need to update with the PHY
bc08ce37d99a39 Russell King (Oracle  2024-11-08  1516) 			 * flow control bits.
1953feb022154e Wenpeng Liang         2021-06-16  1517  			 */
33faac8e03ac24 Russell King          2020-02-15  1518  			link_state.pause = pl->phy_state.pause;
319bfafe3494b6 Russell King          2020-07-21  1519  			mac_config = true;
9525ae83959b60 Russell King          2017-07-25  1520  		}
9525ae83959b60 Russell King          2017-07-25  1521  	}
9525ae83959b60 Russell King          2017-07-25  1522  
8cc5f4cb94c0b1 Russell King (Oracle  2024-11-08  1523) 	if (pl->cur_link_an_mode != MLO_AN_FIXED)
8cc5f4cb94c0b1 Russell King (Oracle  2024-11-08  1524) 		phylink_apply_manual_flow(pl, &link_state);
8cc5f4cb94c0b1 Russell King (Oracle  2024-11-08  1525) 
16319a7d31b5df Russell King          2020-07-21  1526  	if (mac_config) {
16319a7d31b5df Russell King          2020-07-21  1527  		if (link_state.interface != pl->link_config.interface) {
16319a7d31b5df Russell King          2020-07-21  1528  			/* The interface has changed, force the link down and
16319a7d31b5df Russell King          2020-07-21  1529  			 * then reconfigure.
16319a7d31b5df Russell King          2020-07-21  1530  			 */
16319a7d31b5df Russell King          2020-07-21  1531  			if (cur_link_state) {
16319a7d31b5df Russell King          2020-07-21  1532  				phylink_link_down(pl);
16319a7d31b5df Russell King          2020-07-21  1533  				cur_link_state = false;
16319a7d31b5df Russell King          2020-07-21  1534  			}
b7ad14c2fe2d4b Russell King          2020-07-21  1535  			phylink_major_config(pl, false, &link_state);
5005b163440f3f Russell King          2020-07-21  1536  			pl->link_config.interface = link_state.interface;
16319a7d31b5df Russell King          2020-07-21  1537  		}
5005b163440f3f Russell King          2020-07-21  1538  	}
319bfafe3494b6 Russell King          2020-07-21  1539  
b06e5cac213cff Russell King          2020-07-21  1540  	if (link_state.link != cur_link_state) {
43de61959b9992 Ioana Ciornei         2019-05-28  1541  		pl->old_link_state = link_state.link;
27755ff88c0ecb Ioana Ciornei         2019-05-28  1542  		if (!link_state.link)
4c0d6d3a7a81fc Russell King          2020-03-30  1543  			phylink_link_down(pl);
27755ff88c0ecb Ioana Ciornei         2019-05-28  1544  		else
4c0d6d3a7a81fc Russell King          2020-03-30  1545  			phylink_link_up(pl, link_state);
9525ae83959b60 Russell King          2017-07-25  1546  	}
80662f4fd4771b Russell King (Oracle  2021-11-23  1547) 	if (!link_state.link && retrigger) {
671154f174e0e7 Russell King (Oracle  2024-11-12  1548) 		pl->link_failed = false;
9525ae83959b60 Russell King          2017-07-25  1549  		queue_work(system_power_efficient_wq, &pl->resolve);
9525ae83959b60 Russell King          2017-07-25  1550  	}
9525ae83959b60 Russell King          2017-07-25  1551  	mutex_unlock(&pl->state_mutex);
9525ae83959b60 Russell King          2017-07-25  1552  }
9525ae83959b60 Russell King          2017-07-25  1553  
9525ae83959b60 Russell King          2017-07-25  1554  static void phylink_run_resolve(struct phylink *pl)
9525ae83959b60 Russell King          2017-07-25  1555  {
9525ae83959b60 Russell King          2017-07-25  1556  	if (!pl->phylink_disable_state)
9525ae83959b60 Russell King          2017-07-25  1557  		queue_work(system_power_efficient_wq, &pl->resolve);
9525ae83959b60 Russell King          2017-07-25  1558  }
9525ae83959b60 Russell King          2017-07-25  1559  
87454b6edc1b01 Russell King          2019-02-11  1560  static void phylink_run_resolve_and_disable(struct phylink *pl, int bit)
87454b6edc1b01 Russell King          2019-02-11  1561  {
87454b6edc1b01 Russell King          2019-02-11  1562  	unsigned long state = pl->phylink_disable_state;
87454b6edc1b01 Russell King          2019-02-11  1563  
87454b6edc1b01 Russell King          2019-02-11  1564  	set_bit(bit, &pl->phylink_disable_state);
87454b6edc1b01 Russell King          2019-02-11  1565  	if (state == 0) {
87454b6edc1b01 Russell King          2019-02-11  1566  		queue_work(system_power_efficient_wq, &pl->resolve);
87454b6edc1b01 Russell King          2019-02-11  1567  		flush_work(&pl->resolve);
87454b6edc1b01 Russell King          2019-02-11  1568  	}
87454b6edc1b01 Russell King          2019-02-11  1569  }
87454b6edc1b01 Russell King          2019-02-11  1570  
aa729c439441aa Russell King          2021-11-30  1571  static void phylink_enable_and_run_resolve(struct phylink *pl, int bit)
aa729c439441aa Russell King          2021-11-30  1572  {
aa729c439441aa Russell King          2021-11-30  1573  	clear_bit(bit, &pl->phylink_disable_state);
aa729c439441aa Russell King          2021-11-30  1574  	phylink_run_resolve(pl);
aa729c439441aa Russell King          2021-11-30  1575  }
aa729c439441aa Russell King          2021-11-30  1576  
9cd00a8aa42e44 Russell King          2018-05-10  1577  static void phylink_fixed_poll(struct timer_list *t)
9cd00a8aa42e44 Russell King          2018-05-10  1578  {
9cd00a8aa42e44 Russell King          2018-05-10  1579  	struct phylink *pl = container_of(t, struct phylink, link_poll);
9cd00a8aa42e44 Russell King          2018-05-10  1580  
9cd00a8aa42e44 Russell King          2018-05-10  1581  	mod_timer(t, jiffies + HZ);
9cd00a8aa42e44 Russell King          2018-05-10  1582  
9cd00a8aa42e44 Russell King          2018-05-10  1583  	phylink_run_resolve(pl);
9cd00a8aa42e44 Russell King          2018-05-10  1584  }
9cd00a8aa42e44 Russell King          2018-05-10  1585  
ce0aa27ff3f68e Russell King          2017-07-25  1586  static const struct sfp_upstream_ops sfp_phylink_ops;
ce0aa27ff3f68e Russell King          2017-07-25  1587  
8fa7b9b6af252c Russell King          2017-12-01  1588  static int phylink_register_sfp(struct phylink *pl,
a0b7955310a445 Russell King (Oracle  2023-05-12  1589) 				const struct fwnode_handle *fwnode)
ce0aa27ff3f68e Russell King          2017-07-25  1590  {
2203cbf2c8b58a Russell King          2019-10-15  1591  	struct sfp_bus *bus;
8fa7b9b6af252c Russell King          2017-12-01  1592  	int ret;
ce0aa27ff3f68e Russell King          2017-07-25  1593  
eed70fd9452fe0 Russell King          2020-01-03  1594  	if (!fwnode)
eed70fd9452fe0 Russell King          2020-01-03  1595  		return 0;
eed70fd9452fe0 Russell King          2020-01-03  1596  
727b3668b73063 Russell King          2019-11-08  1597  	bus = sfp_bus_find_fwnode(fwnode);
2203cbf2c8b58a Russell King          2019-10-15  1598  	if (IS_ERR(bus)) {
ab1198e5a1dc02 Russell King (Oracle  2022-03-01  1599) 		phylink_err(pl, "unable to attach SFP bus: %pe\n", bus);
ab1198e5a1dc02 Russell King (Oracle  2022-03-01  1600) 		return PTR_ERR(bus);
8fa7b9b6af252c Russell King          2017-12-01  1601  	}
8fa7b9b6af252c Russell King          2017-12-01  1602  
2203cbf2c8b58a Russell King          2019-10-15  1603  	pl->sfp_bus = bus;
ce0aa27ff3f68e Russell King          2017-07-25  1604  
727b3668b73063 Russell King          2019-11-08  1605  	ret = sfp_bus_add_upstream(bus, pl, &sfp_phylink_ops);
727b3668b73063 Russell King          2019-11-08  1606  	sfp_bus_put(bus);
727b3668b73063 Russell King          2019-11-08  1607  
727b3668b73063 Russell King          2019-11-08  1608  	return ret;
ce0aa27ff3f68e Russell King          2017-07-25  1609  }
ce0aa27ff3f68e Russell King          2017-07-25  1610  
4b3fc475c61fa8 Russell King          2024-09-06  1611  /**
4b3fc475c61fa8 Russell King          2024-09-06  1612   * phylink_set_fixed_link() - set the fixed link
4b3fc475c61fa8 Russell King          2024-09-06  1613   * @pl: a pointer to a &struct phylink returned from phylink_create()
4b3fc475c61fa8 Russell King          2024-09-06  1614   * @state: a pointer to a struct phylink_link_state.
4b3fc475c61fa8 Russell King          2024-09-06  1615   *
4b3fc475c61fa8 Russell King          2024-09-06  1616   * This function is used when the link parameters are known and do not change,
4b3fc475c61fa8 Russell King          2024-09-06  1617   * making it suitable for certain types of network connections.
4b3fc475c61fa8 Russell King          2024-09-06  1618   *
4b3fc475c61fa8 Russell King          2024-09-06  1619   * Returns: zero on success or negative error code.
4b3fc475c61fa8 Russell King          2024-09-06  1620   */
4b3fc475c61fa8 Russell King          2024-09-06  1621  int phylink_set_fixed_link(struct phylink *pl,
4b3fc475c61fa8 Russell King          2024-09-06  1622  			   const struct phylink_link_state *state)
4b3fc475c61fa8 Russell King          2024-09-06  1623  {
4b3fc475c61fa8 Russell King          2024-09-06  1624  	const struct phy_setting *s;
4b3fc475c61fa8 Russell King          2024-09-06  1625  	unsigned long *adv;
4b3fc475c61fa8 Russell King          2024-09-06  1626  
4b3fc475c61fa8 Russell King          2024-09-06  1627  	if (pl->cfg_link_an_mode != MLO_AN_PHY || !state ||
4b3fc475c61fa8 Russell King          2024-09-06  1628  	    !test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state))
4b3fc475c61fa8 Russell King          2024-09-06  1629  		return -EINVAL;
4b3fc475c61fa8 Russell King          2024-09-06  1630  
4b3fc475c61fa8 Russell King          2024-09-06 @1631  	s = phy_lookup_setting(state->speed, state->duplex,
4b3fc475c61fa8 Russell King          2024-09-06  1632  			       pl->supported, true);
4b3fc475c61fa8 Russell King          2024-09-06  1633  	if (!s)
4b3fc475c61fa8 Russell King          2024-09-06  1634  		return -EINVAL;
4b3fc475c61fa8 Russell King          2024-09-06  1635  
4b3fc475c61fa8 Russell King          2024-09-06  1636  	adv = pl->link_config.advertising;
4b3fc475c61fa8 Russell King          2024-09-06  1637  	linkmode_zero(adv);
4b3fc475c61fa8 Russell King          2024-09-06  1638  	linkmode_set_bit(s->bit, adv);
4b3fc475c61fa8 Russell King          2024-09-06  1639  	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, adv);
4b3fc475c61fa8 Russell King          2024-09-06  1640  
4b3fc475c61fa8 Russell King          2024-09-06  1641  	pl->link_config.speed = state->speed;
4b3fc475c61fa8 Russell King          2024-09-06  1642  	pl->link_config.duplex = state->duplex;
4b3fc475c61fa8 Russell King          2024-09-06  1643  	pl->link_config.link = 1;
4b3fc475c61fa8 Russell King          2024-09-06  1644  	pl->link_config.an_complete = 1;
4b3fc475c61fa8 Russell King          2024-09-06  1645  
4b3fc475c61fa8 Russell King          2024-09-06  1646  	pl->cfg_link_an_mode = MLO_AN_FIXED;
4b3fc475c61fa8 Russell King          2024-09-06  1647  	pl->cur_link_an_mode = pl->cfg_link_an_mode;
4b3fc475c61fa8 Russell King          2024-09-06  1648  
4b3fc475c61fa8 Russell King          2024-09-06  1649  	return 0;
4b3fc475c61fa8 Russell King          2024-09-06  1650  }
4b3fc475c61fa8 Russell King          2024-09-06  1651  EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
4b3fc475c61fa8 Russell King          2024-09-06  1652  

:::::: The code at line 1631 was first introduced by commit
:::::: 4b3fc475c61fa8733a9acc9d743f6cc9ca4915f5 net: phylink: Add phylink_set_fixed_link() to configure fixed link state in phylink

:::::: TO: Russell King <linux@armlinux.org.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
