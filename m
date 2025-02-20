Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B071A920
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 06:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740031502; cv=none; b=VEvr/G+qQbaIgY93HgV7XqWu9kwU6PysTh0jnsRyYvjzXLw82ONigbMXbykRVTYRLAn3flSPnwA6Tc7azfSKMifVHKe28LjVJpvnfPBI140B6EBhVSLsc27WgeUymTUtUe4z97sUPzSSZeSoDSVwaiJsfOLtKUkRBWalJs1QiT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740031502; c=relaxed/simple;
	bh=jevWpQWS7+464rnswUl+ITpDSpldFuwfhnjaDC6q6gU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RGuIDnIeIvoUkyySHDHxRzZgRqkJ+xGHDoBQLZItmEeQbZX6YdBkJ5DF3SaX0Du2u/4vvbddfu2VMjcYOQVM2GrllZ15AaYgHWdRbyxMSdDSpZRKJQ/SzfCS3kdrLyqTq82MuV6AtZNa5kdOfvNuZFq+9V9JH4OpYA6No1hBCWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5Z1AZEg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5Z1AZEg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740031501; x=1771567501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jevWpQWS7+464rnswUl+ITpDSpldFuwfhnjaDC6q6gU=;
  b=e5Z1AZEgKoV9XwwUhJgn6TLw2Afh78Rz4biunSkRdtnCJh66kz0jxGJn
   S/q+ZUlz7D3NjpPPoXpxQnjv5OZH4gNAp60NNJYcjCmc4F7H8HQfxTffb
   nGXXxxycx94H8mSBoA48zdpnThLDEVOxpmyNUvZLQdeZtLesNb85HuDdr
   9H7GVoNAqgRfwtyPQIwAdqFR2g9lCGRLepCzo15M2Xck+TzM/eBBrvkwq
   32Xs2fEIZ4p5z36CCKU7BSD01f+FGrAAsXOt44+c4L3Nn01JMT6rOpDsr
   g+UlL8iTmWZny6yx7ezeHZGZsCavkFA1KvWX3Fv7xf3kkp1dzo0bW6NDG
   g==;
X-CSE-ConnectionGUID: qPzLAjCWRNus+FmBwtWBEg==
X-CSE-MsgGUID: 3fhjM6zuQhakgC1FRmxJpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51438687"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="51438687"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 22:05:00 -0800
X-CSE-ConnectionGUID: VrT7POvcQfGzOL5VLEUS3w==
X-CSE-MsgGUID: 0enuceJpStasyQKF3yYUuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114792555"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 Feb 2025 22:04:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkzg8-0003ud-2x;
	Thu, 20 Feb 2025 06:04:56 +0000
Date: Thu, 20 Feb 2025 14:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: [intel-lts:pr/59 1/1] drivers/tty/serial/8250/8250_port.c:2054:25:
 warning: unused variable 'up'
Message-ID: <202502201313.wKrf30dc-lkp@intel.com>
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
commit: 20d2b572f04e7777c14c00eae743d7a4fd329653 [1/1] serial: 8250_port: Remove calls to runtime PM
config: sparc-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250220/202502201313.wKrf30dc-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502201313.wKrf30dc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502201313.wKrf30dc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_port.c: In function 'serial8250_get_poll_char':
>> drivers/tty/serial/8250/8250_port.c:2054:25: warning: unused variable 'up' [-Wunused-variable]
     struct uart_8250_port *up = up_to_u8250p(port);
                            ^~
--
   arch/sparc/kernel/head_32.o: in function `current_pc':
>> (.head.text+0x2040): relocation truncated to fit: R_SPARC_WDISP22 against `.init.text'
   arch/sparc/kernel/head_32.o: in function `halt_notsup':
   (.head.text+0x2100): relocation truncated to fit: R_SPARC_WDISP22 against `.init.text'
   arch/sparc/kernel/process_32.o:(.fixup+0x4): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/process_32.o:(.fixup+0xc): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x0): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x8): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x10): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x18): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x20): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x28): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x30): additional relocation overflows omitted from the output


vim +/up +2054 drivers/tty/serial/8250/8250_port.c

b6830f6df8914fa Peter Hurley    2015-06-27  2045  
b6830f6df8914fa Peter Hurley    2015-06-27  2046  #ifdef CONFIG_CONSOLE_POLL
b6830f6df8914fa Peter Hurley    2015-06-27  2047  /*
b6830f6df8914fa Peter Hurley    2015-06-27  2048   * Console polling routines for writing and reading from the uart while
b6830f6df8914fa Peter Hurley    2015-06-27  2049   * in an interrupt or debug context.
b6830f6df8914fa Peter Hurley    2015-06-27  2050   */
b6830f6df8914fa Peter Hurley    2015-06-27  2051  
b6830f6df8914fa Peter Hurley    2015-06-27  2052  static int serial8250_get_poll_char(struct uart_port *port)
b6830f6df8914fa Peter Hurley    2015-06-27  2053  {
b6830f6df8914fa Peter Hurley    2015-06-27 @2054  	struct uart_8250_port *up = up_to_u8250p(port);
b6830f6df8914fa Peter Hurley    2015-06-27  2055  	unsigned char lsr;
b6830f6df8914fa Peter Hurley    2015-06-27  2056  
b6830f6df8914fa Peter Hurley    2015-06-27  2057  	lsr = serial_port_in(port, UART_LSR);
20d2b572f04e777 Andy Shevchenko 2016-11-16  2058  	if (!(lsr & UART_LSR_DR))
20d2b572f04e777 Andy Shevchenko 2016-11-16  2059  		return NO_POLL_CHAR;
b6830f6df8914fa Peter Hurley    2015-06-27  2060  
20d2b572f04e777 Andy Shevchenko 2016-11-16  2061  	return serial_port_in(port, UART_RX);
b6830f6df8914fa Peter Hurley    2015-06-27  2062  }
b6830f6df8914fa Peter Hurley    2015-06-27  2063  

:::::: The code at line 2054 was first introduced by commit
:::::: b6830f6df8914faae9561bb245860c21af9b9e9b serial: 8250: Split base port operations from universal driver

:::::: TO: Peter Hurley <peter@hurleysoftware.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
