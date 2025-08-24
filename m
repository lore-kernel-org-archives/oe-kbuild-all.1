Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0B3B640
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 00:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755996132; cv=none; b=Z8ldMlO3718QzTO7ZR4hUKZI2kEs8PxUvD5xlSTFXNjuUeqy+k1nT1PzffPg+wWIzmroZqXZjEyI7MdgmGeIs8Gaf4aOnxScLcLbx54yZvgrtNhX+iOj6uLb5Cl0LPp8+NHDKDLFyvXMXFK/QzQ+CueMd//uW56v8WMVxUbZA4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755996132; c=relaxed/simple;
	bh=4ElUPTFD+Ov1YQPCkhYYEAnrZuumId0oeCUEFNcqI5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O/KRCUL0ACqnJKcGIwRdjM4pzO3FwaJyrrb1HYrSNZe8ICwMiZ7DoRqIa8enAMP5iSy3auZ2ZZoXdPYrfvRvJy+Kzw5bESqbdTJfHeAG3X6BtiNKx88VhqGGr0EWCdlMvzLP82H/8oNvCFrxHRCNkLRTj4UtkA5Jm8CgT88FxRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGKDM+sP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGKDM+sP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755996129; x=1787532129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ElUPTFD+Ov1YQPCkhYYEAnrZuumId0oeCUEFNcqI5w=;
  b=DGKDM+sPwIoLrbSsFWRoHDDm1IDKLqcq+k7DXpxAyfl+GareYkaKal/a
   ziCQSFFO/1yeutxXB5Y4TvIUZQKxVv0Ip8c5biWFRhAfeYgv/DyYgFVXX
   w9l1/vpK580pWtjwwSJbDRfhEowpw1X5ispi3p5imcucqpEaJ5mKQfipH
   m4L4nLV3r5snywAlITLfIDZvGoBomm4hsExdsHaGLFUkuDUsKJCeZ27Hm
   rIZwYbbvELDalJhlrFKQc4qa43na25bZaLTgommhY77fkwMeTqyJGKP7X
   2C8+YLkgCZbqL7wMRAAFn+kW7IENcjnezaqIl5M+fZnpSTWAQIlc9gzSu
   Q==;
X-CSE-ConnectionGUID: sqGafo7tRh6pR/0Yi80UOA==
X-CSE-MsgGUID: eDY1RfaSQnG8vBzg42fzcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61894352"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61894352"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 17:42:09 -0700
X-CSE-ConnectionGUID: 6Ez2PZvUTkmLway9QV6AEg==
X-CSE-MsgGUID: VuvRHYzPR2KEVv13fqY0XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169396549"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Aug 2025 17:42:08 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upyn2-000MgB-2g;
	Sun, 24 Aug 2025 00:41:25 +0000
Date: Sun, 24 Aug 2025 08:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.17-r4pro 58/67]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5365:32: warning: unused
 variable 'res_sram'
