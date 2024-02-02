Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD2883A0C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 22:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706912015; cv=none; b=NV/tXt+SgWoNR7oWDOEnCT39lvgIsYQnxQTrwz4JJ94ftmzl7153M0yR57BOcMWzZfm9s2xr/Sy+5c8Umv/XvrQ2M1trziFXPJ5z99FMZTHKtKj8Lw0eMyK4IAxgtSZr8T8rwdLqpoO00GK969STbMud8swiA78vDuEkRF8SHBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706912015; c=relaxed/simple;
	bh=AFo1HwmD5XU9nLMSZZ+XehwnJ9cq/wCpCYodQt0GBDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eLAH/I6Je4LHOQN3JD3ZQ41LMAIaYP3YT3hidYQ0bXj7hF3X6NSIB2xtHJ0886+8HLaUiOVIwyimG7lrNwnnX6xoplQv5N1LGwMhuPzP5CT7sSrl7PwpgZOJSn+52XEUdJdE480cRb2IEHqsnsttIoXLlHEzGub2SmZkBO3BFM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDFA5h8a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDFA5h8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706912013; x=1738448013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AFo1HwmD5XU9nLMSZZ+XehwnJ9cq/wCpCYodQt0GBDE=;
  b=cDFA5h8ah/U0r1SK9v81opaL2IYQ9m+mqP5WINiYrEKBtsYHKfF2W5JA
   LTDsDVyGQobBxicJCDTuFmdgQIUNwrH3AarKbIU7cAIf5NQl7NzK1jcG7
   aXZnSIpHV5orAzkuZ/qV8hKdBDAHM0JvXksQgKDJEKwPv8HQmNJBoXCKv
   Jr4kJ/uUGtZ0D0Jzl1LaPeRLsnj9JlQp8Ic1SmPtzEs36xke2QZQ25h+P
   XNNgxfJ6XCVmKJRBoVzY2wRucjyNTC/zok8Uj2b7gGwW2bSLu4N4G8s50
   SvdoYb6DdGc0oSh/kSs3cPqsig+Ol4V/hNHkizGhthzc/q3MQbzIT1iiq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="422622"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="422622"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 14:13:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="507111"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Feb 2024 14:13:31 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW1mq-0004J4-31;
	Fri, 02 Feb 2024 22:13:28 +0000
Date: Sat, 3 Feb 2024 06:13:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 53/55]
 drivers/tty/serial/8250/8250_pci1xxxx.c:391:25: error: invalid use of
 undefined type 'struct circ_buf'
Message-ID: <202402030630.dem5AAWR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   417694d355605a4881edb833d8212c636c6c4c8a
commit: 8de16c2e3e826f59359da550330149d938e1fb09 [53/55] tty: serial, use kfifo
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240203/202402030630.dem5AAWR-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030630.dem5AAWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030630.dem5AAWR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_pci1xxxx.c:376:48: warning: 'struct circ_buf' declared inside parameter list will not be visible outside of this definition or declaration
     376 |                                         struct circ_buf *xmit,
         |                                                ^~~~~~~~
   drivers/tty/serial/8250/8250_pci1xxxx.c: In function 'pci1xxxx_process_write_data':
