Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE9A24209
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 23:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYLXwdfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698103946; x=1729639946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zDgAWSgwKgXHJ2QPX3yFFebl91F7f4y+Q9jJu5QObGU=;
  b=CYLXwdfFJoHtDAO2hHeg/aRtIx9TAu8MXzFp36hZ2E5K8w2Lq/qjHpd6
   eOJp1RFJqZgkygdIO1nTdxk5NW0XqXnfTnCLUuInk+zFeNv0Yb01slsbj
   ayEsbNK3Y+6ZLqBVAqX5G+FAvB2FFa0F7CUS60eKJL2pQR8IOz8LGgDEU
   n72d9twmhgebgeFi5F3Fjt1q1qghYb4aVsZ92Ao+ErG663OZpdycK5P9P
   PpGVaeGIVB3C2DMdTOoDLrXR3b118A4Vfg1RV77sQqhFYIrU+9KrL6kkn
   NJBa4vjQ3tqSF5eouG664T8GTwY9uAQQiE6o3uTLEVCzSi3luEh/ff5WX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="377325337"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="377325337"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 16:32:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1005479571"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="1005479571"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Oct 2023 16:32:24 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv4PF-0007N3-2b;
	Mon, 23 Oct 2023 23:32:21 +0000
Date: Tue, 24 Oct 2023 07:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext 3/20] include/linux/compiler_types.h:397:45: error: call
 to '__compiletime_assert_421' declared with attribute error: BUILD_BUG_ON
 failed: VMALLOC_START != MODULES_END
Message-ID: <202310240700.rRoT2Bm9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Russell,

FYI, the error/warning still remains.

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
head:   a0e73f24a420d793732e6adcddca0ca1337d1ea6
commit: e4881183f9059ed8aaa3f16857fd9e0c1db5c168 [3/20] arm64: place kernel in its own L0 page table entry
config: arm64-randconfig-002-20231022 (https://download.01.org/0day-ci/archive/20231024/202310240700.rRoT2Bm9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310240700.rRoT2Bm9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240700.rRoT2Bm9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/arm64/mm/kasan_init.c: In function 'kasan_init_shadow':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_421' declared with attribute error: BUILD_BUG_ON failed: VMALLOC_START != MODULES_END
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/arm64/mm/kasan_init.c:248:9: note: in expansion of macro 'BUILD_BUG_ON'
     248 |         BUILD_BUG_ON(VMALLOC_START != MODULES_END);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_421 +397 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  383  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  384  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  386  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  388   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  389   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  396  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @397  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  398  

:::::: The code at line 397 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
