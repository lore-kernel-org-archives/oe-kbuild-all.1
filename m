Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E8C366558
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 08:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996644; cv=none; b=HUMLFkPuRyHcCjWwHXmK7MLEC3hKjdWBai2R2jpM/wwsNs+7A04ChpEBGtV5kCpLo88sKNB8appDTWBRmBhrjCoRWOGWGm61odz21WEwIzT7C/iuMJAtceJCIt5Tdhzst5SpRDQ5hxc8k911748oQgLcC7s4AMhFFOYfk6WQPp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996644; c=relaxed/simple;
	bh=507WQDVBvDu9Ha87NRP9fpEGW7FJPjDcn/RyYPRk5+E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MS9sKY41vtBvtzUaZ3BkSOZ18EVbU6Rqf3jAh5jgqMYLtW87v2KfLmrC1VQebE13LDkvrtUMNd3PIhYjMIn21vE2nUb6nczFkKHZVLgh2q2QSo9PjylmaqAEu6s0bbCIfQ7VwryUTO0to7taHfPcTNDMQaP4+SDMnKiV/WaHvuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrS0ukKl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrS0ukKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773996643; x=1805532643;
  h=date:from:to:cc:subject:message-id;
  bh=507WQDVBvDu9Ha87NRP9fpEGW7FJPjDcn/RyYPRk5+E=;
  b=HrS0ukKltdx2KQupCvg/8VErnUXcc86qSgFQuvVILzlkAk51pr27uvKJ
   rUOp4E3TM8Z/lH6Jemw0VC5n6Abm9ypDmyd57LZEKddjCGmLcqJ5swufq
   CNmBsoERsGqgKedLdpslWeFME5K4QiKlRORXEqY5JOG0rA+OAx2Tv8HLB
   HtouUjeyhcKJwavKox1P/qLoKkfeHMJfOpuk9YAYirfvrimio+3ZfMQFM
   SJp0aH6Ow9qsWnR2z/ALgHuebfo4+1+mUscBtYqSYPIuEu+pH2sAbJ5uW
   wHS/L+pJhnHM8JVll8xOTvJnZWjzpQ1EKiTPFpcoXPz/gWw4P1LOFRcqO
   Q==;
X-CSE-ConnectionGUID: S63QxVjSRqytgkh6UOTOFw==
X-CSE-MsgGUID: 1m0inR4WQMCifsQWSP5lLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="62640248"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="62640248"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:50:42 -0700
X-CSE-ConnectionGUID: V/Q6fz+oTKiAcIyhrPU8fQ==
X-CSE-MsgGUID: TCT2wt0hTTetCHs8GpRJCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="225153062"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 Mar 2026 01:50:41 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3VZ0-000000002AX-2bCu;
	Fri, 20 Mar 2026 08:50:38 +0000
Date: Fri, 20 Mar 2026 16:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 21/21] kernel/sched/fair.c:4067:1:
 warning: control reaches end of non-void function
Message-ID: <202603201652.XGsoWx79-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   4974c93ce402d69988eb7b2e9e490c22cc22bb7b
commit: 4974c93ce402d69988eb7b2e9e490c22cc22bb7b [21/21] sched/eevdf: Move to a single runqueue
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260320/202603201652.XGsoWx79-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201652.XGsoWx79-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201652.XGsoWx79-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function '__calc_prop_weight':
   kernel/sched/fair.c:4066:28: error: 'MIN_SHARES' undeclared (first use in this function)
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
>> include/linux/compiler.h:168:17: error: '__UNIQUE_ID_y__460' undeclared (first use in this function); did you mean '__UNIQUE_ID_x__459'?
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
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
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
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:4066:16: note: in expansion of macro 'max'
    4066 |         return max(weight, MIN_SHARES);
         |                ^~~
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
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
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:4066:16: note: in expansion of macro 'max'
    4066 |         return max(weight, MIN_SHARES);
         |                ^~~
>> kernel/sched/fair.c:4067:1: warning: control reaches end of non-void function [-Wreturn-type]
    4067 | }
         | ^


vim +4067 kernel/sched/fair.c

4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4050) 
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4051) /*
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4052)  * weight = NICE_0_LOAD;
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4053)  * for_each_entity_se(se)
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4054)  *   weight = __calc_prop_weight(cfs_rq_of(se), se, weight);
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4055)  */
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4056) static __always_inline
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4057) unsigned long __calc_prop_weight(struct cfs_rq *cfs_rq, struct sched_entity *se,
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4058) 				 unsigned long weight)
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4059) {
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4060) 	weight *= se->load.weight;
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4061) 	if (parent_entity(se))
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4062) 		weight /= cfs_rq->load.weight;
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4063) 	else
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4064) 		weight /= NICE_0_LOAD;
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06  4065) 
4974c93ce402d6 Peter Zijlstra (Intel  2025-12-06 @4066) 	return max(weight, MIN_SHARES);
af4cf40470c22e Peter Zijlstra         2023-05-31 @4067  }
9059393e4ec1c8 Vincent Guittot        2017-05-17  4068  

:::::: The code at line 4067 was first introduced by commit
:::::: af4cf40470c22efa3987200fd19478199e08e103 sched/fair: Add cfs_rq::avg_vruntime

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
