Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8601E0083
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Jun 2025 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748861753; cv=none; b=jgIER+3OyFcJPpOUuBV+VEgNYv1dOrV1G2XXZM1TuQr3NHhsjlszYLu3fKeqNLBEv1j3AcCwQz+22RHe9OizAMggwkK/B89FZk6TzgOItogDX/hoKYSk4rnIM+BRe1C547/5vudGTlLLwDKVckHyTvP/zILqDPqOPA1I92RAdhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748861753; c=relaxed/simple;
	bh=2K503AsB5/WydrrBTz4mx0ORtgNjGWpAypX7QZdPXWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e8h/REMaU2e81NMHEN2uU0IWTw4F4IOEUd5jnqOf78JrgoM5XOjhfkzH+Tz+3PNnzIYKdMudZwbjYFstci6TdJ71y6d8FRaddhF/zdVfidmy0qn+mP6tHruPL8l9yPkwP99K5uvBedZ0WCwLJOQosLkiMn74qXi9YCSyUjFKz3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YB3+REX8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YB3+REX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748861751; x=1780397751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2K503AsB5/WydrrBTz4mx0ORtgNjGWpAypX7QZdPXWk=;
  b=YB3+REX8nQTkjCiH6qi6xL/kCkdM4GdE1/UVkvJQdCEXswk8OLj2B+gl
   okD2ZGJD/P0Xds2IMx1yqEu8KMWGM+oDVTaqEtfPtWCfUT98uYmi6PACo
   ATb+rn+n6dxwa0aQrAKVFkr1nIHltP0IKHgwiEEtSzG2vAk2zLE/lrAF3
   8WruSdfUgxsAP4acC6cU6BOwXvRG4jTNfcNE79r5d3KEMYbExbA8dVZQX
   ANCe0waO4Ix+S85wvIBoF2NkMx0PwnsGheFXoDu/0cl3V2skLzAHE9/zB
   a2ojWOAgVeut0yM+WiYFjlXiU0QmN40pY7Mxsa48CUDmvFll+E6n4wITv
   Q==;
X-CSE-ConnectionGUID: HJfjG7oNRquiskSHEr1zmA==
X-CSE-MsgGUID: wQQ9ftfjRP2u53lUA8Ztjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="51013174"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="51013174"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 03:55:51 -0700
X-CSE-ConnectionGUID: zCkd4rA5TNi8yX35dOg8sg==
X-CSE-MsgGUID: BV5T/VLOTFGHpIHg63EP7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="175377016"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Jun 2025 03:55:50 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uM2pX-0001IA-2g;
	Mon, 02 Jun 2025 10:55:47 +0000
Date: Mon, 2 Jun 2025 18:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 0/1]
 drivers/spi/spi-mt65xx.c:176: warning: Function parameter or member
 'spi_qos_request' not described in 'mtk_spi'
Message-ID: <202506021840.sCfTtzMv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   21fc2218c3dfde22b522a0352bb0112b85d0fe72
commit: b6025dde9e875005ed85cc42128f0778101f4fb2 [0/1] CHROMIUM: spi: mediatek: fix spi transfer timeout
config: x86_64-buildonly-randconfig-2002-20250502 (https://download.01.org/0day-ci/archive/20250602/202506021840.sCfTtzMv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250602/202506021840.sCfTtzMv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506021840.sCfTtzMv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-mt65xx.c:176: warning: Function parameter or member 'spi_qos_request' not described in 'mtk_spi'


vim +176 drivers/spi/spi-mt65xx.c

a568231f463225 Leilk Liu                  2015-08-07  131  
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  132  /**
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  133   * struct mtk_spi - SPI driver instance
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  134   * @base:		Start address of the SPI controller registers
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  135   * @state:		SPI controller state
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  136   * @pad_num:		Number of pad_sel entries
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  137   * @pad_sel:		Groups of pins to select
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  138   * @parent_clk:		Parent of sel_clk
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  139   * @sel_clk:		SPI master mux clock
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  140   * @spi_clk:		Peripheral clock
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  141   * @spi_hclk:		AHB bus clock
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  142   * @cur_transfer:	Currently processed SPI transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  143   * @xfer_len:		Number of bytes to transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  144   * @num_xfered:		Number of transferred bytes
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  145   * @tx_sgl:		TX transfer scatterlist
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  146   * @rx_sgl:		RX transfer scatterlist
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  147   * @tx_sgl_len:		Size of TX DMA transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  148   * @rx_sgl_len:		Size of RX DMA transfer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  149   * @dev_comp:		Device data structure
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  150   * @spi_clk_hz:		Current SPI clock in Hz
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  151   * @spimem_done:	SPI-MEM operation completion
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  152   * @use_spimem:		Enables SPI-MEM
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  153   * @dev:		Device pointer
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  154   * @tx_dma:		DMA start for SPI-MEM TX
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  155   * @rx_dma:		DMA start for SPI-MEM RX
3c5cd2e23fe4c8 AngeloGioacchino Del Regno 2022-04-07  156   */
a568231f463225 Leilk Liu                  2015-08-07  157  struct mtk_spi {
a568231f463225 Leilk Liu                  2015-08-07  158  	void __iomem *base;
a568231f463225 Leilk Liu                  2015-08-07  159  	u32 state;
37457607ecaffe Leilk Liu                  2015-10-26  160  	int pad_num;
37457607ecaffe Leilk Liu                  2015-10-26  161  	u32 *pad_sel;
a740f4e684c020 Leilk Liu                  2022-03-21  162  	struct clk *parent_clk, *sel_clk, *spi_clk, *spi_hclk;
a568231f463225 Leilk Liu                  2015-08-07  163  	struct spi_transfer *cur_transfer;
a568231f463225 Leilk Liu                  2015-08-07  164  	u32 xfer_len;
00bca73bfca4fb Peter Shih                 2018-09-10  165  	u32 num_xfered;
a568231f463225 Leilk Liu                  2015-08-07  166  	struct scatterlist *tx_sgl, *rx_sgl;
a568231f463225 Leilk Liu                  2015-08-07  167  	u32 tx_sgl_len, rx_sgl_len;
a568231f463225 Leilk Liu                  2015-08-07  168  	const struct mtk_spi_compatible *dev_comp;
b6025dde9e8750 Jia Xue                    2024-12-06  169  	struct pm_qos_request spi_qos_request;
162a31effc4182 Mason Zhang                2021-06-29  170  	u32 spi_clk_hz;
9f763fd20da7d8 Leilk Liu                  2022-03-21  171  	struct completion spimem_done;
9f763fd20da7d8 Leilk Liu                  2022-03-21  172  	bool use_spimem;
9f763fd20da7d8 Leilk Liu                  2022-03-21  173  	struct device *dev;
9f763fd20da7d8 Leilk Liu                  2022-03-21  174  	dma_addr_t tx_dma;
9f763fd20da7d8 Leilk Liu                  2022-03-21  175  	dma_addr_t rx_dma;
a568231f463225 Leilk Liu                  2015-08-07 @176  };
a568231f463225 Leilk Liu                  2015-08-07  177  

:::::: The code at line 176 was first introduced by commit
:::::: a568231f463225eb31593f71446a267a03ae0528 spi: mediatek: Add spi bus for Mediatek MT8173

:::::: TO: Leilk Liu <leilk.liu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
