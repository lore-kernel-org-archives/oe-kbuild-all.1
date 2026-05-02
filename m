Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C82819F121
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 13:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777727711; cv=none; b=HzgalsPqpiFkK1JkFcNl7jIRfP2/+pJNuu3fUWAOK7LyBGSd+cAzXvJ2eRcYTyK4l4n5uAgsoOqJDa5XT2yVbLa963HIDvwWHpKSa5VyRHKONp5ntMUur9fqi1wUQrv57NVYqIs1fkgLgFK62gU9PWb0WIPvPHAem/627OcVB9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777727711; c=relaxed/simple;
	bh=b3Sw0P0LIpCLaWkyms2mQt71JXn0jIdLD99z82FaHpw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CRMY+vcryaHSNg0BRZtgBOE6Z6yVY9E5dHBHMMhYwI9TomTt9v2FqeLe/wxH8uUONpBcMgNg6HQuxDyWbZgGwtSDDlYD9hZkX/YdfQfxgDAuVllyiVwaA8x5qxKXEnGSatjJuiSnMymE/mPhqoFlFE5fybHiGJfIvoLtZx7wDOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8mElOjN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8mElOjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777727709; x=1809263709;
  h=date:from:to:cc:subject:message-id;
  bh=b3Sw0P0LIpCLaWkyms2mQt71JXn0jIdLD99z82FaHpw=;
  b=B8mElOjNsCwkBi9L/hZGUYKVDUD3l+sqOQP+GuSnD4M0gz29kappPeyc
   S3doEshZBgAAYeQCpSu8eyyTqKKvFy576/ijMDF0lCjnETz9vFbIw/p9p
   SYlBiQWndBSD9h25/ZKSLHysV8dibbAYzB0xy0vLSL709K7v3cgd3kfdh
   h3HS1cNoMJcVJxdDDmCDZe5wHoUEs9JvHvI64dCl7PbG97wyQ0BagcBA6
   9qdnIfCtZi04h7RviY3RARaJ458csehdrN6rMV71MdsSdXQ/PwTloWr8u
   fP5OQqkozk9hPTBU8/3Q4ax1h/a5+b++tyjj269ScNNRcqcA7cWX1iJla
   Q==;
X-CSE-ConnectionGUID: EzkSQGU+RGSPj8qECP3jzA==
X-CSE-MsgGUID: Af9klxcqTcKZPG7wZ6NUJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78655320"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="78655320"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 06:15:09 -0700
X-CSE-ConnectionGUID: fjmGk0E8Qtq14s4I6cSpkA==
X-CSE-MsgGUID: utrmwyXCR/C1Md0lJsib7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="258449909"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 May 2026 06:15:07 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJABV-000000001Pp-0jHj;
	Sat, 02 May 2026 13:15:05 +0000
Date: Sat, 02 May 2026 21:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/glink 55/56]
 drivers/tty/serial/amba-pl011.c:2696:1: warning:
 'pl011_console_device_unlock' defined but not used
