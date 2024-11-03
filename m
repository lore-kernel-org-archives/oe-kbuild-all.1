Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28584EB50
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 23:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730676602; cv=none; b=jO2CiRRbs2hx53PthT7qTqrOAv3ZpAKHR9OG9wQG+rxF4m5/BRi8tmrqoMbcpgiVbPMHBTEhy8QXf01SEL5tujC4W6lkvKiE7rRA+4Gsm+gNs4enf3iHd5CGCUWrnfIttOWIKz0maQYg3Wctnz5wCOjnIDAkKoQ++P6L/Ghx/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730676602; c=relaxed/simple;
	bh=79xEwvPvrc5fN7S3WKM7vQwugFKK7joXbc7U3RWs3Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G3YcIavMmFPfC7yvivUavrvPGEwgRyI7W7AsvuHwRFxi4mW+EKB3OsEanDUeH72YAxJw5JIvDbcyzvHPGgLed4n8myHfIfID4FZRPWh62EVMrYdWPiTUBnUKPsdKCxO3MK20s5tiPMkWejYUhJ7kWioqRhQG5KRhQMQi8VnYZWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mp+NzpaH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mp+NzpaH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730676599; x=1762212599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=79xEwvPvrc5fN7S3WKM7vQwugFKK7joXbc7U3RWs3Nw=;
  b=mp+NzpaHyeKJrOK40xTwzSaD2E71vkJLzpzcjTmEjmv8cGS5ixBTsxKR
   LUbteQAu16MdgzTs0LAszdecFqZ2VXSFMwNkEkF8np7ejEUBkN8QJ63fX
   XkZyk4V2ICFBLnC/osmEOtWk6XDb28ticfV2FT5TkbEQRlfdoe0KzdZ7y
   Rh9bPXTdQiTK7WpdcrEJziZSfhoJS0pIzDOM99pk+oa4TOxuDZA6j6xQf
   dlHvySyS7FrZQC4P5nP14QVl/stK6GVhSE6970oZtLqESAAJkW8jM+gDK
   jZE9q/WvmTqZ7uNlP2yM533cjt/4MJGATwv9SrsLTl3F8TdjM29RE21lN
   A==;
X-CSE-ConnectionGUID: d+j56xgzTBSgKzFHEhvQXw==
X-CSE-MsgGUID: nRRDnE0sQsOyYVtHhkPoKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="33201098"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="33201098"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 15:29:59 -0800
X-CSE-ConnectionGUID: hNxT/OKtTEmNIHMqUfG51Q==
X-CSE-MsgGUID: +v/DYbMUSMmcm4kgIS/nRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83162449"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Nov 2024 15:29:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7k2d-000kHl-2V;
	Sun, 03 Nov 2024 23:29:55 +0000
Date: Mon, 4 Nov 2024 07:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-rsslro 74/80]
 drivers/spi/spi-mt65xx.c:348:33: warning: unused variable 'chip_config'
Message-ID: <202411040745.vOFbiCQF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-rsslro
head:   8f436b83a2c7a7e02b26f01d869eb879d88b5805
commit: 8616912a95a6ddcfb98477c5c1d7efbf4ba3ab18 [74/80] drivers: spi-mt65xx: Move chip_config to driver's private data
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241104/202411040745.vOFbiCQF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040745.vOFbiCQF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040745.vOFbiCQF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-mt65xx.c: In function 'mtk_spi_hw_init':
>> drivers/spi/spi-mt65xx.c:348:33: warning: unused variable 'chip_config' [-Wunused-variable]
     348 |         struct mtk_chip_config *chip_config = spi->controller_data;
         |                                 ^~~~~~~~~~~
--
>> drivers/spi/spi-mt65xx.c:176: warning: Function parameter or struct member 'sample_sel' not described in 'mtk_spi'
>> drivers/spi/spi-mt65xx.c:176: warning: Function parameter or struct member 'get_tick_dly' not described in 'mtk_spi'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/chip_config +348 drivers/spi/spi-mt65xx.c

