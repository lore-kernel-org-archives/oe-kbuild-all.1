Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90BC63B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 03:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679109692; x=1710645692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t/0MMGMRc/QrEkIhNxb/9OsAUtaggi5ALQYxl0o/x0Y=;
  b=JU5voYbJ3GLfvo+6Qo6wkVzqupHy/xtc+R3+u55uVvfymitCnabqa/kF
   ut0eNz+gIKlrN6+c2fphs3xlOInSynPo0lvW8+XawKzFZJOLVidGsvoaC
   rmldjVQuOZo53jn+jvopegWmNZcccT7XkdLyzI2mZ01BKdA1rpZAbhh29
   ZPRW31d4r7dDuv5Z5/4LLJZGgiD2VrQ5xF7s4bIMDzvJCN1dEUscLUMvQ
   I6IDiEnSUNoTZwwrjFItnLaFrzUJ48yBrx7mcuQKHBit/4/vhI9Tcbyrf
   QcwdCNhi4qlr/F8oHkwoM6Xuj3CazLImZk5ezSUDX7oF6FsTEAmSPt/jM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="337108383"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="337108383"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 20:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="673782825"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="673782825"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Mar 2023 20:21:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdN8L-0009lm-37;
	Sat, 18 Mar 2023 03:21:29 +0000
Date: Sat, 18 Mar 2023 11:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
 30/31] arch/arm/include/asm/uaccess.h:55:40: error: macro "__read_sysreg"
 requires 4 arguments, but only 1 given
Message-ID: <202303181138.9W6ooWrN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
head:   961fd7e75191ae82383f80c1dfd97559f14965b8
commit: 10557ad0121060f8e047e962a08858c0e5652cb8 [30/31] switch PGD/TTBR0 in <asm/uaccess-asm.h>
config: arm-randconfig-r036-20230312 (https://download.01.org/0day-ci/archive/20230318/202303181138.9W6ooWrN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=10557ad0121060f8e047e962a08858c0e5652cb8
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
        git checkout 10557ad0121060f8e047e962a08858c0e5652cb8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181138.9W6ooWrN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:740,
                    from arch/arm/kernel/asm-offsets.c:12:
   arch/arm/include/asm/uaccess.h: In function 'uaccess_save_and_enable':
   arch/arm/include/asm/uaccess.h:54:21: error: implicit declaration of function 'current_user_ttbr' [-Werror=implicit-function-declaration]
      54 |         user_ttbr = current_user_ttbr();
         |                     ^~~~~~~~~~~~~~~~~
>> arch/arm/include/asm/uaccess.h:55:40: error: macro "__read_sysreg" requires 4 arguments, but only 1 given
      55 |         kernel_ttbr = read_sysreg(TTBR1);
         |                                        ^
   In file included from arch/arm/include/asm/cp15.h:53,
                    from arch/arm/include/asm/uaccess.h:17:
   arch/arm/include/asm/vdso/cp15.h:19: note: macro "__read_sysreg" defined here
      19 | #define __read_sysreg(r, w, c, t) ({                            \
         | 
>> arch/arm/include/asm/vdso/cp15.h:24:41: error: '__read_sysreg' undeclared (first use in this function); did you mean 'read_sysreg'?
      24 | #define read_sysreg(...)                __read_sysreg(__VA_ARGS__)
         |                                         ^~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:55:23: note: in expansion of macro 'read_sysreg'
      55 |         kernel_ttbr = read_sysreg(TTBR1);
         |                       ^~~~~~~~~~~
   arch/arm/include/asm/vdso/cp15.h:24:41: note: each undeclared identifier is reported only once for each function it appears in
      24 | #define read_sysreg(...)                __read_sysreg(__VA_ARGS__)
         |                                         ^~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:55:23: note: in expansion of macro 'read_sysreg'
      55 |         kernel_ttbr = read_sysreg(TTBR1);
         |                       ^~~~~~~~~~~
>> arch/arm/include/asm/uaccess.h:56:38: error: macro "__write_sysreg" requires 5 arguments, but only 2 given
      56 |         write_sysreg(user_ttbr, TTBR0);
         |                                      ^
   arch/arm/include/asm/vdso/cp15.h:26: note: macro "__write_sysreg" defined here
      26 | #define __write_sysreg(v, r, w, c, t)   asm volatile(w " " c : : "r" ((t)(v)))
         | 
>> arch/arm/include/asm/vdso/cp15.h:27:41: error: '__write_sysreg' undeclared (first use in this function); did you mean 'write_sysreg'?
      27 | #define write_sysreg(v, ...)            __write_sysreg(v, __VA_ARGS__)
         |                                         ^~~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:56:9: note: in expansion of macro 'write_sysreg'
      56 |         write_sysreg(user_ttbr, TTBR0);
         |         ^~~~~~~~~~~~
>> arch/arm/include/asm/uaccess.h:52:13: warning: variable 'user_ttbr' set but not used [-Wunused-but-set-variable]
      52 |         u64 user_ttbr, kernel_ttbr;
         |             ^~~~~~~~~
   arch/arm/include/asm/uaccess.h: In function 'uaccess_restore':
   arch/arm/include/asm/uaccess.h:69:34: error: macro "__write_sysreg" requires 5 arguments, but only 2 given
      69 |         write_sysreg(flags, TTBR0);
         |                                  ^
   arch/arm/include/asm/vdso/cp15.h:26: note: macro "__write_sysreg" defined here
      26 | #define __write_sysreg(v, r, w, c, t)   asm volatile(w " " c : : "r" ((t)(v)))
         | 
>> arch/arm/include/asm/vdso/cp15.h:27:41: error: '__write_sysreg' undeclared (first use in this function); did you mean 'write_sysreg'?
      27 | #define write_sysreg(v, ...)            __write_sysreg(v, __VA_ARGS__)
         |                                         ^~~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:69:9: note: in expansion of macro 'write_sysreg'
      69 |         write_sysreg(flags, TTBR0);
         |         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/arm/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/__read_sysreg +55 arch/arm/include/asm/uaccess.h

    28	
    29	/*
    30	 * These two functions allow hooking accesses to userspace to increase
    31	 * system integrity by ensuring that the kernel can not inadvertantly
    32	 * perform such accesses (eg, via list poison values) which could then
    33	 * be exploited for priviledge escalation.
    34	 */
    35	static __always_inline unsigned int uaccess_save_and_enable(void)
    36	{
    37	#ifdef CONFIG_CPU_SW_DOMAIN_PAN
    38		unsigned int old_domain = get_domain();
    39	
    40		/* Set the current domain access to permit user accesses */
    41		set_domain((old_domain & ~domain_mask(DOMAIN_USER)) |
    42			   domain_val(DOMAIN_USER, DOMAIN_CLIENT));
    43	
    44		return old_domain;
    45	#else
    46		/*
    47		 * Intended semantics: switch to the userspace MM context (enable
    48		 * userspace), then return (save) the previous kernelspace TTBR0
    49		 * value.
    50		 */
    51		/* FIXME: ifdef CONFIG_VMSPLIT_4G_4G */
  > 52		u64 user_ttbr, kernel_ttbr;
    53	
    54		user_ttbr = current_user_ttbr();
  > 55		kernel_ttbr = read_sysreg(TTBR1);
  > 56		write_sysreg(user_ttbr, TTBR0);
    57	
    58		return kernel_ttbr;
    59	#endif
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
