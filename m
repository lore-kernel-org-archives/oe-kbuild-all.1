Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A11257D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Jun 2025 02:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749956230; cv=none; b=ePOGMImMf3RiLR7/WqQD+cMH5zY1NPnsF1Icytr9N+vFrJdvwNObpcp4pa+JV6WQyCMUSV+SlExytDGN0tVstcz9f8+eXpHo5FIssIp4iRxOf2cq7sShiebsWX3QgVMhItVlINCYAcVGcvAsIKp8zLGv5wBCxISMRR1Ur5jHkog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749956230; c=relaxed/simple;
	bh=O7Ceop5VQxnX3Z49JaB+espJvaoiCKGJ0Wf8Ry+ig3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ir1LeH+mOroPG6neTMco7DjSN8MITG1q8csBTD31/vHYqX3oV/9EX1heuBqqNzUGFJjBwoszBAUoUHow5E93zgZC+ZAjxjHOuCEc/ydFsYV2rAI4CF3Jtv0fO1R2htL2GcK1Pe3PQ81UjYoQyBLEEqMtuZdmFq2c5D+Th28r188=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmjqgU2F; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmjqgU2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749956228; x=1781492228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O7Ceop5VQxnX3Z49JaB+espJvaoiCKGJ0Wf8Ry+ig3Y=;
  b=AmjqgU2Fk4iTGdt/zmC9/DtstTYvUciNpoExA5jRlWG0bwNRrgytTJl0
   j7Wxx1+JK6M5SKUohqlW1xI3/dyzK33ho4Sq2JTHr9Wwl5cOVeQsckoU/
   OzDy4Pk4x0eF1OjhOBBm7kkJEBVpr/PwR4EXKIl21o7SmhHx48uYBdsrm
   AMEaO60yiDTpS6+XrjrOKEicrFH0DkQ+X9UAeVFkTFZM/t+01rs6HdSMi
   TcbHCQPLF2sSEDYynlpXfbiWz1SsSCHTeF76c2ENUHiXf/BWql2Tqr+f7
   2Z3e8VJOZjR+Vk2MflzNDC+K69hs3pjMv8XRkPJeRN611DKUTFyrD3xot
   Q==;
X-CSE-ConnectionGUID: +bsUvtzjRPC+rNsht1xKPA==
X-CSE-MsgGUID: Bv/1kWVaTmSgHKWAjI3Cnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="55932705"
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="55932705"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 19:57:05 -0700
X-CSE-ConnectionGUID: CwInUf5YSC2xZdk2IIzwFw==
X-CSE-MsgGUID: Nv7HlsyyRH22KnAM9mWNcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="179048971"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2025 19:57:03 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQdYL-000E4e-0u;
	Sun, 15 Jun 2025 02:57:01 +0000
Date: Sun, 15 Jun 2025 10:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 61/61]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5696:28: error: 'enetvar'
 undeclared
