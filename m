Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4865D31A068
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 19:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763060759; cv=none; b=pvrbkOTXY8K8XBD1LrgUeud+Koy5TejE5zQgEjEqCAm69Eh2xCcg0rspNQmgxQ8UHlVPXlDHSMurbNtGFMfUVnJ1yc3rW6toZ8vPQd92qO20vw9ehuKnwCQZLWalLyXMga7wY4CjKeMr5JiDkOaVIg0EZ5ZtpNqcfQ9uM5uQXUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763060759; c=relaxed/simple;
	bh=l05/qDkoTGzPrk+ezM0KuaUcahGj5zbQ3yImvnYUc2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Axrw/2WGMH23DHI7qms3JLgscR5wcj+XGAUgn1F1SVpA1ZLRvRBeq5Dm1vZw3WDu2wPGO88m2Nrz1UokrS09ooB+5egZQtqyidrZnnP6RkbBiW+ku5mGekX2Zl2zYCbMEVGjBJf5MsS0P/Fx1YJtzMN6s6Z/G8zEOz8RhHKl3Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPzeu7pS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPzeu7pS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763060757; x=1794596757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l05/qDkoTGzPrk+ezM0KuaUcahGj5zbQ3yImvnYUc2o=;
  b=EPzeu7pSF82K4zKoVq0CTCZjCDwqMVDJrj0dGybN/fNJ+XpjdNpbcdtC
   YLiXs3l2CRO5bV0LBCUNxCXdkSWykKKftomQcHg8NRqKyQVjClFUdnCTI
   +pIVfJfTM4hK3vQx83rsl72sPdNlyBYSPYPDgTNWdQ4xLHkQ3/FclHXbw
   xCwM3fyzBICVz+guqsu9l7omyESBiHJiYVI3FxqDpHJbLLwm0P1yFXa3V
   A/4HMrSwOikPPe5gkCj6sEhtRHkwym2F64uu0w1as68Fp/owpY0VDxJ2D
   9hxA++zu59W+15HOZNYBO4aQoJ1BxkfhqOilpG+b5EujMjTpspBI+bHs1
   g==;
X-CSE-ConnectionGUID: 4UFhAbtwTs2AKh4NCnRFHg==
X-CSE-MsgGUID: X86XGSBPTYuN8Zsd3kqz8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65079705"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65079705"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 11:05:57 -0800
X-CSE-ConnectionGUID: ozXEg1j/QmyVjq12n0u3kg==
X-CSE-MsgGUID: QEexXDF1SVq+K5GphP3b3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="194021231"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Nov 2025 11:05:54 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJcdk-0005mN-27;
	Thu, 13 Nov 2025 19:05:52 +0000
Date: Fri, 14 Nov 2025 03:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	"Daniel Thompson (RISCstar)" <danielt@kernel.org>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: [lee-backlight:for-backlight-next 1/4] include/linux/math.h:162:17:
 error: first argument to '__builtin_choose_expr' not a constant
