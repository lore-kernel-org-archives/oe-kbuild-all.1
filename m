Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC7B2CCC5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 22:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770828; cv=none; b=rcs1wSePFJgZh4//ENfQblb33xFJdOCRuNoYiX2QkJ0omTRj3JobchEDO4jh2W56uXecGWwt9kp50O4MW4xgqI6rQ3WZhF3oGTUkx9t4XVfYD6d5wieewcF5wu8CpSJs2DQFpqBYUnnw9aCelRgWJCwBMjqRPXqGXgCYPMCA+xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770828; c=relaxed/simple;
	bh=Sigwt3duMsEZGh+E2KCDFhw4Gh6Tj6ZA2A3CYSqMQ74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C5Fk07hUzsL7SCsz6oQ4dPyjDvGZZB/BUKTC4liAfkxgEXPzqCePenuNfPNsnnM4nVw0Y2kotrW2T4w31N/32V7r03cv22Ja4wr7/RrQyxeT/StUc9BW9fTVSa2d5UFXIUoIiuorlc/5tsuEeMteMe4+0zVDCdqa/afpotkaMLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EM8Emfj+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EM8Emfj+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789770826; x=1821306826;
  h=date:from:to:cc:subject:message-id;
  bh=Sigwt3duMsEZGh+E2KCDFhw4Gh6Tj6ZA2A3CYSqMQ74=;
  b=EM8Emfj+4XrvC9WQ8dMISW0V35HNY+CNpcd1V5jzGu2pjpJoIYfUlMK6
   FZoMEdoz6bKLuYrb67nDmHd3h1QS83eMqdSsHwPONKe+8cTWvZh6RpXcU
   HJTjVw5FhVqh7Mc3Lpk0qRSTqNwRsaiR4wUJsI0uAOkPUax5t4of6Z+jz
   ZJLU4jMbUCM3wI5vLUrnoJO2PCuIUuiNXBHrepm6bw+rXHGkl6KZ0H672
   ZNumw2H/8vB9mAL7nugf2J7HxijDbyg/Sj+uyNreUIeK6DIkdPqxIeCS0
   14L7NBzI1kb+u/TWwZ/r26cQUnmTK2qBpzVo+ecvYuVNuWELk4JzQ7BT9
   A==;
X-CSE-ConnectionGUID: xWes+npxQeGEpOpl36hNTA==
X-CSE-MsgGUID: f/vCC3YVQ3Sr1kZJOWXwdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90436881"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90436881"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 15:33:45 -0700
X-CSE-ConnectionGUID: i7JHRi6SRliA+R5Wy/V3Pw==
X-CSE-MsgGUID: 7n3PyAnSSiyjaeTXynvrjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="299707012"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Sep 2026 15:33:43 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7h9I-00000000AQb-3iLZ;
	Fri, 18 Sep 2026 22:33:40 +0000
Date: Sat, 19 Sep 2026 06:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 57/118] kernel/sched/alt_core.c:6468:50:
 warning: passing argument 2 of 'cpumask_weight_and' makes pointer from
 integer without a cast
Message-ID: <202609190606.X6kjd13M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   ecdb5900a34a8291a8457c0e29cca911c55dbf67
commit: 46ef77681e026cafee56306f59871ab4760809af [57/118] sched/alt: Auto-detect heterogeneous CPU topology
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260919/202609190606.X6kjd13M-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190606.X6kjd13M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190606.X6kjd13M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:1468:6: error: redefinition of 'set_task_cpu'
    1468 | void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
         |      ^~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:15:
   include/linux/sched.h:2311:20: note: previous definition of 'set_task_cpu' with type 'void(struct task_struct *, unsigned int)'
    2311 | static inline void set_task_cpu(struct task_struct *p, unsigned int cpu)
         |                    ^~~~~~~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c: In function 'sched_assign_llc_id':
   kernel/sched/alt_core.c:6402:32: error: implicit declaration of function 'cpu_coregroup_mask' [-Werror=implicit-function-declaration]
    6402 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |                                ^~~~~~~~~~~~~~~~~~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:412:31: note: in expansion of macro 'cpumask_bits'
     412 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6402:9: note: in expansion of macro 'for_each_cpu_and'
    6402 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:412:31: note: in expansion of macro 'cpumask_bits'
     412 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6402:9: note: in expansion of macro 'for_each_cpu_and'
    6402 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
   include/linux/find.h:588:72: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                                                        ^
   include/linux/cpumask.h:412:9: note: in expansion of macro 'for_each_and_bit'
     412 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6402:9: note: in expansion of macro 'for_each_cpu_and'
    6402 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_build_topology_cpumask':
   kernel/sched/alt_core.c:6455:21: warning: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6455 |                     cpu_coregroup_mask(cpu));
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     int
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:716:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     716 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
>> kernel/sched/alt_core.c:6468:50: warning: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6468 |                                                  cpu_coregroup_mask(cpu)));
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6467:17: note: in expansion of macro 'max_t'
    6467 |                 max_t(int, 1, cpumask_weight_and(active_mask,
         |                 ^~~~~
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:883:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     883 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_add_cpu':
>> kernel/sched/alt_core.c:6486:41: warning: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6486 |         if (cpumask_test_cpu(added_cpu, cpu_coregroup_mask(cpu)))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:649:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     649 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c: In function 'sched_topology_update_llc_size':
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:412:31: note: in expansion of macro 'cpumask_bits'
     412 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6509:9: note: in expansion of macro 'for_each_cpu_and'
    6509 |         for_each_cpu_and(cpu, cpu_coregroup_mask(changed_cpu), active_mask)
         |         ^~~~~~~~~~~~~~~~
   include/linux/find.h:588:72: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                                                        ^
   include/linux/cpumask.h:412:9: note: in expansion of macro 'for_each_and_bit'
     412 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6509:9: note: in expansion of macro 'for_each_cpu_and'
    6509 |         for_each_cpu_and(cpu, cpu_coregroup_mask(changed_cpu), active_mask)
         |         ^~~~~~~~~~~~~~~~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c:6512:58: warning: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6512 |                                                          cpu_coregroup_mask(cpu)));
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6511:25: note: in expansion of macro 'max_t'
    6511 |                         max_t(int, 1, cpumask_weight_and(active_mask,
         |                         ^~~~~
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:883:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     883 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_activate_update':
   kernel/sched/alt_core.c:6552:48: warning: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6552 |                 if (cpumask_test_cpu(incoming, cpu_coregroup_mask(cpu)))
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                int
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:649:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     649 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c:6556:58: warning: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6556 |                                                          cpu_coregroup_mask(cpu)));
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })


