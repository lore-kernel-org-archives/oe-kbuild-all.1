Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275E7610B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 05:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZeW7bdS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702530594; x=1734066594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cd6UtyNaPeH1MxMteWuVqa0aiuAfrVKfEkFpAum6ZoU=;
  b=VZeW7bdS+nfmh15agiwcDPRvVF6xeWwPdCTkKLi2Jg7sk9wVgotK0u1w
   PYNIzycz2y52AQSDY4t+RclCNG0Dq4R518YgpKmvWdqWhw05erSoX54O3
   EOKNwLOVONOMaJ++6q2cYDLQqFOExd0ztGIi6zffgGqCT69KsPJbLqfNN
   6hx8cuTUm0uKuib+56qCmP8T2jmIUsmw1LVtpQk1dNVZ4vD29rt6wRLsV
   titvAC0h3EqJ1kbzT6Xg5W0dq/FL8ZJl57PnX0IfAbJoviWnSBtK4hLjk
   JZYDTwWELGM2u81wQqu3vW4lmddQQSzHaRTZhUf7xzgPtXZGAeU/DfXKq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="375224426"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="375224426"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 21:09:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="897611115"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="897611115"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Dec 2023 21:09:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDdym-000LZz-2w;
	Thu, 14 Dec 2023 05:09:48 +0000
Date: Thu, 14 Dec 2023 13:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/korina.c:391:13: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202312141322.DDhM2rzj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: 6ef92063bf94cd8a6fa9fea3a82596955eb25424 net: korina: Make driver COMPILE_TESTable
date:   2 years, 8 months ago
config: sh-randconfig-r133-20231118 (https://download.01.org/0day-ci/archive/20231214/202312141322.DDhM2rzj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312141322.DDhM2rzj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141322.DDhM2rzj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/korina.c:408:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct dma_reg *ch @@     got struct dma_reg [noderef] __iomem *tx_dma_regs @@
   drivers/net/ethernet/korina.c:408:33: sparse:     expected struct dma_reg *ch
   drivers/net/ethernet/korina.c:408:33: sparse:     got struct dma_reg [noderef] __iomem *tx_dma_regs
   drivers/net/ethernet/korina.c:415:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct dma_reg *ch @@     got struct dma_reg [noderef] __iomem *rx_dma_regs @@
   drivers/net/ethernet/korina.c:415:33: sparse:     expected struct dma_reg *ch
   drivers/net/ethernet/korina.c:415:33: sparse:     got struct dma_reg [noderef] __iomem *rx_dma_regs
>> drivers/net/ethernet/korina.c:391:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:391:13: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:391:13: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:392:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:392:17: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:392:17: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:394:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:394:26: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:394:26: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:397:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:397:17: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:397:17: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:400:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:400:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:400:9: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:401:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:401:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:401:9: sparse:     got unsigned int *
>> drivers/net/ethernet/korina.c:391:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:391:13: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:391:13: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:392:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:392:17: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:392:17: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:394:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:394:26: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:394:26: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:397:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:397:17: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:397:17: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:400:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:400:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:400:9: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:401:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:401:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:401:9: sparse:     got unsigned int *

vim +391 drivers/net/ethernet/korina.c

0fc96939a97ffd drivers/net/ethernet/korina.c Thomas Bogendoerfer 2021-04-19  387  
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  388  static inline void korina_abort_dma(struct net_device *dev,
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  389  					struct dma_reg *ch)
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  390  {
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19 @391  	if (readl(&ch->dmac) & DMA_CHAN_RUN_BIT) {
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  392  		writel(0x10, &ch->dmac);
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  393  
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  394  		while (!(readl(&ch->dmas) & DMA_STAT_HALT))
860e9538a9482b drivers/net/ethernet/korina.c Florian Westphal    2016-05-03  395  			netif_trans_update(dev);
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  396  
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  397  		writel(0, &ch->dmas);
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  398  	}
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  399  
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  400  	writel(0, &ch->dmadptr);
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  401  	writel(0, &ch->dmandptr);
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  402  }
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  403  

:::::: The code at line 391 was first introduced by commit
:::::: ef11291bcd5f963c72e7ba5952be3e3c97463d2c Add support the Korina (IDT RC32434) Ethernet MAC

:::::: TO: Florian Fainelli <florian.fainelli@telecomint.eu>
:::::: CC: Jeff Garzik <jeff@garzik.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
