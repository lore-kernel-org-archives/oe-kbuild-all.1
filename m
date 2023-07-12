Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1501F95D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 17:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689184506; x=1720720506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ye4c31NYxmyMOwGqcWeAvmHccou2I+wejIIf0ckcA+M=;
  b=N5CTkhDbiN0d2IA/EA+kdhkWHQmH8/4T8vZXLa1Hhr/NVolRXPshpOgy
   YaTleBZRC8HxDdOktm5gGtAPIi5elZPhwh6UXTIeEVDz0iDHNYVdeAyyq
   tKlwq0BXNAUh97C48/ixu42UwRx34FyqZAw8RxM1sjLARkj96eBeW8XGn
   OZG5B/Tr2AFl0xMt6e3HUquw/CCvu5hZZ+jBLpH6l4uRTXeEMOzrcDBD3
   mPSOhl86jCABvMLnSAWqA9bw30QhGDGKFJBQHXgYkPKsANYS51K1LL0Ii
   XfxsckrdfokDc8/loqG1sWuFOBXa4NipJVWWn2pUOpkqRGSzSCD2zmJg4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="363830902"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="363830902"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 10:55:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="811675209"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="811675209"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jul 2023 10:55:04 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJe3L-0005tZ-1S;
	Wed, 12 Jul 2023 17:55:03 +0000
Date: Thu, 13 Jul 2023 01:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 28/94]
 drivers/dma/bestcomm/bestcomm.c:375:23: error: invalid use of undefined type
 'struct platform_device'
