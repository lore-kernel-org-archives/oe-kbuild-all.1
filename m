Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C04B65E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 06:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687673074; x=1719209074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AAdmtbX0gOdEVyYJjxDh2rOROg+rboOFPkLrMF2Cl+M=;
  b=kN7w/Zj6SdTKMgKwbaR2mjY2QjOK0xFCx3bioBISebV25j2IMEXqd3Gc
   wV17ijvxuc76Z7y3CUD054mlKeb9PtjKcK/qxJIiPioyk/dtCofdwMy5T
   /PYxBl0N+abEVR3NfEFvA71KHt3TeiDvB1Iuxw8BboJHrxEjqoa7EFSn5
   o5/yPonMpI4R0fMi11dGKGhf63hOT1rOfDm8eOZciDc6iRIZHrZjsL0fe
   LdjzQiF+BmxyHLxcx2v165oChIadrnghka0ulWhVOYES/tWNuSkybFJRY
   /ZclenYvcOOjKVmWr86HnM3E2Ib0igTUqc17UdLsunVdy51rAXkNZ5dwq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="341372239"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="341372239"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 23:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="785771591"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="785771591"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Jun 2023 23:04:32 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDIrP-0009or-1i;
	Sun, 25 Jun 2023 06:04:31 +0000
Date: Sun, 25 Jun 2023 14:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 26332/26342]
 drivers/mmc/host/uniphier-sd.c:627:13: error: 'struct tmio_mmc_host' has no
 member named 'set_clock'
Message-ID: <202306251449.qjWM6YIR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   5f0e89d38f13fd84e835d6c7ca04617367d2f1e6
commit: a2996279841f7b52d813812be83953dd5d1cddda [26332/26342] mmc: uniphier-sd: add UniPhier SD/eMMC controller driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230625/202306251449.qjWM6YIR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251449.qjWM6YIR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251449.qjWM6YIR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/uniphier-sd.c: In function 'uniphier_sd_probe':
>> drivers/mmc/host/uniphier-sd.c:627:13: error: 'struct tmio_mmc_host' has no member named 'set_clock'
     627 |         host->set_clock = uniphier_sd_set_clock;
         |             ^~


vim +627 drivers/mmc/host/uniphier-sd.c

   545	
   546	static int uniphier_sd_probe(struct platform_device *pdev)
   547	{
   548		struct device *dev = &pdev->dev;
   549		struct uniphier_sd_priv *priv;
   550		struct tmio_mmc_data *tmio_data;
   551		struct tmio_mmc_host *host;
   552		int irq, ret;
   553	
   554		irq = platform_get_irq(pdev, 0);
   555		if (irq < 0) {
   556			dev_err(dev, "failed to get IRQ number");
   557			return irq;
   558		}
   559	
   560		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   561		if (!priv)
   562			return -ENOMEM;
   563	
   564		priv->caps = (unsigned long)of_device_get_match_data(dev);
   565	
   566		priv->clk = devm_clk_get(dev, NULL);
   567		if (IS_ERR(priv->clk)) {
   568			dev_err(dev, "failed to get clock\n");
   569			return PTR_ERR(priv->clk);
   570		}
   571	
   572		priv->rst = devm_reset_control_get_shared(dev, "host");
   573		if (IS_ERR(priv->rst)) {
   574			dev_err(dev, "failed to get host reset\n");
   575			return PTR_ERR(priv->rst);
   576		}
   577	
   578		/* old version has one more reset */
   579		if (!(priv->caps & UNIPHIER_SD_CAP_EXTENDED_IP)) {
   580			priv->rst_br = devm_reset_control_get_shared(dev, "bridge");
   581			if (IS_ERR(priv->rst_br)) {
   582				dev_err(dev, "failed to get bridge reset\n");
   583				return PTR_ERR(priv->rst_br);
   584			}
   585		}
   586	
   587		tmio_data = &priv->tmio_data;
   588		tmio_data->flags |= TMIO_MMC_32BIT_DATA_PORT;
   589	
   590		host = tmio_mmc_host_alloc(pdev, tmio_data);
   591		if (IS_ERR(host))
   592			return PTR_ERR(host);
   593	
   594		if (host->mmc->caps & MMC_CAP_HW_RESET) {
   595			priv->rst_hw = devm_reset_control_get_exclusive(dev, "hw");
   596			if (IS_ERR(priv->rst_hw)) {
   597				dev_err(dev, "failed to get hw reset\n");
   598				ret = PTR_ERR(priv->rst_hw);
   599				goto free_host;
   600			}
   601			host->hw_reset = uniphier_sd_hw_reset;
   602		}
   603	
   604		if (host->mmc->caps & MMC_CAP_UHS) {
   605			ret = uniphier_sd_uhs_init(host, priv);
   606			if (ret) {
   607				dev_warn(dev,
   608					 "failed to setup UHS (error %d).  Disabling UHS.",
   609					 ret);
   610				host->mmc->caps &= ~MMC_CAP_UHS;
   611			}
   612		}
   613	
   614		ret = devm_request_irq(dev, irq, tmio_mmc_irq, IRQF_SHARED,
   615				       dev_name(dev), host);
   616		if (ret)
   617			goto free_host;
   618	
   619		if (priv->caps & UNIPHIER_SD_CAP_EXTENDED_IP)
   620			host->dma_ops = &uniphier_sd_internal_dma_ops;
   621		else
   622			host->dma_ops = &uniphier_sd_external_dma_ops;
   623	
   624		host->bus_shift = 1;
   625		host->clk_enable = uniphier_sd_clk_enable;
   626		host->clk_disable = uniphier_sd_clk_disable;
 > 627		host->set_clock = uniphier_sd_set_clock;
   628	
   629		ret = uniphier_sd_clk_enable(host);
   630		if (ret)
   631			goto free_host;
   632	
   633		uniphier_sd_host_init(host);
   634	
   635		tmio_data->ocr_mask = MMC_VDD_32_33 | MMC_VDD_33_34;
   636		if (host->mmc->caps & MMC_CAP_UHS)
   637			tmio_data->ocr_mask |= MMC_VDD_165_195;
   638	
   639		tmio_data->max_segs = 1;
   640		tmio_data->max_blk_count = U16_MAX;
   641	
   642		ret = tmio_mmc_host_probe(host);
   643		if (ret)
   644			goto free_host;
   645	
   646		return 0;
   647	
   648	free_host:
   649		tmio_mmc_host_free(host);
   650	
   651		return ret;
   652	}
   653	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
