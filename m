Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85D84437A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 15:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfrAYKRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701963634; x=1733499634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7/vrcOcVDtFQXxypJ7xvRr2d0Iis07sMRX0pUcIdWpQ=;
  b=YfrAYKRAf9qtRjuOzpOTG43UmACfd8z8TjHXp+jfMBeot3ws9y2vBgne
   1p6BTayq45OAbAjg8YZv2nVwZDN8abzxcMGOjJeFWhix2zTj+awjhYDS7
   t2iNz/NQd5bbA8AbG5JU1YZWjx3aF3aJlfWzOd354c1uHeKHIEtG9PHSN
   IjduDaJ4mLtuY4QHAbE4FyNeCnbumfd4a1JbPMgDaIu+o5IRNSZWimoWd
   XHJKbZm+b9gqQq/FZt6J8MgAonoVyPNi5KLZm0b6BvXZyUkQh7DTG+gKx
   RpzYLphuGsElCsJwdRgOLO4H1rEj+snxhqdrWTq7Y9xs9A7nLJVTLP+w6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="393121320"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="393121320"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 07:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="771770851"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="771770851"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 07 Dec 2023 07:40:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBGUH-000CR1-27;
	Thu, 07 Dec 2023 15:40:29 +0000
Date: Thu, 7 Dec 2023 23:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-next 6/7] drivers/tty/serial/esp32_uart.c:680:31: error:
 dereferencing pointer to incomplete type 'struct platform_device'
