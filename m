Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9331DACB4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730121188; cv=none; b=nkBcki64vAsJaZK1ELPdj/wHMOoctV5hGuhuUAjDXZl9LIbMN80YPG8Bcp9lmTQA/GlSGt9r01oSb0q71ROW8DTwoyJjFIspeGyXQirSjiAsIbIeBe/9PQ66w4b/E19q/FmYXg+81h9ZXobBnZxVUH8ZQZgksSExNd5OBlxcsUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730121188; c=relaxed/simple;
	bh=FTGxS0RYQ3wSF/ePKKfrDVoLdw8gN4MykpXiRBdu5CU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TXLhZ3CXRpQddrHHjxUfFmq0vHc0+w1FDksk1YjzoQe+JJ+Esc3aYwj4hTlr/9SXFDZWV+8aPmXwJqEOuj7A29GaYWYEjJCxzyUVziZizGecheSCSZyNEwxJHVxvJVvPBFkYuV2+5z+tShAkSS2kSRitmajQlbtO04Uij6bZR4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6LskKOY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6LskKOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730121185; x=1761657185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FTGxS0RYQ3wSF/ePKKfrDVoLdw8gN4MykpXiRBdu5CU=;
  b=S6LskKOYKt0Bqyk8RajQkTEDRnyTHIExcV5fq5Ft34nXct683bPiMhxQ
   ihBWJynqLiY0wY7eoPy1RDtsao+V0u1qSOsuh5KYss9K7Hst59gvSFYsh
   t84Ir9ZoCAVqwX5F/APUghaIY0H2qzlrXj/H9Zeb8XbIZJCLTdmDshJIg
   08u/+9tXX3o9dRUruAnlRYVja6ZZ8kpWydqjTFuPRhfbxWJ8+H6TGqW4j
   Q2yGq2grE7HYA3PgLgjL5gBMzQj1aC0ZAAafkp56LtLhzBO2IHsHm1Os5
   0SjB8kN1k1bBIcn3G5rSbFiLCOlleau0OeVPCNLaONOIvfPI6W7I7LXdF
   g==;
X-CSE-ConnectionGUID: hsq7uOeJQmy4HrsE3B8uqQ==
X-CSE-MsgGUID: hIidYV5QQy6SORWCwv7dBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33509867"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="33509867"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 06:13:02 -0700
X-CSE-ConnectionGUID: 48CpGmCLRNqSuBItNddJTw==
X-CSE-MsgGUID: roIJisJ1TDuMkRt3cNLeBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81938855"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Oct 2024 06:13:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5PYJ-000cSm-1I;
	Mon, 28 Oct 2024 13:12:59 +0000
Date: Mon, 28 Oct 2024 21:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-rsslro 63/70]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:3149:33: warning: variable
 'ip4dst' is uninitialized when used here
