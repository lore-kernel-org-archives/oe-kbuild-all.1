Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C35383C97
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437760; cv=none; b=ezl9ppP5O9/4ZxzRMrQB9HWZgr8wD7m36uoIu7bKemeObXopO3ZKkXkn5D84O0tfHSQ1fri7wz6R6SH1REa+j746jttGA2b0CZij/iGA4r09RFXyjQhieLp2vSJZaxPRav/1Ul1FBbzy8q8+Rz0IOSDf2hjFagCokNpHS8KHMno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437760; c=relaxed/simple;
	bh=f8BUA7rVClZuFE6sNzTTD2/cKucrI01LB5zJCfUAjew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RKHiz4r3pWMYFFBViL8nJa2VOgmjUoV14Fre2LQrTQZciiX2gdPlPP9Dky6DsFKIqd6M4sgLdEJA8Zi9sm8CNwzKtbh4nsHz/uQNipQurcVyH5HsPgmzHFlUjsqwvlG/hUmn5yDWrfIWFkdvKHHbNu9OSynUUYldHnJ1kT1MQ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6kTi5bA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6kTi5bA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772437758; x=1803973758;
  h=date:from:to:cc:subject:message-id;
  bh=f8BUA7rVClZuFE6sNzTTD2/cKucrI01LB5zJCfUAjew=;
  b=B6kTi5bA4JW5+aQ475DmH1KYTqRH3YOVNRoRqZyVOapk211B4eZgmKKf
   aXw7jt4VS5z5KGsr9Ouxo6+9GaemSgPym3ilI4cuPJl82+dQ8VFiXYo8s
   BQQl6uubiWAMTJO2Zb7Ghb2X94ljsU9jsHmRYBo0wkhOe/EZLYIBZPi6l
   RpeWRIKyPVZ/pFkdLcFLYOki5wqxvZYc93Sj0cY3vqJamlq+7K5Ipbstt
   904Evh2mmKynqrfTrDMjxVB0nMU4xWFmFkVTLgjyWSSTa+RJ0teHNz46E
   tGNEliYQSuEAZ7H871V0TXaht1UfetcOC7V1aOCZ3V2UiAIieSLGhB1r2
   Q==;
X-CSE-ConnectionGUID: 7cSjo+idQS+QwbJWhRSnnw==
X-CSE-MsgGUID: xt1WHmRdRK+KljvpA83WHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84904063"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="84904063"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 23:49:17 -0800
X-CSE-ConnectionGUID: G+rRYi2JQvWGGthNVE9ulQ==
X-CSE-MsgGUID: s+hGGJZsR7ekjywTUBpcnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="215589958"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Mar 2026 23:49:16 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwy1h-000000000an-3uet;
	Mon, 02 Mar 2026 07:49:13 +0000
Date: Mon, 02 Mar 2026 15:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:tsu 9/9]
 drivers/net/ethernet/cadence/macb_main.c:5548:17: error: 'ret' undeclared;
 did you mean 'net'?
