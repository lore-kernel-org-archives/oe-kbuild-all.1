Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86507C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 04:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681447517; x=1712983517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uAPKEVDKOOFpo6LMHjLIuYkPwHXkef4nNFo/EULRfss=;
  b=ns2Yx/Nz4/RAsd2+Yq7oabFupHLxXe3qRZZ+Zu8f4JUrxrIXIXEv2F8Q
   Rg85tzY8sRfZz11xl39RCeVequ3+2WCOBN66OVBmSwNNtDrfb+nIEAs5g
   JwqgpVPFox51W/EUWCvMUNtDfrT9py2ezdUCa7OUG97m445Sj+d/uq/IH
   AL+EEf3pm7+bgJ1q011mIJKZtN1oSef89szHY8NGYGsEURqZlenMi7662
   XCO8pLVjokXPoLUn3pl8l5OGMFj7lAhhzmLkZ8+gWml/S/TfajJO4Fgnh
   fomAQRcGPINGPZiJow+NDAI4Hc9rTb9ub4V4RP4DUTmCz3yDmX6puz4Z7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="343142235"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="343142235"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 21:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="683200357"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="683200357"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Apr 2023 21:45:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnBJC-000ZEb-2P;
	Fri, 14 Apr 2023 04:45:14 +0000
Date: Fri, 14 Apr 2023 12:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 6/6] lib/test_map_h.c:36:2: error: call to
 __compiletime_assert_174 declared with 'error' attribute: BUILD_BUG_ON
 failed: __builtin_memcmp(caten, "YESNOMAYBE",
 __builtin_strlen("YESNOMAYBE"))
Message-ID: <202304141247.TPqJqRTU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   bbf76be7815884343f4c6eac593e54d315558c92
commit: bbf76be7815884343f4c6eac593e54d315558c92 [6/6] drop -i386 avoid,
config: i386-randconfig-a002-20230410 (https://download.01.org/0day-ci/archive/20230414/202304141247.TPqJqRTU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/bbf76be7815884343f4c6eac593e54d315558c92
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout bbf76be7815884343f4c6eac593e54d315558c92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141247.TPqJqRTU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_map_h.c:36:2: error: call to __compiletime_assert_174 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(caten, "YESNOMAYBE", __builtin_strlen("YESNOMAYBE"))
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
   <scratch space>:178:1: note: expanded from here
   __compiletime_assert_174
   ^
>> lib/test_map_h.c:38:2: error: call to __compiletime_assert_175 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[0], "DRMx_CORE", __builtin_strlen("DRMx_CORE"))
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
   <scratch space>:183:1: note: expanded from here
   __compiletime_assert_175
   ^
>> lib/test_map_h.c:39:2: error: call to __compiletime_assert_176 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[1], "DRMx_DRIVER", __builtin_strlen("DRMx_DRIVER"))
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
   <scratch space>:188:1: note: expanded from here
   __compiletime_assert_176
   ^
>> lib/test_map_h.c:40:2: error: call to __compiletime_assert_177 declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[2], "DRMx_KMS", __builtin_strlen("DRMx_KMS"))
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
   <scratch space>:193:1: note: expanded from here
   __compiletime_assert_177
   ^
   4 errors generated.


vim +36 lib/test_map_h.c

3bac16c296ba61 Jim Cromie 2023-03-25  25  
bbf76be7815884 Jim Cromie 2023-04-04  26  #define BUILD_BUG_STREQ(_var, ref)					\
bbf76be7815884 Jim Cromie 2023-04-04  27  	BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
bbf76be7815884 Jim Cromie 2023-04-04  28  
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