Message-ID: <202605022158.egcBpISI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/glink
head:   5d897d0f6b0bbd170ef332eeae9a8329ec812a5e
commit: 4c95e8d4466c51c2d2d6de2790f3988413b21730 [55/56] hexagon: fix PL011 console support on QEMU virt machine
config: arm-randconfig-002 (https://download.01.org/0day-ci/archive/20260502/202605022158.egcBpISI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605022158.egcBpISI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605022158.egcBpISI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/amba-pl011.c:2696:1: warning: 'pl011_console_device_unlock' defined but not used [-Wunused-function]
    2696 | pl011_console_device_unlock(struct console *co, unsigned long flags)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/amba-pl011.c:2690:1: warning: 'pl011_console_device_lock' defined but not used [-Wunused-function]
    2690 | pl011_console_device_lock(struct console *co, unsigned long *flags)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/amba-pl011.c:2646:1: warning: 'pl011_console_write_thread' defined but not used [-Wunused-function]
    2646 | pl011_console_write_thread(struct console *co, struct nbcon_write_context *wctxt)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/amba-pl011.c:2614:1: warning: 'pl011_console_write_atomic' defined but not used [-Wunused-function]
    2614 | pl011_console_write_atomic(struct console *co, struct nbcon_write_context *wctxt)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pl011_console_device_unlock +2696 drivers/tty/serial/amba-pl011.c

4c95e8d4466c51 Brian Cain     2026-03-10  2612  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2613  static void
2eb2608618ce58 Toshiyuki Sato 2025-02-04 @2614  pl011_console_write_atomic(struct console *co, struct nbcon_write_context *wctxt)
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2615  {
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2616  	struct uart_amba_port *uap = amba_ports[co->index];
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2617  	unsigned int old_cr = 0;
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2618  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2619  	if (!nbcon_enter_unsafe(wctxt))
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2620  		return;
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2621  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2622  	clk_enable(uap->clk);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2623  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2624  	if (!uap->vendor->always_enabled) {
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2625  		old_cr = pl011_read(uap, REG_CR);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2626  		pl011_write((old_cr & ~UART011_CR_CTSEN) | (UART01x_CR_UARTEN | UART011_CR_TXE),
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2627  				uap, REG_CR);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2628  	}
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2629  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2630  	if (!uap->console_line_ended)
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2631  		uart_console_write(&uap->port, "\n", 1, pl011_console_putchar);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2632  	uart_console_write(&uap->port, wctxt->outbuf, wctxt->len, pl011_console_putchar);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2633  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2634  	while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2635  		cpu_relax();
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2636  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2637  	if (!uap->vendor->always_enabled)
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2638  		pl011_write(old_cr, uap, REG_CR);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2639  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2640  	clk_disable(uap->clk);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2641  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2642  	nbcon_exit_unsafe(wctxt);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2643  }
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2644  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2645  static void
2eb2608618ce58 Toshiyuki Sato 2025-02-04 @2646  pl011_console_write_thread(struct console *co, struct nbcon_write_context *wctxt)
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2647  {
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2648  	struct uart_amba_port *uap = amba_ports[co->index];
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2649  	unsigned int old_cr = 0;
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2650  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2651  	if (!nbcon_enter_unsafe(wctxt))
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2652  		return;
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2653  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2654  	clk_enable(uap->clk);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2655  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2656  	if (!uap->vendor->always_enabled) {
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2657  		old_cr = pl011_read(uap, REG_CR);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2658  		pl011_write((old_cr & ~UART011_CR_CTSEN) | (UART01x_CR_UARTEN | UART011_CR_TXE),
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2659  				uap, REG_CR);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2660  	}
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2661  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2662  	if (nbcon_exit_unsafe(wctxt)) {
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2663  		int i;
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2664  		unsigned int len = READ_ONCE(wctxt->len);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2665  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2666  		for (i = 0; i < len; i++) {
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2667  			if (!nbcon_enter_unsafe(wctxt))
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2668  				break;
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2669  			uart_console_write(&uap->port, wctxt->outbuf + i, 1, pl011_console_putchar);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2670  			if (!nbcon_exit_unsafe(wctxt))
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2671  				break;
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2672  		}
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2673  	}
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2674  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2675  	while (!nbcon_enter_unsafe(wctxt))
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2676  		nbcon_reacquire_nobuf(wctxt);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2677  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2678  	while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2679  		cpu_relax();
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2680  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2681  	if (!uap->vendor->always_enabled)
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2682  		pl011_write(old_cr, uap, REG_CR);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2683  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2684  	clk_disable(uap->clk);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2685  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2686  	nbcon_exit_unsafe(wctxt);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2687  }
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2688  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2689  static void
2eb2608618ce58 Toshiyuki Sato 2025-02-04 @2690  pl011_console_device_lock(struct console *co, unsigned long *flags)
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2691  {
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2692  	__uart_port_lock_irqsave(&amba_ports[co->index]->port, flags);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2693  }
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2694  
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2695  static void
2eb2608618ce58 Toshiyuki Sato 2025-02-04 @2696  pl011_console_device_unlock(struct console *co, unsigned long flags)
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2697  {
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2698  	__uart_port_unlock_irqrestore(&amba_ports[co->index]->port, flags);
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2699  }
2eb2608618ce58 Toshiyuki Sato 2025-02-04  2700  

:::::: The code at line 2696 was first introduced by commit
:::::: 2eb2608618ce5878e11bbe68cc8d2699c8f3a81a serial: amba-pl011: Implement nbcon console

:::::: TO: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
