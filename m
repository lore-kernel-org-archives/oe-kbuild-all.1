Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3D6627
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Feb 2024 00:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707610245; cv=none; b=rTHaAuT36EblGljn+1wMEBOLvYId2QxhirPin7vCn3i1kimitzEtq7+9KpGrucEBPGnvIMVQScYRYdKP326Im/xLwbDI9Q+QbjoT4OFYztWtXSC4cFQC5u5ZHyynZmfnA0XIvAp7DR/PfjIMwCYmtVKrkCGAc4Zw4lMLGxLxRsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707610245; c=relaxed/simple;
	bh=rSA6AtzPmpa57bTwg03FIYyG0oUO16Yo7PiqQT1f6u8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ls9qEyxGjKOQjW09IKE+xBN1izccDVm1O2VRJkCUXU77n8eJE0mMFrNAy+X+NLgfBjv4F7G+BbgIep26ea8SQBS7pqxZRWTF8fERE1wZxsaFzxddoLi/42B01lLf3NWuS5CvHRiSj3Sm+WyEh5AldznednBAwYDYo8vLmVq4J5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFEakbf3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFEakbf3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707610244; x=1739146244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rSA6AtzPmpa57bTwg03FIYyG0oUO16Yo7PiqQT1f6u8=;
  b=OFEakbf3OL5mHkuTGyf0UFZVMNxZKEu9JDljHMYEZ7f6UExaK0KlP1qr
   8YvNWP19NpNWd3aYrQ3C2eB5Du9cs8K4ODXHS0WATjTv5reHLqQERtQFp
   75+QQosl1VhyHIO3LeLjqNFV3j3YtOHmAf0Q6DNAX3LJfYbWO33K8pMML
   OB2NGKh0wdhsf/61jAfaQB7VD8bsrnNb5pawoGL8FpCrKztpmrl7Y9NuB
   VaqRvMomsg0Zr1r0TCj6SqqhZch1QYvswGs+WlTWo7xo6GniNvbk1e6it
   5t0/woce0PvS8I70jD3fqrLaJ+poFD/q8+fxzWM5aJ7dG9m4qmSIaOhF/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="12971860"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="12971860"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 16:10:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="2554728"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2024 16:10:42 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYxQd-0006CC-2D;
	Sun, 11 Feb 2024 00:10:39 +0000
Date: Sun, 11 Feb 2024 08:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.8-dango 5259/5296]
 drivers/spi/spi-mt65xx.c:176: warning: Function parameter or struct member
 'sample_sel' not described in 'mtk_spi'
Message-ID: <202402110749.AH23Yj8T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.8-dango
head:   28d064b272e5ddac5987b689fefe36d6c7f524b3
commit: 11a706df1e83d2c2de944b08f27b60c9f08af4dd [5259/5296] drivers: spi-mt65xx: Move chip_config to driver's private data
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240211/202402110749.AH23Yj8T-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402110749.AH23Yj8T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402110749.AH23Yj8T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-mt65xx.c:176: warning: Function parameter or struct member 'sample_sel' not described in 'mtk_spi'
>> drivers/spi/spi-mt65xx.c:176: warning: Function parameter or struct member 'get_tick_dly' not described in 'mtk_spi'


vim +176 drivers/spi/spi-mt65xx.c

a568231f463225 Leilk Liu                  2015-08-07  130  
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  131  /**
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  132   * struct mtk_spi - SPI driver instance
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  133   * @base:		Start address of the SPI controller registers
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  134   * @state:		SPI controller state
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  135   * @pad_num:		Number of pad_sel entries
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  136   * @pad_sel:		Groups of pins to select
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  137   * @parent_clk:		Parent of sel_clk
cae1578847e60a Yang Yingliang             2023-08-23  138   * @sel_clk:		SPI host mux clock
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  139   * @spi_clk:		Peripheral clock
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  140   * @spi_hclk:		AHB bus clock
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  141   * @cur_transfer:	Currently processed SPI transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  142   * @xfer_len:		Number of bytes to transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  143   * @num_xfered:		Number of transferred bytes
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  144   * @tx_sgl:		TX transfer scatterlist
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  145   * @rx_sgl:		RX transfer scatterlist
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  146   * @tx_sgl_len:		Size of TX DMA transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  147   * @rx_sgl_len:		Size of RX DMA transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  148   * @dev_comp:		Device data structure
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  149   * @spi_clk_hz:		Current SPI clock in Hz
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  150   * @spimem_done:	SPI-MEM operation completion
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  151   * @use_spimem:		Enables SPI-MEM
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  152   * @dev:		Device pointer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  153   * @tx_dma:		DMA start for SPI-MEM TX
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  154   * @rx_dma:		DMA start for SPI-MEM RX
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  155   */
a568231f463225 Leilk Liu                  2015-08-07  156  struct mtk_spi {
a568231f463225 Leilk Liu                  2015-08-07  157  	void __iomem *base;
a568231f463225 Leilk Liu                  2015-08-07  158  	u32 state;
37457607ecaffe Leilk Liu                  2015-10-26  159  	int pad_num;
37457607ecaffe Leilk Liu                  2015-10-26  160  	u32 *pad_sel;
a740f4e684c020 Leilk Liu                  2022-03-21  161  	struct clk *parent_clk, *sel_clk, *spi_clk, *spi_hclk;
a568231f463225 Leilk Liu                  2015-08-07  162  	struct spi_transfer *cur_transfer;
a568231f463225 Leilk Liu                  2015-08-07  163  	u32 xfer_len;
00bca73bfca4fb Peter Shih                 2018-09-10  164  	u32 num_xfered;
a568231f463225 Leilk Liu                  2015-08-07  165  	struct scatterlist *tx_sgl, *rx_sgl;
a568231f463225 Leilk Liu                  2015-08-07  166  	u32 tx_sgl_len, rx_sgl_len;
a568231f463225 Leilk Liu                  2015-08-07  167  	const struct mtk_spi_compatible *dev_comp;
162a31effc4182 Mason Zhang                2021-06-29  168  	u32 spi_clk_hz;
9f763fd20da7d8 Leilk Liu                  2022-03-21  169  	struct completion spimem_done;
9f763fd20da7d8 Leilk Liu                  2022-03-21  170  	bool use_spimem;
9f763fd20da7d8 Leilk Liu                  2022-03-21  171  	struct device *dev;
9f763fd20da7d8 Leilk Liu                  2022-03-21  172  	dma_addr_t tx_dma;
9f763fd20da7d8 Leilk Liu                  2022-03-21  173  	dma_addr_t rx_dma;
11a706df1e83d2 SkyLake.Huang              2022-06-23  174  	u32 sample_sel;
11a706df1e83d2 SkyLake.Huang              2022-06-23  175  	u32 get_tick_dly;
a568231f463225 Leilk Liu                  2015-08-07 @176  };
a568231f463225 Leilk Liu                  2015-08-07  177  

:::::: The code at line 176 was first introduced by commit
:::::: a568231f463225eb31593f71446a267a03ae0528 spi: mediatek: Add spi bus for Mediatek MT8173

:::::: TO: Leilk Liu <leilk.liu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