vim +/cpumask_weight_and +6468 kernel/sched/alt_core.c

  6437	
  6438	static bool sched_build_topology_cpumask(int cpu,
  6439						 const struct cpumask *active_mask)
  6440	{
  6441		cpumask_t *topo = per_cpu(sched_cpu_topo_masks, cpu);
  6442		bool llc_id_merged;
  6443		int level;
  6444	
  6445		for (level = 0; level < NR_CPU_AFFINITY_LEVELS; level++)
  6446			cpumask_clear(topo + level);
  6447	
  6448	#ifdef CONFIG_SCHED_SMT
  6449		cpumask_and(topo + SCHED_CPU_AFFINITY_SMT, active_mask,
  6450			    topology_sibling_cpumask(cpu));
  6451	#endif /* CONFIG_SCHED_SMT */
  6452		cpumask_and(topo + SCHED_CPU_AFFINITY_CLUSTER, active_mask,
  6453			    topology_cluster_cpumask(cpu));
  6454		cpumask_and(topo + SCHED_CPU_AFFINITY_LLC, active_mask,
  6455			    cpu_coregroup_mask(cpu));
  6456		cpumask_and(topo + SCHED_CPU_AFFINITY_CORE, active_mask,
  6457			    topology_core_cpumask(cpu));
  6458		cpumask_copy(topo + SCHED_CPU_AFFINITY_OTHER, active_mask);
  6459	
  6460		per_cpu(sched_cpu_llc_mask, cpu) =
  6461			topo + SCHED_CPU_AFFINITY_LLC;
  6462		per_cpu(sched_cpu_topo_end_mask, cpu) =
  6463			topo + NR_CPU_AFFINITY_LEVELS;
  6464	
  6465		llc_id_merged = sched_assign_llc_id(cpu, active_mask);
  6466		per_cpu(sd_llc_size, cpu) =
  6467			max_t(int, 1, cpumask_weight_and(active_mask,
> 6468							 cpu_coregroup_mask(cpu)));
  6469		per_cpu(sched_cpu_topology_valid, cpu) = true;
  6470	
  6471		return llc_id_merged;
  6472	}
  6473	
  6474	static void sched_topology_add_cpu(int cpu, int added_cpu)
  6475	{
  6476		cpumask_t *topo = per_cpu(sched_cpu_topo_masks, cpu);
  6477	
  6478	#ifdef CONFIG_SCHED_SMT
  6479		if (cpumask_test_cpu(added_cpu, topology_sibling_cpumask(cpu)))
  6480			cpumask_set_cpu(added_cpu,
  6481					topo + SCHED_CPU_AFFINITY_SMT);
  6482	#endif
  6483		if (cpumask_test_cpu(added_cpu, topology_cluster_cpumask(cpu)))
  6484			cpumask_set_cpu(added_cpu,
  6485					topo + SCHED_CPU_AFFINITY_CLUSTER);
> 6486		if (cpumask_test_cpu(added_cpu, cpu_coregroup_mask(cpu)))
  6487			cpumask_set_cpu(added_cpu,
  6488					topo + SCHED_CPU_AFFINITY_LLC);
  6489		if (cpumask_test_cpu(added_cpu, topology_core_cpumask(cpu)))
  6490			cpumask_set_cpu(added_cpu,
  6491					topo + SCHED_CPU_AFFINITY_CORE);
  6492		cpumask_set_cpu(added_cpu, topo + SCHED_CPU_AFFINITY_OTHER);
  6493	}
  6494	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
