Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287AED271
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 05:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2FbxSJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699508478; x=1731044478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D/ACTnuAXfBY38hz/b1WCXbqFvkuaSQo50SJHfkUCNo=;
  b=i2FbxSJ5pV2wZf7yWZVCZy1VvdHrbmcPlH0amKD+xBRusyztOerqVDnp
   sqTvyyh3IqQNoWuXo+AbOv29BFtjo+yLRuWZ9JmlJ/tDgSXeQlvp2kb/3
   d2tgkWqalyX4+G7vhEaQYo4MlWpORYU6abVfpctkf8IYTuK3J2b5/5iHV
   kA04gX9/n3G9j2NDPTCIdgKtpJZDxX7qPN7B74g0Pma6jgZ+Kvx+uiWnF
   RIV1HaYcHNcanmeRkGnKIvvNS0A+BbSXTv8k1hYJg0dga43BKci7DsI9K
   e9cwTfoiqsUvZVn5+Nb/FcWnoc9zdvmsVO4zrepHA2VcYk8MDgGK6EiFK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="421021098"
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="scan'208";a="421021098"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 21:41:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="829204313"
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="scan'208";a="829204313"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Nov 2023 21:41:16 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0xmz-0008Vw-35;
	Thu, 09 Nov 2023 05:41:13 +0000
Date: Thu, 9 Nov 2023 13:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 8/8] lib/test_map_h.c:37:2: error: call to
 '__compiletime_assert_172' declared with 'error' attribute: BUILD_BUG_ON
 failed: __builtin_memcmp(cat3strings, "YESNOMAYBE",
 __builtin_strlen("YESNOMAYBE"))
Message-ID: <202311091317.JeXyxBZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   067d1f1d8675b483faa53a6d2ecf1ec1506be009
commit: 067d1f1d8675b483faa53a6d2ecf1ec1506be009 [8/8] test-map: various mental cleanups
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231109/202311091317.JeXyxBZF-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091317.JeXyxBZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091317.JeXyxBZF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_map_h.c:37:2: error: call to '__compiletime_assert_172' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(cat3strings, "YESNOMAYBE", __builtin_strlen("YESNOMAYBE"))
      37 |         BUILD_BUG_STREQ(cat3strings, "YESNOMAYBE");
         |         ^
   lib/test_map_h.c:29:2: note: expanded from macro 'BUILD_BUG_STREQ'
      29 |         BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:413:2: note: expanded from macro '_compiletime_assert'
     413 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:406:4: note: expanded from macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:145:1: note: expanded from here
     145 | __compiletime_assert_172
         | ^
>> lib/test_map_h.c:38:2: error: call to '__compiletime_assert_173' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(str_list, "YES, NO, MAYBE", __builtin_strlen("YES, NO, MAYBE"))
      38 |         BUILD_BUG_STREQ(str_list, "YES, NO, MAYBE");
         |         ^
   lib/test_map_h.c:29:2: note: expanded from macro 'BUILD_BUG_STREQ'
      29 |         BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:413:2: note: expanded from macro '_compiletime_assert'
     413 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:406:4: note: expanded from macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:149:1: note: expanded from here
     149 | __compiletime_assert_173
         | ^
>> lib/test_map_h.c:40:2: error: call to '__compiletime_assert_174' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[0], "DRMx_CORE", __builtin_strlen("DRMx_CORE"))
      40 |         BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
         |         ^
   lib/test_map_h.c:31:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
      31 |         BUILD_BUG_STREQ(_vec_##_names[idx], ref)
         |         ^
   lib/test_map_h.c:29:2: note: expanded from macro 'BUILD_BUG_STREQ'
      29 |         BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:413:2: note: expanded from macro '_compiletime_assert'
     413 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:406:4: note: expanded from macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:154:1: note: expanded from here
     154 | __compiletime_assert_174
         | ^
>> lib/test_map_h.c:41:2: error: call to '__compiletime_assert_175' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[1], "DRMx_DRIVER", __builtin_strlen("DRMx_DRIVER"))
      41 |         BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
         |         ^
   lib/test_map_h.c:31:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
      31 |         BUILD_BUG_STREQ(_vec_##_names[idx], ref)
         |         ^
   lib/test_map_h.c:29:2: note: expanded from macro 'BUILD_BUG_STREQ'
      29 |         BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:413:2: note: expanded from macro '_compiletime_assert'
     413 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:406:4: note: expanded from macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:159:1: note: expanded from here
     159 | __compiletime_assert_175
         | ^
>> lib/test_map_h.c:42:2: error: call to '__compiletime_assert_176' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[2], "DRMx_KMS", __builtin_strlen("DRMx_KMS"))
      42 |         BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
         |         ^
   lib/test_map_h.c:31:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
      31 |         BUILD_BUG_STREQ(_vec_##_names[idx], ref)
         |         ^
   lib/test_map_h.c:29:2: note: expanded from macro 'BUILD_BUG_STREQ'
      29 |         BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:413:2: note: expanded from macro '_compiletime_assert'
     413 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:406:4: note: expanded from macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:164:1: note: expanded from here
     164 | __compiletime_assert_176
         | ^
   5 errors generated.


vim +37 lib/test_map_h.c

    27	
    28	#define BUILD_BUG_STREQ(_var, ref)					\
    29		BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
    30	#define BUILD_BUG_STREQ_VI(_vec_, idx, ref)		\
    31		BUILD_BUG_STREQ(_vec_##_names[idx], ref)
    32	
    33	/* force compile, even if its not called */
    34	static void __used MAPH_BUILD_BUG(void)
    35	{
    36		BUILD_BUG_ON(sum_weird != 10);
  > 37		BUILD_BUG_STREQ(cat3strings, "YESNOMAYBE");
  > 38		BUILD_BUG_STREQ(str_list, "YES, NO, MAYBE");
    39	
  > 40		BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
  > 41		BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
  > 42		BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
