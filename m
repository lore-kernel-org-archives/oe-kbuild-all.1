Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573EE18A6DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 22:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729983455; cv=none; b=Q8ZG+mtnfbPIHvcNccHz92F02eC4RSqucM/tV+Gly+MBuGTgPyDgdNcDfetuQ+d3oAWYi64dEvHtaTGYPS8j+FklaNHJidO3Es3vailfPFS/is20DqqmlsBx3SJa8k959r+1aaeGwIGUmWhhs4eBWtwUufED5J4Q0L7sAgLwp6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729983455; c=relaxed/simple;
	bh=zSsaUwdJRX2axeqvdEWey8cGpkLkWrqe5jrMuQmNqvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hk10Z3vYGgou+Gpr8TIwMjs9pDuSiQUpmj1btCeY+tV5KTthAIoAqCHINVUtrho66K/1vZ6cG+4xNhA0GQrcLOc/lFrVlk1slG1T+8mBc9891DrqDHTrzgN25B5zav3xrmh5u27p+wzpsgTVUy3gv+XMvDR3o72gr0uB1Zh6Cz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGwBQlBr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGwBQlBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729983453; x=1761519453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zSsaUwdJRX2axeqvdEWey8cGpkLkWrqe5jrMuQmNqvE=;
  b=QGwBQlBr6l7DDr9AnGTSgQaf5LNA3KnjMTllsUW9uCgA6I1odzNJtYn5
   BaEU+Xa80ci2XZw89Z21hi6KU3PCg5aYpsGft8aFNADYnUHlgY2lbqp0v
   EwiIfpyLbN5+6DTNvYsRLZHxkrnvY6OG8PKSJ83jq2v0pPlgxf1/B8AA6
   1OpRAO0x+T1FW+P9hM2keULkWedlN3/iHL/phX040Q7WPgFtL+GDM4+qC
   7wCyrIRYfAqQZfqMWT91Hp+j2t2+jhfkU3tu7eo+195phim2bbTVDA+5p
   gfCc8bsZDojAvcMm1vRLhCSQW3fZDxpcTWCT2x3OTSKwRx6DZH16PPQ2Q
   g==;
X-CSE-ConnectionGUID: Ar3Q1ugXQROvaJcNXkShYw==
X-CSE-MsgGUID: MRMM9UH0TiuboZpKCCHFGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="33424378"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="33424378"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 15:57:32 -0700
X-CSE-ConnectionGUID: IK7GXzrfQ1abN7FN2wdT9A==
X-CSE-MsgGUID: omeI2gYsRKmITdKpOMv4Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="112095134"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Oct 2024 15:57:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4pin-000a96-0A;
	Sat, 26 Oct 2024 22:57:25 +0000
Date: Sun, 27 Oct 2024 06:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "gu.huiguang" <guhuiguang@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 4037/15331]
 drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1008:35: error: 'struct
 rnpm_tx_buffer' has no member named 'gso_need_padding'