Message-ID: <202506151013.66Cq6cWv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   b17cf8cf3f5c81caacf7ef16812b79e57c99078b
commit: b17cf8cf3f5c81caacf7ef16812b79e57c99078b [61/61] try to implement getting rss-irq by name
config: arm64-randconfig-002-20250615 (https://download.01.org/0day-ci/archive/20250615/202506151013.66Cq6cWv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506151013.66Cq6cWv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506151013.66Cq6cWv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_probe':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5696:28: error: 'enetvar' undeclared (first use in this function)
    5696 |    snprintf(rxring, sizeof(enetvar), "rx-ring%d", i);
         |                            ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5696:28: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5697:23: error: implicit declaration of function 'platform_get_irq_by_name'; did you mean 'platform_get_irq_byname'? [-Werror=implicit-function-declaration]
    5697 |    eth->irq_pdma[i] = platform_get_irq_by_name(pdev, rxring);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~
         |                       platform_get_irq_byname
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
   At top level:
   include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
      90 | fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pcs/pcs.h:78:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
      78 | static int register_fwnode_pcs_notifier(struct notifier_block *nb)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/enetvar +5696 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  5529	
  5530	static int mtk_probe(struct platform_device *pdev)
  5531	{
  5532		struct resource *res = NULL, *res_sram;
  5533		struct device_node *mac_np;
  5534		struct mtk_eth *eth;
  5535		int err, i;
  5536	
  5537		eth = devm_kzalloc(&pdev->dev, sizeof(*eth), GFP_KERNEL);
  5538		if (!eth)
  5539			return -ENOMEM;
  5540	
  5541		eth->soc = of_device_get_match_data(&pdev->dev);
  5542	
  5543		eth->dev = &pdev->dev;
  5544		eth->dma_dev = &pdev->dev;
  5545		eth->base = devm_platform_ioremap_resource(pdev, 0);
  5546		if (IS_ERR(eth->base))
  5547			return PTR_ERR(eth->base);
  5548	
  5549		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
  5550			eth->ip_align = NET_IP_ALIGN;
  5551	
  5552		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
  5553			/* SRAM is actual memory and supports transparent access just like DRAM.
  5554			 * Hence we don't require __iomem being set and don't need to use accessor
  5555			 * functions to read from or write to SRAM.
  5556			 */
  5557			if (mtk_is_netsys_v3_or_greater(eth)) {
  5558				eth->sram_base = (void __force *)devm_platform_ioremap_resource(pdev, 1);
  5559				if (IS_ERR(eth->sram_base))
  5560					return PTR_ERR(eth->sram_base);
  5561			} else {
  5562				eth->sram_base = (void __force *)eth->base + MTK_ETH_SRAM_OFFSET;
  5563			}
  5564		}
  5565	
  5566		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
  5567			err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(36));
  5568			if (!err)
  5569				err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
  5570	
  5571			if (err) {
  5572				dev_err(&pdev->dev, "Wrong DMA config\n");
  5573				return -EINVAL;
  5574			}
  5575		}
  5576	
  5577		spin_lock_init(&eth->page_lock);
  5578		spin_lock_init(&eth->tx_irq_lock);
  5579		spin_lock_init(&eth->rx_irq_lock);
  5580		spin_lock_init(&eth->dim_lock);
  5581	
  5582		eth->rx_dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
  5583		INIT_WORK(&eth->rx_dim.work, mtk_dim_rx);
  5584		atomic_set(&eth->reset.force, 0);
  5585		INIT_DELAYED_WORK(&eth->reset.monitor_work, mtk_hw_reset_monitor_work);
  5586	
  5587		eth->tx_dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
  5588		INIT_WORK(&eth->tx_dim.work, mtk_dim_tx);
  5589	
  5590		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
  5591			eth->ethsys = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5592								      "mediatek,ethsys");
  5593			if (IS_ERR(eth->ethsys)) {
  5594				dev_err(&pdev->dev, "no ethsys regmap found\n");
  5595				return PTR_ERR(eth->ethsys);
  5596			}
  5597		}
  5598	
  5599		if (MTK_HAS_CAPS(eth->soc->caps, MTK_INFRA)) {
  5600			eth->infra = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5601								     "mediatek,infracfg");
  5602			if (IS_ERR(eth->infra)) {
  5603				dev_err(&pdev->dev, "no infracfg regmap found\n");
  5604				return PTR_ERR(eth->infra);
  5605			}
  5606		}
  5607	
  5608		if (of_dma_is_coherent(pdev->dev.of_node)) {
  5609			struct regmap *cci;
  5610	
  5611			cci = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5612							      "cci-control-port");
  5613			/* enable CPU/bus coherency */
  5614			if (!IS_ERR(cci))
  5615				regmap_write(cci, 0, 3);
  5616		}
  5617	
  5618		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SGMII) &&
  5619		    !mtk_is_netsys_v3_or_greater(eth)) {
  5620			err = mtk_sgmii_init(eth);
  5621	
  5622			if (err)
  5623				return err;
  5624		}
  5625	
  5626		if (eth->soc->required_pctl) {
  5627			eth->pctl = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
  5628								    "mediatek,pctl");
  5629			if (IS_ERR(eth->pctl)) {
  5630				dev_err(&pdev->dev, "no pctl regmap found\n");
  5631				err = PTR_ERR(eth->pctl);
  5632				goto err_destroy_sgmii;
  5633			}
  5634		}
  5635	
  5636		if (mtk_is_netsys_v2_or_greater(eth)) {
  5637			res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  5638			if (!res) {
  5639				err = -EINVAL;
  5640				goto err_destroy_sgmii;
  5641			}
  5642			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
  5643				if (mtk_is_netsys_v3_or_greater(eth)) {
  5644					res_sram = platform_get_resource(pdev, IORESOURCE_MEM, 1);
  5645					if (!res_sram) {
  5646						err = -EINVAL;
  5647						goto err_destroy_sgmii;
  5648					}
  5649					eth->phy_scratch_ring = res_sram->start;
  5650				} else {
  5651					eth->phy_scratch_ring = res->start + MTK_ETH_SRAM_OFFSET;
  5652				}
  5653			}
  5654		}
  5655	
  5656		if (eth->soc->offload_version) {
  5657			for (i = 0;; i++) {
  5658				struct device_node *np;
  5659				phys_addr_t wdma_phy;
  5660				u32 wdma_base;
  5661	
  5662				if (i >= ARRAY_SIZE(eth->soc->reg_map->wdma_base))
  5663					break;
  5664	
  5665				np = of_parse_phandle(pdev->dev.of_node,
  5666						      "mediatek,wed", i);
  5667				if (!np)
  5668					break;
  5669	
  5670				wdma_base = eth->soc->reg_map->wdma_base[i];
  5671				wdma_phy = res ? res->start + wdma_base : 0;
  5672				mtk_wed_add_hw(np, eth, eth->base + wdma_base,
  5673					       wdma_phy, i);
  5674			}
  5675		}
  5676	
  5677		for (i = 0; i < MTK_FE_IRQ_NUM; i++) {
  5678			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
  5679				eth->irq_fe[i] = eth->irq_fe[0];
  5680			else if (MTK_HAS_CAPS(eth->soc->caps, MTK_PDMA_INT))
  5681				eth->irq_fe[i] =
  5682					platform_get_irq(pdev, i);
  5683			else
  5684				eth->irq_fe[i] = platform_get_irq(pdev, i);
  5685			if (eth->irq_fe[i] < 0) {
  5686				dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
  5687				err = -ENXIO;
  5688				goto err_wed_exit;
  5689			}
  5690		}
  5691	
  5692		if (MTK_HAS_CAPS(eth->soc->caps, MTK_PDMA_INT)) {
  5693			char rxring[9];
  5694			for (i = 0; i < MTK_PDMA_IRQ_NUM; i++)
  5695			{
> 5696				snprintf(rxring, sizeof(enetvar), "rx-ring%d", i);
> 5697				eth->irq_pdma[i] = platform_get_irq_by_name(pdev, rxring);
  5698				if (eth->irq_pdma[i] < 0)
  5699					eth->irq_pdma[i] = platform_get_irq(pdev, 4 + i);
  5700			}
  5701		}
  5702	
  5703		for (i = 0; i < ARRAY_SIZE(eth->clks); i++) {
  5704			eth->clks[i] = devm_clk_get(eth->dev,
  5705						    mtk_clks_source_name[i]);
  5706			if (IS_ERR(eth->clks[i])) {
  5707				if (PTR_ERR(eth->clks[i]) == -EPROBE_DEFER) {
  5708					err = -EPROBE_DEFER;
  5709					goto err_wed_exit;
  5710				}
  5711				if (eth->soc->required_clks & BIT(i)) {
  5712					dev_err(&pdev->dev, "clock %s not found\n",
  5713						mtk_clks_source_name[i]);
  5714					err = -EINVAL;
  5715					goto err_wed_exit;
  5716				}
  5717				eth->clks[i] = NULL;
  5718			}
  5719		}
  5720	
  5721		eth->msg_enable = netif_msg_init(mtk_msg_level, MTK_DEFAULT_MSG_ENABLE);
  5722		INIT_WORK(&eth->pending_work, mtk_pending_work);
  5723	
  5724		err = mtk_hw_init(eth, false);
  5725		if (err)
  5726			goto err_wed_exit;
  5727	
  5728		eth->hwlro = MTK_HAS_CAPS(eth->soc->caps, MTK_HWLRO);
  5729	
  5730		for_each_child_of_node(pdev->dev.of_node, mac_np) {
  5731			if (!of_device_is_compatible(mac_np,
  5732						     "mediatek,eth-mac"))
  5733				continue;
  5734	
  5735			if (!of_device_is_available(mac_np))
  5736				continue;
  5737	
  5738			err = mtk_add_mac(eth, mac_np);
  5739			if (err) {
  5740				of_node_put(mac_np);
  5741				goto err_deinit_hw;
  5742			}
  5743		}
  5744	
  5745		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5746			if (!eth->netdev[i])
  5747				continue;
  5748	
  5749			err = mtk_mac_assign_address(eth, i, true);
  5750			if (err)
  5751				goto err_deinit_hw;
  5752		}
  5753	
  5754		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5755			if (!eth->netdev[i])
  5756				continue;
  5757	
  5758			err = mtk_mac_assign_address(eth, i, false);
  5759			if (err)
  5760				goto err_deinit_hw;
  5761		}
  5762	
  5763		err = mtk_napi_init(eth);
  5764		if (err)
  5765			goto err_free_dev;
  5766	
  5767		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
  5768			err = devm_request_irq(eth->dev, eth->irq_fe[0],
  5769					       mtk_handle_irq, 0,
  5770					       dev_name(eth->dev), eth);
  5771		} else {
  5772			err = devm_request_irq(eth->dev, eth->irq_fe[1],
  5773					       mtk_handle_irq_tx, 0,
  5774					       dev_name(eth->dev), eth);
  5775			if (err)
  5776				goto err_free_dev;
  5777	
  5778			if (MTK_HAS_CAPS(eth->soc->caps, MTK_PDMA_INT)) {
  5779				err = devm_request_irq(eth->dev, eth->irq_pdma[0],
  5780						       mtk_handle_irq_rx, IRQF_SHARED,
  5781						       dev_name(eth->dev), &eth->rx_napi[0]);
  5782				if (err)
  5783					goto err_free_dev;
  5784	
  5785				if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSS)) {
  5786					for (i = 1; i < MTK_RX_RSS_NUM; i++) {
  5787						err = devm_request_irq(eth->dev,
  5788								       eth->irq_pdma[MTK_RSS_RING(i)],
  5789								       mtk_handle_irq_rx, IRQF_SHARED,
  5790								       dev_name(eth->dev),
  5791								       &eth->rx_napi[MTK_RSS_RING(i)]);
  5792						if (err)
  5793							goto err_free_dev;
  5794					}
  5795				}
  5796	
  5797				if (eth->hwlro) {
  5798					for (i = 0; i < MTK_HW_LRO_RING_NUM; i++) {
  5799						err = devm_request_irq(eth->dev,
  5800								       eth->irq_pdma[MTK_HW_LRO_IRQ(i)],
  5801								       mtk_handle_irq_rx, IRQF_SHARED,
  5802								       dev_name(eth->dev),
  5803								       &eth->rx_napi[MTK_HW_LRO_RING(i)]);
  5804						if (err)
  5805							goto err_free_dev;
  5806					}
  5807				}
  5808			} else {
  5809				err = devm_request_irq(eth->dev, eth->irq_fe[2],
  5810						       mtk_handle_irq_rx, 0,
  5811						       dev_name(eth->dev), &eth->rx_napi[0]);
  5812				if (err)
  5813					goto err_free_dev;
  5814			}
  5815		}
  5816	
  5817		/* No MT7628/88 support yet */
  5818		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
  5819			err = mtk_mdio_init(eth);
  5820			if (err)
  5821				goto err_free_dev;
  5822		}
  5823	
  5824		if (eth->soc->offload_version) {
  5825			u8 ppe_num = eth->soc->ppe_num;
  5826	
  5827			ppe_num = min_t(u8, ARRAY_SIZE(eth->ppe), ppe_num);
  5828			for (i = 0; i < ppe_num; i++) {
  5829				u32 ppe_addr = eth->soc->reg_map->ppe_base;
  5830	
  5831				ppe_addr += (i == 2 ? 0xc00 : i * 0x400);
  5832				eth->ppe[i] = mtk_ppe_init(eth, eth->base + ppe_addr, i);
  5833	
  5834				if (!eth->ppe[i]) {
  5835					err = -ENOMEM;
  5836					goto err_deinit_ppe;
  5837				}
  5838				err = mtk_eth_offload_init(eth, i);
  5839	
  5840				if (err)
  5841					goto err_deinit_ppe;
  5842			}
  5843		}
  5844	
  5845		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5846			if (!eth->netdev[i])
  5847				continue;
  5848	
  5849			err = register_netdev(eth->netdev[i]);
  5850			if (err) {
  5851				dev_err(eth->dev, "error bringing up device\n");
  5852				goto err_deinit_ppe;
  5853			} else
  5854				netif_info(eth, probe, eth->netdev[i],
  5855					   "mediatek frame engine at 0x%08lx, irq %d\n",
  5856					   eth->netdev[i]->base_addr, eth->irq_fe[0]);
  5857		}
  5858	
  5859		/* we run 2 devices on the same DMA ring so we need a dummy device
  5860		 * for NAPI to work
  5861		 */
  5862		eth->dummy_dev = alloc_netdev_dummy(0);
  5863		if (!eth->dummy_dev) {
  5864			err = -ENOMEM;
  5865			dev_err(eth->dev, "failed to allocated dummy device\n");
  5866			goto err_unreg_netdev;
  5867		}
  5868		netif_napi_add(eth->dummy_dev, &eth->tx_napi, mtk_napi_tx);
  5869		netif_napi_add(eth->dummy_dev, &eth->rx_napi[0].napi, mtk_napi_rx);
  5870	
  5871		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSS)) {
  5872			for (i = 1; i < MTK_RX_RSS_NUM; i++)
  5873				netif_napi_add(eth->dummy_dev, &eth->rx_napi[MTK_RSS_RING(i)].napi,
  5874					       mtk_napi_rx);
  5875		}
  5876	
  5877		if (eth->hwlro) {
  5878			for (i = 0; i < MTK_HW_LRO_RING_NUM; i++) {
  5879				netif_napi_add(eth->dummy_dev, &eth->rx_napi[MTK_HW_LRO_RING(i)].napi,
  5880					       mtk_napi_rx);
  5881			}
  5882		}
  5883	
  5884		mtketh_debugfs_init(eth);
  5885		debug_proc_init(eth);
  5886	
  5887		platform_set_drvdata(pdev, eth);
  5888		schedule_delayed_work(&eth->reset.monitor_work,
  5889				      MTK_DMA_MONITOR_TIMEOUT);
  5890	
  5891		return 0;
  5892	
  5893	err_unreg_netdev:
  5894		mtk_unreg_dev(eth);
  5895	err_deinit_ppe:
  5896		mtk_ppe_deinit(eth);
  5897		mtk_mdio_cleanup(eth);
  5898	err_free_dev:
  5899		mtk_free_dev(eth);
  5900	err_deinit_hw:
  5901		mtk_hw_deinit(eth);
  5902	err_wed_exit:
  5903		mtk_wed_exit();
  5904	err_destroy_sgmii:
  5905		mtk_sgmii_destroy(eth);
  5906	
  5907		return err;
  5908	}
  5909	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
