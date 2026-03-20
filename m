Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441CB36F41D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 08:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996064; cv=none; b=fqRgFFVapUXyXVTA0lf/qZohFg4zqXEJ7l0xTvTbVQyleUJfaUFMnZchndHwMa44eqDl89oCJ0OsE2XjyCBzTmHhIy4ms1qJvlTUBCp/J7YqVnSHTvJPY0hdKQ8dQcRUcLKLAKlzo1eE05+WNV6refuepGeEvaH2GZocpW6QQSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996064; c=relaxed/simple;
	bh=3fMER6TcEdXoQ15Ic1iLl+4h3ap2pIR8y/mVenidIys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=puVNvQ4dD5y/vGbo06K296S2mpEhgTUjWpbdZg1BGFymtJgSpGztDYobZ6Qg1cbcbKJ/HEBttrspswNDW7kktE/j6440Z/tYn3zHk19ySp0FQb5HpZrTC9P8OrTE0VzoHf2IYO2xGsl/shhO7xVbboPqQD5PaqryRUFb0O8HYkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFxkTx9a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFxkTx9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773996062; x=1805532062;
  h=date:from:to:cc:subject:message-id;
  bh=3fMER6TcEdXoQ15Ic1iLl+4h3ap2pIR8y/mVenidIys=;
  b=HFxkTx9aucsRhu4XNlp7oddLZD4w8zM8sMqmvxoc76e2z2dtgmDRFQRA
   NNJc1c9B02PzUA3C5d727fHb8HKSZiAjbYQH3+yhXfNWFMg7K84L2Fy3a
   Y2f05W2UKWn17cnYn0zF7HX0QXbselSNc7GoFRfk3J6GeucfWRUTOGE4S
   gzeAbXB7hNRCUn7qWsLPbNlNkAxdXWo1ZQBx0dtUa6xoVDQ02FXz8g0z1
   Uj2IIPri4Jw1QO601m2dLOvRWpvu+bHvqOvIl/I3u/Elq2zW82OeOUXjD
   2zbf9moaHRWLP0ouX4KgGuXwYP2pWAxdEhsRsFTUlmY7jFwICetKe40+q
   Q==;
X-CSE-ConnectionGUID: HEuRwQQiRoC8KG1REc/g1Q==
X-CSE-MsgGUID: juOEcdhjTgm34jvQVTyQoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86440034"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86440034"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:41:02 -0700
X-CSE-ConnectionGUID: hWmSbOtgT92K7N2awgbjNQ==
X-CSE-MsgGUID: 1yK9VXWZRsOFPtQOZXa7dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="227353496"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Mar 2026 01:40:59 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3VPJ-0000000029X-0RwK;
	Fri, 20 Mar 2026 08:40:41 +0000
Date: Fri, 20 Mar 2026 16:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 21/21] kernel/sched/fair.c:4066:28:
 error: 'MIN_SHARES' undeclared
Message-ID: <202603201657.K8TV5uGA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   4974c93ce402d69988eb7b2e9e490c22cc22bb7b
commit: 4974c93ce402d69988eb7b2e9e490c22cc22bb7b [21/21] sched/eevdf: Move to a single runqueue
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260320/202603201657.K8TV5uGA-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201657.K8TV5uGA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201657.K8TV5uGA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function '__calc_prop_weight':
>> kernel/sched/fair.c:4066:28: error: 'MIN_SHARES' undeclared (first use in this function)
    4066 |         return max(weight, MIN_SHARES);
         |                            ^~~~~~~~~~
   include/linux/minmax.h:92:35: note: in definition of macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                                   ^
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:4066:16: note: in expansion of macro 'max'
    4066 |         return max(weight, MIN_SHARES);
         |                ^~~
   kernel/sched/fair.c:4066:28: note: each undeclared identifier is reported only once for each function it appears in
    4066 |         return max(weight, MIN_SHARES);
         |                            ^~~~~~~~~~
   include/linux/minmax.h:92:35: note: in definition of macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                                   ^
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:4066:16: note: in expansion of macro 'max'
    4066 |         return max(weight, MIN_SHARES);
         |                ^~~
   In file included from <command-line>:
>> include/linux/compiler.h:168:17: error: '__UNIQUE_ID_y__468' undeclared (first use in this function); did you mean '__UNIQUE_ID_x__467'?
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/compiler_types.h:16:23: note: in expansion of macro '___PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^~~~~~~~
   include/linux/compiler.h:168:9: note: in expansion of macro '__PASTE'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/minmax.h:98:55: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:4066:16: note: in expansion of macro 'max'
    4066 |         return max(weight, MIN_SHARES);
         |                ^~~


vim +/MIN_SHARES +4066 kernel/sched/fair.c

  4050	
  4051	/*
  4052	 * weight = NICE_0_LOAD;
  4053	 * for_each_entity_se(se)
  4054	 *   weight = __calc_prop_weight(cfs_rq_of(se), se, weight);
  4055	 */
  4056	static __always_inline
  4057	unsigned long __calc_prop_weight(struct cfs_rq *cfs_rq, struct sched_entity *se,
  4058					 unsigned long weight)
  4059	{
  4060		weight *= se->load.weight;
  4061		if (parent_entity(se))
  4062			weight /= cfs_rq->load.weight;
  4063		else
  4064			weight /= NICE_0_LOAD;
  4065	
> 4066		return max(weight, MIN_SHARES);
  4067	}
  4068	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
