Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D78811712
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 01:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749518267; cv=none; b=gA5X5E2UhUH/WbVste90Ms/Dwkd10ZhVhLYr1EYLVeTDcOU4mrSkAnhClcrT4lPDtzTacP8SYjmdT/HEtL2DM+gtk4awKGCZk1k4LU9rHKHvu4elqYBxdeFxdO7vavUxbUjDX0is5YE/f1P+Yp3WSam5b+5+SglA0uuEKEUYigg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749518267; c=relaxed/simple;
	bh=8Qw6/Irlyn3LyKpzNr/hsiPsDG0YPtuAuT/dSTSBIJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IgaKhJd//1m4pbuO0tbcNfg91b7CYZZ4ZVhxbF8YZygpgKpzG6/vcCymD8JDHJSa7VscERTgXrUVWgS7qf6VKbV1n54PdfMYjkoGmcgdkWivaZDKYtibrz3yJkpG2A3EIY0i0YUWAaqjZCKLB5P6cp56S3pvTzAl3ouXIfcXm3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HL4eaIFz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HL4eaIFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749518266; x=1781054266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Qw6/Irlyn3LyKpzNr/hsiPsDG0YPtuAuT/dSTSBIJA=;
  b=HL4eaIFzvIQw1sLLpWu1iu8FVIhtlczYMd1hIm4/fd8IsH5+SImizq2U
   0Y6s6JUP49ChXrrO3fvXTDPLBbDkBcx/ArUeXns6agVlFMttbahcxk5Gq
   +PDHmllKa67JyKx98GKHE7a1PxcEF/0/X6fIMkfydIHGajS9PYv/CnjXr
   Rrg/CO3nTW39uxTcHyy+qLZJFRRLL27U38KCziZ9LTj33a4YcwEdKfGKA
   Hs5A970TGt2RwTTE6SGD9QOR0D92Vk76aNqeCVsICLKpNOPfnnnmEG6W4
   D38H3iPa95u0gGI+EcgQ0kpJUu05BxTwzJfaJrhknvBOGFxn8Wld7Oj20
   A==;
X-CSE-ConnectionGUID: 2GFlzM/kRNSKPGWE/NhXXQ==
X-CSE-MsgGUID: Ff8m9tXwSiqN4BBZHX75uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55277026"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="55277026"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 18:17:44 -0700
X-CSE-ConnectionGUID: uim/1PxFRk6J44VczWG38g==
X-CSE-MsgGUID: nutxmsesRLOUsd4idq6D6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="150519627"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jun 2025 18:17:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOncS-0007bp-0i;
	Tue, 10 Jun 2025 01:17:40 +0000
Date: Tue, 10 Jun 2025 09:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 25/32]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5428:9: error: call to
 undeclared function 'mtk_mac_assign_address'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202506100939.Jov9cLTL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   c421f8c367dab8230d8a4762806f36a2b8b974d3
