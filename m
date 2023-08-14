Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44DD5687
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 20:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692045936; x=1723581936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NTdU++TPTJqazz45ulRG6JcbPtCTdOo6EUxfmPO0Qhc=;
  b=Wzz3D4jeWfYvwILz04Hu1q15V/FqcSSX9KaAemu2xrwF+4kkiNC4AlDz
   j7XingdHAdvxpkxZUHH6pz/ddUYmSpAeTHzbX6m8ZD5CP8Hi3WLp5+s2V
   MGvjyNQ3zwPv3Oamcz19X2oAE9J2ewq/2MRhbgwsDRnkPjkOeaLi/fLxI
   PvCFtYLMMKHXCrNAFtec4ZV1q4AS0jamYftGQer0AgK2eQ5DQq2YK52f0
   Fp+UvnUye5MO4E0s7bAgdga7eM/kWWAZroEsc41JFp7PAk1C7OMvgcvai
   6t9YuYJyo6IX6AICBLO7ZRBzSx2rxzhhEtpR3e/oYwsDNHb13Qy1xG8U8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372130628"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="372130628"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 13:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="803584015"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="803584015"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Aug 2023 13:45:34 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVeRR-0000PR-2r;
	Mon, 14 Aug 2023 20:45:33 +0000
Date: Tue, 15 Aug 2023 04:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-powerpc 2/2]
 arch/powerpc/include/asm/page.h:235:21: error: implicit declaration of
 function 'PFN_PHYS'
Message-ID: <202308150458.RJEzCL1V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-powerpc
head:   62390b7105ee9f1756a171c84d1b2e63fb63d582
commit: 62390b7105ee9f1756a171c84d1b2e63fb63d582 [2/2] powerpc: Make virt_to_pfn() a static inline
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230815/202308150458.RJEzCL1V-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150458.RJEzCL1V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150458.RJEzCL1V-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:12:
   arch/powerpc/include/asm/page.h: In function 'pfn_to_kaddr':
>> arch/powerpc/include/asm/page.h:235:21: error: implicit declaration of function 'PFN_PHYS' [-Werror=implicit-function-declaration]
     235 |         return __va(PFN_PHYS(pfn));
         |                     ^~~~~~~~
   arch/powerpc/include/asm/bug.h:122:43: note: in definition of macro 'WARN_ON'
     122 |                 if (__builtin_constant_p((x))) {                \
         |                                           ^
   arch/powerpc/include/asm/page.h:211:9: note: in expansion of macro 'VIRTUAL_WARN_ON'
     211 |         VIRTUAL_WARN_ON((unsigned long)(x) >= PAGE_OFFSET);             \
         |         ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/page.h:235:16: note: in expansion of macro '__va'
     235 |         return __va(PFN_PHYS(pfn));
         |                ^~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/PFN_PHYS +235 arch/powerpc/include/asm/page.h

   232	
   233	static inline const void *pfn_to_kaddr(unsigned long pfn)
   234	{
 > 235		return __va(PFN_PHYS(pfn));
   236	}
   237	#endif
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