Message-ID: <202603021502.e7YTYMKd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tsu
head:   c4a3ac1511361bd72c2b56c0ae55aa5530cd3255
commit: c4a3ac1511361bd72c2b56c0ae55aa5530cd3255 [9/9] simon smatch feedback
config: x86_64-randconfig-006-20260226 (https://download.01.org/0day-ci/archive/20260302/202603021502.e7YTYMKd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021502.e7YTYMKd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021502.e7YTYMKd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/cadence/macb_main.c: In function 'macb_probe':
>> drivers/net/ethernet/cadence/macb_main.c:5548:17: error: 'ret' undeclared (first use in this function); did you mean 'net'?
    5548 |                 ret = -EINVAL;
         |                 ^~~
         |                 net
   drivers/net/ethernet/cadence/macb_main.c:5548:17: note: each undeclared identifier is reported only once for each function it appears in


vim +5548 drivers/net/ethernet/cadence/macb_main.c

  5460	
  5461	static int macb_probe(struct platform_device *pdev)
  5462	{
  5463		struct clk *pclk, *hclk = NULL, *tx_clk = NULL, *rx_clk = NULL;
  5464		struct device_node *np = pdev->dev.of_node;
  5465		const struct macb_config *macb_config;
  5466		struct clk *tsu_clk = NULL;
  5467		phy_interface_t interface;
  5468		struct net_device *dev;
  5469		struct resource *regs;
  5470		u32 wtrmrk_rst_val;
  5471		void __iomem *mem;
  5472		struct macb *bp;
  5473		int num_queues;
  5474		bool native_io;
  5475		int err, val;
  5476	
  5477		mem = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
  5478		if (IS_ERR(mem))
  5479			return PTR_ERR(mem);
  5480	
  5481		macb_config = of_device_get_match_data(&pdev->dev);
  5482		if (!macb_config)
  5483			macb_config = &default_gem_config;
  5484	
  5485		err = macb_config->clk_init(pdev, &pclk, &hclk, &tx_clk, &rx_clk, &tsu_clk);
  5486		if (err)
  5487			return err;
  5488	
  5489		pm_runtime_set_autosuspend_delay(&pdev->dev, MACB_PM_TIMEOUT);
  5490		pm_runtime_use_autosuspend(&pdev->dev);
  5491		pm_runtime_get_noresume(&pdev->dev);
  5492		pm_runtime_set_active(&pdev->dev);
  5493		pm_runtime_enable(&pdev->dev);
  5494		native_io = hw_is_native_io(mem);
  5495	
  5496		num_queues = macb_probe_queues(&pdev->dev, mem, native_io);
  5497		if (num_queues < 0) {
  5498			err = num_queues;
  5499			goto err_disable_clocks;
  5500		}
  5501	
  5502		dev = alloc_etherdev_mq(sizeof(*bp), num_queues);
  5503		if (!dev) {
  5504			err = -ENOMEM;
  5505			goto err_disable_clocks;
  5506		}
  5507	
  5508		dev->base_addr = regs->start;
  5509	
  5510		SET_NETDEV_DEV(dev, &pdev->dev);
  5511	
  5512		bp = netdev_priv(dev);
  5513		bp->pdev = pdev;
  5514		bp->dev = dev;
  5515		bp->regs = mem;
  5516		bp->native_io = native_io;
  5517		if (native_io) {
  5518			bp->macb_reg_readl = hw_readl_native;
  5519			bp->macb_reg_writel = hw_writel_native;
  5520		} else {
  5521			bp->macb_reg_readl = hw_readl;
  5522			bp->macb_reg_writel = hw_writel;
  5523		}
  5524		bp->num_queues = num_queues;
  5525		bp->dma_burst_length = macb_config->dma_burst_length;
  5526		bp->pclk = pclk;
  5527		bp->hclk = hclk;
  5528		bp->tx_clk = tx_clk;
  5529		bp->rx_clk = rx_clk;
  5530		bp->tsu_clk = tsu_clk;
  5531		bp->jumbo_max_len = macb_config->jumbo_max_len;
  5532	
  5533		if (!hw_is_gem(bp->regs, bp->native_io))
  5534			bp->max_tx_length = MACB_MAX_TX_LEN;
  5535		else if (macb_config->max_tx_length)
  5536			bp->max_tx_length = macb_config->max_tx_length;
  5537		else
  5538			bp->max_tx_length = GEM_MAX_TX_LEN;
  5539	
  5540		bp->wol = 0;
  5541		device_set_wakeup_capable(&pdev->dev, 1);
  5542	
  5543		bp->usrio = macb_config->usrio;
  5544	
  5545		if (of_property_read_bool(bp->pdev->dev.of_node, "cdns,timer-adjust") &&
  5546				IS_ENABLED(CONFIG_MACB_USE_HWSTAMP)) {
  5547			dev_err(&pdev->dev, "Timer adjust mode is not supported\n");
> 5548			ret = -EINVAL;
  5549			goto err_out_free_netdev;
  5550		}
  5551	
  5552		/* By default we set to partial store and forward mode for zynqmp.
  5553		 * Disable if not set in devicetree.
  5554		 */
  5555		if (GEM_BFEXT(PBUF_CUTTHRU, gem_readl(bp, DCFG6))) {
  5556			err = of_property_read_u32(bp->pdev->dev.of_node,
  5557						   "cdns,rx-watermark",
  5558						   &bp->rx_watermark);
  5559	
  5560			if (!err) {
  5561				/* Disable partial store and forward in case of error or
  5562				 * invalid watermark value
  5563				 */
  5564				wtrmrk_rst_val = (1 << (GEM_BFEXT(RX_PBUF_ADDR, gem_readl(bp, DCFG2)))) - 1;
  5565				if (bp->rx_watermark > wtrmrk_rst_val || !bp->rx_watermark) {
  5566					dev_info(&bp->pdev->dev, "Invalid watermark value\n");
  5567					bp->rx_watermark = 0;
  5568				}
  5569			}
  5570		}
  5571		spin_lock_init(&bp->lock);
  5572		spin_lock_init(&bp->stats_lock);
  5573	
  5574		/* setup capabilities */
  5575		macb_configure_caps(bp, macb_config);
  5576	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
