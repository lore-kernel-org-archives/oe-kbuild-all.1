Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045309;
	b=yyUGEuYNg91H+lRbDMwboCKalv6He9ZmQ56K2yGSvVKm2FSjh1wdQwJxzNFMUADbqZ6h
	 5PlwwLUFuU894iIUZu5BDTyy7ivg4cAj6Ze1xZUjO8PyBl7k1hClsuz6afgwKuouHSYXp
	 UrmQzIFIMwn/CmTnYVFKE8kP0U+1jxBnGvdeqKFJt64xGD7m6ly0fh1Lzi3iMH1EOyNzN
	 15Y4TI9o8ryPepGSmlEVx7Xu3pdkBIZzItYeUHdifufC3txeQmRCiXh+cY/ZRhzJBmn11
	 yIVG488GcH5HzqNhOSkaEn7J0qAVDvNi+aVfmxg8b6gLEWN3o4q2+C/0pIL0OSfUibg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045309;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IcL1CnB/s9JPWD+zd2pSQ741Fxfch6YFjvlocwzqJLQ=;
	b=b/756NO+ZMs8D70EfWB+fafWELxEEWWrl1RiBTwks+PvrkBrp63DtDbKFDpC2ghJKs6Z
	 Tc8TnmL1TjWCXxp4SKCAystkRZ8sLYalitxAAd2RJan9t3DqZEKO6Giz6Q1cGd6yg+Xc+
	 VJPzpos4GcCyT9RIhfwaFi7acYdt81ZVjgK3IeSbXYS11/1oKXce0Z26hwWSkGLT5F/g8
	 wCKiCIuEr80UiAY3wfpz60ESHlwz/i/bmpKIRTeE0x4VTAUSygrQWBnsQCHnG+kI1J1A1
	 RAOgwyfRMWfPh2OIXX6igW1IhWs8ms45YrLhFipwPV95kdYiSl+S9aaYQIIqG5KZahw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZY0t4oYe;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA685606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 20:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA685606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZY0t4oYe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793045308; x=1824581308;
  h=date:from:to:cc:subject:message-id;
  bh=fBCofRy2aNw7B6YrGPrxgqlwZdvQBdDxwSAqnO8LWK0=;
  b=ZY0t4oYeUjp3o34A6x5P3aJvKP182IAM4IZG7Nq8g8+kWZkwfJn1sjQ/
   lcM+bIAqgjRC/22iZTO3pcNSaaU7fqto1N4UOcH+8ZZ6KxwOGPZovD6Wd
   pJ7XCMnGC2Sz0fi553X6gTeNmmtMuXYCjGmqZNovvkNSoPWA7BdSB0g8G
   /EoR4vbon3s5ZtDYdFNtEOveKQRatch9U0zKaZA/OPwIKVoFsResNG0Z1
   FGzEpVtmOhWVthbL36CWHc9U5Ktd7XypNKRY5aifIdNUXideRnzYUvBb3
   8Jp484hrtTZHTAV+DVQ0RdKWzSEHZKIzvBHHiiqpTAR02+RBjwScitTqO
   A==;
X-CSE-ConnectionGUID: MrHZHFlNSOKhtnjxGgHI1g==
X-CSE-MsgGUID: RZUmQfIVSWiwCZF8eqdE+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1735434"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1735434"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 13:08:27 -0700
X-CSE-ConnectionGUID: 31I10aqbS1ubmHO2Uy9v4g==
X-CSE-MsgGUID: qWcpQZ7iRZ+ouZLu9xzl2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4749973"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 26 Oct 2026 13:08:25 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLQzX-000000004DP-2bc0;
	Mon, 26 Oct 2026 20:08:23 +0000
Date: Mon, 26 Oct 2026 21:07:32 +0100
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.3/prjc 40/61] kernel/sched/alt_core.c:6372:50:
 warning: passing argument 2 of 'cpumask_weight_and' makes pointer from
 integer without a cast
Message-ID: <202610262127.HFo3LQlX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/zen-kernel/zen-kernel 7.3/prjc
head:   f1ab44d828f1d74c6ec1d7a6cf32bc79cec13905
commit: 085f3d8e9436e9f2d51355bd42da186dcd065051 [40/61] sched/alt: Auto-detect heterogeneous CPU topology
config: nios2-randconfig-r2106-20261026 (https://download.01.org/0day-ci/archive/20261026/202610262127.HFo3LQlX-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610262127.HFo3LQlX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610262127.HFo3LQlX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:1474:6: error: redefinition of 'set_task_cpu'
    1474 | void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
         |      ^~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:15:
   include/linux/sched.h:2327:20: note: previous definition of 'set_task_cpu' with type 'void(struct task_struct *, unsigned int)'
    2327 | static inline void set_task_cpu(struct task_struct *p, unsigned int cpu)
         |                    ^~~~~~~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c: In function 'sched_assign_llc_id':
   kernel/sched/alt_core.c:6306:32: error: implicit declaration of function 'cpu_coregroup_mask' [-Werror=implicit-function-declaration]
    6306 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |                                ^~~~~~~~~~~~~~~~~~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:411:31: note: in expansion of macro 'cpumask_bits'
     411 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6306:9: note: in expansion of macro 'for_each_cpu_and'
    6306 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:411:31: note: in expansion of macro 'cpumask_bits'
     411 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6306:9: note: in expansion of macro 'for_each_cpu_and'
    6306 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
   include/linux/find.h:588:72: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                                                        ^
   include/linux/cpumask.h:411:9: note: in expansion of macro 'for_each_and_bit'
     411 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6306:9: note: in expansion of macro 'for_each_cpu_and'
    6306 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_build_topology_cpumask':
   kernel/sched/alt_core.c:6359:21: warning: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6359 |                     cpu_coregroup_mask(cpu));
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     int
   In file included from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:715:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     715 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
