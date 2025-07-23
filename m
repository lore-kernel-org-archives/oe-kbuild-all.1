Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E435C279788
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 08:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753258084; cv=none; b=O8nd40KtVfcbB/AtV7ivl8kXt8YsBfLhxpliN5d1cI3Fn6ZOqoZ5YtcFr6leSz/N0cihoc3ZACdROp8hZuWCT5mg1/+oi8FDZ1h0P49sBdk/MGCFCFj9DW83rk0QjGd+BZ6HV7quob2t0O9gCbdJos69rK4KnCP/X7BW5J0yvm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753258084; c=relaxed/simple;
	bh=sbMO8C93rYkEIntQZh269V1mk7T3M83uPQJf7Ajwnho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCITygdd1sGWWR4z8L/Fhr9qb+HKnnYrlMmcg9jgONWOpgUVch5Czju7lNIQVGhbBFPFaSGzo/g3JG0higWlpfjauUetNGcmS5DCTAgOSCZQXlr6DZ0YO5x1L5+sYZIZD79YX7v9moK4KPIBeR2Rj9C45HptQjD4u2F/vu8nmGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rfn8W1Wk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rfn8W1Wk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753258082; x=1784794082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sbMO8C93rYkEIntQZh269V1mk7T3M83uPQJf7Ajwnho=;
  b=Rfn8W1WkhLmCsn9eefHe4+NOvNkfpKMEr02iqZdpzSToaeTxmGjPJvFs
   Ad41mKnP+csZgdVyd9D/xUPg5rla2VjKIlTbfieTVk/ECfcRCkG5XGzkT
   tzVu64H4oRlt0UTo0/s6XAX6/dlj7/kR+MJt1rG3KORXZwTVUnavDWizx
   yH9aGsIXCpPy6KDH15fjEbC0gOs16sBh+4t+/jqLZEXPGLDma+KMsOX+g
   0oHLps2XliYI0bHx+52sb9I7/UNoc9vwruy9lOnuwygOzPdxr15STstv6
   ACQMRiKQvrdO1nfk4LMZwaXB7VWAHFtki4ed4d+8qsZWm7kTt9VGgb7vr
   w==;
X-CSE-ConnectionGUID: FSUATJP0T+62PDM6nZmKgA==
X-CSE-MsgGUID: 1HMQmJznSL2YWEsDw2NkHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55485583"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55485583"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 01:08:00 -0700
X-CSE-ConnectionGUID: j5Y0R4JSR6Gbwr7haPO03Q==
X-CSE-MsgGUID: BeLDF2nsQpOSYl+pA7IUag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159675626"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jul 2025 01:07:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueUW4-000J6t-1q;
	Wed, 23 Jul 2025 08:07:56 +0000
Date: Wed, 23 Jul 2025 16:07:00 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to-build 14/14] drivers/mfd/si476x-i2c.c:133:21:
 error: implicit declaration of function 'gpio_is_valid'; did you mean
 'uuid_is_valid'?
Message-ID: <202507231653.UFlH2dMO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to-build
head:   ec6a6b690caeb0e6a10757890c166bc226b799f5
commit: ec6a6b690caeb0e6a10757890c166bc226b799f5 [14/14] gpiolib: turn off legacy interface by default
config: x86_64-buildonly-randconfig-003-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231653.UFlH2dMO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231653.UFlH2dMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231653.UFlH2dMO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/si476x-i2c.c: In function 'si476x_core_start':
>> drivers/mfd/si476x-i2c.c:133:21: error: implicit declaration of function 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=implicit-function-declaration]
     133 |                 if (gpio_is_valid(core->gpio_reset))
         |                     ^~~~~~~~~~~~~
         |                     uuid_is_valid
>> drivers/mfd/si476x-i2c.c:134:25: error: implicit declaration of function 'gpio_set_value_cansleep'; did you mean 'gpiod_set_value_cansleep'? [-Werror=implicit-function-declaration]
     134 |                         gpio_set_value_cansleep(core->gpio_reset, 1);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                         gpiod_set_value_cansleep
   drivers/mfd/si476x-i2c.c: In function 'si476x_core_probe':
