Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53114436B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdhKz7vf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701960954; x=1733496954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iXwW7SSR1QPSzx4M4xOyy0NiReeUsgqehPnKE3exjwI=;
  b=DdhKz7vfhT5DUW668kGvxyhler2MsngTxEW2z90Bv4IbxyPs8JaYokE+
   dbhDG1IvOxSvSBS8MWsibmTfUzcwptMuFdcr62o+HCDZ+8g6byAKMq0yV
   7WvfSNy5Xv/70j7ZFn7Z+944Zv9HtGNRP1Q62sKweKlgHKIfHAQegTaQ9
   pjQQNZtMgksut4zOgkGDL4LxReSCEsvjtornm4YDbuLBPNQm+bRhsdk8Z
   pp36AdboZNZqf+i2GHOTC+AYq9lbUqX2n4U/qcbtLry27SmOOdO48LS23
   bEThuF1Bu6rhdGyhWiiSQGVFHgfKLVIANY3bHyf5S/i7eiY6ryg1Oecog
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1070787"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1070787"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:55:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="13131221"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Dec 2023 06:55:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBFn2-000COM-36;
	Thu, 07 Dec 2023 14:55:48 +0000
Date: Thu, 7 Dec 2023 22:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-next 6/7] drivers/tty/serial/esp32_acm.c:369:31: error:
 dereferencing pointer to incomplete type 'struct platform_device'
