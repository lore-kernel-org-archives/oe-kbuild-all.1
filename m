Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACCD1427B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 21:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692307512; x=1723843512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xhuFIXRbv/Z6Bmv3or9SryfCNDBdlZ7bNtKP8PQ7WZw=;
  b=ZBK6EZ7yRWFRV7WlmxD5qIOGevU75iCza3xH18haeV5BJbrUM+tTYtKQ
   tv4lasLmaxK5aLT9WwXXXLG7AGEwvrMo3wYxyMzcLjavm5ODEMcpNVfvQ
   FnmL4vKzb9+frMmSkvHWkxudxoiFZWZN0uRiyFqzI10Gtad7QUxTbXCGN
   8ZngOh3I1moLQWd57yqtKLyuLxI7KahPKRaZo8gelcfnPqSQepu7x9T9N
   yelfdPZEtWsVxu8+6qWJAc07pNTR984fAmGHcpBbfAU0vV88/PFbIe8rK
   hiScij0+C1In2zyF198QZGWqQkS17jmby758r/8j0dFt3NYuJwyh8NXgz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363094235"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="363094235"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 14:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="824812293"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="824812293"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2023 14:25:09 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWkUP-0001Tz-0M;
	Thu, 17 Aug 2023 21:25:09 +0000
Date: Fri, 18 Aug 2023 05:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/230-touchbar 7/8]
 drivers/input/touchscreen/apple_z2.c:429:24: error: implicit declaration of
 function 'of_get_property'
Message-ID: <202308180508.gqc3g1xm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/230-touchbar
head:   35e51412d1ae2ea83b40aaf6cd1914f0c9e91846
commit: 51e31ee6a77588694679f27f28ab7fb59a26eda3 [7/8] input: apple_z2: Add a driver for Apple Z2 touchscreens
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230818/202308180508.gqc3g1xm-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180508.gqc3g1xm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180508.gqc3g1xm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/input/touchscreen/apple_z2.c: In function 'apple_z2_probe':
>> drivers/input/touchscreen/apple_z2.c:429:24: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]
     429 |         z2->cal_blob = of_get_property(dev->of_node, "apple,z2-cal-blob", &z2->cal_size);
         |                        ^~~~~~~~~~~~~~~
>> drivers/input/touchscreen/apple_z2.c:429:22: warning: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     429 |         z2->cal_blob = of_get_property(dev->of_node, "apple,z2-cal-blob", &z2->cal_size);
         |                      ^
   drivers/input/touchscreen/apple_z2.c: At top level:
>> drivers/input/touchscreen/apple_z2.c:486:35: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
     486 |                 .of_match_table = of_match_ptr(apple_z2_of_match),
         |                                   ^~~~~~~~~~~~
>> drivers/input/touchscreen/apple_z2.c:486:35: warning: initialization of 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/input/touchscreen/apple_z2.c:486:35: note: (near initialization for 'apple_z2_driver.driver.of_match_table')
>> drivers/input/touchscreen/apple_z2.c:486:35: error: initializer element is not constant
   drivers/input/touchscreen/apple_z2.c:486:35: note: (near initialization for 'apple_z2_driver.driver.of_match_table')
   cc1: some warnings being treated as errors


