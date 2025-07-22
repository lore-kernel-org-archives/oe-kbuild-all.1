Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC9A26A0FD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 22:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753222990; cv=none; b=Kfmx45+FUTNzn9X+dZ1pMAik73jnSGOJmjMlG80cwWFNnhckxzOQ7ENTvh2Dbrfxd43D4rD9tRJtATrB/lBIZjks1wIJHwkxxjXn3uS6AuTWwX4QXwcUmVUOxMkbCJ/aF7EVvUAenzxdKuP8JfpAcb6L4mvIIPY8w2Z11AqR0P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753222990; c=relaxed/simple;
	bh=W+99/h92Tpwmt+IL8v5Dr8A6hNRFgsSyXy0QQCba1yo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jer23e0WROY+/JcBos0hyNLNI6/FjfSeu9K3fpWJeVA32z0FAaMy56E6K1NIQWdLXipwPIQHZplMfK2mCDCxdXcQ1G6/uE+fHCsUKUZVbYjGObMXIJqyzcuJwPuf9YmUgatINYHTLP08stQDRB799uz/f9g8dIQezQFcUhmkoF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5nJ43XT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5nJ43XT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753222989; x=1784758989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W+99/h92Tpwmt+IL8v5Dr8A6hNRFgsSyXy0QQCba1yo=;
  b=T5nJ43XTsuEOkONVFna78vi9om9PGbQVFwHXNh11tEz25l9hy/rYZBxC
   I1+ckx8JS9M3woz++G4qpX+3gNVmPYcNKGpMI7kfQRQTzL5aqFyA1GgOC
   0hvtVi5kwZjTD+oE3//nW95X4dTbzsDIBhgb1ngA0FsxKDAws/udzlma7
   n++Kbhch1a1GFKvroA48OI1yWr+qlWDcr9LIMunjEs1n/E2N6ggDinyq0
   G3PgB6TzpHQFUMg9wnDkCmOHf3QtkdcIJVroAUzCk7eeT2PYvt0fE0Upp
   fx5SHrcgYbrcNmzdHYk5eI8VXcK68gjF6f6/WPKFiON380wHultxfHEkA
   A==;
X-CSE-ConnectionGUID: v1iXxGrdSPSr8t242oig1Q==
X-CSE-MsgGUID: vIawh83sRtugVxn6dtky2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="73059075"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="73059075"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 15:23:08 -0700
X-CSE-ConnectionGUID: FJtKVmIQQF+Byfv6tebfOw==
X-CSE-MsgGUID: XhY19K7DSpO/R/hd0KY8cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="159999002"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jul 2025 15:23:07 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueLO4-0001Yj-2v;
	Tue, 22 Jul 2025 22:23:04 +0000
Date: Wed, 23 Jul 2025 00:22:14 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 82/87]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c: warning: EXPORT_SYMBOL() is
 used, but #include <linux/export.h> is missing
Message-ID: <202507230058.rIWZ4FFJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   05f94f4f1c1174f5bbb0e4311ee9c397bba69b87
commit: 52257f5195119f5b4b79d5811367cd047af0bfd9 [82/87] net: mediatek: add proprietary debugfs
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250723/202507230058.rIWZ4FFJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507230058.rIWZ4FFJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230058.rIWZ4FFJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/can/ctucanfd/ctucanfd_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/can/dev/dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/can/dev/length.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/can/dev/rx-offload.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/can/dev/skb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/can/m_can/m_can.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/can/sja1000/sja1000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/dsa/b53/b53_serdes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/dsa/lan9303-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/dsa/mt7530.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/dsa/ocelot/felix.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/dsa/realtek/realtek-mdio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/dsa/realtek/realtek-smi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/dsa/realtek/rtl8366-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/dsa/realtek/rtl83xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/dsa/vitesse-vsc73xx-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/dsa/xrs700x/xrs700x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/8390/8390.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/8390/8390p.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/8390/ax88796.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/airoha/airoha_npu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/amd/7990.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/amd/pds_core/adminq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/amd/pds_core/auxbus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/amd/pds_core/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/amd/pds_core/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/aquantia/atlantic/aq_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/arc/emac_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/broadcom/asp2/bcmasp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/broadcom/bgmac-bcma-mdio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/broadcom/bgmac.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/broadcom/cnic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/common/cavium_ptp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/liquidio/cn66xx_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/liquidio/cn68xx_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/liquidio/lio_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/liquidio/lio_ethtool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/liquidio/octeon_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/liquidio/octeon_droq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/liquidio/octeon_mem_ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/liquidio/octeon_nic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/liquidio/request_manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/liquidio/response_manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/thunder/thunder_bgx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cavium/thunder/thunder_xcv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/chelsio/cxgb4/clip_tbl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/chelsio/cxgb4/l2t.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/chelsio/cxgb4/smt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_cm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cisco/enic/enic_api.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/cisco/enic/vnic_dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/emulex/benet/be_cmds.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/emulex/benet/be_roce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/dpaa2/dpaa2-ethtool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/enetc/enetc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/enetc/enetc_cbdr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/enetc/enetc_ethtool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/enetc/enetc_ierb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/enetc/enetc_mdio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/enetc/enetc_pci_mdio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/enetc/enetc_pf_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/enetc/enetc_ptp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/enetc/ntmp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/fec_mpc52xx_phy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/fman/fman.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/fman/fman_keygen.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/fman/fman_port.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/freescale/fman/fman_sp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/fungible/funcore/fun_dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/fungible/funcore/fun_queue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/hisilicon/hns/hnae.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/hisilicon/hns3/hnae3.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_rss.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_tqp_stats.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/intel/i40e/i40e_client.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/intel/ice/ice_idc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/intel/ice/ice_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/intel/libeth/rx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/intel/libie/rx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/mvneta_bm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/octeontx2/af/mbox.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_devlink.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_flows.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_ptp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/marvell/prestera/prestera_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mediatek/mtk_wed_ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx4/fw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx4/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/cmd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/cq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_offload.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/eq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/eswitch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/events.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/fpga/sdk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/fw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
