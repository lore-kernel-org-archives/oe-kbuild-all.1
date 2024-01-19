Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA7946AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 02:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705632105; cv=none; b=L93g83/sUZ6veRYHSHIHBitdXxJ6FrKRYWBwK1Q3fUwJKojdqIjQ7z8sNm7262HnYGV8bpLsjdtnv+/6GGEl856Z8MUNR2bbtOQ+gN8O0icPmw9ijH2hHMHiqckyinqxq+MDK98CJGhLep7d9dDR8uOAsKLck2rkRtjAg96nKew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705632105; c=relaxed/simple;
	bh=UE7Xf0p2HeDDQ/Kf03JkPIh7V4GepJfqefYb1N5c1sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyFtOEDCJ38kk2FglQjWMNX3A7eler56APraU64QtWDO2IIeLz6p4k7EzoChOk67dO312AAMlLND86K2IqXpC0t49EAKfM2OPvjxPDZseQO5Rr7z5jSrIdIZhAfOJUgC13N+tGvBBAjZW1DE4la2oFPCzPdogxiAvM66mBuCtN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IR06nJNj; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IR06nJNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705632103; x=1737168103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UE7Xf0p2HeDDQ/Kf03JkPIh7V4GepJfqefYb1N5c1sg=;
  b=IR06nJNjJwBECG/bE27ErAA4Ch4b3xR0lgCxdzeNsAELKHBPnfdWZQcW
   XzqYgV7PkThuK26fJWkoMutiM/FEu50Ri3J/cF+YOPdtVhPyD0uwEEs9f
   w8pkVipGyFJrCY2erINB6YIjxy0LTOJ3lqhAPDaUocSqj4CNpf9T9QuAv
   PasmNwsagBlcS7DhndGtY4XA6CD8OMHRGDXCehSiIbntCHeAiV6CrjRxo
   eIoqpZ9JpWQx/j9o5M0iwGhDxbBS73RRhRHD/IGABCpG45GRR2k319k1E
   2JWi4plaJAJ/YtigIZv8AuTuk9JdJPkkuqf5+3dFPPda3888whB+Rqs12
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="464913420"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="464913420"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 18:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="904025620"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="904025620"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2024 18:41:40 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQep8-0003XI-1F;
	Fri, 19 Jan 2024 02:41:38 +0000
Date: Fri, 19 Jan 2024 10:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v1 2/2] serial/8250: Avoid getting lock in RT
 atomic context
Message-ID: <202401191038.5JO6ZWNi-lkp@intel.com>
References: <20240116073701.2356171-3-leobras@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240116073701.2356171-3-leobras@redhat.com>

Hi Leonardo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 052d534373b7ed33712a63d5e17b2b6cdbce84fd]

url:    https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/irq-spurious-Reset-irqs_unhandled-if-an-irq_thread-handles-one-IRQ-request/20240116-153933
base:   052d534373b7ed33712a63d5e17b2b6cdbce84fd
patch link:    https://lore.kernel.org/r/20240116073701.2356171-3-leobras%40redhat.com
patch subject: [RESEND RFC PATCH v1 2/2] serial/8250: Avoid getting lock in RT atomic context
config: i386-buildonly-randconfig-001-20240119 (https://download.01.org/0day-ci/archive/20240119/202401191038.5JO6ZWNi-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401191038.5JO6ZWNi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401191038.5JO6ZWNi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_port.c: In function 'serial8250_console_write':
>> drivers/tty/serial/8250/8250_port.c:3401:3: error: expected ')' before 'locked'
      locked = uart_port_trylock_irqsave(port, &flags);
      ^~~~~~
>> drivers/tty/serial/8250/8250_port.c:3474:1: error: expected expression before '}' token
    }
    ^
>> drivers/tty/serial/8250/8250_port.c:3396:6: warning: unused variable 'locked' [-Wunused-variable]
     int locked = 1;
         ^~~~~~
>> drivers/tty/serial/8250/8250_port.c:3395:20: warning: unused variable 'use_fifo' [-Wunused-variable]
     unsigned int ier, use_fifo;
                       ^~~~~~~~
>> drivers/tty/serial/8250/8250_port.c:3395:15: warning: unused variable 'ier' [-Wunused-variable]
     unsigned int ier, use_fifo;
                  ^~~
>> drivers/tty/serial/8250/8250_port.c:3394:16: warning: unused variable 'flags' [-Wunused-variable]
     unsigned long flags;
                   ^~~~~
>> drivers/tty/serial/8250/8250_port.c:3393:20: warning: unused variable 'port' [-Wunused-variable]
     struct uart_port *port = &up->port;
                       ^~~~
