Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527DB171A7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 12:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695470912; x=1727006912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5J1bGD19HdPapyGoHa6tVUNwHVOi2xRGUxEG8KuqRB4=;
  b=ETQkssGFUKo2jr7Lz/XRrVx8Xfq2g4e3LCd+Q9ZKuPtjihxUn4fI6zSK
   X1DZJIV9U7YnlkwFvUzH4FD7GuKhnTCV7sL0Hxs4OW9lrsjwmYze6ftlP
   hrL8CTZhlk8edCl3/7Tb2H83x8XxSGSnZrNTGbL0zYtfrOqRoHNRUaSbu
   WE6YESPcwC//9ZOn6WHQ1Ph7Uq+doolJ/FoN09erD4Fo8Dq1qtWtqvto3
   toCICoHEQZH/EuCCdmoFLU6fiFbj8PwBEDc/3/uXWpZJzVKdamDYnt6P2
   XLNPvY6ObJIUpRrfPgWKJdvn3QvCpbj7J7qdCNWjXZp0H+CVIw9KYf7tC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="384846300"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="384846300"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 05:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="741405622"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="741405622"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Sep 2023 05:08:29 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk1Qx-0002L8-17;
	Sat, 23 Sep 2023 12:08:27 +0000
Date: Sat, 23 Sep 2023 20:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-dango 7283/7341]
 drivers/spi/spi-mt65xx.c:347:33: warning: unused variable 'chip_config'
Message-ID: <202309232010.QMryMxtf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   1c519676c30e4e5a2acf84784a1e524528bf664d
commit: b7a60ab2e5c88998e84663e9ac00d97fe940b918 [7283/7341] drivers: spi-mt65xx: Move chip_config to driver's private data
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230923/202309232010.QMryMxtf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309232010.QMryMxtf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309232010.QMryMxtf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-mt65xx.c: In function 'mtk_spi_hw_init':
>> drivers/spi/spi-mt65xx.c:347:33: warning: unused variable 'chip_config' [-Wunused-variable]
     347 |         struct mtk_chip_config *chip_config = spi->controller_data;
         |                                 ^~~~~~~~~~~


vim +/chip_config +347 drivers/spi/spi-mt65xx.c

