Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AF8209665
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151287; cv=none; b=qdZIUw18+nF9Jg5JjAYOSyn+wmqeQpHFc/k7KbQVYyqyID/ZI1buo22OzISr2bZfILcSGJdVoSyd0tibZo0f29rWamckERgwfhogrgqr8VlPhPPPkRY0K6jFih+SWbsll7M1IBgeoNTtpL3XKwfrqwZil4XeRVslySFm0FT8ND4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151287; c=relaxed/simple;
	bh=e0D8/XvywHJTPtlNd/w4j/7SAf7g7HQOxAWFxBr8AOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fONpQtdtMoFqrzCn0vpcP8Nk+haF+6FvPos16jP1KACMKhYfPHaiJ17JvsU8wuR3XNz8br9HUw1Wj0JK9NclRqvppuIBd3fuNJUqmxNiw/OdggIieaNw4CsxJQ0s5Ut8s/VjlI9KJVQM+VD+HMoSvWCMtgJUTuk9q1DoL4baDAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXKVPZQU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXKVPZQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733151283; x=1764687283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e0D8/XvywHJTPtlNd/w4j/7SAf7g7HQOxAWFxBr8AOk=;
  b=PXKVPZQU6FkaypzTTkQo6wbxgf2g25DRhFyxh3ynZJlee3U/TIDJsWed
   oyHJI7btrwh4y+VIyIEZsnpQzARr6Im//0Ej9XnXibY+1ip2Nd5KEOjEp
   27Rm2l8LfE0qhFIxGZtpi0lDoTvDe0ctlwazTYFMT1EJMgzlbC3LcKCNx
   cdQLhPOUrHUYrte0mJM77fcf6P2ZNqyRUg4WJpqqqOUmr/VkONvPZovj5
   ROH5TkBx/P5d6oE1E1uRffVodt8OV82k0IHn9V6t4ZHWnvWkJQ+OivbWN
   jsAjG1IYu0caeRaiuIRKb2FmkBlL9noKfN0kegH4aN5S+ss5PCU1ppRI2
   w==;
X-CSE-ConnectionGUID: THEtbP8TQQG8KS5mqnb0sg==
X-CSE-MsgGUID: WanJTPzPTy6VftLd2XhkcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33198236"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="33198236"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 06:54:42 -0800
X-CSE-ConnectionGUID: Y27UqduzTVOFm5r25rxpnA==
X-CSE-MsgGUID: fu/2zq4HT5WJs4TlymothA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="130604387"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Dec 2024 06:54:40 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI7or-0002VN-0P;
	Mon, 02 Dec 2024 14:54:37 +0000
Date: Mon, 2 Dec 2024 22:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2056:34:
 sparse: sparse: incorrect type in return expression (different address
 spaces)
Message-ID: <202412022246.dtzzrYlp-lkp@intel.com>
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
head:   9809e40d1abbcdf278f3db91f03a94507bdbb442
commit: 8d65cdad5ea8e309af47a9a70c538bbbc1223e9a [1474/1474] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241202/202412022246.dtzzrYlp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412022246.dtzzrYlp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412022246.dtzzrYlp-lkp@intel.com/

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

bad535d287c9c10 Bennie Yan 2024-09-24  2047  
bad535d287c9c10 Bennie Yan 2024-09-24  2048  static u8 *nbl_phy_get_msix_irq_enable_info(void *priv, u16 global_vector_id, u32 *irq_data)
bad535d287c9c10 Bennie Yan 2024-09-24  2049  {
bad535d287c9c10 Bennie Yan 2024-09-24  2050  	struct nbl_phy_mgt *phy_mgt = (struct nbl_phy_mgt *)priv;
bad535d287c9c10 Bennie Yan 2024-09-24  2051  	struct nbl_msix_notify msix_notify = { 0 };
bad535d287c9c10 Bennie Yan 2024-09-24  2052  
bad535d287c9c10 Bennie Yan 2024-09-24  2053  	msix_notify.glb_msix_idx = global_vector_id;
bad535d287c9c10 Bennie Yan 2024-09-24  2054  	memcpy(irq_data, &msix_notify, sizeof(msix_notify));
bad535d287c9c10 Bennie Yan 2024-09-24  2055  
bad535d287c9c10 Bennie Yan 2024-09-24 @2056  	return (phy_mgt->hw_addr + NBL_PCOMPLETER_MSIX_NOTIRY_OFFSET);
bad535d287c9c10 Bennie Yan 2024-09-24  2057  }
bad535d287c9c10 Bennie Yan 2024-09-24  2058  

:::::: The code at line 2056 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
