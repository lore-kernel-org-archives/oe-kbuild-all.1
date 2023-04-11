Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E784944C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 18:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681236222; x=1712772222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rX6zIu36V7vrjkecoRyljOsstMm8cXMAHM+owOxkVnQ=;
  b=NxaLOk2U/PXK1XIMeLZKMUOLmluyoOAL834JwOu5Th5xQMGnDHODfYxY
   U2+HpbOEZjM2qkKz6RzrWFbIJFTBcbgt+Qoju4smwPjEVLcKlrsZ5sOjv
   qB2Y2Xy2S+PN3/YR3JbU+jZdd52W7qyXgDdbqNclvwLcljPHTCbaprkDp
   vt/IgkC591AmK0eGtgp2BS+Tamt6BPQVrDzULtRQs4KLMNpUufUagfrTf
   oxrZk0zDN477PxX4PMutvlaUpRJwsbbZ8D9Vwsb556TD5L0hAzFuf0geL
   P5C/jeyeUFH4rUvdvzD0nGqc17K4jsmu9c1S1FZ5RJR/x+nIYpgIySia/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="324059085"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="324059085"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 11:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="682174225"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="682174225"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Apr 2023 11:03:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmIKv-000WZs-36;
	Tue, 11 Apr 2023 18:03:21 +0000
Date: Wed, 12 Apr 2023 02:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.1 58/130] aspeed-sbc.c:undefined reference to
 `arch_debugfs_dir'
Message-ID: <202304120146.IjOq6HX8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.1
head:   2654dfac1ac1a1b672f9baa0c74ec39e0126c264
commit: 3fe223630c750ba63727f653033b128d6ad0f4b7 [58/130] ARM: soc: aspeed: Add secure boot controller support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230412/202304120146.IjOq6HX8-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/shenki/linux/commit/3fe223630c750ba63727f653033b128d6ad0f4b7
        git remote add shenki https://github.com/shenki/linux
        git fetch --no-tags shenki dev-6.1
        git checkout 3fe223630c750ba63727f653033b128d6ad0f4b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120146.IjOq6HX8-lkp@intel.com/

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
>> aspeed-sbc.c:(.init.text+0x20c): undefined reference to `arch_debugfs_dir'
>> mips-linux-ld: aspeed-sbc.c:(.init.text+0x210): undefined reference to `arch_debugfs_dir'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
