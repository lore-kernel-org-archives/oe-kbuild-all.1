Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17108199D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706103972; cv=none; b=Grmq2iAAToD7qVwgkF28rZzZFNBV5V3YB1EMcFoSuwR0Wj8UjgnEOXNDu9k+hj3bgNLv9ZYrJ1CbmvjkjfRhip/fmrdYnH09UE1SkAN9G1/HA/RuAQd3uWT42gp389Ap1AbWaEOcbjB3Ty8n9pRD5VfGOpYtWddZ4X8U3J7vxtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706103972; c=relaxed/simple;
	bh=ryjkmByxSJ3YLZgphVCiklhjP7VzblkUpFIBA919fPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nRyGNHk2T3lHAajsnPNk+JkvfHeY+p9ZNaPR4f+0vQuO5jJBTTeAb5S2BEn7LTI9/X/fqn6DNgYzeuGPt6se5u+181C5OGV0ehT+onsYW4Wb/QqraoKsMFp1N6DyxhHzkiupr9PAzz6dKoNjvAWMVSqg7rRz9YydsSfrKlJ9NB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jit4fDB9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jit4fDB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706103971; x=1737639971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ryjkmByxSJ3YLZgphVCiklhjP7VzblkUpFIBA919fPg=;
  b=jit4fDB9/SVaJZhktZunaxP9chsekHfdmi3OnCEVXz6AMC5ApznY8P3V
   aCrvwbvdlH4IckIppMXwbF3/bU/y4dlUD2TXSmvdkg1cJhWnEWSHcKZAH
   hunq+Dds6TrvWy0Hkjo/0z6NHQ7+E8IpY13A/WO7qjoXQXhqlrF4Gk70q
   U+pMXfDbZV02kYBgpwlHfQtS0KGH52YiP3rISk0lrtXLT5mjD4lzyrNsi
   GhpMyN1K9ycMsJqsfiIWHS5Knfj6/S356I3SzM/XpZbZPvGs+BV0cTnRt
   LUmj/ChkycLYxEJfAOHu1VDXKeyUzobnx/EZSXRyl8Tz52brbIIT8s+L2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="741547"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="741547"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 05:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909664472"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="909664472"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Jan 2024 05:46:02 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSdZo-000881-0S;
	Wed, 24 Jan 2024 13:46:00 +0000
Date: Wed, 24 Jan 2024 21:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:gs101-spi 57/60] drivers/spi/spi-s3c64xx.c:457:41: error:
 implicit declaration of function 'iowrite16_32_rep'; did you mean
 'iowrite32_rep'?
