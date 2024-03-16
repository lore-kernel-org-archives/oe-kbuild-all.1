Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483FB1BDCE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 17:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710610681; cv=none; b=QbM37yph0arSYy9dOXTWxh6SRxcP1F+eRPOSXaPUNEugeiG1UcSE3WYkmhL0pBgVwIzizpt1x8dF0ntdN6E0TLlgOgXNQtVNOET0KrGg++yYSuo4b5QBTdgKWua+8AO/gy1g3zjjyStHN/IgcoJBQLjU59UBtCXPOouRjVBM0nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710610681; c=relaxed/simple;
	bh=59I8MwUpgAFWA8j6GignrzBJp4FUMq6yfzXPMPFZjR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tkJ7FVDC72j38EeYoTZLYS3Y9XE23t2UZyOZvMZd2UwjMRL1bSMW8uRkHoIbfjzuoTvPwvVCfHgc0ATchZ1Y4YAhbWltMl8zAq86YgqrNvUXW7VmfmtozMb0tWXYNBQ15NrQbSArJ/+GuvaH5X9/UNIh8HZBdHaRQf1e9Jsfv/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9MwGvul; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S9MwGvul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710610678; x=1742146678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=59I8MwUpgAFWA8j6GignrzBJp4FUMq6yfzXPMPFZjR0=;
  b=S9MwGvulyKp7gxWxlbpmHbKDsF7Ai50Cqge9mgZUfq1JpZhhlD2Taqb+
   h3/yir+1bKYkAjccCfeD5Oze3CeTNtqBaamLM1nwgx8NqlfrKDIdedktU
   iVpwXfGGFF8B0oTn2lLgOjGYMj8O6hRsKRDh8kdoiR9iw5pp1y8RaSlSK
   DWnMMHo7yoMl2hH/g6T/MTQ1cehNPNcHAABNBKfmh8Z6hOi5iaHDeEeZt
   U6eWgeL8oSokrTHDMWNwV8YaOSXaYxm9rtQru/Pe0TGl0ZyhWnwqR4O09
   5UPE6e+Xx5o/gtyW2pl+l0JmtoQiZBziMDmNkYpvLhh3gXlcEqqF1h52d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="16116603"
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="16116603"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 10:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="12947933"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Mar 2024 10:37:56 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlXyj-000Fef-2p;
	Sat, 16 Mar 2024 17:37:53 +0000
Date: Sun, 17 Mar 2024 01:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "gu.huiguang" <guhuiguang@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28517/30000]
 drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:1232:7: warning: variable
 'autoneg_changed' set but not used
Message-ID: <202403170117.xHb5kcbx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   32bb7b0a7c87769858fbb9d60574b830383c28f7
commit: a0c5bfdbc099daf30cbadb9657803f0cb3f89d0b [28517/30000] drivers: support for rnpm drivers from Mucse Technology N10/N400
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240317/202403170117.xHb5kcbx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403170117.xHb5kcbx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403170117.xHb5kcbx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:1232:7: warning: variable 'autoneg_changed' set but not used [-Wunused-but-set-variable]
    1232 |         bool autoneg_changed = false, duplex_changed = false;
         |              ^
>> drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:1232:32: warning: variable 'duplex_changed' set but not used [-Wunused-but-set-variable]
    1232 |         bool autoneg_changed = false, duplex_changed = false;
         |                                       ^
>> drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2029:6: warning: variable 'dma_ch' set but not used [-Wunused-but-set-variable]
    2029 |         u32 dma_ch;
         |             ^
   3 warnings generated.
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1003:6: warning: no previous prototype for function 'rnpm_setup_layer2_remapping' [-Wmissing-prototypes]
    1003 | void rnpm_setup_layer2_remapping(struct rnpm_hw *hw,
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1003:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1003 | void rnpm_setup_layer2_remapping(struct rnpm_hw *hw,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1027:6: warning: no previous prototype for function 'rnpm_setup_tuple5_remapping' [-Wmissing-prototypes]
    1027 | void rnpm_setup_tuple5_remapping(struct rnpm_hw *hw,
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1027:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1027 | void rnpm_setup_tuple5_remapping(struct rnpm_hw *hw,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1098:6: warning: no previous prototype for function 'rnpm_setup_tuple5_remapping_tcam' [-Wmissing-prototypes]
    1098 | void rnpm_setup_tuple5_remapping_tcam(struct rnpm_hw *hw,
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1098:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1098 | void rnpm_setup_tuple5_remapping_tcam(struct rnpm_hw *hw,
         | ^
         | static 
   3 warnings generated.
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:245:6: warning: no previous prototype for function 'rnpm_pf_service_event_schedule' [-Wmissing-prototypes]
     245 | void rnpm_pf_service_event_schedule(struct rnpm_pf_adapter *pf_adapter)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     245 | void rnpm_pf_service_event_schedule(struct rnpm_pf_adapter *pf_adapter)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1768:5: warning: no previous prototype for function 'rnpm_rx_ring_reinit' [-Wmissing-prototypes]
    1768 | int rnpm_rx_ring_reinit(struct rnpm_adapter *adapter, struct rnpm_ring *rx_ring)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1768:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1768 | int rnpm_rx_ring_reinit(struct rnpm_adapter *adapter, struct rnpm_ring *rx_ring)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1957:7: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    1957 |         bool xdp_xmit = false;
         |              ^
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2142:6: warning: no previous prototype for function 'rnpm_write_eitr' [-Wmissing-prototypes]
    2142 | void rnpm_write_eitr(struct rnpm_q_vector *q_vector, bool is_rxframe)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2142:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2142 | void rnpm_write_eitr(struct rnpm_q_vector *q_vector, bool is_rxframe)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2381:6: warning: variable 'packets' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2381 |         if (!ring_container->ring)
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2387:7: note: uninitialized use occurs here
    2387 |         if (!packets)
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2381:2: note: remove the 'if' if its condition is always true
    2381 |         if (!ring_container->ring)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
    2382 | 
    2383 |                 packets = ring_container->total_packets;
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2374:37: note: initialize the variable 'packets' to silence this warning
    2374 |         unsigned int avg_wire_size, packets, bytes;
         |                                            ^
         |                                             = 0
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2969:5: warning: no previous prototype for function 'rnpm_xmit_nop_frame_ring' [-Wmissing-prototypes]
    2969 | int rnpm_xmit_nop_frame_ring(struct rnpm_adapter *adapter,
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2969:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2969 | int rnpm_xmit_nop_frame_ring(struct rnpm_adapter *adapter,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2985:5: warning: no previous prototype for function 'rnpm_xmit_nop_frame_ring_temp' [-Wmissing-prototypes]
    2985 | int rnpm_xmit_nop_frame_ring_temp(struct rnpm_adapter *adapter,
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2985:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2985 | int rnpm_xmit_nop_frame_ring_temp(struct rnpm_adapter *adapter,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3851:6: warning: no previous prototype for function 'rnpm_vlan_stags_flag' [-Wmissing-prototypes]
    3851 | void rnpm_vlan_stags_flag(struct rnpm_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3851:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3851 | void rnpm_vlan_stags_flag(struct rnpm_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3972:6: warning: no previous prototype for function 'control_mac_rx' [-Wmissing-prototypes]
    3972 | void control_mac_rx(struct rnpm_adapter *adapter, bool on)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3972:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3972 | void control_mac_rx(struct rnpm_adapter *adapter, bool on)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5689:6: warning: no previous prototype for function 'rnpm_pf_service_timer' [-Wmissing-prototypes]
    5689 | void rnpm_pf_service_timer(struct timer_list *t)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5689:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5689 | void rnpm_pf_service_timer(struct timer_list *t)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5707:6: warning: no previous prototype for function 'rnpm_service_timer' [-Wmissing-prototypes]
    5707 | void rnpm_service_timer(struct timer_list *t)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5707:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5707 | void rnpm_service_timer(struct timer_list *t)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5853:21: warning: no previous prototype for function 'wait_all_port_resetting' [-Wmissing-prototypes]
    5853 | __maybe_unused void wait_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5853:16: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5853 | __maybe_unused void wait_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                ^
         |                static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5865:21: warning: no previous prototype for function 'clean_all_port_resetting' [-Wmissing-prototypes]
    5865 | __maybe_unused void clean_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5865:16: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5865 | __maybe_unused void clean_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                ^
         |                static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6077:5: warning: no previous prototype for function 'rnpm_check_mc_addr' [-Wmissing-prototypes]
    6077 | int rnpm_check_mc_addr(struct rnpm_adapter *adapter)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6077:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6077 | int rnpm_check_mc_addr(struct rnpm_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6103:6: warning: no previous prototype for function 'update_pf_vlan' [-Wmissing-prototypes]
    6103 | void update_pf_vlan(struct rnpm_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6103 | void update_pf_vlan(struct rnpm_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6158:6: warning: no previous prototype for function 'rnpm_pf_service_task' [-Wmissing-prototypes]
    6158 | void rnpm_pf_service_task(struct work_struct *work)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6158:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6158 | void rnpm_pf_service_task(struct work_struct *work)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7339:6: warning: no previous prototype for function 'rnpm_clear_udp_tunnel_port' [-Wmissing-prototypes]
    7339 | void rnpm_clear_udp_tunnel_port(struct rnpm_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7339:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7339 | void rnpm_clear_udp_tunnel_port(struct rnpm_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7486:6: warning: no previous prototype for function 'rnpm_assign_netdev_ops' [-Wmissing-prototypes]
    7486 | void rnpm_assign_netdev_ops(struct net_device *dev)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7486:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7486 | void rnpm_assign_netdev_ops(struct net_device *dev)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7575:6: warning: no previous prototype for function 'rnpm_fix_queue_number' [-Wmissing-prototypes]
    7575 | void rnpm_fix_queue_number(struct rnpm_hw *hw)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7575:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7575 | void rnpm_fix_queue_number(struct rnpm_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8443:5: warning: no previous prototype for function 'rnpm_can_rpu_start' [-Wmissing-prototypes]
    8443 | int rnpm_can_rpu_start(struct rnpm_pf_adapter *pf_adapter)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8443:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    8443 | int rnpm_can_rpu_start(struct rnpm_pf_adapter *pf_adapter)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8762:18: warning: variable 'hw' set but not used [-Wunused-but-set-variable]
    8762 |         struct rnpm_hw *hw;
         |                         ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:307:20: warning: unused function 'rnpm_irq_rearm_queues' [-Wunused-function]
     307 | static inline void rnpm_irq_rearm_queues(struct rnpm_adapter *adapter,
         |                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7516:29: warning: unused function 'rnpm_tso_features' [-Wunused-function]
    7516 | static inline unsigned long rnpm_tso_features(void)
         |                             ^~~~~~~~~~~~~~~~~
   23 warnings generated.
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:448:5: warning: no previous prototype for function 'rnpm_reset_pipeline_n10' [-Wmissing-prototypes]
     448 | s32 rnpm_reset_pipeline_n10(struct rnpm_hw *hw)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:448:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     448 | s32 rnpm_reset_pipeline_n10(struct rnpm_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:503:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     503 |         s32 status = 0;
         |             ^
   2 warnings generated.
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:14:24: warning: no previous prototype for function 'mbx_cookie_zalloc' [-Wmissing-prototypes]
      14 | struct mbx_req_cookie *mbx_cookie_zalloc(int priv_len)
         |                        ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      14 | struct mbx_req_cookie *mbx_cookie_zalloc(int priv_len)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:28:5: warning: no previous prototype for function 'rnpm_mbx_write_posted_locked' [-Wmissing-prototypes]
      28 | int rnpm_mbx_write_posted_locked(struct rnpm_hw *hw, struct mbx_fw_cmd_req *req)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:28:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      28 | int rnpm_mbx_write_posted_locked(struct rnpm_hw *hw, struct mbx_fw_cmd_req *req)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:81:6: warning: no previous prototype for function 'rnpm_link_stat_mark_disable' [-Wmissing-prototypes]
      81 | void rnpm_link_stat_mark_disable(struct rnpm_hw *hw)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:81:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      81 | void rnpm_link_stat_mark_disable(struct rnpm_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:86:5: warning: no previous prototype for function 'rnpm_mbx_fw_post_req' [-Wmissing-prototypes]
      86 | int rnpm_mbx_fw_post_req(struct rnpm_hw *hw,
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:86:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      86 | int rnpm_mbx_fw_post_req(struct rnpm_hw *hw,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:153:5: warning: no previous prototype for function 'rnpm_fw_send_cmd_wait' [-Wmissing-prototypes]
     153 | int rnpm_fw_send_cmd_wait(struct rnpm_hw *hw,
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:153:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     153 | int rnpm_fw_send_cmd_wait(struct rnpm_hw *hw,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:633:5: warning: no previous prototype for function 'rnpm_mbx_lldp_all_ports_enable' [-Wmissing-prototypes]
     633 | int rnpm_mbx_lldp_all_ports_enable(struct rnpm_hw *hw, bool enable)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:633:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     633 | int rnpm_mbx_lldp_all_ports_enable(struct rnpm_hw *hw, bool enable)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:936:5: warning: no previous prototype for function 'rnpm_mbx_pluginout_evt_en' [-Wmissing-prototypes]
     936 | int rnpm_mbx_pluginout_evt_en(struct rnpm_hw *hw, int in_dir, int enable)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:936:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     936 | int rnpm_mbx_pluginout_evt_en(struct rnpm_hw *hw, int in_dir, int enable)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:963:5: warning: no previous prototype for function 'rnpm_fw_get_capablity' [-Wmissing-prototypes]
     963 | int rnpm_fw_get_capablity(struct rnpm_hw *hw, struct phy_abilities *abil)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:963:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     963 | int rnpm_fw_get_capablity(struct rnpm_hw *hw, struct phy_abilities *abil)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1153:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1153 |         int err;
         |             ^
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1188:6: warning: variable 'value' set but not used [-Wunused-but-set-variable]
    1188 |         int value;
         |             ^
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1184:5: warning: no previous prototype for function 'rnpm_fw_reg_read' [-Wmissing-prototypes]
    1184 | int rnpm_fw_reg_read(struct rnpm_hw *hw, int addr, int sz)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1184:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1184 | int rnpm_fw_reg_read(struct rnpm_hw *hw, int addr, int sz)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1255:18: warning: variable 'hw' set but not used [-Wunused-but-set-variable]
    1255 |         struct rnpm_hw *hw;
         |                         ^
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1476:5: warning: no previous prototype for function 'rnpm_get_port_stats2' [-Wmissing-prototypes]
    1476 | int rnpm_get_port_stats2(struct rnpm_hw *hw, int *pabs, int *pspeed, int *plink)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1476:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1476 | int rnpm_get_port_stats2(struct rnpm_hw *hw, int *pabs, int *pspeed, int *plink)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1528:9: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
    1528 |         return err ? -err : 0;
         |                ^~~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1509:9: note: initialize the variable 'err' to silence this warning
    1509 |         int err;
         |                ^
         |                 = 0
   14 warnings generated.
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:263:5: warning: no previous prototype for function 'rnpm_mbx_get_pn_sn' [-Wmissing-prototypes]
     263 | int rnpm_mbx_get_pn_sn(struct rnpm_hw *hw, char pn[33], char sn[33])
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:263:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     263 | int rnpm_mbx_get_pn_sn(struct rnpm_hw *hw, char pn[33], char sn[33])
         | ^
         | static 
   1 warning generated.
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:91:6: warning: variable 'target' set but not used [-Wunused-but-set-variable]
      91 |         u32 target;
         |             ^
>> drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:314:5: warning: no previous prototype for function 'rnpm_ptp_setup_ptp' [-Wmissing-prototypes]
     314 | int rnpm_ptp_setup_ptp(struct rnpm_adapter *pf, u32 value)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:314:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     314 | int rnpm_ptp_setup_ptp(struct rnpm_adapter *pf, u32 value)
         | ^
         | static 
   2 warnings generated.
..


vim +/autoneg_changed +1232 drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c

  1217	
  1218	/**
  1219	 * rnpm_set_link_ksettings - Set Speed and Duplex
  1220	 * @netdev: network interface device structure
  1221	 * @ks: ethtool ksettings
  1222	 *
  1223	 * Set speed/duplex per media_types advertised/forced
  1224	 **/
  1225	static int rnpm_set_link_ksettings(struct net_device *netdev,
  1226					   const struct ethtool_link_ksettings *ks)
  1227	{
  1228		struct rnpm_adapter *adapter = netdev_priv(netdev);
  1229		struct rnpm_hw *hw = &adapter->hw;
  1230		struct ethtool_link_ksettings safe_ks;
  1231		struct ethtool_link_ksettings copy_ks;
> 1232		bool autoneg_changed = false, duplex_changed = false;
  1233		int timeout = 50;
  1234		int err = 0;
  1235		u8 autoneg;
  1236		u32 advertising_link_speed;
  1237	
  1238		/* copy the ksettings to copy_ks to avoid modifying the origin */
  1239		memcpy(&copy_ks, ks, sizeof(struct ethtool_link_ksettings));
  1240		/* save autoneg out of ksettings */
  1241		autoneg = copy_ks.base.autoneg;
  1242		rnpm_logd(LOG_ETHTOOL,
  1243			  "%s %s set link: speed=%d port=%d duplex=%d autoneg=%d ",
  1244			  __func__, netdev->name, copy_ks.base.speed, copy_ks.base.port,
  1245			  copy_ks.base.duplex, copy_ks.base.autoneg);
  1246		rnpm_logd(LOG_ETHTOOL, "phy_address=%d mdix_ctrl=%d\n",
  1247			  copy_ks.base.phy_address, copy_ks.base.eth_tp_mdix_ctrl);
  1248		/* get our own copy of the bits to check against */
  1249		memset(&safe_ks, 0, sizeof(struct ethtool_link_ksettings));
  1250		safe_ks.base.cmd = copy_ks.base.cmd;
  1251		safe_ks.base.link_mode_masks_nwords =
  1252			copy_ks.base.link_mode_masks_nwords;
  1253	
  1254		if (rnpm_get_link_ksettings(netdev, &safe_ks)) {
  1255			/* return err */
  1256			return 0;
  1257		}
  1258	
  1259		if (!adapter->pf_adapter->force_10g_1g_speed_ablity) {
  1260			/* Checkout the media_type */
  1261			if (hw->phy.media_type != rnpm_media_type_fiber &&
  1262			    hw->phy.media_type != rnpm_media_type_copper &&
  1263			    hw->phy.media_type != rnpm_media_type_backplane &&
  1264			    hw->phy.media_type != rnpm_media_type_cx4 &&
  1265			    hw->phy.media_type != rnpm_media_type_da)
  1266				return -EOPNOTSUPP;
  1267		}
  1268	
  1269		/* Get link modes supported by hardware and check against modes
  1270		 * requested by user.  Return an error if unsupported mode was set.
  1271		 */
  1272		if (!bitmap_subset(copy_ks.link_modes.advertising,
  1273				   safe_ks.link_modes.supported,
  1274				   __ETHTOOL_LINK_MODE_MASK_NBITS))
  1275			return -EINVAL;
  1276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
