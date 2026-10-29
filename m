Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311522;
	b=yj8VVf6Vl2MX6A1S/MbKrYIkoJBQtVgWbEhuD1brNAG5Ntg8CxxSn/U+1CvReJ99VsbU
	 HzHqVxOG9L2Ng+L8pmUPgeO0KEPEQM3X/FlFo9oF0QofeXpkNsqH9BYxFtFHUMk2G6I6f
	 AxGvcd9pfmv5oO4bdpxoYMdP9LhZ776U38d3cP2lsu0avVvXlRff1ilYzL1tCAdY7wnKC
	 yedx9HVKG2+KZwmrKTjfQW4XoHg+ud6apLCj9+vDic10x90Ah45ogddqOROOOp8ul1B3r
	 ZEOthjNi86pCGeWmQ40CT0t/AGKrWGRPRAdoZmnSjHflh5DFTKTWQNA89z7OtW7uaGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311522;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7J6PRPHSKUnIOwIA4yAHUHCwNYoLtNTfkzMij/uxHQ0=;
	b=w+C1GWj9Omeh2Nax1UiopORlfD0uK9u2EytSMoAlPj17je2/0oq4IXWBtSSWtQAlmd0b
	 r0IPqNsTMd6tCW/eILR7Gp0Avp7foqDW7o3fcbKcKUwOK7iKZCm6Ew4gaZFHcef3pw/Ze
	 6OL9B5u+QnC7fktkngsjns/cEptfyGIocKk/Oqz2nbr1i4OqEMlg9O9WdsUtvuaxrG3Xr
	 xhqrY1PvLPliC0nQ+xLuFqdsNdtcA0UZgZjS1S8tiGXjsO59s0gSaJd0++J67Xrk7xuGU
	 LBwO99J9WLyK/Qn1+xLpk/vuenYJBv8o+yEV8pjXmvix1QMvHUGmWotyuw9Nn9PZjnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SdFsbkT4;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F24606A31E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 22:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F24606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SdFsbkT4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793311521; x=1824847521;
  h=date:from:to:cc:subject:message-id;
  bh=zfi3zrGpmbAFFzsmGVY7MN9nBCyfKT+BXAbCGWY4ZYw=;
  b=SdFsbkT4zZVwB+Q1NUfHoEmWc6G1ksuykyaoNDCKVJGWyiL/udgNPD/w
   DGT8jaHhGk1ANuHIyUCATaKjtCUme4BzpFkS8D6vUXHiapOHNg+FXCuAJ
   trLkWgxUzuqVl3lOro/8HBpWIrKWAj7ZNqfKTJBKG2NedksH+8Jm1wnY1
   yGeReMoN0hqvNntwBWCnfBTg598/+AVZUD3CLWliS44CDGs0DStVvrugr
   EOZwDpbazS66Mv7XeBL2Oj/QcqS+0LEhAHwXa4JMd40yC4772sbgJeJLu
   IMFIVvzsXP+9ZYWytFufzSiMRLzO0rKdscljRerhR22w8kNmrwMhe0fnD
   g==;
X-CSE-ConnectionGUID: /OZ8iBtBQMiLCSVHWHqrPg==
X-CSE-MsgGUID: q0SY8nESSx2X2HfIpdHIhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1953531"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1953531"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 15:05:20 -0700
X-CSE-ConnectionGUID: oEIYz3EeScy7TholIcY5AA==
X-CSE-MsgGUID: ywNdhw+bSsCuCgGLbqgFsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5141596"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 29 Oct 2026 15:05:19 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMYFI-000000005MB-3f55;
	Thu, 29 Oct 2026 22:05:16 +0000
Date: Thu, 29 Oct 2026 23:05:02 +0100
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [johan-usb-serial:usb-linus 7/12]
 drivers/usb/serial/io_edgeport.c:2320 edge_set_termios() warn: inconsistent
 indenting
