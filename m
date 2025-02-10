Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F3B249F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739230420; cv=none; b=QwRzcNLJkCn3rAETFKZly3hydSVCHiwZmww0PBbf9h9Zvm2gVmnRT6LjZGEwxJeM8AZy7PJR0VezqHts6z3awYz2fwUVC1Soh9G/Xs6k/ni21Fy6nW1Hp/9MiaHB7ZyiGTBvvFDawSqUv8bmfbyVjzgFml+xW4bkPiq8Ig/OYzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739230420; c=relaxed/simple;
	bh=JoQAxywug7zQdWCQXJxb/5HPdQdCSqgjxle74aHdsNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HCPZmuJZUCKMN3DfvAS7FTmmW36/A43a7wL59vBn1zbT0tVerafc8mBBObBpujjOKUPQIvwyuwNFYca5IyPOa+64i+7wJGE9aOLRZY0jMmRSfsXDDXmisCMNAV6rD9335cB3vWElTfLjvOtgijUQJi/cyqKWAPIOlgQyt0wHRxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3D7vES4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3D7vES4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739230418; x=1770766418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JoQAxywug7zQdWCQXJxb/5HPdQdCSqgjxle74aHdsNA=;
  b=N3D7vES4oJ3j7fFRmiGc1LJ3RFMWlm/8ZeDpF7d/kkAWMArHBIyz+f1U
   mgZyGFiGJ9vyjm4TXIlZtnO4wAtHX2w9jRltTH/1k+ApyYaWWLKvKRFHI
   kmApK6/1AoVG/72lNNZIcLovwgBrvPdDFv5A/uPb0fcO1CqE8O4DWE6cQ
   +llCE0EmxQemjbdVdznrsYWyppk/lZ+KHMnQH/ZDCtXt+5NFcrmS+dwu9
   Ebzl8v4MmZxh7GmkKXlmcocI0OHWlL5LkEl1NxzyvgObSfHqY6dMXJLCO
   EOhDxIffXMT+sT3KMm8Hp1HTh1L4oRM9fbi83cAaHhl0BSzHRaEBK5Nk0
   Q==;
X-CSE-ConnectionGUID: kDHXMfpmRA+2lb3Per3pFg==
X-CSE-MsgGUID: 8mS46O8KR9Snm4nVHsAzgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39853920"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39853920"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 15:33:37 -0800
X-CSE-ConnectionGUID: jzUmfrD4Ttm8puOqPveCoQ==
X-CSE-MsgGUID: 2b17uBZkSViUWm+DmXU21w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112790735"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2025 15:33:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thdHR-0013WP-1X;
	Mon, 10 Feb 2025 23:33:33 +0000
Date: Tue, 11 Feb 2025 07:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-11 1/1]
 include/linux/minmax.h:39:9: error: expression in static assertion is not an
 integer
Message-ID: <202502110705.MPqSV3N8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-11
head:   88c87bc8134f915dd93a3fdc54afc8e42c5ca4aa
commit: 29065cd47eb2d66bc0db421530de7e4876f77d09 [1/1] ANDROID: fix ABI-break in struct cgroup_root
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20250211/202502110705.MPqSV3N8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110705.MPqSV3N8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110705.MPqSV3N8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/mmci.c: In function 'mmci_probe':
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:39:28: note: in expansion of macro '__is_signed'
      39 |         (__is_signed(x) == __is_signed(y) ||                    \
         |                            ^~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2277:40: note: in expansion of macro 'min'
    2277 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:40:41: note: in expansion of macro '__is_signed'
      40 |                 __is_signed((x) + 0) == __is_signed((y) + 0) || \
         |                                         ^~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2277:40: note: in expansion of macro 'min'
    2277 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:36:53: note: in expansion of macro '__is_signed'
      36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
         |                                                     ^~~~~~~~~~~
   include/linux/minmax.h:41:38: note: in expansion of macro '__is_noneg_int'
      41 |                 __is_noneg_int(x) || __is_noneg_int(y))
         |                                      ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2277:40: note: in expansion of macro 'min'
    2277 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   include/linux/minmax.h:36:10: error: first argument to '__builtin_choose_expr' not a constant
      36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:41:38: note: in expansion of macro '__is_noneg_int'
      41 |                 __is_noneg_int(x) || __is_noneg_int(y))
         |                                      ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2277:40: note: in expansion of macro 'min'
    2277 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
