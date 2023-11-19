Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C513ADB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 21:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZBtmJkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700428412; x=1731964412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2yJNIxb5KiByoHQLtXPlJyFismU2yO2P1HooluLT34M=;
  b=aZBtmJkS3C1OMI5sLF9zLy5/CtQORATDeD7FYXbt6FBLz/10Katd3lMH
   Y7o2CD1bGdkD7nvU1Sj0eWTzHReZqBgmZY6Tx/tSqUig08sc1YTxuZKU6
   Rbbq+4k1PxU6OywiFWMqNEL0ZKOnjwAtljWsftx4+luAyUPsNNu73la9K
   P0vvMqGSH8uYng6nR55k7qJ2hhDTmN242WI9YbwseUU9hh/nEaMoUoP61
   ffCGj05XsMGschqA3jsthjSZLVnu6DkhzIJ9auTPvdtzhwREQ7HSbrgJk
   vQ2xoYziZ0Y+50Md9KVDkBkemSMJON4KVqxOWnbN6jLxltwrAPe7MNV+x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="4694606"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="4694606"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 13:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="759641617"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="759641617"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Nov 2023 13:13:27 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4p6a-0005YD-2h;
	Sun, 19 Nov 2023 21:13:24 +0000
Date: Mon, 20 Nov 2023 05:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/irqchip/irq-davinci-cp-intc.c:166:13: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202311200543.oO7C2vGI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   037266a5f7239ead1530266f7d7af153d2a867fa
commit: dec85a95167a98a4e237df11e234eed8ee718e78 ARM: davinci: clean up platform support
date:   10 months ago
config: arm-randconfig-r133-20231119 (https://download.01.org/0day-ci/archive/20231120/202311200543.oO7C2vGI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311200543.oO7C2vGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200543.oO7C2vGI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-davinci-cp-intc.c:166:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *req @@     got struct resource * @@
   drivers/irqchip/irq-davinci-cp-intc.c:166:13: sparse:     expected void [noderef] __iomem *req
   drivers/irqchip/irq-davinci-cp-intc.c:166:13: sparse:     got struct resource *

vim +166 drivers/irqchip/irq-davinci-cp-intc.c

07caba966dee24 arch/arm/mach-davinci/cp_intc.c Heiko Schocher      2012-05-30  157  
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  158  static int __init
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  159  davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  160  			struct device_node *node)
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  161  {
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  162  	unsigned int num_regs = BITS_TO_LONGS(config->num_irqs);
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  163  	int offset, irq_base;
9cf58a45d72bdc arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  164  	void __iomem *req;
9cf58a45d72bdc arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  165  
9cf58a45d72bdc arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14 @166  	req = request_mem_region(config->reg.start,
9cf58a45d72bdc arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  167  				 resource_size(&config->reg),
9cf58a45d72bdc arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  168  				 "davinci-cp-intc");
9cf58a45d72bdc arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  169  	if (!req) {
9cf58a45d72bdc arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  170  		pr_err("%s: register range busy\n", __func__);
9cf58a45d72bdc arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  171  		return -EBUSY;
9cf58a45d72bdc arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  172  	}
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  173  
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  174  	davinci_cp_intc_base = ioremap(config->reg.start,
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  175  				       resource_size(&config->reg));
6c702da653d1a3 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  176  	if (!davinci_cp_intc_base) {
6c702da653d1a3 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  177  		pr_err("%s: unable to ioremap register range\n", __func__);
07caba966dee24 arch/arm/mach-davinci/cp_intc.c Heiko Schocher      2012-05-30  178  		return -EINVAL;
6c702da653d1a3 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  179  	}
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  180  
b35b55e72c12b2 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  181  	davinci_cp_intc_write(0, DAVINCI_CP_INTC_GLOBAL_ENABLE);
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  182  
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  183  	/* Disable all host interrupts */
b35b55e72c12b2 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  184  	davinci_cp_intc_write(0, DAVINCI_CP_INTC_HOST_ENABLE(0));
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  185  
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  186  	/* Disable system interrupts */
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  187  	for (offset = 0; offset < num_regs; offset++)
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  188  		davinci_cp_intc_write(~0,
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  189  			DAVINCI_CP_INTC_SYS_ENABLE_CLR(offset));
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  190  
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  191  	/* Set to normal mode, no nesting, no priority hold */
b35b55e72c12b2 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  192  	davinci_cp_intc_write(0, DAVINCI_CP_INTC_CTRL);
b35b55e72c12b2 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  193  	davinci_cp_intc_write(0, DAVINCI_CP_INTC_HOST_CTRL);
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  194  
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  195  	/* Clear system interrupt status */
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  196  	for (offset = 0; offset < num_regs; offset++)
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  197  		davinci_cp_intc_write(~0,
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  198  			DAVINCI_CP_INTC_SYS_STAT_CLR(offset));
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  199  
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  200  	/* Enable nIRQ (what about nFIQ?) */
b35b55e72c12b2 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  201  	davinci_cp_intc_write(1, DAVINCI_CP_INTC_HOST_ENABLE_IDX_SET);
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  202  
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  203  	/* Default all priorities to channel 7. */
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  204  	num_regs = (config->num_irqs + 3) >> 2;	/* 4 channels per register */
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  205  	for (offset = 0; offset < num_regs; offset++)
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  206  		davinci_cp_intc_write(0x07070707,
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  207  			DAVINCI_CP_INTC_CHAN_MAP(offset));
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  208  
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  209  	irq_base = irq_alloc_descs(-1, 0, config->num_irqs, 0);
07caba966dee24 arch/arm/mach-davinci/cp_intc.c Heiko Schocher      2012-05-30  210  	if (irq_base < 0) {
6c702da653d1a3 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  211  		pr_err("%s: unable to allocate interrupt descriptors: %d\n",
6c702da653d1a3 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  212  		       __func__, irq_base);
6c702da653d1a3 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  213  		return irq_base;
07caba966dee24 arch/arm/mach-davinci/cp_intc.c Heiko Schocher      2012-05-30  214  	}
07caba966dee24 arch/arm/mach-davinci/cp_intc.c Heiko Schocher      2012-05-30  215  
b35b55e72c12b2 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  216  	davinci_cp_intc_irq_domain = irq_domain_add_legacy(
6567954b8e8e7c arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  217  					node, config->num_irqs, irq_base, 0,
b35b55e72c12b2 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  218  					&davinci_cp_intc_irq_domain_ops, NULL);
07caba966dee24 arch/arm/mach-davinci/cp_intc.c Heiko Schocher      2012-05-30  219  
b35b55e72c12b2 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  220  	if (!davinci_cp_intc_irq_domain) {
6c702da653d1a3 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  221  		pr_err("%s: unable to create an interrupt domain\n", __func__);
07caba966dee24 arch/arm/mach-davinci/cp_intc.c Heiko Schocher      2012-05-30  222  		return -EINVAL;
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  223  	}
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  224  
b35b55e72c12b2 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  225  	set_handle_irq(davinci_cp_intc_handle_irq);
d0064594f20a9d arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  226  
0521444d497ee1 arch/arm/mach-davinci/cp_intc.c Sergei Shtylyov     2009-03-11  227  	/* Enable global interrupt */
b35b55e72c12b2 arch/arm/mach-davinci/cp_intc.c Bartosz Golaszewski 2019-02-14  228  	davinci_cp_intc_write(1, DAVINCI_CP_INTC_GLOBAL_ENABLE);
07caba966dee24 arch/arm/mach-davinci/cp_intc.c Heiko Schocher      2012-05-30  229  
07caba966dee24 arch/arm/mach-davinci/cp_intc.c Heiko Schocher      2012-05-30  230  	return 0;
07caba966dee24 arch/arm/mach-davinci/cp_intc.c Heiko Schocher      2012-05-30  231  }
07caba966dee24 arch/arm/mach-davinci/cp_intc.c Heiko Schocher      2012-05-30  232  

:::::: The code at line 166 was first introduced by commit
:::::: 9cf58a45d72bdc88a3f77d6cd4ea76817a3c6392 ARM: davinci: cp-intc: request the memory region before remapping it

:::::: TO: Bartosz Golaszewski <bgolaszewski@baylibre.com>
:::::: CC: Sekhar Nori <nsekhar@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
