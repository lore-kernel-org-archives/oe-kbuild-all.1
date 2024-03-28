Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A832E45940
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 22:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711666289; cv=none; b=QvqeCOu0AXzK1vCrEWwJ2qMhZ+9OyM4RtLs5ttvGHVV4SknpWH3455zZ0HFZKabtFIhGtt5szvOvQSP9aoxfxE+7yh30S2oJ+y5rwDqWwrv7MXIqEDWArr0FHZbv9SGttSS3bGT9YStZE7SPGGLtYDSP8Dmce7hfgXTgYvySbFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711666289; c=relaxed/simple;
	bh=vUgBIYcQ0qnH5ts8g5ZQddZYaxq+O8iUID7s/7XkAKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nR8oNb8W3hfVzCMYGUrmFtq0bpL0e+YZLO/Zsjg+yUZ3VuldYZLtvRrgRqHTh4EilA/pqhcLQJ9p0rm4nWh5RE4lZOCTWM474H23KJHLE0qOvV+fNP1b06wuVHgCH6PBvlz7ooYj/cDXuOZWpCPSLylUA7ejNLXOcJCnk6TcE1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQJIuOaU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQJIuOaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711666287; x=1743202287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vUgBIYcQ0qnH5ts8g5ZQddZYaxq+O8iUID7s/7XkAKo=;
  b=FQJIuOaUSd+HWS1uKEy8HPcW98Ud3o+AiDod2GXZau1gGCf+ITGr9N+f
   X2eAGO77XlAxTxNcaDedYpwSSBkxy7C3NhSiLFOkc92kX8xrSbNEUW1Kv
   SEX2rwahM6mf/D2RC90NQzcD6Q3NcmkWKWSSMv+z8PIUJ7zSEZlZ4kRqh
   oTjkTV8NmvB/FZKxK8gxgZBzf1HINXzzarlt2zUfq7vnk99Mplf93RE95
   8sH+Dw+rTEzhUJEGs+fogy7a/U9nTOvkNkhXqwEnGBpMKamCm1KOV7YEU
   no5CD+X5Up94XYC06+fSQFndCRVopBsqlwdVZ5IoolpsImSS9Yw6AKv62
   g==;
X-CSE-ConnectionGUID: IqnUgigZT4aXCSHGMe59Jw==
X-CSE-MsgGUID: 3W7fGiCbRVugRmuWJpT5DQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7449832"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="7449832"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 15:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16762148"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Mar 2024 15:51:24 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpyaf-0002aA-2b;
	Thu, 28 Mar 2024 22:51:21 +0000
Date: Fri, 29 Mar 2024 06:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6859/7000]
 drivers/net/ethernet/mucse/rnpvf/vf.c:256:6: warning: variable
 'number_of_queues' set but not used
Message-ID: <202403290654.z6VnxcxA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   704605877ce9913071214d2515a4c2b9077f5078
commit: 6adab536d69347a10c2366aaf6b86de963d5994b [6859/7000] drivers: initial support for rnpvf drivers from Mucse Technology
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240329/202403290654.z6VnxcxA-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 79ba323bdd0843275019e16b6e9b35133677c514)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290654.z6VnxcxA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290654.z6VnxcxA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mucse/rnpvf/vf.c:4:
   In file included from drivers/net/ethernet/mucse/rnpvf/vf.h:7:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
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
>> drivers/net/ethernet/mucse/rnpvf/vf.c:256:6: warning: variable 'number_of_queues' set but not used [-Wunused-but-set-variable]
     256 |         u32 number_of_queues;
         |             ^
