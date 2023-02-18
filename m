Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9D1D31E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 11:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676720221; x=1708256221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s9ys+mHjlG2o0BLqYBDtPUd1O/GUthQ8mzu3FNKjmA8=;
  b=HRgLMVV8L54r67Zy0nJbjf1TpPGPm9hdHLey5rV4cwz0kxIemE/ClKhV
   NXctTWroDOEVc+GelrKsXjjglXHdRKk94yOJTYXaAPgQSpPa1v98sKfCE
   z4Xxi78t1frhjIw8+dpPObJ0Wh7cnzhJ4Vu6B63lX/H1ADPZJaFN9saQe
   5NgbCEa0GUUA+sVBymDCgC7CqqYC4M+Dlo+OYk/91030YDc2ojJ3j4eZ2
   5Cf2pCEAZoUOVJl6G2B9hoiGVjmRLpe7s433jZ2BbalqRxyADrkO4lMNW
   XRxa6RjVzTpZstZH8LY6TQajJu5C00F9cm6ghyY+XqNT0kGXV0NhGyaA7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="329880603"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="329880603"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 03:37:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="620682101"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="620682101"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Feb 2023 03:36:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTLWT-000CLZ-1h;
	Sat, 18 Feb 2023 11:36:57 +0000
Date: Sat, 18 Feb 2023 19:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Sasha Levin <sashal@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [ammarfaizi2-block:stable/linux-stable-rc/queue/5.4 129/135]
 drivers/mmc/host/jz4740_mmc.c:1016:30: error: 'JZ_MMC_JZ4760' undeclared;
 did you mean 'JZ_MMC_JZ4780'?
Message-ID: <202302181926.BhUHRXfY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/5.4
head:   0109f5323863edf0d51d088bae4f05705ba0a268
commit: 186bbbee8013e458c0c7261c2a78a1b63e46b29f [129/135] mmc: jz4740: Work around bug on JZ4760(B)
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230218/202302181926.BhUHRXfY-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/186bbbee8013e458c0c7261c2a78a1b63e46b29f
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block stable/linux-stable-rc/queue/5.4
        git checkout 186bbbee8013e458c0c7261c2a78a1b63e46b29f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/mmc/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302181926.BhUHRXfY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/jz4740_mmc.c: In function 'jz4740_mmc_probe':
>> drivers/mmc/host/jz4740_mmc.c:1016:30: error: 'JZ_MMC_JZ4760' undeclared (first use in this function); did you mean 'JZ_MMC_JZ4780'?
    1016 |         if (host->version == JZ_MMC_JZ4760 && mmc->f_max > JZ_MMC_CLK_RATE)
         |                              ^~~~~~~~~~~~~
         |                              JZ_MMC_JZ4780
   drivers/mmc/host/jz4740_mmc.c:1016:30: note: each undeclared identifier is reported only once for each function it appears in


