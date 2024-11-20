Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1797315E5D4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 19:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732129951; cv=none; b=B39f86M7b7LaTCYOWa1j3aKzf4SZcfYvBx8+Ixg2dmWsV/D7/qD0m/7C0Qt2eycQ2rLCJibVoWJYobYwtOQdh63hi5+C64ilMSwmGXtFZ7LV7H/MxpfXoFqss/zJ0uFKzE87OQ+1CbvyQzBHZyOhqg7xf3rPQiIOlg+na2rU2Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732129951; c=relaxed/simple;
	bh=5Wwh74nVnuJhMYdAeYHme8nG57TD84eaXmyX6t6+I68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T5vzRHeldwulv1X6UQYT2yI0y88ImIqYto6xh1/NL8pvFsv1BgdCX3FOFaiHePGbq9XIiQxkbiijeJJE5XBk2+4Xa5wRw4b/vC/+crZUcPcZ9EifKY3YVBO3Jt6n/m9JMdhiNYF/7vE7yxVsrWbCy9VJ7qc1wwJvrBIeHtK3CzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1VvU78o; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1VvU78o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732129949; x=1763665949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Wwh74nVnuJhMYdAeYHme8nG57TD84eaXmyX6t6+I68=;
  b=W1VvU78oM5fJ9ZBOL8D9LlYGVoxfNzJma8+5q5dw83liIGePVF00U4nR
   3oEhIJxKx1/lGdizzYhPYRjK6+HG/capl2PI4DIS02ZHnkRmrL1pT9bhA
   6/OgHC/LgBvYLSjUncFX7C8jynWTq5mK8R6UtoIKNVlP2TKV1rguUriqc
   yK3UWuRNndujfg18v6pS2mD8oCjnJmiZp568/Gp9w7guL7TLcmBDoSLjv
   Jm81ovS/yzgGcwIcNob3snIR0z6psYGHnXO5V1YQlAhOjL9wihS0x4fbb
   DBpx4MoAm/C3G3psVvIDly3H2lc7+I+eNi8ZMgMBM/xBz8Pq/o+poFG76
   Q==;
X-CSE-ConnectionGUID: 8sWDxzoGREK5Wtt/NMDxAQ==
X-CSE-MsgGUID: 7/5MeWlaS4uGPPaB+MiuZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32139478"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="32139478"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 11:12:29 -0800
X-CSE-ConnectionGUID: PZX2IEfbS7Gzi4ojLIXgSQ==
X-CSE-MsgGUID: tLP4UzL0S1uoYA7X8giWkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="94825126"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2024 11:12:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDq7l-00016f-0H;
	Wed, 20 Nov 2024 19:12:25 +0000
Date: Thu, 21 Nov 2024 03:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2056:34:
 sparse: sparse: incorrect type in return expression (different address
 spaces)