Message-ID: <202312072332.KHd7pWmL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   6c26cfb1561efbf12fe3cf700ddc2e956866af45
commit: f793fea7761d32ed64767311c82f39f0798fe6d6 [6/7] of: Stop circularly including of_device.h and of_platform.h
config: i386-buildonly-randconfig-002-20231207 (https://download.01.org/0day-ci/archive/20231207/202312072332.KHd7pWmL-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072332.KHd7pWmL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072332.KHd7pWmL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/auxdisplay/img-ascii-lcd.c: In function 'img_ascii_lcd_probe':
   drivers/auxdisplay/img-ascii-lcd.c:234:10: error: implicit declaration of function 'of_match_device'; did you mean 'of_match_node'? [-Werror=implicit-function-declaration]
     match = of_match_device(img_ascii_lcd_matches, dev);
             ^~~~~~~~~~~~~~~
             of_match_node
>> drivers/auxdisplay/img-ascii-lcd.c:234:8: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     match = of_match_device(img_ascii_lcd_matches, dev);
           ^
   cc1: some warnings being treated as errors
--
   drivers/tty/serial/esp32_uart.c:678:36: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    static int esp32_uart_probe(struct platform_device *pdev)
                                       ^~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_uart.c: In function 'esp32_uart_probe':
>> drivers/tty/serial/esp32_uart.c:680:31: error: dereferencing pointer to incomplete type 'struct platform_device'
     struct device_node *np = pdev->dev.of_node;
                                  ^~
   drivers/tty/serial/esp32_uart.c:709:8: error: implicit declaration of function 'platform_get_resource'; did you mean 'platform_notify_remove'? [-Werror=implicit-function-declaration]
     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
           ^~~~~~~~~~~~~~~~~~~~~
           platform_notify_remove
>> drivers/tty/serial/esp32_uart.c:709:6: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
         ^
   drivers/tty/serial/esp32_uart.c:726:14: error: implicit declaration of function 'platform_get_irq'; did you mean 'platform_notify'? [-Werror=implicit-function-declaration]
     port->irq = platform_get_irq(pdev, 0);
                 ^~~~~~~~~~~~~~~~
                 platform_notify
   drivers/tty/serial/esp32_uart.c:735:2: error: implicit declaration of function 'platform_set_drvdata'; did you mean 'dev_set_drvdata'? [-Werror=implicit-function-declaration]
     platform_set_drvdata(pdev, port);
     ^~~~~~~~~~~~~~~~~~~~
     dev_set_drvdata
   drivers/tty/serial/esp32_uart.c: At top level:
   drivers/tty/serial/esp32_uart.c:740:37: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    static int esp32_uart_remove(struct platform_device *pdev)
                                        ^~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_uart.c: In function 'esp32_uart_remove':
   drivers/tty/serial/esp32_uart.c:742:27: error: implicit declaration of function 'platform_get_drvdata'; did you mean 'dev_get_drvdata'? [-Werror=implicit-function-declaration]
     struct uart_port *port = platform_get_drvdata(pdev);
                              ^~~~~~~~~~~~~~~~~~~~
                              dev_get_drvdata
>> drivers/tty/serial/esp32_uart.c:742:27: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
   drivers/tty/serial/esp32_uart.c: At top level:
   drivers/tty/serial/esp32_uart.c:750:15: error: variable 'esp32_uart_driver' has initializer but incomplete type
    static struct platform_driver esp32_uart_driver = {
                  ^~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_uart.c:751:3: error: 'struct platform_driver' has no member named 'probe'
     .probe  = esp32_uart_probe,
      ^~~~~
   drivers/tty/serial/esp32_uart.c:751:12: warning: excess elements in struct initializer
     .probe  = esp32_uart_probe,
               ^~~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_uart.c:751:12: note: (near initialization for 'esp32_uart_driver')
   drivers/tty/serial/esp32_uart.c:752:3: error: 'struct platform_driver' has no member named 'remove'
     .remove  = esp32_uart_remove,
      ^~~~~~
   drivers/tty/serial/esp32_uart.c:752:13: warning: excess elements in struct initializer
     .remove  = esp32_uart_remove,
                ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_uart.c:752:13: note: (near initialization for 'esp32_uart_driver')
   drivers/tty/serial/esp32_uart.c:753:3: error: 'struct platform_driver' has no member named 'driver'
     .driver  = {
      ^~~~~~
   drivers/tty/serial/esp32_uart.c:753:13: error: extra brace group at end of initializer
     .driver  = {
                ^
   drivers/tty/serial/esp32_uart.c:753:13: note: (near initialization for 'esp32_uart_driver')
   drivers/tty/serial/esp32_uart.c:753:13: warning: excess elements in struct initializer
   drivers/tty/serial/esp32_uart.c:753:13: note: (near initialization for 'esp32_uart_driver')
   drivers/tty/serial/esp32_uart.c: In function 'esp32_uart_init':
   drivers/tty/serial/esp32_uart.c:767:8: error: implicit declaration of function 'platform_driver_register'; did you mean 'driver_register'? [-Werror=implicit-function-declaration]
     ret = platform_driver_register(&esp32_uart_driver);
           ^~~~~~~~~~~~~~~~~~~~~~~~
           driver_register
   drivers/tty/serial/esp32_uart.c: In function 'esp32_uart_exit':
   drivers/tty/serial/esp32_uart.c:776:2: error: implicit declaration of function 'platform_driver_unregister'; did you mean 'driver_unregister'? [-Werror=implicit-function-declaration]
     platform_driver_unregister(&esp32_uart_driver);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
     driver_unregister
   drivers/tty/serial/esp32_uart.c: At top level:
   drivers/tty/serial/esp32_uart.c:750:31: error: storage size of 'esp32_uart_driver' isn't known
    static struct platform_driver esp32_uart_driver = {
                                  ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +680 drivers/tty/serial/esp32_uart.c

8cc89a229aac81 Max Filippov 2023-10-10  677  
8cc89a229aac81 Max Filippov 2023-10-10  678  static int esp32_uart_probe(struct platform_device *pdev)
8cc89a229aac81 Max Filippov 2023-10-10  679  {
8cc89a229aac81 Max Filippov 2023-10-10 @680  	struct device_node *np = pdev->dev.of_node;
8cc89a229aac81 Max Filippov 2023-10-10  681  	static const struct of_device_id *match;
8cc89a229aac81 Max Filippov 2023-10-10  682  	struct uart_port *port;
8cc89a229aac81 Max Filippov 2023-10-10  683  	struct esp32_port *sport;
8cc89a229aac81 Max Filippov 2023-10-10  684  	struct resource *res;
8cc89a229aac81 Max Filippov 2023-10-10  685  	int ret;
8cc89a229aac81 Max Filippov 2023-10-10  686  
8cc89a229aac81 Max Filippov 2023-10-10  687  	match = of_match_device(esp32_uart_dt_ids, &pdev->dev);
8cc89a229aac81 Max Filippov 2023-10-10  688  	if (!match)
8cc89a229aac81 Max Filippov 2023-10-10  689  		return -ENODEV;
8cc89a229aac81 Max Filippov 2023-10-10  690  
8cc89a229aac81 Max Filippov 2023-10-10  691  	sport = devm_kzalloc(&pdev->dev, sizeof(*sport), GFP_KERNEL);
8cc89a229aac81 Max Filippov 2023-10-10  692  	if (!sport)
8cc89a229aac81 Max Filippov 2023-10-10  693  		return -ENOMEM;
8cc89a229aac81 Max Filippov 2023-10-10  694  
8cc89a229aac81 Max Filippov 2023-10-10  695  	port = &sport->port;
8cc89a229aac81 Max Filippov 2023-10-10  696  
8cc89a229aac81 Max Filippov 2023-10-10  697  	ret = of_alias_get_id(np, "serial");
8cc89a229aac81 Max Filippov 2023-10-10  698  	if (ret < 0) {
8cc89a229aac81 Max Filippov 2023-10-10  699  		dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
8cc89a229aac81 Max Filippov 2023-10-10  700  		return ret;
8cc89a229aac81 Max Filippov 2023-10-10  701  	}
8cc89a229aac81 Max Filippov 2023-10-10  702  	if (ret >= UART_NR) {
8cc89a229aac81 Max Filippov 2023-10-10  703  		dev_err(&pdev->dev, "driver limited to %d serial ports\n", UART_NR);
8cc89a229aac81 Max Filippov 2023-10-10  704  		return -ENOMEM;
8cc89a229aac81 Max Filippov 2023-10-10  705  	}
8cc89a229aac81 Max Filippov 2023-10-10  706  
8cc89a229aac81 Max Filippov 2023-10-10  707  	port->line = ret;
8cc89a229aac81 Max Filippov 2023-10-10  708  
8cc89a229aac81 Max Filippov 2023-10-10 @709  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
8cc89a229aac81 Max Filippov 2023-10-10  710  	if (!res)
8cc89a229aac81 Max Filippov 2023-10-10  711  		return -ENODEV;
8cc89a229aac81 Max Filippov 2023-10-10  712  
8cc89a229aac81 Max Filippov 2023-10-10  713  	port->mapbase = res->start;
8cc89a229aac81 Max Filippov 2023-10-10  714  	port->membase = devm_ioremap_resource(&pdev->dev, res);
8cc89a229aac81 Max Filippov 2023-10-10  715  	if (IS_ERR(port->membase))
8cc89a229aac81 Max Filippov 2023-10-10  716  		return PTR_ERR(port->membase);
8cc89a229aac81 Max Filippov 2023-10-10  717  
8cc89a229aac81 Max Filippov 2023-10-10  718  	sport->clk = devm_clk_get(&pdev->dev, NULL);
8cc89a229aac81 Max Filippov 2023-10-10  719  	if (IS_ERR(sport->clk))
8cc89a229aac81 Max Filippov 2023-10-10  720  		return PTR_ERR(sport->clk);
8cc89a229aac81 Max Filippov 2023-10-10  721  
8cc89a229aac81 Max Filippov 2023-10-10  722  	port->uartclk = clk_get_rate(sport->clk);
8cc89a229aac81 Max Filippov 2023-10-10  723  	port->dev = &pdev->dev;
8cc89a229aac81 Max Filippov 2023-10-10  724  	port->type = PORT_GENERIC;
8cc89a229aac81 Max Filippov 2023-10-10  725  	port->iotype = UPIO_MEM;
8cc89a229aac81 Max Filippov 2023-10-10  726  	port->irq = platform_get_irq(pdev, 0);
8cc89a229aac81 Max Filippov 2023-10-10  727  	port->ops = &esp32_uart_pops;
8cc89a229aac81 Max Filippov 2023-10-10  728  	port->flags = UPF_BOOT_AUTOCONF;
8cc89a229aac81 Max Filippov 2023-10-10  729  	port->has_sysrq = 1;
8cc89a229aac81 Max Filippov 2023-10-10  730  	port->fifosize = ESP32_UART_TX_FIFO_SIZE;
8cc89a229aac81 Max Filippov 2023-10-10  731  	port->private_data = (void *)match->data;
8cc89a229aac81 Max Filippov 2023-10-10  732  
8cc89a229aac81 Max Filippov 2023-10-10  733  	esp32_uart_ports[port->line] = sport;
8cc89a229aac81 Max Filippov 2023-10-10  734  
8cc89a229aac81 Max Filippov 2023-10-10  735  	platform_set_drvdata(pdev, port);
8cc89a229aac81 Max Filippov 2023-10-10  736  
8cc89a229aac81 Max Filippov 2023-10-10  737  	return uart_add_one_port(&esp32_uart_reg, port);
8cc89a229aac81 Max Filippov 2023-10-10  738  }
8cc89a229aac81 Max Filippov 2023-10-10  739  
8cc89a229aac81 Max Filippov 2023-10-10  740  static int esp32_uart_remove(struct platform_device *pdev)
8cc89a229aac81 Max Filippov 2023-10-10  741  {
8cc89a229aac81 Max Filippov 2023-10-10 @742  	struct uart_port *port = platform_get_drvdata(pdev);
8cc89a229aac81 Max Filippov 2023-10-10  743  
8cc89a229aac81 Max Filippov 2023-10-10  744  	uart_remove_one_port(&esp32_uart_reg, port);
8cc89a229aac81 Max Filippov 2023-10-10  745  
8cc89a229aac81 Max Filippov 2023-10-10  746  	return 0;
8cc89a229aac81 Max Filippov 2023-10-10  747  }
8cc89a229aac81 Max Filippov 2023-10-10  748  

:::::: The code at line 680 was first introduced by commit
:::::: 8cc89a229aac8183ffd4c385de0b6b9543175eff drivers/tty/serial: add driver for the ESP32 UART

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
