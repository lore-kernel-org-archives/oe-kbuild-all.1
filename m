Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6873F1429B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAEYnZlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700419368; x=1731955368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w3K/UtfevO8wLiLTE9ttj9olkUjEDM99/rI0bWjCvHk=;
  b=HAEYnZlKDdDZuQB4UaR0q7tqbKN4lQnkJdPHq8rnmYLu8g9r1gyujiqL
   69KKP4xlzAxGUezks7LiLT9SgY9+RgI+TGINxpNpJeHisSWE3t92sx3Lt
   pp6AS8NbnXzOcgnrgTM8Jbxf6LmK0m3tZbbSHr8UGNW4N/gdXbcb6w310
   p81dqtc/kF02p6jwRAn8l6ojF7JpjfJP7oDKmFEOyb/yA0u7cYPXbKe8t
   jHScimC/+0BVzHPmstfcmN8yKEpNUkxpLw4uQ+kCVrFKQA1pG+nGNVeSM
   eMqUxLyXVTE8a0mO8uqvV66+AFYFPS9eRgzKJz9FffyjAJ39WngpAnTB7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="4688374"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="4688374"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 10:42:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="836553479"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="836553479"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Nov 2023 10:42:46 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4mkl-0005PN-2j;
	Sun, 19 Nov 2023 18:42:43 +0000
Date: Mon, 20 Nov 2023 02:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/prjc 339/449] kernel/sched/alt_core.c:7209:57: error:
 implicit declaration of function 'cpu_coregroup_mask'
Message-ID: <202311200237.dUfsj7sI-lkp@intel.com>
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
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20231120/202311200237.dUfsj7sI-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200237.dUfsj7sI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200237.dUfsj7sI-lkp@intel.com/

