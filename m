Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB3A8BE9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 14:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682000685; x=1713536685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2xqHNWX8sAEKN1jsFjIIkpStSRIy5FK06ahkmpP1py8=;
  b=KVUY6ezw2KSZWgvHwuwhr/87xaacezzVydnr/tWqVE+bSMLzECVn8VZk
   jnM/Zrq3Npn3KQGYxVpRdTdKbXDV8VkWwb1zVC01Q6evo2iiqN3f5Qohw
   FEGaReVNPPuCDrPplGY/QP1h5MxpmxwBa1Bd/Cq2oB8LeAnXywT61/oD2
   JROF1EnvmdGA64D4AuXhrSPbUx9epqEusJaDZTc9LG1YzP+Fu0qT9ksFF
   dqe9fEgYm56s6gMeYDfy3J+8FTU9CI4gvchC70js3oRzR72eCMOcEGL6A
   4/scyo7l9zitYQDSQLsMZq0rxwaipuTJ8WdW3DRDm1wuqer0xSjsKDZX/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="345756373"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="345756373"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 07:24:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756520401"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="756520401"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Apr 2023 07:24:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppVDG-000fsQ-2P;
	Thu, 20 Apr 2023 14:24:42 +0000
Date: Thu, 20 Apr 2023 22:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 3578/9845]
 include/asm-generic/div64.h:238:36: error: passing argument 1 of
 '__div64_32' from incompatible pointer type
Message-ID: <202304202239.gY352yO9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   897d73a656fe33d0c4549c5de1d07797f99d6871
commit: fbc9c63f5eaa123239b5e21fee0c41a4b52bd831 [3578/9845] LF-6250-2 phy: freescale: Add i.MX93 Synopsys DesignWare MIPI DPHY support
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304202239.gY352yO9-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/fbc9c63f5eaa123239b5e21fee0c41a4b52bd831
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout fbc9c63f5eaa123239b5e21fee0c41a4b52bd831
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304202239.gY352yO9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:25,
                    from include/linux/clk.h:13,
                    from drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:8:
   drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c: In function 'dw_dphy_config_from_opts':
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:17: note: in expansion of macro 'do_div'
     243 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:6:
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:17: note: in expansion of macro 'do_div'
     243 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~
>> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    long unsigned int *
   drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:17: note: in expansion of macro 'do_div'
     243 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'long unsigned int *'
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:205:26: warning: 'best_m' is used uninitialized [-Wuninitialized]
     205 |         unsigned long m, best_m;
         |                          ^~~~~~
   drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:204:39: warning: 'best_n' is used uninitialized [-Wuninitialized]
     204 |         unsigned int min_n, max_n, n, best_n;
         |                                       ^~~~~~
   cc1: some warnings being treated as errors


vim +/__div64_32 +238 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  215  
^1da177e4c3f41 Linus Torvalds     2005-04-16  216  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds     2005-04-16  217   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds     2005-04-16  218   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  219  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds     2005-04-16  220  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds     2005-04-16  221  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds     2005-04-16  222  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  223  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  224  	    is_power_of_2(__base)) {			\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  225  		__rem = (n) & (__base - 1);		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  226  		(n) >>= ilog2(__base);			\
c747ce4706190e Geert Uytterhoeven 2021-08-11  227  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93 Nicolas Pitre      2015-10-30  228  		   __base != 0) {			\
461a5e51060c93 Nicolas Pitre      2015-10-30  229  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  230  		(n) = __div64_const32(n, __base);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  231  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93 Nicolas Pitre      2015-10-30  232  		__res_lo = (n);				\
461a5e51060c93 Nicolas Pitre      2015-10-30  233  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  234  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  235  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  236  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190e Geert Uytterhoeven 2021-08-11  237  	} else {					\
^1da177e4c3f41 Linus Torvalds     2005-04-16 @238  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  239  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  240  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  241   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  242  

:::::: The code at line 238 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
