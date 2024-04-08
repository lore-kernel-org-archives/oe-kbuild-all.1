Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D797F46F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712584689; cv=none; b=HmNqLW9vZKqaVR2L8XWT7HVXknYT2YDpgCDTEvUSWosV4ntFy1SrjxbHz805eRZdD4aW2WbltxjivZZg1qChZIDXbiPAbQWG/Ble+H7kzGq0pRdHVqidXEkfVihq/H9Q6nUygaCROAg8CLCFz68AYsi5VekC/DXtVf9ktk48PO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712584689; c=relaxed/simple;
	bh=PXQlZwjsKTpfTmVY5IjohyJGouuvtNVxPdR+cXrzous=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gW7V6ZZzqFLuXKWoI7K/nxczFvIFa+0AnXfUvEksmPCmNRiiJQw9uYWzIRc/nq5swMu3HAamwecqX0Ws3/Rd02HFghk/If+hAlf8t1rRd3A+3ezkT/PierMPLbMTxEmGs3Qdea4Sfhq5V9jCgafL6Js6oXpEx6pU1RY0jgWipGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=js/hllx5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="js/hllx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712584687; x=1744120687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PXQlZwjsKTpfTmVY5IjohyJGouuvtNVxPdR+cXrzous=;
  b=js/hllx5qwjbOZSlVmPhRwp+Wf+vsL7naUU7fNIJHxXt9g98oHc9V+mS
   Gxe8GiwHdbuaeS6mtRPa1XwQPdKAgCCvzJBF1sLX+GfbrqjxVcWYwGdA0
   dV+SOl0X1Gf0Ky57c3JoZULAT/5R4mTbDbXNB6hny/v2GrDqTfJT2sZL2
   +emN4GF0dSlZN9WgZACGet2Ztr3qOU9vArxeP9P/xP+Q52qmJWhF9muOe
   XmEcosyOG82at+K8t5KdBSFb9FKFmlgslnH6AVlxh9atxgYOOPJmpw30s
   nhh7i9+SQAce67ohGRVO8wF2K9eITRLdODTBE2Bft3rrCYsgGCFXVbxuM
   A==;
X-CSE-ConnectionGUID: PaxI5mQeTtK87hEXoyfHIw==
X-CSE-MsgGUID: 8Xpl0Hf5TQKtehMGUg6l+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19006487"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19006487"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 06:58:06 -0700
X-CSE-ConnectionGUID: Ft7owVrmSBOoh/UX2StOTg==
X-CSE-MsgGUID: DcJEvSVzR4eg+FZ+G1zDkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24523419"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2024 06:58:05 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtpVa-0005FP-2W;
	Mon, 08 Apr 2024 13:58:02 +0000
Date: Mon, 8 Apr 2024 21:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3985/7311]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:12668:21: sparse:
 sparse: symbol 'hclge_ops' was not declared. Should it be static?
