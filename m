Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235E364AE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 03:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733196505; cv=none; b=ozlCaulVjhO5aEmmtj9+D0EU9Y71vxSH11zEvNbrLLHnKQdAi6T3Sjwhfy8VCSKz6Dkkan0Qs+VKp8mrkrCc3btbUz59Wt4F1U2u00/qGwvt+dzgHblAiPFuLyEx8I5LYxVwvUpQxG79H7ozTkxWxd+epXa/0MIe+xDdz66Stf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733196505; c=relaxed/simple;
	bh=awoGY9vKoyzqgKkXU5k435ED4ke0Fb9ejxAmVNMjxXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zvs5rm6RvqSjFdwz/8ZuY5z1pe+zHIm3ZnO7wR//+8PfCmYUu8i8aYFwsTjURH+mNxIUJcNfbVpViUi/kJLHomJntbYC6SdVJ184+DoKZFTqzwoba1AT1zy0E02lB48iOX23G2TlXjEx8IZzISFRzCWe94IZ7ZjTSWJNsfOwknU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIpG8I7v; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIpG8I7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733196503; x=1764732503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=awoGY9vKoyzqgKkXU5k435ED4ke0Fb9ejxAmVNMjxXg=;
  b=QIpG8I7vPhCLYeO/9+VQsEwOxIBmBW4U4aEjQZym8QRFLydjyjVooZ/6
   +ir9Lz0EbzTJQoONLIMKvExWAu8lUNOP7zUhW2kGp4Q6CdNmKkDk8YaX8
   C0nE2O8Kh+FQpmAliQ/Q0ovvX6wMne++OB3QqA0QZhguU5HAARMtc5qvj
   JGTg+DVg7IQ7lKjOgjzVOIdyQUBQHmgMiK8RaWyMVgrHeIUZf26C1HHB2
   I51PSECt6Vbdh1T0ng92r14FDF7syN+soA+RjZpAoYsgWbWFB7rRZb+rz
   P0eKa1rJPF8VOpENu6EeXsTOzWaARknsz1fQ9h1VQcDs8igm9zpOgVf6H
   Q==;
X-CSE-ConnectionGUID: wsUAcjlBR0qJuoSVkqSoNQ==
X-CSE-MsgGUID: 0itRIo04QD2nkyMlTLe+6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32750076"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="32750076"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 19:28:23 -0800
X-CSE-ConnectionGUID: SEqiUGLKQcWRmy/RzSYu8Q==
X-CSE-MsgGUID: bULeyvbxRZmSYt39i25j6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="97735530"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2024 19:28:21 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIJaF-00001U-0i;
	Tue, 03 Dec 2024 03:28:19 +0000
Date: Tue, 3 Dec 2024 11:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-rc 64/65]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:2750:39: warning: variable
 'tx_ring_size' set but not used
Message-ID: <202412031137.vU0sXQJh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-rc
head:   fe872584c0223203da393054206487d248a0bdd0
commit: 2790b29359178436f2ca1d817c9098ffe16b3668 [64/65] DBG: test for tx timeout
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241203/202412031137.vU0sXQJh-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031137.vU0sXQJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031137.vU0sXQJh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_rx_alloc':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:2750:39: warning: variable 'tx_ring_size' set but not used [-Wunused-but-set-variable]
    2750 |         int rx_data_len, rx_dma_size, tx_ring_size;
         |                                       ^~~~~~~~~~~~


vim +/tx_ring_size +2750 drivers/net/ethernet/mediatek/mtk_eth_soc.c

