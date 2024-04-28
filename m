Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6BD33C8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 21:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714340578; cv=none; b=hxdKp4FuDLVRfHxZXjgqKg0ZyvggWqNdXElMr7wPVY1J6/OhHRJeHurctEqUFM+5V+lZ6kAoK3I4NeR70R61+4iolN/Y6HxRODElouhrxCYt1eBMBRJWRmJeAu2yPHCu8XqkQwd3WFIv74w4T902Wlc0SX/lulr0Q+rHQ+CpTqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714340578; c=relaxed/simple;
	bh=uaPCDs77+kHfdLIu41wEQEPMlURH8ZCJpdTN8aS9Rg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gH7igxIgNYhK3FG6q2vXoE7SKpfMA1HALnSqW+NImAlXXb+wCAbmRv2co+itA3LsGXUZalnhqrdt8lvYG/yUvNXjGfoLOLhA5q8HBq6DhWLpjFEi7aoezGp+EvGVZAIYwzF7AupyEU2z0giLnJ0fN5MPwOJLTIXZEd6lEyS/OY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgVXAMJt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgVXAMJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714340575; x=1745876575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uaPCDs77+kHfdLIu41wEQEPMlURH8ZCJpdTN8aS9Rg8=;
  b=BgVXAMJtWXaPTdz15tJEzahA4jSg14j/ioDFXwsjw1ZoJoKDmzFVc/J4
   S5WcmDHehxYTOAALTW5qH972uisSVrWtj5G+UELrdSm5PtFASATZzX5rT
   gJvklSNPFYbQpEckXxrJKkU5xwRZ3Cwvk66I7DkBRSxOvisEcEd6WpxWm
   GwwJTSTcS2EIK2eAIB37k9XNC1gKWlGWDGb8UeSwsJazAH7MLSF1AZKgb
   9JR4XfOHcMXtHIdVnsO+ar6YJPpwp6B/FOLCmYdciWp7cAEPosEyBT3XW
   fB8ayXortl/UVMj5J4jcvkazQFYqgFwwUIsJN91tnT5R7pScUTKomN81M
   Q==;
X-CSE-ConnectionGUID: YaO5/4JFS0m4bP10c86xDg==
X-CSE-MsgGUID: DGSUEiEeRE2qqYgPecWjFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21410785"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="21410785"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 14:42:54 -0700
X-CSE-ConnectionGUID: OQLGs7g0Tp+n9fFKWIyhsQ==
X-CSE-MsgGUID: NoYrhZfzRpm7g+yRsseAOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="25944742"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Apr 2024 14:42:53 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1CIM-0006lC-2G;
	Sun, 28 Apr 2024 21:42:50 +0000
Date: Mon, 29 Apr 2024 05:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiaohuihui-bzwx-kj <xiaohuihui@bzwx-kj.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7604/7619]
 drivers/net/ethernet/bzwx/nce/comm/txrx.c:555:6: warning: no previous
 prototype for function 'ne6x_alloc_rx_buffers'
