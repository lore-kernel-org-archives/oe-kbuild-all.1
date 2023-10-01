Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0A7A55
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 04:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696134216; x=1727670216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PdZ6KWyhLdGL8tTUvM9LB6LnMs6JOefBCRean52iUdA=;
  b=aOB9u0CD4OuxIAKVhZHFkyZQyJ9QvRpTO7xwwstaKtavVDV7PW4IUgwd
   BYhNs2riUuoZeriI3O8eNb1FtWsohoTvLcNbqd2yuXyf1ePPHK51ltM7l
   oW25qtCbuYY8Eh18EZTYtDnTyj7NkgzMhoxfKXklMHGYHN9iZdlwLwObp
   s33YgL04Nvcc7xum3hmhzSu88ps/Coc80oZRxRYOfZ/sXgNUBYZQaYhWh
   gueAtYmDMItAmSFmkG+RANodPEUk3Hn7M49V+ks4xxY7hJ/0KUWu0ieZK
   9Qo8uMko+r+Ex7QXJzxbeEJqQ0xXtoKj5uwUw03BiabAPe9/q+NcoYA1Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="448981480"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="448981480"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 21:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="815956354"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="815956354"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Sep 2023 21:23:32 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmnzO-0004jx-0x;
	Sun, 01 Oct 2023 04:23:30 +0000
Date: Sun, 1 Oct 2023 12:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.7-next 196/306]
 drivers/tty/serial/ar933x_uart.c:565:27: error: 'ar933x_uart_release_port'
 undeclared here (not in a function); did you mean 'ar933x_uart_verify_port'?
Message-ID: <202310011222.tJV0bbZD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7-next
head:   a126cc9f2f87fe0931a7bf053665560587086082
commit: 5335d34c6655eff3e668abb1287cf77f77ad2b93 [196/306] tty: serial: remove empty request/release_port helpers
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231001/202310011222.tJV0bbZD-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310011222.tJV0bbZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310011222.tJV0bbZD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/ar933x_uart.c:565:27: error: 'ar933x_uart_release_port' undeclared here (not in a function); did you mean 'ar933x_uart_verify_port'?
     565 |         .release_port   = ar933x_uart_release_port,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                           ar933x_uart_verify_port
>> drivers/tty/serial/ar933x_uart.c:566:27: error: 'ar933x_uart_request_port' undeclared here (not in a function); did you mean 'ar933x_uart_verify_port'?
     566 |         .request_port   = ar933x_uart_request_port,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                           ar933x_uart_verify_port


vim +565 drivers/tty/serial/ar933x_uart.c

d57f341ba08c9f3 Gabor Juhos   2011-06-20  552  
2331e06865047a0 Bhumika Goyal 2017-01-25  553  static const struct uart_ops ar933x_uart_ops = {
d57f341ba08c9f3 Gabor Juhos   2011-06-20  554  	.tx_empty	= ar933x_uart_tx_empty,
d57f341ba08c9f3 Gabor Juhos   2011-06-20  555  	.set_mctrl	= ar933x_uart_set_mctrl,
d57f341ba08c9f3 Gabor Juhos   2011-06-20  556  	.get_mctrl	= ar933x_uart_get_mctrl,
d57f341ba08c9f3 Gabor Juhos   2011-06-20  557  	.stop_tx	= ar933x_uart_stop_tx,
d57f341ba08c9f3 Gabor Juhos   2011-06-20  558  	.start_tx	= ar933x_uart_start_tx,
d57f341ba08c9f3 Gabor Juhos   2011-06-20  559  	.stop_rx	= ar933x_uart_stop_rx,
d57f341ba08c9f3 Gabor Juhos   2011-06-20  560  	.break_ctl	= ar933x_uart_break_ctl,
d57f341ba08c9f3 Gabor Juhos   2011-06-20  561  	.startup	= ar933x_uart_startup,
d57f341ba08c9f3 Gabor Juhos   2011-06-20  562  	.shutdown	= ar933x_uart_shutdown,
d57f341ba08c9f3 Gabor Juhos   2011-06-20  563  	.set_termios	= ar933x_uart_set_termios,
d57f341ba08c9f3 Gabor Juhos   2011-06-20  564  	.type		= ar933x_uart_type,
d57f341ba08c9f3 Gabor Juhos   2011-06-20 @565  	.release_port	= ar933x_uart_release_port,
d57f341ba08c9f3 Gabor Juhos   2011-06-20 @566  	.request_port	= ar933x_uart_request_port,
d57f341ba08c9f3 Gabor Juhos   2011-06-20  567  	.config_port	= ar933x_uart_config_port,
d57f341ba08c9f3 Gabor Juhos   2011-06-20  568  	.verify_port	= ar933x_uart_verify_port,
d57f341ba08c9f3 Gabor Juhos   2011-06-20  569  };
d57f341ba08c9f3 Gabor Juhos   2011-06-20  570  

:::::: The code at line 565 was first introduced by commit
:::::: d57f341ba08c9f34ccd45a89729e73174d4a3325 SERIAL: AR933X: Add driver for the built-in UART of the SoC

:::::: TO: Gabor Juhos <juhosg@openwrt.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
