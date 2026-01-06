Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD79A8F4A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 03:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767670358; cv=none; b=uGR4O8U4bR3NOAvvteA8x0EeUNkZGD3/05W5mVBnAdueUvgvaXw3X58t6uBgxWc6/4Uqm+dTxVXbQMUyjZL3D6mTh+dPCyyQkGEn2kF3o2Z6SjsEerPEoc2ozZ1lQSYp5/v36AgijQZfgSSOgYjRyi1c2i8cLv3VMtPtkJDRgeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767670358; c=relaxed/simple;
	bh=jcRXZzXT8kgBFNHs2DFK+/B413ha9HegMj31PR7BSVI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aU8gJkOnLM7HRpGMwB8ONdZtdr8MgYuUkQg/QapEsw4IWX22pEKPYBlWOKcFJG+UQT9RHZNk8p0ebze6kD5FsQnhUd7TF4prie/VXhdzxiuG1L9oYWhwlKhesMP2vylhBPEKHT58dvwBro8yK+HvOT+stBQEUIECL6deqGhzcyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OaAFwTl6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OaAFwTl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767670357; x=1799206357;
  h=date:from:to:cc:subject:message-id;
  bh=jcRXZzXT8kgBFNHs2DFK+/B413ha9HegMj31PR7BSVI=;
  b=OaAFwTl66t9+Jb85F4AVNeSXDaWqhIFr7U1RdCAMforWzcb97WwSCnWW
   vROeJGLpO12KwikaFGVh6ruEXCNquCwSDxRhs1xTkYLfmPl0RLhm1Zali
   Q9VHpXSH+CQ6ocHlQNVG/NPxt2Sr8Muxm0UhGDfGuVCkGq9P6NaIirPTH
   LQ4MMeAcO1z7cflQgPCi37HGiSZCCqMtOQom5AKOYWVDku4nJDmSeqTm6
   WCYPK9y86zvppPCtpt/Q5oCQevAxHxhmXR8OgLtlmejViLOxumKEyStSR
   PJ3dNnpV2iOSAnZeZARn6oxfPfpHD0OmR5AGpJ67kQiWtvuLAotw4KjWQ
   A==;
X-CSE-ConnectionGUID: MoDvqhf0RZubsTapokYx7g==
X-CSE-MsgGUID: lV7GWsCyTrOY/flb42/wEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68048362"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="68048362"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 19:32:36 -0800
X-CSE-ConnectionGUID: nl3ggg13SAinzOozARVzjw==
X-CSE-MsgGUID: 03XS8CAMQqG4/BcXUh9Wbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="203517087"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jan 2026 19:32:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcxo8-000000001dt-38ki;
	Tue, 06 Jan 2026 03:32:32 +0000
Date: Tue, 06 Jan 2026 11:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 8/28]
 drivers/tty/serial/8250/8250_keba.c:254:9: warning: assignment to 'int' from
 'struct uart_8250_port *' makes integer from pointer without a cast
