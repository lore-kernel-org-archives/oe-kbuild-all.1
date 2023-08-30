Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FDF6FCE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 18:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693419833; x=1724955833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FBmQRnUxrMNnHZsZ6nH584qFp/wVvKYqjgffoy0LM8M=;
  b=fsCARg8xQXe/x5Fo/OIorxbyLqlfQ9KJTIyEp0px1dAU1/TcO5JSDGgv
   VEwK1uZE2SpmC4tiKDx17ucF2oO6wtPds+mBn1Ut08JRDMCKsuxxm1R3c
   ZEvBBnSksu1IXWo2k75z2pkd/SWZBqgQ8uIiwpUHxDgnkYkmlxzo3xtVa
   5gGJ21IYuUDcKq/m9PQJTugI3braic+4TC2XHpVRjQPuqhc1QK98+ey4Q
   P+amo782Xyi1u7KN1GDprByn1/TCrQpLa1cjmpEodZNj7deyk+m09zcti
   7tAC+eVqCyFe/hVaZne2JJNZl535WrHeUDGDQRYEVIkqmur/5sqpTtaTH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355221420"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="355221420"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 11:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="862731223"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="862731223"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Aug 2023 11:23:51 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbPr4-000A6V-27;
	Wed, 30 Aug 2023 18:23:50 +0000
Date: Thu, 31 Aug 2023 02:23:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:serial 1/1] drivers/tty/serial/serial_core.c:2574:31: warning:
 unused variable 'flags'
Message-ID: <202308310214.w7d2e7w0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux serial
head:   0067e6cb00092ce4c3d84b6267ac0dd7e8f61cdc
commit: 0067e6cb00092ce4c3d84b6267ac0dd7e8f61cdc [1/1] serial: Avoid locking ->set_mctrl() call in uart_configure_port()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308310214.w7d2e7w0-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310214.w7d2e7w0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310214.w7d2e7w0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/serial_core.c: In function 'uart_configure_port':
>> drivers/tty/serial/serial_core.c:2574:31: warning: unused variable 'flags' [-Wunused-variable]
    2574 |                 unsigned long flags;
         |                               ^~~~~


vim +/flags +2574 drivers/tty/serial/serial_core.c

^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2545  
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2546  static void
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2547  uart_configure_port(struct uart_driver *drv, struct uart_state *state,
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2548  		    struct uart_port *port)
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2549  {
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2550  	unsigned int flags;
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2551  
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2552  	/*
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2553  	 * If there isn't a port here, don't do anything further.
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2554  	 */
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2555  	if (!port->iobase && !port->mapbase && !port->membase)
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2556  		return;
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2557  
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2558  	/*
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2559  	 * Now do the auto configuration stuff.  Note that config_port
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2560  	 * is expected to claim the resources and map the port for us.
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2561  	 */
8e23fcc89c80917 drivers/serial/serial_core.c     David Daney     2009-01-02  2562  	flags = 0;
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2563  	if (port->flags & UPF_AUTO_IRQ)
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2564  		flags |= UART_CONFIG_IRQ;
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2565  	if (port->flags & UPF_BOOT_AUTOCONF) {
8e23fcc89c80917 drivers/serial/serial_core.c     David Daney     2009-01-02  2566  		if (!(port->flags & UPF_FIXED_TYPE)) {
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2567  			port->type = PORT_UNKNOWN;
8e23fcc89c80917 drivers/serial/serial_core.c     David Daney     2009-01-02  2568  			flags |= UART_CONFIG_TYPE;
8e23fcc89c80917 drivers/serial/serial_core.c     David Daney     2009-01-02  2569  		}
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2570  		port->ops->config_port(port, flags);
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2571  	}
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2572  
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2573  	if (port->type != PORT_UNKNOWN) {
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16 @2574  		unsigned long flags;
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2575  
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2576  		uart_report_port(drv, port);
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2577  
3689a0ec60bc8f5 drivers/serial/serial_core.c     George G. Davis 2007-02-14  2578  		/* Power up port for set_mctrl() */
6f538fe31c1d453 drivers/tty/serial/serial_core.c Linus Walleij   2012-12-07  2579  		uart_change_pm(state, UART_PM_STATE_ON);
3689a0ec60bc8f5 drivers/serial/serial_core.c     George G. Davis 2007-02-14  2580  
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2581  		/*
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2582  		 * Ensure that the modem control lines are de-activated.
c3e4642be734ce3 drivers/serial/serial_core.c     Yinghai Lu      2008-02-04  2583  		 * keep the DTR setting that is set in uart_set_options()
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2584  		 */
93a770b7e167725 drivers/tty/serial/serial_core.c Lukas Wunner    2022-01-02  2585  		port->mctrl &= TIOCM_DTR;
7c7f9bc986e6988 drivers/tty/serial/serial_core.c Lukas Wunner    2022-09-22  2586  		if (!(port->rs485.flags & SER_RS485_ENABLED))
93a770b7e167725 drivers/tty/serial/serial_core.c Lukas Wunner    2022-01-02  2587  			port->ops->set_mctrl(port, port->mctrl);
7c7f9bc986e6988 drivers/tty/serial/serial_core.c Lukas Wunner    2022-09-22  2588  		else
7c7f9bc986e6988 drivers/tty/serial/serial_core.c Lukas Wunner    2022-09-22  2589  			uart_rs485_config(port);
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2590  
97d97224ff361e0 drivers/serial/serial_core.c     Russell King    2007-09-01  2591  		/*
97d97224ff361e0 drivers/serial/serial_core.c     Russell King    2007-09-01  2592  		 * If this driver supports console, and it hasn't been
97d97224ff361e0 drivers/serial/serial_core.c     Russell King    2007-09-01  2593  		 * successfully registered yet, try to re-register it.
97d97224ff361e0 drivers/serial/serial_core.c     Russell King    2007-09-01  2594  		 * It may be that the port was not available.
97d97224ff361e0 drivers/serial/serial_core.c     Russell King    2007-09-01  2595  		 */
452b9b24754044e drivers/tty/serial/serial_core.c John Ogness     2022-11-16  2596  		if (port->cons && !console_is_registered(port->cons))
97d97224ff361e0 drivers/serial/serial_core.c     Russell King    2007-09-01  2597  			register_console(port->cons);
97d97224ff361e0 drivers/serial/serial_core.c     Russell King    2007-09-01  2598  
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2599  		/*
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2600  		 * Power down all ports by default, except the
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2601  		 * console if we have one.
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2602  		 */
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2603  		if (!uart_console(port))
6f538fe31c1d453 drivers/tty/serial/serial_core.c Linus Walleij   2012-12-07  2604  			uart_change_pm(state, UART_PM_STATE_OFF);
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2605  	}
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2606  }
^1da177e4c3f415 drivers/serial/serial_core.c     Linus Torvalds  2005-04-16  2607  

:::::: The code at line 2574 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
