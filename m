Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4E71A683E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 02:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788055856; cv=none; b=W7n+4YGO37AbhroNwxbjsv3njdx5edrihRGc2DE1AW2AJ5Aij9Biy86SIovQse8uXZefzp/FmZWqwD9vlsMeHNtKDJuE9CG8FGU8oKuRv/vWY0r5VZcG3kIQURhAxPwCI8I429Hpz3BRm/ejUDj5Qxk+FLrxqWHR0gb7d2YpKXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788055856; c=relaxed/simple;
	bh=zAlvm1JRNQODLwKAGJ4opiPkfTTNy8q+eXb5pbVyg4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XIorXsygB9yGDXoAkNnEvMlur7N6HaNO3fvxWMRjlJsp9WjWS/wAeCTyis8VQdzcXqVIvZaKbLwG2TUjc77UoilbhKRB8B8O/aJondigBsfh4YgKehY0XlIoZk5TJ6Njbld1q+xp6+R4s+5o2rcK7zFxHA1NLiORCC6H3T2PnNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/PdbV4w; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/PdbV4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788055854; x=1819591854;
  h=date:from:to:cc:subject:message-id;
  bh=zAlvm1JRNQODLwKAGJ4opiPkfTTNy8q+eXb5pbVyg4k=;
  b=j/PdbV4wQFguIYKqEPKABk/2q8YogbtxU9BPv6QzTjlUA13x9KNsa/94
   dGALYNe5IIO9l18AAWkHizQJb8C/LVB6ZclMMdbXUv7yzIyR8db3dw1Q5
   VFHvvoFXbGUXY3PX2za++07fsHsChPwZtD8qPwu7UFe1mrcSjUWKG9XZK
   3MiFxN/KUd5NU7TnoD3WFk0aItjWV1tq2j1alZvmfb9UIUwdkw1YOuAeW
   Yc2b1BYBb5nDVO9byWlEVdgB3RR2/Ha8CIVSx+NUTOCzQ+MScaw9S7eyQ
   fFGIy5QMHqrf6wY855+SAlai7OQiXCmGMMJ2LK/k7vGXkLYUiOxGrIDwv
   g==;
X-CSE-ConnectionGUID: Pttq3VDyR+yB4RAXfLM3EQ==
X-CSE-MsgGUID: oe3Siwr2Q4+wU0VF5q7Ulg==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="88269898"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="88269898"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 19:10:53 -0700
X-CSE-ConnectionGUID: ijCgYB2jSjaDZimnjZNFjA==
X-CSE-MsgGUID: RZA0NrTLRgeqIIaF7IYRHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="266673535"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Aug 2026 19:10:52 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0V0T-00000000DWi-3fHR;
	Sun, 30 Aug 2026 02:10:49 +0000
Date: Sun, 30 Aug 2026 10:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 272/272]
 kernel/sched/fair.c:9774:69: warning: 'struct lb_env' declared inside
 parameter list will not be visible outside of this definition or declaration
Message-ID: <202608301009.JSDb3U23-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Cruz,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   41cf029dd674935312f07b9ff27127f205008195
commit: 64194706630f8c78feb5fb01b6d046aa4aab66df [272/272] anolis: sched: add tunables for expeller and expellee load balance
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260830/202608301009.JSDb3U23-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608301009.JSDb3U23-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608301009.JSDb3U23-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:56:
   kernel/sched/sched.h:1859:54: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
    1859 | static inline void sched_core_identity_attach(struct cgroup_taskset *tset) { }
         |                                                      ^~~~~~~~~~~~~~
>> kernel/sched/fair.c:9774:69: warning: 'struct lb_env' declared inside parameter list will not be visible outside of this definition or declaration
    9774 | static inline int id_can_migrate_task(struct task_struct *p, struct lb_env *env)
         |                                                                     ^~~~~~


vim +9774 kernel/sched/fair.c

  9740	
  9741	#else
  9742	static inline void push_expellee(struct rq *rq) { }
  9743	#endif
  9744	static int id_can_migrate_task(struct task_struct *p, struct lb_env *env)
  9745	{
  9746		struct rq *src_rq = env->src_rq;
  9747		struct rq *dst_rq = env->dst_rq;
  9748	
  9749		if (!id_expeller_share_core() && env->id_need_redo && task_is_expeller(p) &&
  9750		    rq_on_expel_by_smt_expeller(dst_rq))
  9751			goto bad_dst;
  9752		if ((!sched_feat(ID_SMT_EXPEL) || !task_is_expellee(p)) &&
  9753		    (!sched_feat(ID_ABSOLUTE_EXPEL) || !task_is_idle(p)))
  9754			return -1;
  9755		/* Do not migrate expellee task to CPU on expel */
  9756		if (should_expel_se(dst_rq, &p->se))
  9757			goto bad_dst;
  9758		if (sched_feat(ID_EXPELLEE_NEVER_HOT))
  9759			goto good_dst;
  9760		if (!should_expel_se(src_rq, &p->se))
  9761			return -1;
  9762		if (!sched_feat(ID_RESCUE_EXPELLEE))
  9763			return -1;
  9764	good_dst:
  9765		schedstat_inc(p->stats.nr_forced_migrations);
  9766		return 1;
  9767	bad_dst:
  9768		schedstat_inc(p->stats.nr_failed_migrations_id);
  9769		return 0;
  9770	}
  9771	#else
  9772	static inline void update_rq_on_expel(struct rq *rq) { }
  9773	static inline void push_expellee(struct rq *rq) { }
> 9774	static inline int id_can_migrate_task(struct task_struct *p, struct lb_env *env)
  9775	{
  9776		return -1;
  9777	}
  9778	#endif
  9779	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
