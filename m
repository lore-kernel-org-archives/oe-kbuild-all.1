Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB1345D5E7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791296679; cv=none; b=kgyBFrB/rG5gddvpUs8EyaGICKiJgR1Vh7AmCy3X8U03P5lZIIU9Fg/xIAFkn1rcdsI6/sde6xYbHNtIIHJ/QV6gihkVtOIYBpttwuo8CiNpNjo7igvOPLlk4jk/EGm0a4cs/ZDZ9AIUa4oSX4DLqrwiqbRHFxlBW/OBJgcPwbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791296679; c=relaxed/simple;
	bh=3nPv2j+GKPeVxF+asypV/oKOXpJImriNLGFyyoV0DvY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NQ9PpNKek8SurCvFXNLPa1v86MdA5gAZ2Rv0JHutja8fDiLyd3xx4bpKvqtkH7h30ZkmuZQogxrgqBYdFKM5iqZXYEJfzl+290ty7Bw5J2Fde1oU2OzLhiAlbTrtLQd6VlSAVk9Uep5tbMN7kMI8UYohhTxbWcOofYOuRRZECno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhCSb9XH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhCSb9XH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791296677; x=1822832677;
  h=date:from:to:cc:subject:message-id;
  bh=3nPv2j+GKPeVxF+asypV/oKOXpJImriNLGFyyoV0DvY=;
  b=BhCSb9XH+4Go9UgSXLFk0rR/uubfMPMEC74NTu3mgN3yqHEP+WeNkjXl
   4w6503mNHNZczcAvrFbs1HQbc5qQ+RG4gGAcq4UpSu7wxQECOnV5ngZ2V
   dc3/rQgrr+xZYJ/4utAENiVlHKgWPyT2vJOTCOtXVpuKUXSloUw8uQ7dt
   Sa2hZ2z8e+8W39jBghkIL+GiN4+mG3NpuP9grKrdJUeIxa5KdZIqLePMj
   I9Us2dFIGKc1yhYthOO1cX3q+izkZ+QofMEs1bQNpxc7VNVXzWR7jwMWG
   /hbTP1+pnu3x+zF9PINWM/Q31BXs+zPJh5IkGVoh/4JFJ+ppH7cniaGlk
   w==;
X-CSE-ConnectionGUID: eqaYlghaTheLwl+5443UWw==
X-CSE-MsgGUID: 47sWOynoQ2S1YwPH2z9/ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="27561"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="27561"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 07:24:36 -0700
X-CSE-ConnectionGUID: kVZh/P7xTBiVUxsKBmQNHw==
X-CSE-MsgGUID: Tc79LspkRmiP+uTW7RJSkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280893394"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Oct 2026 07:24:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE65o-000000001jm-28rV;
	Tue, 06 Oct 2026 14:24:32 +0000
Date: Tue, 06 Oct 2026 22:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 57/121] kernel/sched/alt_core.c:6468:50:
 error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer
 without a cast
Message-ID: <202610062230.eUFlxcIF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Steven,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   2bfd868afb6d8c6d606a189951e4680cd4ca98e2
commit: 46ef77681e026cafee56306f59871ab4760809af [57/121] sched/alt: Auto-detect heterogeneous CPU topology
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20261006/202610062230.eUFlxcIF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610062230.eUFlxcIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610062230.eUFlxcIF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:38,
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
> 6467			max_t(int, 1, cpumask_weight_and(active_mask,
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
