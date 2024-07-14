Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAEE23B1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720950198; cv=none; b=c6cF9hMefFW5o1CzdSBha7/Vpj5duHHF4vQ3QNRni0jJfI2vNZv9a3Mo3aZFPHMI3Xta141Y/RTkZ4J8A8vpARR+wDA5SAElSSNxnKbETOzQeQ1aUtVqPx2F0IkQAPKIoeTLA59WnCj78IQYGMzzY1GDMbwbKp2dhL+gZBnBUdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720950198; c=relaxed/simple;
	bh=nqHggzMS9xnHRYkFu5rXGHTmkoDUOEYD2ROZ/eJsQec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fie2/7OXabJH5298rLsYVd52SRq4E2M86o3E7MO7cMMaIpnaxqa+r0hoPNUp52RSUM5AK+85DHct6Vr4/iMXkcvQoPPvXR+H2UDdNRV8SI2LNWwJiLVsG/7B3+gZKasY+CXTTlxGsNzyYtvGx42ijsNJ9QJJRZO4ruk7pbRwzwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGGFn1fw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGGFn1fw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720950195; x=1752486195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nqHggzMS9xnHRYkFu5rXGHTmkoDUOEYD2ROZ/eJsQec=;
  b=nGGFn1fwXOyVDqPCk36PuxzOazdHMFr8Qbks5Gt1Oob2V0MpPBMJuPq0
   n7RayWrUuZLjYMBIQ2WK3HsnfdHbTg3f6nW47jl9Q2BH3Ec1+rhVLTgyH
   IocVIS3+Y8+XkY4ay89Qo7TbGJrv2jQTn/XOUBfL0OH0ZsiF/rerOHXfZ
   IMvtF31BeX3dnuyrr/0EjwKIoVf8TbJ4w3kkFOj8YyPn/vyJqCcqdxjKX
   9MfioopQnod4JW+i9Xl1l6aJQ15Oh43d1fyv13n44gppezIAtlB5c8iQA
   HcZUsXUgSdYrriWKrzpg/GU5v/TgVVaxBtmU2oc4B9+Dlt8y4oZeL+EA2
   g==;
X-CSE-ConnectionGUID: 72LS6CD2SceY/9mJ4wCsLQ==
X-CSE-MsgGUID: snx26Fu7Qxq62prtnHRdSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="18482165"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="18482165"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 02:43:10 -0700
X-CSE-ConnectionGUID: HUCQFobLRKGPee2BQgynQQ==
X-CSE-MsgGUID: Nt56hkFnTj69TygwUGY2DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="49415538"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jul 2024 02:43:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSvl4-000dJ0-2N;
	Sun, 14 Jul 2024 09:43:06 +0000
Date: Sun, 14 Jul 2024 17:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.9/prjc 3/4] kernel/sched/alt_core.c:7638:57: error: passing
 argument 1 of 'cpumask_first' makes pointer from integer without a cast
Message-ID: <202407141747.aCobv5vB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.9/prjc
head:   5d131fcb17bc5c82ac8e5cf6217da8b8ea79453b
commit: 8964d2061c8f25fc8c96de75a0f9e3234ae61c6e [3/4] fixup! ZEN: sched/alt: Set default timeslice to 2ms
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240714/202407141747.aCobv5vB-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407141747.aCobv5vB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407141747.aCobv5vB-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:7638:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Wimplicit-function-declaration]
    7638 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7638:57: error: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    7638 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/alt_core.c:14:
   include/linux/cpumask.h:161:64: note: expected 'const struct cpumask *' but argument is of type 'int'
     161 | static inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~^~~~
>> kernel/sched/alt_core.c:7640:45: error: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    7640 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7611:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7611 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:568:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     568 |                                const struct cpumask *src2p)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> kernel/sched/alt_core.c:7640:45: error: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    7640 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7612:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7612 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:768:55: note: expected 'const struct cpumask *' but argument is of type 'int'
     768 |                                 const struct cpumask *srcp)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/cpumask.h:29:37: error: invalid type argument of '->' (have 'int')
      29 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   kernel/sched/alt_core.c:7617:55: note: in expansion of macro 'cpumask_bits'
    7617 |                 bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),       \
         |                                                       ^~~~~~~~~~~~
   kernel/sched/alt_core.c:7640:17: note: in expansion of macro 'TOPOLOGY_CPUMASK'
    7640 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                 ^~~~~~~~~~~~~~~~


vim +/cpumask_first +7638 kernel/sched/alt_core.c

