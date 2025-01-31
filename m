Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184401BFE03
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322941; cv=none; b=RErbW3xUo1y0UwcgSiaipoT/RoGi5jQIFfFuE585RRDoRpdvnNcPHVDKgj/33jUjl535osdWewNbhERd88gyztoioDJS4IdRonz0iIbppJhYByYvSXg0J1QlqFdnZ/VXK9+YpPy8SI06pWe6HamucroZP//yaTxkh/eymNlazv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322941; c=relaxed/simple;
	bh=yEykVjVuapMK4VJeAEFwH8HhcELvmdmQuBeqz6KtIPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gdDlP8DkGpgoMVG3QVUb6Qp6G69rb14Clj9eOha3Rhdph3AwjwW2znY+2VXT2GvqOwmLXqmNfJyTe9anyw7dvi8BlE4e3eP/UKJUYqHjH3lr25K+4feGtOgC5P+CbwCiigbicVRH1U6Mt9OJ0jo7tZ4J/gllUTVe9uBrP3YEl0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUQ3R+GK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUQ3R+GK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738322939; x=1769858939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yEykVjVuapMK4VJeAEFwH8HhcELvmdmQuBeqz6KtIPE=;
  b=BUQ3R+GKD9WC0TYhofzRT9pWSwYFzuBoAWdvud6bNTbsMsdUpXv39l3e
   tKU7nSiE8wPmqzaZOKZ6AjYL0kNUzwTZbb6p28JE1vGe1Ct2sTDO8M2Br
   u29oLiH60vBPcippBRAo/l73Ll7RA8GcG4B9/b2CcVmNU0ot7vm07hOVv
   tZ33FGvgpO6u+dvGuYQX+M2JOp0vyRa3gk2tZAl/jCaMbbUkgvorHOLl8
   miKN81B1so03JRHf0NqWtBpJQO7VGq2thCUC0ikzNwqHlNFONSNKBkzPL
   fB8RGXq2k/3MGwvNu+xDh/+A1qFydPD/dtmcm/dgbhLr13XT8g7qk5Li7
   g==;
X-CSE-ConnectionGUID: N2Ps/+qtTTqf49zWcwmaZA==
X-CSE-MsgGUID: Q3DvFgKPSZi7lz7RIh3j6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="39048486"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="39048486"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 03:28:58 -0800
X-CSE-ConnectionGUID: MsGzv3+NS7aOEz1klstjGg==
X-CSE-MsgGUID: dicoWbHXSrCQhozLp3E2hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="110190965"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Jan 2025 03:28:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdpCg-000mJ1-3A;
	Fri, 31 Jan 2025 11:28:54 +0000
Date: Fri, 31 Jan 2025 19:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 49/53] drivers/tty/serial/xilinx_uartps.c:1678:38:
 error: 'struct uart_driver' has no member named 'nr'
Message-ID: <202501311959.5knbw5v6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   49d2ec1c49130aef08df8d571310a02866a117a7
commit: a79ca9cf1590b4c025eb1af2fd9892b562421525 [49/53] serial: remove nr
config: x86_64-buildonly-randconfig-001-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311959.5knbw5v6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311959.5knbw5v6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311959.5knbw5v6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/tty/serial/xilinx_uartps.c: In function 'cdns_uart_probe':
>> drivers/tty/serial/xilinx_uartps.c:1678:38: error: 'struct uart_driver' has no member named 'nr'
    1678 |                 cdns_uart_uart_driver.nr = CDNS_UART_NR_PORTS;
         |                                      ^
--
   drivers/tty/serial/tegra-tcu.c: In function 'tegra_tcu_probe':
>> drivers/tty/serial/tegra-tcu.c:217:20: error: 'struct uart_driver' has no member named 'nr'
     217 |         tcu->driver.nr = 1;
         |                    ^
--
>> drivers/tty/serial/atmel_serial.c:2713:10: error: 'struct uart_driver' has no member named 'nr'
    2713 |         .nr             = ATMEL_MAX_UART,
         |          ^~
