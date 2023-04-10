Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6FD195
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 06:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681108519; x=1712644519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zrpNEnn1s+q2IyOTqd6rGG0AV/Iua6x9k+kZ5pt9pIs=;
  b=hdt5k+Co6U+qjlyteOPJYsa3w4OUueV8CSp0B2X8xSAHdmc4lWxCTwKz
   NN6FLOggO3Wvh3wyLa0Iq+EoUkwffo/DDK3htfrOsX65HR5GzOnMKznT+
   BcFjJqv74oXwk6ZxgvfyqwuqXekqeV0RNsXSJw+9rIq3Sx1MfhNpGtg7r
   74FDBZY0ifYnFVN5lySjLsfn6op33Lly6GMZjnYZbDYX6WHPJglksj9pU
   UrQYSykNCuVcsgrWYu3scgyskqzq48+Ds4eYe5O3hnl27Wuiz1d7FG2jg
   HhHYYLeYX15qi1ADwRSHZuYL/Er1LRMl2bBFC3uneBjmFiLj2BIbTDdsN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="371135530"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="371135530"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 23:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="777465035"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="777465035"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Apr 2023 23:35:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pll7T-000VAb-08;
	Mon, 10 Apr 2023 06:35:15 +0000
Date: Mon, 10 Apr 2023 14:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <dfustini@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] RISC-V: Add support for sqoscfg CSR
Message-ID: <202304101427.XfrEDdov-lkp@intel.com>
References: <20230410043646.3138446-3-dfustini@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410043646.3138446-3-dfustini@baylibre.com>

Hi Drew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on d34a6b715a23ccd9c9d0bc7a475bea59dc3e28b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/RISC-V-Detect-the-Ssqosid-extension/20230410-123605
base:   d34a6b715a23ccd9c9d0bc7a475bea59dc3e28b2
patch link:    https://lore.kernel.org/r/20230410043646.3138446-3-dfustini%40baylibre.com
patch subject: [RFC PATCH 2/2] RISC-V: Add support for sqoscfg CSR
config: riscv-randconfig-r015-20230409 (https://download.01.org/0day-ci/archive/20230410/202304101427.XfrEDdov-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e4cdc958b7e755dd86202b069497aa36e01b325a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Drew-Fustini/RISC-V-Detect-the-Ssqosid-extension/20230410-123605
        git checkout e4cdc958b7e755dd86202b069497aa36e01b325a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304101427.XfrEDdov-lkp@intel.com/

All errors (new ones prefixed by >>):

>> riscv64-linux-ld: arch/riscv/kernel/ptrace.o:arch/riscv/include/asm/qos.h:15: multiple definition of `__pcpu_unique_cpu_sqoscfg'; arch/riscv/kernel/process.o:arch/riscv/include/asm/qos.h:15: first defined here
   riscv64-linux-ld: arch/riscv/kernel/signal.o:arch/riscv/include/asm/qos.h:15: multiple definition of `__pcpu_unique_cpu_sqoscfg'; arch/riscv/kernel/process.o:arch/riscv/include/asm/qos.h:15: first defined here
   riscv64-linux-ld: kernel/sched/core.o:arch/riscv/include/asm/qos.h:15: multiple definition of `__pcpu_unique_cpu_sqoscfg'; arch/riscv/kernel/process.o:arch/riscv/include/asm/qos.h:15: first defined here
   riscv64-linux-ld: kernel/sched/fair.o:arch/riscv/include/asm/qos.h:15: multiple definition of `__pcpu_unique_cpu_sqoscfg'; arch/riscv/kernel/process.o:arch/riscv/include/asm/qos.h:15: first defined here
   riscv64-linux-ld: kernel/sched/build_utility.o:arch/riscv/include/asm/qos.h:15: multiple definition of `__pcpu_unique_cpu_sqoscfg'; arch/riscv/kernel/process.o:arch/riscv/include/asm/qos.h:15: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
