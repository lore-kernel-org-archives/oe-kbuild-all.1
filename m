Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021690;
	b=WLBlbYn4S+JPoIMZ6KZ1Ea+wdWwkZcAW5TGZcRiqig/X4R/LogwELL9Rf5jnDeQzCQUk
	 DADR6QarsH0DOP0otZ+gSZjtPRTCSAziqaCLO6yuAMCtwYpSYWpvrLbvqYrPyzUAZyV+I
	 3HH59JuBzDjWqcYYtaZsv6+Zk4JyTWTz1GSu2b0a40zjDtFafAXdh0EySuZU0rS1lqVAh
	 LJtd2i/NMndWZoGIpFRBoK1be8qtwEfPM1RuXkj/PYViwCIlCRJlOLie3loeAxzobl1Gc
	 zETIQszMqGXnbwXMZBxqQwLw/NldiQh2E7waoNISy+vXWGoecoIlyL4RidQSD3SCukA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021690;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5qdZ509piUO/S/uiKnDFmYOHN2q1I1q9DQIkaG3h59c=;
	b=2jQ3kiHUF6TRsehuyekqddflvaj04efxZZIxPi30eEkWv9TVLANJ7y25YcomR+JxozwP
	 5zrcDVm3ce5VfM2inhdJHspywQ52+51TgghFFs7mkhrCnfNEU2oRAhacFFVJ8Uqmju3i5
	 /4kCBmU1Bez3518KPLhVSuJQHao6KJJBxdh6zXRVNaf4sR7VfIaRefvizPkBjzdBR3blU
	 HyNcLEj5v8O4kg9Imr0k6ZYYJo+Dojx/7nznd6yX892TwNF3CfBuP9bt3bio/NBDnv4nh
	 MNNWwzZkwrjCbaaaUbUNlC2sU1lqW6kcBgA5Hj3hWNa7bDdvtSb6Dn19bG9Gp5lrnGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=duCUWwlT;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36DF606A333
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 17:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36DF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=duCUWwlT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795021690; x=1826557690;
  h=date:from:to:cc:subject:message-id;
  bh=Fxl024xaDYL+sNQZ3+7ANf8tZrhLY9A1oBdwHG7chtg=;
  b=duCUWwlTqVxsLxNNa5u+UZ5H6ntKMtspH9if/IXwHmgQ0CUQcver/Mj8
   Fa5LCmUgUIqHp/FPhr5Diyc8vVEWtOc2OgfD5tjWMCtM2X73ED6HGD0/r
   bXcCmqtEQ9TtdpBmxOb7j7jem/zTUol6GLoCD1jt5OACnUMT8sty8QXxM
   4iChSSm5WhNG9/RBm4e+dMymBADVXn9KM7wL7Zz+R5gP0TD9r67CEZ+Uq
   fAdtJibmqfuOqhvdrMjZQf5WjuQuLaluFLA/+MJErRlIy9TgkFFV3oonf
   UgydPDmIP55V2FQSTd4uC+6HUj5aBuDkdB0wS3av8prswC8JYVx9oi7CS
   w==;
X-CSE-ConnectionGUID: yq5TX14WSBGkaXpIGCtlag==
X-CSE-MsgGUID: b9T24OyWREO1uvTUbIK90A==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3724757"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3724757"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 09:08:08 -0800
X-CSE-ConnectionGUID: nlj89pvNSiaOe25t7znl2Q==
X-CSE-MsgGUID: eUiMOmXxRxqfZNYBahvUaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12140047"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 18 Nov 2026 09:08:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTj8e-000000003Qu-1yrc;
	Wed, 18 Nov 2026 17:08:04 +0000
Date: Wed, 18 Nov 2026 18:07:24 +0100
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:cf-serial 1/4]
 drivers/tty/serial/mcf.c:586:25: sparse: sparse: unsigned value that used to
 be signed checked against zero?
