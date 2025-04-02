Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FBF238143
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 11:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595143; cv=none; b=moIMBAqABH6T0z4pfklWhFs1aVcHAwzYicdsu29QyoDGRQtwXIr9/1026xoO563+R4I6McYjDlSmnAS/DlSKiM2tI7jiMeFahNaUfNFOyI68e9tYF814vCVyETDruDNbpy7FvFNdxprP57UqlETUddD5EuqJvQmuuFDjw0tWkQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595143; c=relaxed/simple;
	bh=S2/z+diEkd3V2daCzB8F+zA0WgBN3IwUhz4gP6ZskC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BgOlux3RPJWfuu3rS1XW6JRHnyEysioV7feBct34BWaXLJbNinE1yt3+OoCOCE8mduOGwcDS+2QjE+pU+jj7vLUD6P1B3dY6nXDhdHQHiZQ/m27LaKy67Y0pHYBWeoDfpt2I6Hp8M1Ky+tstAl9rD9jotOnyIbCAT3hOYNRuskU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDzUjfkf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDzUjfkf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743595141; x=1775131141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S2/z+diEkd3V2daCzB8F+zA0WgBN3IwUhz4gP6ZskC0=;
  b=dDzUjfkfwQz1cx+KON7D2VudXEMPzsj8A2v5QT7Uyb2s7QGNwmkey0P4
   NJct5tbNCrpwyPOg2YmoZfSCf4YhgRESKwhckOSTJ0Drt/KupqhtyT16i
   IFSBhnYXxopjcij577QZLgioaHFeFMJJCuWRbwdSjN2JfLF9ruwhJVOzW
   NOPu9ZhvVmUVb1Z6/Trn+SRbAgvs56iPv1O8nu/0pU6bE/BwUOFeFsQgG
   kPeDWcLitdx1FKWzROhPujBT7f4Qa8kbDBPp8AlHNpcVhPH9Nq+aH7qow
   aeVGxMFmsi42KHRDEXLmHcbf7MYCTcSV5Fh6etw8RUj5gPVVqXViu27t/
   w==;
X-CSE-ConnectionGUID: h7ZN4tRxTKSvU75bM9KUZg==
X-CSE-MsgGUID: 5hGjVRh5Rfm2i4lWKwRK4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44862410"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="44862410"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 04:58:59 -0700
X-CSE-ConnectionGUID: a/WrAFkISkOTyhvyMPNJ3g==
X-CSE-MsgGUID: 6uLmulEmTsuYpNz3YbSKhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="126437591"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Apr 2025 04:58:58 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzwkB-000Afm-0F;
	Wed, 02 Apr 2025 11:58:55 +0000
Date: Wed, 2 Apr 2025 19:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 74/75] drivers/tty/serial/8250/8250_ni.c:81:19:
 error: 'struct uart_port' has no member named 'serial_in'
Message-ID: <202504021916.sLuz7Dow-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   7d77c8dc7c794e0a773d0ccd0f1df3d5b8128f9e
commit: 1da40a1608cf3b54bc16605e47a933c2ac6e6b05 [74/75] ops2
config: i386-buildonly-randconfig-003-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021916.sLuz7Dow-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021916.sLuz7Dow-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021916.sLuz7Dow-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_ni.c: In function 'ni16550_enable_transceivers':
>> drivers/tty/serial/8250/8250_ni.c:81:19: error: 'struct uart_port' has no member named 'serial_in'
      81 |         pcr = port->serial_in(port, NI16550_PCR_OFFSET);
         |                   ^~