>> drivers/net/ethernet/mucse/rnpvf/vf.c:486:5: warning: no previous prototype for function 'rnpvf_addr_list_itr' [-Wmissing-prototypes]
     486 | u8 *rnpvf_addr_list_itr(struct rnpvf_hw __maybe_unused *hw,
         |     ^
   drivers/net/ethernet/mucse/rnpvf/vf.c:486:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     486 | u8 *rnpvf_addr_list_itr(struct rnpvf_hw __maybe_unused *hw,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/vf.c:685:5: warning: no previous prototype for function 'rnpvf_negotiate_api_version' [-Wmissing-prototypes]
     685 | int rnpvf_negotiate_api_version(struct rnpvf_hw *hw, int api)
         |     ^
   drivers/net/ethernet/mucse/rnpvf/vf.c:685:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     685 | int rnpvf_negotiate_api_version(struct rnpvf_hw *hw, int api)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/vf.c:690:5: warning: no previous prototype for function 'rnpvf_get_queues' [-Wmissing-prototypes]
     690 | int rnpvf_get_queues(struct rnpvf_hw *hw, unsigned int *num_tcs,
         |     ^
   drivers/net/ethernet/mucse/rnpvf/vf.c:690:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     690 | int rnpvf_get_queues(struct rnpvf_hw *hw, unsigned int *num_tcs,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/vf.c:696:6: warning: no previous prototype for function 'rnpvf_set_veb_mac_n10' [-Wmissing-prototypes]
     696 | void rnpvf_set_veb_mac_n10(struct rnpvf_hw *hw, u8 *mac, u32 vfnum,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/vf.c:696:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     696 | void rnpvf_set_veb_mac_n10(struct rnpvf_hw *hw, u8 *mac, u32 vfnum,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/vf.c:718:6: warning: no previous prototype for function 'rnpvf_set_vlan_n10' [-Wmissing-prototypes]
     718 | void rnpvf_set_vlan_n10(struct rnpvf_hw *hw, u16 vid, u32 vf_num)
         |      ^
   drivers/net/ethernet/mucse/rnpvf/vf.c:718:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     718 | void rnpvf_set_vlan_n10(struct rnpvf_hw *hw, u16 vid, u32 vf_num)
         | ^
         | static 
   11 warnings generated.
--
   In file included from drivers/net/ethernet/mucse/rnpvf/ethtool.c:7:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
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
>> drivers/net/ethernet/mucse/rnpvf/ethtool.c:131:17: warning: variable 'advertising' set but not used [-Wunused-but-set-variable]
     131 |         u32 supported, advertising;
         |                        ^
>> drivers/net/ethernet/mucse/rnpvf/ethtool.c:142:3: warning: variable 'advertising' is uninitialized when used here [-Wuninitialized]
     142 |                 advertising |= ADVERTISED_FIBRE |
         |                 ^~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/ethtool.c:131:28: note: initialize the variable 'advertising' to silence this warning
     131 |         u32 supported, advertising;
         |                                   ^
         |                                    = 0
>> drivers/net/ethernet/mucse/rnpvf/ethtool.c:249:6: warning: no previous prototype for function 'rnpvf_get_ringparam' [-Wmissing-prototypes]
     249 | void rnpvf_get_ringparam(struct net_device *netdev,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/ethtool.c:249:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     249 | void rnpvf_get_ringparam(struct net_device *netdev,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/ethtool.c:269:6: warning: variable 'queue_idx' set but not used [-Wunused-but-set-variable]
     269 |         u16 queue_idx;
         |             ^
>> drivers/net/ethernet/mucse/rnpvf/ethtool.c:103:19: warning: unused variable 'rnp_gstrings_test' [-Wunused-const-variable]
     103 | static const char rnp_gstrings_test[][ETH_GSTRING_LEN] = {
         |                   ^~~~~~~~~~~~~~~~~
   10 warnings generated.
--
   In file included from drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:7:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
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
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:127:6: warning: no previous prototype for function 'rnpvf_unmap_and_free_tx_resource' [-Wmissing-prototypes]
     127 | void rnpvf_unmap_and_free_tx_resource(struct rnpvf_ring *ring,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:127:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     127 | void rnpvf_unmap_and_free_tx_resource(struct rnpvf_ring *ring,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1365:6: warning: no previous prototype for function 'rnpvf_alloc_rx_buffers' [-Wmissing-prototypes]
    1365 | void rnpvf_alloc_rx_buffers(struct rnpvf_ring *rx_ring, u16 cleaned_count)
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1365:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1365 | void rnpvf_alloc_rx_buffers(struct rnpvf_ring *rx_ring, u16 cleaned_count)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1659:7: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    1659 |         bool xdp_xmit = false;
         |              ^
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1945:6: warning: no previous prototype for function 'update_rx_count' [-Wmissing-prototypes]
    1945 | void update_rx_count(int cleaned, struct rnpvf_q_vector *q_vector)
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1945:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1945 | void update_rx_count(int cleaned, struct rnpvf_q_vector *q_vector)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2420:6: warning: no previous prototype for function 'rnpvf_write_eitr_rx' [-Wmissing-prototypes]
    2420 | void rnpvf_write_eitr_rx(struct rnpvf_q_vector *q_vector)
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2420:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2420 | void rnpvf_write_eitr_rx(struct rnpvf_q_vector *q_vector)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2523:6: warning: no previous prototype for function 'rnpvf_configure_tx_ring' [-Wmissing-prototypes]
    2523 | void rnpvf_configure_tx_ring(struct rnpvf_adapter *adapter,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2523:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2523 | void rnpvf_configure_tx_ring(struct rnpvf_adapter *adapter,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2589:6: warning: no previous prototype for function 'rnpvf_disable_rx_queue' [-Wmissing-prototypes]
    2589 | void rnpvf_disable_rx_queue(struct rnpvf_adapter *adapter,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2589:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2589 | void rnpvf_disable_rx_queue(struct rnpvf_adapter *adapter,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2595:6: warning: no previous prototype for function 'rnpvf_enable_rx_queue' [-Wmissing-prototypes]
    2595 | void rnpvf_enable_rx_queue(struct rnpvf_adapter *adapter,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2595:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2595 | void rnpvf_enable_rx_queue(struct rnpvf_adapter *adapter,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2601:6: warning: no previous prototype for function 'rnpvf_configure_rx_ring' [-Wmissing-prototypes]
    2601 | void rnpvf_configure_rx_ring(struct rnpvf_adapter *adapter,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2601:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2601 | void rnpvf_configure_rx_ring(struct rnpvf_adapter *adapter,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2736:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    2736 |         int err = -EOPNOTSUPP;
         |             ^
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3307:6: warning: variable 'vector_threshold' set but not used [-Wunused-but-set-variable]
    3307 |         int vector_threshold;
         |             ^
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3456:19: warning: variable 'hw' set but not used [-Wunused-but-set-variable]
    3456 |         struct rnpvf_hw *hw;
         |                          ^
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4590:6: warning: no previous prototype for function 'rnpvf_tx_ctxtdesc' [-Wmissing-prototypes]
    4590 | void rnpvf_tx_ctxtdesc(struct rnpvf_ring *tx_ring, u16 mss_seg_len,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4590:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4590 | void rnpvf_tx_ctxtdesc(struct rnpvf_ring *tx_ring, u16 mss_seg_len,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5039:6: warning: no previous prototype for function 'rnpvf_maybe_tx_ctxtdesc' [-Wmissing-prototypes]
    5039 | void rnpvf_maybe_tx_ctxtdesc(struct rnpvf_ring *tx_ring,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5039:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5039 | void rnpvf_maybe_tx_ctxtdesc(struct rnpvf_ring *tx_ring,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5089:13: warning: no previous prototype for function 'rnpvf_xmit_frame_ring' [-Wmissing-prototypes]
    5089 | netdev_tx_t rnpvf_xmit_frame_ring(struct sk_buff *skb,
         |             ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5089:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5089 | netdev_tx_t rnpvf_xmit_frame_ring(struct sk_buff *skb,
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5484:6: warning: variable 'ring_csum_err' set but not used [-Wunused-but-set-variable]
    5484 |         u64 ring_csum_err = 0;
         |             ^
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5485:6: warning: variable 'ring_csum_good' set but not used [-Wunused-but-set-variable]
    5485 |         u64 ring_csum_good = 0;
         |             ^
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5580:6: warning: no previous prototype for function 'rnpvf_assign_netdev_ops' [-Wmissing-prototypes]
    5580 | void rnpvf_assign_netdev_ops(struct net_device *dev)
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5580:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5580 | void rnpvf_assign_netdev_ops(struct net_device *dev)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5619:29: warning: unused function 'rnpvf_tso_features' [-Wunused-function]
    5619 | static inline unsigned long rnpvf_tso_features(struct rnpvf_hw *hw)
         |                             ^~~~~~~~~~~~~~~~~~
   24 warnings generated.
--
>> drivers/net/ethernet/mucse/rnpvf/vf.c:374: warning: Excess function parameter 'mac_addr' description in 'rnpvf_get_queues_vf'
--
>> drivers/net/ethernet/mucse/rnpvf/mbx.c:20: warning: Function parameter or member 'to_cm3' not described in 'rnpvf_read_posted_mbx'
>> drivers/net/ethernet/mucse/rnpvf/mbx.c:47: warning: Function parameter or member 'to_cm3' not described in 'rnpvf_write_posted_mbx'
>> drivers/net/ethernet/mucse/rnpvf/mbx.c:130: warning: Function parameter or member 'to_cm3' not described in 'rnpvf_check_for_msg_vf'
>> drivers/net/ethernet/mucse/rnpvf/mbx.c:159: warning: Function parameter or member 'to_cm3' not described in 'rnpvf_poll_for_msg'
>> drivers/net/ethernet/mucse/rnpvf/mbx.c:178: warning: Function parameter or member 'to_cm3' not described in 'rnpvf_poll_for_ack'
>> drivers/net/ethernet/mucse/rnpvf/mbx.c:201: warning: Function parameter or member 'to_cm3' not described in 'rnpvf_check_for_rst_msg_vf'
>> drivers/net/ethernet/mucse/rnpvf/mbx.c:351: warning: Function parameter or member 'to_cm3' not described in 'rnpvf_check_for_ack_vf'
>> drivers/net/ethernet/mucse/rnpvf/mbx.c:380: warning: Function parameter or member 'to_cm3' not described in 'rnpvf_obtain_mbx_lock_vf'
>> drivers/net/ethernet/mucse/rnpvf/mbx.c:411: warning: Function parameter or member 'to_cm3' not described in 'rnpvf_write_mbx_vf'
>> drivers/net/ethernet/mucse/rnpvf/mbx.c:464: warning: Function parameter or member 'to_cm3' not described in 'rnpvf_read_mbx_vf'
--
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:112: warning: Function parameter or member 'rnpvf_queue' not described in 'rnpvf_set_ring_vector'
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:112: warning: Function parameter or member 'rnpvf_msix_vector' not described in 'rnpvf_set_ring_vector'
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:112: warning: expecting prototype for rnpvf_set_ivar(). Prototype was for rnpvf_set_ring_vector() instead
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:469: warning: expecting prototype for rnp_clean_rx_ring(). Prototype was for rnpvf_clean_rx_ring() instead
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:807: warning: Excess function parameter 'rx_ring' description in 'rnpvf_pull_tail'
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1030: warning: Excess function parameter 'skb' description in 'rnpvf_is_non_eop'
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1226: warning: expecting prototype for rnp_clean_rx_irq(). Prototype was for rnpvf_clean_rx_irq() instead
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1653: warning: expecting prototype for rnp_clean_rx_irq(). Prototype was for rnpvf_clean_rx_irq() instead
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2203: warning: Function parameter or member 'type' not described in 'rnpvf_update_itr'
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2421: warning: expecting prototype for rnpvf_write_eitr(). Prototype was for rnpvf_write_eitr_rx() instead
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3922: warning: Function parameter or member 't' not described in 'rnpvf_watchdog'
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3922: warning: Excess function parameter 'data' description in 'rnpvf_watchdog'


vim +/number_of_queues +256 drivers/net/ethernet/mucse/rnpvf/vf.c

   244	
   245	/**
   246	 *  rnpvf_stop_hw_vf - Generic stop Tx/Rx units
   247	 *  @hw: pointer to hardware structure
   248	 *
   249	 *  Sets the adapter_stopped flag within rnpvf_hw struct. Clears interrupts,
   250	 *  disables transmit and receive units. The adapter_stopped flag is used by
   251	 *  the shared code and drivers to determine if the adapter is in a stopped
   252	 *  state and should not touch the hardware.
   253	 **/
   254	static s32 rnpvf_stop_hw_vf(struct rnpvf_hw *hw)
   255	{
 > 256		u32 number_of_queues;
   257		u16 i;
   258		struct rnpvf_adapter *adapter = hw->back;
   259		struct rnpvf_ring *ring;
   260	
   261		/* Set the adapter_stopped flag so other driver functions stop touching
   262		 * the hardware
   263		 */
   264		hw->adapter_stopped = true;
   265	
   266		/* Disable the receive unit by stopped each queue */
   267		for (i = 0; i < adapter->num_rx_queues; i++) {
   268			ring = adapter->rx_ring[i];
   269			ring_wr32(ring, RNP_DMA_RX_START, 0);
   270		}
   271	
   272		/* Disable the transmit unit.  Each queue must be disabled. */
   273		number_of_queues = hw->mac.max_tx_queues;
   274	
   275		return 0;
   276	}
   277	
   278	/**
   279	 *  rnpvf_mta_vector - Determines bit-vector in multicast table to set
   280	 *  @hw: pointer to hardware structure
   281	 *  @mc_addr: the multicast address
   282	 *
   283	 *  Extracts the 12 bits, from a multicast address, to determine which
   284	 *  bit-vector to set in the multicast table. The hardware uses 12 bits, from
   285	 *  incoming rx multicast addresses, to determine the bit-vector to check in
   286	 *  the MTA. Which of the 4 combination, of 12-bits, the hardware uses is set
   287	 *  by the MO field of the MCSTCTRL. The MO field is set during initialization
   288	 *  to mc_filter_type.
   289	 **/
   290	static s32 rnpvf_mta_vector(struct rnpvf_hw *hw, u8 *mc_addr)
   291	{
   292		u32 vector = 0;
   293	
   294		switch (hw->mac.mc_filter_type) {
   295		case 0: /* use bits [47:36] of the address */
   296			vector = ((mc_addr[4] << 8) | (((u16)mc_addr[5])));
   297			break;
   298		case 1: /* use bits [46:35] of the address */
   299			vector = ((mc_addr[4] << 7) | (((u16)mc_addr[5]) >> 1));
   300			break;
   301		case 2: /* use bits [45:34] of the address */
   302			vector = ((mc_addr[4] << 6) | (((u16)mc_addr[5]) >> 2));
   303			break;
   304		case 3: /* use bits [43:32] of the address */
   305			vector = ((mc_addr[4]) << 4 | (((u16)mc_addr[5]) >> 4));
   306			break;
   307		case 4: /* use bits [32:43] of the address */
   308			vector = ((mc_addr[0] << 8) | (((u16)mc_addr[1])));
   309			vector = (vector >> 4);
   310			break;
   311		case 5: /* use bits [32:43] of the address */
   312			vector = ((mc_addr[0] << 8) | (((u16)mc_addr[1])));
   313			vector = (vector >> 3);
   314			break;
   315		case 6: /* use bits [32:43] of the address */
   316			vector = ((mc_addr[0] << 8) | (((u16)mc_addr[1])));
   317			vector = (vector >> 2);
   318			break;
   319		case 7: /* use bits [32:43] of the address */
   320			vector = ((mc_addr[0] << 8) | (((u16)mc_addr[1])));
   321			break;
   322		default: /* Invalid mc_filter_type */
   323			break;
   324		}
   325	
   326		/* vector can only be 12-bits or boundary will be exceeded */
   327		vector &= 0xFFF;
   328		return vector;
   329	}
   330	
   331	/**
   332	 *  rnpvf_get_mac_addr_vf - Read device MAC address
   333	 *  @hw: pointer to the HW structure
   334	 *  @mac_addr: pointer to storage for retrieved MAC address
   335	 **/
   336	static s32 rnpvf_get_mac_addr_vf(struct rnpvf_hw *hw, u8 *mac_addr)
   337	{
   338		// memcpy(mac_addr, hw->mac.perm_addr, ETH_ALEN);
   339		struct rnp_mbx_info *mbx = &hw->mbx;
   340		u32 msgbuf[3];
   341		u8 *msg_addr = (u8 *)(&msgbuf[1]);
   342		s32 ret_val = 0;
   343	
   344		memset(msgbuf, 0, sizeof(msgbuf));
   345		/* If index is one then this is the start of a new list and needs
   346		 * indication to the PF so it can do it's own list management.
   347		 * If it is zero then that tells the PF to just clear all of
   348		 * this VF's macvlans and there is no new list.
   349		 */
   350		msgbuf[0] |= RNP_VF_SET_MACVLAN;
   351		ret_val = mbx->ops.write_posted(hw, msgbuf, 1, false);
   352	
   353		if (!ret_val)
   354			ret_val = mbx->ops.read_posted(hw, msgbuf, 3, false);
   355	
   356		msgbuf[0] &= ~RNP_VT_MSGTYPE_CTS;
   357	
   358		if (!ret_val)
   359			if (msgbuf[0] ==
   360			    (RNP_VF_GET_MACVLAN | RNP_VT_MSGTYPE_NACK))
   361				ret_val = -ENOMEM;
   362	
   363		memcpy(mac_addr, msg_addr, 6);
   364	
   365		return 0;
   366	}
   367	
   368	/**
   369	 *  rnpvf_get_queues_vf - Read device MAC address
   370	 *  @hw: pointer to the HW structure
   371	 *  @mac_addr: pointer to storage for retrieved MAC address
   372	 **/
   373	static s32 rnpvf_get_queues_vf(struct rnpvf_hw *hw)
 > 374	{
   375		struct rnp_mbx_info *mbx = &hw->mbx;
   376		s32 ret_val = 0;
   377		u32 msgbuf[7];
   378	
   379		memset(msgbuf, 0, sizeof(msgbuf));
   380		msgbuf[0] |= RNP_VF_GET_QUEUE;
   381	
   382		ret_val = mbx->ops.write_posted(hw, msgbuf, 1, false);
   383	
   384		mdelay(10);
   385	
   386		if (!ret_val)
   387			ret_val = mbx->ops.read_posted(hw, msgbuf, 7, false);
   388	
   389		msgbuf[0] &= ~RNP_VT_MSGTYPE_CTS;
   390	
   391		if (!ret_val)
   392			if (msgbuf[0] == (RNP_VF_GET_QUEUE | RNP_VT_MSGTYPE_NACK))
   393				ret_val = -ENOMEM;
   394	#define MSG_TX_NUM_WORD 1
   395	#define MSG_RX_NUM_WORD 2
   396	#define MSG_RING_BASE_WORD 5
   397	#define MSG_RING_DEPTH 6
   398	
   399		hw->queue_ring_base = msgbuf[MSG_RING_BASE_WORD];
   400		hw->mac.max_tx_queues = msgbuf[MSG_TX_NUM_WORD];
   401		hw->mac.max_rx_queues = msgbuf[MSG_RX_NUM_WORD];
   402		hw->tx_items_count = 0xffff & (msgbuf[MSG_RING_DEPTH] >> 16);
   403		hw->rx_items_count = 0xffff & (msgbuf[MSG_RING_DEPTH] >> 0);
   404	
   405		return 0;
   406	}
   407	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
