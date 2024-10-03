Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D757F48C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 09:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727948486; cv=none; b=Z7tDPQiRpV8DqGjQaQx9kjsT/cHvPX9MaHa2kzkguOfRnkSYBv6lsPG8TIsffm4dUK8RFXUdTlFZRcRxZhQaOSJ6G1yCnzVQmH+lxKP/XKA5O7m02PP29Kl1W8kgHuNWOPsksaxr59w8xQ4JX/lVhAcAwhK8+qq68gqDnqjHi7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727948486; c=relaxed/simple;
	bh=XF4rxEy9oGPtDT6yv4wqbNCU7yABHIc1o4iORVIq02c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bc7tcL1Ulv0iq2tm9XCQrx3tModyTNUgH3+0DKxLJfkjFEtWWUTDozBzk3VevzyNTqKnrR/uqUbo2voVRrBBHqGNm933DjihzwYru4alU8antcXcM2Kgc9A/Eeibglt2s3Jw4cSmpKjA15+8ea4FTnipWgDb5zxtDabnMHvj3F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDDn0VG3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDDn0VG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727948484; x=1759484484;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XF4rxEy9oGPtDT6yv4wqbNCU7yABHIc1o4iORVIq02c=;
  b=HDDn0VG3CTC9/Z5HvH000YXm+AdBQHihD9BexZ6dKjpYCCw4lpkW9UhB
   CWrzHtjeiXOg6VlpKDW09NUSshY+J25/2iTjMuLrxqIW2hl94gXqgvD3h
   S/Ef9LsYNsD4jU2ZgvE0CFWytDA9C9tgJK0Ao9MC0KVthWR/b5imxAnLm
   2BWsitFAWwAR1zjlAXTvJiSbCEGPPpRKUoJEQJ8Rx4WPN1WKN1iSinCGj
   NL86sKq19amaGOsQzUPLSKRSWMKg7tnX4vZurSWlV/R23oHPTCrvssGYa
   LeTccBdJ9xjN0QxmEfAQl0yavCahVkqVJVwY5cWsTKwXY7czV0MzFza1+
   A==;
X-CSE-ConnectionGUID: wL5zDSNZQFyKCUEqfp/xdw==
X-CSE-MsgGUID: IHUs24aAR/yNsi921TImcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26941901"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="26941901"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 02:41:24 -0700
X-CSE-ConnectionGUID: T30sBT33S76YFidLAtv9zQ==
X-CSE-MsgGUID: X72EKqNBT7aSOe+OuTCl7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="79142727"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Oct 2024 02:41:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swIKm-0000FC-1T;
	Thu, 03 Oct 2024 09:41:20 +0000
Date: Thu, 3 Oct 2024 17:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport 6/6] drivers/tty/serial/8250/8250_port.c:1206:3:
 error: call to _outb declared with 'error' attribute: outb() requires
 CONFIG_HAS_IOPORT
