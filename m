Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A392772D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 03:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778902998; cv=none; b=Nj1b3wycWbr/EL+bwARgJE+dxK1gZ8RKZcpNh+FAodbmgjBAggYQYQgwWlkAINPsrzOX0ESadJTO5UAzgdLAP6Ftbqrlmwn2maYLL1iBqvOlJur6PyoKHzpzppOWI5roaAyMrBvy11MJKrNXsYydXXjeLbk54bcHPEsJRoIqmP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778902998; c=relaxed/simple;
	bh=IVtVnQMQvNczSS3hhD7kL5CbDOAJAZwKCbm1EGtXdMY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l1ffK6GtWDkoRPzDFxDiVEudnuvWmtVJDpi4LjwkWIPhZnoPiA1E2CAbqcr9Lzq2Gp2Yx7itM7KW9oRzogCAJGSoGDorN3/qvQNEDRZK7UiU7j2v6Lg2Dn2ah7w3oS/8Q9KLGJeFvAHxaM3L6RRoWDES7zeO8oSuUh6yI6mI7DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P07T56Ai; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P07T56Ai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778902996; x=1810438996;
  h=date:from:to:cc:subject:message-id;
  bh=IVtVnQMQvNczSS3hhD7kL5CbDOAJAZwKCbm1EGtXdMY=;
  b=P07T56Ai9ka4D8PyHoxIPVrRP7EXLBBCb95qisypOWfVn0zI2iEs1sTq
   pHVtcicQ8f7Nv1P1g32nZkXIhBxDItygtgY/1QqObMCiQHN0QwEcQ27LJ
   54eg1WE48IMlnEw1faXmeIeYOJyxRmAVgpHsWg+xv4OUvy2Uq2I2NscGh
   trSX4z2d+DZUkb+N9yGYqkNl8rl7xejUWKWnf7EzK/bo9q/qxJrt2hcvx
   dVRNXvn0wDYEHM9bU/vIFEz2m/ink4craQ6SkXu1QMKGS6c0j8v2GtcIJ
   xUUB3x32Qa4ZZw6gXfYy6aEzZrRiluldMp0hck8l/LsrFMfilH140KN5L
   A==;
X-CSE-ConnectionGUID: QKwZdLxKQ82Kc4H3PDIYwg==
X-CSE-MsgGUID: mM4Q+ATQRRaXroaDMNt0ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79886295"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="79886295"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 20:43:16 -0700
X-CSE-ConnectionGUID: FZCgU5/aTz+wW3pvRR5x+Q==
X-CSE-MsgGUID: saiD7c6dTUGNRC6zxh4z4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="276974694"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 May 2026 20:43:13 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO5vj-000000000RL-1dcu;
	Sat, 16 May 2026 03:43:11 +0000
Date: Sat, 16 May 2026 11:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-sp 1/1]
 include/linux/minmax.h:77:36: error: first argument to
 '__builtin_choose_expr' not a constant
Message-ID: <202605161123.oAzHuxKe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-sp
head:   f815f5cffc922b8894200a0522dcb04211c469ec
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [1/1] UPSTREAM: block: add a rq_list type
config: arm-randconfig-001-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161123.oAzHuxKe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161123.oAzHuxKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161123.oAzHuxKe-lkp@intel.com/

All errors (new ones prefixed by >>):

    1699 |         struct rq_list req_list;
         |                        ^~~~~~~~
   In file included from <command-line>:
   drivers/mmc/host/mmci.c: In function 'mmci_probe':
   include/linux/compiler.h:166:45: error: '__UNIQUE_ID_y_338' undeclared (first use in this function); did you mean '__UNIQUE_ID_x_337'?
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/__builtin_choose_expr +77 include/linux/minmax.h

