Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368BA3FD4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 01:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725760021; cv=none; b=O+4cyHYfn+/kHtzYQYKsZ6/IuXLRQUBaEnfrB75LS977Wgq27Nje3007TM9H+cWbZll8oht6iJzis2d0T/PmtjbUfI5Fwut8beg2MG8RUjoDYxsosBgDRN67y3CLjFo3smRBpmgFPqN8ttP4mytZgYa1DdwDoMLXYIbFQj/SO+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725760021; c=relaxed/simple;
	bh=X25zb3aYnHUyTzfz2NRFfZxvZMcNSehF4moXtVPaJuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCnobNouq7MHBDUexs8MUhntXIXnuU5G5MTwku4yLezzgwPQF5PCh8VxL3EODZiqbrLV3jjdv8rkyY4xqbTaA+awDYi210cSrlO3/YEVYhZTQY8HPAfmOqnc18j8Wu853rKhkbOw/2nn7uIyTBn5I1epAPDOUt6/NMYIX102/Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3+n+7B+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3+n+7B+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725760019; x=1757296019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X25zb3aYnHUyTzfz2NRFfZxvZMcNSehF4moXtVPaJuU=;
  b=X3+n+7B+5Lvz027nZwEdWNEjhIa3xxqnpheTCaU18yEiyRp3ILRtlpa1
   nanwIUePseNKVuyeGHlrHrvZ78Np3qQQcL8f/2XsGeeDoLZXqLS/7WDbt
   On+zq28bllW3074fifwtFTowiE4xjkkNelCZUIB5G+lych8stZm6fWmJn
   Pvb6x3Q+4GAz5rtcqI8XqydKtML60MdJah9KfVAsJAiW4Ji2mUzYLcNTB
   k/f33vLN5JRnBWcCuomJOs6P+Npm9O4fi7EwTYMR9oLatnuOmQMO982qb
   vhtMz5OjH68gJTZdcWxeiFtRjop+VIMyBXqf5Aj4O5HipG3+3IW1D/qkN
   g==;
X-CSE-ConnectionGUID: 4e0XPvP+R3KBNcP1JPG14g==
X-CSE-MsgGUID: hRIbpD7uS6q/MDuJw8ZpwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="27404125"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="27404125"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 18:46:59 -0700
X-CSE-ConnectionGUID: gmNNcmVyQ2eq2T17hb2TSA==
X-CSE-MsgGUID: 0HRf5rqtQmGuYzd0IJ92UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="89587092"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Sep 2024 18:46:58 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn70x-000DCF-2M;
	Sun, 08 Sep 2024 01:46:55 +0000