>> drivers/tty/serial/8250/8250_pci1xxxx.c:391:25: error: invalid use of undefined type 'struct circ_buf'
     391 |                 if (xmit->tail > (UART_XMIT_SIZE - UART_BURST_SIZE))
         |                         ^~
   drivers/tty/serial/8250/8250_pci1xxxx.c:393:46: error: invalid use of undefined type 'struct circ_buf'
     393 |                 writel(*(unsigned int *)&xmit->buf[xmit->tail],
         |                                              ^~
   drivers/tty/serial/8250/8250_pci1xxxx.c:393:56: error: invalid use of undefined type 'struct circ_buf'
     393 |                 writel(*(unsigned int *)&xmit->buf[xmit->tail],
         |                                                        ^~
   drivers/tty/serial/8250/8250_pci1xxxx.c:399:21: error: invalid use of undefined type 'struct circ_buf'
     399 |                 xmit->tail = (xmit->tail + UART_BURST_SIZE) &
         |                     ^~
   drivers/tty/serial/8250/8250_pci1xxxx.c:399:35: error: invalid use of undefined type 'struct circ_buf'
     399 |                 xmit->tail = (xmit->tail + UART_BURST_SIZE) &
         |                                   ^~
   drivers/tty/serial/8250/8250_pci1xxxx.c:406:28: error: invalid use of undefined type 'struct circ_buf'
     406 |                 writeb(xmit->buf[xmit->tail], port->membase +
         |                            ^~
   drivers/tty/serial/8250/8250_pci1xxxx.c:406:38: error: invalid use of undefined type 'struct circ_buf'
     406 |                 writeb(xmit->buf[xmit->tail], port->membase +
         |                                      ^~
   drivers/tty/serial/8250/8250_pci1xxxx.c:415:21: error: invalid use of undefined type 'struct circ_buf'
     415 |                 xmit->tail = (xmit->tail + UART_BYTE_SIZE) &
         |                     ^~
   drivers/tty/serial/8250/8250_pci1xxxx.c:415:35: error: invalid use of undefined type 'struct circ_buf'
     415 |                 xmit->tail = (xmit->tail + UART_BYTE_SIZE) &
         |                                   ^~
   drivers/tty/serial/8250/8250_pci1xxxx.c:422:47: error: invalid use of undefined type 'struct circ_buf'
     422 |                 if (valid_burst_count && (xmit->tail <
         |                                               ^~
   drivers/tty/serial/8250/8250_pci1xxxx.c: In function 'pci1xxxx_tx_burst':
>> drivers/tty/serial/8250/8250_pci1xxxx.c:435:28: error: 'struct uart_state' has no member named 'xmit'
     435 |         xmit = &port->state->xmit;
         |                            ^~
>> drivers/tty/serial/8250/8250_pci1xxxx.c:444:41: error: implicit declaration of function 'uart_circ_empty'; did you mean 'uart_lsr_tx_empty'? [-Werror=implicit-function-declaration]
     444 |         if ((uart_tx_stopped(port)) || (uart_circ_empty(xmit))) {
         |                                         ^~~~~~~~~~~~~~~
         |                                         uart_lsr_tx_empty
>> drivers/tty/serial/8250/8250_pci1xxxx.c:450:44: error: implicit declaration of function 'uart_circ_chars_pending' [-Werror=implicit-function-declaration]
     450 |                         valid_byte_count = uart_circ_chars_pending(xmit);
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_pci1xxxx.c:452:59: error: passing argument 2 of 'pci1xxxx_process_write_data' from incompatible pointer type [-Werror=incompatible-pointer-types]
     452 |                         pci1xxxx_process_write_data(port, xmit,
         |                                                           ^~~~
         |                                                           |
         |                                                           struct circ_buf *
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:58: note: expected 'struct circ_buf *' but argument is of type 'struct circ_buf *'
     376 |                                         struct circ_buf *xmit,
         |                                         ~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +391 drivers/tty/serial/8250/8250_pci1xxxx.c

aba8290f368d96 Rengarajan S 2023-12-15  374  
90d051b63519b0 Rengarajan S 2024-01-25  375  static void pci1xxxx_process_write_data(struct uart_port *port,
90d051b63519b0 Rengarajan S 2024-01-25 @376  					struct circ_buf *xmit,
90d051b63519b0 Rengarajan S 2024-01-25  377  					int *data_empty_count,
90d051b63519b0 Rengarajan S 2024-01-25  378  					u32 *valid_byte_count)
90d051b63519b0 Rengarajan S 2024-01-25  379  {
90d051b63519b0 Rengarajan S 2024-01-25  380  	u32 valid_burst_count = *valid_byte_count / UART_BURST_SIZE;
90d051b63519b0 Rengarajan S 2024-01-25  381  
90d051b63519b0 Rengarajan S 2024-01-25  382  	/*
90d051b63519b0 Rengarajan S 2024-01-25  383  	 * Each transaction transfers data in DWORDs. If there are less than
90d051b63519b0 Rengarajan S 2024-01-25  384  	 * four remaining valid_byte_count to transfer or if the circular
90d051b63519b0 Rengarajan S 2024-01-25  385  	 * buffer has insufficient space for a DWORD, the data is transferred
90d051b63519b0 Rengarajan S 2024-01-25  386  	 * one byte at a time.
90d051b63519b0 Rengarajan S 2024-01-25  387  	 */
90d051b63519b0 Rengarajan S 2024-01-25  388  	while (valid_burst_count) {
90d051b63519b0 Rengarajan S 2024-01-25  389  		if (*data_empty_count - UART_BURST_SIZE < 0)
90d051b63519b0 Rengarajan S 2024-01-25  390  			break;
90d051b63519b0 Rengarajan S 2024-01-25 @391  		if (xmit->tail > (UART_XMIT_SIZE - UART_BURST_SIZE))
90d051b63519b0 Rengarajan S 2024-01-25  392  			break;
90d051b63519b0 Rengarajan S 2024-01-25  393  		writel(*(unsigned int *)&xmit->buf[xmit->tail],
90d051b63519b0 Rengarajan S 2024-01-25  394  		       port->membase + UART_TX_BURST_FIFO);
90d051b63519b0 Rengarajan S 2024-01-25  395  		*valid_byte_count -= UART_BURST_SIZE;
90d051b63519b0 Rengarajan S 2024-01-25  396  		*data_empty_count -= UART_BURST_SIZE;
90d051b63519b0 Rengarajan S 2024-01-25  397  		valid_burst_count -= UART_BYTE_SIZE;
90d051b63519b0 Rengarajan S 2024-01-25  398  
90d051b63519b0 Rengarajan S 2024-01-25  399  		xmit->tail = (xmit->tail + UART_BURST_SIZE) &
90d051b63519b0 Rengarajan S 2024-01-25  400  			     (UART_XMIT_SIZE - 1);
90d051b63519b0 Rengarajan S 2024-01-25  401  	}
90d051b63519b0 Rengarajan S 2024-01-25  402  
90d051b63519b0 Rengarajan S 2024-01-25  403  	while (*valid_byte_count) {
90d051b63519b0 Rengarajan S 2024-01-25  404  		if (*data_empty_count - UART_BYTE_SIZE < 0)
90d051b63519b0 Rengarajan S 2024-01-25  405  			break;
90d051b63519b0 Rengarajan S 2024-01-25  406  		writeb(xmit->buf[xmit->tail], port->membase +
90d051b63519b0 Rengarajan S 2024-01-25  407  		       UART_TX_BYTE_FIFO);
90d051b63519b0 Rengarajan S 2024-01-25  408  		*data_empty_count -= UART_BYTE_SIZE;
90d051b63519b0 Rengarajan S 2024-01-25  409  		*valid_byte_count -= UART_BYTE_SIZE;
90d051b63519b0 Rengarajan S 2024-01-25  410  
90d051b63519b0 Rengarajan S 2024-01-25  411  		/*
90d051b63519b0 Rengarajan S 2024-01-25  412  		 * When the tail of the circular buffer is reached, the next
90d051b63519b0 Rengarajan S 2024-01-25  413  		 * byte is transferred to the beginning of the buffer.
90d051b63519b0 Rengarajan S 2024-01-25  414  		 */
90d051b63519b0 Rengarajan S 2024-01-25 @415  		xmit->tail = (xmit->tail + UART_BYTE_SIZE) &
90d051b63519b0 Rengarajan S 2024-01-25  416  			     (UART_XMIT_SIZE - 1);
90d051b63519b0 Rengarajan S 2024-01-25  417  
90d051b63519b0 Rengarajan S 2024-01-25  418  		/*
90d051b63519b0 Rengarajan S 2024-01-25  419  		 * If there are any pending burst count, data is handled by
90d051b63519b0 Rengarajan S 2024-01-25  420  		 * transmitting DWORDs at a time.
90d051b63519b0 Rengarajan S 2024-01-25  421  		 */
90d051b63519b0 Rengarajan S 2024-01-25 @422  		if (valid_burst_count && (xmit->tail <
90d051b63519b0 Rengarajan S 2024-01-25  423  		   (UART_XMIT_SIZE - UART_BURST_SIZE)))
90d051b63519b0 Rengarajan S 2024-01-25  424  			break;
90d051b63519b0 Rengarajan S 2024-01-25  425  	}
90d051b63519b0 Rengarajan S 2024-01-25  426  }
90d051b63519b0 Rengarajan S 2024-01-25  427  
90d051b63519b0 Rengarajan S 2024-01-25  428  static void pci1xxxx_tx_burst(struct uart_port *port, u32 uart_status)
90d051b63519b0 Rengarajan S 2024-01-25  429  {
90d051b63519b0 Rengarajan S 2024-01-25  430  	struct uart_8250_port *up = up_to_u8250p(port);
90d051b63519b0 Rengarajan S 2024-01-25  431  	u32 valid_byte_count;
90d051b63519b0 Rengarajan S 2024-01-25  432  	int data_empty_count;
90d051b63519b0 Rengarajan S 2024-01-25  433  	struct circ_buf *xmit;
90d051b63519b0 Rengarajan S 2024-01-25  434  
90d051b63519b0 Rengarajan S 2024-01-25 @435  	xmit = &port->state->xmit;
90d051b63519b0 Rengarajan S 2024-01-25  436  
90d051b63519b0 Rengarajan S 2024-01-25  437  	if (port->x_char) {
90d051b63519b0 Rengarajan S 2024-01-25  438  		writeb(port->x_char, port->membase + UART_TX);
90d051b63519b0 Rengarajan S 2024-01-25  439  		port->icount.tx++;
90d051b63519b0 Rengarajan S 2024-01-25  440  		port->x_char = 0;
90d051b63519b0 Rengarajan S 2024-01-25  441  		return;
90d051b63519b0 Rengarajan S 2024-01-25  442  	}
90d051b63519b0 Rengarajan S 2024-01-25  443  
90d051b63519b0 Rengarajan S 2024-01-25 @444  	if ((uart_tx_stopped(port)) || (uart_circ_empty(xmit))) {
90d051b63519b0 Rengarajan S 2024-01-25  445  		port->ops->stop_tx(port);
90d051b63519b0 Rengarajan S 2024-01-25  446  	} else {
90d051b63519b0 Rengarajan S 2024-01-25  447  		data_empty_count = (pci1xxxx_read_burst_status(port) &
90d051b63519b0 Rengarajan S 2024-01-25  448  				    UART_BST_STAT_TX_COUNT_MASK) >> 8;
90d051b63519b0 Rengarajan S 2024-01-25  449  		do {
90d051b63519b0 Rengarajan S 2024-01-25 @450  			valid_byte_count = uart_circ_chars_pending(xmit);
90d051b63519b0 Rengarajan S 2024-01-25  451  
90d051b63519b0 Rengarajan S 2024-01-25 @452  			pci1xxxx_process_write_data(port, xmit,
90d051b63519b0 Rengarajan S 2024-01-25  453  						    &data_empty_count,
90d051b63519b0 Rengarajan S 2024-01-25  454  						    &valid_byte_count);
90d051b63519b0 Rengarajan S 2024-01-25  455  
90d051b63519b0 Rengarajan S 2024-01-25  456  			port->icount.tx++;
90d051b63519b0 Rengarajan S 2024-01-25  457  			if (uart_circ_empty(xmit))
90d051b63519b0 Rengarajan S 2024-01-25  458  				break;
90d051b63519b0 Rengarajan S 2024-01-25  459  		} while (data_empty_count && valid_byte_count);
90d051b63519b0 Rengarajan S 2024-01-25  460  	}
90d051b63519b0 Rengarajan S 2024-01-25  461  
90d051b63519b0 Rengarajan S 2024-01-25  462  	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
90d051b63519b0 Rengarajan S 2024-01-25  463  		uart_write_wakeup(port);
90d051b63519b0 Rengarajan S 2024-01-25  464  
90d051b63519b0 Rengarajan S 2024-01-25  465  	 /*
90d051b63519b0 Rengarajan S 2024-01-25  466  	  * With RPM enabled, we have to wait until the FIFO is empty before
90d051b63519b0 Rengarajan S 2024-01-25  467  	  * the HW can go idle. So we get here once again with empty FIFO and
90d051b63519b0 Rengarajan S 2024-01-25  468  	  * disable the interrupt and RPM in __stop_tx()
90d051b63519b0 Rengarajan S 2024-01-25  469  	  */
90d051b63519b0 Rengarajan S 2024-01-25  470  	if (uart_circ_empty(xmit) && !(up->capabilities & UART_CAP_RPM))
90d051b63519b0 Rengarajan S 2024-01-25  471  		port->ops->stop_tx(port);
90d051b63519b0 Rengarajan S 2024-01-25  472  }
90d051b63519b0 Rengarajan S 2024-01-25  473  

:::::: The code at line 391 was first introduced by commit
:::::: 90d051b63519b0e653432168ecee8a4c0abc24dd 8250: microchip: pci1xxxx: Add Burst mode transmission support in uart driver for reading from FIFO

:::::: TO: Rengarajan S <rengarajan.s@microchip.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
