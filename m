Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7B87E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 09:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuF89XEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705136440; x=1736672440;
  h=date:from:cc:subject:message-id:mime-version;
  bh=bVA7Jdri4MpRsjTqWpt1q82O8aCxPX4s8i2gnnEMJ2g=;
  b=DuF89XEB2GzTTUZrWNoTOGCfLN+nbxvhQEKan/4YYHdCOYNucoCbjQJe
   EQ44YenzCeeM8s8sOlxDPdjYryOCS9ft4h269dkpvn/4SWhTAAniSJvKq
   hEI0+0vHkb61ktOnvN1YlJB+kibGqOfOlZqyV5olUvf+ES9th/lzyCsFg
   0qQYT+gJJnRm4DAgObNGbEMtAokHHEwjfe+xKaBafyJxG1/e1vzyZy5wq
   O2w1yLQsnYUTDYxq/yJsCrybEmFqtkKFuV/g6RLozcp7FVr2kIMNtG0zH
   2S7h8BDbzLhYvTlQfmdfaEGiL32rKH7jyTrKIITLpT+oHysrMQL2KIm3J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="398232298"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="398232298"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 01:00:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="24969187"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2024 01:00:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOZsa-000AHv-17;
	Sat, 13 Jan 2024 09:00:36 +0000
Date: Sat, 13 Jan 2024 17:00:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:6.1/dovetail-xenomai 15612/15708]
 drivers/clocksource/bcm2835_timer.c:103:25: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202401131620.6hU9BcBT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: f33e06a7449dd5867940b2b9f89eb5e33f8a1036 [15612/15708] clocksource/bcm2835: turn into user-visible MMIO clocksource
config: sparc-randconfig-r112-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131620.6hU9BcBT-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240113/202401131620.6hU9BcBT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131620.6hU9BcBT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clocksource/bcm2835_timer.c:103:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/clocksource/bcm2835_timer.c: note: in included file (through arch/sparc/include/asm/io_32.h, arch/sparc/include/asm/io.h, include/linux/clocksource.h, ...):
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:379:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:379:22: sparse:     got restricted __le32 [usertype]

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
https://github.com/intel/lkp-tests/wiki
