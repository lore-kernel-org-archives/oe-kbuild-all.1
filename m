Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660257C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 02:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689216410; x=1720752410;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=er1n/2DzENzd+8F8pjNBOIK5VkVHbH7aNv84dOZ1nrk=;
  b=LDBgw20rYzZZBQTK7zpQ0w/jP1LjxjRuKD4yg0+M53fSQaRGs0l/AEOW
   8H8QIrWADq5+bQtqqIeR19Gqh2zKZn+RntuznS6HoQwa4PzG6ph3ChaQi
   hgAmZbdiQPbWrLGaDV/0KdxACj7x4hLoHO4FDaNZjRz36TR0IC0ab9vQA
   NqALqqFVMs//TKXSVSNcxGeGtruN3AWKMAs11Cu/7NxFKfud4KEueSE78
   L2DjBz5u1IqbScjVxyloHH0TOc333Uk+nf3NBXqZDOLdyiDhAQur6Ux65
   /1UiNueMf9FsWrcLpeCCevx2rxdjhYQYoxOPoK42qm/OfhKHJDpkAUkkJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="431215835"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="431215835"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 19:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="725124538"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="725124538"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jul 2023 19:46:31 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJmLf-00069X-08;
	Thu, 13 Jul 2023 02:46:31 +0000
Date: Thu, 13 Jul 2023 10:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 15/74] drivers/ata/pata_mpc52xx.c:806:33:
 warning: initialization of 'struct ata_host *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202307131006.PaCo1g0k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   ac7a2a5947cf0a60d9614031b509c5b65e99f87a
