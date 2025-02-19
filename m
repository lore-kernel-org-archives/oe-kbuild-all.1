Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523D525757
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739967860; cv=none; b=dpiz/88VXanzfcm5DSy7ti8i4eaR/wAz9UzZMHeuMgftJwDqSuVGciyGq0+Tpmlno+IpGzmFIXAitdwQLu5UBpcltelo46Yf8xabNE9iyua8uOfdyQII/30ac+E4s1hx3ZuvFneCMm05jMyCCCGqnzcCWumDQmY80FMPIYgtEbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739967860; c=relaxed/simple;
	bh=CH3JFU4YMLia7MGWRW+M3/4TiIN2G7Hduy5GrwbGL9U=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JXR3C5aVheAjOnq00lUCMBwB6E1kZfkciF/cJORtiImdpSz24GSi6obhgdf5pBEsfSyDUqAWKRtxdPjEvZhSRJATHpTmFszxaGdmXjkOS6krX1faHCx7Ge7nB7sYVCjhuURhtz/cqpw0E7ZZ5jLdSksVMGamVjwdOXY/UPX+b1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqrlM3Z/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqrlM3Z/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739967858; x=1771503858;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CH3JFU4YMLia7MGWRW+M3/4TiIN2G7Hduy5GrwbGL9U=;
  b=EqrlM3Z/yIhEkqCkzyocmW5aYL6c7lXmI+HskS8mKJZJN7HVdBvxjTYi
   a+vIMRXz+uV1BhvpQxFQ/kv9U2ggWWKWiB6py51m6y6n+G8jKXgJf5Znf
   qqfKCNHPESB9/odTPtxkJDINwrG7C9oe6woRX8fvGuAeXa3GlOR/lW/1D
   aSxlYFbkvCZmg9r9vqDLuuWzXYkaWDf+FFL2zkurQFhp9G/+caLQ1v+9L
   tN+0NGun4hOfQmcwk+GiALILFbFgd2HUpSUQOsA6oMgnkqFlF0GYDtnHU
   C3LwdB9uIY8RmTpMCt+BdaFldemqJpuzXVmIaGYwjv1ECrMLcAPAqwUd3
   Q==;
X-CSE-ConnectionGUID: wAojhpdKQp25cWLAanMkmA==
X-CSE-MsgGUID: MAFuhDaISAqS4lGJJu/kMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40558981"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="40558981"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 04:24:17 -0800
X-CSE-ConnectionGUID: eeme7r79RG+DcgatiS9AMw==
X-CSE-MsgGUID: f3409qFrSuqSKprIj3yxKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="114678283"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Feb 2025 04:24:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkj7e-0002uV-1C
	for oe-kbuild-all@lists.linux.dev;
	Wed, 19 Feb 2025 12:24:14 +0000
Date: Wed, 19 Feb 2025 20:23:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] drivers/tty/serial/fsl_lpuart.c:1590:32:
 warning: variable 'bd' set but not used
Message-ID: <202502192008.lLOorhrT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: a6d7514b14a6ea2a3868bdcb2fca7b2410738595 [1/1] tty: serial: lpuart: add a more accurate baud rate calculation method
config: sparc-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250219/202502192008.lLOorhrT-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502192008.lLOorhrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502192008.lLOorhrT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/tty/serial/fsl_lpuart.c: In function 'lpuart32_set_termios':
>> drivers/tty/serial/fsl_lpuart.c:1590:32: warning: variable 'bd' set but not used [-Wunused-but-set-variable]
     unsigned long ctrl, old_ctrl, bd, modem;
                                   ^~
--
   arch/sparc/kernel/head_32.o: in function `current_pc':
>> (.head.text+0x2040): relocation truncated to fit: R_SPARC_WDISP22 against `.init.text'
   arch/sparc/kernel/head_32.o: in function `halt_notsup':
   (.head.text+0x2100): relocation truncated to fit: R_SPARC_WDISP22 against `.init.text'
   arch/sparc/built-in.o:(.fixup+0x4): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/built-in.o:(.fixup+0xc): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/built-in.o:(.fixup+0x14): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/built-in.o:(.fixup+0x1c): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/built-in.o:(.fixup+0x24): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/built-in.o:(.fixup+0x2c): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/built-in.o:(.fixup+0x34): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/built-in.o:(.fixup+0x3c): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/built-in.o:(.fixup+0x44): additional relocation overflows omitted from the output


