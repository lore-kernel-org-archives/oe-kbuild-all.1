Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6041108
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 02:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693450072; x=1724986072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sLXSZjFput07gZWT/JBm48wBPGKGfhV1Rdm6MxhML/s=;
  b=SGUDjWfDdvcvywgMnSrsYwcycz8ayioJuyT5Jz89PeyPaVVBK1OTtnuN
   LDxI8sv+JmCA4jSBq8lI9RFg9l27dd9iFThtdGfWH06dfbAWb9F+6x9qk
   a7QGNpId4gLtNVGuDNMLz76JBvyIXMzyrTZClv/BZIe78xqHDHwFNH4gy
   0X4RBg1VdMl+JN7fU4MuA5NFADTr5H/1yeWqrreCCamUQll63bg73aYdh
   JcfsdHzn4PdLYmKP49WutAnoJ3Wr9MJ/J4ZBrX95hRN0dtA2pP+CjQFet
   NdT6KJTHKqLBFgH1xIOoC3Gr7bHicOiVqcqP2Xc0HWhB6V5fYaZDy05V/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355294873"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="355294873"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 19:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="732875947"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="732875947"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Aug 2023 19:47:46 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbXij-000AVR-2K;
	Thu, 31 Aug 2023 02:47:45 +0000
Date: Thu, 31 Aug 2023 10:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 5/7] sound/soc/rockchip/rockchip_pdm.c:575:36:
 warning: unused variable 'match'
Message-ID: <202308311007.ns9eTV2J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   2f859c7b504dbff5d4770187e5416610db4625e3
commit: ac865741027a59abe81c2e7d30edfd26082751f3 [5/7] Use of_device_get_match_data
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308311007.ns9eTV2J-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311007.ns9eTV2J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311007.ns9eTV2J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/rockchip/rockchip_pdm.c:394:10: error: 'struct snd_soc_dai_driver' has no member named 'probe'
     394 |         .probe = rockchip_pdm_dai_probe,
         |          ^~~~~
   sound/soc/rockchip/rockchip_pdm.c:394:18: error: initialization of 'const char *' from incompatible pointer type 'int (*)(struct snd_soc_dai *)' [-Werror=incompatible-pointer-types]
     394 |         .probe = rockchip_pdm_dai_probe,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/rockchip/rockchip_pdm.c:394:18: note: (near initialization for 'rockchip_pdm_dai.name')
   sound/soc/rockchip/rockchip_pdm.c: In function 'rockchip_pdm_probe':
>> sound/soc/rockchip/rockchip_pdm.c:575:36: warning: unused variable 'match' [-Wunused-variable]
     575 |         const struct of_device_id *match;
         |                                    ^~~~~
   cc1: some warnings being treated as errors


vim +/match +575 sound/soc/rockchip/rockchip_pdm.c