vim +/of_get_property +429 drivers/input/touchscreen/apple_z2.c

   363	
   364	static int apple_z2_probe(struct spi_device *spi)
   365	{
   366		struct device *dev = &spi->dev;
   367		struct apple_z2 *z2;
   368		int error;
   369		int x_size;
   370		const char *label;
   371	
   372		z2 = devm_kzalloc(dev, sizeof(*z2), GFP_KERNEL);
   373		if (!z2)
   374			return -ENOMEM;
   375	
   376		z2->spidev = spi;
   377		init_completion(&z2->boot_irq);
   378		spi_set_drvdata(spi, z2);
   379	
   380		z2->cs_gpio = devm_gpiod_get_index(dev, "cs", 0, 0);
   381		if (IS_ERR(z2->cs_gpio)) {
   382			if (PTR_ERR(z2->cs_gpio) != -ENOENT)
   383			{
   384				dev_err(dev, "unable to get cs");
   385				return PTR_ERR(z2->cs_gpio);
   386			} else {
   387				z2->cs_gpio = NULL;
   388			}
   389		}
   390	
   391		z2->reset_gpio = devm_gpiod_get_index(dev, "reset", 0, 0);
   392		if (IS_ERR(z2->reset_gpio)) {
   393		        dev_err(dev, "unable to get reset");
   394			return PTR_ERR(z2->reset_gpio);
   395		}
   396	
   397		error = devm_request_threaded_irq(dev, z2->spidev->irq, NULL,
   398						apple_z2_irq, IRQF_ONESHOT | IRQF_NO_AUTOEN,
   399						"apple-z2-irq", spi);
   400		if (error < 0) {
   401		        dev_err(dev, "unable to request irq");
   402			return z2->spidev->irq;
   403		}
   404	
   405		error = device_property_read_u32(dev, "touchscreen-size-x", &x_size);
   406		if (error) {
   407		        dev_err(dev, "unable to get touchscreen size");
   408			return error;
   409		}
   410	
   411		error = device_property_read_u32(dev, "touchscreen-size-y", &z2->y_size);
   412		if (error) {
   413		        dev_err(dev, "unable to get touchscreen size");
   414			return error;
   415		}
   416	
   417		error = device_property_read_string(dev, "label", &label);
   418		if (error) {
   419		        dev_err(dev, "unable to get device name");
   420			return error;
   421		}
   422	
   423		error = device_property_read_string(dev, "firmware-name", &z2->fw_name);
   424		if (error) {
   425		        dev_err(dev, "unable to get firmware name");
   426			return error;
   427		}
   428	
 > 429		z2->cal_blob = of_get_property(dev->of_node, "apple,z2-cal-blob", &z2->cal_size);
   430		if (!z2->cal_blob) {
   431			dev_err(dev, "unable to get calibration");
   432			return -EINVAL;
   433		}
   434	
   435		z2->input_dev = devm_input_allocate_device(dev);
   436		if (!z2->input_dev)
   437			return -ENOMEM;
   438		z2->input_dev->name = label;
   439		z2->input_dev->phys = "apple_z2";
   440		z2->input_dev->dev.parent = dev;
   441		z2->input_dev->id.bustype = BUS_SPI;
   442		z2->input_dev->open = apple_z2_open;
   443		z2->input_dev->close = apple_z2_close;
   444		input_set_abs_params(z2->input_dev, ABS_MT_POSITION_X, 0, x_size, 0, 0);
   445		input_abs_set_res(z2->input_dev, ABS_MT_POSITION_X, 100);
   446		input_set_abs_params(z2->input_dev, ABS_MT_POSITION_Y, 0, z2->y_size, 0, 0);
   447		input_abs_set_res(z2->input_dev, ABS_MT_POSITION_Y, 100);
   448		input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MAJOR, 0, 65535, 0, 0);
   449		input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MINOR, 0, 65535, 0, 0);
   450		input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MAJOR, 0, 65535, 0, 0);
   451		input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MINOR, 0, 65535, 0, 0);
   452		input_set_abs_params(z2->input_dev, ABS_MT_ORIENTATION, -32768, 32767, 0, 0);
   453		input_set_drvdata(z2->input_dev, z2);
   454		error = input_mt_init_slots(z2->input_dev, 256, INPUT_MT_DIRECT);
   455		if (error < 0) {
   456		        dev_err(dev, "unable to initialize multitouch slots");
   457			return error;
   458		}
   459	
   460		error = input_register_device(z2->input_dev);
   461		if (error < 0)
   462		        dev_err(dev, "unable to register input device");
   463	
   464		return error;
   465	}
   466	
   467	static const struct of_device_id apple_z2_of_match[] = {
   468		{ .compatible = "apple,z2-multitouch" },
   469		{},
   470	};
   471	MODULE_DEVICE_TABLE(of, apple_z2_of_match);
   472	
   473	static struct spi_device_id apple_z2_of_id[] = {
   474		{ .name = "j293-touchbar" },
   475		{ .name = "j493-touchbar" },
   476		{ .name = "z2-touchbar" },
   477		{ .name = "z2-multitouch" },
   478		{}
   479	};
   480	MODULE_DEVICE_TABLE(spi, apple_z2_of_id);
   481	
   482	static struct spi_driver apple_z2_driver = {
   483		.driver = {
   484			.name	= "apple-z2",
   485			.owner = THIS_MODULE,
 > 486			.of_match_table = of_match_ptr(apple_z2_of_match),
   487		},
   488		.id_table       = apple_z2_of_id,
   489		.probe		= apple_z2_probe,
   490	};
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
