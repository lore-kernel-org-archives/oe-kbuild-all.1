Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B7E3209
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 20:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674246626; x=1705782626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h8V3tih4FzsV6+RCBJlwsFkxI7Z6Y/xZKHB48lDV4f4=;
  b=caV/pNkCG27vrOwQJzTnbzSkdohNmLB4Ygv/kjC9A+VKAPVBznw6hSjz
   jWMB5RyqNW3qY07QG0vO1FO62NGN04Dkqz81gJ5ghokHHc5Yp3Mtabyug
   2Ebdg83Xpgjlwu3VRFXi4nqbsNtrWEjqbvK6ocF68EHqKXBpgsOCKL6u+
   RSHMFfoke2mjvzzliyJWGoNjdbIzuXvU++3o3zs8zdum/XSJcHMo6cqB2
   sGwLc54v9QwWfxTvYPAMll16Xq+BUR34aK+ExwDiCOGIeMOw+97fFNgR+
   V+iTDZ38ibh0j/8SF1MsAH48JwppTW3tGrO/TliKq4Gaa0D4JZZZfP0bH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="313574083"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="313574083"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 12:30:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="660712054"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="660712054"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Jan 2023 12:30:22 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIy1l-0002uH-1h;
	Fri, 20 Jan 2023 20:30:21 +0000
Date: Sat, 21 Jan 2023 04:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.1 60/98] mips-linux-ld: aspeed-sbc.c:undefined
 reference to `arch_debugfs_dir'
Message-ID: <202301210418.FWZSfxo7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.1
head:   a4cca653c668f2108ca4cbafe596d9ff072a56c8
commit: 471af484e37d146008f00679e19c83bcfa7c3c25 [60/98] ARM: soc: aspeed: Add secure boot controller support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230121/202301210418.FWZSfxo7-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/shenki/linux/commit/471af484e37d146008f00679e19c83bcfa7c3c25
        git remote add shenki https://github.com/shenki/linux
        git fetch --no-tags shenki dev-6.1
        git checkout 471af484e37d146008f00679e19c83bcfa7c3c25
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
   mips-linux-ld: drivers/soc/aspeed/aspeed-sbc.o: in function `aspeed_sbc_init':
   aspeed-sbc.c:(.init.text+0x20c): undefined reference to `arch_debugfs_dir'
>> mips-linux-ld: aspeed-sbc.c:(.init.text+0x210): undefined reference to `arch_debugfs_dir'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
