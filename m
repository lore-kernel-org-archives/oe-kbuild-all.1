Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC13F1A5A0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 17:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695231889; x=1726767889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t7VFT4/Q6iTHwcxJKYV9r4KD/3R/u6kiNAGY2zVnTrQ=;
  b=Dvhf/iF5syUYg1VNCwTV3/a8t3lsURfQxr1MAfd2ZGW6XPgc8jO9UYyP
   o6za8Ct8d1klHlwbWf+P0RkRgiteI+1699avV8lhd7ZNwJYOqnYf/6cQc
   /6xjlns6F8sYWfDA5od4Z6Pm6MPq3XHQ5ObmgSO8m388TSBr+xYtsYd9H
   L2WNrdgxJ5AMYlOCpvG6O+xqvuIXCBzY0ZpHqr1Z+NkY+RXeoyAKUG/7a
   W+1sGJqZePMlyAHjwycWUi2xMDWuSGi6vM0Z86CEa6obLtHZI02QPa/ei
   q0ejBIqeHzbUDWruXJDlRmhvlwSUb2D15nKdQYAZ1gDKQrxwehb+g2ocn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444389720"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="444389720"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 10:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="993702655"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="993702655"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 20 Sep 2023 10:42:39 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj1Dg-0008zk-2p;
	Wed, 20 Sep 2023 17:42:37 +0000
Date: Thu, 21 Sep 2023 01:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 6/6] shmem: add large folios support to the write path
Message-ID: <202309210127.kmPiVzus-lkp@intel.com>
References: <20230919135536.2165715-7-da.gomez@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919135536.2165715-7-da.gomez@samsung.com>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.6-rc2 next-20230920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Gomez/shmem-drop-BLOCKS_PER_PAGE-macro/20230920-005146
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230919135536.2165715-7-da.gomez%40samsung.com
patch subject: [PATCH v2 6/6] shmem: add large folios support to the write path
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20230921/202309210127.kmPiVzus-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210127.kmPiVzus-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210127.kmPiVzus-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'shmem_alloc_and_acct_folio',
       inlined from 'shmem_get_folio_gfp.isra' at mm/shmem.c:2080:11:
>> include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_359' declared with attribute error: BUILD_BUG failed
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   include/linux/huge_mm.h:257:28: note: in expansion of macro 'BUILD_BUG'
     257 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^~~~~~~~~
   include/linux/huge_mm.h:67:26: note: in expansion of macro 'HPAGE_PMD_SHIFT'
      67 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^~~~~~~~~~~~~~~
   mm/shmem.c:1734:22: note: in expansion of macro 'HPAGE_PMD_ORDER'
    1734 |         if (order == HPAGE_PMD_ORDER)
         |                      ^~~~~~~~~~~~~~~


vim +/__compiletime_assert_359 +425 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  411  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  412  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  413  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  414  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  415  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  416   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  417   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  418   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  419   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  420   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  421   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  422   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  423   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  424  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @425  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  426  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
