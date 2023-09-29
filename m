Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACADC13E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 10:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695982143; x=1727518143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XOOlzTMWkA2nIkljCXhvc7BrAKh9+kCEPmvIkxRj8ik=;
  b=NfOIlAv8Y0sq1Ep+t9lXGCC0shFYnDLGsHQNB59OYiIc2kaFv3N9jH4s
   YzlUExuZ3W7pp7RFFhzvHoMFldeiSY5YbcUUqZhnqu77Qjb6g4sIjp45j
   4t5REoQYXOWZw7N0e5l9Llttnr0nwZmBw2Lx0VU/O4j/TWr82KsLO33/1
   2wKfbQG2ZZVneECqJXSwNJesACbc31s+DpwTrNIYZtd8EO0StSxYddXH6
   9cbUbjIbkNbACtPtmXsgFB7wSYB3wRhlZD6ohuGtiCU52ZvHTYgDC9eMG
   HXa3CdoCmk6WwS1HG0aXClOt/Reg/rU1apWOMM29tha/nvXJrb6cjuIcC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="372624268"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="372624268"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 03:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="873634613"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="873634613"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 29 Sep 2023 03:09:00 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmAQb-0002jV-1u;
	Fri, 29 Sep 2023 10:08:57 +0000
Date: Fri, 29 Sep 2023 18:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: Pallav Joshi <pallav.joshi@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 89/1370]
 drivers/staging/uartlite-rs485/uartlite-rs485.c:32:33: error:
 'CONFIG_SERIAL_UARTLITE_NR_UARTS' undeclared here (not in a function); did
 you mean 'CONFIG_SERIAL_UARTLITE_RS485'?
Message-ID: <202309291814.4RH2zTt6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 43c2da660f30855c2b1072e412a9ce4cf3a2dcc4 [89/1370] staging: uartlite-rs485: Initial commit to add drv
config: i386-randconfig-061-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291814.4RH2zTt6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291814.4RH2zTt6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291814.4RH2zTt6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/uartlite-rs485/uartlite-rs485.c:32:33: error: 'CONFIG_SERIAL_UARTLITE_NR_UARTS' undeclared here (not in a function); did you mean 'CONFIG_SERIAL_UARTLITE_RS485'?
      32 | #define ULITE_NR_UARTS          CONFIG_SERIAL_UARTLITE_NR_UARTS
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/uartlite-rs485/uartlite-rs485.c:116:37: note: in expansion of macro 'ULITE_NR_UARTS'
     116 | static struct uart_port ulite_ports[ULITE_NR_UARTS];
         |                                     ^~~~~~~~~~~~~~
   drivers/staging/uartlite-rs485/uartlite-rs485.c:116:25: warning: 'ulite_ports' defined but not used [-Wunused-variable]
     116 | static struct uart_port ulite_ports[ULITE_NR_UARTS];
         |                         ^~~~~~~~~~~


vim +32 drivers/staging/uartlite-rs485/uartlite-rs485.c

    27	
    28	#define ULITE_NAME		"ttyULR"
    29	#define ULITE_DRV_NAME		"uartlite_rs485"
    30	#define ULITE_MAJOR		205
    31	#define ULITE_MINOR		187
  > 32	#define ULITE_NR_UARTS		CONFIG_SERIAL_UARTLITE_NR_UARTS
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
