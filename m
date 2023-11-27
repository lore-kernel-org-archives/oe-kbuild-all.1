Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E6D20E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 03:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCWDUIIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701054803; x=1732590803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3R7SQAIxXoKflG5GzWcueilGLAK3q5mvKsTnDJdNjKM=;
  b=CCWDUIIeUnmEooF71hpxoXVzB3MbywG8NisfYEy90U8yx1D7CdbeOnRD
   LxY2C5HXrduHB6aWTfpnQVKisT/t6yL46wDUThNEYsyVOs/fV7xIJz2CH
   dUffDo6ciBJggCxQDPQHE/hH9xqL5LA96FqF2Ot+zIT80Q1HdfwEzDWDl
   2TZnl4dyGtS0lbkQ6JZD4USTB0fW4oagwsQThmQ1rCHgtLh2kh8kWUFML
   iCz20kxayw7l9JzJXnSDbP5WUPgL+OCA8wOq1QCRpS6yt3//JE26iCp7k
   NBHNa7iD2m+eLg79JSJnvQQM1yk/X7CCWPhQ2wuRPP2WjmHT1BYjAT6oR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="371981187"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="371981187"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 19:13:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="834196191"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="834196191"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2023 19:13:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7S3j-0005mi-1h;
	Mon, 27 Nov 2023 03:13:19 +0000
Date: Mon, 27 Nov 2023 11:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.7-rsslro 24/24]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:1709:46: error: '(struct
 mtk_napi *)&eth->rx_napi' is a pointer; did you mean to use '->'?
Message-ID: <202311271138.zZo86Yu7-lkp@intel.com>
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
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231127/202311271138.zZo86Yu7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271138.zZo86Yu7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271138.zZo86Yu7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_create_page_pool':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1709:46: error: '(struct mtk_napi *)&eth->rx_napi' is a pointer; did you mean to use '->'?
    1709 |                                  eth->rx_napi.napi_id, PAGE_SIZE);
         |                                              ^
         |                                              ->
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:31:
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_napi_rx':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:2428:50: error: 'struct mtk_rx_ring' has no member named 'ring_no'
    2428 |                 mtk_w32(eth, MTK_RX_DONE_INT(ring->ring_no), MTK_PDMA_INT_STATUS);
         |                                                  ^~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:349:11: note: in definition of macro 'MTK_RX_DONE_INT'
     349 |         ((ring_no)? BIT(24 + (ring_no)) : BIT(30))
         |           ^~~~~~~
   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/of.h:15,
                    from drivers/net/ethernet/mediatek/mtk_eth_soc.c:9:
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:2428:50: error: 'struct mtk_rx_ring' has no member named 'ring_no'
    2428 |                 mtk_w32(eth, MTK_RX_DONE_INT(ring->ring_no), MTK_PDMA_INT_STATUS);
         |                                                  ^~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2428:30: note: in expansion of macro 'MTK_RX_DONE_INT'
    2428 |                 mtk_w32(eth, MTK_RX_DONE_INT(ring->ring_no), MTK_PDMA_INT_STATUS);
         |                              ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:2428:62: error: 'MTK_PDMA_INT_STATUS' undeclared (first use in this function); did you mean 'MTK_INT_STATUS2'?
    2428 |                 mtk_w32(eth, MTK_RX_DONE_INT(ring->ring_no), MTK_PDMA_INT_STATUS);
         |                                                              ^~~~~~~~~~~~~~~~~~~
         |                                                              MTK_INT_STATUS2
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2428:62: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2446:60: error: 'struct mtk_rx_ring' has no member named 'ring_no'
    2446 |                 mtk_rx_irq_enable(eth, MTK_RX_DONE_INT(ring->ring_no));
         |                                                            ^~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:349:11: note: in definition of macro 'MTK_RX_DONE_INT'
     349 |         ((ring_no)? BIT(24 + (ring_no)) : BIT(30))
         |           ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2446:60: error: 'struct mtk_rx_ring' has no member named 'ring_no'
    2446 |                 mtk_rx_irq_enable(eth, MTK_RX_DONE_INT(ring->ring_no));
         |                                                            ^~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2446:40: note: in expansion of macro 'MTK_RX_DONE_INT'
    2446 |                 mtk_rx_irq_enable(eth, MTK_RX_DONE_INT(ring->ring_no));
         |                                        ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_tx_alloc':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:2478:30: error: 'tx_ring' undeclared (first use in this function); did you mean 'ptr_ring'?
    2478 |                 ring->phys = tx_ring->phys + MTK_DMA_SIZE *
         |                              ^~~~~~~
         |                              ptr_ring
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:2479:55: error: 'ring_no' undeclared (first use in this function); did you mean 'ring'?
    2479 |                              sizeof(*tx_ring->dma) * (ring_no + 1);
         |                                                       ^~~~~~~
         |                                                       ring
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_rss_init':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3026:43: error: 'MTK_NETSYS_V2' undeclared (first use in this function)
    3026 |         if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
         |                                           ^~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1134:53: note: in definition of macro 'MTK_HAS_CAPS'
    1134 | #define MTK_HAS_CAPS(caps, _x)          (((caps) & (_x)) == (_x))
         |                                                     ^~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_handle_irq_rx':
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3283:61: error: 'struct mtk_rx_ring' has no member named 'ring_no'
    3283 |                 mtk_rx_irq_disable(eth, MTK_RX_DONE_INT(ring->ring_no));
         |                                                             ^~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:349:11: note: in definition of macro 'MTK_RX_DONE_INT'
     349 |         ((ring_no)? BIT(24 + (ring_no)) : BIT(30))
         |           ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3283:61: error: 'struct mtk_rx_ring' has no member named 'ring_no'
    3283 |                 mtk_rx_irq_disable(eth, MTK_RX_DONE_INT(ring->ring_no));
         |                                                             ^~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3283:41: note: in expansion of macro 'MTK_RX_DONE_INT'
    3283 |                 mtk_rx_irq_disable(eth, MTK_RX_DONE_INT(ring->ring_no));
         |                                         ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_poll_controller':
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3328:13: warning: unused variable 'i' [-Wunused-variable]
    3328 |         int i;
         |             ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: At top level:
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5220:37: error: 'MTK_RX_DONE_INT' undeclared here (not in a function)
    5220 |                 .rx_irq_done_mask = MTK_RX_DONE_INT,
         |                                     ^~~~~~~~~~~~~~~


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