>> drivers/tty/serial/8250/8250_ni.c:84:13: error: 'struct uart_port' has no member named 'serial_out'
      84 |         port->serial_out(port, NI16550_PCR_OFFSET, pcr);
         |             ^~
   drivers/tty/serial/8250/8250_ni.c: In function 'ni16550_disable_transceivers':
   drivers/tty/serial/8250/8250_ni.c:93:19: error: 'struct uart_port' has no member named 'serial_in'
      93 |         pcr = port->serial_in(port, NI16550_PCR_OFFSET);
         |                   ^~
   drivers/tty/serial/8250/8250_ni.c:96:13: error: 'struct uart_port' has no member named 'serial_out'
      96 |         port->serial_out(port, NI16550_PCR_OFFSET, pcr);
         |             ^~
   drivers/tty/serial/8250/8250_ni.c: In function 'ni16550_rs485_setup':
>> drivers/tty/serial/8250/8250_ni.c:195:13: error: 'struct uart_port' has no member named 'rs485_config'
     195 |         port->rs485_config = ni16550_rs485_config;
         |             ^~
   drivers/tty/serial/8250/8250_ni.c: In function 'ni16550_probe':
>> drivers/tty/serial/8250/8250_ni.c:314:19: error: 'struct uart_port' has no member named 'startup'; did you mean 'status'?
     314 |         uart.port.startup       = ni16550_port_startup;
         |                   ^~~~~~~
         |                   status
>> drivers/tty/serial/8250/8250_ni.c:315:18: error: 'struct uart_port' has no member named 'shutdown'
     315 |         uart.port.shutdown      = ni16550_port_shutdown;
         |                  ^
>> drivers/tty/serial/8250/8250_ni.c:357:26: error: 'struct uart_port' has no member named 'set_mctrl'
     357 |                 uart.port.set_mctrl = ni16550_set_mctrl;
         |                          ^


vim +81 drivers/tty/serial/8250/8250_ni.c

