Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B296A374
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 02:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAEExjVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700447671; x=1731983671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66e/AHA7SjzZmjWOawVgwe6SNRY3KXuoU2K1GaCbOiI=;
  b=HAEExjVpkRSdGusYvDkFVbhBlpADAI+WCH/STYUxhD/SqQ9shZf7T3bJ
   VG+emKYv09eTicFTB8DDbsYpUrc15q9BeHuKUA4Rmge1rAer4gAAeASIU
   mLwk2B7Qz4N2QOViON8bIitHHYetjS6bV8QNnUuKi6xr30F4y50KkQiML
   WlvUwTWqBiYrEoVAQb4Q+6f+rKRLCweGV84x+o/INM2Drps2EsHHVvL/4
   GLx8tcIPs3r8E4mk7TrknGJOVbqsyc+GhuYOCZTZbvPsSYFL0jIl/oxy2
   CWQ3LKvGAP9xnYraPktj6ABvPkDWL93JJJBhaHiMySM7JFluWcHwDlmd5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="376574353"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="376574353"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 18:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="7412090"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Nov 2023 18:34:30 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4u7F-0005r7-1Y;
	Mon, 20 Nov 2023 02:34:25 +0000
Date: Mon, 20 Nov 2023 10:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/prjc 408/449] kernel/sched/alt_core.c:7517:3: error: member
 reference type 'int' is not a pointer
Message-ID: <202311201002.D9MdBwXY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/prjc
head:   a343b008e1bf155cdcfe9a46e38336032adeb65a
commit: 60e37e86027139db2d687b2bc3beb8b503e5bf63 [408/449] sched/alt: [Sync] 596ff4a09b89 cpumask: re-introduce constant-sized cpumask optimizations
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231120/202311201002.D9MdBwXY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201002.D9MdBwXY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201002.D9MdBwXY-lkp@intel.com/

