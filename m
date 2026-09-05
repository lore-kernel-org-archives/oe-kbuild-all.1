Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52063355F5C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 05:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788584945; cv=none; b=kvmD9q/V4QoXsFlG9BNvCKP3pCLx2/crYuyvbvBHjpHG7/eE/vQHpS295oOQAApRtWDQpXVmR0EdZwu54Sltzx+xibZ4b1IoXQYn7AvkllhN903G08AxFGTn1BV/ycEvDG2vKgD0NlknnRw86XK30aHzjwla51raV+ulqGf7ulU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788584945; c=relaxed/simple;
	bh=MsxzGwKWv+DAt8uME/sQSYDxHh4g3r8P7FWErMx63FA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dHCNEsAgh81d1X8TiU0StgHfaEangNtY4+zwHfTHQoNHHGK7nO35WpG4vWv1OTtg8kF1PH6ivLoYdtot9hqykyt1STWp869NOCivu/VLv3/QmMfb9bL8t13tanc2oytkEiErUcrIHxdMF+PvZjCICsyhcD2q2IIH+5c/kLqNMxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UN721ygQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UN721ygQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788584944; x=1820120944;
  h=date:from:to:cc:subject:message-id;
  bh=MsxzGwKWv+DAt8uME/sQSYDxHh4g3r8P7FWErMx63FA=;
  b=UN721ygQ5k7qscIHKHxB4o5803hqFS58tXr1eBYXa9JdrkvVjMp29pBH
   oEHGWyBa27c+JrPuWzd2Mz/9lSooXC+QEUYHhvIKJ+UnfVJZSo8ShUkBF
   Nx1QnewaGXPgh6fwPP8kU1vHpZH9kF9ga7ET5YSbah2pITylawU2moE44
   IAHbrlW75Uz2Tj13Tgns+3j8b/sQtSu1i9HX4oD+5caNeq6BgjVsE5Ims
   xYrjy6GqF5w7iZFdRATdKooMo9GuLg/IfoMGJNL2eZW9QXw2c1x1+j32s
   xsjQbbtywVAY1sRmWKkHXonm1/tmCWSn5phkpfBHrYrFlkRK4hBOfc7Xn
   g==;
X-CSE-ConnectionGUID: szYq/qXLRN284phlpbBJJQ==
X-CSE-MsgGUID: WFFy5AVYSkyxXtXmvhGIZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89008083"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="89008083"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 22:09:01 -0700
X-CSE-ConnectionGUID: 5P8z5kIXQv6u4IiGMKCqqg==
X-CSE-MsgGUID: VCOiTxSgSQqOWQdbVYs5hw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Sep 2026 22:08:59 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2ie8-0000000003Z-2uQO;
	Sat, 05 Sep 2026 05:08:56 +0000
Date: Sat, 05 Sep 2026 13:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:config-gpio-legacy-7.3 3/3]
 drivers/i2c/busses/i2c-gpio.c:630:56: error: 'struct i2c_gpio_private_data'
 has no member named 'gpio'