656e705243fd0c John Crispin     2016-03-08  2744  
ee40681037c0e5 Nelson Chang     2016-09-17  2745  static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
656e705243fd0c John Crispin     2016-03-08  2746  {
8cb42714cdc1fc Lorenzo Bianconi 2022-05-20  2747  	const struct mtk_reg_map *reg_map = eth->soc->reg_map;
c57e558194430d Frank Wunderlich 2024-06-03  2748  	const struct mtk_soc_data *soc = eth->soc;
6427dc1da51dfc John Crispin     2017-08-09  2749  	struct mtk_rx_ring *ring;
ebb1e4f9cf38da Daniel Golle     2023-08-22 @2750  	int rx_data_len, rx_dma_size, tx_ring_size;
656e705243fd0c John Crispin     2016-03-08  2751  	int i;
6427dc1da51dfc John Crispin     2017-08-09  2752  
ebb1e4f9cf38da Daniel Golle     2023-08-22  2753  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA))
ebb1e4f9cf38da Daniel Golle     2023-08-22  2754  		tx_ring_size = MTK_QDMA_RING_SIZE;
ebb1e4f9cf38da Daniel Golle     2023-08-22  2755  	else
c57e558194430d Frank Wunderlich 2024-06-03  2756  		tx_ring_size = soc->tx.dma_size;
ebb1e4f9cf38da Daniel Golle     2023-08-22  2757  
6427dc1da51dfc John Crispin     2017-08-09  2758  	if (rx_flag == MTK_RX_FLAGS_QDMA) {
6427dc1da51dfc John Crispin     2017-08-09  2759  		if (ring_no)
6427dc1da51dfc John Crispin     2017-08-09  2760  			return -EINVAL;
6427dc1da51dfc John Crispin     2017-08-09  2761  		ring = &eth->rx_ring_qdma;
6427dc1da51dfc John Crispin     2017-08-09  2762  	} else {
6427dc1da51dfc John Crispin     2017-08-09  2763  		ring = &eth->rx_ring[ring_no];
6427dc1da51dfc John Crispin     2017-08-09  2764  	}
656e705243fd0c John Crispin     2016-03-08  2765  
ee40681037c0e5 Nelson Chang     2016-09-17  2766  	if (rx_flag == MTK_RX_FLAGS_HWLRO) {
ee40681037c0e5 Nelson Chang     2016-09-17  2767  		rx_data_len = MTK_MAX_LRO_RX_LENGTH;
ee40681037c0e5 Nelson Chang     2016-09-17  2768  		rx_dma_size = MTK_HW_LRO_DMA_SIZE;
ee40681037c0e5 Nelson Chang     2016-09-17  2769  	} else {
ee40681037c0e5 Nelson Chang     2016-09-17  2770  		rx_data_len = ETH_DATA_LEN;
c57e558194430d Frank Wunderlich 2024-06-03  2771  		rx_dma_size = soc->rx.dma_size;
ee40681037c0e5 Nelson Chang     2016-09-17  2772  	}
ee40681037c0e5 Nelson Chang     2016-09-17  2773  
ee40681037c0e5 Nelson Chang     2016-09-17  2774  	ring->frag_size = mtk_max_frag_size(rx_data_len);
656e705243fd0c John Crispin     2016-03-08  2775  	ring->buf_size = mtk_max_buf_size(ring->frag_size);
ee40681037c0e5 Nelson Chang     2016-09-17  2776  	ring->data = kcalloc(rx_dma_size, sizeof(*ring->data),
656e705243fd0c John Crispin     2016-03-08  2777  			     GFP_KERNEL);
656e705243fd0c John Crispin     2016-03-08  2778  	if (!ring->data)
656e705243fd0c John Crispin     2016-03-08  2779  		return -ENOMEM;
656e705243fd0c John Crispin     2016-03-08  2780  
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  2781  	if (mtk_page_pool_enabled(eth)) {
23233e577ef973 Lorenzo Bianconi 2022-07-22  2782  		struct page_pool *pp;
23233e577ef973 Lorenzo Bianconi 2022-07-22  2783  
23233e577ef973 Lorenzo Bianconi 2022-07-22  2784  		pp = mtk_create_page_pool(eth, &ring->xdp_q, ring_no,
23233e577ef973 Lorenzo Bianconi 2022-07-22  2785  					  rx_dma_size);
23233e577ef973 Lorenzo Bianconi 2022-07-22  2786  		if (IS_ERR(pp))
23233e577ef973 Lorenzo Bianconi 2022-07-22  2787  			return PTR_ERR(pp);
23233e577ef973 Lorenzo Bianconi 2022-07-22  2788  
23233e577ef973 Lorenzo Bianconi 2022-07-22  2789  		ring->page_pool = pp;
656e705243fd0c John Crispin     2016-03-08  2790  	}
656e705243fd0c John Crispin     2016-03-08  2791  
ebb1e4f9cf38da Daniel Golle     2023-08-22  2792  	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM) ||
ebb1e4f9cf38da Daniel Golle     2023-08-22  2793  	    rx_flag != MTK_RX_FLAGS_NORMAL) {
d776a57e4a284b Felix Fietkau    2022-04-05  2794  		ring->dma = dma_alloc_coherent(eth->dma_dev,
ecb51fa37ee22f Lorenzo Bianconi 2024-05-08  2795  				rx_dma_size * eth->soc->rx.desc_size,
62dfb4cc444649 Lorenzo Bianconi 2022-05-20  2796  				&ring->phys, GFP_KERNEL);
ebb1e4f9cf38da Daniel Golle     2023-08-22  2797  	} else {
ebb1e4f9cf38da Daniel Golle     2023-08-22  2798  		struct mtk_tx_ring *tx_ring = &eth->tx_ring;
ebb1e4f9cf38da Daniel Golle     2023-08-22  2799  
2790b293591784 Frank Wunderlich 2024-12-02  2800  		ring->dma = tx_ring->dma +
2790b293591784 Frank Wunderlich 2024-12-02  2801  			    eth->soc->tx.dma_size * eth->soc->tx.desc_size +
2790b293591784 Frank Wunderlich 2024-12-02  2802  			    eth->soc->rx.dma_size * eth->soc->rx.desc_size * ring_no;
2790b293591784 Frank Wunderlich 2024-12-02  2803  		ring->phys = tx_ring->phys +
2790b293591784 Frank Wunderlich 2024-12-02  2804  			    eth->soc->tx.dma_size * eth->soc->tx.desc_size +
2790b293591784 Frank Wunderlich 2024-12-02  2805  			    eth->soc->rx.dma_size * eth->soc->rx.desc_size * ring_no;
ebb1e4f9cf38da Daniel Golle     2023-08-22  2806  	}
ebb1e4f9cf38da Daniel Golle     2023-08-22  2807  
656e705243fd0c John Crispin     2016-03-08  2808  	if (!ring->dma)
656e705243fd0c John Crispin     2016-03-08  2809  		return -ENOMEM;
656e705243fd0c John Crispin     2016-03-08  2810  
ee40681037c0e5 Nelson Chang     2016-09-17  2811  	for (i = 0; i < rx_dma_size; i++) {
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2812  		struct mtk_rx_dma_v2 *rxd;
23233e577ef973 Lorenzo Bianconi 2022-07-22  2813  		dma_addr_t dma_addr;
23233e577ef973 Lorenzo Bianconi 2022-07-22  2814  		void *data;
72e27d3718ba24 Lorenzo Bianconi 2022-05-20  2815  
ecb51fa37ee22f Lorenzo Bianconi 2024-05-08  2816  		rxd = ring->dma + i * eth->soc->rx.desc_size;
23233e577ef973 Lorenzo Bianconi 2022-07-22  2817  		if (ring->page_pool) {
23233e577ef973 Lorenzo Bianconi 2022-07-22  2818  			data = mtk_page_pool_get_buff(ring->page_pool,
23233e577ef973 Lorenzo Bianconi 2022-07-22  2819  						      &dma_addr, GFP_KERNEL);
23233e577ef973 Lorenzo Bianconi 2022-07-22  2820  			if (!data)
23233e577ef973 Lorenzo Bianconi 2022-07-22  2821  				return -ENOMEM;
23233e577ef973 Lorenzo Bianconi 2022-07-22  2822  		} else {
23233e577ef973 Lorenzo Bianconi 2022-07-22  2823  			if (ring->frag_size <= PAGE_SIZE)
23233e577ef973 Lorenzo Bianconi 2022-07-22  2824  				data = netdev_alloc_frag(ring->frag_size);
23233e577ef973 Lorenzo Bianconi 2022-07-22  2825  			else
23233e577ef973 Lorenzo Bianconi 2022-07-22  2826  				data = mtk_max_lro_buf_alloc(GFP_KERNEL);
23233e577ef973 Lorenzo Bianconi 2022-07-22  2827  
23233e577ef973 Lorenzo Bianconi 2022-07-22  2828  			if (!data)
656e705243fd0c John Crispin     2016-03-08  2829  				return -ENOMEM;
72e27d3718ba24 Lorenzo Bianconi 2022-05-20  2830  
23233e577ef973 Lorenzo Bianconi 2022-07-22  2831  			dma_addr = dma_map_single(eth->dma_dev,
23233e577ef973 Lorenzo Bianconi 2022-07-22  2832  				data + NET_SKB_PAD + eth->ip_align,
23233e577ef973 Lorenzo Bianconi 2022-07-22  2833  				ring->buf_size, DMA_FROM_DEVICE);
23233e577ef973 Lorenzo Bianconi 2022-07-22  2834  			if (unlikely(dma_mapping_error(eth->dma_dev,
3213f808ae21be Ziyang Xuan      2022-11-20  2835  						       dma_addr))) {
3213f808ae21be Ziyang Xuan      2022-11-20  2836  				skb_free_frag(data);
23233e577ef973 Lorenzo Bianconi 2022-07-22  2837  				return -ENOMEM;
23233e577ef973 Lorenzo Bianconi 2022-07-22  2838  			}
3213f808ae21be Ziyang Xuan      2022-11-20  2839  		}
72e27d3718ba24 Lorenzo Bianconi 2022-05-20  2840  		rxd->rxd1 = (unsigned int)dma_addr;
23233e577ef973 Lorenzo Bianconi 2022-07-22  2841  		ring->data[i] = data;
656e705243fd0c John Crispin     2016-03-08  2842  
296c9120752bab Stefan Roese     2019-08-16  2843  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
72e27d3718ba24 Lorenzo Bianconi 2022-05-20  2844  			rxd->rxd2 = RX_DMA_LSO;
296c9120752bab Stefan Roese     2019-08-16  2845  		else
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2846  			rxd->rxd2 = RX_DMA_PREP_PLEN0(ring->buf_size);
72e27d3718ba24 Lorenzo Bianconi 2022-05-20  2847  
2d75891ebc09ba Daniel Golle     2023-08-22  2848  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA))
2d75891ebc09ba Daniel Golle     2023-08-22  2849  			rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
2d75891ebc09ba Daniel Golle     2023-08-22  2850  
72e27d3718ba24 Lorenzo Bianconi 2022-05-20  2851  		rxd->rxd3 = 0;
72e27d3718ba24 Lorenzo Bianconi 2022-05-20  2852  		rxd->rxd4 = 0;
5e69ff84f3e6cc Daniel Golle     2024-05-08  2853  		if (mtk_is_netsys_v3_or_greater(eth)) {
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2854  			rxd->rxd5 = 0;
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2855  			rxd->rxd6 = 0;
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2856  			rxd->rxd7 = 0;
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2857  			rxd->rxd8 = 0;
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2858  		}
656e705243fd0c John Crispin     2016-03-08  2859  	}
23233e577ef973 Lorenzo Bianconi 2022-07-22  2860  
ee40681037c0e5 Nelson Chang     2016-09-17  2861  	ring->dma_size = rx_dma_size;
ee40681037c0e5 Nelson Chang     2016-09-17  2862  	ring->calc_idx_update = false;
ee40681037c0e5 Nelson Chang     2016-09-17  2863  	ring->calc_idx = rx_dma_size - 1;
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2864  	if (rx_flag == MTK_RX_FLAGS_QDMA)
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2865  		ring->crx_idx_reg = reg_map->qdma.qcrx_ptr +
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2866  				    ring_no * MTK_QRX_OFFSET;
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2867  	else
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2868  		ring->crx_idx_reg = reg_map->pdma.pcrx_ptr +
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2869  				    ring_no * MTK_QRX_OFFSET;
656e705243fd0c John Crispin     2016-03-08  2870  	/* make sure that all changes to the dma ring are flushed before we
656e705243fd0c John Crispin     2016-03-08  2871  	 * continue
656e705243fd0c John Crispin     2016-03-08  2872  	 */
656e705243fd0c John Crispin     2016-03-08  2873  	wmb();
656e705243fd0c John Crispin     2016-03-08  2874  
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2875  	if (rx_flag == MTK_RX_FLAGS_QDMA) {
8cb42714cdc1fc Lorenzo Bianconi 2022-05-20  2876  		mtk_w32(eth, ring->phys,
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2877  			reg_map->qdma.rx_ptr + ring_no * MTK_QRX_OFFSET);
8cb42714cdc1fc Lorenzo Bianconi 2022-05-20  2878  		mtk_w32(eth, rx_dma_size,
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2879  			reg_map->qdma.rx_cnt_cfg + ring_no * MTK_QRX_OFFSET);
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2880  		mtk_w32(eth, MTK_PST_DRX_IDX_CFG(ring_no),
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2881  			reg_map->qdma.rst_idx);
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2882  	} else {
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2883  		mtk_w32(eth, ring->phys,
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2884  			reg_map->pdma.rx_ptr + ring_no * MTK_QRX_OFFSET);
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2885  		mtk_w32(eth, rx_dma_size,
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2886  			reg_map->pdma.rx_cnt_cfg + ring_no * MTK_QRX_OFFSET);
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2887  		mtk_w32(eth, MTK_PST_DRX_IDX_CFG(ring_no),
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2888  			reg_map->pdma.rst_idx);
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2889  	}
160d3a9b192985 Lorenzo Bianconi 2022-05-20  2890  	mtk_w32(eth, ring->calc_idx, ring->crx_idx_reg);
656e705243fd0c John Crispin     2016-03-08  2891  
656e705243fd0c John Crispin     2016-03-08  2892  	return 0;
656e705243fd0c John Crispin     2016-03-08  2893  }
656e705243fd0c John Crispin     2016-03-08  2894  

:::::: The code at line 2750 was first introduced by commit
:::::: ebb1e4f9cf38da2139b37e24b5e10bff3dcc4187 net: ethernet: mtk_eth_soc: add support for in-SoC SRAM

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
