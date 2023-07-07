Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4335A1775B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 21:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688764453; x=1720300453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zv80MOUvbF+mFOQN6mo587nKTyrHUbDmAYH1X+oi2l0=;
  b=lWK5D9f3RlrfEMP9npdBQqYwjZHLtbGZOQ+fAnBmx/Am7mcTL08RWss9
   WhVET/w5g9+Lnt3BeRvEzMJq47Dwl899uZnCRzDoUxb3RntLQy5lW87F2
   FzN1TUFrdZdKUJ8b+5n270/LKu3HkgaMhpqdbKkrj1XUCsGiXReD5eeWW
   FOl3RvlLwahsQR3FIRHuwm8+BrA9cqCh+HiWaWmfUlNFH/7j3el5dDHV5
   EWpWj88DHjVDeKKMKyP9rkGkEfwJY434PfB5atbG9A/T0bgaFa9M9uY6a
   Ljs9Z1wrXsYH/Yd2OkU5z1laUkRfA6f+zZ9ni/pEnxf2esxXPzc8A52AF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="361453687"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="361453687"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 14:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="697347722"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="697347722"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jul 2023 14:14:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHsmH-0002Ik-39;
	Fri, 07 Jul 2023 21:14:09 +0000
Date: Sat, 8 Jul 2023 05:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 16/37]
 include/linux/compiler_types.h:397:45: error: call to
 '__compiletime_assert_312' declared with attribute error: BUILD_BUG_ON
 failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
Message-ID: <202307080556.OpG2Iehy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   a357c8502e070a8a7aa2fa94492fd040ae053b78
commit: 05381e574453655259a574aff9938c03ada3ea43 [16/37] mips: Implement the new page table range API
config: mips-randconfig-m031-20230707 (https://download.01.org/0day-ci/archive/20230708/202307080556.OpG2Iehy-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080556.OpG2Iehy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080556.OpG2Iehy-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/mm/init.c:60:6: warning: no previous prototype for 'setup_zero_pages' [-Wmissing-prototypes]
      60 | void setup_zero_pages(void)
         |      ^~~~~~~~~~~~~~~~
   In file included from <command-line>:
   arch/mips/mm/init.c: In function 'mem_init':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_312' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
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
   arch/mips/mm/init.c:459:9: note: in expansion of macro 'BUILD_BUG_ON'
     459 |         BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_312 +397 include/linux/compiler_types.h

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
