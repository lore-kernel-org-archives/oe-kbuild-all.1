Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA6A1859
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 01:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725931288; cv=none; b=HPCYjMb23scCHFXIgnHNgp/yJIYYv853RkpNJ8HY2OjVAw5WPPszv2cRag01fz3MN/5cajX1Vw/bi4tjUAM3AnpaLzT6QDQZ0to0ERo/vcgU+R//TyvUh3QsXzgEIKJs4LJSA+/culGLXLdLpe7tJ9WualImc/pvwhVoqnywV0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725931288; c=relaxed/simple;
	bh=yZMV0S31KgTAhOxZGQ1QVxZojrKdlWj/i3t+cJsH+SI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pEoW94NlfANMMsgSWodhpuR1wZM2P3LTvea68a30g9wA6YrVMRs7yMKd1I0cSFwhrGp87qppchmI4q0DZSA43H1uRhpDJEF/6fJ9F+KkUu3Gy/fhkZkviU2FSYMVI92N/a+tvxaY34S9lLgACx3mI8X2+cGIGIk5wnKvjANjVyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SH/bncBG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SH/bncBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725931287; x=1757467287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yZMV0S31KgTAhOxZGQ1QVxZojrKdlWj/i3t+cJsH+SI=;
  b=SH/bncBGGGR97eXwPUHVAfZr3DL5QgVXfGSWCXqWkUiTdFhGfUs9c0wT
   kmYaDuGHDTgg+JC+sWM741TFjn3DLMJqbQrUxHFhmgWV1kqKAtsUTQysV
   +pJdCnn3c+IEhr7Tv3K8zctgombFEM6rRjyC+FAO/AE79foNtZ1hkBM4H
   XOiwULXKshoBVJCPvdM8qosVbmyQmCYao3A6Xqzxt92tP/M0ONB66l3T5
   lKRpLmwh+7a6l8cIEucXWTtVYVBBXMgND0T/uGsrUQv5CIH9T4rUkQQNi
   tHsyo9IlSk1BKesVj5N+Fhijkqgh37fr102uLu4lQHVkRHMbIrHX8aRjb
   Q==;
X-CSE-ConnectionGUID: 7V4rZNhRT/6eLkbWATykqA==
X-CSE-MsgGUID: GWlr5DpnRS+r381nptUhhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36003526"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="36003526"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 18:21:26 -0700
X-CSE-ConnectionGUID: Td8yQlI8RvCk2njKwJoU+w==
X-CSE-MsgGUID: Or1skl1CQ4a8rwVbYK6Mwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="67394950"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2024 18:21:24 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snpZK-000FS4-1l;
	Tue, 10 Sep 2024 01:21:22 +0000
Date: Tue, 10 Sep 2024 09:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2] mantis_dma.c:undefined reference
 to `dvb_dmx_swfilter_204'
Message-ID: <202409100914.uFuwbp8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   a72956a237a36d67b4d2bd4d9c5a1e4f2ba99f6d
commit: a46280457e55aa3405f8327459f27cce648c921e [2/2] FROMLIST: media: Kconfig: Make DVB_CORE=m possible when MEDIA_SUPPORT=y
config: i386-buildonly-randconfig-002-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100914.uFuwbp8z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100914.uFuwbp8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100914.uFuwbp8z-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: phylink.c:(.text+0xf3b): undefined reference to `__dynamic_netdev_dbg'
   ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x10d4): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x16cb): undefined reference to `phy_get_pause'
   ld: phylink.c:(.text+0x17aa): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x17b8): undefined reference to `phy_speed_to_str'
   ld: phylink.c:(.text+0x17fa): undefined reference to `__dynamic_netdev_dbg'
   ld: phylink.c:(.text+0x1850): undefined reference to `phy_duplex_to_str'
   ld: phylink.c:(.text+0x185e): undefined reference to `phy_speed_to_str'
   ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x1ecd): undefined reference to `phy_attach_direct'
   ld: phylink.c:(.text+0x1f23): undefined reference to `phy_detach'
   ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0x1ff1): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x203f): undefined reference to `phy_disconnect'
   ld: drivers/net/phy/phylink.o: in function `phylink_mac_change':
   phylink.c:(.text+0x20ef): undefined reference to `__dynamic_netdev_dbg'
   ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x215d): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x2187): undefined reference to `netif_carrier_off'
   ld: phylink.c:(.text+0x21b6): undefined reference to `phy_start'
   ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x22bc): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x22cc): undefined reference to `phy_stop'
   ld: drivers/net/phy/phylink.o: in function `phylink_suspend':
   phylink.c:(.text+0x238f): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x23c5): undefined reference to `netif_carrier_off'
   ld: drivers/net/phy/phylink.o: in function `phylink_resume':
   phylink.c:(.text+0x243d): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0x251f): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x253f): undefined reference to `phy_ethtool_get_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0x258f): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x25a1): undefined reference to `phy_ethtool_set_wol'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0x2618): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x262e): undefined reference to `phy_ethtool_ksettings_get'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x273d): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x2753): undefined reference to `phy_ethtool_ksettings_set'
   ld: phylink.c:(.text+0x27fc): undefined reference to `phy_lookup_setting'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x2aad): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x2abf): undefined reference to `phy_restart_aneg'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_pauseparam':
   phylink.c:(.text+0x2b5f): undefined reference to `rtnl_is_locked'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x2be3): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x2c6e): undefined reference to `linkmode_set_pause'
   ld: phylink.c:(.text+0x2cba): undefined reference to `phy_set_asym_pause'
   ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0x2d8c): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x2da0): undefined reference to `phy_get_eee_err'
   ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x2df3): undefined reference to `phy_init_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x2e1f): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x2e31): undefined reference to `phy_ethtool_get_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x2e8f): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x2ea1): undefined reference to `phy_ethtool_set_eee'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x2f10): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x2f48): undefined reference to `phy_mii_ioctl'
   ld: phylink.c:(.text+0x3001): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x3094): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x328f): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x32bf): undefined reference to `phy_speed_down'
   ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x330c): undefined reference to `rtnl_is_locked'
   ld: phylink.c:(.text+0x333a): undefined reference to `phy_speed_up'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x34c7): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x34d8): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
   phylink.c:(.text+0x3623): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x3642): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x366c): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x36cf): undefined reference to `mdiobus_modify'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x371d): undefined reference to `mdiobus_read'
   ld: phylink.c:(.text+0x3733): undefined reference to `mdiobus_write'
   ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x376d): undefined reference to `mdiobus_read'
   ld: drivers/net/phy/phylink.o: in function `phylink_link_down.cold':
   phylink.c:(.text.unlikely+0xd): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_major_config.cold':
   phylink.c:(.text.unlikely+0x41): undefined reference to `netdev_printk'
   ld: phylink.c:(.text.unlikely+0x76): undefined reference to `netdev_printk'
   ld: phylink.c:(.text.unlikely+0xab): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy.cold':
   phylink.c:(.text.unlikely+0xf5): undefined reference to `netdev_printk'
   ld: drivers/net/phy/phylink.o:phylink.c:(.text.unlikely+0x131): more undefined references to `netdev_printk' follow
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   videobuf2-core.c:(.text+0x2d13): undefined reference to `v4l_vb2q_enable_media_source'
   ld: drivers/media/pci/mantis/mantis_dma.o: in function `mantis_dma_xfer':
>> mantis_dma.c:(.text+0x361): undefined reference to `dvb_dmx_swfilter_204'
>> ld: mantis_dma.c:(.text+0x36d): undefined reference to `dvb_dmx_swfilter'
   ld: drivers/media/pci/mantis/mantis_dvb.o: in function `mantis_dvb_init':