3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   76  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   77  static int ni16550_enable_transceivers(struct uart_port *port)
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   78  {
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   79  	u8 pcr;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   80  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  @81  	pcr = port->serial_in(port, NI16550_PCR_OFFSET);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   82  	pcr |= NI16550_PCR_TXVR_ENABLE_BIT;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   83  	dev_dbg(port->dev, "enable transceivers: write pcr: 0x%02x\n", pcr);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  @84  	port->serial_out(port, NI16550_PCR_OFFSET, pcr);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   85  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   86  	return 0;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   87  }
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   88  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   89  static int ni16550_disable_transceivers(struct uart_port *port)
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   90  {
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   91  	u8 pcr;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   92  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   93  	pcr = port->serial_in(port, NI16550_PCR_OFFSET);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   94  	pcr &= ~NI16550_PCR_TXVR_ENABLE_BIT;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   95  	dev_dbg(port->dev, "disable transceivers: write pcr: 0x%02x\n", pcr);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   96  	port->serial_out(port, NI16550_PCR_OFFSET, pcr);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   97  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   98  	return 0;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18   99  }
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  100  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  101  static int ni16550_rs485_config(struct uart_port *port,
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  102  				struct ktermios *termios,
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  103  				struct serial_rs485 *rs485)
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  104  {
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  105  	struct uart_8250_port *up = container_of(port, struct uart_8250_port, port);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  106  	u8 pcr;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  107  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  108  	pcr = serial_in(up, NI16550_PCR_OFFSET);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  109  	pcr &= ~NI16550_PCR_WIRE_MODE_MASK;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  110  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  111  	if ((rs485->flags & SER_RS485_MODE_RS422) ||
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  112  	    !(rs485->flags & SER_RS485_ENABLED)) {
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  113  		/* RS-422 */
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  114  		pcr |= NI16550_PCR_RS422;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  115  		up->acr &= ~NI16550_ACR_AUTO_DTR_EN;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  116  	} else {
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  117  		/* RS-485 2-wire Auto */
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  118  		pcr |= NI16550_PCR_AUTO_RS485;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  119  		up->acr |= NI16550_ACR_AUTO_DTR_EN;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  120  	}
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  121  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  122  	dev_dbg(port->dev, "config rs485: write pcr: 0x%02x, acr: %02x\n", pcr, up->acr);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  123  	serial_out(up, NI16550_PCR_OFFSET, pcr);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  124  	serial_icr_write(up, UART_ACR, up->acr);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  125  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  126  	return 0;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  127  }
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  128  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  129  static bool is_pmr_rs232_mode(struct uart_8250_port *up)
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  130  {
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  131  	u8 pmr = serial_in(up, NI16550_PMR_OFFSET);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  132  	u8 pmr_mode = pmr & NI16550_PMR_MODE_MASK;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  133  	u8 pmr_cap = pmr & NI16550_PMR_CAP_MASK;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  134  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  135  	/*
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  136  	 * If the PMR is not implemented, then by default NI UARTs are
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  137  	 * connected to RS-485 transceivers
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  138  	 */
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  139  	if (pmr_cap == NI16550_PMR_NOT_IMPL)
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  140  		return false;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  141  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  142  	if (pmr_cap == NI16550_PMR_CAP_DUAL)
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  143  		/*
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  144  		 * If the port is dual-mode capable, then read the mode bit
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  145  		 * to know the current mode
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  146  		 */
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  147  		return pmr_mode == NI16550_PMR_MODE_RS232;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  148  	/*
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  149  	 * If it is not dual-mode capable, then decide based on the
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  150  	 * capability
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  151  	 */
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  152  	return pmr_cap == NI16550_PMR_CAP_RS232;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  153  }
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  154  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  155  static void ni16550_config_prescaler(struct uart_8250_port *up,
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  156  				     u8 prescaler)
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  157  {
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  158  	/*
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  159  	 * Page in the Enhanced Mode Registers
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  160  	 * Sets EFR[4] for Enhanced Mode.
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  161  	 */
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  162  	u8 lcr_value;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  163  	u8 efr_value;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  164  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  165  	lcr_value = serial_in(up, UART_LCR);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  166  	serial_out(up, UART_LCR, UART_LCR_CONF_MODE_B);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  167  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  168  	efr_value = serial_in(up, UART_EFR);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  169  	efr_value |= UART_EFR_ECB;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  170  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  171  	serial_out(up, UART_EFR, efr_value);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  172  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  173  	/* Page out the Enhanced Mode Registers */
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  174  	serial_out(up, UART_LCR, lcr_value);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  175  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  176  	/* Set prescaler to CPR register. */
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  177  	serial_out(up, UART_SCR, UART_CPR);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  178  	serial_out(up, UART_ICR, prescaler);
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  179  }
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  180  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  181  static const struct serial_rs485 ni16550_rs485_supported = {
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  182  	.flags = SER_RS485_ENABLED | SER_RS485_MODE_RS422 | SER_RS485_RTS_ON_SEND |
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  183  		 SER_RS485_RTS_AFTER_SEND,
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  184  	/*
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  185  	 * delay_rts_* and RX_DURING_TX are not supported.
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  186  	 *
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  187  	 * RTS_{ON,AFTER}_SEND are supported, but ignored; the transceiver
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  188  	 * is connected in only one way and we don't need userspace to tell
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  189  	 * us, but want to retain compatibility with applications that do.
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  190  	 */
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  191  };
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  192  
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  193  static void ni16550_rs485_setup(struct uart_port *port)
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  194  {
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18 @195  	port->rs485_config = ni16550_rs485_config;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  196  	port->rs485_supported = ni16550_rs485_supported;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  197  	/*
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  198  	 * The hardware comes up by default in 2-wire auto mode and we
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  199  	 * set the flags to represent that
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  200  	 */
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  201  	port->rs485.flags = SER_RS485_ENABLED | SER_RS485_RTS_ON_SEND;
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  202  }
3d5390f4dbe633 Chaitanya Vadrevu 2025-03-18  203  

:::::: The code at line 81 was first introduced by commit
:::::: 3d5390f4dbe633472b2a4824e66ca5c4eac6fb19 serial: 8250: add driver for NI UARTs

:::::: TO: Chaitanya Vadrevu <chaitanya.vadrevu@emerson.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
