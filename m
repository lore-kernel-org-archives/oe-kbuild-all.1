Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F18B8BE7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736922359; cv=none; b=k1RfccrIAEdsoVQUmHKUMgXl3sVnaCVjdVBoeBHUkpepnhUGq55kO1sC+XRgBP/7p1FKtoZkWIF240/2DGbzmtgKFBJvc3cbQ3u8sxDNLzHT5LeIA8iE7HT7XIdVEvZFHVdfuDHtaPL/HMKGbkITJlHqfx88X4zxTyM9U4ppPm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736922359; c=relaxed/simple;
	bh=OlwI7kdhIh2IN4S4Yo3pOgpEab6j0W2XkdvEqYsoJWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cOA+9rcsq2+W9fD7OetfAxUaG0Gtvo1YuCMONtJEtEAM4xRMCoH83dIttSGN3SAqi+mXTHoKzChj788TLxXz6A8dHi59mLMZYGO2zxK/jVyMIbnYwgiQZ/+mne3WnnjJ5CQAotmNqDR+7ECCuPbqtERjwNgjxFfW9LUt7RwhZ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqC63S4D; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqC63S4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736922357; x=1768458357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OlwI7kdhIh2IN4S4Yo3pOgpEab6j0W2XkdvEqYsoJWg=;
  b=HqC63S4Du5A7qRm1vfScoLPkoEpf/AC2aMJgufvuEL7JFwzbFUzTX9xS
   tw+pWaBnp4gLkkj/mEIVeqqQtJgk8Sud4ISNFM8qsyVdKiwgmOMXUdG03
   X3jSvz1wwSGMzLPUIoEwSBzP0pJyD5+/cosklz6hG8f8sWIxxCUq4lfTh
   O5f1wXS3mNwlnrgtQ2DGa40AMIaDBSwQAS+xAzIXrKUXWI2jeiCXSgDOR
   gAD9Y1LvlDF+KAjdUUV1d1KVuOwc/WH0gE3gDHhpXXChKQaBRqvLOqgKR
   z9Ex5Al26WmwxQOovaTjCnseWKUtfgNX5D6lyRyrqeattt9oD2BZhr+06
   g==;
X-CSE-ConnectionGUID: 5vxe4QG+T1OGQ/sj7rMXLw==
X-CSE-MsgGUID: 3WpjRiZHTxG3iLzzCEqlfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37473249"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="37473249"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 22:25:56 -0800
X-CSE-ConnectionGUID: HcbqSGbpQcWqhSPHRDTWFA==
X-CSE-MsgGUID: lG2QYt0WQaS2s3vEATC5Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="104792112"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jan 2025 22:25:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXwqf-000PYP-0c;
	Wed, 15 Jan 2025 06:25:53 +0000
Date: Wed, 15 Jan 2025 14:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 258/258] drivers/spi/spi-mt65xx.c:176:
 warning: Function parameter or member 'spi_qos_request' not described in
 'mtk_spi'
Message-ID: <202501151409.036ZcRA3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   fb50c7382cab5ae14ad2a9f6aa465230af1b252c
commit: 2604d15348363ecd2b8b940f17eebdde20d5d7e6 [258/258] CHROMIUM: spi: mediatek: fix spi transfer timeout
config: i386-buildonly-randconfig-002-20250115 (https://download.01.org/0day-ci/archive/20250115/202501151409.036ZcRA3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501151409.036ZcRA3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501151409.036ZcRA3-lkp@intel.com/

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
2604d15348363e Jia Xue                    2024-12-06  169  	struct pm_qos_request spi_qos_request;
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
