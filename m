Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C320F7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 03:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsgJPyv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701054716; x=1732590716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GAQpSzBqi2+FF61WQ6eowzsHTemlFG0aolO9wlaIle0=;
  b=hsgJPyv/qCdoSpHR93BcmVuhBerfW5dbvMAdK8Y0rqWXPtCZKKrHLfrd
   cXLYai+tMbE8V59wrpixLkfVXHRtl9AA55z5MbIg5eR6qBpeziHh1L5hp
   6IIWLRdyFGql4OlNz1XsqXQ76/sI1jPzmo4uu5NUXIPCB8imGBVMlAIMt
   XODDQ+vEOzU8vbqc1cXWfhY1SAGRDlV5/qAnht7y9tP2fNveap8lmxhwo
   0nYNObqnX0z3Q9o+QwKLlvEqOoUwRn4qJT5P/fd7a1coR19uJncd+jnwC
   kmpQOl+6kU9t7lOPWaZcI18ITcp1AjoRiPmmslqwS8FG0NKUvuAm5bw6C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="14187901"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="14187901"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 19:11:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="717907948"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="717907948"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Nov 2023 19:11:23 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7S1n-0005mA-0g;
	Mon, 27 Nov 2023 03:11:19 +0000
Date: Mon, 27 Nov 2023 11:11:14 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.7-rsslro 24/24]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:3328:6: warning: unused variable
 'i'
Message-ID: <202311270835.GWBmEeeH-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231127/202311270835.GWBmEeeH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311270835.GWBmEeeH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270835.GWBmEeeH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1709:18: error: member reference base type 'struct mtk_napi[1]' is not a structure or union
                                    eth->rx_napi.napi_id, PAGE_SIZE);
                                    ~~~~~~~~~~~~^~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2428:38: error: no member named 'ring_no' in 'struct mtk_rx_ring'
                   mtk_w32(eth, MTK_RX_DONE_INT(ring->ring_no), MTK_PDMA_INT_STATUS);
                                                ~~~~  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:349:4: note: expanded from macro 'MTK_RX_DONE_INT'
           ((ring_no)? BIT(24 + (ring_no)) : BIT(30))
             ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2428:38: error: no member named 'ring_no' in 'struct mtk_rx_ring'
                   mtk_w32(eth, MTK_RX_DONE_INT(ring->ring_no), MTK_PDMA_INT_STATUS);
                                                ~~~~  ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:349:24: note: expanded from macro 'MTK_RX_DONE_INT'
           ((ring_no)? BIT(24 + (ring_no)) : BIT(30))
                                 ^~~~~~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                              ^~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2428:48: error: use of undeclared identifier 'MTK_PDMA_INT_STATUS'
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
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2479:17: error: use of undeclared identifier 'tx_ring'
                                sizeof(*tx_ring->dma) * (ring_no + 1);
                                        ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2479:34: error: use of undeclared identifier 'ring_no'
                                sizeof(*tx_ring->dma) * (ring_no + 1);
                                                         ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2478:16: error: use of undeclared identifier 'tx_ring'
                   ring->phys = tx_ring->phys + MTK_DMA_SIZE *
                                ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3026:36: error: use of undeclared identifier 'MTK_NETSYS_V2'
           if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
                                             ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3026:36: error: use of undeclared identifier 'MTK_NETSYS_V2'
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
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3328:6: warning: unused variable 'i' [-Wunused-variable]
           int i;
               ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5220:23: error: use of undeclared identifier 'MTK_RX_DONE_INT'
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


vim +/i +3328 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  3322	
  3323	#ifdef CONFIG_NET_POLL_CONTROLLER
  3324	static void mtk_poll_controller(struct net_device *dev)
  3325	{
  3326		struct mtk_mac *mac = netdev_priv(dev);
  3327		struct mtk_eth *eth = mac->hw;
> 3328		int i;
  3329	
  3330		mtk_tx_irq_disable(eth, MTK_TX_DONE_INT);
  3331		mtk_rx_irq_disable(eth, eth->soc->txrx.rx_irq_done_mask);
  3332		//mtk_handle_irq_rx(eth->irq[2], dev);
  3333		mtk_rx_irq_disable(eth, MTK_RX_DONE_INT(0));
  3334		mtk_handle_irq_rx(eth->irq[2], &eth->rx_napi[0]);
  3335		mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
  3336		//mtk_rx_irq_enable(eth, eth->soc->txrx.rx_irq_done_mask);
  3337		mtk_rx_irq_enable(eth, MTK_RX_DONE_INT(0));
  3338	}
  3339	#endif
  3340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
