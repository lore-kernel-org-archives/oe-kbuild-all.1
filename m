Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B82EC0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 10:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679133883; x=1710669883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oJSFyHCnZm6dhF52P0zwI97cIw3h06d3hzhtFVlrcK0=;
  b=GY6CGxFj4dQQuZYJaBsF1aE5EM/coyZiKJ9u+k6Wz30QisXOJzHyOrwr
   iSOoTxJ+D0DXYRTYWPUuBgeZD20OflH2rR8h6sxIntJY5q5QFsBx++hZC
   LwYCnCHBJOwcpnlZk84gJQeUMyZOz0SuMw2xKbq0CKI06Cvqw765X2wZT
   C90+7DISTHUnMaAD/vJA7A8bj/bamcXosesD8P0a5nFyoqCntEbinUL+4
   u3PxA0uzEeOLUQn214gguUH33DFzMIujeXS5/HuCI1KFaWOm9uqRdqXfz
   e4HFzpd4B0KA+erqEec14Zv1WR3wsQWDItU21g1xWcpLwWIXUqxTHFnbH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="322270784"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="322270784"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 03:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="926436447"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="926436447"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Mar 2023 03:04:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdTQW-0009zW-2w;
	Sat, 18 Mar 2023 10:04:40 +0000
Date: Sat, 18 Mar 2023 18:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/arm/mach-omap1/serial.c:236:12: warning: no previous prototype
 for 'omap_serial_wakeup_init'
Message-ID: <202303181820.fFVSpwKt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   478a351ce0d69cef2d2bf2a686a09b356b63a66c
commit: 250c1a694ff304e5d69e74ab32755eddcc2b8f65 ARM: pxa: convert to multiplatform
date:   11 months ago
config: arm-randconfig-r033-20230318 (https://download.01.org/0day-ci/archive/20230318/202303181820.fFVSpwKt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=250c1a694ff304e5d69e74ab32755eddcc2b8f65
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 250c1a694ff304e5d69e74ab32755eddcc2b8f65
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mach-omap1/ drivers/usb/gadget/udc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181820.fFVSpwKt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-omap1/serial.c:236:12: warning: no previous prototype for 'omap_serial_wakeup_init' [-Wmissing-prototypes]
     236 | int __init omap_serial_wakeup_init(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/usb/gadget/udc/omap_udc.c: In function 'omap_udc_pio_irq':
>> drivers/usb/gadget/udc/omap_udc.c:1915:37: warning: variable 'stat' set but not used [-Wunused-but-set-variable]
    1915 |                                 int stat;
         |                                     ^~~~
   drivers/usb/gadget/udc/omap_udc.c: At top level:
   drivers/usb/gadget/udc/omap_udc.c:110:19: warning: 'driver_desc' defined but not used [-Wunused-const-variable=]
     110 | static const char driver_desc[] = DRIVER_DESC;
         |                   ^~~~~~~~~~~


vim +/omap_serial_wakeup_init +236 arch/arm/mach-omap1/serial.c

7c38cf021b42a4 Tony Lindgren 2005-09-08  235  
82c3bd03535f15 Shawn Guo     2012-04-26 @236  int __init omap_serial_wakeup_init(void)
7c38cf021b42a4 Tony Lindgren 2005-09-08  237  {
7c38cf021b42a4 Tony Lindgren 2005-09-08  238  	if (!cpu_is_omap16xx())
7c38cf021b42a4 Tony Lindgren 2005-09-08  239  		return 0;
7c38cf021b42a4 Tony Lindgren 2005-09-08  240  
7c38cf021b42a4 Tony Lindgren 2005-09-08  241  	if (uart1_ck != NULL)
7c38cf021b42a4 Tony Lindgren 2005-09-08  242  		omap_serial_set_port_wakeup(37);
7c38cf021b42a4 Tony Lindgren 2005-09-08  243  	if (uart2_ck != NULL)
7c38cf021b42a4 Tony Lindgren 2005-09-08  244  		omap_serial_set_port_wakeup(18);
7c38cf021b42a4 Tony Lindgren 2005-09-08  245  	if (uart3_ck != NULL)
7c38cf021b42a4 Tony Lindgren 2005-09-08  246  		omap_serial_set_port_wakeup(49);
7c38cf021b42a4 Tony Lindgren 2005-09-08  247  
7c38cf021b42a4 Tony Lindgren 2005-09-08  248  	return 0;
7c38cf021b42a4 Tony Lindgren 2005-09-08  249  }
7c38cf021b42a4 Tony Lindgren 2005-09-08  250  

:::::: The code at line 236 was first introduced by commit
:::::: 82c3bd03535f1571426fdd19b7d832f76b7ac85e ARM: omap1: use machine specific hook for late init

:::::: TO: Shawn Guo <shawn.guo@linaro.org>
:::::: CC: Shawn Guo <shawn.guo@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