commit: b0daaa29343b9b7621fab08457864f42d8a7a871 [25/32] net: ethernet: mtk_eth_soc: add rss support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250610/202506100939.Jov9cLTL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100939.Jov9cLTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100939.Jov9cLTL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c:4942:15: error: incompatible function pointer types initializing 'int (*)(struct net_device *, struct ethtool_rxfh_param *)' with an expression of type 'int (struct net_device *, u32 *, u8 *, u8 *)' (aka 'int (struct net_device *, unsigned int *, unsigned char *, unsigned char *)') [-Wincompatible-function-pointer-types]
    4942 |         .get_rxfh               = mtk_get_rxfh,
         |                                   ^~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:4943:15: error: incompatible function pointer types initializing 'int (*)(struct net_device *, struct ethtool_rxfh_param *, struct netlink_ext_ack *)' with an expression of type 'int (struct net_device *, const u32 *, const u8 *, const u8)' (aka 'int (struct net_device *, const unsigned int *, const unsigned char *, const unsigned char)') [-Wincompatible-function-pointer-types]
    4943 |         .set_rxfh               = mtk_set_rxfh,
         |                                   ^~~~~~~~~~~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5428:9: error: call to undeclared function 'mtk_mac_assign_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5428 |                 err = mtk_mac_assign_address(eth, i, true);
         |                       ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5437:9: error: call to undeclared function 'mtk_mac_assign_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5437 |                 err = mtk_mac_assign_address(eth, i, false);
         |                       ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5797:10: error: use of undeclared identifier 'MTK_GMAC2_USXGMII'
    5797 |         .caps = MT7988_CAPS,
         |                 ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1180:47: note: expanded from macro 'MT7988_CAPS'
    1180 |                       MTK_GMAC2_2P5GPHY | MTK_GMAC2_SGMII | MTK_GMAC2_USXGMII | \
         |                                                             ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5797:10: error: use of undeclared identifier 'MTK_GMAC3_SGMII'
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1181:9: note: expanded from macro 'MT7988_CAPS'
    1181 |                       MTK_GMAC3_SGMII | MTK_GMAC3_USXGMII | \
         |                       ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5797:10: error: use of undeclared identifier 'MTK_GMAC3_USXGMII'
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1181:27: note: expanded from macro 'MT7988_CAPS'
    1181 |                       MTK_GMAC3_SGMII | MTK_GMAC3_USXGMII | \
         |                                         ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5797:10: error: use of undeclared identifier 'MTK_MUX_GMAC123_TO_GEPHY_SGMII'
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1182:9: note: expanded from macro 'MT7988_CAPS'
    1182 |                       MTK_MUX_GMAC123_TO_GEPHY_SGMII | \
         |                       ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5797:10: error: use of undeclared identifier 'MTK_MUX_GMAC123_TO_USXGMII'
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1183:9: note: expanded from macro 'MT7988_CAPS'
    1183 |                       MTK_MUX_GMAC123_TO_USXGMII | MTK_MUX_GMAC2_TO_2P5GPHY | \
         |                       ^
   9 errors generated.


