Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901E22C1A2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866588; cv=none; b=m397Y+1mAbu27jV9faVT4Bs4/AnHYuMaLhXvx0gqg/5fMcg7J2XNn81HMc3bbQpaPH7DvjN1ca33hGHPdQ2YXPZU35xX1s03ctR/DoezOj5DW4x3jfyAS93DnwsZK7pU/0uiyB6hC3Z3Bv9qZpWkNY269BSv3TyatUTDfRaBGFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866588; c=relaxed/simple;
	bh=DyaVT6OynXsq6XkNpJJT85BAC1X6Avwk2x59Djk2uJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fTutj+xFlS2FWVMBSGSgsGfvz07cmSHHpE1z0Ul1N7HAnzP88iGBkhtMtvWc++2JBztdsbOccMtQ6IGRtmdceg3OOTWEsAmLCzwrK+xsmr6/lMWOXW3z5Hli+FySd3L4BA32nHAhps6KdxxH9MJUezs2MellYGqE+azs7JwbUik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NB0j3m1E; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NB0j3m1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750866586; x=1782402586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DyaVT6OynXsq6XkNpJJT85BAC1X6Avwk2x59Djk2uJ4=;
  b=NB0j3m1Eq1L3WvN+ml2J7GuG/RCRHVJ24b2A82oNTBP8ByySahLnH8Vc
   b3Hk7RA/ESWkwYT/u4OJlY3cKFzsqkUKNryyhhekXJVoCn7TAh7P66LTJ
   VqF0ZVgSsU7aJYXNGqhoCBb+l5Au/fR+Htl18e/ZdQFGT4ZP6j+HaIm3v
   iVET7+aGTgXCH8KlayHFmjE4d6DLSkc4Bi2GH5s1jcfUi1atZ6JXlbNij
   KO9pJd0DD61k6jzyDvAzP5X8PHj/oUFHIq7M+RIcAk213UNxXtLoBT8hw
   IGlPetP74C94kP4gEJJK5K3F0ZaFUVpUoHtJruMfGmaoquHek3s4tBGfe
   w==;
X-CSE-ConnectionGUID: y2HYBDLyQha3S3j8l1ItAQ==
X-CSE-MsgGUID: AaTdILGsSBeQrvdWmYluug==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="70713258"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="70713258"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 08:49:45 -0700
X-CSE-ConnectionGUID: 3HXrAXS8Qp63k4xkXyB3IQ==
X-CSE-MsgGUID: Rat6pUueSPSRjc+QWAiB2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="152744000"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 25 Jun 2025 08:49:43 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUSNZ-00003r-14;
	Wed, 25 Jun 2025 15:49:41 +0000
Date: Wed, 25 Jun 2025 17:48:44 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:149:5:
 warning: no previous prototype for
 'nbl_res_queue_setup_qid_map_table_leonis'