>> drivers/tty/serial/atmel_serial.c:107:33: warning: initialization of 'struct console *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     107 | #define ATMEL_MAX_UART          8
         |                                 ^
   drivers/tty/serial/atmel_serial.c:2713:27: note: in expansion of macro 'ATMEL_MAX_UART'
    2713 |         .nr             = ATMEL_MAX_UART,
         |                           ^~~~~~~~~~~~~~
   drivers/tty/serial/atmel_serial.c:107:33: note: (near initialization for 'atmel_uart.cons')
     107 | #define ATMEL_MAX_UART          8
         |                                 ^
   drivers/tty/serial/atmel_serial.c:2713:27: note: in expansion of macro 'ATMEL_MAX_UART'
    2713 |         .nr             = ATMEL_MAX_UART,
         |                           ^~~~~~~~~~~~~~
   drivers/tty/serial/atmel_serial.c:2701:33: warning: initialized field overwritten [-Woverride-init]
    2701 | #define ATMEL_CONSOLE_DEVICE    (&atmel_console)
         |                                 ^
   drivers/tty/serial/atmel_serial.c:2714:27: note: in expansion of macro 'ATMEL_CONSOLE_DEVICE'
    2714 |         .cons           = ATMEL_CONSOLE_DEVICE,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/atmel_serial.c:2701:33: note: (near initialization for 'atmel_uart.cons')
    2701 | #define ATMEL_CONSOLE_DEVICE    (&atmel_console)
         |                                 ^
   drivers/tty/serial/atmel_serial.c:2714:27: note: in expansion of macro 'ATMEL_CONSOLE_DEVICE'
    2714 |         .cons           = ATMEL_CONSOLE_DEVICE,
         |                           ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/tty/serial/fsl_linflexuart.c:803:10: error: 'struct uart_driver' has no member named 'nr'
     803 |         .nr             = ARRAY_SIZE(linflex_ports),
         |          ^~
--
>> drivers/tty/serial/lpc32xx_hs.c:202:10: error: 'struct uart_driver' has no member named 'nr'
     202 |         .nr             = MAX_PORTS,
         |          ^~
--
>> drivers/tty/serial/liteuart.c:65:10: error: 'struct uart_driver' has no member named 'nr'
      65 |         .nr = CONFIG_SERIAL_LITEUART_MAX_PORTS,
         |          ^~
   In file included from include/linux/kconfig.h:5,
                    from <command-line>:
   ./include/generated/autoconf.h:1096:42: warning: initialization of 'struct console *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1096 | #define CONFIG_SERIAL_LITEUART_MAX_PORTS 1
         |                                          ^
   drivers/tty/serial/liteuart.c:65:15: note: in expansion of macro 'CONFIG_SERIAL_LITEUART_MAX_PORTS'
      65 |         .nr = CONFIG_SERIAL_LITEUART_MAX_PORTS,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:1096:42: note: (near initialization for 'liteuart_driver.cons')
    1096 | #define CONFIG_SERIAL_LITEUART_MAX_PORTS 1
         |                                          ^
   drivers/tty/serial/liteuart.c:65:15: note: in expansion of macro 'CONFIG_SERIAL_LITEUART_MAX_PORTS'
      65 |         .nr = CONFIG_SERIAL_LITEUART_MAX_PORTS,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/tty/serial/icom.c:1543:10: error: 'struct uart_driver' has no member named 'nr'
    1543 |         .nr = NR_PORTS,
         |          ^~
>> drivers/tty/serial/icom.c:48:32: warning: initialization of 'struct console *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      48 | #define NR_PORTS               128
         |                                ^~~
   drivers/tty/serial/icom.c:1543:15: note: in expansion of macro 'NR_PORTS'
    1543 |         .nr = NR_PORTS,
         |               ^~~~~~~~
   drivers/tty/serial/icom.c:48:32: note: (near initialization for 'icom_uart_driver.cons')
      48 | #define NR_PORTS               128
         |                                ^~~
   drivers/tty/serial/icom.c:1543:15: note: in expansion of macro 'NR_PORTS'
    1543 |         .nr = NR_PORTS,
         |               ^~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:358,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/tty/serial/icom.c:11:
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   drivers/tty/serial/icom.c:1535:22: note: in expansion of macro 'NULL'
    1535 | #define ICOM_CONSOLE NULL
         |                      ^~~~
   drivers/tty/serial/icom.c:1544:17: note: in expansion of macro 'ICOM_CONSOLE'
    1544 |         .cons = ICOM_CONSOLE,
         |                 ^~~~~~~~~~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'icom_uart_driver.cons')
       8 | #define NULL ((void *)0)
         |              ^
   drivers/tty/serial/icom.c:1535:22: note: in expansion of macro 'NULL'
    1535 | #define ICOM_CONSOLE NULL
         |                      ^~~~
   drivers/tty/serial/icom.c:1544:17: note: in expansion of macro 'ICOM_CONSOLE'
    1544 |         .cons = ICOM_CONSOLE,
         |                 ^~~~~~~~~~~~
