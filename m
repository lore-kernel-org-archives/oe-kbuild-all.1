Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D736120
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 09:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693215331; x=1724751331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PY6dYBvGe1UewHxWrZAeakeqPV+0lcwtfXEPyDobEUc=;
  b=NytKh22ul/dG1YfFR4mtn8pqHyNqkNSuhS6QSmwSCrTc3tu3NjSOGaiL
   5j0ko4kE8/NPW8xzogHjw0sAOqjjTwZYRDaLkO3YzfnaXQQSzH4cz2szd
   WuPg6bl6Ecp6AQ7AjFFXyIXuPZEfcF2ml31Y3NxsJ07lyGlUYzlVGVxCD
   hFtq+Z3wk4D9e+y1H6X9NDJLeZTTn6mFI6UOD5M3Ea07wEFfgao/XEKlV
   LsLnR0LdKR6PUby6NuQDF9rEQWuuIMES2oNhGwbJ/tB8gEGqDJZQQUFIa
   3elVEoe0UY7ySGmcpRHdd/Qk/IUg6GP2lmeX61ajrdC8EBh6PSK4l3pi6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="365263086"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="365263086"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 02:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="803644801"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="803644801"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2023 02:35:28 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaYeI-0007kL-18;
	Mon, 28 Aug 2023 09:35:15 +0000
Date: Mon, 28 Aug 2023 17:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12875/13109] drivers/parisc/led.c:317:undefined
 reference to `led_classdev_unregister'
Message-ID: <202308281723.rU5igcz0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ee82481c392eec06a7ef28df61b7f0d8e45be2e
commit: c28839537a35ceb04ec08d069b0da190d84f25fc [12875/13109] parisc: led: Rewrite driver to use platform LED code
config: parisc-randconfig-r005-20230828 (https://download.01.org/0day-ci/archive/20230828/202308281723.rU5igcz0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308281723.rU5igcz0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308281723.rU5igcz0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/parisc/led.c:395: warning: Function parameter or member 'model' not described in 'register_led_driver'
>> drivers/parisc/led.c:395: warning: Function parameter or member 'cmd_reg' not described in 'register_led_driver'
>> drivers/parisc/led.c:395: warning: Function parameter or member 'data_reg' not described in 'register_led_driver'
--
   hppa-linux-ld: drivers/parisc/ccio-dma.o: in function `ccio_probe':
   drivers/parisc/ccio-dma.c:1562:(.init.text+0x548): undefined reference to `proc_runway_root'
   hppa-linux-ld: drivers/parisc/ccio-dma.c:1562:(.init.text+0x55c): undefined reference to `proc_runway_root'
   hppa-linux-ld: drivers/parisc/ccio-dma.c:1564:(.init.text+0x580): undefined reference to `proc_runway_root'
   hppa-linux-ld: drivers/parisc/led.o: in function `platform_led_remove':
>> drivers/parisc/led.c:317:(.text+0x1a4): undefined reference to `led_classdev_unregister'
   hppa-linux-ld: drivers/parisc/led.o: in function `platform_led_probe':
