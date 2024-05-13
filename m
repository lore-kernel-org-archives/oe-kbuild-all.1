Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2558F2940B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 17:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715622770; cv=none; b=cAv0pIG0befw7ZgJ0iLK3Cg8GWdlyBVDHlq/fV/6/ukslR7WQaf/zHdCZeEjHW/8lsfG7kpan+8mDNtRhdGy2cOIzGF7QVgkN4l6ZeBmfRsVOHPqnUWLG4FOwwOX/xtBJYL72YpwNBGRUvpTacE1iZbD+V3dl6ZfsdkUIhOFbxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715622770; c=relaxed/simple;
	bh=tpAkABO3yseA6ZU3g+P632ucAvZuWHq4u7Pzx3N1sNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XemGBDsiIf01zN0NbhLA8OT7znNJ8DVEU47SlabTO7a0ANr6ChBUaX33il6T0nlbb6tKfDf2RQnu4EMWCrAuRbx3gsqEpa9iuvHWQSFH5zBLCDqN5uuG1dc9qjPPzjB3mk1DRFyq3YLIkUhNDnx1Tv5zzPYdgkZ/olH6tdjlA80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDrKJSUr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDrKJSUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715622767; x=1747158767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tpAkABO3yseA6ZU3g+P632ucAvZuWHq4u7Pzx3N1sNA=;
  b=MDrKJSUr/MeqIxpJyz14VeK0XOIMdeDjWOFNdvLLUEONyxdSJXRe2UDy
   joJPi33F4rJoqi9fDtlS0lCYzZpVatDQzpTZAJrxhzweTzwm/6dEmLL2x
   qoTQwIsFCuKdqZc0qfub0mhCKtVWxeBg/5ZLbQdt2wA+uWnfIk2zMTwpU
   T4keCQWiHabSWTwuOWHia4WzB3dBfbNPjd9E0aE7vJsO5q3pnwddO/EBA
   En3kWpsvjepXi2w4ASvxKfhnGYwcjKafufevtdxrPXSx856MOYqHkisz8
   Pyvmrn/CnBuRvaS0LXJRfftlGFd+O1+2ujTQz6YFnw77L09ittTz5iird
   Q==;
X-CSE-ConnectionGUID: vmeJRazoSWiWUlW2/OBqyw==
X-CSE-MsgGUID: 49IZNohtSSyd4ZKhn9obpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11518123"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11518123"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 10:52:47 -0700
X-CSE-ConnectionGUID: JiQsVyhWRayW1wkx2K5JHA==
X-CSE-MsgGUID: XUf3GjmLQt+YSJxTNHtQSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="61587756"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 May 2024 10:52:44 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6Zqt-000AVD-0E;
	Mon, 13 May 2024 17:52:43 +0000
Date: Tue, 14 May 2024 01:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 31/33] mm/damon/acma.c:55:14: error: 'min_mem'
 undeclared; did you mean 'min_mem_kb'?
Message-ID: <202405140138.rToa7zPl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   8babfaa14bfc8f45e2c3d093952ab737fd0db1d5
commit: 9e366602d1dd2158af19792fb7f53364545b60a1 [31/33] mm/damon/acma: implement scale down feature
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240514/202405140138.rToa7zPl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405140138.rToa7zPl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405140138.rToa7zPl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:22,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/damon.h:11,
                    from mm/damon/acma.c:16:
   mm/damon/acma.c: In function '__check_min_mem':
>> mm/damon/acma.c:55:14: error: 'min_mem' undeclared (first use in this function); did you mean 'min_mem_kb'?
      55 | module_param(min_mem, ulong, 0600);
         |              ^~~~~~~
   include/linux/moduleparam.h:413:75: note: in definition of macro '__param_check'
     413 |         static inline type __always_unused *__check_##name(void) { return(p); }
         |                                                                           ^
   include/linux/moduleparam.h:150:9: note: in expansion of macro 'param_check_ulong'
     150 |         param_check_##type(name, &(value));                                \
         |         ^~~~~~~~~~~~
   include/linux/moduleparam.h:127:9: note: in expansion of macro 'module_param_named'
     127 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~
   mm/damon/acma.c:55:1: note: in expansion of macro 'module_param'
      55 | module_param(min_mem, ulong, 0600);
         | ^~~~~~~~~~~~
   mm/damon/acma.c:55:14: note: each undeclared identifier is reported only once for each function it appears in
      55 | module_param(min_mem, ulong, 0600);
         |              ^~~~~~~
   include/linux/moduleparam.h:413:75: note: in definition of macro '__param_check'
     413 |         static inline type __always_unused *__check_##name(void) { return(p); }
         |                                                                           ^
   include/linux/moduleparam.h:150:9: note: in expansion of macro 'param_check_ulong'
     150 |         param_check_##type(name, &(value));                                \
         |         ^~~~~~~~~~~~
   include/linux/moduleparam.h:127:9: note: in expansion of macro 'module_param_named'
     127 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~
   mm/damon/acma.c:55:1: note: in expansion of macro 'module_param'
      55 | module_param(min_mem, ulong, 0600);
         | ^~~~~~~~~~~~
   mm/damon/acma.c: At top level:
>> mm/damon/acma.c:55:14: error: 'min_mem' undeclared here (not in a function); did you mean 'min_mem_kb'?
      55 | module_param(min_mem, ulong, 0600);
         |              ^~~~~~~
   include/linux/moduleparam.h:294:61: note: in definition of macro '__module_param_call'
     294 |             VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
         |                                                             ^~~
   include/linux/moduleparam.h:151:9: note: in expansion of macro 'module_param_cb'
     151 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |         ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:127:9: note: in expansion of macro 'module_param_named'
     127 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~
   mm/damon/acma.c:55:1: note: in expansion of macro 'module_param'
      55 | module_param(min_mem, ulong, 0600);
         | ^~~~~~~~~~~~
   mm/damon/acma.c: In function 'damon_acma_new_scheme':
   mm/damon/acma.c:170:16: error: too few arguments to function 'damon_new_scheme'
     170 |         return damon_new_scheme(
         |                ^~~~~~~~~~~~~~~~
   include/linux/damon.h:770:15: note: declared here
     770 | struct damos *damon_new_scheme(struct damos_access_pattern *pattern,
         |               ^~~~~~~~~~~~~~~~
   mm/damon/acma.c: At top level:
   mm/damon/acma.c:193:17: error: unknown type name 'damos_quota_goal_metric'
     193 |                 damos_quota_goal_metric goal_metric)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/acma.c: In function 'damon_acma_set_scale_down_region_filter':
>> mm/damon/acma.c:233:59: error: 'KB' undeclared (first use in this function)
     233 |         start_limit = monitor_region_start + min_mem_kb * KB;
         |                                                           ^~
>> mm/damon/acma.c:208:32: error: 'MB' undeclared (first use in this function); did you mean 'mb'?
     208 | #define SCALE_WINDOW    (128 * MB)
         |                                ^~
   mm/damon/acma.c:236:52: note: in expansion of macro 'SCALE_WINDOW'
     236 |         for (end = end_limit; end >= start_limit + SCALE_WINDOW;
         |                                                    ^~~~~~~~~~~~
>> mm/damon/acma.c:238:21: error: implicit declaration of function 'damon_alloced_bytes' [-Werror=implicit-function-declaration]
     238 |                 if (damon_alloced_bytes(end, end - SCALE_WINDOW)
         |                     ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/cgroup.h:12,
                    from include/linux/memcontrol.h:13:
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
   include/linux/minmax.h:92:25: note: in expansion of macro '__careful_cmp'
      92 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   mm/damon/acma.c:242:36: note: in expansion of macro 'max'
     242 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
         |                                    ^~~
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
   include/linux/minmax.h:92:25: note: in expansion of macro '__careful_cmp'
      92 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   mm/damon/acma.c:242:36: note: in expansion of macro 'max'
     242 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
         |                                    ^~~
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
   include/linux/minmax.h:92:25: note: in expansion of macro '__careful_cmp'
      92 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   mm/damon/acma.c:242:36: note: in expansion of macro 'max'
     242 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
         |                                    ^~~
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
   include/linux/minmax.h:92:25: note: in expansion of macro '__careful_cmp'
      92 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   mm/damon/acma.c:242:36: note: in expansion of macro 'max'
     242 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
         |                                    ^~~
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
   include/linux/minmax.h:92:25: note: in expansion of macro '__careful_cmp'
      92 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   mm/damon/acma.c:242:36: note: in expansion of macro 'max'
     242 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
         |                                    ^~~
   In file included from include/linux/kernel.h:28,
                    from include/linux/cpumask.h:11,
                    from include/linux/sched.h:16:
   include/linux/minmax.h:56:9: error: first argument to '__builtin_choose_expr' not a constant
      56 |         __builtin_choose_expr(__is_constexpr((x) - (y)),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:92:25: note: in expansion of macro '__careful_cmp'
      92 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   mm/damon/acma.c:242:36: note: in expansion of macro 'max'
     242 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
         |                                    ^~~
   mm/damon/acma.c: In function 'damon_acma_alloc_callback':
>> mm/damon/acma.c:256:16: error: implicit declaration of function 'page_report'; did you mean 'PageReported'? [-Werror=implicit-function-declaration]
     256 |         return page_report(PHYS_PFN(addr), 1 << scale_pg_order);
         |                ^~~~~~~~~~~
         |                PageReported
   In file included from include/asm-generic/memory_model.h:5,
                    from arch/alpha/include/asm/page.h:89,
                    from include/linux/shm.h:6,
                    from include/linux/sched.h:23:
>> mm/damon/acma.c:256:37: error: 'addr' undeclared (first use in this function)
     256 |         return page_report(PHYS_PFN(addr), 1 << scale_pg_order);
         |                                     ^~~~
   include/linux/pfn.h:22:43: note: in definition of macro 'PHYS_PFN'
      22 | #define PHYS_PFN(x)     ((unsigned long)((x) >> PAGE_SHIFT))
         |                                           ^
   mm/damon/acma.c: In function 'damon_acma_new_reclaim_scheme':
   mm/damon/acma.c:272:15: error: implicit declaration of function 'damon_acma_set_scheme_quota'; did you mean 'damon_acma_new_scheme'? [-Werror=implicit-function-declaration]
     272 |         err = damon_acma_set_scheme_quota(scheme, old,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               damon_acma_new_scheme
   mm/damon/acma.c: In function 'damon_acma_new_scale_down_scheme':
>> mm/damon/acma.c:290:50: error: 'DAMOS_ALLOC' undeclared (first use in this function)
     290 |         scheme = damon_acma_new_scheme(&pattern, DAMOS_ALLOC);
         |                                                  ^~~~~~~~~~~
>> mm/damon/acma.c:300:15: error: 'struct damos' has no member named 'alloc_order'
     300 |         scheme->alloc_order = scale_pg_order;
         |               ^~
>> mm/damon/acma.c:301:15: error: 'struct damos' has no member named 'alloc_callback'
     301 |         scheme->alloc_callback = damon_acma_alloc_callback;
         |               ^~
>> mm/damon/acma.c:302:55: error: 'scale_down_scheme' undeclared (first use in this function)
     302 |         err = damon_acma_set_scale_down_region_filter(scale_down_scheme);
         |                                                       ^~~~~~~~~~~~~~~~~
   mm/damon/acma.c: In function 'damon_acma_apply_parameters':
   mm/damon/acma.c:315:34: warning: unused variable 'goal' [-Wunused-variable]
     315 |         struct damos_quota_goal *goal;
         |                                  ^~~~
   mm/damon/acma.c: In function 'damon_acma_after_aggregation':
   mm/damon/acma.c:425:22: error: 'DAMOS_LRU_RECLAIM' undeclared (first use in this function); did you mean 'DAMOS_LRU_DEPRIO'?
     425 |                 case DAMOS_LRU_RECLAIM:
         |                      ^~~~~~~~~~~~~~~~~
         |                      DAMOS_LRU_DEPRIO
   mm/damon/acma.c:428:22: error: 'DAMOS_ALLOC' undeclared (first use in this function)
     428 |                 case DAMOS_ALLOC:
         |                      ^~~~~~~~~~~
   mm/damon/acma.c:438:12: error: invalid storage class for function 'damon_acma_after_wmarks_check'
     438 | static int damon_acma_after_wmarks_check(struct damon_ctx *c)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/acma.c:443:19: error: invalid storage class for function 'damon_acma_init'
     443 | static int __init damon_acma_init(void)
         |                   ^~~~~~~~~~~~~~~
   mm/damon/acma.c:460:13: error: initializer element is not constant
     460 | module_init(damon_acma_init);
         |             ^~~~~~~~~~~~~~~
   include/linux/init.h:270:55: note: in definition of macro '____define_initcall'
     270 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:280:9: note: in expansion of macro '__unique_initcall'
     280 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
     282 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:311:41: note: in expansion of macro '__define_initcall'
     311 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:316:24: note: in expansion of macro 'device_initcall'
     316 | #define __initcall(fn) device_initcall(fn)
         |                        ^~~~~~~~~~~~~~~
   include/linux/module.h:88:25: note: in expansion of macro '__initcall'
      88 | #define module_init(x)  __initcall(x);
         |                         ^~~~~~~~~~
   mm/damon/acma.c:460:1: note: in expansion of macro 'module_init'
     460 | module_init(damon_acma_init);
         | ^~~~~~~~~~~
   mm/damon/acma.c:460:1: error: expected declaration or statement at end of input
   mm/damon/acma.c: In function 'damon_acma_new_scheme':
   mm/damon/acma.c:179:1: warning: control reaches end of non-void function [-Wreturn-type]
     179 | }
         | ^
   mm/damon/acma.c: At top level:
   mm/damon/acma.c:181:13: warning: 'damon_acma_copy_quota_status' defined but not used [-Wunused-function]
     181 | static void damon_acma_copy_quota_status(struct damos_quota *dst,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +55 mm/damon/acma.c

    49	
    50	/*
    51	 * Minimum amount of memory to be guaranteed to the system.  In other words,
    52	 * the lower limit of the scaling.
    53	 */
    54	static unsigned long min_mem_kb __read_mostly;
  > 55	module_param(min_mem, ulong, 0600);
    56	
    57	/*
    58	 * Desired level of memory pressure-stall time in microseconds.
    59	 *
    60	 * While keeping the caps that set by other quotas, DAMON_RECLAIM automatically
    61	 * increases and decreases the effective level of the quota aiming this level of
    62	 * memory pressure is incurred.  System-wide ``some`` memory PSI in microseconds
    63	 * per quota reset interval (``quota_reset_interval_ms``) is collected and
    64	 * compared to this value to see if the aim is satisfied.  Value zero means
    65	 * disabling this auto-tuning feature.
    66	 *
    67	 * 1 ms/ 1 second (0.1%) by default.  Inspired by the PSI threshold of TMO
    68	 * (https://dl.acm.org/doi/10.1145/3503222.3507731).
    69	 */
    70	static unsigned long quota_mem_pressure_us __read_mostly = 1000;
    71	module_param(quota_mem_pressure_us, ulong, 0600);
    72	
    73	/*
    74	 * Basic scale down/up granularity.  ACMA will allocate and report contiguous
    75	 * pages of this size at once.  512 pages (2 MiB for 4 KiB page setup) by
    76	 * default.
    77	 *
    78	 * To minimize DAMON-internal ALLOC-ed memory management overhead, we further
    79	 * apply SCALE_WINDOW.  Refer to damon_acma_set_scale_down_region_filter() for
    80	 * more detail about it.
    81	 */
    82	static unsigned int scale_pg_order __read_mostly = 9;
    83	module_param(scale_pg_order, uint, 0600);
    84	
    85	static struct damos_quota damon_acma_quota = {
    86		/* Use up to 15 ms per 1 sec for scaling, by default */
    87		.ms = 15,
    88		.sz = 0,
    89		.reset_interval = 1000,
    90		/* Within the quota, mark hotter regions accessed first. */
    91		.weight_sz = 0,
    92		.weight_nr_accesses = 1,
    93		.weight_age = 0,
    94	};
    95	DEFINE_DAMON_MODULES_DAMOS_TIME_QUOTA(damon_acma_quota);
    96	
    97	static struct damos_watermarks damon_acma_wmarks = {
    98		.metric = DAMOS_WMARK_NONE,
    99	};
   100	
   101	static struct damon_attrs damon_acma_mon_attrs = {
   102		.sample_interval = 1000000,	/* 1 second */
   103		.aggr_interval = 20000000,	/* 20 seconds */
   104		.ops_update_interval = 0,
   105		.min_nr_regions = 10,
   106		.max_nr_regions = 1000,
   107	};
   108	DEFINE_DAMON_MODULES_MON_ATTRS_PARAMS(damon_acma_mon_attrs);
   109	
   110	/*
   111	 * Start of the target memory region in physical address.
   112	 *
   113	 * The start physical address of memory region that DAMON_ACMA will do work
   114	 * against.  By default, biggest System RAM is used as the region.
   115	 */
   116	static unsigned long monitor_region_start __read_mostly;
   117	module_param(monitor_region_start, ulong, 0600);
   118	
   119	/*
   120	 * End of the target memory region in physical address.
   121	 *
   122	 * The end physical address of memory region that DAMON_ACMA will do work
   123	 * against.  By default, biggest System RAM is used as the region.
   124	 */
   125	static unsigned long monitor_region_end __read_mostly;
   126	module_param(monitor_region_end, ulong, 0600);
   127	
   128	/*
   129	 * PID of the DAMON thread
   130	 *
   131	 * If DAMON_ACMA is enabled, this becomes the PID of the worker thread.
   132	 * Else, -1.
   133	 */
   134	static int kdamond_pid __read_mostly = -1;
   135	module_param(kdamond_pid, int, 0400);
   136	
   137	static struct damos_stat damon_acma_reclaim_stat;
   138	DEFINE_DAMON_MODULES_DAMOS_STATS_PARAMS(damon_acma_reclaim_stat,
   139			acma_reclaim_tried_regions, acma_reclaim_succ_regions,
   140			acma_reclaim_quota_exceeds);
   141	
   142	static struct damos_stat damon_acma_scale_down_stat;
   143	DEFINE_DAMON_MODULES_DAMOS_STATS_PARAMS(damon_acma_scale_down_stat,
   144			acma_scale_down_tried_regions, acma_scale_down_succ_regions,
   145			acma_scale_down_quota_exceeds);
   146	
   147	static struct damos_access_pattern damon_acma_stub_pattern = {
   148		/* Find regions having PAGE_SIZE or larger size */
   149		.min_sz_region = PAGE_SIZE,
   150		.max_sz_region = ULONG_MAX,
   151		/* no matter its access frequency */
   152		.min_nr_accesses = 0,
   153		.max_nr_accesses = UINT_MAX,
   154		/* no matter its age */
   155		.min_age_region = 0,
   156		.max_age_region = UINT_MAX,
   157	};
   158	
   159	static struct damon_ctx *ctx;
   160	static struct damon_target *target;
   161	
   162	static struct damos *damon_acma_new_scheme(
   163			struct damos_access_pattern *pattern, enum damos_action action)
   164	{
   165		struct damos_quota quota = damon_acma_quota;
   166	
   167		/* Use 1/2 of total quota for hot/cold pages sorting */
   168		quota.ms = quota.ms / 2;
   169	
   170		return damon_new_scheme(
   171				pattern,
   172				action,
   173				/* work for every second */
   174				1000000,
   175				/* under the quota. */
   176				&quota,
   177				/* (De)activate this according to the watermarks. */
   178				&damon_acma_wmarks);
   179	}
   180	
   181	static void damon_acma_copy_quota_status(struct damos_quota *dst,
   182			struct damos_quota *src)
   183	{
   184		dst->total_charged_sz = src->total_charged_sz;
   185		dst->total_charged_ns = src->total_charged_ns;
   186		dst->charged_sz = src->charged_sz;
   187		dst->charged_from = src->charged_from;
   188		dst->charge_target_from = src->charge_target_from;
   189		dst->charge_addr_from = src->charge_addr_from;
   190	}
   191	
   192	static int damon_acma_set_scheme_quota(struct damos *scheme, struct damos *old,
   193			damos_quota_goal_metric goal_metric)
   194	{
   195		if (old)
   196			damon_acma_copy_quota_status(&scheme->quota, &old->quota);
   197		goal = damos_new_quota_goal(goal_metric, quota_mem_pressure_us);
   198		if (!goal)
   199			return -ENOMEM;
   200		damos_add_quota_goal(&scheme->quota, goal);
   201		return 0;
   202	}
   203	
   204	/*
   205	 * scale_pg_order is for basic scaling granularity.  Have a larger granularity
   206	 * to limit DAMON-internal alloc-ed pages management overhead.
   207	 */
 > 208	#define SCALE_WINDOW	(128 * MB)
   209	
   210	/*
   211	 * Set scale_down scheme's address range type filter to apply scaling down to
   212	 * only current scaling window.  Scaling window is SCALE_WINDOW size contiguous
   213	 * memory region of highest address that not yet completely DAMOS_ALLOC-ed and
   214	 * reported.
   215	 *
   216	 * TODO: Apply 'struct page' reduction in SCALE_WINDOW or lower granularity.
   217	 * E.g., hot-unplug the memory block, or apply vmemmap remapping-based approach
   218	 * like hugetlb vmemmap optimization
   219	 * (https://docs.kernel.org/mm/vmemmap_dedup.html).
   220	 */
   221	static int damon_acma_set_scale_down_region_filter(struct damos *scheme)
   222	{
   223		struct damos_filter *filter = damos_new_filter(
   224				DAMOS_FILTER_TYPE_ADDR, false);
   225		unsigned long end;
   226		unsigned long start_limit, end_limit;
   227	
   228		if (!filter)
   229			return -ENOMEM;
   230	
   231		/* scale down no below min_mem_kb */
   232		end_limit = monitor_region_end;
 > 233		start_limit = monitor_region_start + min_mem_kb * KB;
   234	
   235		/* not-completely-alloc-ed SCALE_WINDOW region of highest address */
   236		for (end = end_limit; end >= start_limit + SCALE_WINDOW;
   237				end -= SCALE_WINDOW) {
 > 238			if (damon_alloced_bytes(end, end - SCALE_WINDOW)
   239					!= SCALE_WINDOW)
   240				break;
   241		}
   242		filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
   243		filter->addr_range.end = end;
   244	
   245		damos_add_filter(scheme, filter);
   246		return 0;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
