Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E9626AF4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 22:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773528695; cv=none; b=Q9wQGr8fPobJCDi6lP27ripCX4ByViwKQBJ+IVwv3nMKClNjqTvu2AFkdh4t3fBR6cUek6rIB+641N8jkfOjnsMQW9kY+Js7O4ocIGS1hxnXfrTu6SG1eX3MWt37DgTx7mmPg103d9PUTjaRtrfTP0afxzzDk9cYGVKQxlZmx0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773528695; c=relaxed/simple;
	bh=zxomXgLK3Ax1H/h7xF5Oar34ZqAVEeFcbpZakCu9LwQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A4kdz9mjsEzdtD2ySTlPKUMslYNB4gLZ85+KAMnXo8Wa93EpB9K2FZyuOgPgwnP8vbrHBU/RfWwNxoLO7y4Fc+HoYdTVsRaKCcbR291Rtg8671HwP8ivXSq1jX/6XfyAK+mGwRI66/GJ4YuFTd9YnocZtch+xISCsiiGdnpgDeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kw8of2tX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kw8of2tX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773528691; x=1805064691;
  h=date:from:to:cc:subject:message-id;
  bh=zxomXgLK3Ax1H/h7xF5Oar34ZqAVEeFcbpZakCu9LwQ=;
  b=kw8of2tXoxdr0cWwYK9BKy3Zj5vk8cG3lH/Ideg6+QTmJbJzUFsIUJV4
   FWpEUSCBXGlZ2O1fAIHdzXzow7Pa1lSRhN8d6TF3vHQnlPMXN5pahpAdD
   bqNeU1eF56A4nfq8wzLF8sN50kmBu23nFWzb9qlFJTo2Bhbi+VhLU0bVc
   3kTOacjj6jIpHnaS2GlzV2MgbssVRAA4OHa5uW5zVPjD85NcgXvR77k9Y
   6QaYnPVfxcwJ8iBTpVOGt2YXeNvCbcosPqaCWjMGacVLL7CR41JLSVbfq
   M1l91v0xZvFaDLMMB3EJ/Mn4M0/x0faiUo1/snBhGJZf8vlBcZ25tBsh1
   Q==;
X-CSE-ConnectionGUID: DGeEB852QNu9SBqdZtTmfA==
X-CSE-MsgGUID: qPGgDt9kSMy3UFAjNZUWcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="84910632"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="84910632"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 15:51:31 -0700
X-CSE-ConnectionGUID: QbsRTqxESqK90bdG2EAqXA==
X-CSE-MsgGUID: a/UU85aSTl2QKaM6nhLhLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="226508541"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Mar 2026 15:51:28 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1XpN-000000005qN-0fT1;
	Sat, 14 Mar 2026 22:51:25 +0000
Date: Sun, 15 Mar 2026 06:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: Zev Weiss <zev@bewilderbeest.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: drivers/tty/serial/8250/8250_aspeed_vuart.c:563:1: warning:
 the frame size of 1048 bytes is larger than 1024 bytes
Message-ID: <202603150627.XIbmGTjI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Zev,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   80234b5ab240f52fa45d201e899e207b9265ef91
commit: ca03042f0f1221c3173bbe81ebd974b91a4dbb15 serial: 8250_aspeed_vuart: add aspeed, lpc-io-reg and aspeed, lpc-interrupts DT properties
date:   4 years, 11 months ago
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260315/202603150627.XIbmGTjI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603150627.XIbmGTjI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603150627.XIbmGTjI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_aspeed_vuart.c: In function 'aspeed_vuart_probe':
>> drivers/tty/serial/8250/8250_aspeed_vuart.c:563:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     563 | }
         | ^


vim +563 drivers/tty/serial/8250/8250_aspeed_vuart.c