Message-ID: <202506252327.VuoQfdNB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 69181c3c9413ccaa4dab458057d13efda520cb60 [2195/2195] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-2005-20250501 (https://download.01.org/0day-ci/archive/20250625/202506252327.VuoQfdNB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506252327.VuoQfdNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506252327.VuoQfdNB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:149:5: warning: no previous prototype for 'nbl_res_queue_setup_qid_map_table_leonis' [-Wmissing-prototypes]
     149 | int nbl_res_queue_setup_qid_map_table_leonis(struct nbl_resource_mgt *res_mgt, u16 func_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:216:6: warning: no previous prototype for 'nbl_res_queue_remove_qid_map_table_leonis' [-Wmissing-prototypes]
     216 | void nbl_res_queue_remove_qid_map_table_leonis(struct nbl_resource_mgt *res_mgt, u16 func_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:545:5: warning: no previous prototype for 'nbl_res_queue_init_qid_map_table' [-Wmissing-prototypes]
     545 | int nbl_res_queue_init_qid_map_table(struct nbl_resource_mgt *res_mgt,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:1193:5: warning: no previous prototype for 'nbl_queue_setup_ops_leonis' [-Wmissing-prototypes]
    1193 | int nbl_queue_setup_ops_leonis(struct nbl_resource_ops *res_ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:1202:6: warning: no previous prototype for 'nbl_queue_remove_ops_leonis' [-Wmissing-prototypes]
    1202 | void nbl_queue_remove_ops_leonis(struct nbl_resource_ops *res_ops)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:1209:6: warning: no previous prototype for 'nbl_queue_mgt_init_leonis' [-Wmissing-prototypes]
    1209 | void nbl_queue_mgt_init_leonis(struct nbl_queue_mgt *queue_mgt)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:450:6: warning: no previous prototype for 'nbl_flow_set_mt_input' [-Wmissing-prototypes]
     450 | void nbl_flow_set_mt_input(struct nbl_mt_input *mt_input, union nbl_common_data_u *kt_data,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:556:5: warning: no previous prototype for 'nbl_flow_insert_pp_ht' [-Wmissing-prototypes]
     556 | int nbl_flow_insert_pp_ht(struct nbl_flow_ht_mng *pp_ht_mng,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c: In function 'nbl_flow_add_flow':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:725:29: warning: variable 'phy_ops' set but not used [-Wunused-but-set-variable]
     725 |         struct nbl_phy_ops *phy_ops;
         |                             ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c: In function 'nbl_flow_del_flow':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:807:29: warning: variable 'phy_ops' set but not used [-Wunused-but-set-variable]
     807 |         struct nbl_phy_ops *phy_ops;
         |                             ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c: In function 'nbl_flow_add_macvlan':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:921:33: warning: variable 'common' set but not used [-Wunused-but-set-variable]
     921 |         struct nbl_common_info *common;
         |                                 ^~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c: At top level:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:1415:5: warning: no previous prototype for 'nbl_flow_mgt_start_leonis' [-Wmissing-prototypes]
    1415 | int nbl_flow_mgt_start_leonis(struct nbl_resource_mgt *res_mgt)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:1440:6: warning: no previous prototype for 'nbl_flow_mgt_stop_leonis' [-Wmissing-prototypes]
    1440 | void nbl_flow_mgt_stop_leonis(struct nbl_resource_mgt *res_mgt)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:1453:5: warning: no previous prototype for 'nbl_flow_setup_ops_leonis' [-Wmissing-prototypes]
    1453 | int nbl_flow_setup_ops_leonis(struct nbl_resource_ops *res_ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:1462:6: warning: no previous prototype for 'nbl_flow_remove_ops_leonis' [-Wmissing-prototypes]
    1462 | void nbl_flow_remove_ops_leonis(struct nbl_resource_ops *res_ops)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c: In function 'nbl_res_adminq_pt_filter_out':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:1568:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1568 |         int ret = 0;
         |             ^~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c: In function 'nbl_res_adminq_get_firmware_version':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:548:55: warning: '%08x' directive output may be truncated writing 8 bytes into a region of size between 2 and 11 [-Wformat-truncation=]
     548 |                          "%d.%d.%d build %04d%02d%02d %08x",
         |                                                       ^~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:547:17: note: 'snprintf' output between 30 and 39 bytes into a destination of size 32
     547 |                 snprintf(firmware_verion, ETHTOOL_FWVERS_LEN,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     548 |                          "%d.%d.%d build %04d%02d%02d %08x",
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     549 |                          BCD2BYTE((resp_param.version >> 16) & 0xFF),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     550 |                          BCD2BYTE((resp_param.version >> 8) & 0xFF),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     551 |                          BCD2BYTE(resp_param.version & 0xFF),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     552 |                          BCD2SHORT((resp_param.build_date >> 16) & 0xFFFF),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     553 |                          BCD2BYTE((resp_param.build_date >> 8) & 0xFF),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     554 |                          BCD2BYTE(resp_param.build_date & 0xFF),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     555 |                          resp_param.build_hash);
         |                          ~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:15:5: warning: no previous prototype for 'nbl_alloc_tx_rings' [-Wmissing-prototypes]
      15 | int nbl_alloc_tx_rings(struct nbl_resource_mgt *res_mgt, struct net_device *netdev,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c: In function 'nbl_res_txrx_clean_rx_irq':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:949:13: warning: variable 'sport_id' set but not used [-Wunused-but-set-variable]
     949 |         u16 sport_id;
         |             ^~~~~~~~
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:32:5: warning: no previous prototype for 'nbl_serv_setup_queues' [-Wmissing-prototypes]
      32 | int nbl_serv_setup_queues(struct nbl_service_mgt *serv_mgt, struct nbl_serv_ring_vsi_info *vsi_info)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:68:6: warning: no previous prototype for 'nbl_serv_flush_rx_queues' [-Wmissing-prototypes]
      68 | void nbl_serv_flush_rx_queues(struct nbl_service_mgt *serv_mgt, u16 ring_offset, u16 ring_num)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:77:5: warning: no previous prototype for 'nbl_serv_setup_rings' [-Wmissing-prototypes]
      77 | int nbl_serv_setup_rings(struct nbl_service_mgt *serv_mgt, struct net_device *netdev,
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:124:6: warning: no previous prototype for 'nbl_serv_stop_rings' [-Wmissing-prototypes]
     124 | void nbl_serv_stop_rings(struct nbl_service_mgt *serv_mgt,
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: In function 'nbl_serv_netdev_stop':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:734:40: warning: variable 'vsi_info' set but not used [-Wunused-but-set-variable]
     734 |         struct nbl_serv_ring_vsi_info *vsi_info;
         |                                        ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: In function 'nbl_serv_remove_txrx_queues':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:1406:35: warning: variable 'ring_mgt' set but not used [-Wunused-but-set-variable]
    1406 |         struct nbl_serv_ring_mgt *ring_mgt;
         |                                   ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: At top level:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2116:6: warning: no previous prototype for 'nbl_serv_pldmfw_op_pci_match_record' [-Wmissing-prototypes]
    2116 | bool nbl_serv_pldmfw_op_pci_match_record(struct pldmfw *context, struct pldmfw_record *record)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2851:5: warning: no previous prototype for 'nbl_serv_get_vf_base_vsi_id' [-Wmissing-prototypes]
    2851 | u16 nbl_serv_get_vf_base_vsi_id(void *priv, u16 func_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c:941:6: warning: no previous prototype for 'nbl_chan_clean_queue_subtask' [-Wmissing-prototypes]
     941 | void nbl_chan_clean_queue_subtask(void *priv, u8 chan_type)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/nbl_res_queue_setup_qid_map_table_leonis +149 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c

bad535d287c9c1 Bennie Yan 2024-09-24  148  
bad535d287c9c1 Bennie Yan 2024-09-24 @149  int nbl_res_queue_setup_qid_map_table_leonis(struct nbl_resource_mgt *res_mgt, u16 func_id,
bad535d287c9c1 Bennie Yan 2024-09-24  150  					     u64 notify_addr)
bad535d287c9c1 Bennie Yan 2024-09-24  151  {
bad535d287c9c1 Bennie Yan 2024-09-24  152  	struct nbl_common_info *common = NBL_RES_MGT_TO_COMMON(res_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  153  	struct nbl_queue_mgt *queue_mgt = NBL_RES_MGT_TO_QUEUE_MGT(res_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  154  	struct nbl_queue_info *queue_info = &queue_mgt->queue_info[func_id];
bad535d287c9c1 Bennie Yan 2024-09-24  155  	struct nbl_qid_map_table qid_map;
bad535d287c9c1 Bennie Yan 2024-09-24  156  	u64 key;
bad535d287c9c1 Bennie Yan 2024-09-24  157  	u16 *txrx_queues = queue_info->txrx_queues;
bad535d287c9c1 Bennie Yan 2024-09-24  158  	u16 qid_map_entries = queue_info->num_txrx_queues, qid_map_base, tail;
bad535d287c9c1 Bennie Yan 2024-09-24  159  	int i;
bad535d287c9c1 Bennie Yan 2024-09-24  160  
bad535d287c9c1 Bennie Yan 2024-09-24  161  	/* Get base location */
bad535d287c9c1 Bennie Yan 2024-09-24  162  	queue_info->notify_addr = notify_addr;
bad535d287c9c1 Bennie Yan 2024-09-24  163  	key = notify_addr >> NBL_QID_MAP_NOTIFY_ADDR_SHIFT;
bad535d287c9c1 Bennie Yan 2024-09-24  164  
bad535d287c9c1 Bennie Yan 2024-09-24  165  	for (i = 0; i < NBL_QID_MAP_TABLE_ENTRIES; i++) {
bad535d287c9c1 Bennie Yan 2024-09-24  166  		WARN_ON(key == nbl_res_queue_qid_map_key(queue_mgt->qid_map_table[i]));
bad535d287c9c1 Bennie Yan 2024-09-24  167  		if (key < nbl_res_queue_qid_map_key(queue_mgt->qid_map_table[i])) {
bad535d287c9c1 Bennie Yan 2024-09-24  168  			qid_map_base = i;
bad535d287c9c1 Bennie Yan 2024-09-24  169  			break;
bad535d287c9c1 Bennie Yan 2024-09-24  170  		}
bad535d287c9c1 Bennie Yan 2024-09-24  171  	}
bad535d287c9c1 Bennie Yan 2024-09-24  172  	if (i == NBL_QID_MAP_TABLE_ENTRIES) {
bad535d287c9c1 Bennie Yan 2024-09-24  173  		nbl_err(common, NBL_DEBUG_QUEUE, "No valid qid map key for func %d", func_id);
bad535d287c9c1 Bennie Yan 2024-09-24  174  		return -ENOSPC;
bad535d287c9c1 Bennie Yan 2024-09-24  175  	}
bad535d287c9c1 Bennie Yan 2024-09-24  176  
bad535d287c9c1 Bennie Yan 2024-09-24  177  	/* Calc tail, we will set the qid_map from 0 to tail.
bad535d287c9c1 Bennie Yan 2024-09-24  178  	 * We have to make sure that this range (0, tail) can cover all the changes, which need to
bad535d287c9c1 Bennie Yan 2024-09-24  179  	 * consider all the two tables. Therefore, it is necessary to store each table's tail, and
bad535d287c9c1 Bennie Yan 2024-09-24  180  	 * always use the larger one between this table's tail and the added tail.
bad535d287c9c1 Bennie Yan 2024-09-24  181  	 *
bad535d287c9c1 Bennie Yan 2024-09-24  182  	 * The reason can be illustrated in the following example:
bad535d287c9c1 Bennie Yan 2024-09-24  183  	 * Step 1: del some entries, which happens on table 1, and each table could be
bad535d287c9c1 Bennie Yan 2024-09-24  184  	 *      Table 0: 0 - 31 used
bad535d287c9c1 Bennie Yan 2024-09-24  185  	 *      Table 1: 0 - 15 used
bad535d287c9c1 Bennie Yan 2024-09-24  186  	 *      SW     : queue_mgt->total_qid_map_entries = 16
bad535d287c9c1 Bennie Yan 2024-09-24  187  	 * Step 2: add 2 entries, which happens on table 0, if we use 16 + 2 as the tail, then
bad535d287c9c1 Bennie Yan 2024-09-24  188  	 *      Table 0: 0 - 17 correctly added, 18 - 31 garbage data
bad535d287c9c1 Bennie Yan 2024-09-24  189  	 *      Table 1: 0 - 15 used
bad535d287c9c1 Bennie Yan 2024-09-24  190  	 *      SW     : queue_mgt->total_qid_map_entries = 18
bad535d287c9c1 Bennie Yan 2024-09-24  191  	 * And this is definitely wrong, it should use 32, table 0's original tail
bad535d287c9c1 Bennie Yan 2024-09-24  192  	 */
bad535d287c9c1 Bennie Yan 2024-09-24  193  	queue_mgt->total_qid_map_entries += qid_map_entries;
bad535d287c9c1 Bennie Yan 2024-09-24  194  	tail = max(queue_mgt->total_qid_map_entries,
bad535d287c9c1 Bennie Yan 2024-09-24  195  		   queue_mgt->qid_map_tail[queue_mgt->qid_map_select]);
bad535d287c9c1 Bennie Yan 2024-09-24  196  	queue_mgt->qid_map_tail[queue_mgt->qid_map_select] = queue_mgt->total_qid_map_entries;
bad535d287c9c1 Bennie Yan 2024-09-24  197  
bad535d287c9c1 Bennie Yan 2024-09-24  198  	/* Update qid map */
bad535d287c9c1 Bennie Yan 2024-09-24  199  	for (i = NBL_QID_MAP_TABLE_ENTRIES - qid_map_entries; i > qid_map_base; i--)
bad535d287c9c1 Bennie Yan 2024-09-24  200  		queue_mgt->qid_map_table[i - 1 + qid_map_entries] = queue_mgt->qid_map_table[i - 1];
bad535d287c9c1 Bennie Yan 2024-09-24  201  
bad535d287c9c1 Bennie Yan 2024-09-24  202  	for (i = 0; i < queue_info->num_txrx_queues; i++) {
bad535d287c9c1 Bennie Yan 2024-09-24  203  		qid_map.local_qid = 2 * i + 1;
bad535d287c9c1 Bennie Yan 2024-09-24  204  		qid_map.notify_addr_l = key;
bad535d287c9c1 Bennie Yan 2024-09-24  205  		qid_map.notify_addr_h = key >> NBL_QID_MAP_NOTIFY_ADDR_LOW_PART_LEN;
bad535d287c9c1 Bennie Yan 2024-09-24  206  		qid_map.global_qid = txrx_queues[i];
bad535d287c9c1 Bennie Yan 2024-09-24  207  		qid_map.ctrlq_flag = 0;
bad535d287c9c1 Bennie Yan 2024-09-24  208  		queue_mgt->qid_map_table[qid_map_base + i] = qid_map;
bad535d287c9c1 Bennie Yan 2024-09-24  209  	}
bad535d287c9c1 Bennie Yan 2024-09-24  210  
bad535d287c9c1 Bennie Yan 2024-09-24  211  	nbl_res_queue_set_qid_map_table(res_mgt, tail);
bad535d287c9c1 Bennie Yan 2024-09-24  212  
bad535d287c9c1 Bennie Yan 2024-09-24  213  	return 0;
bad535d287c9c1 Bennie Yan 2024-09-24  214  }
bad535d287c9c1 Bennie Yan 2024-09-24  215  
bad535d287c9c1 Bennie Yan 2024-09-24 @216  void nbl_res_queue_remove_qid_map_table_leonis(struct nbl_resource_mgt *res_mgt, u16 func_id)
bad535d287c9c1 Bennie Yan 2024-09-24  217  {
bad535d287c9c1 Bennie Yan 2024-09-24  218  	struct nbl_common_info *common = NBL_RES_MGT_TO_COMMON(res_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  219  	struct nbl_queue_mgt *queue_mgt = NBL_RES_MGT_TO_QUEUE_MGT(res_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  220  	struct nbl_queue_info *queue_info = &queue_mgt->queue_info[func_id];
bad535d287c9c1 Bennie Yan 2024-09-24  221  	struct nbl_qid_map_table qid_map;
bad535d287c9c1 Bennie Yan 2024-09-24  222  	u64 key;
bad535d287c9c1 Bennie Yan 2024-09-24  223  	u16 qid_map_entries = queue_info->num_txrx_queues, qid_map_base, tail;
bad535d287c9c1 Bennie Yan 2024-09-24  224  	int i;
bad535d287c9c1 Bennie Yan 2024-09-24  225  
bad535d287c9c1 Bennie Yan 2024-09-24  226  	/* Get base location */
bad535d287c9c1 Bennie Yan 2024-09-24  227  	key = queue_info->notify_addr >> NBL_QID_MAP_NOTIFY_ADDR_SHIFT;
bad535d287c9c1 Bennie Yan 2024-09-24  228  
bad535d287c9c1 Bennie Yan 2024-09-24  229  	for (i = 0; i < NBL_QID_MAP_TABLE_ENTRIES; i++) {
bad535d287c9c1 Bennie Yan 2024-09-24  230  		if (key == nbl_res_queue_qid_map_key(queue_mgt->qid_map_table[i])) {
bad535d287c9c1 Bennie Yan 2024-09-24  231  			qid_map_base = i;
bad535d287c9c1 Bennie Yan 2024-09-24  232  			break;
bad535d287c9c1 Bennie Yan 2024-09-24  233  		}
bad535d287c9c1 Bennie Yan 2024-09-24  234  	}
bad535d287c9c1 Bennie Yan 2024-09-24  235  	if (i == NBL_QID_MAP_TABLE_ENTRIES) {
bad535d287c9c1 Bennie Yan 2024-09-24  236  		nbl_err(common, NBL_DEBUG_QUEUE, "No valid qid map key for func %d", func_id);
bad535d287c9c1 Bennie Yan 2024-09-24  237  		return;
bad535d287c9c1 Bennie Yan 2024-09-24  238  	}
bad535d287c9c1 Bennie Yan 2024-09-24  239  
bad535d287c9c1 Bennie Yan 2024-09-24  240  	/* Calc tail, we will set the qid_map from 0 to tail.
bad535d287c9c1 Bennie Yan 2024-09-24  241  	 * We have to make sure that this range (0, tail) can cover all the changes, which need to
bad535d287c9c1 Bennie Yan 2024-09-24  242  	 * consider all the two tables. Therefore, it is necessary to store each table's tail, and
bad535d287c9c1 Bennie Yan 2024-09-24  243  	 * always use the larger one between this table's tail and the driver-stored tail.
bad535d287c9c1 Bennie Yan 2024-09-24  244  	 *
bad535d287c9c1 Bennie Yan 2024-09-24  245  	 * The reason can be illustrated in the following example:
bad535d287c9c1 Bennie Yan 2024-09-24  246  	 * Step 1: del some entries, which happens on table 1, and each table could be
bad535d287c9c1 Bennie Yan 2024-09-24  247  	 *      Table 0: 0 - 31 used
bad535d287c9c1 Bennie Yan 2024-09-24  248  	 *      Table 1: 0 - 15 used
bad535d287c9c1 Bennie Yan 2024-09-24  249  	 *      SW     : queue_mgt->total_qid_map_entries = 16
bad535d287c9c1 Bennie Yan 2024-09-24  250  	 * Step 2: del 2 entries, which happens on table 0, if we use 16 as the tail, then
bad535d287c9c1 Bennie Yan 2024-09-24  251  	 *      Table 0: 0 - 13 correct, 14 - 31 garbage data
bad535d287c9c1 Bennie Yan 2024-09-24  252  	 *      Table 1: 0 - 15 used
bad535d287c9c1 Bennie Yan 2024-09-24  253  	 *      SW     : queue_mgt->total_qid_map_entries = 14
bad535d287c9c1 Bennie Yan 2024-09-24  254  	 * And this is definitely wrong, it should use 32, table 0's original tail
bad535d287c9c1 Bennie Yan 2024-09-24  255  	 */
bad535d287c9c1 Bennie Yan 2024-09-24  256  	tail = max(queue_mgt->total_qid_map_entries,
bad535d287c9c1 Bennie Yan 2024-09-24  257  		   queue_mgt->qid_map_tail[queue_mgt->qid_map_select]);
bad535d287c9c1 Bennie Yan 2024-09-24  258  	queue_mgt->total_qid_map_entries -= qid_map_entries;
bad535d287c9c1 Bennie Yan 2024-09-24  259  	queue_mgt->qid_map_tail[queue_mgt->qid_map_select] = queue_mgt->total_qid_map_entries;
bad535d287c9c1 Bennie Yan 2024-09-24  260  
bad535d287c9c1 Bennie Yan 2024-09-24  261  	/* Update qid map */
bad535d287c9c1 Bennie Yan 2024-09-24  262  	memset(&qid_map, U8_MAX, sizeof(qid_map));
bad535d287c9c1 Bennie Yan 2024-09-24  263  
bad535d287c9c1 Bennie Yan 2024-09-24  264  	for (i = qid_map_base; i < NBL_QID_MAP_TABLE_ENTRIES - qid_map_entries; i++)
bad535d287c9c1 Bennie Yan 2024-09-24  265  		queue_mgt->qid_map_table[i] = queue_mgt->qid_map_table[i + qid_map_entries];
bad535d287c9c1 Bennie Yan 2024-09-24  266  	for (; i < NBL_QID_MAP_TABLE_ENTRIES; i++)
bad535d287c9c1 Bennie Yan 2024-09-24  267  		queue_mgt->qid_map_table[i] = qid_map;
bad535d287c9c1 Bennie Yan 2024-09-24  268  
bad535d287c9c1 Bennie Yan 2024-09-24  269  	nbl_res_queue_set_qid_map_table(res_mgt, tail);
bad535d287c9c1 Bennie Yan 2024-09-24  270  }
bad535d287c9c1 Bennie Yan 2024-09-24  271  

:::::: The code at line 149 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
