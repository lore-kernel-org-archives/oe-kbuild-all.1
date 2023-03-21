Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9C01FB8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 07:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679384848; x=1710920848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CXyfdNA+PkhbsnrvWMPaHUoDCZ6edDzbo86AaldR8Yk=;
  b=bGuYF7rtZ53fABRMFLXyQ8J4Nyby+0O+YrvAlacp3Fx8T9xPipzmQGzZ
   s83l7bl1T3RRqTubSHvTZvybUXrOsp5qC5oLrr7kbSrqBf1j8+leNmugX
   iEAMX1a8IkqOCDvn9glvcIUir53P1VppYYzbG7MsYFMj6zgNxxgoMH1DE
   JkKyBdM0PhJX0l1lGzKpR0xP5C3NQMrvaW7KpQfcr0Wc8Vy5S6QjHx2yk
   Pj7zzE8UZiViYGCCWLpAU5dsMuOccvsupTNl6mf3X4by8FlxUnbwSpj1E
   LIcjI8mRu3J36mI2Czt0tiOlhOOnG8LteFXqFYy3NDVcSamY3fg7cCrVA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="322716191"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="322716191"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 00:47:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="711703249"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="711703249"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Mar 2023 00:47:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peWiE-000BjS-1r;
	Tue, 21 Mar 2023 07:47:18 +0000
Date: Tue, 21 Mar 2023 15:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 1/1] lib/test_map_h.c:25:39: error: expected comma in
 macro parameter list
Message-ID: <202303211501.W16lTKYA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   d23ecc1b5bd07a90e9bea919ecf2c1b8e5182593
commit: d23ecc1b5bd07a90e9bea919ecf2c1b8e5182593 [1/1] include/linux/map.h: add new header, test it with test_map_h.c (RFC)
config: hexagon-buildonly-randconfig-r001-20230319 (https://download.01.org/0day-ci/archive/20230321/202303211501.W16lTKYA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/d23ecc1b5bd07a90e9bea919ecf2c1b8e5182593
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout d23ecc1b5bd07a90e9bea919ecf2c1b8e5182593
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211501.W16lTKYA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_map_h.c:25:39: error: expected comma in macro parameter list
     #define BUILD_BUG_STREQ(BUILD_BUG_ON(0))
                                         ^
>> lib/test_map_h.c:37:2: error: call to undeclared function 'BUILD_BUG_STREQ'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           BUILD_BUG_STREQ(debug_cats, 0, "DRMx_CORE");
           ^
>> lib/test_map_h.c:37:18: error: use of undeclared identifier 'debug_cats'; did you mean 'debug_locks'?
           BUILD_BUG_STREQ(debug_cats, 0, "DRMx_CORE");
                           ^~~~~~~~~~
                           debug_locks
   include/linux/debug_locks.h:10:12: note: 'debug_locks' declared here
   extern int debug_locks __read_mostly;
              ^
   lib/test_map_h.c:38:18: error: use of undeclared identifier 'debug_cats'; did you mean 'debug_locks'?
           BUILD_BUG_STREQ(debug_cats, 1, "DRMx_DRIVER");
                           ^~~~~~~~~~
                           debug_locks
   include/linux/debug_locks.h:10:12: note: 'debug_locks' declared here
   extern int debug_locks __read_mostly;
              ^
   lib/test_map_h.c:39:18: error: use of undeclared identifier 'debug_cats'; did you mean 'debug_locks'?
           BUILD_BUG_STREQ(debug_cats, 2, "DRMx_KMS");
                           ^~~~~~~~~~
                           debug_locks
   include/linux/debug_locks.h:10:12: note: 'debug_locks' declared here
   extern int debug_locks __read_mostly;
              ^
   5 errors generated.


vim +25 lib/test_map_h.c

    22	
    23	/* ARCH=i386 has compile-time errs from this otherwize */
    24	#if !defined(__i386__)
  > 25	  #define BUILD_BUG_STREQ(BUILD_BUG_ON(0))
    26	#else
    27	/* test 2 ways, for now */
    28	#define BUILD_BUG_STREQ(_var, idx, ref) do {				\
    29			BUILD_BUG_ON(__builtin_memcmp(_var##_slist[idx], ref, sizeof(ref))); \
    30			BUILD_BUG_ON(__builtin_memcmp(_var##_slist[idx], ref, __builtin_strlen(ref))); \
    31		} while (0)
    32	#endif
    33	
    34	/* force compile, though its not called */
    35	static void __used MAPH_BUILD_BUG(void)
    36	{
  > 37		BUILD_BUG_STREQ(debug_cats, 0, "DRMx_CORE");
    38		BUILD_BUG_STREQ(debug_cats, 1, "DRMx_DRIVER");
    39		BUILD_BUG_STREQ(debug_cats, 2, "DRMx_KMS");
    40	#ifdef FORCE_FAIL
    41		/* properly breaks compile */
    42		BUILD_BUG_STREQ(debug_cats, 1, "'not-in-map'");
    43	#endif
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
