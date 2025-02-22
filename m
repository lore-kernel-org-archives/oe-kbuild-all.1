Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C1216BE17
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740212509; cv=none; b=NWWjepZ2RB0RBLrfSeTi5nmGQGtNinuMTA0PPIqSHt+xX420AcQvln7yQX0R9Eapeypua1ELqznq6rmVi4MOdb+BQM/plDfldmi3qo632VvkGzTY6Toh+1lvmygesGNyT7Ry6fB4EShatD2YPCUF02QZOIYDdV5c6hqVyroG3OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740212509; c=relaxed/simple;
	bh=ipxvwpXIFQ+goeExG1HuH2Tcd15uQhO/doZuSExBlr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PBDEbRs9RHhKQcVVDvnIYHceyZCyZkMU9r7NzDWIF21+tCmXBcWUlmyqPtdHOXss74jBRgTSwvpCQQ7sLn+rfNNdaduk3JTSuBbU1jn58CCy30/WI9bOZGJ2vMHaPRmC2yCxVbJncPrGPTuRqmmmY8oP2oEG+SK58g+OsOQChBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRHZ5hKC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRHZ5hKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740212506; x=1771748506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ipxvwpXIFQ+goeExG1HuH2Tcd15uQhO/doZuSExBlr8=;
  b=FRHZ5hKCfiwAYjMHwpJ+14h79MBOwubQkazSsuoNc0/Pdxu8e4v9R/Ga
   XYEoSjpZlNtounFioMCWAgXsOobcQydUAEtudxZWJwVAZ3fPSknaFVt9f
   1igMatlKOkKjx/kP7pLLzhfla14jxYvPzELq42wDpSqcNBCBA7IafP+RR
   /mzYwzj4b59dv7iiJuuWmPMlZm8iySj3Q23Ix8zu/0i2FwUz+D6Uz28jz
   MH5vc6yovXtSwEyXWioSAsCmSEDlHJgG7d05yT0Ia3+8B7It3w6+GT3EP
   EFNP2SclVKmjZbZdJiJoiLFXCb2kQ9eOT8VurlTaydQf70ydYjkBnXerr
   A==;
X-CSE-ConnectionGUID: M9q73YKRT8OEQgrf2RYPNw==
X-CSE-MsgGUID: QvHHKLpOTT6IVLFXeovQoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41174656"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="41174656"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 00:21:45 -0800
X-CSE-ConnectionGUID: 5MR4QWrFTISecggQo2ke+w==
X-CSE-MsgGUID: /dg73d9cSzSgrRSa7XnUVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120825536"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Feb 2025 00:21:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlklZ-0006Od-2l;
	Sat, 22 Feb 2025 08:21:41 +0000
Date: Sat, 22 Feb 2025 16:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2759/2759]
 drivers/net/ethernet/mucse/rnp/rnp_common.h:336:36: warning: suggest braces
 around empty body in an 'if' statement
