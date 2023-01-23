Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B5C1C2D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 12:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674478389; x=1706014389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+jyLQ0LtHqp1vO9c+XPe5U+6kePfWaFN7G78fyuLFdE=;
  b=JH+1Q8mazjZlBTaWF3yoXXrx5i/0tkLC6Wws8OQaRFZKtuNUd/YYhvco
   O+qpwK6JZSMw7t5xLXLipYFayHvzvxYHN7ujsAjmpTjxq9mXxObesDbv9
   3nJDY9pHALTcJAdiK3wC3wBB0TUU3C/Q97WvoXc4XdGG9RZQYNEtkB8FX
   C3SqGz2xqL3p7KPvCKeqCRegFrbO3zWsp55Elii8ZvFuPRnW2W4Mecjzn
   8ri+66ZOkOVyCsNO7jCw97/nvEiCBdShz+4VXsuA5RkooXDY9nVLpuYkE
   krQjmaUZdkPi9+Cg25kW/2eIPNONhDaJWf/olvcu8PBhgXKV6qqvDO3ZC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="306385478"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="306385478"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 04:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="639111845"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="639111845"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Jan 2023 04:53:07 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJwJu-0005e4-1e;
	Mon, 23 Jan 2023 12:53:06 +0000
Date: Mon, 23 Jan 2023 20:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:misc/pfn_valid/v0 1/1] include/linux/mmzone.h:103:56: warning:
 left-hand operand of comma expression has no effect
Message-ID: <202301232046.wHmO6mOy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git misc/pfn_valid/v0
head:   2cb3404accfc161b66866cd03c42953f57700677
commit: 2cb3404accfc161b66866cd03c42953f57700677 [1/1] mm, arch: add generic implementation of pfn_valid() for FLATMEM
config: i386-randconfig-a002-20230123 (https://download.01.org/0day-ci/archive/20230123/202301232046.wHmO6mOy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=2cb3404accfc161b66866cd03c42953f57700677
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt misc/pfn_valid/v0
        git checkout 2cb3404accfc161b66866cd03c42953f57700677
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:13:
   include/linux/mm.h: In function 'folio_pfn':
   include/linux/mm.h:1632:41: error: expected expression before ';' token
    1632 |         return page_to_pfn(&folio->page);
         |                                         ^
   include/linux/mm.h:1632:42: error: expected ';' before '}' token
    1632 |         return page_to_pfn(&folio->page);
         |                                          ^
         |                                          ;
    1633 | }
         | ~                                         
   In file included from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from include/linux/crypto.h:20,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/mm.h: In function 'is_longterm_pinnable_page':
   include/linux/mmzone.h:103:56: error: expected expression before ',' token
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                                        ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:103:56: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                                        ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:13:
   include/linux/mm.h:1714:49: error: expected ')' before ';' token
    1714 |         int mt = get_pageblock_migratetype(page);
         |                                                 ^
   In file included from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from include/linux/crypto.h:20,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/mmzone.h:103:32: note: to match this '('
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:103:9: error: too few arguments to function 'get_pfnblock_flags_mask'
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:18,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from include/linux/crypto.h:20,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/pageblock-flags.h:64:15: note: declared here
      64 | unsigned long get_pfnblock_flags_mask(const struct page *page,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/asm-offsets.c:115:1: error: expected declaration or statement at end of input
     115 | }
         | ^
   In file included from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:13:
>> include/linux/mm.h:1714:13: warning: unused variable 'mt' [-Wunused-variable]
    1714 |         int mt = get_pageblock_migratetype(page);
         |             ^~
   arch/x86/kernel/asm-offsets.c:115:1: error: no return statement in function returning non-void [-Werror=return-type]
     115 | }
         | ^
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1298: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +103 include/linux/mmzone.h

e58469bafd0524 Mel Gorman 2014-06-04  101  
dc4b0caff24d9b Mel Gorman 2014-06-04  102  #define get_pageblock_migratetype(page)					\
535b81e209219e Wei Yang   2020-08-06 @103  	get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
dc4b0caff24d9b Mel Gorman 2014-06-04  104  

:::::: The code at line 103 was first introduced by commit
:::::: 535b81e209219e03f815379746bfd1eeb82d68e5 mm/page_alloc.c: remove unnecessary end_bitidx for [set|get]_pfnblock_flags_mask()

:::::: TO: Wei Yang <richard.weiyang@linux.alibaba.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
