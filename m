Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BF133EC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 11:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678792593; x=1710328593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9OlUvC7Xks9wfysvhyuOEls288E5oQNwgR0yPtmC16s=;
  b=L+tGSBwhtVFf4zc/Rc86uT3Mfy7LHErHZH0/6nCI+H9PGM+SV5dR+ksq
   2SsujFY/CjCKipiIoNexiVjjzd2z8hoDvCvx/fQya7bR22haFeE/gpogU
   Je74fZloQaPe2tQ6DPzUZ56t4PchTBUB3+UaBVAUzAKiIzutibPjs69QK
   uX4OW4jaUOi0nYNb1i1wlI0PSgFMP+4yheGuS5sXPDkdYwySwBmQFVite
   G6td8/Z0GKfwIlxMxQumaob7XBg3BjUHYoxot+Da205pYeOrzzykbpc01
   SVGIo3GPjTd4WgwBrg7a7fyditPzbc64Ec9OwMrUoGC40XpYUfonXAe6r
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334875267"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="334875267"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 04:16:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789321559"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="789321559"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2023 04:16:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc2dr-0006rc-2Z;
	Tue, 14 Mar 2023 11:16:31 +0000
Date: Tue, 14 Mar 2023 19:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
 15/31] arch/mips/include/asm/io.h:114:27: error: conflicting types for
 'virt_to_phys'; have 'phys_addr_t(const volatile void *)' {aka 'unsigned
 int(const volatile void *)'}
Message-ID: <202303141930.mkubBUjS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
head:   961fd7e75191ae82383f80c1dfd97559f14965b8
commit: 44341c79c6d4883399b157f99b4e78d207049f4d [15/31] MIPS: Make virt_to_pfn() a static inline
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230314/202303141930.mkubBUjS-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=44341c79c6d4883399b157f99b4e78d207049f4d
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
        git checkout 44341c79c6d4883399b157f99b4e78d207049f4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141930.mkubBUjS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/include/asm/page.h:73,
                    from arch/mips/include/asm/io.h:29,
                    from include/linux/io.h:13,
                    from arch/mips/include/asm/mips-cps.h:11,
                    from arch/mips/include/asm/smp-ops.h:16,
                    from arch/mips/include/asm/smp.h:21,
                    from include/linux/smp.h:113,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from arch/mips/kernel/asm-offsets.c:12:
   arch/mips/include/asm/page.h: In function 'virt_to_pfn':
   arch/mips/include/asm/page.h:262:40: error: implicit declaration of function 'virt_to_phys'; did you mean 'virt_to_pfn'? [-Werror=implicit-function-declaration]
     262 |         return (unsigned long)PFN_DOWN(virt_to_phys(kaddr));
         |                                        ^~~~~~~~~~~~
   include/linux/pfn.h:20:27: note: in definition of macro 'PFN_DOWN'
      20 | #define PFN_DOWN(x)     ((x) >> PAGE_SHIFT)
         |                           ^
   arch/mips/include/asm/io.h: At top level:
>> arch/mips/include/asm/io.h:114:27: error: conflicting types for 'virt_to_phys'; have 'phys_addr_t(const volatile void *)' {aka 'unsigned int(const volatile void *)'}
     114 | static inline phys_addr_t virt_to_phys(const volatile void *x)
         |                           ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:262:40: note: previous implicit declaration of 'virt_to_phys' with type 'int()'
     262 |         return (unsigned long)PFN_DOWN(virt_to_phys(kaddr));
         |                                        ^~~~~~~~~~~~
   include/linux/pfn.h:20:27: note: in definition of macro 'PFN_DOWN'
      20 | #define PFN_DOWN(x)     ((x) >> PAGE_SHIFT)
         |                           ^
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      26 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      78 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:92:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      92 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:108:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
     108 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:136:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     136 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:179:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     179 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:213:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     213 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:248:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
     248 | void output_signal_defined(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:315:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
     315 | void output_pbe_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:327:6: warning: no previous prototype for 'output_pm_defines' [-Wmissing-prototypes]
     327 | void output_pm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:341:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     341 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:385:6: warning: no previous prototype for 'output_cps_defines' [-Wmissing-prototypes]
     385 | void output_cps_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/mips/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +114 arch/mips/include/asm/io.h

dfad83cb7193ef Florian Fainelli 2021-03-30  113  
dfad83cb7193ef Florian Fainelli 2021-03-30 @114  static inline phys_addr_t virt_to_phys(const volatile void *x)
dfad83cb7193ef Florian Fainelli 2021-03-30  115  {
dfad83cb7193ef Florian Fainelli 2021-03-30  116  	return __virt_to_phys(x);
dfad83cb7193ef Florian Fainelli 2021-03-30  117  }
dfad83cb7193ef Florian Fainelli 2021-03-30  118  

:::::: The code at line 114 was first introduced by commit
:::::: dfad83cb7193effb6c853a5c7337ac2274a2e2fc MIPS: Add support for CONFIG_DEBUG_VIRTUAL

:::::: TO: Florian Fainelli <f.fainelli@gmail.com>
:::::: CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
