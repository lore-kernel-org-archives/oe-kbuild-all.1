Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BB0446C1B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246583; cv=none; b=Wc6R1uxBo/v/Ll0v7H042LtGRuS5pnjWye6/hcybF8cecnpCALXFSW35jVtv7eMesWkYYrso5Z1brUz6nADexhDY6Tj2BmLcMBSHnTwOvI0ncGhbMZm9lZHXzEalT0f2VsbKKQcANAVm6BR78DFwtKVdv5rbHydUToA5Eifqda0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246583; c=relaxed/simple;
	bh=w0xGDA8eqAuD/KPk72u60iw7uKrO9ELPBLuh+xW/3gg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eJVbttByD5wjr4a0VNrzx57X8CCx4gU+NhoxDc8ZXmO/UhY0u9xkzwH5GRCdwD3ifrY09iYYaoIqOSs/ZoKo8ISq/3BP2hG+UfSj6yE4rftim8lNOVwYX5tBXfLG80rk5MEMYLr7t8OSGh4Tq57s2d0YqDC3rlwO4ITBK09YjAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJXBctp8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJXBctp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785246581; x=1816782581;
  h=date:from:to:cc:subject:message-id;
  bh=w0xGDA8eqAuD/KPk72u60iw7uKrO9ELPBLuh+xW/3gg=;
  b=QJXBctp8+96U67pM5Y+cuzKe1H0ZGn10cDNzfUMunJe510KQi2nm2J12
   IVkQaJWEeb9lP4I3kqLwVj93oKZTNKvSsgRcrWr7jhzGOMqQTwuLhxQ37
   lTx3y7gTQQsji0q1Qck2WJqFMh7gFQ8EPJEnlqdeUMGqQSjHRbu+WepLC
   EmyR/10XsIguP/TcwocKkeIadVsWZXGpwQCLVLjILcrxAADq5WHZJQ8qe
   BE6iLftz1FJhKd48cYTuVj+O3ddpkICumjJfnDKxS5IIAy6U14ctV0VYf
   rux6mahB156VlxAVNtio4lWAlxufv9z8aOlkMZKqxW19bt2nsrnK4izdd
   Q==;
X-CSE-ConnectionGUID: tTSLFwFQT5eAUtmoKmmFgg==
X-CSE-MsgGUID: sLtHR++QRFK6UexozO1cbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96983787"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="96983787"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 06:49:38 -0700
X-CSE-ConnectionGUID: 99YXM2MWTDqev5wZ1nWYhA==
X-CSE-MsgGUID: TlFi2EsrRsSjc+hnjbv+WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="257913816"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Jul 2026 06:49:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woiBa-00000000ePF-2BAD;
	Tue, 28 Jul 2026 13:49:34 +0000
Date: Tue, 28 Jul 2026 21:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/prjc 36/39] kernel/sched/alt_core.c:6442:50: error:
 passing argument 2 of 'cpumask_weight_and' makes pointer from integer without
 a cast
Message-ID: <202607282116.6hdxgctZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/prjc
head:   a87d4f75d93e513e42f498eae7214c385874cf8e
commit: 4878c61929d676359794533c9e16d420c5f24b26 [36/39] sched/alt: Auto-detect heterogeneous CPU topology
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260728/202607282116.6hdxgctZ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607282116.6hdxgctZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607282116.6hdxgctZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c: In function 'finish_task_switch':
   kernel/sched/alt_core.c:3714:9: error: too few arguments to function 'blk_plug_invalidate_ts'; expected 1, have 0
    3714 |         blk_plug_invalidate_ts();
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:28:
   include/linux/blkdev.h:1220:20: note: declared here
    1220 | static inline void blk_plug_invalidate_ts(struct task_struct *tsk)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c: In function 'sched_assign_llc_id':
   kernel/sched/alt_core.c:6376:32: error: implicit declaration of function 'cpu_coregroup_mask' [-Wimplicit-function-declaration]
    6376 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |                                ^~~~~~~~~~~~~~~~~~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:410:31: note: in expansion of macro 'cpumask_bits'
     410 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6376:9: note: in expansion of macro 'for_each_cpu_and'
    6376 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:410:31: note: in expansion of macro 'cpumask_bits'
     410 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6376:9: note: in expansion of macro 'for_each_cpu_and'
    6376 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
   include/linux/find.h:588:72: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                                                        ^
   include/linux/cpumask.h:410:9: note: in expansion of macro 'for_each_and_bit'
     410 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6376:9: note: in expansion of macro 'for_each_cpu_and'
    6376 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_build_topology_cpumask':
   kernel/sched/alt_core.c:6429:21: error: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6429 |                     cpu_coregroup_mask(cpu));
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     int
   include/linux/cpumask.h:714:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     714 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15:
