Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D952F137C43
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 20:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709842824; cv=none; b=aOmrY+i5ruziQ84pRHcx7KVYhRumJuJlTiUu4DBibMGYeptT7IVyNw1QRdspnBYOYmsx/R/6Gz6C/51HSL4U0RJguh34102rGSCsKZ+VgQXJpFRfjscHyB/4M3nNarwi/pDSpAxR9JrQNKwl8j2J2VeRQFlWmbAwjDZEKN35rv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709842824; c=relaxed/simple;
	bh=Lx52VxMgfFAE+J2bpM5MLX50r/vUA6pBDUpdhmKqkhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MnnQH0qEar0CfwjX17orWvJ8RE/H0q882JiXzq72ZC2YGjW+Q3I/gRSujujdb726cmA5QYHXnptcjZu92P6w1xQHaYd9+Gc3xshT02ZfeJ6oi4B1VH1eBiW+l7wLblpdTqAVgzbmsF0IirAnJwVwvFIi11rtW3iadDQlxU7Ezi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Memdr6q+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Memdr6q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709842822; x=1741378822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lx52VxMgfFAE+J2bpM5MLX50r/vUA6pBDUpdhmKqkhM=;
  b=Memdr6q+jXGVM8M9AO5vRDvcPu+z6FE7/QPl69m32YXFt61v2Z6/bm7U
   heinbEvUbhUCtLdPbFGvlNvVZAPQt5+axUTdCjc4Vvptpl8i6oHvXUbZ8
   cvZgOQanMNyebjT6Kl4C53u9rOBhW8aDvkrMAuppFm4DL3XYOUYTc3IoE
   Hs/fDybiKACIyYzzqjxWulf7W7FhngCQMoLFeT6ULuUfX8inEZLHnwIc9
   /DqL4SI6mQnR1qpwPuhInani7+fpJpw19sYd9bUvTHLYLSKjnUE9Mgf3s
   z1fFc7QAsvkXJYYD4Bq2P2pzmRTzsIhW6rzQGT64zIHEV4wS3wVupqMNh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15948848"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="15948848"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 12:20:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="14896252"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Mar 2024 12:20:19 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riKDx-0005fr-15;
	Thu, 07 Mar 2024 20:20:17 +0000
Date: Fri, 8 Mar 2024 04:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3862/3876]
 drivers/net/ethernet/mucse/rnp/rnp_main.c:2402:71: warning: '-' directive
 output may be truncated writing 1 byte into a region of size between 0 and
 17