--
>> drivers/tty/serial/sunplus-uart.c:572:10: error: 'struct uart_driver' has no member named 'nr'
     572 |         .nr             = SUP_UART_NR,
         |          ^~
>> drivers/tty/serial/sunplus-uart.c:72:41: warning: initialization of 'struct console *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      72 | #define SUP_UART_NR                     5
         |                                         ^
   drivers/tty/serial/sunplus-uart.c:572:27: note: in expansion of macro 'SUP_UART_NR'
     572 |         .nr             = SUP_UART_NR,
         |                           ^~~~~~~~~~~
   drivers/tty/serial/sunplus-uart.c:72:41: note: (near initialization for 'sunplus_uart_driver.cons')
      72 | #define SUP_UART_NR                     5
         |                                         ^
   drivers/tty/serial/sunplus-uart.c:572:27: note: in expansion of macro 'SUP_UART_NR'
     572 |         .nr             = SUP_UART_NR,
         |                           ^~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:358,
                    from include/linux/err.h:5,
                    from include/linux/clk.h:12,
                    from drivers/tty/serial/sunplus-uart.c:19:
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   drivers/tty/serial/sunplus-uart.c:563:33: note: in expansion of macro 'NULL'
     563 | #define SERIAL_SUNPLUS_CONSOLE  NULL
         |                                 ^~~~
   drivers/tty/serial/sunplus-uart.c:573:27: note: in expansion of macro 'SERIAL_SUNPLUS_CONSOLE'
     573 |         .cons           = SERIAL_SUNPLUS_CONSOLE,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sunplus_uart_driver.cons')
       8 | #define NULL ((void *)0)
         |              ^
   drivers/tty/serial/sunplus-uart.c:563:33: note: in expansion of macro 'NULL'
     563 | #define SERIAL_SUNPLUS_CONSOLE  NULL
         |                                 ^~~~
   drivers/tty/serial/sunplus-uart.c:573:27: note: in expansion of macro 'SERIAL_SUNPLUS_CONSOLE'
     573 |         .cons           = SERIAL_SUNPLUS_CONSOLE,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/tty/serial/esp32_uart.c:675:10: error: 'struct uart_driver' has no member named 'nr'
     675 |         .nr             = ARRAY_SIZE(esp32_uart_ports),
         |          ^~
--
   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/ktime.h:24,
                    from include/linux/hrtimer_defs.h:5,
                    from include/linux/hrtimer.h:15,
                    from drivers/tty/serial/vt8500_serial.c:10:
   drivers/tty/serial/vt8500_serial.c: In function 'vt8500_console_write':
>> drivers/tty/serial/vt8500_serial.c:478:64: error: 'struct uart_driver' has no member named 'nr'
     478 |         BUG_ON(co->index < 0 || co->index >= vt8500_uart_driver.nr);
         |                                                                ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/tty/serial/vt8500_serial.c:478:9: note: in expansion of macro 'BUG_ON'
     478 |         BUG_ON(co->index < 0 || co->index >= vt8500_uart_driver.nr);
         |         ^~~~~~
   drivers/tty/serial/vt8500_serial.c: In function 'vt8500_console_setup':
   drivers/tty/serial/vt8500_serial.c:502:53: error: 'struct uart_driver' has no member named 'nr'
     502 |         if (unlikely(co->index >= vt8500_uart_driver.nr || co->index < 0))
         |                                                     ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/tty/serial/vt8500_serial.c: At top level:
   drivers/tty/serial/vt8500_serial.c:587:10: error: 'struct uart_driver' has no member named 'nr'
     587 |         .nr             = 6,
         |          ^~
