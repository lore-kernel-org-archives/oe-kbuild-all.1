Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6239B3328F7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 18:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767810076; cv=none; b=qVWH7PMIVcLSse7HCjgi8qk3WriFZCosu7rAXg8d53xsbpjX9t9kV66Hh+l+IehSkdWGdLql0ICtd0SGLagKna6zkrNPpzlGAxhFCmM/doJqWj/FSLFun1LP/zP2cEDqpTTXvSjfUWL1qV0VlvVu+KOCbuU51S2aBVHU2JoKe9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767810076; c=relaxed/simple;
	bh=WJdrrXXFlZV6S7Z0M8LZ5vPfa+xn6eUI1tw9uUPmoJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KVeAgY+y0RjqFmhIkPhwzGAf12un2nlT/jUsuCoh4nnicF7tweTO2aPqhIbxxy+Y6FPMsZHN05PSCrRyFNEt3raWTVHqNNqUZ4sFTmYY6dXPzN7TRq4rgElQjBbR/1K7NTAQjrRhUCJkeYJaAA8y3Gtbxaz5kpjaZZLx1a6RW2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qs/v7o1+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qs/v7o1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767810074; x=1799346074;
  h=date:from:to:cc:subject:message-id;
  bh=WJdrrXXFlZV6S7Z0M8LZ5vPfa+xn6eUI1tw9uUPmoJc=;
  b=Qs/v7o1+c/WkAjhxXIVOaw+AON2eG3nqud+toSHutD3Nix0cz32LWLbr
   3j8BMqBPwp/BCOuhp0Iv2Vl+dKZUYDcJEjCDdMcaFhfWF/iw5QCMf+U7P
   kbYTRfJj48pXMCiJ1KLxQBY+IhuuR5G4A+berkCmuZYyppNGGGik8F1nR
   69goa4xkECobSZr1R5QkOETVdIH7TzKLebZqol46kDgftk9SH95DP8Cgu
   UPYxWltWBrZBal1rNvF3fCe7AdkRcU4qQwfwYc+WA3VVfkeqqeAWE7es1
   1H5MHiqY6mFbK3J0Zfq2Un4oF//PZTTTR2GZDCfWF1UYPKpvP7ad+p63I
   A==;
X-CSE-ConnectionGUID: H74Z1JXxSqSm0jTS8Jbdog==
X-CSE-MsgGUID: Jfi/DWQsRJqz4VLjyyFUMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69085564"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="69085564"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 10:21:12 -0800
X-CSE-ConnectionGUID: CGVBnhS2Tz6Uddijv//zsw==
X-CSE-MsgGUID: 2RvkSQ2LRz2J/cwdH5NnFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="202197288"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Jan 2026 10:21:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdY9b-0000000043N-3oAH;
	Wed, 07 Jan 2026 18:21:07 +0000
Date: Thu, 08 Jan 2026 02:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 10/10]
 drivers/tty/serial/xilinx_uartps.c:438:25: sparse: sparse: dereference of
 noderef expression
