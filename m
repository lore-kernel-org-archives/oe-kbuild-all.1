Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866C5233D88
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 08:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631223; cv=none; b=P61QJ5cM6yghPfHQtnZuvtHhfmxasYWlvztnIdU3TsNX/0cfhDDgc3yXpS7njl6jbrmxo4JhopAz/TgfuZYnNbz+xpuF7him/NINRNvCaxW0UhNCRjqQx32IcD7b0xuAY3SxQjBEt+6YTYTxFs6TH3YZr9oNVNP8HfwBK89ZjkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631223; c=relaxed/simple;
	bh=6lKYHkadMNrKejq9KJyJyTvJTdMHAqCj2KsnZ9o/yBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lxl24cQJwaTgA8UrZ3u/SiGXCaVNPAhplX/6NFtz701LU69u4gdgQE1vLCJz+DRxspo62IEYo7rf7kIbJFdCluSCgaQAfpKUwABVjVJqnHEEd5v4t9xxiguM+gv8mBiioz83FL9XIurL1H2IO1iEiXhf2zxTHbaQ5HdmllQqmdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3S4W0jC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3S4W0jC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749631220; x=1781167220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6lKYHkadMNrKejq9KJyJyTvJTdMHAqCj2KsnZ9o/yBQ=;
  b=c3S4W0jC0zWlOQ4KBX56Ck2WnGSpIWprA0RQNW3EKfF/bpP0QsNIRxW4
   AxzFa+Ik2p7LD7Zbmqgb47yqRtVhvySQPNkFRcKNWNhl1YcAAK8xVj1/Y
   VW6my8zgd42wClqparkD6zj26iS/8VF5xoRE3VGPGpzD3gOi9cj7XRpjB
   78rBc7hoFt9CrlOV1YpffiQazNENyCu+ORFS/UHFV7PsDjgsGr8R7UYz9
   pC/ppphFAZsYOqxFTtVPayjkuUzupKHy2eNt7uTdJb8sF2VHQNwk/VvT4
   DgvK7Jc9vpq3RbR8zlMmvl/2/E+0I8v1HvpB8NiD7VAqxmBlmZjQhklfE
   Q==;
X-CSE-ConnectionGUID: eQ1YL1ANRM+Kv1QQvhSIdQ==
X-CSE-MsgGUID: BzADyf7cRVmQdiCXX3OaOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63113073"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="63113073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:40:20 -0700
X-CSE-ConnectionGUID: aayj0ETZS1ek8NMg7XX+cg==
X-CSE-MsgGUID: RSFaVWDGQ02Fi+9a+4kzdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="147486881"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jun 2025 01:40:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPH0K-000ABA-15;
	Wed, 11 Jun 2025 08:40:16 +0000
Date: Wed, 11 Jun 2025 16:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 28/57] drivers/net/pcs/pcs.c:
 warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
