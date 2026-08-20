Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCCD1DA0E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 00:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787187132; cv=none; b=Z3XOdWpXejfhJmRW7QyMA9dzkiJmqzUV4uMD0UDG6Ob1IyeyU3zF/eylNtBbdhczE7svbR+GSpoCd6rv81JWq06xVCQsoBBogFD/9yWUo8nUwadhCceewiZDo0ZEwFZN1RwFbg7KOnXck17kkVxgYUxpIlE363KjV5/YTxxa50A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787187132; c=relaxed/simple;
	bh=mlSyNG/TWfss1F9k3b+Wd/OHHCVdS+cZdanX7J30pfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p/oyiRvxrLZ1bFyQ/DxbMFEzw9PXIq+0BjkLMAnANAubB5paTiytDhvRkx2gaRo3xmoaVR94QuN9HEd65uGRelLVPyncI11FFfDsApHFAQKfL9GenIN08mmm6vq9Mm418hCcCkXiY1GalEC4/9OrDuwzADgSaZO8D6IBPudSeiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXCe8rQ2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXCe8rQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787187130; x=1818723130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mlSyNG/TWfss1F9k3b+Wd/OHHCVdS+cZdanX7J30pfY=;
  b=ZXCe8rQ2raXVPQZ3TP0XtQ+8jetNlt+QsIaJmiXnXYCOzGzoANNgky1c
   wxBGlC66vo+ACztsAMkuOr5lWNu6O1Kv7bcKNQ8hlQs53+Kz7eFM8BJhs
   yIQRvSRcKRzeCBnIoBd4uNT8dOrGCtU/T4cpz6z/3IGZGLfW3d0FqC97l
   Q3fzsAPkV4xCddjtyb3r1QsvUG1RUbSFI9pcpSazOEIx67wIIsYpThv3I
   zx7jlfs1EZi4xHsLO3SDrn5AglWZ9VXpFqgpdD9lNEBM+GGjZZ997aNfo
   g/p/syvDrrGWcik8Fx9jSz5BsgM5oXYtkdrrO1ov/6yeSZTbU1PuxEU8J
   g==;
X-CSE-ConnectionGUID: RcgQ1Ju4SqmoUd839UVqGg==
X-CSE-MsgGUID: bWQ0+wLhRGSHZpbl8Zs5aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="113255231"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="113255231"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 17:52:10 -0700
X-CSE-ConnectionGUID: OXthSv/bTAat/A7Z04+Kug==
X-CSE-MsgGUID: yYc70cjdQeCLyL+iEnNdqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="267688693"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Aug 2026 17:52:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwr0n-00000000hBV-1IfV;
	Thu, 20 Aug 2026 00:52:05 +0000
Date: Thu, 20 Aug 2026 08:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Th=C3=A9o?= Lebrun" <theo.lebrun@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Nicolai Buchwitz <nb@tipi-net.de>
Subject: [linux-next:master 15734/16374]
 drivers/net/ethernet/cadence/macb_main.c:5948:8: error: call to undeclared
 function 'macb_alloc_tieoff'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202608200834.4xXOZYO0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a746cd265aed59107ebdaa9ce039bb832922969