vim +/bd +1590 drivers/tty/serial/fsl_lpuart.c

a6d7514b14a6ea2 Dong Aisheng 2017-06-13  1583  
380c966c093e723 Jingchang Lu 2014-07-14  1584  static void
380c966c093e723 Jingchang Lu 2014-07-14  1585  lpuart32_set_termios(struct uart_port *port, struct ktermios *termios,
380c966c093e723 Jingchang Lu 2014-07-14  1586  		   struct ktermios *old)
380c966c093e723 Jingchang Lu 2014-07-14  1587  {
380c966c093e723 Jingchang Lu 2014-07-14  1588  	struct lpuart_port *sport = container_of(port, struct lpuart_port, port);
380c966c093e723 Jingchang Lu 2014-07-14  1589  	unsigned long flags;
380c966c093e723 Jingchang Lu 2014-07-14 @1590  	unsigned long ctrl, old_ctrl, bd, modem;
380c966c093e723 Jingchang Lu 2014-07-14  1591  	unsigned int  baud;
380c966c093e723 Jingchang Lu 2014-07-14  1592  	unsigned int old_csize = old ? old->c_cflag & CSIZE : CS8;
380c966c093e723 Jingchang Lu 2014-07-14  1593  
a0204f25e15cb5b Dong Aisheng 2017-06-13  1594  	ctrl = old_ctrl = lpuart32_read(&sport->port, UARTCTRL);
a0204f25e15cb5b Dong Aisheng 2017-06-13  1595  	bd = lpuart32_read(&sport->port, UARTBAUD);
a0204f25e15cb5b Dong Aisheng 2017-06-13  1596  	modem = lpuart32_read(&sport->port, UARTMODIR);
380c966c093e723 Jingchang Lu 2014-07-14  1597  	/*
380c966c093e723 Jingchang Lu 2014-07-14  1598  	 * only support CS8 and CS7, and for CS7 must enable PE.
380c966c093e723 Jingchang Lu 2014-07-14  1599  	 * supported mode:
380c966c093e723 Jingchang Lu 2014-07-14  1600  	 *  - (7,e/o,1)
380c966c093e723 Jingchang Lu 2014-07-14  1601  	 *  - (8,n,1)
380c966c093e723 Jingchang Lu 2014-07-14  1602  	 *  - (8,m/s,1)
380c966c093e723 Jingchang Lu 2014-07-14  1603  	 *  - (8,e/o,1)
380c966c093e723 Jingchang Lu 2014-07-14  1604  	 */
380c966c093e723 Jingchang Lu 2014-07-14  1605  	while ((termios->c_cflag & CSIZE) != CS8 &&
380c966c093e723 Jingchang Lu 2014-07-14  1606  		(termios->c_cflag & CSIZE) != CS7) {
380c966c093e723 Jingchang Lu 2014-07-14  1607  		termios->c_cflag &= ~CSIZE;
380c966c093e723 Jingchang Lu 2014-07-14  1608  		termios->c_cflag |= old_csize;
380c966c093e723 Jingchang Lu 2014-07-14  1609  		old_csize = CS8;
380c966c093e723 Jingchang Lu 2014-07-14  1610  	}
380c966c093e723 Jingchang Lu 2014-07-14  1611  
380c966c093e723 Jingchang Lu 2014-07-14  1612  	if ((termios->c_cflag & CSIZE) == CS8 ||
380c966c093e723 Jingchang Lu 2014-07-14  1613  		(termios->c_cflag & CSIZE) == CS7)
380c966c093e723 Jingchang Lu 2014-07-14  1614  		ctrl = old_ctrl & ~UARTCTRL_M;
380c966c093e723 Jingchang Lu 2014-07-14  1615  
380c966c093e723 Jingchang Lu 2014-07-14  1616  	if (termios->c_cflag & CMSPAR) {
380c966c093e723 Jingchang Lu 2014-07-14  1617  		if ((termios->c_cflag & CSIZE) != CS8) {
380c966c093e723 Jingchang Lu 2014-07-14  1618  			termios->c_cflag &= ~CSIZE;
380c966c093e723 Jingchang Lu 2014-07-14  1619  			termios->c_cflag |= CS8;
380c966c093e723 Jingchang Lu 2014-07-14  1620  		}
380c966c093e723 Jingchang Lu 2014-07-14  1621  		ctrl |= UARTCTRL_M;
380c966c093e723 Jingchang Lu 2014-07-14  1622  	}
380c966c093e723 Jingchang Lu 2014-07-14  1623  
380c966c093e723 Jingchang Lu 2014-07-14  1624  	if (termios->c_cflag & CRTSCTS) {
380c966c093e723 Jingchang Lu 2014-07-14  1625  		modem |= (UARTMODEM_RXRTSE | UARTMODEM_TXCTSE);
380c966c093e723 Jingchang Lu 2014-07-14  1626  	} else {
380c966c093e723 Jingchang Lu 2014-07-14  1627  		termios->c_cflag &= ~CRTSCTS;
380c966c093e723 Jingchang Lu 2014-07-14  1628  		modem &= ~(UARTMODEM_RXRTSE | UARTMODEM_TXCTSE);
380c966c093e723 Jingchang Lu 2014-07-14  1629  	}
380c966c093e723 Jingchang Lu 2014-07-14  1630  
380c966c093e723 Jingchang Lu 2014-07-14  1631  	if (termios->c_cflag & CSTOPB)
380c966c093e723 Jingchang Lu 2014-07-14  1632  		termios->c_cflag &= ~CSTOPB;
380c966c093e723 Jingchang Lu 2014-07-14  1633  
380c966c093e723 Jingchang Lu 2014-07-14  1634  	/* parity must be enabled when CS7 to match 8-bits format */
380c966c093e723 Jingchang Lu 2014-07-14  1635  	if ((termios->c_cflag & CSIZE) == CS7)
380c966c093e723 Jingchang Lu 2014-07-14  1636  		termios->c_cflag |= PARENB;
380c966c093e723 Jingchang Lu 2014-07-14  1637  
380c966c093e723 Jingchang Lu 2014-07-14  1638  	if ((termios->c_cflag & PARENB)) {
380c966c093e723 Jingchang Lu 2014-07-14  1639  		if (termios->c_cflag & CMSPAR) {
380c966c093e723 Jingchang Lu 2014-07-14  1640  			ctrl &= ~UARTCTRL_PE;
380c966c093e723 Jingchang Lu 2014-07-14  1641  			ctrl |= UARTCTRL_M;
380c966c093e723 Jingchang Lu 2014-07-14  1642  		} else {
380c966c093e723 Jingchang Lu 2014-07-14  1643  			ctrl |= UARTCR1_PE;
380c966c093e723 Jingchang Lu 2014-07-14  1644  			if ((termios->c_cflag & CSIZE) == CS8)
380c966c093e723 Jingchang Lu 2014-07-14  1645  				ctrl |= UARTCTRL_M;
380c966c093e723 Jingchang Lu 2014-07-14  1646  			if (termios->c_cflag & PARODD)
380c966c093e723 Jingchang Lu 2014-07-14  1647  				ctrl |= UARTCTRL_PT;
380c966c093e723 Jingchang Lu 2014-07-14  1648  			else
380c966c093e723 Jingchang Lu 2014-07-14  1649  				ctrl &= ~UARTCTRL_PT;
380c966c093e723 Jingchang Lu 2014-07-14  1650  		}
380c966c093e723 Jingchang Lu 2014-07-14  1651  	}
380c966c093e723 Jingchang Lu 2014-07-14  1652  
380c966c093e723 Jingchang Lu 2014-07-14  1653  	/* ask the core to calculate the divisor */
380c966c093e723 Jingchang Lu 2014-07-14  1654  	baud = uart_get_baud_rate(port, termios, old, 50, port->uartclk / 16);
380c966c093e723 Jingchang Lu 2014-07-14  1655  
380c966c093e723 Jingchang Lu 2014-07-14  1656  	spin_lock_irqsave(&sport->port.lock, flags);
380c966c093e723 Jingchang Lu 2014-07-14  1657  
380c966c093e723 Jingchang Lu 2014-07-14  1658  	sport->port.read_status_mask = 0;
380c966c093e723 Jingchang Lu 2014-07-14  1659  	if (termios->c_iflag & INPCK)
380c966c093e723 Jingchang Lu 2014-07-14  1660  		sport->port.read_status_mask |=	(UARTSTAT_FE | UARTSTAT_PE);
380c966c093e723 Jingchang Lu 2014-07-14  1661  	if (termios->c_iflag & (IGNBRK | BRKINT | PARMRK))
380c966c093e723 Jingchang Lu 2014-07-14  1662  		sport->port.read_status_mask |= UARTSTAT_FE;
380c966c093e723 Jingchang Lu 2014-07-14  1663  
380c966c093e723 Jingchang Lu 2014-07-14  1664  	/* characters to ignore */
380c966c093e723 Jingchang Lu 2014-07-14  1665  	sport->port.ignore_status_mask = 0;
380c966c093e723 Jingchang Lu 2014-07-14  1666  	if (termios->c_iflag & IGNPAR)
380c966c093e723 Jingchang Lu 2014-07-14  1667  		sport->port.ignore_status_mask |= UARTSTAT_PE;
380c966c093e723 Jingchang Lu 2014-07-14  1668  	if (termios->c_iflag & IGNBRK) {
380c966c093e723 Jingchang Lu 2014-07-14  1669  		sport->port.ignore_status_mask |= UARTSTAT_FE;
380c966c093e723 Jingchang Lu 2014-07-14  1670  		/*
380c966c093e723 Jingchang Lu 2014-07-14  1671  		 * if we're ignoring parity and break indicators,
380c966c093e723 Jingchang Lu 2014-07-14  1672  		 * ignore overruns too (for real raw support).
380c966c093e723 Jingchang Lu 2014-07-14  1673  		 */
380c966c093e723 Jingchang Lu 2014-07-14  1674  		if (termios->c_iflag & IGNPAR)
380c966c093e723 Jingchang Lu 2014-07-14  1675  			sport->port.ignore_status_mask |= UARTSTAT_OR;
380c966c093e723 Jingchang Lu 2014-07-14  1676  	}
380c966c093e723 Jingchang Lu 2014-07-14  1677  
380c966c093e723 Jingchang Lu 2014-07-14  1678  	/* update the per-port timeout */
380c966c093e723 Jingchang Lu 2014-07-14  1679  	uart_update_timeout(port, termios->c_cflag, baud);
380c966c093e723 Jingchang Lu 2014-07-14  1680  
380c966c093e723 Jingchang Lu 2014-07-14  1681  	/* wait transmit engin complete */
a0204f25e15cb5b Dong Aisheng 2017-06-13  1682  	while (!(lpuart32_read(&sport->port, UARTSTAT) & UARTSTAT_TC))
380c966c093e723 Jingchang Lu 2014-07-14  1683  		barrier();
380c966c093e723 Jingchang Lu 2014-07-14  1684  
380c966c093e723 Jingchang Lu 2014-07-14  1685  	/* disable transmit and receive */
a0204f25e15cb5b Dong Aisheng 2017-06-13  1686  	lpuart32_write(&sport->port, old_ctrl & ~(UARTCTRL_TE | UARTCTRL_RE),
a0204f25e15cb5b Dong Aisheng 2017-06-13  1687  		       UARTCTRL);
380c966c093e723 Jingchang Lu 2014-07-14  1688  
a6d7514b14a6ea2 Dong Aisheng 2017-06-13  1689  	lpuart32_serial_setbrg(sport, baud);
a0204f25e15cb5b Dong Aisheng 2017-06-13  1690  	lpuart32_write(&sport->port, modem, UARTMODIR);
a0204f25e15cb5b Dong Aisheng 2017-06-13  1691  	lpuart32_write(&sport->port, ctrl, UARTCTRL);
380c966c093e723 Jingchang Lu 2014-07-14  1692  	/* restore control register */
380c966c093e723 Jingchang Lu 2014-07-14  1693  
380c966c093e723 Jingchang Lu 2014-07-14  1694  	spin_unlock_irqrestore(&sport->port.lock, flags);
380c966c093e723 Jingchang Lu 2014-07-14  1695  }
380c966c093e723 Jingchang Lu 2014-07-14  1696  

:::::: The code at line 1590 was first introduced by commit
:::::: 380c966c093e7239e42a81f165b20b2bad2658bc tty: serial: fsl_lpuart: add 32-bit register interface support

:::::: TO: Jingchang Lu <jingchang.lu@freescale.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
