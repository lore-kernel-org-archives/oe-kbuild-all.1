Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5413428DB55
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790427465; cv=none; b=eMnUZd4BoKQr5dUryAnMFNaWqC4vnqOTpO9PX6ezOzrAIJoRfJYwdfxi+PqBmVs4+zQq1s6oDkyrmZRccCyug4AhRQZ6VzVYHMKLg52ETHjztpKEA42merapNYu8wnx9vunOx0PXdQNdPoJ+zJk9sxDs4d8515kDXy5819+LpE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790427465; c=relaxed/simple;
	bh=KnVJ/3nK/dbVy7XfxkJRX8P0QxQH5yHN2lH572fAw3M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hzo9l6XD/6cUFDlMTJqoAGngpW6YDlUvTiIFPt5jOYvv5WvehdImR3JiL3Pvs3ELQVDho9ECWPHT4ZxcbqW/AbuVE2ywQg61nWTqPb+wlqiyp5fSoQh+/Ul8JU8rELnpFXdwpl4N/yd1Jh62+g/bc18aSa4IYc5ZtIVt9Qswx1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCpIoxkj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCpIoxkj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790427463; x=1821963463;
  h=date:from:to:cc:subject:message-id;
  bh=KnVJ/3nK/dbVy7XfxkJRX8P0QxQH5yHN2lH572fAw3M=;
  b=hCpIoxkjF4/XmZnkqdqJtxYMat/sMI0IHfXDN1mNK5kcpDtqyBLeIxXw
   VskmljHDzJdnAgTTkZh9povRO7UUm/Yg+V84j4OcEXpokv8RepQmI3/os
   T/5IKPnXNp0Jt/YipV98pcP9tHaTAP5SCsdlHMbJ8Nz8PU405nOC/MUyA
   blH9xc0qftDNCRUPFMyaR+nc+8HsaOrizFWGHVVlEstZ1YlxRxWYYfQwB
   4uFQ1P5gvAMR/DuRDPkEJG9ubpTMigHhLBH6x8NKzsSq5LQx0RGae16OE
   5E9e4EAKL9xEGU8KYgWXpG4JRbYJ6DWD8T3OHHQ/TP95R2OeYP7lrIkxp
   Q==;
X-CSE-ConnectionGUID: b8xgoaYAS9eC9DFlqawDEQ==
X-CSE-MsgGUID: HYDQhU0cQ0WEjL1DeiMIlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="93686383"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="93686383"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 05:57:42 -0700
X-CSE-ConnectionGUID: N053XB12TUq+TxwDAgjXqA==
X-CSE-MsgGUID: y459GDooRp6EUp0e+h+BIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="274706954"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 Sep 2026 05:57:41 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xARyE-000000000Wx-3tX1;
	Sat, 26 Sep 2026 12:57:38 +0000
Date: Sat, 26 Sep 2026 14:57:08 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 341/673]
 drivers/tty/serial/8250/8250_core.c:890:15: error: implicit declaration of
 function 'sunserial_register_minors'
Message-ID: <202609261445.lXErIkHu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 5c27deb5e38ceb5b6a9dcffcfe906bd26248b74f [341/673] serial: 8250: split out legacy isa driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20260926/202609261445.lXErIkHu-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261445.lXErIkHu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261445.lXErIkHu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tty/serial/8250/8250_core.c:41:
   drivers/tty/serial/8250/8250.h: In function 'serial8250_apply_quirks':
   drivers/tty/serial/8250/8250.h:226:36: error: 'skip_txen_test' undeclared (first use in this function)
     226 |                 up->port.quirks |= skip_txen_test ? UPQ_NO_TXEN_TEST : 0;
         |                                    ^~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250.h:226:36: note: each undeclared identifier is reported only once for each function it appears in
   drivers/tty/serial/8250/8250_core.c: In function 'serial8250_init':
>> drivers/tty/serial/8250/8250_core.c:890:15: error: implicit declaration of function 'sunserial_register_minors' [-Wimplicit-function-declaration]
     890 |         ret = sunserial_register_minors(&serial8250_reg, UART_NR);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_core.c:903:9: error: implicit declaration of function 'sunserial_unregister_minors' [-Wimplicit-function-declaration]
     903 |         sunserial_unregister_minors(&serial8250_reg, UART_NR);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sunserial_register_minors +890 drivers/tty/serial/8250/8250_core.c

   882	
   883	static int __init serial8250_init(void)
   884	{
   885		int ret;
   886	
   887		serial8250_setup_ports();
   888	
   889	#ifdef CONFIG_SPARC
 > 890		ret = sunserial_register_minors(&serial8250_reg, UART_NR);
   891	#else
   892		serial8250_reg.nr = UART_NR;
   893		ret = uart_register_driver(&serial8250_reg);
   894	#endif
   895		if (ret)
   896			goto out;
   897	
   898		ret = serial8250_isa_init();
   899		if (ret == 0)
   900			return 0;
   901	
   902	#ifdef CONFIG_SPARC
 > 903		sunserial_unregister_minors(&serial8250_reg, UART_NR);
   904	#else
   905		uart_unregister_driver(&serial8250_reg);
   906	#endif
   907	out:
   908		return ret;
   909	}
   910	module_init(serial8250_init);
   911	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