Message-ID: <202506111651.sBN8UVhD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   e5c7b7a9182ec3d5b1936a508b2b8d7b4479e7ab
commit: 9f9a989e4359dcd1050c37e0e7232bfc9ac95aa9 [28/57] net: pcs: implement Firmware node support for PCS driver
config: arc-randconfig-002-20250611 (https://download.01.org/0day-ci/archive/20250611/202506111651.sBN8UVhD-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506111651.sBN8UVhD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111651.sBN8UVhD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/lag/mpesw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/lib/gid.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/lib/macsec_fs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/mcg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/mr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/pd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/port.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/rl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/sriov.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/transobj.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/uar.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/wc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlxfw/mlxfw_fsm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlxsw/core_acl_flex_actions.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlxsw/core_acl_flex_keys.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlxsw/core_env.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlxsw/i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/micrel/ks8851_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/microchip/encx24j600-regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/microchip/fdma/fdma_api.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/microchip/vcap/vcap_api.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/microchip/vcap/vcap_tc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/microsoft/mana/gdma_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/microsoft/mana/mana_en.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mscc/ocelot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mscc/ocelot_devlink.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mscc/ocelot_flower.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mscc/ocelot_io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mscc/ocelot_mm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mscc/ocelot_mrp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mscc/ocelot_police.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mscc/ocelot_ptp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mscc/ocelot_stats.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mscc/ocelot_vcap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mscc/vsc7514_regs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/oa_tc6.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/qlogic/qed/qed_fcoe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/qlogic/qed/qed_iscsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/qlogic/qed/qed_l2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/qlogic/qed/qed_nvmetcp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/qlogic/qed/qed_rdma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/qlogic/qede/qede_rdma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/qualcomm/qca_7k_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/renesas/rcar_gen4_ptp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/sun/sunvnet_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/am65-cpts.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/cpsw-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/cpsw-phy-sel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/cpts.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/icssg/icss_iep.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/icssg/icssg_classifier.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/icssg/icssg_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/icssg/icssg_config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/icssg/icssg_ethtool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/icssg/icssg_mii_cfg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/icssg/icssg_queues.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/icssg/icssg_stats.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/k3-cppi-desc-pool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/ti/netcp_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/wangxun/libwx/wx_hw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/wangxun/libwx/wx_lib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/wangxun/libwx/wx_ptp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/wangxun/libwx/wx_sriov.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/wiznet/w5100.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/xscale/ptp_ixp46x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/geneve.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/hamradio/hdlcdrv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ipvlan/ipvlan_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ipvlan/ipvlan_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/loopback.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/macsec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/macvlan.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/mdio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/mdio/acpi_mdio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/mdio/fwnode_mdio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/mdio/mdio-bitbang.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/mdio/mdio-cavium.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/mdio/mdio-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/mdio/mdio-mscc-miim.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/mdio/mdio-mux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/mdio/mdio-regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/mdio/mdio-xgene.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/mdio/of_mdio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/mii.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/net_failover.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/pcs/pcs-lynx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/pcs/pcs-mtk-lynxi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/pcs/pcs-rzn1-miic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/pcs/pcs-xpcs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/net/pcs/pcs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/bcm-phy-ptp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/fixed_phy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/linkmode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/mdio_bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/mdio_bus_provider.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/mdio_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/mdio_devres.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/mediatek/mtk-phy-lib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/microchip_rds_ptp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/mii_timestamper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/open_alliance_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/phy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/phy_caps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/phy_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/phy_led_triggers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/phy_link_topology.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/phy_package.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/qcom/qcom-phy-lib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/smsc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/phy/stubs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ppp/ppp_generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ppp/pppox.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/pse-pd/pse_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/slip/slhc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/sungem_phy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/tap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/team/team_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/tun.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/usb/cdc_ether.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/usb/cdc_ncm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/usb/r8152.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/usb/rndis_host.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/usb/usbnet.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/vxlan/vxlan_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wan/framer/framer-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wan/framer/pef2256/pef2256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wan/hdlc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath10k/bmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath10k/ce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath10k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath10k/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath10k/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath10k/htc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath10k/htt_rx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath10k/htt_tx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath10k/mac.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath10k/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath11k/ce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath11k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath11k/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath11k/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath11k/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath11k/dp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath11k/fw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath11k/hal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath11k/pcic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath11k/qmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath11k/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath12k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath9k/common-beacon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath9k/common-debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath9k/common-init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath9k/common-spectral.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath9k/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath9k/dynack.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/ath9k/hw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ath/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/broadcom/brcm80211/brcmutil/d11.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/broadcom/brcm80211/brcmutil/utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/ipw2x00/libipw_crypto.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/ipw2x00/libipw_geo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/ipw2x00/libipw_module.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/ipw2x00/libipw_rx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/ipw2x00/libipw_tx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/ipw2x00/libipw_wx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlegacy/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/fw/acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/fw/dbg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/fw/dump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/fw/img.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/fw/init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/fw/paging.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/fw/pnvm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/fw/regulatory.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/fw/rs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/fw/smem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/fw/uefi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/iwl-drv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/iwl-trans.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/iwl-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/mei/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/mei/net.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intel/iwlwifi/pcie/trans.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/intersil/p54/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
