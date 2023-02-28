Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10356622
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 14:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677595780; x=1709131780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OCscDZA59/1sOyUcyrh+qc3hluzFGTXSCAvkxbyJYys=;
  b=U6XdU2sI8HrwICdFWOhwGtL4PUyEHTnU9V3r5KBfrabtiVyNwrzTRM0C
   LLN7pohs+t+BPtcoLolJ0EBEaVPMCLH9daSDYno9/hN5Jz6c4vLAYT5qo
   xDrv1LsS3Bt0IA6ygrM03pw4ci/c6STpZ/1McByybDMh3/ZAgATb1CsE2
   sP3nhq3cMtxXGqkKMjYu5K1hPecoY01mO8BQ0GdmfzO6nIATP2QS9m/O7
   Q5fmXMNGzAPjeiIgGrLWL6hjJpOkEzI8kiGOhO69k9MLk5D9XeMCmSKu1
   sbZv2Ce5uPr8QEgsi7lWjI70sMHCYdHDUd28e5wsB/JgFitDMseVvGJG2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="398930432"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="398930432"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 06:49:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="676322527"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="676322527"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Feb 2023 06:49:37 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pX1IP-0005T5-0W;
	Tue, 28 Feb 2023 14:49:37 +0000
Date: Tue, 28 Feb 2023 22:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 30/30]
 arch/arm/include/asm/uaccess.h:43:21: error: implicit declaration of
 function 'read_sysreg'; did you mean 'read_seqretry'?
Message-ID: <202302282200.S6ER4da3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   b9e824a65f7f576a929c736500bdad5e10ce74f6
commit: b9e824a65f7f576a929c736500bdad5e10ce74f6 [30/30] hack passing kernel_init()
config: arm-randconfig-r034-20230227 (https://download.01.org/0day-ci/archive/20230228/202302282200.S6ER4da3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=b9e824a65f7f576a929c736500bdad5e10ce74f6
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout b9e824a65f7f576a929c736500bdad5e10ce74f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302282200.S6ER4da3-lkp@intel.com/

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
>> arch/arm/include/asm/uaccess.h:43:21: error: implicit declaration of function 'read_sysreg'; did you mean 'read_seqretry'? [-Werror=implicit-function-declaration]
      43 |         user_ttbr = read_sysreg(TTBR0);
         |                     ^~~~~~~~~~~
         |                     read_seqretry
>> arch/arm/include/asm/uaccess.h:20:17: error: implicit declaration of function '__ACCESS_CP15' [-Werror=implicit-function-declaration]
      20 | #define TTBR0   __ACCESS_CP15(c2, 0, c0, 0)
         |                 ^~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:43:33: note: in expansion of macro 'TTBR0'
      43 |         user_ttbr = read_sysreg(TTBR0);
         |                                 ^~~~~
>> arch/arm/include/asm/uaccess.h:20:31: error: 'c2' undeclared (first use in this function)
      20 | #define TTBR0   __ACCESS_CP15(c2, 0, c0, 0)
         |                               ^~
   arch/arm/include/asm/uaccess.h:43:33: note: in expansion of macro 'TTBR0'
      43 |         user_ttbr = read_sysreg(TTBR0);
         |                                 ^~~~~
   arch/arm/include/asm/uaccess.h:20:31: note: each undeclared identifier is reported only once for each function it appears in
      20 | #define TTBR0   __ACCESS_CP15(c2, 0, c0, 0)
         |                               ^~
   arch/arm/include/asm/uaccess.h:43:33: note: in expansion of macro 'TTBR0'
      43 |         user_ttbr = read_sysreg(TTBR0);
         |                                 ^~~~~
>> arch/arm/include/asm/uaccess.h:20:38: error: 'c0' undeclared (first use in this function)
      20 | #define TTBR0   __ACCESS_CP15(c2, 0, c0, 0)
         |                                      ^~
   arch/arm/include/asm/uaccess.h:43:33: note: in expansion of macro 'TTBR0'
      43 |         user_ttbr = read_sysreg(TTBR0);
         |                                 ^~~~~
>> arch/arm/include/asm/uaccess.h:45:9: error: implicit declaration of function 'write_sysreg' [-Werror=implicit-function-declaration]
      45 |         write_sysreg(kernel_ttbr, TTBR0);
         |         ^~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h: In function 'uaccess_restore':
>> arch/arm/include/asm/uaccess.h:20:31: error: 'c2' undeclared (first use in this function)
      20 | #define TTBR0   __ACCESS_CP15(c2, 0, c0, 0)
         |                               ^~
   arch/arm/include/asm/uaccess.h:57:29: note: in expansion of macro 'TTBR0'
      57 |         write_sysreg(flags, TTBR0);
         |                             ^~~~~
>> arch/arm/include/asm/uaccess.h:20:38: error: 'c0' undeclared (first use in this function)
      20 | #define TTBR0   __ACCESS_CP15(c2, 0, c0, 0)
         |                                      ^~
   arch/arm/include/asm/uaccess.h:57:29: note: in expansion of macro 'TTBR0'
      57 |         write_sysreg(flags, TTBR0);
         |                             ^~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/arm/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +43 arch/arm/include/asm/uaccess.h

    19	
  > 20	#define TTBR0	__ACCESS_CP15(c2, 0, c0, 0)
    21	#define TTBR1	__ACCESS_CP15(c2, 0, c0, 1)
    22	
    23	/*
    24	 * These two functions allow hooking accesses to userspace to increase
    25	 * system integrity by ensuring that the kernel can not inadvertantly
    26	 * perform such accesses (eg, via list poison values) which could then
    27	 * be exploited for priviledge escalation.
    28	 */
    29	static __always_inline unsigned int uaccess_save_and_enable(void)
    30	{
    31	#ifdef CONFIG_CPU_SW_DOMAIN_PAN
    32		unsigned int old_domain = get_domain();
    33	
    34		/* Set the current domain access to permit user accesses */
    35		set_domain((old_domain & ~domain_mask(DOMAIN_USER)) |
    36			   domain_val(DOMAIN_USER, DOMAIN_CLIENT));
    37	
    38		return old_domain;
    39	#else
    40		/* FIXME: ifdef CONFIG_VMSPLIT_4G_4G */
    41		u32 user_ttbr, kernel_ttbr;
    42	
  > 43		user_ttbr = read_sysreg(TTBR0);
    44		kernel_ttbr = read_sysreg(TTBR1);
  > 45		write_sysreg(kernel_ttbr, TTBR0);
    46		return user_ttbr;
    47	#endif
    48	}
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