Message-ID: <202610292246.UtbEkoLN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git usb-linus
head:   ab89a9dab02d9553eb0cc27fd3e4a4998acbc8e9
commit: febadc65a4ef8d08a12e76d6ec50834d72cc0e59 [7/12] USB: serial: io_edgeport: move initial termios update to open()
config: parisc-randconfig-r2201-20261029 (https://download.01.org/0day-ci/archive/20261029/202610292246.UtbEkoLN-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610292246.UtbEkoLN-lkp@intel.com/

smatch warnings:
drivers/usb/serial/io_edgeport.c:2320 edge_set_termios() warn: inconsistent indenting

vim +2320 drivers/usb/serial/io_edgeport.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  2297  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2298  
febadc65a4ef8d0 Johan Hovold       2026-10-23  2299  static void edge_set_termios(struct tty_struct *tty, struct usb_serial_port *port,
febadc65a4ef8d0 Johan Hovold       2026-10-23  2300  		const struct ktermios *old_termios)
^1da177e4c3f415 Linus Torvalds     2005-04-16  2301  {
febadc65a4ef8d0 Johan Hovold       2026-10-23  2302  	struct edgeport_serial *edge_serial = usb_get_serial_data(port->serial);
febadc65a4ef8d0 Johan Hovold       2026-10-23  2303  	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
febadc65a4ef8d0 Johan Hovold       2026-10-23  2304  	struct device *dev = &port->dev;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2305  	int baud;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2306  	unsigned cflag;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2307  	__u8 mask = 0xff;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2308  	__u8 lData;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2309  	__u8 lParity;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2310  	__u8 lStop;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2311  	__u8 rxFlow;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2312  	__u8 txFlow;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2313  	int status;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2314  
adc8d746caa67ff Alan Cox           2012-07-14  2315  	cflag = tty->termios.c_cflag;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2316  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2317  	switch (cflag & CSIZE) {
03f0dbf74c7a117 Alan Cox           2008-07-22  2318  	case CS5:
03f0dbf74c7a117 Alan Cox           2008-07-22  2319  		lData = LCR_BITS_5; mask = 0x1f;
984f68683298ba5 Greg Kroah-Hartman 2012-09-18 @2320  		dev_dbg(dev, "%s - data bits = 5\n", __func__);
03f0dbf74c7a117 Alan Cox           2008-07-22  2321  		break;
03f0dbf74c7a117 Alan Cox           2008-07-22  2322  	case CS6:
03f0dbf74c7a117 Alan Cox           2008-07-22  2323  		lData = LCR_BITS_6; mask = 0x3f;
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2324  		dev_dbg(dev, "%s - data bits = 6\n", __func__);
03f0dbf74c7a117 Alan Cox           2008-07-22  2325  		break;
03f0dbf74c7a117 Alan Cox           2008-07-22  2326  	case CS7:
03f0dbf74c7a117 Alan Cox           2008-07-22  2327  		lData = LCR_BITS_7; mask = 0x7f;
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2328  		dev_dbg(dev, "%s - data bits = 7\n", __func__);
03f0dbf74c7a117 Alan Cox           2008-07-22  2329  		break;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2330  	default:
03f0dbf74c7a117 Alan Cox           2008-07-22  2331  	case CS8:
03f0dbf74c7a117 Alan Cox           2008-07-22  2332  		lData = LCR_BITS_8;
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2333  		dev_dbg(dev, "%s - data bits = 8\n", __func__);
03f0dbf74c7a117 Alan Cox           2008-07-22  2334  		break;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2335  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  2336  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2337  	lParity = LCR_PAR_NONE;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2338  	if (cflag & PARENB) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  2339  		if (cflag & CMSPAR) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  2340  			if (cflag & PARODD) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  2341  				lParity = LCR_PAR_MARK;
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2342  				dev_dbg(dev, "%s - parity = mark\n", __func__);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2343  			} else {
^1da177e4c3f415 Linus Torvalds     2005-04-16  2344  				lParity = LCR_PAR_SPACE;
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2345  				dev_dbg(dev, "%s - parity = space\n", __func__);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2346  			}
^1da177e4c3f415 Linus Torvalds     2005-04-16  2347  		} else if (cflag & PARODD) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  2348  			lParity = LCR_PAR_ODD;
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2349  			dev_dbg(dev, "%s - parity = odd\n", __func__);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2350  		} else {
^1da177e4c3f415 Linus Torvalds     2005-04-16  2351  			lParity = LCR_PAR_EVEN;
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2352  			dev_dbg(dev, "%s - parity = even\n", __func__);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2353  		}
^1da177e4c3f415 Linus Torvalds     2005-04-16  2354  	} else {
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2355  		dev_dbg(dev, "%s - parity = none\n", __func__);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2356  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  2357  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2358  	if (cflag & CSTOPB) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  2359  		lStop = LCR_STOP_2;
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2360  		dev_dbg(dev, "%s - stop bits = 2\n", __func__);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2361  	} else {
^1da177e4c3f415 Linus Torvalds     2005-04-16  2362  		lStop = LCR_STOP_1;
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2363  		dev_dbg(dev, "%s - stop bits = 1\n", __func__);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2364  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  2365  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2366  	/* figure out the flow control settings */
^1da177e4c3f415 Linus Torvalds     2005-04-16  2367  	rxFlow = txFlow = 0x00;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2368  	if (cflag & CRTSCTS) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  2369  		rxFlow |= IOSP_RX_FLOW_RTS;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2370  		txFlow |= IOSP_TX_FLOW_CTS;
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2371  		dev_dbg(dev, "%s - RTS/CTS is enabled\n", __func__);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2372  	} else {
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2373  		dev_dbg(dev, "%s - RTS/CTS is disabled\n", __func__);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2374  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  2375  
03f0dbf74c7a117 Alan Cox           2008-07-22  2376  	/* if we are implementing XON/XOFF, set the start and stop character
03f0dbf74c7a117 Alan Cox           2008-07-22  2377  	   in the device */
^1da177e4c3f415 Linus Torvalds     2005-04-16  2378  	if (I_IXOFF(tty) || I_IXON(tty)) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  2379  		unsigned char stop_char  = STOP_CHAR(tty);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2380  		unsigned char start_char = START_CHAR(tty);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2381  
232dce89b5b0007 Geyslan G. Bem     2015-12-11  2382  		if (!edge_serial->is_epic ||
232dce89b5b0007 Geyslan G. Bem     2015-12-11  2383  		    edge_serial->epic_descriptor.Supports.IOSPSetXChar) {
03f0dbf74c7a117 Alan Cox           2008-07-22  2384  			send_iosp_ext_cmd(edge_port,
03f0dbf74c7a117 Alan Cox           2008-07-22  2385  					IOSP_CMD_SET_XON_CHAR, start_char);
03f0dbf74c7a117 Alan Cox           2008-07-22  2386  			send_iosp_ext_cmd(edge_port,
03f0dbf74c7a117 Alan Cox           2008-07-22  2387  					IOSP_CMD_SET_XOFF_CHAR, stop_char);
6e8cf7751f9fb91 Greg Kroah-Hartman 2007-01-18  2388  		}
^1da177e4c3f415 Linus Torvalds     2005-04-16  2389  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2390  		/* if we are implementing INBOUND XON/XOFF */
^1da177e4c3f415 Linus Torvalds     2005-04-16  2391  		if (I_IXOFF(tty)) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  2392  			rxFlow |= IOSP_RX_FLOW_XON_XOFF;
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2393  			dev_dbg(dev, "%s - INBOUND XON/XOFF is enabled, XON = %2x, XOFF = %2x\n",
03f0dbf74c7a117 Alan Cox           2008-07-22  2394  				__func__, start_char, stop_char);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2395  		} else {
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2396  			dev_dbg(dev, "%s - INBOUND XON/XOFF is disabled\n", __func__);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2397  		}
^1da177e4c3f415 Linus Torvalds     2005-04-16  2398  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2399  		/* if we are implementing OUTBOUND XON/XOFF */
^1da177e4c3f415 Linus Torvalds     2005-04-16  2400  		if (I_IXON(tty)) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  2401  			txFlow |= IOSP_TX_FLOW_XON_XOFF;
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2402  			dev_dbg(dev, "%s - OUTBOUND XON/XOFF is enabled, XON = %2x, XOFF = %2x\n",
03f0dbf74c7a117 Alan Cox           2008-07-22  2403  				__func__, start_char, stop_char);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2404  		} else {
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2405  			dev_dbg(dev, "%s - OUTBOUND XON/XOFF is disabled\n", __func__);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2406  		}
^1da177e4c3f415 Linus Torvalds     2005-04-16  2407  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  2408  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2409  	/* Set flow control to the configured value */
232dce89b5b0007 Geyslan G. Bem     2015-12-11  2410  	if (!edge_serial->is_epic ||
232dce89b5b0007 Geyslan G. Bem     2015-12-11  2411  	    edge_serial->epic_descriptor.Supports.IOSPSetRxFlow)
^1da177e4c3f415 Linus Torvalds     2005-04-16  2412  		send_iosp_ext_cmd(edge_port, IOSP_CMD_SET_RX_FLOW, rxFlow);
232dce89b5b0007 Geyslan G. Bem     2015-12-11  2413  	if (!edge_serial->is_epic ||
232dce89b5b0007 Geyslan G. Bem     2015-12-11  2414  	    edge_serial->epic_descriptor.Supports.IOSPSetTxFlow)
^1da177e4c3f415 Linus Torvalds     2005-04-16  2415  		send_iosp_ext_cmd(edge_port, IOSP_CMD_SET_TX_FLOW, txFlow);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2416  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2417  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2418  	edge_port->shadowLCR &= ~(LCR_BITS_MASK | LCR_STOP_MASK | LCR_PAR_MASK);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2419  	edge_port->shadowLCR |= (lData | lParity | lStop);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2420  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2421  	edge_port->validDataMask = mask;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2422  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2423  	/* Send the updated LCR value to the EdgePort */
03f0dbf74c7a117 Alan Cox           2008-07-22  2424  	status = send_cmd_write_uart_register(edge_port, LCR,
03f0dbf74c7a117 Alan Cox           2008-07-22  2425  							edge_port->shadowLCR);
03f0dbf74c7a117 Alan Cox           2008-07-22  2426  	if (status != 0)
^1da177e4c3f415 Linus Torvalds     2005-04-16  2427  		return;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2428  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2429  	/* set up the MCR register and send it to the EdgePort */
^1da177e4c3f415 Linus Torvalds     2005-04-16  2430  	edge_port->shadowMCR = MCR_MASTER_IE;
03f0dbf74c7a117 Alan Cox           2008-07-22  2431  	if (cflag & CBAUD)
^1da177e4c3f415 Linus Torvalds     2005-04-16  2432  		edge_port->shadowMCR |= (MCR_DTR | MCR_RTS);
03f0dbf74c7a117 Alan Cox           2008-07-22  2433  
03f0dbf74c7a117 Alan Cox           2008-07-22  2434  	status = send_cmd_write_uart_register(edge_port, MCR,
03f0dbf74c7a117 Alan Cox           2008-07-22  2435  						edge_port->shadowMCR);
03f0dbf74c7a117 Alan Cox           2008-07-22  2436  	if (status != 0)
^1da177e4c3f415 Linus Torvalds     2005-04-16  2437  		return;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2438  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2439  	/* Determine divisor based on baud rate */
^1da177e4c3f415 Linus Torvalds     2005-04-16  2440  	baud = tty_get_baud_rate(tty);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2441  	if (!baud) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  2442  		/* pick a default, any default... */
^1da177e4c3f415 Linus Torvalds     2005-04-16  2443  		baud = 9600;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2444  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  2445  
984f68683298ba5 Greg Kroah-Hartman 2012-09-18  2446  	dev_dbg(dev, "%s - baud rate = %d\n", __func__, baud);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2447  	status = send_cmd_write_baud_rate(edge_port, baud);
febadc65a4ef8d0 Johan Hovold       2026-10-23  2448  	if (status == -1 && old_termios) {
6ce073bd8be0a74 Alan Cox           2007-10-18  2449  		/* Speed change was not possible - put back the old speed */
6ce073bd8be0a74 Alan Cox           2007-10-18  2450  		baud = tty_termios_baud_rate(old_termios);
6ce073bd8be0a74 Alan Cox           2007-10-18  2451  		tty_encode_baud_rate(tty, baud, baud);
6ce073bd8be0a74 Alan Cox           2007-10-18  2452  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  2453  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  2454  

:::::: The code at line 2320 was first introduced by commit
:::::: 984f68683298ba53af32f909de1f9452fbb37ccb USB: serial: io_edgeport.c: remove dbg() usage

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
