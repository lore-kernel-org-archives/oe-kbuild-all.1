Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6C7391
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 00:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPxmPVKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700095270; x=1731631270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fjM7+tUa7fPU6ErQ5EVxeQC0P81lGvUF/cz0CfDkLaM=;
  b=BPxmPVKghqT+T+lUoMHmmcPo4fFhf1m3UP6t0YrNlfhxbsX0KEsCzcr1
   qoPy/NEmDRoAN4lv0Xwt825N+HxL64VdATVPqgpIX3POIpRjjs8fK4SOO
   lpM2mDMrUc2Tg6GRFcLPQGHN0NA13k2JtSUxwFvaFB4WMuFdaKG9029Xo
   61pSdxSFVkmOEE15hQD/bH5e8ztIQgMHECYGFtorDNg1BEvl7gbp3Q2Ql
   PDzW3w44cAzFOGXo3Cv1me5lU/RHPusCSK1bw1IAlqh0KX/bqHgUz2ihM
   5/hK+7jlLgohTsSmoJQ1Dos66EL9NxdMXA787O9CBfBVV574XDhdIkWV3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="393836220"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="393836220"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 16:41:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="715026414"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="715026414"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Nov 2023 16:41:05 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3QRK-00013X-0g;
	Thu, 16 Nov 2023 00:41:02 +0000
Date: Thu, 16 Nov 2023 08:40:27 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 17/17] drivers/tty/serial/esp32_acm.c:369:38:
 error: invalid use of undefined type 'struct platform_device'