vim +/mtk_mac_assign_address +5428 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  5217	
  5218	static int mtk_probe(struct platform_device *pdev)
  5219	{
  5220		struct resource *res = NULL, *res_sram;
  5221		struct device_node *mac_np;
  5222		struct mtk_eth *eth;
  5223		int err, i;
  5224	
  5225		eth = devm_kzalloc(&pdev->dev, sizeof(*eth), GFP_KERNEL);
  5226		if (!eth)
  5227			return -ENOMEM;
  5228	
  5229		eth->soc = of_device_get_match_data(&pdev->dev);
  5230	
  5231		eth->dev = &pdev->dev;
  5232		eth->dma_dev = &pdev->dev;
  5233		eth->base = devm_platform_ioremap_resource(pdev, 0);
  5234		if (IS_ERR(eth->base))
  5235			return PTR_ERR(eth->base);
  5236	
  5237		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
  5238			eth->ip_align = NET_IP_ALIGN;
  5239	
  5240		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
  5241			/* SRAM is actual memory and supports transparent access just like DRAM.
  5242			 * Hence we don't require __iomem being set and don't need to use accessor
  5243			 * functions to read from or write to SRAM.
  5244			 */
  5245			if (mtk_is_netsys_v3_or_greater(eth)) {
  5246				eth->sram_base = (void __force *)devm_platform_ioremap_resource(pdev, 1);
  5247				if (IS_ERR(eth->sram_base))
  5248					return PTR_ERR(eth->sram_base);
  5249			} else {
  5250				eth->sram_base = (void __force *)eth->base + MTK_ETH_SRAM_OFFSET;
  5251			}
  5252		}
  5253	
  5254		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
  5255			err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(36));
  5256			if (!err)
  5257				err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
  5258	
  5259			if (err) {
  5260				dev_err(&pdev->dev, "Wrong DMA config\n");
  5261				return -EINVAL;
  5262			}
  5263		}
  5264	
  5265		spin_lock_init(&eth->page_lock);
  5266		spin_lock_init(&eth->tx_irq_lock);
  5267		spin_lock_init(&eth->rx_irq_lock);
  5268		spin_lock_init(&eth->dim_lock);
  5269	
  5270		eth->rx_dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
  5271		INIT_WORK(&eth->rx_dim.work, mtk_dim_rx);
  5272		INIT_DELAYED_WORK(&eth->reset.monitor_work, mtk_hw_reset_monitor_work);
  5273	
  5274		eth->tx_dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
  5275		INIT_WORK(&eth->tx_dim.work, mtk_dim_tx);
  5276	
  5277		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
  5278			eth->ethsys = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5279								      "mediatek,ethsys");
  5280			if (IS_ERR(eth->ethsys)) {
  5281				dev_err(&pdev->dev, "no ethsys regmap found\n");
  5282				return PTR_ERR(eth->ethsys);
  5283			}
  5284		}
  5285	
  5286		if (MTK_HAS_CAPS(eth->soc->caps, MTK_INFRA)) {
  5287			eth->infra = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5288								     "mediatek,infracfg");
  5289			if (IS_ERR(eth->infra)) {
  5290				dev_err(&pdev->dev, "no infracfg regmap found\n");
  5291				return PTR_ERR(eth->infra);
  5292			}
  5293		}
  5294	
  5295		if (of_dma_is_coherent(pdev->dev.of_node)) {
  5296			struct regmap *cci;
  5297	
  5298			cci = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5299							      "cci-control-port");
  5300			/* enable CPU/bus coherency */
  5301			if (!IS_ERR(cci))
  5302				regmap_write(cci, 0, 3);
  5303		}
  5304	
  5305		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SGMII)) {
  5306			err = mtk_sgmii_init(eth);
  5307	
  5308			if (err)
  5309				return err;
  5310		}
  5311	
  5312		if (eth->soc->required_pctl) {
  5313			eth->pctl = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5314								    "mediatek,pctl");
  5315			if (IS_ERR(eth->pctl)) {
  5316				dev_err(&pdev->dev, "no pctl regmap found\n");
  5317				err = PTR_ERR(eth->pctl);
  5318				goto err_destroy_sgmii;
  5319			}
  5320		}
  5321	
  5322		if (mtk_is_netsys_v2_or_greater(eth)) {
  5323			res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  5324			if (!res) {
  5325				err = -EINVAL;
  5326				goto err_destroy_sgmii;
  5327			}
  5328			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
  5329				if (mtk_is_netsys_v3_or_greater(eth)) {
  5330					res_sram = platform_get_resource(pdev, IORESOURCE_MEM, 1);
  5331					if (!res_sram) {
  5332						err = -EINVAL;
  5333						goto err_destroy_sgmii;
  5334					}
  5335					eth->phy_scratch_ring = res_sram->start;
  5336				} else {
  5337					eth->phy_scratch_ring = res->start + MTK_ETH_SRAM_OFFSET;
  5338				}
  5339			}
  5340		}
  5341	
  5342		if (eth->soc->offload_version) {
  5343			for (i = 0;; i++) {
  5344				struct device_node *np;
  5345				phys_addr_t wdma_phy;
  5346				u32 wdma_base;
  5347	
  5348				if (i >= ARRAY_SIZE(eth->soc->reg_map->wdma_base))
  5349					break;
  5350	
  5351				np = of_parse_phandle(pdev->dev.of_node,
  5352						      "mediatek,wed", i);
  5353				if (!np)
  5354					break;
  5355	
  5356				wdma_base = eth->soc->reg_map->wdma_base[i];
  5357				wdma_phy = res ? res->start + wdma_base : 0;
  5358				mtk_wed_add_hw(np, eth, eth->base + wdma_base,
  5359					       wdma_phy, i);
  5360			}
  5361		}
  5362	
  5363		if (MTK_HAS_CAPS(eth->soc->caps, MTK_PDMA_INT)) {
  5364			for (i = 0; i < MTK_PDMA_IRQ_NUM; i++)
  5365				eth->irq_pdma[i] = platform_get_irq(pdev, i);
  5366		}
  5367	
  5368		for (i = 0; i < MTK_FE_IRQ_NUM; i++) {
  5369			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
  5370				eth->irq_fe[i] = eth->irq_fe[0];
  5371			else if (MTK_HAS_CAPS(eth->soc->caps, MTK_PDMA_INT))
  5372				eth->irq_fe[i] =
  5373					platform_get_irq(pdev, MTK_PDMA_IRQ_NUM + i);
  5374			else
  5375				eth->irq_fe[i] = platform_get_irq(pdev, i);
  5376			if (eth->irq_fe[i] < 0) {
  5377				dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
  5378				err = -ENXIO;
  5379				goto err_wed_exit;
  5380			}
  5381		}
  5382		for (i = 0; i < ARRAY_SIZE(eth->clks); i++) {
  5383			eth->clks[i] = devm_clk_get(eth->dev,
  5384						    mtk_clks_source_name[i]);
  5385			if (IS_ERR(eth->clks[i])) {
  5386				if (PTR_ERR(eth->clks[i]) == -EPROBE_DEFER) {
  5387					err = -EPROBE_DEFER;
  5388					goto err_wed_exit;
  5389				}
  5390				if (eth->soc->required_clks & BIT(i)) {
  5391					dev_err(&pdev->dev, "clock %s not found\n",
  5392						mtk_clks_source_name[i]);
  5393					err = -EINVAL;
  5394					goto err_wed_exit;
  5395				}
  5396				eth->clks[i] = NULL;
  5397			}
  5398		}
  5399	
  5400		eth->msg_enable = netif_msg_init(mtk_msg_level, MTK_DEFAULT_MSG_ENABLE);
  5401		INIT_WORK(&eth->pending_work, mtk_pending_work);
  5402	
  5403		err = mtk_hw_init(eth, false);
  5404		if (err)
  5405			goto err_wed_exit;
  5406	
  5407		eth->hwlro = MTK_HAS_CAPS(eth->soc->caps, MTK_HWLRO);
  5408	
  5409		for_each_child_of_node(pdev->dev.of_node, mac_np) {
  5410			if (!of_device_is_compatible(mac_np,
  5411						     "mediatek,eth-mac"))
  5412				continue;
  5413	
  5414			if (!of_device_is_available(mac_np))
  5415				continue;
  5416	
  5417			err = mtk_add_mac(eth, mac_np);
  5418			if (err) {
  5419				of_node_put(mac_np);
  5420				goto err_deinit_hw;
  5421			}
  5422		}
  5423	
  5424		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5425			if (!eth->netdev[i])
  5426				continue;
  5427	
