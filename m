Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095DC260565
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 17:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357515; cv=none; b=r0nZBEOKiIZSBTJBfcBjBoSUMNIJzOhgGDXHltUAHCP/pfF7qIruPFCPT+dwUi/Gs0V9PrIeHrYcs7zVzJrIUy+rlqkfX00HPJW4Xa8PzBDQeGb9UV0zpG40LOuijJEg6mxRikMlA3lxH5NKP/r0rxcILQu8+b1o0KW7SxvYSpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357515; c=relaxed/simple;
	bh=bc/Y8AYOBCduvHYYx0l5bMZFFc03aWLqdNDG8RjQeQk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RPtHXqwdO0xm8mkp2kvLqiGj8AdVY021+ubqVYLwTJJCG2J6mFO6pcrD70HUfAF7pgXOf7DL5Swr+CVbb9vYgEce54LPtcg+8UlP/FmdfEsbbwQc0BAEbz/w3JxR9iuXy6dvXFVTAtt7PYI/RL2jIErYw+nv75RlXImPigccKzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOin8yxw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOin8yxw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790357513; x=1821893513;
  h=date:from:to:cc:subject:message-id;
  bh=bc/Y8AYOBCduvHYYx0l5bMZFFc03aWLqdNDG8RjQeQk=;
  b=SOin8yxw7QHl7DMVz+gRwEODQQBLjortAWMCTZrsAVD1FltyRm08Stsc
   CxMsCGAFkmShwPbQolr9g8pky1SZast55lkk5sI1hWzD6cmK7/itEg4iz
   gtSZIXH+wLI3BTOSHAPOq0c2jS5ZAUGFksmIo5pyTdkP3xZhfCySKG6KV
   NXxp5Zd89nMGSe+7iC8MXHbpXI1z8wyxW7WAVcLnB+/C6qsBUAENu3u8K
   4RnKSTFq/NUL5l+maVHV35tE0/wUxTNcTC4+U7YpmRz4WmUoA76VSfMBe
   Ni/rhhfubuGEBkWr77AYMZ0fsj7QqYh5c9FCV0IzaWSDVhOqUFJOf/VQn
   w==;
X-CSE-ConnectionGUID: XkwD3oJTTTSd39G6ezd2aQ==
X-CSE-MsgGUID: 57vFvmW/TsqrGWbwzBdfzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="108640156"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="108640156"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 10:31:52 -0700
X-CSE-ConnectionGUID: /rZpXHVbRK6R78PV7hNDrQ==
X-CSE-MsgGUID: ORjPvnMpREumXloCOqxh7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273899664"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 25 Sep 2026 10:31:51 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA9m0-000000000qI-3oX6;
	Fri, 25 Sep 2026 17:31:48 +0000
Date: Fri, 25 Sep 2026 19:31:45 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 562/673]
 drivers/tty/serial/8250/8250_aspeed_vuart.c:526:1: warning: the frame size of
 772 bytes is larger than 768 bytes
Message-ID: <202609251907.H5M2EUs4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 065c245ab6ac3537488e5c410d38d4768824dd07 [562/673] random hacks
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260925/202609251907.H5M2EUs4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251907.H5M2EUs4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251907.H5M2EUs4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_aspeed_vuart.c: In function 'aspeed_vuart_probe':
>> drivers/tty/serial/8250/8250_aspeed_vuart.c:526:1: warning: the frame size of 772 bytes is larger than 768 bytes [-Wframe-larger-than=]
     526 | }
         | ^


vim +526 drivers/tty/serial/8250/8250_aspeed_vuart.c

