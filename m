Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F41E7C02
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 04:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788582716; cv=none; b=dyCjzH/gEZ3Wvc5xYwvPW0zu9OzZ0GhCsXnDAwyws6YjD7rfdZLLtKF8bNki03JC2T2Fg8XBDDtVgIN4hmFFAhAh92ISPg2p1WqKbwENc157fpJl5XTSwUSBhCUJlhO4nOxwQJp+TA4V0gJdbS3zC2r1ezw9cMZt4m5VgBcQ3Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788582716; c=relaxed/simple;
	bh=9YQXSg7dde1tcHTt0XesIGc3jXI45pvK4tnwg2ShwwU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tDBSwNxIc8IgOEP4IQH8KQD1Tlyvvevw6BS+9O5yQXHXdkh1fsegUdJ1f32BnTVTAhWZFaKaSxn5flouwo2xSjC//vHbYjqG1sjtl67yb8MCBT3LEBXyLpE8YmWYQgP/SWHarl3wVxnFGEmH8bOI6M84xY8joEWsOvipR0NyOKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxD1W3Vv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxD1W3Vv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788582713; x=1820118713;
  h=date:from:to:cc:subject:message-id;
  bh=9YQXSg7dde1tcHTt0XesIGc3jXI45pvK4tnwg2ShwwU=;
  b=KxD1W3VvAKet+4RThVJBlSMwj6ihDnqs4aayVqCjycnkQVBzqZ1qPRBv
   BflMmFMHkse5+54FuVda1CI/57fngxSKEMiDv2sZCPL6zvWHMQ18PP4Ny
   Pd5UnF/3OZC1NjQk32voh9uDaErSdGV+7CpjJyIWm44e+gwrKFz2vHHXM
   CeWlpoRfCVojXISw9pXwH61u6u2r4y0drhXdx/jSzKELp9/s63/GVV3sa
   fCK7dZEjNv+EvB7in72jH/Q9YHWftM471jZalWWpMhJ9tgdbag0330Stk
   lbi+R494MFoZ3Io1A63Iuic6TnrKydgqS0VWomF5qM4A68XUsJScMzNuo
   w==;
X-CSE-ConnectionGUID: drvGUgcHRUyikrJN0YqDIQ==
X-CSE-MsgGUID: lgQkL+DIQoWo9hiMbOMn7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="100436288"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="100436288"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 21:31:52 -0700
X-CSE-ConnectionGUID: D/2sqTolQhOG1yeaLxv39A==
X-CSE-MsgGUID: PlIL3OgGRiKGjAeJEKVDXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="270180535"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Sep 2026 21:31:50 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2i4C-0000000001B-1cfQ;
	Sat, 05 Sep 2026 04:31:48 +0000
Date: Sat, 05 Sep 2026 12:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:config-gpio-legacy-7.3 3/3]
 drivers/i2c/busses/i2c-gpio.c:630:44: error: no member named 'gpio' in
 'struct i2c_gpio_private_data'
Message-ID: <202609051220.OevyEetw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git config-gpio-legacy-7.3
head:   c3f3b968d84f40449f767a592ae2363ceab597cb
commit: c3f3b968d84f40449f767a592ae2363ceab597cb [3/3] [RFC] gpiolib: introduce gpio_name() helper
config: x86_64-randconfig-122-20260905 (https://download.01.org/0day-ci/archive/20260905/202609051220.OevyEetw-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051220.OevyEetw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051220.OevyEetw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-gpio.c:630:44: error: no member named 'gpio' in 'struct i2c_gpio_private_data'
     630 |                  gpiod_name(priv->sda), gpiod_name(priv->gpio),
         |                                                    ~~~~  ^
   1 error generated.


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
