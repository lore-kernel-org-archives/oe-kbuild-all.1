Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4D8568A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Mar 2023 22:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679782402; x=1711318402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mlnzicckp9D5+H5KgsjTd06UXSxQd4kE7GAEP2IQjHc=;
  b=H9t7fwqvdqrthsyFqy7opEBNZiqrV/FHckqYYF6YwSfw+SSRpoQbH+pM
   TWLNIwl/0tAcBi97T8l+F9OsPfNik9d/tYvQGLtPPGx28aQINrKE/oKW+
   cF1vSC8uirpR/J1c9zUbWTny4eKuOXmv+Q4clFlrYs4HcJIqq7jtsLd+f
   TPy186tYoLkr9s7/AXoApgUDW6W/MzatvVBZEZl99gb/Wsj377RgSYe7e
   aGYHKRQiVukv6po1jQkLn2RTxUEJEId736GKPeJxHO94h7x4A6kE0ZpVJ
   1mSJWckOabcSjpLigZS1I43r99IWZRwIOnluEJiGCLippDnFrhLOjoYc6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="323902477"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="323902477"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 15:13:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="633209833"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="633209833"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Mar 2023 15:13:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgC8W-000Ggp-0D;
	Sat, 25 Mar 2023 22:13:20 +0000
Date: Sun, 26 Mar 2023 06:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 1/1] lib/test_map_h.c:43:2: error: call to
 '__compiletime_assert_318' declared with 'error' attribute: BUILD_BUG_ON
 failed: __builtin_memcmp(caten, "YESNOMAYBE", sizeof("YESNOMAYBE"))
Message-ID: <202303260659.ObaIESij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   a43c9ca75a0027cb9ece5c55b2287bb682e55416
commit: a43c9ca75a0027cb9ece5c55b2287bb682e55416 [1/1] include/linux/map.h: add new header, test it with test_map_h.c (RFC)
config: mips-randconfig-c004-20230322 (https://download.01.org/0day-ci/archive/20230326/202303260659.ObaIESij-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/jimc/linux/commit/a43c9ca75a0027cb9ece5c55b2287bb682e55416
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout a43c9ca75a0027cb9ece5c55b2287bb682e55416
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303260659.ObaIESij-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_map_h.c:43:2: error: call to '__compiletime_assert_318' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(caten, "YESNOMAYBE", sizeof("YESNOMAYBE"))
           BUILD_BUG_STREQ(caten, "YESNOMAYBE");
           ^
   lib/test_map_h.c:28:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, sizeof(ref)));         \
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
   <scratch space>:102:1: note: expanded from here
   __compiletime_assert_318
   ^
>> lib/test_map_h.c:43:2: error: call to '__compiletime_assert_319' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(caten, "YESNOMAYBE", __builtin_strlen("YESNOMAYBE"))
   lib/test_map_h.c:29:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref))); \
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
   <scratch space>:106:1: note: expanded from here
   __compiletime_assert_319
   ^
   lib/test_map_h.c:45:2: error: call to '__compiletime_assert_320' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_slist[0], "DRMx_CORE", sizeof("DRMx_CORE"))
           BUILD_BUG_STREQ_I(debug_cats, 0, "DRMx_CORE");
           ^
   lib/test_map_h.c:33:2: note: expanded from macro 'BUILD_BUG_STREQ_I'
           BUILD_BUG_STREQ(_var##_slist[idx], ref)
           ^
   lib/test_map_h.c:28:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, sizeof(ref)));         \
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
   <scratch space>:111:1: note: expanded from here
   __compiletime_assert_320
   ^
   lib/test_map_h.c:45:2: error: call to '__compiletime_assert_321' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_slist[0], "DRMx_CORE", __builtin_strlen("DRMx_CORE"))
   lib/test_map_h.c:33:2: note: expanded from macro 'BUILD_BUG_STREQ_I'
           BUILD_BUG_STREQ(_var##_slist[idx], ref)
           ^
   lib/test_map_h.c:29:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref))); \
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
   <scratch space>:115:1: note: expanded from here
   __compiletime_assert_321
   ^
   lib/test_map_h.c:46:2: error: call to '__compiletime_assert_322' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_slist[1], "DRMx_DRIVER", sizeof("DRMx_DRIVER"))
           BUILD_BUG_STREQ_I(debug_cats, 1, "DRMx_DRIVER");
           ^
   lib/test_map_h.c:33:2: note: expanded from macro 'BUILD_BUG_STREQ_I'
           BUILD_BUG_STREQ(_var##_slist[idx], ref)
           ^
   lib/test_map_h.c:28:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, sizeof(ref)));         \
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
   <scratch space>:120:1: note: expanded from here
   __compiletime_assert_322
   ^
   lib/test_map_h.c:46:2: error: call to '__compiletime_assert_323' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_slist[1], "DRMx_DRIVER", __builtin_strlen("DRMx_DRIVER"))
   lib/test_map_h.c:33:2: note: expanded from macro 'BUILD_BUG_STREQ_I'
           BUILD_BUG_STREQ(_var##_slist[idx], ref)
           ^
   lib/test_map_h.c:29:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref))); \
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


vim +43 lib/test_map_h.c

    38	
    39	/* force compile, though its not called */
    40	static void __used MAPH_BUILD_BUG(void)
    41	{
    42		BUILD_BUG_ON(sum != 6);
  > 43		BUILD_BUG_STREQ(caten, "YESNOMAYBE");
    44	
    45		BUILD_BUG_STREQ_I(debug_cats, 0, "DRMx_CORE");
    46		BUILD_BUG_STREQ_I(debug_cats, 1, "DRMx_DRIVER");
    47		BUILD_BUG_STREQ_I(debug_cats, 2, "DRMx_KMS");
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
