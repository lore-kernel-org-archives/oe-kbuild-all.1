Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B06C3FFE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 13:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694612755; x=1726148755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q4F/gAbTOTtIU7XojFYzAXI0gkQu6H6Zr7CizROo5Ks=;
  b=LZynpKMn4eQ8RFGBbxMqcXIfNQr3XL/jyi7mzBvXyJlHULmpXPhMH08+
   iYxeIDZpdnX7jlxTExLKE1zPvqQyofoe57KHwPBfs43JIdAeHF6YMuxzO
   RRiwxVjmUPtTCFMpSWqklDClTafsNvXTGJ2Y8D0vcqQyOKpyiWBF4t6x1
   aiySEK1YMO5EzeANP+CnRlpuUQiF2zNwu2jVUgEr57Br2QywobCM+pezE
   w44t37qoyjtS0lcdI+hGybhH+NulmJ7zPJtu3YIyp+u4ktkmOkUHIOJ1F
   spXrILEvJCIypBmp5D+QF77lLJAKpInfN6YSChHCPRRwrVpsk5zRTK03B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="375995835"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="375995835"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 06:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="720810863"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="720810863"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Sep 2023 06:45:50 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgQBg-00007T-1A;
	Wed, 13 Sep 2023 13:45:48 +0000
Date: Wed, 13 Sep 2023 21:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-kfence 2/2] mm/kfence/core.c:253:63:
 warning: dereferencing 'void *' pointer
Message-ID: <202309132151.cDWHIesQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-kfence
head:   b086f69b6ffadeb19959f05bd67cc5d196a78558
commit: b086f69b6ffadeb19959f05bd67cc5d196a78558 [2/2] kfence: Use a void * for page pool
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230913/202309132151.cDWHIesQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309132151.cDWHIesQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309132151.cDWHIesQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/cleanup.h:5,
                    from include/linux/irqflags.h:16,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/parisc/include/asm/cmpxchg.h:89,
                    from arch/parisc/include/asm/atomic.h:10,
                    from include/linux/atomic.h:7,
                    from mm/kfence/core.c:10:
   include/linux/kfence.h: In function 'is_kfence_address':
   include/linux/kfence.h:58:54: error: invalid operands to binary - (have 'char *' and 'void *')
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                                         ~~~~~~~~~~~~ ^
         |                                         |
         |                                         char *
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   mm/kfence/core.c: In function 'metadata_to_pageaddr':
>> mm/kfence/core.c:253:63: warning: dereferencing 'void *' pointer
     253 |         unsigned long pageaddr = (unsigned long)&__kfence_pool[offset];
         |                                                               ^
   In file included from mm/kfence/core.c:17:
   include/linux/kfence.h: In function 'is_kfence_address':
   include/linux/kfence.h:59:1: error: control reaches end of non-void function [-Werror=return-type]
      59 | }
         | ^
   cc1: some warnings being treated as errors


vim +253 mm/kfence/core.c

0ce20dd840897b Alexander Potapenko 2021-02-25  249  
0ce20dd840897b Alexander Potapenko 2021-02-25  250  static inline unsigned long metadata_to_pageaddr(const struct kfence_metadata *meta)
0ce20dd840897b Alexander Potapenko 2021-02-25  251  {
0ce20dd840897b Alexander Potapenko 2021-02-25  252  	unsigned long offset = (meta - kfence_metadata + 1) * PAGE_SIZE * 2;
0ce20dd840897b Alexander Potapenko 2021-02-25 @253  	unsigned long pageaddr = (unsigned long)&__kfence_pool[offset];
0ce20dd840897b Alexander Potapenko 2021-02-25  254  
0ce20dd840897b Alexander Potapenko 2021-02-25  255  	/* The checks do not affect performance; only called from slow-paths. */
0ce20dd840897b Alexander Potapenko 2021-02-25  256  
0ce20dd840897b Alexander Potapenko 2021-02-25  257  	/* Only call with a pointer into kfence_metadata. */
0ce20dd840897b Alexander Potapenko 2021-02-25  258  	if (KFENCE_WARN_ON(meta < kfence_metadata ||
0ce20dd840897b Alexander Potapenko 2021-02-25  259  			   meta >= kfence_metadata + CONFIG_KFENCE_NUM_OBJECTS))
0ce20dd840897b Alexander Potapenko 2021-02-25  260  		return 0;
0ce20dd840897b Alexander Potapenko 2021-02-25  261  
0ce20dd840897b Alexander Potapenko 2021-02-25  262  	/*
0ce20dd840897b Alexander Potapenko 2021-02-25  263  	 * This metadata object only ever maps to 1 page; verify that the stored
0ce20dd840897b Alexander Potapenko 2021-02-25  264  	 * address is in the expected range.
0ce20dd840897b Alexander Potapenko 2021-02-25  265  	 */
0ce20dd840897b Alexander Potapenko 2021-02-25  266  	if (KFENCE_WARN_ON(ALIGN_DOWN(meta->addr, PAGE_SIZE) != pageaddr))
0ce20dd840897b Alexander Potapenko 2021-02-25  267  		return 0;
0ce20dd840897b Alexander Potapenko 2021-02-25  268  
0ce20dd840897b Alexander Potapenko 2021-02-25  269  	return pageaddr;
0ce20dd840897b Alexander Potapenko 2021-02-25  270  }
0ce20dd840897b Alexander Potapenko 2021-02-25  271  

:::::: The code at line 253 was first introduced by commit
:::::: 0ce20dd840897b12ae70869c69f1ba34d6d16965 mm: add Kernel Electric-Fence infrastructure

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
