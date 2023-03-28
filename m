Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2187E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 01:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679967888; x=1711503888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+P7kwI2DxeEk9F0rErH/JVSPiz7aJ7ATF44thgX7QbM=;
  b=C7+UVx2UU0z4AHzFINBnfWCrUIU6OHlR7TNzS2p0mcdyc4xYgt5VG0Iy
   sp7p0nbRPKn/BeBZoxoPLqiVT39FgKfUuBaGqD2tNpQO/DL8Ly6DtzmSA
   glUF018WULvqS9MfL2e9UvNDyBb7Us8NliVczBhjamLyi3d+smfR9yNbs
   H2yWVBQgq9DUXQJ/IZOTVzgUz6FvQRDXs6bm3gLlAMHqojJRoSnEyoVqc
   8VAgD3lTyYUvpWfJcZmngklQ50sGKt3/8+9o4JSAetgmuR7S+PnynOZtE
   Nu43iThHYjRz7u5FeWMHOtadVZiZiY0MhTyuXTamCLXZjLg8HC8OChU0+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="337942469"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="337942469"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 18:44:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="661008477"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="661008477"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Mar 2023 18:44:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgyO8-000I9n-2B;
	Tue, 28 Mar 2023 01:44:40 +0000
Date: Tue, 28 Mar 2023 09:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.3-rc3-redux 8/8]
 arch/m68k/include/asm/page_mm.h:131:26: error: invalid operands to binary <<
 (have 'void *' and 'int')
Message-ID: <202303280900.t1CADF52-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.3-rc3-redux
head:   b5fe3402030c1ea066167108866fd21881895594
commit: b5fe3402030c1ea066167108866fd21881895594 [8/8] m68k/mm: Make pfn accessors static inlines
config: m68k-randconfig-r036-20230326 (https://download.01.org/0day-ci/archive/20230328/202303280900.t1CADF52-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=b5fe3402030c1ea066167108866fd21881895594
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.3-rc3-redux
        git checkout b5fe3402030c1ea066167108866fd21881895594
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303280900.t1CADF52-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/kernel/asm-offsets.c:15:
   arch/m68k/include/asm/page_mm.h: In function 'pfn_to_virt':
>> arch/m68k/include/asm/page_mm.h:131:26: error: invalid operands to binary << (have 'void *' and 'int')
     131 |         return __va(pfn) << PAGE_SHIFT;
         |                ~~~~~~~~~ ^~
         |                |
         |                void *
   make[2]: *** [scripts/Makefile.build:114: arch/m68k/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +131 arch/m68k/include/asm/page_mm.h

   128	
   129	static inline void * pfn_to_virt(unsigned long pfn)
   130	{
 > 131		return __va(pfn) << PAGE_SHIFT;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
