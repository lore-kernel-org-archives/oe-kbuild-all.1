Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ADAFBF0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 04:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766292841; cv=none; b=ES7UCcWtmiy1G8Nnvu7/CflMMiAn0Gmt7poAR+jAQL0Fimxq65uoGmCV1taPFitFdcqb3SVKYV91BNJFACLj5PhT+5ejd5HCsZumN/qbrMypIPNFQV0nnirMLmKkDFSSqMy3VrU4K/8xFgb5LP8Bwh0R4PMd6FWzKfLyBwcCui0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766292841; c=relaxed/simple;
	bh=sPBrgpNeEkGcP4DXJQPCLo6ZkoEDzx5PflAVwOAaojc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CIIHfGQHO2X8wlRGkS0E1T3SgTFpBzm3PDMcYxrLTm9UUcvx3Wx+k9IYvWFD1IadfTlfp3IRW2zV9kKD4OXHDIBAjEa8E8LUGBId2xHdbnaWq3B0aVZrZ/X/3L8yemzsM3cqG//c91fF8gZi6nA4cnIbQVbiX1c96IIj1wP4BZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+aFQb+g; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+aFQb+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766292838; x=1797828838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sPBrgpNeEkGcP4DXJQPCLo6ZkoEDzx5PflAVwOAaojc=;
  b=R+aFQb+gmy+jSM/8OI8cd2wKsCz6iyf9r/wmOErofcBGaAMwnaMIvIrR
   aHEsRSNNajJAzyNEyZtquGa2T3gNJc1h1cHN3N9dOL1t161tC81tMG1P9
   h6DmgzYoK1K7tpTxNzkTdjnTOnJN9HDh+T6Fg8qb0r97PI+EbuOEgul2Y
   JS6XI3ti8wYjus4Zf2bojyqL5AHL0waTHNuS/PHlAy5RqSstayg+oJyMt
   KP2MUFijXL9upi/keS3WjyPzkBSEONgbNga3SHb8iBobQhSsTsQnxHKDV
   ewTJREDBaVV6FKyXScxEXbYtiwlsaJd6hJVQ++t8AsFjAtAsR43FGXUFz
   A==;
X-CSE-ConnectionGUID: Hz7J9Y6LSI6Rf8WwhRxLxw==
X-CSE-MsgGUID: dHdueVv7R5yctrb2oIMqRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68073052"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68073052"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 20:53:58 -0800
X-CSE-ConnectionGUID: jGjbMA5MQVO2dVVs85O3sQ==
X-CSE-MsgGUID: awfoUqn7S7ekz+MeJvzwIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199519658"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 20:53:56 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXBS6-000000005KL-1FHN;
	Sun, 21 Dec 2025 04:53:54 +0000
Date: Sun, 21 Dec 2025 12:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1/1]
 drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:883:6: error: no
 previous prototype for function 'sss_nic_port_module_cable_plug'
Message-ID: <202512211239.WIsno7Ky-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 6864d14bb90f03a1e5b7fbcc04fc2ba4d692bd3e [1/1] support 3SNIC 910/920/930 NIC
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251221/202512211239.WIsno7Ky-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211239.WIsno7Ky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211239.WIsno7Ky-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:6:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:883:6: error: no previous prototype for function 'sss_nic_port_module_cable_plug' [-Werror,-Wmissing-prototypes]
     883 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:883:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     883 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:889:6: error: no previous prototype for function 'sss_nic_port_module_cable_unplug' [-Werror,-Wmissing-prototypes]
     889 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:889:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     889 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:895:6: error: no previous prototype for function 'sss_nic_port_module_link_err' [-Werror,-Wmissing-prototypes]
     895 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:895:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     895 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1034:22: error: no previous prototype for function 'get_nic_uld_info' [-Werror,-Wmissing-prototypes]
    1034 | struct sss_uld_info *get_nic_uld_info(void)
         |                      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1034:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1034 | struct sss_uld_info *get_nic_uld_info(void)
         | ^
         | static 
   9 errors generated.
