Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD781103
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Mar 2023 01:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678583889; x=1710119889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P1HlnSrjX4ZfqB6S5+TcEaDbD67lyAgO64GDdDbZsoc=;
  b=aI5gZiKgMY9ZsT2WRD0bxrWvgoJJ8YqAzidHih/LmuF42mN9/hBC0cCW
   hfnfiWK7znrj1ua20t710RqbU1KoxfUiK03aD/dY47/uM2usWHieMsmoP
   sdyP7XDLULp3LXRp79IzRrk4Njh98RQzXlLDZJI417C/S7WpZQz3b9XfY
   HFMez2PK8DD8IxqL3L/0y0aQKXvvnRAcbrwBPTvD7BBpTScoxxOWPXpKc
   B+UJI2+5UmCBBqY2FSbC5XxFWPEm0POw/FrZcFJDPLuXXoshjDiORq4DH
   iYCSt5idk+WlXF9ZqY41kUJTsZ15T0Dpu6TseusRlBCu873f5yrz2+dIh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="336974872"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="336974872"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 17:18:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="680601257"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="680601257"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Mar 2023 17:18:08 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbALf-0004ub-2M;
	Sun, 12 Mar 2023 01:18:07 +0000
Date: Sun, 12 Mar 2023 09:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/test 15/18] drivers/cpuidle/cpuidle-riscv-sbi.c:194:15:
 error: implicit declaration of function 'cpuhp_setup_state_nocalls'
Message-ID: <202303120900.XjSD5CVJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/test
head:   a44acb6722672badc6478a7adf3c949e911a6deb
commit: 79fa7c616a07b9759ab4a013bc2601039772e3b2 [15/18] cpuidle: Adjust includes to remove of_device.h
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230312/202303120900.XjSD5CVJ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=79fa7c616a07b9759ab4a013bc2601039772e3b2
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/test
        git checkout 79fa7c616a07b9759ab4a013bc2601039772e3b2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120900.XjSD5CVJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpuidle/cpuidle-riscv-sbi.c: In function 'sbi_idle_init_cpuhp':
>> drivers/cpuidle/cpuidle-riscv-sbi.c:194:15: error: implicit declaration of function 'cpuhp_setup_state_nocalls' [-Werror=implicit-function-declaration]
     194 |         err = cpuhp_setup_state_nocalls(CPUHP_AP_CPU_PM_STARTING,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cpuidle/cpuidle-riscv-sbi.c:194:41: error: 'CPUHP_AP_CPU_PM_STARTING' undeclared (first use in this function)
     194 |         err = cpuhp_setup_state_nocalls(CPUHP_AP_CPU_PM_STARTING,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpuidle/cpuidle-riscv-sbi.c:194:41: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/cpuhp_setup_state_nocalls +194 drivers/cpuidle/cpuidle-riscv-sbi.c

6abf32f1d9c500 Anup Patel 2022-02-10  186  
6abf32f1d9c500 Anup Patel 2022-02-10  187  static void sbi_idle_init_cpuhp(void)
6abf32f1d9c500 Anup Patel 2022-02-10  188  {
6abf32f1d9c500 Anup Patel 2022-02-10  189  	int err;
6abf32f1d9c500 Anup Patel 2022-02-10  190  
6abf32f1d9c500 Anup Patel 2022-02-10  191  	if (!sbi_cpuidle_use_cpuhp)
6abf32f1d9c500 Anup Patel 2022-02-10  192  		return;
6abf32f1d9c500 Anup Patel 2022-02-10  193  
6abf32f1d9c500 Anup Patel 2022-02-10 @194  	err = cpuhp_setup_state_nocalls(CPUHP_AP_CPU_PM_STARTING,
6abf32f1d9c500 Anup Patel 2022-02-10  195  					"cpuidle/sbi:online",
6abf32f1d9c500 Anup Patel 2022-02-10  196  					sbi_cpuidle_cpuhp_up,
6abf32f1d9c500 Anup Patel 2022-02-10  197  					sbi_cpuidle_cpuhp_down);
6abf32f1d9c500 Anup Patel 2022-02-10  198  	if (err)
6abf32f1d9c500 Anup Patel 2022-02-10  199  		pr_warn("Failed %d while setup cpuhp state\n", err);
6abf32f1d9c500 Anup Patel 2022-02-10  200  }
6abf32f1d9c500 Anup Patel 2022-02-10  201  

:::::: The code at line 194 was first introduced by commit
:::::: 6abf32f1d9c5009dcccded2c1e7ca899a4ab587b cpuidle: Add RISC-V SBI CPU idle driver

:::::: TO: Anup Patel <anup.patel@wdc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
