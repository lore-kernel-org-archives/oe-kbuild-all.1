Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C90314285
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718556694; cv=none; b=oWuTkBUm7Qfp9FEgXeRyL73S1MzbLMajPPBJruQY8Yz5A8nnBPakj/GXRYsXCMHhNRqnjFQWay3grLEcH0R4OtJl87Cn4pMNRDslqjRy+gqOoXj+25J5PkqByHCDe/BKIHgNjKOw3jfhcHS3Shtl4vHpjCs1HYc+y4yN3Ewp61g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718556694; c=relaxed/simple;
	bh=eA+4wdR0RKqZPgGdp3FUAAk2otSu9Cm5syncXvpxS8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EcjitPDM/qUxtZynTJdOGjkKSAcT9/KnE/gkrau56M1VVzYO2rwsidMdeHwI/isQM9kflKbDQRTzKxyLm2bz2ztBaRi5pX5ZKYeet4WPPF4PJatRUZt0hUeS8YgAur4AnOFUzqRw0MKjdebBBhY8Xh7Ilp/nlTTJBLnGgNT9dzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INRp4rhu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INRp4rhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718556692; x=1750092692;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eA+4wdR0RKqZPgGdp3FUAAk2otSu9Cm5syncXvpxS8I=;
  b=INRp4rhus1lyXDsHDqKQqZ9iTcWcrUsbOPmn28BuXpIfpoN24stipY+q
   6tbVO18CrZA4t4GVHXJeED1C+99faRv0PYM0BwzwKjRFqeilj8aV331wN
   rFXQVtpdSKgaBahU3Qd/UyaabSL0lsXccueaqvhbTQYZVAm+bICiRnM8O
   332ksCsbrQ7Kd7yNnicQaJOhmcxT72ATqbuVj6D8ZSXWZWfWpg8fzaUe2
   /uEgL9kmo8mZRFBcBs8KiV3RjeiN8d6m6ch3hXk0yOSuJCttokw2UU+WA
   LSXFl2H8qwC/ycULqTdI2es5my28HI7aaxWH3QPMDejQpjN+uaFpc18SJ
   g==;
X-CSE-ConnectionGUID: 6s76mXmHSXWBIuGx9nodWQ==
X-CSE-MsgGUID: a5QZc0JDT/qzA4fkmnF0eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="12098121"
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="12098121"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 09:51:30 -0700
X-CSE-ConnectionGUID: 2M6Mx52zQP2gQikwn1S2ZQ==
X-CSE-MsgGUID: lHodEAdaTSyxGefTDcHKoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="45915552"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Jun 2024 09:51:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIt6D-00034z-2n;
	Sun, 16 Jun 2024 16:51:25 +0000
Date: Mon, 17 Jun 2024 00:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.10-rsslro 1/4]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5698:1: warning: label
 'err_unreg_netdev' defined but not used