>> drivers/mfd/si476x-i2c.c:723:32: error: implicit declaration of function 'gpio_request' [-Werror=implicit-function-declaration]
     723 |                         rval = gpio_request(pdata->gpio_reset, "si476x reset");
         |                                ^~~~~~~~~~~~
>> drivers/mfd/si476x-i2c.c:730:25: error: implicit declaration of function 'gpio_direction_output'; did you mean 'gpiod_direction_output'? [-Werror=implicit-function-declaration]
     730 |                         gpio_direction_output(core->gpio_reset, 0);
         |                         ^~~~~~~~~~~~~~~~~~~~~
         |                         gpiod_direction_output
>> drivers/mfd/si476x-i2c.c:833:17: error: implicit declaration of function 'gpio_free'; did you mean 'kfifo_free'? [-Werror=implicit-function-declaration]
     833 |                 gpio_free(core->gpio_reset);
         |                 ^~~~~~~~~
         |                 kfifo_free
   cc1: some warnings being treated as errors


vim +133 drivers/mfd/si476x-i2c.c

730a30ab7fba60 Andrey Smirnov 2013-04-18  103  
730a30ab7fba60 Andrey Smirnov 2013-04-18  104  /**
730a30ab7fba60 Andrey Smirnov 2013-04-18  105   * si476x_core_start() - early chip startup function
730a30ab7fba60 Andrey Smirnov 2013-04-18  106   * @core: Core device structure
730a30ab7fba60 Andrey Smirnov 2013-04-18  107   * @soft: When set, this flag forces "soft" startup, where "soft"
730a30ab7fba60 Andrey Smirnov 2013-04-18  108   * power down is the one done by sending appropriate command instead
730a30ab7fba60 Andrey Smirnov 2013-04-18  109   * of using reset pin of the tuner
730a30ab7fba60 Andrey Smirnov 2013-04-18  110   *
730a30ab7fba60 Andrey Smirnov 2013-04-18  111   * Perform required startup sequence to correctly power
730a30ab7fba60 Andrey Smirnov 2013-04-18  112   * up the chip and perform initial configuration. It does the
730a30ab7fba60 Andrey Smirnov 2013-04-18  113   * following sequence of actions:
730a30ab7fba60 Andrey Smirnov 2013-04-18  114   *       1. Claims and enables the power supplies VD and VIO1 required
730a30ab7fba60 Andrey Smirnov 2013-04-18  115   *          for I2C interface of the chip operation.
730a30ab7fba60 Andrey Smirnov 2013-04-18  116   *       2. Waits for 100us, pulls the reset line up, enables irq,
730a30ab7fba60 Andrey Smirnov 2013-04-18  117   *          waits for another 100us as it is specified by the
730a30ab7fba60 Andrey Smirnov 2013-04-18  118   *          datasheet.
730a30ab7fba60 Andrey Smirnov 2013-04-18  119   *       3. Sends 'POWER_UP' command to the device with all provided
730a30ab7fba60 Andrey Smirnov 2013-04-18  120   *          information about power-up parameters.
730a30ab7fba60 Andrey Smirnov 2013-04-18  121   *       4. Configures, pin multiplexor, disables digital audio and
730a30ab7fba60 Andrey Smirnov 2013-04-18  122   *          configures interrupt sources.
730a30ab7fba60 Andrey Smirnov 2013-04-18  123   *
730a30ab7fba60 Andrey Smirnov 2013-04-18  124   * The function returns zero in case of succes or negative error code
730a30ab7fba60 Andrey Smirnov 2013-04-18  125   * otherwise.
730a30ab7fba60 Andrey Smirnov 2013-04-18  126   */
730a30ab7fba60 Andrey Smirnov 2013-04-18  127  int si476x_core_start(struct si476x_core *core, bool soft)
730a30ab7fba60 Andrey Smirnov 2013-04-18  128  {
730a30ab7fba60 Andrey Smirnov 2013-04-18  129  	struct i2c_client *client = core->client;
730a30ab7fba60 Andrey Smirnov 2013-04-18  130  	int err;
730a30ab7fba60 Andrey Smirnov 2013-04-18  131  
730a30ab7fba60 Andrey Smirnov 2013-04-18  132  	if (!soft) {
730a30ab7fba60 Andrey Smirnov 2013-04-18 @133  		if (gpio_is_valid(core->gpio_reset))
730a30ab7fba60 Andrey Smirnov 2013-04-18 @134  			gpio_set_value_cansleep(core->gpio_reset, 1);
730a30ab7fba60 Andrey Smirnov 2013-04-18  135  
730a30ab7fba60 Andrey Smirnov 2013-04-18  136  		if (client->irq)
730a30ab7fba60 Andrey Smirnov 2013-04-18  137  			enable_irq(client->irq);
730a30ab7fba60 Andrey Smirnov 2013-04-18  138  
730a30ab7fba60 Andrey Smirnov 2013-04-18  139  		udelay(100);
730a30ab7fba60 Andrey Smirnov 2013-04-18  140  
730a30ab7fba60 Andrey Smirnov 2013-04-18  141  		if (!client->irq) {
730a30ab7fba60 Andrey Smirnov 2013-04-18  142  			atomic_set(&core->is_alive, 1);
730a30ab7fba60 Andrey Smirnov 2013-04-18  143  			si476x_core_schedule_polling_work(core);
730a30ab7fba60 Andrey Smirnov 2013-04-18  144  		}
730a30ab7fba60 Andrey Smirnov 2013-04-18  145  	} else {
730a30ab7fba60 Andrey Smirnov 2013-04-18  146  		if (client->irq)
730a30ab7fba60 Andrey Smirnov 2013-04-18  147  			enable_irq(client->irq);
730a30ab7fba60 Andrey Smirnov 2013-04-18  148  		else {
730a30ab7fba60 Andrey Smirnov 2013-04-18  149  			atomic_set(&core->is_alive, 1);
730a30ab7fba60 Andrey Smirnov 2013-04-18  150  			si476x_core_schedule_polling_work(core);
730a30ab7fba60 Andrey Smirnov 2013-04-18  151  		}
730a30ab7fba60 Andrey Smirnov 2013-04-18  152  	}
730a30ab7fba60 Andrey Smirnov 2013-04-18  153  
730a30ab7fba60 Andrey Smirnov 2013-04-18  154  	err = si476x_core_cmd_power_up(core,
730a30ab7fba60 Andrey Smirnov 2013-04-18  155  				       &core->power_up_parameters);
730a30ab7fba60 Andrey Smirnov 2013-04-18  156  
730a30ab7fba60 Andrey Smirnov 2013-04-18  157  	if (err < 0) {
730a30ab7fba60 Andrey Smirnov 2013-04-18  158  		dev_err(&core->client->dev,
730a30ab7fba60 Andrey Smirnov 2013-04-18  159  			"Power up failure(err = %d)\n",
730a30ab7fba60 Andrey Smirnov 2013-04-18  160  			err);
730a30ab7fba60 Andrey Smirnov 2013-04-18  161  		goto disable_irq;
730a30ab7fba60 Andrey Smirnov 2013-04-18  162  	}
730a30ab7fba60 Andrey Smirnov 2013-04-18  163  
730a30ab7fba60 Andrey Smirnov 2013-04-18  164  	if (client->irq)
730a30ab7fba60 Andrey Smirnov 2013-04-18  165  		atomic_set(&core->is_alive, 1);
730a30ab7fba60 Andrey Smirnov 2013-04-18  166  
730a30ab7fba60 Andrey Smirnov 2013-04-18  167  	err = si476x_core_config_pinmux(core);
730a30ab7fba60 Andrey Smirnov 2013-04-18  168  	if (err < 0) {
730a30ab7fba60 Andrey Smirnov 2013-04-18  169  		dev_err(&core->client->dev,
730a30ab7fba60 Andrey Smirnov 2013-04-18  170  			"Failed to configure pinmux(err = %d)\n",
730a30ab7fba60 Andrey Smirnov 2013-04-18  171  			err);
730a30ab7fba60 Andrey Smirnov 2013-04-18  172  		goto disable_irq;
730a30ab7fba60 Andrey Smirnov 2013-04-18  173  	}
730a30ab7fba60 Andrey Smirnov 2013-04-18  174  
730a30ab7fba60 Andrey Smirnov 2013-04-18  175  	if (client->irq) {
730a30ab7fba60 Andrey Smirnov 2013-04-18  176  		err = regmap_write(core->regmap,
730a30ab7fba60 Andrey Smirnov 2013-04-18  177  				   SI476X_PROP_INT_CTL_ENABLE,
730a30ab7fba60 Andrey Smirnov 2013-04-18  178  				   SI476X_RDSIEN |
730a30ab7fba60 Andrey Smirnov 2013-04-18  179  				   SI476X_STCIEN |
730a30ab7fba60 Andrey Smirnov 2013-04-18  180  				   SI476X_CTSIEN);
730a30ab7fba60 Andrey Smirnov 2013-04-18  181  		if (err < 0) {
730a30ab7fba60 Andrey Smirnov 2013-04-18  182  			dev_err(&core->client->dev,
730a30ab7fba60 Andrey Smirnov 2013-04-18  183  				"Failed to configure interrupt sources"
730a30ab7fba60 Andrey Smirnov 2013-04-18  184  				"(err = %d)\n", err);
730a30ab7fba60 Andrey Smirnov 2013-04-18  185  			goto disable_irq;
730a30ab7fba60 Andrey Smirnov 2013-04-18  186  		}
730a30ab7fba60 Andrey Smirnov 2013-04-18  187  	}
730a30ab7fba60 Andrey Smirnov 2013-04-18  188  
730a30ab7fba60 Andrey Smirnov 2013-04-18  189  	return 0;
730a30ab7fba60 Andrey Smirnov 2013-04-18  190  
730a30ab7fba60 Andrey Smirnov 2013-04-18  191  disable_irq:
730a30ab7fba60 Andrey Smirnov 2013-04-18  192  	if (err == -ENODEV)
730a30ab7fba60 Andrey Smirnov 2013-04-18  193  		atomic_set(&core->is_alive, 0);
730a30ab7fba60 Andrey Smirnov 2013-04-18  194  
730a30ab7fba60 Andrey Smirnov 2013-04-18  195  	if (client->irq)
730a30ab7fba60 Andrey Smirnov 2013-04-18  196  		disable_irq(client->irq);
730a30ab7fba60 Andrey Smirnov 2013-04-18  197  	else
730a30ab7fba60 Andrey Smirnov 2013-04-18  198  		cancel_delayed_work_sync(&core->status_monitor);
730a30ab7fba60 Andrey Smirnov 2013-04-18  199  
730a30ab7fba60 Andrey Smirnov 2013-04-18  200  	if (gpio_is_valid(core->gpio_reset))
730a30ab7fba60 Andrey Smirnov 2013-04-18  201  		gpio_set_value_cansleep(core->gpio_reset, 0);
730a30ab7fba60 Andrey Smirnov 2013-04-18  202  
730a30ab7fba60 Andrey Smirnov 2013-04-18  203  	return err;
730a30ab7fba60 Andrey Smirnov 2013-04-18  204  }
730a30ab7fba60 Andrey Smirnov 2013-04-18  205  EXPORT_SYMBOL_GPL(si476x_core_start);
730a30ab7fba60 Andrey Smirnov 2013-04-18  206  

:::::: The code at line 133 was first introduced by commit
:::::: 730a30ab7fba60c986e0e4a362bb21d2ed196a29 mfd: si476x: Add the bulk of the core driver

:::::: TO: Andrey Smirnov <andreysm@charmander.(none)>
:::::: CC: Samuel Ortiz <sameo@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