commit: 7ae5b7dd017d3a56bc4b1eb3b72b9b67f9327fa2 [15/74] ata: Explicitly include correct DT includes
config: powerpc-ppc6xx_defconfig (https://download.01.org/0day-ci/archive/20230713/202307131006.PaCo1g0k-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131006.PaCo1g0k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131006.PaCo1g0k-lkp@intel.com/

All warnings (new ones prefixed by >>):

     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/ata/pata_mpc52xx.c:696:17: note: in expansion of macro 'dev_err'
     696 |                 dev_err(&op->dev, "could not determine device base address\n");
         |                 ^~~~~~~
   In file included from include/linux/device.h:17:
   drivers/ata/pata_mpc52xx.c:700:41: error: invalid use of undefined type 'struct platform_device'
     700 |         if (!devm_request_mem_region(&op->dev, res_mem.start,
         |                                         ^~
   include/linux/ioport.h:306:31: note: in definition of macro 'devm_request_mem_region'
     306 |         __devm_request_region(dev, &iomem_resource, (start), (n), (name))
         |                               ^~~
   drivers/ata/pata_mpc52xx.c:702:28: error: invalid use of undefined type 'struct platform_device'
     702 |                 dev_err(&op->dev, "error requesting register region\n");
         |                            ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/ata/pata_mpc52xx.c:702:17: note: in expansion of macro 'dev_err'
     702 |                 dev_err(&op->dev, "error requesting register region\n");
         |                 ^~~~~~~
   drivers/ata/pata_mpc52xx.c:706:36: error: invalid use of undefined type 'struct platform_device'
     706 |         ata_regs = devm_ioremap(&op->dev, res_mem.start, sizeof(*ata_regs));
         |                                    ^~
   drivers/ata/pata_mpc52xx.c:708:28: error: invalid use of undefined type 'struct platform_device'
     708 |                 dev_err(&op->dev, "error mapping device registers\n");
         |                            ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/ata/pata_mpc52xx.c:708:17: note: in expansion of macro 'dev_err'
     708 |                 dev_err(&op->dev, "error mapping device registers\n");
         |                 ^~~~~~~
   drivers/ata/pata_mpc52xx.c:726:34: error: invalid use of undefined type 'struct platform_device'
     726 |         prop = of_get_property(op->dev.of_node, "mwdma-mode", &proplen);
         |                                  ^~
   drivers/ata/pata_mpc52xx.c:729:34: error: invalid use of undefined type 'struct platform_device'
     729 |         prop = of_get_property(op->dev.of_node, "udma-mode", &proplen);
         |                                  ^~
   drivers/ata/pata_mpc52xx.c:733:42: error: invalid use of undefined type 'struct platform_device'
     733 |         ata_irq = irq_of_parse_and_map(op->dev.of_node, 0);
         |                                          ^~
   drivers/ata/pata_mpc52xx.c:735:28: error: invalid use of undefined type 'struct platform_device'
     735 |                 dev_err(&op->dev, "error mapping irq\n");
         |                            ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/ata/pata_mpc52xx.c:735:17: note: in expansion of macro 'dev_err'
     735 |                 dev_err(&op->dev, "error mapping irq\n");
         |                 ^~~~~~~
   drivers/ata/pata_mpc52xx.c:740:32: error: invalid use of undefined type 'struct platform_device'
     740 |         priv = devm_kzalloc(&op->dev, sizeof(*priv), GFP_KERNEL);
         |                                ^~
   drivers/ata/pata_mpc52xx.c:764:28: error: invalid use of undefined type 'struct platform_device'
     764 |                 dev_err(&op->dev, "bestcomm initialization failed\n");
         |                            ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/ata/pata_mpc52xx.c:764:17: note: in expansion of macro 'dev_err'
     764 |                 dev_err(&op->dev, "bestcomm initialization failed\n");
         |                 ^~~~~~~
   drivers/ata/pata_mpc52xx.c:770:34: error: invalid use of undefined type 'struct platform_device'
     770 |         rv = devm_request_irq(&op->dev, task_irq, &mpc52xx_ata_task_irq, 0,
         |                                  ^~
   drivers/ata/pata_mpc52xx.c:773:28: error: invalid use of undefined type 'struct platform_device'
     773 |                 dev_err(&op->dev, "error requesting DMA IRQ\n");
         |                            ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/ata/pata_mpc52xx.c:773:17: note: in expansion of macro 'dev_err'
     773 |                 dev_err(&op->dev, "error requesting DMA IRQ\n");
         |                 ^~~~~~~
   drivers/ata/pata_mpc52xx.c:781:28: error: invalid use of undefined type 'struct platform_device'
     781 |                 dev_err(&op->dev, "error initializing hardware\n");
         |                            ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/ata/pata_mpc52xx.c:781:17: note: in expansion of macro 'dev_err'
     781 |                 dev_err(&op->dev, "error initializing hardware\n");
         |                 ^~~~~~~
   drivers/ata/pata_mpc52xx.c:786:38: error: invalid use of undefined type 'struct platform_device'
     786 |         rv = mpc52xx_ata_init_one(&op->dev, priv, res_mem.start,
         |                                      ^~
   drivers/ata/pata_mpc52xx.c:789:28: error: invalid use of undefined type 'struct platform_device'
     789 |                 dev_err(&op->dev, "error registering with ATA layer\n");
         |                            ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/ata/pata_mpc52xx.c:789:17: note: in expansion of macro 'dev_err'
     789 |                 dev_err(&op->dev, "error registering with ATA layer\n");
         |                 ^~~~~~~
   drivers/ata/pata_mpc52xx.c: In function 'mpc52xx_ata_remove':
   drivers/ata/pata_mpc52xx.c:806:33: error: implicit declaration of function 'platform_get_drvdata' [-Werror=implicit-function-declaration]
     806 |         struct ata_host *host = platform_get_drvdata(op);
         |                                 ^~~~~~~~~~~~~~~~~~~~
>> drivers/ata/pata_mpc52xx.c:806:33: warning: initialization of 'struct ata_host *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/ata/pata_mpc52xx.c: In function 'mpc52xx_ata_suspend':
   drivers/ata/pata_mpc52xx.c:826:33: warning: initialization of 'struct ata_host *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     826 |         struct ata_host *host = platform_get_drvdata(op);
         |                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_mpc52xx.c: In function 'mpc52xx_ata_resume':
   drivers/ata/pata_mpc52xx.c:835:33: warning: initialization of 'struct ata_host *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     835 |         struct ata_host *host = platform_get_drvdata(op);
         |                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_mpc52xx.c: At top level:
   drivers/ata/pata_mpc52xx.c:858:15: error: variable 'mpc52xx_ata_of_platform_driver' has initializer but incomplete type
     858 | static struct platform_driver mpc52xx_ata_of_platform_driver = {
         |               ^~~~~~~~~~~~~~~
   drivers/ata/pata_mpc52xx.c:859:10: error: 'struct platform_driver' has no member named 'probe'
     859 |         .probe          = mpc52xx_ata_probe,
         |          ^~~~~
>> drivers/ata/pata_mpc52xx.c:859:27: warning: excess elements in struct initializer
     859 |         .probe          = mpc52xx_ata_probe,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/ata/pata_mpc52xx.c:859:27: note: (near initialization for 'mpc52xx_ata_of_platform_driver')
   drivers/ata/pata_mpc52xx.c:860:10: error: 'struct platform_driver' has no member named 'remove'
     860 |         .remove         = mpc52xx_ata_remove,
         |          ^~~~~~
   drivers/ata/pata_mpc52xx.c:860:27: warning: excess elements in struct initializer
     860 |         .remove         = mpc52xx_ata_remove,
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/ata/pata_mpc52xx.c:860:27: note: (near initialization for 'mpc52xx_ata_of_platform_driver')
   drivers/ata/pata_mpc52xx.c:862:10: error: 'struct platform_driver' has no member named 'suspend'
     862 |         .suspend        = mpc52xx_ata_suspend,
         |          ^~~~~~~
   drivers/ata/pata_mpc52xx.c:862:27: warning: excess elements in struct initializer
     862 |         .suspend        = mpc52xx_ata_suspend,
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_mpc52xx.c:862:27: note: (near initialization for 'mpc52xx_ata_of_platform_driver')
   drivers/ata/pata_mpc52xx.c:863:10: error: 'struct platform_driver' has no member named 'resume'
     863 |         .resume         = mpc52xx_ata_resume,
         |          ^~~~~~
   drivers/ata/pata_mpc52xx.c:863:27: warning: excess elements in struct initializer
     863 |         .resume         = mpc52xx_ata_resume,
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/ata/pata_mpc52xx.c:863:27: note: (near initialization for 'mpc52xx_ata_of_platform_driver')
   drivers/ata/pata_mpc52xx.c:865:10: error: 'struct platform_driver' has no member named 'driver'
     865 |         .driver         = {
         |          ^~~~~~
   drivers/ata/pata_mpc52xx.c:865:27: error: extra brace group at end of initializer
     865 |         .driver         = {
         |                           ^
   drivers/ata/pata_mpc52xx.c:865:27: note: (near initialization for 'mpc52xx_ata_of_platform_driver')
   drivers/ata/pata_mpc52xx.c:865:27: warning: excess elements in struct initializer
   drivers/ata/pata_mpc52xx.c:865:27: note: (near initialization for 'mpc52xx_ata_of_platform_driver')
>> drivers/ata/pata_mpc52xx.c:871:1: warning: data definition has no type or storage class
     871 | module_platform_driver(mpc52xx_ata_of_platform_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_mpc52xx.c:871:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
>> drivers/ata/pata_mpc52xx.c:871:1: warning: parameter names (without types) in function declaration
   drivers/ata/pata_mpc52xx.c:858:31: error: storage size of 'mpc52xx_ata_of_platform_driver' isn't known
     858 | static struct platform_driver mpc52xx_ata_of_platform_driver = {
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_mpc52xx.c:858:31: warning: 'mpc52xx_ata_of_platform_driver' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors


vim +806 drivers/ata/pata_mpc52xx.c

155d2916d9474f8 Sylvain Munaut            2006-12-08  671  
0ec24914675c482 Greg Kroah-Hartman        2012-12-21  672  static int mpc52xx_ata_probe(struct platform_device *op)
155d2916d9474f8 Sylvain Munaut            2006-12-08  673  {
155d2916d9474f8 Sylvain Munaut            2006-12-08  674  	unsigned int ipb_freq;
155d2916d9474f8 Sylvain Munaut            2006-12-08  675  	struct resource res_mem;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  676  	int ata_irq = 0;
24dc5f33ea4b504 Tejun Heo                 2007-01-20  677  	struct mpc52xx_ata __iomem *ata_regs;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  678  	struct mpc52xx_ata_priv *priv = NULL;
d01159dffa15e3a Julia Lawall              2012-03-11  679  	int rv, task_irq;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  680  	int mwdma_mask = 0, udma_mask = 0;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  681  	const __be32 *prop;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  682  	int proplen;
d01159dffa15e3a Julia Lawall              2012-03-11  683  	struct bcom_task *dmatsk;
155d2916d9474f8 Sylvain Munaut            2006-12-08  684  
155d2916d9474f8 Sylvain Munaut            2006-12-08  685  	/* Get ipb frequency */
de06fba62af6414 Andy Shevchenko           2022-05-07  686  	ipb_freq = mpc5xxx_get_bus_frequency(&op->dev);
155d2916d9474f8 Sylvain Munaut            2006-12-08  687  	if (!ipb_freq) {
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  688  		dev_err(&op->dev, "could not determine IPB bus frequency\n");
155d2916d9474f8 Sylvain Munaut            2006-12-08  689  		return -ENODEV;
155d2916d9474f8 Sylvain Munaut            2006-12-08  690  	}
155d2916d9474f8 Sylvain Munaut            2006-12-08  691  
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  692  	/* Get device base address from device tree, request the region
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  693  	 * and ioremap it. */
61c7a080a5a061c Grant Likely              2010-04-13  694  	rv = of_address_to_resource(op->dev.of_node, 0, &res_mem);
155d2916d9474f8 Sylvain Munaut            2006-12-08  695  	if (rv) {
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  696  		dev_err(&op->dev, "could not determine device base address\n");
155d2916d9474f8 Sylvain Munaut            2006-12-08  697  		return rv;
155d2916d9474f8 Sylvain Munaut            2006-12-08  698  	}
155d2916d9474f8 Sylvain Munaut            2006-12-08  699  
24dc5f33ea4b504 Tejun Heo                 2007-01-20  700  	if (!devm_request_mem_region(&op->dev, res_mem.start,
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  701  				     sizeof(*ata_regs), DRV_NAME)) {
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  702  		dev_err(&op->dev, "error requesting register region\n");
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  703  		return -EBUSY;
155d2916d9474f8 Sylvain Munaut            2006-12-08  704  	}
155d2916d9474f8 Sylvain Munaut            2006-12-08  705  
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  706  	ata_regs = devm_ioremap(&op->dev, res_mem.start, sizeof(*ata_regs));
155d2916d9474f8 Sylvain Munaut            2006-12-08  707  	if (!ata_regs) {
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  708  		dev_err(&op->dev, "error mapping device registers\n");
d01159dffa15e3a Julia Lawall              2012-03-11  709  		return -ENOMEM;
155d2916d9474f8 Sylvain Munaut            2006-12-08  710  	}
155d2916d9474f8 Sylvain Munaut            2006-12-08  711  
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  712  	/*
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  713  	 * By default, all DMA modes are disabled for the MPC5200.  Some
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  714  	 * boards don't have the required signals routed to make DMA work.
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  715  	 * Also, the MPC5200B has a silicon bug that causes data corruption
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  716  	 * with UDMA if it is used at the same time as the LocalPlus bus.
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  717  	 *
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  718  	 * Instead of trying to guess what modes are usable, check the
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  719  	 * ATA device tree node to find out what DMA modes work on the board.
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  720  	 * UDMA/MWDMA modes can also be forced by adding "libata.force=<mode>"
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  721  	 * to the kernel boot parameters.
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  722  	 *
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  723  	 * The MPC5200 ATA controller supports MWDMA modes 0, 1 and 2 and
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  724  	 * UDMA modes 0, 1 and 2.
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  725  	 */
61c7a080a5a061c Grant Likely              2010-04-13  726  	prop = of_get_property(op->dev.of_node, "mwdma-mode", &proplen);
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  727  	if ((prop) && (proplen >= 4))
14bdef982caeda1 Erik Inge Bolsø           2009-03-14  728  		mwdma_mask = ATA_MWDMA2 & ((1 << (*prop + 1)) - 1);
61c7a080a5a061c Grant Likely              2010-04-13  729  	prop = of_get_property(op->dev.of_node, "udma-mode", &proplen);
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  730  	if ((prop) && (proplen >= 4))
14bdef982caeda1 Erik Inge Bolsø           2009-03-14  731  		udma_mask = ATA_UDMA2 & ((1 << (*prop + 1)) - 1);
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  732  
61c7a080a5a061c Grant Likely              2010-04-13  733  	ata_irq = irq_of_parse_and_map(op->dev.of_node, 0);
1dea5edc90855ca Christophe Leroy          2022-10-06  734  	if (!ata_irq) {
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  735  		dev_err(&op->dev, "error mapping irq\n");
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  736  		return -EINVAL;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  737  	}
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  738  
155d2916d9474f8 Sylvain Munaut            2006-12-08  739  	/* Prepare our private structure */
cf369e4e5245c58 Julia Lawall              2022-02-10  740  	priv = devm_kzalloc(&op->dev, sizeof(*priv), GFP_KERNEL);
155d2916d9474f8 Sylvain Munaut            2006-12-08  741  	if (!priv) {
155d2916d9474f8 Sylvain Munaut            2006-12-08  742  		rv = -ENOMEM;
d01159dffa15e3a Julia Lawall              2012-03-11  743  		goto err1;
155d2916d9474f8 Sylvain Munaut            2006-12-08  744  	}
155d2916d9474f8 Sylvain Munaut            2006-12-08  745  
155d2916d9474f8 Sylvain Munaut            2006-12-08  746  	priv->ipb_period = 1000000000 / (ipb_freq / 1000);
155d2916d9474f8 Sylvain Munaut            2006-12-08  747  	priv->ata_regs = ata_regs;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  748  	priv->ata_regs_pa = res_mem.start;
155d2916d9474f8 Sylvain Munaut            2006-12-08  749  	priv->ata_irq = ata_irq;
155d2916d9474f8 Sylvain Munaut            2006-12-08  750  	priv->csel = -1;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  751  	priv->mpc52xx_ata_dma_last_write = -1;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  752  
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  753  	if (ipb_freq/1000000 == 66) {
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  754  		priv->mdmaspec = mdmaspec66;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  755  		priv->udmaspec = udmaspec66;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  756  	} else {
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  757  		priv->mdmaspec = mdmaspec132;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  758  		priv->udmaspec = udmaspec132;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  759  	}
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  760  
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  761  	/* Allocate a BestComm task for DMA */
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  762  	dmatsk = bcom_ata_init(MAX_DMA_BUFFERS, MAX_DMA_BUFFER_SIZE);
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  763  	if (!dmatsk) {
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  764  		dev_err(&op->dev, "bestcomm initialization failed\n");
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  765  		rv = -ENOMEM;
d01159dffa15e3a Julia Lawall              2012-03-11  766  		goto err1;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  767  	}
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  768  
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  769  	task_irq = bcom_get_task_irq(dmatsk);
d01159dffa15e3a Julia Lawall              2012-03-11  770  	rv = devm_request_irq(&op->dev, task_irq, &mpc52xx_ata_task_irq, 0,
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  771  				"ATA task", priv);
d01159dffa15e3a Julia Lawall              2012-03-11  772  	if (rv) {
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  773  		dev_err(&op->dev, "error requesting DMA IRQ\n");
d01159dffa15e3a Julia Lawall              2012-03-11  774  		goto err2;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  775  	}
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  776  	priv->dmatsk = dmatsk;
155d2916d9474f8 Sylvain Munaut            2006-12-08  777  
155d2916d9474f8 Sylvain Munaut            2006-12-08  778  	/* Init the hw */
155d2916d9474f8 Sylvain Munaut            2006-12-08  779  	rv = mpc52xx_ata_hw_init(priv);
155d2916d9474f8 Sylvain Munaut            2006-12-08  780  	if (rv) {
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  781  		dev_err(&op->dev, "error initializing hardware\n");
d01159dffa15e3a Julia Lawall              2012-03-11  782  		goto err2;
155d2916d9474f8 Sylvain Munaut            2006-12-08  783  	}
155d2916d9474f8 Sylvain Munaut            2006-12-08  784  
155d2916d9474f8 Sylvain Munaut            2006-12-08  785  	/* Register ourselves to libata */
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  786  	rv = mpc52xx_ata_init_one(&op->dev, priv, res_mem.start,
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  787  				  mwdma_mask, udma_mask);
155d2916d9474f8 Sylvain Munaut            2006-12-08  788  	if (rv) {
6b61e69e7bc1cfe Tim Yamin                 2008-12-21 @789  		dev_err(&op->dev, "error registering with ATA layer\n");
d01159dffa15e3a Julia Lawall              2012-03-11  790  		goto err2;
155d2916d9474f8 Sylvain Munaut            2006-12-08  791  	}
155d2916d9474f8 Sylvain Munaut            2006-12-08  792  
155d2916d9474f8 Sylvain Munaut            2006-12-08  793  	return 0;
155d2916d9474f8 Sylvain Munaut            2006-12-08  794  
d01159dffa15e3a Julia Lawall              2012-03-11  795   err2:
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  796  	irq_dispose_mapping(task_irq);
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  797  	bcom_ata_release(dmatsk);
d01159dffa15e3a Julia Lawall              2012-03-11  798   err1:
d01159dffa15e3a Julia Lawall              2012-03-11  799  	irq_dispose_mapping(ata_irq);
155d2916d9474f8 Sylvain Munaut            2006-12-08  800  	return rv;
155d2916d9474f8 Sylvain Munaut            2006-12-08  801  }
155d2916d9474f8 Sylvain Munaut            2006-12-08  802  
155d2916d9474f8 Sylvain Munaut            2006-12-08  803  static int
2dc115813768293 Grant Likely              2010-08-06  804  mpc52xx_ata_remove(struct platform_device *op)
155d2916d9474f8 Sylvain Munaut            2006-12-08  805  {
37e1b022bf1c54d Brian Norris              2012-11-02 @806  	struct ata_host *host = platform_get_drvdata(op);
37e1b022bf1c54d Brian Norris              2012-11-02  807  	struct mpc52xx_ata_priv *priv = host->private_data;
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  808  	int task_irq;
155d2916d9474f8 Sylvain Munaut            2006-12-08  809  
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  810  	/* Deregister the ATA interface */
37e1b022bf1c54d Brian Norris              2012-11-02  811  	ata_platform_remove_one(op);
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  812  
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  813  	/* Clean up DMA */
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  814  	task_irq = bcom_get_task_irq(priv->dmatsk);
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  815  	irq_dispose_mapping(task_irq);
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  816  	bcom_ata_release(priv->dmatsk);
155d2916d9474f8 Sylvain Munaut            2006-12-08  817  	irq_dispose_mapping(priv->ata_irq);
155d2916d9474f8 Sylvain Munaut            2006-12-08  818  
155d2916d9474f8 Sylvain Munaut            2006-12-08  819  	return 0;
155d2916d9474f8 Sylvain Munaut            2006-12-08  820  }
155d2916d9474f8 Sylvain Munaut            2006-12-08  821  
58eb8cd565af4a1 Bartlomiej Zolnierkiewicz 2014-05-07  822  #ifdef CONFIG_PM_SLEEP
155d2916d9474f8 Sylvain Munaut            2006-12-08  823  static int
2dc115813768293 Grant Likely              2010-08-06  824  mpc52xx_ata_suspend(struct platform_device *op, pm_message_t state)
155d2916d9474f8 Sylvain Munaut            2006-12-08  825  {
d89995db5f238e6 Jingoo Han                2013-05-23  826  	struct ata_host *host = platform_get_drvdata(op);
35142ddbf7d81ff Domen Puncer              2007-07-03  827  
ec87cf3782f7b05 Sergey Shtylyov           2022-02-02  828  	ata_host_suspend(host, state);
ec87cf3782f7b05 Sergey Shtylyov           2022-02-02  829  	return 0;
155d2916d9474f8 Sylvain Munaut            2006-12-08  830  }
155d2916d9474f8 Sylvain Munaut            2006-12-08  831  
155d2916d9474f8 Sylvain Munaut            2006-12-08  832  static int
2dc115813768293 Grant Likely              2010-08-06  833  mpc52xx_ata_resume(struct platform_device *op)
155d2916d9474f8 Sylvain Munaut            2006-12-08  834  {
d89995db5f238e6 Jingoo Han                2013-05-23  835  	struct ata_host *host = platform_get_drvdata(op);
35142ddbf7d81ff Domen Puncer              2007-07-03  836  	struct mpc52xx_ata_priv *priv = host->private_data;
35142ddbf7d81ff Domen Puncer              2007-07-03  837  	int rv;
35142ddbf7d81ff Domen Puncer              2007-07-03  838  
35142ddbf7d81ff Domen Puncer              2007-07-03  839  	rv = mpc52xx_ata_hw_init(priv);
35142ddbf7d81ff Domen Puncer              2007-07-03  840  	if (rv) {
6b61e69e7bc1cfe Tim Yamin                 2008-12-21  841  		dev_err(host->dev, "error initializing hardware\n");
35142ddbf7d81ff Domen Puncer              2007-07-03  842  		return rv;
35142ddbf7d81ff Domen Puncer              2007-07-03  843  	}
35142ddbf7d81ff Domen Puncer              2007-07-03  844  
35142ddbf7d81ff Domen Puncer              2007-07-03  845  	ata_host_resume(host);
35142ddbf7d81ff Domen Puncer              2007-07-03  846  
35142ddbf7d81ff Domen Puncer              2007-07-03  847  	return 0;
155d2916d9474f8 Sylvain Munaut            2006-12-08  848  }
155d2916d9474f8 Sylvain Munaut            2006-12-08  849  #endif
155d2916d9474f8 Sylvain Munaut            2006-12-08  850  
e3779f6a4e7359b Bhumika Goyal             2017-03-02  851  static const struct of_device_id mpc52xx_ata_of_match[] = {
66ffbe490b61568 Grant Likely              2008-01-24  852  	{ .compatible = "fsl,mpc5200-ata", },
66ffbe490b61568 Grant Likely              2008-01-24  853  	{ .compatible = "mpc5200-ata", },
5e776d7b20f040f Geert Uytterhoeven        2022-03-03  854  	{ /* sentinel */ }
155d2916d9474f8 Sylvain Munaut            2006-12-08  855  };
155d2916d9474f8 Sylvain Munaut            2006-12-08  856  
155d2916d9474f8 Sylvain Munaut            2006-12-08  857  
1c48a5c93da6313 Grant Likely              2011-02-17 @858  static struct platform_driver mpc52xx_ata_of_platform_driver = {
155d2916d9474f8 Sylvain Munaut            2006-12-08 @859  	.probe		= mpc52xx_ata_probe,
155d2916d9474f8 Sylvain Munaut            2006-12-08  860  	.remove		= mpc52xx_ata_remove,
58eb8cd565af4a1 Bartlomiej Zolnierkiewicz 2014-05-07  861  #ifdef CONFIG_PM_SLEEP
155d2916d9474f8 Sylvain Munaut            2006-12-08  862  	.suspend	= mpc52xx_ata_suspend,
155d2916d9474f8 Sylvain Munaut            2006-12-08  863  	.resume		= mpc52xx_ata_resume,
155d2916d9474f8 Sylvain Munaut            2006-12-08  864  #endif
155d2916d9474f8 Sylvain Munaut            2006-12-08 @865  	.driver		= {
155d2916d9474f8 Sylvain Munaut            2006-12-08  866  		.name	= DRV_NAME,
4018294b53d1dae Grant Likely              2010-04-13  867  		.of_match_table = mpc52xx_ata_of_match,
155d2916d9474f8 Sylvain Munaut            2006-12-08  868  	},
155d2916d9474f8 Sylvain Munaut            2006-12-08  869  };
155d2916d9474f8 Sylvain Munaut            2006-12-08  870  
99c8ea3e57e7b55 Axel Lin                  2011-11-27 @871  module_platform_driver(mpc52xx_ata_of_platform_driver);
155d2916d9474f8 Sylvain Munaut            2006-12-08  872  

:::::: The code at line 806 was first introduced by commit
:::::: 37e1b022bf1c54daf6849deffb65322299493702 pata_mpc52xx: utilize common ata_platform_remove_one()

:::::: TO: Brian Norris <computersforpeace@gmail.com>
:::::: CC: Jeff Garzik <jgarzik@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
