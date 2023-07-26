Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CA11AA81
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 17:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690392270; x=1721928270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hO2hNRqRyi4Y0VsvQtRDP6pBFQxzaUEetSGlbtOzD4o=;
  b=Fw2vFpAgSoV0LAWdmJ2mB8IutXF2AYFOT89yMBAySWMt7qzFmsLfrfnj
   9JxTm8eDaonIXejQiSBogILA/GI2OJ5q1D8rrVhiz2j+/HVwVNj2V5RDJ
   3dK15My0VQfmkCCfciGDvdb1lpptUvBrtKX7zwYZRpfG8X4Uxe2Na4Ie6
   zei8Cce/i0YVqOypTk79lHPG+kT9JPJocs5ALUyOGihcWYtZn9TeK737B
   FaAs7uoHPnx5eocZ/nHsyPQpWSVIsfF/37RQRv7CqEKGbDTfYidayCONP
   WMiC28CNoxtx4h7mzu0HYbkQhly9/s3PGm/10XWHpg3G2hi879DCXqLKz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347694272"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="347694272"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 10:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="676782236"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="676782236"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Jul 2023 10:24:22 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOiFJ-00018x-1Z;
	Wed, 26 Jul 2023 17:24:21 +0000
Date: Thu, 27 Jul 2023 01:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [linux-next:master 2607/4710] drivers/gpio/gpio-ge.c:59:32: error:
 invalid use of undefined type 'struct platform_device'
