Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C966AB2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 22:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691707944; x=1723243944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/tyyswunOX8Gy0qZbQLG4GEVHTFmw0iJ6YOrkKJMags=;
  b=nyO7uh9ZoW9/3Fe8n0Xt/WxB+8aBImW3vylvQB6RUgIt4bGJUbBAuhRh
   nASVgv7udGU3YN12FuDmAtSZ5ctRL2HU8jwaTRoBc0Rcuv6//yyrEkG1T
   BUtFf7zsFGN9HqzrPaGsNu2JrXzevJz9/zr2PC3idXc1cn8+37OfLUHH8
   VlG3mhO2r0cC2h7/SXszPGCdq2+qY6Wz2x/0sNy8EMupVJWb8jFgLyueX
   VLAM6vOEhfnYuRE6Q4lOl+9ki/OtNGZ9MWwp6gf1Br/oRANrAeoRBL5P5
   y6tmouoeEQtDyWYcIWNH1g36T0+lWD9P2Glw2Tg8/nIgbUL1B2qZxIT75
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="437880199"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="437880199"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 15:52:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="726011910"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="726011910"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Aug 2023 15:52:22 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUEVx-0007J2-2s;
	Thu, 10 Aug 2023 22:52:21 +0000
Date: Fri, 11 Aug 2023 06:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] mm: Properly document tail pages for compound pages
Message-ID: <202308110642.t5ECWu7x-lkp@intel.com>
References: <20230810204944.53471-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810204944.53471-1-peterx@redhat.com>

Hi Peter,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-Properly-document-tail-pages-for-compound-pages/20230811-045015
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230810204944.53471-1-peterx%40redhat.com
patch subject: [PATCH RFC] mm: Properly document tail pages for compound pages
config: mips-randconfig-r035-20230811 (https://download.01.org/0day-ci/archive/20230811/202308110642.t5ECWu7x-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110642.t5ECWu7x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110642.t5ECWu7x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:21,
                    from arch/mips/include/asm/cpu.h:12,
                    from arch/mips/include/asm/timex.h:16,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from arch/mips/kernel/asm-offsets.c:12:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct folio, _flags_2) == offsetof(struct page, flags) + 2 * sizeof(struct page)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:434:9: note: in expansion of macro 'static_assert'
     434 |         static_assert(offsetof(struct folio, fl) ==                     \
         |         ^~~~~~~~~~~~~
   include/linux/mm_types.h:436:1: note: in expansion of macro 'FOLIO_MATCH'
     436 | FOLIO_MATCH(flags, _flags_2);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct folio, _head_2) == offsetof(struct page, compound_head) + 2 * sizeof(struct page)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:434:9: note: in expansion of macro 'static_assert'
     434 |         static_assert(offsetof(struct folio, fl) ==                     \
         |         ^~~~~~~~~~~~~
   include/linux/mm_types.h:437:1: note: in expansion of macro 'FOLIO_MATCH'
     437 | FOLIO_MATCH(compound_head, _head_2);
         | ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/mips/kernel/asm-offsets.s] Error 1 shuffle=3596142661
   make[3]: Target 'missing-syscalls' not remade because of errors.
   make[2]: *** [arch/mips/Makefile:434: archprepare] Error 2 shuffle=3596142661
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=3596142661
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=3596142661
   make: Target 'prepare' not remade because of errors.


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
