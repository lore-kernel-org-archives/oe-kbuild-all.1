Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD70376BE5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534379; cv=none; b=L7gC40plTGZ9jZOXSuUU9ott+nu9hf9xCyUP5FEQAKyjZ0Loh75e8rwB2QOgwA3vUlxD9qirIue9ZDn3Zgfm5rxV/cjOPq7UoLBgYItHXoqDwRSn4pgzWHcJ8vToire/cxellbQ7Q+Nf3AUuuSILJzHnOYUxR8oHxOUCYcnBUY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534379; c=relaxed/simple;
	bh=B+5bMgCE2z/dPp8tn6jLtkNvOz0e7v6ZUSiiSyQB4Gc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F3u2xjPE9NNnV2Y0EAdQh7A9cqLJRgD0bC47ZiJGE8uf+3aGlOyHUfw66LgYqdmJI11o9vv4UVo6YiFNPiSPat5z4NbNnx4yJnXGpSKLtVgGGAhpRaTsxVgGtPbel4ZCQESIGs2075OCHI//t6pAW/zAaWrVcRKq59PAVPyyNk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TnN1kGjN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnN1kGjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534378; x=1807070378;
  h=date:from:to:cc:subject:message-id;
  bh=B+5bMgCE2z/dPp8tn6jLtkNvOz0e7v6ZUSiiSyQB4Gc=;
  b=TnN1kGjNM5rAdp/pfhsEBZPxC+ZNz9q1Zpy52BlB+UmHXmbu1G87UEWT
   JRB4hbyLnhjINjA2gEvkZeo6N5bXc0cyzNTP/V+8irSDIt6X82P9oZF/K
   gqBBXSFhk4Kv0RNhrvxFMrV72UZ8e+Fb6ry+vfgx0cSJduN4gm2UdZ1K0
   kj8cLVrs3loEiN45ev0eDNA20AXSxQsf6hJxvN/eWEw3cPv8b9yt0H2i+
   eJZy3Fz6mFBq1GL176snPpguaACLcxNLRS6ndPeh5BwKPYrKWeZhRRNVR
   R+z74zB0kDNy0C26wbzO6ofm8PTeTmYw1eBhJSxuhJaqA/nK7hM6waqby
   Q==;
X-CSE-ConnectionGUID: hVRRhB+yTXO7X0AW7Z4bbw==
X-CSE-MsgGUID: EPYdSgzVSleUGbSWHqkZsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76204319"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76204319"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:59:36 -0700
X-CSE-ConnectionGUID: FsdimLHFTaCqO5Gl04PY0Q==
X-CSE-MsgGUID: JLZpeJi0Sn2Y3R2fQCc8GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251193024"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 20:59:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xbB-0000000006r-1Y0T;
	Tue, 07 Apr 2026 03:59:33 +0000
Date: Tue, 07 Apr 2026 11:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.19/prjc 13/22] kernel/sched/alt_core.c:7604:20:
 error: redefinition of 'sched_mm_cid_fork'
Message-ID: <202604051625.Qj3YbVDl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 6.19/prjc
head:   14ff03aebefa493a7d7ecfcbff66ded1147dba3e
commit: 6a25699be0085c1c1ba0db370149e7256773b2e1 [13/22] sched/alt: [Sync] f0189d49282e sched/mmcid: Prevent CID stalls due to concurrent forks
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260405/202604051625.Qj3YbVDl-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051625.Qj3YbVDl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051625.Qj3YbVDl-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c:1464:6: error: redefinition of 'set_task_cpu'
    1464 | void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
         |      ^~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:15:
   include/linux/sched.h:2261:20: note: previous definition of 'set_task_cpu' with type 'void(struct task_struct *, unsigned int)'
    2261 | static inline void set_task_cpu(struct task_struct *p, unsigned int cpu)
         |                    ^~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:6220:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Wimplicit-function-declaration]
    6220 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6220:57: error: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    6220 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37:
   include/linux/cpumask.h:155:73: note: expected 'const struct cpumask *' but argument is of type 'int'
     155 | static __always_inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                                   ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:6222:45: error: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6222 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6196:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6196 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:714:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     714 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:6222:45: error: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    6222 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6197:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6197 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:932:63: note: expected 'const struct cpumask *' but argument is of type 'int'
     932 | void cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from include/linux/sched.h:16:
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   kernel/sched/alt_core.c:6202:55: note: in expansion of macro 'cpumask_bits'
    6202 |                 bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),       \
         |                                                       ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6222:17: note: in expansion of macro 'TOPOLOGY_CPUMASK'
    6222 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                 ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
>> kernel/sched/alt_core.c:7604:20: error: redefinition of 'sched_mm_cid_fork'
    7604 | static inline void sched_mm_cid_fork(struct task_struct *t) { }
         |                    ^~~~~~~~~~~~~~~~~
   include/linux/sched.h:2360:20: note: previous definition of 'sched_mm_cid_fork' with type 'void(struct task_struct *)'
    2360 | static inline void sched_mm_cid_fork(struct task_struct *t) { }
         |                    ^~~~~~~~~~~~~~~~~


vim +/sched_mm_cid_fork +7604 kernel/sched/alt_core.c

  7586	
  7587	void mm_init_cid(struct mm_struct *mm, struct task_struct *p)
  7588	{
  7589		mm->mm_cid.max_cids = 0;
  7590		mm->mm_cid.mode = 0;
  7591		mm->mm_cid.nr_cpus_allowed = p->nr_cpus_allowed;
  7592		mm->mm_cid.users = 0;
  7593		mm->mm_cid.pcpu_thrs = 0;
  7594		mm->mm_cid.update_deferred = 0;
  7595		raw_spin_lock_init(&mm->mm_cid.lock);
  7596		mutex_init(&mm->mm_cid.mutex);
  7597		mm->mm_cid.irq_work = IRQ_WORK_INIT_HARD(mm_cid_irq_work);
  7598		INIT_WORK(&mm->mm_cid.work, mm_cid_work_fn);
  7599		cpumask_copy(mm_cpus_allowed(mm), &p->cpus_mask);
  7600		bitmap_zero(mm_cidmask(mm), num_possible_cpus());
  7601	}
  7602	#else /* CONFIG_SCHED_MM_CID */
  7603	static inline void mm_update_cpus_allowed(struct mm_struct *mm, const struct cpumask *affmsk) { }
> 7604	static inline void sched_mm_cid_fork(struct task_struct *t) { }
  7605	#endif /* !CONFIG_SCHED_MM_CID */
  7606	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
