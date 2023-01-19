Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5A5A93E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 17:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674149712; x=1705685712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nWG1HUvNlg57kPLshGlxumKuEl/VP+rm5kTF+VD6icU=;
  b=eRUbpw52y3bCz3Uj8Xnf9Tr8yJEi9iXgAg56aKJbSNDKEzC+ypeITxCv
   /E+x2gOuDJzwfF9hIPSqUHp9LrMr1Zocdi/uGyPEcB7AsGuKLxQ/uc+0x
   UTl1eUz+Q4PPJStsTbjThN3ehGCtf1vC3AxYNdBbbwtlr61aZWOPFnUR8
   447iGla7y5mw9uTq8o6qBNGmjpFsOm1hPWeKt0Wm1zYLjM9nd7VYlYiNJ
   P3NCqeATGqonNXGWS0BDv9RnSq+bPqsmaptvQ6fCRp551wfJNTSFLaXkP
   JNjpXi/jzXcdR3LBxVUwLwpzWRJbt3q3vcxgEFZR3E/cH7eb60ZcN/9Hm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="313247235"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="313247235"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 09:34:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="905625121"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="905625121"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jan 2023 09:34:03 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIYna-0001g4-0q;
	Thu, 19 Jan 2023 17:34:02 +0000
Date: Fri, 20 Jan 2023 01:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [tty:tty-linus 4/7] drivers/tty/serial/stm32-usart.c:804:62: error:
 'flags' undeclared
