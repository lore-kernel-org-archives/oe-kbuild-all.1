Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E50D2E2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 21:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679608200; x=1711144200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PAgcqUUmW9hCrWqlZg4TOuRomtuPGuPdI+wSqup+N/I=;
  b=Bn0oqKgMSVjOcsZz3aEc5j83FlY58/flRaNzecRgKt10r2qA/BM531L1
   iSP8G2O/5FyssK27uKaVJcrpjW/Qe8tybkj698nUfAA4sMJBgXNHVJAnT
   yGqxeaIoQ0nSKPSOIJxXBkkYQvcSA3A9DcqLFaZvRhIoTSWKMkzROSqQA
   /xfK9yjLouDYorOFsm189A64/5AZegwarWVUWDnVGiY59QHj0gtEux9lA
   KPUNBT9O8pS6Nm8NxRy0Dbd/XMGXYhQmuJFF75iJ6gKTI4ksmYD6c2kJ0
   vlYB0OIU50wKXmLYo9SA/Zg0tAWXrvx8QSpbXAv7jbDC42kdwhxkGkS+n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="323496827"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="323496827"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 14:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="825995325"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="825995325"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2023 14:49:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfSoa-000EjC-3A;
	Thu, 23 Mar 2023 21:49:44 +0000
Date: Fri, 24 Mar 2023 05:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>
Subject: [akpm-mm:mm-unstable 225/293] include/linux/compiler_types.h:397:45:
 error: call to '__compiletime_assert_311' declared with attribute error:
 BUILD_BUG_ON failed: ((16 + (16 - 3))-16) > -1
Message-ID: <202303240542.vEBPNs2Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   51551d71edbc998fd8c8afa7312db3d270f5998e
commit: 03d7e648fa25961bb92e920e7962710aa72fb409 [225/293] loongarch: drop ranges for definition of ARCH_FORCE_MAX_ORDER
config: loongarch-buildonly-randconfig-r002-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240542.vEBPNs2Q-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=03d7e648fa25961bb92e920e7962710aa72fb409
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 03d7e648fa25961bb92e920e7962710aa72fb409
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240542.vEBPNs2Q-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

     886 |                 if (!valid_page && pageblock_aligned(low_pfn)) {
         |                                    ^~~~~~~~~~~~~~~~~
   mm/compaction.c: In function 'isolate_migratepages_range':
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/uapi/linux/const.h:32:44: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                            ^
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:58:41: note: in expansion of macro 'ALIGN_DOWN'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                         ^~~~~~~~~~
   include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   mm/compaction.c:1218:27: note: in expansion of macro 'pageblock_start_pfn'
    1218 |         block_start_pfn = pageblock_start_pfn(pfn);
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:58:41: note: in expansion of macro 'ALIGN_DOWN'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                         ^~~~~~~~~~
   include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   mm/compaction.c:1218:27: note: in expansion of macro 'pageblock_start_pfn'
    1218 |         block_start_pfn = pageblock_start_pfn(pfn);
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                             ^~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:58:41: note: in expansion of macro 'ALIGN_DOWN'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                         ^~~~~~~~~~
   include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   mm/compaction.c:1218:27: note: in expansion of macro 'pageblock_start_pfn'
    1218 |         block_start_pfn = pageblock_start_pfn(pfn);
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:59:41: note: in expansion of macro 'ALIGN'
      59 | #define pageblock_end_pfn(pfn)          ALIGN((pfn) + 1, pageblock_nr_pages)
         |                                         ^~~~~
   include/linux/pageblock-flags.h:59:58: note: in expansion of macro 'pageblock_nr_pages'
      59 | #define pageblock_end_pfn(pfn)          ALIGN((pfn) + 1, pageblock_nr_pages)
         |                                                          ^~~~~~~~~~~~~~~~~~
   mm/compaction.c:1221:25: note: in expansion of macro 'pageblock_end_pfn'
    1221 |         block_end_pfn = pageblock_end_pfn(pfn);
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                             ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:59:41: note: in expansion of macro 'ALIGN'
      59 | #define pageblock_end_pfn(pfn)          ALIGN((pfn) + 1, pageblock_nr_pages)
         |                                         ^~~~~
   include/linux/pageblock-flags.h:59:58: note: in expansion of macro 'pageblock_nr_pages'
      59 | #define pageblock_end_pfn(pfn)          ALIGN((pfn) + 1, pageblock_nr_pages)
         |                                                          ^~~~~~~~~~~~~~~~~~
   mm/compaction.c:1221:25: note: in expansion of macro 'pageblock_end_pfn'
    1221 |         block_end_pfn = pageblock_end_pfn(pfn);
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   mm/compaction.c:1225:50: note: in expansion of macro 'pageblock_nr_pages'
    1225 |                                 block_end_pfn += pageblock_nr_pages) {
         |                                                  ^~~~~~~~~~~~~~~~~~
   mm/compaction.c: In function 'compact_scanners_met':
>> mm/compaction.c:1308:30: warning: right shift count is negative [-Wshift-count-negative]
    1308 |         return (cc->free_pfn >> pageblock_order)
         |                              ^~
   mm/compaction.c:1309:37: warning: right shift count is negative [-Wshift-count-negative]
    1309 |                 <= (cc->migrate_pfn >> pageblock_order);
         |                                     ^~
   In file included from include/linux/kernel.h:26:
   mm/compaction.c: In function 'fast_isolate_around':
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/linux/minmax.h:28:27: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                           ^
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/compaction.c:1360:21: note: in expansion of macro 'max'
    1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
         |                     ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:58:41: note: in expansion of macro 'ALIGN_DOWN'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                         ^~~~~~~~~~
   include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   mm/compaction.c:1360:25: note: in expansion of macro 'pageblock_start_pfn'
    1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/linux/minmax.h:28:27: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                           ^
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/compaction.c:1360:21: note: in expansion of macro 'max'
    1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
         |                     ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:58:41: note: in expansion of macro 'ALIGN_DOWN'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                         ^~~~~~~~~~
   include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   mm/compaction.c:1360:25: note: in expansion of macro 'pageblock_start_pfn'
    1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/linux/minmax.h:28:27: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                           ^
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/compaction.c:1360:21: note: in expansion of macro 'max'
    1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
         |                     ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:58:41: note: in expansion of macro 'ALIGN_DOWN'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                         ^~~~~~~~~~
   include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   mm/compaction.c:1360:25: note: in expansion of macro 'pageblock_start_pfn'
    1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/linux/minmax.h:28:40: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                                        ^
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/compaction.c:1360:21: note: in expansion of macro 'max'
    1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
         |                     ^~~
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from mm/huge_memory.c:8:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:277:34: warning: missing braces around initializer [-Wmissing-braces]
     277 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:519:16: note: in expansion of macro '__swp_entry_to_pmd'
     519 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   mm/huge_memory.c: In function 'hugepage_init':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_311' declared with attribute error: BUILD_BUG_ON failed: ((16 + (16 - 3))-16) > -1
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
   include/linux/bug.h:24:25: note: in expansion of macro 'BUILD_BUG_ON'
      24 |                         BUILD_BUG_ON(cond);             \
         |                         ^~~~~~~~~~~~
   mm/huge_memory.c:470:9: note: in expansion of macro 'MAYBE_BUILD_BUG_ON'
     470 |         MAYBE_BUILD_BUG_ON(HPAGE_PMD_ORDER > MAX_ORDER);
         |         ^~~~~~~~~~~~~~~~~~


vim +/__compiletime_assert_311 +397 include/linux/compiler_types.h

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
https://github.com/intel/lkp-tests
