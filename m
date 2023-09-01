Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879BF3C3B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 07:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693553972; x=1725089972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lZYuWgY0uH2gjJiayvbG+pfQRO+9GPFN+8M8vtGhosM=;
  b=gMEPN3jQuTsX/0zbGNmKgtjJtLLahByAJofNYqZOoc5WAxA4BHPdxH7K
   WXb7+U4Q/eeLA5VKmbmJIB8T5kNHFWisfMCmvyYfPqJDaX5atRbBvv305
   29jF/q1PuyPtS/xKttI7F5Bh1HQ0tJl70M+fCOqBMOWFN+I9RGyWXASqS
   1OeW1HCRSuX0R9lEO3GzFDPA9tvZDnquKJNxETMEUmuKhXt8t0Gx8GB9W
   CObPRWhyUv4zBvJyLjHHDlHrFf9LkOwvtuf0WhoW6O4i8vW3S/NSc9Uz6
   mD36eI02ssVoX2dEjzHJgnegCQmMMNVW9yGtow48sqOmua9HZKBGXguDD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379943891"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="379943891"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 00:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="809979371"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="809979371"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Sep 2023 00:39:30 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbyka-00014F-14;
	Fri, 01 Sep 2023 07:39:28 +0000
Date: Fri, 1 Sep 2023 15:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6161/24603] sound/soc/fsl/fsl_ssi.c:295:
 warning: Function parameter or member 'audio_config' not described in
 'fsl_ssi'
Message-ID: <202309011550.t71iNyH0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 0d7e19936004ad259260e7b8ab33630d05acec26 [6161/24603] Merge branch 'dma/next' into next
config: arc-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230901/202309011550.t71iNyH0-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011550.t71iNyH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011550.t71iNyH0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/fsl_ssi.c:295: warning: Function parameter or member 'use_dyna_fifo' not described in 'fsl_ssi'
>> sound/soc/fsl/fsl_ssi.c:295: warning: Function parameter or member 'audio_config' not described in 'fsl_ssi'


vim +295 sound/soc/fsl/fsl_ssi.c

