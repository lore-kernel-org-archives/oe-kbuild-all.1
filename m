Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DE95399
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 03:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVhzHrX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699672116; x=1731208116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sk5SujMB+UZtQwRYs+lV7I9ZtkDqZWntPDl3NGfjJpw=;
  b=cVhzHrX5rvvtDJF4S0b9bU9RKC8j8K0nB1s31N7nkW0y8IYKKbKLMlmF
   I1nd53b8Io23eh36c1EAUDYDtFdnVO6VbaY6cOhOkxaK36SrMkAtCEv72
   q2jglCJBFO8D9WAS7z+hTq6v/3AsB7p/BfbL1IluYmBRYWyrvJQYt+D14
   hcb5/top1ZOt0V/RQJ8UhQ2hCq5mCwAAvjxwzqiOOGkOMR1NusE1D60Pf
   YKd+6ikxLdBdVz+nb+lHkYuJwPzfQwcLQNmj92oGujXxKMUBs85Aw4dW2
   wWT/cQMZuPETn/r6iCJMhoh2rK6AHZY9VYMDop8mCiobJqL4fPIWjvBHS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="393124587"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="393124587"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 19:08:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="757343100"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="757343100"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Nov 2023 19:08:34 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1eMK-000AAE-0H;
	Sat, 11 Nov 2023 03:08:32 +0000
Date: Sat, 11 Nov 2023 11:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.7 208/336]
 drivers/tty/serial/8250/8250_core.c:350:38: warning: left shift of negative
 value
Message-ID: <202311111140.GkbRCIfy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7
head:   a4b755e29c5eea2a696d7ec17a623dcb675a9897
commit: 11d4b1a0517e9ce64436fa4019bafaf2895ca282 [208/336] [SUBMITTED 20230811] extrawarn: don't turn off -Wshift-negative-value for gcc-9
config: x86_64-randconfig-011-20231111 (https://download.01.org/0day-ci/archive/20231111/202311111140.GkbRCIfy-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111140.GkbRCIfy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111140.GkbRCIfy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_core.c: In function 'serial8250_request_rsa_resource':
>> drivers/tty/serial/8250/8250_core.c:350:38: warning: left shift of negative value [-Wshift-negative-value]
     350 |  unsigned long start = UART_RSA_BASE << up->port.regshift;
         |                                      ^~
   drivers/tty/serial/8250/8250_core.c: In function 'serial8250_release_rsa_resource':
   drivers/tty/serial/8250/8250_core.c:371:39: warning: left shift of negative value [-Wshift-negative-value]
     371 |  unsigned long offset = UART_RSA_BASE << up->port.regshift;
         |                                       ^~


vim +350 drivers/tty/serial/8250/8250_core.c

^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  346  
cd52b7599c1a11 drivers/tty/serial/8250/8250_core.c Peter Hurley    2015-02-24  347  #ifdef CONFIG_SERIAL_8250_RSA
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  348  static int serial8250_request_rsa_resource(struct uart_8250_port *up)
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  349  {
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16 @350  	unsigned long start = UART_RSA_BASE << up->port.regshift;
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  351  	unsigned int size = 8 << up->port.regshift;
dfe42443ea1d30 drivers/tty/serial/8250/8250.c      Paul Gortmaker  2012-03-08  352  	struct uart_port *port = &up->port;
0b30d668a20acd drivers/serial/8250.c               Sergei Shtylyov 2006-09-09  353  	int ret = -EINVAL;
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  354  
dfe42443ea1d30 drivers/tty/serial/8250/8250.c      Paul Gortmaker  2012-03-08  355  	switch (port->iotype) {
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  356  	case UPIO_HUB6:
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  357  	case UPIO_PORT:
dfe42443ea1d30 drivers/tty/serial/8250/8250.c      Paul Gortmaker  2012-03-08  358  		start += port->iobase;
0b30d668a20acd drivers/serial/8250.c               Sergei Shtylyov 2006-09-09  359  		if (request_region(start, size, "serial-rsa"))
0b30d668a20acd drivers/serial/8250.c               Sergei Shtylyov 2006-09-09  360  			ret = 0;
0b30d668a20acd drivers/serial/8250.c               Sergei Shtylyov 2006-09-09  361  		else
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  362  			ret = -EBUSY;
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  363  		break;
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  364  	}
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  365  
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  366  	return ret;
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  367  }
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds  2005-04-16  368  

:::::: The code at line 350 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