Message-ID: <202404290504.ddwqObly-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f120c2ab14341c60bcc055c700c0a29dce5837ac
commit: 6da1ac3422090c928e2aa5ea5538884a316d3d4e [7604/7619] drivers: fix compiling problem in bzwx N5/N6 series NIC drivers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404290504.ddwqObly-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290504.ddwqObly-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290504.ddwqObly-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/bzwx/nce/comm/txrx.c:4:
   In file included from drivers/net/ethernet/bzwx/nce/comm/txrx.h:10:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:555:6: warning: no previous prototype for function 'ne6x_alloc_rx_buffers' [-Wmissing-prototypes]
     555 | bool ne6x_alloc_rx_buffers(struct ne6x_ring *rx_ring, u16 cleaned_count)
         |      ^
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:555:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     555 | bool ne6x_alloc_rx_buffers(struct ne6x_ring *rx_ring, u16 cleaned_count)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1122:6: warning: no previous prototype for function 'ne6x_unmap_and_free_tx_resource' [-Wmissing-prototypes]
    1122 | void ne6x_unmap_and_free_tx_resource(struct ne6x_ring *ring,
         |      ^
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1122:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1122 | void ne6x_unmap_and_free_tx_resource(struct ne6x_ring *ring,
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1147:5: warning: no previous prototype for function 'ne6x_fill_jumbo_sgl' [-Wmissing-prototypes]
    1147 | int ne6x_fill_jumbo_sgl(struct ne6x_ring *tx_ring, struct sk_buff *skb)
         |     ^
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1147:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1147 | int ne6x_fill_jumbo_sgl(struct ne6x_ring *tx_ring, struct sk_buff *skb)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1247:6: warning: no previous prototype for function 'ne6x_fill_tx_desc' [-Wmissing-prototypes]
    1247 | void ne6x_fill_tx_desc(struct ne6x_tx_desc *tx_desc, u8 vp, dma_addr_t tag_dma,
         |      ^
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1247:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1247 | void ne6x_fill_tx_desc(struct ne6x_tx_desc *tx_desc, u8 vp, dma_addr_t tag_dma,
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1266:6: warning: no previous prototype for function 'ne6x_fill_tx_priv_tag' [-Wmissing-prototypes]
    1266 | void ne6x_fill_tx_priv_tag(struct ne6x_ring *tx_ring, struct ne6x_tx_tag *tx_tag,
         |      ^
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1266:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1266 | void ne6x_fill_tx_priv_tag(struct ne6x_ring *tx_ring, struct ne6x_tx_tag *tx_tag,
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1281:6: warning: no previous prototype for function 'ne6x_xmit_jumbo' [-Wmissing-prototypes]
    1281 | void ne6x_xmit_jumbo(struct ne6x_ring *tx_ring, struct ne6x_tx_buf *first,
         |      ^
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1281:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1281 | void ne6x_xmit_jumbo(struct ne6x_ring *tx_ring, struct ne6x_tx_buf *first,
         | ^
         | static 
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1378:33: warning: variable 'first_desc' set but not used [-Wunused-but-set-variable]
    1378 |         struct ne6x_tx_desc *tx_desc, *first_desc;
         |                                        ^
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1387:9: warning: variable 'mss' set but not used [-Wunused-but-set-variable]
    1387 |         __le64 mss = 0;
         |                ^
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1373:6: warning: no previous prototype for function 'ne6x_xmit_simple' [-Wmissing-prototypes]
    1373 | void ne6x_xmit_simple(struct ne6x_ring *tx_ring, struct ne6x_tx_buf *first,
         |      ^
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1373:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1373 | void ne6x_xmit_simple(struct ne6x_ring *tx_ring, struct ne6x_tx_buf *first,
         | ^
         | static 
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:150:28: warning: unused function 'ne6x_txd_use_count' [-Wunused-function]
     150 | static inline unsigned int ne6x_txd_use_count(unsigned int size)
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:156:20: warning: unused function 'ne6x_chk_linearize' [-Wunused-function]
     156 | static inline bool ne6x_chk_linearize(struct sk_buff *skb, int count)
         |                    ^~~~~~~~~~~~~~~~~~
   16 warnings generated.
--
   In file included from drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:4:
   In file included from include/net/gre.h:5:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:68:5: warning: no previous prototype for function 'ne6x_hw_init' [-Wmissing-prototypes]
      68 | int ne6x_hw_init(struct ne6x_hw *hw)
         |     ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      68 | int ne6x_hw_init(struct ne6x_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:92:5: warning: no previous prototype for function 'ne6x_aq_get_phy_capabilities' [-Wmissing-prototypes]
      92 | int ne6x_aq_get_phy_capabilities(struct ne6x_adapter *adpt, bool is_up, bool get_hw_stats)
         |     ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:92:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      92 | int ne6x_aq_get_phy_capabilities(struct ne6x_adapter *adpt, bool is_up, bool get_hw_stats)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:144:5: warning: no previous prototype for function 'ne6x_aq_get_vf_link_status' [-Wmissing-prototypes]
     144 | int ne6x_aq_get_vf_link_status(struct ne6x_adapter *adpt, bool is_up)
         |     ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     144 | int ne6x_aq_get_vf_link_status(struct ne6x_adapter *adpt, bool is_up)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:216:6: warning: no previous prototype for function 'ne6x_print_link_message' [-Wmissing-prototypes]
     216 | void ne6x_print_link_message(struct ne6x_adapter *adpt, bool isup)
         |      ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:216:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     216 | void ne6x_print_link_message(struct ne6x_adapter *adpt, bool isup)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:497:5: warning: no previous prototype for function 'ne6x_pf_init' [-Wmissing-prototypes]
     497 | int ne6x_pf_init(struct ne6x_pf *pf)
         |     ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:497:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     497 | int ne6x_pf_init(struct ne6x_pf *pf)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:740:6: warning: no previous prototype for function 'ne6x_clean_tx_ring' [-Wmissing-prototypes]
     740 | void ne6x_clean_tx_ring(struct ne6x_ring *tx_ring)
         |      ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:740:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     740 | void ne6x_clean_tx_ring(struct ne6x_ring *tx_ring)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:770:6: warning: no previous prototype for function 'ne6x_clean_rx_ring' [-Wmissing-prototypes]
     770 | void ne6x_clean_rx_ring(struct ne6x_ring *rx_ring)
         |      ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:770:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     770 | void ne6x_clean_rx_ring(struct ne6x_ring *rx_ring)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:852:6: warning: no previous prototype for function 'ne6x_free_rx_resources' [-Wmissing-prototypes]
     852 | void ne6x_free_rx_resources(struct ne6x_ring *rx_ring)
         |      ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:852:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     852 | void ne6x_free_rx_resources(struct ne6x_ring *rx_ring)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:877:6: warning: no previous prototype for function 'ne6x_free_tx_resources' [-Wmissing-prototypes]
     877 | void ne6x_free_tx_resources(struct ne6x_ring *tx_ring)
         |      ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:877:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     877 | void ne6x_free_tx_resources(struct ne6x_ring *tx_ring)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:889:6: warning: no previous prototype for function 'ne6x_free_cq_resources' [-Wmissing-prototypes]
     889 | void ne6x_free_cq_resources(struct ne6x_ring *cq_ring)
         |      ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:889:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     889 | void ne6x_free_cq_resources(struct ne6x_ring *cq_ring)
         | ^
         | static 
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1243:28: warning: variable 'ons' set but not used [-Wunused-but-set-variable]
    1243 |         struct rtnl_link_stats64 *ons;
         |                                   ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1245:25: warning: variable 'oes' set but not used [-Wunused-but-set-variable]
    1245 |         struct ne6x_eth_stats *oes;
         |                                ^
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1254:6: warning: variable 'tx_linearize' set but not used [-Wunused-but-set-variable]
    1254 |         u64 tx_linearize;
         |             ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1255:6: warning: variable 'tx_force_wb' set but not used [-Wunused-but-set-variable]
    1255 |         u64 tx_force_wb;
         |             ^
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1852:5: warning: no previous prototype for function 'ne6x_link_speed_to_rate' [-Wmissing-prototypes]
    1852 | int ne6x_link_speed_to_rate(int link_speed)
         |     ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1852:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1852 | int ne6x_link_speed_to_rate(int link_speed)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2063:5: warning: no previous prototype for function 'ne6x_set_vf_port_vlan' [-Wmissing-prototypes]
    2063 | int ne6x_set_vf_port_vlan(struct net_device *netdev, int vf_id, u16 vlan_id,
         |     ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2063:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2063 | int ne6x_set_vf_port_vlan(struct net_device *netdev, int vf_id, u16 vlan_id,
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2703:6: warning: no previous prototype for function 'ne6x_adjust_adpt_port_max_queue' [-Wmissing-prototypes]
    2703 | void ne6x_adjust_adpt_port_max_queue(struct ne6x_pf *pf)
         |      ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2703:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2703 | void ne6x_adjust_adpt_port_max_queue(struct ne6x_pf *pf)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2924:5: warning: no previous prototype for function 'ne6x_adpt_release' [-Wmissing-prototypes]
    2924 | int ne6x_adpt_release(struct ne6x_adapter *adpt)
         |     ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2924:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2924 | int ne6x_adpt_release(struct ne6x_adapter *adpt)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:3082:12: warning: no previous prototype for function 'ne6x_init_module' [-Wmissing-prototypes]
    3082 | int __init ne6x_init_module(void)
         |            ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:3082:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3082 | int __init ne6x_init_module(void)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:3103:13: warning: no previous prototype for function 'ne6x_exit_module' [-Wmissing-prototypes]
    3103 | void __exit ne6x_exit_module(void)
         |             ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:3103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3103 | void __exit ne6x_exit_module(void)
         | ^
         | static 
   25 warnings generated.
--
   In file included from drivers/net/ethernet/bzwx/nce/ne6x/ne6x_procfs.c:6:
   In file included from drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h:10:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_procfs.c:66:9: warning: no previous prototype for function 'ne6x_proc_i2c_read' [-Wmissing-prototypes]
      66 | ssize_t ne6x_proc_i2c_read(struct file *filp, char __user *buf, size_t count, loff_t *ppos)
         |         ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_procfs.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      66 | ssize_t ne6x_proc_i2c_read(struct file *filp, char __user *buf, size_t count, loff_t *ppos)
         | ^
         | static 
   6 warnings generated.
--
   In file included from drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:4:
   In file included from drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h:10:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:258:5: warning: no previous prototype for function 'ne6x_adpt_request_irq_msix' [-Wmissing-prototypes]
     258 | int ne6x_adpt_request_irq_msix(struct ne6x_adapter *adpt, char *basename)
         |     ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     258 | int ne6x_adpt_request_irq_msix(struct ne6x_adapter *adpt, char *basename)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:340:5: warning: no previous prototype for function 'ne6x_adpt_request_irq_intx' [-Wmissing-prototypes]
     340 | int ne6x_adpt_request_irq_intx(struct ne6x_adapter *adpt, char *basename)
         |     ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:340:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     340 | int ne6x_adpt_request_irq_intx(struct ne6x_adapter *adpt, char *basename)
         | ^
         | static 
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:607:13: warning: no previous prototype for function 'ne6x_msix_clean_vf_mbx' [-Wmissing-prototypes]
     607 | irqreturn_t ne6x_msix_clean_vf_mbx(int irq, void *data)
         |             ^
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:607:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     607 | irqreturn_t ne6x_msix_clean_vf_mbx(int irq, void *data)
         | ^
         | static 
   8 warnings generated.
..


vim +/ne6x_alloc_rx_buffers +555 drivers/net/ethernet/bzwx/nce/comm/txrx.c

08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  554  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11 @555  bool ne6x_alloc_rx_buffers(struct ne6x_ring *rx_ring, u16 cleaned_count)
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  556  {
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  557  	u16 ntu = rx_ring->next_to_use;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  558  	union ne6x_rx_desc *rx_desc;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  559  	struct ne6x_rx_buf *bi;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  560  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  561  	/* do nothing if no valid netdev defined */
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  562  	if (!rx_ring->netdev || !cleaned_count)
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  563  		return false;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  564  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  565  	rx_desc = NE6X_RX_DESC(rx_ring, ntu);
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  566  	bi = &rx_ring->rx_buf[ntu];
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  567  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  568  	do {
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  569  		if (!ne6x_alloc_mapped_page(rx_ring, bi))
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  570  			goto no_buffers;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  571  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  572  		/* sync the buffer for use by the device */
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  573  		dma_sync_single_range_for_device(rx_ring->dev, bi->dma, bi->page_offset,
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  574  						 rx_ring->rx_buf_len, DMA_FROM_DEVICE);
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  575  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  576  		/* Refresh the desc even if buffer_addrs didn't change
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  577  		 * because each write-back erases this info.
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  578  		 */
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  579  		rx_desc->wb.u.val = 0;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  580  		rx_desc->w.buffer_mop_addr = cpu_to_le64(bi->dma + bi->page_offset);
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  581  		rx_desc->w.buffer_sop_addr = 0;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  582  		rx_desc->w.mop_mem_len = rx_ring->rx_buf_len;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  583  		rx_desc->wb.pkt_len = 0;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  584  		rx_desc->w.vp = rx_ring->reg_idx;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  585  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  586  		rx_desc++;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  587  		bi++;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  588  		ntu++;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  589  		if (unlikely(ntu == rx_ring->count)) {
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  590  			rx_desc = NE6X_RX_DESC(rx_ring, 0);
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  591  			bi = rx_ring->rx_buf;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  592  			ntu = 0;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  593  		}
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  594  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  595  		/* clear the status bits for the next_to_use descriptor */
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  596  		rx_desc->wb.u.val = 0;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  597  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  598  		cleaned_count--;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  599  	} while (cleaned_count);
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  600  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  601  	if (rx_ring->next_to_use != ntu)
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  602  		ne6x_release_rx_desc(rx_ring, ntu);
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  603  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  604  	return false;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  605  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  606  no_buffers:
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  607  	if (rx_ring->next_to_use != ntu)
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  608  		ne6x_release_rx_desc(rx_ring, ntu);
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  609  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  610  	/* make sure to come back via polling to try again after
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  611  	 * allocation failure
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  612  	 */
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  613  	return true;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  614  }
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  615  

:::::: The code at line 555 was first introduced by commit
:::::: 08f4280700700faaa2393cbf9a402d4f51d3a8a8 drivers: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver

:::::: TO: xiaohuihui-bzwx-kj <xiaohuihui@bzwx-kj.com>
:::::: CC: xiaohuihui-bzwx-kj <xiaohuihui@bzwx-kj.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