Message-ID: <202307270116.Xf7g8Lne-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ba5d07205771c50789fd9063950aa75e7f1183f
commit: e91d0f05e66afba9a3804bccf3d0a4310bb30024 [2607/4710] gpio: Explicitly include correct DT includes
config: powerpc-randconfig-r036-20230726 (https://download.01.org/0day-ci/archive/20230727/202307270116.Xf7g8Lne-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270116.Xf7g8Lne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307270116.Xf7g8Lne-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-ge.c:53:41: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
      53 | static int __init gef_gpio_probe(struct platform_device *pdev)
         |                                         ^~~~~~~~~~~~~~~
   drivers/gpio/gpio-ge.c: In function 'gef_gpio_probe':
>> drivers/gpio/gpio-ge.c:59:32: error: invalid use of undefined type 'struct platform_device'
      59 |         gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
         |                                ^~
   drivers/gpio/gpio-ge.c:63:29: error: invalid use of undefined type 'struct platform_device'
      63 |         regs = of_iomap(pdev->dev.of_node, 0);
         |                             ^~
   drivers/gpio/gpio-ge.c:67:35: error: invalid use of undefined type 'struct platform_device'
      67 |         ret = bgpio_init(gc, &pdev->dev, 4, regs + GEF_GPIO_IN,
         |                                   ^~
   In file included from include/linux/device.h:15,
                    from arch/powerpc/include/asm/io.h:27,
                    from include/linux/io.h:13,
                    from drivers/gpio/gpio-ge.c:21:
   drivers/gpio/gpio-ge.c:71:30: error: invalid use of undefined type 'struct platform_device'
      71 |                 dev_err(&pdev->dev, "bgpio_init failed\n");
         |                              ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/gpio/gpio-ge.c:71:17: note: in expansion of macro 'dev_err'
      71 |                 dev_err(&pdev->dev, "bgpio_init failed\n");
         |                 ^~~~~~~
   drivers/gpio/gpio-ge.c:76:41: error: invalid use of undefined type 'struct platform_device'
      76 |         gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOF", pdev->dev.of_node);
         |                                         ^~
   drivers/gpio/gpio-ge.c:76:72: error: invalid use of undefined type 'struct platform_device'
      76 |         gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOF", pdev->dev.of_node);
         |                                                                        ^~
   drivers/gpio/gpio-ge.c:83:67: error: invalid use of undefined type 'struct platform_device'
      83 |         gc->ngpio = (u16)(uintptr_t)of_device_get_match_data(&pdev->dev);
         |                                                                   ^~
   In file included from drivers/gpio/gpio-ge.c:26:
   drivers/gpio/gpio-ge.c:86:43: error: invalid use of undefined type 'struct platform_device'
      86 |         ret = devm_gpiochip_add_data(&pdev->dev, gc, NULL);
         |                                           ^~
   include/linux/gpio/driver.h:589:49: note: in definition of macro 'devm_gpiochip_add_data'
     589 |                 devm_gpiochip_add_data_with_key(dev, gc, data, &lock_key, \
         |                                                 ^~~
   In file included from include/linux/kernel.h:30,
                    from drivers/gpio/gpio-ge.c:20:
   drivers/gpio/gpio-ge.c:93:61: error: invalid use of undefined type 'struct platform_device'
      93 |         pr_err("%pOF: GPIO chip registration failed\n", pdev->dev.of_node);
         |                                                             ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/gpio/gpio-ge.c:93:9: note: in expansion of macro 'pr_err'
      93 |         pr_err("%pOF: GPIO chip registration failed\n", pdev->dev.of_node);
         |         ^~~~~~
   drivers/gpio/gpio-ge.c: At top level:
>> drivers/gpio/gpio-ge.c:97:15: error: variable 'gef_gpio_driver' has initializer but incomplete type
      97 | static struct platform_driver gef_gpio_driver = {
         |               ^~~~~~~~~~~~~~~
>> drivers/gpio/gpio-ge.c:98:10: error: 'struct platform_driver' has no member named 'driver'
      98 |         .driver = {
         |          ^~~~~~
>> drivers/gpio/gpio-ge.c:98:19: error: extra brace group at end of initializer
      98 |         .driver = {
         |                   ^
   drivers/gpio/gpio-ge.c:98:19: note: (near initialization for 'gef_gpio_driver')
>> drivers/gpio/gpio-ge.c:98:19: warning: excess elements in struct initializer
   drivers/gpio/gpio-ge.c:98:19: note: (near initialization for 'gef_gpio_driver')
>> drivers/gpio/gpio-ge.c:103:1: warning: data definition has no type or storage class
     103 | module_platform_driver_probe(gef_gpio_driver, gef_gpio_probe);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-ge.c:103:1: error: type defaults to 'int' in declaration of 'module_platform_driver_probe' [-Werror=implicit-int]
>> drivers/gpio/gpio-ge.c:103:1: warning: parameter names (without types) in function declaration
>> drivers/gpio/gpio-ge.c:97:31: error: storage size of 'gef_gpio_driver' isn't known
      97 | static struct platform_driver gef_gpio_driver = {
         |                               ^~~~~~~~~~~~~~~
   drivers/gpio/gpio-ge.c:97:31: warning: 'gef_gpio_driver' defined but not used [-Wunused-variable]
   drivers/gpio/gpio-ge.c:53:19: warning: 'gef_gpio_probe' defined but not used [-Wunused-function]
      53 | static int __init gef_gpio_probe(struct platform_device *pdev)
         |                   ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +59 drivers/gpio/gpio-ge.c

965dc5fc55fa02 arch/powerpc/platforms/86xx/gef_gpio.c Martyn Welch     2008-11-07   52  
9dacc6de4c0906 drivers/gpio/gpio-ge.c                 Alexander Shiyan 2014-04-12  @53  static int __init gef_gpio_probe(struct platform_device *pdev)
965dc5fc55fa02 arch/powerpc/platforms/86xx/gef_gpio.c Martyn Welch     2008-11-07   54  {
0f4630f3720e7e drivers/gpio/gpio-ge.c                 Linus Walleij    2015-12-04   55  	struct gpio_chip *gc;
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   56  	void __iomem *regs;
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   57  	int ret;
b1dd62f7f108a5 arch/powerpc/platforms/86xx/gef_gpio.c Martyn Welch     2009-01-19   58  
0f4630f3720e7e drivers/gpio/gpio-ge.c                 Linus Walleij    2015-12-04  @59  	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
0f4630f3720e7e drivers/gpio/gpio-ge.c                 Linus Walleij    2015-12-04   60  	if (!gc)
9dacc6de4c0906 drivers/gpio/gpio-ge.c                 Alexander Shiyan 2014-04-12   61  		return -ENOMEM;
965dc5fc55fa02 arch/powerpc/platforms/86xx/gef_gpio.c Martyn Welch     2008-11-07   62  
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   63  	regs = of_iomap(pdev->dev.of_node, 0);
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   64  	if (!regs)
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   65  		return -ENOMEM;
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   66  
0f4630f3720e7e drivers/gpio/gpio-ge.c                 Linus Walleij    2015-12-04   67  	ret = bgpio_init(gc, &pdev->dev, 4, regs + GEF_GPIO_IN,
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   68  			 regs + GEF_GPIO_OUT, NULL, NULL,
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   69  			 regs + GEF_GPIO_DIRECT, BGPIOF_BIG_ENDIAN_BYTE_ORDER);
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   70  	if (ret) {
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   71  		dev_err(&pdev->dev, "bgpio_init failed\n");
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   72  		goto err0;
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   73  	}
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   74  
965dc5fc55fa02 arch/powerpc/platforms/86xx/gef_gpio.c Martyn Welch     2008-11-07   75  	/* Setup pointers to chip functions */
7eb6ce2f272336 drivers/gpio/gpio-ge.c                 Rob Herring      2017-07-18   76  	gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOF", pdev->dev.of_node);
0f4630f3720e7e drivers/gpio/gpio-ge.c                 Linus Walleij    2015-12-04   77  	if (!gc->label) {
74b18de94cfb7b drivers/gpio/gpio-ge.c                 Axel Lin         2015-01-21   78  		ret = -ENOMEM;
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   79  		goto err0;
74b18de94cfb7b drivers/gpio/gpio-ge.c                 Axel Lin         2015-01-21   80  	}
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   81  
0f4630f3720e7e drivers/gpio/gpio-ge.c                 Linus Walleij    2015-12-04   82  	gc->base = -1;
668f06579e9976 drivers/gpio/gpio-ge.c                 Thierry Reding   2018-05-03   83  	gc->ngpio = (u16)(uintptr_t)of_device_get_match_data(&pdev->dev);
965dc5fc55fa02 arch/powerpc/platforms/86xx/gef_gpio.c Martyn Welch     2008-11-07   84  
965dc5fc55fa02 arch/powerpc/platforms/86xx/gef_gpio.c Martyn Welch     2008-11-07   85  	/* This function adds a memory mapped GPIO chip */
ad2261ca7b099b drivers/gpio/gpio-ge.c                 Laxman Dewangan  2016-02-22   86  	ret = devm_gpiochip_add_data(&pdev->dev, gc, NULL);
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   87  	if (ret)
74b18de94cfb7b drivers/gpio/gpio-ge.c                 Axel Lin         2015-01-21   88  		goto err0;
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   89  
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   90  	return 0;
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   91  err0:
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   92  	iounmap(regs);
7eb6ce2f272336 drivers/gpio/gpio-ge.c                 Rob Herring      2017-07-18   93  	pr_err("%pOF: GPIO chip registration failed\n", pdev->dev.of_node);
866010fb7ea03b drivers/gpio/gpio-ge.c                 Kamlakant Patel  2014-12-01   94  	return ret;
9dacc6de4c0906 drivers/gpio/gpio-ge.c                 Alexander Shiyan 2014-04-12   95  };
e041013ac0df7f drivers/gpio/gpio-ge.c                 Martyn Welch     2012-03-12   96  
9dacc6de4c0906 drivers/gpio/gpio-ge.c                 Alexander Shiyan 2014-04-12  @97  static struct platform_driver gef_gpio_driver = {
9dacc6de4c0906 drivers/gpio/gpio-ge.c                 Alexander Shiyan 2014-04-12  @98  	.driver = {
9dacc6de4c0906 drivers/gpio/gpio-ge.c                 Alexander Shiyan 2014-04-12   99  		.name		= "gef-gpio",
9dacc6de4c0906 drivers/gpio/gpio-ge.c                 Alexander Shiyan 2014-04-12  100  		.of_match_table	= gef_gpio_ids,
9dacc6de4c0906 drivers/gpio/gpio-ge.c                 Alexander Shiyan 2014-04-12  101  	},
965dc5fc55fa02 arch/powerpc/platforms/86xx/gef_gpio.c Martyn Welch     2008-11-07  102  };
9dacc6de4c0906 drivers/gpio/gpio-ge.c                 Alexander Shiyan 2014-04-12 @103  module_platform_driver_probe(gef_gpio_driver, gef_gpio_probe);
965dc5fc55fa02 arch/powerpc/platforms/86xx/gef_gpio.c Martyn Welch     2008-11-07  104  

:::::: The code at line 59 was first introduced by commit
:::::: 0f4630f3720e7e6e921bf525c8357fea7ef3dbab gpio: generic: factor into gpio_chip struct

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