Message-ID: <202601061137.QEiwsalE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   ae049f8207cfa89e68ea208f3e3250801a8d94c2
commit: 540e6b9e722564ceae425264d3bbdc661de5008d [8/28] serial8250 port operations work on struct uart_8250_port
config: arm64-randconfig-003-20260106 (https://download.01.org/0day-ci/archive/20260106/202601061137.QEiwsalE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601061137.QEiwsalE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601061137.QEiwsalE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_keba.c: In function 'kuart_probe':
>> drivers/tty/serial/8250/8250_keba.c:254:9: warning: assignment to 'int' from 'struct uart_8250_port *' makes integer from pointer without a cast [-Wint-conversion]
     254 |  retval = serial8250_register_8250_port(&uart);
         |         ^
   drivers/tty/serial/8250/8250_keba.c: In function 'kuart_remove':
>> drivers/tty/serial/8250/8250_keba.c:270:34: warning: passing argument 1 of 'serial8250_unregister_port' makes pointer from integer without a cast [-Wint-conversion]
     270 |  serial8250_unregister_port(kuart->line);
         |                             ~~~~~^~~~~~
         |                                  |
         |                                  unsigned int
   In file included from drivers/tty/serial/8250/8250.h:11,
                    from drivers/tty/serial/8250/8250_keba.c:22:
   include/linux/serial_8250.h:178:33: note: expected 'struct uart_8250_port *' but argument is of type 'unsigned int'
     178 | void serial8250_unregister_port(struct uart_8250_port *);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +254 drivers/tty/serial/8250/8250_keba.c

ab9a30d6febf76 Gerhard Engleder 2025-10-23  170  
ab9a30d6febf76 Gerhard Engleder 2025-10-23  171  static int kuart_probe(struct auxiliary_device *auxdev,
ab9a30d6febf76 Gerhard Engleder 2025-10-23  172  		       const struct auxiliary_device_id *id)
ab9a30d6febf76 Gerhard Engleder 2025-10-23  173  {
ab9a30d6febf76 Gerhard Engleder 2025-10-23  174  	struct device *dev = &auxdev->dev;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  175  	struct uart_8250_port uart = {};
ab9a30d6febf76 Gerhard Engleder 2025-10-23  176  	struct resource res;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  177  	struct kuart *kuart;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  178  	int retval;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  179  
ab9a30d6febf76 Gerhard Engleder 2025-10-23  180  	kuart = devm_kzalloc(dev, sizeof(*kuart), GFP_KERNEL);
ab9a30d6febf76 Gerhard Engleder 2025-10-23  181  	if (!kuart)
ab9a30d6febf76 Gerhard Engleder 2025-10-23  182  		return -ENOMEM;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  183  	kuart->auxdev = container_of(auxdev, struct keba_uart_auxdev, auxdev);
ab9a30d6febf76 Gerhard Engleder 2025-10-23  184  	kuart->flags = id->driver_data;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  185  	auxiliary_set_drvdata(auxdev, kuart);
ab9a30d6febf76 Gerhard Engleder 2025-10-23  186  
ab9a30d6febf76 Gerhard Engleder 2025-10-23  187  	/*
ab9a30d6febf76 Gerhard Engleder 2025-10-23  188  	 * map only memory in front of UART registers, UART registers will be
ab9a30d6febf76 Gerhard Engleder 2025-10-23  189  	 * mapped by serial port
ab9a30d6febf76 Gerhard Engleder 2025-10-23  190  	 */
ab9a30d6febf76 Gerhard Engleder 2025-10-23  191  	res = kuart->auxdev->io;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  192  	res.end = res.start + KUART_BASE - 1;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  193  	kuart->base = devm_ioremap_resource(dev, &res);
ab9a30d6febf76 Gerhard Engleder 2025-10-23  194  	if (IS_ERR(kuart->base))
ab9a30d6febf76 Gerhard Engleder 2025-10-23  195  		return PTR_ERR(kuart->base);
ab9a30d6febf76 Gerhard Engleder 2025-10-23  196  
ab9a30d6febf76 Gerhard Engleder 2025-10-23  197  	if (kuart->flags & KUART_USE_CAPABILITY) {
ab9a30d6febf76 Gerhard Engleder 2025-10-23  198  		/*
ab9a30d6febf76 Gerhard Engleder 2025-10-23  199  		 * supported modes are read from capability register, at least
ab9a30d6febf76 Gerhard Engleder 2025-10-23  200  		 * one mode other than none must be supported
ab9a30d6febf76 Gerhard Engleder 2025-10-23  201  		 */
ab9a30d6febf76 Gerhard Engleder 2025-10-23  202  		kuart->capability = ioread8(kuart->base + KUART_CAPABILITY) &
ab9a30d6febf76 Gerhard Engleder 2025-10-23  203  				    KUART_CAPABILITY_MASK;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  204  		if ((kuart->capability & ~KUART_CAPABILITY_NONE) == 0)
ab9a30d6febf76 Gerhard Engleder 2025-10-23  205  			return -EIO;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  206  	}
ab9a30d6febf76 Gerhard Engleder 2025-10-23  207  
ab9a30d6febf76 Gerhard Engleder 2025-10-23  208  	spin_lock_init(&uart.port.lock);
ab9a30d6febf76 Gerhard Engleder 2025-10-23  209  	uart.port.dev = dev;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  210  	uart.port.mapbase = kuart->auxdev->io.start + KUART_BASE;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  211  	uart.port.irq = kuart->auxdev->irq;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  212  	uart.port.uartclk = KUART_CLK;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  213  	uart.port.private_data = kuart;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  214  
ab9a30d6febf76 Gerhard Engleder 2025-10-23  215  	/* 8 bit registers are 32 bit aligned => shift register offset */
ab9a30d6febf76 Gerhard Engleder 2025-10-23  216  	uart.port.iotype = UPIO_MEM32;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  217  	uart.port.regshift = KUART_REGSHIFT;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  218  
ab9a30d6febf76 Gerhard Engleder 2025-10-23  219  	/*
ab9a30d6febf76 Gerhard Engleder 2025-10-23  220  	 * UART mixes 16550, 16750 and 16C950 (for RS485) standard => auto
ab9a30d6febf76 Gerhard Engleder 2025-10-23  221  	 * configuration works best
ab9a30d6febf76 Gerhard Engleder 2025-10-23  222  	 */
ab9a30d6febf76 Gerhard Engleder 2025-10-23  223  	uart.port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_IOREMAP;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  224  
ab9a30d6febf76 Gerhard Engleder 2025-10-23  225  	/*
ab9a30d6febf76 Gerhard Engleder 2025-10-23  226  	 * UART supports RS485, RS422 and RS232 with switching of physical
ab9a30d6febf76 Gerhard Engleder 2025-10-23  227  	 * interface
ab9a30d6febf76 Gerhard Engleder 2025-10-23  228  	 */
ab9a30d6febf76 Gerhard Engleder 2025-10-23  229  	uart.port.rs485_config = kuart_rs485_config;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  230  	if (kuart->flags & KUART_RS485) {
ab9a30d6febf76 Gerhard Engleder 2025-10-23  231  		uart.port.rs485_supported.flags = SER_RS485_ENABLED |
ab9a30d6febf76 Gerhard Engleder 2025-10-23  232  						  SER_RS485_RTS_ON_SEND;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  233  		uart.port.rs485.flags = SER_RS485_ENABLED |
ab9a30d6febf76 Gerhard Engleder 2025-10-23  234  					SER_RS485_RTS_ON_SEND;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  235  	}
ab9a30d6febf76 Gerhard Engleder 2025-10-23  236  	if (kuart->flags & KUART_USE_CAPABILITY) {
ab9a30d6febf76 Gerhard Engleder 2025-10-23  237  		/* default mode priority is RS485 > RS422 > RS232 */
ab9a30d6febf76 Gerhard Engleder 2025-10-23  238  		if (kuart->capability & KUART_CAPABILITY_RS422) {
ab9a30d6febf76 Gerhard Engleder 2025-10-23  239  			uart.port.rs485_supported.flags |= SER_RS485_ENABLED |
ab9a30d6febf76 Gerhard Engleder 2025-10-23  240  							   SER_RS485_RTS_ON_SEND |
ab9a30d6febf76 Gerhard Engleder 2025-10-23  241  							   SER_RS485_MODE_RS422;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  242  			uart.port.rs485.flags = SER_RS485_ENABLED |
ab9a30d6febf76 Gerhard Engleder 2025-10-23  243  						SER_RS485_RTS_ON_SEND |
ab9a30d6febf76 Gerhard Engleder 2025-10-23  244  						SER_RS485_MODE_RS422;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  245  		}
ab9a30d6febf76 Gerhard Engleder 2025-10-23  246  		if (kuart->capability & KUART_CAPABILITY_RS485) {
ab9a30d6febf76 Gerhard Engleder 2025-10-23  247  			uart.port.rs485_supported.flags |= SER_RS485_ENABLED |
ab9a30d6febf76 Gerhard Engleder 2025-10-23  248  							   SER_RS485_RTS_ON_SEND;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  249  			uart.port.rs485.flags = SER_RS485_ENABLED |
ab9a30d6febf76 Gerhard Engleder 2025-10-23  250  						SER_RS485_RTS_ON_SEND;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  251  		}
ab9a30d6febf76 Gerhard Engleder 2025-10-23  252  	}
ab9a30d6febf76 Gerhard Engleder 2025-10-23  253  
ab9a30d6febf76 Gerhard Engleder 2025-10-23 @254  	retval = serial8250_register_8250_port(&uart);
e5484745c4c0c3 Gerhard Engleder 2025-12-16  255  	if (retval < 0)
e5484745c4c0c3 Gerhard Engleder 2025-12-16  256  		return dev_err_probe(&auxdev->dev, retval,
e5484745c4c0c3 Gerhard Engleder 2025-12-16  257  				     "UART registration failed!\n");
ab9a30d6febf76 Gerhard Engleder 2025-10-23  258  	kuart->line = retval;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  259  
ab9a30d6febf76 Gerhard Engleder 2025-10-23  260  	return 0;
ab9a30d6febf76 Gerhard Engleder 2025-10-23  261  }
ab9a30d6febf76 Gerhard Engleder 2025-10-23  262  
ab9a30d6febf76 Gerhard Engleder 2025-10-23  263  static void kuart_remove(struct auxiliary_device *auxdev)
ab9a30d6febf76 Gerhard Engleder 2025-10-23  264  {
ab9a30d6febf76 Gerhard Engleder 2025-10-23  265  	struct kuart *kuart = auxiliary_get_drvdata(auxdev);
ab9a30d6febf76 Gerhard Engleder 2025-10-23  266  
ab9a30d6febf76 Gerhard Engleder 2025-10-23  267  	if (kuart->flags & KUART_USE_CAPABILITY)
ab9a30d6febf76 Gerhard Engleder 2025-10-23  268  		kuart_set_phy_mode(kuart, KUART_MODE_NONE);
ab9a30d6febf76 Gerhard Engleder 2025-10-23  269  
ab9a30d6febf76 Gerhard Engleder 2025-10-23 @270  	serial8250_unregister_port(kuart->line);
ab9a30d6febf76 Gerhard Engleder 2025-10-23  271  }
ab9a30d6febf76 Gerhard Engleder 2025-10-23  272  

:::::: The code at line 254 was first introduced by commit
:::::: ab9a30d6febf768c057fcde74a46597862db443e serial: 8250: add driver for KEBA UART

:::::: TO: Gerhard Engleder <eg@keba.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