>> kernel/sched/alt_core.c:6442:50: error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6442 |                                                  cpu_coregroup_mask(cpu)));
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6441:17: note: in expansion of macro 'max_t'
    6441 |                 max_t(int, 1, cpumask_weight_and(active_mask,
         |                 ^~~~~
   include/linux/cpumask.h:881:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     881 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_add_cpu':
>> kernel/sched/alt_core.c:6460:41: error: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6460 |         if (cpumask_test_cpu(added_cpu, cpu_coregroup_mask(cpu)))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   include/linux/cpumask.h:647:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     647 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_update_llc_size':
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:410:31: note: in expansion of macro 'cpumask_bits'
     410 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6483:9: note: in expansion of macro 'for_each_cpu_and'
    6483 |         for_each_cpu_and(cpu, cpu_coregroup_mask(changed_cpu), active_mask)
         |         ^~~~~~~~~~~~~~~~
   include/linux/find.h:588:72: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                                                        ^
   include/linux/cpumask.h:410:9: note: in expansion of macro 'for_each_and_bit'
     410 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6483:9: note: in expansion of macro 'for_each_cpu_and'
    6483 |         for_each_cpu_and(cpu, cpu_coregroup_mask(changed_cpu), active_mask)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6486:58: error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6486 |                                                          cpu_coregroup_mask(cpu)));
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6485:25: note: in expansion of macro 'max_t'
    6485 |                         max_t(int, 1, cpumask_weight_and(active_mask,
         |                         ^~~~~
   include/linux/cpumask.h:881:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     881 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_activate_update':
   kernel/sched/alt_core.c:6526:48: error: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6526 |                 if (cpumask_test_cpu(incoming, cpu_coregroup_mask(cpu)))
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                int
   include/linux/cpumask.h:647:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     647 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   kernel/sched/alt_core.c:6530:58: error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6530 |                                                          cpu_coregroup_mask(cpu)));
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6528:33: note: in expansion of macro 'max_t'
    6528 |                                 max_t(int, 1,
         |                                 ^~~~~
   include/linux/cpumask.h:881:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     881 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~


vim +/cpumask_weight_and +6442 kernel/sched/alt_core.c

  6411	
  6412	static bool sched_build_topology_cpumask(int cpu,
  6413						 const struct cpumask *active_mask)
  6414	{
  6415		cpumask_t *topo = per_cpu(sched_cpu_topo_masks, cpu);
  6416		bool llc_id_merged;
  6417		int level;
  6418	
  6419		for (level = 0; level < NR_CPU_AFFINITY_LEVELS; level++)
  6420			cpumask_clear(topo + level);
  6421	
  6422	#ifdef CONFIG_SCHED_SMT
  6423		cpumask_and(topo + SCHED_CPU_AFFINITY_SMT, active_mask,
  6424			    topology_sibling_cpumask(cpu));
  6425	#endif /* CONFIG_SCHED_SMT */
  6426		cpumask_and(topo + SCHED_CPU_AFFINITY_CLUSTER, active_mask,
  6427			    topology_cluster_cpumask(cpu));
  6428		cpumask_and(topo + SCHED_CPU_AFFINITY_LLC, active_mask,
  6429			    cpu_coregroup_mask(cpu));
  6430		cpumask_and(topo + SCHED_CPU_AFFINITY_CORE, active_mask,
  6431			    topology_core_cpumask(cpu));
  6432		cpumask_copy(topo + SCHED_CPU_AFFINITY_OTHER, active_mask);
  6433	
  6434		per_cpu(sched_cpu_llc_mask, cpu) =
  6435			topo + SCHED_CPU_AFFINITY_LLC;
  6436		per_cpu(sched_cpu_topo_end_mask, cpu) =
  6437			topo + NR_CPU_AFFINITY_LEVELS;
  6438	
  6439		llc_id_merged = sched_assign_llc_id(cpu, active_mask);
  6440		per_cpu(sd_llc_size, cpu) =
  6441			max_t(int, 1, cpumask_weight_and(active_mask,
> 6442							 cpu_coregroup_mask(cpu)));
  6443		per_cpu(sched_cpu_topology_valid, cpu) = true;
  6444	
  6445		return llc_id_merged;
  6446	}
  6447	
  6448	static void sched_topology_add_cpu(int cpu, int added_cpu)
  6449	{
  6450		cpumask_t *topo = per_cpu(sched_cpu_topo_masks, cpu);
  6451	
  6452	#ifdef CONFIG_SCHED_SMT
  6453		if (cpumask_test_cpu(added_cpu, topology_sibling_cpumask(cpu)))
  6454			cpumask_set_cpu(added_cpu,
  6455					topo + SCHED_CPU_AFFINITY_SMT);
  6456	#endif
  6457		if (cpumask_test_cpu(added_cpu, topology_cluster_cpumask(cpu)))
  6458			cpumask_set_cpu(added_cpu,
  6459					topo + SCHED_CPU_AFFINITY_CLUSTER);
> 6460		if (cpumask_test_cpu(added_cpu, cpu_coregroup_mask(cpu)))
  6461			cpumask_set_cpu(added_cpu,
  6462					topo + SCHED_CPU_AFFINITY_LLC);
  6463		if (cpumask_test_cpu(added_cpu, topology_core_cpumask(cpu)))
  6464			cpumask_set_cpu(added_cpu,
  6465					topo + SCHED_CPU_AFFINITY_CORE);
  6466		cpumask_set_cpu(added_cpu, topo + SCHED_CPU_AFFINITY_OTHER);
  6467	}
  6468	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
