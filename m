Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFB5163
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 00:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707524882; cv=none; b=Jw8u/XhdouWuDA/+ggvV6FyIopY7EGZiDYkbG/vdhJdYlj1D5Vr3V+xsMvrVUMwv+TipXhVhgQpmwUwOotQ39s9OXYg8ClmowOvRuelgEIqlpTSPjXhXOlhkpwJLq2+C3N7SYmms0gKuiYMV7QEDgv+ZCN2PcKIZ2uGNA4gIlLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707524882; c=relaxed/simple;
	bh=wCD42JzIXKJkykdpue1xug7nBe0t62ZZyDtFvKqd1fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j3BTUZ4Ul537yuWfs/9zjrUkF5v5bDGX9gW1PVMp+y2TDVDGKh9h/rJIIywzl0XRwudT54UBc73fS9oR19qFT5CabuJ/LtlHSUqP4P9ZG5FGTdYErLSi3DD/t2Wjc1yhu9pcy97oCmOMaPdMrcWy2BiBuWiRpVH+bRdvni8WBIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wov6d+pJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wov6d+pJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707524880; x=1739060880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wCD42JzIXKJkykdpue1xug7nBe0t62ZZyDtFvKqd1fo=;
  b=Wov6d+pJJLJrJ5NDMUdg2jFvuMRK883VjkbD9AAlFv0jfL4Di8ZT/vzT
   YrWwSdaoSv79hkH4CCU4BWxa+2Z2T2XOD854cJMHNXwTfRB3ieQrlIrNM
   PqP0Z1oSEy3foDr0B1wgFq5Dbp2qsZ9N5p3CT3tpJjRoQBMV2CyZa3gVF
   drX6Pmk9Tm7uI4rS06PEDoGrSiQF7rF7FStBFpu27Hxv37V5Mfy0hzCQT
   M+05uh/91pvG4qlM3YJmB2tQ1G+Pu5QGN1mV0wjI8VXm1qOYJgklM27us
   xsJduAkTT/tfjAV4UTStfl7vDWagJXhSf1BKEFRUnCptc+6Ovn4T8GHw+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1681992"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="1681992"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 16:27:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="825277681"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="825277681"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Feb 2024 16:27:57 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYbDn-0005ET-0D;
	Sat, 10 Feb 2024 00:27:55 +0000
Date: Sat, 10 Feb 2024 08:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-misc:spi-6.9 16/62] drivers/spi/spi-ppc4xx.c:365:12: error:
 'struct spi_bitbang' has no member named 'master'
