Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9630110A32
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 22:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="La/Jzunt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700433956; x=1731969956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0uZKrptEUmMJVcRIAIPjDkP5KGpmkFV0ESPxiaerN6k=;
  b=La/JzunteX5tPcOTk6BbHZXwwxOMLG5GhYSBSWXumBCVZ2Z3RK+PT9Ri
   V6AV6q4cB98DO0RSOteW8MRDy3vQBiNrdllyFT5jrasBm/a07g9v9IEVk
   p1BU3pknG3PTTxp9L0T2LEC+0zpFfhm4G1dvAj2a+KtQQHidlj1/WlwtF
   nBLbMu7+iLEKD7N8cipAWvJ6s+rlbzO9gpdcOGPKeC/RN5WB9oa6jrB1K
   uc0BX+BOLGw8+dGYahHeBNlSRRDrV5AgXXaMGolTkP7XTvJY4neRbx1zo
   fdrFfgnphDCOiSRAyxbhUXqR5kl65qqpXq2GWG/YMAciQifgyxfqROgx7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="422620412"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="422620412"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 14:45:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="889754524"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="889754524"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Nov 2023 14:45:52 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4qXv-0005ev-3A;
	Sun, 19 Nov 2023 22:45:49 +0000
Date: Mon, 20 Nov 2023 06:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/prjc 339/449] kernel/sched/alt_core.c:7209:43: error: call
 to undeclared function 'cpu_coregroup_mask'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202311200656.RqepadIx-lkp@intel.com>
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
commit: ebaeb5047fbecd36cfc083ac68656600eb52e1d2 [339/449] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231120/202311200656.RqepadIx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200656.RqepadIx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200656.RqepadIx-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c:3894:2: error: call to undeclared function 'sched_clock_tick'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3894 |         sched_clock_tick();
         |         ^
   kernel/sched/alt_core.c:3894:2: note: did you mean 'scheduler_tick'?
   kernel/sched/alt_core.c:3887:6: note: 'scheduler_tick' declared here
    3887 | void scheduler_tick(void)
         |      ^
    3888 | {
    3889 |         int cpu __maybe_unused = smp_processor_id();
    3890 |         struct rq *rq = cpu_rq(cpu);
    3891 |         u64 resched_latency;
    3892 | 
    3893 |         arch_scale_freq_tick();
    3894 |         sched_clock_tick();
         |         ~~~~~~~~~~~~~~~~
         |         scheduler_tick
   kernel/sched/alt_core.c:4558:21: error: use of undeclared identifier 'PF_FROZEN'
    4558 |                                 !(prev->flags & PF_FROZEN);
         |                                                 ^
   kernel/sched/alt_core.c:4674:6: error: call to undeclared function 'tsk_is_pi_blocked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4674 |         if (tsk_is_pi_blocked(tsk))
         |             ^
   kernel/sched/alt_core.c:4734:35: warning: no previous prototype for function 'schedule_user' [-Wmissing-prototypes]
    4734 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^
   kernel/sched/alt_core.c:4734:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4734 | asmlinkage __visible void __sched schedule_user(void)
         |                      ^
         |                      static 
   kernel/sched/alt_core.c:5357:3: error: call to undeclared function 'cpuset_read_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5357 |                 cpuset_read_lock();
         |                 ^
   kernel/sched/alt_core.c:5357:3: note: did you mean 'cpus_read_lock'?
   include/linux/cpu.h:130:13: note: 'cpus_read_lock' declared here
     130 | extern void cpus_read_lock(void);
         |             ^
   kernel/sched/alt_core.c:5405:4: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5405 |                         cpuset_read_unlock();
         |                         ^
   kernel/sched/alt_core.c:5437:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5437 |                 cpuset_read_unlock();
         |                 ^
   kernel/sched/alt_core.c:5451:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5451 |                 cpuset_read_unlock();
         |                 ^
   kernel/sched/alt_core.c:6743:5: error: conflicting types for 'task_can_attach'
    6743 | int task_can_attach(struct task_struct *p,
         |     ^
   include/linux/sched.h:1883:12: note: previous declaration is here
    1883 | extern int task_can_attach(struct task_struct *p);
         |            ^
   kernel/sched/alt_core.c:6770:6: warning: no previous prototype for function 'idle_task_exit' [-Wmissing-prototypes]
    6770 | void idle_task_exit(void)
         |      ^
   kernel/sched/alt_core.c:6770:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6770 | void idle_task_exit(void)
         | ^
         | static 
   kernel/sched/alt_core.c:6980:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
    6980 | int sched_cpu_activate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:6980:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6980 | int sched_cpu_activate(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7019:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7019 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7019:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7019 | int sched_cpu_deactivate(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7083:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
    7083 | int sched_cpu_starting(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7083:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7083 | int sched_cpu_starting(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7103:5: warning: no previous prototype for function 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7103 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7103 | int sched_cpu_wait_empty(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7145:5: warning: no previous prototype for function 'sched_cpu_dying' [-Wmissing-prototypes]
    7145 | int sched_cpu_dying(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7145 | int sched_cpu_dying(unsigned int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:7205:3: error: call to undeclared function 'cpumask_complement'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7205 |                 cpumask_complement(topo, cpumask_of(cpu));
         |                 ^
   kernel/sched/alt_core.c:7205:3: note: did you mean 'bitmap_complement'?
   include/linux/bitmap.h:352:20: note: 'bitmap_complement' declared here
     352 | static inline void bitmap_complement(unsigned long *dst, const unsigned long *src,
         |                    ^
>> kernel/sched/alt_core.c:7209:43: error: call to undeclared function 'cpu_coregroup_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7209 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^
   kernel/sched/alt_core.c:7209:43: note: did you mean 'cpu_core_mask'?
   arch/powerpc/include/asm/smp.h:118:31: note: 'cpu_core_mask' declared here
     118 | static inline struct cpumask *cpu_core_mask(int cpu)
         |                               ^
>> kernel/sched/alt_core.c:7209:43: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
    7209 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:160:64: note: passing argument to parameter 'srcp' here
     160 | static inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                                                ^
   kernel/sched/alt_core.c:7211:31: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
    7211 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7186:30: note: expanded from macro 'TOPOLOGY_CPUMASK'
    7186 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:567:33: note: passing argument to parameter 'src2p' here
     567 |                                const struct cpumask *src2p)
         |                                                      ^
   kernel/sched/alt_core.c:7211:31: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
    7211 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7187:22: note: expanded from macro 'TOPOLOGY_CPUMASK'
    7187 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:738:27: note: passing argument to parameter 'srcp' here
     738 |                                 const struct cpumask *srcp)
         |                                                       ^
   kernel/sched/alt_core.c:7226:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
    7226 | void __init sched_init_smp(void)
         |             ^
   kernel/sched/alt_core.c:7226:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7226 | void __init sched_init_smp(void)
         | ^
         | static 
   kernel/sched/alt_core.c:7278:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
    7278 | void __init sched_init(void)
         |             ^
   kernel/sched/alt_core.c:7278:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7278 | void __init sched_init(void)
         | ^
         | static 
   kernel/sched/alt_core.c:7633:20: warning: no previous prototype for function 'sched_create_group' [-Wmissing-prototypes]
    7633 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^
   kernel/sched/alt_core.c:7633:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7633 | struct task_group *sched_create_group(struct task_group *parent)
         | ^
         | static 
   kernel/sched/alt_core.c:7644:6: warning: no previous prototype for function 'sched_online_group' [-Wmissing-prototypes]
    7644 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^
   kernel/sched/alt_core.c:7644:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7644 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         | ^
         | static 
   kernel/sched/alt_core.c:7655:6: warning: no previous prototype for function 'sched_destroy_group' [-Wmissing-prototypes]
    7655 | void sched_destroy_group(struct task_group *tg)
         |      ^
   kernel/sched/alt_core.c:7655:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7655 | void sched_destroy_group(struct task_group *tg)
         | ^
         | static 
   kernel/sched/alt_core.c:7661:6: warning: no previous prototype for function 'sched_release_group' [-Wmissing-prototypes]
    7661 | void sched_release_group(struct task_group *tg)
         |      ^
   kernel/sched/alt_core.c:7661:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7661 | void sched_release_group(struct task_group *tg)
         | ^
         | static 
   kernel/sched/alt_core.c:7731:5: warning: no previous prototype for function 'sched_group_set_shares' [-Wmissing-prototypes]
    7731 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^
   kernel/sched/alt_core.c:7731:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7731 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         | ^
         | static 
   kernel/sched/alt_core.c:7800:20: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    7800 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7799:20: note: previous initialization is here
    7799 |         .legacy_cftypes = cpu_files,
         |                           ^~~~~~~~~
   24 warnings and 19 errors generated.


vim +/cpu_coregroup_mask +7209 kernel/sched/alt_core.c

9f08fc0c802aa6 Alfred Chen 2019-08-19  7184  
9f08fc0c802aa6 Alfred Chen 2019-08-19  7185  #define TOPOLOGY_CPUMASK(name, mask, last)\
49a66d649cc9c0 Alfred Chen 2021-07-10  7186  	if (cpumask_and(topo, topo, mask)) {					\
a900dba35dbd07 Alfred Chen 2020-12-25  7187  		cpumask_copy(topo, mask);					\
49a66d649cc9c0 Alfred Chen 2021-07-10  7188  		printk(KERN_INFO "sched: cpu#%02d topo: 0x%08lx - "#name,	\
49a66d649cc9c0 Alfred Chen 2021-07-10  7189  		       cpu, (topo++)->bits[0]);					\
a900dba35dbd07 Alfred Chen 2020-12-25  7190  	}									\
9f08fc0c802aa6 Alfred Chen 2019-08-19  7191  	if (!last)								\
49a66d649cc9c0 Alfred Chen 2021-07-10  7192  		cpumask_complement(topo, mask)
9f08fc0c802aa6 Alfred Chen 2019-08-19  7193  
9f08fc0c802aa6 Alfred Chen 2019-08-19  7194  static void sched_init_topology_cpumask(void)
9f08fc0c802aa6 Alfred Chen 2019-08-19  7195  {
9f08fc0c802aa6 Alfred Chen 2019-08-19  7196  	int cpu;
49a66d649cc9c0 Alfred Chen 2021-07-10  7197  	cpumask_t *topo;
9f08fc0c802aa6 Alfred Chen 2019-08-19  7198  
9f08fc0c802aa6 Alfred Chen 2019-08-19  7199  	for_each_online_cpu(cpu) {
9f08fc0c802aa6 Alfred Chen 2019-08-19  7200  		/* take chance to reset time slice for idle tasks */
9f08fc0c802aa6 Alfred Chen 2019-08-19  7201  		cpu_rq(cpu)->idle->time_slice = sched_timeslice_ns;
9f08fc0c802aa6 Alfred Chen 2019-08-19  7202  
a900dba35dbd07 Alfred Chen 2020-12-25  7203  		topo = per_cpu(sched_cpu_topo_masks, cpu) + 1;
a0febbb34c5e7d Alfred Chen 2020-11-09  7204  
49a66d649cc9c0 Alfred Chen 2021-07-10 @7205  		cpumask_complement(topo, cpumask_of(cpu));
9f08fc0c802aa6 Alfred Chen 2019-08-19  7206  #ifdef CONFIG_SCHED_SMT
9f08fc0c802aa6 Alfred Chen 2019-08-19  7207  		TOPOLOGY_CPUMASK(smt, topology_sibling_cpumask(cpu), false);
9f08fc0c802aa6 Alfred Chen 2019-08-19  7208  #endif
9f08fc0c802aa6 Alfred Chen 2019-08-19 @7209  		per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
a900dba35dbd07 Alfred Chen 2020-12-25  7210  		per_cpu(sched_cpu_llc_mask, cpu) = topo;
9f08fc0c802aa6 Alfred Chen 2019-08-19  7211  		TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
9f08fc0c802aa6 Alfred Chen 2019-08-19  7212  
9f08fc0c802aa6 Alfred Chen 2019-08-19  7213  		TOPOLOGY_CPUMASK(core, topology_core_cpumask(cpu), false);
9f08fc0c802aa6 Alfred Chen 2019-08-19  7214  
9f08fc0c802aa6 Alfred Chen 2019-08-19  7215  		TOPOLOGY_CPUMASK(others, cpu_online_mask, true);
9f08fc0c802aa6 Alfred Chen 2019-08-19  7216  
49a66d649cc9c0 Alfred Chen 2021-07-10  7217  		per_cpu(sched_cpu_topo_end_mask, cpu) = topo;
a6f045d290f809 Alfred Chen 2020-11-03  7218  		printk(KERN_INFO "sched: cpu#%02d llc_id = %d, llc_mask idx = %d\n",
a6f045d290f809 Alfred Chen 2020-11-03  7219  		       cpu, per_cpu(sd_llc_id, cpu),
a6f045d290f809 Alfred Chen 2020-11-03  7220  		       (int) (per_cpu(sched_cpu_llc_mask, cpu) -
a900dba35dbd07 Alfred Chen 2020-12-25  7221  			      per_cpu(sched_cpu_topo_masks, cpu)));
9f08fc0c802aa6 Alfred Chen 2019-08-19  7222  	}
9f08fc0c802aa6 Alfred Chen 2019-08-19  7223  }
9f08fc0c802aa6 Alfred Chen 2019-08-19  7224  #endif
9f08fc0c802aa6 Alfred Chen 2019-08-19  7225  

:::::: The code at line 7209 was first introduced by commit
:::::: 9f08fc0c802aa60b849cb326294a06f38abaa0b0 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