Message-ID: <202307130148.wMdVBouZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3fabe2c33fe8811c575713da027ca6bea22d7d5b
commit: 239edb4862ebde9bc6a8357a6cba29e111fad919 [28/94] dmaengine: Explicitly include correct DT includes
config: powerpc-cm5200_defconfig (https://download.01.org/0day-ci/archive/20230713/202307130148.wMdVBouZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130148.wMdVBouZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130148.wMdVBouZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/dma/bestcomm/bestcomm.c:364:38: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
     364 | static int mpc52xx_bcom_probe(struct platform_device *op)
         |                                      ^~~~~~~~~~~~~~~
   drivers/dma/bestcomm/bestcomm.c: In function 'mpc52xx_bcom_probe':
>> drivers/dma/bestcomm/bestcomm.c:375:23: error: invalid use of undefined type 'struct platform_device'
     375 |         of_node_get(op->dev.of_node);
         |                       ^~
   drivers/dma/bestcomm/bestcomm.c:402:30: error: invalid use of undefined type 'struct platform_device'
     402 |         bcom_eng->ofnode = op->dev.of_node;
         |                              ^~
   drivers/dma/bestcomm/bestcomm.c:405:38: error: invalid use of undefined type 'struct platform_device'
     405 |         if (of_address_to_resource(op->dev.of_node, 0, &res_bcom)) {
         |                                      ^~
   drivers/dma/bestcomm/bestcomm.c:449:23: error: invalid use of undefined type 'struct platform_device'
     449 |         of_node_put(op->dev.of_node);
         |                       ^~
   drivers/dma/bestcomm/bestcomm.c: At top level:
   drivers/dma/bestcomm/bestcomm.c:457:39: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
     457 | static int mpc52xx_bcom_remove(struct platform_device *op)
         |                                       ^~~~~~~~~~~~~~~
>> drivers/dma/bestcomm/bestcomm.c:488:15: error: variable 'mpc52xx_bcom_of_platform_driver' has initializer but incomplete type
     488 | static struct platform_driver mpc52xx_bcom_of_platform_driver = {
         |               ^~~~~~~~~~~~~~~
>> drivers/dma/bestcomm/bestcomm.c:489:10: error: 'struct platform_driver' has no member named 'probe'
     489 |         .probe          = mpc52xx_bcom_probe,
         |          ^~~~~
>> drivers/dma/bestcomm/bestcomm.c:489:27: warning: excess elements in struct initializer
     489 |         .probe          = mpc52xx_bcom_probe,
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/dma/bestcomm/bestcomm.c:489:27: note: (near initialization for 'mpc52xx_bcom_of_platform_driver')
>> drivers/dma/bestcomm/bestcomm.c:490:10: error: 'struct platform_driver' has no member named 'remove'
     490 |         .remove         = mpc52xx_bcom_remove,
         |          ^~~~~~
   drivers/dma/bestcomm/bestcomm.c:490:27: warning: excess elements in struct initializer
     490 |         .remove         = mpc52xx_bcom_remove,
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/dma/bestcomm/bestcomm.c:490:27: note: (near initialization for 'mpc52xx_bcom_of_platform_driver')
>> drivers/dma/bestcomm/bestcomm.c:491:10: error: 'struct platform_driver' has no member named 'driver'
     491 |         .driver = {
         |          ^~~~~~
>> drivers/dma/bestcomm/bestcomm.c:491:19: error: extra brace group at end of initializer
     491 |         .driver = {
         |                   ^
   drivers/dma/bestcomm/bestcomm.c:491:19: note: (near initialization for 'mpc52xx_bcom_of_platform_driver')
   drivers/dma/bestcomm/bestcomm.c:491:19: warning: excess elements in struct initializer
   drivers/dma/bestcomm/bestcomm.c:491:19: note: (near initialization for 'mpc52xx_bcom_of_platform_driver')
   drivers/dma/bestcomm/bestcomm.c: In function 'mpc52xx_bcom_init':
>> drivers/dma/bestcomm/bestcomm.c:505:16: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
     505 |         return platform_driver_register(&mpc52xx_bcom_of_platform_driver);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/bestcomm/bestcomm.c: In function 'mpc52xx_bcom_exit':
>> drivers/dma/bestcomm/bestcomm.c:511:9: error: implicit declaration of function 'platform_driver_unregister'; did you mean 'driver_unregister'? [-Werror=implicit-function-declaration]
     511 |         platform_driver_unregister(&mpc52xx_bcom_of_platform_driver);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         driver_unregister
   drivers/dma/bestcomm/bestcomm.c: At top level:
>> drivers/dma/bestcomm/bestcomm.c:488:31: error: storage size of 'mpc52xx_bcom_of_platform_driver' isn't known
     488 | static struct platform_driver mpc52xx_bcom_of_platform_driver = {
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +375 drivers/dma/bestcomm/bestcomm.c

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  363  
cad5cef62a5a0c arch/powerpc/sysdev/bestcomm/bestcomm.c Greg Kroah-Hartman 2012-12-21 @364  static int mpc52xx_bcom_probe(struct platform_device *op)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  365  {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  366  	struct device_node *ofn_sram;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  367  	struct resource res_bcom;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  368  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  369  	int rv;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  370  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  371  	/* Inform user we're ok so far */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  372  	printk(KERN_INFO "DMA: MPC52xx BestComm driver\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  373  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  374  	/* Get the bestcomm node */
61c7a080a5a061 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2010-04-13 @375  	of_node_get(op->dev.of_node);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  376  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  377  	/* Prepare SRAM */
66ffbe490b6156 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2008-01-24  378  	ofn_sram = of_find_matching_node(NULL, mpc52xx_sram_ids);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  379  	if (!ofn_sram) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  380  		printk(KERN_ERR DRIVER_NAME ": "
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  381  			"No SRAM found in device tree\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  382  		rv = -ENODEV;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  383  		goto error_ofput;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  384  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  385  	rv = bcom_sram_init(ofn_sram, DRIVER_NAME);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  386  	of_node_put(ofn_sram);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  387  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  388  	if (rv) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  389  		printk(KERN_ERR DRIVER_NAME ": "
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  390  			"Error in SRAM init\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  391  		goto error_ofput;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  392  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  393  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  394  	/* Get a clean struct */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  395  	bcom_eng = kzalloc(sizeof(struct bcom_engine), GFP_KERNEL);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  396  	if (!bcom_eng) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  397  		rv = -ENOMEM;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  398  		goto error_sramclean;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  399  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  400  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  401  	/* Save the node */
61c7a080a5a061 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2010-04-13  402  	bcom_eng->ofnode = op->dev.of_node;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  403  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  404  	/* Get, reserve & map io */
61c7a080a5a061 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2010-04-13  405  	if (of_address_to_resource(op->dev.of_node, 0, &res_bcom)) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  406  		printk(KERN_ERR DRIVER_NAME ": "
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  407  			"Can't get resource\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  408  		rv = -EINVAL;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  409  		goto error_sramclean;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  410  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  411  
b5961f86802a1d arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2013-01-18  412  	if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  413  				DRIVER_NAME)) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  414  		printk(KERN_ERR DRIVER_NAME ": "
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  415  			"Can't request registers region\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  416  		rv = -EBUSY;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  417  		goto error_sramclean;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  418  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  419  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  420  	bcom_eng->regs_base = res_bcom.start;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  421  	bcom_eng->regs = ioremap(res_bcom.start, sizeof(struct mpc52xx_sdma));
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  422  	if (!bcom_eng->regs) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  423  		printk(KERN_ERR DRIVER_NAME ": "
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  424  			"Can't map registers\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  425  		rv = -ENOMEM;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  426  		goto error_release;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  427  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  428  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  429  	/* Now, do the real init */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  430  	rv = bcom_engine_init();
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  431  	if (rv)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  432  		goto error_unmap;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  433  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  434  	/* Done ! */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  435  	printk(KERN_INFO "DMA: MPC52xx BestComm engine @%08lx ok !\n",
08b6c06de5d3f3 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2008-07-11  436  		(long)bcom_eng->regs_base);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  437  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  438  	return 0;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  439  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  440  	/* Error path */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  441  error_unmap:
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  442  	iounmap(bcom_eng->regs);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  443  error_release:
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  444  	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  445  error_sramclean:
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  446  	kfree(bcom_eng);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  447  	bcom_sram_cleanup();
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  448  error_ofput:
61c7a080a5a061 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2010-04-13  449  	of_node_put(op->dev.of_node);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  450  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  451  	printk(KERN_ERR "DMA: MPC52xx BestComm init failed !\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  452  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  453  	return rv;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  454  }
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  455  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  456  
a454dc50590c6d arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2010-07-22  457  static int mpc52xx_bcom_remove(struct platform_device *op)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  458  {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  459  	/* Clean up the engine */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  460  	bcom_engine_cleanup();
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  461  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  462  	/* Cleanup SRAM */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  463  	bcom_sram_cleanup();
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  464  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  465  	/* Release regs */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  466  	iounmap(bcom_eng->regs);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  467  	release_mem_region(bcom_eng->regs_base, sizeof(struct mpc52xx_sdma));
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  468  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  469  	/* Release the node */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  470  	of_node_put(bcom_eng->ofnode);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  471  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  472  	/* Release memory */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  473  	kfree(bcom_eng);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  474  	bcom_eng = NULL;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  475  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  476  	return 0;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  477  }
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  478  
57c0342239b028 drivers/dma/bestcomm/bestcomm.c         Fabian Frederick   2015-03-16  479  static const struct of_device_id mpc52xx_bcom_of_match[] = {
7ea6fd7e2df041 arch/powerpc/sysdev/bestcomm/bestcomm.c Anatolij Gustschin 2008-03-22  480  	{ .compatible = "fsl,mpc5200-bestcomm", },
7ea6fd7e2df041 arch/powerpc/sysdev/bestcomm/bestcomm.c Anatolij Gustschin 2008-03-22  481  	{ .compatible = "mpc5200-bestcomm", },
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  482  	{},
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  483  };
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  484  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  485  MODULE_DEVICE_TABLE(of, mpc52xx_bcom_of_match);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  486  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  487  
000061245a6797 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2011-02-22 @488  static struct platform_driver mpc52xx_bcom_of_platform_driver = {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16 @489  	.probe		= mpc52xx_bcom_probe,
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16 @490  	.remove		= mpc52xx_bcom_remove,
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16 @491  	.driver = {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  492  		.name = DRIVER_NAME,
4018294b53d1da arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2010-04-13  493  		.of_match_table = mpc52xx_bcom_of_match,
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  494  	},
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  495  };
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  496  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  497  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  498  /* ======================================================================== */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  499  /* Module                                                                   */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  500  /* ======================================================================== */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  501  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  502  static int __init
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  503  mpc52xx_bcom_init(void)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  504  {
000061245a6797 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2011-02-22 @505  	return platform_driver_register(&mpc52xx_bcom_of_platform_driver);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  506  }
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  507  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  508  static void __exit
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  509  mpc52xx_bcom_exit(void)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  510  {
000061245a6797 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2011-02-22 @511  	platform_driver_unregister(&mpc52xx_bcom_of_platform_driver);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  512  }
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  513  

:::::: The code at line 375 was first introduced by commit
:::::: 61c7a080a5a061c976988fd4b844dfb468dda255 of: Always use 'struct device.of_node' to get device node pointer.

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
