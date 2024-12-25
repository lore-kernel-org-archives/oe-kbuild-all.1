Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CEEDDAB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 14:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735136897; cv=none; b=lZgQaRaR7+KlgwC2/7IZyZ2JzPT+M9soXPf08ldDNGyPNon36q40Aoe9td6A7vsNbh4iORX7ZINRnlhS68lUU034MDHB7Q4cglLcnnMsPKl64nO9knlRLXmTHkvHLYWizeWJbdnE9Qu301wGi7TY1qOgG851uztw4uQk5W1roAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735136897; c=relaxed/simple;
	bh=yUMUnOGZ2+unIX/dq4wxb/AMC77QCsfNjOzkE+DpKS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lV+YuPZWoF1CHJw8m6EKBsf8XAlvQD3hHAlgz9Krr9h1lND5XThYaX9/RARzv/JBQaoGLIIqzMvj4Rz1Lsy6Rulw14b/e9U/2dG6SnGyFxnWRm8er7a9wTwlYVWGPHMDUAyHgF/6F1//JvBrztSqVpeSQYsDDKd3AD7tH8zlOkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIt2cqOB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIt2cqOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735136895; x=1766672895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yUMUnOGZ2+unIX/dq4wxb/AMC77QCsfNjOzkE+DpKS4=;
  b=iIt2cqOBfVAx4PhffIuawIACudbqFoAP1zYc0nyfiRC6Fi2ZL9YvQiH/
   dP+OfWgPNpwB/6UZUqgVvE09ctpV13j6m4W4wB3lfhM5NxfZxYAUS5gqD
   aW1eT7wuLvvRwiL3GL0hpmzPeiERxnYgrQzXMg4fFfj2g7PJ4eOkHagGa
   G2g8WQ89AJykJeKj0D+21u4YzmCSWV2V8rnpMaIrVS7bpV56J12XQ8/Vf
   Tj5ix+DPof9WhYfT7OmkT7x34ttM2wVWD7sFXrt0KSza8lDY7G0wTGnu1
   Nu3XnpXMnuuzf7g6dSFxsBEsaJGzV/Uo/RwCIMaE4bN1XiIl6gvu6dukY
   Q==;
X-CSE-ConnectionGUID: u86F1QvxQlCJIXR/tydbZQ==
X-CSE-MsgGUID: V/OLc17BQUeJI8b0vMKReg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="39362451"
X-IronPort-AV: E=Sophos;i="6.12,263,1728975600"; 
   d="scan'208";a="39362451"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 06:28:15 -0800
X-CSE-ConnectionGUID: zhVs6NgIRD6tTknPR5HN2Q==
X-CSE-MsgGUID: ZRRjfEFPSCSFOG8Leg/T2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,263,1728975600"; 
   d="scan'208";a="104572801"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Dec 2024 06:28:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQSMt-0001uc-2n;
	Wed, 25 Dec 2024 14:28:11 +0000
Date: Wed, 25 Dec 2024 22:27:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-rsslro 86/86]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5429:69: warning: more '%'
 conversions than data arguments
Message-ID: <202412260010.aw4IfdQ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-rsslro
head:   e13de966f1596328d51fddc0961797794a2d003a
commit: e13de966f1596328d51fddc0961797794a2d003a [86/86] add irq debug
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241226/202412260010.aw4IfdQ3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412260010.aw4IfdQ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260010.aw4IfdQ3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:10:
   In file included from include/linux/of_mdio.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
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
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5429:69: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
    5429 |                         dev_err(&pdev->dev, "reassign fe IRQ%d resource found: %d to 0 [%d]\n", i, eth->irq_fe[0]);
         |                                                                                         ~^
   include/linux/dev_printk.h:154:57: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ^~~
   include/linux/dev_printk.h:19:22: note: expanded from macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   include/linux/dev_printk.h:110:16: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   5 warnings generated.