Message-ID: <202402100815.XQXw9XCF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Uwe,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git spi-6.9
head:   fc5b764bef24d0cf722deb5c1a44948cd17d4afe
commit: 2259233110d90059187c5ba75537eb93eba8417b [16/62] spi: bitbang: Follow renaming of SPI "master" to "controller"
config: powerpc-randconfig-r014-20230410 (https://download.01.org/0day-ci/archive/20240210/202402100815.XQXw9XCF-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402100815.XQXw9XCF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100815.XQXw9XCF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-ppc4xx.c: In function 'spi_ppc4xx_setupxfer':
   drivers/spi/spi-ppc4xx.c:169:12: warning: variable 'bits_per_word' set but not used [-Wunused-but-set-variable]
     169 |         u8 bits_per_word;
         |            ^~~~~~~~~~~~~
   drivers/spi/spi-ppc4xx.c: In function 'spi_ppc4xx_of_probe':
   drivers/spi/spi-ppc4xx.c:346:36: error: invalid use of undefined type 'struct platform_device'
     346 |         struct device_node *np = op->dev.of_node;
         |                                    ^~
   drivers/spi/spi-ppc4xx.c:347:33: error: invalid use of undefined type 'struct platform_device'
     347 |         struct device *dev = &op->dev;
         |                                 ^~
   drivers/spi/spi-ppc4xx.c:356:9: error: implicit declaration of function 'platform_set_drvdata' [-Werror=implicit-function-declaration]
     356 |         platform_set_drvdata(op, host);
         |         ^~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-ppc4xx.c:365:12: error: 'struct spi_bitbang' has no member named 'master'
     365 |         bbp->master = hw->host;
         |            ^~
   drivers/spi/spi-ppc4xx.c:369:12: error: 'struct spi_bitbang' has no member named 'master'
     369 |         bbp->master->setup = spi_ppc4xx_setup;
         |            ^~
   drivers/spi/spi-ppc4xx.c:370:12: error: 'struct spi_bitbang' has no member named 'master'
     370 |         bbp->master->cleanup = spi_ppc4xx_cleanup;
         |            ^~
   drivers/spi/spi-ppc4xx.c:371:12: error: 'struct spi_bitbang' has no member named 'master'
     371 |         bbp->master->bits_per_word_mask = SPI_BPW_MASK(8);
         |            ^~
   drivers/spi/spi-ppc4xx.c:372:12: error: 'struct spi_bitbang' has no member named 'master'
     372 |         bbp->master->use_gpio_descriptors = true;
         |            ^~
   drivers/spi/spi-ppc4xx.c:377:12: error: 'struct spi_bitbang' has no member named 'master'
     377 |         bbp->master->num_chipselect = 0;
         |            ^~
   drivers/spi/spi-ppc4xx.c:380:12: error: 'struct spi_bitbang' has no member named 'master'
     380 |         bbp->master->mode_bits =
         |            ^~
   drivers/spi/spi-ppc4xx.c: In function 'spi_ppc4xx_of_remove':
   drivers/spi/spi-ppc4xx.c:469:39: error: implicit declaration of function 'platform_get_drvdata' [-Werror=implicit-function-declaration]
     469 |         struct spi_controller *host = platform_get_drvdata(op);
         |                                       ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-ppc4xx.c:469:39: warning: initialization of 'struct spi_controller *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/spi/spi-ppc4xx.c: At top level:
   drivers/spi/spi-ppc4xx.c:486:15: error: variable 'spi_ppc4xx_of_driver' has initializer but incomplete type
     486 | static struct platform_driver spi_ppc4xx_of_driver = {
         |               ^~~~~~~~~~~~~~~
   drivers/spi/spi-ppc4xx.c:487:10: error: 'struct platform_driver' has no member named 'probe'
     487 |         .probe = spi_ppc4xx_of_probe,
         |          ^~~~~
   drivers/spi/spi-ppc4xx.c:487:18: warning: excess elements in struct initializer
     487 |         .probe = spi_ppc4xx_of_probe,
         |                  ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-ppc4xx.c:487:18: note: (near initialization for 'spi_ppc4xx_of_driver')
   drivers/spi/spi-ppc4xx.c:488:10: error: 'struct platform_driver' has no member named 'remove_new'
     488 |         .remove_new = spi_ppc4xx_of_remove,
         |          ^~~~~~~~~~
   drivers/spi/spi-ppc4xx.c:488:23: warning: excess elements in struct initializer
     488 |         .remove_new = spi_ppc4xx_of_remove,
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-ppc4xx.c:488:23: note: (near initialization for 'spi_ppc4xx_of_driver')
   drivers/spi/spi-ppc4xx.c:489:10: error: 'struct platform_driver' has no member named 'driver'
     489 |         .driver = {
         |          ^~~~~~
   drivers/spi/spi-ppc4xx.c:489:19: error: extra brace group at end of initializer
     489 |         .driver = {
         |                   ^
   drivers/spi/spi-ppc4xx.c:489:19: note: (near initialization for 'spi_ppc4xx_of_driver')
   drivers/spi/spi-ppc4xx.c:489:19: warning: excess elements in struct initializer
   drivers/spi/spi-ppc4xx.c:489:19: note: (near initialization for 'spi_ppc4xx_of_driver')
   drivers/spi/spi-ppc4xx.c:494:1: warning: data definition has no type or storage class
     494 | module_platform_driver(spi_ppc4xx_of_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-ppc4xx.c:494:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
   drivers/spi/spi-ppc4xx.c:494:1: warning: parameter names (without types) in function declaration
   drivers/spi/spi-ppc4xx.c:486:31: error: storage size of 'spi_ppc4xx_of_driver' isn't known
     486 | static struct platform_driver spi_ppc4xx_of_driver = {
         |                               ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-ppc4xx.c:486:31: warning: 'spi_ppc4xx_of_driver' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors


vim +365 drivers/spi/spi-ppc4xx.c

44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  336  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  337  /*
2dc11581376829 drivers/spi/spi_ppc4xx.c Grant Likely    2010-08-06  338   * platform_device layer stuff...
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  339   */
2deff8d602e8c9 drivers/spi/spi-ppc4xx.c Grant Likely    2013-02-05  340  static int spi_ppc4xx_of_probe(struct platform_device *op)
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  341  {
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  342  	struct ppc4xx_spi *hw;
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  343  	struct spi_controller *host;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  344  	struct spi_bitbang *bbp;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  345  	struct resource resource;
b53550781b7d51 drivers/spi/spi_ppc4xx.c Grant Likely    2010-05-25  346  	struct device_node *np = op->dev.of_node;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  347  	struct device *dev = &op->dev;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  348  	struct device_node *opbnp;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  349  	int ret;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  350  	const unsigned int *clk;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  351  
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  352  	host = spi_alloc_host(dev, sizeof(*hw));
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  353  	if (host == NULL)
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  354  		return -ENOMEM;
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  355  	host->dev.of_node = np;
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  356  	platform_set_drvdata(op, host);
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  357  	hw = spi_controller_get_devdata(host);
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  358  	hw->host = host;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  359  	hw->dev = dev;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  360  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  361  	init_completion(&hw->done);
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  362  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  363  	/* Setup the state for the bitbang driver */
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  364  	bbp = &hw->bitbang;
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18 @365  	bbp->master = hw->host;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  366  	bbp->setup_transfer = spi_ppc4xx_setupxfer;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  367  	bbp->txrx_bufs = spi_ppc4xx_txrx;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  368  	bbp->use_dma = 0;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  369  	bbp->master->setup = spi_ppc4xx_setup;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  370  	bbp->master->cleanup = spi_ppc4xx_cleanup;
24778be20f87d5 drivers/spi/spi-ppc4xx.c Stephen Warren  2013-05-21  371  	bbp->master->bits_per_word_mask = SPI_BPW_MASK(8);
4726773292bfdb drivers/spi/spi-ppc4xx.c Linus Walleij   2020-07-14  372  	bbp->master->use_gpio_descriptors = true;
4726773292bfdb drivers/spi/spi-ppc4xx.c Linus Walleij   2020-07-14  373  	/*
4726773292bfdb drivers/spi/spi-ppc4xx.c Linus Walleij   2020-07-14  374  	 * The SPI core will count the number of GPIO descriptors to figure
4726773292bfdb drivers/spi/spi-ppc4xx.c Linus Walleij   2020-07-14  375  	 * out the number of chip selects available on the platform.
4726773292bfdb drivers/spi/spi-ppc4xx.c Linus Walleij   2020-07-14  376  	 */
4726773292bfdb drivers/spi/spi-ppc4xx.c Linus Walleij   2020-07-14  377  	bbp->master->num_chipselect = 0;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  378  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  379  	/* the spi->mode bits understood by this driver: */
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  380  	bbp->master->mode_bits =
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  381  		SPI_CPHA | SPI_CPOL | SPI_CS_HIGH | SPI_LSB_FIRST;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  382  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  383  	/* Get the clock for the OPB */
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  384  	opbnp = of_find_compatible_node(NULL, NULL, "ibm,opb");
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  385  	if (opbnp == NULL) {
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  386  		dev_err(dev, "OPB: cannot find node\n");
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  387  		ret = -ENODEV;
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  388  		goto free_host;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  389  	}
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  390  	/* Get the clock (Hz) for the OPB */
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  391  	clk = of_get_property(opbnp, "clock-frequency", NULL);
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  392  	if (clk == NULL) {
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  393  		dev_err(dev, "OPB: no clock-frequency property set\n");
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  394  		of_node_put(opbnp);
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  395  		ret = -ENODEV;
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  396  		goto free_host;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  397  	}
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  398  	hw->opb_freq = *clk;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  399  	hw->opb_freq >>= 2;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  400  	of_node_put(opbnp);
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  401  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  402  	ret = of_address_to_resource(np, 0, &resource);
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  403  	if (ret) {
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  404  		dev_err(dev, "error while parsing device node resource\n");
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  405  		goto free_host;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  406  	}
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  407  	hw->mapbase = resource.start;
8e2943c04c74e5 drivers/spi/spi-ppc4xx.c Joe Perches     2011-06-10  408  	hw->mapsize = resource_size(&resource);
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  409  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  410  	/* Sanity check */
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  411  	if (hw->mapsize < sizeof(struct spi_ppc4xx_regs)) {
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  412  		dev_err(dev, "too small to map registers\n");
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  413  		ret = -EINVAL;
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  414  		goto free_host;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  415  	}
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  416  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  417  	/* Request IRQ */
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  418  	hw->irqnum = irq_of_parse_and_map(np, 0);
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  419  	ret = request_irq(hw->irqnum, spi_ppc4xx_int,
38ada214fad79f drivers/spi/spi-ppc4xx.c Yong Zhang      2011-10-22  420  			  0, "spi_ppc4xx_of", (void *)hw);
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  421  	if (ret) {
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  422  		dev_err(dev, "unable to allocate interrupt\n");
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  423  		goto free_host;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  424  	}
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  425  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  426  	if (!request_mem_region(hw->mapbase, hw->mapsize, DRIVER_NAME)) {
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  427  		dev_err(dev, "resource unavailable\n");
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  428  		ret = -EBUSY;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  429  		goto request_mem_error;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  430  	}
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  431  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  432  	hw->regs = ioremap(hw->mapbase, sizeof(struct spi_ppc4xx_regs));
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  433  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  434  	if (!hw->regs) {
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  435  		dev_err(dev, "unable to memory map registers\n");
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  436  		ret = -ENXIO;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  437  		goto map_io_error;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  438  	}
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  439  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  440  	spi_ppc4xx_enable(hw);
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  441  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  442  	/* Finally register our spi controller */
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  443  	dev->dma_mask = 0;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  444  	ret = spi_bitbang_start(bbp);
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  445  	if (ret) {
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  446  		dev_err(dev, "failed to register SPI host\n");
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  447  		goto unmap_regs;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  448  	}
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  449  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  450  	dev_info(dev, "driver initialized\n");
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  451  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  452  	return 0;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  453  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  454  unmap_regs:
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  455  	iounmap(hw->regs);
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  456  map_io_error:
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  457  	release_mem_region(hw->mapbase, hw->mapsize);
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  458  request_mem_error:
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  459  	free_irq(hw->irqnum, hw);
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  460  free_host:
71345830575984 drivers/spi/spi-ppc4xx.c Yang Yingliang  2023-08-18  461  	spi_controller_put(host);
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  462  
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  463  	dev_err(dev, "initialization failed\n");
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  464  	return ret;
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  465  }
44dab88e7cc99d drivers/spi/spi_ppc4xx.c Steven A. Falco 2009-09-22  466  

:::::: The code at line 365 was first introduced by commit
:::::: 71345830575984c01c4c2b655ef3a7877100fba3 spi: ppc4xx: switch to use modern name

:::::: TO: Yang Yingliang <yangyingliang@huawei.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