f747e6667ebb2ff Rikard Falkeborn 2021-05-22   9  
b296a6d53339a79 Andy Shevchenko  2020-10-15  10  /*
b296a6d53339a79 Andy Shevchenko  2020-10-15  11   * min()/max()/clamp() macros must accomplish three things:
b296a6d53339a79 Andy Shevchenko  2020-10-15  12   *
867046cc7027703 David Laight     2023-09-18  13   * - Avoid multiple evaluations of the arguments (so side-effects like
b296a6d53339a79 Andy Shevchenko  2020-10-15  14   *   "x++" happen only once) when non-constant.
867046cc7027703 David Laight     2023-09-18  15   * - Retain result as a constant expressions when called with only
b296a6d53339a79 Andy Shevchenko  2020-10-15  16   *   constant expressions (to avoid tripping VLA warnings in stack
b296a6d53339a79 Andy Shevchenko  2020-10-15  17   *   allocation usage).
867046cc7027703 David Laight     2023-09-18  18   * - Perform signed v unsigned type-checking (to generate compile
867046cc7027703 David Laight     2023-09-18  19   *   errors instead of nasty runtime surprises).
867046cc7027703 David Laight     2023-09-18  20   * - Unsigned char/short are always promoted to signed int and can be
867046cc7027703 David Laight     2023-09-18  21   *   compared against signed or unsigned arguments.
867046cc7027703 David Laight     2023-09-18  22   * - Unsigned arguments can be compared against non-negative signed constants.
867046cc7027703 David Laight     2023-09-18  23   * - Comparison of a signed argument against an unsigned constant fails
867046cc7027703 David Laight     2023-09-18  24   *   even if the constant is below __INT_MAX__ and could be cast to int.
b296a6d53339a79 Andy Shevchenko  2020-10-15  25   */
b296a6d53339a79 Andy Shevchenko  2020-10-15  26  #define __typecheck(x, y) \
b296a6d53339a79 Andy Shevchenko  2020-10-15  27  	(!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
b296a6d53339a79 Andy Shevchenko  2020-10-15  28  
22f5468731491e5 Linus Torvalds   2024-07-30  29  /*
22f5468731491e5 Linus Torvalds   2024-07-30  30   * __sign_use for integer expressions:
22f5468731491e5 Linus Torvalds   2024-07-30  31   *   bit #0 set if ok for unsigned comparisons
22f5468731491e5 Linus Torvalds   2024-07-30  32   *   bit #1 set if ok for signed comparisons
22f5468731491e5 Linus Torvalds   2024-07-30  33   *
22f5468731491e5 Linus Torvalds   2024-07-30  34   * In particular, statically non-negative signed integer
22f5468731491e5 Linus Torvalds   2024-07-30  35   * expressions are ok for both.
22f5468731491e5 Linus Torvalds   2024-07-30  36   *
22f5468731491e5 Linus Torvalds   2024-07-30  37   * NOTE! Unsigned types smaller than 'int' are implicitly
22f5468731491e5 Linus Torvalds   2024-07-30  38   * converted to 'int' in expressions, and are accepted for
22f5468731491e5 Linus Torvalds   2024-07-30  39   * signed conversions for now. This is debatable.
22f5468731491e5 Linus Torvalds   2024-07-30  40   *
22f5468731491e5 Linus Torvalds   2024-07-30  41   * Note that 'x' is the original expression, and 'ux' is
22f5468731491e5 Linus Torvalds   2024-07-30  42   * the unique variable that contains the value.
22f5468731491e5 Linus Torvalds   2024-07-30  43   *
22f5468731491e5 Linus Torvalds   2024-07-30  44   * We use 'ux' for pure type checking, and 'x' for when
22f5468731491e5 Linus Torvalds   2024-07-30  45   * we need to look at the value (but without evaluating
22f5468731491e5 Linus Torvalds   2024-07-30  46   * it for side effects! Careful to only ever evaluate it
22f5468731491e5 Linus Torvalds   2024-07-30  47   * with sizeof() or __builtin_constant_p() etc).
22f5468731491e5 Linus Torvalds   2024-07-30  48   *
22f5468731491e5 Linus Torvalds   2024-07-30  49   * Pointers end up being checked by the normal C type
22f5468731491e5 Linus Torvalds   2024-07-30  50   * rules at the actual comparison, and these expressions
22f5468731491e5 Linus Torvalds   2024-07-30  51   * only need to be careful to not cause warnings for
22f5468731491e5 Linus Torvalds   2024-07-30  52   * pointer use.
22f5468731491e5 Linus Torvalds   2024-07-30  53   */
22f5468731491e5 Linus Torvalds   2024-07-30  54  #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
22f5468731491e5 Linus Torvalds   2024-07-30  55  #define __unsigned_type_use(x,ux) (1+2*(sizeof(ux)<4))
22f5468731491e5 Linus Torvalds   2024-07-30  56  #define __sign_use(x,ux) (is_signed_type(typeof(ux))? \
22f5468731491e5 Linus Torvalds   2024-07-30  57  	__signed_type_use(x,ux):__unsigned_type_use(x,ux))
b296a6d53339a79 Andy Shevchenko  2020-10-15  58  
22f5468731491e5 Linus Torvalds   2024-07-30  59  /*
22f5468731491e5 Linus Torvalds   2024-07-30  60   * To avoid warnings about casting pointers to integers
22f5468731491e5 Linus Torvalds   2024-07-30  61   * of different sizes, we need that special sign type.
22f5468731491e5 Linus Torvalds   2024-07-30  62   *
22f5468731491e5 Linus Torvalds   2024-07-30  63   * On 64-bit we can just always use 'long', since any
22f5468731491e5 Linus Torvalds   2024-07-30  64   * integer or pointer type can just be cast to that.
22f5468731491e5 Linus Torvalds   2024-07-30  65   *
22f5468731491e5 Linus Torvalds   2024-07-30  66   * This does not work for 128-bit signed integers since
22f5468731491e5 Linus Torvalds   2024-07-30  67   * the cast would truncate them, but we do not use s128
22f5468731491e5 Linus Torvalds   2024-07-30  68   * types in the kernel (we do use 'u128', but they will
22f5468731491e5 Linus Torvalds   2024-07-30  69   * be handled by the !is_signed_type() case).
22f5468731491e5 Linus Torvalds   2024-07-30  70   *
22f5468731491e5 Linus Torvalds   2024-07-30  71   * NOTE! The cast is there only to avoid any warnings
22f5468731491e5 Linus Torvalds   2024-07-30  72   * from when values that aren't signed integer types.
22f5468731491e5 Linus Torvalds   2024-07-30  73   */
22f5468731491e5 Linus Torvalds   2024-07-30  74  #ifdef CONFIG_64BIT
22f5468731491e5 Linus Torvalds   2024-07-30  75    #define __signed_type(ux) long
22f5468731491e5 Linus Torvalds   2024-07-30  76  #else
22f5468731491e5 Linus Torvalds   2024-07-30 @77    #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
22f5468731491e5 Linus Torvalds   2024-07-30  78  #endif
22f5468731491e5 Linus Torvalds   2024-07-30  79  #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
867046cc7027703 David Laight     2023-09-18  80  

:::::: The code at line 77 was first introduced by commit
:::::: 22f5468731491e53356ba7c028f0fdea20b18e2c minmax: improve macro expansion and type checking

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
