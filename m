Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3021E385505
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441544; cv=none; b=Bsr05deRZA58RNnnKgLTNwguyroSvelHcFsdyN3e3eOwLMKtjHHowBxfJ33+9ptDTbC9Tt1JwLDizvLcfVBRO8sVgA+KCYaI0J/nnyRPmxfzazNOARAREaXe0qDL28PBjxGv3xdB0v5JMzq8zci0oHSZUisM7QhP/S7AHj5Agg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441544; c=relaxed/simple;
	bh=qza4SBtW5wxlXBHIfYldl3eh5s6Oku2+hx9KPgrfcHA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s7MNw46lgOtoltAEE34R5cKFF559Sd3F4nufn6QLZdt5pKC7619vGORnrdro87iRt8BCsOeVlYe5JFch3TxCs3X/+uJ3AKHh3JImCzakJuGZ9W4ok8PYiKGe04zfNZ0SRFLKTS6glQIpOv1fl6BlbUR21CwAi39mgT0LVjJ49hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i83r2tQL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i83r2tQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772441543; x=1803977543;
  h=date:from:to:cc:subject:message-id;
  bh=qza4SBtW5wxlXBHIfYldl3eh5s6Oku2+hx9KPgrfcHA=;
  b=i83r2tQL53BGu6kNaN+o2cejcECq6sTGFQ2z//iVrsliL5d2sHELkfoE
   dDexlTzzChG0iRde7zKjADXhz0Jj1ZODfEpUZ2vc1lNJUeZEG2+mMm9QR
   6pxFH/ncBlA1hV2OeNqoeRO9w1UwZoWn/Ae0WL6orHiidRxMCaDIpi23M
   srmQoZOyKmU2f05RrDIAHp6SBs2esadeCVnR3lnLucM19DUMPKhx9IP6N
   FAWrdSb60wBhfwfbjHiFJaBY6BAea3fBhRHH+gesyxHyht3nMC5jgANeA
   MtHGRhxiA0oHjEwUniJoC+cGBCCrRRufLdX4bcZa+IYdq9dRMz30M3W9q
   Q==;
X-CSE-ConnectionGUID: TrK1N81gQP2IMK/0FzYktw==
X-CSE-MsgGUID: w2t3ehAxRXeGLWSqenaw9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73483013"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73483013"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:52:23 -0800
X-CSE-ConnectionGUID: N2tZ+jaPRC28I9EfE55TOg==
X-CSE-MsgGUID: QUgV1iQySSC/R+g66eAx/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="248090890"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Mar 2026 00:52:21 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwz0k-000000000eB-1eFJ;
	Mon, 02 Mar 2026 08:52:18 +0000
Date: Mon, 02 Mar 2026 16:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: drivers/spi/spi-aspeed-smc.c:909:35: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202603021656.vpe2bWbn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11439c4635edd669ae435eec308f4ab8a0804808
commit: 04f7516ab70f7b82aae1d2830af2ee6f17f3fe98 spi: aspeed: Add support for non-spi-mem devices
date:   5 weeks ago
config: openrisc-randconfig-r111-20260302 (https://download.01.org/0day-ci/archive/20260302/202603021656.vpe2bWbn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021656.vpe2bWbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021656.vpe2bWbn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-aspeed-smc.c:909:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *dst @@
   drivers/spi/spi-aspeed-smc.c:909:35: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/spi/spi-aspeed-smc.c:909:35: sparse:     got void *dst
>> drivers/spi/spi-aspeed-smc.c:939:46: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/spi/spi-aspeed-smc.c:1469:61: sparse: sparse: undefined identifier 'cols'
   drivers/spi/spi-aspeed-smc.c:1469:61: sparse: sparse: bad constant expression type
   drivers/spi/spi-aspeed-smc.c:1469:55: sparse: sparse: undefined identifier 'rows'
   drivers/spi/spi-aspeed-smc.c:1469:55: sparse: sparse: bad constant expression type

vim +909 drivers/spi/spi-aspeed-smc.c

   890	
   891	static void aspeed_spi_user_transfer_tx(struct aspeed_spi *aspi,
   892						struct spi_device *spi,
   893						const u8 *tx_buf, u8 *rx_buf,
   894						void *dst, u32 len)
   895	{
   896		const struct aspeed_spi_data *data = aspi->data;
   897		bool full_duplex_transfer = data->full_duplex && tx_buf == rx_buf;
   898		u32 i;
   899	
   900		if (full_duplex_transfer &&
   901		    !!(spi->mode & (SPI_TX_DUAL | SPI_TX_QUAD |
   902				    SPI_RX_DUAL | SPI_RX_QUAD))) {
   903			dev_err(aspi->dev,
   904				"full duplex is only supported for single IO mode\n");
   905			return;
   906		}
   907	
   908		for (i = 0; i < len; i++) {
 > 909			writeb(tx_buf[i], dst);
   910			if (full_duplex_transfer)
   911				rx_buf[i] = readb(aspi->regs + FULL_DUPLEX_RX_DATA);
   912		}
   913	}
   914	
   915	static int aspeed_spi_user_transfer(struct spi_controller *ctlr,
   916					    struct spi_device *spi,
   917					    struct spi_transfer *xfer)
   918	{
   919		struct aspeed_spi *aspi =
   920			(struct aspeed_spi *)spi_controller_get_devdata(ctlr);
   921		u32 cs = spi_get_chipselect(spi, 0);
   922		struct aspeed_spi_chip *chip = &aspi->chips[cs];
   923		void __iomem *ahb_base = aspi->chips[cs].ahb_base;
   924		const u8 *tx_buf = xfer->tx_buf;
   925		u8 *rx_buf = xfer->rx_buf;
   926	
   927		dev_dbg(aspi->dev,
   928			"[cs%d] xfer: width %d, len %u, tx %p, rx %p\n",
   929			cs, xfer->bits_per_word, xfer->len,
   930			tx_buf, rx_buf);
   931	
   932		if (tx_buf) {
   933			if (spi->mode & SPI_TX_DUAL)
   934				aspeed_spi_set_io_mode(chip, CTRL_IO_DUAL_DATA);
   935			else if (spi->mode & SPI_TX_QUAD)
   936				aspeed_spi_set_io_mode(chip, CTRL_IO_QUAD_DATA);
   937	
   938			aspeed_spi_user_transfer_tx(aspi, spi, tx_buf, rx_buf,
 > 939						    (void *)ahb_base, xfer->len);
   940		}
   941	
   942		if (rx_buf && rx_buf != tx_buf) {
   943			if (spi->mode & SPI_RX_DUAL)
   944				aspeed_spi_set_io_mode(chip, CTRL_IO_DUAL_DATA);
   945			else if (spi->mode & SPI_RX_QUAD)
   946				aspeed_spi_set_io_mode(chip, CTRL_IO_QUAD_DATA);
   947	
   948			ioread8_rep(ahb_base, rx_buf, xfer->len);
   949		}
   950	
   951		xfer->error = 0;
   952		aspi->cs_change = xfer->cs_change;
   953	
   954		return 0;
   955	}
   956	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
