Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14762320E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 04:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734238327; cv=none; b=dMJwH/ejK3LKS/9I6fRVWdN5SNpACVIlPhCqWRAI0g1sw9JmWaYga/emd+ehFJ7PZY7bISCuzYG9Jc4jPJeSf5KzWd0sZsx/9sP+yCadyJ2JV4GSDd8B2SVr0j5f55kHuaWvly5gJOz+XRjmBR3N7TdtLeO8Nt8283+LiWjw/1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734238327; c=relaxed/simple;
	bh=8pFDxj5tBo+2AXQlchbM/n7V3nAQ/Sp4Rx5UNeY0z0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INduBmTEmrP1gI2Ke4y4DEhgb1wkBKzc1Iq8ucKJPNWBpvk4VlPaUuGeTVB5u9yzTHjDSWeRWAWlhdwCm594ol4jemt9UmowU1rBYbro9uaU64h4CJ5+o9DcVqkm9xqmKl1DsDAFjrecoBmW8x8wTmV+Fx7AeJhfm1hUqeVVe2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCCHEyFR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCCHEyFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734238325; x=1765774325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8pFDxj5tBo+2AXQlchbM/n7V3nAQ/Sp4Rx5UNeY0z0A=;
  b=GCCHEyFRqly1746kc25nkU5ohu3uWpfO+qpv/xI1u3EwTJ50nWWwATu6
   5fUtEI34zKJnXw3r9lKAFOxY7m89udAoSWBnQVPpje7GHT+AWZNvRFXzJ
   I2cIYvBfUSwsXRpDxVWx8vgtHu0Nk/UrRBX5e5Pk4TCvCdperfEYvuEeQ
   hxyaY21Qi+6CaleFFEKQahxKo5RMEGceZ4b3A0MOYHoPohqaEqBqYfoYL
   mI46a0Dgs28XioCVdABvJA0Jo+/Bw3i4dsBzk/ZJYRHJzOoZxn8tw5TdS
   ynZ6vZAioEwWj3W3yig78kLsMXAAcJ9qsRNm1VWO6AnaOf0dAQ1OWSzup
   A==;
X-CSE-ConnectionGUID: eV389TJwTGSDqTT+aBbaMA==
X-CSE-MsgGUID: 795AGFZ3QHG2lJVut9SmPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="38333530"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="38333530"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 20:52:04 -0800
X-CSE-ConnectionGUID: LDJTfN+6T6i+z90nZiwBvQ==
X-CSE-MsgGUID: ZGXoJcf1T92c56vfPWWetQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="97452990"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Dec 2024 20:52:02 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMgbn-000DRS-1H;
	Sun, 15 Dec 2024 04:51:59 +0000
Date: Sun, 15 Dec 2024 12:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2566/2566]
 drivers/net/ethernet/mucse/rnp/rnp_common.h:298:7: warning: variable
 'has_mac' set but not used
