Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967232F4317
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 01:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749776482; cv=none; b=TFaY7NtsiyvFF7xJ8RT4OsQt8WM4zJWmbya4Y9YjVHSO1yWaRY4Zw9+WIl8eM0u9nCM+mKSxEHMXQsSrImWzVofVlCvnJNzrjhrOjeG4m4i4gsh6AoI1KVvxk2JCrwE1zVQeK8lix7uLsAICaXxxba0pidQpkDH5n1HDpVOUApE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749776482; c=relaxed/simple;
	bh=1fZXPtvO/rp3VzudZQXNoMj5hF8PPLozg4330FZjCKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNv4smrkBYfh+/z9sS4gwCXSWeencDv85fO8QPosP3cNzqciy7x210SwnWy6FQ/lrks3LfgE0pDA86nouFIr4qggKOrIoICBoRe+26a+FTH/FzamS8wQK7aSPCfOsfXD4RU8jz71Dl4+qsKco2iVNioNKWK1XSCUVC7LikW5zV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDcnxju4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDcnxju4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749776479; x=1781312479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1fZXPtvO/rp3VzudZQXNoMj5hF8PPLozg4330FZjCKc=;
  b=XDcnxju4wnaAdv+NCqiI9TikkfpzKRSE27dLB88Z806nlr+ss6F2PG8X
   SNDy7p2OM1jSRkt+DPraqH7m3eaD3RsAsfTpKnDVABXJvCQA8ctKattSu
   WcSxRVztfQ2H4rMC7qSIiP/RXMts0SX+JwRgPqG8p40OZJH+j1p53zr+3
   6BmNxUjeT4xKwPw+nYTWIVxcoeDOqE9rpJC19V5RzcWLddaMalezfg3GE
   XNlXfC/apSiwitlIfxzAfghTqmNcfqf2CvHM/K0KUUnek5DnKA1+Rub2a
   sAkQs09so1y6OInO34QGjlGts51frvFhXX4q9DqBFZyjYoQiWkIeLK+4e
   Q==;
X-CSE-ConnectionGUID: usWAUKypSzuxnv4vcbCUlQ==
X-CSE-MsgGUID: pUD4UUXlS6WHw/MnmC6gVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69551613"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="69551613"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 18:01:19 -0700
X-CSE-ConnectionGUID: +gx+i/IdSHqP6sZTY/pMaA==
X-CSE-MsgGUID: wA57kOzWQ9uA8+vURfKnLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="147588276"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jun 2025 18:01:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPsnD-000C4M-0Y;
	Fri, 13 Jun 2025 01:01:15 +0000
Date: Fri, 13 Jun 2025 09:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: Tatyana Nikolova <tatyana.e.nikolova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [iwl-next v2 2/6] idpf: implement core RDMA
 auxiliary dev create, init, and destroy
Message-ID: <202506130835.geH9Gyqx-lkp@intel.com>
References: <20250612220002.1120-3-tatyana.e.nikolova@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612220002.1120-3-tatyana.e.nikolova@intel.com>

Hi Tatyana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc1 next-20250612]
[cannot apply to tnguy-next-queue/dev-queue tnguy-net-queue/dev-queue horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tatyana-Nikolova/idpf-use-reserved-RDMA-vectors-from-control-plane/20250613-060229
base:   linus/master
patch link:    https://lore.kernel.org/r/20250612220002.1120-3-tatyana.e.nikolova%40intel.com
patch subject: [Intel-wired-lan] [iwl-next v2 2/6] idpf: implement core RDMA auxiliary dev create, init, and destroy
config: x86_64-buildonly-randconfig-004-20250613 (https://download.01.org/0day-ci/archive/20250613/202506130835.geH9Gyqx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130835.geH9Gyqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130835.geH9Gyqx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/qpic_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mtd/nand/raw/atmel/pmecc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mtd/nand/raw/brcmnand/brcmnand.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mtd/nand/raw/denali.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mtd/nand/raw/ingenic/ingenic_ecc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mtd/nand/raw/nand_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mtd/nand/raw/nand_legacy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mtd/nand/raw/omap_elm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mtd/nand/raw/sm_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mtd/spi-nor/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mtd/tests/mtd_test.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mtd/ubi/kapi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/Space.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/arcnet/arcnet.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/arcnet/com20020.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/can/c_can/c_can_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/can/cc770/cc770.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
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
>> drivers/net/ethernet/intel/idpf/idpf_idc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
