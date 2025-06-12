Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F042F430C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 12:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731655; cv=none; b=D+zxWwm9OZ8iu0onLhEltTzolayywalMOa4Kz3n4Fp8EHGAq+t7EIeAdFkaJSMUDCfacb1CZVsKNDoMrwOaqLVkLBDnnHPBQ1C7qIIrfTXKoCFCXI9533sI0/mUdbUTe7g0HX9sQJe4lGHEYzVNccVfwuTnpIn85mjc886bFmf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731655; c=relaxed/simple;
	bh=LALLm9QsVMLo+Pojglru6wC/yIPu379w61KXNcQG3DA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mn7GCx7ln75IBT7fgx9HytSRwrAq5syTFoUvKSpsLdfA4SyETdHHz1WJcylkz1LztOJcCVN9p9LafnsAfz26/5F7UR2v/vwPqGNfUTmP8usuL5PAq252mvdCLvIK3eYNfm5KYUU9pWunmTy+cif/v4x+/gpj887f1/edoGJPRGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Okx+BELJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Okx+BELJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749731653; x=1781267653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LALLm9QsVMLo+Pojglru6wC/yIPu379w61KXNcQG3DA=;
  b=Okx+BELJKgEfcZ/FVdGXSw93HIcEUVww46QT1vpw/FJTEHgvh/PhG/Lz
   X41mZ65JvJYZ+lFsjNMLR5Atofo/AZH7jc3EbIVI/qk/wTraHZtcHAEGQ
   8eQleaRjUZsyBbl3SUZubujg1cPdGDDsnZE1EjSQuTJ2KLUGeUhHxlAqS
   VGyeKvKY4+wK2vyeHF5b/VllmgFtWCf3HyZP9yRLZKlmhPkAhPGviNpTG
   tsJ+QXndDBn7SI/F1DRklLraQGv3ePBbNmoheQUVeyABABOIbookfxIGN
   hFBMQUSgImgQW5hm9MQhjJTHXwdBRbHlRkyKfqiQdHmgBOYR5iKz43V/F
   A==;
X-CSE-ConnectionGUID: I0Nq8xYJTJO8xzcxlT6Pew==
X-CSE-MsgGUID: rUruqSYeSj6nWj2+FInRmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51782172"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="51782172"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:34:12 -0700
X-CSE-ConnectionGUID: o7hwTGWWQRazloHRcAD6jg==
X-CSE-MsgGUID: Sbuun0+6TDyFVz/Ep7cc8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="152272760"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2025 05:34:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPh8B-000BXG-27;
	Thu, 12 Jun 2025 12:34:07 +0000
Date: Thu, 12 Jun 2025 20:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 56/58]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c: warning: EXPORT_SYMBOL() is
 used, but #include <linux/export.h> is missing
Message-ID: <202506122031.Jo9Q3fyE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   f7319e5a07fb0c4d46de5eebb52b346cf457c3d9
commit: f242cb5a57020b9fa1d21792f7a785be9d372853 [56/58] net: mediatek: add proprietary debugfs
config: x86_64-buildonly-randconfig-001-20250612 (https://download.01.org/0day-ci/archive/20250612/202506122031.Jo9Q3fyE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506122031.Jo9Q3fyE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506122031.Jo9Q3fyE-lkp@intel.com/

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