Message-ID: <202502221652.JWQOOFW7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4d88bf76198b8a462646f7be261586ebb2bbf5f3
commit: e53494b741272933726616122ea77143d9742631 [2759/2759] drivers: initial support for rnp drivers from Mucse Technology
config: x86_64-randconfig-101-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221652.JWQOOFW7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221652.JWQOOFW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221652.JWQOOFW7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21,
                    from drivers/net/ethernet/mucse/rnp/rnp_tc_u32_parse.h:6,
                    from drivers/net/ethernet/mucse/rnp/rnp_main.c:34:
   drivers/net/ethernet/mucse/rnp/rnp_common.h: In function '_rnp_skb_dump':
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:336:36: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     336 |                     &dev->features);
         |                                    ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c: At top level:
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:174:6: warning: no previous prototype for 'rnp_unmap_and_free_tx_resource' [-Wmissing-prototypes]
     174 | void rnp_unmap_and_free_tx_resource(struct rnp_ring *ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:669:5: warning: no previous prototype for 'rnp_rx_ring_reinit' [-Wmissing-prototypes]
     669 | int rnp_rx_ring_reinit(struct rnp_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c: In function 'rnp_clean_rx_irq':
   drivers/net/ethernet/mucse/rnp/rnp_main.c:1777:14: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    1777 |         bool xdp_xmit = false;
         |              ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c: At top level:
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:2012:6: warning: no previous prototype for 'rnp_write_eitr_rx' [-Wmissing-prototypes]
    2012 | void rnp_write_eitr_rx(struct rnp_q_vector *q_vector)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3152:6: warning: no previous prototype for 'rnp_vlan_stags_flag' [-Wmissing-prototypes]
    3152 | void rnp_vlan_stags_flag(struct rnp_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3558:5: warning: no previous prototype for 'rnp_xmit_nop_frame_ring' [-Wmissing-prototypes]
    3558 | int rnp_xmit_nop_frame_ring(struct rnp_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4811:6: warning: no previous prototype for 'rnp_service_timer' [-Wmissing-prototypes]
    4811 | void rnp_service_timer(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:4919:6: warning: no previous prototype for 'rnp_service_task' [-Wmissing-prototypes]
    4919 | void rnp_service_task(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:5941:5: warning: no previous prototype for 'rnp_delete_knode' [-Wmissing-prototypes]
    5941 | int rnp_delete_knode(struct net_device *dev,
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6030:5: warning: no previous prototype for 'rnp_config_knode' [-Wmissing-prototypes]
    6030 | int rnp_config_knode(struct net_device *dev, __be16 protocol,
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6089:5: warning: no previous prototype for 'rnp_setup_tc_cls_u32' [-Wmissing-prototypes]
    6089 | int rnp_setup_tc_cls_u32(struct net_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6166:6: warning: no previous prototype for 'rnp_do_reset' [-Wmissing-prototypes]
    6166 | void rnp_do_reset(struct net_device *netdev)
         |      ^~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6387:6: warning: no previous prototype for 'rnp_clear_udp_tunnel_port' [-Wmissing-prototypes]
    6387 | void rnp_clear_udp_tunnel_port(struct rnp_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6507:6: warning: no previous prototype for 'rnp_assign_netdev_ops' [-Wmissing-prototypes]
    6507 | void rnp_assign_netdev_ops(struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6683:5: warning: no previous prototype for 'rnp_can_rpu_start' [-Wmissing-prototypes]
    6683 | int rnp_can_rpu_start(struct rnp_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c: In function 'rnp_request_msix_irqs':
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:2402:74: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    2402 |                                  sizeof(q_vector->name) - 1, "%s-%s-%d-%d",
         |                                                                          ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2401:25: note: 'snprintf' output between 10 and 45 bytes into a destination of size 24
    2401 |                         snprintf(q_vector->name,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
    2402 |                                  sizeof(q_vector->name) - 1, "%s-%s-%d-%d",
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2403 |                                  netdev->name, "TxRx", i, q_vector->v_idx);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21,
                    from drivers/net/ethernet/mucse/rnp/rnp_common.c:10:
   drivers/net/ethernet/mucse/rnp/rnp_common.h: In function '_rnp_skb_dump':
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:336:36: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     336 |                     &dev->features);
         |                                    ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^~~~~~~
--
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21,
                    from drivers/net/ethernet/mucse/rnp/rnp_lib.c:4:
   drivers/net/ethernet/mucse/rnp/rnp_common.h: In function '_rnp_skb_dump':
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:336:36: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     336 |                     &dev->features);
         |                                    ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_lib.c: At top level:
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:439:5: warning: no previous prototype for 'rnp_acquire_msix_vectors' [-Wmissing-prototypes]
     439 | int rnp_acquire_msix_vectors(struct rnp_adapter *adapter, int vectors)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_lib.c:985:6: warning: no previous prototype for 'rnp_print_ring_info' [-Wmissing-prototypes]
     985 | void rnp_print_ring_info(struct rnp_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21,
                    from drivers/net/ethernet/mucse/rnp/rnp_n10.c:8:
   drivers/net/ethernet/mucse/rnp/rnp_common.h: In function '_rnp_skb_dump':
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:336:36: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     336 |                     &dev->features);
         |                                    ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c: At top level:
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:122:5: warning: no previous prototype for 'rnp_eth_set_rar_n10' [-Wmissing-prototypes]
     122 | s32 rnp_eth_set_rar_n10(struct rnp_eth_info *eth, u32 index, u8 *addr,
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:179:5: warning: no previous prototype for 'rnp_eth_clear_rar_n10' [-Wmissing-prototypes]
     179 | s32 rnp_eth_clear_rar_n10(struct rnp_eth_info *eth, u32 index)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:214:5: warning: no previous prototype for 'rnp_eth_set_vmdq_n10' [-Wmissing-prototypes]
     214 | s32 rnp_eth_set_vmdq_n10(struct rnp_eth_info *eth, u32 rar, u32 vmdq)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:244:5: warning: no previous prototype for 'rnp_eth_clear_vmdq_n10' [-Wmissing-prototypes]
     244 | s32 rnp_eth_clear_vmdq_n10(struct rnp_eth_info *eth, u32 rar, u32 vmdq)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:328:5: warning: no previous prototype for 'rnp_addr_list_itr' [-Wmissing-prototypes]
     328 | u8 *rnp_addr_list_itr(struct rnp_hw __maybe_unused *hw, u8 **mc_addr_ptr)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:359:5: warning: no previous prototype for 'rnp_eth_update_mc_addr_list_n10' [-Wmissing-prototypes]
     359 | s32 rnp_eth_update_mc_addr_list_n10(struct rnp_eth_info *eth,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:442:6: warning: no previous prototype for 'rnp_eth_clr_mc_addr_n10' [-Wmissing-prototypes]
     442 | void rnp_eth_clr_mc_addr_n10(struct rnp_eth_info *eth)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:457:6: warning: no previous prototype for 'rnp_eth_update_rss_key_n10' [-Wmissing-prototypes]
     457 | void rnp_eth_update_rss_key_n10(struct rnp_eth_info *eth, bool sriov_flag)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:486:6: warning: no previous prototype for 'rnp_eth_update_rss_table_n10' [-Wmissing-prototypes]
     486 | void rnp_eth_update_rss_table_n10(struct rnp_eth_info *eth)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:511:5: warning: no previous prototype for 'rnp_eth_set_vfta_n10' [-Wmissing-prototypes]
     511 | s32 rnp_eth_set_vfta_n10(struct rnp_eth_info *eth, u32 vlan, bool vlan_on)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:551:6: warning: no previous prototype for 'rnp_eth_clr_vfta_n10' [-Wmissing-prototypes]
     551 | void rnp_eth_clr_vfta_n10(struct rnp_eth_info *eth)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:577:5: warning: no previous prototype for 'rnp_layer2_pritologic_n10' [-Wmissing-prototypes]
     577 | u16 rnp_layer2_pritologic_n10(u16 hw_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:582:6: warning: no previous prototype for 'rnp_eth_set_layer2_n10' [-Wmissing-prototypes]
     582 | void rnp_eth_set_layer2_n10(struct rnp_eth_info *eth,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:608:6: warning: no previous prototype for 'rnp_eth_clr_layer2_n10' [-Wmissing-prototypes]
     608 | void rnp_eth_clr_layer2_n10(struct rnp_eth_info *eth, u16 pri_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:616:6: warning: no previous prototype for 'rnp_eth_clr_all_layer2_n10' [-Wmissing-prototypes]
     616 | void rnp_eth_clr_all_layer2_n10(struct rnp_eth_info *eth)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:624:5: warning: no previous prototype for 'rnp_tuple5_pritologic_n10' [-Wmissing-prototypes]
     624 | u16 rnp_tuple5_pritologic_n10(u16 hw_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:629:5: warning: no previous prototype for 'rnp_tuple5_pritologic_tcam_n10' [-Wmissing-prototypes]
     629 | u16 rnp_tuple5_pritologic_tcam_n10(u16 pri_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:644:6: warning: no previous prototype for 'rnp_eth_set_tuple5_n10' [-Wmissing-prototypes]
     644 | void rnp_eth_set_tuple5_n10(struct rnp_eth_info *eth,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:829:6: warning: no previous prototype for 'rnp_eth_clr_tuple5_n10' [-Wmissing-prototypes]
     829 | void rnp_eth_clr_tuple5_n10(struct rnp_eth_info *eth, u16 pri_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:853:6: warning: no previous prototype for 'rnp_eth_clr_all_tuple5_n10' [-Wmissing-prototypes]
     853 | void rnp_eth_clr_all_tuple5_n10(struct rnp_eth_info *eth)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:886:6: warning: no previous prototype for 'rnp_eth_set_tcp_sync_n10' [-Wmissing-prototypes]
     886 | void rnp_eth_set_tcp_sync_n10(struct rnp_eth_info *eth, int queue,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:1132:5: warning: no previous prototype for 'rnp_init_hw_ops_n10' [-Wmissing-prototypes]
    1132 | s32 rnp_init_hw_ops_n10(struct rnp_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:1146:5: warning: no previous prototype for 'rnp_get_permtion_mac_addr_n10' [-Wmissing-prototypes]
    1146 | s32 rnp_get_permtion_mac_addr_n10(struct rnp_hw *hw, u8 *mac_addr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:1156:5: warning: no previous prototype for 'rnp_reset_hw_ops_n10' [-Wmissing-prototypes]
    1156 | s32 rnp_reset_hw_ops_n10(struct rnp_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:1230:5: warning: no previous prototype for 'rnp_start_hw_ops_n10' [-Wmissing-prototypes]
    1230 | s32 rnp_start_hw_ops_n10(struct rnp_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:1849:5: warning: no previous prototype for 'rnp_check_mac_link_hw_ops_n10' [-Wmissing-prototypes]
    1849 | s32 rnp_check_mac_link_hw_ops_n10(struct rnp_hw *hw, rnp_link_speed *speed,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:1874:5: warning: no previous prototype for 'rnp_setup_mac_link_hw_ops_n10' [-Wmissing-prototypes]
    1874 | s32 rnp_setup_mac_link_hw_ops_n10(struct rnp_hw *hw, u32 adv, u32 autoneg,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2017:6: warning: no previous prototype for 'rnp_clean_link_hw_ops_n10' [-Wmissing-prototypes]
    2017 | void rnp_clean_link_hw_ops_n10(struct rnp_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:2800:5: warning: no previous prototype for 'rnp10_get_link_ksettings' [-Wmissing-prototypes]
    2800 | int rnp10_get_link_ksettings(struct net_device *netdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:2998:5: warning: no previous prototype for 'rnp10_set_link_ksettings' [-Wmissing-prototypes]
    2998 | int rnp10_set_link_ksettings(struct net_device *netdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c: In function 'rnp10_set_link_ksettings':
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3005:39: warning: variable 'duplex_changed' set but not used [-Wunused-but-set-variable]
    3005 |         bool autoneg_changed = false, duplex_changed = false;
         |                                       ^~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3005:14: warning: variable 'autoneg_changed' set but not used [-Wunused-but-set-variable]
    3005 |         bool autoneg_changed = false, duplex_changed = false;
         |              ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c: At top level:
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3244:5: warning: no previous prototype for 'rnp_nway_reset' [-Wmissing-prototypes]
    3244 | int rnp_nway_reset(struct net_device *netdev)
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3264:6: warning: no previous prototype for 'rnp_device_supports_autoneg_fc' [-Wmissing-prototypes]
    3264 | bool rnp_device_supports_autoneg_fc(struct rnp_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c: In function 'rnp10_get_strings':
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3385:13: warning: variable 'dma_ch' set but not used [-Wunused-but-set-variable]
    3385 |         u32 dma_ch;
         |             ^~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c: In function 'rnp10_get_ethtool_stats':
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3739:21: warning: variable 'idx' set but not used [-Wunused-but-set-variable]
    3739 |                 int idx;
         |                     ^~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c: At top level:
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3928:6: warning: no previous prototype for 'rnp_set_ethtool_hw_ops_n10' [-Wmissing-prototypes]
    3928 | void rnp_set_ethtool_hw_ops_n10(struct net_device *netdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:3938:5: warning: no previous prototype for 'rnp_get_thermal_sensor_data_hw_ops_n10' [-Wmissing-prototypes]
    3938 | s32 rnp_get_thermal_sensor_data_hw_ops_n10(struct rnp_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3954:5: warning: no previous prototype for 'rnp_init_thermal_sensor_thresh_hw_ops_n10' [-Wmissing-prototypes]
    3954 | s32 rnp_init_thermal_sensor_thresh_hw_ops_n10(struct rnp_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3968:5: warning: no previous prototype for 'rnp_phy_read_reg_hw_ops_n10' [-Wmissing-prototypes]
    3968 | s32 rnp_phy_read_reg_hw_ops_n10(struct rnp_hw *hw, u32 reg_addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3980:5: warning: no previous prototype for 'rnp_phy_write_reg_hw_ops_n10' [-Wmissing-prototypes]
    3980 | s32 rnp_phy_write_reg_hw_ops_n10(struct rnp_hw *hw, u32 reg_addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3990:6: warning: no previous prototype for 'rnp_set_vf_vlan_mode_hw_ops_n10' [-Wmissing-prototypes]
    3990 | void rnp_set_vf_vlan_mode_hw_ops_n10(struct rnp_hw *hw, u16 vlan, int vf,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4128:5: warning: no previous prototype for 'rnp_mac_fc_mode_n10' [-Wmissing-prototypes]
    4128 | s32 rnp_mac_fc_mode_n10(struct rnp_mac_info *mac)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:4215:6: warning: no previous prototype for 'rnp_mac_set_mac_n10' [-Wmissing-prototypes]
    4215 | void rnp_mac_set_mac_n10(struct rnp_mac_info *mac, u8 *addr, int index)
         |      ^~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21,
                    from drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:9:
   drivers/net/ethernet/mucse/rnp/rnp_common.h: In function '_rnp_skb_dump':
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:336:36: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     336 |                     &dev->features);
         |                                    ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c: In function 'rnp_mbx_get_temp':
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1100:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1100 |         int err;
         |             ^~~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c: At top level:
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1136:5: warning: no previous prototype for 'rnp_fw_reg_read' [-Wmissing-prototypes]
    1136 | int rnp_fw_reg_read(struct rnp_hw *hw, int addr, int sz)
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c: In function 'rnp_fw_reg_read':
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1140:13: warning: variable 'value' set but not used [-Wunused-but-set-variable]
    1140 |         int value;
         |             ^~~~~
..


vim +/if +336 drivers/net/ethernet/mucse/rnp/rnp_common.h

   287	
   288	#ifndef NO_SKB_DUMP
   289	static inline void _rnp_skb_dump(const struct sk_buff *skb, bool full_pkt)
   290	{
   291		static atomic_t can_dump_full = ATOMIC_INIT(5);
   292	#ifdef DEBUG
   293		struct skb_shared_info *sh = skb_shinfo(skb);
   294	#endif
   295		struct net_device *dev = skb->dev;
   296		//struct sock *sk = skb->sk;
   297		struct sk_buff *list_skb;
   298		bool has_mac, has_trans;
   299		int headroom, tailroom;
   300		int i, len, seg_len;
   301		const char *level = KERN_WARNING;
   302	
   303		if (full_pkt)
   304			full_pkt = atomic_dec_if_positive(&can_dump_full) >= 0;
   305	
   306		if (full_pkt)
   307			len = skb->len;
   308		else
   309			len = min_t(int, skb->len, MAX_HEADER + 128);
   310	
   311		headroom = skb_headroom(skb);
   312		tailroom = skb_tailroom(skb);
   313	
   314		has_mac = skb_mac_header_was_set(skb);
   315		has_trans = skb_transport_header_was_set(skb);
   316	
   317		dbg("%sskb len=%u headroom=%u headlen=%u tailroom=%u\n"
   318		    "mac=(%d,%d) net=(%d,%d) trans=%d\n"
   319		    "shinfo(txflags=%u nr_frags=%u gso(size=%hu type=%u segs=%hu))\n"
   320		    "csum(0x%x ip_summed=%u complete_sw=%u valid=%u level=%u)\n"
   321		    "hash(0x%x sw=%u l4=%u) proto=0x%04x pkttype=%u iif=%d\n",
   322		    level, skb->len, headroom, skb_headlen(skb), tailroom,
   323		    has_mac ? skb->mac_header : -1,
   324		    has_mac ? (skb->network_header - skb->mac_header) : -1,
   325		    skb->network_header,
   326		    has_trans ? skb_network_header_len(skb) : -1,
   327		    has_trans ? skb->transport_header : -1, sh->tx_flags,
   328		    sh->nr_frags, sh->gso_size, sh->gso_type, sh->gso_segs,
   329		    skb->csum, skb->ip_summed, skb->csum_complete_sw,
   330		    skb->csum_valid, skb->csum_level, skb->hash, skb->sw_hash,
   331		    skb->l4_hash, ntohs(skb->protocol), skb->pkt_type,
   332		    skb->skb_iif);
   333	
   334		if (dev)
   335			dbg("%sdev name=%s feat=0x%pNF\n", level, dev->name,
 > 336			    &dev->features);
   337	
   338		//if (full_pkt && headroom)
   339		//		print_hex_dump(level, "skb headroom: ",
   340		//		DUMP_PREFIX_OFFSET,
   341		//		16, 1, skb->head, headroom, false);
   342	
   343		seg_len = min_t(int, skb_headlen(skb), len);
   344		if (seg_len)
   345			print_hex_dump(level, "skb linear:   ", DUMP_PREFIX_OFFSET,
   346				       16, 1, skb->data, seg_len, false);
   347		len -= seg_len;
   348	
   349		//	if (full_pkt && tailroom)
   350		//		print_hex_dump(level, "skb tailroom: ",
   351		//		DUMP_PREFIX_OFFSET,
   352		//		16, 1, skb_tail_pointer(skb), tailroom, false);
   353	
   354		for (i = 0; len && i < skb_shinfo(skb)->nr_frags; i++) {
   355			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
   356			//u32 p_off, p_len, copied;
   357			u32 p_len;
   358			struct page *p;
   359			u8 *vaddr;
   360	
   361			p = skb_frag_address(frag);
   362			p_len = skb_frag_size(frag);
   363			seg_len = min_t(int, p_len, len);
   364			vaddr = kmap_atomic(p);
   365			print_hex_dump(level, "skb frag:     ", DUMP_PREFIX_OFFSET,
   366				       16, 1, vaddr, seg_len, false);
   367			kunmap_atomic(vaddr);
   368			len -= seg_len;
   369			if (!len)
   370				break;
   371		}
   372	
   373		if (full_pkt && skb_has_frag_list(skb)) {
   374			dbg("skb fraglist:\n");
   375			skb_walk_frags(skb, list_skb)
   376				_rnp_skb_dump(list_skb, true);
   377		}
   378	}
   379	#endif
   380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