Message-ID: <202311160838.QgkbKm4R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   30bd4c46bf0b9c85631b39f39c6bfc901846dbc9
commit: 30bd4c46bf0b9c85631b39f39c6bfc901846dbc9 [17/17] of: header cleanups
config: arc-randconfig-001-20231116 (https://download.01.org/0day-ci/archive/20231116/202311160838.QgkbKm4R-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160838.QgkbKm4R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160838.QgkbKm4R-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/tty/serial/esp32_acm.c:367:37: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
     367 | static int esp32s3_acm_probe(struct platform_device *pdev)
         |                                     ^~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_acm.c: In function 'esp32s3_acm_probe':
>> drivers/tty/serial/esp32_acm.c:369:38: error: invalid use of undefined type 'struct platform_device'
     369 |         struct device_node *np = pdev->dev.of_node;
         |                                      ^~
   drivers/tty/serial/esp32_acm.c:374:34: error: invalid use of undefined type 'struct platform_device'
     374 |         port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
         |                                  ^~
   In file included from include/linux/device.h:15,
                    from include/linux/cdev.h:8,
                    from include/linux/tty_driver.h:9,
                    from include/linux/tty.h:10,
                    from include/linux/serial_core.h:17,
                    from drivers/tty/serial/esp32_acm.c:12:
   drivers/tty/serial/esp32_acm.c:380:30: error: invalid use of undefined type 'struct platform_device'
     380 |                 dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
         |                              ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/tty/serial/esp32_acm.c:380:17: note: in expansion of macro 'dev_err'
     380 |                 dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
         |                 ^~~~~~~
   drivers/tty/serial/esp32_acm.c:384:30: error: invalid use of undefined type 'struct platform_device'
     384 |                 dev_err(&pdev->dev, "driver limited to %d serial ports\n",
         |                              ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/tty/serial/esp32_acm.c:384:17: note: in expansion of macro 'dev_err'
     384 |                 dev_err(&pdev->dev, "driver limited to %d serial ports\n",
         |                 ^~~~~~~
>> drivers/tty/serial/esp32_acm.c:391:15: error: implicit declaration of function 'platform_get_resource' [-Werror=implicit-function-declaration]
     391 |         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
         |               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/esp32_acm.c:391:13: warning: assignment to 'struct resource *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     391 |         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
         |             ^
   drivers/tty/serial/esp32_acm.c:396:52: error: invalid use of undefined type 'struct platform_device'
     396 |         port->membase = devm_ioremap_resource(&pdev->dev, res);
         |                                                    ^~
   drivers/tty/serial/esp32_acm.c:400:26: error: invalid use of undefined type 'struct platform_device'
     400 |         port->dev = &pdev->dev;
         |                          ^~
>> drivers/tty/serial/esp32_acm.c:403:21: error: implicit declaration of function 'platform_get_irq'; did you mean 'platform_notify'? [-Werror=implicit-function-declaration]
     403 |         port->irq = platform_get_irq(pdev, 0);
         |                     ^~~~~~~~~~~~~~~~
         |                     platform_notify
>> drivers/tty/serial/esp32_acm.c:411:9: error: implicit declaration of function 'platform_set_drvdata' [-Werror=implicit-function-declaration]
     411 |         platform_set_drvdata(pdev, port);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_acm.c: At top level:
   drivers/tty/serial/esp32_acm.c:416:38: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
     416 | static int esp32s3_acm_remove(struct platform_device *pdev)
         |                                      ^~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_acm.c: In function 'esp32s3_acm_remove':
>> drivers/tty/serial/esp32_acm.c:418:34: error: implicit declaration of function 'platform_get_drvdata' [-Werror=implicit-function-declaration]
     418 |         struct uart_port *port = platform_get_drvdata(pdev);
         |                                  ^~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/esp32_acm.c:418:34: warning: initialization of 'struct uart_port *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/tty/serial/esp32_acm.c: At top level:
>> drivers/tty/serial/esp32_acm.c:425:15: error: variable 'esp32s3_acm_driver' has initializer but incomplete type
     425 | static struct platform_driver esp32s3_acm_driver = {
         |               ^~~~~~~~~~~~~~~
>> drivers/tty/serial/esp32_acm.c:426:10: error: 'struct platform_driver' has no member named 'probe'
     426 |         .probe          = esp32s3_acm_probe,
         |          ^~~~~
>> drivers/tty/serial/esp32_acm.c:426:27: warning: excess elements in struct initializer
     426 |         .probe          = esp32s3_acm_probe,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_acm.c:426:27: note: (near initialization for 'esp32s3_acm_driver')
>> drivers/tty/serial/esp32_acm.c:427:10: error: 'struct platform_driver' has no member named 'remove'
     427 |         .remove         = esp32s3_acm_remove,
         |          ^~~~~~
   drivers/tty/serial/esp32_acm.c:427:27: warning: excess elements in struct initializer
     427 |         .remove         = esp32s3_acm_remove,
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_acm.c:427:27: note: (near initialization for 'esp32s3_acm_driver')
>> drivers/tty/serial/esp32_acm.c:428:10: error: 'struct platform_driver' has no member named 'driver'
     428 |         .driver         = {
         |          ^~~~~~
>> drivers/tty/serial/esp32_acm.c:428:27: error: extra brace group at end of initializer
     428 |         .driver         = {
         |                           ^
   drivers/tty/serial/esp32_acm.c:428:27: note: (near initialization for 'esp32s3_acm_driver')
   drivers/tty/serial/esp32_acm.c:428:27: warning: excess elements in struct initializer
   drivers/tty/serial/esp32_acm.c:428:27: note: (near initialization for 'esp32s3_acm_driver')
   drivers/tty/serial/esp32_acm.c: In function 'esp32s3_acm_init':
>> drivers/tty/serial/esp32_acm.c:442:15: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
     442 |         ret = platform_driver_register(&esp32s3_acm_driver);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_acm.c: In function 'esp32s3_acm_exit':
>> drivers/tty/serial/esp32_acm.c:451:9: error: implicit declaration of function 'platform_driver_unregister'; did you mean 'driver_unregister'? [-Werror=implicit-function-declaration]
     451 |         platform_driver_unregister(&esp32s3_acm_driver);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         driver_unregister
   drivers/tty/serial/esp32_acm.c: At top level:
>> drivers/tty/serial/esp32_acm.c:425:31: error: storage size of 'esp32s3_acm_driver' isn't known
     425 | static struct platform_driver esp32s3_acm_driver = {
         |                               ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/tty/serial/esp32_uart.c:678:36: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
     678 | static int esp32_uart_probe(struct platform_device *pdev)
         |                                    ^~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_uart.c: In function 'esp32_uart_probe':
>> drivers/tty/serial/esp32_uart.c:680:38: error: invalid use of undefined type 'struct platform_device'
     680 |         struct device_node *np = pdev->dev.of_node;
         |                                      ^~
   drivers/tty/serial/esp32_uart.c:687:57: error: invalid use of undefined type 'struct platform_device'
     687 |         match = of_match_device(esp32_uart_dt_ids, &pdev->dev);
         |                                                         ^~
   drivers/tty/serial/esp32_uart.c:691:35: error: invalid use of undefined type 'struct platform_device'
     691 |         sport = devm_kzalloc(&pdev->dev, sizeof(*sport), GFP_KERNEL);
         |                                   ^~
   In file included from include/linux/device.h:15,
                    from include/linux/cdev.h:8,
                    from include/linux/tty_driver.h:9,
                    from include/linux/tty.h:10,
                    from include/linux/serial_core.h:17,
                    from drivers/tty/serial/esp32_uart.c:13:
   drivers/tty/serial/esp32_uart.c:699:30: error: invalid use of undefined type 'struct platform_device'
     699 |                 dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
         |                              ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/tty/serial/esp32_uart.c:699:17: note: in expansion of macro 'dev_err'
     699 |                 dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
         |                 ^~~~~~~
   drivers/tty/serial/esp32_uart.c:703:30: error: invalid use of undefined type 'struct platform_device'
     703 |                 dev_err(&pdev->dev, "driver limited to %d serial ports\n", UART_NR);
         |                              ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/tty/serial/esp32_uart.c:703:17: note: in expansion of macro 'dev_err'
     703 |                 dev_err(&pdev->dev, "driver limited to %d serial ports\n", UART_NR);
         |                 ^~~~~~~
>> drivers/tty/serial/esp32_uart.c:709:15: error: implicit declaration of function 'platform_get_resource' [-Werror=implicit-function-declaration]
     709 |         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
         |               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/esp32_uart.c:709:13: warning: assignment to 'struct resource *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     709 |         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
         |             ^
   drivers/tty/serial/esp32_uart.c:714:52: error: invalid use of undefined type 'struct platform_device'
     714 |         port->membase = devm_ioremap_resource(&pdev->dev, res);
         |                                                    ^~
   drivers/tty/serial/esp32_uart.c:718:40: error: invalid use of undefined type 'struct platform_device'
     718 |         sport->clk = devm_clk_get(&pdev->dev, NULL);
         |                                        ^~
   drivers/tty/serial/esp32_uart.c:723:26: error: invalid use of undefined type 'struct platform_device'
     723 |         port->dev = &pdev->dev;
         |                          ^~
>> drivers/tty/serial/esp32_uart.c:726:21: error: implicit declaration of function 'platform_get_irq'; did you mean 'platform_notify'? [-Werror=implicit-function-declaration]
     726 |         port->irq = platform_get_irq(pdev, 0);
         |                     ^~~~~~~~~~~~~~~~
         |                     platform_notify
>> drivers/tty/serial/esp32_uart.c:735:9: error: implicit declaration of function 'platform_set_drvdata' [-Werror=implicit-function-declaration]
     735 |         platform_set_drvdata(pdev, port);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_uart.c: At top level:
   drivers/tty/serial/esp32_uart.c:740:37: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
     740 | static int esp32_uart_remove(struct platform_device *pdev)
         |                                     ^~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_uart.c: In function 'esp32_uart_remove':
>> drivers/tty/serial/esp32_uart.c:742:34: error: implicit declaration of function 'platform_get_drvdata' [-Werror=implicit-function-declaration]
     742 |         struct uart_port *port = platform_get_drvdata(pdev);
         |                                  ^~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/esp32_uart.c:742:34: warning: initialization of 'struct uart_port *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/tty/serial/esp32_uart.c: At top level:
>> drivers/tty/serial/esp32_uart.c:750:15: error: variable 'esp32_uart_driver' has initializer but incomplete type
     750 | static struct platform_driver esp32_uart_driver = {
         |               ^~~~~~~~~~~~~~~
>> drivers/tty/serial/esp32_uart.c:751:10: error: 'struct platform_driver' has no member named 'probe'
     751 |         .probe          = esp32_uart_probe,
         |          ^~~~~
>> drivers/tty/serial/esp32_uart.c:751:27: warning: excess elements in struct initializer
     751 |         .probe          = esp32_uart_probe,
         |                           ^~~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_uart.c:751:27: note: (near initialization for 'esp32_uart_driver')
>> drivers/tty/serial/esp32_uart.c:752:10: error: 'struct platform_driver' has no member named 'remove'
     752 |         .remove         = esp32_uart_remove,
         |          ^~~~~~
   drivers/tty/serial/esp32_uart.c:752:27: warning: excess elements in struct initializer
     752 |         .remove         = esp32_uart_remove,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_uart.c:752:27: note: (near initialization for 'esp32_uart_driver')
>> drivers/tty/serial/esp32_uart.c:753:10: error: 'struct platform_driver' has no member named 'driver'
     753 |         .driver         = {
         |          ^~~~~~
>> drivers/tty/serial/esp32_uart.c:753:27: error: extra brace group at end of initializer
     753 |         .driver         = {
         |                           ^
   drivers/tty/serial/esp32_uart.c:753:27: note: (near initialization for 'esp32_uart_driver')
   drivers/tty/serial/esp32_uart.c:753:27: warning: excess elements in struct initializer
   drivers/tty/serial/esp32_uart.c:753:27: note: (near initialization for 'esp32_uart_driver')
   drivers/tty/serial/esp32_uart.c: In function 'esp32_uart_init':
>> drivers/tty/serial/esp32_uart.c:767:15: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
     767 |         ret = platform_driver_register(&esp32_uart_driver);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_uart.c: In function 'esp32_uart_exit':
>> drivers/tty/serial/esp32_uart.c:776:9: error: implicit declaration of function 'platform_driver_unregister'; did you mean 'driver_unregister'? [-Werror=implicit-function-declaration]
     776 |         platform_driver_unregister(&esp32_uart_driver);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         driver_unregister
   drivers/tty/serial/esp32_uart.c: At top level:
>> drivers/tty/serial/esp32_uart.c:750:31: error: storage size of 'esp32_uart_driver' isn't known
     750 | static struct platform_driver esp32_uart_driver = {
         |                               ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +369 drivers/tty/serial/esp32_acm.c

b0c9a045e8c7d4 Max Filippov 2023-10-10  366  
b0c9a045e8c7d4 Max Filippov 2023-10-10 @367  static int esp32s3_acm_probe(struct platform_device *pdev)
b0c9a045e8c7d4 Max Filippov 2023-10-10  368  {
b0c9a045e8c7d4 Max Filippov 2023-10-10 @369  	struct device_node *np = pdev->dev.of_node;
b0c9a045e8c7d4 Max Filippov 2023-10-10  370  	struct uart_port *port;
b0c9a045e8c7d4 Max Filippov 2023-10-10  371  	struct resource *res;
b0c9a045e8c7d4 Max Filippov 2023-10-10  372  	int ret;
b0c9a045e8c7d4 Max Filippov 2023-10-10  373  
b0c9a045e8c7d4 Max Filippov 2023-10-10  374  	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
b0c9a045e8c7d4 Max Filippov 2023-10-10  375  	if (!port)
b0c9a045e8c7d4 Max Filippov 2023-10-10  376  		return -ENOMEM;
b0c9a045e8c7d4 Max Filippov 2023-10-10  377  
b0c9a045e8c7d4 Max Filippov 2023-10-10  378  	ret = of_alias_get_id(np, "serial");
b0c9a045e8c7d4 Max Filippov 2023-10-10  379  	if (ret < 0) {
b0c9a045e8c7d4 Max Filippov 2023-10-10  380  		dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
b0c9a045e8c7d4 Max Filippov 2023-10-10  381  		return ret;
b0c9a045e8c7d4 Max Filippov 2023-10-10  382  	}
b0c9a045e8c7d4 Max Filippov 2023-10-10  383  	if (ret >= UART_NR) {
b0c9a045e8c7d4 Max Filippov 2023-10-10  384  		dev_err(&pdev->dev, "driver limited to %d serial ports\n",
b0c9a045e8c7d4 Max Filippov 2023-10-10  385  			UART_NR);
b0c9a045e8c7d4 Max Filippov 2023-10-10  386  		return -ENOMEM;
b0c9a045e8c7d4 Max Filippov 2023-10-10  387  	}
b0c9a045e8c7d4 Max Filippov 2023-10-10  388  
b0c9a045e8c7d4 Max Filippov 2023-10-10  389  	port->line = ret;
b0c9a045e8c7d4 Max Filippov 2023-10-10  390  
b0c9a045e8c7d4 Max Filippov 2023-10-10 @391  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
b0c9a045e8c7d4 Max Filippov 2023-10-10  392  	if (!res)
b0c9a045e8c7d4 Max Filippov 2023-10-10  393  		return -ENODEV;
b0c9a045e8c7d4 Max Filippov 2023-10-10  394  
b0c9a045e8c7d4 Max Filippov 2023-10-10  395  	port->mapbase = res->start;
b0c9a045e8c7d4 Max Filippov 2023-10-10  396  	port->membase = devm_ioremap_resource(&pdev->dev, res);
b0c9a045e8c7d4 Max Filippov 2023-10-10  397  	if (IS_ERR(port->membase))
b0c9a045e8c7d4 Max Filippov 2023-10-10  398  		return PTR_ERR(port->membase);
b0c9a045e8c7d4 Max Filippov 2023-10-10  399  
b0c9a045e8c7d4 Max Filippov 2023-10-10  400  	port->dev = &pdev->dev;
b0c9a045e8c7d4 Max Filippov 2023-10-10  401  	port->type = PORT_GENERIC;
b0c9a045e8c7d4 Max Filippov 2023-10-10  402  	port->iotype = UPIO_MEM;
b0c9a045e8c7d4 Max Filippov 2023-10-10 @403  	port->irq = platform_get_irq(pdev, 0);
b0c9a045e8c7d4 Max Filippov 2023-10-10  404  	port->ops = &esp32s3_acm_pops;
b0c9a045e8c7d4 Max Filippov 2023-10-10  405  	port->flags = UPF_BOOT_AUTOCONF;
b0c9a045e8c7d4 Max Filippov 2023-10-10  406  	port->has_sysrq = 1;
b0c9a045e8c7d4 Max Filippov 2023-10-10  407  	port->fifosize = ESP32S3_ACM_TX_FIFO_SIZE;
b0c9a045e8c7d4 Max Filippov 2023-10-10  408  
b0c9a045e8c7d4 Max Filippov 2023-10-10  409  	esp32s3_acm_ports[port->line] = port;
b0c9a045e8c7d4 Max Filippov 2023-10-10  410  
b0c9a045e8c7d4 Max Filippov 2023-10-10 @411  	platform_set_drvdata(pdev, port);
b0c9a045e8c7d4 Max Filippov 2023-10-10  412  
b0c9a045e8c7d4 Max Filippov 2023-10-10  413  	return uart_add_one_port(&esp32s3_acm_reg, port);
b0c9a045e8c7d4 Max Filippov 2023-10-10  414  }
b0c9a045e8c7d4 Max Filippov 2023-10-10  415  
b0c9a045e8c7d4 Max Filippov 2023-10-10  416  static int esp32s3_acm_remove(struct platform_device *pdev)
b0c9a045e8c7d4 Max Filippov 2023-10-10  417  {
b0c9a045e8c7d4 Max Filippov 2023-10-10 @418  	struct uart_port *port = platform_get_drvdata(pdev);
b0c9a045e8c7d4 Max Filippov 2023-10-10  419  
b0c9a045e8c7d4 Max Filippov 2023-10-10  420  	uart_remove_one_port(&esp32s3_acm_reg, port);
b0c9a045e8c7d4 Max Filippov 2023-10-10  421  	return 0;
b0c9a045e8c7d4 Max Filippov 2023-10-10  422  }
b0c9a045e8c7d4 Max Filippov 2023-10-10  423  
b0c9a045e8c7d4 Max Filippov 2023-10-10  424  
b0c9a045e8c7d4 Max Filippov 2023-10-10 @425  static struct platform_driver esp32s3_acm_driver = {
b0c9a045e8c7d4 Max Filippov 2023-10-10 @426  	.probe		= esp32s3_acm_probe,
b0c9a045e8c7d4 Max Filippov 2023-10-10 @427  	.remove		= esp32s3_acm_remove,
b0c9a045e8c7d4 Max Filippov 2023-10-10 @428  	.driver		= {
b0c9a045e8c7d4 Max Filippov 2023-10-10  429  		.name	= DRIVER_NAME,
b0c9a045e8c7d4 Max Filippov 2023-10-10  430  		.of_match_table	= esp32s3_acm_dt_ids,
b0c9a045e8c7d4 Max Filippov 2023-10-10  431  	},
b0c9a045e8c7d4 Max Filippov 2023-10-10  432  };
b0c9a045e8c7d4 Max Filippov 2023-10-10  433  
b0c9a045e8c7d4 Max Filippov 2023-10-10  434  static int __init esp32s3_acm_init(void)
b0c9a045e8c7d4 Max Filippov 2023-10-10  435  {
b0c9a045e8c7d4 Max Filippov 2023-10-10  436  	int ret;
b0c9a045e8c7d4 Max Filippov 2023-10-10  437  
b0c9a045e8c7d4 Max Filippov 2023-10-10  438  	ret = uart_register_driver(&esp32s3_acm_reg);
b0c9a045e8c7d4 Max Filippov 2023-10-10  439  	if (ret)
b0c9a045e8c7d4 Max Filippov 2023-10-10  440  		return ret;
b0c9a045e8c7d4 Max Filippov 2023-10-10  441  
b0c9a045e8c7d4 Max Filippov 2023-10-10 @442  	ret = platform_driver_register(&esp32s3_acm_driver);
b0c9a045e8c7d4 Max Filippov 2023-10-10  443  	if (ret)
b0c9a045e8c7d4 Max Filippov 2023-10-10  444  		uart_unregister_driver(&esp32s3_acm_reg);
b0c9a045e8c7d4 Max Filippov 2023-10-10  445  
b0c9a045e8c7d4 Max Filippov 2023-10-10  446  	return ret;
b0c9a045e8c7d4 Max Filippov 2023-10-10  447  }
b0c9a045e8c7d4 Max Filippov 2023-10-10  448  
b0c9a045e8c7d4 Max Filippov 2023-10-10  449  static void __exit esp32s3_acm_exit(void)
b0c9a045e8c7d4 Max Filippov 2023-10-10  450  {
b0c9a045e8c7d4 Max Filippov 2023-10-10 @451  	platform_driver_unregister(&esp32s3_acm_driver);
b0c9a045e8c7d4 Max Filippov 2023-10-10  452  	uart_unregister_driver(&esp32s3_acm_reg);
b0c9a045e8c7d4 Max Filippov 2023-10-10  453  }
b0c9a045e8c7d4 Max Filippov 2023-10-10  454  

:::::: The code at line 369 was first introduced by commit
:::::: b0c9a045e8c7d4791ef8bafae2c29fe00e835067 drivers/tty/serial: add ESP32S3 ACM gadget driver

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
