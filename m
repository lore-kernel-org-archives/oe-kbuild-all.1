Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180811FA0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691257009; x=1722793009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3h6nILr9UL+BLePXOp7NPhaaw8e7hHJ2derl0zm20tw=;
  b=kqfCFV6bnnYBuS9oiK3k6gPsPzfzWhaZB91/M9d/KNBtQwqJKZDPjyDj
   +gtZ0ebqHX83z2lLg9EVI5ez700aTgyo7DN+Nonf47DCvR//G+CI1zdRz
   eutHLRbW7OeKYqiAduzQs27jcSP07hNgqEo4HvuhscYETkJqp2GzoE/CC
   c47ohliIf1xBbNHvKmraNOU81YJCT92mv/Tq4rUPa+Mw3pPuhBN9PpqDh
   ZVRCe3W/SlFbW3a+s+uDyvqv+zzEI0HuOPDWDgO4RHlYjggxtsg+GguV+
   J3y6+B7hFAbQSPHxTJ+KJg9Qfgy24vmseel5baNixVfm1d8gA01SS77tw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="367786071"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="367786071"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 10:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="707351759"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="707351759"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Aug 2023 10:36:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSLCm-0003np-0s;
	Sat, 05 Aug 2023 17:36:44 +0000
Date: Sun, 6 Aug 2023 01:36:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 392/474] include/linux/compiler_types.h:397:45:
 error: call to '__compiletime_assert_294' declared with attribute error:
 BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT >
 PAGE_SHIFT)
Message-ID: <202308060105.IP2Npoqr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   84d9f657acaecc43dc52f25d52230db85fd5ffdd
commit: 7b4ad9400126434e6997c0249ee61dd648c04d42 [392/474] mips: implement the new page table range API
config: mips-randconfig-r002-20230806 (https://download.01.org/0day-ci/archive/20230806/202308060105.IP2Npoqr-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308060105.IP2Npoqr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308060105.IP2Npoqr-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/mm/init.c:60:6: warning: no previous prototype for 'setup_zero_pages' [-Wmissing-prototypes]
      60 | void setup_zero_pages(void)
         |      ^~~~~~~~~~~~~~~~
   In file included from <command-line>:
   arch/mips/mm/init.c: In function 'mem_init':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_294' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
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


vim +/__compiletime_assert_294 +397 include/linux/compiler_types.h

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