a568231f463225 Leilk Liu                           2015-08-07  130  
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  131  /**
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  132   * struct mtk_spi - SPI driver instance
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  133   * @base:		Start address of the SPI controller registers
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  134   * @state:		SPI controller state
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  135   * @pad_num:		Number of pad_sel entries
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  136   * @pad_sel:		Groups of pins to select
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  137   * @parent_clk:		Parent of sel_clk
cae1578847e60a Yang Yingliang                      2023-08-23  138   * @sel_clk:		SPI host mux clock
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  139   * @spi_clk:		Peripheral clock
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  140   * @spi_hclk:		AHB bus clock
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  141   * @cur_transfer:	Currently processed SPI transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  142   * @xfer_len:		Number of bytes to transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  143   * @num_xfered:		Number of transferred bytes
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  144   * @tx_sgl:		TX transfer scatterlist
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  145   * @rx_sgl:		RX transfer scatterlist
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  146   * @tx_sgl_len:		Size of TX DMA transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  147   * @rx_sgl_len:		Size of RX DMA transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  148   * @dev_comp:		Device data structure
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  149   * @spi_clk_hz:		Current SPI clock in Hz
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  150   * @spimem_done:	SPI-MEM operation completion
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  151   * @use_spimem:		Enables SPI-MEM
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  152   * @dev:		Device pointer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  153   * @tx_dma:		DMA start for SPI-MEM TX
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  154   * @rx_dma:		DMA start for SPI-MEM RX
3c5cd2e23fe4c8 AngeloGioacchino Del Regno          2022-04-07  155   */
a568231f463225 Leilk Liu                           2015-08-07  156  struct mtk_spi {
a568231f463225 Leilk Liu                           2015-08-07  157  	void __iomem *base;
a568231f463225 Leilk Liu                           2015-08-07  158  	u32 state;
37457607ecaffe Leilk Liu                           2015-10-26  159  	int pad_num;
37457607ecaffe Leilk Liu                           2015-10-26  160  	u32 *pad_sel;
a740f4e684c020 Leilk Liu                           2022-03-21  161  	struct clk *parent_clk, *sel_clk, *spi_clk, *spi_hclk;
a568231f463225 Leilk Liu                           2015-08-07  162  	struct spi_transfer *cur_transfer;
a568231f463225 Leilk Liu                           2015-08-07  163  	u32 xfer_len;
00bca73bfca4fb Peter Shih                          2018-09-10  164  	u32 num_xfered;
a568231f463225 Leilk Liu                           2015-08-07  165  	struct scatterlist *tx_sgl, *rx_sgl;
a568231f463225 Leilk Liu                           2015-08-07  166  	u32 tx_sgl_len, rx_sgl_len;
a568231f463225 Leilk Liu                           2015-08-07  167  	const struct mtk_spi_compatible *dev_comp;
162a31effc4182 Mason Zhang                         2021-06-29  168  	u32 spi_clk_hz;
9f763fd20da7d8 Leilk Liu                           2022-03-21  169  	struct completion spimem_done;
9f763fd20da7d8 Leilk Liu                           2022-03-21  170  	bool use_spimem;
9f763fd20da7d8 Leilk Liu                           2022-03-21  171  	struct device *dev;
9f763fd20da7d8 Leilk Liu                           2022-03-21  172  	dma_addr_t tx_dma;
9f763fd20da7d8 Leilk Liu                           2022-03-21  173  	dma_addr_t rx_dma;
8616912a95a6dd SkyLake.Huang                       2022-06-23  174  	u32 sample_sel;
8616912a95a6dd SkyLake.Huang                       2022-06-23  175  	u32 get_tick_dly;
a568231f463225 Leilk Liu                           2015-08-07 @176  };
a568231f463225 Leilk Liu                           2015-08-07  177  
4eaf6f730355ce Leilk Liu                           2015-12-31  178  static const struct mtk_spi_compatible mtk_common_compat;
fc4f226fece3d0 Leilk Liu                           2017-06-12  179  
b6b1f2d9cf796c leilk.liu@mediatek.com              2017-06-20  180  static const struct mtk_spi_compatible mt2712_compat = {
b6b1f2d9cf796c leilk.liu@mediatek.com              2017-06-20  181  	.must_tx = true,
b6b1f2d9cf796c leilk.liu@mediatek.com              2017-06-20  182  };
b6b1f2d9cf796c leilk.liu@mediatek.com              2017-06-20  183  
7e963fb2a33ce4 Leilk Liu                           2022-03-15  184  static const struct mtk_spi_compatible mtk_ipm_compat = {
7e963fb2a33ce4 Leilk Liu                           2022-03-15  185  	.enhance_timing = true,
7e963fb2a33ce4 Leilk Liu                           2022-03-15  186  	.dma_ext = true,
7e963fb2a33ce4 Leilk Liu                           2022-03-15  187  	.ipm_design = true,
7e963fb2a33ce4 Leilk Liu                           2022-03-15  188  };
7e963fb2a33ce4 Leilk Liu                           2022-03-15  189  
2c231e0ab63851 luhua.xu                            2019-09-11  190  static const struct mtk_spi_compatible mt6765_compat = {
2c231e0ab63851 luhua.xu                            2019-09-11  191  	.need_pad_sel = true,
2c231e0ab63851 luhua.xu                            2019-09-11  192  	.must_tx = true,
2c231e0ab63851 luhua.xu                            2019-09-11  193  	.enhance_timing = true,
fdeae8f5a2e5eb luhua.xu                            2019-09-11  194  	.dma_ext = true,
2c231e0ab63851 luhua.xu                            2019-09-11  195  };
2c231e0ab63851 luhua.xu                            2019-09-11  196  
fc4f226fece3d0 Leilk Liu                           2017-06-12  197  static const struct mtk_spi_compatible mt7622_compat = {
fc4f226fece3d0 Leilk Liu                           2017-06-12  198  	.must_tx = true,
fc4f226fece3d0 Leilk Liu                           2017-06-12  199  	.enhance_timing = true,
fc4f226fece3d0 Leilk Liu                           2017-06-12  200  };
fc4f226fece3d0 Leilk Liu                           2017-06-12  201  
a568231f463225 Leilk Liu                           2015-08-07  202  static const struct mtk_spi_compatible mt8173_compat = {
af57937e862370 Leilk Liu                           2015-08-20  203  	.need_pad_sel = true,
af57937e862370 Leilk Liu                           2015-08-20  204  	.must_tx = true,
a568231f463225 Leilk Liu                           2015-08-07  205  };
a568231f463225 Leilk Liu                           2015-08-07  206  
b654aa6f2bbb00 Leilk Liu                           2018-11-01  207  static const struct mtk_spi_compatible mt8183_compat = {
b654aa6f2bbb00 Leilk Liu                           2018-11-01  208  	.need_pad_sel = true,
b654aa6f2bbb00 Leilk Liu                           2018-11-01  209  	.must_tx = true,
b654aa6f2bbb00 Leilk Liu                           2018-11-01  210  	.enhance_timing = true,
b654aa6f2bbb00 Leilk Liu                           2018-11-01  211  };
b654aa6f2bbb00 Leilk Liu                           2018-11-01  212  
162a31effc4182 Mason Zhang                         2021-06-29  213  static const struct mtk_spi_compatible mt6893_compat = {
162a31effc4182 Mason Zhang                         2021-06-29  214  	.need_pad_sel = true,
162a31effc4182 Mason Zhang                         2021-06-29  215  	.must_tx = true,
162a31effc4182 Mason Zhang                         2021-06-29  216  	.enhance_timing = true,
162a31effc4182 Mason Zhang                         2021-06-29  217  	.dma_ext = true,
162a31effc4182 Mason Zhang                         2021-06-29  218  	.no_need_unprepare = true,
162a31effc4182 Mason Zhang                         2021-06-29  219  };
162a31effc4182 Mason Zhang                         2021-06-29  220  
a568231f463225 Leilk Liu                           2015-08-07  221  static const struct of_device_id mtk_spi_of_match[] = {
7e963fb2a33ce4 Leilk Liu                           2022-03-15  222  	{ .compatible = "mediatek,spi-ipm",
7e963fb2a33ce4 Leilk Liu                           2022-03-15  223  		.data = (void *)&mtk_ipm_compat,
7e963fb2a33ce4 Leilk Liu                           2022-03-15  224  	},
15bcdefdc71a79 Leilk Liu                           2015-12-31  225  	{ .compatible = "mediatek,mt2701-spi",
15bcdefdc71a79 Leilk Liu                           2015-12-31  226  		.data = (void *)&mtk_common_compat,
15bcdefdc71a79 Leilk Liu                           2015-12-31  227  	},
b6b1f2d9cf796c leilk.liu@mediatek.com              2017-06-20  228  	{ .compatible = "mediatek,mt2712-spi",
b6b1f2d9cf796c leilk.liu@mediatek.com              2017-06-20  229  		.data = (void *)&mt2712_compat,
b6b1f2d9cf796c leilk.liu@mediatek.com              2017-06-20  230  	},
4eaf6f730355ce Leilk Liu                           2015-12-31  231  	{ .compatible = "mediatek,mt6589-spi",
4eaf6f730355ce Leilk Liu                           2015-12-31  232  		.data = (void *)&mtk_common_compat,
4eaf6f730355ce Leilk Liu                           2015-12-31  233  	},
2c231e0ab63851 luhua.xu                            2019-09-11  234  	{ .compatible = "mediatek,mt6765-spi",
2c231e0ab63851 luhua.xu                            2019-09-11  235  		.data = (void *)&mt6765_compat,
2c231e0ab63851 luhua.xu                            2019-09-11  236  	},
fc4f226fece3d0 Leilk Liu                           2017-06-12  237  	{ .compatible = "mediatek,mt7622-spi",
fc4f226fece3d0 Leilk Liu                           2017-06-12  238  		.data = (void *)&mt7622_compat,
fc4f226fece3d0 Leilk Liu                           2017-06-12  239  	},
942779c6f1f899 Leilk Liu                           2018-11-20  240  	{ .compatible = "mediatek,mt7629-spi",
942779c6f1f899 Leilk Liu                           2018-11-20  241  		.data = (void *)&mt7622_compat,
942779c6f1f899 Leilk Liu                           2018-11-20  242  	},
4eaf6f730355ce Leilk Liu                           2015-12-31  243  	{ .compatible = "mediatek,mt8135-spi",
4eaf6f730355ce Leilk Liu                           2015-12-31  244  		.data = (void *)&mtk_common_compat,
4eaf6f730355ce Leilk Liu                           2015-12-31  245  	},
4eaf6f730355ce Leilk Liu                           2015-12-31  246  	{ .compatible = "mediatek,mt8173-spi",
4eaf6f730355ce Leilk Liu                           2015-12-31  247  		.data = (void *)&mt8173_compat,
4eaf6f730355ce Leilk Liu                           2015-12-31  248  	},
b654aa6f2bbb00 Leilk Liu                           2018-11-01  249  	{ .compatible = "mediatek,mt8183-spi",
b654aa6f2bbb00 Leilk Liu                           2018-11-01  250  		.data = (void *)&mt8183_compat,
b654aa6f2bbb00 Leilk Liu                           2018-11-01  251  	},
8cf125c403f4e0 leilk.liu                           2020-07-21  252  	{ .compatible = "mediatek,mt8192-spi",
8cf125c403f4e0 leilk.liu                           2020-07-21  253  		.data = (void *)&mt6765_compat,
8cf125c403f4e0 leilk.liu                           2020-07-21  254  	},
162a31effc4182 Mason Zhang                         2021-06-29  255  	{ .compatible = "mediatek,mt6893-spi",
162a31effc4182 Mason Zhang                         2021-06-29  256  		.data = (void *)&mt6893_compat,
162a31effc4182 Mason Zhang                         2021-06-29  257  	},
a568231f463225 Leilk Liu                           2015-08-07  258  	{}
a568231f463225 Leilk Liu                           2015-08-07  259  };
a568231f463225 Leilk Liu                           2015-08-07  260  MODULE_DEVICE_TABLE(of, mtk_spi_of_match);
a568231f463225 Leilk Liu                           2015-08-07  261  
a568231f463225 Leilk Liu                           2015-08-07  262  static void mtk_spi_reset(struct mtk_spi *mdata)
a568231f463225 Leilk Liu                           2015-08-07  263  {
a568231f463225 Leilk Liu                           2015-08-07  264  	u32 reg_val;
a568231f463225 Leilk Liu                           2015-08-07  265  
a568231f463225 Leilk Liu                           2015-08-07  266  	/* set the software reset bit in SPI_CMD_REG. */
a568231f463225 Leilk Liu                           2015-08-07  267  	reg_val = readl(mdata->base + SPI_CMD_REG);
a568231f463225 Leilk Liu                           2015-08-07  268  	reg_val |= SPI_CMD_RST;
a568231f463225 Leilk Liu                           2015-08-07  269  	writel(reg_val, mdata->base + SPI_CMD_REG);
a568231f463225 Leilk Liu                           2015-08-07  270  
a568231f463225 Leilk Liu                           2015-08-07  271  	reg_val = readl(mdata->base + SPI_CMD_REG);
a568231f463225 Leilk Liu                           2015-08-07  272  	reg_val &= ~SPI_CMD_RST;
a568231f463225 Leilk Liu                           2015-08-07  273  	writel(reg_val, mdata->base + SPI_CMD_REG);
a568231f463225 Leilk Liu                           2015-08-07  274  }
a568231f463225 Leilk Liu                           2015-08-07  275  
04e6bb0d6bb127 Mason Zhang                         2021-08-04  276  static int mtk_spi_set_hw_cs_timing(struct spi_device *spi)
04e6bb0d6bb127 Mason Zhang                         2021-08-04  277  {
cae1578847e60a Yang Yingliang                      2023-08-23  278  	struct mtk_spi *mdata = spi_controller_get_devdata(spi->controller);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  279  	struct spi_delay *cs_setup = &spi->cs_setup;
04e6bb0d6bb127 Mason Zhang                         2021-08-04  280  	struct spi_delay *cs_hold = &spi->cs_hold;
04e6bb0d6bb127 Mason Zhang                         2021-08-04  281  	struct spi_delay *cs_inactive = &spi->cs_inactive;
5c842e51ac6313 Mason Zhang                         2021-08-09  282  	u32 setup, hold, inactive;
04e6bb0d6bb127 Mason Zhang                         2021-08-04  283  	u32 reg_val;
04e6bb0d6bb127 Mason Zhang                         2021-08-04  284  	int delay;
04e6bb0d6bb127 Mason Zhang                         2021-08-04  285  
04e6bb0d6bb127 Mason Zhang                         2021-08-04  286  	delay = spi_delay_to_ns(cs_setup, NULL);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  287  	if (delay < 0)
04e6bb0d6bb127 Mason Zhang                         2021-08-04  288  		return delay;
04e6bb0d6bb127 Mason Zhang                         2021-08-04  289  	setup = (delay * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000)) / 1000;
04e6bb0d6bb127 Mason Zhang                         2021-08-04  290  
04e6bb0d6bb127 Mason Zhang                         2021-08-04  291  	delay = spi_delay_to_ns(cs_hold, NULL);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  292  	if (delay < 0)
04e6bb0d6bb127 Mason Zhang                         2021-08-04  293  		return delay;
04e6bb0d6bb127 Mason Zhang                         2021-08-04  294  	hold = (delay * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000)) / 1000;
04e6bb0d6bb127 Mason Zhang                         2021-08-04  295  
04e6bb0d6bb127 Mason Zhang                         2021-08-04  296  	delay = spi_delay_to_ns(cs_inactive, NULL);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  297  	if (delay < 0)
04e6bb0d6bb127 Mason Zhang                         2021-08-04  298  		return delay;
04e6bb0d6bb127 Mason Zhang                         2021-08-04  299  	inactive = (delay * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000)) / 1000;
04e6bb0d6bb127 Mason Zhang                         2021-08-04  300  
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  301  	if (hold || setup) {
04e6bb0d6bb127 Mason Zhang                         2021-08-04  302  		reg_val = readl(mdata->base + SPI_CFG0_REG);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  303  		if (mdata->dev_comp->enhance_timing) {
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  304  			if (hold) {
5c842e51ac6313 Mason Zhang                         2021-08-09  305  				hold = min_t(u32, hold, 0x10000);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  306  				reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  307  				reg_val |= (((hold - 1) & 0xffff)
04e6bb0d6bb127 Mason Zhang                         2021-08-04  308  					<< SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  309  			}
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  310  			if (setup) {
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  311  				setup = min_t(u32, setup, 0x10000);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  312  				reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  313  				reg_val |= (((setup - 1) & 0xffff)
04e6bb0d6bb127 Mason Zhang                         2021-08-04  314  					<< SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  315  			}
04e6bb0d6bb127 Mason Zhang                         2021-08-04  316  		} else {
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  317  			if (hold) {
5c842e51ac6313 Mason Zhang                         2021-08-09  318  				hold = min_t(u32, hold, 0x100);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  319  				reg_val &= ~(0xff << SPI_CFG0_CS_HOLD_OFFSET);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  320  				reg_val |= (((hold - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  321  			}
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  322  			if (setup) {
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  323  				setup = min_t(u32, setup, 0x100);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  324  				reg_val &= ~(0xff << SPI_CFG0_CS_SETUP_OFFSET);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  325  				reg_val |= (((setup - 1) & 0xff)
04e6bb0d6bb127 Mason Zhang                         2021-08-04  326  					<< SPI_CFG0_CS_SETUP_OFFSET);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  327  			}
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  328  		}
04e6bb0d6bb127 Mason Zhang                         2021-08-04  329  		writel(reg_val, mdata->base + SPI_CFG0_REG);
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  330  	}
04e6bb0d6bb127 Mason Zhang                         2021-08-04  331  
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  332  	if (inactive) {
5c842e51ac6313 Mason Zhang                         2021-08-09  333  		inactive = min_t(u32, inactive, 0x100);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  334  		reg_val = readl(mdata->base + SPI_CFG1_REG);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  335  		reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
04e6bb0d6bb127 Mason Zhang                         2021-08-04  336  		reg_val |= (((inactive - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
04e6bb0d6bb127 Mason Zhang                         2021-08-04  337  		writel(reg_val, mdata->base + SPI_CFG1_REG);
3672bb820f3292 Dafna Hirschfeld                    2021-10-01  338  	}
04e6bb0d6bb127 Mason Zhang                         2021-08-04  339  
04e6bb0d6bb127 Mason Zhang                         2021-08-04  340  	return 0;
04e6bb0d6bb127 Mason Zhang                         2021-08-04  341  }
04e6bb0d6bb127 Mason Zhang                         2021-08-04  342  
cae1578847e60a Yang Yingliang                      2023-08-23  343  static int mtk_spi_hw_init(struct spi_controller *host,
7e963fb2a33ce4 Leilk Liu                           2022-03-15  344  			   struct spi_device *spi)
a568231f463225 Leilk Liu                           2015-08-07  345  {
79b5d3f24dcec5 Leilk Liu                           2015-10-26  346  	u16 cpha, cpol;
a568231f463225 Leilk Liu                           2015-08-07  347  	u32 reg_val;
58a984c79a68d5 Leilk Liu                           2015-10-26 @348  	struct mtk_chip_config *chip_config = spi->controller_data;
cae1578847e60a Yang Yingliang                      2023-08-23  349  	struct mtk_spi *mdata = spi_controller_get_devdata(host);
79b5d3f24dcec5 Leilk Liu                           2015-10-26  350  
79b5d3f24dcec5 Leilk Liu                           2015-10-26  351  	cpha = spi->mode & SPI_CPHA ? 1 : 0;
79b5d3f24dcec5 Leilk Liu                           2015-10-26  352  	cpol = spi->mode & SPI_CPOL ? 1 : 0;
79b5d3f24dcec5 Leilk Liu                           2015-10-26  353  
79b5d3f24dcec5 Leilk Liu                           2015-10-26  354  	reg_val = readl(mdata->base + SPI_CMD_REG);
7e963fb2a33ce4 Leilk Liu                           2022-03-15  355  	if (mdata->dev_comp->ipm_design) {
7e963fb2a33ce4 Leilk Liu                           2022-03-15  356  		/* SPI transfer without idle time until packet length done */
7e963fb2a33ce4 Leilk Liu                           2022-03-15  357  		reg_val |= SPI_CMD_IPM_NONIDLE_MODE;
7e963fb2a33ce4 Leilk Liu                           2022-03-15  358  		if (spi->mode & SPI_LOOP)
7e963fb2a33ce4 Leilk Liu                           2022-03-15  359  			reg_val |= SPI_CMD_IPM_SPIM_LOOP;
7e963fb2a33ce4 Leilk Liu                           2022-03-15  360  		else
7e963fb2a33ce4 Leilk Liu                           2022-03-15  361  			reg_val &= ~SPI_CMD_IPM_SPIM_LOOP;
7e963fb2a33ce4 Leilk Liu                           2022-03-15  362  	}
7e963fb2a33ce4 Leilk Liu                           2022-03-15  363  
79b5d3f24dcec5 Leilk Liu                           2015-10-26  364  	if (cpha)
79b5d3f24dcec5 Leilk Liu                           2015-10-26  365  		reg_val |= SPI_CMD_CPHA;
79b5d3f24dcec5 Leilk Liu                           2015-10-26  366  	else
79b5d3f24dcec5 Leilk Liu                           2015-10-26  367  		reg_val &= ~SPI_CMD_CPHA;
79b5d3f24dcec5 Leilk Liu                           2015-10-26  368  	if (cpol)
79b5d3f24dcec5 Leilk Liu                           2015-10-26  369  		reg_val |= SPI_CMD_CPOL;
79b5d3f24dcec5 Leilk Liu                           2015-10-26  370  	else
79b5d3f24dcec5 Leilk Liu                           2015-10-26  371  		reg_val &= ~SPI_CMD_CPOL;
a568231f463225 Leilk Liu                           2015-08-07  372  
a568231f463225 Leilk Liu                           2015-08-07  373  	/* set the mlsbx and mlsbtx */
3e582c6e911ffe Leilk Liu                           2019-06-05  374  	if (spi->mode & SPI_LSB_FIRST) {
a71d6ea6d3ec3e Leilk Liu                           2015-08-20  375  		reg_val &= ~SPI_CMD_TXMSBF;
a71d6ea6d3ec3e Leilk Liu                           2015-08-20  376  		reg_val &= ~SPI_CMD_RXMSBF;
3e582c6e911ffe Leilk Liu                           2019-06-05  377  	} else {
3e582c6e911ffe Leilk Liu                           2019-06-05  378  		reg_val |= SPI_CMD_TXMSBF;
3e582c6e911ffe Leilk Liu                           2019-06-05  379  		reg_val |= SPI_CMD_RXMSBF;
3e582c6e911ffe Leilk Liu                           2019-06-05  380  	}
a568231f463225 Leilk Liu                           2015-08-07  381  
a568231f463225 Leilk Liu                           2015-08-07  382  	/* set the tx/rx endian */
44f636da4e71e0 Leilk Liu                           2015-08-20  383  #ifdef __LITTLE_ENDIAN
44f636da4e71e0 Leilk Liu                           2015-08-20  384  	reg_val &= ~SPI_CMD_TX_ENDIAN;
44f636da4e71e0 Leilk Liu                           2015-08-20  385  	reg_val &= ~SPI_CMD_RX_ENDIAN;
44f636da4e71e0 Leilk Liu                           2015-08-20  386  #else
44f636da4e71e0 Leilk Liu                           2015-08-20  387  	reg_val |= SPI_CMD_TX_ENDIAN;
44f636da4e71e0 Leilk Liu                           2015-08-20  388  	reg_val |= SPI_CMD_RX_ENDIAN;
44f636da4e71e0 Leilk Liu                           2015-08-20  389  #endif
a568231f463225 Leilk Liu                           2015-08-07  390  
058fe49da3b6ab Leilk Liu                           2017-06-12  391  	if (mdata->dev_comp->enhance_timing) {
ae7c2d342a10db Luhua Xu                            2019-11-18  392  		/* set CS polarity */
ae7c2d342a10db Luhua Xu                            2019-11-18  393  		if (spi->mode & SPI_CS_HIGH)
058fe49da3b6ab Leilk Liu                           2017-06-12  394  			reg_val |= SPI_CMD_CS_POL;
058fe49da3b6ab Leilk Liu                           2017-06-12  395  		else
058fe49da3b6ab Leilk Liu                           2017-06-12  396  			reg_val &= ~SPI_CMD_CS_POL;
ae7c2d342a10db Luhua Xu                            2019-11-18  397  
8616912a95a6dd SkyLake.Huang                       2022-06-23  398  		if (mdata->sample_sel)
058fe49da3b6ab Leilk Liu                           2017-06-12  399  			reg_val |= SPI_CMD_SAMPLE_SEL;
058fe49da3b6ab Leilk Liu                           2017-06-12  400  		else
058fe49da3b6ab Leilk Liu                           2017-06-12  401  			reg_val &= ~SPI_CMD_SAMPLE_SEL;
058fe49da3b6ab Leilk Liu                           2017-06-12  402  	}
058fe49da3b6ab Leilk Liu                           2017-06-12  403  
a568231f463225 Leilk Liu                           2015-08-07  404  	/* set finish and pause interrupt always enable */
152933244a1a32 Leilk Liu                           2015-08-27  405  	reg_val |= SPI_CMD_FINISH_IE | SPI_CMD_PAUSE_IE;
a568231f463225 Leilk Liu                           2015-08-07  406  
a568231f463225 Leilk Liu                           2015-08-07  407  	/* disable dma mode */
a568231f463225 Leilk Liu                           2015-08-07  408  	reg_val &= ~(SPI_CMD_TX_DMA | SPI_CMD_RX_DMA);
a568231f463225 Leilk Liu                           2015-08-07  409  
a568231f463225 Leilk Liu                           2015-08-07  410  	/* disable deassert mode */
a568231f463225 Leilk Liu                           2015-08-07  411  	reg_val &= ~SPI_CMD_DEASSERT;
a568231f463225 Leilk Liu                           2015-08-07  412  
a568231f463225 Leilk Liu                           2015-08-07  413  	writel(reg_val, mdata->base + SPI_CMD_REG);
a568231f463225 Leilk Liu                           2015-08-07  414  
a568231f463225 Leilk Liu                           2015-08-07  415  	/* pad select */
a568231f463225 Leilk Liu                           2015-08-07  416  	if (mdata->dev_comp->need_pad_sel)
9e264f3f85a56c Amit Kumar Mahapatra via Alsa-devel 2023-03-10  417  		writel(mdata->pad_sel[spi_get_chipselect(spi, 0)],
37457607ecaffe Leilk Liu                           2015-10-26  418  		       mdata->base + SPI_PAD_SEL_REG);
a568231f463225 Leilk Liu                           2015-08-07  419  
f84d866ab43fcc Mason Zhang                         2021-07-13  420  	/* tick delay */
03b1be379dcee2 Leilk Liu                           2022-03-15  421  	if (mdata->dev_comp->enhance_timing) {
7e963fb2a33ce4 Leilk Liu                           2022-03-15  422  		if (mdata->dev_comp->ipm_design) {
7e963fb2a33ce4 Leilk Liu                           2022-03-15  423  			reg_val = readl(mdata->base + SPI_CMD_REG);
7e963fb2a33ce4 Leilk Liu                           2022-03-15  424  			reg_val &= ~SPI_CMD_IPM_GET_TICKDLY_MASK;
8616912a95a6dd SkyLake.Huang                       2022-06-23  425  			reg_val |= ((mdata->get_tick_dly & 0x7)
7e963fb2a33ce4 Leilk Liu                           2022-03-15  426  				    << SPI_CMD_IPM_GET_TICKDLY_OFFSET);
7e963fb2a33ce4 Leilk Liu                           2022-03-15  427  			writel(reg_val, mdata->base + SPI_CMD_REG);
7e963fb2a33ce4 Leilk Liu                           2022-03-15  428  		} else {
7e963fb2a33ce4 Leilk Liu                           2022-03-15  429  			reg_val = readl(mdata->base + SPI_CFG1_REG);
f84d866ab43fcc Mason Zhang                         2021-07-13  430  			reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK;
8616912a95a6dd SkyLake.Huang                       2022-06-23  431  			reg_val |= ((mdata->get_tick_dly & 0x7)
f84d866ab43fcc Mason Zhang                         2021-07-13  432  				    << SPI_CFG1_GET_TICK_DLY_OFFSET);
7e963fb2a33ce4 Leilk Liu                           2022-03-15  433  			writel(reg_val, mdata->base + SPI_CFG1_REG);
7e963fb2a33ce4 Leilk Liu                           2022-03-15  434  		}
03b1be379dcee2 Leilk Liu                           2022-03-15  435  	} else {
7e963fb2a33ce4 Leilk Liu                           2022-03-15  436  		reg_val = readl(mdata->base + SPI_CFG1_REG);
03b1be379dcee2 Leilk Liu                           2022-03-15  437  		reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK_V1;
8616912a95a6dd SkyLake.Huang                       2022-06-23  438  		reg_val |= ((mdata->get_tick_dly & 0x3)
03b1be379dcee2 Leilk Liu                           2022-03-15  439  			    << SPI_CFG1_GET_TICK_DLY_OFFSET_V1);
f84d866ab43fcc Mason Zhang                         2021-07-13  440  		writel(reg_val, mdata->base + SPI_CFG1_REG);
7e963fb2a33ce4 Leilk Liu                           2022-03-15  441  	}
f84d866ab43fcc Mason Zhang                         2021-07-13  442  
04e6bb0d6bb127 Mason Zhang                         2021-08-04  443  	/* set hw cs timing */
04e6bb0d6bb127 Mason Zhang                         2021-08-04  444  	mtk_spi_set_hw_cs_timing(spi);
a568231f463225 Leilk Liu                           2015-08-07  445  	return 0;
a568231f463225 Leilk Liu                           2015-08-07  446  }
a568231f463225 Leilk Liu                           2015-08-07  447  

:::::: The code at line 348 was first introduced by commit
:::::: 58a984c79a68d508ccfccf4b82c0eaf7f487c399 spi: mediatek: handle controller_data in mtk_spi_setup

:::::: TO: Leilk Liu <leilk.liu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
