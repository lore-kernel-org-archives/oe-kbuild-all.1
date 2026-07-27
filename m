Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80566414DF5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158497; cv=none; b=HAsn1bWY7JagvcUGGm+m+qYjeL3CVKEIdmZtj3EwbbMeDIIZ2bZM459b+qPAA3ddE8x3iaYTYd6lXioN2D9JFKfJrnFx5YAC6O4tsIxWi/00LFJdEfv/v0GRMcsGikJPSoE09On5CYqFr7igPBs7T0quvETYS/Zocv3NaGTL5yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158497; c=relaxed/simple;
	bh=pEDIva8xBtkEiBk6azbP1YRLLsTSi/F/kws6SquhkoU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rL4WgLj+/+46X3wFoG34Z0rFYaozVzTLfCSq62iT965BPuzZRKo1eAwgPIxrhQvmaecHiVfyVft9cdfAzwO/ZJE5/2bOp2v3bIuq+b5WrIDtuNUzRT97OZFnc3u6CHUQsvN2nEh2Gfj0JDtKe658z4FLW30lg7TuntA4X7adNvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ool2x0an; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ool2x0an"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785158494; x=1816694494;
  h=date:from:to:cc:subject:message-id;
  bh=pEDIva8xBtkEiBk6azbP1YRLLsTSi/F/kws6SquhkoU=;
  b=Ool2x0ans3UkcN5jU+J4IzTppvZN7Tz3AKSAXKc25zFUzqL7am+trf0I
   zfsDx5uSdFkchpF4K6tPovh8Ccpgd2QQtafq6G3MQ1aCIoprCP8JIkBIr
   5ztT9f2JNLnCV/PjzYsPvs06ids24DbxbSWsFv4BnHSIv+ZNshbgWbhwK
   cBSROajd1YcKzHTtq4mrOZlkOYX1Y4zngJf0SKMfOKLnD0BmoFzvYvyDr
   QcTqV5Sfecmek6waiiQXA45Iulh0hkB8T5osYe9Mgwz5KkYoQhWsFc61K
   8+oH7DKUDDmdJfmgWZV6yjUx0XqiaqyPC55C/wc8KLw+iue1mrOspvVsg
   g==;
X-CSE-ConnectionGUID: JpijXduZQgmo7tXdLOj77g==
X-CSE-MsgGUID: NSQz6m5wQkyup9rIDob63Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103135754"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="103135754"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 06:21:34 -0700
X-CSE-ConnectionGUID: 1023kycwQgKOf4EFnruPIg==
X-CSE-MsgGUID: mZhtJjpsQ+e9khnn2EfD4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="282738641"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jul 2026 06:21:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woLGr-00000000dB0-3wik;
	Mon, 27 Jul 2026 13:21:29 +0000
Date: Mon, 27 Jul 2026 21:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/prjc 36/38] kernel/sched/alt_core.c:6442:50:
 warning: passing argument 2 of 'cpumask_weight_and' makes pointer from
 integer without a cast
Message-ID: <202607272008.5HkpZjsy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/prjc
head:   a87d4f75d93e513e42f498eae7214c385874cf8e
commit: 4878c61929d676359794533c9e16d420c5f24b26 [36/38] sched/alt: Auto-detect heterogeneous CPU topology
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260727/202607272008.5HkpZjsy-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260727/202607272008.5HkpZjsy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607272008.5HkpZjsy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:1440:6: error: redefinition of 'set_task_cpu'
    1440 | void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
         |      ^~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:15:
   include/linux/sched.h:2340:20: note: previous definition of 'set_task_cpu' with type 'void(struct task_struct *, unsigned int)'
    2340 | static inline void set_task_cpu(struct task_struct *p, unsigned int cpu)
         |                    ^~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'finish_task_switch':
   kernel/sched/alt_core.c:3714:9: error: too few arguments to function 'blk_plug_invalidate_ts'
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
   kernel/sched/alt_core.c:6376:32: error: implicit declaration of function 'cpu_coregroup_mask' [-Werror=implicit-function-declaration]
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
   kernel/sched/alt_core.c:6429:21: warning: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6429 |                     cpu_coregroup_mask(cpu));
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     int
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:714:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     714 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
>> kernel/sched/alt_core.c:6442:50: warning: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
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
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:881:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     881 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_add_cpu':
>> kernel/sched/alt_core.c:6460:41: warning: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6460 |         if (cpumask_test_cpu(added_cpu, cpu_coregroup_mask(cpu)))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:647:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     647 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
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
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c:6486:58: warning: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
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
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:881:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     881 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_activate_update':
   kernel/sched/alt_core.c:6526:48: warning: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6526 |                 if (cpumask_test_cpu(incoming, cpu_coregroup_mask(cpu)))
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                int
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:647:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     647 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c:6530:58: warning: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6530 |                                                          cpu_coregroup_mask(cpu)));
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })


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