Message-ID: <202312072207.oHCE2Lgr-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-002-20231207 (https://download.01.org/0day-ci/archive/20231207/202312072207.oHCE2Lgr-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072207.oHCE2Lgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072207.oHCE2Lgr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/tty/serial/esp32_acm.c:367:37: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    static int esp32s3_acm_probe(struct platform_device *pdev)
                                        ^~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_acm.c: In function 'esp32s3_acm_probe':
>> drivers/tty/serial/esp32_acm.c:369:31: error: dereferencing pointer to incomplete type 'struct platform_device'
     struct device_node *np = pdev->dev.of_node;
                                  ^~
   drivers/tty/serial/esp32_acm.c:391:8: error: implicit declaration of function 'platform_get_resource'; did you mean 'platform_notify_remove'? [-Werror=implicit-function-declaration]
     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
           ^~~~~~~~~~~~~~~~~~~~~
           platform_notify_remove
>> drivers/tty/serial/esp32_acm.c:391:6: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
         ^
   drivers/tty/serial/esp32_acm.c:403:14: error: implicit declaration of function 'platform_get_irq'; did you mean 'platform_notify'? [-Werror=implicit-function-declaration]
     port->irq = platform_get_irq(pdev, 0);
                 ^~~~~~~~~~~~~~~~
                 platform_notify
   drivers/tty/serial/esp32_acm.c:411:2: error: implicit declaration of function 'platform_set_drvdata'; did you mean 'dev_set_drvdata'? [-Werror=implicit-function-declaration]
     platform_set_drvdata(pdev, port);
     ^~~~~~~~~~~~~~~~~~~~
     dev_set_drvdata
   drivers/tty/serial/esp32_acm.c: At top level:
   drivers/tty/serial/esp32_acm.c:416:38: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    static int esp32s3_acm_remove(struct platform_device *pdev)
                                         ^~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_acm.c: In function 'esp32s3_acm_remove':
   drivers/tty/serial/esp32_acm.c:418:27: error: implicit declaration of function 'platform_get_drvdata'; did you mean 'dev_get_drvdata'? [-Werror=implicit-function-declaration]
     struct uart_port *port = platform_get_drvdata(pdev);
                              ^~~~~~~~~~~~~~~~~~~~
                              dev_get_drvdata
>> drivers/tty/serial/esp32_acm.c:418:27: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
   drivers/tty/serial/esp32_acm.c: At top level:
   drivers/tty/serial/esp32_acm.c:425:15: error: variable 'esp32s3_acm_driver' has initializer but incomplete type
    static struct platform_driver esp32s3_acm_driver = {
                  ^~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_acm.c:426:3: error: 'struct platform_driver' has no member named 'probe'
     .probe  = esp32s3_acm_probe,
      ^~~~~
   drivers/tty/serial/esp32_acm.c:426:12: warning: excess elements in struct initializer
     .probe  = esp32s3_acm_probe,
               ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_acm.c:426:12: note: (near initialization for 'esp32s3_acm_driver')
   drivers/tty/serial/esp32_acm.c:427:3: error: 'struct platform_driver' has no member named 'remove'
     .remove  = esp32s3_acm_remove,
      ^~~~~~
   drivers/tty/serial/esp32_acm.c:427:13: warning: excess elements in struct initializer
     .remove  = esp32s3_acm_remove,
                ^~~~~~~~~~~~~~~~~~
   drivers/tty/serial/esp32_acm.c:427:13: note: (near initialization for 'esp32s3_acm_driver')
   drivers/tty/serial/esp32_acm.c:428:3: error: 'struct platform_driver' has no member named 'driver'
     .driver  = {
      ^~~~~~
   drivers/tty/serial/esp32_acm.c:428:13: error: extra brace group at end of initializer
     .driver  = {
                ^
   drivers/tty/serial/esp32_acm.c:428:13: note: (near initialization for 'esp32s3_acm_driver')
   drivers/tty/serial/esp32_acm.c:428:13: warning: excess elements in struct initializer
   drivers/tty/serial/esp32_acm.c:428:13: note: (near initialization for 'esp32s3_acm_driver')
   drivers/tty/serial/esp32_acm.c: In function 'esp32s3_acm_init':
   drivers/tty/serial/esp32_acm.c:442:8: error: implicit declaration of function 'platform_driver_register'; did you mean 'driver_register'? [-Werror=implicit-function-declaration]
     ret = platform_driver_register(&esp32s3_acm_driver);
           ^~~~~~~~~~~~~~~~~~~~~~~~
           driver_register
   drivers/tty/serial/esp32_acm.c: In function 'esp32s3_acm_exit':
   drivers/tty/serial/esp32_acm.c:451:2: error: implicit declaration of function 'platform_driver_unregister'; did you mean 'driver_unregister'? [-Werror=implicit-function-declaration]
     platform_driver_unregister(&esp32s3_acm_driver);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
     driver_unregister
   drivers/tty/serial/esp32_acm.c: At top level:
   drivers/tty/serial/esp32_acm.c:425:31: error: storage size of 'esp32s3_acm_driver' isn't known
    static struct platform_driver esp32s3_acm_driver = {
                                  ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +369 drivers/tty/serial/esp32_acm.c

b0c9a045e8c7d4 Max Filippov 2023-10-10  366  
b0c9a045e8c7d4 Max Filippov 2023-10-10  367  static int esp32s3_acm_probe(struct platform_device *pdev)
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
b0c9a045e8c7d4 Max Filippov 2023-10-10  403  	port->irq = platform_get_irq(pdev, 0);
b0c9a045e8c7d4 Max Filippov 2023-10-10  404  	port->ops = &esp32s3_acm_pops;
b0c9a045e8c7d4 Max Filippov 2023-10-10  405  	port->flags = UPF_BOOT_AUTOCONF;
b0c9a045e8c7d4 Max Filippov 2023-10-10  406  	port->has_sysrq = 1;
b0c9a045e8c7d4 Max Filippov 2023-10-10  407  	port->fifosize = ESP32S3_ACM_TX_FIFO_SIZE;
b0c9a045e8c7d4 Max Filippov 2023-10-10  408  
b0c9a045e8c7d4 Max Filippov 2023-10-10  409  	esp32s3_acm_ports[port->line] = port;
b0c9a045e8c7d4 Max Filippov 2023-10-10  410  
b0c9a045e8c7d4 Max Filippov 2023-10-10  411  	platform_set_drvdata(pdev, port);
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

:::::: The code at line 369 was first introduced by commit
:::::: b0c9a045e8c7d4791ef8bafae2c29fe00e835067 drivers/tty/serial: add ESP32S3 ACM gadget driver

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
