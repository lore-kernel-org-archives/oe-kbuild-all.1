Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7491D337BAC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 20:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161567; cv=none; b=HgxRXolz/pOhsXSa2/v+67jmQn/ezCP4RWtOrEBendLyfFo+6xc04HY0LzdXCWh9wVQpHb17aGDaeZa6x5UJIvQqh1xwig8800u32v7YLjHGPIJ2yXR12JcN9pAr3zg46000iouKLrNKQCGDdXBbzx2bB1apHm+6cX7Mo3qgQfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161567; c=relaxed/simple;
	bh=s/lowbsJUH2cjnbyAKf2ZBKyHSevh7O/Nof7r2qAjqY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u+ibFhzkD3jZoskV8IzY2J2XROm1oJDux2IlK1rkb4cJkTCuUDDa0nzaVn42Sd/todqNxJdfOBIyK3eUNG80ZMlZ7VuzrsGYPMGb9W/JMf7tG4+jwcQPRYj/pbv93NbDiVuvcl9znv0ZSY+dbeVYa5Y8F8C+elmpnP6nrfknSN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7t2J8mO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7t2J8mO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782161567; x=1813697567;
  h=date:from:to:cc:subject:message-id;
  bh=s/lowbsJUH2cjnbyAKf2ZBKyHSevh7O/Nof7r2qAjqY=;
  b=Y7t2J8mOaNu4bv54ZxipOd2zM6MP5gUhCrOWqoMFgB4u/aD7G0zbO/4O
   6LX+dsO4wCMIfHjTaCu6MODoL0EJkPJd8T9xHILGyUAr/P9Ez+Jqzqt5/
   0BS9WZxRg0NrY8+UqQnUmm+gtEIQBdWOU0FGzvorKIGnH+xAvwA1nEbFR
   fxva0V0CmKlln+MqNesA9wx8guWSFk/nzN0uxlJcar1JNHywObRjRtQkW
   3B9T9ZdeodjgGsfn6BMr5pSMuTPwWuFuOyWtEdmC3AKrxa1VIbDyNV3oP
   AjthMzf9SB7kw1Fr9+yRQjXPFoqZlK4O4C4UMMa1YW1Ja29mmQjF4m9Mh
   A==;
X-CSE-ConnectionGUID: Cw76rFieQq2yS9L4H5EDCQ==
X-CSE-MsgGUID: fsHXUq1UQzyGW6h5evFoRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100326766"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="100326766"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 13:52:46 -0700
X-CSE-ConnectionGUID: j60l2T43QeOPW+yCpbkaXg==
X-CSE-MsgGUID: cSTNkh/cTLKRoeiIHP579g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="249367625"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Jun 2026 13:52:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbldK-000000001uh-0eBi;
	Mon, 22 Jun 2026 20:52:42 +0000
Date: Tue, 23 Jun 2026 04:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/prjc 10/21] kernel/sched/alt_core.c:6405:60:
 warning: passing argument 1 of 'cpumask_weight' makes pointer from integer
 without a cast
Message-ID: <202606230430.QtOK3vmO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/prjc
head:   554af5ca804c16da84a47b49a517697a9b81bb54
commit: 6f7fb20c8e0c1938dcfda6adfa0f2080909db456 [10/21] sched/alt: Add wake_affine_idle()/wake_wide() affine wakeup support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230430.QtOK3vmO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230430.QtOK3vmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230430.QtOK3vmO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:1519:6: error: redefinition of 'set_task_cpu'
    1519 | void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
         |      ^~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:15:
   include/linux/sched.h:2340:20: note: previous definition of 'set_task_cpu' with type 'void(struct task_struct *, unsigned int)'
    2340 | static inline void set_task_cpu(struct task_struct *p, unsigned int cpu)
         |                    ^~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:6404:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Werror=implicit-function-declaration]
    6404 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6404:57: warning: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    6404 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:155:73: note: expected 'const struct cpumask *' but argument is of type 'int'
     155 | static __always_inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                                   ~~~~~~~~~~~~~~~~~~~~~~^~~~
>> kernel/sched/alt_core.c:6405:60: warning: passing argument 1 of 'cpumask_weight' makes pointer from integer without a cast [-Wint-conversion]
    6405 |                 per_cpu(sd_llc_size, cpu) = cpumask_weight(cpu_coregroup_mask(cpu));
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                            |
         |                                                            int
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:868:74: note: expected 'const struct cpumask *' but argument is of type 'int'
     868 | static __always_inline unsigned int cpumask_weight(const struct cpumask *srcp)
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:6407:45: warning: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6407 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6380:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6380 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:714:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     714 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:6407:45: warning: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    6407 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6381:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6381 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:932:63: note: expected 'const struct cpumask *' but argument is of type 'int'
     932 | void cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from include/linux/sched.h:16,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   kernel/sched/alt_core.c:6386:55: note: in expansion of macro 'cpumask_bits'
    6386 |                 bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),       \
         |                                                       ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6407:17: note: in expansion of macro 'TOPOLOGY_CPUMASK'
    6407 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                 ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cpumask_weight +6405 kernel/sched/alt_core.c

  6378	
  6379	#define TOPOLOGY_CPUMASK(name, mask, last)\
  6380		if (cpumask_and(topo, topo, mask)) {					\
  6381			cpumask_copy(topo, mask);					\
  6382			printk(KERN_INFO "sched: cpu#%02d topo: 0x%08lx - "#name,	\
  6383			       cpu, (topo++)->bits[0]);					\
  6384		}									\
  6385		if (!last)								\
  6386			bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),	\
  6387					  nr_cpumask_bits);
  6388	
  6389	static void sched_init_topology_cpumask(void)
  6390	{
  6391		int cpu;
  6392		cpumask_t *topo;
  6393	
  6394		for_each_online_cpu(cpu) {
  6395			topo = per_cpu(sched_cpu_topo_masks, cpu);
  6396	
  6397			bitmap_complement(cpumask_bits(topo), cpumask_bits(cpumask_of(cpu)),
  6398					  nr_cpumask_bits);
  6399	#ifdef CONFIG_SCHED_SMT
  6400			TOPOLOGY_CPUMASK(smt, topology_sibling_cpumask(cpu), false);
  6401	#endif /* CONFIG_SCHED_SMT */
  6402			TOPOLOGY_CPUMASK(cluster, topology_cluster_cpumask(cpu), false);
  6403	
  6404			per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
> 6405			per_cpu(sd_llc_size, cpu) = cpumask_weight(cpu_coregroup_mask(cpu));
  6406			per_cpu(sched_cpu_llc_mask, cpu) = topo;
  6407			TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
  6408	
  6409			TOPOLOGY_CPUMASK(core, topology_core_cpumask(cpu), false);
  6410	
  6411			TOPOLOGY_CPUMASK(others, cpu_online_mask, true);
  6412	
  6413			per_cpu(sched_cpu_topo_end_mask, cpu) = topo;
  6414			printk(KERN_INFO "sched: cpu#%02d llc_id = %d, llc_mask idx = %d\n",
  6415			       cpu, per_cpu(sd_llc_id, cpu),
  6416			       (int) (per_cpu(sched_cpu_llc_mask, cpu) -
  6417				      per_cpu(sched_cpu_topo_masks, cpu)));
  6418		}
  6419	}
  6420	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
