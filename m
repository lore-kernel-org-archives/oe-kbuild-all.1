Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18C07E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 22:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677970570; x=1709506570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yGOeu57Run92DBgeExuwVxif9x2vjXc76l3Vnl8JTSg=;
  b=Jo9W0N7WZ6spsbcbx6eKyEGlU4zkkTfeN5X5hAshdt5910p/bJjyPkqM
   oH7TNbERMck1dt1NWPqfQHqN8gFqATTWRGp9js4hvryoiMIDpcNDHjeW2
   Zg5gKwzya/vncs98p2qoVEp4YxFJseT6voITerYR6jlbd+4IxBJfu6NIx
   X7e2LTeR8Lu8GuT7cdPXyxUZwHHMb/FL+wlsG61IqBmJLeSW7K5kPmmg4
   +YbREqKsvSZoyelrpJ7LFkkAjgq8qpx7RJnhiVOqQgaNyF+jC0hj8RXCk
   IqkjxHgPuibtJnI8j/L6v5pgEUe0pHZIxBZQG8bGAi6kclmGKh/tJe4q+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="323623232"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="323623232"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 14:56:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="625729470"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="625729470"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Mar 2023 14:56:08 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYanQ-0002PI-0a;
	Sat, 04 Mar 2023 22:56:08 +0000
Date: Sun, 5 Mar 2023 06:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: drivers/clocksource/timer-clint.c:82:24: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202303050655.acu5xXOh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Aurelien,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c29214bc89169f735657f614bde7c0fad74bd1b5
commit: 6df2a016c0c8a3d0933ef33dd192ea6606b115e3 riscv: fix build with binutils 2.38
date:   1 year, 1 month ago
config: riscv-randconfig-s033-20230305 (https://download.01.org/0day-ci/archive/20230305/202303050655.acu5xXOh-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6df2a016c0c8a3d0933ef33dd192ea6606b115e3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6df2a016c0c8a3d0933ef33dd192ea6606b115e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clocksource/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303050655.acu5xXOh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clocksource/timer-clint.c:82:24: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/clocksource/timer-clint.c:82:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/clocksource/timer-clint.c:82:24: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/clocksource/timer-clint.c:82:24: sparse:     got unsigned int [usertype] *
   drivers/clocksource/timer-clint.c:80:22: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/clocksource/timer-clint.c:80:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/clocksource/timer-clint.c:80:22: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/clocksource/timer-clint.c:80:22: sparse:     got unsigned int [usertype] *
   drivers/clocksource/timer-clint.c:237:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void * @@     got struct clock_event_device [noderef] __percpu * @@
   drivers/clocksource/timer-clint.c:237:36: sparse:     expected void *
   drivers/clocksource/timer-clint.c:237:36: sparse:     got struct clock_event_device [noderef] __percpu *

vim +/__iomem +82 drivers/clocksource/timer-clint.c

2ac6795fcc085e Anup Patel 2020-08-17  68  
2ac6795fcc085e Anup Patel 2020-08-17  69  #ifdef CONFIG_64BIT
2ac6795fcc085e Anup Patel 2020-08-17  70  static u64 notrace clint_get_cycles64(void)
2ac6795fcc085e Anup Patel 2020-08-17  71  {
2ac6795fcc085e Anup Patel 2020-08-17  72  	return clint_get_cycles();
2ac6795fcc085e Anup Patel 2020-08-17  73  }
2ac6795fcc085e Anup Patel 2020-08-17  74  #else /* CONFIG_64BIT */
2ac6795fcc085e Anup Patel 2020-08-17  75  static u64 notrace clint_get_cycles64(void)
2ac6795fcc085e Anup Patel 2020-08-17  76  {
2ac6795fcc085e Anup Patel 2020-08-17  77  	u32 hi, lo;
2ac6795fcc085e Anup Patel 2020-08-17  78  
2ac6795fcc085e Anup Patel 2020-08-17  79  	do {
2ac6795fcc085e Anup Patel 2020-08-17  80  		hi = clint_get_cycles_hi();
2ac6795fcc085e Anup Patel 2020-08-17  81  		lo = clint_get_cycles();
2ac6795fcc085e Anup Patel 2020-08-17 @82  	} while (hi != clint_get_cycles_hi());
2ac6795fcc085e Anup Patel 2020-08-17  83  
2ac6795fcc085e Anup Patel 2020-08-17  84  	return ((u64)hi << 32) | lo;
2ac6795fcc085e Anup Patel 2020-08-17  85  }
2ac6795fcc085e Anup Patel 2020-08-17  86  #endif /* CONFIG_64BIT */
2ac6795fcc085e Anup Patel 2020-08-17  87  

:::::: The code at line 82 was first introduced by commit
:::::: 2ac6795fcc085e8d03649f1bbd0d70aaff612cad clocksource/drivers: Add CLINT timer driver

:::::: TO: Anup Patel <anup.patel@wdc.com>
:::::: CC: Palmer Dabbelt <palmerdabbelt@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
