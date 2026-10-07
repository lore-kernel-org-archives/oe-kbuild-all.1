Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A119D264612
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 04:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791349130; cv=none; b=aqb7AFJszk38zTAr5PtigEVxCkdngMcYhLMMSUUX6rnkR8PCw7MsAbG9pVFU7UM+3karYaQ4uPH1+3Mmo4HzJqK6ZZhVxfp9MoHypX/duvbUnLLb/TXjEWUo5jwrY9eRG7FOqlvHAJVHfGR9w0KpT4sPwO+X3eB9sOSsY5UiNcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791349130; c=relaxed/simple;
	bh=cSdiclgoTkay1xeGFKz7oYdLbuhPFZPJtFksozKnxic=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NuaOKnaRnSU5otWsyHW09D8REMgD4BeNeBHYnnTXSKpUmIJcfs3FyiC/Ebt1C1eHZx2xRztoLKt3xJTzGJACmZjoDIYkXboBJuqHxBBUFK2g1eqQAgRf9TJzotvA4M4V7AH1sT19ofHwHUZ++auU53azrFsCE7nre5YCkxqAw0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkbpiaGh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkbpiaGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791349128; x=1822885128;
  h=date:from:to:cc:subject:message-id;
  bh=cSdiclgoTkay1xeGFKz7oYdLbuhPFZPJtFksozKnxic=;
  b=OkbpiaGhYrwzgqyQo6Q9fnXfRDIj/jWN/qTivLEkP7QwagolH2cDC0Vr
   T4+42eVKqZMCmoZyRy3hiL2ylr8G5a7m0SXluAMHgxNfrW6U0K6th3FMr
   Z0Vo0hWVRpzbbsurdB6IKBC7/Cqg+/+AkM+zxxLKEAHcXS/D3kZ/+VVgY
   +QrWCL6nF9QHZ9mtdmpOdSqecGEITBZcQLnLNE5zCJOkB/IPRZc8b5BY+
   Tf00OvpRe9hHulvoEZJc4SXOsV+VH/kcbTFxvt8F4NsEsZjA/2V1Av0Ha
   Ureisr5+kDjBDHhAXpDBs5YPYBA73SXVzC3bpyudkeCP5qpJKJKKVs28j
   w==;
X-CSE-ConnectionGUID: ZCAqJYG/TFCizkj8/bDZQQ==
X-CSE-MsgGUID: 0SPH/FgVSm6bECbSzCZhWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="92640"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="92640"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 21:58:47 -0700
X-CSE-ConnectionGUID: 3OUGK6nkRvOv1YxRTQsOKg==
X-CSE-MsgGUID: tbVn9S2RSw+hts5dOaKzRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280577358"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Oct 2026 21:58:46 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEJjn-000000002Vc-07Yx;
	Wed, 07 Oct 2026 04:58:43 +0000
Date: Wed, 07 Oct 2026 12:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Tarun Maddipatla <tarun.maddipatlavenkatasaikrishna@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 690/1090]
 drivers/net/ethernet/cadence/macb_main.c:5689:17: error: implicit declaration
 of function 'macb_init_rx_watermark'; did you mean 'macb_init_rx_ring'?