commit: 5262eab9462adffd73a84409dee0cbf57fe31da3 [15734/16374] net: macb: allocate tieoff descriptor once across device lifetime
config: x86_64-randconfig-122-20260820 (https://download.01.org/0day-ci/archive/20260820/202608200834.4xXOZYO0-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608200834.4xXOZYO0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608200834.4xXOZYO0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/cadence/macb_main.c:5948:8: error: call to undeclared function 'macb_alloc_tieoff'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5948 |         err = macb_alloc_tieoff(bp);
         |               ^
>> drivers/net/ethernet/cadence/macb_main.c:5970:2: error: call to undeclared function 'macb_free_tieoff'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5970 |         macb_free_tieoff(bp);
         |         ^
   drivers/net/ethernet/cadence/macb_main.c:6001:3: error: call to undeclared function 'macb_free_tieoff'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6001 |                 macb_free_tieoff(bp);
         |                 ^
   3 errors generated.


vim +/macb_alloc_tieoff +5948 drivers/net/ethernet/cadence/macb_main.c

  5764	
  5765	static int macb_probe(struct platform_device *pdev)
  5766	{
  5767		struct clk *pclk, *hclk = NULL, *tx_clk = NULL, *rx_clk = NULL;
  5768		struct device_node *np = pdev->dev.of_node;
  5769		const struct macb_config *macb_config;
  5770		struct clk *tsu_clk = NULL;
  5771		phy_interface_t interface;
  5772		struct net_device *netdev;
  5773		struct resource *regs;
  5774		u32 wtrmrk_rst_val;
  5775		void __iomem *mem;
  5776		struct macb *bp;
  5777		int num_queues;
  5778		bool native_io;
  5779		int err, val;
  5780	
  5781		mem = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
  5782		if (IS_ERR(mem))
  5783			return PTR_ERR(mem);
  5784	
  5785		macb_config = of_device_get_match_data(&pdev->dev);
  5786		if (!macb_config)
  5787			macb_config = &default_gem_config;
  5788	
  5789		err = macb_clk_init(pdev, &pclk, &hclk, &tx_clk, &rx_clk, &tsu_clk,
  5790				    macb_config);
  5791		if (err)
  5792			return err;
  5793	
  5794		pm_runtime_set_autosuspend_delay(&pdev->dev, MACB_PM_TIMEOUT);
  5795		pm_runtime_use_autosuspend(&pdev->dev);
  5796		pm_runtime_get_noresume(&pdev->dev);
  5797		pm_runtime_set_active(&pdev->dev);
  5798		pm_runtime_enable(&pdev->dev);
  5799		native_io = hw_is_native_io(mem);
  5800	
  5801		num_queues = macb_probe_queues(&pdev->dev, mem, native_io);
  5802		if (num_queues < 0) {
  5803			err = num_queues;
  5804			goto err_disable_clocks;
  5805		}
  5806	
  5807		netdev = alloc_etherdev_mq(sizeof(*bp), num_queues);
  5808		if (!netdev) {
  5809			err = -ENOMEM;
  5810			goto err_disable_clocks;
  5811		}
  5812	
  5813		netdev->base_addr = regs->start;
  5814	
  5815		SET_NETDEV_DEV(netdev, &pdev->dev);
  5816	
  5817		bp = netdev_priv(netdev);
  5818		bp->pdev = pdev;
  5819		bp->netdev = netdev;
  5820		bp->regs = mem;
  5821		bp->native_io = native_io;
  5822		if (native_io) {
  5823			bp->macb_reg_readl = hw_readl_native;
  5824			bp->macb_reg_writel = hw_writel_native;
  5825		} else {
  5826			bp->macb_reg_readl = hw_readl;
  5827			bp->macb_reg_writel = hw_writel;
  5828		}
  5829		bp->num_queues = num_queues;
  5830		bp->dma_burst_length = macb_config->dma_burst_length;
  5831		bp->pclk = pclk;
  5832		bp->hclk = hclk;
  5833		bp->tx_clk = tx_clk;
  5834		bp->rx_clk = rx_clk;
  5835		bp->tsu_clk = tsu_clk;
  5836		bp->jumbo_max_len = macb_config->jumbo_max_len;
  5837	
  5838		if (!hw_is_gem(bp->regs, bp->native_io))
  5839			bp->max_tx_length = MACB_MAX_TX_LEN;
  5840		else if (macb_config->max_tx_length)
  5841			bp->max_tx_length = macb_config->max_tx_length;
  5842		else
  5843			bp->max_tx_length = GEM_MAX_TX_LEN;
  5844	
  5845		bp->wol = 0;
  5846		device_set_wakeup_capable(&pdev->dev, 1);
  5847	
  5848		bp->usrio = macb_config->usrio;
  5849	
  5850		if (of_property_read_bool(bp->pdev->dev.of_node, "cdns,timer-adjust") &&
  5851				IS_ENABLED(CONFIG_MACB_USE_HWSTAMP)) {
  5852			dev_err(&pdev->dev, "Timer adjust mode is not supported\n");
  5853			err = -EINVAL;
  5854			goto err_out_free_netdev;
  5855		}
  5856	
  5857		/* By default we set to partial store and forward mode for zynqmp.
  5858		 * Disable if not set in devicetree.
  5859		 */
  5860		if (GEM_BFEXT(PBUF_CUTTHRU, gem_readl(bp, DCFG6))) {
  5861			err = of_property_read_u32(bp->pdev->dev.of_node,
  5862						   "cdns,rx-watermark",
  5863						   &bp->rx_watermark);
  5864	
  5865			if (!err) {
  5866				/* Disable partial store and forward in case of error or
  5867				 * invalid watermark value
  5868				 */
  5869				wtrmrk_rst_val = (1 << (GEM_BFEXT(RX_PBUF_ADDR, gem_readl(bp, DCFG2)))) - 1;
  5870				if (bp->rx_watermark > wtrmrk_rst_val || !bp->rx_watermark) {
  5871					dev_info(&bp->pdev->dev, "Invalid watermark value\n");
  5872					bp->rx_watermark = 0;
  5873				}
  5874			}
  5875		}
  5876		spin_lock_init(&bp->lock);
  5877		spin_lock_init(&bp->stats_lock);
  5878	
  5879		/* setup capabilities */
  5880		macb_configure_caps(bp, macb_config);
  5881	
  5882	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
  5883		if (GEM_BFEXT(DAW64, gem_readl(bp, DCFG6))) {
  5884			err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(44));
  5885			if (err) {
  5886				dev_err(&pdev->dev, "failed to set DMA mask\n");
  5887				goto err_out_free_netdev;
  5888			}
  5889			bp->caps |= MACB_CAPS_DMA_64B;
  5890		}
  5891	#endif
  5892		platform_set_drvdata(pdev, netdev);
  5893	
  5894		netdev->irq = platform_get_irq(pdev, 0);
  5895		if (netdev->irq < 0) {
  5896			err = netdev->irq;
  5897			goto err_out_free_netdev;
  5898		}
  5899	
  5900		/* MTU range: 68 - 1518 or 10240 */
  5901		netdev->min_mtu = GEM_MTU_MIN_SIZE;
  5902		if ((bp->caps & MACB_CAPS_JUMBO) && bp->jumbo_max_len)
  5903			netdev->max_mtu = MIN(bp->jumbo_max_len, RX_BUFFER_MAX) -
  5904					ETH_HLEN - ETH_FCS_LEN;
  5905		else
  5906			netdev->max_mtu = 1536 - ETH_HLEN - ETH_FCS_LEN;
  5907	
  5908		if (bp->caps & MACB_CAPS_BD_RD_PREFETCH) {
  5909			val = GEM_BFEXT(RXBD_RDBUFF, gem_readl(bp, DCFG10));
  5910			if (val)
  5911				bp->rx_bd_rd_prefetch = (2 << (val - 1)) *
  5912							macb_dma_desc_get_size(bp);
  5913	
  5914			val = GEM_BFEXT(TXBD_RDBUFF, gem_readl(bp, DCFG10));
  5915			if (val)
  5916				bp->tx_bd_rd_prefetch = (2 << (val - 1)) *
  5917							macb_dma_desc_get_size(bp);
  5918		}
  5919	
  5920		bp->rx_intr_mask = MACB_RX_INT_FLAGS;
  5921		if (bp->caps & MACB_CAPS_NEEDS_RSTONUBR)
  5922			bp->rx_intr_mask |= MACB_BIT(RXUBR);
  5923	
  5924		err = of_get_ethdev_address(np, bp->netdev);
  5925		if (err == -EPROBE_DEFER)
  5926			goto err_out_free_netdev;
  5927		else if (err)
  5928			macb_get_hwaddr(bp);
  5929	
  5930		err = of_get_phy_mode(np, &interface);
  5931		if (err)
  5932			/* not found in DT, MII by default */
  5933			bp->phy_interface = PHY_INTERFACE_MODE_MII;
  5934		else
  5935			bp->phy_interface = interface;
  5936	
  5937		/* IP specific init */
  5938		err = macb_init(pdev, macb_config);
  5939		if (err)
  5940			goto err_out_free_netdev;
  5941	
  5942		err = macb_mii_init(bp);
  5943		if (err)
  5944			goto err_out_phy_exit;
  5945	
  5946		netif_carrier_off(netdev);
  5947	
> 5948		err = macb_alloc_tieoff(bp);
  5949		if (err)
  5950			goto err_out_unregister_mdio;
  5951	
  5952		err = register_netdev(netdev);
  5953		if (err) {
  5954			dev_err(&pdev->dev, "Cannot register net device, aborting.\n");
  5955			goto err_out_free_tieoff;
  5956		}
  5957	
  5958		INIT_WORK(&bp->hresp_err_bh_work, macb_hresp_error_task);
  5959		INIT_DELAYED_WORK(&bp->tx_lpi_work, macb_tx_lpi_work_fn);
  5960	
  5961		netdev_info(netdev, "Cadence %s rev 0x%08x at 0x%08lx irq %d (%pM)\n",
  5962			    macb_is_gem(bp) ? "GEM" : "MACB", macb_readl(bp, MID),
  5963			    netdev->base_addr, netdev->irq, netdev->dev_addr);
  5964	
  5965		pm_runtime_put_autosuspend(&bp->pdev->dev);
  5966	
  5967		return 0;
  5968	
  5969	err_out_free_tieoff:
> 5970		macb_free_tieoff(bp);
  5971	
  5972	err_out_unregister_mdio:
  5973		mdiobus_unregister(bp->mii_bus);
  5974		mdiobus_free(bp->mii_bus);
  5975	
  5976	err_out_phy_exit:
  5977		phy_exit(bp->phy);
  5978	
  5979	err_out_free_netdev:
  5980		free_netdev(netdev);
  5981	
  5982	err_disable_clocks:
  5983		macb_clks_disable(pclk, hclk, tx_clk, rx_clk, tsu_clk);
  5984		pm_runtime_disable(&pdev->dev);
  5985		pm_runtime_set_suspended(&pdev->dev);
  5986		pm_runtime_dont_use_autosuspend(&pdev->dev);
  5987	
  5988		return err;
  5989	}
  5990	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