ca03042f0f1221 Zev Weiss          2021-04-11  404  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  405  static int aspeed_vuart_probe(struct platform_device *pdev)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  406  {
8d310c9107a2a3 Oskar Senft        2019-09-05  407  	struct of_phandle_args sirq_polarity_sense_args;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  408  	struct uart_8250_port port;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  409  	struct aspeed_vuart *vuart;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  410  	struct device_node *np;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  411  	struct resource *res;
ca03042f0f1221 Zev Weiss          2021-04-11  412  	u32 clk, prop, sirq[2];
ca03042f0f1221 Zev Weiss          2021-04-11  413  	int rc, sirq_polarity;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  414  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  415  	np = pdev->dev.of_node;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  416  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  417  	vuart = devm_kzalloc(&pdev->dev, sizeof(*vuart), GFP_KERNEL);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  418  	if (!vuart)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  419  		return -ENOMEM;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  420  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  421  	vuart->dev = &pdev->dev;
5909c0bf9c7a17 Jeremy Kerr        2018-03-27  422  	timer_setup(&vuart->unthrottle_timer, aspeed_vuart_unthrottle_exp, 0);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  423  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  424  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  425  	vuart->regs = devm_ioremap_resource(&pdev->dev, res);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  426  	if (IS_ERR(vuart->regs))
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  427  		return PTR_ERR(vuart->regs);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  428  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  429  	memset(&port, 0, sizeof(port));
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  430  	port.port.private_data = vuart;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  431  	port.port.membase = vuart->regs;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  432  	port.port.mapbase = res->start;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  433  	port.port.mapsize = resource_size(res);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  434  	port.port.startup = aspeed_vuart_startup;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  435  	port.port.shutdown = aspeed_vuart_shutdown;
989983ea849d94 Jeremy Kerr        2018-03-27  436  	port.port.throttle = aspeed_vuart_throttle;
989983ea849d94 Jeremy Kerr        2018-03-27  437  	port.port.unthrottle = aspeed_vuart_unthrottle;
989983ea849d94 Jeremy Kerr        2018-03-27  438  	port.port.status = UPSTAT_SYNC_FIFO;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  439  	port.port.dev = &pdev->dev;
9b614afe6c8048 Dmitry Safonov     2019-12-13  440  	port.port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  441  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  442  	rc = sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  443  	if (rc < 0)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  444  		return rc;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  445  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  446  	if (of_property_read_u32(np, "clock-frequency", &clk)) {
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  447  		vuart->clk = devm_clk_get(&pdev->dev, NULL);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  448  		if (IS_ERR(vuart->clk)) {
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  449  			dev_warn(&pdev->dev,
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  450  				"clk or clock-frequency not defined\n");
cbafe9d5c34673 Alexey Khoroshilov 2017-07-28  451  			rc = PTR_ERR(vuart->clk);
cbafe9d5c34673 Alexey Khoroshilov 2017-07-28  452  			goto err_sysfs_remove;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  453  		}
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  454  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  455  		rc = clk_prepare_enable(vuart->clk);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  456  		if (rc < 0)
cbafe9d5c34673 Alexey Khoroshilov 2017-07-28  457  			goto err_sysfs_remove;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  458  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  459  		clk = clk_get_rate(vuart->clk);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  460  	}
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  461  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  462  	/* If current-speed was set, then try not to change it. */
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  463  	if (of_property_read_u32(np, "current-speed", &prop) == 0)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  464  		port.port.custom_divisor = clk / (16 * prop);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  465  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  466  	/* Check for shifted address mapping */
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  467  	if (of_property_read_u32(np, "reg-offset", &prop) == 0)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  468  		port.port.mapbase += prop;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  469  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  470  	/* Check for registers offset within the devices address range */
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  471  	if (of_property_read_u32(np, "reg-shift", &prop) == 0)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  472  		port.port.regshift = prop;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  473  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  474  	/* Check for fifo size */
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  475  	if (of_property_read_u32(np, "fifo-size", &prop) == 0)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  476  		port.port.fifosize = prop;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  477  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  478  	/* Check for a fixed line number */
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  479  	rc = of_alias_get_id(np, "serial");
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  480  	if (rc >= 0)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  481  		port.port.line = rc;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  482  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  483  	port.port.irq = irq_of_parse_and_map(np, 0);
5909c0bf9c7a17 Jeremy Kerr        2018-03-27  484  	port.port.handle_irq = aspeed_vuart_handle_irq;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  485  	port.port.iotype = UPIO_MEM;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  486  	port.port.type = PORT_16550A;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  487  	port.port.uartclk = clk;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  488  	port.port.flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  489  		| UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_NO_THRE_TEST;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  490  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  491  	if (of_property_read_bool(np, "no-loopback-test"))
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  492  		port.port.flags |= UPF_SKIP_TEST;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  493  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  494  	if (port.port.fifosize)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  495  		port.capabilities = UART_CAP_FIFO;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  496  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  497  	if (of_property_read_bool(np, "auto-flow-control"))
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  498  		port.capabilities |= UART_CAP_AFE;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  499  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  500  	rc = serial8250_register_8250_port(&port);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  501  	if (rc < 0)
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  502  		goto err_clk_disable;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  503  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  504  	vuart->line = rc;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  505  
8d310c9107a2a3 Oskar Senft        2019-09-05  506  	rc = of_parse_phandle_with_fixed_args(
8d310c9107a2a3 Oskar Senft        2019-09-05  507  		np, "aspeed,sirq-polarity-sense", 2, 0,
8d310c9107a2a3 Oskar Senft        2019-09-05  508  		&sirq_polarity_sense_args);
8d310c9107a2a3 Oskar Senft        2019-09-05  509  	if (rc < 0) {
8d310c9107a2a3 Oskar Senft        2019-09-05  510  		dev_dbg(&pdev->dev,
8d310c9107a2a3 Oskar Senft        2019-09-05  511  			"aspeed,sirq-polarity-sense property not found\n");
8d310c9107a2a3 Oskar Senft        2019-09-05  512  	} else {
8d310c9107a2a3 Oskar Senft        2019-09-05  513  		aspeed_vuart_auto_configure_sirq_polarity(
8d310c9107a2a3 Oskar Senft        2019-09-05  514  			vuart, sirq_polarity_sense_args.np,
8d310c9107a2a3 Oskar Senft        2019-09-05  515  			sirq_polarity_sense_args.args[0],
8d310c9107a2a3 Oskar Senft        2019-09-05  516  			BIT(sirq_polarity_sense_args.args[1]));
8d310c9107a2a3 Oskar Senft        2019-09-05  517  		of_node_put(sirq_polarity_sense_args.np);
8d310c9107a2a3 Oskar Senft        2019-09-05  518  	}
8d310c9107a2a3 Oskar Senft        2019-09-05  519  
ca03042f0f1221 Zev Weiss          2021-04-11  520  	rc = of_property_read_u32(np, "aspeed,lpc-io-reg", &prop);
ca03042f0f1221 Zev Weiss          2021-04-11  521  	if (rc < 0)
ca03042f0f1221 Zev Weiss          2021-04-11  522  		prop = ASPEED_VUART_DEFAULT_LPC_ADDR;
ca03042f0f1221 Zev Weiss          2021-04-11  523  
ca03042f0f1221 Zev Weiss          2021-04-11  524  	rc = aspeed_vuart_set_lpc_address(vuart, prop);
ca03042f0f1221 Zev Weiss          2021-04-11  525  	if (rc < 0) {
ca03042f0f1221 Zev Weiss          2021-04-11  526  		dev_err(&pdev->dev, "invalid value in aspeed,lpc-io-reg property\n");
ca03042f0f1221 Zev Weiss          2021-04-11  527  		goto err_clk_disable;
ca03042f0f1221 Zev Weiss          2021-04-11  528  	}
ca03042f0f1221 Zev Weiss          2021-04-11  529  
ca03042f0f1221 Zev Weiss          2021-04-11  530  	rc = of_property_read_u32_array(np, "aspeed,lpc-interrupts", sirq, 2);
ca03042f0f1221 Zev Weiss          2021-04-11  531  	if (rc < 0) {
ca03042f0f1221 Zev Weiss          2021-04-11  532  		sirq[0] = ASPEED_VUART_DEFAULT_SIRQ;
ca03042f0f1221 Zev Weiss          2021-04-11  533  		sirq[1] = ASPEED_VUART_DEFAULT_SIRQ_POLARITY;
ca03042f0f1221 Zev Weiss          2021-04-11  534  	}
ca03042f0f1221 Zev Weiss          2021-04-11  535  
ca03042f0f1221 Zev Weiss          2021-04-11  536  	rc = aspeed_vuart_set_sirq(vuart, sirq[0]);
ca03042f0f1221 Zev Weiss          2021-04-11  537  	if (rc < 0) {
ca03042f0f1221 Zev Weiss          2021-04-11  538  		dev_err(&pdev->dev, "invalid sirq number in aspeed,lpc-interrupts property\n");
ca03042f0f1221 Zev Weiss          2021-04-11  539  		goto err_clk_disable;
ca03042f0f1221 Zev Weiss          2021-04-11  540  	}
ca03042f0f1221 Zev Weiss          2021-04-11  541  
ca03042f0f1221 Zev Weiss          2021-04-11  542  	sirq_polarity = aspeed_vuart_map_irq_polarity(sirq[1]);
ca03042f0f1221 Zev Weiss          2021-04-11  543  	if (sirq_polarity < 0) {
ca03042f0f1221 Zev Weiss          2021-04-11  544  		dev_err(&pdev->dev, "invalid sirq polarity in aspeed,lpc-interrupts property\n");
ca03042f0f1221 Zev Weiss          2021-04-11  545  		rc = sirq_polarity;
ca03042f0f1221 Zev Weiss          2021-04-11  546  		goto err_clk_disable;
ca03042f0f1221 Zev Weiss          2021-04-11  547  	}
ca03042f0f1221 Zev Weiss          2021-04-11  548  
ca03042f0f1221 Zev Weiss          2021-04-11  549  	aspeed_vuart_set_sirq_polarity(vuart, sirq_polarity);
ca03042f0f1221 Zev Weiss          2021-04-11  550  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  551  	aspeed_vuart_set_enabled(vuart, true);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  552  	aspeed_vuart_set_host_tx_discard(vuart, true);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  553  	platform_set_drvdata(pdev, vuart);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  554  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  555  	return 0;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  556  
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  557  err_clk_disable:
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  558  	clk_disable_unprepare(vuart->clk);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  559  	irq_dispose_mapping(port.port.irq);
cbafe9d5c34673 Alexey Khoroshilov 2017-07-28  560  err_sysfs_remove:
cbafe9d5c34673 Alexey Khoroshilov 2017-07-28  561  	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  562  	return rc;
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02 @563  }
7fbcf3afe6e8e1 Jeremy Kerr        2017-05-02  564  

:::::: The code at line 563 was first introduced by commit
:::::: 7fbcf3afe6e8e180bfc39fb3f41657fa6e4af55c drivers/serial: Add driver for Aspeed virtual UART

:::::: TO: Jeremy Kerr <jk@ozlabs.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
