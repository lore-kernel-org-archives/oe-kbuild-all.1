Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EF9647
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 00:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749254744; cv=none; b=ibmukyJhl7wC0EplL1BXg/WXnbuobjUzQVdZZsCd9bdOKovTI0sm7K8ectI37yZ74W7p+3vbhyEA6cL6OHEmT8DpoppAKTMGJF6LB6bsLP3IdiYMVsPkQhLF++slOMHxIpNVIlqjXglrklKbRa+s3JQx9rS5OnzA+RGk0WbV7rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749254744; c=relaxed/simple;
	bh=hICJISyuwWTTWNxZUchVpRZPM8fkvye8Gb5sDmxm514=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MG0CUqH/8hp1TiHOvDYJfWF0YKU28x2Z6d7JzSc66aX1Q5YAIBBu+n8t8xAPEyjZKeMstpq3ngihC8LpkE+dmQVc0rQ+whasyivN5XkDPBjdEpHKWUdack3490KFFLKR/xer6JaLCsqA0KeyBT1tdXk5M/wlrHkf5W6OUGMyWus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxLKvJdg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxLKvJdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749254742; x=1780790742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hICJISyuwWTTWNxZUchVpRZPM8fkvye8Gb5sDmxm514=;
  b=hxLKvJdgyNKmSCrFNQn3Vd+QvMHHzIU/UWzgcZ6xZCmenveXI/qtW/oe
   exh1xpY09QmDW24MjvhbiEV8pGnnBIjwC/sphp2ilIRRHgR0xc3h0cALz
   pk1enzqXJo0oudg39i/5kr4uc2JEkRnZ0TpTsq1UzLek7TR7HG2jE2B+h
   /FGoPNCpRUsjYHywAjpt9MXl+1Upia7mT2ZX4GYAOO/TOMnjb01vvXWzl
   IC673w23gwR6vVYInL87//r0Ec/BjZ3//qiBTKGc3OSBlEgM/px5+47K6
   g9ogmdT6VN/tPWa9LIIQQ52hMlKJOH93H+Fq5rSfPQETviTdo2JZlBbys
   Q==;
X-CSE-ConnectionGUID: 9yIMgyjeRaWy+XRhUC1/MQ==
X-CSE-MsgGUID: z63YpMuBQuSXA6ZxgWAoQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68860936"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="68860936"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 17:05:41 -0700
X-CSE-ConnectionGUID: rxQHYu8dSAOqIy7Dr7LGNQ==
X-CSE-MsgGUID: uH9WdQgNShS/g9SXLYARAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="183151650"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Jun 2025 17:05:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNh45-0005MD-2q;
	Sat, 07 Jun 2025 00:05:37 +0000
Date: Sat, 7 Jun 2025 08:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Message-ID: <202506070703.LYUKqrcu-lkp@intel.com>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606143700.3256414-1-usamaarif642@gmail.com>

Hi Usama,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-khugepaged-use-largest-enabled-hugepage-order-for-min_free_kbytes/20250606-223755
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250606143700.3256414-1-usamaarif642%40gmail.com
patch subject: [RFC] mm: khugepaged: use largest enabled hugepage order for min_free_kbytes
config: i386-buildonly-randconfig-002-20250607 (https://download.01.org/0day-ci/archive/20250607/202506070703.LYUKqrcu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070703.LYUKqrcu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506070703.LYUKqrcu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:28,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/khugepaged.c:4:
   mm/khugepaged.c: In function 'min_thp_pageblock_nr_pages':
>> mm/khugepaged.c:2627:59: error: 'PAGE_BLOCK_ORDER' undeclared (first use in this function); did you mean 'PAGE_BLOCK_MAX_ORDER'?
    2627 |         return (1UL << min(thp_highest_allowable_order(), PAGE_BLOCK_ORDER));
         |                                                           ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:92:49: note: in definition of macro '__careful_cmp_once'
      92 |         __auto_type ux = (x); __auto_type uy = (y);     \
         |                                                 ^
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/khugepaged.c:2627:24: note: in expansion of macro 'min'
    2627 |         return (1UL << min(thp_highest_allowable_order(), PAGE_BLOCK_ORDER));
         |                        ^~~
   mm/khugepaged.c:2627:59: note: each undeclared identifier is reported only once for each function it appears in
    2627 |         return (1UL << min(thp_highest_allowable_order(), PAGE_BLOCK_ORDER));
         |                                                           ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:92:49: note: in definition of macro '__careful_cmp_once'
      92 |         __auto_type ux = (x); __auto_type uy = (y);     \
         |                                                 ^
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/khugepaged.c:2627:24: note: in expansion of macro 'min'
    2627 |         return (1UL << min(thp_highest_allowable_order(), PAGE_BLOCK_ORDER));
         |                        ^~~
   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:103,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6:
>> include/linux/compiler.h:166:45: error: '__UNIQUE_ID_y_426' undeclared (first use in this function); did you mean '__UNIQUE_ID_x_425'?
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/compiler_types.h:548:17: note: in expansion of macro 'if'
     548 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:556:9: note: in expansion of macro '__compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:98:55: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/khugepaged.c:2627:24: note: in expansion of macro 'min'
    2627 |         return (1UL << min(thp_highest_allowable_order(), PAGE_BLOCK_ORDER));
         |                        ^~~
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/compiler_types.h:548:17: note: in expansion of macro 'if'
     548 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:556:9: note: in expansion of macro '__compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:70:25: note: in expansion of macro 'statically_true'
      70 | #define __is_nonneg(ux) statically_true( \
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/khugepaged.c:2627:24: note: in expansion of macro 'min'
    2627 |         return (1UL << min(thp_highest_allowable_order(), PAGE_BLOCK_ORDER));
         |                        ^~~
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))


vim +2627 mm/khugepaged.c

  2624	
  2625	static unsigned long min_thp_pageblock_nr_pages(void)
  2626	{
> 2627		return (1UL << min(thp_highest_allowable_order(), PAGE_BLOCK_ORDER));
  2628	}
  2629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
