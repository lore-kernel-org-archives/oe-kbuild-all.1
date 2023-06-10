Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD6FC8E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686412670; x=1717948670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tVtylWyAUND+3I5nm5g+E9MmlofQwlm4TW7YE4u/Sjo=;
  b=ZsBO+OiFWpVEBv50kQ6drqQV5V21F+EE+H611XjX3fhVc0sASN3BZhSW
   90WI/PyAk1HSFOsGAbGoU55mL3HuM/ddGXQuwRLNVM43mh8sm3sHDU7fg
   HwaVXUG4hQPjEDTPs43IoKLoroplEKjzHjJWSJ942BcvcLLL58jbl4885
   dWfPWznKrQTbXcYhF3zMtW6w2B/oziYlE1hSBQfbhr6YJTXhxfJUh2ItR
   C0g9zAY0gsQqH97Xe7yEQE+knAkIxR3po+NtbYjLXfEFdW+1sZ+6myDlL
   qDvLvCQRyJ7OGbYNaNc8fGplzdeMnjbcY9KnR6GnjVJ2fkd3yyLQMY9EO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="338143861"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="338143861"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 08:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="688092489"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="688092489"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Jun 2023 08:57:46 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q80yH-000ABs-1B;
	Sat, 10 Jun 2023 15:57:45 +0000
Date: Sat, 10 Jun 2023 23:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 18/20] drivers/watchdog/orion_wdt.c:570:27:
 error: assignment to 'const struct orion_watchdog_data *' from incompatible
 pointer type 'const struct of_device_id *'
Message-ID: <202306102345.5Sq780G4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
commit: e5f3e4857d32954dded294a3536c0d97dd345921 [18/20] Use of_device_get_match_data
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230610/202306102345.5Sq780G4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=e5f3e4857d32954dded294a3536c0d97dd345921
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout e5f3e4857d32954dded294a3536c0d97dd345921
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/ata/ drivers/bus/ drivers/clk/qcom/ drivers/cpufreq/ drivers/crypto/hisilicon/trng/ drivers/crypto/stm32/ drivers/gpu/drm/armada/ drivers/gpu/drm/imx/lcdc/ drivers/gpu/drm/mediatek/ drivers/gpu/drm/sti/ drivers/hsi/controllers/ drivers/interconnect/qcom/ drivers/memory/tegra/ drivers/mtd/maps/ drivers/pinctrl/ drivers/power/reset/ drivers/remoteproc/ drivers/reset/sti/ drivers/soc/imx/ drivers/soc/tegra/fuse/ drivers/soc/ti/ drivers/spi/ drivers/watchdog/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306102345.5Sq780G4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/watchdog/orion_wdt.c: In function 'orion_wdt_probe':
>> drivers/watchdog/orion_wdt.c:570:27: error: assignment to 'const struct orion_watchdog_data *' from incompatible pointer type 'const struct of_device_id *' [-Werror=incompatible-pointer-types]
     570 |                 dev->data = &orion_wdt_of_match_table[0];
         |                           ^
   cc1: some warnings being treated as errors
--
   drivers/pinctrl/pinctrl-at91.c: In function 'at91_pinctrl_probe_dt':
>> drivers/pinctrl/pinctrl-at91.c:1305:17: error: implicit declaration of function 'of_match_device'; did you mean 'of_match_node'? [-Werror=implicit-function-declaration]
    1305 |                 of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
         |                 ^~~~~~~~~~~~~~~
         |                 of_match_node
>> drivers/pinctrl/pinctrl-at91.c:1305:67: error: invalid type argument of '->' (have 'int')
    1305 |                 of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
         |                                                                   ^~
   cc1: some warnings being treated as errors
--
   drivers/reset/sti/reset-syscfg.c: In function 'syscfg_reset_probe':
>> drivers/reset/sti/reset-syscfg.c:205:54: error: 'match' undeclared (first use in this function)
     205 |         return syscfg_reset_controller_register(dev, match->data);
         |                                                      ^~~~~
   drivers/reset/sti/reset-syscfg.c:205:54: note: each undeclared identifier is reported only once for each function it appears in
   drivers/reset/sti/reset-syscfg.c:206:1: error: control reaches end of non-void function [-Werror=return-type]
     206 | }
         | ^
   cc1: some warnings being treated as errors
--
   drivers/pinctrl/mvebu/pinctrl-armada-xp.c: In function 'armada_xp_pinctrl_probe':