Message-ID: <202610071247.bgmQpdYX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   235bd5e49f53bfea681cfd6c489ca1e0eab0b061
commit: 6556503dd049e54cb7439aab65eedd719450cdaa [690/1090] net: macb: Add TX pause frame support
config: x86_64-randconfig-1006-20261007 (https://download.01.org/0day-ci/archive/20261007/202610071247.bgmQpdYX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610071247.bgmQpdYX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610071247.bgmQpdYX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/cadence/macb_main.c: In function 'macb_probe':
>> drivers/net/ethernet/cadence/macb_main.c:5689:17: error: implicit declaration of function 'macb_init_rx_watermark'; did you mean 'macb_init_rx_ring'? [-Wimplicit-function-declaration]
    5689 |                 macb_init_rx_watermark(bp, macb_config);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 macb_init_rx_ring


vim +5689 drivers/net/ethernet/cadence/macb_main.c

  5570	
  5571	static int macb_probe(struct platform_device *pdev)
  5572	{
  5573		const struct macb_config *macb_config = &default_gem_config;
  5574		int (*clk_init)(struct platform_device *, struct clk **,
  5575				struct clk **, struct clk **,  struct clk **,
  5576				struct clk **) = macb_config->clk_init;
  5577		int (*init)(struct platform_device *) = macb_config->init;
  5578		struct device_node *np = pdev->dev.of_node;
  5579		struct clk *pclk, *hclk = NULL, *tx_clk = NULL, *rx_clk = NULL;
  5580		struct clk *tsu_clk = NULL;
  5581		unsigned int queue_mask, num_queues;
  5582		bool native_io;
  5583		phy_interface_t interface;
  5584		struct net_device *dev;
  5585		struct resource *regs;
  5586		u32 wtrmrk_rst_val;
  5587		void __iomem *mem;
  5588		struct macb *bp;
  5589		int err, val;
  5590	
  5591		mem = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
  5592		if (IS_ERR(mem))
  5593			return PTR_ERR(mem);
  5594	
  5595		if (np) {
  5596			const struct of_device_id *match;
  5597	
  5598			match = of_match_node(macb_dt_ids, np);
  5599			if (match && match->data) {
  5600				macb_config = match->data;
  5601				clk_init = macb_config->clk_init;
  5602				init = macb_config->init;
  5603			}
  5604		}
  5605	
  5606		err = clk_init(pdev, &pclk, &hclk, &tx_clk, &rx_clk, &tsu_clk);
  5607		if (err)
  5608			return err;
  5609	
  5610		pm_runtime_set_autosuspend_delay(&pdev->dev, MACB_PM_TIMEOUT);
  5611		pm_runtime_use_autosuspend(&pdev->dev);
  5612		pm_runtime_get_noresume(&pdev->dev);
  5613		pm_runtime_set_active(&pdev->dev);
  5614		pm_runtime_enable(&pdev->dev);
  5615		native_io = hw_is_native_io(mem);
  5616	
  5617		macb_probe_queues(mem, native_io, &queue_mask, &num_queues);
  5618		dev = alloc_etherdev_mq(sizeof(*bp), num_queues);
  5619		if (!dev) {
  5620			err = -ENOMEM;
  5621			goto err_disable_clocks;
  5622		}
  5623	
  5624		dev->base_addr = regs->start;
  5625	
  5626		SET_NETDEV_DEV(dev, &pdev->dev);
  5627	
  5628		bp = netdev_priv(dev);
  5629		bp->pdev = pdev;
  5630		bp->dev = dev;
  5631		bp->regs = mem;
  5632		bp->native_io = native_io;
  5633		if (native_io) {
  5634			bp->macb_reg_readl = hw_readl_native;
  5635			bp->macb_reg_writel = hw_writel_native;
  5636		} else {
  5637			bp->macb_reg_readl = hw_readl;
  5638			bp->macb_reg_writel = hw_writel;
  5639		}
  5640		bp->num_queues = num_queues;
  5641		bp->queue_mask = queue_mask;
  5642		if (macb_config)
  5643			bp->dma_burst_length = macb_config->dma_burst_length;
  5644		bp->pclk = pclk;
  5645		bp->hclk = hclk;
  5646		bp->tx_clk = tx_clk;
  5647		bp->rx_clk = rx_clk;
  5648		bp->tsu_clk = tsu_clk;
  5649		if (macb_config)
  5650			bp->jumbo_max_len = macb_config->jumbo_max_len;
  5651	
  5652		if (!hw_is_gem(bp->regs, bp->native_io))
  5653			bp->max_tx_length = MACB_MAX_TX_LEN;
  5654		else if (macb_config->max_tx_length)
  5655			bp->max_tx_length = macb_config->max_tx_length;
  5656		else
  5657			bp->max_tx_length = GEM_MAX_TX_LEN;
  5658	
  5659		bp->wol = 0;
  5660		device_set_wakeup_capable(&pdev->dev, 1);
  5661	
  5662		bp->usrio = macb_config->usrio;
  5663	
  5664		/* By default we set to partial store and forward mode for zynqmp.
  5665		 * Disable if not set in devicetree.
  5666		 */
  5667		if (GEM_BFEXT(PBUF_CUTTHRU, gem_readl(bp, DCFG6))) {
  5668			err = of_property_read_u32(bp->pdev->dev.of_node,
  5669						   "cdns,rx-watermark",
  5670						   &bp->rx_watermark);
  5671	
  5672			if (!err) {
  5673				/* Disable partial store and forward in case of error or
  5674				 * invalid watermark value
  5675				 */
  5676				wtrmrk_rst_val = (1 << (GEM_BFEXT(RX_PBUF_ADDR, gem_readl(bp, DCFG2)))) - 1;
  5677				if (bp->rx_watermark > wtrmrk_rst_val || !bp->rx_watermark) {
  5678					dev_info(&bp->pdev->dev, "Invalid watermark value\n");
  5679					bp->rx_watermark = 0;
  5680				}
  5681			}
  5682		}
  5683		spin_lock_init(&bp->lock);
  5684		spin_lock_init(&bp->stats_lock);
  5685	
  5686		/* setup capabilities */
  5687		macb_configure_caps(bp, macb_config);
  5688		if (bp->caps & MACB_CAPS_GEM_HAS_RXWMARK)
> 5689			macb_init_rx_watermark(bp, macb_config);
  5690	
  5691		bp->pause_quantum = macb_config->txpause_quantum;
  5692		if (!bp->pause_quantum)
  5693			bp->pause_quantum = GEM_TXPAUSEQUANTUM_DEFAULT;
  5694	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
