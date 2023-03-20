Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C216FBE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 20:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679344564; x=1710880564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l4wHhnKc2pnm06IKf1te1HmcSe0dYpq8ge5bKAmojoY=;
  b=g8GategtHoErKymiCPNqoZO040lBApxkRbx4wZTFqtzglaPnN5enClgg
   Cll+llQ4cwbmnVdnUYB9+E7YefxCtx6Ea0b3OTZoIdr7tl7socxFPxbZc
   31P9Z+DiOmcdn1AgQbSnFtxW5QuhYgWW3LY9xI3Bx0NttfjJ/Tej/zpOn
   ZC4Q//cyQAx7Lk8U5ExLdd7MlQN5tGBB3AHwGucs1UInr8Lvsow/4u+B+
   1yr25cIdkYIsLrFTcZxpk0Ho3/4neryQCvf7w08mYQ05idYPLgUGPq69x
   NxFiHrd5ahiGBLr02+vYFFJJJPe3NBXoOePPA+s0iZI5keZ8I0BJZSI72
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="338800526"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="338800526"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 13:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="631263094"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="631263094"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Mar 2023 13:36:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peMEW-000BIS-0O;
	Mon, 20 Mar 2023 20:35:56 +0000
Date: Tue, 21 Mar 2023 04:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 1/1] lib/test_map_h.c:28:2: error: call to
 __compiletime_assert_174 declared with 'error' attribute: BUILD_BUG_ON
 failed: __builtin_memcmp(debug_cats_slist[0], "DRMx_CORE",
 sizeof("DRMx_CORE") - 1)
Message-ID: <202303210403.BRMYWSmz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   4ca8648cb8696436472c03ed39c97dee528596fc
commit: 4ca8648cb8696436472c03ed39c97dee528596fc [1/1] include/linux/map.h: add new header, test it with test_map_h.c (RFC)
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230321/202303210403.BRMYWSmz-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/4ca8648cb8696436472c03ed39c97dee528596fc
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout 4ca8648cb8696436472c03ed39c97dee528596fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210403.BRMYWSmz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_map_h.c:28:2: error: call to __compiletime_assert_174 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_slist[0], "DRMx_CORE", sizeof("DRMx_CORE") - 1)
           BUILD_BUG_STREQ(debug_cats, 0, "DRMx_CORE");
           ^
   lib/test_map_h.c:24:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var##_slist[idx], ref, sizeof(ref) - 1))
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
   <scratch space>:15:1: note: expanded from here
   __compiletime_assert_174
   ^
>> lib/test_map_h.c:29:2: error: call to __compiletime_assert_175 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_slist[1], "DRMx_DRIVER", sizeof("DRMx_DRIVER") - 1)
           BUILD_BUG_STREQ(debug_cats, 1, "DRMx_DRIVER");
           ^
   lib/test_map_h.c:24:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var##_slist[idx], ref, sizeof(ref) - 1))
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
   <scratch space>:20:1: note: expanded from here
   __compiletime_assert_175
   ^
>> lib/test_map_h.c:30:2: error: call to __compiletime_assert_176 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_slist[2], "DRMx_KMS", sizeof("DRMx_KMS") - 1)
           BUILD_BUG_STREQ(debug_cats, 2, "DRMx_KMS");
           ^
   lib/test_map_h.c:24:2: note: expanded from macro 'BUILD_BUG_STREQ'
           BUILD_BUG_ON(__builtin_memcmp(_var##_slist[idx], ref, sizeof(ref) - 1))
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
   <scratch space>:25:1: note: expanded from here
   __compiletime_assert_176
   ^
   3 errors generated.


vim +28 lib/test_map_h.c

    22	
    23	#define BUILD_BUG_STREQ(_var, idx, ref) \
    24		BUILD_BUG_ON(__builtin_memcmp(_var##_slist[idx], ref, sizeof(ref) - 1))
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
