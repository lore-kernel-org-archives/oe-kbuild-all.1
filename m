Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95731A3AB5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726145763; cv=none; b=nwEJ6PDoO1b+ucCy2U3MXqaGv6BckC/QKksFZ+OYxTc7rWZLcjSJENsHej8JExTXqe0MYFGTAATOetduOvzUeZiZwXCydcZOE7IsaRn0PaQQtM3HQl4PiNQqcp/wHqCf4TOEeXe7tQj2pXPrUkMDYxnXORoBX5G9inGMpmL7XPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726145763; c=relaxed/simple;
	bh=gY+9hXmCy6S/i05OUrRZ/xynO4T0zMUpCJzXfM9Ck1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nVcMVrLDLj1B5l1CcwQV90vtVXY9tC4V+svg4f0kVKjMYIrYZsAnKLDSYpyIldjhHUwFMeMZSDEXZI3NNXNBtp/ffeFSyE+/F6OohQqfjo6gLomkIGW/Gzceum/+nq16j8WVKz7ch3SAdRzJc1f65WxMYCr8/HOHVPNsX0ExtVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+NvChsN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+NvChsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726145762; x=1757681762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gY+9hXmCy6S/i05OUrRZ/xynO4T0zMUpCJzXfM9Ck1Q=;
  b=i+NvChsN/ONgvlPia9+Y3KxoQbXBtqAKJsYOTtjIbBrwOgmgFL6C5Cv6
   kIi3rzwSvfY02ll2YRlleop+uh+cP7qpOpVPtkrAUrRaOMkAO6pKSvR7L
   lyc8DS2ZLNWzvu2MIyqAHW4J6Xx1rGQUCSH9ppyMD9HIqLKLf8hA3lJoi
   tK47thKou+RSb14tOC+Tvaf1+uGgpLpIRClMsIH38dr2vaooPA3dbKNff
   J7OZH6xjvh2MAmekO/zpzZIG/cnhDQG8bXVByfFcb+GOWxXATB/R6/8hA
   tcinzKGw9jlDBKygMNjDOyJ592BdxtP7IyA4L6JZwipfxsJ0h78PAckNN
   g==;
X-CSE-ConnectionGUID: U3wWPxH9R+Kr0hxJnj3Csw==
X-CSE-MsgGUID: xGzW+SM4T1Sc64gOatmqxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28884577"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="28884577"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:56:01 -0700
X-CSE-ConnectionGUID: HKNzlRPCTrGw+lEW/XfvNQ==
X-CSE-MsgGUID: MEWU+JbQR72rI5k9ufYnrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="98404670"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Sep 2024 05:56:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sojMb-0005Aw-0o;
	Thu, 12 Sep 2024 12:55:57 +0000
Date: Thu, 12 Sep 2024 20:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 11150/11623] drivers/spi/spi-ep93xx.c:98:
 warning: Excess struct member 'dma_rx_data' description in 'ep93xx_spi'
Message-ID: <202409122047.KiYAnPfk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   57f962b956f1d116cd64d5c406776c4975de549d
commit: 03710ea649d402dda88ec49560bff25d94a62f6c [11150/11623] spi: ep93xx: add DT support for Cirrus EP93xx
config: mips-randconfig-r062-20231226 (https://download.01.org/0day-ci/archive/20240912/202409122047.KiYAnPfk-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409122047.KiYAnPfk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409122047.KiYAnPfk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-ep93xx.c:98: warning: Excess struct member 'dma_rx_data' description in 'ep93xx_spi'
>> drivers/spi/spi-ep93xx.c:98: warning: Excess struct member 'dma_tx_data' description in 'ep93xx_spi'


vim +98 drivers/spi/spi-ep93xx.c

011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  67  
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  68  /**
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  69   * struct ep93xx_spi - EP93xx SPI controller structure
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  70   * @clk: clock for the controller
1232978a0dff2d drivers/spi/spi-ep93xx.c H Hartley Sweeten 2017-08-09  71   * @mmio: pointer to ioremap()'d registers
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  72   * @sspdr_phys: physical address of the SSPDR register
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  73   * @tx: current byte in transfer to transmit
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  74   * @rx: current byte in transfer to receive
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  75   * @fifo_level: how full is FIFO (%0..%SPI_FIFO_SIZE - %1). Receiving one
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  76   *              frame decreases this level and sending one frame increases it.
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  77   * @dma_rx: RX DMA channel
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  78   * @dma_tx: TX DMA channel
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  79   * @dma_rx_data: RX parameters passed to the DMA engine
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  80   * @dma_tx_data: TX parameters passed to the DMA engine
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  81   * @rx_sgt: sg table for RX transfers
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  82   * @tx_sgt: sg table for TX transfers
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  83   * @zeropage: dummy page used as RX buffer when only TX buffer is passed in by
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  84   *            the client
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  85   */
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  86  struct ep93xx_spi {
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  87  	struct clk			*clk;
1232978a0dff2d drivers/spi/spi-ep93xx.c H Hartley Sweeten 2017-08-09  88  	void __iomem			*mmio;
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  89  	unsigned long			sspdr_phys;
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  90  	size_t				tx;
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  91  	size_t				rx;
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  92  	size_t				fifo_level;
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  93  	struct dma_chan			*dma_rx;
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  94  	struct dma_chan			*dma_tx;
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  95  	struct sg_table			rx_sgt;
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  96  	struct sg_table			tx_sgt;
626a96db116981 drivers/spi/ep93xx_spi.c Mika Westerberg   2011-05-29  97  	void				*zeropage;
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06 @98  };
011f23a3c2f20a drivers/spi/ep93xx_spi.c Mika Westerberg   2010-05-06  99  

:::::: The code at line 98 was first introduced by commit
:::::: 011f23a3c2f20ae15b7664d3942493af107fe39b spi/ep93xx: implemented driver for Cirrus EP93xx SPI controller

:::::: TO: Mika Westerberg <mika.westerberg@iki.fi>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
