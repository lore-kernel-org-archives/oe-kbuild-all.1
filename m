Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC5AD533
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 21:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680817036; x=1712353036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZZBnSXCoI7dQg5FHS1V+evktOS/JDUrJH2PV3ZAGVw=;
  b=IHV5i1sy47Tfykq57JQby7/eNCBYnfLU5sa1xAe3zDKY3l+7vvi2tNlW
   otzh/FNoPjK9s6QDgpqa+xvYSB+ofaMw1zuzVY9PeSfmbUwrGlDuYGg4S
   +nHdLTVRNS3xCWiSA6XcLywMjOYYvsBG6tzWjBxFbL8svf4fFiZgxRjd2
   gi/3mf4+7JSA8v+8PAYOTyZy3+mkwMQlJbsFrodVINXgLkY72o9tB7COP
   SfsR3swTRblBul7Qo09Q4A6MPPrlaFB94ymzq3UU7RA0fQLaYzPtc18vC
   WX9GTzY1K3UUuEs/nuE+y8lQkSL5lZurqNjdMMf4P8dbGJfBxmTpOVADN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="331487511"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="331487511"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 14:37:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="719844402"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="719844402"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Apr 2023 14:37:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkXI9-000Roc-1O;
	Thu, 06 Apr 2023 21:37:13 +0000
Date: Fri, 7 Apr 2023 05:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 6/7] lib/test_map_h.c:36:2: error: call to
 __compiletime_assert_175 declared with 'error' attribute: BUILD_BUG_ON
 failed: __builtin_memcmp(caten, "YESNOMAYBE",
 __builtin_strlen("YESNOMAYBE"))
Message-ID: <202304070504.hKOR4TQf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   9c0824a037ac394909bf05dddcace5fd127384bc
commit: b04365691f83c87aa73ad9f5bef932b758fa90d2 [6/7] tweak-3
config: i386-randconfig-a003-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070504.hKOR4TQf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/b04365691f83c87aa73ad9f5bef932b758fa90d2
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout b04365691f83c87aa73ad9f5bef932b758fa90d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/reiserfs/ lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070504.hKOR4TQf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_map_h.c:36:2: error: call to __compiletime_assert_175 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(caten, "YESNOMAYBE", __builtin_strlen("YESNOMAYBE"))
           BUILD_BUG_STREQ(caten, "YESNOMAYBE");
           ^
   lib/test_map_h.c:27:2: note: expanded from macro 'BUILD_BUG_STREQ'
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
   <scratch space>:156:1: note: expanded from here
   __compiletime_assert_175
   ^
>> lib/test_map_h.c:38:2: error: call to __compiletime_assert_176 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[0], "DRMx_CORE", __builtin_strlen("DRMx_CORE"))
           BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
           ^
   lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:27:2: note: expanded from macro 'BUILD_BUG_STREQ'
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
   <scratch space>:161:1: note: expanded from here
   __compiletime_assert_176
   ^
>> lib/test_map_h.c:39:2: error: call to __compiletime_assert_177 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[1], "DRMx_DRIVER", __builtin_strlen("DRMx_DRIVER"))
           BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
           ^
   lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:27:2: note: expanded from macro 'BUILD_BUG_STREQ'
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
   <scratch space>:166:1: note: expanded from here
   __compiletime_assert_177
   ^
>> lib/test_map_h.c:40:2: error: call to __compiletime_assert_178 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[2], "DRMx_KMS", __builtin_strlen("DRMx_KMS"))
           BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
           ^
   lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
           BUILD_BUG_STREQ(_vec_##_names[idx], ref)
           ^
   lib/test_map_h.c:27:2: note: expanded from macro 'BUILD_BUG_STREQ'
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
   <scratch space>:171:1: note: expanded from here
   __compiletime_assert_178
   ^
   4 errors generated.


vim +36 lib/test_map_h.c

214b84720f0dda Jim Cromie 2023-03-25  25  
b04365691f83c8 Jim Cromie 2023-04-04  26  #define BUILD_BUG_STREQ(_var, ref)					\
b04365691f83c8 Jim Cromie 2023-04-04  27  	BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
b04365691f83c8 Jim Cromie 2023-04-04  28  
214b84720f0dda Jim Cromie 2023-03-25  29  #define BUILD_BUG_STREQ_VI(_vec_, idx, ref) \
214b84720f0dda Jim Cromie 2023-03-25  30  	BUILD_BUG_STREQ(_vec_##_names[idx], ref)
214b84720f0dda Jim Cromie 2023-03-25  31  
214b84720f0dda Jim Cromie 2023-03-25  32  /* force compile, even if its not called */
214b84720f0dda Jim Cromie 2023-03-25  33  static void __used MAPH_BUILD_BUG(void)
214b84720f0dda Jim Cromie 2023-03-25  34  {
214b84720f0dda Jim Cromie 2023-03-25  35  	BUILD_BUG_ON(sum != 6);
214b84720f0dda Jim Cromie 2023-03-25 @36  	BUILD_BUG_STREQ(caten, "YESNOMAYBE");
214b84720f0dda Jim Cromie 2023-03-25  37  
214b84720f0dda Jim Cromie 2023-03-25 @38  	BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
214b84720f0dda Jim Cromie 2023-03-25 @39  	BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
214b84720f0dda Jim Cromie 2023-03-25 @40  	BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
214b84720f0dda Jim Cromie 2023-03-25  41  

:::::: The code at line 36 was first introduced by commit
:::::: 214b84720f0ddac6fe0ce0c75b5514521c4b42b8 lib/test_map_h: add new module to test map.h macros

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