>> include/linux/leds.h:278:(.text+0x4b4): undefined reference to `led_classdev_register_ext'
   hppa-linux-ld: drivers/parisc/led.o: in function `platform_led_probe':
   drivers/parisc/led.c:301:(.text+0x520): undefined reference to `led_classdev_unregister'


vim +317 drivers/parisc/led.c

   310	
   311	static int platform_led_remove(struct platform_device *pdev)
   312	{
   313		struct hppa_drvdata *p = platform_get_drvdata(pdev);
   314		int i;
   315	
   316		for (i = 0; i < NUM_LEDS_PER_BOARD; i++)
 > 317			led_classdev_unregister(&p->leds[i].led_cdev);
   318	
   319		return 0;
   320	}
   321	
   322	static struct led_type mainboard_led_types[NUM_LEDS_PER_BOARD] = {
   323		{
   324			.name		= "platform-lan-tx",
   325			.handler	= set_led,
   326			.default_trigger = "tx",
   327		},
   328		{
   329			.name		= "platform-lan-rx",
   330			.handler	= set_led,
   331			.default_trigger = "rx",
   332		},
   333		{
   334			.name		= "platform-disk",
   335			.handler	= set_led,
   336			.default_trigger = "disk-activity",
   337		},
   338		{
   339			.name		= "platform-heartbeat",
   340			.handler	= set_led,
   341			.default_trigger = "heartbeat",
   342		},
   343		{
   344			.name		= "platform-LED4",
   345			.handler	= set_led,
   346			.default_trigger = "panic",
   347		},
   348		{
   349			.name		= "platform-LED5",
   350			.handler	= set_led,
   351			.default_trigger = "panic",
   352		},
   353		{
   354			.name		= "platform-LED6",
   355			.handler	= set_led,
   356			.default_trigger = "panic",
   357		},
   358		{
   359			.name		= "platform-LED7",
   360			.handler	= set_led,
   361			.default_trigger = "panic",
   362		},
   363	};
   364	
   365	static int platform_led_probe(struct platform_device *pdev)
   366	{
   367		return hppa_led_generic_probe(pdev, mainboard_led_types);
   368	}
   369	
   370	MODULE_ALIAS("platform:platform-leds");
   371	
   372	static struct platform_driver hppa_mainboard_led_driver = {
   373		.probe		= platform_led_probe,
   374		.remove		= platform_led_remove,
   375		.driver		= {
   376			.name	= "platform-leds",
   377		},
   378	};
   379	
   380	static struct platform_driver * const drivers[] = {
   381		&hppa_mainboard_led_driver,
   382	};
   383	
   384	static struct platform_device platform_leds = {
   385		.name = "platform-leds",
   386	};
   387	
   388	/**
   389	 *	register_led_driver()
   390	 *
   391	 *	Registers a chassis LED or LCD for usage by this driver.
   392	 *	Only PDC-based, LASI- or ASP-style LCD/LED's are supported.
   393	 */
   394	int __init register_led_driver(int model, unsigned long cmd_reg, unsigned long data_reg)
 > 395	{
   396		if (led_func_ptr || !data_reg)
   397			return 1;
   398	
   399		/* No LEDs when running in QEMU */
   400		if (running_on_qemu)
   401			return 1;
   402	
   403		lcd_info.model = model;		/* store the values */
   404		LCD_CMD_REG = (cmd_reg == LED_CMD_REG_NONE) ? 0 : cmd_reg;
   405	
   406		switch (lcd_info.model) {
   407		case DISPLAY_MODEL_LCD:
   408			LCD_DATA_REG = data_reg;
   409			pr_info("led: LCD display at %#lx and %#lx\n",
   410				LCD_CMD_REG , LCD_DATA_REG);
   411			led_func_ptr = led_LCD_driver;
   412			if (lcd_no_led_support)
   413				led_type = LED_HAS_LCD;
   414			else
   415				led_type = LED_HAS_LCD | LED_HAS_LED;
   416			break;
   417	
   418		case DISPLAY_MODEL_LASI:
   419			LED_DATA_REG = data_reg;
   420			led_func_ptr = led_LASI_driver;
   421			pr_info("led: LED display at %#lx\n", LED_DATA_REG);
   422			led_type = LED_HAS_LED;
   423			break;
   424	
   425		case DISPLAY_MODEL_OLD_ASP:
   426			LED_DATA_REG = data_reg;
   427			led_func_ptr = led_ASP_driver;
   428			pr_info("led: LED (ASP-style) display at %#lx\n",
   429			    LED_DATA_REG);
   430			led_type = LED_HAS_LED;
   431			break;
   432	
   433		default:
   434			pr_err("led: Unknown LCD/LED model type %d\n", lcd_info.model);
   435			return 1;
   436		}
   437	
   438		platform_register_drivers(drivers, ARRAY_SIZE(drivers));
   439	
   440		return register_reboot_notifier(&lcd_system_halt_notifier);
   441	}
   442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
