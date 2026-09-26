Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9EB4078E4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 10:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418974; cv=none; b=l+LCeVibZb2nIDgg/jEI0e6U5pYWGykF8kVFxKRwY6GYovz/i+Y6FdWrYSVV9oGQm3cVzi63U0IE39wrJOMW/fZ3v2dOUVt41eWO3GIUj8PiGNJbG5W2InuFo/HpXuvmCn8lCvjiSOSc8iLZ55OHZ3ZzpFxGExBWk66Eiyt6KdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418974; c=relaxed/simple;
	bh=iQgB4oWuE2539pfQDj1K4HuJzS3ZMC2fjfhRJHAODG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RplqHKb9bL4MxvT5XvrhAB2aB7CTg928ddiGeCBst2OC5eFXfTgOVzNaQO5z180OeyjtngAijaaz7q1hlQjTS+g12Ad4uBIjuD9yXcy61HYK2XHiRZNFaE8coE95Ur6ZvauPUNjX2w/YKauxCWOaHlhu4Me4gkXhBphVYB1Du2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvD1vX0E; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvD1vX0E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790418967; x=1821954967;
  h=date:from:to:cc:subject:message-id;
  bh=iQgB4oWuE2539pfQDj1K4HuJzS3ZMC2fjfhRJHAODG8=;
  b=DvD1vX0Ejmme/GJm1OFBGghP0xbwlsGbf5A09ma4E00MPR2W3uiWqvAB
   xyqSfA6ts/rKLsvhPQXAdx0MvPEnVqYFM9uyWQWFPnlkjB/GCHEOOFegZ
   6YD7+fMX+LFP/0ln8Vb5Nve/DE6HwqTNlnEPzP/AH3PjvkzvqXvDb4Epe
   W0iyRYuxyfZrI5AKtKKXFdLbquPtZKAhkBsQ2+1rFh+JLTm0qicU/mXCI
   jKMyhkID+yOrc4YEL9E/niJv4KjBmuZtc6tb3GgVRSmjYpE3ckQqlpEK5
   1dmxCIgHo3sUcO3BJhHsvCFUE55lCEIkm2uagz3LLR/KX5Ch4+QPnxJny
   Q==;
X-CSE-ConnectionGUID: EhsiLD7VTkaDMSwgR5j7fQ==
X-CSE-MsgGUID: qHslIZ44T6+nPQI2ku4wAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102555334"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="102555334"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 03:36:02 -0700
X-CSE-ConnectionGUID: 7CyMXHtuQ3iUTY0tVyJ01A==
X-CSE-MsgGUID: QEvnT83UToKaYiTdNqtKeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="304051945"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2026 03:36:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAPl8-00000000Lib-2cjg;
	Sat, 26 Sep 2026 10:35:58 +0000
Date: Sat, 26 Sep 2026 18:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 57/119] kernel/sched/alt_core.c:6468:50:
 error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer
 without a cast
Message-ID: <202609261834.cMDRawIt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   998c50092be8097be2939c7272c5cb9f0d143081
commit: 46ef77681e026cafee56306f59871ab4760809af [57/119] sched/alt: Auto-detect heterogeneous CPU topology
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260926/202609261834.cMDRawIt-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261834.cMDRawIt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261834.cMDRawIt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from arch/mips/include/asm/processor.h:15,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/current.h:6,
                    from ./arch/mips/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c: In function 'sched_assign_llc_id':
   kernel/sched/alt_core.c:6402:32: error: implicit declaration of function 'cpu_coregroup_mask' [-Wimplicit-function-declaration]
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
   kernel/sched/alt_core.c:6455:21: error: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6455 |                     cpu_coregroup_mask(cpu));
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     int
   include/linux/cpumask.h:716:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     716 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15:
>> kernel/sched/alt_core.c:6468:50: error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
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
   include/linux/cpumask.h:883:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     883 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_add_cpu':
>> kernel/sched/alt_core.c:6486:41: error: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6486 |         if (cpumask_test_cpu(added_cpu, cpu_coregroup_mask(cpu)))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   include/linux/cpumask.h:649:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     649 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
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
   kernel/sched/alt_core.c:6512:58: error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
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
   include/linux/cpumask.h:883:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     883 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_activate_update':
   kernel/sched/alt_core.c:6552:48: error: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6552 |                 if (cpumask_test_cpu(incoming, cpu_coregroup_mask(cpu)))
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                int
   include/linux/cpumask.h:649:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     649 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   kernel/sched/alt_core.c:6556:58: error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6556 |                                                          cpu_coregroup_mask(cpu)));
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6554:33: note: in expansion of macro 'max_t'
    6554 |                                 max_t(int, 1,
         |                                 ^~~~~
   include/linux/cpumask.h:883:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     883 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~


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
