Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5219B38FB6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QaRHlywx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701272623; x=1732808623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DzJEyCbn4xW+U1K6qpZy2tEl9LqkKo9huQs2SLTWCEQ=;
  b=QaRHlywxDxCTWMKBxNfabz97lHkFGBc31Aqm353zbTo5X2ErGzVKOcTM
   sRYKPjHlrDtIZELiNazFay7hueYjjiCDgHs1rdMdHvvDboYZQ9wlxNPYY
   BS9TULP4cIuygCZMb5Z/TZrBNXt/7VAJOkI0xg/kIjSHsZnL18gLD4ChJ
   JP3UpjmQRdGJz64QNDKU4J0EZIuQZiWZok1AOV8s24eRGUsUQofZgvOhu
   RDjuHMPXge320EFYcSY3vJEw0S3t0Coisx5xOEWZ59GDJufgKgwMx5wXj
   BTxNB94DnMxsW0gwbSzPXOTb41PHOLSxTIKXRXqEF8MMrKHZSLatz+ki7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392925490"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392925490"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 07:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772724586"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="772724586"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2023 07:43:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Mit-0000P4-2H;
	Wed, 29 Nov 2023 15:43:35 +0000
Date: Wed, 29 Nov 2023 23:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.7-rsslro 24/24]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:1709:18: error: member reference
 base type 'struct mtk_napi[1]' is not a structure or union
Message-ID: <202311292258.2TH4b1sC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.7-rsslro
head:   fd13b744933d05a89fa5c1a1085284438f65797c
commit: fd13b744933d05a89fa5c1a1085284438f65797c [24/24] wip: try to apply changes for RSS
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231129/202311292258.2TH4b1sC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311292258.2TH4b1sC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311292258.2TH4b1sC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1709:18: error: member reference base type 'struct mtk_napi[1]' is not a structure or union
                                    eth->rx_napi.napi_id, PAGE_SIZE);
                                    ~~~~~~~~~~~~^~~~~~~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:2428:38: error: no member named 'ring_no' in 'struct mtk_rx_ring'
                   mtk_w32(eth, MTK_RX_DONE_INT(ring->ring_no), MTK_PDMA_INT_STATUS);
                                                ~~~~  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:349:4: note: expanded from macro 'MTK_RX_DONE_INT'
           ((ring_no)? BIT(24 + (ring_no)) : BIT(30))
             ^~~~~~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:2428:38: error: no member named 'ring_no' in 'struct mtk_rx_ring'
                   mtk_w32(eth, MTK_RX_DONE_INT(ring->ring_no), MTK_PDMA_INT_STATUS);
                                                ~~~~  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:349:24: note: expanded from macro 'MTK_RX_DONE_INT'
           ((ring_no)? BIT(24 + (ring_no)) : BIT(30))
                                 ^~~~~~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                              ^~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:2428:48: error: use of undeclared identifier 'MTK_PDMA_INT_STATUS'
                   mtk_w32(eth, MTK_RX_DONE_INT(ring->ring_no), MTK_PDMA_INT_STATUS);
                                                                ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2446:48: error: no member named 'ring_no' in 'struct mtk_rx_ring'
                   mtk_rx_irq_enable(eth, MTK_RX_DONE_INT(ring->ring_no));
                                                          ~~~~  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:349:4: note: expanded from macro 'MTK_RX_DONE_INT'
           ((ring_no)? BIT(24 + (ring_no)) : BIT(30))
             ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2446:48: error: no member named 'ring_no' in 'struct mtk_rx_ring'
                   mtk_rx_irq_enable(eth, MTK_RX_DONE_INT(ring->ring_no));
                                                          ~~~~  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:349:24: note: expanded from macro 'MTK_RX_DONE_INT'
           ((ring_no)? BIT(24 + (ring_no)) : BIT(30))
                                 ^~~~~~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                              ^~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:2479:17: error: use of undeclared identifier 'tx_ring'
                                sizeof(*tx_ring->dma) * (ring_no + 1);
                                        ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:2479:34: error: use of undeclared identifier 'ring_no'
                                sizeof(*tx_ring->dma) * (ring_no + 1);
                                                         ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2478:16: error: use of undeclared identifier 'tx_ring'
                   ring->phys = tx_ring->phys + MTK_DMA_SIZE *
                                ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3026:36: error: use of undeclared identifier 'MTK_NETSYS_V2'
           if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
                                             ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3026:36: error: use of undeclared identifier 'MTK_NETSYS_V2'
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3283:49: error: no member named 'ring_no' in 'struct mtk_rx_ring'
                   mtk_rx_irq_disable(eth, MTK_RX_DONE_INT(ring->ring_no));
                                                           ~~~~  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:349:4: note: expanded from macro 'MTK_RX_DONE_INT'
           ((ring_no)? BIT(24 + (ring_no)) : BIT(30))
             ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3283:49: error: no member named 'ring_no' in 'struct mtk_rx_ring'
                   mtk_rx_irq_disable(eth, MTK_RX_DONE_INT(ring->ring_no));
                                                           ~~~~  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:349:24: note: expanded from macro 'MTK_RX_DONE_INT'
           ((ring_no)? BIT(24 + (ring_no)) : BIT(30))
                                 ^~~~~~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                              ^~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3328:6: warning: unused variable 'i' [-Wunused-variable]
           int i;
               ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5220:23: error: use of undeclared identifier 'MTK_RX_DONE_INT'
                   .rx_irq_done_mask = MTK_RX_DONE_INT,
                                       ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5240:23: error: use of undeclared identifier 'MTK_RX_DONE_INT'
                   .rx_irq_done_mask = MTK_RX_DONE_INT,
                                       ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5262:23: error: use of undeclared identifier 'MTK_RX_DONE_INT'
                   .rx_irq_done_mask = MTK_RX_DONE_INT,
                                       ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5283:23: error: use of undeclared identifier 'MTK_RX_DONE_INT'
                   .rx_irq_done_mask = MTK_RX_DONE_INT,
                                       ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5302:23: error: use of undeclared identifier 'MTK_RX_DONE_INT'
                   .rx_irq_done_mask = MTK_RX_DONE_INT,
                                       ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5385:23: error: use of undeclared identifier 'MTK_RX_DONE_INT'
                   .rx_irq_done_mask = MTK_RX_DONE_INT,
                                       ^
   1 warning and 19 errors generated.


