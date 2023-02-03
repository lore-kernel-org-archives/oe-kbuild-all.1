Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225A010FF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 05:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675400439; x=1706936439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EdpzADrmrx1WKKc5IjDKg7ERilO8WNH1FmMikJq/wT4=;
  b=TZcA7vA4ohEIw5vAt+7vHyh6YoJGThdJICeXLBqVV/2hG1Cgo7t0eVJM
   CKhxPXwZVuSu41pYdR8awNrG580luDsEbP2JlKuGLrg8LaU2PHdjjqXbu
   Bco4wzZiMRrB4dk5j5UG/kGnjjbaqZETR+0xG7LDX+xc18ZY8GUCzsE4K
   zdfdYThseeQRD/zet8rKck9UMZ9saU+Lhl/aEg7xGjWsMeM+KbQVpB0pr
   SWL37G5w0VwVshIrF9qpMfQggLctUJugpMWmRLzmdDMXDSii97FXtACel
   4TZJwuqvijD6Kb5k3A2BJjUqOZVgZMG4+E8VQsF1nLKAJPgGclIuFkYto
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393250087"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="393250087"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 21:00:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="729134013"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="729134013"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 21:00:36 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNoBf-00007x-2Z;
	Fri, 03 Feb 2023 05:00:35 +0000
Date: Fri, 3 Feb 2023 13:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pallav Joshi <pallav.joshi@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>
Subject: [pinchartl-media:muxed/2022.2/base 419/740]
 drivers/staging/uartlite-rs485/uartlite-rs485.c:32:33: error:
 'CONFIG_SERIAL_UARTLITE_NR_UARTS' undeclared here (not in a function); did
 you mean 'CONFIG_SERIAL_UARTLITE_RS485_MODULE'?
Message-ID: <202302031212.upXFrqRl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pallav,

FYI, the error/warning still remains.

tree:   git://linuxtv.org/pinchartl/media.git muxed/2022.2/base
head:   e26621179c3b1834a1bb17e9a38e47238ac63bf5
commit: 9cebd33ae5666e6ff30f045a1179bc8ad64973d0 [419/740] staging: uartlite-rs485: Initial commit to add drv
config: sparc64-randconfig-r036-20230202 (https://download.01.org/0day-ci/archive/20230203/202302031212.upXFrqRl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2022.2/base
        git checkout 9cebd33ae5666e6ff30f045a1179bc8ad64973d0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 SHELL=/bin/bash drivers/staging/uartlite-rs485/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/staging/uartlite-rs485/uartlite-rs485.c:32:33: error: 'CONFIG_SERIAL_UARTLITE_NR_UARTS' undeclared here (not in a function); did you mean 'CONFIG_SERIAL_UARTLITE_RS485_MODULE'?
      32 | #define ULITE_NR_UARTS          CONFIG_SERIAL_UARTLITE_NR_UARTS
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/uartlite-rs485/uartlite-rs485.c:116:37: note: in expansion of macro 'ULITE_NR_UARTS'
     116 | static struct uart_port ulite_ports[ULITE_NR_UARTS];
         |                                     ^~~~~~~~~~~~~~
   drivers/staging/uartlite-rs485/uartlite-rs485.c:116:25: warning: 'ulite_ports' defined but not used [-Wunused-variable]
     116 | static struct uart_port ulite_ports[ULITE_NR_UARTS];
         |                         ^~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SERIAL_CORE
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y]
   Selected by [m]:
   - SERIAL_UARTLITE_RS485 [=m] && STAGING [=y] && HAS_IOMEM [=y]


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
https://github.com/intel/lkp-tests
