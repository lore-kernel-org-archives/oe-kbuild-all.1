Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658C53BBE3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710928754; cv=none; b=OqL60egG/51oX73vcNhT/j8Yg5Mm8wASOkZbGb1n7MzgY3/kypq0uVGFBD5GAt6Vl/ifRhIPXWZDzjJHGaWaUVCeKTZ6gKEg86EO0FL+LbTM719moDJTYMPqSPoqVHu1OjxygGRcIrgqIjZUj/da1OxodTUVsHkQz4oBtgiYx1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710928754; c=relaxed/simple;
	bh=P/OiPtmflCPKDoQQiBvqH01ILgT+kFFPZQbK4DSQBEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mQkqFcP7nd8ZSWmevVU/zxK2exJIJ2ONbieJaRLn8+UsUElfB3YDjw1PuOqeFZUCRSsm0Q7DDvj17YK1YwAh44cAHFU+HCJQf2xWbSupGkk9sXbwAHUB5zvGz52jtA3ptIlpOWOt6bSuhzGUS3uU8A+4UD/aRuzbgAeAIasbOe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUecL2T1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUecL2T1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710928751; x=1742464751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P/OiPtmflCPKDoQQiBvqH01ILgT+kFFPZQbK4DSQBEQ=;
  b=dUecL2T1refCySXMFASSlp2If1a9ijP2k4aMz+Rre5snZTLMWoEvtHOg
   2k9XLksz//qMoxPiQVc7rSbSUAzYVQteXsyKtGjrPoo3bagQIVUZVGsvE
   QZ6SIALg4h05bp532cjfCLzSsAhsCT2e7+BAXYO0z+2fYyj6SX9CSH8/y
   nvTnPV+enQoMtCVPvJGFSSQPRo1pISv2SvMozZw8CDtedyp5e3GB19Iwn
   pFgaXSwdHYEdhXFSXnAVMprBtlEY4xRzJAOe/Tin4o2SP2TFQ4YHzCWkj
   QKrs2dYAqyOHTuzS7N33s2v+MzGfoHXrI5hTfHAoNHEaGMoev4f9P78Zn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5722856"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5722856"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 02:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="37228956"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2024 02:59:06 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmsiu-000IWB-0Y;
	Wed, 20 Mar 2024 09:59:04 +0000
Date: Wed, 20 Mar 2024 17:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "gu.huiguang" <guhuiguang@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 4026/4224]
 drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1257: warning: expecting
 prototype for rnpm_update_mc_addr_list_generic(). Prototype was for
 rnpm_update_mutiport_mc_addr_list_generic() instead
Message-ID: <202403201702.oUv4biQv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b61688dbd28fa5eb9aa4e4109bc38543cd1d596f
commit: 5deaf74c4b3edcf88f67f18aa352690deb9dc212 [4026/4224] drivers: initial support for rnpm drivers from Mucse Technology
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240320/202403201702.oUv4biQv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403201702.oUv4biQv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403201702.oUv4biQv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:694: warning: Function parameter or member 'count' not described in 'rnpm_shift_in_eeprom_bits'
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:717: warning: Function parameter or member 'eec' not described in 'rnpm_lower_eeprom_clk'
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:717: warning: Excess function parameter 'eecd' description in 'rnpm_lower_eeprom_clk'
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:933: warning: Function parameter or member 'mc_addr' not described in 'rnpm_set_mta'
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:933: warning: Excess function parameter 'hash_value' description in 'rnpm_set_mta'
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1182: warning: Function parameter or member 'mode' not described in 'rnpm_mta_vector'
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1182: warning: Excess function parameter 'hw' description in 'rnpm_mta_vector'
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1257: warning: expecting prototype for rnpm_update_mc_addr_list_generic(). Prototype was for rnpm_update_mutiport_mc_addr_list_generic() instead
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1812: warning: expecting prototype for rnpm_enable_rx_buff(). Prototype was for rnpm_enable_rx_buff_generic() instead
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2179: warning: Function parameter or member 'vf' not described in 'rnpm_set_vlan_anti_spoofing'
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2179: warning: Excess function parameter 'pf' description in 'rnpm_set_vlan_anti_spoofing'
--
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c: In function 'rnpm_set_link_ksettings':
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:1290:39: warning: variable 'duplex_changed' set but not used [-Wunused-but-set-variable]
    1290 |         bool autoneg_changed = false, duplex_changed = false;
         |                                       ^~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:1290:14: warning: variable 'autoneg_changed' set but not used [-Wunused-but-set-variable]
    1290 |         bool autoneg_changed = false, duplex_changed = false;
         |              ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c: In function 'rnpm_get_strings':
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2092:13: warning: variable 'dma_ch' set but not used [-Wunused-but-set-variable]
    2092 |         u32 dma_ch;
         |             ^~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c: At top level:
>> drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:3246:6: warning: no previous prototype for 'rnpm_get_phy_statistics' [-Wmissing-prototypes]
    3246 | void rnpm_get_phy_statistics(struct net_device *netdev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:260: warning: expecting prototype for rnpm_dbg_reg_ops_write(). Prototype was for rnpm_dbg_phy_ops_write() instead
   drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:367: warning: Function parameter or member 'adapter' not described in 'rnpm_dbg_adapter_exit'
   drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:367: warning: Excess function parameter 'pf' description in 'rnpm_dbg_adapter_exit'
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1185:6: warning: no previous prototype for 'rnpm_setup_layer2_remapping' [-Wmissing-prototypes]
    1185 | void rnpm_setup_layer2_remapping(struct rnpm_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1209:6: warning: no previous prototype for 'rnpm_setup_tuple5_remapping' [-Wmissing-prototypes]
    1209 | void rnpm_setup_tuple5_remapping(struct rnpm_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1280:6: warning: no previous prototype for 'rnpm_setup_tuple5_remapping_tcam' [-Wmissing-prototypes]
    1280 | void rnpm_setup_tuple5_remapping_tcam(struct rnpm_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:256:6: warning: no previous prototype for 'rnpm_pf_service_event_schedule' [-Wmissing-prototypes]
     256 | void rnpm_pf_service_event_schedule(struct rnpm_pf_adapter *pf_adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1137:5: warning: no previous prototype for 'rnpm_rx_ring_reinit' [-Wmissing-prototypes]
    1137 | int rnpm_rx_ring_reinit(struct rnpm_adapter *adapter, struct rnpm_ring *rx_ring)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: In function 'rnpm_clean_rx_irq':
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2015:14: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    2015 |         bool xdp_xmit = false;
         |              ^~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: At top level:
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2207:6: warning: no previous prototype for 'rnpm_write_eitr' [-Wmissing-prototypes]
    2207 | void rnpm_write_eitr(struct rnpm_q_vector *q_vector, bool is_rxframe)
         |      ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3013:5: warning: no previous prototype for 'rnpm_xmit_nop_frame_ring' [-Wmissing-prototypes]
    3013 | int rnpm_xmit_nop_frame_ring(struct rnpm_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3037:5: warning: no previous prototype for 'rnpm_xmit_nop_frame_ring_temp' [-Wmissing-prototypes]
    3037 | int rnpm_xmit_nop_frame_ring_temp(struct rnpm_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3909:6: warning: no previous prototype for 'rnpm_vlan_stags_flag' [-Wmissing-prototypes]
    3909 | void rnpm_vlan_stags_flag(struct rnpm_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4031:6: warning: no previous prototype for 'control_mac_rx' [-Wmissing-prototypes]
    4031 | void control_mac_rx(struct rnpm_adapter *adapter, bool on)
         |      ^~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5803:6: warning: no previous prototype for 'rnpm_pf_service_timer' [-Wmissing-prototypes]
    5803 | void rnpm_pf_service_timer(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5821:6: warning: no previous prototype for 'rnpm_service_timer' [-Wmissing-prototypes]
    5821 | void rnpm_service_timer(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5962:21: warning: no previous prototype for 'wait_all_port_resetting' [-Wmissing-prototypes]
    5962 | __maybe_unused void wait_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5974:21: warning: no previous prototype for 'clean_all_port_resetting' [-Wmissing-prototypes]
    5974 | __maybe_unused void clean_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6185:5: warning: no previous prototype for 'rnpm_check_mc_addr' [-Wmissing-prototypes]
    6185 | int rnpm_check_mc_addr(struct rnpm_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6211:6: warning: no previous prototype for 'update_pf_vlan' [-Wmissing-prototypes]
    6211 | void update_pf_vlan(struct rnpm_adapter *adapter)
         |      ^~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6262:6: warning: no previous prototype for 'rnpm_pf_service_task' [-Wmissing-prototypes]
    6262 | void rnpm_pf_service_task(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7528:6: warning: no previous prototype for 'rnpm_clear_udp_tunnel_port' [-Wmissing-prototypes]
    7528 | void rnpm_clear_udp_tunnel_port(struct rnpm_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7692:6: warning: no previous prototype for 'rnpm_assign_netdev_ops' [-Wmissing-prototypes]
    7692 | void rnpm_assign_netdev_ops(struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7785:6: warning: no previous prototype for 'rnpm_fix_queue_number' [-Wmissing-prototypes]
    7785 | void rnpm_fix_queue_number(struct rnpm_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8760:5: warning: no previous prototype for 'rnpm_can_rpu_start' [-Wmissing-prototypes]
    8760 | int rnpm_can_rpu_start(struct rnpm_pf_adapter *pf_adapter)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: In function 'rnpm_request_msix_irqs':
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2911:43: warning: '-' directive output may be truncated writing 1 byte into a region of size between 0 and 17 [-Wformat-truncation=]
    2911 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                           ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2911:34: note: directive argument in the range [0, 65535]
    2911 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                  ^~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2910:25: note: 'snprintf' output between 10 and 31 bytes into a destination of size 24
    2910 |                         snprintf(q_vector->name, sizeof(q_vector->name) - 1,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2911 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2912 |                                  q_vector->v_idx);
         |                                  ~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:297: warning: Function parameter or member 'rnpm_queue' not described in 'rnpm_set_ring_vector'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:297: warning: Function parameter or member 'rnpm_msix_vector' not described in 'rnpm_set_ring_vector'
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:297: warning: expecting prototype for rnpm_set_ivar(). Prototype was for rnpm_set_ring_vector() instead
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:441: warning: Function parameter or member 'napi_budget' not described in 'rnpm_clean_tx_irq'
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:988: warning: expecting prototype for rnp_is_non_eop(). Prototype was for rnpm_is_non_eop() instead
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1138: warning: Function parameter or member 'adapter' not described in 'rnpm_rx_ring_reinit'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2208: warning: Function parameter or member 'is_rxframe' not described in 'rnpm_write_eitr'
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2208: warning: expecting prototype for ixgbe_write_eitr(). Prototype was for rnpm_write_eitr() instead
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2869: warning: expecting prototype for rnp_irq_affinity_notify(). Prototype was for rnpm_irq_affinity_notify() instead
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2885: warning: expecting prototype for rnp_irq_affinity_release(). Prototype was for rnpm_irq_affinity_release() instead
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3070: warning: Function parameter or member 'adapter' not described in 'rnpm_tx_maxrate_own'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3070: warning: Excess function parameter 'netdev' description in 'rnpm_tx_maxrate_own'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3070: warning: Excess function parameter 'maxrate' description in 'rnpm_tx_maxrate_own'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3856: warning: Excess function parameter 'pb' description in 'rnpm_lpbthresh'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4607: warning: Function parameter or member 'txqueue' not described in 'rnpm_tx_timeout'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4780: warning: Function parameter or member 'adapter' not described in 'rnpm_setup_tx_resources'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4878: warning: Function parameter or member 'adapter' not described in 'rnpm_setup_rx_resources'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5560: warning: Excess function parameter 'link_speed' description in 'rnpm_watchdog_update_link'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5804: warning: Function parameter or member 't' not described in 'rnpm_pf_service_timer'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5804: warning: Excess function parameter 'data' description in 'rnpm_pf_service_timer'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5822: warning: Function parameter or member 't' not described in 'rnpm_service_timer'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5822: warning: Excess function parameter 'data' description in 'rnpm_service_timer'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7253: warning: Function parameter or member 'dev' not described in 'rnpm_setup_tc'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7253: warning: Excess function parameter 'netdev' description in 'rnpm_setup_tc'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7711: warning: Function parameter or member 'adapter' not described in 'rnpm_wol_supported'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7711: warning: Function parameter or member 'subdevice_id' not described in 'rnpm_wol_supported'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7711: warning: Excess function parameter 'hw' description in 'rnpm_wol_supported'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7711: warning: Excess function parameter 'subdev_id' description in 'rnpm_wol_supported'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8783: warning: Function parameter or member 'id' not described in 'rnpm_probe'
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8783: warning: Excess function parameter 'ent' description in 'rnpm_probe'
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:446:5: warning: no previous prototype for 'rnpm_reset_pipeline_n10' [-Wmissing-prototypes]
     446 | s32 rnpm_reset_pipeline_n10(struct rnpm_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c: In function 'rnpm_reset_hw_n10':
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:501:13: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     501 |         s32 status = 0;
         |             ^~~~~~
--
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:223: warning: Function parameter or member 'input' not described in 'rnpm_atr_compute_sig_hash_n10'
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:223: warning: Function parameter or member 'common' not described in 'rnpm_atr_compute_sig_hash_n10'
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:223: warning: Excess function parameter 'stream' description in 'rnpm_atr_compute_sig_hash_n10'
>> drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:238: warning: expecting prototype for rnpm_atr_add_signature_filter_n10(). Prototype was for rnpm_fdir_add_signature_filter_n10() instead
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:264: warning: Function parameter or member 'input' not described in 'rnpm_atr_compute_perfect_hash_n10'
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:264: warning: Excess function parameter 'atr_input' description in 'rnpm_atr_compute_perfect_hash_n10'
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:15:24: warning: no previous prototype for 'mbx_cookie_zalloc' [-Wmissing-prototypes]
      15 | struct mbx_req_cookie *mbx_cookie_zalloc(int priv_len)
         |                        ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:29:5: warning: no previous prototype for 'rnpm_mbx_write_posted_locked' [-Wmissing-prototypes]
      29 | int rnpm_mbx_write_posted_locked(struct rnpm_hw *hw, struct mbx_fw_cmd_req *req)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:73:6: warning: no previous prototype for 'rnpm_link_stat_mark_disable' [-Wmissing-prototypes]
      73 | void rnpm_link_stat_mark_disable(struct rnpm_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:78:5: warning: no previous prototype for 'rnpm_mbx_fw_post_req' [-Wmissing-prototypes]
      78 | int rnpm_mbx_fw_post_req(struct rnpm_hw *hw, struct mbx_fw_cmd_req *req,
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:138:5: warning: no previous prototype for 'rnpm_fw_send_cmd_wait' [-Wmissing-prototypes]
     138 | int rnpm_fw_send_cmd_wait(struct rnpm_hw *hw, struct mbx_fw_cmd_req *req,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:619:5: warning: no previous prototype for 'rnpm_mbx_lldp_all_ports_enable' [-Wmissing-prototypes]
     619 | int rnpm_mbx_lldp_all_ports_enable(struct rnpm_hw *hw, bool enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:933:5: warning: no previous prototype for 'rnpm_mbx_pluginout_evt_en' [-Wmissing-prototypes]
     933 | int rnpm_mbx_pluginout_evt_en(struct rnpm_hw *hw, int in_dir, int enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:962:5: warning: no previous prototype for 'rnpm_fw_get_capablity' [-Wmissing-prototypes]
     962 | int rnpm_fw_get_capablity(struct rnpm_hw *hw, struct phy_abilities *abil)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c: In function 'rnpm_mbx_get_temp':
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1146:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1146 |         int err;
         |             ^~~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c: At top level:
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1178:5: warning: no previous prototype for 'rnpm_fw_reg_read' [-Wmissing-prototypes]
    1178 | int rnpm_fw_reg_read(struct rnpm_hw *hw, int addr, int sz)
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c: In function 'rnpm_fw_reg_read':
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1182:13: warning: variable 'value' set but not used [-Wunused-but-set-variable]
    1182 |         int value;
         |             ^~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c: In function 'rnpm_mbx_fw_req_handler':
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1250:25: warning: variable 'hw' set but not used [-Wunused-but-set-variable]
    1250 |         struct rnpm_hw *hw;
         |                         ^~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c: At top level:
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1470:5: warning: no previous prototype for 'rnpm_get_port_stats2' [-Wmissing-prototypes]
    1470 | int rnpm_get_port_stats2(struct rnpm_hw *hw, int *pabs, int *pspeed, int *plink)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c: In function 'rnpm_mbx_reg_write':
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:600:9: warning: 'build_writereg_req' accessing 16 bytes in a region of size 4 [-Wstringop-overflow=]
     600 |         build_writereg_req(&req, NULL, fw_reg, 4, &value);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:600:9: note: referencing argument 5 of type 'int[4]'
   In file included from drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:11:
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:805:20: note: in a call to function 'build_writereg_req'
     805 | static inline void build_writereg_req(struct mbx_fw_cmd_req *req, void *cookie,
         |                    ^~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:782: warning: Cannot understand  *@speed :
    on line 782 - I thought it was a doc line
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:976:5: warning: no previous prototype for 'rnpm_get_vf_ringnum' [-Wmissing-prototypes]
     976 | int rnpm_get_vf_ringnum(int vf, int num)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:983:5: warning: no previous prototype for 'rnpm_setup_ring_maxrate' [-Wmissing-prototypes]
     983 | int rnpm_setup_ring_maxrate(struct rnpm_adapter *adapter, int ring,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c: In function 'rnpm_setup_ring_maxrate':
>> drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:986:16: warning: variable 'y' set but not used [-Wunused-but-set-variable]
     986 |         u64 x, y, result;
         |                ^
..


vim +1257 drivers/net/ethernet/mucse/rnpm/rnpm_common.c

  1244	
  1245	/**
  1246	 *  rnpm_update_mc_addr_list_generic - Updates MAC list of multicast addresses
  1247	 *  @hw: pointer to hardware structure
  1248	 *  @netdev: pointer to net device structure
  1249	 *
  1250	 *  The given list replaces any existing list. Clears the MC addrs from receive
  1251	 *  address registers and the multicast table. Uses unused receive address
  1252	 *  registers for the first multicast addresses, and hashes the rest into the
  1253	 *  multicast table.
  1254	 **/
  1255	s32 rnpm_update_mutiport_mc_addr_list_generic(struct rnpm_hw *hw,
  1256						      struct net_device *netdev)
> 1257	{
  1258	#ifdef NETDEV_HW_ADDR_T_MULTICAST
  1259		struct netdev_hw_addr *ha;
  1260	#endif
  1261		struct rnpm_adapter *adapter = (struct rnpm_adapter *)hw->back;
  1262		struct rnpm_pf_adapter *pf_adapter = adapter->pf_adapter;
  1263		u32 i;
  1264		u32 v;
  1265		u8 port = adapter->port;
  1266		int addr_count = 0;
  1267		u8 *addr_list = NULL;
  1268		unsigned long flags;
  1269	
  1270		/* Set the new number of MC addresses that we are being requested to
  1271		 * use.
  1272		 */
  1273		pf_adapter->num_mc_addrs[port] = netdev_mc_count(netdev);
  1274		pf_adapter->mta_in_use[port] = 0;
  1275	
  1276		hw->addr_ctrl.num_mc_addrs = netdev_mc_count(netdev);
  1277		hw->addr_ctrl.mta_in_use = 0;
  1278	
  1279		/* Clear share mta_shadow only not in mutiport mode */
  1280		if (!(adapter->flags & RNPM_FLAG_MUTIPORT_ENABLED)) {
  1281			hw_dbg(hw, " Clearing MTA(multicast table)\n");
  1282			memset(&pf_adapter->mta_shadow, 0,
  1283			       sizeof(pf_adapter->mta_shadow));
  1284		}
  1285		/* clear own mta_shadow */
  1286		memset(&hw->mac.mta_shadow, 0, sizeof(hw->mac.mta_shadow));
  1287	
  1288		spin_lock_irqsave(&pf_adapter->mc_setup_lock, flags);
  1289		/* Update mta shadow */
  1290		hw_dbg(hw, "port %d Updating MTA..\n", port);
  1291		// netdev_for_each_mc_addr(ha, netdev) {
  1292		//	rnpm_set_mta(hw, ha->addr);
  1293		// }
  1294		addr_count = netdev_mc_count(netdev);
  1295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