ca03042f0f1221 Zev Weiss          2021-04-11  414  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  415  static int aspeed_vuart_probe(struct platform_device *pdev)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  416  {
8d310c9107a2a3 Oskar Senft        2019-09-05  417  	struct of_phandle_args sirq_polarity_sense_args;
e8bbaeac25503a Andy Shevchenko    2023-09-12  418  	struct device *dev = &pdev->dev;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  419  	struct uart_8250_port port;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  420  	struct aspeed_vuart *vuart;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  421  	struct device_node *np;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  422  	struct resource *res;
ca03042f0f1221 Zev Weiss          2021-04-11  423  	int rc, sirq_polarity;
dcdc7e09cfe31a Andy Shevchenko    2024-03-04  424  	u32 prop, sirq[2];
182fb83d596b69 Andy Shevchenko    2023-09-19  425  	struct clk *vclk;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  426  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  427  	np = pdev->dev.of_node;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  428  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  429  	vuart = devm_kzalloc(&pdev->dev, sizeof(*vuart), GFP_KERNEL);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  430  	if (!vuart)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  431  		return -ENOMEM;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  432  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  433  	vuart->dev = &pdev->dev;
5909c0bf9c7a17 Jeremy Kerr        2018-03-27  434  	timer_setup(&vuart->unthrottle_timer, aspeed_vuart_unthrottle_exp, 0);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  435  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  436  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
0e0fd55719fa08 Miaoqian Lin       2022-04-04  437  	if (!res)
0e0fd55719fa08 Miaoqian Lin       2022-04-04  438  		return -EINVAL;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  439  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  440  	memset(&port, 0, sizeof(port));
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  441  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  442  	rc = sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  443  	if (rc < 0)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  444  		return rc;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  445  
dcdc7e09cfe31a Andy Shevchenko    2024-03-04  446  	if (rc)
dcdc7e09cfe31a Andy Shevchenko    2024-03-04  447  		goto err_sysfs_remove;
dcdc7e09cfe31a Andy Shevchenko    2024-03-04  448  
dcdc7e09cfe31a Andy Shevchenko    2024-03-04  449  	/* Get clk rate through clk driver if present */
dcdc7e09cfe31a Andy Shevchenko    2024-03-04  450  	if (!port.port.uartclk) {
182fb83d596b69 Andy Shevchenko    2023-09-19  451  		vclk = devm_clk_get_enabled(dev, NULL);
182fb83d596b69 Andy Shevchenko    2023-09-19  452  		if (IS_ERR(vclk)) {
182fb83d596b69 Andy Shevchenko    2023-09-19  453  			rc = dev_err_probe(dev, PTR_ERR(vclk), "clk or clock-frequency not defined\n");
cbafe9d5c34673 Alexey Khoroshilov 2017-07-28  454  			goto err_sysfs_remove;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  455  		}
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  456  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  457  	}
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  458  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  459  	/* If current-speed was set, then try not to change it. */
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  460  	if (of_property_read_u32(np, "current-speed", &prop) == 0)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  461  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  462  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  463  	if (of_property_read_bool(np, "auto-flow-control"))
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  464  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  465  	rc = serial8250_register_8250_port(&port);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  466  	if (rc < 0)
dcdc7e09cfe31a Andy Shevchenko    2024-03-04  467  		goto err_sysfs_remove;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  468  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  469  	vuart->line = rc;
c9805fbf9d89c3 Zev Weiss          2021-05-09  470  	vuart->port = serial8250_get_port(vuart->line);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  471  
8d310c9107a2a3 Oskar Senft        2019-09-05  472  	rc = of_parse_phandle_with_fixed_args(
8d310c9107a2a3 Oskar Senft        2019-09-05  473  		np, "aspeed,sirq-polarity-sense", 2, 0,
8d310c9107a2a3 Oskar Senft        2019-09-05  474  		&sirq_polarity_sense_args);
8d310c9107a2a3 Oskar Senft        2019-09-05  475  	if (rc < 0) {
8d310c9107a2a3 Oskar Senft        2019-09-05  476  		dev_dbg(&pdev->dev,
8d310c9107a2a3 Oskar Senft        2019-09-05  477  			"aspeed,sirq-polarity-sense property not found\n");
8d310c9107a2a3 Oskar Senft        2019-09-05  478  	} else {
8d310c9107a2a3 Oskar Senft        2019-09-05  479  		aspeed_vuart_auto_configure_sirq_polarity(
8d310c9107a2a3 Oskar Senft        2019-09-05  480  			vuart, sirq_polarity_sense_args.np,
8d310c9107a2a3 Oskar Senft        2019-09-05  481  			sirq_polarity_sense_args.args[0],
8d310c9107a2a3 Oskar Senft        2019-09-05  482  			BIT(sirq_polarity_sense_args.args[1]));
8d310c9107a2a3 Oskar Senft        2019-09-05  483  		of_node_put(sirq_polarity_sense_args.np);
8d310c9107a2a3 Oskar Senft        2019-09-05  484  	}
8d310c9107a2a3 Oskar Senft        2019-09-05  485  
ca03042f0f1221 Zev Weiss          2021-04-11  486  	rc = of_property_read_u32(np, "aspeed,lpc-io-reg", &prop);
ca03042f0f1221 Zev Weiss          2021-04-11  487  	if (rc < 0)
ca03042f0f1221 Zev Weiss          2021-04-11  488  		prop = ASPEED_VUART_DEFAULT_LPC_ADDR;
ca03042f0f1221 Zev Weiss          2021-04-11  489  
ca03042f0f1221 Zev Weiss          2021-04-11  490  	rc = aspeed_vuart_set_lpc_address(vuart, prop);
ca03042f0f1221 Zev Weiss          2021-04-11  491  	if (rc < 0) {
e8bbaeac25503a Andy Shevchenko    2023-09-12  492  		dev_err_probe(dev, rc, "invalid value in aspeed,lpc-io-reg property\n");
dcdc7e09cfe31a Andy Shevchenko    2024-03-04  493  		goto err_sysfs_remove;
ca03042f0f1221 Zev Weiss          2021-04-11  494  	}
ca03042f0f1221 Zev Weiss          2021-04-11  495  
ca03042f0f1221 Zev Weiss          2021-04-11  496  	rc = of_property_read_u32_array(np, "aspeed,lpc-interrupts", sirq, 2);
ca03042f0f1221 Zev Weiss          2021-04-11  497  	if (rc < 0) {
ca03042f0f1221 Zev Weiss          2021-04-11  498  		sirq[0] = ASPEED_VUART_DEFAULT_SIRQ;
ca03042f0f1221 Zev Weiss          2021-04-11  499  		sirq[1] = ASPEED_VUART_DEFAULT_SIRQ_POLARITY;
ca03042f0f1221 Zev Weiss          2021-04-11  500  	}
ca03042f0f1221 Zev Weiss          2021-04-11  501  
ca03042f0f1221 Zev Weiss          2021-04-11  502  	rc = aspeed_vuart_set_sirq(vuart, sirq[0]);
ca03042f0f1221 Zev Weiss          2021-04-11  503  	if (rc < 0) {
e8bbaeac25503a Andy Shevchenko    2023-09-12  504  		dev_err_probe(dev, rc, "invalid sirq number in aspeed,lpc-interrupts property\n");
dcdc7e09cfe31a Andy Shevchenko    2024-03-04  505  		goto err_sysfs_remove;
ca03042f0f1221 Zev Weiss          2021-04-11  506  	}
ca03042f0f1221 Zev Weiss          2021-04-11  507  
ca03042f0f1221 Zev Weiss          2021-04-11  508  	sirq_polarity = aspeed_vuart_map_irq_polarity(sirq[1]);
ca03042f0f1221 Zev Weiss          2021-04-11  509  	if (sirq_polarity < 0) {
e8bbaeac25503a Andy Shevchenko    2023-09-12  510  		rc = dev_err_probe(dev, sirq_polarity,
e8bbaeac25503a Andy Shevchenko    2023-09-12  511  				   "invalid sirq polarity in aspeed,lpc-interrupts property\n");
dcdc7e09cfe31a Andy Shevchenko    2024-03-04  512  		goto err_sysfs_remove;
ca03042f0f1221 Zev Weiss          2021-04-11  513  	}
ca03042f0f1221 Zev Weiss          2021-04-11  514  
ca03042f0f1221 Zev Weiss          2021-04-11  515  	aspeed_vuart_set_sirq_polarity(vuart, sirq_polarity);
ca03042f0f1221 Zev Weiss          2021-04-11  516  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  517  	aspeed_vuart_set_enabled(vuart, true);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  518  	aspeed_vuart_set_host_tx_discard(vuart, true);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  519  	platform_set_drvdata(pdev, vuart);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  520  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  521  	return 0;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  522  
cbafe9d5c34673 Alexey Khoroshilov 2017-07-28  523  err_sysfs_remove:
cbafe9d5c34673 Alexey Khoroshilov 2017-07-28  524  	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  525  	return rc;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02 @526  }
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  527  

:::::: The code at line 526 was first introduced by commit
:::::: 7fbcf3afe6e8e180bfc39fb3f41657fa6e4af55c drivers/serial: Add driver for Aspeed virtual UART

:::::: TO: Jeremy Kerr <jk@ozlabs.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
