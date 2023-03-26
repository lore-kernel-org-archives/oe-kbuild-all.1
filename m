Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEF71377
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679824958; x=1711360958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MVDGDgcNIwdm280i4bfa63CkTRdbp0666TtRT+Ld2uQ=;
  b=UP7ke4eesHNuraXFWeAe0JsTfe/ahgiNtd7WElC+ZXYEYka6GBP3Tuhw
   /CtH8OWeTyFlPv5v1HXsur88wtwaTbjcshQxPSGbRs+S65O9Nb12Ic0Yn
   pN1JHIMWCcMAuxJUX0y4fov6+myCDXVtT4j/TVc0WZidvhattJ77GEmmf
   rgMDLyNluAZbll+88KfcC0x9F2FTiguN+yZbLWTbxRZGMMlsIqxW858rq
   wj8zKXTuvjVGGrFiMHyaI7zjX6O1xLUWG6gJecy+PDaGIQQhOCjsNYca0
   T3k95dmFGmtN/g7oIuVvt6w3eeQccNMDLc+5r3pHdZM3DrPOt1IUQMzs7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="328502520"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="328502520"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 03:02:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="1012752666"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="1012752666"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Mar 2023 03:02:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgNCt-000H2M-2I;
	Sun, 26 Mar 2023 10:02:35 +0000
Date: Sun, 26 Mar 2023 18:01:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 3/3] lib/test_map_h.c:45:2: error: call to
 '__compiletime_assert_225' declared with 'error' attribute: BUILD_BUG_ON
 failed: __builtin_memcmp(debug_cats_names[0], "DRMx_CORE",
 sizeof("DRMx_CORE"))
Message-ID: <202303261729.3Cv1u5Zn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   eb0de9bee0c5c28bb9825258364ab2154d23f20a
commit: eb0de9bee0c5c28bb9825258364ab2154d23f20a [3/3] lib/test_map_h: add new module to test map.h macros
config: mips-loongson1c_defconfig (https://download.01.org/0day-ci/archive/20230326/202303261729.3Cv1u5Zn-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/jimc/linux/commit/eb0de9bee0c5c28bb9825258364ab2154d23f20a
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout eb0de9bee0c5c28bb9825258364ab2154d23f20a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303261729.3Cv1u5Zn-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/test_map_h.c:43:2: error: call to '__compiletime_assert_223' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(caten, "YESNOMAYBE", sizeof("YESNOMAYBE"))
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
   <scratch space>:91:1: note: expanded from here
   __compiletime_assert_223
   ^
   lib/test_map_h.c:43:2: error: call to '__compiletime_assert_224' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(caten, "YESNOMAYBE", __builtin_strlen("YESNOMAYBE"))
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
   <scratch space>:95:1: note: expanded from here
   __compiletime_assert_224
   ^
>> lib/test_map_h.c:45:2: error: call to '__compiletime_assert_225' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[0], "DRMx_CORE", sizeof("DRMx_CORE"))
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
   <scratch space>:100:1: note: expanded from here
   __compiletime_assert_225
   ^
>> lib/test_map_h.c:45:2: error: call to '__compiletime_assert_226' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[0], "DRMx_CORE", __builtin_strlen("DRMx_CORE"))
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
   <scratch space>:104:1: note: expanded from here
   __compiletime_assert_226
   ^
>> lib/test_map_h.c:46:2: error: call to '__compiletime_assert_227' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[1], "DRMx_DRIVER", sizeof("DRMx_DRIVER"))
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
   <scratch space>:109:1: note: expanded from here
   __compiletime_assert_227
   ^
>> lib/test_map_h.c:46:2: error: call to '__compiletime_assert_228' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[1], "DRMx_DRIVER", __builtin_strlen("DRMx_DRIVER"))
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
   <scratch space>:113:1: note: expanded from here
   __compiletime_assert_228
   ^
>> lib/test_map_h.c:47:2: error: call to '__compiletime_assert_229' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[2], "DRMx_KMS", sizeof("DRMx_KMS"))
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
   <scratch space>:118:1: note: expanded from here
   __compiletime_assert_229
   ^
>> lib/test_map_h.c:47:2: error: call to '__compiletime_assert_230' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[2], "DRMx_KMS", __builtin_strlen("DRMx_KMS"))
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
   <scratch space>:122:1: note: expanded from here
   __compiletime_assert_230
   ^
   8 errors generated.


vim +45 lib/test_map_h.c

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
    43		BUILD_BUG_STREQ(caten, "YESNOMAYBE");
    44	
  > 45		BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
  > 46		BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
  > 47		BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
