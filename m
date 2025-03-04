Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A0DEC4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 00:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741046603; cv=none; b=cXM0OaJBf/jnvwdEhsL+/R+3lz0Ie3q8nv/irO8DOAJiQp4fVCtg4z/N7COZnD9RDUckv9JNM3KTtS7XZ5pEsII/XNyt2C6FxjDKp6w0PpHeXU49hX6nQBO9r0H9ArGmBV9noA6+5zoB4KKAM22UzGlYD9iMEdoPwXnBWqvtZaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741046603; c=relaxed/simple;
	bh=1/2cqto6Fn5cgWVPtuB7j2AvjQQYYGr9V9ECKwwW7Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O52/FT6dUh00Yvdzhz2VFVBStC7LDdHdUCVKmIH7ML21AeDBSEhVgTaViyDJ1tBt6O5/OBUFgy4f5Wah+AQ3WmR6x+bzZPVEOCJAFA/JPU5CjpdLbpHfsQiUP83++9hLwEmKGdLpNL2rV90RGTeGau2y9oAsoKkxA0nWGdY9PwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEzwH1q5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEzwH1q5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741046601; x=1772582601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1/2cqto6Fn5cgWVPtuB7j2AvjQQYYGr9V9ECKwwW7Ks=;
  b=fEzwH1q5M85mguFeSm7VLL2XwGYlOBczR3Cc/7SweDQO7A+Cu7hOFXRm
   RcoXaksb9hq84gmnzENhhJU/PyzTY8RU2PB7iqJR8llHtE9AtUkIp4OSs
   4mJEcSrN2czOHzKTOAegFCmeYGZey4QrT0CnZh+jiQ1Zu2tnNsapOu/2x
   utzzE/JpbhjXcrecgP4EUqWSLk+ElV2OiaY6NSdpgJ7VMtM+dcMV9EvPP
   UPmSVRnc/u15IkBSNreRDCdw+/7YWpZIO0UJFcyn6qu/bqfCGRkc2nnHo
   qTk+Bw9Fypq4cm0OTPx5cBeBSu0P61o2XisbUIXHnfKO6nYCAVTNLv1HW
   w==;
X-CSE-ConnectionGUID: SpYhvGG8RcOxA0oy/7AXfw==
X-CSE-MsgGUID: yK3wThpQRi2UwAh5uPkhhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41973161"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="41973161"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 16:03:19 -0800
X-CSE-ConnectionGUID: MwZa9h8dSQOP40kcsnRmXg==
X-CSE-MsgGUID: j1XASVrdRsWf3VqSMNfOCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118357702"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Mar 2025 16:03:18 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpFkd-000J3m-1z;
	Tue, 04 Mar 2025 00:03:12 +0000
Date: Tue, 4 Mar 2025 08:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 60/89] drivers/gpio/gpio-twl4030.c:505:29: warning:
 unused variable 'node'
