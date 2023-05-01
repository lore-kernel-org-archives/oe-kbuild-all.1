Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2D37E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 08:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682930403; x=1714466403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=//KI8y+/sgpuuH11lzGKTdHfa+IyhZIjeLca2O2Sb5U=;
  b=KaAFDHl1sWdyIukwTvMpiCJ8qOxtvineb4GavKH8ZKLvMim/QBr5qtS6
   HPf8SQ/2HdEsz36GnV+TQDpqGBEbqdvmiVNq8Jc4gy4Q07JKGgwLcQlg2
   ZHvtSdTMtylPDfrfEngE3lq56fI9oHo2vq6berFw4uUMsSREL06SOrrdU
   B2L5gtbpqL1ijGycF8p9VRTir4UBhMSFsRPN4YR0EjytGLUj3sG8DG1Tn
   d/8jSEuQu+0j4itPUlkBw6AvUWCPHLgoM7wpugNai7noPQXEd/1LOPpEz
   R4pHHqa7ZxVemXFLR1/P7l5kkMxINP2jt5kL1S2u753aCgE+L/CDF7asQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="413542729"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="413542729"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 01:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="689817447"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="689817447"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 May 2023 01:40:02 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptP4j-0000N7-1J;
	Mon, 01 May 2023 08:40:01 +0000
Date: Mon, 1 May 2023 16:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/arm/mach-omap1/serial.c:236:12: warning: no previous prototype
 for 'omap_serial_wakeup_init'
Message-ID: <202305011637.7zaKatRo-lkp@intel.com>
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
head:   58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
commit: 980a637d11fe8dfc734f508a422185c2de55e669 ARM: omap1: fix !ARCH_OMAP1_ANY link failures
date:   4 months ago
config: arm-randconfig-r024-20230429 (https://download.01.org/0day-ci/archive/20230501/202305011637.7zaKatRo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=980a637d11fe8dfc734f508a422185c2de55e669
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 980a637d11fe8dfc734f508a422185c2de55e669
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305011637.7zaKatRo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-omap1/serial.c:236:12: warning: no previous prototype for 'omap_serial_wakeup_init' [-Wmissing-prototypes]
     236 | int __init omap_serial_wakeup_init(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~


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