Message-ID: <202508240810.asUqt676-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.17-r4pro
head:   414bd21f7aefb4dfeb04a26230b0ba42c0f5fcbc
commit: f653f24bfe4e1a07cf5e530ee8b6a1740162c91e [58/67] net: ethernet: mtk_eth_soc: support ethernet passive mux
config: x86_64-buildonly-randconfig-004-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240810.asUqt676-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240810.asUqt676-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240810.asUqt676-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5365:32: warning: unused variable 'res_sram' [-Wunused-variable]
    5365 |         struct resource *res = NULL, *res_sram;
         |                                       ^~~~~~~~
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
   include/linux/pcs/pcs.h:78:12: warning: unused function 'register_fwnode_pcs_notifier' [-Wunused-function]
      78 | static int register_fwnode_pcs_notifier(struct notifier_block *nb)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pcs/pcs.h:90:1: warning: unused function 'fwnode_phylink_pcs_get_from_fwnode' [-Wunused-function]
      90 | fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/res_sram +5365 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  5362	
  5363	static int mtk_probe(struct platform_device *pdev)
  5364	{
> 5365		struct resource *res = NULL, *res_sram;
  5366		struct device_node *mac_np, *mux_np;
  5367		struct mtk_eth *eth;
  5368		int err, i;
  5369	
  5370		eth = devm_kzalloc(&pdev->dev, sizeof(*eth), GFP_KERNEL);
  5371		if (!eth)
  5372			return -ENOMEM;
  5373	
  5374		eth->soc = of_device_get_match_data(&pdev->dev);
  5375	
  5376		eth->dev = &pdev->dev;
  5377		eth->dma_dev = &pdev->dev;
  5378		eth->base = devm_platform_ioremap_resource(pdev, 0);
  5379		if (IS_ERR(eth->base))
  5380			return PTR_ERR(eth->base);
  5381	
  5382		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
  5383			eth->ip_align = NET_IP_ALIGN;
  5384	
  5385		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
  5386			err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(36));
  5387			if (!err)
  5388				err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
  5389	
  5390			if (err) {
  5391				dev_err(&pdev->dev, "Wrong DMA config\n");
  5392				return -EINVAL;
  5393			}
  5394		}
  5395	
  5396		spin_lock_init(&eth->page_lock);
  5397		spin_lock_init(&eth->tx_irq_lock);
  5398		spin_lock_init(&eth->rx_irq_lock);
  5399		spin_lock_init(&eth->dim_lock);
  5400	
  5401		eth->rx_dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
  5402		INIT_WORK(&eth->rx_dim.work, mtk_dim_rx);
  5403		INIT_DELAYED_WORK(&eth->reset.monitor_work, mtk_hw_reset_monitor_work);
  5404	
  5405		eth->tx_dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
  5406		INIT_WORK(&eth->tx_dim.work, mtk_dim_tx);
  5407	
  5408		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
  5409			eth->ethsys = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5410								      "mediatek,ethsys");
  5411			if (IS_ERR(eth->ethsys)) {
  5412				dev_err(&pdev->dev, "no ethsys regmap found\n");
  5413				return PTR_ERR(eth->ethsys);
  5414			}
  5415		}
  5416	
  5417		if (MTK_HAS_CAPS(eth->soc->caps, MTK_INFRA)) {
  5418			eth->infra = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5419								     "mediatek,infracfg");
  5420			if (IS_ERR(eth->infra)) {
  5421				dev_err(&pdev->dev, "no infracfg regmap found\n");
  5422				return PTR_ERR(eth->infra);
  5423			}
  5424		}
  5425	
  5426		if (of_dma_is_coherent(pdev->dev.of_node)) {
  5427			struct regmap *cci;
  5428	
  5429			cci = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5430							      "cci-control-port");
  5431			/* enable CPU/bus coherency */
  5432			if (!IS_ERR(cci))
  5433				regmap_write(cci, 0, 3);
  5434		}
  5435	
  5436		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SGMII) &&
  5437		    !mtk_is_netsys_v3_or_greater(eth)) {
  5438			err = mtk_sgmii_init(eth);
  5439	
  5440			if (err)
  5441				return err;
  5442		}
  5443	
  5444		if (eth->soc->required_pctl) {
  5445			eth->pctl = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5446								    "mediatek,pctl");
  5447			if (IS_ERR(eth->pctl)) {
  5448				dev_err(&pdev->dev, "no pctl regmap found\n");
  5449				err = PTR_ERR(eth->pctl);
  5450				goto err_destroy_sgmii;
  5451			}
  5452		}
  5453	
  5454		if (mtk_is_netsys_v2_or_greater(eth)) {
  5455			res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  5456			if (!res) {
  5457				err = -EINVAL;
  5458				goto err_destroy_sgmii;
  5459			}
  5460	
  5461			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
  5462				eth->sram_pool = of_gen_pool_get(pdev->dev.of_node,
  5463								 "sram", 0);
  5464				if (!eth->sram_pool) {
  5465					if (!mtk_is_netsys_v3_or_greater(eth)) {
  5466						err = mtk_setup_legacy_sram(eth, res);
  5467						if (err)
  5468							goto err_destroy_sgmii;
  5469					} else {
  5470						dev_err(&pdev->dev,
  5471							"Could not get SRAM pool\n");
  5472						err = -EINVAL;
  5473						goto err_destroy_sgmii;
  5474					}
  5475				}
  5476			}
  5477		}
  5478	
  5479		if (eth->soc->offload_version) {
  5480			for (i = 0;; i++) {
  5481				struct device_node *np;
  5482				phys_addr_t wdma_phy;
  5483				u32 wdma_base;
  5484	
  5485				if (i >= ARRAY_SIZE(eth->soc->reg_map->wdma_base))
  5486					break;
  5487	
  5488				np = of_parse_phandle(pdev->dev.of_node,
  5489						      "mediatek,wed", i);
  5490				if (!np)
  5491					break;
  5492	
  5493				wdma_base = eth->soc->reg_map->wdma_base[i];
  5494				wdma_phy = res ? res->start + wdma_base : 0;
  5495				mtk_wed_add_hw(np, eth, eth->base + wdma_base,
  5496					       wdma_phy, i);
  5497			}
  5498		}
  5499	
  5500		err = mtk_get_irqs(pdev, eth);
  5501		if (err)
  5502			goto err_wed_exit;
  5503	
  5504		for (i = 0; i < ARRAY_SIZE(eth->clks); i++) {
  5505			eth->clks[i] = devm_clk_get(eth->dev,
  5506						    mtk_clks_source_name[i]);
  5507			if (IS_ERR(eth->clks[i])) {
  5508				if (PTR_ERR(eth->clks[i]) == -EPROBE_DEFER) {
  5509					err = -EPROBE_DEFER;
  5510					goto err_wed_exit;
  5511				}
  5512				if (eth->soc->required_clks & BIT(i)) {
  5513					dev_err(&pdev->dev, "clock %s not found\n",
  5514						mtk_clks_source_name[i]);
  5515					err = -EINVAL;
  5516					goto err_wed_exit;
  5517				}
  5518				eth->clks[i] = NULL;
  5519			}
  5520		}
  5521	
  5522		eth->msg_enable = netif_msg_init(mtk_msg_level, MTK_DEFAULT_MSG_ENABLE);
  5523		INIT_WORK(&eth->pending_work, mtk_pending_work);
  5524	
  5525		err = mtk_hw_init(eth, false);
  5526		if (err)
  5527			goto err_wed_exit;
  5528	
  5529		eth->hwlro = MTK_HAS_CAPS(eth->soc->caps, MTK_HWLRO);
  5530	
  5531		for_each_child_of_node(pdev->dev.of_node, mac_np) {
  5532			if (!of_device_is_compatible(mac_np,
  5533						     "mediatek,eth-mac"))
  5534				continue;
  5535	
  5536			if (!of_device_is_available(mac_np))
  5537				continue;
  5538	
  5539			err = mtk_add_mac(eth, mac_np);
  5540			if (err) {
  5541				of_node_put(mac_np);
  5542				goto err_deinit_hw;
  5543			}
  5544		}
  5545	
  5546		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
  5547			err = devm_request_irq(eth->dev, eth->irq[MTK_FE_IRQ_SHARED],
  5548					       mtk_handle_irq, 0,
  5549					       dev_name(eth->dev), eth);
  5550		} else {
  5551			err = devm_request_irq(eth->dev, eth->irq[MTK_FE_IRQ_TX],
  5552					       mtk_handle_irq_tx, 0,
  5553					       dev_name(eth->dev), eth);
  5554			if (err)
  5555				goto err_free_dev;
  5556	
  5557			err = devm_request_irq(eth->dev, eth->irq[MTK_FE_IRQ_RX],
  5558					       mtk_handle_irq_rx, 0,
  5559					       dev_name(eth->dev), eth);
  5560		}
  5561		if (err)
  5562			goto err_free_dev;
  5563	
  5564		/* No MT7628/88 support yet */
  5565		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
  5566			err = mtk_mdio_init(eth);
  5567			if (err)
  5568				goto err_free_dev;
  5569		}
  5570	
  5571		mux_np = of_get_child_by_name(eth->dev->of_node, "mux-bus");
  5572		if (mux_np) {
  5573			struct device_node *child;
  5574	
  5575			for_each_available_child_of_node(mux_np, child) {
  5576				if (!of_device_is_compatible(child,
  5577							     "mediatek,eth-mux"))
  5578					continue;
  5579	
  5580				if (!of_device_is_available(child))
  5581					continue;
  5582	
  5583				err = mtk_add_mux(eth, child);
  5584				if (err)
  5585					dev_err(&pdev->dev, "failed to add mux\n");
  5586	
  5587				of_node_put(mux_np);
  5588			};
  5589		}
  5590	
  5591		if (eth->soc->offload_version) {
  5592			u8 ppe_num = eth->soc->ppe_num;
  5593	
  5594			ppe_num = min_t(u8, ARRAY_SIZE(eth->ppe), ppe_num);
  5595			for (i = 0; i < ppe_num; i++) {
  5596				u32 ppe_addr = eth->soc->reg_map->ppe_base;
  5597	
  5598				ppe_addr += (i == 2 ? 0xc00 : i * 0x400);
  5599				eth->ppe[i] = mtk_ppe_init(eth, eth->base + ppe_addr, i);
  5600	
  5601				if (!eth->ppe[i]) {
  5602					err = -ENOMEM;
  5603					goto err_deinit_ppe;
  5604				}
  5605				err = mtk_eth_offload_init(eth, i);
  5606	
  5607				if (err)
  5608					goto err_deinit_ppe;
  5609			}
  5610		}
  5611	
  5612		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5613			if (!eth->netdev[i])
  5614				continue;
  5615	
  5616			err = register_netdev(eth->netdev[i]);
  5617			if (err) {
  5618				dev_err(eth->dev, "error bringing up device\n");
  5619				goto err_deinit_ppe;
  5620			} else
  5621				netif_info(eth, probe, eth->netdev[i],
  5622					   "mediatek frame engine at 0x%08lx, irq %d\n",
  5623					   eth->netdev[i]->base_addr, eth->irq[MTK_FE_IRQ_SHARED]);
  5624		}
  5625	
  5626		/* we run 2 devices on the same DMA ring so we need a dummy device
  5627		 * for NAPI to work
  5628		 */
  5629		eth->dummy_dev = alloc_netdev_dummy(0);
  5630		if (!eth->dummy_dev) {
  5631			err = -ENOMEM;
  5632			dev_err(eth->dev, "failed to allocated dummy device\n");
  5633			goto err_unreg_netdev;
  5634		}
  5635		netif_napi_add(eth->dummy_dev, &eth->tx_napi, mtk_napi_tx);
  5636		netif_napi_add(eth->dummy_dev, &eth->rx_napi, mtk_napi_rx);
  5637	
  5638		platform_set_drvdata(pdev, eth);
  5639		schedule_delayed_work(&eth->reset.monitor_work,
  5640				      MTK_DMA_MONITOR_TIMEOUT);
  5641	
  5642		return 0;
  5643	
  5644	err_unreg_netdev:
  5645		mtk_unreg_dev(eth);
  5646	err_deinit_ppe:
  5647		mtk_ppe_deinit(eth);
  5648		mtk_release_all_muxes(eth);
  5649		mtk_mdio_cleanup(eth);
  5650	err_free_dev:
  5651		mtk_free_dev(eth);
  5652	err_deinit_hw:
  5653		mtk_hw_deinit(eth);
  5654	err_wed_exit:
  5655		mtk_wed_exit();
  5656	err_destroy_sgmii:
  5657		mtk_sgmii_destroy(eth);
  5658	
  5659		return err;
  5660	}
  5661	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
