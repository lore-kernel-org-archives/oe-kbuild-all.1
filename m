Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1027D6AAB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 22:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682289214; x=1713825214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uN0tC84pVj50J8swhSh0wiHWo5fVmBuPNDDPZlMbYCo=;
  b=adqbtxL27p/cQMD4TQVW0Yj3D/8Kf+veUbpY/H+xhaz9VWVqiINBAl2H
   Wt4GN6gyaJ36CaCQDX6GkomDBS7kltA5KmatfvbCVSV1JLqL2gPnkVKKl
   HIfbT3MhADQz4O630xUwEyPsU8pn4ADTz46gEe5eUBU58di5/I6ucVcxo
   dLvyoEpVQdznvG1/ATbJVLdnpOhNyEa9wB9AqDjPMsoafSWJN6fxkcc9C
   kcchwZvgOTdTAfW/5onT9XCCi15PhcTTteE97o5tZhvCNbLlTnGoh5S3A
   UNjJgs1O4PZRXoKFCCQK0GnXXimPedOcofOHQuziFa87P53qcWR28Vw6R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="432593241"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="432593241"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 15:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="723378382"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="723378382"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Apr 2023 15:33:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqiGx-000i7q-1X;
	Sun, 23 Apr 2023 22:33:31 +0000
Date: Mon, 24 Apr 2023 06:32:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 3/5] lib/test_map_h.c:41:2: error: call to
 '__compiletime_assert_314' declared with 'error' attribute: BUILD_BUG_ON
 failed: __builtin_memcmp(caten, "YESNOMAYBE",
 __builtin_strlen("YESNOMAYBE"))
Message-ID: <202304240617.8iFXzb2j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   cab31ac00666c326de475b2390a7f92950c0d1a5
commit: 4f85eaecae8f0c517c49bd68f6c7133cd93166a9 [3/5] lib/test_map_h: add new module to test map.h macros
config: mips-bmips_stb_defconfig (https://download.01.org/0day-ci/archive/20230424/202304240617.8iFXzb2j-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/jimc/linux/commit/4f85eaecae8f0c517c49bd68f6c7133cd93166a9
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout 4f85eaecae8f0c517c49bd68f6c7133cd93166a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304240617.8iFXzb2j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_map_h.c:41:2: error: call to '__compiletime_assert_314' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(caten, "YESNOMAYBE", __builtin_strlen("YESNOMAYBE"))
           BUILD_BUG_STREQ(caten, "YESNOMAYBE");
           ^
   lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:92:1: note: expanded from here
   __compiletime_assert_314
   ^
>> lib/test_map_h.c:43:2: error: call to '__compiletime_assert_315' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[0], "DRMx_CORE", __builtin_strlen("DRMx_CORE"))
           BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
           ^
   lib/test_map_h.c:35:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:97:1: note: expanded from here
   __compiletime_assert_315
   ^
>> lib/test_map_h.c:44:2: error: call to '__compiletime_assert_316' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[1], "DRMx_DRIVER", __builtin_strlen("DRMx_DRIVER"))
           BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
           ^
   lib/test_map_h.c:35:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:102:1: note: expanded from here
   __compiletime_assert_316
   ^
>> lib/test_map_h.c:45:2: error: call to '__compiletime_assert_317' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[2], "DRMx_KMS", __builtin_strlen("DRMx_KMS"))
           BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
           ^
   lib/test_map_h.c:35:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:107:1: note: expanded from here
   __compiletime_assert_317
   ^
   4 errors generated.


vim +41 lib/test_map_h.c

    27	
    28	#if !defined(__i386__)
    29	#define BUILD_BUG_STREQ(_var, ref)					\
    30		BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
    31	#else
    32	#define BUILD_BUG_STREQ(_var, ref)	 BUILD_BUG_ON(0)
    33	#endif
    34	#define BUILD_BUG_STREQ_VI(_vec_, idx, ref)		\
    35		BUILD_BUG_STREQ(_vec_##_names[idx], ref)
    36	
    37	/* force compile, even if its not called */
    38	static void __used MAPH_BUILD_BUG(void)
    39	{
    40		BUILD_BUG_ON(sum != 6);
  > 41		BUILD_BUG_STREQ(caten, "YESNOMAYBE");
    42	
  > 43		BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
  > 44		BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
  > 45		BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