Message-ID: <202412151215.kRAdh5LL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6c3413fbf8c430b89f5d23f465e10e99ea145199
commit: e53494b741272933726616122ea77143d9742631 [2566/2566] drivers: initial support for rnp drivers from Mucse Technology
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241215/202412151215.kRAdh5LL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412151215.kRAdh5LL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412151215.kRAdh5LL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mucse/rnp/rnp_main.c:7:
   In file included from include/linux/pci.h:1499:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1579:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/mucse/rnp/rnp_main.c:34:
   In file included from drivers/net/ethernet/mucse/rnp/rnp_tc_u32_parse.h:6:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21:
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:298:7: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:298:16: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:299:6: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:299:16: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:174:6: warning: no previous prototype for function 'rnp_unmap_and_free_tx_resource' [-Wmissing-prototypes]
     174 | void rnp_unmap_and_free_tx_resource(struct rnp_ring *ring,
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:174:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     174 | void rnp_unmap_and_free_tx_resource(struct rnp_ring *ring,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:669:5: warning: no previous prototype for function 'rnp_rx_ring_reinit' [-Wmissing-prototypes]
     669 | int rnp_rx_ring_reinit(struct rnp_adapter *adapter,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:669:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     669 | int rnp_rx_ring_reinit(struct rnp_adapter *adapter,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:1777:7: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    1777 |         bool xdp_xmit = false;
         |              ^
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:2012:6: warning: no previous prototype for function 'rnp_write_eitr_rx' [-Wmissing-prototypes]
    2012 | void rnp_write_eitr_rx(struct rnp_q_vector *q_vector)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2012:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2012 | void rnp_write_eitr_rx(struct rnp_q_vector *q_vector)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:2818:6: warning: variable 'rxctrl' set but not used [-Wunused-but-set-variable]
    2818 |         u32 rxctrl = 0, dma_axi_ctl;
         |             ^
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:3152:6: warning: no previous prototype for function 'rnp_vlan_stags_flag' [-Wmissing-prototypes]
    3152 | void rnp_vlan_stags_flag(struct rnp_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3152:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3152 | void rnp_vlan_stags_flag(struct rnp_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:3558:5: warning: no previous prototype for function 'rnp_xmit_nop_frame_ring' [-Wmissing-prototypes]
    3558 | int rnp_xmit_nop_frame_ring(struct rnp_adapter *adapter,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3558:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3558 | int rnp_xmit_nop_frame_ring(struct rnp_adapter *adapter,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:4811:6: warning: no previous prototype for function 'rnp_service_timer' [-Wmissing-prototypes]
    4811 | void rnp_service_timer(struct timer_list *t)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4811:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4811 | void rnp_service_timer(struct timer_list *t)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:4919:6: warning: no previous prototype for function 'rnp_service_task' [-Wmissing-prototypes]
    4919 | void rnp_service_task(struct work_struct *work)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4919:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4919 | void rnp_service_task(struct work_struct *work)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:5941:5: warning: no previous prototype for function 'rnp_delete_knode' [-Wmissing-prototypes]
    5941 | int rnp_delete_knode(struct net_device *dev,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5941:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5941 | int rnp_delete_knode(struct net_device *dev,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6030:5: warning: no previous prototype for function 'rnp_config_knode' [-Wmissing-prototypes]
    6030 | int rnp_config_knode(struct net_device *dev, __be16 protocol,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6030:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6030 | int rnp_config_knode(struct net_device *dev, __be16 protocol,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6089:5: warning: no previous prototype for function 'rnp_setup_tc_cls_u32' [-Wmissing-prototypes]
    6089 | int rnp_setup_tc_cls_u32(struct net_device *dev,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6089:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6089 | int rnp_setup_tc_cls_u32(struct net_device *dev,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6166:6: warning: no previous prototype for function 'rnp_do_reset' [-Wmissing-prototypes]
    6166 | void rnp_do_reset(struct net_device *netdev)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6166 | void rnp_do_reset(struct net_device *netdev)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6387:6: warning: no previous prototype for function 'rnp_clear_udp_tunnel_port' [-Wmissing-prototypes]
    6387 | void rnp_clear_udp_tunnel_port(struct rnp_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6387:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6387 | void rnp_clear_udp_tunnel_port(struct rnp_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6507:6: warning: no previous prototype for function 'rnp_assign_netdev_ops' [-Wmissing-prototypes]
    6507 | void rnp_assign_netdev_ops(struct net_device *dev)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6507:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6507 | void rnp_assign_netdev_ops(struct net_device *dev)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6683:5: warning: no previous prototype for function 'rnp_can_rpu_start' [-Wmissing-prototypes]
    6683 | int rnp_can_rpu_start(struct rnp_adapter *adapter)
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6683:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6683 | int rnp_can_rpu_start(struct rnp_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6536:29: warning: unused function 'rnp_tso_features' [-Wunused-function]
    6536 | static inline unsigned long rnp_tso_features(struct rnp_hw *hw)
         |                             ^~~~~~~~~~~~~~~~
   26 warnings generated.
--
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:157: warning: Function parameter or member 'rnp_queue' not described in 'rnp_set_ring_vector'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:157: warning: Function parameter or member 'rnp_msix_vector' not described in 'rnp_set_ring_vector'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:157: warning: Excess function parameter 'queue' description in 'rnp_set_ring_vector'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:157: warning: Excess function parameter 'msix_vector' description in 'rnp_set_ring_vector'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:287: warning: Function parameter or member 'napi_budget' not described in 'rnp_clean_tx_irq'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:671: warning: Function parameter or member 'adapter' not described in 'rnp_rx_ring_reinit'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:1130: warning: Excess function parameter 'skb' description in 'rnp_is_non_eop'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:2563: warning: Function parameter or member 'adapter' not described in 'rnp_tx_maxrate_own'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:2563: warning: Excess function parameter 'netdev' description in 'rnp_tx_maxrate_own'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:2563: warning: Excess function parameter 'maxrate' description in 'rnp_tx_maxrate_own'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:3748: warning: Function parameter or member 'txqueue' not described in 'rnp_tx_timeout'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:3857: warning: Function parameter or member 'adapter' not described in 'rnp_setup_tx_resources'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:3950: warning: Function parameter or member 'adapter' not described in 'rnp_setup_rx_resources'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:4612: warning: Excess function parameter 'link_speed' description in 'rnp_watchdog_update_link'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:4812: warning: Function parameter or member 't' not described in 'rnp_service_timer'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:4812: warning: Excess function parameter 'data' description in 'rnp_service_timer'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:5872: warning: Function parameter or member 'dev' not described in 'rnp_setup_tc'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:5872: warning: Excess function parameter 'netdev' description in 'rnp_setup_tc'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6526: warning: Function parameter or member 'adapter' not described in 'rnp_wol_supported'
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6526: warning: Function parameter or member 'subdevice_id' not described in 'rnp_wol_supported'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6526: warning: Excess function parameter 'hw' description in 'rnp_wol_supported'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6526: warning: Excess function parameter 'subdev_id' description in 'rnp_wol_supported'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:7099: warning: Function parameter or member 'id' not described in 'rnp_probe'
   drivers/net/ethernet/mucse/rnp/rnp_main.c:7099: warning: Excess function parameter 'ent' description in 'rnp_probe'
--
   In file included from drivers/net/ethernet/mucse/rnp/rnp_common.c:4:
   In file included from include/linux/pci.h:1499:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1579:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/mucse/rnp/rnp_common.c:10:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21:
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:298:7: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:298:16: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:299:6: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:299:16: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^
   9 warnings generated.
--
   In file included from drivers/net/ethernet/mucse/rnp/rnp_lib.c:4:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:9:
   In file included from include/linux/pci.h:1499:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1579:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/mucse/rnp/rnp_lib.c:4:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21:
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:298:7: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:298:16: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:299:6: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^
>> drivers/net/ethernet/mucse/rnp/rnp_common.h:299:16: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^
>> drivers/net/ethernet/mucse/rnp/rnp_lib.c:439:5: warning: no previous prototype for function 'rnp_acquire_msix_vectors' [-Wmissing-prototypes]
     439 | int rnp_acquire_msix_vectors(struct rnp_adapter *adapter, int vectors)
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:439:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     439 | int rnp_acquire_msix_vectors(struct rnp_adapter *adapter, int vectors)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_lib.c:985:6: warning: no previous prototype for function 'rnp_print_ring_info' [-Wmissing-prototypes]
     985 | void rnp_print_ring_info(struct rnp_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:985:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     985 | void rnp_print_ring_info(struct rnp_adapter *adapter)
         | ^
         | static 
   11 warnings generated.
--
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:179: warning: Function parameter or member 'data' not described in 'rnp_reg_test'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:466: warning: Function parameter or member 'dev' not described in 'rnp_get_ts_info'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:466: warning: Excess function parameter 'netdev' description in 'rnp_get_ts_info'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:527: warning: Function parameter or member 'dev' not described in 'rnp_get_channels'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:527: warning: Excess function parameter 'netdev' description in 'rnp_get_channels'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:561: warning: Function parameter or member 'dev' not described in 'rnp_set_channels'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:561: warning: Excess function parameter 'netdev' description in 'rnp_set_channels'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:600: warning: Function parameter or member 'dev' not described in 'rnp_get_module_info'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:600: warning: Excess function parameter 'netdev' description in 'rnp_get_module_info'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:653: warning: Function parameter or member 'dev' not described in 'rnp_get_module_eeprom'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:653: warning: Excess function parameter 'netdev' description in 'rnp_get_module_eeprom'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:700: warning: Function parameter or member 'ker' not described in 'rnp_get_ringparam'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:700: warning: Function parameter or member 'extack' not described in 'rnp_get_ringparam'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:725: warning: Function parameter or member 'ker' not described in 'rnp_set_ringparam'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:725: warning: Function parameter or member 'extack' not described in 'rnp_set_ringparam'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:945: warning: Function parameter or member 'coal' not described in 'rnp_get_coalesce'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:945: warning: Function parameter or member 'kernel_coal' not described in 'rnp_get_coalesce'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:945: warning: Function parameter or member 'extack' not described in 'rnp_get_coalesce'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:945: warning: Excess function parameter 'cmd' description in 'rnp_get_coalesce'
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:945: warning: Excess function parameter 'ec' description in 'rnp_get_coalesce'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:987: warning: Function parameter or member 'kernel_coal' not described in 'rnp_set_coalesce'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:987: warning: Function parameter or member 'extack' not described in 'rnp_set_coalesce'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:987: warning: Excess function parameter 'cmd' description in 'rnp_set_coalesce'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1778: warning: Function parameter or member 'dev' not described in 'rnp_set_rxnfc'
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1778: warning: Excess function parameter 'netdev' description in 'rnp_set_rxnfc'
..


vim +/has_mac +298 drivers/net/ethernet/mucse/rnp/rnp_common.h

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
 > 298		bool has_mac, has_trans;
 > 299		int headroom, tailroom;
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
   336			    &dev->features);
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