>> kernel/sched/alt_core.c:6372:50: warning: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6372 |                                                  cpu_coregroup_mask(cpu)));
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6371:17: note: in expansion of macro 'max_t'
    6371 |                 max_t(int, 1, cpumask_weight_and(active_mask,
         |                 ^~~~~
   In file included from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:882:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     882 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_add_cpu':
>> kernel/sched/alt_core.c:6390:41: warning: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6390 |         if (cpumask_test_cpu(added_cpu, cpu_coregroup_mask(cpu)))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   In file included from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:648:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     648 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c: In function 'sched_topology_update_llc_size':
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:411:31: note: in expansion of macro 'cpumask_bits'
     411 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6413:9: note: in expansion of macro 'for_each_cpu_and'
    6413 |         for_each_cpu_and(cpu, cpu_coregroup_mask(changed_cpu), active_mask)
         |         ^~~~~~~~~~~~~~~~
   include/linux/find.h:588:72: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                                                        ^
   include/linux/cpumask.h:411:9: note: in expansion of macro 'for_each_and_bit'
     411 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6413:9: note: in expansion of macro 'for_each_cpu_and'
    6413 |         for_each_cpu_and(cpu, cpu_coregroup_mask(changed_cpu), active_mask)
         |         ^~~~~~~~~~~~~~~~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c:6416:58: warning: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6416 |                                                          cpu_coregroup_mask(cpu)));
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6415:25: note: in expansion of macro 'max_t'
    6415 |                         max_t(int, 1, cpumask_weight_and(active_mask,
         |                         ^~~~~
   In file included from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:882:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     882 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_activate_update':
   kernel/sched/alt_core.c:6456:48: warning: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6456 |                 if (cpumask_test_cpu(incoming, cpu_coregroup_mask(cpu)))
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                int
   In file included from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:648:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     648 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/sched.h:38,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c:6460:58: warning: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6460 |                                                          cpu_coregroup_mask(cpu)));
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })


vim +/cpumask_weight_and +6372 kernel/sched/alt_core.c

  6341	
  6342	static bool sched_build_topology_cpumask(int cpu,
  6343						 const struct cpumask *active_mask)
  6344	{
  6345		cpumask_t *topo = per_cpu(sched_cpu_topo_masks, cpu);
  6346		bool llc_id_merged;
  6347		int level;
  6348	
  6349		for (level = 0; level < NR_CPU_AFFINITY_LEVELS; level++)
  6350			cpumask_clear(topo + level);
  6351	
  6352	#ifdef CONFIG_SCHED_SMT
  6353		cpumask_and(topo + SCHED_CPU_AFFINITY_SMT, active_mask,
  6354			    topology_sibling_cpumask(cpu));
  6355	#endif /* CONFIG_SCHED_SMT */
  6356		cpumask_and(topo + SCHED_CPU_AFFINITY_CLUSTER, active_mask,
  6357			    topology_cluster_cpumask(cpu));
  6358		cpumask_and(topo + SCHED_CPU_AFFINITY_LLC, active_mask,
  6359			    cpu_coregroup_mask(cpu));
  6360		cpumask_and(topo + SCHED_CPU_AFFINITY_CORE, active_mask,
  6361			    topology_core_cpumask(cpu));
  6362		cpumask_copy(topo + SCHED_CPU_AFFINITY_OTHER, active_mask);
  6363	
  6364		per_cpu(sched_cpu_llc_mask, cpu) =
  6365			topo + SCHED_CPU_AFFINITY_LLC;
  6366		per_cpu(sched_cpu_topo_end_mask, cpu) =
  6367			topo + NR_CPU_AFFINITY_LEVELS;
  6368	
  6369		llc_id_merged = sched_assign_llc_id(cpu, active_mask);
  6370		per_cpu(sd_llc_size, cpu) =
  6371			max_t(int, 1, cpumask_weight_and(active_mask,
> 6372							 cpu_coregroup_mask(cpu)));
  6373		per_cpu(sched_cpu_topology_valid, cpu) = true;
  6374	
  6375		return llc_id_merged;
  6376	}
  6377	
  6378	static void sched_topology_add_cpu(int cpu, int added_cpu)
  6379	{
  6380		cpumask_t *topo = per_cpu(sched_cpu_topo_masks, cpu);
  6381	
  6382	#ifdef CONFIG_SCHED_SMT
  6383		if (cpumask_test_cpu(added_cpu, topology_sibling_cpumask(cpu)))
  6384			cpumask_set_cpu(added_cpu,
  6385					topo + SCHED_CPU_AFFINITY_SMT);
  6386	#endif
  6387		if (cpumask_test_cpu(added_cpu, topology_cluster_cpumask(cpu)))
  6388			cpumask_set_cpu(added_cpu,
  6389					topo + SCHED_CPU_AFFINITY_CLUSTER);
> 6390		if (cpumask_test_cpu(added_cpu, cpu_coregroup_mask(cpu)))
  6391			cpumask_set_cpu(added_cpu,
  6392					topo + SCHED_CPU_AFFINITY_LLC);
  6393		if (cpumask_test_cpu(added_cpu, topology_core_cpumask(cpu)))
  6394			cpumask_set_cpu(added_cpu,
  6395					topo + SCHED_CPU_AFFINITY_CORE);
  6396		cpumask_set_cpu(added_cpu, topo + SCHED_CPU_AFFINITY_OTHER);
  6397	}
  6398	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
