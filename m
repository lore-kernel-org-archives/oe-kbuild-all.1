Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC11B361
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 01:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681348171; x=1712884171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G/0dvax3rwEsfBldmBl0NBzOpfbQQpVfoSRP3LwvEVg=;
  b=aidchtKv6e4vWdLg1L++cGal/iFuj5lQTIRf8jvmkTPbNvwYnYxwu0dk
   dHATZgbz0pghC4u55xgOPzmJ6x2J9Q8iniXG9jaoLjtSiu7Y6DXr8eSK7
   vtb5PD+xTGazMF+J7NHZ1tdDO9z2tjsGHCtKXp9/ZN2VTiHQWJbbdWSHg
   18F6jiE3HD650TVy40LMDvHi25e0E+k2uf6wkef6yBQEiMkCMIbApD3au
   JuK1yP7HeJlBfJqec6ZtLpaY0o5AtoABeLZhHWvgkxwCqvAKEy1vwgBhi
   dAC1MJSMHnM/7ufXHitiNig68g3dpnoSljT9dyatdZJldDiULGtqGV+Wf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="323682114"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="323682114"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 18:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="778504927"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="778504927"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2023 18:09:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmlSr-000YCV-1H;
	Thu, 13 Apr 2023 01:09:29 +0000
Date: Thu, 13 Apr 2023 09:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:epoll-min_ts.2 10/10] riscv64-linux-ld:
 arch/riscv/kernel/syscall_table.o:undefined reference to `sys_epoll_pwait3'
Message-ID: <202304130939.q7m7Dt6G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git epoll-min_ts.2
head:   b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b
commit: b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b [10/10] eventpoll: wire up epoll_pwait3() syscall
config: riscv-randconfig-r021-20230412 (https://download.01.org/0day-ci/archive/20230413/202304130939.q7m7Dt6G-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block epoll-min_ts.2
        git checkout b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130939.q7m7Dt6G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> riscv64-linux-ld: arch/riscv/kernel/syscall_table.o:(.rodata+0xe18): undefined reference to `sys_epoll_pwait3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