> 5428			err = mtk_mac_assign_address(eth, i, true);
  5429			if (err)
  5430				goto err_deinit_hw;
  5431		}
  5432	
  5433		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5434			if (!eth->netdev[i])
  5435				continue;
  5436	
> 5437			err = mtk_mac_assign_address(eth, i, false);
  5438			if (err)
  5439				goto err_deinit_hw;
  5440		}
  5441	
  5442		err = mtk_napi_init(eth);
  5443		if (err)
  5444			goto err_free_dev;
  5445	
  5446		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
  5447			err = devm_request_irq(eth->dev, eth->irq_fe[0],
  5448					       mtk_handle_irq, 0,
  5449					       dev_name(eth->dev), eth);
  5450		} else {
  5451			err = devm_request_irq(eth->dev, eth->irq_fe[1],
  5452					       mtk_handle_irq_tx, 0,
  5453					       dev_name(eth->dev), eth);
  5454			if (err)
  5455				goto err_free_dev;
  5456	
  5457			if (MTK_HAS_CAPS(eth->soc->caps, MTK_PDMA_INT)) {
  5458				err = devm_request_irq(eth->dev, eth->irq_pdma[0],
  5459						       mtk_handle_irq_rx, IRQF_SHARED,
  5460						       dev_name(eth->dev), &eth->rx_napi[0]);
  5461				if (err)
  5462					goto err_free_dev;
  5463	
  5464				if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSS)) {
  5465					for (i = 1; i < MTK_RX_RSS_NUM; i++) {
  5466						err = devm_request_irq(eth->dev,
  5467								       eth->irq_pdma[MTK_RSS_RING(i)],
  5468								       mtk_handle_irq_rx, IRQF_SHARED,
  5469								       dev_name(eth->dev),
  5470								       &eth->rx_napi[MTK_RSS_RING(i)]);
  5471						if (err)
  5472							goto err_free_dev;
  5473					}
  5474				}
  5475			} else {
  5476				err = devm_request_irq(eth->dev, eth->irq_fe[2],
  5477						       mtk_handle_irq_rx, 0,
  5478						       dev_name(eth->dev), &eth->rx_napi[0]);
  5479				if (err)
  5480					goto err_free_dev;
  5481			}
  5482		}
  5483	
  5484		/* No MT7628/88 support yet */
  5485		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
  5486			err = mtk_mdio_init(eth);
  5487			if (err)
  5488				goto err_free_dev;
  5489		}
  5490	
  5491		if (eth->soc->offload_version) {
  5492			u8 ppe_num = eth->soc->ppe_num;
  5493	
  5494			ppe_num = min_t(u8, ARRAY_SIZE(eth->ppe), ppe_num);
  5495			for (i = 0; i < ppe_num; i++) {
  5496				u32 ppe_addr = eth->soc->reg_map->ppe_base;
  5497	
  5498				ppe_addr += (i == 2 ? 0xc00 : i * 0x400);
  5499				eth->ppe[i] = mtk_ppe_init(eth, eth->base + ppe_addr, i);
  5500	
  5501				if (!eth->ppe[i]) {
  5502					err = -ENOMEM;
  5503					goto err_deinit_ppe;
  5504				}
  5505				err = mtk_eth_offload_init(eth, i);
  5506	
  5507				if (err)
  5508					goto err_deinit_ppe;
  5509			}
  5510		}
  5511	
  5512		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5513			if (!eth->netdev[i])
  5514				continue;
  5515	
  5516			err = register_netdev(eth->netdev[i]);
  5517			if (err) {
  5518				dev_err(eth->dev, "error bringing up device\n");
  5519				goto err_deinit_ppe;
  5520			} else
  5521				netif_info(eth, probe, eth->netdev[i],
  5522					   "mediatek frame engine at 0x%08lx, irq %d\n",
  5523					   eth->netdev[i]->base_addr, eth->irq_fe[0]);
  5524		}
  5525	
  5526		/* we run 2 devices on the same DMA ring so we need a dummy device
  5527		 * for NAPI to work
  5528		 */
  5529		eth->dummy_dev = alloc_netdev_dummy(0);
  5530		if (!eth->dummy_dev) {
  5531			err = -ENOMEM;
  5532			dev_err(eth->dev, "failed to allocated dummy device\n");
  5533			goto err_unreg_netdev;
  5534		}
  5535		netif_napi_add(eth->dummy_dev, &eth->tx_napi, mtk_napi_tx);
  5536		netif_napi_add(eth->dummy_dev, &eth->rx_napi[0].napi, mtk_napi_rx);
  5537	
  5538		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSS)) {
  5539			for (i = 1; i < MTK_RX_RSS_NUM; i++)
  5540				netif_napi_add(eth->dummy_dev, &eth->rx_napi[MTK_RSS_RING(i)].napi,
  5541					       mtk_napi_rx);
  5542		}
  5543	
  5544		platform_set_drvdata(pdev, eth);
  5545		schedule_delayed_work(&eth->reset.monitor_work,
  5546				      MTK_DMA_MONITOR_TIMEOUT);
  5547	
  5548		return 0;
  5549	
  5550	err_unreg_netdev:
  5551		mtk_unreg_dev(eth);
  5552	err_deinit_ppe:
  5553		mtk_ppe_deinit(eth);
  5554		mtk_mdio_cleanup(eth);
  5555	err_free_dev:
  5556		mtk_free_dev(eth);
  5557	err_deinit_hw:
  5558		mtk_hw_deinit(eth);
  5559	err_wed_exit:
  5560		mtk_wed_exit();
  5561	err_destroy_sgmii:
  5562		mtk_sgmii_destroy(eth);
  5563	
  5564		return err;
  5565	}
  5566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
