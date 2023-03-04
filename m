Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5966123D1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677939837; x=1709475837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h74KY7EGZq5ItKjrlJNaP4SsQpCBCtIJqcjm2dqMR2Q=;
  b=C/6qUtOvtfNgVKNBO9oZ9TQ2Wh8dg+oAuoCdDTc+hPJszSrhpM97IGjh
   5eB3x81w1Vz8QdHrXQ/WeGYPoPhmaLn9Dzpf8vHLWIFthorgT4ZT/21XI
   sA4gLGzKv8bgNwm/VwXDChYayDrwtvt+IkrtQD5ef5CD8YzSbNfaaDCmJ
   53fxpOOcjjp9WOdoJe1ksW2yprC8mLGWG0aDoJQSV8yNx//rP/gZKVj1u
   E5Cycv9NTRUhNtVNn9YMi5RgPHxKtEoqAitJMXvAwWg/+pVfCAyDljlVP
   xw2j5+0xo57uDgZAaq5ARKZ339JO97TjkecljEueJiZVc3CmcJAypl+L+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="400082501"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="400082501"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 06:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="785633684"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="785633684"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2023 06:23:55 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYSni-0002Cm-1r;
	Sat, 04 Mar 2023 14:23:54 +0000
Date: Sat, 4 Mar 2023 22:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Tosatti <mtosatti@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 129/143] include/linux/compiler_types.h:399:45:
 error: call to '__compiletime_assert_384' declared with attribute error:
 BUILD_BUG failed
Message-ID: <202303042217.HbD8vk8i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   df3ae4347aff9be1e9763ffa3b1015fca348bfbd
commit: 676a3befc9bac1179f6a160ffe059c11e831a32c [129/143] mm/vmstat: use xchg in cpu_vm_stats_fold
config: arc-randconfig-r043-20230302 (https://download.01.org/0day-ci/archive/20230304/202303042217.HbD8vk8i-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=676a3befc9bac1179f6a160ffe059c11e831a32c
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 676a3befc9bac1179f6a160ffe059c11e831a32c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303042217.HbD8vk8i-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   mm/vmstat.c: In function 'cpu_vm_stats_fold':
>> include/linux/compiler_types.h:399:45: error: call to '__compiletime_assert_384' declared with attribute error: BUILD_BUG failed
     399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:380:25: note: in definition of macro '__compiletime_assert'
     380 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
     399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:108:17: note: in expansion of macro 'BUILD_BUG'
     108 |                 BUILD_BUG();                                            \
         |                 ^~~~~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_xchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:29:9: note: in expansion of macro '__atomic_op_fence'
      29 |         __atomic_op_fence(arch_xchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1886:9: note: in expansion of macro 'arch_xchg'
    1886 |         arch_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~
   mm/vmstat.c:907:37: note: in expansion of macro 'xchg'
     907 |                                 v = xchg(&pzstats->vm_stat_diff[i], 0);
         |                                     ^~~~
   include/linux/compiler_types.h:399:45: error: call to '__compiletime_assert_386' declared with attribute error: BUILD_BUG failed
     399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:380:25: note: in definition of macro '__compiletime_assert'
     380 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
     399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:108:17: note: in expansion of macro 'BUILD_BUG'
     108 |                 BUILD_BUG();                                            \
         |                 ^~~~~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_xchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:29:9: note: in expansion of macro '__atomic_op_fence'
      29 |         __atomic_op_fence(arch_xchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1886:9: note: in expansion of macro 'arch_xchg'
    1886 |         arch_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~
   mm/vmstat.c:933:37: note: in expansion of macro 'xchg'
     933 |                                 v = xchg(&p->vm_node_stat_diff[i], 0);
         |                                     ^~~~


vim +/__compiletime_assert_384 +399 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  386  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  388  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  389  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  396   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  397   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  398  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @399  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  400  

:::::: The code at line 399 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
