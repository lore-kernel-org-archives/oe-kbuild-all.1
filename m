Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFC6DDA9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 23:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683588827; x=1715124827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NqQf2YidVcSxtwjCyARwEnRb7pOG1Wj4JuX0jsUlpsY=;
  b=J60N6T4fn5QvBdTBPhhjdv5y+oKP2uKwOfNmCqi/tR8eZMx08s++0OLe
   +RcjU3SonA9H1Wxt4phZQ37ommBBBLeXeo2fcDh25aCLb+GeMjap8WHoh
   MUY+tUHsO2dxOQ0m2k0ZkahSC7kNm36e1exQbpZldWB1MA3cu05ilYiWe
   QZnDyaKRkJrevh4u0BsYzc1l5GmfHFFMVbR6axh/OcGdG54zX5qU7RVpW
   qq7w/cZhUc8QcWy9WKF6iQ2yo2oAoqShmwAt9ISzq+OC6xuwSSJwpXSiq
   Ro3eaNodpLoSc2l0nVxakjJObNq5SEMsgZT54VBzRXIwcn1VctLmENsPw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="339000644"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="339000644"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 16:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="822860665"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="822860665"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 May 2023 16:33:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwAMT-0001Sn-0T;
	Mon, 08 May 2023 23:33:45 +0000
Date: Tue, 9 May 2023 07:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:kvm_perf_snapshot_rfc 5/7]
 include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of
 type 'int', but argument 3 has type 'long int'
Message-ID: <202305090756.sKGXiubv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux kvm_perf_snapshot_rfc
head:   5ae7188de04f861c3f4026005a0ace2cf2575bde
commit: 51adde1839f15db1a4074f7b36eb2dccad7fa534 [5/7] perf: RISC-V: Implement SBI PMU snapshot function
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230509/202305090756.sKGXiubv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/51adde1839f15db1a4074f7b36eb2dccad7fa534
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 kvm_perf_snapshot_rfc
        git checkout 51adde1839f15db1a4074f7b36eb2dccad7fa534
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090756.sKGXiubv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:13,
                    from drivers/perf/riscv_pmu_sbi.c:13:
   drivers/perf/riscv_pmu_sbi.c: In function 'pmu_sbi_snapshot_init':
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:498:16: note: in expansion of macro 'KERN_ERR'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/perf/riscv_pmu_sbi.c:500:17: note: in expansion of macro 'pr_err'
     500 |                 pr_err("%s: ret.error %d\n", __func__, ret.error);
         |                 ^~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
