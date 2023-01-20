Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990B4BD36
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 14:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674225668; x=1705761668;
  h=date:from:cc:subject:message-id:mime-version;
  bh=c9rtX/WM0+a3giQLPc2bq+JDRTb8t/rMpIqNy+XAgas=;
  b=byQOvUIVRnqyCPSMCymbxlJjxYCVErbLLGgHjvvTha8/EH+Km7aUJB6c
   SI/3UloDlRK3GqvYN1F+MmJIePmwo54IrORH9AvuvioeadNPbi7S3Na2u
   /MLMuDEhEBrGnWA2AmD0cgb63YcQD/iSE38w63/yodOeuCy1mgpdcUhF5
   JVxfBNAneYGtFRLfQHx25kOFy9s00+VWwh50NAhDkfDdt+na9m9enO2Et
   x2qhlcjBICFHdYKqe5OHXw/anR7Lg0z3/o8Vp6PmWg/SXZdPUj4huJ8Bx
   B8MSo3ZtjDfgCDfc6hp8LwriIPYuTFASHUMVRSO+rmvMv5jVAo1J3KpF3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="325625982"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="325625982"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 06:41:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="989413765"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="989413765"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 06:41:06 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIsZl-0002dC-22;
	Fri, 20 Jan 2023 14:41:05 +0000
Date: Fri, 20 Jan 2023 22:40:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:5.10/dovetail-xenomai 20/207]
 drivers/clocksource/bcm2835_timer.c:103:25: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202301202251.UqGTMXxx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.10/dovetail-xenomai
head:   cf5bf3fab76681ac32341500eb2701aa4b259c1c
commit: 5531cd3d673cc05b5ae200abc8b45f7f5d0db37c [20/207] clocksource/bcm2835: turn into user-visible MMIO clocksource
config: openrisc-randconfig-s033-20230119 (https://download.01.org/0day-ci/archive/20230120/202301202251.UqGTMXxx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/linux-intel-lts/commit/5531cd3d673cc05b5ae200abc8b45f7f5d0db37c
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/dovetail-xenomai
        git checkout 5531cd3d673cc05b5ae200abc8b45f7f5d0db37c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/clocksource/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/clocksource/bcm2835_timer.c:103:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/clocksource/bcm2835_timer.c:148:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *[assigned] base @@
   drivers/clocksource/bcm2835_timer.c:148:17: sparse:     expected void *addr
   drivers/clocksource/bcm2835_timer.c:148:17: sparse:     got void [noderef] __iomem *[assigned] base
   drivers/clocksource/bcm2835_timer.c: note: in included file (through arch/openrisc/include/asm/io.h, include/linux/clocksource.h, include/linux/clockchips.h):
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [usertype]

vim +103 drivers/clocksource/bcm2835_timer.c

    77	
    78	static int __init bcm2835_timer_init(struct device_node *node)
    79	{
    80		void __iomem *base;
    81		u32 freq;
    82		int irq, ret;
    83		struct bcm2835_timer *timer;
    84		struct clocksource_mmio_regs mmr;
    85	
    86		base = of_iomap(node, 0);
    87		if (!base) {
    88			pr_err("Can't remap registers\n");
    89			return -ENXIO;
    90		}
    91	
    92		ret = of_property_read_u32(node, "clock-frequency", &freq);
    93		if (ret) {
    94			pr_err("Can't read clock-frequency\n");
    95			goto err_iounmap;
    96		}
    97	
    98		system_clock = base + REG_COUNTER_LO;
    99		sched_clock_register(bcm2835_sched_read, 32, freq);
   100	
   101		mmr.reg_lower = base + REG_COUNTER_LO;
   102		mmr.bits_lower = 32;
 > 103		mmr.reg_upper = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