Message-ID: <202401242109.vGwtsIdP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day gs101-spi
head:   8edbaa8e7635d31a991657eaa4f2692f9d3dbe82
commit: 6e802b2866d27c8c88eb68bbcc9d94d26674d3b6 [57/60] spi: s3c64xx: add support for google,gs101-spi
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240124/202401242109.vGwtsIdP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401242109.vGwtsIdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401242109.vGwtsIdP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-s3c64xx.c: In function 's3c64xx_enable_datapath':
>> drivers/spi/spi-s3c64xx.c:457:41: error: implicit declaration of function 'iowrite16_32_rep'; did you mean 'iowrite32_rep'? [-Werror=implicit-function-declaration]
     457 |                                         iowrite16_32_rep(regs + S3C64XX_SPI_TX_DATA,
         |                                         ^~~~~~~~~~~~~~~~
         |                                         iowrite32_rep
>> drivers/spi/spi-s3c64xx.c:466:41: error: implicit declaration of function 'iowrite8_32_rep'; did you mean 'iowrite32_rep'? [-Werror=implicit-function-declaration]
     466 |                                         iowrite8_32_rep(regs + S3C64XX_SPI_TX_DATA,
         |                                         ^~~~~~~~~~~~~~~
         |                                         iowrite32_rep
   cc1: some warnings being treated as errors


vim +457 drivers/spi/spi-s3c64xx.c

   415	
   416	static int s3c64xx_enable_datapath(struct s3c64xx_spi_driver_data *sdd,
   417					    struct spi_transfer *xfer, int dma_mode)
   418	{
   419		void __iomem *regs = sdd->regs;
   420		u32 modecfg, chcfg;
   421		int ret = 0;
   422	
   423		modecfg = readl(regs + S3C64XX_SPI_MODE_CFG);
   424		modecfg &= ~(S3C64XX_SPI_MODE_TXDMA_ON | S3C64XX_SPI_MODE_RXDMA_ON);
   425	
   426		chcfg = readl(regs + S3C64XX_SPI_CH_CFG);
   427		chcfg &= ~S3C64XX_SPI_CH_TXCH_ON;
   428	
   429		if (dma_mode) {
   430			chcfg &= ~S3C64XX_SPI_CH_RXCH_ON;
   431		} else {
   432			/* Always shift in data in FIFO, even if xfer is Tx only,
   433			 * this helps setting PCKT_CNT value for generating clocks
   434			 * as exactly needed.
   435			 */
   436			chcfg |= S3C64XX_SPI_CH_RXCH_ON;
   437			writel(((xfer->len * 8 / sdd->cur_bpw) & 0xffff)
   438						| S3C64XX_SPI_PACKET_CNT_EN,
   439						regs + S3C64XX_SPI_PACKET_CNT);
   440		}
   441	
   442		if (xfer->tx_buf != NULL) {
   443			sdd->state |= TXBUSY;
   444			chcfg |= S3C64XX_SPI_CH_TXCH_ON;
   445			if (dma_mode) {
   446				modecfg |= S3C64XX_SPI_MODE_TXDMA_ON;
   447				ret = s3c64xx_prepare_dma(&sdd->tx_dma, &xfer->tx_sg);
   448			} else {
   449				switch (sdd->cur_bpw) {
   450				case 32:
   451					iowrite32_rep(regs + S3C64XX_SPI_TX_DATA,
   452						xfer->tx_buf, xfer->len / 4);
   453					break;
   454				case 16:
   455					if (sdd->port_conf->quirks &
   456					    S3C64XX_SPI_GS1O1_32BIT_REG_IO_WIDTH)
 > 457						iowrite16_32_rep(regs + S3C64XX_SPI_TX_DATA,
   458								 xfer->tx_buf, xfer->len / 2);
   459					else
   460						iowrite16_rep(regs + S3C64XX_SPI_TX_DATA,
   461							      xfer->tx_buf, xfer->len / 2);
   462					break;
   463				default:
   464					if (sdd->port_conf->quirks &
   465					    S3C64XX_SPI_GS1O1_32BIT_REG_IO_WIDTH)
 > 466						iowrite8_32_rep(regs + S3C64XX_SPI_TX_DATA,
   467								xfer->tx_buf, xfer->len);
   468					else
   469						iowrite8_rep(regs + S3C64XX_SPI_TX_DATA,
   470							     xfer->tx_buf, xfer->len);
   471					break;
   472				}
   473			}
   474		}
   475	
   476		if (xfer->rx_buf != NULL) {
   477			sdd->state |= RXBUSY;
   478	
   479			if (sdd->port_conf->high_speed && sdd->cur_speed >= 30000000UL
   480						&& !(sdd->cur_mode & SPI_CPHA))
   481				chcfg |= S3C64XX_SPI_CH_HS_EN;
   482	
   483			if (dma_mode) {
   484				modecfg |= S3C64XX_SPI_MODE_RXDMA_ON;
   485				chcfg |= S3C64XX_SPI_CH_RXCH_ON;
   486				writel(((xfer->len * 8 / sdd->cur_bpw) & 0xffff)
   487						| S3C64XX_SPI_PACKET_CNT_EN,
   488						regs + S3C64XX_SPI_PACKET_CNT);
   489				ret = s3c64xx_prepare_dma(&sdd->rx_dma, &xfer->rx_sg);
   490			}
   491		}
   492	
   493		if (ret)
   494			return ret;
   495	
   496		writel(modecfg, regs + S3C64XX_SPI_MODE_CFG);
   497		writel(chcfg, regs + S3C64XX_SPI_CH_CFG);
   498	
   499		return 0;
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
