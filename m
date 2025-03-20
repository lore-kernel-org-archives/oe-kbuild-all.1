Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F16228C99
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 19:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742497876; cv=none; b=hTfBbIPbRz/IAIvO62JBVvYbD1/GKuKqx8MlWzTS62G8SP2EFn9205V/6p2wPNZ/F77ENVQ4Vg1ddSgyRh2o0Z1lGUb2Dy1iwzkb0lBUVuK0rX/QXvuwpuXzHTtsc1O7ITgbCQgB0wl/5DNydg+c7SMP6HBdmcTSwEAM+DMAaUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742497876; c=relaxed/simple;
	bh=tx39IPoIGv4eDjDCl0aJOqL/TiJ6MeWJr6w4PBbur2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=egMAU8Y9NiX/etSCK1cb7sjuFJujtSogvCruWsha1HgIbLPCxOzkAfi7VeX/cLtjueFbBX3tTZLkbF3qXh4jLaFf70/zyxzFWYa7ji2UeWLGOg0raKDyB8/odJ7vDCROrzIrShBtCT0Do5Y4aZSqX9ICpulXC0qWh8djyQHH23I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRcE/xTZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRcE/xTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742497874; x=1774033874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tx39IPoIGv4eDjDCl0aJOqL/TiJ6MeWJr6w4PBbur2s=;
  b=BRcE/xTZdgDW1rOuAnzzSLXdu5/uxEVA3UWZNNM0AEkoxvGojABZMk2g
   YIu13x1WgNFemTwatMT5dSlDM/GxU2+Fk9KoUCiimvVUfq3DmPPx8QTjm
   trQWWJPLkP0srXhsgRykZ18zbqRRMiVM19uWfnVrAU/+RKSxlMhnPckvx
   W+Gutc+uvTC2BSsxQk3K0fh4/QMWDYT0kun6T/5luDBHOqK372qb5V+37
   Bsqwj1XrrddIKultv9Y2EwI6TbVUXkOQBBOyvsX5WqhwtFst6vfA4py4w
   drcIG+gr4S06niM8o16GB4lsLN5vO+PT1Jbsz5M67KNtxEpOl48s3GVf/
   Q==;
X-CSE-ConnectionGUID: DhQatidXQWy1e/2VTydWbg==
X-CSE-MsgGUID: 81w7HeC6RAmIBYR/hZ/5fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="53971836"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="53971836"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 12:11:10 -0700
X-CSE-ConnectionGUID: DLRl+uwHQO+edBsJMuu0Rg==
X-CSE-MsgGUID: KhEf0QR/Qxq2jAS1/uXo+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="128026040"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Mar 2025 12:11:10 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvLII-0000hT-2l;
	Thu, 20 Mar 2025 19:11:06 +0000
Date: Fri, 21 Mar 2025 03:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2816/2816]
 drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:1137:45: warning: implicit
 truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1
Message-ID: <202503210356.tFg9vkJQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   762816c3c07e052877c68911685e3700fe073298
commit: a0c5bfdbc099daf30cbadb9657803f0cb3f89d0b [2816/2816] drivers: support for rnpm drivers from Mucse Technology N10/N400
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250321/202503210356.tFg9vkJQ-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210356.tFg9vkJQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210356.tFg9vkJQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mucse/rnpm/rnpm_common.c:12:
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:1137:45: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1137 |                 req->loopback.loopback_force_speed_enable = 1;
         |                                                           ^ ~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:1162:37: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1162 |                 req->set_phy_reg.recall_qsfp_page = 1;
         |                                                   ^ ~
   2 warnings generated.
--
   In file included from drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:20:
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:1137:45: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1137 |                 req->loopback.loopback_force_speed_enable = 1;
         |                                                           ^ ~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:1162:37: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1162 |                 req->set_phy_reg.recall_qsfp_page = 1;
         |                                                   ^ ~
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:1232:7: warning: variable 'autoneg_changed' set but not used [-Wunused-but-set-variable]
    1232 |         bool autoneg_changed = false, duplex_changed = false;
         |              ^
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:1232:32: warning: variable 'duplex_changed' set but not used [-Wunused-but-set-variable]
    1232 |         bool autoneg_changed = false, duplex_changed = false;
         |                                       ^
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2029:6: warning: variable 'dma_ch' set but not used [-Wunused-but-set-variable]
    2029 |         u32 dma_ch;
         |             ^
   5 warnings generated.