All errors (new ones prefixed by >>):

         |      ^
   kernel/sched/alt_core.c:2504:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2504 | void send_call_function_single_ipi(int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:5594:3: error: call to undeclared function 'cpuset_read_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5594 |                 cpuset_read_lock();
         |                 ^
   kernel/sched/alt_core.c:5594:3: note: did you mean 'cpus_read_lock'?
   include/linux/cpu.h:130:13: note: 'cpus_read_lock' declared here
     130 | extern void cpus_read_lock(void);
         |             ^
   kernel/sched/alt_core.c:5642:4: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5642 |                         cpuset_read_unlock();
         |                         ^
   kernel/sched/alt_core.c:5674:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5674 |                 cpuset_read_unlock();
         |                 ^
   kernel/sched/alt_core.c:5688:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5688 |                 cpuset_read_unlock();
         |                 ^
   kernel/sched/alt_core.c:7047:5: error: conflicting types for 'task_can_attach'
    7047 | int task_can_attach(struct task_struct *p,
         |     ^
   include/linux/sched.h:1883:12: note: previous declaration is here
    1883 | extern int task_can_attach(struct task_struct *p);
         |            ^
   kernel/sched/alt_core.c:7074:6: warning: no previous prototype for function 'idle_task_exit' [-Wmissing-prototypes]
    7074 | void idle_task_exit(void)
         |      ^
   kernel/sched/alt_core.c:7074:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7074 | void idle_task_exit(void)
         | ^
         | static 
   kernel/sched/alt_core.c:7284:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
    7284 | int sched_cpu_activate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7284:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7284 | int sched_cpu_activate(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7323:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7323 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7323:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7323 | int sched_cpu_deactivate(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7387:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
    7387 | int sched_cpu_starting(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7387:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7387 | int sched_cpu_starting(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7407:5: warning: no previous prototype for function 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7407 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7407:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7407 | int sched_cpu_wait_empty(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7449:5: warning: no previous prototype for function 'sched_cpu_dying' [-Wmissing-prototypes]
    7449 | int sched_cpu_dying(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7449:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7449 | int sched_cpu_dying(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7515:43: error: call to undeclared function 'cpu_coregroup_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7515 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^
   kernel/sched/alt_core.c:7515:43: note: did you mean 'cpu_core_mask'?
   arch/powerpc/include/asm/smp.h:118:31: note: 'cpu_core_mask' declared here
     118 | static inline struct cpumask *cpu_core_mask(int cpu)
         |                               ^
   kernel/sched/alt_core.c:7515:43: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
    7515 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:160:64: note: passing argument to parameter 'srcp' here
     160 | static inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                                                ^
   kernel/sched/alt_core.c:7517:31: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
    7517 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7490:30: note: expanded from macro 'TOPOLOGY_CPUMASK'
    7490 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:567:33: note: passing argument to parameter 'src2p' here
     567 |                                const struct cpumask *src2p)
         |                                                      ^
   kernel/sched/alt_core.c:7517:31: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
    7517 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7491:22: note: expanded from macro 'TOPOLOGY_CPUMASK'
    7491 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:738:27: note: passing argument to parameter 'srcp' here
     738 |                                 const struct cpumask *srcp)
         |                                                       ^
>> kernel/sched/alt_core.c:7517:3: error: member reference type 'int' is not a pointer
    7517 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7496:41: note: expanded from macro 'TOPOLOGY_CPUMASK'
    7496 |                 bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),       \
         |                                                       ^~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:28:39: note: expanded from macro 'cpumask_bits'
      28 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                              ~~~~~~~  ^
   kernel/sched/alt_core.c:7532:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
    7532 | void __init sched_init_smp(void)
         |             ^
   kernel/sched/alt_core.c:7532:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7532 | void __init sched_init_smp(void)
         | ^
         | static 
   kernel/sched/alt_core.c:7592:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
    7592 | void __init sched_init(void)
         |             ^
   kernel/sched/alt_core.c:7592:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7592 | void __init sched_init(void)
         | ^
         | static 
   kernel/sched/alt_core.c:7950:20: warning: no previous prototype for function 'sched_create_group' [-Wmissing-prototypes]
    7950 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^
   kernel/sched/alt_core.c:7950:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7950 | struct task_group *sched_create_group(struct task_group *parent)
         | ^
         | static 
   kernel/sched/alt_core.c:7961:6: warning: no previous prototype for function 'sched_online_group' [-Wmissing-prototypes]
    7961 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^
   kernel/sched/alt_core.c:7961:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7961 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         | ^
         | static 
   kernel/sched/alt_core.c:7972:6: warning: no previous prototype for function 'sched_destroy_group' [-Wmissing-prototypes]
    7972 | void sched_destroy_group(struct task_group *tg)
         |      ^
   kernel/sched/alt_core.c:7972:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7972 | void sched_destroy_group(struct task_group *tg)
         | ^
         | static 
   kernel/sched/alt_core.c:7978:6: warning: no previous prototype for function 'sched_release_group' [-Wmissing-prototypes]
    7978 | void sched_release_group(struct task_group *tg)
         |      ^
   kernel/sched/alt_core.c:7978:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7978 | void sched_release_group(struct task_group *tg)
         | ^
         | static 
   kernel/sched/alt_core.c:8046:5: warning: no previous prototype for function 'sched_group_set_shares' [-Wmissing-prototypes]
    8046 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^
   kernel/sched/alt_core.c:8046:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    8046 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         | ^
         | static 
   kernel/sched/alt_core.c:8116:20: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    8116 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8115:20: note: previous initialization is here
    8115 |         .legacy_cftypes = cpu_files,
         |                           ^~~~~~~~~
   21 warnings and 13 errors generated.


vim +/int +7517 kernel/sched/alt_core.c

9f08fc0c802aa6 Alfred Chen 2019-08-19  7488  
9f08fc0c802aa6 Alfred Chen 2019-08-19  7489  #define TOPOLOGY_CPUMASK(name, mask, last)\
49a66d649cc9c0 Alfred Chen 2021-07-10  7490  	if (cpumask_and(topo, topo, mask)) {					\
a900dba35dbd07 Alfred Chen 2020-12-25  7491  		cpumask_copy(topo, mask);					\
49a66d649cc9c0 Alfred Chen 2021-07-10  7492  		printk(KERN_INFO "sched: cpu#%02d topo: 0x%08lx - "#name,	\
49a66d649cc9c0 Alfred Chen 2021-07-10  7493  		       cpu, (topo++)->bits[0]);					\
a900dba35dbd07 Alfred Chen 2020-12-25  7494  	}									\
9f08fc0c802aa6 Alfred Chen 2019-08-19  7495  	if (!last)								\
60e37e86027139 Alfred Chen 2023-04-08  7496  		bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),	\
60e37e86027139 Alfred Chen 2023-04-08  7497  				  nr_cpumask_bits);
9f08fc0c802aa6 Alfred Chen 2019-08-19  7498  
9f08fc0c802aa6 Alfred Chen 2019-08-19  7499  static void sched_init_topology_cpumask(void)
9f08fc0c802aa6 Alfred Chen 2019-08-19  7500  {
9f08fc0c802aa6 Alfred Chen 2019-08-19  7501  	int cpu;
49a66d649cc9c0 Alfred Chen 2021-07-10  7502  	cpumask_t *topo;
9f08fc0c802aa6 Alfred Chen 2019-08-19  7503  
9f08fc0c802aa6 Alfred Chen 2019-08-19  7504  	for_each_online_cpu(cpu) {
9f08fc0c802aa6 Alfred Chen 2019-08-19  7505  		/* take chance to reset time slice for idle tasks */
9f08fc0c802aa6 Alfred Chen 2019-08-19  7506  		cpu_rq(cpu)->idle->time_slice = sched_timeslice_ns;
9f08fc0c802aa6 Alfred Chen 2019-08-19  7507  
a900dba35dbd07 Alfred Chen 2020-12-25  7508  		topo = per_cpu(sched_cpu_topo_masks, cpu) + 1;
a0febbb34c5e7d Alfred Chen 2020-11-09  7509  
60e37e86027139 Alfred Chen 2023-04-08  7510  		bitmap_complement(cpumask_bits(topo), cpumask_bits(cpumask_of(cpu)),
60e37e86027139 Alfred Chen 2023-04-08  7511  				  nr_cpumask_bits);
9f08fc0c802aa6 Alfred Chen 2019-08-19  7512  #ifdef CONFIG_SCHED_SMT
9f08fc0c802aa6 Alfred Chen 2019-08-19  7513  		TOPOLOGY_CPUMASK(smt, topology_sibling_cpumask(cpu), false);
9f08fc0c802aa6 Alfred Chen 2019-08-19  7514  #endif
9f08fc0c802aa6 Alfred Chen 2019-08-19  7515  		per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
a900dba35dbd07 Alfred Chen 2020-12-25  7516  		per_cpu(sched_cpu_llc_mask, cpu) = topo;
9f08fc0c802aa6 Alfred Chen 2019-08-19 @7517  		TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
9f08fc0c802aa6 Alfred Chen 2019-08-19  7518  
9f08fc0c802aa6 Alfred Chen 2019-08-19  7519  		TOPOLOGY_CPUMASK(core, topology_core_cpumask(cpu), false);
9f08fc0c802aa6 Alfred Chen 2019-08-19  7520  
9f08fc0c802aa6 Alfred Chen 2019-08-19  7521  		TOPOLOGY_CPUMASK(others, cpu_online_mask, true);
9f08fc0c802aa6 Alfred Chen 2019-08-19  7522  
49a66d649cc9c0 Alfred Chen 2021-07-10  7523  		per_cpu(sched_cpu_topo_end_mask, cpu) = topo;
a6f045d290f809 Alfred Chen 2020-11-03  7524  		printk(KERN_INFO "sched: cpu#%02d llc_id = %d, llc_mask idx = %d\n",
a6f045d290f809 Alfred Chen 2020-11-03  7525  		       cpu, per_cpu(sd_llc_id, cpu),
a6f045d290f809 Alfred Chen 2020-11-03  7526  		       (int) (per_cpu(sched_cpu_llc_mask, cpu) -
a900dba35dbd07 Alfred Chen 2020-12-25  7527  			      per_cpu(sched_cpu_topo_masks, cpu)));
9f08fc0c802aa6 Alfred Chen 2019-08-19  7528  	}
9f08fc0c802aa6 Alfred Chen 2019-08-19  7529  }
9f08fc0c802aa6 Alfred Chen 2019-08-19  7530  #endif
9f08fc0c802aa6 Alfred Chen 2019-08-19  7531  

:::::: The code at line 7517 was first introduced by commit
:::::: 9f08fc0c802aa60b849cb326294a06f38abaa0b0 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