>> mantis_dvb.c:(.text+0x253): undefined reference to `dvb_register_adapter'
>> ld: mantis_dvb.c:(.text+0x2bb): undefined reference to `dvb_dmx_init'
>> ld: mantis_dvb.c:(.text+0x2f9): undefined reference to `dvb_dmxdev_init'
>> ld: mantis_dvb.c:(.text+0x3d5): undefined reference to `dvb_register_frontend'
>> ld: mantis_dvb.c:(.text+0x3fe): undefined reference to `dvb_unregister_adapter'
>> ld: mantis_dvb.c:(.text+0x41e): undefined reference to `dvb_dmxdev_release'
>> ld: mantis_dvb.c:(.text+0x425): undefined reference to `dvb_dmx_release'
>> ld: mantis_dvb.c:(.text+0x4c0): undefined reference to `dvb_unregister_frontend'
>> ld: mantis_dvb.c:(.text+0x4cb): undefined reference to `dvb_frontend_detach'
   ld: drivers/media/pci/mantis/mantis_dvb.o: in function `mantis_dvb_exit':
>> mantis_dvb.c:(.text+0x56a): undefined reference to `dvb_unregister_frontend'
   ld: mantis_dvb.c:(.text+0x575): undefined reference to `dvb_frontend_detach'
   ld: mantis_dvb.c:(.text+0x5b4): undefined reference to `dvb_dmxdev_release'
   ld: mantis_dvb.c:(.text+0x5bb): undefined reference to `dvb_dmx_release'
   ld: mantis_dvb.c:(.text+0x5cf): undefined reference to `dvb_unregister_adapter'
   ld: drivers/media/pci/mantis/mantis_evm.o: in function `mantis_hifevm_work':
>> mantis_evm.c:(.text+0x112): undefined reference to `dvb_ca_en50221_camchange_irq'
>> ld: mantis_evm.c:(.text+0x189): undefined reference to `dvb_ca_en50221_camchange_irq'
   ld: drivers/media/pci/mantis/mantis_ca.o: in function `mantis_ca_slot_reset':
>> mantis_ca.c:(.text+0xc9): undefined reference to `dvb_ca_en50221_camready_irq'
   ld: drivers/media/pci/mantis/mantis_ca.o: in function `mantis_ca_init':
>> mantis_ca.c:(.text+0x316): undefined reference to `dvb_ca_en50221_init'
   ld: drivers/media/pci/mantis/mantis_ca.o: in function `mantis_ca_exit':
>> mantis_ca.c:(.text+0x3a7): undefined reference to `dvb_ca_en50221_release'
   ld: drivers/media/pci/mantis/mantis_pcmcia.o: in function `mantis_pcmcia_init':
>> mantis_pcmcia.c:(.text+0x171): undefined reference to `dvb_ca_en50221_camchange_irq'
>> ld: mantis_pcmcia.c:(.text+0x1af): undefined reference to `dvb_ca_en50221_camchange_irq'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
