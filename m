Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A430A1EBFE0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 04:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781410891; cv=none; b=Ajfsy0lPEtt2YkGxPsYgcyYl8gHnKGUetYa2HV7Hjib/AkISv1N/AwkTJSD06SfU/ronmWQ68YwiX43+rAT46uazIPfVT616EiqFDHNOl4DU4fah9c2RNnUo5rVvRqw+uucXwsDlNEit9IVuxTxsKG7560CGVYnMxg++YG/dppk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781410891; c=relaxed/simple;
	bh=4tA+Bvwb1NNr+cIRnGsETAT9hIeLlwFa6pnUIZAMMFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SYdOpNFTlZAS0aJxqCUPyCaXjHCKQOZUGg6oy7je/RzGFy9sYOBIS16HlmVfjN302jim0jMrbJv2hma0yX7VaeY3JiQl0GphiV5JssYdYd82XpxmU/FLj4ohQa3o6lZ99Ua3+9zixCn3w6D2RreHNFLqOTXnSINAaaiZn3cehJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hz7sxMIq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hz7sxMIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781410888; x=1812946888;
  h=date:from:to:cc:subject:message-id;
  bh=4tA+Bvwb1NNr+cIRnGsETAT9hIeLlwFa6pnUIZAMMFA=;
  b=hz7sxMIqDzq+PmLw+JuW+mKietOcAOXIqb0Vcp3J/hWD+AwO8XOWO/46
   OdXPdAyKHPfTQ6AA/yCYPxqg8vBBwZgNF2D5+74S7yNWHPdDQMP1sc/EO
   uoMGxIpBCMFdcx8vvOoGkizkTxBqYEaShv/0u9e6WaklszZX7AgG4/rnN
   zP7JUi/qI76/4+Lkhw5p8YqLz3KLDlnzeMPOKKLpUWw5ctZmueFT/VD8h
   10XzGeFiRIcHevBr5PqeiBf72XSRUt62XOwh5z86iB6G+mlD6Idoy50Y7
   bgOnRxEkJakvODeg3JLpzjUZf/t7a5U9sZAYB4ZDme8CB2PWAULt6nt/K
   Q==;
X-CSE-ConnectionGUID: 6s+JkEpITv6wjWrYFpYf5Q==
X-CSE-MsgGUID: Ie6/BHYHSEC92G/z57Ri1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82228021"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="82228021"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 21:21:28 -0700
X-CSE-ConnectionGUID: gjCjBptLQZyfwI7NOwehwg==
X-CSE-MsgGUID: nul3ljFtThe7JC7U+dfahw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="242790034"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jun 2026 21:21:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYcLc-00000000QWw-2LRs;
	Sun, 14 Jun 2026 04:21:24 +0000
Date: Sun, 14 Jun 2026 12:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.0/prjc 17/26] kernel/sched/alt_core.c:6272:60: error:
 passing argument 1 of 'cpumask_weight' makes pointer from integer without a
 cast
Message-ID: <202606141245.ribkYozC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Steven,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 7.0/prjc
head:   83899255cd0af759b40f31e274eb1e74e60c2664
commit: 1d9745a4c439457c4eda26e773b592ae3ac04bf3 [17/26] sched/alt: Cache LLC size as per-CPU sd_llc_size
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20260614/202606141245.ribkYozC-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141245.ribkYozC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606141245.ribkYozC-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c:1474:6: error: redefinition of 'set_task_cpu'
    1474 | void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
         |      ^~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:15:
   include/linux/sched.h:2303:20: note: previous definition of 'set_task_cpu' with type 'void(struct task_struct *, unsigned int)'
    2303 | static inline void set_task_cpu(struct task_struct *p, unsigned int cpu)
         |                    ^~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:6271:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Wimplicit-function-declaration]
    6271 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6271:57: error: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    6271 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
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
>> kernel/sched/alt_core.c:6272:60: error: passing argument 1 of 'cpumask_weight' makes pointer from integer without a cast [-Wint-conversion]
    6272 |                 per_cpu(sd_llc_size, cpu) = cpumask_weight(cpu_coregroup_mask(cpu));
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                            |
         |                                                            int
   include/linux/cpumask.h:868:74: note: expected 'const struct cpumask *' but argument is of type 'int'
     868 | static __always_inline unsigned int cpumask_weight(const struct cpumask *srcp)
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:6274:45: error: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6274 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6247:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6247 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:714:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     714 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:6274:45: error: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    6274 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6248:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6248 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:932:63: note: expected 'const struct cpumask *' but argument is of type 'int'
     932 | void cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from include/linux/sched.h:16:
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   kernel/sched/alt_core.c:6253:55: note: in expansion of macro 'cpumask_bits'
    6253 |                 bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),       \
         |                                                       ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6274:17: note: in expansion of macro 'TOPOLOGY_CPUMASK'
    6274 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                 ^~~~~~~~~~~~~~~~


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