Date: Sun, 8 Sep 2024 09:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH next v1 1/2] serial: 8250: Switch to nbcon console
Message-ID: <202409080947.VYdltLWR-lkp@intel.com>
References: <20240905134719.142554-2-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905134719.142554-2-john.ogness@linutronix.de>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on f1ec92a066b2608e7c971dfce28ebe2d2cdb056e]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ogness/serial-8250-Switch-to-nbcon-console/20240905-214915
base:   f1ec92a066b2608e7c971dfce28ebe2d2cdb056e
patch link:    https://lore.kernel.org/r/20240905134719.142554-2-john.ogness%40linutronix.de
patch subject: [PATCH next v1 1/2] serial: 8250: Switch to nbcon console
config: x86_64-randconfig-003-20240908 (https://download.01.org/0day-ci/archive/20240908/202409080947.VYdltLWR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080947.VYdltLWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080947.VYdltLWR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_core.c: In function 'univ8250_console_device_lock':
>> drivers/tty/serial/8250/8250_core.c:420:9: error: implicit declaration of function '__uart_port_lock_irqsave'; did you mean 'uart_port_lock_irqsave'? [-Werror=implicit-function-declaration]
     420 |         __uart_port_lock_irqsave(up, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         uart_port_lock_irqsave
   drivers/tty/serial/8250/8250_core.c: In function 'univ8250_console_device_unlock':
>> drivers/tty/serial/8250/8250_core.c:427:9: error: implicit declaration of function '__uart_port_unlock_irqrestore'; did you mean 'uart_port_unlock_irqrestore'? [-Werror=implicit-function-declaration]
     427 |         __uart_port_unlock_irqrestore(up, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         uart_port_unlock_irqrestore
   drivers/tty/serial/8250/8250_core.c: At top level:
>> drivers/tty/serial/8250/8250_core.c:533:27: error: initialization of 'bool (*)(struct console *, struct nbcon_write_context *)' {aka '_Bool (*)(struct console *, struct nbcon_write_context *)'} from incompatible pointer type 'void (*)(struct console *, struct nbcon_write_context *)' [-Werror=incompatible-pointer-types]
     533 |         .write_atomic   = univ8250_console_write_atomic,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c:533:27: note: (near initialization for 'univ8250_console.write_atomic')
>> drivers/tty/serial/8250/8250_core.c:534:10: error: 'struct console' has no member named 'write_thread'
     534 |         .write_thread   = univ8250_console_write_thread,
         |          ^~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_core.c:534:27: warning: initialization of 'int' from 'void (*)(struct console *, struct nbcon_write_context *)' makes integer from pointer without a cast [-Wint-conversion]
     534 |         .write_thread   = univ8250_console_write_thread,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c:534:27: note: (near initialization for 'univ8250_console.nbcon_state.counter')
>> drivers/tty/serial/8250/8250_core.c:534:27: error: initializer element is not computable at load time
   drivers/tty/serial/8250/8250_core.c:534:27: note: (near initialization for 'univ8250_console.nbcon_state.counter')
>> drivers/tty/serial/8250/8250_core.c:535:10: error: 'struct console' has no member named 'device_lock'
     535 |         .device_lock    = univ8250_console_device_lock,
         |          ^~~~~~~~~~~
>> drivers/tty/serial/8250/8250_core.c:535:27: warning: initialization of 'long long int' from 'void (*)(struct console *, long unsigned int *)' makes integer from pointer without a cast [-Wint-conversion]
     535 |         .device_lock    = univ8250_console_device_lock,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c:535:27: note: (near initialization for 'univ8250_console.nbcon_seq.counter')
>> drivers/tty/serial/8250/8250_core.c:536:10: error: 'struct console' has no member named 'device_unlock'
     536 |         .device_unlock  = univ8250_console_device_unlock,
         |          ^~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_core.c:536:27: error: initialization of 'struct printk_buffers *' from incompatible pointer type 'void (*)(struct console *, long unsigned int)' [-Werror=incompatible-pointer-types]
     536 |         .device_unlock  = univ8250_console_device_unlock,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c:536:27: note: (near initialization for 'univ8250_console.pbufs')
>> drivers/tty/serial/8250/8250_core.c:527:42: warning: missing braces around initializer [-Wmissing-braces]
     527 | static struct console univ8250_console = {
         |                                          ^
   ......
     534 |         .write_thread   = univ8250_console_write_thread,
         |                           {                            }
     535 |         .device_lock    = univ8250_console_device_lock,
         |                           {                           }
   cc1: some warnings being treated as errors
--
   drivers/tty/serial/8250/8250_port.c: In function 'serial8250_console_write_thread':
>> drivers/tty/serial/8250/8250_port.c:3502:17: error: implicit declaration of function 'nbcon_reacquire_nobuf' [-Werror=implicit-function-declaration]
    3502 |                 nbcon_reacquire_nobuf(wctxt);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +420 drivers/tty/serial/8250/8250_core.c

   415	
   416	static void univ8250_console_device_lock(struct console *con, unsigned long *flags)
   417	{
   418		struct uart_port *up = &serial8250_ports[con->index].port;
   419	
 > 420		__uart_port_lock_irqsave(up, flags);
   421	}
   422	
   423	static void univ8250_console_device_unlock(struct console *con, unsigned long flags)
   424	{
   425		struct uart_port *up = &serial8250_ports[con->index].port;
   426	
 > 427		__uart_port_unlock_irqrestore(up, flags);
   428	}
   429	#endif /* USE_SERIAL_8250_LEGACY_CONSOLE */
   430	
   431	static int univ8250_console_setup(struct console *co, char *options)
   432	{
   433		struct uart_8250_port *up;
   434		struct uart_port *port;
   435		int retval, i;
   436	
   437		/*
   438		 * Check whether an invalid uart number has been specified, and
   439		 * if so, search for the first available port that does have
   440		 * console support.
   441		 */
   442		if (co->index < 0 || co->index >= UART_NR)
   443			co->index = 0;
   444	
   445		/*
   446		 * If the console is past the initial isa ports, init more ports up to
   447		 * co->index as needed and increment nr_uarts accordingly.
   448		 */
   449		for (i = nr_uarts; i <= co->index; i++) {
   450			up = serial8250_setup_port(i);
   451			if (!up)
   452				return -ENODEV;
   453			nr_uarts++;
   454		}
   455	
   456		port = &serial8250_ports[co->index].port;
   457		/* link port to console */
   458		port->cons = co;
   459	
   460		retval = serial8250_console_setup(port, options, false);
   461		if (retval != 0)
   462			port->cons = NULL;
   463		return retval;
   464	}
   465	
   466	static int univ8250_console_exit(struct console *co)
   467	{
   468		struct uart_port *port;
   469	
   470		port = &serial8250_ports[co->index].port;
   471		return serial8250_console_exit(port);
   472	}
   473	
   474	/**
   475	 *	univ8250_console_match - non-standard console matching
   476	 *	@co:	  registering console
   477	 *	@name:	  name from console command line
   478	 *	@idx:	  index from console command line
   479	 *	@options: ptr to option string from console command line
   480	 *
   481	 *	Only attempts to match console command lines of the form:
   482	 *	    console=uart[8250],io|mmio|mmio16|mmio32,<addr>[,<options>]
   483	 *	    console=uart[8250],0x<addr>[,<options>]
   484	 *	This form is used to register an initial earlycon boot console and
   485	 *	replace it with the serial8250_console at 8250 driver init.
   486	 *
   487	 *	Performs console setup for a match (as required by interface)
   488	 *	If no <options> are specified, then assume the h/w is already setup.
   489	 *
   490	 *	Returns 0 if console matches; otherwise non-zero to use default matching
   491	 */
   492	static int univ8250_console_match(struct console *co, char *name, int idx,
   493					  char *options)
   494	{
   495		char match[] = "uart";	/* 8250-specific earlycon name */
   496		unsigned char iotype;
   497		resource_size_t addr;
   498		int i;
   499	
   500		if (strncmp(name, match, 4) != 0)
   501			return -ENODEV;
   502	
   503		if (uart_parse_earlycon(options, &iotype, &addr, &options))
   504			return -ENODEV;
   505	
   506		/* try to match the port specified on the command line */
   507		for (i = 0; i < nr_uarts; i++) {
   508			struct uart_port *port = &serial8250_ports[i].port;
   509	
   510			if (port->iotype != iotype)
   511				continue;
   512			if ((iotype == UPIO_MEM || iotype == UPIO_MEM16 ||
   513			     iotype == UPIO_MEM32 || iotype == UPIO_MEM32BE)
   514			    && (port->mapbase != addr))
   515				continue;
   516			if (iotype == UPIO_PORT && port->iobase != addr)
   517				continue;
   518	
   519			co->index = i;
   520			port->cons = co;
   521			return serial8250_console_setup(port, options, true);
   522		}
   523	
   524		return -ENODEV;
   525	}
   526	
 > 527	static struct console univ8250_console = {
   528		.name		= "ttyS",
   529	#ifdef USE_SERIAL_8250_LEGACY_CONSOLE
   530		.write		= univ8250_console_write,
   531		.flags		= CON_PRINTBUFFER | CON_ANYTIME,
   532	#else
 > 533		.write_atomic	= univ8250_console_write_atomic,
 > 534		.write_thread	= univ8250_console_write_thread,
 > 535		.device_lock	= univ8250_console_device_lock,
 > 536		.device_unlock	= univ8250_console_device_unlock,
   537		.flags		= CON_PRINTBUFFER | CON_ANYTIME | CON_NBCON,
   538	#endif
   539		.device		= uart_console_device,
   540		.setup		= univ8250_console_setup,
   541		.exit		= univ8250_console_exit,
   542		.match		= univ8250_console_match,
   543		.index		= -1,
   544		.data		= &serial8250_reg,
   545	};
   546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