Message-ID: <202301200130.ttBiTzfO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-linus
head:   5342ab0af45064cbdc773645b93ab70c24ee161f
commit: f24771b62a83239f0dce816bddf0f6807f436235 [4/7] serial: stm32: Merge hard IRQ and threaded IRQ handling into single IRQ handler
config: arm-randconfig-r046-20230119 (https://download.01.org/0day-ci/archive/20230120/202301200130.ttBiTzfO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?id=f24771b62a83239f0dce816bddf0f6807f436235
        git remote add tty https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
        git fetch --no-tags tty tty-linus
        git checkout f24771b62a83239f0dce816bddf0f6807f436235
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/tty/serial/stm32-usart.c: In function 'stm32_usart_interrupt':
>> drivers/tty/serial/stm32-usart.c:804:62: error: 'flags' undeclared (first use in this function)
     804 |                 uart_unlock_and_check_sysrq_irqrestore(port, flags);
         |                                                              ^~~~~
   drivers/tty/serial/stm32-usart.c:804:62: note: each undeclared identifier is reported only once for each function it appears in


vim +/flags +804 drivers/tty/serial/stm32-usart.c

48a6092fb41fab Maxime Coquelin  2015-06-10  747  
56f9a76c27b51b Erwan Le Ray     2021-01-06  748  static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
48a6092fb41fab Maxime Coquelin  2015-06-10  749  {
48a6092fb41fab Maxime Coquelin  2015-06-10  750  	struct uart_port *port = ptr;
12761869f0efa5 Erwan Le Ray     2021-03-04  751  	struct tty_port *tport = &port->state->port;
ada8618ff3bfe1 Alexandre TORGUE 2016-09-15  752  	struct stm32_port *stm32_port = to_stm32_port(port);
d825f0bea20f49 Stephen Boyd     2021-01-22  753  	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
48a6092fb41fab Maxime Coquelin  2015-06-10  754  	u32 sr;
6333a485062172 Erwan Le Ray     2021-10-25  755  	unsigned int size;
48a6092fb41fab Maxime Coquelin  2015-06-10  756  
ada8618ff3bfe1 Alexandre TORGUE 2016-09-15  757  	sr = readl_relaxed(port->membase + ofs->isr);
48a6092fb41fab Maxime Coquelin  2015-06-10  758  
d7c76716169ddc Marek Vasut      2022-04-30  759  	if (!stm32_port->hw_flow_control &&
d7c76716169ddc Marek Vasut      2022-04-30  760  	    port->rs485.flags & SER_RS485_ENABLED &&
d7c76716169ddc Marek Vasut      2022-04-30  761  	    (sr & USART_SR_TC)) {
d7c76716169ddc Marek Vasut      2022-04-30  762  		stm32_usart_tc_interrupt_disable(port);
d7c76716169ddc Marek Vasut      2022-04-30  763  		stm32_usart_rs485_rts_disable(port);
d7c76716169ddc Marek Vasut      2022-04-30  764  	}
d7c76716169ddc Marek Vasut      2022-04-30  765  
4cc0ed626f2ba3 Erwan Le Ray     2019-06-18  766  	if ((sr & USART_SR_RTOF) && ofs->icr != UNDEF_REG)
4cc0ed626f2ba3 Erwan Le Ray     2019-06-18  767  		writel_relaxed(USART_ICR_RTOCF,
4cc0ed626f2ba3 Erwan Le Ray     2019-06-18  768  			       port->membase + ofs->icr);
4cc0ed626f2ba3 Erwan Le Ray     2019-06-18  769  
12761869f0efa5 Erwan Le Ray     2021-03-04  770  	if ((sr & USART_SR_WUF) && ofs->icr != UNDEF_REG) {
12761869f0efa5 Erwan Le Ray     2021-03-04  771  		/* Clear wake up flag and disable wake up interrupt */
270e5a74fe4c78 Fabrice Gasnier  2017-07-13  772  		writel_relaxed(USART_ICR_WUCF,
270e5a74fe4c78 Fabrice Gasnier  2017-07-13  773  			       port->membase + ofs->icr);
12761869f0efa5 Erwan Le Ray     2021-03-04  774  		stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_WUFIE);
12761869f0efa5 Erwan Le Ray     2021-03-04  775  		if (irqd_is_wakeup_set(irq_get_irq_data(port->irq)))
12761869f0efa5 Erwan Le Ray     2021-03-04  776  			pm_wakeup_event(tport->tty->dev, 0);
12761869f0efa5 Erwan Le Ray     2021-03-04  777  	}
270e5a74fe4c78 Fabrice Gasnier  2017-07-13  778  
33bb2f6ac30889 Erwan Le Ray     2021-10-20  779  	/*
33bb2f6ac30889 Erwan Le Ray     2021-10-20  780  	 * rx errors in dma mode has to be handled ASAP to avoid overrun as the DMA request
33bb2f6ac30889 Erwan Le Ray     2021-10-20  781  	 * line has been masked by HW and rx data are stacking in FIFO.
33bb2f6ac30889 Erwan Le Ray     2021-10-20  782  	 */
d1ec8a2eabe969 Erwan Le Ray     2021-10-20  783  	if (!stm32_port->throttled) {
33bb2f6ac30889 Erwan Le Ray     2021-10-20  784  		if (((sr & USART_SR_RXNE) && !stm32_usart_rx_dma_enabled(port)) ||
d1ec8a2eabe969 Erwan Le Ray     2021-10-20  785  		    ((sr & USART_SR_ERR_MASK) && stm32_usart_rx_dma_enabled(port))) {
6333a485062172 Erwan Le Ray     2021-10-25  786  			spin_lock(&port->lock);
6333a485062172 Erwan Le Ray     2021-10-25  787  			size = stm32_usart_receive_chars(port, false);
6333a485062172 Erwan Le Ray     2021-10-25  788  			uart_unlock_and_check_sysrq(port);
6333a485062172 Erwan Le Ray     2021-10-25  789  			if (size)
6333a485062172 Erwan Le Ray     2021-10-25  790  				tty_flip_buffer_push(tport);
d1ec8a2eabe969 Erwan Le Ray     2021-10-20  791  		}
d1ec8a2eabe969 Erwan Le Ray     2021-10-20  792  	}
48a6092fb41fab Maxime Coquelin  2015-06-10  793  
ad7676812437a0 Erwan Le Ray     2021-03-04  794  	if ((sr & USART_SR_TXE) && !(stm32_port->tx_ch)) {
ad7676812437a0 Erwan Le Ray     2021-03-04  795  		spin_lock(&port->lock);
56f9a76c27b51b Erwan Le Ray     2021-01-06  796  		stm32_usart_transmit_chars(port);
01d32d71610b0c Alexandre TORGUE 2016-09-15  797  		spin_unlock(&port->lock);
ad7676812437a0 Erwan Le Ray     2021-03-04  798  	}
01d32d71610b0c Alexandre TORGUE 2016-09-15  799  
cc58d0a3f0a475 Erwan Le Ray     2021-10-20  800  	/* Receiver timeout irq for DMA RX */
f24771b62a8323 Marek Vasut      2023-01-12  801  	if (stm32_usart_rx_dma_enabled(port) && !stm32_port->throttled) {
f24771b62a8323 Marek Vasut      2023-01-12  802  		spin_lock(&port->lock);
6333a485062172 Erwan Le Ray     2021-10-25  803  		size = stm32_usart_receive_chars(port, false);
6333a485062172 Erwan Le Ray     2021-10-25 @804  		uart_unlock_and_check_sysrq_irqrestore(port, flags);
6333a485062172 Erwan Le Ray     2021-10-25  805  		if (size)
6333a485062172 Erwan Le Ray     2021-10-25  806  			tty_flip_buffer_push(tport);
6333a485062172 Erwan Le Ray     2021-10-25  807  	}
3489187204eb75 Alexandre TORGUE 2016-09-15  808  
48a6092fb41fab Maxime Coquelin  2015-06-10  809  	return IRQ_HANDLED;
48a6092fb41fab Maxime Coquelin  2015-06-10  810  }
48a6092fb41fab Maxime Coquelin  2015-06-10  811  

:::::: The code at line 804 was first introduced by commit
:::::: 6333a485062172e1c118b44585d90c1d835aec52 serial: stm32: push DMA RX data before suspending

:::::: TO: Erwan Le Ray <erwan.leray@foss.st.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