>> drivers/pinctrl/mvebu/pinctrl-armada-xp.c:572:14: error: 'match' undeclared (first use in this function)
     572 |         if (!match)
         |              ^~~~~
   drivers/pinctrl/mvebu/pinctrl-armada-xp.c:572:14: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/pinctrl/nomadik/pinctrl-nomadik.c: In function 'nmk_gpio_populate_chip':
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1029:21: error: implicit declaration of function 'of_find_device_by_node'; did you mean 'bus_find_device_by_fwnode'? [-Werror=implicit-function-declaration]
    1029 |         gpio_pdev = of_find_device_by_node(np);
         |                     ^~~~~~~~~~~~~~~~~~~~~~
         |                     bus_find_device_by_fwnode
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1029:19: warning: assignment to 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1029 |         gpio_pdev = of_find_device_by_node(np);
         |                   ^
   cc1: some warnings being treated as errors


vim +570 drivers/watchdog/orion_wdt.c

   555	
   556	static int orion_wdt_probe(struct platform_device *pdev)
   557	{
   558		struct orion_watchdog *dev;
   559		unsigned int wdt_max_duration;	/* (seconds) */
   560		int ret, irq;
   561	
   562		dev = devm_kzalloc(&pdev->dev, sizeof(struct orion_watchdog),
   563				   GFP_KERNEL);
   564		if (!dev)
   565			return -ENOMEM;
   566	
   567		dev->data = of_device_get_match_data(&pdev->dev);
   568		if (!dev->data)
   569			/* Default legacy match */
 > 570			dev->data = &orion_wdt_of_match_table[0];
   571	
   572		dev->wdt.info = &orion_wdt_info;
   573		dev->wdt.ops = &orion_wdt_ops;
   574		dev->wdt.min_timeout = 1;
   575	
   576		ret = orion_wdt_get_regs(pdev, dev);
   577		if (ret)
   578			return ret;
   579	
   580		ret = dev->data->clock_init(pdev, dev);
   581		if (ret) {
   582			dev_err(&pdev->dev, "cannot initialize clock\n");
   583			return ret;
   584		}
   585	
   586		wdt_max_duration = WDT_MAX_CYCLE_COUNT / dev->clk_rate;
   587	
   588		dev->wdt.timeout = wdt_max_duration;
   589		dev->wdt.max_timeout = wdt_max_duration;
   590		dev->wdt.parent = &pdev->dev;
   591		watchdog_init_timeout(&dev->wdt, heartbeat, &pdev->dev);
   592	
   593		platform_set_drvdata(pdev, &dev->wdt);
   594		watchdog_set_drvdata(&dev->wdt, dev);
   595	
   596		/*
   597		 * Let's make sure the watchdog is fully stopped, unless it's
   598		 * explicitly enabled. This may be the case if the module was
   599		 * removed and re-inserted, or if the bootloader explicitly
   600		 * set a running watchdog before booting the kernel.
   601		 */
   602		if (!orion_wdt_enabled(&dev->wdt))
   603			orion_wdt_stop(&dev->wdt);
   604		else
   605			set_bit(WDOG_HW_RUNNING, &dev->wdt.status);
   606	
   607		/* Request the IRQ only after the watchdog is disabled */
   608		irq = platform_get_irq_optional(pdev, 0);
   609		if (irq > 0) {
   610			/*
   611			 * Not all supported platforms specify an interrupt for the
   612			 * watchdog, so let's make it optional.
   613			 */
   614			ret = devm_request_irq(&pdev->dev, irq, orion_wdt_irq, 0,
   615					       pdev->name, dev);
   616			if (ret < 0) {
   617				dev_err(&pdev->dev, "failed to request IRQ\n");
   618				goto disable_clk;
   619			}
   620		}
   621	
   622		/* Optional 2nd interrupt for pretimeout */
   623		irq = platform_get_irq_optional(pdev, 1);
   624		if (irq > 0) {
   625			orion_wdt_info.options |= WDIOF_PRETIMEOUT;
   626			ret = devm_request_irq(&pdev->dev, irq, orion_wdt_pre_irq,
   627					       0, pdev->name, dev);
   628			if (ret < 0) {
   629				dev_err(&pdev->dev, "failed to request IRQ\n");
   630				goto disable_clk;
   631			}
   632		}
   633	
   634	
   635		watchdog_set_nowayout(&dev->wdt, nowayout);
   636		ret = watchdog_register_device(&dev->wdt);
   637		if (ret)
   638			goto disable_clk;
   639	
   640		pr_info("Initial timeout %d sec%s\n",
   641			dev->wdt.timeout, nowayout ? ", nowayout" : "");
   642		return 0;
   643	
   644	disable_clk:
   645		clk_disable_unprepare(dev->clk);
   646		clk_put(dev->clk);
   647		return ret;
   648	}
   649	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