vim +1016 drivers/mmc/host/jz4740_mmc.c

   951	
   952	static int jz4740_mmc_probe(struct platform_device* pdev)
   953	{
   954		int ret;
   955		struct mmc_host *mmc;
   956		struct jz4740_mmc_host *host;
   957		const struct of_device_id *match;
   958	
   959		mmc = mmc_alloc_host(sizeof(struct jz4740_mmc_host), &pdev->dev);
   960		if (!mmc) {
   961			dev_err(&pdev->dev, "Failed to alloc mmc host structure\n");
   962			return -ENOMEM;
   963		}
   964	
   965		host = mmc_priv(mmc);
   966	
   967		match = of_match_device(jz4740_mmc_of_match, &pdev->dev);
   968		if (match) {
   969			host->version = (enum jz4740_mmc_version)match->data;
   970		} else {
   971			/* JZ4740 should be the only one using legacy probe */
   972			host->version = JZ_MMC_JZ4740;
   973		}
   974	
   975		ret = mmc_of_parse(mmc);
   976		if (ret) {
   977			if (ret != -EPROBE_DEFER)
   978				dev_err(&pdev->dev,
   979					"could not parse device properties: %d\n", ret);
   980			goto err_free_host;
   981		}
   982	
   983		mmc_regulator_get_supply(mmc);
   984	
   985		host->irq = platform_get_irq(pdev, 0);
   986		if (host->irq < 0) {
   987			ret = host->irq;
   988			goto err_free_host;
   989		}
   990	
   991		host->clk = devm_clk_get(&pdev->dev, "mmc");
   992		if (IS_ERR(host->clk)) {
   993			ret = PTR_ERR(host->clk);
   994			dev_err(&pdev->dev, "Failed to get mmc clock\n");
   995			goto err_free_host;
   996		}
   997	
   998		host->mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   999		host->base = devm_ioremap_resource(&pdev->dev, host->mem_res);
  1000		if (IS_ERR(host->base)) {
  1001			ret = PTR_ERR(host->base);
  1002			dev_err(&pdev->dev, "Failed to ioremap base memory\n");
  1003			goto err_free_host;
  1004		}
  1005	
  1006		mmc->ops = &jz4740_mmc_ops;
  1007		if (!mmc->f_max)
  1008			mmc->f_max = JZ_MMC_CLK_RATE;
  1009	
  1010		/*
  1011		 * There seems to be a problem with this driver on the JZ4760 and
  1012		 * JZ4760B SoCs. There, when using the maximum rate supported (50 MHz),
  1013		 * the communication fails with many SD cards.
  1014		 * Until this bug is sorted out, limit the maximum rate to 24 MHz.
  1015		 */
> 1016		if (host->version == JZ_MMC_JZ4760 && mmc->f_max > JZ_MMC_CLK_RATE)
  1017			mmc->f_max = JZ_MMC_CLK_RATE;
  1018	
  1019		mmc->f_min = mmc->f_max / 128;
  1020		mmc->ocr_avail = MMC_VDD_32_33 | MMC_VDD_33_34;
  1021	
  1022		mmc->max_blk_size = (1 << 10) - 1;
  1023		mmc->max_blk_count = (1 << 15) - 1;
  1024		mmc->max_req_size = mmc->max_blk_size * mmc->max_blk_count;
  1025	
  1026		mmc->max_segs = 128;
  1027		mmc->max_seg_size = mmc->max_req_size;
  1028	
  1029		host->mmc = mmc;
  1030		host->pdev = pdev;
  1031		spin_lock_init(&host->lock);
  1032		host->irq_mask = ~0;
  1033	
  1034		jz4740_mmc_reset(host);
  1035	
  1036		ret = request_threaded_irq(host->irq, jz_mmc_irq, jz_mmc_irq_worker, 0,
  1037				dev_name(&pdev->dev), host);
  1038		if (ret) {
  1039			dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
  1040			goto err_free_host;
  1041		}
  1042	
  1043		jz4740_mmc_clock_disable(host);
  1044		timer_setup(&host->timeout_timer, jz4740_mmc_timeout, 0);
  1045	
  1046		ret = jz4740_mmc_acquire_dma_channels(host);
  1047		if (ret == -EPROBE_DEFER)
  1048			goto err_free_irq;
  1049		host->use_dma = !ret;
  1050	
  1051		platform_set_drvdata(pdev, host);
  1052		ret = mmc_add_host(mmc);
  1053	
  1054		if (ret) {
  1055			dev_err(&pdev->dev, "Failed to add mmc host: %d\n", ret);
  1056			goto err_release_dma;
  1057		}
  1058		dev_info(&pdev->dev, "JZ SD/MMC card driver registered\n");
  1059	
  1060		dev_info(&pdev->dev, "Using %s, %d-bit mode\n",
  1061			 host->use_dma ? "DMA" : "PIO",
  1062			 (mmc->caps & MMC_CAP_4_BIT_DATA) ? 4 : 1);
  1063	
  1064		return 0;
  1065	
  1066	err_release_dma:
  1067		if (host->use_dma)
  1068			jz4740_mmc_release_dma_channels(host);
  1069	err_free_irq:
  1070		free_irq(host->irq, host);
  1071	err_free_host:
  1072		mmc_free_host(mmc);
  1073	
  1074		return ret;
  1075	}
  1076	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
