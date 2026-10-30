Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352698;
	b=tQ7nRxqk1cbUhIPxC1ISmH0qAylRhLJX7Yfz20+b8B8aRnC5ewD/xV3hKPFNZps2dxlk
	 rKJiUWwg4eUxzpC3Z/d3a+bNHvHP8qx0i7lWEVflVQ9GqDBTAnWuRg5Fm/+8xA24upxGC
	 emJ124ppqOhrSR6GexnIuA2r6WfzH/XE7h7q2LYdVR2DuBlVe8I+vZa67Stn26XrfnAhx
	 btqVgwK7VzYvy/NrfYeuSlDe311Jq8pniA+X1alZhuz2ciboLsMzwzsI9NVV1c9tUyoqU
	 CO4dTV2E9BrcyAaK9S/uva6nMqM6zLOsE4OOEEhrag5jC+ndad/gLdbQotDVCdQa84Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352698;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XBInvw6N1LSE0BsbbSF+26B9bIniQFjh8Fp2VU3eCzI=;
	b=jxuzGzNT+qcRxKqO2wYcaNl/Bl+N9HQbt3X5cpgZKUtEjAhx7+ByXiyTD3TWvLjunRIH
	 rKSTUFE15hb0o1aOGsoCV9LAmE7Ml3E6zAPGgbkGTjW0FQsO+SPsPCYZEncncaM8qNvb0
	 CV1eOwV0k3Sp1L4hD0O/akcGo6GnxfR9McUCUulyzz9M1XmepvGFFHfwUNy8rdDRQiFAc
	 S9MyJzvAiteVeJ4zC0WBtE19gVAk1iWeCrM7ZuwVMB7hpN5BWtPjdHTM4L/S7V0Kwi3rx
	 NIKMnsRQMktJIBN1hAvJFWFdWGzLDrzAbNxeDV1qqn0aZV/g9TDCgt87mEvWxHRCFbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SwirDUi7;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E851606A31E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 09:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E851606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SwirDUi7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793352697; x=1824888697;
  h=date:from:to:cc:subject:message-id;
  bh=eLqfFDBUydwZSYO5guvC88fpOILqiZaFl87JyEJD+O8=;
  b=SwirDUi7zv8FIbuuHjCMMHTeacunegfXJcqQ3YuSVxaf961lWh8PlEOf
   BpGAt2NJuJFbrfy+XPQnpuBVyxHd34Ba5QpH4rktoaPVdekVLW8GpLeFE
   o8UfktlW6yIKdwftoAQGkx1jLCM0RZy1hYieGoPLip1oy30SVR+F6jI3u
   ET/LZeKZPc1yrzq4M6xhwzG//Mcr8CeBkvbQPC7WXxcfOpRIqr0zDGhoD
   lb2cXAz9mjepKCRpYWF5bJpcxpNprys9I8pCKUxenHMPX1wCae0G0DbY+
   XQNSXeX8LMlErjF7Oy7O58q5F2vkqUGSqcqaVLcKjfbVPYPxhBGHhAuiX
   g==;
X-CSE-ConnectionGUID: QfBRPaQeRDOCQwsd54J3sQ==
X-CSE-MsgGUID: FqRTMQM1Rw68m0Xg9XTnsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1992511"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="1992511"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:31:36 -0700
X-CSE-ConnectionGUID: EMe1iIvwSiqTd8/TRl4tlg==
X-CSE-MsgGUID: 8d+TbqDrRNurN1Z7qJtUUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7215817"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 30 Oct 2026 02:31:35 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMixR-000000005XH-0RNY;
	Fri, 30 Oct 2026 09:31:33 +0000
Date: Fri, 30 Oct 2026 10:31:16 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1]
 io-pgtable-arm.c:undefined reference to `iommu_pages_free_incoherent'
Message-ID: <202610301003.OTdk2MpS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   84fa46b452b58687931e35dd7165707355714d3d
commit: 88f58b9b183c6117df698eb589fc59b3557d10fd [1/1] Merge 9e7e66334583 ("Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma") into android-mainline
config: arm64-randconfig-r2103-20261029 (https://download.01.org/0day-ci/archive/20261030/202610301003.OTdk2MpS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610301003.OTdk2MpS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610301003.OTdk2MpS-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `__arm_lpae_free_pages':
>> io-pgtable-arm.c:(.text+0x1f8): undefined reference to `iommu_pages_free_incoherent'
   aarch64-linux-ld: io-pgtable-arm.c:(.text+0x204): undefined reference to `iommu_free_pages'
   aarch64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `__arm_lpae_alloc_pages':
   io-pgtable-arm.c:(.text+0x107c): undefined reference to `iommu_alloc_pages_node_sz'
>> aarch64-linux-ld: io-pgtable-arm.c:(.text+0x10a0): undefined reference to `iommu_pages_start_incoherent'
   aarch64-linux-ld: io-pgtable-arm.c:(.text+0x10c8): undefined reference to `iommu_free_pages'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_set_fixed_link':
   phylink.c:(.text+0x6d4): undefined reference to `phy_caps_lookup'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolve_an_pause':
   phylink.c:(.text+0x860): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_activate_lpi':
   phylink.c:(.text+0x1180): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: phylink.c:(.text+0x1264): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: phylink.c:(.text+0x1404): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_pcs_neg_mode':
   phylink.c:(.text+0x15a0): undefined reference to `phy_inband_caps'
   aarch64-linux-ld: phylink.c:(.text+0x1624): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: phylink.c:(.text+0x1804): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x1a20): undefined reference to `netdev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mac_config':
   phylink.c:(.text+0x1c78): undefined reference to `phy_rate_matching_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x1ca8): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: phylink.c:(.text+0x1d50): undefined reference to `phy_rate_matching_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_caps_to_linkmodes':
   phylink.c:(.text+0x1f18): undefined reference to `phy_caps_linkmodes'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_block':
   phylink.c:(.text+0x1f94): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x201c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x20a8): undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_rx_clk_stop_unblock':
   phylink.c:(.text+0x2114): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x219c): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x222c): undefined reference to `phy_eee_rx_clock_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x229c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_replay_link_begin':
   phylink.c:(.text+0x2494): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x25d8): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x26bc): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_prepare_resume':
   phylink.c:(.text+0x2720): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x279c): undefined reference to `phy_resume'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x2820): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x28f8): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: phylink.c:(.text+0x2984): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x2a50): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2b08): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: phylink.c:(.text+0x2b34): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: phylink.c:(.text+0x2c28): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x2cd4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2d24): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x2d94): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2de8): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x2e5c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2ee4): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x2fac): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x30ac): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: phylink.c:(.text+0x31f4): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x3300): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x340c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x3434): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x3500): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x3530): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x3598): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x360c): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x3654): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x36b8): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x3764): undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: phylink.c:(.text+0x37b4): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x3988): undefined reference to `netif_carrier_on'
   aarch64-linux-ld: phylink.c:(.text+0x39c4): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x39d0): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x3a14): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x3a40): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x3a4c): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_change_inband_advert.isra.0':
   phylink.c:(.text+0x3c14): undefined reference to `__dynamic_netdev_dbg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x3e58): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3f84): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x4028): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x4150): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x4220): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x42b8): undefined reference to `mdiobus_c45_read'
   aarch64-linux-ld: phylink.c:(.text+0x42d8): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x4334): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: phylink.c:(.text+0x43c8): undefined reference to `mdiobus_c45_write'
   aarch64-linux-ld: phylink.c:(.text+0x43ec): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x4404): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: phylink.c:(.text+0x453c): undefined reference to `swphy_read_reg'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y] && 64BIT [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
