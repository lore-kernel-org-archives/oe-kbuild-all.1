Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EE03806DA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 11:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775647136; cv=none; b=AK1aKKsOEwotJoDpMVUsifoUzQmtnFuwVuAuAEkh6Dr72JJxx2LGh6RdnLKapPEDp7wcCFTPMZx1YDHN5pdtesRB/lqI4ZYcf5E8qFj+sfYJHQ20omc9P8LSNK2Ao/yMdAuXFinmHVpRPar7MCUcg2QIHnM8Wqx99sDQturElAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775647136; c=relaxed/simple;
	bh=SDrU4W/1mPOq5tOfKSCwTpSjkdPVD+TRN4RnbRXDTMs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y0CjN5fX8HXio8Qzs/8KU1/WGyn2pDcJF/OOoMxB8SRY9mf6v9FouyhhxygXvBitRUkrr5gD3kEgeX22aNQVIWZMpLFl/dH09qXrH300HcYtOC3+UJwiJZhEVQXXk4iNXIJZgcFy/8F1PGmpAF88LZnz8Dhu7rrxRMOi1XWSZ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwYJ3Yf9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwYJ3Yf9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775647134; x=1807183134;
  h=date:from:to:cc:subject:message-id;
  bh=SDrU4W/1mPOq5tOfKSCwTpSjkdPVD+TRN4RnbRXDTMs=;
  b=fwYJ3Yf9JYPZCNk/CjdUWeoMYXTfMpwTUQ8M/96YbcJ0ahs/6lKecQ3m
   XbRrbqVDA+lgazLSlpRC4dAfr6edWNg/y8vhF4z0NiRqL3oGRtDDiYuAX
   MnXivCIc1Jxek3gVsO0yeqmgoex0EVWgb9ypjFAzSRThMRI6HKA6U6DOk
   dk1wRsuwtqbVkVkyY1t/Qek2ZSfc9mhuXwlGl56VYaVj8j04krFJhF6YY
   wvij+V6MMj3AcEZlzUw8Wwp/dxrCPGIOZ25op3SPRJgz4sqCFGADjCny4
   vkHeFbw1bJ4Uq73VbF9feRpU/2+bdGBTYYZoiOmgW6hHj70FTp3JVBFq0
   w==;
X-CSE-ConnectionGUID: 8qY6aJYsTy29vzxLNdopmA==
X-CSE-MsgGUID: PalYG3uqSM+D62vuramU2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76697745"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="76697745"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 04:18:54 -0700
X-CSE-ConnectionGUID: aYU9npOhSqKHtMI8sGQ1JQ==
X-CSE-MsgGUID: uA+RIvv9QqG0sHh3vqkWTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="232479157"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Apr 2026 04:18:52 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAQvp-000000001m9-3N6g;
	Wed, 08 Apr 2026 11:18:49 +0000
Date: Wed, 08 Apr 2026 19:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu 5/5]
 include/linux/minmax.h:77:36: error: first argument to
 '__builtin_choose_expr' not a constant