Message-ID: <202410282145.2sawKayp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-rsslro
head:   edb2a7a8be4be71a6502d19afd5b069f6d9fbacc
commit: 581f68b8ee8e130ab90cabf695798606e12711de [63/70] net: lro patch from balika011
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241028/202410282145.2sawKayp-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410282145.2sawKayp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410282145.2sawKayp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:10:
   In file included from include/linux/of_mdio.h:12:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1897:34: error: incompatible pointer types passing 'struct net_device **' to parameter of type 'struct net_device *'; remove & [-Werror,-Wincompatible-pointer-types]
    1897 |         err = __xdp_rxq_info_reg(xdp_q, &eth->dummy_dev, id,
         |                                         ^~~~~~~~~~~~~~~
   include/net/xdp.h:335:29: note: passing argument to parameter 'dev' here
     335 |                        struct net_device *dev, u32 queue_index,
         |                                           ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3149:33: warning: variable 'ip4dst' is uninitialized when used here [-Wuninitialized]
    3149 |         mac->hwlro_ip[fsp->location] = ip4dst;
         |                                        ^~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3138:12: note: initialize the variable 'ip4dst' to silence this warning
    3138 |         u32 ip4dst;
         |                   ^
         |                    = 0
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5694:20: error: incompatible pointer types passing 'struct net_device **' to parameter of type 'struct net_device *'; remove & [-Werror,-Wincompatible-pointer-types]
    5694 |         init_dummy_netdev(&eth->dummy_dev);
         |                           ^~~~~~~~~~~~~~~
   include/linux/netdevice.h:3123:43: note: passing argument to parameter 'dev' here
    3123 | void init_dummy_netdev(struct net_device *dev);
         |                                           ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5695:17: error: incompatible pointer types passing 'struct net_device **' to parameter of type 'struct net_device *'; remove & [-Werror,-Wincompatible-pointer-types]
    5695 |         netif_napi_add(&eth->dummy_dev, &eth->tx_napi, mtk_napi_tx);
         |                        ^~~~~~~~~~~~~~~
   include/linux/netdevice.h:2635:35: note: passing argument to parameter 'dev' here
    2635 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         |                                   ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5696:17: error: incompatible pointer types passing 'struct net_device **' to parameter of type 'struct net_device *'; remove & [-Werror,-Wincompatible-pointer-types]
    5696 |         netif_napi_add(&eth->dummy_dev, &eth->rx_napi[0].napi, mtk_napi_rx);
         |                        ^~~~~~~~~~~~~~~
   include/linux/netdevice.h:2635:35: note: passing argument to parameter 'dev' here
    2635 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         |                                   ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5700:19: error: incompatible pointer types passing 'struct net_device **' to parameter of type 'struct net_device *'; remove & [-Werror,-Wincompatible-pointer-types]
    5700 |                         netif_napi_add(&eth->dummy_dev, &eth->rx_napi[MTK_RSS_RING(i)].napi,
         |                                        ^~~~~~~~~~~~~~~
   include/linux/netdevice.h:2635:35: note: passing argument to parameter 'dev' here
    2635 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         |                                   ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5706:19: error: incompatible pointer types passing 'struct net_device **' to parameter of type 'struct net_device *'; remove & [-Werror,-Wincompatible-pointer-types]
    5706 |                         netif_napi_add(&eth->dummy_dev, &eth->rx_napi[MTK_HW_LRO_RING(i)].napi,
         |                                        ^~~~~~~~~~~~~~~
   include/linux/netdevice.h:2635:35: note: passing argument to parameter 'dev' here
    2635 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         |                                   ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5717:1: warning: unused label 'err_unreg_netdev' [-Wunused-label]
    5717 | err_unreg_netdev:
         | ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5788:20: error: use of undeclared identifier 'MTK_RX_DONE_INT'
    5788 |                 .irq_done_mask = MTK_RX_DONE_INT,
         |                                  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5817:20: error: use of undeclared identifier 'MTK_RX_DONE_INT'
    5817 |                 .irq_done_mask = MTK_RX_DONE_INT,
         |                                  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5848:20: error: use of undeclared identifier 'MTK_RX_DONE_INT'
    5848 |                 .irq_done_mask = MTK_RX_DONE_INT,
         |                                  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5878:20: error: use of undeclared identifier 'MTK_RX_DONE_INT'
    5878 |                 .irq_done_mask = MTK_RX_DONE_INT,
         |                                  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5905:20: error: use of undeclared identifier 'MTK_RX_DONE_INT'
    5905 |                 .irq_done_mask = MTK_RX_DONE_INT,
         |                                  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5936:20: error: use of undeclared identifier 'MTK_RX_DONE_INT'
    5936 |                 .irq_done_mask = MTK_RX_DONE_INT,
         |                                  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5967:20: error: use of undeclared identifier 'MTK_RX_DONE_INT'
    5967 |                 .irq_done_mask = MTK_RX_DONE_INT,
         |                                  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5998:20: error: use of undeclared identifier 'MTK_RX_DONE_INT_V2'
    5998 |                 .irq_done_mask = MTK_RX_DONE_INT_V2,
         |                                  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:6022:20: error: use of undeclared identifier 'MTK_RX_DONE_INT'
    6022 |                 .irq_done_mask = MTK_RX_DONE_INT,
         |                                  ^
   6 warnings and 15 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/ip4dst +3149 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  3129	
  3130	static int mtk_hwlro_add_ipaddr(struct net_device *dev,
  3131					struct ethtool_rxnfc *cmd)
  3132	{
  3133		struct ethtool_rx_flow_spec *fsp =
  3134			(struct ethtool_rx_flow_spec *)&cmd->fs;
  3135		struct mtk_mac *mac = netdev_priv(dev);
  3136		struct mtk_eth *eth = mac->hw;
  3137		int hwlro_idx;
  3138		u32 ip4dst;
  3139	
  3140	printk(KERN_ALERT "DEBUG: Passed %s %d\n",__FUNCTION__,__LINE__);
  3141		if ((fsp->flow_type != TCP_V4_FLOW) ||
  3142		    (!fsp->h_u.tcp_ip4_spec.ip4dst) ||
  3143		    (fsp->location > 1))
  3144			return -EINVAL;
  3145	printk(KERN_ALERT "DEBUG: Passed %s %d\n",__FUNCTION__,__LINE__);
  3146		mac->hwlro_ip[fsp->location] = htonl(fsp->h_u.tcp_ip4_spec.ip4dst);
  3147		hwlro_idx = (mac->id * MTK_MAX_LRO_IP_CNT) + fsp->location;
  3148	
> 3149		mac->hwlro_ip[fsp->location] = ip4dst;
  3150	
  3151		mac->hwlro_ip_cnt = mtk_hwlro_get_ip_cnt(mac);
  3152	
  3153		mtk_hwlro_val_ipaddr(eth, hwlro_idx, mac->hwlro_ip[fsp->location]);
  3154	
  3155		return 0;
  3156	}
  3157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
