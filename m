Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E0E10FA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 05:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679291674; x=1710827674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vIDooDG0jlxp4T44aB3CM99aUDgvn9WjZesgHArfacs=;
  b=XdytvWgBcT+vwNJWJWiV9qVrJksIXoj+LxYKRvkxwCSnSdH7CDEG9mQn
   WFR8tlEoBsK8lXgvcCWamgFLh2I6Kk5tRbp1XDmZ2rQ4rNXKBuC/cu9Sm
   utJ4OyKIKlhahhDTgKlmWN1W8jqVQRKiiiiOC9y6M7VyB98m9Kgv40/Vd
   fn5D1HJspkcHFGJUCZL/AOWtZ/YDrO80dZ/qAtV2BJRHjbjL9eVOf65NX
   VaEA+DZEY96Jh2HaiADjg0C8VWqGVTWaHMotCuSKFBgjOko1kz2pOKP1J
   ICSVySfjE9gezoJMinp4BksVM+7GvJ7ThXcsHcV3StrcZY2NwORxP/trR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="336078824"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="336078824"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 22:54:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="713432719"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="713432719"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Mar 2023 22:54:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pe8TX-000Aqv-0z;
	Mon, 20 Mar 2023 05:54:31 +0000
Date: Mon, 20 Mar 2023 13:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix-next 15/19] lib/test_map_h.c:28:2: error: call to
 __compiletime_assert_173 declared with 'error' attribute: BUILD_BUG_ON
 failed: __builtin_memcmp(debug_cats_slist[0], "DRMx_CORE",
 sizeof("DRMx_CORE"))
Message-ID: <202303201304.8rGCOZHL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix-next
head:   4d2f9ddebc723de3007edf449ba96bdfa5336145
commit: a52557c30cdf6d51a4aabfc1067aec115a48aff6 [15/19] include/linux/map.h: add new header, test it with test_map_h.c (RFC)
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20230320/202303201304.8rGCOZHL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/a52557c30cdf6d51a4aabfc1067aec115a48aff6
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-drm-fix-next
        git checkout a52557c30cdf6d51a4aabfc1067aec115a48aff6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303201304.8rGCOZHL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_map_h.c:28:2: error: call to __compiletime_assert_173 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_slist[0], "DRMx_CORE", sizeof("DRMx_CORE"))
           BUILD_BUG_STREQ(debug_cats, 0, "DRMx_CORE");
           ^
   lib/test_map_h.c:24:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var##_slist[idx], ref, sizeof(ref)))
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
   <scratch space>:24:1: note: expanded from here
   __compiletime_assert_173
   ^
>> lib/test_map_h.c:29:2: error: call to __compiletime_assert_174 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_slist[1], "DRMx_DRIVER", sizeof("DRMx_DRIVER"))
           BUILD_BUG_STREQ(debug_cats, 1, "DRMx_DRIVER");
           ^
   lib/test_map_h.c:24:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var##_slist[idx], ref, sizeof(ref)))
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
   <scratch space>:31:1: note: expanded from here
   __compiletime_assert_174
   ^
>> lib/test_map_h.c:30:2: error: call to __compiletime_assert_175 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_slist[2], "DRMx_KMS", sizeof("DRMx_KMS"))
           BUILD_BUG_STREQ(debug_cats, 2, "DRMx_KMS");
           ^
   lib/test_map_h.c:24:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var##_slist[idx], ref, sizeof(ref)))
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
   <scratch space>:38:1: note: expanded from here
   __compiletime_assert_175
   ^
   3 errors generated.


vim +28 lib/test_map_h.c

    22	
    23	#define BUILD_BUG_STREQ(_var, idx, ref) \
    24		BUILD_BUG_ON(__builtin_memcmp(_var##_slist[idx], ref, sizeof(ref)))
    25	
    26	static void __used MAPH_BUILD_BUG(void)
    27	{
  > 28		BUILD_BUG_STREQ(debug_cats, 0, "DRMx_CORE");
  > 29		BUILD_BUG_STREQ(debug_cats, 1, "DRMx_DRIVER");
  > 30		BUILD_BUG_STREQ(debug_cats, 2, "DRMx_KMS");
    31	#if 0
    32		/* properly breaks compile */
    33		BUILD_BUG_STREQ(debug_cats, 1, "'not-in-map'");
    34	#endif
    35	}
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