>> include/linux/minmax.h:39:9: error: expression in static assertion is not an integer
      39 |         (__is_signed(x) == __is_signed(y) ||                    \
         |         ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2277:40: note: in expansion of macro 'min'
    2277 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   In file included from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5:
   include/linux/minmax.h:56:9: error: first argument to '__builtin_choose_expr' not a constant
      56 |         __builtin_choose_expr(__is_constexpr((x) - (y)),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2277:40: note: in expansion of macro 'min'
    2277 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   drivers/mmc/host/mmci.c: At top level:
   drivers/mmc/host/mmci.c:53:21: warning: 'fmax' defined but not used [-Wunused-variable]
      53 | static unsigned int fmax = 515633;
         |                     ^~~~


vim +39 include/linux/minmax.h

f747e6667ebb2f Rikard Falkeborn 2021-05-22   9  
b296a6d53339a7 Andy Shevchenko  2020-10-15  10  /*
b296a6d53339a7 Andy Shevchenko  2020-10-15  11   * min()/max()/clamp() macros must accomplish three things:
b296a6d53339a7 Andy Shevchenko  2020-10-15  12   *
9487d93f172ace David Laight     2023-09-18  13   * - Avoid multiple evaluations of the arguments (so side-effects like
b296a6d53339a7 Andy Shevchenko  2020-10-15  14   *   "x++" happen only once) when non-constant.
9487d93f172ace David Laight     2023-09-18  15   * - Retain result as a constant expressions when called with only
b296a6d53339a7 Andy Shevchenko  2020-10-15  16   *   constant expressions (to avoid tripping VLA warnings in stack
b296a6d53339a7 Andy Shevchenko  2020-10-15  17   *   allocation usage).
9487d93f172ace David Laight     2023-09-18  18   * - Perform signed v unsigned type-checking (to generate compile
9487d93f172ace David Laight     2023-09-18  19   *   errors instead of nasty runtime surprises).
9487d93f172ace David Laight     2023-09-18  20   * - Unsigned char/short are always promoted to signed int and can be
9487d93f172ace David Laight     2023-09-18  21   *   compared against signed or unsigned arguments.
9487d93f172ace David Laight     2023-09-18  22   * - Unsigned arguments can be compared against non-negative signed constants.
9487d93f172ace David Laight     2023-09-18  23   * - Comparison of a signed argument against an unsigned constant fails
9487d93f172ace David Laight     2023-09-18  24   *   even if the constant is below __INT_MAX__ and could be cast to int.
b296a6d53339a7 Andy Shevchenko  2020-10-15  25   */
b296a6d53339a7 Andy Shevchenko  2020-10-15  26  #define __typecheck(x, y) \
b296a6d53339a7 Andy Shevchenko  2020-10-15  27  	(!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
b296a6d53339a7 Andy Shevchenko  2020-10-15  28  
204c653d5d0c79 David Laight     2023-09-18  29  /* is_signed_type() isn't a constexpr for pointer types */
204c653d5d0c79 David Laight     2023-09-18  30  #define __is_signed(x) 								\
204c653d5d0c79 David Laight     2023-09-18  31  	__builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),	\
204c653d5d0c79 David Laight     2023-09-18  32  		is_signed_type(typeof(x)), 0)
b296a6d53339a7 Andy Shevchenko  2020-10-15  33  
9487d93f172ace David Laight     2023-09-18  34  /* True for a non-negative signed int constant */
9487d93f172ace David Laight     2023-09-18  35  #define __is_noneg_int(x)	\
9487d93f172ace David Laight     2023-09-18  36  	(__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
9487d93f172ace David Laight     2023-09-18  37  
204c653d5d0c79 David Laight     2023-09-18  38  #define __types_ok(x, y) 					\
701405f53d1bda David Laight     2023-09-18 @39  	(__is_signed(x) == __is_signed(y) ||			\
9487d93f172ace David Laight     2023-09-18  40  		__is_signed((x) + 0) == __is_signed((y) + 0) ||	\
9487d93f172ace David Laight     2023-09-18  41  		__is_noneg_int(x) || __is_noneg_int(y))
b296a6d53339a7 Andy Shevchenko  2020-10-15  42  

:::::: The code at line 39 was first introduced by commit
:::::: 701405f53d1bda636edf0dc49ab4569e6dde210e minmax: allow comparisons of 'int' against 'unsigned char/short'

:::::: TO: David Laight <David.Laight@ACULAB.COM>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