Message-ID: <202411210302.R7m6i1xC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bennie,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cce003012298a00277187319a2527882a18278c1
commit: 8d65cdad5ea8e309af47a9a70c538bbbc1223e9a [1474/1474] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241121/202411210302.R7m6i1xC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210302.R7m6i1xC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210302.R7m6i1xC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2056:34: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected unsigned char [usertype] * @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2056:34: sparse:     expected unsigned char [usertype] *
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2056:34: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2235:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected unsigned char [usertype] * @@     got unsigned char [noderef] [usertype] __iomem *hw_addr @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2235:23: sparse:     expected unsigned char [usertype] *
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2235:23: sparse:     got unsigned char [noderef] [usertype] __iomem *hw_addr
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:17:9: sparse: sparse: context imbalance in 'nbl_send_kt_data' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:95:17: sparse: sparse: context imbalance in 'nbl_check_kt_data' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:158:42: sparse: sparse: context imbalance in 'nbl_phy_fem_clear_tcam_ad' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:255:26: sparse: sparse: context imbalance in 'nbl_phy_fem_em0_pt_phy_l2_init' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:370:25: sparse: sparse: context imbalance in 'nbl_phy_search_key' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:432:26: sparse: sparse: context imbalance in 'nbl_phy_add_tcam' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:438:13: sparse: sparse: context imbalance in 'nbl_phy_del_tcam' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:480:9: sparse: sparse: context imbalance in 'nbl_phy_add_mcc' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:483:13: sparse: sparse: context imbalance in 'nbl_phy_del_mcc' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:568:13: sparse: sparse: context imbalance in 'nbl_shaping_eth_init' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:812:13: sparse: sparse: context imbalance in 'nbl_epro_action_filter_cfg' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:934:49: sparse: sparse: context imbalance in 'nbl_phy_init_qid_map_table' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:971:41: sparse: sparse: context imbalance in 'nbl_phy_set_qid_map_table' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1041:26: sparse: sparse: context imbalance in 'nbl_phy_cfg_ipro_dn_sport_tbl' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1067:26: sparse: sparse: context imbalance in 'nbl_phy_set_vnet_queue_info' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1078:26: sparse: sparse: context imbalance in 'nbl_phy_clear_vnet_queue_info' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1091:26: sparse: sparse: context imbalance in 'nbl_phy_cfg_vnet_qinfo_log' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1174:9: sparse: sparse: context imbalance in 'nbl_phy_restore_dvn_context' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1193:9: sparse: sparse: context imbalance in 'nbl_phy_restore_uvn_context' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1205:25: sparse: sparse: context imbalance in 'nbl_phy_get_tx_queue_cfg' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1223:25: sparse: sparse: context imbalance in 'nbl_phy_get_rx_queue_cfg' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1253:26: sparse: sparse: context imbalance in 'nbl_phy_cfg_tx_queue' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1274:26: sparse: sparse: context imbalance in 'nbl_phy_cfg_rx_queue' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1326:26: sparse: sparse: context imbalance in 'nbl_phy_set_tc_wgt' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1350:26: sparse: sparse: context imbalance in 'nbl_phy_active_shaping' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1371:26: sparse: sparse: context imbalance in 'nbl_phy_deactive_shaping' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1408:26: sparse: sparse: context imbalance in 'nbl_phy_set_shaping' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1515:26: sparse: sparse: context imbalance in 'nbl_phy_init_epro_rss_key' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1521:13: sparse: sparse: context imbalance in 'nbl_phy_read_epro_rss_key' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1563:25: sparse: sparse: context imbalance in 'nbl_phy_get_rss_alg_sel' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1583:26: sparse: sparse: context imbalance in 'nbl_phy_init_epro_vpt_tbl' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1602:26: sparse: sparse: context imbalance in 'nbl_phy_set_epro_rss_default' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1627:26: sparse: sparse: context imbalance in 'nbl_phy_set_epro_rss_pt' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1645:26: sparse: sparse: context imbalance in 'nbl_phy_clear_epro_rss_pt' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1658:26: sparse: sparse: context imbalance in 'nbl_phy_disable_dvn' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1667:26: sparse: sparse: context imbalance in 'nbl_phy_disable_uvn' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1687:25: sparse: sparse: context imbalance in 'nbl_phy_is_rxq_drain_out' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1747:9: sparse: sparse: context imbalance in 'nbl_phy_save_dvn_ctx' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1770:9: sparse: sparse: context imbalance in 'nbl_phy_save_uvn_ctx' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1802:25: sparse: sparse: context imbalance in 'nbl_phy_get_tx_queue_err_stats' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1832:26: sparse: sparse: context imbalance in 'nbl_phy_setup_queue_switch' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:1891:26: sparse: sparse: context imbalance in 'nbl_phy_init_pfc' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2059:13: sparse: sparse: context imbalance in 'nbl_phy_configure_msix_map' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2097:26: sparse: sparse: context imbalance in 'nbl_phy_configure_msix_info' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2238:13: sparse: sparse: context imbalance in 'nbl_phy_set_promisc_mode' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2260:25: sparse: sparse: context imbalance in 'nbl_phy_get_coalesce' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2267:13: sparse: sparse: context imbalance in 'nbl_phy_set_coalesce' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2293:26: sparse: sparse: context imbalance in 'nbl_phy_set_spoof_check_addr' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2309:26: sparse: sparse: context imbalance in 'nbl_phy_set_spoof_check_enable' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2472:25: sparse: sparse: context imbalance in 'nbl_phy_get_fw_pong' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2477:13: sparse: sparse: context imbalance in 'nbl_phy_set_fw_pong' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2532:26: sparse: sparse: context imbalance in 'nbl_phy_process_abnormal_queue' - different lock contexts for basic block

vim +2056 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c

bad535d287c9c1 Bennie Yan 2024-09-24  2047  
bad535d287c9c1 Bennie Yan 2024-09-24  2048  static u8 *nbl_phy_get_msix_irq_enable_info(void *priv, u16 global_vector_id, u32 *irq_data)
bad535d287c9c1 Bennie Yan 2024-09-24  2049  {
bad535d287c9c1 Bennie Yan 2024-09-24  2050  	struct nbl_phy_mgt *phy_mgt = (struct nbl_phy_mgt *)priv;
bad535d287c9c1 Bennie Yan 2024-09-24  2051  	struct nbl_msix_notify msix_notify = { 0 };
bad535d287c9c1 Bennie Yan 2024-09-24  2052  
bad535d287c9c1 Bennie Yan 2024-09-24  2053  	msix_notify.glb_msix_idx = global_vector_id;
bad535d287c9c1 Bennie Yan 2024-09-24  2054  	memcpy(irq_data, &msix_notify, sizeof(msix_notify));
bad535d287c9c1 Bennie Yan 2024-09-24  2055  
bad535d287c9c1 Bennie Yan 2024-09-24 @2056  	return (phy_mgt->hw_addr + NBL_PCOMPLETER_MSIX_NOTIRY_OFFSET);
bad535d287c9c1 Bennie Yan 2024-09-24  2057  }
bad535d287c9c1 Bennie Yan 2024-09-24  2058  

:::::: The code at line 2056 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
