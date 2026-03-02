Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0924C194A6C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442163; cv=none; b=qrP7a66eHKMmTmrK0o0b13lYI5ZApboRc0b6TAqK5hsMaewmiL+vYeMHWh3uJSBNOIW4ZTO0FuS4Lnq5MxWmGMPcmtjzN6gNd3d76vmsitfhjp9kkif1MHBep9Ns33sPwejxB8O3ohQJEYBld2/VruzpGMsqhJyepQMuHsbylho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442163; c=relaxed/simple;
	bh=/ys9J4OqQ4TrLrsGABYbeiPd2jnoQEYPKt7Er6paHso=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r91k33nPqy/n+NPB9YyOZ7R+R1Z+GdwJy6X2KfAq+fp/OANrpYRZIeFuDe7YNTpnku1bK7qtDNyHPYxsTvGEpM2aMzKBJDuBa7XUyq1xrmvtCnVF1QoQRyqgDnKBlvSLPWh9X4suzHeXbmpLY/VlORahTEM4en6hKjIWpfmAb0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ew0wgDTi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ew0wgDTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772442162; x=1803978162;
  h=date:from:to:cc:subject:message-id;
  bh=/ys9J4OqQ4TrLrsGABYbeiPd2jnoQEYPKt7Er6paHso=;
  b=Ew0wgDTi0aCs4e8Jchmh0X2TgwDZkdJ9ub32wHB8TQYjGhKDH2RcmeON
   ztzn46u6odQrYvHrq33ndS7e0v20rpYPcfIATIYUaRyuuhtERRIWYFsqG
   poKM/kyuPGQLZ4EtsL7KwvK8dzul5AQA6Mj/RB+repOQScSYE09f/bV1r
   3gE4SjA6VP7QdWdxxKqLhBm8ReOeDUlR2Ulv/zX9E4ZKS3M4LX+fJTQna
   H1vMd30L34WcfuySyTSBWndvKLmfjrXtqdpYJ8eaU424S7AohcsrvG2WR
   rx1JFwz5wvSqUfbKoe0z7MZGbdQXg2qH8nU76Tm7oUmYHEX5vSHVhpU1i
   A==;
X-CSE-ConnectionGUID: DBdm0mxrSjWSmN3yLqDfBQ==
X-CSE-MsgGUID: ykdBF9X7R9qpkTKpZRi7xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="61014094"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="61014094"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:02:41 -0800
X-CSE-ConnectionGUID: JfdxWXTZTSWP2+Y+ZiWV9A==
X-CSE-MsgGUID: /BaTUi1JTcKOX5Ev0g6RvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="222087553"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Mar 2026 01:02:21 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwzAQ-000000000ej-2etQ;
	Mon, 02 Mar 2026 09:02:18 +0000
Date: Mon, 02 Mar 2026 17:01:47 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:tsu 9/9]
 drivers/net/ethernet/cadence/macb_main.c:5548:3: error: use of undeclared
 identifier 'ret'
Message-ID: <202603021658.sUBBEkB7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tsu
head:   c4a3ac1511361bd72c2b56c0ae55aa5530cd3255
commit: c4a3ac1511361bd72c2b56c0ae55aa5530cd3255 [9/9] simon smatch feedback
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260302/202603021658.sUBBEkB7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021658.sUBBEkB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021658.sUBBEkB7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/cadence/macb_main.c:5548:3: error: use of undeclared identifier 'ret'
    5548 |                 ret = -EINVAL;
         |                 ^
   1 error generated.


vim +/ret +5548 drivers/net/ethernet/cadence/macb_main.c

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
