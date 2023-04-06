Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E97A41
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 06:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680763423; x=1712299423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IK91s2u4YIuYaiYwhLjXWhXtcC5afG+LgfRF1iRGB2E=;
  b=Y3FZUlmFQ90Q38svWALjeebH7nNJ7UrSSenVuP/6VeEsXCKQnqKvWhid
   36PxC9xX3qECYZebxz1yLqFbsApdDtxZsF7AMBu7mCTenROsg6od9ViWT
   BCbHMz6I7hSoyMLccJgXF3KeVV8CdibtdJRnYOjj1bmwzbp+4axgYndsW
   evWoFKTur7EWJj3fPJq4O5GBqR6lEuXzJhFtuV8WAD3aZt6NkJK6fAcSg
   vAVntvIeBI2Ukz1ovsTScvGNogW+6sz1llZCsMfjmV9put02pHLMhmW6v
   GNPCQ/NnLvxgNhRyYifc/slJpRASnO1YQQ90UlV9TSdBVUK6OaU2IKWnD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="428943960"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="428943960"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 23:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="687026839"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="687026839"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Apr 2023 23:43:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkJLQ-000R8w-2v;
	Thu, 06 Apr 2023 06:43:40 +0000
Date: Thu, 6 Apr 2023 14:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230404-module-alloc-opts-v2 39/41]
 stats.c:(.text.read_file_mod_stats+0x3d4): undefined reference to
 `__udivdi3'
Message-ID: <202304061451.ZvyALNDO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230404-module-alloc-opts-v2
head:   95fd5294d0e19a463b9f303638481eeb16ea0cff
commit: 25ef6ee28d33cbad22e4a68b6d39094fceae6dda [39/41] module: add debug stats to help identify memory pressure
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230406/202304061451.ZvyALNDO-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=25ef6ee28d33cbad22e4a68b6d39094fceae6dda
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230404-module-alloc-opts-v2
        git checkout 25ef6ee28d33cbad22e4a68b6d39094fceae6dda
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061451.ZvyALNDO-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `kernel_entry':
   (.ref.text+0xac): relocation truncated to fit: R_MIPS_26 against `start_kernel'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x20): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x30): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0xa4): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xb4): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x128): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x138): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0x1ac): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x1bc): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x234): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x254): additional relocation overflows omitted from the output
   mips-linux-ld: kernel/module/stats.o: in function `read_file_mod_stats':
>> stats.c:(.text.read_file_mod_stats+0x3d4): undefined reference to `__udivdi3'
>> mips-linux-ld: stats.c:(.text.read_file_mod_stats+0x45c): undefined reference to `__udivdi3'
   mips-linux-ld: stats.c:(.text.read_file_mod_stats+0x5a4): undefined reference to `__udivdi3'
   mips-linux-ld: stats.c:(.text.read_file_mod_stats+0x6cc): undefined reference to `__udivdi3'
   mips-linux-ld: stats.c:(.text.read_file_mod_stats+0x7f4): undefined reference to `__udivdi3'
   mips-linux-ld: kernel/module/stats.o:stats.c:(.text.read_file_mod_stats+0x91c): more undefined references to `__udivdi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