Message-ID: <202601080205.PiFUdOjj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   2dc192c6a328240368616b0f08864c8e7a35abb6
commit: 1c79063b436b437afd074eb39f2374b27ac91aa2 [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: nios2-randconfig-r132-20260107 (https://download.01.org/0day-ci/archive/20260108/202601080205.PiFUdOjj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601080205.PiFUdOjj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601080205.PiFUdOjj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/xilinx_uartps.c:438:25: sparse: sparse: dereference of noderef expression

vim +438 drivers/tty/serial/xilinx_uartps.c

fccc9d9233f918 Manikanta Guntupalli 2024-01-23  418  
74231ab6cc2d02 Manikanta Guntupalli 2024-01-23  419  /**
74231ab6cc2d02 Manikanta Guntupalli 2024-01-23  420   * cdns_uart_handle_tx - Handle the bytes to be transmitted.
c8dbdc842d3061 Anirudha Sarangi     2016-09-22  421   * @dev_id: Id of the UART port
c8dbdc842d3061 Anirudha Sarangi     2016-09-22  422   * Return: None
c8dbdc842d3061 Anirudha Sarangi     2016-09-22  423   */
c8dbdc842d3061 Anirudha Sarangi     2016-09-22  424  static void cdns_uart_handle_tx(void *dev_id)
07986580d0ad14 Soren Brinkmann      2016-01-11  425  {
c8dbdc842d3061 Anirudha Sarangi     2016-09-22  426  	struct uart_port *port = (struct uart_port *)dev_id;
fccc9d9233f918 Manikanta Guntupalli 2024-01-23  427  	struct cdns_uart *cdns_uart = port->private_data;
1788cf6a91d9fa Jiri Slaby (SUSE     2024-04-05  428) 	struct tty_port *tport = &port->state->port;
07986580d0ad14 Soren Brinkmann      2016-01-11  429  	unsigned int numbytes;
1788cf6a91d9fa Jiri Slaby (SUSE     2024-04-05  430) 	unsigned char ch;
267ee93c417e68 j.turek              2025-12-21  431  	ktime_t rts_delay;
07986580d0ad14 Soren Brinkmann      2016-01-11  432  
1788cf6a91d9fa Jiri Slaby (SUSE     2024-04-05  433) 	if (kfifo_is_empty(&tport->xmit_fifo) || uart_tx_stopped(port)) {
74231ab6cc2d02 Manikanta Guntupalli 2024-01-23  434  		/* Disable the TX Empty interrupt */
07986580d0ad14 Soren Brinkmann      2016-01-11  435  		writel(CDNS_UART_IXR_TXEMPTY, port->membase + CDNS_UART_IDR);
267ee93c417e68 j.turek              2025-12-21  436  		/* Set RTS line after delay */
267ee93c417e68 j.turek              2025-12-21  437  		if (cdns_uart->port->rs485.flags & SER_RS485_ENABLED) {
267ee93c417e68 j.turek              2025-12-21 @438  			cdns_uart->tx_timer.function = &cdns_rs485_rx_callback;
267ee93c417e68 j.turek              2025-12-21  439  			rts_delay = ns_to_ktime(cdns_calc_after_tx_delay(cdns_uart));
267ee93c417e68 j.turek              2025-12-21  440  			hrtimer_start(&cdns_uart->tx_timer, rts_delay, HRTIMER_MODE_REL);
267ee93c417e68 j.turek              2025-12-21  441  		}
a28ef75816fcce Jiri Slaby           2022-04-21  442  		return;
a28ef75816fcce Jiri Slaby           2022-04-21  443  	}
a28ef75816fcce Jiri Slaby           2022-04-21  444  
07986580d0ad14 Soren Brinkmann      2016-01-11  445  	numbytes = port->fifosize;
1788cf6a91d9fa Jiri Slaby (SUSE     2024-04-05  446) 	while (numbytes &&
1788cf6a91d9fa Jiri Slaby (SUSE     2024-04-05  447) 	       !(readl(port->membase + CDNS_UART_SR) & CDNS_UART_SR_TXFULL) &&
1788cf6a91d9fa Jiri Slaby (SUSE     2024-04-05  448) 	       uart_fifo_get(port, &ch)) {
1788cf6a91d9fa Jiri Slaby (SUSE     2024-04-05  449) 		writel(ch, port->membase + CDNS_UART_FIFO);
07986580d0ad14 Soren Brinkmann      2016-01-11  450  		numbytes--;
07986580d0ad14 Soren Brinkmann      2016-01-11  451  	}
07986580d0ad14 Soren Brinkmann      2016-01-11  452  
1788cf6a91d9fa Jiri Slaby (SUSE     2024-04-05  453) 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
07986580d0ad14 Soren Brinkmann      2016-01-11  454  		uart_write_wakeup(port);
fccc9d9233f918 Manikanta Guntupalli 2024-01-23  455  
fccc9d9233f918 Manikanta Guntupalli 2024-01-23  456  	/* Enable the TX Empty interrupt */
fccc9d9233f918 Manikanta Guntupalli 2024-01-23  457  	writel(CDNS_UART_IXR_TXEMPTY, cdns_uart->port->membase + CDNS_UART_IER);
07986580d0ad14 Soren Brinkmann      2016-01-11  458  }
07986580d0ad14 Soren Brinkmann      2016-01-11  459  

:::::: The code at line 438 was first introduced by commit
:::::: 267ee93c417e685d9f8e079e41c70ba6ee4df5a5 serial: xilinx_uartps: fix rs485 delay_rts_after_send

:::::: TO: j.turek <jakub.turek@elsta.tech>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