Message-ID: <202406170022.Ga0AcJMt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-rsslro
head:   eb3136f791cd4e799431e1050a94b2b25b20dc0d
commit: 13ed4ce931c53f157810cc9047ba1996c8338766 [1/4] net: lro patch from balika011
config: csky-randconfig-002-20240616 (https://download.01.org/0day-ci/archive/20240617/202406170022.Ga0AcJMt-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170022.Ga0AcJMt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170022.Ga0AcJMt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_create_page_pool':
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1883:41: error: passing argument 2 of '__xdp_rxq_info_reg' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1883 |         err = __xdp_rxq_info_reg(xdp_q, &eth->dummy_dev, id,
         |                                         ^~~~~~~~~~~~~~~
         |                                         |
         |                                         struct net_device **
   In file included from include/trace/events/xdp.h:12,
                    from include/linux/bpf_trace.h:5,
                    from drivers/net/ethernet/mediatek/mtk_eth_soc.h:23,
                    from drivers/net/ethernet/mediatek/mtk_eth_soc.c:33:
   include/net/xdp.h:335:43: note: expected 'struct net_device *' but argument is of type 'struct net_device **'
     335 |                        struct net_device *dev, u32 queue_index,
         |                        ~~~~~~~~~~~~~~~~~~~^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_probe':
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5675:27: error: passing argument 1 of 'init_dummy_netdev' from incompatible pointer type [-Werror=incompatible-pointer-types]
    5675 |         init_dummy_netdev(&eth->dummy_dev);
         |                           ^~~~~~~~~~~~~~~
         |                           |
         |                           struct net_device **
   In file included from include/linux/if_vlan.h:10,
                    from drivers/net/ethernet/mediatek/mtk_eth_soc.c:18:
   include/linux/netdevice.h:3125:43: note: expected 'struct net_device *' but argument is of type 'struct net_device **'
    3125 | void init_dummy_netdev(struct net_device *dev);
         |                        ~~~~~~~~~~~~~~~~~~~^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5676:24: error: passing argument 1 of 'netif_napi_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
    5676 |         netif_napi_add(&eth->dummy_dev, &eth->tx_napi, mtk_napi_tx);
         |                        ^~~~~~~~~~~~~~~
         |                        |
         |                        struct net_device **
   include/linux/netdevice.h:2635:35: note: expected 'struct net_device *' but argument is of type 'struct net_device **'
    2635 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         |                ~~~~~~~~~~~~~~~~~~~^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5677:24: error: passing argument 1 of 'netif_napi_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
    5677 |         netif_napi_add(&eth->dummy_dev, &eth->rx_napi[0].napi, mtk_napi_rx);
         |                        ^~~~~~~~~~~~~~~
         |                        |
         |                        struct net_device **
   include/linux/netdevice.h:2635:35: note: expected 'struct net_device *' but argument is of type 'struct net_device **'
    2635 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         |                ~~~~~~~~~~~~~~~~~~~^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5681:40: error: passing argument 1 of 'netif_napi_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
    5681 |                         netif_napi_add(&eth->dummy_dev, &eth->rx_napi[MTK_RSS_RING(i)].napi,
         |                                        ^~~~~~~~~~~~~~~
         |                                        |
         |                                        struct net_device **
   include/linux/netdevice.h:2635:35: note: expected 'struct net_device *' but argument is of type 'struct net_device **'
    2635 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         |                ~~~~~~~~~~~~~~~~~~~^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5687:40: error: passing argument 1 of 'netif_napi_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
    5687 |                         netif_napi_add(&eth->dummy_dev, &eth->rx_napi[MTK_HW_LRO_RING(i)].napi,
         |                                        ^~~~~~~~~~~~~~~
         |                                        |
         |                                        struct net_device **
   include/linux/netdevice.h:2635:35: note: expected 'struct net_device *' but argument is of type 'struct net_device **'
    2635 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         |                ~~~~~~~~~~~~~~~~~~~^~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5698:1: warning: label 'err_unreg_netdev' defined but not used [-Wunused-label]
    5698 | err_unreg_netdev:
         | ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: At top level:
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5771:34: error: 'MTK_RX_DONE_INT' undeclared here (not in a function)
    5771 |                 .irq_done_mask = MTK_RX_DONE_INT,
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5954:34: error: 'MTK_RX_DONE_INT_V2' undeclared here (not in a function)
    5954 |                 .irq_done_mask = MTK_RX_DONE_INT_V2,
         |                                  ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:4545:12: warning: 'mtk_change_mtu' defined but not used [-Wunused-function]
    4545 | static int mtk_change_mtu(struct net_device *dev, int new_mtu)
         |            ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/err_unreg_netdev +5698 drivers/net/ethernet/mediatek/mtk_eth_soc.c

2a3ec7ae313310 Daniel Golle       2023-03-19  5354  
656e705243fd0c John Crispin       2016-03-08  5355  static int mtk_probe(struct platform_device *pdev)
656e705243fd0c John Crispin       2016-03-08  5356  {
ebb1e4f9cf38da Daniel Golle       2023-08-22  5357  	struct resource *res = NULL, *res_sram;
656e705243fd0c John Crispin       2016-03-08  5358  	struct device_node *mac_np;
656e705243fd0c John Crispin       2016-03-08  5359  	struct mtk_eth *eth;
b8fc9f30821ec0 René van Dorst     2019-08-25  5360  	int err, i;
656e705243fd0c John Crispin       2016-03-08  5361  
656e705243fd0c John Crispin       2016-03-08  5362  	eth = devm_kzalloc(&pdev->dev, sizeof(*eth), GFP_KERNEL);
656e705243fd0c John Crispin       2016-03-08  5363  	if (!eth)
656e705243fd0c John Crispin       2016-03-08  5364  		return -ENOMEM;
656e705243fd0c John Crispin       2016-03-08  5365  
eda7d46da443e1 Ryder Lee          2018-04-16  5366  	eth->soc = of_device_get_match_data(&pdev->dev);
2ec50f574e8198 Sean Wang          2017-07-31  5367  
549e5495467ac2 Sean Wang          2016-09-01  5368  	eth->dev = &pdev->dev;
d776a57e4a284b Felix Fietkau      2022-04-05  5369  	eth->dma_dev = &pdev->dev;
566495de16580a YueHaibing         2019-08-01  5370  	eth->base = devm_platform_ioremap_resource(pdev, 0);
621e49f6d80a73 Vladimir Zapolskiy 2016-03-23  5371  	if (IS_ERR(eth->base))
621e49f6d80a73 Vladimir Zapolskiy 2016-03-23  5372  		return PTR_ERR(eth->base);
656e705243fd0c John Crispin       2016-03-08  5373  
160d3a9b192985 Lorenzo Bianconi   2022-05-20  5374  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
296c9120752bab Stefan Roese       2019-08-16  5375  		eth->ip_align = NET_IP_ALIGN;
296c9120752bab Stefan Roese       2019-08-16  5376  
ebb1e4f9cf38da Daniel Golle       2023-08-22  5377  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
ebb1e4f9cf38da Daniel Golle       2023-08-22  5378  		/* SRAM is actual memory and supports transparent access just like DRAM.
ebb1e4f9cf38da Daniel Golle       2023-08-22  5379  		 * Hence we don't require __iomem being set and don't need to use accessor
ebb1e4f9cf38da Daniel Golle       2023-08-22  5380  		 * functions to read from or write to SRAM.
ebb1e4f9cf38da Daniel Golle       2023-08-22  5381  		 */
ebb1e4f9cf38da Daniel Golle       2023-08-22  5382  		if (mtk_is_netsys_v3_or_greater(eth)) {
ebb1e4f9cf38da Daniel Golle       2023-08-22  5383  			eth->sram_base = (void __force *)devm_platform_ioremap_resource(pdev, 1);
ebb1e4f9cf38da Daniel Golle       2023-08-22  5384  			if (IS_ERR(eth->sram_base))
ebb1e4f9cf38da Daniel Golle       2023-08-22  5385  				return PTR_ERR(eth->sram_base);
ebb1e4f9cf38da Daniel Golle       2023-08-22  5386  		} else {
ebb1e4f9cf38da Daniel Golle       2023-08-22  5387  			eth->sram_base = (void __force *)eth->base + MTK_ETH_SRAM_OFFSET;
ebb1e4f9cf38da Daniel Golle       2023-08-22  5388  		}
ebb1e4f9cf38da Daniel Golle       2023-08-22  5389  	}
ebb1e4f9cf38da Daniel Golle       2023-08-22  5390  
2d75891ebc09ba Daniel Golle       2023-08-22  5391  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
cae1f1c36661f2 Daniel Golle       2024-01-24  5392  		err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(36));
cae1f1c36661f2 Daniel Golle       2024-01-24  5393  		if (!err)
cae1f1c36661f2 Daniel Golle       2024-01-24  5394  			err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
cae1f1c36661f2 Daniel Golle       2024-01-24  5395  
2d75891ebc09ba Daniel Golle       2023-08-22  5396  		if (err) {
2d75891ebc09ba Daniel Golle       2023-08-22  5397  			dev_err(&pdev->dev, "Wrong DMA config\n");
2d75891ebc09ba Daniel Golle       2023-08-22  5398  			return -EINVAL;
2d75891ebc09ba Daniel Golle       2023-08-22  5399  		}
2d75891ebc09ba Daniel Golle       2023-08-22  5400  	}
2d75891ebc09ba Daniel Golle       2023-08-22  5401  
656e705243fd0c John Crispin       2016-03-08  5402  	spin_lock_init(&eth->page_lock);
5cce0322cf8cd2 John Crispin       2017-06-19  5403  	spin_lock_init(&eth->tx_irq_lock);
5cce0322cf8cd2 John Crispin       2017-06-19  5404  	spin_lock_init(&eth->rx_irq_lock);
e9229ffd550b2d Felix Fietkau      2021-04-22  5405  	spin_lock_init(&eth->dim_lock);
e9229ffd550b2d Felix Fietkau      2021-04-22  5406  
e9229ffd550b2d Felix Fietkau      2021-04-22  5407  	eth->rx_dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
e9229ffd550b2d Felix Fietkau      2021-04-22  5408  	INIT_WORK(&eth->rx_dim.work, mtk_dim_rx);
93b2591ad0d0c1 Lorenzo Bianconi   2023-01-14  5409  	INIT_DELAYED_WORK(&eth->reset.monitor_work, mtk_hw_reset_monitor_work);
e9229ffd550b2d Felix Fietkau      2021-04-22  5410  
e9229ffd550b2d Felix Fietkau      2021-04-22  5411  	eth->tx_dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
e9229ffd550b2d Felix Fietkau      2021-04-22  5412  	INIT_WORK(&eth->tx_dim.work, mtk_dim_tx);
656e705243fd0c John Crispin       2016-03-08  5413  
296c9120752bab Stefan Roese       2019-08-16  5414  	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
656e705243fd0c John Crispin       2016-03-08  5415  		eth->ethsys = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
656e705243fd0c John Crispin       2016-03-08  5416  							      "mediatek,ethsys");
656e705243fd0c John Crispin       2016-03-08  5417  		if (IS_ERR(eth->ethsys)) {
656e705243fd0c John Crispin       2016-03-08  5418  			dev_err(&pdev->dev, "no ethsys regmap found\n");
656e705243fd0c John Crispin       2016-03-08  5419  			return PTR_ERR(eth->ethsys);
656e705243fd0c John Crispin       2016-03-08  5420  		}
296c9120752bab Stefan Roese       2019-08-16  5421  	}
656e705243fd0c John Crispin       2016-03-08  5422  
7093f9d80c7cb8 Sean Wang          2019-06-01  5423  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_INFRA)) {
7093f9d80c7cb8 Sean Wang          2019-06-01  5424  		eth->infra = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
7093f9d80c7cb8 Sean Wang          2019-06-01  5425  							     "mediatek,infracfg");
7093f9d80c7cb8 Sean Wang          2019-06-01  5426  		if (IS_ERR(eth->infra)) {
7093f9d80c7cb8 Sean Wang          2019-06-01  5427  			dev_err(&pdev->dev, "no infracfg regmap found\n");
7093f9d80c7cb8 Sean Wang          2019-06-01  5428  			return PTR_ERR(eth->infra);
7093f9d80c7cb8 Sean Wang          2019-06-01  5429  		}
7093f9d80c7cb8 Sean Wang          2019-06-01  5430  	}
7093f9d80c7cb8 Sean Wang          2019-06-01  5431  
d776a57e4a284b Felix Fietkau      2022-04-05  5432  	if (of_dma_is_coherent(pdev->dev.of_node)) {
d776a57e4a284b Felix Fietkau      2022-04-05  5433  		struct regmap *cci;
d776a57e4a284b Felix Fietkau      2022-04-05  5434  
d776a57e4a284b Felix Fietkau      2022-04-05  5435  		cci = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
4263f77a5144f7 Lorenzo Bianconi   2022-04-11  5436  						      "cci-control-port");
d776a57e4a284b Felix Fietkau      2022-04-05  5437  		/* enable CPU/bus coherency */
d776a57e4a284b Felix Fietkau      2022-04-05  5438  		if (!IS_ERR(cci))
d776a57e4a284b Felix Fietkau      2022-04-05  5439  			regmap_write(cci, 0, 3);
d776a57e4a284b Felix Fietkau      2022-04-05  5440  	}
d776a57e4a284b Felix Fietkau      2022-04-05  5441  
2eddc00627f944 Daniel Golle       2023-12-12  5442  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SGMII) &&
2eddc00627f944 Daniel Golle       2023-12-12  5443  	    !mtk_is_netsys_v3_or_greater(eth)) {
2a3ec7ae313310 Daniel Golle       2023-03-19  5444  		err = mtk_sgmii_init(eth);
9ffee4a8276c73 Sean Wang          2019-06-01  5445  
9ffee4a8276c73 Sean Wang          2019-06-01  5446  		if (err)
9ffee4a8276c73 Sean Wang          2019-06-01  5447  			return err;
42c03844e93d56 Sean Wang          2017-07-31  5448  	}
42c03844e93d56 Sean Wang          2017-07-31  5449  
243dc5fb4697a0 Sean Wang          2017-12-20  5450  	if (eth->soc->required_pctl) {
656e705243fd0c John Crispin       2016-03-08  5451  		eth->pctl = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
656e705243fd0c John Crispin       2016-03-08  5452  							    "mediatek,pctl");
656e705243fd0c John Crispin       2016-03-08  5453  		if (IS_ERR(eth->pctl)) {
656e705243fd0c John Crispin       2016-03-08  5454  			dev_err(&pdev->dev, "no pctl regmap found\n");
2a3ec7ae313310 Daniel Golle       2023-03-19  5455  			err = PTR_ERR(eth->pctl);
2a3ec7ae313310 Daniel Golle       2023-03-19  5456  			goto err_destroy_sgmii;
656e705243fd0c John Crispin       2016-03-08  5457  		}
243dc5fb4697a0 Sean Wang          2017-12-20  5458  	}
656e705243fd0c John Crispin       2016-03-08  5459  
a008e2a84e6b2b Lorenzo Bianconi   2023-07-25  5460  	if (mtk_is_netsys_v2_or_greater(eth)) {
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5461  		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
2a3ec7ae313310 Daniel Golle       2023-03-19  5462  		if (!res) {
2a3ec7ae313310 Daniel Golle       2023-03-19  5463  			err = -EINVAL;
2a3ec7ae313310 Daniel Golle       2023-03-19  5464  			goto err_destroy_sgmii;
2a3ec7ae313310 Daniel Golle       2023-03-19  5465  		}
ebb1e4f9cf38da Daniel Golle       2023-08-22  5466  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
ebb1e4f9cf38da Daniel Golle       2023-08-22  5467  			if (mtk_is_netsys_v3_or_greater(eth)) {
ebb1e4f9cf38da Daniel Golle       2023-08-22  5468  				res_sram = platform_get_resource(pdev, IORESOURCE_MEM, 1);
ebb1e4f9cf38da Daniel Golle       2023-08-22  5469  				if (!res_sram) {
ebb1e4f9cf38da Daniel Golle       2023-08-22  5470  					err = -EINVAL;
ebb1e4f9cf38da Daniel Golle       2023-08-22  5471  					goto err_destroy_sgmii;
ebb1e4f9cf38da Daniel Golle       2023-08-22  5472  				}
ebb1e4f9cf38da Daniel Golle       2023-08-22  5473  				eth->phy_scratch_ring = res_sram->start;
ebb1e4f9cf38da Daniel Golle       2023-08-22  5474  			} else {
ebb1e4f9cf38da Daniel Golle       2023-08-22  5475  				eth->phy_scratch_ring = res->start + MTK_ETH_SRAM_OFFSET;
ebb1e4f9cf38da Daniel Golle       2023-08-22  5476  			}
ebb1e4f9cf38da Daniel Golle       2023-08-22  5477  		}
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5478  	}
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5479  
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5480  	if (eth->soc->offload_version) {
804775dfc2885e Felix Fietkau      2022-04-05  5481  		for (i = 0;; i++) {
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5482  			struct device_node *np;
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5483  			phys_addr_t wdma_phy;
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5484  			u32 wdma_base;
804775dfc2885e Felix Fietkau      2022-04-05  5485  
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5486  			if (i >= ARRAY_SIZE(eth->soc->reg_map->wdma_base))
804775dfc2885e Felix Fietkau      2022-04-05  5487  				break;
804775dfc2885e Felix Fietkau      2022-04-05  5488  
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5489  			np = of_parse_phandle(pdev->dev.of_node,
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5490  					      "mediatek,wed", i);
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5491  			if (!np)
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5492  				break;
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5493  
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5494  			wdma_base = eth->soc->reg_map->wdma_base[i];
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5495  			wdma_phy = res ? res->start + wdma_base : 0;
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5496  			mtk_wed_add_hw(np, eth, eth->base + wdma_base,
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5497  				       wdma_phy, i);
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5498  		}
804775dfc2885e Felix Fietkau      2022-04-05  5499  	}
804775dfc2885e Felix Fietkau      2022-04-05  5500  
13ed4ce931c53f Frank Wunderlich   2023-12-21  5501  	for (i = 0; i < MTK_PDMA_IRQ_NUM; i++)
13ed4ce931c53f Frank Wunderlich   2023-12-21  5502  		eth->irq_pdma[i] = platform_get_irq(pdev, i);
13ed4ce931c53f Frank Wunderlich   2023-12-21  5503  
13ed4ce931c53f Frank Wunderlich   2023-12-21  5504  	for (i = 0; i < MTK_FE_IRQ_NUM; i++) {
889bcbdeee5737 Bjørn Mork         2019-01-30  5505  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
13ed4ce931c53f Frank Wunderlich   2023-12-21  5506  			eth->irq_fe[i] = eth->irq_fe[0];
889bcbdeee5737 Bjørn Mork         2019-01-30  5507  		else
13ed4ce931c53f Frank Wunderlich   2023-12-21  5508  			eth->irq_fe[i] = platform_get_irq(pdev, MTK_PDMA_IRQ_NUM + i);
13ed4ce931c53f Frank Wunderlich   2023-12-21  5509  		if (eth->irq_fe[i] < 0) {
8067302973a195 John Crispin       2016-06-29  5510  			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
b3d0d98179d62f Yang Yingliang     2022-10-17  5511  			err = -ENXIO;
b3d0d98179d62f Yang Yingliang     2022-10-17  5512  			goto err_wed_exit;
656e705243fd0c John Crispin       2016-03-08  5513  		}
8067302973a195 John Crispin       2016-06-29  5514  	}
549e5495467ac2 Sean Wang          2016-09-01  5515  	for (i = 0; i < ARRAY_SIZE(eth->clks); i++) {
549e5495467ac2 Sean Wang          2016-09-01  5516  		eth->clks[i] = devm_clk_get(eth->dev,
549e5495467ac2 Sean Wang          2016-09-01  5517  					    mtk_clks_source_name[i]);
549e5495467ac2 Sean Wang          2016-09-01  5518  		if (IS_ERR(eth->clks[i])) {
b3d0d98179d62f Yang Yingliang     2022-10-17  5519  			if (PTR_ERR(eth->clks[i]) == -EPROBE_DEFER) {
b3d0d98179d62f Yang Yingliang     2022-10-17  5520  				err = -EPROBE_DEFER;
b3d0d98179d62f Yang Yingliang     2022-10-17  5521  				goto err_wed_exit;
b3d0d98179d62f Yang Yingliang     2022-10-17  5522  			}
2ec50f574e8198 Sean Wang          2017-07-31  5523  			if (eth->soc->required_clks & BIT(i)) {
2ec50f574e8198 Sean Wang          2017-07-31  5524  				dev_err(&pdev->dev, "clock %s not found\n",
2ec50f574e8198 Sean Wang          2017-07-31  5525  					mtk_clks_source_name[i]);
b3d0d98179d62f Yang Yingliang     2022-10-17  5526  				err = -EINVAL;
b3d0d98179d62f Yang Yingliang     2022-10-17  5527  				goto err_wed_exit;
2ec50f574e8198 Sean Wang          2017-07-31  5528  			}
2ec50f574e8198 Sean Wang          2017-07-31  5529  			eth->clks[i] = NULL;
549e5495467ac2 Sean Wang          2016-09-01  5530  		}
549e5495467ac2 Sean Wang          2016-09-01  5531  	}
656e705243fd0c John Crispin       2016-03-08  5532  
656e705243fd0c John Crispin       2016-03-08  5533  	eth->msg_enable = netif_msg_init(mtk_msg_level, MTK_DEFAULT_MSG_ENABLE);
7c78b4ad9bbdbe John Crispin       2016-04-08  5534  	INIT_WORK(&eth->pending_work, mtk_pending_work);
656e705243fd0c John Crispin       2016-03-08  5535  
a9724b9c477f63 Lorenzo Bianconi   2023-01-14  5536  	err = mtk_hw_init(eth, false);
656e705243fd0c John Crispin       2016-03-08  5537  	if (err)
b3d0d98179d62f Yang Yingliang     2022-10-17  5538  		goto err_wed_exit;
656e705243fd0c John Crispin       2016-03-08  5539  
2d14ba7228b0c2 Sean Wang          2018-07-28  5540  	eth->hwlro = MTK_HAS_CAPS(eth->soc->caps, MTK_HWLRO);
983e1a6c95abf8 Nelson Chang       2016-10-06  5541  
656e705243fd0c John Crispin       2016-03-08  5542  	for_each_child_of_node(pdev->dev.of_node, mac_np) {
656e705243fd0c John Crispin       2016-03-08  5543  		if (!of_device_is_compatible(mac_np,
656e705243fd0c John Crispin       2016-03-08  5544  					     "mediatek,eth-mac"))
656e705243fd0c John Crispin       2016-03-08  5545  			continue;
656e705243fd0c John Crispin       2016-03-08  5546  
656e705243fd0c John Crispin       2016-03-08  5547  		if (!of_device_is_available(mac_np))
656e705243fd0c John Crispin       2016-03-08  5548  			continue;
656e705243fd0c John Crispin       2016-03-08  5549  
656e705243fd0c John Crispin       2016-03-08  5550  		err = mtk_add_mac(eth, mac_np);
cf36dd2f7793e8 Nishka Dasgupta    2019-07-16  5551  		if (err) {
cf36dd2f7793e8 Nishka Dasgupta    2019-07-16  5552  			of_node_put(mac_np);
8a8a9e89f801ce Sean Wang          2016-09-14  5553  			goto err_deinit_hw;
656e705243fd0c John Crispin       2016-03-08  5554  		}
cf36dd2f7793e8 Nishka Dasgupta    2019-07-16  5555  	}
656e705243fd0c John Crispin       2016-03-08  5556  
2eddc00627f944 Daniel Golle       2023-12-12  5557  	for (i = 0; i < MTK_MAX_DEVS; i++) {
2eddc00627f944 Daniel Golle       2023-12-12  5558  		if (!eth->netdev[i])
2eddc00627f944 Daniel Golle       2023-12-12  5559  			continue;
2eddc00627f944 Daniel Golle       2023-12-12  5560  
2eddc00627f944 Daniel Golle       2023-12-12  5561  		err = mtk_mac_assign_address(eth, i, true);
2eddc00627f944 Daniel Golle       2023-12-12  5562  		if (err)
2eddc00627f944 Daniel Golle       2023-12-12  5563  			goto err_deinit_hw;
2eddc00627f944 Daniel Golle       2023-12-12  5564  	}
2eddc00627f944 Daniel Golle       2023-12-12  5565  
2eddc00627f944 Daniel Golle       2023-12-12  5566  	for (i = 0; i < MTK_MAX_DEVS; i++) {
2eddc00627f944 Daniel Golle       2023-12-12  5567  		if (!eth->netdev[i])
2eddc00627f944 Daniel Golle       2023-12-12  5568  			continue;
2eddc00627f944 Daniel Golle       2023-12-12  5569  
2eddc00627f944 Daniel Golle       2023-12-12  5570  		err = mtk_mac_assign_address(eth, i, false);
2eddc00627f944 Daniel Golle       2023-12-12  5571  		if (err)
2eddc00627f944 Daniel Golle       2023-12-12  5572  			goto err_deinit_hw;
2eddc00627f944 Daniel Golle       2023-12-12  5573  	}
2eddc00627f944 Daniel Golle       2023-12-12  5574  
13ed4ce931c53f Frank Wunderlich   2023-12-21  5575  	err = mtk_napi_init(eth);
13ed4ce931c53f Frank Wunderlich   2023-12-21  5576  	if (err)
13ed4ce931c53f Frank Wunderlich   2023-12-21  5577  		goto err_free_dev;
13ed4ce931c53f Frank Wunderlich   2023-12-21  5578  
889bcbdeee5737 Bjørn Mork         2019-01-30  5579  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
13ed4ce931c53f Frank Wunderlich   2023-12-21  5580  		err = devm_request_irq(eth->dev, eth->irq_fe[0],
889bcbdeee5737 Bjørn Mork         2019-01-30  5581  				       mtk_handle_irq, 0,
889bcbdeee5737 Bjørn Mork         2019-01-30  5582  				       dev_name(eth->dev), eth);
889bcbdeee5737 Bjørn Mork         2019-01-30  5583  	} else {
13ed4ce931c53f Frank Wunderlich   2023-12-21  5584  		err = devm_request_irq(eth->dev, eth->irq_fe[1],
889bcbdeee5737 Bjørn Mork         2019-01-30  5585  				       mtk_handle_irq_tx, 0,
85574dbf9d12b3 Sean Wang          2016-09-14  5586  				       dev_name(eth->dev), eth);
85574dbf9d12b3 Sean Wang          2016-09-14  5587  		if (err)
85574dbf9d12b3 Sean Wang          2016-09-14  5588  			goto err_free_dev;
85574dbf9d12b3 Sean Wang          2016-09-14  5589  
13ed4ce931c53f Frank Wunderlich   2023-12-21  5590  		err = devm_request_irq(eth->dev, eth->irq_fe[2],
13ed4ce931c53f Frank Wunderlich   2023-12-21  5591  				       mtk_handle_fe_irq, 0,
85574dbf9d12b3 Sean Wang          2016-09-14  5592  				       dev_name(eth->dev), eth);
13ed4ce931c53f Frank Wunderlich   2023-12-21  5593  		if (err)
13ed4ce931c53f Frank Wunderlich   2023-12-21  5594  			goto err_free_dev;
13ed4ce931c53f Frank Wunderlich   2023-12-21  5595  
13ed4ce931c53f Frank Wunderlich   2023-12-21  5596  		err = devm_request_irq(eth->dev, eth->irq_pdma[0],
13ed4ce931c53f Frank Wunderlich   2023-12-21  5597  				       mtk_handle_irq_rx, IRQF_SHARED,
13ed4ce931c53f Frank Wunderlich   2023-12-21  5598  				       dev_name(eth->dev), &eth->rx_napi[0]);
13ed4ce931c53f Frank Wunderlich   2023-12-21  5599  		if (err)
13ed4ce931c53f Frank Wunderlich   2023-12-21  5600  			goto err_free_dev;
13ed4ce931c53f Frank Wunderlich   2023-12-21  5601  
13ed4ce931c53f Frank Wunderlich   2023-12-21  5602  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSS)) {
13ed4ce931c53f Frank Wunderlich   2023-12-21  5603  			for (i = 0; i < MTK_RX_RSS_NUM; i++) {
13ed4ce931c53f Frank Wunderlich   2023-12-21  5604  				err = devm_request_irq(eth->dev,
13ed4ce931c53f Frank Wunderlich   2023-12-21  5605  						       eth->irq_pdma[MTK_RSS_RING(i)],
13ed4ce931c53f Frank Wunderlich   2023-12-21  5606  						       mtk_handle_irq_rx, IRQF_SHARED,
13ed4ce931c53f Frank Wunderlich   2023-12-21  5607  						       dev_name(eth->dev),
13ed4ce931c53f Frank Wunderlich   2023-12-21  5608  						       &eth->rx_napi[MTK_RSS_RING(i)]);
13ed4ce931c53f Frank Wunderlich   2023-12-21  5609  				if (err)
13ed4ce931c53f Frank Wunderlich   2023-12-21  5610  					goto err_free_dev;
13ed4ce931c53f Frank Wunderlich   2023-12-21  5611  			}
13ed4ce931c53f Frank Wunderlich   2023-12-21  5612  		}
13ed4ce931c53f Frank Wunderlich   2023-12-21  5613  
13ed4ce931c53f Frank Wunderlich   2023-12-21  5614  		if (eth->hwlro) {
13ed4ce931c53f Frank Wunderlich   2023-12-21  5615  			i = mtk_is_netsys_v2_or_greater(eth) ? 0 : 1;
13ed4ce931c53f Frank Wunderlich   2023-12-21  5616  			for (; i < MTK_HW_LRO_RING_NUM; i++) {
13ed4ce931c53f Frank Wunderlich   2023-12-21  5617  				err = devm_request_irq(eth->dev,
13ed4ce931c53f Frank Wunderlich   2023-12-21  5618  						       eth->irq_pdma[i],
13ed4ce931c53f Frank Wunderlich   2023-12-21  5619  						       mtk_handle_irq_rx, IRQF_SHARED,
13ed4ce931c53f Frank Wunderlich   2023-12-21  5620  						       dev_name(eth->dev),
13ed4ce931c53f Frank Wunderlich   2023-12-21  5621  						       &eth->rx_napi[MTK_HW_LRO_RING(i)]);
13ed4ce931c53f Frank Wunderlich   2023-12-21  5622  				if (err)
13ed4ce931c53f Frank Wunderlich   2023-12-21  5623  					goto err_free_dev;
13ed4ce931c53f Frank Wunderlich   2023-12-21  5624  			}
13ed4ce931c53f Frank Wunderlich   2023-12-21  5625  		}
889bcbdeee5737 Bjørn Mork         2019-01-30  5626  	}
85574dbf9d12b3 Sean Wang          2016-09-14  5627  	if (err)
85574dbf9d12b3 Sean Wang          2016-09-14  5628  		goto err_free_dev;
85574dbf9d12b3 Sean Wang          2016-09-14  5629  
296c9120752bab Stefan Roese       2019-08-16  5630  	/* No MT7628/88 support yet */
296c9120752bab Stefan Roese       2019-08-16  5631  	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
85574dbf9d12b3 Sean Wang          2016-09-14  5632  		err = mtk_mdio_init(eth);
85574dbf9d12b3 Sean Wang          2016-09-14  5633  		if (err)
85574dbf9d12b3 Sean Wang          2016-09-14  5634  			goto err_free_dev;
296c9120752bab Stefan Roese       2019-08-16  5635  	}
85574dbf9d12b3 Sean Wang          2016-09-14  5636  
ba37b7caf1ed23 Felix Fietkau      2021-03-24  5637  	if (eth->soc->offload_version) {
87d2a639036d46 Elad Yifee         2024-01-30  5638  		u8 ppe_num = mtk_get_ppe_num(eth);
329bce5139cfb0 Lorenzo Bianconi   2022-09-20  5639  
87d2a639036d46 Elad Yifee         2024-01-30  5640  		ppe_num = min_t(u8, ARRAY_SIZE(eth->ppe), ppe_num);
87d2a639036d46 Elad Yifee         2024-01-30  5641  		for (i = 0; i < ppe_num; i++) {
87d2a639036d46 Elad Yifee         2024-01-30  5642  			u32 ppe_addr = eth->soc->reg_map->ppe_base;
4ff1a3fca766aa Lorenzo Bianconi   2022-09-20  5643  
87d2a639036d46 Elad Yifee         2024-01-30  5644  			ppe_addr += (i == 2 ? 0xc00 : i * 0x400);
3fbe4d8c0e53e4 Daniel Golle       2023-03-19  5645  			eth->ppe[i] = mtk_ppe_init(eth, eth->base + ppe_addr, i);
3fbe4d8c0e53e4 Daniel Golle       2023-03-19  5646  
4ff1a3fca766aa Lorenzo Bianconi   2022-09-20  5647  			if (!eth->ppe[i]) {
1ccc723b5829d6 Felix Fietkau      2022-04-05  5648  				err = -ENOMEM;
603ea5e7ffa73c Yan Cangang        2022-11-20  5649  				goto err_deinit_ppe;
1ccc723b5829d6 Felix Fietkau      2022-04-05  5650  			}
87d2a639036d46 Elad Yifee         2024-01-30  5651  			err = mtk_eth_offload_init(eth, i);
502e84e2382d92 Felix Fietkau      2021-03-24  5652  
502e84e2382d92 Felix Fietkau      2021-03-24  5653  			if (err)
603ea5e7ffa73c Yan Cangang        2022-11-20  5654  				goto err_deinit_ppe;
ba37b7caf1ed23 Felix Fietkau      2021-03-24  5655  		}
87d2a639036d46 Elad Yifee         2024-01-30  5656  	}
ba37b7caf1ed23 Felix Fietkau      2021-03-24  5657  
85574dbf9d12b3 Sean Wang          2016-09-14  5658  	for (i = 0; i < MTK_MAX_DEVS; i++) {
85574dbf9d12b3 Sean Wang          2016-09-14  5659  		if (!eth->netdev[i])
85574dbf9d12b3 Sean Wang          2016-09-14  5660  			continue;
85574dbf9d12b3 Sean Wang          2016-09-14  5661  
85574dbf9d12b3 Sean Wang          2016-09-14  5662  		err = register_netdev(eth->netdev[i]);
85574dbf9d12b3 Sean Wang          2016-09-14  5663  		if (err) {
85574dbf9d12b3 Sean Wang          2016-09-14  5664  			dev_err(eth->dev, "error bringing up device\n");
603ea5e7ffa73c Yan Cangang        2022-11-20  5665  			goto err_deinit_ppe;
85574dbf9d12b3 Sean Wang          2016-09-14  5666  		} else
85574dbf9d12b3 Sean Wang          2016-09-14  5667  			netif_info(eth, probe, eth->netdev[i],
85574dbf9d12b3 Sean Wang          2016-09-14  5668  				   "mediatek frame engine at 0x%08lx, irq %d\n",
13ed4ce931c53f Frank Wunderlich   2023-12-21  5669  				   eth->netdev[i]->base_addr, eth->irq_fe[0]);
85574dbf9d12b3 Sean Wang          2016-09-14  5670  	}
85574dbf9d12b3 Sean Wang          2016-09-14  5671  
656e705243fd0c John Crispin       2016-03-08  5672  	/* we run 2 devices on the same DMA ring so we need a dummy device
656e705243fd0c John Crispin       2016-03-08  5673  	 * for NAPI to work
656e705243fd0c John Crispin       2016-03-08  5674  	 */
13ed4ce931c53f Frank Wunderlich   2023-12-21  5675  	init_dummy_netdev(&eth->dummy_dev);
13ed4ce931c53f Frank Wunderlich   2023-12-21  5676  	netif_napi_add(&eth->dummy_dev, &eth->tx_napi, mtk_napi_tx);
13ed4ce931c53f Frank Wunderlich   2023-12-21  5677  	netif_napi_add(&eth->dummy_dev, &eth->rx_napi[0].napi, mtk_napi_rx);
13ed4ce931c53f Frank Wunderlich   2023-12-21  5678  
13ed4ce931c53f Frank Wunderlich   2023-12-21  5679  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSS)) {
13ed4ce931c53f Frank Wunderlich   2023-12-21  5680  		for (i = 0; i < MTK_RX_RSS_NUM; i++)
13ed4ce931c53f Frank Wunderlich   2023-12-21  5681  			netif_napi_add(&eth->dummy_dev, &eth->rx_napi[MTK_RSS_RING(i)].napi,
13ed4ce931c53f Frank Wunderlich   2023-12-21  5682  				       mtk_napi_rx);
13ed4ce931c53f Frank Wunderlich   2023-12-21  5683  	}
13ed4ce931c53f Frank Wunderlich   2023-12-21  5684  
13ed4ce931c53f Frank Wunderlich   2023-12-21  5685  	if (eth->hwlro) {
13ed4ce931c53f Frank Wunderlich   2023-12-21  5686  		for (i = 0; i < MTK_HW_LRO_RING_NUM; i++) {
13ed4ce931c53f Frank Wunderlich   2023-12-21  5687  			netif_napi_add(&eth->dummy_dev, &eth->rx_napi[MTK_HW_LRO_RING(i)].napi,
13ed4ce931c53f Frank Wunderlich   2023-12-21  5688  				       mtk_napi_rx);
13ed4ce931c53f Frank Wunderlich   2023-12-21  5689  		}
b209bd6d0bffb8 Breno Leitao       2024-04-22  5690  	}
656e705243fd0c John Crispin       2016-03-08  5691  
656e705243fd0c John Crispin       2016-03-08  5692  	platform_set_drvdata(pdev, eth);
93b2591ad0d0c1 Lorenzo Bianconi   2023-01-14  5693  	schedule_delayed_work(&eth->reset.monitor_work,
93b2591ad0d0c1 Lorenzo Bianconi   2023-01-14  5694  			      MTK_DMA_MONITOR_TIMEOUT);
656e705243fd0c John Crispin       2016-03-08  5695  
656e705243fd0c John Crispin       2016-03-08  5696  	return 0;
656e705243fd0c John Crispin       2016-03-08  5697  
b209bd6d0bffb8 Breno Leitao       2024-04-22 @5698  err_unreg_netdev:
b209bd6d0bffb8 Breno Leitao       2024-04-22  5699  	mtk_unreg_dev(eth);
603ea5e7ffa73c Yan Cangang        2022-11-20  5700  err_deinit_ppe:
603ea5e7ffa73c Yan Cangang        2022-11-20  5701  	mtk_ppe_deinit(eth);
8a8a9e89f801ce Sean Wang          2016-09-14  5702  	mtk_mdio_cleanup(eth);
656e705243fd0c John Crispin       2016-03-08  5703  err_free_dev:
8a8a9e89f801ce Sean Wang          2016-09-14  5704  	mtk_free_dev(eth);
8a8a9e89f801ce Sean Wang          2016-09-14  5705  err_deinit_hw:
8a8a9e89f801ce Sean Wang          2016-09-14  5706  	mtk_hw_deinit(eth);
b3d0d98179d62f Yang Yingliang     2022-10-17  5707  err_wed_exit:
b3d0d98179d62f Yang Yingliang     2022-10-17  5708  	mtk_wed_exit();
2a3ec7ae313310 Daniel Golle       2023-03-19  5709  err_destroy_sgmii:
2a3ec7ae313310 Daniel Golle       2023-03-19  5710  	mtk_sgmii_destroy(eth);
8a8a9e89f801ce Sean Wang          2016-09-14  5711  
656e705243fd0c John Crispin       2016-03-08  5712  	return err;
656e705243fd0c John Crispin       2016-03-08  5713  }
656e705243fd0c John Crispin       2016-03-08  5714  

:::::: The code at line 5698 was first introduced by commit
:::::: b209bd6d0bffb8991aba568e2d9a892c86a1a43c net: mediatek: mtk_eth_sock: allocate dummy net_device dynamically

:::::: TO: Breno Leitao <leitao@debian.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