Message-ID: <202511140227.xzHsIPcb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
head:   67d8eed26eadb1edd4873d24889be26aa9b73fe5
commit: 243ce64b2b371cdf2cbc39c9422cb3047cab6de7 [1/4] backlight: Do not include <linux/fb.h> in header file
config: powerpc-ppc6xx_defconfig (https://download.01.org/0day-ci/archive/20251114/202511140227.xzHsIPcb-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140227.xzHsIPcb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140227.xzHsIPcb-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   include/linux/minmax.h:98:38: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                      ^~~~~~~~~~~
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/macintosh/via-pmu-backlight.c:45:23: note: in expansion of macro 'max'
      45 |                 max = max((int)bl_curve[i], max);
         |                       ^~~
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:577:23: note: in definition of macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/minmax.h:75:10: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |          ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/macintosh/via-pmu-backlight.c:45:23: note: in expansion of macro 'max'
      45 |                 max = max((int)bl_curve[i], max);
         |                       ^~~
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:577:23: note: in definition of macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/minmax.h:75:10: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |          ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/macintosh/via-pmu-backlight.c:45:23: note: in expansion of macro 'max'
      45 |                 max = max((int)bl_curve[i], max);
         |                       ^~~
   In file included from include/linux/kernel.h:27,
                    from arch/powerpc/include/asm/page.h:11,
                    from arch/powerpc/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60,
                    from arch/powerpc/include/asm/ptrace.h:342,
                    from drivers/macintosh/via-pmu-backlight.c:11:
>> include/linux/math.h:162:17: error: first argument to '__builtin_choose_expr' not a constant
     162 |                 __builtin_choose_expr(                                  \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:170:61: note: in definition of macro '__abs_choose_expr'
     170 |         ({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
         |                                                             ^~~~~
   include/linux/math.h:158:17: note: in expansion of macro '__abs_choose_expr'
     158 |                 __abs_choose_expr(x, long,                              \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/math.h:159:17: note: in expansion of macro '__abs_choose_expr'
     159 |                 __abs_choose_expr(x, int,                               \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/math.h:160:17: note: in expansion of macro '__abs_choose_expr'
     160 |                 __abs_choose_expr(x, short,                             \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/math.h:161:17: note: in expansion of macro '__abs_choose_expr'
     161 |                 __abs_choose_expr(x, char,                              \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/macintosh/via-pmu-backlight.c:49:28: note: in expansion of macro 'abs'
      49 |                 int diff = abs(bl_curve[i] - value);
         |                            ^~~
   include/linux/math.h:167:43: error: first argument to '__builtin_choose_expr' not a constant
     167 | #define __abs_choose_expr(x, type, other) __builtin_choose_expr(        \
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:170:61: note: in definition of macro '__abs_choose_expr'
     170 |         ({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
         |                                                             ^~~~~
   include/linux/math.h:158:17: note: in expansion of macro '__abs_choose_expr'
     158 |                 __abs_choose_expr(x, long,                              \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/math.h:159:17: note: in expansion of macro '__abs_choose_expr'
     159 |                 __abs_choose_expr(x, int,                               \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/math.h:160:17: note: in expansion of macro '__abs_choose_expr'
     160 |                 __abs_choose_expr(x, short,                             \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/math.h:161:17: note: in expansion of macro '__abs_choose_expr'
     161 |                 __abs_choose_expr(x, char,                              \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/macintosh/via-pmu-backlight.c:49:28: note: in expansion of macro 'abs'
      49 |                 int diff = abs(bl_curve[i] - value);
         |                            ^~~
   include/linux/math.h:167:43: error: first argument to '__builtin_choose_expr' not a constant
     167 | #define __abs_choose_expr(x, type, other) __builtin_choose_expr(        \
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:170:61: note: in definition of macro '__abs_choose_expr'
     170 |         ({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
         |                                                             ^~~~~
   include/linux/math.h:158:17: note: in expansion of macro '__abs_choose_expr'
     158 |                 __abs_choose_expr(x, long,                              \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/math.h:159:17: note: in expansion of macro '__abs_choose_expr'
     159 |                 __abs_choose_expr(x, int,                               \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/math.h:160:17: note: in expansion of macro '__abs_choose_expr'
     160 |                 __abs_choose_expr(x, short,                             \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/macintosh/via-pmu-backlight.c:49:28: note: in expansion of macro 'abs'
      49 |                 int diff = abs(bl_curve[i] - value);
         |                            ^~~
   include/linux/math.h:167:43: error: first argument to '__builtin_choose_expr' not a constant
     167 | #define __abs_choose_expr(x, type, other) __builtin_choose_expr(        \
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:170:61: note: in definition of macro '__abs_choose_expr'
     170 |         ({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
         |                                                             ^~~~~
   include/linux/math.h:158:17: note: in expansion of macro '__abs_choose_expr'
     158 |                 __abs_choose_expr(x, long,                              \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/math.h:159:17: note: in expansion of macro '__abs_choose_expr'
     159 |                 __abs_choose_expr(x, int,                               \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/macintosh/via-pmu-backlight.c:49:28: note: in expansion of macro 'abs'
      49 |                 int diff = abs(bl_curve[i] - value);
         |                            ^~~
   include/linux/math.h:167:43: error: first argument to '__builtin_choose_expr' not a constant
     167 | #define __abs_choose_expr(x, type, other) __builtin_choose_expr(        \
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:170:61: note: in definition of macro '__abs_choose_expr'
     170 |         ({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
         |                                                             ^~~~~
   include/linux/math.h:158:17: note: in expansion of macro '__abs_choose_expr'
     158 |                 __abs_choose_expr(x, long,                              \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/macintosh/via-pmu-backlight.c:49:28: note: in expansion of macro 'abs'
      49 |                 int diff = abs(bl_curve[i] - value);
         |                            ^~~
   include/linux/math.h:167:43: error: first argument to '__builtin_choose_expr' not a constant
     167 | #define __abs_choose_expr(x, type, other) __builtin_choose_expr(        \
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:157:17: note: in expansion of macro '__abs_choose_expr'
     157 | #define abs(x)  __abs_choose_expr(x, long long,                         \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/macintosh/via-pmu-backlight.c:49:28: note: in expansion of macro 'abs'
      49 |                 int diff = abs(bl_curve[i] - value);
         |                            ^~~
   drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_get_level_brightness':
   drivers/macintosh/via-pmu-backlight.c:63:38: error: 'FB_BACKLIGHT_MAX' undeclared (first use in this function); did you mean 'BACKLIGHT_RAW'?
      63 |         pmulevel = bl_curve[level] * FB_BACKLIGHT_MAX / MAX_PMU_LEVEL;
         |                                      ^~~~~~~~~~~~~~~~
         |                                      BACKLIGHT_RAW


vim +/__builtin_choose_expr +162 include/linux/math.h

aa6159ab99a9ab Andy Shevchenko 2020-12-15  148  
aa6159ab99a9ab Andy Shevchenko 2020-12-15  149  /**
aa6159ab99a9ab Andy Shevchenko 2020-12-15  150   * abs - return absolute value of an argument
aa6159ab99a9ab Andy Shevchenko 2020-12-15  151   * @x: the value.  If it is unsigned type, it is converted to signed type first.
aa6159ab99a9ab Andy Shevchenko 2020-12-15  152   *     char is treated as if it was signed (regardless of whether it really is)
aa6159ab99a9ab Andy Shevchenko 2020-12-15  153   *     but the macro's return type is preserved as char.
aa6159ab99a9ab Andy Shevchenko 2020-12-15  154   *
aa6159ab99a9ab Andy Shevchenko 2020-12-15  155   * Return: an absolute value of x.
aa6159ab99a9ab Andy Shevchenko 2020-12-15  156   */
aa6159ab99a9ab Andy Shevchenko 2020-12-15  157  #define abs(x)	__abs_choose_expr(x, long long,				\
aa6159ab99a9ab Andy Shevchenko 2020-12-15  158  		__abs_choose_expr(x, long,				\
aa6159ab99a9ab Andy Shevchenko 2020-12-15  159  		__abs_choose_expr(x, int,				\
aa6159ab99a9ab Andy Shevchenko 2020-12-15  160  		__abs_choose_expr(x, short,				\
aa6159ab99a9ab Andy Shevchenko 2020-12-15  161  		__abs_choose_expr(x, char,				\
aa6159ab99a9ab Andy Shevchenko 2020-12-15 @162  		__builtin_choose_expr(					\
aa6159ab99a9ab Andy Shevchenko 2020-12-15  163  			__builtin_types_compatible_p(typeof(x), char),	\
aa6159ab99a9ab Andy Shevchenko 2020-12-15  164  			(char)({ signed char __x = (x); __x<0?-__x:__x; }), \
aa6159ab99a9ab Andy Shevchenko 2020-12-15  165  			((void)0)))))))
aa6159ab99a9ab Andy Shevchenko 2020-12-15  166  

:::::: The code at line 162 was first introduced by commit
:::::: aa6159ab99a9ab5df835b4750b66cf132a5aa292 kernel.h: split out mathematical helpers

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