>> drivers/tty/serial/8250/8250_port.c:3392:26: warning: unused variable 'em485' [-Wunused-variable]
     struct uart_8250_em485 *em485 = up->em485;
                             ^~~~~
   At top level:
>> drivers/tty/serial/8250/8250_port.c:3357:13: warning: 'serial8250_console_fifo_write' defined but not used [-Wunused-function]
    static void serial8250_console_fifo_write(struct uart_8250_port *up,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_port.c:3328:13: warning: 'serial8250_console_restore' defined but not used [-Wunused-function]
    static void serial8250_console_restore(struct uart_8250_port *up)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_port.c:3317:13: warning: 'serial8250_console_putchar' defined but not used [-Wunused-function]
    static void serial8250_console_putchar(struct uart_port *port, unsigned char ch)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +3401 drivers/tty/serial/8250/8250_port.c

b6830f6df8914f Peter Hurley         2015-06-27  3316  
3f8bab174cb26a Jiri Slaby           2022-03-03 @3317  static void serial8250_console_putchar(struct uart_port *port, unsigned char ch)
b6830f6df8914f Peter Hurley         2015-06-27  3318  {
b6830f6df8914f Peter Hurley         2015-06-27  3319  	struct uart_8250_port *up = up_to_u8250p(port);
b6830f6df8914f Peter Hurley         2015-06-27  3320  
b6830f6df8914f Peter Hurley         2015-06-27  3321  	wait_for_xmitr(up, UART_LSR_THRE);
b6830f6df8914f Peter Hurley         2015-06-27  3322  	serial_port_out(port, UART_TX, ch);
b6830f6df8914f Peter Hurley         2015-06-27  3323  }
b6830f6df8914f Peter Hurley         2015-06-27  3324  
10791233e98fbd Peter Hurley         2015-09-25  3325  /*
10791233e98fbd Peter Hurley         2015-09-25  3326   *	Restore serial console when h/w power-off detected
10791233e98fbd Peter Hurley         2015-09-25  3327   */
10791233e98fbd Peter Hurley         2015-09-25 @3328  static void serial8250_console_restore(struct uart_8250_port *up)
10791233e98fbd Peter Hurley         2015-09-25  3329  {
10791233e98fbd Peter Hurley         2015-09-25  3330  	struct uart_port *port = &up->port;
10791233e98fbd Peter Hurley         2015-09-25  3331  	struct ktermios termios;
10791233e98fbd Peter Hurley         2015-09-25  3332  	unsigned int baud, quot, frac = 0;
10791233e98fbd Peter Hurley         2015-09-25  3333  
10791233e98fbd Peter Hurley         2015-09-25  3334  	termios.c_cflag = port->cons->cflag;
379a33786d489a Pali Rohár           2022-09-24  3335  	termios.c_ispeed = port->cons->ispeed;
379a33786d489a Pali Rohár           2022-09-24  3336  	termios.c_ospeed = port->cons->ospeed;
379a33786d489a Pali Rohár           2022-09-24  3337  	if (port->state->port.tty && termios.c_cflag == 0) {
10791233e98fbd Peter Hurley         2015-09-25  3338  		termios.c_cflag = port->state->port.tty->termios.c_cflag;
379a33786d489a Pali Rohár           2022-09-24  3339  		termios.c_ispeed = port->state->port.tty->termios.c_ispeed;
379a33786d489a Pali Rohár           2022-09-24  3340  		termios.c_ospeed = port->state->port.tty->termios.c_ospeed;
379a33786d489a Pali Rohár           2022-09-24  3341  	}
10791233e98fbd Peter Hurley         2015-09-25  3342  
10791233e98fbd Peter Hurley         2015-09-25  3343  	baud = serial8250_get_baud_rate(port, &termios, NULL);
6101be86cb1c46 Jisheng Zhang        2018-07-04  3344  	quot = serial8250_get_divisor(port, baud, &frac);
10791233e98fbd Peter Hurley         2015-09-25  3345  
10791233e98fbd Peter Hurley         2015-09-25  3346  	serial8250_set_divisor(port, baud, quot, frac);
10791233e98fbd Peter Hurley         2015-09-25  3347  	serial_port_out(port, UART_LCR, up->lcr);
6e6eebdf5e2455 Maciej W. Rozycki    2022-04-18  3348  	serial8250_out_MCR(up, up->mcr | UART_MCR_DTR | UART_MCR_RTS);
10791233e98fbd Peter Hurley         2015-09-25  3349  }
10791233e98fbd Peter Hurley         2015-09-25  3350  
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3351  /*
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3352   * Print a string to the serial port using the device FIFO
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3353   *
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3354   * It sends fifosize bytes and then waits for the fifo
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3355   * to get empty.
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3356   */
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11 @3357  static void serial8250_console_fifo_write(struct uart_8250_port *up,
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3358  					  const char *s, unsigned int count)
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3359  {
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3360  	int i;
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3361  	const char *end = s + count;
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3362  	unsigned int fifosize = up->tx_loadsz;
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3363  	bool cr_sent = false;
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3364  
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3365  	while (s != end) {
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3366  		wait_for_lsr(up, UART_LSR_THRE);
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3367  
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3368  		for (i = 0; i < fifosize && s != end; ++i) {
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3369  			if (*s == '\n' && !cr_sent) {
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3370  				serial_out(up, UART_TX, '\r');
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3371  				cr_sent = true;
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3372  			} else {
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3373  				serial_out(up, UART_TX, *s++);
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3374  				cr_sent = false;
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3375  			}
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3376  		}
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3377  	}
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3378  }
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3379  
b6830f6df8914f Peter Hurley         2015-06-27  3380  /*
b6830f6df8914f Peter Hurley         2015-06-27  3381   *	Print a string to the serial port trying not to disturb
b6830f6df8914f Peter Hurley         2015-06-27  3382   *	any possible real use of the port...
b6830f6df8914f Peter Hurley         2015-06-27  3383   *
b6830f6df8914f Peter Hurley         2015-06-27  3384   *	The console_lock must be held when we get here.
bedb404e91bb29 Andy Shevchenko      2020-02-17  3385   *
bedb404e91bb29 Andy Shevchenko      2020-02-17  3386   *	Doing runtime PM is really a bad idea for the kernel console.
bedb404e91bb29 Andy Shevchenko      2020-02-17  3387   *	Thus, we assume the function is called when device is powered up.
b6830f6df8914f Peter Hurley         2015-06-27  3388   */
b6830f6df8914f Peter Hurley         2015-06-27  3389  void serial8250_console_write(struct uart_8250_port *up, const char *s,
b6830f6df8914f Peter Hurley         2015-06-27  3390  			      unsigned int count)
b6830f6df8914f Peter Hurley         2015-06-27  3391  {
7f9803072ff636 Lukas Wunner         2020-02-28 @3392  	struct uart_8250_em485 *em485 = up->em485;
b6830f6df8914f Peter Hurley         2015-06-27 @3393  	struct uart_port *port = &up->port;
b6830f6df8914f Peter Hurley         2015-06-27 @3394  	unsigned long flags;
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11 @3395  	unsigned int ier, use_fifo;
b6830f6df8914f Peter Hurley         2015-06-27 @3396  	int locked = 1;
b6830f6df8914f Peter Hurley         2015-06-27  3397  
b6830f6df8914f Peter Hurley         2015-06-27  3398  	touch_nmi_watchdog();
b6830f6df8914f Peter Hurley         2015-06-27  3399  
5194c99b116191 Leonardo Bras        2024-01-16  3400  	if (oops_in_progress || (IS_ENABLED(CONFIG_PREEMPT_RT) && in_atomic())
e8f87d3c335702 Thomas Gleixner      2023-09-14 @3401  		locked = uart_port_trylock_irqsave(port, &flags);
b6830f6df8914f Peter Hurley         2015-06-27  3402  	else
e8f87d3c335702 Thomas Gleixner      2023-09-14  3403  		uart_port_lock_irqsave(port, &flags);
b6830f6df8914f Peter Hurley         2015-06-27  3404  
b6830f6df8914f Peter Hurley         2015-06-27  3405  	/*
b6830f6df8914f Peter Hurley         2015-06-27  3406  	 *	First save the IER then disable the interrupts
b6830f6df8914f Peter Hurley         2015-06-27  3407  	 */
b6830f6df8914f Peter Hurley         2015-06-27  3408  	ier = serial_port_in(port, UART_IER);
a3911f6ea5542d Ilpo Järvinen        2022-08-16  3409  	serial8250_clear_IER(up);
b6830f6df8914f Peter Hurley         2015-06-27  3410  
b6830f6df8914f Peter Hurley         2015-06-27  3411  	/* check scratch reg to see if port powered off during system sleep */
b6830f6df8914f Peter Hurley         2015-06-27  3412  	if (up->canary && (up->canary != serial_port_in(port, UART_SCR))) {
10791233e98fbd Peter Hurley         2015-09-25  3413  		serial8250_console_restore(up);
b6830f6df8914f Peter Hurley         2015-06-27  3414  		up->canary = 0;
b6830f6df8914f Peter Hurley         2015-06-27  3415  	}
b6830f6df8914f Peter Hurley         2015-06-27  3416  
7f9803072ff636 Lukas Wunner         2020-02-28  3417  	if (em485) {
7f9803072ff636 Lukas Wunner         2020-02-28  3418  		if (em485->tx_stopped)
7f9803072ff636 Lukas Wunner         2020-02-28  3419  			up->rs485_start_tx(up);
7f9803072ff636 Lukas Wunner         2020-02-28  3420  		mdelay(port->rs485.delay_rts_before_send);
7f9803072ff636 Lukas Wunner         2020-02-28  3421  	}
7f9803072ff636 Lukas Wunner         2020-02-28  3422  
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3423  	use_fifo = (up->capabilities & UART_CAP_FIFO) &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3424  		/*
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3425  		 * BCM283x requires to check the fifo
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3426  		 * after each byte.
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3427  		 */
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3428  		!(up->capabilities & UART_CAP_MINI) &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3429  		/*
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3430  		 * tx_loadsz contains the transmit fifo size
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3431  		 */
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3432  		up->tx_loadsz > 1 &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3433  		(up->fcr & UART_FCR_ENABLE_FIFO) &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3434  		port->state &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3435  		test_bit(TTY_PORT_INITIALIZED, &port->state->port.iflags) &&
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3436  		/*
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3437  		 * After we put a data in the fifo, the controller will send
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3438  		 * it regardless of the CTS state. Therefore, only use fifo
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3439  		 * if we don't use control flow.
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3440  		 */
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3441  		!(up->port.flags & UPF_CONS_FLOW);
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3442  
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3443  	if (likely(use_fifo))
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3444  		serial8250_console_fifo_write(up, s, count);
8f3631f0f6eb42 Wander Lairson Costa 2022-04-11  3445  	else
b6830f6df8914f Peter Hurley         2015-06-27  3446  		uart_console_write(port, s, count, serial8250_console_putchar);
b6830f6df8914f Peter Hurley         2015-06-27  3447  
b6830f6df8914f Peter Hurley         2015-06-27  3448  	/*
b6830f6df8914f Peter Hurley         2015-06-27  3449  	 *	Finally, wait for transmitter to become empty
b6830f6df8914f Peter Hurley         2015-06-27  3450  	 *	and restore the IER
b6830f6df8914f Peter Hurley         2015-06-27  3451  	 */
34619de1b8cb52 Ilpo Järvinen        2022-06-24  3452  	wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
b6830f6df8914f Peter Hurley         2015-06-27  3453  
7f9803072ff636 Lukas Wunner         2020-02-28  3454  	if (em485) {
4e36f94e996ebe Lukas Wunner         2020-03-27  3455  		mdelay(port->rs485.delay_rts_after_send);
7f9803072ff636 Lukas Wunner         2020-02-28  3456  		if (em485->tx_stopped)
7f9803072ff636 Lukas Wunner         2020-02-28  3457  			up->rs485_stop_tx(up);
7f9803072ff636 Lukas Wunner         2020-02-28  3458  	}
7f9803072ff636 Lukas Wunner         2020-02-28  3459  
8d5b305484e8a3 Lukas Wunner         2020-03-27  3460  	serial_port_out(port, UART_IER, ier);
8d5b305484e8a3 Lukas Wunner         2020-03-27  3461  
b6830f6df8914f Peter Hurley         2015-06-27  3462  	/*
b6830f6df8914f Peter Hurley         2015-06-27  3463  	 *	The receive handling will happen properly because the
b6830f6df8914f Peter Hurley         2015-06-27  3464  	 *	receive ready bit will still be set; it is not cleared
b6830f6df8914f Peter Hurley         2015-06-27  3465  	 *	on read.  However, modem control will not, we must
b6830f6df8914f Peter Hurley         2015-06-27  3466  	 *	call it if we have saved something in the saved flags
b6830f6df8914f Peter Hurley         2015-06-27  3467  	 *	while processing with interrupts off.
b6830f6df8914f Peter Hurley         2015-06-27  3468  	 */
b6830f6df8914f Peter Hurley         2015-06-27  3469  	if (up->msr_saved_flags)
b6830f6df8914f Peter Hurley         2015-06-27  3470  		serial8250_modem_status(up);
b6830f6df8914f Peter Hurley         2015-06-27  3471  
b6830f6df8914f Peter Hurley         2015-06-27  3472  	if (locked)
e8f87d3c335702 Thomas Gleixner      2023-09-14  3473  		uart_port_unlock_irqrestore(port, flags);
b6830f6df8914f Peter Hurley         2015-06-27 @3474  }
b6830f6df8914f Peter Hurley         2015-06-27  3475  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