Message-ID: <202503040715.6kPa2v7D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   2e34f839068291b65952cdcabb82b977d40d165c
commit: dcb546c8662c6333a1464bf13f440aa1f074bc09 [60/89] drop irq_domain_add_legacy()
config: x86_64-buildonly-randconfig-004-20250304 (https://download.01.org/0day-ci/archive/20250304/202503040715.6kPa2v7D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040715.6kPa2v7D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040715.6kPa2v7D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-twl4030.c: In function 'gpio_twl4030_probe':
>> drivers/gpio/gpio-twl4030.c:505:29: warning: unused variable 'node' [-Wunused-variable]
     505 |         struct device_node *node = pdev->dev.of_node;
         |                             ^~~~
--
   drivers/mfd/twl4030-irq.c: In function 'twl4030_init_irq':
>> drivers/mfd/twl4030-irq.c:679:46: warning: unused variable 'node' [-Wunused-variable]
     679 |         struct                  device_node *node = dev->of_node;
         |                                              ^~~~


vim +/node +505 drivers/gpio/gpio-twl4030.c

d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  501  
3836309d93462b drivers/gpio/gpio-twl4030.c Bill Pemberton      2012-11-19  502  static int gpio_twl4030_probe(struct platform_device *pdev)
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  503  {
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  504  	struct twl4030_gpio_platform_data *pdata;
b8589e2a8065b8 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29 @505  	struct device_node *node = pdev->dev.of_node;
72c7901ef00925 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-06  506  	struct gpio_twl4030_priv *priv;
2d9dd99b4470a2 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  507  	int ret, irq_base;
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  508  
72c7901ef00925 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-06  509  	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_twl4030_priv),
72c7901ef00925 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-06  510  			    GFP_KERNEL);
72c7901ef00925 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-06  511  	if (!priv)
72c7901ef00925 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-06  512  		return -ENOMEM;
72c7901ef00925 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-06  513  
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  514  	/* maybe setup IRQs */
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  515  	if (is_module()) {
2d9dd99b4470a2 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  516  		dev_err(&pdev->dev, "can't dispatch IRQs from modules\n");
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  517  		goto no_irqs;
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  518  	}
2d9dd99b4470a2 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  519  
9bc81137e8082e drivers/gpio/gpio-twl4030.c Bartosz Golaszewski 2017-03-04  520  	irq_base = devm_irq_alloc_descs(&pdev->dev, -1,
9bc81137e8082e drivers/gpio/gpio-twl4030.c Bartosz Golaszewski 2017-03-04  521  					0, TWL4030_GPIO_MAX, 0);
2d9dd99b4470a2 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  522  	if (irq_base < 0) {
2d9dd99b4470a2 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  523  		dev_err(&pdev->dev, "Failed to alloc irq_descs\n");
2d9dd99b4470a2 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  524  		return irq_base;
2d9dd99b4470a2 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  525  	}
2d9dd99b4470a2 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  526  
dcb546c8662c63 drivers/gpio/gpio-twl4030.c Jiri Slaby (SUSE    2025-03-03  527) 	irq_domain_create_legacy(of_fwnode_handle(node), TWL4030_GPIO_MAX, irq_base, 0,
b8589e2a8065b8 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  528  			      &irq_domain_simple_ops, NULL);
b8589e2a8065b8 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  529  
2d9dd99b4470a2 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  530  	ret = twl4030_sih_setup(&pdev->dev, TWL4030_MODULE_GPIO, irq_base);
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  531  	if (ret < 0)
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  532  		return ret;
2d9dd99b4470a2 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  533  
72c7901ef00925 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-06  534  	priv->irq_base = irq_base;
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  535  
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  536  no_irqs:
72c7901ef00925 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-06  537  	priv->gpio_chip = template_chip;
72c7901ef00925 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-06  538  	priv->gpio_chip.base = -1;
72c7901ef00925 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-06  539  	priv->gpio_chip.ngpio = TWL4030_GPIO_MAX;
58383c78425e4e drivers/gpio/gpio-twl4030.c Linus Walleij       2015-11-04  540  	priv->gpio_chip.parent = &pdev->dev;
b8589e2a8065b8 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  541  
c111feabe2e200 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-20  542  	mutex_init(&priv->mutex);
c111feabe2e200 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-20  543  
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  544  	pdata = of_gpio_twl4030(&pdev->dev);
f74ce8fb849e9f drivers/gpio/gpio-twl4030.c Florian Vaussard    2012-09-05  545  	if (pdata == NULL) {
f74ce8fb849e9f drivers/gpio/gpio-twl4030.c Florian Vaussard    2012-09-05  546  		dev_err(&pdev->dev, "Platform data is missing\n");
f74ce8fb849e9f drivers/gpio/gpio-twl4030.c Florian Vaussard    2012-09-05  547  		return -ENXIO;
f74ce8fb849e9f drivers/gpio/gpio-twl4030.c Florian Vaussard    2012-09-05  548  	}
f74ce8fb849e9f drivers/gpio/gpio-twl4030.c Florian Vaussard    2012-09-05  549  
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  550  	/*
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  551  	 * NOTE:  boards may waste power if they don't set pullups
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  552  	 * and pulldowns correctly ... default for non-ULPI pins is
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  553  	 * pulldown, and some other pins may have external pullups
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  554  	 * or pulldowns.  Careful!
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  555  	 */
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  556  	ret = gpio_twl4030_pulls(pdata->pullups, pdata->pulldowns);
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  557  	if (ret)
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  558  		dev_dbg(&pdev->dev, "pullups %.05x %.05x --> %d\n",
f74ce8fb849e9f drivers/gpio/gpio-twl4030.c Florian Vaussard    2012-09-05  559  			pdata->pullups, pdata->pulldowns, ret);
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  560  
cabb3fc4bd1628 drivers/gpio/twl4030-gpio.c David Brownell      2009-01-06  561  	ret = gpio_twl4030_debounce(pdata->debounce, pdata->mmc_cd);
cabb3fc4bd1628 drivers/gpio/twl4030-gpio.c David Brownell      2009-01-06  562  	if (ret)
cabb3fc4bd1628 drivers/gpio/twl4030-gpio.c David Brownell      2009-01-06  563  		dev_dbg(&pdev->dev, "debounce %.03x %.01x --> %d\n",
f74ce8fb849e9f drivers/gpio/gpio-twl4030.c Florian Vaussard    2012-09-05  564  			pdata->debounce, pdata->mmc_cd, ret);
cabb3fc4bd1628 drivers/gpio/twl4030-gpio.c David Brownell      2009-01-06  565  
b8589e2a8065b8 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  566  	/*
b8589e2a8065b8 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  567  	 * NOTE: we assume VIBRA_CTL.VIBRA_EN, in MODULE_AUDIO_VOICE,
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  568  	 * is (still) clear if use_leds is set.
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  569  	 */
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  570  	if (pdata->use_leds)
72c7901ef00925 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-06  571  		priv->gpio_chip.ngpio += 2;
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  572  
fbc8ab2ccd8547 drivers/gpio/gpio-twl4030.c Andrew Davis        2023-05-15  573  	ret = devm_gpiochip_add_data(&pdev->dev, &priv->gpio_chip, priv);
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  574  	if (ret < 0) {
2d9dd99b4470a2 drivers/gpio/gpio-twl4030.c Benoit Cousson      2012-02-29  575  		dev_err(&pdev->dev, "could not register gpiochip, %d\n", ret);
72c7901ef00925 drivers/gpio/gpio-twl4030.c Peter Ujfalusi      2012-12-06  576  		priv->gpio_chip.ngpio = 0;
fbc8ab2ccd8547 drivers/gpio/gpio-twl4030.c Andrew Davis        2023-05-15  577  		return ret;
a940d9a1cb2ea0 drivers/gpio/gpio-twl4030.c Tony Lindgren       2012-09-04  578  	}
a940d9a1cb2ea0 drivers/gpio/gpio-twl4030.c Tony Lindgren       2012-09-04  579  
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  580  	/*
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  581  	 * Special quirk for the OMAP3 to hog and export a WLAN power
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  582  	 * GPIO.
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  583  	 */
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  584  	if (IS_ENABLED(CONFIG_ARCH_OMAP3) &&
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  585  	    of_machine_is_compatible("compulab,omap3-sbc-t3730")) {
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  586  		struct gpio_desc *d;
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  587  
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  588  		d = gpiochip_request_own_desc(&priv->gpio_chip,
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  589  						 2, "wlan pwr",
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  590  						 GPIO_ACTIVE_HIGH,
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  591  						 GPIOD_OUT_HIGH);
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  592  		if (IS_ERR(d))
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  593  			return dev_err_probe(&pdev->dev, PTR_ERR(d),
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  594  					     "unable to hog wlan pwr GPIO\n");
a940d9a1cb2ea0 drivers/gpio/gpio-twl4030.c Tony Lindgren       2012-09-04  595  
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  596  		gpiod_export(d, 0);
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  597  
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  598  		ret = devm_add_action_or_reset(&pdev->dev, gpio_twl4030_power_off_action, d);
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  599  		if (ret)
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  600  			return dev_err_probe(&pdev->dev, ret,
d5f4fa60d63aa5 drivers/gpio/gpio-twl4030.c Linus Walleij       2023-05-01  601  					     "failed to install power off handler\n");
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  602  
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  603  	}
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  604  
fbc8ab2ccd8547 drivers/gpio/gpio-twl4030.c Andrew Davis        2023-05-15  605  	return 0;
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  606  }
e9d359471dfed5 drivers/gpio/twl4030-gpio.c David Brownell      2008-10-20  607  

:::::: The code at line 505 was first introduced by commit
:::::: b8589e2a8065b8e7773742b60ae96b63b757bb69 gpio/twl: Add DT support to gpio-twl4030 driver

:::::: TO: Benoit Cousson <b-cousson@ti.com>
:::::: CC: Samuel Ortiz <sameo@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