Message-ID: <202609051249.oPniymFd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git config-gpio-legacy-7.3
head:   c3f3b968d84f40449f767a592ae2363ceab597cb
commit: c3f3b968d84f40449f767a592ae2363ceab597cb [3/3] [RFC] gpiolib: introduce gpio_name() helper
config: i386-randconfig-061-20260905 (https://download.01.org/0day-ci/archive/20260905/202609051249.oPniymFd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051249.oPniymFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051249.oPniymFd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from include/linux/i2c-algo-bit.h:13,
                    from drivers/i2c/busses/i2c-gpio.c:11:
   drivers/i2c/busses/i2c-gpio.c: In function 'i2c_gpio_probe':
>> drivers/i2c/busses/i2c-gpio.c:630:56: error: 'struct i2c_gpio_private_data' has no member named 'gpio'
     630 |                  gpiod_name(priv->sda), gpiod_name(priv->gpio),
         |                                                        ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/i2c/busses/i2c-gpio.c:629:9: note: in expansion of macro 'dev_info'
     629 |         dev_info(dev, "using lines %s (SDA) and %s (SCL%s)\n",
         |         ^~~~~~~~


vim +630 drivers/i2c/busses/i2c-gpio.c

   519	
   520	static int i2c_gpio_probe(struct platform_device *pdev)
   521	{
   522		struct i2c_gpio_private_data *priv;
   523		struct i2c_gpio_platform_data *pdata;
   524		struct i2c_algo_bit_data *bit_data;
   525		struct i2c_adapter *adap;
   526		struct device *dev = &pdev->dev;
   527		struct fwnode_handle *fwnode = dev_fwnode(dev);
   528		enum gpiod_flags gflags;
   529		int ret;
   530	
   531		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   532		if (!priv)
   533			return -ENOMEM;
   534	
   535		adap = &priv->adap;
   536		bit_data = &priv->bit_data;
   537		pdata = &priv->pdata;
   538	
   539		if (fwnode) {
   540			i2c_gpio_get_properties(dev, pdata);
   541		} else {
   542			/*
   543			 * If all platform data settings are zero it is OK
   544			 * to not provide any platform data from the board.
   545			 */
   546			if (dev_get_platdata(dev))
   547				memcpy(pdata, dev_get_platdata(dev), sizeof(*pdata));
   548		}
   549	
   550		/*
   551		 * First get the GPIO pins; if it fails, we'll defer the probe.
   552		 * If the SCL/SDA lines are marked "open drain" by platform data or
   553		 * device tree then this means that something outside of our control is
   554		 * marking these lines to be handled as open drain, and we should just
   555		 * handle them as we handle any other output. Else we enforce open
   556		 * drain as this is required for an I2C bus.
   557		 */
   558		if (pdata->sda_is_open_drain || pdata->sda_has_no_pullup)
   559			gflags = GPIOD_OUT_HIGH;
   560		else
   561			gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
   562		priv->sda = i2c_gpio_get_desc(dev, "sda", 0, gflags);
   563		if (IS_ERR(priv->sda))
   564			return PTR_ERR(priv->sda);
   565	
   566		if (pdata->scl_is_open_drain || pdata->scl_has_no_pullup)
   567			gflags = GPIOD_OUT_HIGH;
   568		else
   569			gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
   570		priv->scl = i2c_gpio_lookup_scl(dev, gflags);
   571		if (IS_ERR(priv->scl)) {
   572			ret = PTR_ERR(priv->scl);
   573			goto err_cleanup_sda;
   574		}
   575	
   576		if (gpiod_cansleep(priv->sda) || gpiod_cansleep(priv->scl->gpio))
   577			dev_warn(dev, "Slow GPIO pins might wreak havoc into I2C/SMBus bus timing");
   578		else
   579			bit_data->can_do_atomic = true;
   580	
   581		bit_data->skip_bit_test = !!priv->scl->args.fwnode;
   582		bit_data->setsda = i2c_gpio_setsda_val;
   583		bit_data->setscl = i2c_gpio_setscl_val;
   584	
   585		if (!pdata->scl_is_output_only)
   586			bit_data->getscl = i2c_gpio_getscl;
   587		if (!pdata->sda_is_output_only)
   588			bit_data->getsda = i2c_gpio_getsda;
   589	
   590		if (pdata->udelay)
   591			bit_data->udelay = pdata->udelay;
   592		else if (pdata->scl_is_output_only)
   593			bit_data->udelay = 50;			/* 10 kHz */
   594		else
   595			bit_data->udelay = 5;			/* 100 kHz */
   596	
   597		if (pdata->timeout)
   598			bit_data->timeout = pdata->timeout;
   599		else
   600			bit_data->timeout = HZ / 10;		/* 100 ms */
   601	
   602		bit_data->data = priv;
   603	
   604		adap->owner = THIS_MODULE;
   605		if (fwnode)
   606			strscpy(adap->name, dev_name(dev), sizeof(adap->name));
   607		else
   608			snprintf(adap->name, sizeof(adap->name), "i2c-gpio%d", pdev->id);
   609	
   610		/* Always use shared SCL aware locking */
   611		adap->lock_ops = &i2c_gpio_lock_ops;
   612		adap->algo_data = bit_data;
   613		adap->class = I2C_CLASS_HWMON;
   614		adap->dev.parent = dev;
   615		device_set_node(&adap->dev, fwnode);
   616	
   617		adap->nr = pdev->id;
   618		ret = i2c_bit_add_numbered_bus(adap);
   619		if (ret)
   620			goto err_cleanup_scl;
   621	
   622		platform_set_drvdata(pdev, priv);
   623	
   624		/*
   625		 * FIXME: using global GPIO numbers is not helpful. If/when we
   626		 * get accessors to get the actual name of the GPIO line,
   627		 * from the descriptor, then provide that instead.
   628		 */
   629		dev_info(dev, "using lines %s (SDA) and %s (SCL%s)\n",
 > 630			 gpiod_name(priv->sda), gpiod_name(priv->gpio),
   631			 pdata->scl_is_output_only
   632			 ? ", no clock stretching" : "");
   633	
   634		i2c_gpio_fault_injector_init(pdev);
   635	
   636		return 0;
   637	
   638	err_cleanup_scl:
   639		i2c_gpio_cleanup_scl(priv->scl);
   640	err_cleanup_sda:
   641		gpiod_put(priv->sda);
   642	
   643		return ret;
   644	}
   645	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
