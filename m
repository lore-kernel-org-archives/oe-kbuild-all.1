Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3606E4DC94
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 22:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690928446; x=1722464446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OmlaSHxUjId8xqyDB63nCmnLyuIZWfdlKlMu5+Y+Q3k=;
  b=YvTWMniE1ulSdMkh/tzh4ShTr/0DLFwnmzizc9wI46Q8aP5Zi7q0vByB
   r37Rxl9qmCfU5OsIhkXjr8hXDYhLVt3c6RdWBqaV7Ae3wkC2DYis0SKXF
   H+cuwaarZ7CGsOk2qNs+hPh54Qfl7Zbs9YnXXdpR0FcKFSuAkIz625GtC
   JLRnpuyxCqOP7JbnUl/vx5aUIZvNi+utCO368LlOzeFsQv4y/UrVJtj1I
   AdejHOetYFyaa/IQKRTyPBKfLzJpCaSp4UcZ+rQNO2gBYat7q41AuMZSl
   Qh0ZnBH5PCEfS2yCp+NZBTsKTaNjSnEbVYNVVczmzkKKT3z8rZ1VEDAGw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="359465019"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="359465019"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 15:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="732151425"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="732151425"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Aug 2023 15:20:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQxjP-0000d1-2H;
	Tue, 01 Aug 2023 22:20:43 +0000
Date: Wed, 2 Aug 2023 06:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 17/38]
 include/linux/compiler_types.h:397:45: error: call to
 '__compiletime_assert_324' declared with attribute error: BUILD_BUG_ON
 failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
Message-ID: <202308020639.6w2tXRgF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   9729c95a6d57a4f9d63c098dcfc27f1f1a5e8e03
commit: 054d8702c85880f10feb56c20afdac75f103c075 [17/38] mips: Implement the new page table range API
config: mips-randconfig-r011-20230801 (https://download.01.org/0day-ci/archive/20230802/202308020639.6w2tXRgF-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020639.6w2tXRgF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020639.6w2tXRgF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/mm/init.c:60:6: warning: no previous prototype for 'setup_zero_pages' [-Wmissing-prototypes]
      60 | void setup_zero_pages(void)
         |      ^~~~~~~~~~~~~~~~
   In file included from <command-line>:
   arch/mips/mm/init.c: In function 'mem_init':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_324' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
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


vim +/__compiletime_assert_324 +397 include/linux/compiler_types.h

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