Message-ID: <202604081959.amwTQUIC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu
head:   1d014da25325b50bf0fa1c3c5d770145f15d8a24
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [5/5] UPSTREAM: block: add a rq_list type
config: arm-randconfig-r133-20260408 (https://download.01.org/0day-ci/archive/20260408/202604081959.amwTQUIC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604081959.amwTQUIC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604081959.amwTQUIC-lkp@intel.com/

All errors (new ones prefixed by >>):

    1699 |         struct rq_list req_list;
         |                        ^~~~~~~~
   In file included from <command-line>:
   drivers/mmc/host/mmci.c: In function 'mmci_probe':
   include/linux/compiler.h:166:45: error: '__UNIQUE_ID_y_409' undeclared (first use in this function); did you mean '__UNIQUE_ID_x_408'?
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:516:23: note: in definition of macro '__compiletime_assert'
     516 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:536:9: note: in expansion of macro '_compiletime_assert'
     536 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:56:27: note: in expansion of macro 'is_signed_type'
      56 | #define __sign_use(x,ux) (is_signed_type(typeof(ux))? \
         |                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
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
   include/linux/minmax.h:105:55: note: in expansion of macro '__UNIQUE_ID'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   include/linux/compiler.h:166:45: note: each undeclared identifier is reported only once for each function it appears in
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:516:23: note: in definition of macro '__compiletime_assert'
     516 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:536:9: note: in expansion of macro '_compiletime_assert'
     536 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:56:27: note: in expansion of macro 'is_signed_type'
      56 | #define __sign_use(x,ux) (is_signed_type(typeof(ux))? \
         |                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
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
   include/linux/minmax.h:105:55: note: in expansion of macro '__UNIQUE_ID'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
>> include/linux/minmax.h:77:36: error: first argument to '__builtin_choose_expr' not a constant
      77 |   #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:516:23: note: in definition of macro '__compiletime_assert'
     516 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:536:9: note: in expansion of macro '_compiletime_assert'
     536 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:79:44: note: in expansion of macro '__signed_type'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                                            ^~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
>> include/linux/minmax.h:77:36: error: first argument to '__builtin_choose_expr' not a constant
      77 |   #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:516:23: note: in definition of macro '__compiletime_assert'
     516 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:536:9: note: in expansion of macro '_compiletime_assert'
     536 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:79:44: note: in expansion of macro '__signed_type'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                                            ^~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   drivers/mmc/host/mmci.c: At top level:
   drivers/mmc/host/mmci.c:53:21: warning: 'fmax' defined but not used [-Wunused-variable]
      53 | static unsigned int fmax = 515633;
         |                     ^~~~


vim +/__builtin_choose_expr +77 include/linux/minmax.h

f747e6667ebb2f Rikard Falkeborn 2021-05-22   9  
b296a6d53339a7 Andy Shevchenko  2020-10-15  10  /*
b296a6d53339a7 Andy Shevchenko  2020-10-15  11   * min()/max()/clamp() macros must accomplish three things:
b296a6d53339a7 Andy Shevchenko  2020-10-15  12   *
867046cc702770 David Laight     2023-09-18  13   * - Avoid multiple evaluations of the arguments (so side-effects like
b296a6d53339a7 Andy Shevchenko  2020-10-15  14   *   "x++" happen only once) when non-constant.
867046cc702770 David Laight     2023-09-18  15   * - Retain result as a constant expressions when called with only
b296a6d53339a7 Andy Shevchenko  2020-10-15  16   *   constant expressions (to avoid tripping VLA warnings in stack
b296a6d53339a7 Andy Shevchenko  2020-10-15  17   *   allocation usage).
867046cc702770 David Laight     2023-09-18  18   * - Perform signed v unsigned type-checking (to generate compile
867046cc702770 David Laight     2023-09-18  19   *   errors instead of nasty runtime surprises).
867046cc702770 David Laight     2023-09-18  20   * - Unsigned char/short are always promoted to signed int and can be
867046cc702770 David Laight     2023-09-18  21   *   compared against signed or unsigned arguments.
867046cc702770 David Laight     2023-09-18  22   * - Unsigned arguments can be compared against non-negative signed constants.
867046cc702770 David Laight     2023-09-18  23   * - Comparison of a signed argument against an unsigned constant fails
867046cc702770 David Laight     2023-09-18  24   *   even if the constant is below __INT_MAX__ and could be cast to int.
b296a6d53339a7 Andy Shevchenko  2020-10-15  25   */
b296a6d53339a7 Andy Shevchenko  2020-10-15  26  #define __typecheck(x, y) \
b296a6d53339a7 Andy Shevchenko  2020-10-15  27  	(!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
b296a6d53339a7 Andy Shevchenko  2020-10-15  28  
22f5468731491e Linus Torvalds   2024-07-30  29  /*
22f5468731491e Linus Torvalds   2024-07-30  30   * __sign_use for integer expressions:
22f5468731491e Linus Torvalds   2024-07-30  31   *   bit #0 set if ok for unsigned comparisons
22f5468731491e Linus Torvalds   2024-07-30  32   *   bit #1 set if ok for signed comparisons
22f5468731491e Linus Torvalds   2024-07-30  33   *
22f5468731491e Linus Torvalds   2024-07-30  34   * In particular, statically non-negative signed integer
22f5468731491e Linus Torvalds   2024-07-30  35   * expressions are ok for both.
22f5468731491e Linus Torvalds   2024-07-30  36   *
22f5468731491e Linus Torvalds   2024-07-30  37   * NOTE! Unsigned types smaller than 'int' are implicitly
22f5468731491e Linus Torvalds   2024-07-30  38   * converted to 'int' in expressions, and are accepted for
22f5468731491e Linus Torvalds   2024-07-30  39   * signed conversions for now. This is debatable.
22f5468731491e Linus Torvalds   2024-07-30  40   *
22f5468731491e Linus Torvalds   2024-07-30  41   * Note that 'x' is the original expression, and 'ux' is
22f5468731491e Linus Torvalds   2024-07-30  42   * the unique variable that contains the value.
22f5468731491e Linus Torvalds   2024-07-30  43   *
22f5468731491e Linus Torvalds   2024-07-30  44   * We use 'ux' for pure type checking, and 'x' for when
22f5468731491e Linus Torvalds   2024-07-30  45   * we need to look at the value (but without evaluating
22f5468731491e Linus Torvalds   2024-07-30  46   * it for side effects! Careful to only ever evaluate it
22f5468731491e Linus Torvalds   2024-07-30  47   * with sizeof() or __builtin_constant_p() etc).
22f5468731491e Linus Torvalds   2024-07-30  48   *
22f5468731491e Linus Torvalds   2024-07-30  49   * Pointers end up being checked by the normal C type
22f5468731491e Linus Torvalds   2024-07-30  50   * rules at the actual comparison, and these expressions
22f5468731491e Linus Torvalds   2024-07-30  51   * only need to be careful to not cause warnings for
22f5468731491e Linus Torvalds   2024-07-30  52   * pointer use.
22f5468731491e Linus Torvalds   2024-07-30  53   */
22f5468731491e Linus Torvalds   2024-07-30  54  #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
22f5468731491e Linus Torvalds   2024-07-30  55  #define __unsigned_type_use(x,ux) (1+2*(sizeof(ux)<4))
22f5468731491e Linus Torvalds   2024-07-30  56  #define __sign_use(x,ux) (is_signed_type(typeof(ux))? \
22f5468731491e Linus Torvalds   2024-07-30  57  	__signed_type_use(x,ux):__unsigned_type_use(x,ux))
b296a6d53339a7 Andy Shevchenko  2020-10-15  58  
22f5468731491e Linus Torvalds   2024-07-30  59  /*
22f5468731491e Linus Torvalds   2024-07-30  60   * To avoid warnings about casting pointers to integers
22f5468731491e Linus Torvalds   2024-07-30  61   * of different sizes, we need that special sign type.
22f5468731491e Linus Torvalds   2024-07-30  62   *
22f5468731491e Linus Torvalds   2024-07-30  63   * On 64-bit we can just always use 'long', since any
22f5468731491e Linus Torvalds   2024-07-30  64   * integer or pointer type can just be cast to that.
22f5468731491e Linus Torvalds   2024-07-30  65   *
22f5468731491e Linus Torvalds   2024-07-30  66   * This does not work for 128-bit signed integers since
22f5468731491e Linus Torvalds   2024-07-30  67   * the cast would truncate them, but we do not use s128
22f5468731491e Linus Torvalds   2024-07-30  68   * types in the kernel (we do use 'u128', but they will
22f5468731491e Linus Torvalds   2024-07-30  69   * be handled by the !is_signed_type() case).
22f5468731491e Linus Torvalds   2024-07-30  70   *
22f5468731491e Linus Torvalds   2024-07-30  71   * NOTE! The cast is there only to avoid any warnings
22f5468731491e Linus Torvalds   2024-07-30  72   * from when values that aren't signed integer types.
22f5468731491e Linus Torvalds   2024-07-30  73   */
22f5468731491e Linus Torvalds   2024-07-30  74  #ifdef CONFIG_64BIT
22f5468731491e Linus Torvalds   2024-07-30  75    #define __signed_type(ux) long
22f5468731491e Linus Torvalds   2024-07-30  76  #else
22f5468731491e Linus Torvalds   2024-07-30 @77    #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
22f5468731491e Linus Torvalds   2024-07-30  78  #endif
22f5468731491e Linus Torvalds   2024-07-30  79  #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
867046cc702770 David Laight     2023-09-18  80  

:::::: The code at line 77 was first introduced by commit
:::::: 22f5468731491e53356ba7c028f0fdea20b18e2c minmax: improve macro expansion and type checking

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