561e42ce50942d Alfred Chen 2019-08-19  7609  
561e42ce50942d Alfred Chen 2019-08-19  7610  #define TOPOLOGY_CPUMASK(name, mask, last)\
1e67c78fc8f1c2 Alfred Chen 2021-07-10  7611  	if (cpumask_and(topo, topo, mask)) {					\
5ca8c83a73e255 Alfred Chen 2020-12-25  7612  		cpumask_copy(topo, mask);					\
1e67c78fc8f1c2 Alfred Chen 2021-07-10  7613  		printk(KERN_INFO "sched: cpu#%02d topo: 0x%08lx - "#name,	\
1e67c78fc8f1c2 Alfred Chen 2021-07-10  7614  		       cpu, (topo++)->bits[0]);					\
5ca8c83a73e255 Alfred Chen 2020-12-25  7615  	}									\
561e42ce50942d Alfred Chen 2019-08-19  7616  	if (!last)								\
56bccb7e9b4d6d Alfred Chen 2023-04-08  7617  		bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),	\
56bccb7e9b4d6d Alfred Chen 2023-04-08  7618  				  nr_cpumask_bits);
561e42ce50942d Alfred Chen 2019-08-19  7619  
561e42ce50942d Alfred Chen 2019-08-19  7620  static void sched_init_topology_cpumask(void)
561e42ce50942d Alfred Chen 2019-08-19  7621  {
561e42ce50942d Alfred Chen 2019-08-19  7622  	int cpu;
1e67c78fc8f1c2 Alfred Chen 2021-07-10  7623  	cpumask_t *topo;
561e42ce50942d Alfred Chen 2019-08-19  7624  
561e42ce50942d Alfred Chen 2019-08-19  7625  	for_each_online_cpu(cpu) {
561e42ce50942d Alfred Chen 2019-08-19  7626  		/* take chance to reset time slice for idle tasks */
142440acbdb853 Alfred Chen 2024-01-16  7627  		cpu_rq(cpu)->idle->time_slice = sysctl_sched_base_slice;
561e42ce50942d Alfred Chen 2019-08-19  7628  
dc610a35a03c0d Alfred Chen 2024-02-05  7629  		topo = per_cpu(sched_cpu_topo_masks, cpu);
5209dc4fc459b2 Alfred Chen 2020-11-09  7630  
56bccb7e9b4d6d Alfred Chen 2023-04-08  7631  		bitmap_complement(cpumask_bits(topo), cpumask_bits(cpumask_of(cpu)),
56bccb7e9b4d6d Alfred Chen 2023-04-08  7632  				  nr_cpumask_bits);
561e42ce50942d Alfred Chen 2019-08-19  7633  #ifdef CONFIG_SCHED_SMT
561e42ce50942d Alfred Chen 2019-08-19  7634  		TOPOLOGY_CPUMASK(smt, topology_sibling_cpumask(cpu), false);
561e42ce50942d Alfred Chen 2019-08-19  7635  #endif
f90f6c0ad3cb77 Alfred Chen 2024-02-20  7636  		TOPOLOGY_CPUMASK(cluster, topology_cluster_cpumask(cpu), false);
f90f6c0ad3cb77 Alfred Chen 2024-02-20  7637  
561e42ce50942d Alfred Chen 2019-08-19 @7638  		per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
5ca8c83a73e255 Alfred Chen 2020-12-25  7639  		per_cpu(sched_cpu_llc_mask, cpu) = topo;
561e42ce50942d Alfred Chen 2019-08-19 @7640  		TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
561e42ce50942d Alfred Chen 2019-08-19  7641  
561e42ce50942d Alfred Chen 2019-08-19  7642  		TOPOLOGY_CPUMASK(core, topology_core_cpumask(cpu), false);
561e42ce50942d Alfred Chen 2019-08-19  7643  
561e42ce50942d Alfred Chen 2019-08-19  7644  		TOPOLOGY_CPUMASK(others, cpu_online_mask, true);
561e42ce50942d Alfred Chen 2019-08-19  7645  
1e67c78fc8f1c2 Alfred Chen 2021-07-10  7646  		per_cpu(sched_cpu_topo_end_mask, cpu) = topo;
f70440e0716270 Alfred Chen 2020-11-03  7647  		printk(KERN_INFO "sched: cpu#%02d llc_id = %d, llc_mask idx = %d\n",
f70440e0716270 Alfred Chen 2020-11-03  7648  		       cpu, per_cpu(sd_llc_id, cpu),
f70440e0716270 Alfred Chen 2020-11-03  7649  		       (int) (per_cpu(sched_cpu_llc_mask, cpu) -
5ca8c83a73e255 Alfred Chen 2020-12-25  7650  			      per_cpu(sched_cpu_topo_masks, cpu)));
561e42ce50942d Alfred Chen 2019-08-19  7651  	}
561e42ce50942d Alfred Chen 2019-08-19  7652  }
561e42ce50942d Alfred Chen 2019-08-19  7653  #endif
561e42ce50942d Alfred Chen 2019-08-19  7654  

:::::: The code at line 7638 was first introduced by commit
:::::: 561e42ce50942dea67eafbee0a4b48d1b0b7b7ac Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