vim +5429 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  5271	
  5272	static int mtk_probe(struct platform_device *pdev)
  5273	{
  5274		struct resource *res = NULL, *res_sram;
  5275		struct device_node *mac_np;
  5276		struct mtk_eth *eth;
  5277		int err, i;
  5278	
  5279		eth = devm_kzalloc(&pdev->dev, sizeof(*eth), GFP_KERNEL);
  5280		if (!eth)
  5281			return -ENOMEM;
  5282	
  5283		eth->soc = of_device_get_match_data(&pdev->dev);
  5284	
  5285		eth->dev = &pdev->dev;
  5286		eth->dma_dev = &pdev->dev;
  5287		eth->base = devm_platform_ioremap_resource(pdev, 0);
  5288		if (IS_ERR(eth->base))
  5289			return PTR_ERR(eth->base);
  5290	
  5291		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
  5292			eth->ip_align = NET_IP_ALIGN;
  5293	
  5294		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
  5295			/* SRAM is actual memory and supports transparent access just like DRAM.
  5296			 * Hence we don't require __iomem being set and don't need to use accessor
  5297			 * functions to read from or write to SRAM.
  5298			 */
  5299			if (mtk_is_netsys_v3_or_greater(eth)) {
  5300				eth->sram_base = (void __force *)devm_platform_ioremap_resource(pdev, 1);
  5301				if (IS_ERR(eth->sram_base))
  5302					return PTR_ERR(eth->sram_base);
  5303			} else {
  5304				eth->sram_base = (void __force *)eth->base + MTK_ETH_SRAM_OFFSET;
  5305			}
  5306		}
  5307	
  5308		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
  5309			err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(36));
  5310			if (!err)
  5311				err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
  5312	
  5313			if (err) {
  5314				dev_err(&pdev->dev, "Wrong DMA config\n");
  5315				return -EINVAL;
  5316			}
  5317		}
  5318	
  5319		spin_lock_init(&eth->page_lock);
  5320		spin_lock_init(&eth->tx_irq_lock);
  5321		spin_lock_init(&eth->rx_irq_lock);
  5322		spin_lock_init(&eth->dim_lock);
  5323	
  5324		eth->rx_dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
  5325		INIT_WORK(&eth->rx_dim.work, mtk_dim_rx);
  5326		INIT_DELAYED_WORK(&eth->reset.monitor_work, mtk_hw_reset_monitor_work);
  5327	
  5328		eth->tx_dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
  5329		INIT_WORK(&eth->tx_dim.work, mtk_dim_tx);
  5330	
  5331		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
  5332			eth->ethsys = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5333								      "mediatek,ethsys");
  5334			if (IS_ERR(eth->ethsys)) {
  5335				dev_err(&pdev->dev, "no ethsys regmap found\n");
  5336				return PTR_ERR(eth->ethsys);
  5337			}
  5338		}
  5339	
  5340		if (MTK_HAS_CAPS(eth->soc->caps, MTK_INFRA)) {
  5341			eth->infra = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5342								     "mediatek,infracfg");
  5343			if (IS_ERR(eth->infra)) {
  5344				dev_err(&pdev->dev, "no infracfg regmap found\n");
  5345				return PTR_ERR(eth->infra);
  5346			}
  5347		}
  5348	
  5349		if (of_dma_is_coherent(pdev->dev.of_node)) {
  5350			struct regmap *cci;
  5351	
  5352			cci = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5353							      "cci-control-port");
  5354			/* enable CPU/bus coherency */
  5355			if (!IS_ERR(cci))
  5356				regmap_write(cci, 0, 3);
  5357		}
  5358	
  5359		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SGMII) &&
  5360		    !mtk_is_netsys_v3_or_greater(eth)) {
  5361			err = mtk_sgmii_init(eth);
  5362	
  5363			if (err)
  5364				return err;
  5365		}
  5366	
  5367		if (eth->soc->required_pctl) {
  5368			eth->pctl = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5369								    "mediatek,pctl");
  5370			if (IS_ERR(eth->pctl)) {
  5371				dev_err(&pdev->dev, "no pctl regmap found\n");
  5372				err = PTR_ERR(eth->pctl);
  5373				goto err_destroy_sgmii;
  5374			}
  5375		}
  5376	
  5377		if (mtk_is_netsys_v2_or_greater(eth)) {
  5378			res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  5379			if (!res) {
  5380				err = -EINVAL;
  5381				goto err_destroy_sgmii;
  5382			}
  5383			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
  5384				if (mtk_is_netsys_v3_or_greater(eth)) {
  5385					res_sram = platform_get_resource(pdev, IORESOURCE_MEM, 1);
  5386					if (!res_sram) {
  5387						err = -EINVAL;
  5388						goto err_destroy_sgmii;
  5389					}
  5390					eth->phy_scratch_ring = res_sram->start;
  5391				} else {
  5392					eth->phy_scratch_ring = res->start + MTK_ETH_SRAM_OFFSET;
  5393				}
  5394			}
  5395		}
  5396	
  5397		if (eth->soc->offload_version) {
  5398			for (i = 0;; i++) {
  5399				struct device_node *np;
  5400				phys_addr_t wdma_phy;
  5401				u32 wdma_base;
  5402	
  5403				if (i >= ARRAY_SIZE(eth->soc->reg_map->wdma_base))
  5404					break;
  5405	
  5406				np = of_parse_phandle(pdev->dev.of_node,
  5407						      "mediatek,wed", i);
  5408				if (!np)
  5409					break;
  5410	
  5411				wdma_base = eth->soc->reg_map->wdma_base[i];
  5412				wdma_phy = res ? res->start + wdma_base : 0;
  5413				mtk_wed_add_hw(np, eth, eth->base + wdma_base,
  5414					       wdma_phy, i);
  5415			}
  5416		}
  5417	
  5418		if (MTK_HAS_CAPS(eth->soc->caps, MTK_PDMA_INT)) {
  5419			for (i = 0; i < MTK_PDMA_IRQ_NUM; i++)
  5420			{
  5421				eth->irq_pdma[i] = platform_get_irq(pdev, i);
  5422				dev_err(&pdev->dev, "pdma IRQ%d resource found: %d\n", i, eth->irq_pdma[i]);
  5423			}
  5424		}
  5425	
  5426		for (i = 0; i < MTK_FE_IRQ_NUM; i++) {
  5427			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0) {
  5428				eth->irq_fe[i] = eth->irq_fe[0];
> 5429				dev_err(&pdev->dev, "reassign fe IRQ%d resource found: %d to 0 [%d]\n", i, eth->irq_fe[0]);
  5430			} else if (MTK_HAS_CAPS(eth->soc->caps, MTK_PDMA_INT)) {
  5431				eth->irq_fe[i] =
  5432					platform_get_irq(pdev, MTK_PDMA_IRQ_NUM + i);
  5433				dev_err(&pdev->dev, "fe IRQ%d resource found: %d\n", MTK_PDMA_IRQ_NUM + i, eth->irq_fe[i]);
  5434			} else {
  5435				eth->irq_fe[i] = platform_get_irq(pdev, i);
  5436				dev_err(&pdev->dev, "fe IRQ%d resource found (else): %d\n", i, eth->irq_fe[i]);
  5437			}
  5438			if (eth->irq_fe[i] < 0) {
  5439				dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
  5440				err = -ENXIO;
  5441				goto err_wed_exit;
  5442			}
  5443		}
  5444		for (i = 0; i < ARRAY_SIZE(eth->clks); i++) {
  5445			eth->clks[i] = devm_clk_get(eth->dev,
  5446						    mtk_clks_source_name[i]);
  5447			if (IS_ERR(eth->clks[i])) {
  5448				if (PTR_ERR(eth->clks[i]) == -EPROBE_DEFER) {
  5449					err = -EPROBE_DEFER;
  5450					goto err_wed_exit;
  5451				}
  5452				if (eth->soc->required_clks & BIT(i)) {
  5453					dev_err(&pdev->dev, "clock %s not found\n",
  5454						mtk_clks_source_name[i]);
  5455					err = -EINVAL;
  5456					goto err_wed_exit;
  5457				}
  5458				eth->clks[i] = NULL;
  5459			}
  5460		}
  5461	
  5462		eth->msg_enable = netif_msg_init(mtk_msg_level, MTK_DEFAULT_MSG_ENABLE);
  5463		INIT_WORK(&eth->pending_work, mtk_pending_work);
  5464	
  5465		err = mtk_hw_init(eth, false);
  5466		if (err)
  5467			goto err_wed_exit;
  5468	
  5469		eth->hwlro = MTK_HAS_CAPS(eth->soc->caps, MTK_HWLRO);
  5470	
  5471		for_each_child_of_node(pdev->dev.of_node, mac_np) {
  5472			if (!of_device_is_compatible(mac_np,
  5473						     "mediatek,eth-mac"))
  5474				continue;
  5475	
  5476			if (!of_device_is_available(mac_np))
  5477				continue;
  5478	
  5479			err = mtk_add_mac(eth, mac_np);
  5480			if (err) {
  5481				of_node_put(mac_np);
  5482				goto err_deinit_hw;
  5483			}
  5484		}
  5485	
  5486		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5487			if (!eth->netdev[i])
  5488				continue;
  5489	
  5490			err = mtk_mac_assign_address(eth, i, true);
  5491			if (err)
  5492				goto err_deinit_hw;
  5493		}
  5494	
  5495		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5496			if (!eth->netdev[i])
  5497				continue;
  5498	
  5499			err = mtk_mac_assign_address(eth, i, false);
  5500			if (err)
  5501				goto err_deinit_hw;
  5502		}
  5503	
  5504		err = mtk_napi_init(eth);
  5505		if (err)
  5506			goto err_free_dev;
  5507	
  5508		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
  5509			err = devm_request_irq(eth->dev, eth->irq_fe[0],
  5510					       mtk_handle_irq, 0,
  5511					       dev_name(eth->dev), eth);
  5512		} else {
  5513			err = devm_request_irq(eth->dev, eth->irq_fe[1],
  5514					       mtk_handle_irq_tx, 0,
  5515					       dev_name(eth->dev), eth);
  5516			if (err)
  5517				goto err_free_dev;
  5518	
  5519			if (MTK_HAS_CAPS(eth->soc->caps, MTK_PDMA_INT)) {
  5520				err = devm_request_irq(eth->dev, eth->irq_fe[2],
  5521						       mtk_handle_fe_irq, 0,
  5522						       dev_name(eth->dev), eth);
  5523	
  5524				err = devm_request_irq(eth->dev, eth->irq_pdma[0],
  5525						       mtk_handle_irq_rx, IRQF_SHARED,
  5526						       dev_name(eth->dev), &eth->rx_napi[0]);
  5527				if (err)
  5528					goto err_free_dev;
  5529	
  5530				if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSS)) {
  5531					for (i = 0; i < MTK_RX_RSS_NUM; i++) {
  5532						err = devm_request_irq(eth->dev,
  5533								       eth->irq_pdma[MTK_RSS_RING(i)],
  5534								       mtk_handle_irq_rx, IRQF_SHARED,
  5535								       dev_name(eth->dev),
  5536								       &eth->rx_napi[MTK_RSS_RING(i)]);
  5537						if (err)
  5538							goto err_free_dev;
  5539					}
  5540				}
  5541			} else {
  5542				err = devm_request_irq(eth->dev, eth->irq_fe[2],
  5543						       mtk_handle_irq_rx, 0,
  5544						       dev_name(eth->dev), eth);
  5545				if (err)
  5546					goto err_free_dev;
  5547			}
  5548		}
  5549	
  5550		/* No MT7628/88 support yet */
  5551		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
  5552			err = mtk_mdio_init(eth);
  5553			if (err)
  5554				goto err_free_dev;
  5555		}
  5556	
  5557		if (eth->soc->offload_version) {
  5558			u8 ppe_num = eth->soc->ppe_num;
  5559	
  5560			ppe_num = min_t(u8, ARRAY_SIZE(eth->ppe), ppe_num);
  5561			for (i = 0; i < ppe_num; i++) {
  5562				u32 ppe_addr = eth->soc->reg_map->ppe_base;
  5563	
  5564				ppe_addr += (i == 2 ? 0xc00 : i * 0x400);
  5565				eth->ppe[i] = mtk_ppe_init(eth, eth->base + ppe_addr, i);
  5566	
  5567				if (!eth->ppe[i]) {
  5568					err = -ENOMEM;
  5569					goto err_deinit_ppe;
  5570				}
  5571				err = mtk_eth_offload_init(eth, i);
  5572	
  5573				if (err)
  5574					goto err_deinit_ppe;
  5575			}
  5576		}
  5577	
  5578		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5579			if (!eth->netdev[i])
  5580				continue;
  5581	
  5582			err = register_netdev(eth->netdev[i]);
  5583			if (err) {
  5584				dev_err(eth->dev, "error bringing up device\n");
  5585				goto err_deinit_ppe;
  5586			} else
  5587				netif_info(eth, probe, eth->netdev[i],
  5588					   "mediatek frame engine at 0x%08lx, irq %d\n",
  5589					   eth->netdev[i]->base_addr, eth->irq_fe[0]);
  5590		}
  5591	
  5592		/* we run 2 devices on the same DMA ring so we need a dummy device
  5593		 * for NAPI to work
  5594		 */
  5595		eth->dummy_dev = alloc_netdev_dummy(0);
  5596		if (!eth->dummy_dev) {
  5597			err = -ENOMEM;
  5598			dev_err(eth->dev, "failed to allocated dummy device\n");
  5599			goto err_unreg_netdev;
  5600		}
  5601		netif_napi_add(eth->dummy_dev, &eth->tx_napi, mtk_napi_tx);
  5602		netif_napi_add(eth->dummy_dev, &eth->rx_napi[0].napi, mtk_napi_rx);
  5603	
  5604		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSS)) {
  5605			for (i = 0; i < MTK_RX_RSS_NUM; i++)
  5606				netif_napi_add(eth->dummy_dev, &eth->rx_napi[MTK_RSS_RING(i)].napi,
  5607					       mtk_napi_rx);
  5608		}
  5609	
  5610		platform_set_drvdata(pdev, eth);
  5611		schedule_delayed_work(&eth->reset.monitor_work,
  5612				      MTK_DMA_MONITOR_TIMEOUT);
  5613	
  5614		return 0;
  5615	
  5616	err_unreg_netdev:
  5617		mtk_unreg_dev(eth);
  5618	err_deinit_ppe:
  5619		mtk_ppe_deinit(eth);
  5620		mtk_mdio_cleanup(eth);
  5621	err_free_dev:
  5622		mtk_free_dev(eth);
  5623	err_deinit_hw:
  5624		mtk_hw_deinit(eth);
  5625	err_wed_exit:
  5626		mtk_wed_exit();
  5627	err_destroy_sgmii:
  5628		mtk_sgmii_destroy(eth);
  5629	
  5630		return err;
  5631	}
  5632	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
