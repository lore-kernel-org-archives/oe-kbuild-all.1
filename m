Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EB2EDE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 00:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680913998; x=1712449998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iyp0JwkFp92l+zkcGuSWIMrzdiErap7Rt4KrKvRqo4w=;
  b=UGapIoCwTZa2G60ETwNzRybG1TyCpNW05MyHzEWOIsw1OMr6ATm8BVQ1
   qlKgdI3uFU5EOXcyxiLALIFifG8DgkGkJHyNyILT3Pi7oY2mqvbXsp4lO
   7K7lw7zPoduG3y6PWHkMJ3R+yoFslYXkMIgCvi5/LxSbMScE4ZaVEztrp
   m2wH0IkzpDwvyikoh6aiffhj32VdIMTB0LvoLhvfMjcgbKEfK9dN3QvtS
   d4XiARGyGcko94XqukLCVHc45GjmHlpU3sf8AnkoxNODMX5XS+1fcKfGS
   0IAPqD0cxvtVhexLzlTKeU/NoEILOLlkUXFsnC4JFph/OyUqDBnKkHXLK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="343099541"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="343099541"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 17:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="811556913"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="811556913"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Apr 2023 17:33:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkwW3-000T4V-02;
	Sat, 08 Apr 2023 00:33:15 +0000
Date: Sat, 8 Apr 2023 08:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 6/6] lib/test_map_h.c:36:2: error: call to
 '__compiletime_assert_234' declared with 'error' attribute: BUILD_BUG_ON
 failed: __builtin_memcmp(caten, "YESNOMAYBE", sizeof("YESNOMAYBE"))
Message-ID: <202304080811.n4mMgTeU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   5c311844cfe6a3e81b52123b60fe8b1b2ca6218d
commit: 5c311844cfe6a3e81b52123b60fe8b1b2ca6218d [6/6] drop -i386 avoid, test w sizeof - strlen didnt work?
config: mips-randconfig-r031-20230404 (https://download.01.org/0day-ci/archive/20230408/202304080811.n4mMgTeU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/jimc/linux/commit/5c311844cfe6a3e81b52123b60fe8b1b2ca6218d
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout 5c311844cfe6a3e81b52123b60fe8b1b2ca6218d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080811.n4mMgTeU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_map_h.c:36:2: error: call to '__compiletime_assert_234' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(caten, "YESNOMAYBE", sizeof("YESNOMAYBE"))
           BUILD_BUG_STREQ(caten, "YESNOMAYBE");
           ^
   lib/test_map_h.c:27:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, sizeof(ref)))
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
   <scratch space>:159:1: note: expanded from here
   __compiletime_assert_234
   ^
>> lib/test_map_h.c:38:2: error: call to '__compiletime_assert_235' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[0], "DRMx_CORE", sizeof("DRMx_CORE"))
           BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
           ^
   lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:27:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, sizeof(ref)))
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
   <scratch space>:164:1: note: expanded from here
   __compiletime_assert_235
   ^
>> lib/test_map_h.c:39:2: error: call to '__compiletime_assert_236' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[1], "DRMx_DRIVER", sizeof("DRMx_DRIVER"))
           BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
           ^
   lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:27:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, sizeof(ref)))
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
   <scratch space>:169:1: note: expanded from here
   __compiletime_assert_236
   ^
>> lib/test_map_h.c:40:2: error: call to '__compiletime_assert_237' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[2], "DRMx_KMS", sizeof("DRMx_KMS"))
           BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
           ^
   lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:27:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, sizeof(ref)))
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
   <scratch space>:174:1: note: expanded from here
   __compiletime_assert_237
   ^
   4 errors generated.


vim +36 lib/test_map_h.c

3bac16c296ba61 Jim Cromie 2023-03-25  25  
5c311844cfe6a3 Jim Cromie 2023-04-04  26  #define BUILD_BUG_STREQ(_var, ref)					\
5c311844cfe6a3 Jim Cromie 2023-04-04  27  	BUILD_BUG_ON(__builtin_memcmp(_var, ref, sizeof(ref)))
5c311844cfe6a3 Jim Cromie 2023-04-04  28  
3bac16c296ba61 Jim Cromie 2023-03-25  29  #define BUILD_BUG_STREQ_VI(_vec_, idx, ref) \
3bac16c296ba61 Jim Cromie 2023-03-25  30  	BUILD_BUG_STREQ(_vec_##_names[idx], ref)
3bac16c296ba61 Jim Cromie 2023-03-25  31  
3bac16c296ba61 Jim Cromie 2023-03-25  32  /* force compile, even if its not called */
3bac16c296ba61 Jim Cromie 2023-03-25  33  static void __used MAPH_BUILD_BUG(void)
3bac16c296ba61 Jim Cromie 2023-03-25  34  {
3bac16c296ba61 Jim Cromie 2023-03-25  35  	BUILD_BUG_ON(sum != 6);
3bac16c296ba61 Jim Cromie 2023-03-25 @36  	BUILD_BUG_STREQ(caten, "YESNOMAYBE");
3bac16c296ba61 Jim Cromie 2023-03-25  37  
3bac16c296ba61 Jim Cromie 2023-03-25 @38  	BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
3bac16c296ba61 Jim Cromie 2023-03-25 @39  	BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
3bac16c296ba61 Jim Cromie 2023-03-25 @40  	BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
3bac16c296ba61 Jim Cromie 2023-03-25  41  

:::::: The code at line 36 was first introduced by commit
:::::: 3bac16c296ba613271c37d0e5cc106aa66b405b4 lib/test_map_h: add new module to test map.h macros

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