Message-ID: <202410270659.eFwieVWt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi gu.huiguang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: 5deaf74c4b3edcf88f67f18aa352690deb9dc212 [4037/15331] drivers: initial support for rnpm drivers from Mucse Technology
config: loongarch-randconfig-002-20241027 (https://download.01.org/0day-ci/archive/20241027/202410270659.eFwieVWt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270659.eFwieVWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270659.eFwieVWt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c: In function 'rnpm_maybe_tx_ctxtdesc':
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1008:35: error: 'struct rnpm_tx_buffer' has no member named 'gso_need_padding'
    1008 |                         if (!first->gso_need_padding)
         |                                   ^~
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1010:30: error: 'struct rnpm_tx_buffer' has no member named 'gso_need_padding'
    1010 |                         first->gso_need_padding = false;
         |                              ^~
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c: At top level:
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1185:6: warning: no previous prototype for 'rnpm_setup_layer2_remapping' [-Wmissing-prototypes]
    1185 | void rnpm_setup_layer2_remapping(struct rnpm_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1209:6: warning: no previous prototype for 'rnpm_setup_tuple5_remapping' [-Wmissing-prototypes]
    1209 | void rnpm_setup_tuple5_remapping(struct rnpm_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1280:6: warning: no previous prototype for 'rnpm_setup_tuple5_remapping_tcam' [-Wmissing-prototypes]
    1280 | void rnpm_setup_tuple5_remapping_tcam(struct rnpm_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:256:6: warning: no previous prototype for 'rnpm_pf_service_event_schedule' [-Wmissing-prototypes]
     256 | void rnpm_pf_service_event_schedule(struct rnpm_pf_adapter *pf_adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1137:5: warning: no previous prototype for 'rnpm_rx_ring_reinit' [-Wmissing-prototypes]
    1137 | int rnpm_rx_ring_reinit(struct rnpm_adapter *adapter, struct rnpm_ring *rx_ring)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: In function 'rnpm_clean_rx_irq':
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2015:14: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    2015 |         bool xdp_xmit = false;
         |              ^~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: At top level:
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2207:6: warning: no previous prototype for 'rnpm_write_eitr' [-Wmissing-prototypes]
    2207 | void rnpm_write_eitr(struct rnpm_q_vector *q_vector, bool is_rxframe)
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3013:5: warning: no previous prototype for 'rnpm_xmit_nop_frame_ring' [-Wmissing-prototypes]
    3013 | int rnpm_xmit_nop_frame_ring(struct rnpm_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3037:5: warning: no previous prototype for 'rnpm_xmit_nop_frame_ring_temp' [-Wmissing-prototypes]
    3037 | int rnpm_xmit_nop_frame_ring_temp(struct rnpm_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3909:6: warning: no previous prototype for 'rnpm_vlan_stags_flag' [-Wmissing-prototypes]
    3909 | void rnpm_vlan_stags_flag(struct rnpm_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4031:6: warning: no previous prototype for 'control_mac_rx' [-Wmissing-prototypes]
    4031 | void control_mac_rx(struct rnpm_adapter *adapter, bool on)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5803:6: warning: no previous prototype for 'rnpm_pf_service_timer' [-Wmissing-prototypes]
    5803 | void rnpm_pf_service_timer(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5821:6: warning: no previous prototype for 'rnpm_service_timer' [-Wmissing-prototypes]
    5821 | void rnpm_service_timer(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5962:21: warning: no previous prototype for 'wait_all_port_resetting' [-Wmissing-prototypes]
    5962 | __maybe_unused void wait_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5974:21: warning: no previous prototype for 'clean_all_port_resetting' [-Wmissing-prototypes]
    5974 | __maybe_unused void clean_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6185:5: warning: no previous prototype for 'rnpm_check_mc_addr' [-Wmissing-prototypes]
    6185 | int rnpm_check_mc_addr(struct rnpm_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6211:6: warning: no previous prototype for 'update_pf_vlan' [-Wmissing-prototypes]
    6211 | void update_pf_vlan(struct rnpm_adapter *adapter)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6262:6: warning: no previous prototype for 'rnpm_pf_service_task' [-Wmissing-prototypes]
    6262 | void rnpm_pf_service_task(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: In function 'rnpm_tso':
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6449:38: error: 'struct rnpm_tx_buffer' has no member named 'gso_need_padding'
    6449 |                                 first->gso_need_padding = !!gso_need_pad;
         |                                      ^~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: In function 'rnpm_tx_csum':
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6517:30: error: 'struct rnpm_tx_buffer' has no member named 'gso_need_padding'
    6517 |                         first->gso_need_padding = true;
         |                              ^~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: At top level:
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7528:6: warning: no previous prototype for 'rnpm_clear_udp_tunnel_port' [-Wmissing-prototypes]
    7528 | void rnpm_clear_udp_tunnel_port(struct rnpm_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7692:6: warning: no previous prototype for 'rnpm_assign_netdev_ops' [-Wmissing-prototypes]
    7692 | void rnpm_assign_netdev_ops(struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7785:6: warning: no previous prototype for 'rnpm_fix_queue_number' [-Wmissing-prototypes]
    7785 | void rnpm_fix_queue_number(struct rnpm_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8760:5: warning: no previous prototype for 'rnpm_can_rpu_start' [-Wmissing-prototypes]
    8760 | int rnpm_can_rpu_start(struct rnpm_pf_adapter *pf_adapter)
         |     ^~~~~~~~~~~~~~~~~~


vim +1008 drivers/net/ethernet/mucse/rnpm/rnpm_lib.c

  1000	
  1001	void rnpm_maybe_tx_ctxtdesc(struct rnpm_ring *tx_ring,
  1002				    struct rnpm_tx_buffer *first, u32 type_tucmd)
  1003	{
  1004		struct rnpm_adapter *adapter = netdev_priv((tx_ring)->netdev);
  1005		/* sriov mode pf use the last vf */
  1006		if (first->ctx_flag) {
  1007			if (adapter->priv_flags & RNPM_PRIV_FLAG_TX_PADDING) {
> 1008				if (!first->gso_need_padding)
  1009					type_tucmd |= RNPM_TXD_MTI_CRC_PAD_CTRL;
  1010				first->gso_need_padding = false;
  1011			}
  1012	
  1013			rnpm_tx_ctxtdesc(tx_ring, first->mss_len_vf_num,
  1014					 first->inner_vlan_tunnel_len, type_tucmd);
  1015		}
  1016	}
  1017	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
