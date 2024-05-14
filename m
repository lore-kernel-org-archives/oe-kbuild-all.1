Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010CA17C2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 01:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715649249; cv=none; b=RidRWB3bLpdZUyuTPdUT8gwXHzjGOBL39VTOYeIRhhsrcTKLd4oFGnJxFvbof1vfLreLavBVVlTXHMKiTwxArgLQYCB5GMnitU32YHkha+qjoHGaFfy2uBtIjnMF/WxNVHq4wcBN6G6jDS23jRjEthzn3/w+yBcIM5UdS5jfuQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715649249; c=relaxed/simple;
	bh=c0bLOfDJJXX/XsMChHAPv9JsszntH+VQw+RIyajv4yU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDZLx95GVchrrr2xu4ybfWwC+bqgsuG7/EOOSySQniJuZ9I7MJt49d0lf4WI4EKF40OaLnoA2UIMIIE32gYbk1z0jUGb/wM+DhSJ4uOUtlaR/ZkeyQfhgvv7Tz4eKoyrhm1PeQiAjxkcpkviFl2NW0FqlWG9MWqhGvPXQz1aZrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDnknUAl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDnknUAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715649246; x=1747185246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c0bLOfDJJXX/XsMChHAPv9JsszntH+VQw+RIyajv4yU=;
  b=HDnknUAlh0LXV9BPY9gUxQRTuaEyrfOLBOr8EGNmA6qo+uhH04JCCmMp
   oou9AmW4MzBpiNrQ8l4kPRCzGWMM7BHVYnOFlxCiVNUqeiCutHnzOXoD9
   iPE2SHun0vC6T6eXMsjSCJ1zMR17pckxzjzxlaETfN3Kez8iP3WaY/BWL
   WXU62mp17U1wyyZatFMes1hM+MEV2AxRUKrDtJlaDQMfgfl4lAzV64l49
   IivHY+rcXUHc64ROIWMD/jSoyWLMebWSVbE7tsi3D5ZUiXUSt9bjgLWGR
   eGHiwQxh4Pm7GNfZmEmDcnN1S+r3zLFI/X/kpIlAj4wgWHQyZxXiH3zum
   A==;
X-CSE-ConnectionGUID: frogrcFjSvmNXw2PPVQrJQ==
X-CSE-MsgGUID: jVS9UZeiToyKQ1Oe5SGMnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11730964"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11730964"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 18:14:05 -0700
X-CSE-ConnectionGUID: YJUPhZgOSGm6/k1iOQpq3Q==
X-CSE-MsgGUID: 5hBPHKKDTg+/1wLNtCxClw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30491281"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 May 2024 18:14:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6gjx-000Arv-28;
	Tue, 14 May 2024 01:14:01 +0000
Date: Tue, 14 May 2024 09:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 32/33] mm/damon/acma.c:62:14: error: 'max_mem'
 undeclared; did you mean 'max_mem_kb'?
Message-ID: <202405140938.2KcwHEzV-lkp@intel.com>
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
commit: 9c0c2a5550718fd72b4384589be3b4c470a85502 [32/33] mm/damon/acma: implement scale up feature
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240514/202405140938.2KcwHEzV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405140938.2KcwHEzV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405140938.2KcwHEzV-lkp@intel.com/

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
   mm/damon/acma.c:55:14: error: 'min_mem' undeclared (first use in this function); did you mean 'min_mem_kb'?
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
   mm/damon/acma.c:55:14: error: 'min_mem' undeclared here (not in a function); did you mean 'min_mem_kb'?
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
   mm/damon/acma.c: In function '__check_max_mem':
>> mm/damon/acma.c:62:14: error: 'max_mem' undeclared (first use in this function); did you mean 'max_mem_kb'?
      62 | module_param(max_mem, ulong, 0600);
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
   mm/damon/acma.c:62:1: note: in expansion of macro 'module_param'
      62 | module_param(max_mem, ulong, 0600);
         | ^~~~~~~~~~~~
   mm/damon/acma.c: At top level:
>> mm/damon/acma.c:62:14: error: 'max_mem' undeclared here (not in a function); did you mean 'max_mem_kb'?
      62 | module_param(max_mem, ulong, 0600);
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
   mm/damon/acma.c:62:1: note: in expansion of macro 'module_param'
      62 | module_param(max_mem, ulong, 0600);
         | ^~~~~~~~~~~~
   mm/damon/acma.c: In function 'damon_acma_new_scheme':
   mm/damon/acma.c:182:16: error: too few arguments to function 'damon_new_scheme'
     182 |         return damon_new_scheme(
         |                ^~~~~~~~~~~~~~~~
   include/linux/damon.h:770:15: note: declared here
     770 | struct damos *damon_new_scheme(struct damos_access_pattern *pattern,
         |               ^~~~~~~~~~~~~~~~
   mm/damon/acma.c: At top level:
   mm/damon/acma.c:205:17: error: unknown type name 'damos_quota_goal_metric'
     205 |                 damos_quota_goal_metric goal_metric)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/acma.c: In function 'damon_acma_set_scale_down_region_filter':
   mm/damon/acma.c:245:59: error: 'KB' undeclared (first use in this function)
     245 |         start_limit = monitor_region_start + min_mem_kb * KB;
         |                                                           ^~
   mm/damon/acma.c:220:32: error: 'MB' undeclared (first use in this function); did you mean 'mb'?
     220 | #define SCALE_WINDOW    (128 * MB)
         |                                ^~
   mm/damon/acma.c:248:52: note: in expansion of macro 'SCALE_WINDOW'
     248 |         for (end = end_limit; end >= start_limit + SCALE_WINDOW;
         |                                                    ^~~~~~~~~~~~
   mm/damon/acma.c:250:21: error: implicit declaration of function 'damon_alloced_bytes' [-Werror=implicit-function-declaration]
     250 |                 if (damon_alloced_bytes(end, end - SCALE_WINDOW)
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
   mm/damon/acma.c:254:36: note: in expansion of macro 'max'
     254 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
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
   mm/damon/acma.c:254:36: note: in expansion of macro 'max'
     254 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
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
   mm/damon/acma.c:254:36: note: in expansion of macro 'max'
     254 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
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
   mm/damon/acma.c:254:36: note: in expansion of macro 'max'
     254 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
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
   mm/damon/acma.c:254:36: note: in expansion of macro 'max'
     254 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
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
   mm/damon/acma.c:254:36: note: in expansion of macro 'max'
     254 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
         |                                    ^~~
   mm/damon/acma.c: In function 'damon_acma_set_scale_up_region_filter':
   mm/damon/acma.c:276:48: error: 'KB' undeclared (first use in this function)
     276 |         end_limit = start_limit + max_mem_kb * KB;
         |                                                ^~
   mm/damon/acma.c:220:32: error: 'MB' undeclared (first use in this function); did you mean 'mb'?
     220 | #define SCALE_WINDOW    (128 * MB)
         |                                ^~
   mm/damon/acma.c:279:56: note: in expansion of macro 'SCALE_WINDOW'
     279 |         for (start = start_limit; start <= end_limit - SCALE_WINDOW;
         |                                                        ^~~~~~~~~~~~
>> mm/damon/acma.c:281:41: error: 'end' undeclared (first use in this function); did you mean '_end'?
     281 |                 if (damon_alloced_bytes(end - SCALE_WINDOW))
         |                                         ^~~
         |                                         _end
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
   mm/damon/acma.c:285:34: note: in expansion of macro 'min'
     285 |         filter->addr_range.end = min(end_limit, start + SCALE_WINDOW);
         |                                  ^~~
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
   mm/damon/acma.c:285:34: note: in expansion of macro 'min'
     285 |         filter->addr_range.end = min(end_limit, start + SCALE_WINDOW);
         |                                  ^~~
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
   mm/damon/acma.c:285:34: note: in expansion of macro 'min'
     285 |         filter->addr_range.end = min(end_limit, start + SCALE_WINDOW);
         |                                  ^~~
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
   mm/damon/acma.c:285:34: note: in expansion of macro 'min'
     285 |         filter->addr_range.end = min(end_limit, start + SCALE_WINDOW);
         |                                  ^~~
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
   mm/damon/acma.c:285:34: note: in expansion of macro 'min'
     285 |         filter->addr_range.end = min(end_limit, start + SCALE_WINDOW);
         |                                  ^~~
   include/linux/minmax.h:56:9: error: first argument to '__builtin_choose_expr' not a constant
      56 |         __builtin_choose_expr(__is_constexpr((x) - (y)),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/damon/acma.c:285:34: note: in expansion of macro 'min'
     285 |         filter->addr_range.end = min(end_limit, start + SCALE_WINDOW);
         |                                  ^~~
   mm/damon/acma.c: In function 'damon_acma_alloc_callback':
   mm/damon/acma.c:298:16: error: implicit declaration of function 'page_report'; did you mean 'PageReported'? [-Werror=implicit-function-declaration]
     298 |         return page_report(PHYS_PFN(addr), 1 << scale_pg_order);
         |                ^~~~~~~~~~~
         |                PageReported
   In file included from include/asm-generic/memory_model.h:5,
                    from arch/alpha/include/asm/page.h:89,
                    from include/linux/shm.h:6,
                    from include/linux/sched.h:23:
   mm/damon/acma.c:298:37: error: 'addr' undeclared (first use in this function)
     298 |         return page_report(PHYS_PFN(addr), 1 << scale_pg_order);
         |                                     ^~~~
   include/linux/pfn.h:22:43: note: in definition of macro 'PHYS_PFN'
      22 | #define PHYS_PFN(x)     ((unsigned long)((x) >> PAGE_SHIFT))
         |                                           ^
   mm/damon/acma.c: In function 'damon_acma_new_reclaim_scheme':
   mm/damon/acma.c:314:15: error: implicit declaration of function 'damon_acma_set_scheme_quota'; did you mean 'damon_acma_new_scheme'? [-Werror=implicit-function-declaration]
     314 |         err = damon_acma_set_scheme_quota(scheme, old,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               damon_acma_new_scheme
   mm/damon/acma.c: In function 'damon_acma_new_scale_down_scheme':
   mm/damon/acma.c:332:50: error: 'DAMOS_ALLOC' undeclared (first use in this function)
     332 |         scheme = damon_acma_new_scheme(&pattern, DAMOS_ALLOC);
         |                                                  ^~~~~~~~~~~
   mm/damon/acma.c:342:15: error: 'struct damos' has no member named 'alloc_order'
     342 |         scheme->alloc_order = scale_pg_order;
         |               ^~
   mm/damon/acma.c:343:15: error: 'struct damos' has no member named 'alloc_callback'
     343 |         scheme->alloc_callback = damon_acma_alloc_callback;
         |               ^~
   mm/damon/acma.c:344:55: error: 'scale_down_scheme' undeclared (first use in this function)
     344 |         err = damon_acma_set_scale_down_region_filter(scale_down_scheme);
         |                                                       ^~~~~~~~~~~~~~~~~
   mm/damon/acma.c: In function 'damon_acma_new_scale_up_scheme':
>> mm/damon/acma.c:361:50: error: 'DAMOS_FREE' undeclared (first use in this function)
     361 |         scheme = damon_acma_new_scheme(&pattern, DAMOS_FREE);
         |                                                  ^~~~~~~~~~
>> mm/damon/acma.c:364:51: error: 'old' undeclared (first use in this function); did you mean 'ihold'?
     364 |         err = damon_acma_set_scheme_quota(scheme, old,
         |                                                   ^~~
         |                                                   ihold
>> mm/damon/acma.c:365:25: error: 'DAMOS_QUOTA_SOME_MEM_PUSI_US' undeclared (first use in this function); did you mean 'DAMOS_QUOTA_SOME_MEM_PSI_US'?
     365 |                         DAMOS_QUOTA_SOME_MEM_PUSI_US);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         DAMOS_QUOTA_SOME_MEM_PSI_US
   mm/damon/acma.c:370:15: error: 'struct damos' has no member named 'alloc_order'
     370 |         scheme->alloc_order = scale_pg_order;
         |               ^~
   mm/damon/acma.c:371:15: error: 'struct damos' has no member named 'alloc_callback'
     371 |         scheme->alloc_callback = NULL;
         |               ^~
>> mm/damon/acma.c:372:53: error: 'scale_up_scheme' undeclared (first use in this function)
     372 |         err = damon_acma_set_scale_up_region_filter(scale_up_scheme);
         |                                                     ^~~~~~~~~~~~~~~
   mm/damon/acma.c:374:38: error: 'scale_down_scheme' undeclared (first use in this function)
     374 |                 damon_destroy_scheme(scale_down_scheme);
         |                                      ^~~~~~~~~~~~~~~~~
   mm/damon/acma.c: In function 'damon_acma_apply_parameters':
>> mm/damon/acma.c:418:27: error: too many arguments to function 'damon_acma_new_scale_up_scheme'
     418 |         scale_up_scheme = damon_acma_new_scale_up_scheme(old_scale_up_scheme);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/acma.c:355:22: note: declared here
     355 | static struct damos *damon_acma_new_scale_up_scheme(void)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/acma.c:386:34: warning: unused variable 'goal' [-Wunused-variable]
     386 |         struct damos_quota_goal *goal;
         |                                  ^~~~
   mm/damon/acma.c: In function 'damon_acma_after_aggregation':
   mm/damon/acma.c:508:22: error: 'DAMOS_LRU_RECLAIM' undeclared (first use in this function); did you mean 'DAMOS_LRU_DEPRIO'?
     508 |                 case DAMOS_LRU_RECLAIM:
         |                      ^~~~~~~~~~~~~~~~~
         |                      DAMOS_LRU_DEPRIO
   mm/damon/acma.c:511:22: error: 'DAMOS_ALLOC' undeclared (first use in this function)
     511 |                 case DAMOS_ALLOC:
         |                      ^~~~~~~~~~~
   mm/damon/acma.c:514:22: error: 'DAMOS_FREE' undeclared (first use in this function)
     514 |                 case DAMOS_FREE:
         |                      ^~~~~~~~~~
   mm/damon/acma.c:524:12: error: invalid storage class for function 'damon_acma_after_wmarks_check'
     524 | static int damon_acma_after_wmarks_check(struct damon_ctx *c)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/acma.c:529:19: error: invalid storage class for function 'damon_acma_init'
     529 | static int __init damon_acma_init(void)
         |                   ^~~~~~~~~~~~~~~
   mm/damon/acma.c:546:13: error: initializer element is not constant
     546 | module_init(damon_acma_init);
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
   mm/damon/acma.c:546:1: note: in expansion of macro 'module_init'
     546 | module_init(damon_acma_init);
         | ^~~~~~~~~~~
   mm/damon/acma.c:546:1: error: expected declaration or statement at end of input
   mm/damon/acma.c: In function 'damon_acma_new_scheme':
   mm/damon/acma.c:191:1: warning: control reaches end of non-void function [-Wreturn-type]
     191 | }
         | ^
   mm/damon/acma.c: At top level:
   mm/damon/acma.c:193:13: warning: 'damon_acma_copy_quota_status' defined but not used [-Wunused-function]
     193 | static void damon_acma_copy_quota_status(struct damos_quota *dst,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +62 mm/damon/acma.c

    56	
    57	/*
    58	 * Maximum amount of memory to be guaranteed to the system.  In other words,
    59	 * the upper limit of the scaling.
    60	 */
    61	static unsigned long max_mem_kb __read_mostly;
  > 62	module_param(max_mem, ulong, 0600);
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
