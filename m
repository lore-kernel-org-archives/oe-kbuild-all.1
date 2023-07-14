Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859E2EEA8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 15:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689347322; x=1720883322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BNud0kVgoCkd03YELUg2ykxMR1H/sE03wb8O5b8rreg=;
  b=cxtuG2PxJtiVx/XKoxDYb8Ay+tM/lgf2z6DmfV+Xv0BPadiYb1TJBbLG
   xNsGkfcjKY5wAA7rIZFZf8gY/UVKs3kN31SycdcRwi+5nFwXkZ6ZDIfdl
   WLAA1fMYd9lrno9dEgAXef+5YTub9Ag12QOAic21zj+MF/k2fg0GGT10s
   VF83rrutnNgayqlvx316gHL9m9pG7HTeJJxnGEEqPBS9Qb+Bhqa/3U/68
   L1lJ9vSWU0n2AwRPXJDHoewR0zhgW7mghtMNb/pFQ7eU1bXxje+6jbJDX
   CgdTVE6yn0keJhra1thlb6gHpMgKiuUJO2SyQAETMOiqvUYQbnTkvawA1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="451860359"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="451860359"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 08:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="792465452"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="792465452"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2023 08:08:38 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKKPN-0007Wa-1Y;
	Fri, 14 Jul 2023 15:08:37 +0000
Date: Fri, 14 Jul 2023 23:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext-current 1/19] include/linux/compiler_types.h:397:45:
 error: call to '__compiletime_assert_420' declared with attribute error:
 BUILD_BUG_ON failed: VMALLOC_START != MODULES_END
Message-ID: <202307142353.zXCMtoyV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext-current
head:   49e3458967802a6981190b5a1fa9fd66dbf58f8c
commit: 631e7c45f5d4cf043cd236a921c341e3dd9f1909 [1/19] arm64: place kernel in its own L0 page table entry
config: arm64-randconfig-r002-20230714 (https://download.01.org/0day-ci/archive/20230714/202307142353.zXCMtoyV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142353.zXCMtoyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307142353.zXCMtoyV-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/minmax.h:20:35: warning: comparison of distinct pointer types lacks a cast
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^~
   include/linux/minmax.h:26:18: note: in expansion of macro '__typecheck'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~
   include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:34: note: in expansion of macro 'max'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~
   arch/arm64/include/asm/memory.h:48:34: note: in expansion of macro 'KIMAGE_VADDR'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:49:34: note: in expansion of macro 'MODULES_END'
      49 | #define MODULES_VADDR           (MODULES_END - MODULES_VSIZE)
         |                                  ^~~~~~~~~~~
   arch/arm64/mm/kasan_init.c:225:61: note: in expansion of macro 'MODULES_VADDR'
     225 |         mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
         |                                                             ^~~~~~~~~~~~~
   In file included from <command-line>:
   include/linux/minmax.h:20:35: warning: comparison of distinct pointer types lacks a cast
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
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
   include/linux/minmax.h:26:18: note: in expansion of macro '__typecheck'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~
   include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:34: note: in expansion of macro 'max'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~
   arch/arm64/include/asm/memory.h:48:34: note: in expansion of macro 'KIMAGE_VADDR'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:34: note: in expansion of macro 'MODULES_END'
      24 | #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
         |                                  ^~~~~~~~~~~
   arch/arm64/mm/kasan_init.c:248:22: note: in expansion of macro 'VMALLOC_START'
     248 |         BUILD_BUG_ON(VMALLOC_START != MODULES_END);
         |                      ^~~~~~~~~~~~~
   include/linux/minmax.h:20:35: warning: comparison of distinct pointer types lacks a cast
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
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
   include/linux/minmax.h:26:18: note: in expansion of macro '__typecheck'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~
   include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:34: note: in expansion of macro 'max'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~
   arch/arm64/include/asm/memory.h:48:34: note: in expansion of macro 'KIMAGE_VADDR'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/mm/kasan_init.c:248:39: note: in expansion of macro 'MODULES_END'
     248 |         BUILD_BUG_ON(VMALLOC_START != MODULES_END);
         |                                       ^~~~~~~~~~~
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_420' declared with attribute error: BUILD_BUG_ON failed: VMALLOC_START != MODULES_END
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


vim +/__compiletime_assert_420 +397 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  383  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  384  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  385  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  386  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  387  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  388   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  389   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  390   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  391   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  392   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  393   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  394   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  395   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  396  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @397  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  398  

:::::: The code at line 397 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
