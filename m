Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D62F7EF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 05:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677563602; x=1709099602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z+Oq2YMJHqYuFac6IXik66pY18q4iGLF/0FlCooen30=;
  b=YR8p3WoSiAivNqYAluf0T+2tMTaHhO3xZOiUnXkrsjkBmpC9i7MVfkpD
   jU/W9kDxJQFhmjxyeEd2ofxm/74JU07NC4HbTv0NIxyx8sPCGGYVR1W2d
   9MLD+TUNw/RQQYjie0+3I3PvzYldwgMdfdbD6NXgKQW1INPCXKvvhCXZb
   49F7sPtKpu8zsX4PZ1l97ijWqQud4z/t1I1TkvlYeEv33NaPv6ORqbjPz
   AZjzUtGcHVOsraIFhP/xK7h3d97FiVEHxaIyWdA+F2npR7aNqbO3BkGwz
   09Iu1zekHsaZX8ikHXPBIFTjV50bcx7Loj5x4x/ZF5lgReRjoracXr2gn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="336341933"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="336341933"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 21:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="706450250"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="706450250"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Feb 2023 21:53:20 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWsvP-00058B-2O;
	Tue, 28 Feb 2023 05:53:19 +0000
Date: Tue, 28 Feb 2023 13:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 171/583]
 drivers/perf/raspberrypi_axi_monitor.c:139:1: warning: 'static' is not at
 beginning of declaration
Message-ID: <202302281344.5OB0L4O6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: 7c59d2470092e4fb2dba72ebeaa3eb510990d0da [171/583] AXI performance monitor driver (#2222)
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302281344.5OB0L4O6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/7c59d2470092e4fb2dba72ebeaa3eb510990d0da
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout 7c59d2470092e4fb2dba72ebeaa3eb510990d0da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/char/broadcom/ drivers/dma/ drivers/irqchip/ drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302281344.5OB0L4O6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/raspberrypi_axi_monitor.c:139:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     139 | const static char *bus_filter_strings[] = {
         | ^~~~~
   drivers/perf/raspberrypi_axi_monitor.c:176:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     176 | const static char *system_bus_string[] = {
         | ^~~~~
   drivers/perf/raspberrypi_axi_monitor.c:197:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     197 | const static char *vpu_bus_string[] = {
         | ^~~~~
   drivers/perf/raspberrypi_axi_monitor.c:218:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     218 | const static char *monitor_name[] = {
         | ^~~~~


vim +/static +139 drivers/perf/raspberrypi_axi_monitor.c

   138	
 > 139	const static char *bus_filter_strings[] = {
   140		"",
   141		"CORE0_V",
   142		"ICACHE0",
   143		"DCACHE0",
   144		"CORE1_V",
   145		"ICACHE1",
   146		"DCACHE1",
   147		"L2_MAIN",
   148		"HOST_PORT",
   149		"HOST_PORT2",
   150		"HVS",
   151		"ISP",
   152		"VIDEO_DCT",
   153		"VIDEO_SD2AXI",
   154		"CAM0",
   155		"CAM1",
   156		"DMA0",
   157		"DMA1",
   158		"DMA2_VPU",
   159		"JPEG",
   160		"VIDEO_CME",
   161		"TRANSPOSER",
   162		"VIDEO_FME",
   163		"CCP2TX",
   164		"USB",
   165		"V3D0",
   166		"V3D1",
   167		"V3D2",
   168		"AVE",
   169		"DEBUG",
   170		"CPU",
   171		"M30"
   172	};
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