Note: the zen/6.6/prjc HEAD a343b008e1bf155cdcfe9a46e38336032adeb65a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/sched/alt_sched.h:481:42: warning: 'struct cpuidle_state' declared inside parameter list will not be visible outside of this definition or declaration
     481 |                                   struct cpuidle_state *idle_state)
         |                                          ^~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'update_rq_clock':
   kernel/sched/alt_core.c:578:21: error: implicit declaration of function 'sched_clock_cpu' [-Werror=implicit-function-declaration]
     578 |         s64 delta = sched_clock_cpu(cpu_of(rq)) - rq->clock;
         |                     ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:632:15: error: conflicting types for 'sched_cpu_util'; have 'long unsigned int(int,  long unsigned int)'
     632 | unsigned long sched_cpu_util(int cpu, unsigned long max)
         |               ^~~~~~~~~~~~~~
   In file included from include/linux/sched/signal.h:7,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/alt_core.c:14:
   include/linux/sched.h:2336:15: note: previous declaration of 'sched_cpu_util' with type 'long unsigned int(int)'
    2336 | unsigned long sched_cpu_util(int cpu);
         |               ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:966:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
     966 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
   In file included from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5:
   kernel/sched/alt_core.c: In function 'resched_curr':
   include/linux/smp.h:134:9: error: implicit declaration of function 'trace_ipi_send_cpu' [-Werror=implicit-function-declaration]
     134 |         trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:984:17: note: in expansion of macro 'smp_send_reschedule'
     984 |                 smp_send_reschedule(cpu);
         |                 ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:989:6: warning: no previous prototype for 'resched_cpu' [-Wmissing-prototypes]
     989 | void resched_cpu(int cpu)
         |      ^~~~~~~~~~~
   kernel/sched/alt_core.c:1004:6: warning: no previous prototype for 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1004 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1006:6: warning: no previous prototype for 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1006 | void set_cpu_sd_state_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1192:6: warning: no previous prototype for 'hrtick_start' [-Wmissing-prototypes]
    1192 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:2339:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2339 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2372:6: warning: no previous prototype for 'send_call_function_single_ipi' [-Wmissing-prototypes]
    2372 | void send_call_function_single_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'scheduler_tick':
   kernel/sched/alt_core.c:3894:9: error: implicit declaration of function 'sched_clock_tick'; did you mean 'scheduler_tick'? [-Werror=implicit-function-declaration]
    3894 |         sched_clock_tick();
         |         ^~~~~~~~~~~~~~~~
         |         scheduler_tick
   kernel/sched/alt_core.c: In function '__schedule':
   kernel/sched/alt_core.c:4558:49: error: 'PF_FROZEN' undeclared (first use in this function); did you mean 'PF_ROSE'?
    4558 |                                 !(prev->flags & PF_FROZEN);
         |                                                 ^~~~~~~~~
         |                                                 PF_ROSE
   kernel/sched/alt_core.c:4558:49: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/alt_core.c: In function 'sched_submit_work':
   kernel/sched/alt_core.c:4674:13: error: implicit declaration of function 'tsk_is_pi_blocked'; did you mean 'osq_is_locked'? [-Werror=implicit-function-declaration]
    4674 |         if (tsk_is_pi_blocked(tsk))
         |             ^~~~~~~~~~~~~~~~~
         |             osq_is_locked
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:4734:35: warning: no previous prototype for 'schedule_user' [-Wmissing-prototypes]
    4734 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function '__sched_setscheduler':
   kernel/sched/alt_core.c:5357:17: error: implicit declaration of function 'cpuset_read_lock'; did you mean 'cpus_read_lock'? [-Werror=implicit-function-declaration]
    5357 |                 cpuset_read_lock();
         |                 ^~~~~~~~~~~~~~~~
         |                 cpus_read_lock
   kernel/sched/alt_core.c:5405:25: error: implicit declaration of function 'cpuset_read_unlock'; did you mean 'cpus_read_unlock'? [-Werror=implicit-function-declaration]
    5405 |                         cpuset_read_unlock();
         |                         ^~~~~~~~~~~~~~~~~~
         |                         cpus_read_unlock
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:6743:5: error: conflicting types for 'task_can_attach'; have 'int(struct task_struct *, const struct cpumask *)'
    6743 | int task_can_attach(struct task_struct *p,
         |     ^~~~~~~~~~~~~~~
   include/linux/sched.h:1883:12: note: previous declaration of 'task_can_attach' with type 'int(struct task_struct *)'
    1883 | extern int task_can_attach(struct task_struct *p);
         |            ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6980:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
    6980 | int sched_cpu_activate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7019:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7019 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7083:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
    7083 | int sched_cpu_starting(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:7205:17: error: implicit declaration of function 'cpumask_complement'; did you mean 'bitmap_complement'? [-Werror=implicit-function-declaration]
    7205 |                 cpumask_complement(topo, cpumask_of(cpu));
         |                 ^~~~~~~~~~~~~~~~~~
         |                 bitmap_complement
>> kernel/sched/alt_core.c:7209:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Werror=implicit-function-declaration]
    7209 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7209:57: warning: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    7209 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from include/linux/smp.h:13:
   include/linux/cpumask.h:160:64: note: expected 'const struct cpumask *' but argument is of type 'int'
     160 | static inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:7211:45: warning: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    7211 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7186:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7186 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:567:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     567 |                                const struct cpumask *src2p)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:7211:45: warning: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    7211 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7187:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7187 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:738:55: note: expected 'const struct cpumask *' but argument is of type 'int'
     738 |                                 const struct cpumask *srcp)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:7226:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    7226 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7278:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    7278 | void __init sched_init(void)
         |             ^~~~~~~~~~
   kernel/sched/alt_core.c:7633:20: warning: no previous prototype for 'sched_create_group' [-Wmissing-prototypes]
    7633 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7644:6: warning: no previous prototype for 'sched_online_group' [-Wmissing-prototypes]
    7644 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7655:6: warning: no previous prototype for 'sched_destroy_group' [-Wmissing-prototypes]
    7655 | void sched_destroy_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7661:6: warning: no previous prototype for 'sched_release_group' [-Wmissing-prototypes]
    7661 | void sched_release_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7731:5: warning: no previous prototype for 'sched_group_set_shares' [-Wmissing-prototypes]
    7731 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7800:27: warning: initialized field overwritten [-Woverride-init]
    7800 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7800:27: note: (near initialization for 'cpu_cgrp_subsys.legacy_cftypes')
   cc1: some warnings being treated as errors


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
49a66d649cc9c0 Alfred Chen 2021-07-10  7205  		cpumask_complement(topo, cpumask_of(cpu));
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
