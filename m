Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCB333FF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 16:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675872550; x=1707408550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gwz91j47h8V3LaMoEdEPkvtw4bOIEBM5QSnXrmHbLjM=;
  b=OMh+hW4Y4lrx7W/5Ln+hlmargOKMOiwJbI/I+UpsdDIaiWuJsV0D/mBM
   NFSUZqxnvoM/t9ehu/YdUKmscNByhBwoyoGWrl3rEKCdSRr0DOWMTyhtv
   8197v2bC1gYors+/AAjXpu/Gks3KZzQwH1w/9UPiZt9VQwqCC1hbTJYix
   vX/WVKIS5FzBOzgBmWMqUf7AUN+RHpLHfpbYu0DGgjjDulOjyZta8d4/j
   rh5YVskqhCWEuXVWiqDnFqRTih9677HluNNkJ1dWfiqYw51YHJR/dyp5K
   jzHbQSkOTRQhdutSOQfPDjgVJCi5JaSh7xdVavA9ODOTqPFKsqmlwpUPX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310195971"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="310195971"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 08:09:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="791264473"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="791264473"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Feb 2023 08:09:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPn0N-0004WY-1i;
	Wed, 08 Feb 2023 16:09:07 +0000
Date: Thu, 9 Feb 2023 00:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 29/31]
 arch/arm/include/asm/uaccess.h:43:21: error: implicit declaration of
 function 'read_sysreg'; did you mean 'read_seqretry'?
Message-ID: <202302090008.JWQdwbf8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   e6fc25ec2770c9db62486fb1f291b99531f86533
commit: 0facdc348172563db9b913d75c9aab1bf68550f8 [29/31] hack passing kernel_init()
config: arm-randconfig-r046-20230205 (https://download.01.org/0day-ci/archive/20230209/202302090008.JWQdwbf8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=0facdc348172563db9b913d75c9aab1bf68550f8
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout 0facdc348172563db9b913d75c9aab1bf68550f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