Message-ID: <20261118180432.L0Epe9wF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cf-serial
head:   13e7fc3bb9e0e6b9de008260d6925af530c79882
commit: 93cb854f633956fd1e5df8744a9e27695b2e8cd8 [1/4] serial: mcf: convert to use proper platform resources
config: m68k-randconfig-r2310-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118180432.L0Epe9wF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118180432.L0Epe9wF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118180432.L0Epe9wF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/mcf.c:513:30: sparse: sparse: Using plain integer as NULL pointer
>> drivers/tty/serial/mcf.c:586:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/tty/serial/mcf.c:585:37: sparse: signed value source

vim +586 drivers/tty/serial/mcf.c

   501	
   502	static int __init mcf_console_setup(struct console *co, char *options)
   503	{
   504		struct uart_port *port;
   505		int baud = CONFIG_SERIAL_MCF_BAUDRATE;
   506		int bits = 8;
   507		int parity = 'n';
   508		int flow = 'n';
   509	
   510		if ((co->index < 0) || (co->index >= MCF_MAXPORTS))
   511			co->index = 0;
   512		port = &mcf_ports[co->index].port;
 > 513		if (port->membase == 0)
   514			return -ENODEV;
   515	
   516		if (options)
   517			uart_parse_options(options, &baud, &parity, &bits, &flow);
   518	
   519		return uart_set_options(port, co, baud, parity, bits, flow);
   520	}
   521	
   522	/****************************************************************************/
   523	
   524	static struct uart_driver mcf_driver;
   525	
   526	static struct console mcf_console = {
   527		.name		= "ttyS",
   528		.write		= mcf_console_write,
   529		.device		= uart_console_device,
   530		.setup		= mcf_console_setup,
   531		.flags		= CON_PRINTBUFFER,
   532		.index		= -1,
   533		.data		= &mcf_driver,
   534	};
   535	
   536	static int __init mcf_console_init(void)
   537	{
   538		register_console(&mcf_console);
   539		return 0;
   540	}
   541	
   542	console_initcall(mcf_console_init);
   543	
   544	#define	MCF_CONSOLE	&mcf_console
   545	
   546	/****************************************************************************/
   547	#else
   548	/****************************************************************************/
   549	
   550	#define	MCF_CONSOLE	NULL
   551	
   552	/****************************************************************************/
   553	#endif /* CONFIG_SERIAL_MCF_CONSOLE */
   554	/****************************************************************************/
   555	
   556	/*
   557	 *	Define the mcf UART driver structure.
   558	 */
   559	static struct uart_driver mcf_driver = {
   560		.owner		= THIS_MODULE,
   561		.driver_name	= "mcf",
   562		.dev_name	= "ttyS",
   563		.major		= TTY_MAJOR,
   564		.minor		= 64,
   565		.nr		= MCF_MAXPORTS,
   566		.cons		= MCF_CONSOLE,
   567	};
   568	
   569	/****************************************************************************/
   570	
   571	static int mcf_probe(struct platform_device *pdev)
   572	{
   573		struct uart_port *port;
   574		struct resource *res;
   575	
   576		if (pdev->id >= MCF_MAXPORTS)
   577			return -ENODEV;
   578		port = &mcf_ports[pdev->id].port;
   579	
   580		port->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
   581		if (IS_ERR(port->membase))
   582			return PTR_ERR(port->membase);
   583		port->mapbase = res->start;
   584	
   585		port->irq = platform_get_irq(pdev, 0);
 > 586		if (port->irq < 0)
   587			return port->irq;
   588	
   589		port->line = pdev->id;
   590		port->type = PORT_MCF;
   591		port->dev = &pdev->dev;
   592		port->iotype = SERIAL_IO_MEM;
   593		port->uartclk = MCF_BUSCLK;
   594		port->ops = &mcf_uart_ops;
   595		port->flags = UPF_BOOT_AUTOCONF;
   596		port->rs485_config = mcf_config_rs485;
   597		port->rs485_supported = mcf_rs485_supported;
   598		port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MCF_CONSOLE);
   599	
   600		uart_add_one_port(&mcf_driver, port);
   601		return 0;
   602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
