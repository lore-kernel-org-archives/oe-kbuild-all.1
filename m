Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB3B21D59A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 07:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742886328; cv=none; b=i7aK4jFLJVJ3ds6aKU9TbfyTXMJTMBo/cBqRTbrrlreiq2QUYLCiUxkl3tt6HhccYK2FYvy+wV5GuqRD95LYFoyIWeNBx13HFmIjk21ZgBtwnp+r/f06nm6w1gjtEduY4rIt9JaZYxuTojWCAloPPLRL9J/L/urdirc7i2MYGVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742886328; c=relaxed/simple;
	bh=FKzGesSt9CTy7KBQpPWZ3rdJDMWJZQCNINw0oeGstvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B8zAzUScootsLP91eNs0N0otW1vXPTx6ZlOYd296Lijq6xEJWcl7VMhzO3TfNxRFqFLYFGCpI6zrZzcAwry0H6ybj7kxl+SGoatmq2dzENHoq48bBtgJAEYHp8FNpJempBZjQvR3vghoobumL2S20qtc+pzRt/RSi2AYRz3Ie5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZ+1iHmz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZ+1iHmz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742886327; x=1774422327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKzGesSt9CTy7KBQpPWZ3rdJDMWJZQCNINw0oeGstvw=;
  b=bZ+1iHmzRCULErvcs4j8H4WiH2k+asbQO8Dvcv41zm/e4Ffeet4hhqq6
   zO3o2dvACHykUk48SMdq+99S9ZNiBHDtrXNxCGKW/VOvSMK/xFX5WMuUS
   ooBw3SppDXSgNb+hiYPO2y4N957c/Qq1sQCXvIAhc83P/sPB5Wzo9DoeS
   EKgTefXutorOXNMwBX8Cxyzrxd0+TinqE2ohBtlFNghNtvYmpV5OsEJoL
   vcdX4B6pQugwFJer9rJQfUMagamRp8a5zPXBn0aGVmHA5mRx2j/cnu2F2
   OREcQVulxZbbHVo7W7xtebtKcv1uhUEzVsRmqjOKGt5yYJcye9YpMt9hQ
   w==;
X-CSE-ConnectionGUID: UPiG5jpMSrC+a+AcTSxFYw==
X-CSE-MsgGUID: OyEbefVCRQqtgIwOvQHQYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47773206"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="47773206"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 00:05:20 -0700
X-CSE-ConnectionGUID: Kxd/dhPDSiqgqxGCkQ/HZA==
X-CSE-MsgGUID: O/G5fGsIRH25DRhFviHniA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="124245395"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Mar 2025 00:05:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twyLb-0004BT-24;
	Tue, 25 Mar 2025 07:05:15 +0000
Date: Tue, 25 Mar 2025 15:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-11 1/1]
 include/linux/minmax.h:31:9: error: first argument to
 '__builtin_choose_expr' not a constant
Message-ID: <202503251516.quownxI0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-11
head:   eb7237b308a8c43293c2ce5cdef6ae9d863ed0ec
commit: 29065cd47eb2d66bc0db421530de7e4876f77d09 [1/1] ANDROID: fix ABI-break in struct cgroup_root
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20250325/202503251516.quownxI0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251516.quownxI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251516.quownxI0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/timer.h:10,
                    from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:19,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/mmc/host/mmci.c:8:
   include/linux/android_kabi.h:43:17: error: static assertion failed: "include/linux/cgroup-defs.h:588: struct callback_head rcu is larger than u8 __attribute__((__aligned__(8))) android_backport_reserved1[CGROUP_SUBSYS_COUNT * sizeof(atomic_t)]"
      43 |                 _Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}), \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:67:17: note: in expansion of macro '__ANDROID_KABI_CHECK_SIZE_ALIGN'
      67 |                 __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new);   \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:157:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     157 |         _ANDROID_KABI_REPLACE(_ANDROID_BACKPORT_RESERVE_ARRAY(number, bytes), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cgroup-defs.h:588:9: note: in expansion of macro 'ANDROID_BACKPORT_USE_ARRAY'
     588 |         ANDROID_BACKPORT_USE_ARRAY(1, CGROUP_SUBSYS_COUNT * sizeof(atomic_t),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12:
   drivers/mmc/host/mmci.c: In function 'mmci_probe':
>> include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
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
>> include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
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
>> include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
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
   include/linux/minmax.h:39:9: error: expression in static assertion is not an integer
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


vim +/__builtin_choose_expr +31 include/linux/minmax.h

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
204c653d5d0c79 David Laight     2023-09-18 @31  	__builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),	\
204c653d5d0c79 David Laight     2023-09-18  32  		is_signed_type(typeof(x)), 0)
b296a6d53339a7 Andy Shevchenko  2020-10-15  33  

:::::: The code at line 31 was first introduced by commit
:::::: 204c653d5d0c79940474c0a37c2c0c12f964d7de minmax: allow min()/max()/clamp() if the arguments have the same signedness.

:::::: TO: David Laight <David.Laight@ACULAB.COM>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