Message-ID: <202410031712.BwfGjrQY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport
head:   4ada123c36723c3ef6a6179839aa39a7901b710e
commit: 4ada123c36723c3ef6a6179839aa39a7901b710e [6/6] asm-generic/io.h: Remove I/O port accessors for HAS_IOPORT=n
config: um-randconfig-r051-20241003 (https://download.01.org/0day-ci/archive/20241003/202410031712.BwfGjrQY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031712.BwfGjrQY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031712.BwfGjrQY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_port.c:1206:3: error: call to _outb declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
                   outb(0xff, 0x080);
                   ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
   #define outb _outb
                ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
   #define _outb _outb
                 ^
   drivers/tty/serial/8250/8250_port.c:1215:3: error: call to _outb declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
                   outb(0, 0x080);
                   ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
   #define outb _outb
                ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
   #define _outb _outb
                 ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/error +1206 drivers/tty/serial/8250/8250_port.c

b6830f6df8914f Peter Hurley    2015-06-27  1156  
b6830f6df8914f Peter Hurley    2015-06-27  1157  /*
b6830f6df8914f Peter Hurley    2015-06-27  1158   * This routine is called by rs_init() to initialize a specific serial
b6830f6df8914f Peter Hurley    2015-06-27  1159   * port.  It determines what type of UART chip this serial port is
b6830f6df8914f Peter Hurley    2015-06-27  1160   * using: 8250, 16450, 16550, 16550A.  The important question is
b6830f6df8914f Peter Hurley    2015-06-27  1161   * whether or not this UART is a 16550A or not, since this will
b6830f6df8914f Peter Hurley    2015-06-27  1162   * determine whether or not we can use its FIFO features or not.
b6830f6df8914f Peter Hurley    2015-06-27  1163   */
b6830f6df8914f Peter Hurley    2015-06-27  1164  static void autoconfig(struct uart_8250_port *up)
b6830f6df8914f Peter Hurley    2015-06-27  1165  {
b6830f6df8914f Peter Hurley    2015-06-27  1166  	unsigned char status1, scratch, scratch2, scratch3;
b6830f6df8914f Peter Hurley    2015-06-27  1167  	unsigned char save_lcr, save_mcr;
b6830f6df8914f Peter Hurley    2015-06-27  1168  	struct uart_port *port = &up->port;
b6830f6df8914f Peter Hurley    2015-06-27  1169  	unsigned long flags;
b6830f6df8914f Peter Hurley    2015-06-27  1170  	unsigned int old_capabilities;
b6830f6df8914f Peter Hurley    2015-06-27  1171  
b6830f6df8914f Peter Hurley    2015-06-27  1172  	if (!port->iobase && !port->mapbase && !port->membase)
b6830f6df8914f Peter Hurley    2015-06-27  1173  		return;
b6830f6df8914f Peter Hurley    2015-06-27  1174  
286d9b8c7d2e5c Andy Shevchenko 2018-07-25  1175  	DEBUG_AUTOCONF("%s: autoconf (0x%04lx, 0x%p): ",
286d9b8c7d2e5c Andy Shevchenko 2018-07-25  1176  		       port->name, port->iobase, port->membase);
b6830f6df8914f Peter Hurley    2015-06-27  1177  
b6830f6df8914f Peter Hurley    2015-06-27  1178  	/*
b6830f6df8914f Peter Hurley    2015-06-27  1179  	 * We really do need global IRQs disabled here - we're going to
b6830f6df8914f Peter Hurley    2015-06-27  1180  	 * be frobbing the chips IRQ enable register to see if it exists.
d0b309a5d3f464 John Ogness     2023-05-25  1181  	 *
d0b309a5d3f464 John Ogness     2023-05-25  1182  	 * Synchronize UART_IER access against the console.
b6830f6df8914f Peter Hurley    2015-06-27  1183  	 */
e8f87d3c335702 Thomas Gleixner 2023-09-14  1184  	uart_port_lock_irqsave(port, &flags);
b6830f6df8914f Peter Hurley    2015-06-27  1185  
b6830f6df8914f Peter Hurley    2015-06-27  1186  	up->capabilities = 0;
b6830f6df8914f Peter Hurley    2015-06-27  1187  	up->bugs = 0;
b6830f6df8914f Peter Hurley    2015-06-27  1188  
b6830f6df8914f Peter Hurley    2015-06-27  1189  	if (!(port->flags & UPF_BUGGY_UART)) {
b6830f6df8914f Peter Hurley    2015-06-27  1190  		/*
b6830f6df8914f Peter Hurley    2015-06-27  1191  		 * Do a simple existence test first; if we fail this,
b6830f6df8914f Peter Hurley    2015-06-27  1192  		 * there's no point trying anything else.
b6830f6df8914f Peter Hurley    2015-06-27  1193  		 *
b6830f6df8914f Peter Hurley    2015-06-27  1194  		 * 0x80 is used as a nonsense port to prevent against
b6830f6df8914f Peter Hurley    2015-06-27  1195  		 * false positives due to ISA bus float.  The
b6830f6df8914f Peter Hurley    2015-06-27  1196  		 * assumption is that 0x80 is a non-existent port;
b6830f6df8914f Peter Hurley    2015-06-27  1197  		 * which should be safe since include/asm/io.h also
b6830f6df8914f Peter Hurley    2015-06-27  1198  		 * makes this assumption.
b6830f6df8914f Peter Hurley    2015-06-27  1199  		 *
b6830f6df8914f Peter Hurley    2015-06-27  1200  		 * Note: this is safe as long as MCR bit 4 is clear
b6830f6df8914f Peter Hurley    2015-06-27  1201  		 * and the device is in "PC" mode.
b6830f6df8914f Peter Hurley    2015-06-27  1202  		 */
b6830f6df8914f Peter Hurley    2015-06-27  1203  		scratch = serial_in(up, UART_IER);
b6830f6df8914f Peter Hurley    2015-06-27  1204  		serial_out(up, UART_IER, 0);
b6830f6df8914f Peter Hurley    2015-06-27  1205  #ifdef __i386__
b6830f6df8914f Peter Hurley    2015-06-27 @1206  		outb(0xff, 0x080);
b6830f6df8914f Peter Hurley    2015-06-27  1207  #endif
b6830f6df8914f Peter Hurley    2015-06-27  1208  		/*
b6830f6df8914f Peter Hurley    2015-06-27  1209  		 * Mask out IER[7:4] bits for test as some UARTs (e.g. TL
b6830f6df8914f Peter Hurley    2015-06-27  1210  		 * 16C754B) allow only to modify them if an EFR bit is set.
b6830f6df8914f Peter Hurley    2015-06-27  1211  		 */
ef460db2a7c1df Ilpo Järvinen   2022-11-25  1212  		scratch2 = serial_in(up, UART_IER) & UART_IER_ALL_INTR;
ef460db2a7c1df Ilpo Järvinen   2022-11-25  1213  		serial_out(up, UART_IER, UART_IER_ALL_INTR);
b6830f6df8914f Peter Hurley    2015-06-27  1214  #ifdef __i386__
b6830f6df8914f Peter Hurley    2015-06-27  1215  		outb(0, 0x080);
b6830f6df8914f Peter Hurley    2015-06-27  1216  #endif
ef460db2a7c1df Ilpo Järvinen   2022-11-25  1217  		scratch3 = serial_in(up, UART_IER) & UART_IER_ALL_INTR;
b6830f6df8914f Peter Hurley    2015-06-27  1218  		serial_out(up, UART_IER, scratch);
ef460db2a7c1df Ilpo Järvinen   2022-11-25  1219  		if (scratch2 != 0 || scratch3 != UART_IER_ALL_INTR) {
b6830f6df8914f Peter Hurley    2015-06-27  1220  			/*
b6830f6df8914f Peter Hurley    2015-06-27  1221  			 * We failed; there's nothing here
b6830f6df8914f Peter Hurley    2015-06-27  1222  			 */
e8f87d3c335702 Thomas Gleixner 2023-09-14  1223  			uart_port_unlock_irqrestore(port, flags);
b6830f6df8914f Peter Hurley    2015-06-27  1224  			DEBUG_AUTOCONF("IER test failed (%02x, %02x) ",
b6830f6df8914f Peter Hurley    2015-06-27  1225  				       scratch2, scratch3);
b6830f6df8914f Peter Hurley    2015-06-27  1226  			goto out;
b6830f6df8914f Peter Hurley    2015-06-27  1227  		}
b6830f6df8914f Peter Hurley    2015-06-27  1228  	}
b6830f6df8914f Peter Hurley    2015-06-27  1229  
36fd95b17e9c1c Yegor Yefremov  2016-05-31  1230  	save_mcr = serial8250_in_MCR(up);
b6830f6df8914f Peter Hurley    2015-06-27  1231  	save_lcr = serial_in(up, UART_LCR);
b6830f6df8914f Peter Hurley    2015-06-27  1232  
b6830f6df8914f Peter Hurley    2015-06-27  1233  	/*
b6830f6df8914f Peter Hurley    2015-06-27  1234  	 * Check to see if a UART is really there.  Certain broken
b6830f6df8914f Peter Hurley    2015-06-27  1235  	 * internal modems based on the Rockwell chipset fail this
b6830f6df8914f Peter Hurley    2015-06-27  1236  	 * test, because they apparently don't implement the loopback
b6830f6df8914f Peter Hurley    2015-06-27  1237  	 * test mode.  So this test is skipped on the COM 1 through
b6830f6df8914f Peter Hurley    2015-06-27  1238  	 * COM 4 ports.  This *should* be safe, since no board
b6830f6df8914f Peter Hurley    2015-06-27  1239  	 * manufacturer would be stupid enough to design a board
b6830f6df8914f Peter Hurley    2015-06-27  1240  	 * that conflicts with COM 1-4 --- we hope!
b6830f6df8914f Peter Hurley    2015-06-27  1241  	 */
b6830f6df8914f Peter Hurley    2015-06-27  1242  	if (!(port->flags & UPF_SKIP_TEST)) {
67a9aee7815d10 Ilpo Järvinen   2022-11-25  1243  		serial8250_out_MCR(up, UART_MCR_LOOP | UART_MCR_OUT2 | UART_MCR_RTS);
d9c1d3cbdeec94 Ilpo Järvinen   2022-11-25  1244  		status1 = serial_in(up, UART_MSR) & UART_MSR_STATUS_BITS;
36fd95b17e9c1c Yegor Yefremov  2016-05-31  1245  		serial8250_out_MCR(up, save_mcr);
d9c1d3cbdeec94 Ilpo Järvinen   2022-11-25  1246  		if (status1 != (UART_MSR_DCD | UART_MSR_CTS)) {
e8f87d3c335702 Thomas Gleixner 2023-09-14  1247  			uart_port_unlock_irqrestore(port, flags);
b6830f6df8914f Peter Hurley    2015-06-27  1248  			DEBUG_AUTOCONF("LOOP test failed (%02x) ",
b6830f6df8914f Peter Hurley    2015-06-27  1249  				       status1);
b6830f6df8914f Peter Hurley    2015-06-27  1250  			goto out;
b6830f6df8914f Peter Hurley    2015-06-27  1251  		}
b6830f6df8914f Peter Hurley    2015-06-27  1252  	}
b6830f6df8914f Peter Hurley    2015-06-27  1253  
b6830f6df8914f Peter Hurley    2015-06-27  1254  	/*
b6830f6df8914f Peter Hurley    2015-06-27  1255  	 * We're pretty sure there's a port here.  Lets find out what
b6830f6df8914f Peter Hurley    2015-06-27  1256  	 * type of port it is.  The IIR top two bits allows us to find
b6830f6df8914f Peter Hurley    2015-06-27  1257  	 * out if it's 8250 or 16450, 16550, 16550A or later.  This
b6830f6df8914f Peter Hurley    2015-06-27  1258  	 * determines what we test for next.
b6830f6df8914f Peter Hurley    2015-06-27  1259  	 *
b6830f6df8914f Peter Hurley    2015-06-27  1260  	 * We also initialise the EFR (if any) to zero for later.  The
b6830f6df8914f Peter Hurley    2015-06-27  1261  	 * EFR occupies the same register location as the FCR and IIR.
b6830f6df8914f Peter Hurley    2015-06-27  1262  	 */
b6830f6df8914f Peter Hurley    2015-06-27  1263  	serial_out(up, UART_LCR, UART_LCR_CONF_MODE_B);
b6830f6df8914f Peter Hurley    2015-06-27  1264  	serial_out(up, UART_EFR, 0);
b6830f6df8914f Peter Hurley    2015-06-27  1265  	serial_out(up, UART_LCR, 0);
b6830f6df8914f Peter Hurley    2015-06-27  1266  
b6830f6df8914f Peter Hurley    2015-06-27  1267  	serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO);
b6830f6df8914f Peter Hurley    2015-06-27  1268  
3398cc4f2b1592 Ilpo Järvinen   2022-11-25  1269  	switch (serial_in(up, UART_IIR) & UART_IIR_FIFO_ENABLED) {
3398cc4f2b1592 Ilpo Järvinen   2022-11-25  1270  	case UART_IIR_FIFO_ENABLED_8250:
b6830f6df8914f Peter Hurley    2015-06-27  1271  		autoconfig_8250(up);
b6830f6df8914f Peter Hurley    2015-06-27  1272  		break;
3398cc4f2b1592 Ilpo Järvinen   2022-11-25  1273  	case UART_IIR_FIFO_ENABLED_16550:
b6830f6df8914f Peter Hurley    2015-06-27  1274  		port->type = PORT_16550;
b6830f6df8914f Peter Hurley    2015-06-27  1275  		break;
3398cc4f2b1592 Ilpo Järvinen   2022-11-25  1276  	case UART_IIR_FIFO_ENABLED_16550A:
b6830f6df8914f Peter Hurley    2015-06-27  1277  		autoconfig_16550a(up);
b6830f6df8914f Peter Hurley    2015-06-27  1278  		break;
3398cc4f2b1592 Ilpo Järvinen   2022-11-25  1279  	default:
3398cc4f2b1592 Ilpo Järvinen   2022-11-25  1280  		port->type = PORT_UNKNOWN;
3398cc4f2b1592 Ilpo Järvinen   2022-11-25  1281  		break;
b6830f6df8914f Peter Hurley    2015-06-27  1282  	}
b6830f6df8914f Peter Hurley    2015-06-27  1283  

:::::: The code at line 1206 was first introduced by commit
:::::: b6830f6df8914faae9561bb245860c21af9b9e9b serial: 8250: Split base port operations from universal driver

:::::: TO: Peter Hurley <peter@hurleysoftware.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
