Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB00DDB6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 10:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692872319; x=1724408319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qKRp3ral1uSBUs9xTDIfOVT4EZ6tyspThNmXtXZLXwk=;
  b=kpEj8oxuP8AKJEzUq9VudOkFzqRoZg+wchmLSfTeTAakIefvk6PpXsL1
   l8lJ/QXOsDslLO2tpwibK8UxkmvvjOvlUBJy98GThKMz1aLx5Wlwq4TUC
   ORR2DpMK9Z1jh+9pnD4CQD0ZCDnCsJAYuAh5Tui0r2LN/gBZkuqGYeE4y
   8GphrnISQq3YbVXJDJdmp7NKosEw7jtyt1R3ml4KDnfonWqOPggkNXvCD
   MoTjfIsQTgk1L2xCfjbODtnJDj/CXpiNL3ci7KQAHfJr/TiWevfrhUMt/
   25iYQW8agLg71zakoI7pP9IYDkZHiRBj1H4a0mgYWNdTTd2lr2f5xDXuV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="364576018"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="364576018"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 03:18:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="713919625"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="713919625"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Aug 2023 03:18:37 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ7QA-0001wN-1U;
	Thu, 24 Aug 2023 10:18:35 +0000
Date: Thu, 24 Aug 2023 18:18:02 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_2 11415/11472]
 drivers/spi/spi-mt65xx.c:175: warning: Function parameter or member
 'sample_sel' not described in 'mtk_spi'
Message-ID: <202308241851.BuP7XrAW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_2
head:   765ced40ad936e2be7291aa23b2433a3c7df658c
commit: b2330fb578c594f598cb891747d63bff855e8847 [11415/11472] drivers: spi-mt65xx: Move chip_config to driver's private data
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230824/202308241851.BuP7XrAW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241851.BuP7XrAW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241851.BuP7XrAW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-mt65xx.c:175: warning: Function parameter or member 'sample_sel' not described in 'mtk_spi'
>> drivers/spi/spi-mt65xx.c:175: warning: Function parameter or member 'get_tick_dly' not described in 'mtk_spi'


vim +175 drivers/spi/spi-mt65xx.c

a568231f463225 Leilk Liu                  2015-08-07  129  
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  130  /**
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  131   * struct mtk_spi - SPI driver instance
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  132   * @base:		Start address of the SPI controller registers
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  133   * @state:		SPI controller state
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  134   * @pad_num:		Number of pad_sel entries
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  135   * @pad_sel:		Groups of pins to select
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  136   * @parent_clk:		Parent of sel_clk
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  137   * @sel_clk:		SPI master mux clock
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  138   * @spi_clk:		Peripheral clock
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  139   * @spi_hclk:		AHB bus clock
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  140   * @cur_transfer:	Currently processed SPI transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  141   * @xfer_len:		Number of bytes to transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  142   * @num_xfered:		Number of transferred bytes
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  143   * @tx_sgl:		TX transfer scatterlist
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  144   * @rx_sgl:		RX transfer scatterlist
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  145   * @tx_sgl_len:		Size of TX DMA transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  146   * @rx_sgl_len:		Size of RX DMA transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  147   * @dev_comp:		Device data structure
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  148   * @spi_clk_hz:		Current SPI clock in Hz
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  149   * @spimem_done:	SPI-MEM operation completion
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  150   * @use_spimem:		Enables SPI-MEM
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  151   * @dev:		Device pointer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  152   * @tx_dma:		DMA start for SPI-MEM TX
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  153   * @rx_dma:		DMA start for SPI-MEM RX
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  154   */
a568231f463225 Leilk Liu                  2015-08-07  155  struct mtk_spi {
a568231f463225 Leilk Liu                  2015-08-07  156  	void __iomem *base;
a568231f463225 Leilk Liu                  2015-08-07  157  	u32 state;
37457607ecaffe Leilk Liu                  2015-10-26  158  	int pad_num;
37457607ecaffe Leilk Liu                  2015-10-26  159  	u32 *pad_sel;
a740f4e684c020 Leilk Liu                  2022-03-21  160  	struct clk *parent_clk, *sel_clk, *spi_clk, *spi_hclk;
a568231f463225 Leilk Liu                  2015-08-07  161  	struct spi_transfer *cur_transfer;
a568231f463225 Leilk Liu                  2015-08-07  162  	u32 xfer_len;
00bca73bfca4fb Peter Shih                 2018-09-10  163  	u32 num_xfered;
a568231f463225 Leilk Liu                  2015-08-07  164  	struct scatterlist *tx_sgl, *rx_sgl;
a568231f463225 Leilk Liu                  2015-08-07  165  	u32 tx_sgl_len, rx_sgl_len;
a568231f463225 Leilk Liu                  2015-08-07  166  	const struct mtk_spi_compatible *dev_comp;
162a31effc4182 Mason Zhang                2021-06-29  167  	u32 spi_clk_hz;
9f763fd20da7d8 Leilk Liu                  2022-03-21  168  	struct completion spimem_done;
9f763fd20da7d8 Leilk Liu                  2022-03-21  169  	bool use_spimem;
9f763fd20da7d8 Leilk Liu                  2022-03-21  170  	struct device *dev;
9f763fd20da7d8 Leilk Liu                  2022-03-21  171  	dma_addr_t tx_dma;
9f763fd20da7d8 Leilk Liu                  2022-03-21  172  	dma_addr_t rx_dma;
b2330fb578c594 SkyLake.Huang              2022-06-23  173  	u32 sample_sel;
b2330fb578c594 SkyLake.Huang              2022-06-23  174  	u32 get_tick_dly;
a568231f463225 Leilk Liu                  2015-08-07 @175  };
a568231f463225 Leilk Liu                  2015-08-07  176  

:::::: The code at line 175 was first introduced by commit
:::::: a568231f463225eb31593f71446a267a03ae0528 spi: mediatek: Add spi bus for Mediatek MT8173

:::::: TO: Leilk Liu <leilk.liu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
