Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B673C26
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 10:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677234348; x=1708770348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pj7nWTz+gDFfvYmfsoQfsRI4B2MrDBeqA2nyF1lfAGk=;
  b=aD/EEqezT17jFoF1cNJCkI8PpRGJmUfFgL4rQ2T3awRX79k5fOBcEUll
   +iSFOMbZ4lDPIVDeilPD4PINA3GXkgw9ueCUESHi/EjMUeKzz+DDCvuqM
   drzM16lN4m3/r9fwU2VqHhSU1M0S4bCpQx9OeFZdW1npOKEIpB4nsiNtR
   JfOuEOThGDCu+qfPYCelvkEpxhO/Uv9YMV7ca2AX8GUBxIF2f3p42YVqQ
   NQI0ZAamdZEBmcJpXzkDsLXyqsY1Nkh8QT7me74cGmzO2JKSTm6BFMQpY
   Q/kC2+VhiLJ4w/M2BeQeCGpB7Fou3N5wGqFCYc29RXDN5G+pkLmzm2TkJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="334865309"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="334865309"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 02:25:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="846901151"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="846901151"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Feb 2023 02:25:46 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVVGs-0002Kl-0k;
	Fri, 24 Feb 2023 10:25:46 +0000
Date: Fri, 24 Feb 2023 18:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:dcp-better-timeline 8/29]
 include/linux/compiler_types.h:358:45: error: call to
 '__compiletime_assert_284' declared with attribute error: FIELD_GET: mask is
 zero
Message-ID: <202302241820.SR74fPfO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux dcp-better-timeline
head:   0de243b5677f9107b36034576e442a7e66bb692b
commit: 1d3f2c74525fef3167e3db539403b7a58dd3f85d [8/29] WIP: dmaengine: apple-sio: Add Apple SIO driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230224/202302241820.SR74fPfO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/povik/linux/commit/1d3f2c74525fef3167e3db539403b7a58dd3f85d
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik dcp-better-timeline
        git checkout 1d3f2c74525fef3167e3db539403b7a58dd3f85d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/dma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302241820.SR74fPfO-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:75:56: note: in expansion of macro '__bf_shf'
      75 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:791:37: note: in expansion of macro 'FIELD_PREP'
     791 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                     ^~~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:29:25: note: in expansion of macro 'GENMASK'
      29 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:791:48: note: in expansion of macro 'SIOMSG_DATA'
     791 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                                ^~~~~~~~~~~
   include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/dma/apple-sio.c:791:37: note: in expansion of macro 'FIELD_PREP'
     791 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                     ^~~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:29:25: note: in expansion of macro 'GENMASK'
      29 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:791:48: note: in expansion of macro 'SIOMSG_DATA'
     791 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                                ^~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/dma/apple-sio.c:791:37: note: in expansion of macro 'FIELD_PREP'
     791 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                     ^~~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:29:25: note: in expansion of macro 'GENMASK'
      29 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:791:48: note: in expansion of macro 'SIOMSG_DATA'
     791 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                                ^~~~~~~~~~~
   include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/bitfield.h:115:63: note: in definition of macro 'FIELD_PREP'
     115 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                                               ^~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:29:25: note: in expansion of macro 'GENMASK'
      29 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:791:48: note: in expansion of macro 'SIOMSG_DATA'
     791 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                                ^~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bitfield.h:115:63: note: in definition of macro 'FIELD_PREP'
     115 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                                               ^~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:29:25: note: in expansion of macro 'GENMASK'
      29 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:791:48: note: in expansion of macro 'SIOMSG_DATA'
     791 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                                ^~~~~~~~~~~
   drivers/dma/apple-sio.c: In function 'sio_recv_msg':
>> include/linux/compiler_types.h:358:45: error: call to '__compiletime_assert_284' declared with attribute error: FIELD_GET: mask is zero
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:339:25: note: in definition of macro '__compiletime_assert'
     339 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:553:17: note: in expansion of macro 'FIELD_GET'
     553 |         data  = FIELD_GET(SIOMSG_DATA, msg);
         |                 ^~~~~~~~~
   In function 'sio_send_dt_params',
       inlined from 'sio_probe' at drivers/dma/apple-sio.c:892:8:
>> include/linux/compiler_types.h:358:45: error: call to '__compiletime_assert_369' declared with attribute error: FIELD_PREP: mask is zero
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:339:25: note: in definition of macro '__compiletime_assert'
     339 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:791:37: note: in expansion of macro 'FIELD_PREP'
     791 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                     ^~~~~~~~~~
   In function 'sio_alloc_shmem',
       inlined from 'sio_probe' at drivers/dma/apple-sio.c:896:8:
   include/linux/compiler_types.h:358:45: error: call to '__compiletime_assert_334' declared with attribute error: FIELD_PREP: mask is zero
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:339:25: note: in definition of macro '__compiletime_assert'
     339 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:749:29: note: in expansion of macro 'FIELD_PREP'
     749 |                             FIELD_PREP(SIOMSG_DATA, iova >> 12));
         |                             ^~~~~~~~~~
   In function 'sio_fill_in_locked',
       inlined from 'sio_issue_pending' at drivers/dma/apple-sio.c:407:3:
   include/linux/compiler_types.h:358:45: error: call to '__compiletime_assert_265' declared with attribute error: FIELD_PREP: mask is zero
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:339:25: note: in definition of macro '__compiletime_assert'
     339 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:386:38: note: in expansion of macro 'FIELD_PREP'
     386 |                                      FIELD_PREP(SIOMSG_DATA, sio_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~


vim +/__compiletime_assert_284 +358 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  344  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  345  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  346  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  347  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  348  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  349   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  350   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  351   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  352   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  353   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  354   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  355   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  356   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  357  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @358  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  359  

:::::: The code at line 358 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
