Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEC2EA8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 04:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681618923; x=1713154923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9hnW5leytr4YxXJwpVMjGn9Oy+lz6wqyihlR99NqpV0=;
  b=lim7vEzzaF0xme6ANgW/IAG7oS0MVPkqsFzlRXSla8xtlxjGye96+DbE
   EZHKmX+obMw3Dvt78UOTNWdR/tvoSnzsVrXPTezjcDIwPkzHJFhupTRXH
   7vD7Wjj+7Rr0dJjJQ+iHJuEds6jBtX5ZIqLCdixt7Yby9PpelQjJ3v/TP
   FUiAI4eGfhTVgRJbabbTxzVd8Fw4IdqGPlDO7MMYwQVyvxPC9B9Ckh/Bg
   D0LFoFooDlKzG5uHeqOOVHjY6iyJx0elzdr/NbUdcHR+dkFel1JarTLNZ
   v8IeiU8MndejPCoR3dVjcQOdncUsE7+0Sn1iZdhf8CAJcB6uVQJa0OLb+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="407592071"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="407592071"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 21:22:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="722896571"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="722896571"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Apr 2023 21:22:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pntto-000bVn-1m;
	Sun, 16 Apr 2023 04:22:00 +0000
Date: Sun, 16 Apr 2023 12:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4832/9838] include/linux/stddef.h:8:14:
 error: positional initialization of field in 'struct' declared with
 'designated_init' attribute
Message-ID: <202304161218.KlAww4tL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: fc7ba8739b847b6e0c7985170fc0483b168dcf71 [4832/9838] Merge branch 'clock/next' into next
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230416/202304161218.KlAww4tL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/fc7ba8739b847b6e0c7985170fc0483b168dcf71
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout fc7ba8739b847b6e0c7985170fc0483b168dcf71
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304161218.KlAww4tL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from arch/arm/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from arch/arm/include/asm/cacheflush.h:10,
                    from arch/arm/mach-imx/busfreq-imx.c:17:
>> include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm/mach-imx/busfreq-imx.c:102:19: note: in expansion of macro 'NULL'
     102 | } busfreq_func = {NULL, NULL};
         |                   ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'busfreq_func')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm/mach-imx/busfreq-imx.c:102:19: note: in expansion of macro 'NULL'
     102 | } busfreq_func = {NULL, NULL};
         |                   ^~~~
>> include/linux/stddef.h:8:14: error: invalid initializer
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm/mach-imx/busfreq-imx.c:102:19: note: in expansion of macro 'NULL'
     102 | } busfreq_func = {NULL, NULL};
         |                   ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'busfreq_func.<anonymous>')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm/mach-imx/busfreq-imx.c:102:19: note: in expansion of macro 'NULL'
     102 | } busfreq_func = {NULL, NULL};
         |                   ^~~~
>> include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm/mach-imx/busfreq-imx.c:102:25: note: in expansion of macro 'NULL'
     102 | } busfreq_func = {NULL, NULL};
         |                         ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'busfreq_func')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm/mach-imx/busfreq-imx.c:102:25: note: in expansion of macro 'NULL'
     102 | } busfreq_func = {NULL, NULL};
         |                         ^~~~
   cc1: some warnings being treated as errors


vim +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

:::::: The code at line 8 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
