Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E17B3C345C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818428; cv=none; b=K3gyvgH6c0xA3LqiUbwWfAb4YDYlzYdAI3laVp4c5bxm3/yAwFR9sEZ0SOvEDhFKAa1lLEQZjbDP2uuxrVd4oPiyPCNxBV5xyOrpIBmfjgSaazTVOPAiqndjAC7Kb/6omTfL/QkVNEYM6yMwEtF5XLC3fuEQ6unDu51DwZVB1KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818428; c=relaxed/simple;
	bh=Y0vWQDvw9cTf1pgmU/S1Arhb5teh3B4TVpAsqAd+oqE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PLA2qRaGLpcPqL5e8EYiN764clTztlcdEKAhrJP14E2E5v2gAAIYkR7fqhW7bMz91x4LlU/4Z6IIJ5EPVfADeGPa/AVU786VbJ+X5/E1Z4UHwWpV2JQRBvw5DUnrvdxBA/v+7D9MuEFh8lT67XShc0ZFP+MofEqwGWTSfewcAlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLptzq3I; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLptzq3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787818422; x=1819354422;
  h=date:from:to:cc:subject:message-id;
  bh=Y0vWQDvw9cTf1pgmU/S1Arhb5teh3B4TVpAsqAd+oqE=;
  b=WLptzq3Iy1vFIZIIE1Adh8CHg1IA5IebHjwYkHvVgIZ5AVsd14KjnxuR
   OXnQ9F2whZJziCDtHSoeOlcHq6vmIO2ZHD1i4IcmExN2toej23O4WT6rY
   ADSg0DEsWE/mbdDJ5OGLTPa2IIES6G7sW/nlIj7vgCZAzCBp53ULVGutv
   KvcPYqE7a3zsdKsaoHNHHgw9468GDkNmQZ0YzayaehLYzjnmHXMp5YiZT
   lWuTglWpRx9kqUTKjzT10LuK5f/3aSAPbme1veHO2VDK5CLT67ssCz2aW
   Oqm1mp+7t2b6+JrESxhVVe95xj8NPrAemlaTvTof5qLVcfgNbcYcXF7nH
   w==;
X-CSE-ConnectionGUID: RqLT2kf1RK6tmDG5YWmMag==
X-CSE-MsgGUID: /phE8h7aQdimeCHAx6WOXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88191045"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88191045"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 01:13:39 -0700
X-CSE-ConnectionGUID: LTDY7pdpRHaShInw8PoqZQ==
X-CSE-MsgGUID: 2VMOuofmS0+4RYbTBAoPmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="269753356"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Aug 2026 01:13:37 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzVEt-0000000099P-0MHP;
	Thu, 27 Aug 2026 08:13:35 +0000
Date: Thu, 27 Aug 2026 16:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202608271621.Yk8t2Aal-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
commit: bb70e4fb626b70895b7917ee97c256f24d019c34 sched_ext: Eject the top rescue consumer on overload
date:   3 weeks ago
config: sparc-randconfig-r131-20260826 (https://download.01.org/0day-ci/archive/20260827/202608271621.Yk8t2Aal-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608271621.Yk8t2Aal-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bb70e4fb626b ("sched_ext: Eject the top rescue consumer on overload")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608271621.Yk8t2Aal-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/deadline.c:3314:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3314:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3314:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3316:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:3316:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:3316:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3578:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3578:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3578:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3631:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/ext.c:391:46: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:1423:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:1613:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:1613:48: sparse:    struct task_struct *
   kernel/sched/ext/ext.c:1613:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:2370:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:2384:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:3302:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:4381:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:4382:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6821:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6822:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:8357:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:8391:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:9776:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10275:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:10275:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:10275:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1418:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1313:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct *
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2481:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2481:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1442:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1442:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1442:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2339:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct *
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2481:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2481:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1442:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1442:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1442:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1343:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1676:15: sparse: sparse: dereference of noderef expression

vim +288 kernel/sched/ext/sub.c

   263	
   264	/**
   265	 * scx_rescue_charge - Charge the rescuee's runtime
   266	 * @rq: rq the rescuee is running on
   267	 * @delta_exec: runtime being charged
   268	 *
   269	 * Also ends the rescue once the admitted slice has been served in full. Ending
   270	 * on served time rather than slice exhaustion bounds both the rescue and the
   271	 * charging when a scheduler extends the rescuee's slice.
   272	 */
   273	void scx_rescue_charge(struct rq *rq, s64 delta_exec)
   274	{
   275		struct scx_sched_pcpu *pcpu;
   276	
   277		lockdep_assert_rq_held(rq);
   278	
   279		/*
   280		 * A rescue slice is bounded by one quantum and tick-driven expiry can
   281		 * overshoot by up to a tick. Clamp to avoid wild over-charges on VMs.
   282		 */
   283		delta_exec = min_t(s64, delta_exec, scx_rescue_quantum_ns + TICK_NSEC);
   284	
   285		rq->scx.rescue.budget -= delta_exec;
   286	
   287		/* per-cpu usage average feeds the overload victim pick */
 > 288		pcpu = per_cpu_ptr(scx_task_sched(rq->curr)->pcpu, cpu_of(rq));
   289		pcpu->rescue_avg = scx_rescue_decay_avg(pcpu) + delta_exec;
   290	
   291		if (!scx_rescue_slice_remaining(rq))
   292			scx_task_slice_ended(rq, rq->scx.rescue.curr);
   293	}
   294	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