--
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:6:
   In file included from include/net/xfrm.h:9:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:42:5: error: no previous prototype for function 'sss_nic_alloc_sq_resource' [-Werror,-Wmissing-prototypes]
      42 | int sss_nic_alloc_sq_resource(struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | int sss_nic_alloc_sq_resource(struct sss_nic_dev *nic_dev,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:87:6: error: no previous prototype for function 'sss_nic_free_sq_resource' [-Werror,-Wmissing-prototypes]
      87 | void sss_nic_free_sq_resource(struct sss_nic_dev *nic_dev,
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:87:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      87 | void sss_nic_free_sq_resource(struct sss_nic_dev *nic_dev,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:104:6: error: no previous prototype for function 'sss_nic_init_all_sq' [-Werror,-Wmissing-prototypes]
     104 | void sss_nic_init_all_sq(struct sss_nic_dev *nic_dev,
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     104 | void sss_nic_init_all_sq(struct sss_nic_dev *nic_dev,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:128:5: error: no previous prototype for function 'sss_nic_alloc_sq_desc_group' [-Werror,-Wmissing-prototypes]
     128 | int sss_nic_alloc_sq_desc_group(struct sss_nic_dev *nic_dev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:128:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     128 | int sss_nic_alloc_sq_desc_group(struct sss_nic_dev *nic_dev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:153:6: error: no previous prototype for function 'sss_nic_free_sq_desc_group' [-Werror,-Wmissing-prototypes]
     153 | void sss_nic_free_sq_desc_group(struct sss_nic_dev *nic_dev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:153:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     153 | void sss_nic_free_sq_desc_group(struct sss_nic_dev *nic_dev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:200:6: error: no previous prototype for function 'sss_nic_flush_all_sq' [-Werror,-Wmissing-prototypes]
     200 | void sss_nic_flush_all_sq(struct sss_nic_dev *nic_dev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:200:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     200 | void sss_nic_flush_all_sq(struct sss_nic_dev *nic_dev)
         | ^
         | static 
   11 errors generated.
--
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:8:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:80:5: error: no previous prototype for function 'sss_nic_alloc_rq_res_group' [-Werror,-Wmissing-prototypes]
      80 | int sss_nic_alloc_rq_res_group(struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      80 | int sss_nic_alloc_rq_res_group(struct sss_nic_dev *nic_dev,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:136:6: error: no previous prototype for function 'sss_nic_free_rq_res_group' [-Werror,-Wmissing-prototypes]
     136 | void sss_nic_free_rq_res_group(struct sss_nic_dev *nic_dev,
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:136:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     136 | void sss_nic_free_rq_res_group(struct sss_nic_dev *nic_dev,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:208:5: error: no previous prototype for function 'sss_nic_init_rq_desc_group' [-Werror,-Wmissing-prototypes]
     208 | int sss_nic_init_rq_desc_group(struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:208:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     208 | int sss_nic_init_rq_desc_group(struct sss_nic_dev *nic_dev,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:235:6: error: no previous prototype for function 'sss_nic_free_rq_desc_group' [-Werror,-Wmissing-prototypes]
     235 | void sss_nic_free_rq_desc_group(struct sss_nic_dev *nic_dev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     235 | void sss_nic_free_rq_desc_group(struct sss_nic_dev *nic_dev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:241:5: error: no previous prototype for function 'sss_nic_alloc_rq_desc_group' [-Werror,-Wmissing-prototypes]
     241 | int sss_nic_alloc_rq_desc_group(struct sss_nic_dev *nic_dev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:241:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     241 | int sss_nic_alloc_rq_desc_group(struct sss_nic_dev *nic_dev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:267:5: error: no previous prototype for function 'sss_nic_update_rx_rss' [-Werror,-Wmissing-prototypes]
     267 | int sss_nic_update_rx_rss(struct sss_nic_dev *nic_dev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:267:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     267 | int sss_nic_update_rx_rss(struct sss_nic_dev *nic_dev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:282:6: error: no previous prototype for function 'sss_nic_reset_rx_rss' [-Werror,-Wmissing-prototypes]
     282 | void sss_nic_reset_rx_rss(struct net_device *netdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:282:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     282 | void sss_nic_reset_rx_rss(struct net_device *netdev)
         | ^
         | static 
   12 errors generated.
--
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c:8:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c:179:6: error: no previous prototype for function 'sss_nic_rq_watchdog_handler' [-Werror,-Wmissing-prototypes]
     179 | void sss_nic_rq_watchdog_handler(struct work_struct *work)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c:179:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     179 | void sss_nic_rq_watchdog_handler(struct work_struct *work)
         | ^
         | static 
   6 errors generated.
--
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:7:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:350:6: error: no previous prototype for function 'sss_nic_flush_tcam_list' [-Werror,-Wmissing-prototypes]
     350 | void sss_nic_flush_tcam_list(struct sss_nic_tcam_info *tcam_info)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:350:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     350 | void sss_nic_flush_tcam_list(struct sss_nic_tcam_info *tcam_info)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:366:6: error: no previous prototype for function 'sss_nic_flush_tcam_node_list' [-Werror,-Wmissing-prototypes]
     366 | void sss_nic_flush_tcam_node_list(struct sss_nic_tcam_info *tcam_info)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:366:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     366 | void sss_nic_flush_tcam_node_list(struct sss_nic_tcam_info *tcam_info)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:382:6: error: no previous prototype for function 'sss_nic_flush_rx_flow_rule' [-Werror,-Wmissing-prototypes]
     382 | void sss_nic_flush_rx_flow_rule(struct sss_nic_rx_rule *rx_flow_rule)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     382 | void sss_nic_flush_rx_flow_rule(struct sss_nic_rx_rule *rx_flow_rule)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:397:6: error: no previous prototype for function 'sss_nic_flush_tcam' [-Werror,-Wmissing-prototypes]
     397 | void sss_nic_flush_tcam(struct sss_nic_dev *nic_dev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:397:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     397 | void sss_nic_flush_tcam(struct sss_nic_dev *nic_dev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:797:5: error: no previous prototype for function 'sss_nic_ethtool_update_flow' [-Werror,-Wmissing-prototypes]
     797 | int sss_nic_ethtool_update_flow(struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:797:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     797 | int sss_nic_ethtool_update_flow(struct sss_nic_dev *nic_dev,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:842:5: error: no previous prototype for function 'sss_nic_ethtool_delete_flow' [-Werror,-Wmissing-prototypes]
     842 | int sss_nic_ethtool_delete_flow(struct sss_nic_dev *nic_dev, u32 location)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:842:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     842 | int sss_nic_ethtool_delete_flow(struct sss_nic_dev *nic_dev, u32 location)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:864:5: error: no previous prototype for function 'sss_nic_ethtool_get_flow' [-Werror,-Wmissing-prototypes]
     864 | int sss_nic_ethtool_get_flow(const struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:864:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     864 | int sss_nic_ethtool_get_flow(const struct sss_nic_dev *nic_dev,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:887:5: error: no previous prototype for function 'sss_nic_ethtool_get_all_flows' [-Werror,-Wmissing-prototypes]
     887 | int sss_nic_ethtool_get_all_flows(const struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:887:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     887 | int sss_nic_ethtool_get_all_flows(const struct sss_nic_dev *nic_dev,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:905:6: error: no previous prototype for function 'sss_nic_validate_channel_setting_in_ntuple' [-Werror,-Wmissing-prototypes]
     905 | bool sss_nic_validate_channel_setting_in_ntuple(const struct sss_nic_dev *nic_dev, u32 q_num)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:905:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     905 | bool sss_nic_validate_channel_setting_in_ntuple(const struct sss_nic_dev *nic_dev, u32 q_num)
         | ^
         | static 
   14 errors generated.
..


vim +/sss_nic_port_module_cable_plug +883 drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c

   882	
 > 883	void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
   884	{
   885		nicif_info(nic_dev, link, nic_dev->netdev,
   886			   "Port module event: Cable plugged\n");
   887	}
   888	
 > 889	void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
   890	{
   891		nicif_info(nic_dev, link, nic_dev->netdev,
   892			   "Port module event: Cable unplugged\n");
   893	}
   894	
 > 895	void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
   896	{
   897		struct sss_nic_port_module_event *port_event = event_data;
   898		enum link_err_type err_type = port_event->err_type;
   899	
   900		nicif_info(nic_dev, link, nic_dev->netdev,
   901			   "Fail to link, err_type: 0x%x\n", err_type);
   902	}
   903	
   904	static void sss_nic_port_module_event_handler(struct sss_nic_dev *nic_dev,
   905						      struct sss_event_info *event)
   906	{
   907		struct sss_nic_port_module_event *port_event = (void *)event->event_data;
   908		enum port_module_event_type type = port_event->type;
   909	
   910		sss_nic_port_module_event_handler_t handler[SSSNIC_PORT_MODULE_MAX_EVENT] = {
   911			sss_nic_port_module_cable_plug,
   912			sss_nic_port_module_cable_unplug,
   913			sss_nic_port_module_link_err,
   914		};
   915	
   916		if (type >= SSSNIC_PORT_MODULE_MAX_EVENT) {
   917			nicif_err(nic_dev, link, nic_dev->netdev,
   918				  "Unknown port module type %d\n", type);
   919			return;
   920		}
   921	
   922		if (handler[type])
   923			handler[type](nic_dev, event->event_data);
   924	}
   925	
   926	static void sss_nic_link_down(struct sss_nic_dev *nic_dev, struct sss_event_info *event)
   927	{
   928		struct net_device *netdev = nic_dev->netdev;
   929	
   930		if (!SSS_CHANNEL_RES_VALID(nic_dev) ||
   931		    test_bit(SSSNIC_LP_TEST, &nic_dev->flags) ||
   932		    test_bit(SSSNIC_FORCE_LINK_UP, &nic_dev->flags))
   933			return;
   934	
   935		if (!netif_carrier_ok(netdev))
   936			return;
   937	
   938		netif_carrier_off(netdev);
   939		nic_dev->link_status = false;
   940		nicif_info(nic_dev, link, netdev, "Link is down\n");
   941	}
   942	
   943	static void sss_nic_link_up(struct sss_nic_dev *nic_dev, struct sss_event_info *event)
   944	{
   945		struct net_device *netdev = nic_dev->netdev;
   946	
   947		if (!SSS_CHANNEL_RES_VALID(nic_dev) ||
   948		    test_bit(SSSNIC_LP_TEST, &nic_dev->flags) ||
   949		    test_bit(SSSNIC_FORCE_LINK_UP, &nic_dev->flags))
   950			return;
   951	
   952		if (netif_carrier_ok(netdev))
   953			return;
   954	
   955		netif_carrier_on(netdev);
   956		nic_dev->link_status = true;
   957	
   958		nicif_info(nic_dev, link, netdev, "Link is up\n");
   959	}
   960	
   961	static void sss_nic_comm_fail_envet_handler(struct sss_nic_dev *nic_dev,
   962						    struct sss_event_info *event)
   963	{
   964		struct sss_fault_event *fault = (void *)event->event_data;
   965	
   966		if (fault->fault_level == SSS_FAULT_LEVEL_SERIOUS_FLR &&
   967		    fault->info.chip.func_id == sss_get_global_func_id(nic_dev->hwdev))
   968			sss_nic_link_down(nic_dev, event);
   969	}
   970	
   971	static void sss_nic_event_handler(struct sss_nic_dev *nic_dev, struct sss_event_info *event)
   972	{
   973		sss_nic_event_handler_t handler[SSSNIC_EVENT_MAX] = {
   974			sss_nic_link_down,
   975			sss_nic_link_up,
   976			sss_nic_port_module_event_handler,
   977			NULL,
   978		};
   979	
   980		if (event->type >= SSSNIC_EVENT_MAX)
   981			return;
   982	
   983		if (handler[event->type])
   984			handler[event->type](nic_dev, event);
   985	}
   986	
   987	static void sss_nic_comm_event_handler(struct sss_nic_dev *nic_dev,
   988					       struct sss_event_info *event)
   989	{
   990		sss_nic_event_handler_t handler[SSS_EVENT_MAX] = {
   991			sss_nic_link_down,
   992			sss_nic_link_down,
   993			sss_nic_comm_fail_envet_handler,
   994			sss_nic_sriov_state_change,
   995			NULL,
   996			sss_nic_link_down,
   997		};
   998	
   999		if (event->type >= SSS_EVENT_MAX)
  1000			return;
  1001	
  1002		if (handler[event->type])
  1003			handler[event->type](nic_dev, event);
  1004	}
  1005	
  1006	static void sss_nic_event(struct sss_hal_dev *uld_dev, void *adapter,
  1007				  struct sss_event_info *event)
  1008	{
  1009		struct sss_nic_dev *nic_dev = adapter;
  1010	
  1011		if (!nic_dev || !event || !sss_support_nic(uld_dev->hwdev))
  1012			return;
  1013	
  1014		if (event->service == SSS_EVENT_SRV_NIC) {
  1015			sss_nic_event_handler(nic_dev, event);
  1016			return;
  1017		}
  1018	
  1019		if (event->service == SSS_EVENT_SRV_COMM) {
  1020			sss_nic_comm_event_handler(nic_dev, event);
  1021			return;
  1022		}
  1023	}
  1024	
  1025	struct sss_uld_info g_nic_uld_info = {
  1026		.probe = sss_nic_probe,
  1027		.remove = sss_nic_remove,
  1028		.suspend = NULL,
  1029		.resume = NULL,
  1030		.event = sss_nic_event,
  1031		.ioctl = sss_tool_ioctl,
  1032	};
  1033	
> 1034	struct sss_uld_info *get_nic_uld_info(void)
  1035	{
  1036		return &g_nic_uld_info;
  1037	}
  1038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