04e6bb0d6bb127b Mason Zhang                         2021-08-04  341  
cae1578847e60a5 Yang Yingliang                      2023-08-23  342  static int mtk_spi_hw_init(struct spi_controller *host,
7e963fb2a33ce48 Leilk Liu                           2022-03-15  343  			   struct spi_device *spi)
a568231f463225e Leilk Liu                           2015-08-07  344  {
79b5d3f24dcec54 Leilk Liu                           2015-10-26  345  	u16 cpha, cpol;
a568231f463225e Leilk Liu                           2015-08-07  346  	u32 reg_val;
58a984c79a68d50 Leilk Liu                           2015-10-26 @347  	struct mtk_chip_config *chip_config = spi->controller_data;
cae1578847e60a5 Yang Yingliang                      2023-08-23  348  	struct mtk_spi *mdata = spi_controller_get_devdata(host);
79b5d3f24dcec54 Leilk Liu                           2015-10-26  349  
79b5d3f24dcec54 Leilk Liu                           2015-10-26  350  	cpha = spi->mode & SPI_CPHA ? 1 : 0;
79b5d3f24dcec54 Leilk Liu                           2015-10-26  351  	cpol = spi->mode & SPI_CPOL ? 1 : 0;
79b5d3f24dcec54 Leilk Liu                           2015-10-26  352  
79b5d3f24dcec54 Leilk Liu                           2015-10-26  353  	reg_val = readl(mdata->base + SPI_CMD_REG);
7e963fb2a33ce48 Leilk Liu                           2022-03-15  354  	if (mdata->dev_comp->ipm_design) {
7e963fb2a33ce48 Leilk Liu                           2022-03-15  355  		/* SPI transfer without idle time until packet length done */
7e963fb2a33ce48 Leilk Liu                           2022-03-15  356  		reg_val |= SPI_CMD_IPM_NONIDLE_MODE;
7e963fb2a33ce48 Leilk Liu                           2022-03-15  357  		if (spi->mode & SPI_LOOP)
7e963fb2a33ce48 Leilk Liu                           2022-03-15  358  			reg_val |= SPI_CMD_IPM_SPIM_LOOP;
7e963fb2a33ce48 Leilk Liu                           2022-03-15  359  		else
7e963fb2a33ce48 Leilk Liu                           2022-03-15  360  			reg_val &= ~SPI_CMD_IPM_SPIM_LOOP;
7e963fb2a33ce48 Leilk Liu                           2022-03-15  361  	}
7e963fb2a33ce48 Leilk Liu                           2022-03-15  362  
79b5d3f24dcec54 Leilk Liu                           2015-10-26  363  	if (cpha)
79b5d3f24dcec54 Leilk Liu                           2015-10-26  364  		reg_val |= SPI_CMD_CPHA;
79b5d3f24dcec54 Leilk Liu                           2015-10-26  365  	else
79b5d3f24dcec54 Leilk Liu                           2015-10-26  366  		reg_val &= ~SPI_CMD_CPHA;
79b5d3f24dcec54 Leilk Liu                           2015-10-26  367  	if (cpol)
79b5d3f24dcec54 Leilk Liu                           2015-10-26  368  		reg_val |= SPI_CMD_CPOL;
79b5d3f24dcec54 Leilk Liu                           2015-10-26  369  	else
79b5d3f24dcec54 Leilk Liu                           2015-10-26  370  		reg_val &= ~SPI_CMD_CPOL;
a568231f463225e Leilk Liu                           2015-08-07  371  
a568231f463225e Leilk Liu                           2015-08-07  372  	/* set the mlsbx and mlsbtx */
3e582c6e911ffe6 Leilk Liu                           2019-06-05  373  	if (spi->mode & SPI_LSB_FIRST) {
a71d6ea6d3ec3e8 Leilk Liu                           2015-08-20  374  		reg_val &= ~SPI_CMD_TXMSBF;
a71d6ea6d3ec3e8 Leilk Liu                           2015-08-20  375  		reg_val &= ~SPI_CMD_RXMSBF;
3e582c6e911ffe6 Leilk Liu                           2019-06-05  376  	} else {
3e582c6e911ffe6 Leilk Liu                           2019-06-05  377  		reg_val |= SPI_CMD_TXMSBF;
3e582c6e911ffe6 Leilk Liu                           2019-06-05  378  		reg_val |= SPI_CMD_RXMSBF;
3e582c6e911ffe6 Leilk Liu                           2019-06-05  379  	}
a568231f463225e Leilk Liu                           2015-08-07  380  
a568231f463225e Leilk Liu                           2015-08-07  381  	/* set the tx/rx endian */
44f636da4e71e0c Leilk Liu                           2015-08-20  382  #ifdef __LITTLE_ENDIAN
44f636da4e71e0c Leilk Liu                           2015-08-20  383  	reg_val &= ~SPI_CMD_TX_ENDIAN;
44f636da4e71e0c Leilk Liu                           2015-08-20  384  	reg_val &= ~SPI_CMD_RX_ENDIAN;
44f636da4e71e0c Leilk Liu                           2015-08-20  385  #else
44f636da4e71e0c Leilk Liu                           2015-08-20  386  	reg_val |= SPI_CMD_TX_ENDIAN;
44f636da4e71e0c Leilk Liu                           2015-08-20  387  	reg_val |= SPI_CMD_RX_ENDIAN;
44f636da4e71e0c Leilk Liu                           2015-08-20  388  #endif
a568231f463225e Leilk Liu                           2015-08-07  389  
058fe49da3b6ab7 Leilk Liu                           2017-06-12  390  	if (mdata->dev_comp->enhance_timing) {
ae7c2d342a10dbe Luhua Xu                            2019-11-18  391  		/* set CS polarity */
ae7c2d342a10dbe Luhua Xu                            2019-11-18  392  		if (spi->mode & SPI_CS_HIGH)
058fe49da3b6ab7 Leilk Liu                           2017-06-12  393  			reg_val |= SPI_CMD_CS_POL;
058fe49da3b6ab7 Leilk Liu                           2017-06-12  394  		else
058fe49da3b6ab7 Leilk Liu                           2017-06-12  395  			reg_val &= ~SPI_CMD_CS_POL;
ae7c2d342a10dbe Luhua Xu                            2019-11-18  396  
b7a60ab2e5c8899 SkyLake.Huang                       2022-06-23  397  		if (mdata->sample_sel)
058fe49da3b6ab7 Leilk Liu                           2017-06-12  398  			reg_val |= SPI_CMD_SAMPLE_SEL;
058fe49da3b6ab7 Leilk Liu                           2017-06-12  399  		else
058fe49da3b6ab7 Leilk Liu                           2017-06-12  400  			reg_val &= ~SPI_CMD_SAMPLE_SEL;
058fe49da3b6ab7 Leilk Liu                           2017-06-12  401  	}
058fe49da3b6ab7 Leilk Liu                           2017-06-12  402  
a568231f463225e Leilk Liu                           2015-08-07  403  	/* set finish and pause interrupt always enable */
152933244a1a323 Leilk Liu                           2015-08-27  404  	reg_val |= SPI_CMD_FINISH_IE | SPI_CMD_PAUSE_IE;
a568231f463225e Leilk Liu                           2015-08-07  405  
a568231f463225e Leilk Liu                           2015-08-07  406  	/* disable dma mode */
a568231f463225e Leilk Liu                           2015-08-07  407  	reg_val &= ~(SPI_CMD_TX_DMA | SPI_CMD_RX_DMA);
a568231f463225e Leilk Liu                           2015-08-07  408  
a568231f463225e Leilk Liu                           2015-08-07  409  	/* disable deassert mode */
a568231f463225e Leilk Liu                           2015-08-07  410  	reg_val &= ~SPI_CMD_DEASSERT;
a568231f463225e Leilk Liu                           2015-08-07  411  
a568231f463225e Leilk Liu                           2015-08-07  412  	writel(reg_val, mdata->base + SPI_CMD_REG);
a568231f463225e Leilk Liu                           2015-08-07  413  
a568231f463225e Leilk Liu                           2015-08-07  414  	/* pad select */
a568231f463225e Leilk Liu                           2015-08-07  415  	if (mdata->dev_comp->need_pad_sel)
9e264f3f85a56cc Amit Kumar Mahapatra via Alsa-devel 2023-03-10  416  		writel(mdata->pad_sel[spi_get_chipselect(spi, 0)],
37457607ecaffe5 Leilk Liu                           2015-10-26  417  		       mdata->base + SPI_PAD_SEL_REG);
a568231f463225e Leilk Liu                           2015-08-07  418  
f84d866ab43fcc2 Mason Zhang                         2021-07-13  419  	/* tick delay */
03b1be379dcee2e Leilk Liu                           2022-03-15  420  	if (mdata->dev_comp->enhance_timing) {
7e963fb2a33ce48 Leilk Liu                           2022-03-15  421  		if (mdata->dev_comp->ipm_design) {
7e963fb2a33ce48 Leilk Liu                           2022-03-15  422  			reg_val = readl(mdata->base + SPI_CMD_REG);
7e963fb2a33ce48 Leilk Liu                           2022-03-15  423  			reg_val &= ~SPI_CMD_IPM_GET_TICKDLY_MASK;
b7a60ab2e5c8899 SkyLake.Huang                       2022-06-23  424  			reg_val |= ((mdata->get_tick_dly & 0x7)
7e963fb2a33ce48 Leilk Liu                           2022-03-15  425  				    << SPI_CMD_IPM_GET_TICKDLY_OFFSET);
7e963fb2a33ce48 Leilk Liu                           2022-03-15  426  			writel(reg_val, mdata->base + SPI_CMD_REG);
7e963fb2a33ce48 Leilk Liu                           2022-03-15  427  		} else {
7e963fb2a33ce48 Leilk Liu                           2022-03-15  428  			reg_val = readl(mdata->base + SPI_CFG1_REG);
f84d866ab43fcc2 Mason Zhang                         2021-07-13  429  			reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK;
b7a60ab2e5c8899 SkyLake.Huang                       2022-06-23  430  			reg_val |= ((mdata->get_tick_dly & 0x7)
f84d866ab43fcc2 Mason Zhang                         2021-07-13  431  				    << SPI_CFG1_GET_TICK_DLY_OFFSET);
7e963fb2a33ce48 Leilk Liu                           2022-03-15  432  			writel(reg_val, mdata->base + SPI_CFG1_REG);
7e963fb2a33ce48 Leilk Liu                           2022-03-15  433  		}
03b1be379dcee2e Leilk Liu                           2022-03-15  434  	} else {
7e963fb2a33ce48 Leilk Liu                           2022-03-15  435  		reg_val = readl(mdata->base + SPI_CFG1_REG);
03b1be379dcee2e Leilk Liu                           2022-03-15  436  		reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK_V1;
b7a60ab2e5c8899 SkyLake.Huang                       2022-06-23  437  		reg_val |= ((mdata->get_tick_dly & 0x3)
03b1be379dcee2e Leilk Liu                           2022-03-15  438  			    << SPI_CFG1_GET_TICK_DLY_OFFSET_V1);
f84d866ab43fcc2 Mason Zhang                         2021-07-13  439  		writel(reg_val, mdata->base + SPI_CFG1_REG);
7e963fb2a33ce48 Leilk Liu                           2022-03-15  440  	}
f84d866ab43fcc2 Mason Zhang                         2021-07-13  441  
04e6bb0d6bb127b Mason Zhang                         2021-08-04  442  	/* set hw cs timing */
04e6bb0d6bb127b Mason Zhang                         2021-08-04  443  	mtk_spi_set_hw_cs_timing(spi);
a568231f463225e Leilk Liu                           2015-08-07  444  	return 0;
a568231f463225e Leilk Liu                           2015-08-07  445  }
a568231f463225e Leilk Liu                           2015-08-07  446  

:::::: The code at line 347 was first introduced by commit
:::::: 58a984c79a68d508ccfccf4b82c0eaf7f487c399 spi: mediatek: handle controller_data in mtk_spi_setup

:::::: TO: Leilk Liu <leilk.liu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