--
>> drivers/tty/serial/mps2-uart.c:503:10: error: 'struct uart_driver' has no member named 'nr'
     503 |         .nr = MPS2_MAX_PORTS,
         |          ^~
..


vim +1678 drivers/tty/serial/xilinx_uartps.c

fccc9d9233f918e Manikanta Guntupalli 2024-01-23  1639  
61ec9016988f5c0 John Linn            2011-04-30  1640  /**
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1641   * cdns_uart_probe - Platform driver probe
61ec9016988f5c0 John Linn            2011-04-30  1642   * @pdev: Pointer to the platform device structure
61ec9016988f5c0 John Linn            2011-04-30  1643   *
e555a21149806b2 Soren Brinkmann      2014-04-04  1644   * Return: 0 on success, negative errno otherwise
489810a1a6efa08 Michal Simek         2014-04-04  1645   */
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1646  static int cdns_uart_probe(struct platform_device *pdev)
61ec9016988f5c0 John Linn            2011-04-30  1647  {
492cc08bc16c44e Michal Simek         2020-04-03  1648  	int rc, id, irq;
61ec9016988f5c0 John Linn            2011-04-30  1649  	struct uart_port *port;
5c90c07b98c0219 Michal Simek         2015-04-13  1650  	struct resource *res;
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1651  	struct cdns_uart *cdns_uart_data;
3816b2f886d0918 Nava kishore Manne   2016-09-15  1652  	const struct of_device_id *match;
61ec9016988f5c0 John Linn            2011-04-30  1653  
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1654  	cdns_uart_data = devm_kzalloc(&pdev->dev, sizeof(*cdns_uart_data),
c03cae1791407f4 Soren Brinkmann      2013-10-17  1655  			GFP_KERNEL);
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1656  	if (!cdns_uart_data)
30e1e28598c2674 Soren Brinkmann      2013-05-13  1657  		return -ENOMEM;
0a84bae7edfb44b Michal Simek         2018-04-23  1658  	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
0a84bae7edfb44b Michal Simek         2018-04-23  1659  	if (!port)
0a84bae7edfb44b Michal Simek         2018-04-23  1660  		return -ENOMEM;
30e1e28598c2674 Soren Brinkmann      2013-05-13  1661  
72d68197281e2ad Michal Simek         2020-04-03  1662  	/* Look for a serialN alias */
492cc08bc16c44e Michal Simek         2020-04-03  1663  	id = of_alias_get_id(pdev->dev.of_node, "serial");
492cc08bc16c44e Michal Simek         2020-04-03  1664  	if (id < 0)
492cc08bc16c44e Michal Simek         2020-04-03  1665  		id = 0;
14090ad1805f934 Michal Simek         2018-09-03  1666  
492cc08bc16c44e Michal Simek         2020-04-03  1667  	if (id >= CDNS_UART_NR_PORTS) {
72d68197281e2ad Michal Simek         2020-04-03  1668  		dev_err(&pdev->dev, "Cannot get uart_port structure\n");
72d68197281e2ad Michal Simek         2020-04-03  1669  		return -ENODEV;
ae1cca3fa3478be Michal Simek         2018-09-20  1670  	}
024ca329bfb9a94 Michal Simek         2018-09-03  1671  
18cc7ac8a28e28c Michal Simek         2020-04-03  1672  	if (!cdns_uart_uart_driver.state) {
18cc7ac8a28e28c Michal Simek         2020-04-03  1673  		cdns_uart_uart_driver.owner = THIS_MODULE;
18cc7ac8a28e28c Michal Simek         2020-04-03  1674  		cdns_uart_uart_driver.driver_name = CDNS_UART_NAME;
18cc7ac8a28e28c Michal Simek         2020-04-03  1675  		cdns_uart_uart_driver.dev_name = CDNS_UART_TTY_NAME;
18cc7ac8a28e28c Michal Simek         2020-04-03  1676  		cdns_uart_uart_driver.major = CDNS_UART_MAJOR;
18cc7ac8a28e28c Michal Simek         2020-04-03  1677  		cdns_uart_uart_driver.minor = CDNS_UART_MINOR;
18cc7ac8a28e28c Michal Simek         2020-04-03 @1678  		cdns_uart_uart_driver.nr = CDNS_UART_NR_PORTS;
10a5315b47b09ea Michal Simek         2018-09-03  1679  #ifdef CONFIG_SERIAL_XILINX_PS_UART_CONSOLE
18cc7ac8a28e28c Michal Simek         2020-04-03  1680  		cdns_uart_uart_driver.cons = &cdns_uart_console;
10a5315b47b09ea Michal Simek         2018-09-03  1681  #endif
10a5315b47b09ea Michal Simek         2018-09-03  1682  
18cc7ac8a28e28c Michal Simek         2020-04-03  1683  		rc = uart_register_driver(&cdns_uart_uart_driver);
e4bbb5194ea3bc7 Michal Simek         2018-09-03  1684  		if (rc < 0) {
e4bbb5194ea3bc7 Michal Simek         2018-09-03  1685  			dev_err(&pdev->dev, "Failed to register driver\n");
72d68197281e2ad Michal Simek         2020-04-03  1686  			return rc;
e4bbb5194ea3bc7 Michal Simek         2018-09-03  1687  		}
e4bbb5194ea3bc7 Michal Simek         2018-09-03  1688  	}
e4bbb5194ea3bc7 Michal Simek         2018-09-03  1689  
18cc7ac8a28e28c Michal Simek         2020-04-03  1690  	cdns_uart_data->cdns_uart_driver = &cdns_uart_uart_driver;
46a460f0150ab47 Michal Simek         2018-09-03  1691  
3816b2f886d0918 Nava kishore Manne   2016-09-15  1692  	match = of_match_node(cdns_uart_of_match, pdev->dev.of_node);
3816b2f886d0918 Nava kishore Manne   2016-09-15  1693  	if (match && match->data) {
3816b2f886d0918 Nava kishore Manne   2016-09-15  1694  		const struct cdns_platform_data *data = match->data;
3816b2f886d0918 Nava kishore Manne   2016-09-15  1695  
3816b2f886d0918 Nava kishore Manne   2016-09-15  1696  		cdns_uart_data->quirks = data->quirks;
3816b2f886d0918 Nava kishore Manne   2016-09-15  1697  	}
3816b2f886d0918 Nava kishore Manne   2016-09-15  1698  
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1699  	cdns_uart_data->pclk = devm_clk_get(&pdev->dev, "pclk");
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1700  	if (PTR_ERR(cdns_uart_data->pclk) == -EPROBE_DEFER) {
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1701  		rc = PTR_ERR(cdns_uart_data->pclk);
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1702  		goto err_out_unregister_driver;
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1703  	}
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1704  
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1705  	if (IS_ERR(cdns_uart_data->pclk)) {
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1706  		cdns_uart_data->pclk = devm_clk_get(&pdev->dev, "aper_clk");
82ca0d5487d4e14 Greg Kroah-Hartman   2018-12-06  1707  		if (IS_ERR(cdns_uart_data->pclk)) {
82ca0d5487d4e14 Greg Kroah-Hartman   2018-12-06  1708  			rc = PTR_ERR(cdns_uart_data->pclk);
82ca0d5487d4e14 Greg Kroah-Hartman   2018-12-06  1709  			goto err_out_unregister_driver;
82ca0d5487d4e14 Greg Kroah-Hartman   2018-12-06  1710  		}
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1711  		dev_err(&pdev->dev, "clock name 'aper_clk' is deprecated.\n");
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1712  	}
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1713  
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1714  	cdns_uart_data->uartclk = devm_clk_get(&pdev->dev, "uart_clk");
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1715  	if (PTR_ERR(cdns_uart_data->uartclk) == -EPROBE_DEFER) {
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1716  		rc = PTR_ERR(cdns_uart_data->uartclk);
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1717  		goto err_out_unregister_driver;
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1718  	}
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1719  
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1720  	if (IS_ERR(cdns_uart_data->uartclk)) {
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1721  		cdns_uart_data->uartclk = devm_clk_get(&pdev->dev, "ref_clk");
82ca0d5487d4e14 Greg Kroah-Hartman   2018-12-06  1722  		if (IS_ERR(cdns_uart_data->uartclk)) {
82ca0d5487d4e14 Greg Kroah-Hartman   2018-12-06  1723  			rc = PTR_ERR(cdns_uart_data->uartclk);
82ca0d5487d4e14 Greg Kroah-Hartman   2018-12-06  1724  			goto err_out_unregister_driver;
82ca0d5487d4e14 Greg Kroah-Hartman   2018-12-06  1725  		}
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1726  		dev_err(&pdev->dev, "clock name 'ref_clk' is deprecated.\n");
f694936c3b5a4c1 Rajan Vaja           2019-03-01  1727  	}
2326669ccbd901d Josh Cartwright      2013-01-21  1728  
e3896be240780cc Manikanta Guntupalli 2024-04-25  1729  	cdns_uart_data->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
e3896be240780cc Manikanta Guntupalli 2024-04-25  1730  	if (IS_ERR(cdns_uart_data->rstc)) {
e3896be240780cc Manikanta Guntupalli 2024-04-25  1731  		rc = PTR_ERR(cdns_uart_data->rstc);
e3896be240780cc Manikanta Guntupalli 2024-04-25  1732  		dev_err_probe(&pdev->dev, rc, "Cannot get UART reset\n");
e3896be240780cc Manikanta Guntupalli 2024-04-25  1733  		goto err_out_unregister_driver;
e3896be240780cc Manikanta Guntupalli 2024-04-25  1734  	}
e3896be240780cc Manikanta Guntupalli 2024-04-25  1735  
ecfc5771ef0617d Shubhrajyoti Datta   2017-04-06  1736  	rc = clk_prepare_enable(cdns_uart_data->pclk);
30e1e28598c2674 Soren Brinkmann      2013-05-13  1737  	if (rc) {
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1738  		dev_err(&pdev->dev, "Unable to enable pclk clock.\n");
e4bbb5194ea3bc7 Michal Simek         2018-09-03  1739  		goto err_out_unregister_driver;
30e1e28598c2674 Soren Brinkmann      2013-05-13  1740  	}
ecfc5771ef0617d Shubhrajyoti Datta   2017-04-06  1741  	rc = clk_prepare_enable(cdns_uart_data->uartclk);
2326669ccbd901d Josh Cartwright      2013-01-21  1742  	if (rc) {
30e1e28598c2674 Soren Brinkmann      2013-05-13  1743  		dev_err(&pdev->dev, "Unable to enable device clock.\n");
d9bb3fb12685209 Soren Brinkmann      2014-04-04  1744  		goto err_out_clk_dis_pclk;
61ec9016988f5c0 John Linn            2011-04-30  1745  	}
61ec9016988f5c0 John Linn            2011-04-30  1746  
61ec9016988f5c0 John Linn            2011-04-30  1747  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
30e1e28598c2674 Soren Brinkmann      2013-05-13  1748  	if (!res) {
30e1e28598c2674 Soren Brinkmann      2013-05-13  1749  		rc = -ENODEV;
30e1e28598c2674 Soren Brinkmann      2013-05-13  1750  		goto err_out_clk_disable;
30e1e28598c2674 Soren Brinkmann      2013-05-13  1751  	}
61ec9016988f5c0 John Linn            2011-04-30  1752  
5c90c07b98c0219 Michal Simek         2015-04-13  1753  	irq = platform_get_irq(pdev, 0);
2c2d01a9f724a88 Ruan Jinjie          2023-08-03  1754  	if (irq < 0) {
2c2d01a9f724a88 Ruan Jinjie          2023-08-03  1755  		rc = irq;
30e1e28598c2674 Soren Brinkmann      2013-05-13  1756  		goto err_out_clk_disable;
30e1e28598c2674 Soren Brinkmann      2013-05-13  1757  	}
61ec9016988f5c0 John Linn            2011-04-30  1758  

:::::: The code at line 1678 was first introduced by commit
:::::: 18cc7ac8a28e28cd005c2475f52576cfe10cabfb Revert "serial: uartps: Register own uart console and driver structures"

:::::: TO: Michal Simek <michal.simek@xilinx.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
