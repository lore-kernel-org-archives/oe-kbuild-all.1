Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2F7C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 03:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680491868; x=1712027868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nSgiai6Qj5rGlomnKwlBVsZ21VB5blRI+ZuDQKaZ5S0=;
  b=IJUO6Xp3d7A2+w+FuEiN5YrFXHRo0IgS+AICxQLCpxDUPCu2rc7NYL9h
   DHzaSwGW/FU4zaTR3glzvYEgW0Yn9TT/Or47f+GEEJIrZ5ELDXRq7zdle
   LdU5SoIGKSMHPDGfjZSwkXIkKg8ENimAQvkTliFX7dRPXRCppxvRlepu6
   EKHbIXnOIyKhvkDQKXRdpqcIF6I54y5peTp1tb9K1+0dq9xZjhoA/+wbr
   HXLnBFwGsKp16Lu2vDSU25yabc1tkfCAV+FnR5ekrcNJnT591jLCte4yv
   pe9mPny4Tnokz1L51ay7Xdmo9rdKDIl4enx155+IC5KFkA/bdjtSpANtM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="339294465"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="339294465"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 20:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="635960651"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="635960651"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Apr 2023 20:17:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjAhV-000NxN-0N;
	Mon, 03 Apr 2023 03:17:45 +0000
Date: Mon, 3 Apr 2023 11:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 3/3] lib/test_map_h.c:43:2: error: call to
 '__compiletime_assert_238' declared with 'error' attribute: BUILD_BUG_ON
 failed: __builtin_memcmp(caten, "YESNOMAYBE", sizeof("YESNOMAYBE"))
Message-ID: <202304031132.zJH5oFyE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   4f9ec383e57b05bb17395584cb8dbf658c615070
commit: 4f9ec383e57b05bb17395584cb8dbf658c615070 [3/3] lib/test_map_h: add new module to test map.h macros
config: mips-randconfig-r001-20230402 (https://download.01.org/0day-ci/archive/20230403/202304031132.zJH5oFyE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/jimc/linux/commit/4f9ec383e57b05bb17395584cb8dbf658c615070
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout 4f9ec383e57b05bb17395584cb8dbf658c615070
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304031132.zJH5oFyE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_map_h.c:43:2: error: call to '__compiletime_assert_238' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(caten, "YESNOMAYBE", sizeof("YESNOMAYBE"))
           BUILD_BUG_STREQ(caten, "YESNOMAYBE");
           ^
   lib/test_map_h.c:32:2: note: expanded from macro 'BUILD_BUG_STREQ'
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
   <scratch space>:126:1: note: expanded from here
   __compiletime_assert_238
   ^
>> lib/test_map_h.c:43:2: error: call to '__compiletime_assert_239' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(caten, "YESNOMAYBE", __builtin_strlen("YESNOMAYBE"))
   lib/test_map_h.c:33:2: note: expanded from macro 'BUILD_BUG_STREQ'
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
   <scratch space>:130:1: note: expanded from here
   __compiletime_assert_239
   ^
>> lib/test_map_h.c:45:2: error: call to '__compiletime_assert_240' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[0], "DRMx_CORE", sizeof("DRMx_CORE"))
           BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
           ^
   lib/test_map_h.c:37:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:32:2: note: expanded from macro 'BUILD_BUG_STREQ'
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
   <scratch space>:135:1: note: expanded from here
   __compiletime_assert_240
   ^
>> lib/test_map_h.c:45:2: error: call to '__compiletime_assert_241' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[0], "DRMx_CORE", __builtin_strlen("DRMx_CORE"))
   lib/test_map_h.c:37:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:33:2: note: expanded from macro 'BUILD_BUG_STREQ'
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
   <scratch space>:139:1: note: expanded from here
   __compiletime_assert_241
   ^
>> lib/test_map_h.c:46:2: error: call to '__compiletime_assert_242' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[1], "DRMx_DRIVER", sizeof("DRMx_DRIVER"))
           BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
           ^
   lib/test_map_h.c:37:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:32:2: note: expanded from macro 'BUILD_BUG_STREQ'
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
   <scratch space>:144:1: note: expanded from here
   __compiletime_assert_242
   ^
>> lib/test_map_h.c:46:2: error: call to '__compiletime_assert_243' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[1], "DRMx_DRIVER", __builtin_strlen("DRMx_DRIVER"))
   lib/test_map_h.c:37:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:33:2: note: expanded from macro 'BUILD_BUG_STREQ'
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
   <scratch space>:148:1: note: expanded from here
   __compiletime_assert_243
   ^
>> lib/test_map_h.c:47:2: error: call to '__compiletime_assert_244' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[2], "DRMx_KMS", sizeof("DRMx_KMS"))
           BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
           ^
   lib/test_map_h.c:37:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:32:2: note: expanded from macro 'BUILD_BUG_STREQ'
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
   <scratch space>:153:1: note: expanded from here
   __compiletime_assert_244
   ^
>> lib/test_map_h.c:47:2: error: call to '__compiletime_assert_245' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[2], "DRMx_KMS", __builtin_strlen("DRMx_KMS"))
   lib/test_map_h.c:37:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:33:2: note: expanded from macro 'BUILD_BUG_STREQ'
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
   <scratch space>:157:1: note: expanded from here
   __compiletime_assert_245
   ^
   8 errors generated.


vim +43 lib/test_map_h.c

    25	
    26	#if defined(__i386__)
    27	/* avoid a "__compiletime_assert_" error */
    28	#define BUILD_BUG_STREQ(_var, ref)	 BUILD_BUG_ON(0)
    29	#else
    30	/* test w 2 exprs, for now */
    31	#define BUILD_BUG_STREQ(_var, ref) do {					\
    32		BUILD_BUG_ON(__builtin_memcmp(_var, ref, sizeof(ref)));		\
    33		BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref))); \
    34	} while (0)
    35	#endif
    36	#define BUILD_BUG_STREQ_VI(_vec_, idx, ref) \
    37		BUILD_BUG_STREQ(_vec_##_names[idx], ref)
    38	
    39	/* force compile, even if its not called */
    40	static void __used MAPH_BUILD_BUG(void)
    41	{
    42		BUILD_BUG_ON(sum != 6);
  > 43		BUILD_BUG_STREQ(caten, "YESNOMAYBE");
    44	
  > 45		BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
  > 46		BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
  > 47		BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
