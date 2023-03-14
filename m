Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E113D8C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678800723; x=1710336723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gi5cXv5mRpuK+/4Lcbbwrki5276g14Wq+F7DD1hd+0U=;
  b=hwdgftNpciUEq7lpboJl8+e936u6kJwFn8Ss4N+Ww+HvKLEseQfgCT6T
   ANTgoqhVHKF8Ssw5bqGJfkrboXFhlWI7obmQhSroqCifOmzkBX8uFg7mE
   yJSY0zaoAsTu+AHNINEwYp7tKyEMxKPtJFqmtJcxy4Pj8mBirdXPMxi9L
   628y2YTNsfsE5ttLkV699+08fCc0p9GXd9Bdj6P8JRq0fV90h5eCSBg3E
   RyhnuFAy9a0UNUnX73Rz+5YEEZ4JF1qdafz6aplZ+JHEd5Djdhlyp3Wg1
   oNBS0zv11eoAVKbV0o7JcFvD8811M3xu+QjFrCy2UbrfjPuBKHbOM/0D3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317069754"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="317069754"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 06:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="768083755"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="768083755"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Mar 2023 06:31:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc4kb-0006wW-2j;
	Tue, 14 Mar 2023 13:31:37 +0000
Date: Tue, 14 Mar 2023 21:31:11 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 30/30]
 arch/arm/include/asm/uaccess.h:54:21: error: implicit declaration of
 function 'current_user_ttbr'
Message-ID: <202303142109.ge6LkN2J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   8c7a9ba4d5ab142c56f970395de2c419dbcd0a72
commit: 8c7a9ba4d5ab142c56f970395de2c419dbcd0a72 [30/30] switch PGD/TTBR0 in <asm/uaccess-asm.h>
config: arm-randconfig-r013-20230313 (https://download.01.org/0day-ci/archive/20230314/202303142109.ge6LkN2J-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=8c7a9ba4d5ab142c56f970395de2c419dbcd0a72
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout 8c7a9ba4d5ab142c56f970395de2c419dbcd0a72
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303142109.ge6LkN2J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/arm/kernel/asm-offsets.c:12:
   arch/arm/include/asm/pgtable-nommu.h:49: warning: "ZERO_PAGE" redefined
      49 | #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
         | 
   arch/arm/include/asm/pgtable.h:19: note: this is the location of the previous definition
      19 | #define ZERO_PAGE(vaddr)        (empty_zero_page)
         | 
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:740:
   arch/arm/include/asm/uaccess.h: In function 'uaccess_save_and_enable':
>> arch/arm/include/asm/uaccess.h:54:21: error: implicit declaration of function 'current_user_ttbr' [-Werror=implicit-function-declaration]
      54 |         user_ttbr = current_user_ttbr();
         |                     ^~~~~~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:55:23: error: implicit declaration of function 'read_sysreg'; did you mean 'read_seqretry'? [-Werror=implicit-function-declaration]
      55 |         kernel_ttbr = read_sysreg(TTBR1);
         |                       ^~~~~~~~~~~
         |                       read_seqretry
>> arch/arm/include/asm/uaccess.h:55:35: error: 'TTBR1' undeclared (first use in this function)
      55 |         kernel_ttbr = read_sysreg(TTBR1);
         |                                   ^~~~~
   arch/arm/include/asm/uaccess.h:55:35: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm/include/asm/uaccess.h:56:9: error: implicit declaration of function 'write_sysreg' [-Werror=implicit-function-declaration]
      56 |         write_sysreg(user_ttbr, TTBR0);
         |         ^~~~~~~~~~~~
>> arch/arm/include/asm/uaccess.h:56:33: error: 'TTBR0' undeclared (first use in this function)
      56 |         write_sysreg(user_ttbr, TTBR0);
         |                                 ^~~~~
   arch/arm/include/asm/uaccess.h: In function 'uaccess_restore':
   arch/arm/include/asm/uaccess.h:69:29: error: 'TTBR0' undeclared (first use in this function)
      69 |         write_sysreg(flags, TTBR0);
         |                             ^~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/arm/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/current_user_ttbr +54 arch/arm/include/asm/uaccess.h

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
    52		u64 user_ttbr, kernel_ttbr;
    53	
  > 54		user_ttbr = current_user_ttbr();
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