Message-ID: <202403080412.gcDr9v5Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   97ba28f60ba0c12d39b4d3032121317ffebc06ba
commit: 455d45ae080810ae554f5e586adb9004230f9f70 [3862/3876] drivers: initial support for rnp drivers from Mucse Technology
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240308/202403080412.gcDr9v5Q-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080412.gcDr9v5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080412.gcDr9v5Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c: In function 'rnp_mbx_get_temp':
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1105:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1105 |         int err;
         |             ^~~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c: At top level:
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1141:5: warning: no previous prototype for 'rnp_fw_reg_read' [-Wmissing-prototypes]
    1141 | int rnp_fw_reg_read(struct rnp_hw *hw, int addr, int sz)
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c: In function 'rnp_fw_reg_read':
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1145:13: warning: variable 'value' set but not used [-Wunused-but-set-variable]
    1145 |         int value;
         |             ^~~~~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c: At top level:
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1456:5: warning: no previous prototype for 'rnp_mbx_lldp_all_ports_enable' [-Wmissing-prototypes]
    1456 | int rnp_mbx_lldp_all_ports_enable(struct rnp_hw *hw, bool enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c: In function 'rnp_mbx_reg_write':
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:602:9: warning: 'build_writereg_req' accessing 16 bytes in a region of size 4 [-Wstringop-overflow=]
     602 |         build_writereg_req(&req, NULL, fw_reg, 4, &value);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:602:9: note: referencing argument 5 of type 'int[4]'
   In file included from drivers/net/ethernet/mucse/rnp/rnp_type.h:960,
                    from drivers/net/ethernet/mucse/rnp/rnp.h:20,
                    from drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:9:
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:799:20: note: in a call to function 'build_writereg_req'
     799 | static inline void build_writereg_req(struct mbx_fw_cmd_req *req,
         |                    ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:294,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from arch/loongarch/include/asm/processor.h:9,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_bits.h:32,
                    from include/linux/thread_info.h:16,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/loongarch/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:4:
   In function 'fortify_memcpy_chk',
       inlined from 'rnp_mbx_phy_read' at drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1386:3:
   include/linux/fortify-string.h:592:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     592 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:458: warning: Function parameter or member 'sriov_flag' not described in 'rnp_eth_update_rss_key_n10'
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:1135: warning: expecting prototype for rnp_init_hw_n10(). Prototype was for rnp_init_hw_ops_n10() instead
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:1368: warning: Function parameter or member 'hw' not described in 'rnp_write_uc_addr_list_n10'
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:1368: warning: Function parameter or member 'sriov_flag' not described in 'rnp_write_uc_addr_list_n10'
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:1368: warning: expecting prototype for rnp_write_uc_addr_list(). Prototype was for rnp_write_uc_addr_list_n10() instead
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:3270: warning: expecting prototype for rnpm_device_supports_autoneg_fc(). Prototype was for rnp_device_supports_autoneg_fc() instead
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4152: warning: Function parameter or member 'mac' not described in 'rnp_mac_fc_mode_n10'
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:4152: warning: expecting prototype for rnp_fc_mode_n10(). Prototype was for rnp_mac_fc_mode_n10() instead
--
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:823: warning: expecting prototype for rnp_mbx_link_event_eanble(). Prototype was for rnp_mbx_link_event_enable() instead
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:902: warning: Function parameter or member 'value0' not described in 'rnp_set_lane_fun'
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:902: warning: Function parameter or member 'value1' not described in 'rnp_set_lane_fun'
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:902: warning: Function parameter or member 'value2' not described in 'rnp_set_lane_fun'
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:902: warning: Function parameter or member 'value3' not described in 'rnp_set_lane_fun'
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1024: warning: Function parameter or member 'info' not described in 'rnp_mbx_get_capability'
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1024: warning: Excess function parameter 'rnp_info' description in 'rnp_mbx_get_capability'
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1175: warning: expecting prototype for rnp_mbx_stat_mark(). Prototype was for rnp_link_stat_mark() instead
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1414: warning: Function parameter or member 'adv' not described in 'rnp_mbx_phy_link_set'
--
   drivers/net/ethernet/mucse/rnp/rnp_main.c:175:6: warning: no previous prototype for 'rnp_unmap_and_free_tx_resource' [-Wmissing-prototypes]
     175 | void rnp_unmap_and_free_tx_resource(struct rnp_ring *ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:670:5: warning: no previous prototype for 'rnp_rx_ring_reinit' [-Wmissing-prototypes]
     670 | int rnp_rx_ring_reinit(struct rnp_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2012:6: warning: no previous prototype for 'rnp_write_eitr_rx' [-Wmissing-prototypes]
    2012 | void rnp_write_eitr_rx(struct rnp_q_vector *q_vector)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3176:6: warning: no previous prototype for 'rnp_vlan_stags_flag' [-Wmissing-prototypes]
    3176 | void rnp_vlan_stags_flag(struct rnp_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3580:5: warning: no previous prototype for 'rnp_xmit_nop_frame_ring' [-Wmissing-prototypes]
    3580 | int rnp_xmit_nop_frame_ring(struct rnp_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4842:6: warning: no previous prototype for 'rnp_service_timer' [-Wmissing-prototypes]
    4842 | void rnp_service_timer(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4950:6: warning: no previous prototype for 'rnp_service_task' [-Wmissing-prototypes]
    4950 | void rnp_service_task(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5972:5: warning: no previous prototype for 'rnp_delete_knode' [-Wmissing-prototypes]
    5972 | int rnp_delete_knode(struct net_device *dev,
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6061:5: warning: no previous prototype for 'rnp_config_knode' [-Wmissing-prototypes]
    6061 | int rnp_config_knode(struct net_device *dev, __be16 protocol,
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6120:5: warning: no previous prototype for 'rnp_setup_tc_cls_u32' [-Wmissing-prototypes]
    6120 | int rnp_setup_tc_cls_u32(struct net_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6197:6: warning: no previous prototype for 'rnp_do_reset' [-Wmissing-prototypes]
    6197 | void rnp_do_reset(struct net_device *netdev)
         |      ^~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6452:6: warning: no previous prototype for 'rnp_assign_netdev_ops' [-Wmissing-prototypes]
    6452 | void rnp_assign_netdev_ops(struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6628:5: warning: no previous prototype for 'rnp_can_rpu_start' [-Wmissing-prototypes]
    6628 | int rnp_can_rpu_start(struct rnp_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c: In function 'rnp_request_msix_irqs':
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:2402:71: warning: '-' directive output may be truncated writing 1 byte into a region of size between 0 and 17 [-Wformat-truncation=]
    2402 |                                  sizeof(q_vector->name) - 1, "%s-%s-%d-%d",
         |                                                                       ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2401:25: note: 'snprintf' output between 10 and 37 bytes into a destination of size 24
    2401 |                         snprintf(q_vector->name,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
    2402 |                                  sizeof(q_vector->name) - 1, "%s-%s-%d-%d",
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2403 |                                  netdev->name, "TxRx", i, q_vector->v_idx);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/mucse/rnp/rnp_main.c:158: warning: Function parameter or member 'rnp_queue' not described in 'rnp_set_ring_vector'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:158: warning: Function parameter or member 'rnp_msix_vector' not described in 'rnp_set_ring_vector'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:158: warning: Excess function parameter 'queue' description in 'rnp_set_ring_vector'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:158: warning: Excess function parameter 'msix_vector' description in 'rnp_set_ring_vector'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:288: warning: Function parameter or member 'napi_budget' not described in 'rnp_clean_tx_irq'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:672: warning: Function parameter or member 'adapter' not described in 'rnp_rx_ring_reinit'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:1130: warning: Excess function parameter 'skb' description in 'rnp_is_non_eop'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:2013: warning: expecting prototype for rnp_write_eitr(). Prototype was for rnp_write_eitr_rx() instead
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2563: warning: Function parameter or member 'adapter' not described in 'rnp_tx_maxrate_own'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2563: warning: Excess function parameter 'netdev' description in 'rnp_tx_maxrate_own'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2563: warning: Excess function parameter 'maxrate' description in 'rnp_tx_maxrate_own'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3779: warning: Function parameter or member 'txqueue' not described in 'rnp_tx_timeout'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3888: warning: Function parameter or member 'adapter' not described in 'rnp_setup_tx_resources'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3981: warning: Function parameter or member 'adapter' not described in 'rnp_setup_rx_resources'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4643: warning: Excess function parameter 'link_speed' description in 'rnp_watchdog_update_link'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4843: warning: Function parameter or member 't' not described in 'rnp_service_timer'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4843: warning: Excess function parameter 'data' description in 'rnp_service_timer'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5903: warning: Function parameter or member 'dev' not described in 'rnp_setup_tc'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5903: warning: Excess function parameter 'netdev' description in 'rnp_setup_tc'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6471: warning: Function parameter or member 'adapter' not described in 'rnp_wol_supported'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6471: warning: Function parameter or member 'subdevice_id' not described in 'rnp_wol_supported'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6471: warning: Excess function parameter 'hw' description in 'rnp_wol_supported'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6471: warning: Excess function parameter 'subdev_id' description in 'rnp_wol_supported'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:7056: warning: Function parameter or member 'id' not described in 'rnp_probe'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:7056: warning: Excess function parameter 'ent' description in 'rnp_probe'
--
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:179: warning: Function parameter or member 'data' not described in 'rnp_reg_test'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:466: warning: Function parameter or member 'dev' not described in 'rnp_get_ts_info'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:466: warning: Excess function parameter 'netdev' description in 'rnp_get_ts_info'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:527: warning: Function parameter or member 'dev' not described in 'rnp_get_channels'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:527: warning: Excess function parameter 'netdev' description in 'rnp_get_channels'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:561: warning: Function parameter or member 'dev' not described in 'rnp_set_channels'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:561: warning: Excess function parameter 'netdev' description in 'rnp_set_channels'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:600: warning: Function parameter or member 'dev' not described in 'rnp_get_module_info'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:600: warning: Excess function parameter 'netdev' description in 'rnp_get_module_info'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:653: warning: Function parameter or member 'dev' not described in 'rnp_get_module_eeprom'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:653: warning: Excess function parameter 'netdev' description in 'rnp_get_module_eeprom'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:700: warning: Function parameter or member 'ker' not described in 'rnp_get_ringparam'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:700: warning: Function parameter or member 'extack' not described in 'rnp_get_ringparam'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:725: warning: Function parameter or member 'ker' not described in 'rnp_set_ringparam'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:725: warning: Function parameter or member 'extack' not described in 'rnp_set_ringparam'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:945: warning: Function parameter or member 'coal' not described in 'rnp_get_coalesce'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:945: warning: Function parameter or member 'kernel_coal' not described in 'rnp_get_coalesce'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:945: warning: Function parameter or member 'extack' not described in 'rnp_get_coalesce'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:945: warning: Excess function parameter 'cmd' description in 'rnp_get_coalesce'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:945: warning: Excess function parameter 'ec' description in 'rnp_get_coalesce'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:987: warning: Function parameter or member 'kernel_coal' not described in 'rnp_set_coalesce'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:987: warning: Function parameter or member 'extack' not described in 'rnp_set_coalesce'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:987: warning: Excess function parameter 'cmd' description in 'rnp_set_coalesce'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1788: warning: Function parameter or member 'dev' not described in 'rnp_set_rxnfc'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1788: warning: expecting prototype for rnp_set_rxfh(). Prototype was for rnp_set_rxnfc() instead
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1856: warning: expecting prototype for rnp_tet_rxfh(). Prototype was for rnp_get_rxfh() instead


vim +2402 drivers/net/ethernet/mucse/rnp/rnp_main.c

  2378	
  2379	/**
  2380	 * rnp_request_msix_irqs - Initialize MSI-X interrupts
  2381	 * @adapter: board private structure
  2382	 *
  2383	 * rnp_request_msix_irqs allocates MSI-X vectors and requests
  2384	 * interrupts from the kernel.
  2385	 **/
  2386	static int rnp_request_msix_irqs(struct rnp_adapter *adapter)
  2387	{
  2388		struct net_device *netdev = adapter->netdev;
  2389		int err;
  2390		int i = 0;
  2391	
  2392		DPRINTK(IFUP, INFO, "[%s] num_q_vectors:%d\n", __func__,
  2393			adapter->num_q_vectors);
  2394	
  2395		for (i = 0; i < adapter->num_q_vectors; i++) {
  2396			struct rnp_q_vector *q_vector = adapter->q_vector[i];
  2397			struct msix_entry *entry =
  2398				&adapter->msix_entries[i + adapter->q_vector_off];
  2399	
  2400			if (q_vector->tx.ring && q_vector->rx.ring) {
  2401				snprintf(q_vector->name,
> 2402					 sizeof(q_vector->name) - 1, "%s-%s-%d-%d",
  2403					 netdev->name, "TxRx", i, q_vector->v_idx);
  2404			} else {
  2405				WARN(!(q_vector->tx.ring && q_vector->rx.ring),
  2406				     "%s vector%d tx rx is null, v_idx:%d\n",
  2407				     netdev->name, i, q_vector->v_idx);
  2408				/* skip this unused q_vector */
  2409				continue;
  2410			}
  2411			err = request_irq(entry->vector, &rnp_msix_clean_rings, 0,
  2412					  q_vector->name, q_vector);
  2413			if (err) {
  2414				e_err(probe,
  2415				      "%s:request_irq failed for MSIX interrupt:%d",
  2416				      netdev->name, entry->vector);
  2417				e_err(probe, "Error: %d\n", err);
  2418				goto free_queue_irqs;
  2419			}
  2420			/* register for affinity change notifications */
  2421			q_vector->affinity_notify.notify = rnp_irq_affinity_notify;
  2422			q_vector->affinity_notify.release =
  2423				rnp_irq_affinity_release;
  2424			irq_set_affinity_notifier(entry->vector,
  2425						  &q_vector->affinity_notify);
  2426			DPRINTK(IFUP, INFO, "[%s] set %s affinity_mask\n",
  2427				__func__, q_vector->name);
  2428	
  2429			irq_set_affinity_hint(entry->vector,
  2430					      &q_vector->affinity_mask);
  2431		}
  2432	
  2433		return 0;
  2434	
  2435	free_queue_irqs:
  2436		while (i) {
  2437			i--;
  2438			irq_set_affinity_hint(
  2439				adapter->msix_entries[i + adapter->q_vector_off].vector,
  2440				NULL);
  2441			free_irq(adapter->msix_entries[i + adapter->q_vector_off].vector,
  2442				 adapter->q_vector[i]);
  2443			irq_set_affinity_notifier(
  2444				adapter->msix_entries[i + adapter->q_vector_off].vector,
  2445				NULL);
  2446			irq_set_affinity_hint(
  2447				adapter->msix_entries[i + adapter->q_vector_off].vector,
  2448				NULL);
  2449		}
  2450		return err;
  2451	}
  2452	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
