Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107CC2D0C62
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 20:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781467249; cv=none; b=WNoF+Sg3nGJZM3Q+PV2lRSfJzl4KRbGqHYQkWi11Qej71D87hYrqp81VVA3wmBV4B9ME+gySKcoBrUBZK+B1nma0IMigD2Oc5eslRkCk81oXvMFwPRGxCBCRxOMnEuiY5uLprG9RAvbnQ2P/ncmeCLrZM6fknIxJxDT8rIcyqB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781467249; c=relaxed/simple;
	bh=cMR4R0s7cmijZRZ2+n+UkBaWs3HQjq7U77ewd/evF/o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cD8kbg2kHzSRjyOOkSEZbKrLjLPUepuHZDU4Qg84ge0Zg+tmXZ6s1VdrD4oWBPj5DmzDlWysLTHE0PlNlw3BMAKJwQCg3/i2VEiXBjyymuXRDvookGnJ+YQweMKS0HOiZGWRuMxQg33ViiF6XNEHIFEX4lv+KW/pt0dkFU3YwGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDcuE1BT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDcuE1BT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781467248; x=1813003248;
  h=date:from:to:cc:subject:message-id;
  bh=cMR4R0s7cmijZRZ2+n+UkBaWs3HQjq7U77ewd/evF/o=;
  b=YDcuE1BTH0xvbm6adfroNyWtJgT75GDVMHL+bx40/9Sb7tRMWHCJHJEC
   qy8w6s9w5lq5zu9M7kNhRqr39E+/jSp+wgmfVJ7zhIVMO9aOLrofjSEX3
   335MVoyBJFEONtBE85lNLrMo8sdCgcGmrkZxjOd6XHouirTxtGkQPyNhH
   f8j9TMMHTBLxQS7sP0Vqw7bfMIQnL09XFxVJil0zHEV4ty+HTAFMGjKeC
   ElcyF7FjsMu/8vsVw2hOgayNENJU0+r500Y4Rx8ghN+cfyJSI3nrnxwTr
   ZzR56oLYpyV/c0+FTEU7zFPeM/ULxI8oiKszbLnKy9g/zYQvpIs+x6+QC
   g==;
X-CSE-ConnectionGUID: 55KVgsQgQVmkFdY9ChRDGQ==
X-CSE-MsgGUID: WIH7i+8pRYegjbVLAGg3hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="99791370"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="99791370"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 13:00:45 -0700
X-CSE-ConnectionGUID: AqGTTlkJQHGrv3MMpphtrQ==
X-CSE-MsgGUID: Lokz/wnsSFuVn7ilRoFI4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="277492979"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2026 13:00:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYr0a-00000000RAm-3yaZ;
	Sun, 14 Jun 2026 20:00:40 +0000
Date: Mon, 15 Jun 2026 04:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: "j.turek" <jakub.turek@elsta.tech>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/tty/serial/xilinx_uartps.c:438:25: sparse: sparse:
 dereference of noderef expression
Message-ID: <202606150318.PcLVQ18L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: 267ee93c417e685d9f8e079e41c70ba6ee4df5a5 serial: xilinx_uartps: fix rs485 delay_rts_after_send
date:   6 months ago
config: i386-randconfig-062-20260614 (https://download.01.org/0day-ci/archive/20260615/202606150318.PcLVQ18L-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150318.PcLVQ18L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 267ee93c417e ("serial: xilinx_uartps: fix rs485 delay_rts_after_send")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150318.PcLVQ18L-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/xilinx_uartps.c:438:25: sparse: sparse: dereference of noderef expression
   drivers/tty/serial/xilinx_uartps.c:709:13: sparse: sparse: context imbalance in 'cdns_uart_start_tx' - different lock contexts for basic block

vim +438 drivers/tty/serial/xilinx_uartps.c

   418	
   419	/**
   420	 * cdns_uart_handle_tx - Handle the bytes to be transmitted.
   421	 * @dev_id: Id of the UART port
   422	 * Return: None
   423	 */
   424	static void cdns_uart_handle_tx(void *dev_id)
   425	{
   426		struct uart_port *port = (struct uart_port *)dev_id;
   427		struct cdns_uart *cdns_uart = port->private_data;
   428		struct tty_port *tport = &port->state->port;
   429		unsigned int numbytes;
   430		unsigned char ch;
   431		ktime_t rts_delay;
   432	
   433		if (kfifo_is_empty(&tport->xmit_fifo) || uart_tx_stopped(port)) {
   434			/* Disable the TX Empty interrupt */
   435			writel(CDNS_UART_IXR_TXEMPTY, port->membase + CDNS_UART_IDR);
   436			/* Set RTS line after delay */
   437			if (cdns_uart->port->rs485.flags & SER_RS485_ENABLED) {
 > 438				cdns_uart->tx_timer.function = &cdns_rs485_rx_callback;
   439				rts_delay = ns_to_ktime(cdns_calc_after_tx_delay(cdns_uart));
   440				hrtimer_start(&cdns_uart->tx_timer, rts_delay, HRTIMER_MODE_REL);
   441			}
   442			return;
   443		}
   444	
   445		numbytes = port->fifosize;
   446		while (numbytes &&
   447		       !(readl(port->membase + CDNS_UART_SR) & CDNS_UART_SR_TXFULL) &&
   448		       uart_fifo_get(port, &ch)) {
   449			writel(ch, port->membase + CDNS_UART_FIFO);
   450			numbytes--;
   451		}
   452	
   453		if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
   454			uart_write_wakeup(port);
   455	
   456		/* Enable the TX Empty interrupt */
   457		writel(CDNS_UART_IXR_TXEMPTY, cdns_uart->port->membase + CDNS_UART_IER);
   458	}
   459	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