--
   In file included from drivers/net/ethernet/mucse/rnpm/rnpm_main.c:32:
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:1137:45: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1137 |                 req->loopback.loopback_force_speed_enable = 1;
         |                                                           ^ ~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:1162:37: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1162 |                 req->set_phy_reg.recall_qsfp_page = 1;
         |                                                   ^ ~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:245:6: warning: no previous prototype for function 'rnpm_pf_service_event_schedule' [-Wmissing-prototypes]
     245 | void rnpm_pf_service_event_schedule(struct rnpm_pf_adapter *pf_adapter)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     245 | void rnpm_pf_service_event_schedule(struct rnpm_pf_adapter *pf_adapter)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1768:5: warning: no previous prototype for function 'rnpm_rx_ring_reinit' [-Wmissing-prototypes]
    1768 | int rnpm_rx_ring_reinit(struct rnpm_adapter *adapter, struct rnpm_ring *rx_ring)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1768:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1768 | int rnpm_rx_ring_reinit(struct rnpm_adapter *adapter, struct rnpm_ring *rx_ring)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1957:7: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    1957 |         bool xdp_xmit = false;
         |              ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2142:6: warning: no previous prototype for function 'rnpm_write_eitr' [-Wmissing-prototypes]
    2142 | void rnpm_write_eitr(struct rnpm_q_vector *q_vector, bool is_rxframe)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2142:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2142 | void rnpm_write_eitr(struct rnpm_q_vector *q_vector, bool is_rxframe)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2381:6: warning: variable 'packets' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
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
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2969:5: warning: no previous prototype for function 'rnpm_xmit_nop_frame_ring' [-Wmissing-prototypes]
    2969 | int rnpm_xmit_nop_frame_ring(struct rnpm_adapter *adapter,
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2969:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2969 | int rnpm_xmit_nop_frame_ring(struct rnpm_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2985:5: warning: no previous prototype for function 'rnpm_xmit_nop_frame_ring_temp' [-Wmissing-prototypes]
    2985 | int rnpm_xmit_nop_frame_ring_temp(struct rnpm_adapter *adapter,
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2985:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2985 | int rnpm_xmit_nop_frame_ring_temp(struct rnpm_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3851:6: warning: no previous prototype for function 'rnpm_vlan_stags_flag' [-Wmissing-prototypes]
    3851 | void rnpm_vlan_stags_flag(struct rnpm_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3851:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3851 | void rnpm_vlan_stags_flag(struct rnpm_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3972:6: warning: no previous prototype for function 'control_mac_rx' [-Wmissing-prototypes]
    3972 | void control_mac_rx(struct rnpm_adapter *adapter, bool on)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3972:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3972 | void control_mac_rx(struct rnpm_adapter *adapter, bool on)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5689:6: warning: no previous prototype for function 'rnpm_pf_service_timer' [-Wmissing-prototypes]
    5689 | void rnpm_pf_service_timer(struct timer_list *t)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5689:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5689 | void rnpm_pf_service_timer(struct timer_list *t)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5707:6: warning: no previous prototype for function 'rnpm_service_timer' [-Wmissing-prototypes]
    5707 | void rnpm_service_timer(struct timer_list *t)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5707:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5707 | void rnpm_service_timer(struct timer_list *t)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5853:21: warning: no previous prototype for function 'wait_all_port_resetting' [-Wmissing-prototypes]
    5853 | __maybe_unused void wait_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5853:16: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5853 | __maybe_unused void wait_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                ^
         |                static 
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5865:21: warning: no previous prototype for function 'clean_all_port_resetting' [-Wmissing-prototypes]
    5865 | __maybe_unused void clean_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5865:16: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5865 | __maybe_unused void clean_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                ^
         |                static 
--
   In file included from drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:11:
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:1137:45: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1137 |                 req->loopback.loopback_force_speed_enable = 1;
         |                                                           ^ ~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:1162:37: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1162 |                 req->set_phy_reg.recall_qsfp_page = 1;
         |                                                   ^ ~
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:448:5: warning: no previous prototype for function 'rnpm_reset_pipeline_n10' [-Wmissing-prototypes]
     448 | s32 rnpm_reset_pipeline_n10(struct rnpm_hw *hw)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:448:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     448 | s32 rnpm_reset_pipeline_n10(struct rnpm_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:503:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     503 |         s32 status = 0;
         |             ^
   4 warnings generated.
--
   In file included from drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:10:
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:1137:45: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1137 |                 req->loopback.loopback_force_speed_enable = 1;
         |                                                           ^ ~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:1162:37: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1162 |                 req->set_phy_reg.recall_qsfp_page = 1;
         |                                                   ^ ~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:14:24: warning: no previous prototype for function 'mbx_cookie_zalloc' [-Wmissing-prototypes]
      14 | struct mbx_req_cookie *mbx_cookie_zalloc(int priv_len)
         |                        ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      14 | struct mbx_req_cookie *mbx_cookie_zalloc(int priv_len)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:28:5: warning: no previous prototype for function 'rnpm_mbx_write_posted_locked' [-Wmissing-prototypes]
      28 | int rnpm_mbx_write_posted_locked(struct rnpm_hw *hw, struct mbx_fw_cmd_req *req)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:28:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      28 | int rnpm_mbx_write_posted_locked(struct rnpm_hw *hw, struct mbx_fw_cmd_req *req)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:81:6: warning: no previous prototype for function 'rnpm_link_stat_mark_disable' [-Wmissing-prototypes]
      81 | void rnpm_link_stat_mark_disable(struct rnpm_hw *hw)
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:81:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      81 | void rnpm_link_stat_mark_disable(struct rnpm_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:86:5: warning: no previous prototype for function 'rnpm_mbx_fw_post_req' [-Wmissing-prototypes]
      86 | int rnpm_mbx_fw_post_req(struct rnpm_hw *hw,
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:86:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      86 | int rnpm_mbx_fw_post_req(struct rnpm_hw *hw,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:153:5: warning: no previous prototype for function 'rnpm_fw_send_cmd_wait' [-Wmissing-prototypes]
     153 | int rnpm_fw_send_cmd_wait(struct rnpm_hw *hw,
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:153:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     153 | int rnpm_fw_send_cmd_wait(struct rnpm_hw *hw,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:633:5: warning: no previous prototype for function 'rnpm_mbx_lldp_all_ports_enable' [-Wmissing-prototypes]
     633 | int rnpm_mbx_lldp_all_ports_enable(struct rnpm_hw *hw, bool enable)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:633:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     633 | int rnpm_mbx_lldp_all_ports_enable(struct rnpm_hw *hw, bool enable)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:936:5: warning: no previous prototype for function 'rnpm_mbx_pluginout_evt_en' [-Wmissing-prototypes]
     936 | int rnpm_mbx_pluginout_evt_en(struct rnpm_hw *hw, int in_dir, int enable)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:936:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     936 | int rnpm_mbx_pluginout_evt_en(struct rnpm_hw *hw, int in_dir, int enable)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:963:5: warning: no previous prototype for function 'rnpm_fw_get_capablity' [-Wmissing-prototypes]
     963 | int rnpm_fw_get_capablity(struct rnpm_hw *hw, struct phy_abilities *abil)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:963:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     963 | int rnpm_fw_get_capablity(struct rnpm_hw *hw, struct phy_abilities *abil)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1153:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1153 |         int err;
         |             ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1188:6: warning: variable 'value' set but not used [-Wunused-but-set-variable]
    1188 |         int value;
         |             ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1184:5: warning: no previous prototype for function 'rnpm_fw_reg_read' [-Wmissing-prototypes]
    1184 | int rnpm_fw_reg_read(struct rnpm_hw *hw, int addr, int sz)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1184:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1184 | int rnpm_fw_reg_read(struct rnpm_hw *hw, int addr, int sz)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1255:18: warning: variable 'hw' set but not used [-Wunused-but-set-variable]
    1255 |         struct rnpm_hw *hw;
         |                         ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1476:5: warning: no previous prototype for function 'rnpm_get_port_stats2' [-Wmissing-prototypes]
    1476 | int rnpm_get_port_stats2(struct rnpm_hw *hw, int *pabs, int *pspeed, int *plink)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1476:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1476 | int rnpm_get_port_stats2(struct rnpm_hw *hw, int *pabs, int *pspeed, int *plink)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1528:9: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
    1528 |         return err ? -err : 0;
         |                ^~~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1509:9: note: initialize the variable 'err' to silence this warning
    1509 |         int err;
         |                ^
         |                 = 0
   16 warnings generated.
--
   In file included from drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:17:
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:1137:45: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1137 |                 req->loopback.loopback_force_speed_enable = 1;
         |                                                           ^ ~
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h:1162:37: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1162 |                 req->set_phy_reg.recall_qsfp_page = 1;
         |                                                   ^ ~
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:263:5: warning: no previous prototype for function 'rnpm_mbx_get_pn_sn' [-Wmissing-prototypes]
     263 | int rnpm_mbx_get_pn_sn(struct rnpm_hw *hw, char pn[33], char sn[33])
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:263:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     263 | int rnpm_mbx_get_pn_sn(struct rnpm_hw *hw, char pn[33], char sn[33])
         | ^
         | static 
   3 warnings generated.


vim +/int +1137 drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.h

  1119	
  1120	static inline void
  1121	build_link_set_loopback_req(struct mbx_fw_cmd_req *req,
  1122								void *cookie,
  1123								enum LOOPBACK_LEVEL level,
  1124								enum LOOPBACK_FORCE_SPEED force_speed)
  1125	{
  1126		req->flags = 0;
  1127		req->opcode = SET_LOOPBACK_MODE;
  1128		req->datalen = sizeof(req->loopback);
  1129		req->cookie = cookie;
  1130		req->reply_lo = 0;
  1131		req->reply_hi = 0;
  1132	
  1133		req->loopback.loopback_level = level;
  1134		req->loopback.loopback_type = LOOPBACK_TYPE_LOCAL;
  1135		if (force_speed != LOOPBACK_FORCE_SPEED_NONE) {
  1136			req->loopback.loopback_force_speed = force_speed;
> 1137			req->loopback.loopback_force_speed_enable = 1;
  1138		}
  1139	}
  1140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