13e6e042a6f9c2 Sugar Zhang    2021-09-03  571  
fc05a5b2225306 Sugar Zhang    2017-06-13  572  static int rockchip_pdm_probe(struct platform_device *pdev)
fc05a5b2225306 Sugar Zhang    2017-06-13  573  {
13e6e042a6f9c2 Sugar Zhang    2021-09-03  574  	struct device_node *node = pdev->dev.of_node;
624e8e00acafe3 Sugar Zhang    2019-04-04 @575  	const struct of_device_id *match;
fc05a5b2225306 Sugar Zhang    2017-06-13  576  	struct rk_pdm_dev *pdm;
fc05a5b2225306 Sugar Zhang    2017-06-13  577  	struct resource *res;
fc05a5b2225306 Sugar Zhang    2017-06-13  578  	void __iomem *regs;
fc05a5b2225306 Sugar Zhang    2017-06-13  579  	int ret;
fc05a5b2225306 Sugar Zhang    2017-06-13  580  
fc05a5b2225306 Sugar Zhang    2017-06-13  581  	pdm = devm_kzalloc(&pdev->dev, sizeof(*pdm), GFP_KERNEL);
fc05a5b2225306 Sugar Zhang    2017-06-13  582  	if (!pdm)
fc05a5b2225306 Sugar Zhang    2017-06-13  583  		return -ENOMEM;
fc05a5b2225306 Sugar Zhang    2017-06-13  584  
ac865741027a59 Rob Herring    2023-07-14  585  	pdm->version = (enum rk_pdm_version)device_get_match_data(&pdev->dev);
624e8e00acafe3 Sugar Zhang    2019-04-04  586  	if (pdm->version == RK_PDM_RK3308) {
624e8e00acafe3 Sugar Zhang    2019-04-04  587  		pdm->reset = devm_reset_control_get(&pdev->dev, "pdm-m");
624e8e00acafe3 Sugar Zhang    2019-04-04  588  		if (IS_ERR(pdm->reset))
624e8e00acafe3 Sugar Zhang    2019-04-04  589  			return PTR_ERR(pdm->reset);
624e8e00acafe3 Sugar Zhang    2019-04-04  590  	}
624e8e00acafe3 Sugar Zhang    2019-04-04  591  
db4d6d2e6472a5 Yang Yingliang 2021-06-15  592  	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
fc05a5b2225306 Sugar Zhang    2017-06-13  593  	if (IS_ERR(regs))
fc05a5b2225306 Sugar Zhang    2017-06-13  594  		return PTR_ERR(regs);
fc05a5b2225306 Sugar Zhang    2017-06-13  595  
fc05a5b2225306 Sugar Zhang    2017-06-13  596  	pdm->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
fc05a5b2225306 Sugar Zhang    2017-06-13  597  					    &rockchip_pdm_regmap_config);
fc05a5b2225306 Sugar Zhang    2017-06-13  598  	if (IS_ERR(pdm->regmap))
fc05a5b2225306 Sugar Zhang    2017-06-13  599  		return PTR_ERR(pdm->regmap);
fc05a5b2225306 Sugar Zhang    2017-06-13  600  
fc05a5b2225306 Sugar Zhang    2017-06-13  601  	pdm->capture_dma_data.addr = res->start + PDM_RXFIFO_DATA;
fc05a5b2225306 Sugar Zhang    2017-06-13  602  	pdm->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
fc05a5b2225306 Sugar Zhang    2017-06-13  603  	pdm->capture_dma_data.maxburst = PDM_DMA_BURST_SIZE;
fc05a5b2225306 Sugar Zhang    2017-06-13  604  
fc05a5b2225306 Sugar Zhang    2017-06-13  605  	pdm->dev = &pdev->dev;
fc05a5b2225306 Sugar Zhang    2017-06-13  606  	dev_set_drvdata(&pdev->dev, pdm);
fc05a5b2225306 Sugar Zhang    2017-06-13  607  
fc05a5b2225306 Sugar Zhang    2017-06-13  608  	pdm->clk = devm_clk_get(&pdev->dev, "pdm_clk");
fc05a5b2225306 Sugar Zhang    2017-06-13  609  	if (IS_ERR(pdm->clk))
fc05a5b2225306 Sugar Zhang    2017-06-13  610  		return PTR_ERR(pdm->clk);
fc05a5b2225306 Sugar Zhang    2017-06-13  611  
fc05a5b2225306 Sugar Zhang    2017-06-13  612  	pdm->hclk = devm_clk_get(&pdev->dev, "pdm_hclk");
fc05a5b2225306 Sugar Zhang    2017-06-13  613  	if (IS_ERR(pdm->hclk))
fc05a5b2225306 Sugar Zhang    2017-06-13  614  		return PTR_ERR(pdm->hclk);
fc05a5b2225306 Sugar Zhang    2017-06-13  615  
fc05a5b2225306 Sugar Zhang    2017-06-13  616  	ret = clk_prepare_enable(pdm->hclk);
fc05a5b2225306 Sugar Zhang    2017-06-13  617  	if (ret)
fc05a5b2225306 Sugar Zhang    2017-06-13  618  		return ret;
fc05a5b2225306 Sugar Zhang    2017-06-13  619  
fc05a5b2225306 Sugar Zhang    2017-06-13  620  	pm_runtime_enable(&pdev->dev);
fc05a5b2225306 Sugar Zhang    2017-06-13  621  	if (!pm_runtime_enabled(&pdev->dev)) {
fc05a5b2225306 Sugar Zhang    2017-06-13  622  		ret = rockchip_pdm_runtime_resume(&pdev->dev);
fc05a5b2225306 Sugar Zhang    2017-06-13  623  		if (ret)
fc05a5b2225306 Sugar Zhang    2017-06-13  624  			goto err_pm_disable;
fc05a5b2225306 Sugar Zhang    2017-06-13  625  	}
fc05a5b2225306 Sugar Zhang    2017-06-13  626  
fc05a5b2225306 Sugar Zhang    2017-06-13  627  	ret = devm_snd_soc_register_component(&pdev->dev,
fc05a5b2225306 Sugar Zhang    2017-06-13  628  					      &rockchip_pdm_component,
fc05a5b2225306 Sugar Zhang    2017-06-13  629  					      &rockchip_pdm_dai, 1);
fc05a5b2225306 Sugar Zhang    2017-06-13  630  
fc05a5b2225306 Sugar Zhang    2017-06-13  631  	if (ret) {
fc05a5b2225306 Sugar Zhang    2017-06-13  632  		dev_err(&pdev->dev, "could not register dai: %d\n", ret);
fc05a5b2225306 Sugar Zhang    2017-06-13  633  		goto err_suspend;
fc05a5b2225306 Sugar Zhang    2017-06-13  634  	}
fc05a5b2225306 Sugar Zhang    2017-06-13  635  
252163a66a0685 Sugar Zhang    2019-04-03  636  	rockchip_pdm_rxctrl(pdm, 0);
13e6e042a6f9c2 Sugar Zhang    2021-09-03  637  
13e6e042a6f9c2 Sugar Zhang    2021-09-03  638  	ret = rockchip_pdm_path_parse(pdm, node);
13e6e042a6f9c2 Sugar Zhang    2021-09-03  639  	if (ret != 0 && ret != -ENOENT)
13e6e042a6f9c2 Sugar Zhang    2021-09-03  640  		goto err_suspend;
13e6e042a6f9c2 Sugar Zhang    2021-09-03  641  
fc05a5b2225306 Sugar Zhang    2017-06-13  642  	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
fc05a5b2225306 Sugar Zhang    2017-06-13  643  	if (ret) {
fc05a5b2225306 Sugar Zhang    2017-06-13  644  		dev_err(&pdev->dev, "could not register pcm: %d\n", ret);
fc05a5b2225306 Sugar Zhang    2017-06-13  645  		goto err_suspend;
fc05a5b2225306 Sugar Zhang    2017-06-13  646  	}
fc05a5b2225306 Sugar Zhang    2017-06-13  647  
fc05a5b2225306 Sugar Zhang    2017-06-13  648  	return 0;
fc05a5b2225306 Sugar Zhang    2017-06-13  649  
fc05a5b2225306 Sugar Zhang    2017-06-13  650  err_suspend:
fc05a5b2225306 Sugar Zhang    2017-06-13  651  	if (!pm_runtime_status_suspended(&pdev->dev))
fc05a5b2225306 Sugar Zhang    2017-06-13  652  		rockchip_pdm_runtime_suspend(&pdev->dev);
fc05a5b2225306 Sugar Zhang    2017-06-13  653  err_pm_disable:
fc05a5b2225306 Sugar Zhang    2017-06-13  654  	pm_runtime_disable(&pdev->dev);
fc05a5b2225306 Sugar Zhang    2017-06-13  655  
fc05a5b2225306 Sugar Zhang    2017-06-13  656  	clk_disable_unprepare(pdm->hclk);
fc05a5b2225306 Sugar Zhang    2017-06-13  657  
fc05a5b2225306 Sugar Zhang    2017-06-13  658  	return ret;
fc05a5b2225306 Sugar Zhang    2017-06-13  659  }
fc05a5b2225306 Sugar Zhang    2017-06-13  660  

:::::: The code at line 575 was first introduced by commit
:::::: 624e8e00acafe3d31a7c31e67fa95ce06e324bf8 ASoC: rockchip: pdm: fixup pdm fractional div

:::::: TO: Sugar Zhang <sugar.zhang@rock-chips.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