fcdbadef378bc9 Sascha Hauer         2014-05-27  207  
17467f23395f05 Timur Tabi           2008-01-11  208  /**
6ababfc06236e0 Pierre-Louis Bossart 2020-07-02  209   * struct fsl_ssi - per-SSI private data
7a8fceb74de407 Nicolin Chen         2017-12-17  210   * @regs: Pointer to the regmap registers
17467f23395f05 Timur Tabi           2008-01-11  211   * @irq: IRQ of this SSI
737a6b418a83d8 Markus Pargmann      2014-05-27  212   * @cpu_dai_drv: CPU DAI driver for this device
737a6b418a83d8 Markus Pargmann      2014-05-27  213   * @dai_fmt: DAI configuration this device is currently used with
e0582731abe004 Nicolin Chen         2018-02-12  214   * @streams: Mask of current active streams: BIT(TX) and BIT(RX)
8bc84a3344ca27 Nicolin Chen         2017-12-17  215   * @i2s_net: I2S and Network mode configurations of SCR register
fac8a5a5ea40b0 Nicolin Chen         2018-04-07  216   *           (this is the initial settings based on the DAI format)
badc9595bc1568 Nicolin Chen         2018-02-12  217   * @synchronous: Use synchronous mode - both of TX and RX use STCK and SFCK
737a6b418a83d8 Markus Pargmann      2014-05-27  218   * @use_dma: DMA is used or FIQ with stream filter
7a8fceb74de407 Nicolin Chen         2017-12-17  219   * @use_dual_fifo: DMA with support for dual FIFO mode
7a8fceb74de407 Nicolin Chen         2017-12-17  220   * @has_ipg_clk_name: If "ipg" is in the clock name list of device tree
7a8fceb74de407 Nicolin Chen         2017-12-17  221   * @fifo_depth: Depth of the SSI FIFOs
7a8fceb74de407 Nicolin Chen         2017-12-17  222   * @slot_width: Width of each DAI slot
7a8fceb74de407 Nicolin Chen         2017-12-17  223   * @slots: Number of slots
2474e4037c4e3f Nicolin Chen         2017-12-17  224   * @regvals: Specific RX/TX register settings
7a8fceb74de407 Nicolin Chen         2017-12-17  225   * @clk: Clock source to access register
7a8fceb74de407 Nicolin Chen         2017-12-17  226   * @baudclk: Clock source to generate bit and frame-sync clocks
737a6b418a83d8 Markus Pargmann      2014-05-27  227   * @baudclk_streams: Active streams that are using baudclk
7a8fceb74de407 Nicolin Chen         2017-12-17  228   * @regcache_sfcsr: Cache sfcsr register value during suspend and resume
7a8fceb74de407 Nicolin Chen         2017-12-17  229   * @regcache_sacnt: Cache sacnt register value during suspend and resume
737a6b418a83d8 Markus Pargmann      2014-05-27  230   * @dma_params_tx: DMA transmit parameters
737a6b418a83d8 Markus Pargmann      2014-05-27  231   * @dma_params_rx: DMA receive parameters
737a6b418a83d8 Markus Pargmann      2014-05-27  232   * @ssi_phys: physical address of the SSI registers
737a6b418a83d8 Markus Pargmann      2014-05-27  233   * @fiq_params: FIQ stream filtering parameters
76f3845110d7d4 Nicolin Chen         2018-02-12  234   * @card_pdev: Platform_device pointer to register a sound card for PowerPC or
76f3845110d7d4 Nicolin Chen         2018-02-12  235   *             to register a CODEC platform device for AC97
76f3845110d7d4 Nicolin Chen         2018-02-12  236   * @card_name: Platform_device name to register a sound card for PowerPC or
76f3845110d7d4 Nicolin Chen         2018-02-12  237   *             to register a CODEC platform device for AC97
76f3845110d7d4 Nicolin Chen         2018-02-12  238   * @card_idx: The index of SSI to register a sound card for PowerPC or
76f3845110d7d4 Nicolin Chen         2018-02-12  239   *            to register a CODEC platform device for AC97
737a6b418a83d8 Markus Pargmann      2014-05-27  240   * @dbg_stats: Debugging statistics
dcfcf2c2cd7190 Xiubo Li             2015-08-12  241   * @soc: SoC specific data
7a8fceb74de407 Nicolin Chen         2017-12-17  242   * @dev: Pointer to &pdev->dev
7a8fceb74de407 Nicolin Chen         2017-12-17  243   * @fifo_watermark: The FIFO watermark setting. Notifies DMA when there are
7a8fceb74de407 Nicolin Chen         2017-12-17  244   *                  @fifo_watermark or fewer words in TX fifo or
4ee437fbf626b5 Caleb Crome          2017-01-03  245   *                  @fifo_watermark or more empty words in RX fifo.
7a8fceb74de407 Nicolin Chen         2017-12-17  246   * @dma_maxburst: Max number of words to transfer in one go. So far,
4ee437fbf626b5 Caleb Crome          2017-01-03  247   *                this is always the same as fifo_watermark.
7a8fceb74de407 Nicolin Chen         2017-12-17  248   * @ac97_reg_lock: Mutex lock to serialize AC97 register access operations
17467f23395f05 Timur Tabi           2008-01-11  249   */
f31768349447cd Nicolin Chen         2017-12-17  250  struct fsl_ssi {
43248122010116 Markus Pargmann      2014-05-27  251  	struct regmap *regs;
9e446ad500db0f Fabio Estevam        2015-01-14  252  	int irq;
f0fba2ad1b6b53 Liam Girdwood        2010-03-17  253  	struct snd_soc_dai_driver cpu_dai_drv;
17467f23395f05 Timur Tabi           2008-01-11  254  
737a6b418a83d8 Markus Pargmann      2014-05-27  255  	unsigned int dai_fmt;
e0582731abe004 Nicolin Chen         2018-02-12  256  	u8 streams;
8bc84a3344ca27 Nicolin Chen         2017-12-17  257  	u8 i2s_net;
badc9595bc1568 Nicolin Chen         2018-02-12  258  	bool synchronous;
de623ece5be03e Markus Pargmann      2013-07-27  259  	bool use_dma;
0da9e55e71bc23 Nicolin Chen         2013-11-13  260  	bool use_dual_fifo;
abc566fea3952a Shengjiu Wang        2018-09-28  261  	bool use_dyna_fifo;
f4a43caba7d495 Shengjiu Wang        2014-09-16  262  	bool has_ipg_clk_name;
737a6b418a83d8 Markus Pargmann      2014-05-27  263  	unsigned int fifo_depth;
b0a7043d5c2ccd Nicolin Chen         2017-09-13  264  	unsigned int slot_width;
b0a7043d5c2ccd Nicolin Chen         2017-09-13  265  	unsigned int slots;
2474e4037c4e3f Nicolin Chen         2017-12-17  266  	struct fsl_ssi_regvals regvals[2];
737a6b418a83d8 Markus Pargmann      2014-05-27  267  
95cd98f9a6dcf1 Shawn Guo            2012-03-29  268  	struct clk *clk;
737a6b418a83d8 Markus Pargmann      2014-05-27  269  	struct clk *baudclk;
d429d8e3324cae Markus Pargmann      2014-05-27  270  	unsigned int baudclk_streams;
737a6b418a83d8 Markus Pargmann      2014-05-27  271  
05cf237972fe65 Zidan Wang           2015-09-18  272  	u32 regcache_sfcsr;
3f1c241f0f5f90 Maciej S. Szmigiero  2015-12-20  273  	u32 regcache_sacnt;
05cf237972fe65 Zidan Wang           2015-09-18  274  
a8909c9bc5803f Lars-Peter Clausen   2013-04-03  275  	struct snd_dmaengine_dai_dma_data dma_params_tx;
a8909c9bc5803f Lars-Peter Clausen   2013-04-03  276  	struct snd_dmaengine_dai_dma_data dma_params_rx;
737a6b418a83d8 Markus Pargmann      2014-05-27  277  	dma_addr_t ssi_phys;
737a6b418a83d8 Markus Pargmann      2014-05-27  278  
de623ece5be03e Markus Pargmann      2013-07-27  279  	struct imx_pcm_fiq_params fiq_params;
737a6b418a83d8 Markus Pargmann      2014-05-27  280  
76f3845110d7d4 Nicolin Chen         2018-02-12  281  	struct platform_device *card_pdev;
76f3845110d7d4 Nicolin Chen         2018-02-12  282  	char card_name[32];
76f3845110d7d4 Nicolin Chen         2018-02-12  283  	u32 card_idx;
09ce1111f38931 Shawn Guo            2012-03-16  284  
f138e6212427d0 Markus Pargmann      2014-04-28  285  	struct fsl_ssi_dbg dbg_stats;
17467f23395f05 Timur Tabi           2008-01-11  286  
fcdbadef378bc9 Sascha Hauer         2014-05-27  287  	const struct fsl_ssi_soc_data *soc;
0096b693962d3a Arnaud Mouiche       2016-05-03  288  	struct device *dev;
4ee437fbf626b5 Caleb Crome          2017-01-03  289  
4ee437fbf626b5 Caleb Crome          2017-01-03  290  	u32 fifo_watermark;
4ee437fbf626b5 Caleb Crome          2017-01-03  291  	u32 dma_maxburst;
b880b8056b3128 Maciej S. Szmigiero  2017-11-20  292  
b880b8056b3128 Maciej S. Szmigiero  2017-11-20  293  	struct mutex ac97_reg_lock;
53595afde7f05f Shengjiu Wang        2021-03-25  294  	struct sdma_audio_config audio_config[2];
c1953bfe1329ee Markus Pargmann      2013-12-20 @295  };
171d683d2ac4ab Markus Pargmann      2014-04-28  296  

:::::: The code at line 295 was first introduced by commit
:::::: c1953bfe1329eeb16991d430d574c4280697ad17 ASoC: fsl-ssi: Add imx51-ssi and of_device_id matching

:::::: TO: Markus Pargmann <mpa@pengutronix.de>
:::::: CC: Mark Brown <broonie@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