vim +1709 drivers/net/ethernet/mediatek/mtk_eth_soc.c

7c26c20da5d420 Lorenzo Bianconi 2022-07-22  1685  
23233e577ef973 Lorenzo Bianconi 2022-07-22  1686  static struct page_pool *mtk_create_page_pool(struct mtk_eth *eth,
23233e577ef973 Lorenzo Bianconi 2022-07-22  1687  					      struct xdp_rxq_info *xdp_q,
23233e577ef973 Lorenzo Bianconi 2022-07-22  1688  					      int id, int size)
23233e577ef973 Lorenzo Bianconi 2022-07-22  1689  {
23233e577ef973 Lorenzo Bianconi 2022-07-22  1690  	struct page_pool_params pp_params = {
23233e577ef973 Lorenzo Bianconi 2022-07-22  1691  		.order = 0,
23233e577ef973 Lorenzo Bianconi 2022-07-22  1692  		.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
23233e577ef973 Lorenzo Bianconi 2022-07-22  1693  		.pool_size = size,
23233e577ef973 Lorenzo Bianconi 2022-07-22  1694  		.nid = NUMA_NO_NODE,
23233e577ef973 Lorenzo Bianconi 2022-07-22  1695  		.dev = eth->dma_dev,
23233e577ef973 Lorenzo Bianconi 2022-07-22  1696  		.offset = MTK_PP_HEADROOM,
23233e577ef973 Lorenzo Bianconi 2022-07-22  1697  		.max_len = MTK_PP_MAX_BUF_SIZE,
23233e577ef973 Lorenzo Bianconi 2022-07-22  1698  	};
23233e577ef973 Lorenzo Bianconi 2022-07-22  1699  	struct page_pool *pp;
23233e577ef973 Lorenzo Bianconi 2022-07-22  1700  	int err;
23233e577ef973 Lorenzo Bianconi 2022-07-22  1701  
5886d26fd25bbe Lorenzo Bianconi 2022-07-22  1702  	pp_params.dma_dir = rcu_access_pointer(eth->prog) ? DMA_BIDIRECTIONAL
5886d26fd25bbe Lorenzo Bianconi 2022-07-22  1703  							  : DMA_FROM_DEVICE;
23233e577ef973 Lorenzo Bianconi 2022-07-22  1704  	pp = page_pool_create(&pp_params);
23233e577ef973 Lorenzo Bianconi 2022-07-22  1705  	if (IS_ERR(pp))
23233e577ef973 Lorenzo Bianconi 2022-07-22  1706  		return pp;
23233e577ef973 Lorenzo Bianconi 2022-07-22  1707  
c966153d120222 Tariq Toukan     2023-02-06  1708  	err = __xdp_rxq_info_reg(xdp_q, &eth->dummy_dev, id,
c966153d120222 Tariq Toukan     2023-02-06 @1709  				 eth->rx_napi.napi_id, PAGE_SIZE);
23233e577ef973 Lorenzo Bianconi 2022-07-22  1710  	if (err < 0)
23233e577ef973 Lorenzo Bianconi 2022-07-22  1711  		goto err_free_pp;
23233e577ef973 Lorenzo Bianconi 2022-07-22  1712  
23233e577ef973 Lorenzo Bianconi 2022-07-22  1713  	err = xdp_rxq_info_reg_mem_model(xdp_q, MEM_TYPE_PAGE_POOL, pp);
23233e577ef973 Lorenzo Bianconi 2022-07-22  1714  	if (err)
23233e577ef973 Lorenzo Bianconi 2022-07-22  1715  		goto err_unregister_rxq;
23233e577ef973 Lorenzo Bianconi 2022-07-22  1716  
23233e577ef973 Lorenzo Bianconi 2022-07-22  1717  	return pp;
23233e577ef973 Lorenzo Bianconi 2022-07-22  1718  
23233e577ef973 Lorenzo Bianconi 2022-07-22  1719  err_unregister_rxq:
23233e577ef973 Lorenzo Bianconi 2022-07-22  1720  	xdp_rxq_info_unreg(xdp_q);
23233e577ef973 Lorenzo Bianconi 2022-07-22  1721  err_free_pp:
23233e577ef973 Lorenzo Bianconi 2022-07-22  1722  	page_pool_destroy(pp);
23233e577ef973 Lorenzo Bianconi 2022-07-22  1723  
23233e577ef973 Lorenzo Bianconi 2022-07-22  1724  	return ERR_PTR(err);
23233e577ef973 Lorenzo Bianconi 2022-07-22  1725  }
23233e577ef973 Lorenzo Bianconi 2022-07-22  1726  

:::::: The code at line 1709 was first introduced by commit
:::::: c966153d120222cd4e85e1e1601584d7d4d91dcb net: ethernet: mtk_eth_soc: fix wrong parameters order in __xdp_rxq_info_reg()

:::::: TO: Tariq Toukan <tariqt@nvidia.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