Message-ID: <202404082139.0v0lXo9X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   05607873db411ec3c614313b43cec60138c26a99
commit: 5a74bf5a90b365913d0d91ec50463354d3295210 [3985/7311] net: hns3: add support customized exception handling interfaces
config: loongarch-randconfig-r113-20240408 (https://download.01.org/0day-ci/archive/20240408/202404082139.0v0lXo9X-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240408/202404082139.0v0lXo9X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404082139.0v0lXo9X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:12668:21: sparse: sparse: symbol 'hclge_ops' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:245:46: sparse: sparse: self-comparison always evaluates to false
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5264:31: sparse: sparse: context imbalance in 'hclge_sync_fd_user_def_cfg' - unexpected unlock

vim +/hclge_ops +12668 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c

 12667	
 12668	struct hnae3_ae_ops hclge_ops = {
 12669		.init_ae_dev = hclge_init_ae_dev,
 12670		.uninit_ae_dev = hclge_uninit_ae_dev,
 12671		.reset_prepare = hclge_reset_prepare_general,
 12672		.reset_done = hclge_reset_done,
 12673		.init_client_instance = hclge_init_client_instance,
 12674		.uninit_client_instance = hclge_uninit_client_instance,
 12675		.map_ring_to_vector = hclge_map_ring_to_vector,
 12676		.unmap_ring_from_vector = hclge_unmap_ring_frm_vector,
 12677		.get_vector = hclge_get_vector,
 12678		.put_vector = hclge_put_vector,
 12679		.set_promisc_mode = hclge_set_promisc_mode,
 12680		.request_update_promisc_mode = hclge_request_update_promisc_mode,
 12681		.set_loopback = hclge_set_loopback,
 12682		.start = hclge_ae_start,
 12683		.stop = hclge_ae_stop,
 12684		.client_start = hclge_client_start,
 12685		.client_stop = hclge_client_stop,
 12686		.get_status = hclge_get_status,
 12687		.get_ksettings_an_result = hclge_get_ksettings_an_result,
 12688		.cfg_mac_speed_dup_h = hclge_cfg_mac_speed_dup_h,
 12689		.get_media_type = hclge_get_media_type,
 12690		.check_port_speed = hclge_check_port_speed,
 12691		.get_fec_stats = hclge_get_fec_stats,
 12692		.get_fec = hclge_get_fec,
 12693		.set_fec = hclge_set_fec,
 12694		.get_rss_key_size = hclge_comm_get_rss_key_size,
 12695		.get_rss = hclge_get_rss,
 12696		.set_rss = hclge_set_rss,
 12697		.set_rss_tuple = hclge_set_rss_tuple,
 12698		.get_rss_tuple = hclge_get_rss_tuple,
 12699		.get_tc_size = hclge_get_tc_size,
 12700		.get_mac_addr = hclge_get_mac_addr,
 12701		.set_mac_addr = hclge_set_mac_addr,
 12702		.do_ioctl = hclge_do_ioctl,
 12703		.add_uc_addr = hclge_add_uc_addr,
 12704		.rm_uc_addr = hclge_rm_uc_addr,
 12705		.add_mc_addr = hclge_add_mc_addr,
 12706		.rm_mc_addr = hclge_rm_mc_addr,
 12707		.set_autoneg = hclge_set_autoneg,
 12708		.get_autoneg = hclge_get_autoneg,
 12709		.restart_autoneg = hclge_restart_autoneg,
 12710		.halt_autoneg = hclge_halt_autoneg,
 12711		.get_pauseparam = hclge_get_pauseparam,
 12712		.set_pauseparam = hclge_set_pauseparam,
 12713		.set_mtu = hclge_set_mtu,
 12714		.reset_queue = hclge_reset_tqp,
 12715		.get_stats = hclge_get_stats,
 12716		.get_mac_stats = hclge_get_mac_stat,
 12717		.update_stats = hclge_update_stats,
 12718		.get_strings = hclge_get_strings,
 12719		.get_sset_count = hclge_get_sset_count,
 12720		.get_fw_version = hclge_get_fw_version,
 12721		.get_mdix_mode = hclge_get_mdix_mode,
 12722		.enable_vlan_filter = hclge_enable_vlan_filter,
 12723		.set_vlan_filter = hclge_set_vlan_filter,
 12724		.set_vf_vlan_filter = hclge_set_vf_vlan_filter,
 12725		.enable_hw_strip_rxvtag = hclge_en_hw_strip_rxvtag,
 12726		.reset_event = hclge_reset_event,
 12727		.get_reset_level = hclge_get_reset_level,
 12728		.set_default_reset_request = hclge_set_def_reset_request,
 12729		.get_tqps_and_rss_info = hclge_get_tqps_and_rss_info,
 12730		.set_channels = hclge_set_channels,
 12731		.get_channels = hclge_get_channels,
 12732		.get_regs_len = hclge_get_regs_len,
 12733		.get_regs = hclge_get_regs,
 12734		.set_led_id = hclge_set_led_id,
 12735		.get_link_mode = hclge_get_link_mode,
 12736		.add_fd_entry = hclge_add_fd_entry,
 12737		.del_fd_entry = hclge_del_fd_entry,
 12738		.get_fd_rule_cnt = hclge_get_fd_rule_cnt,
 12739		.get_fd_rule_info = hclge_get_fd_rule_info,
 12740		.get_fd_all_rules = hclge_get_all_rules,
 12741		.enable_fd = hclge_enable_fd,
 12742		.add_arfs_entry = hclge_add_fd_entry_by_arfs,
 12743		.dbg_read_cmd = hclge_dbg_read_cmd,
 12744		.handle_hw_ras_error = hclge_handle_hw_ras_error,
 12745		.get_hw_reset_stat = hclge_get_hw_reset_stat,
 12746		.ae_dev_resetting = hclge_ae_dev_resetting,
 12747		.ae_dev_reset_cnt = hclge_ae_dev_reset_cnt,
 12748		.set_gro_en = hclge_gro_en,
 12749		.get_global_queue_id = hclge_covert_handle_qid_global,
 12750		.set_timer_task = hclge_set_timer_task,
 12751		.mac_connect_phy = hclge_mac_connect_phy,
 12752		.mac_disconnect_phy = hclge_mac_disconnect_phy,
 12753		.get_vf_config = hclge_get_vf_config,
 12754		.set_vf_link_state = hclge_set_vf_link_state,
 12755		.set_vf_spoofchk = hclge_set_vf_spoofchk,
 12756		.set_vf_trust = hclge_set_vf_trust,
 12757		.set_vf_rate = hclge_set_vf_rate,
 12758		.set_vf_mac = hclge_set_vf_mac,
 12759		.get_module_eeprom = hclge_get_module_eeprom,
 12760		.get_cmdq_stat = hclge_get_cmdq_stat,
 12761		.add_cls_flower = hclge_add_cls_flower,
 12762		.del_cls_flower = hclge_del_cls_flower,
 12763		.cls_flower_active = hclge_is_cls_flower_active,
 12764		.get_phy_link_ksettings = hclge_get_phy_link_ksettings,
 12765		.set_phy_link_ksettings = hclge_set_phy_link_ksettings,
 12766		.set_tx_hwts_info = hclge_ptp_set_tx_info,
 12767		.get_rx_hwts = hclge_ptp_get_rx_hwts,
 12768		.get_ts_info = hclge_ptp_get_ts_info,
 12769		.get_link_diagnosis_info = hclge_get_link_diagnosis_info,
 12770		.clean_vf_config = hclge_clean_vport_config,
 12771		.get_dscp_prio = hclge_get_dscp_prio,
 12772		.get_wol = hclge_get_wol,
 12773		.set_wol = hclge_set_wol,
 12774		.priv_ops = hclge_ext_ops_handle,
 12775	};
 12776	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
