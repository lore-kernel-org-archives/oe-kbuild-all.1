Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7831E33D506
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239567; cv=none; b=RCXWN66XJWw2WcT+BLq7fpKohvpgHu58rxBPP1rbA+LwG+Vnb+g2O3t+zBTVQSNFMFX3oO7jNHQHZayPM1aV8RclZAtDKTEhf7KXgEz49/jWVLaTrX3WOVsqEpQpcWOPZC6c5BfKD2QkRbutjxKq5yZtO3BY7Pp6HL3Mz5CKCZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239567; c=relaxed/simple;
	bh=E0JzAKN8LuOPri0vOYy3iGRmE1VNdAq37EGmhIaTKjw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YMXdcrxSdJ9QnRcKi7qj742AHfeWxhjRZPCCOb4pprvscaoux7+lHhxohmtoIygE6aqpb6sDHrY+lvDNprfD5LgfRk1uzG5RibvKks2IoPLDOpezYM2ElO/DmHHucQplr4yQtyoviRWjVzQFiJHEGpyPaveAeX1eMzJzEUpZ++w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPRodQNI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPRodQNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778239567; x=1809775567;
  h=date:from:to:cc:subject:message-id;
  bh=E0JzAKN8LuOPri0vOYy3iGRmE1VNdAq37EGmhIaTKjw=;
  b=WPRodQNIN+oq89qmPBLDsAf/xaU8XB9L21lLkNfB3dpVgCp416CsXR10
   gMJrDl5woI5I+7Ge1o1AgfnnE/zrIPj5ff9/iRfNCmfCfF5wiJheeE6c6
   tbKoWrq5LRemAmGEvEdK2CZc0QsHIwmqB9G3djHhdtd64XzEBeM50vEtl
   5hYdYofJ4pRoqb1WWxKXm3lh1YM7zBOkBaMzjzexvKIpsNhWOPAxdzDQV
   ZNSPWFmJjlEcdNaFNS2hvJkmdu0H14iX3m09zma+6j2fhkXqVFKe3TT1m
   GU7Lv8cCVSsRe6rQd3uXwkmFJeAAE7EUI7TcIbOMzQL0rsMfh7T2WZKIA
   g==;
X-CSE-ConnectionGUID: uTMh9yhhT1uS51Uf4yqpIA==
X-CSE-MsgGUID: DDdffrPxRf6qJ7xFASg+Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79106263"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79106263"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 04:26:04 -0700
X-CSE-ConnectionGUID: XN3he1dlRc+1UOFdmz4iPQ==
X-CSE-MsgGUID: 1aHhCnU7Rsajb7JlL1GRkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="232400843"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 May 2026 04:26:02 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLJLD-0000000007P-48OD;
	Fri, 08 May 2026 11:25:59 +0000
Date: Fri, 08 May 2026 19:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.0/prjc 17/18] kernel/sched/alt_core.c:6272:60:
 warning: passing argument 1 of 'cpumask_weight' makes pointer from integer
 without a cast
Message-ID: <202605081912.hVEHQ3oD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.0/prjc
head:   780c86f87621fa2a613e0d012e4111c0a394253e
commit: 1d9745a4c439457c4eda26e773b592ae3ac04bf3 [17/18] sched/alt: Cache LLC size as per-CPU sd_llc_size
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260508/202605081912.hVEHQ3oD-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081912.hVEHQ3oD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081912.hVEHQ3oD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:1474:6: error: redefinition of 'set_task_cpu'
    1474 | void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
         |      ^~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:15:
   include/linux/sched.h:2303:20: note: previous definition of 'set_task_cpu' with type 'void(struct task_struct *, unsigned int)'
    2303 | static inline void set_task_cpu(struct task_struct *p, unsigned int cpu)
         |                    ^~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:6271:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Werror=implicit-function-declaration]
    6271 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6271:57: warning: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    6271 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
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
>> kernel/sched/alt_core.c:6272:60: warning: passing argument 1 of 'cpumask_weight' makes pointer from integer without a cast [-Wint-conversion]
    6272 |                 per_cpu(sd_llc_size, cpu) = cpumask_weight(cpu_coregroup_mask(cpu));
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
   kernel/sched/alt_core.c:6274:45: warning: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6274 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6247:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6247 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   include/linux/cpumask.h:714:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     714 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:6274:45: warning: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    6274 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6248:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6248 |                 cpumask_copy(topo, mask);                                       \
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
   kernel/sched/alt_core.c:6253:55: note: in expansion of macro 'cpumask_bits'
    6253 |                 bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),       \
         |                                                       ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6274:17: note: in expansion of macro 'TOPOLOGY_CPUMASK'
    6274 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                 ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cpumask_weight +6272 kernel/sched/alt_core.c

  6245	
  6246	#define TOPOLOGY_CPUMASK(name, mask, last)\
  6247		if (cpumask_and(topo, topo, mask)) {					\
  6248			cpumask_copy(topo, mask);					\
  6249			printk(KERN_INFO "sched: cpu#%02d topo: 0x%08lx - "#name,	\
  6250			       cpu, (topo++)->bits[0]);					\
  6251		}									\
  6252		if (!last)								\
  6253			bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),	\
  6254					  nr_cpumask_bits);
  6255	
  6256	static void sched_init_topology_cpumask(void)
  6257	{
  6258		int cpu;
  6259		cpumask_t *topo;
  6260	
  6261		for_each_online_cpu(cpu) {
  6262			topo = per_cpu(sched_cpu_topo_masks, cpu);
  6263	
  6264			bitmap_complement(cpumask_bits(topo), cpumask_bits(cpumask_of(cpu)),
  6265					  nr_cpumask_bits);
  6266	#ifdef CONFIG_SCHED_SMT
  6267			TOPOLOGY_CPUMASK(smt, topology_sibling_cpumask(cpu), false);
  6268	#endif /* CONFIG_SCHED_SMT */
  6269			TOPOLOGY_CPUMASK(cluster, topology_cluster_cpumask(cpu), false);
  6270	
  6271			per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
> 6272			per_cpu(sd_llc_size, cpu) = cpumask_weight(cpu_coregroup_mask(cpu));
  6273			per_cpu(sched_cpu_llc_mask, cpu) = topo;
  6274			TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
  6275	
  6276			TOPOLOGY_CPUMASK(core, topology_core_cpumask(cpu), false);
  6277	
  6278			TOPOLOGY_CPUMASK(others, cpu_online_mask, true);
  6279	
  6280			per_cpu(sched_cpu_topo_end_mask, cpu) = topo;
  6281			printk(KERN_INFO "sched: cpu#%02d llc_id = %d, llc_mask idx = %d\n",
  6282			       cpu, per_cpu(sd_llc_id, cpu),
  6283			       (int) (per_cpu(sched_cpu_llc_mask, cpu) -
  6284				      per_cpu(sched_cpu_topo_masks, cpu)));
  6285		}
  6286	}
  6287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
