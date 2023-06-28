Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93B41847
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 03:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687924013; x=1719460013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kmzZijoqywr74wHdoaDqMSc9e0NJ0hfNU2RTrGuusBE=;
  b=X3aO9ShafisPw2+d8bobeIWnBAhe27uMjbqnO6MlevbzFCW55XtXaqCA
   c8TdX/WUh/kW1ikcqcUhafCLy5GgM37jinxztiYSrf6Re17baYOgMD+TP
   FRP1rId654svXICKGyRExO1nLmRm61ogVsQdiyJXZAfBMzyC/PGgEdVFB
   c+4luCnxzvDruzB+GIgvWbAJ3m/pxTb50y+oZ6KaWuD/0xleVqABCrvkw
   oRN7Y5HGvD1fjdc1tHqSjNpMF1mAiKkJyWncEY4/KK0oAYp+S3wCy2dZQ
   mJbx0D/8w0q61ghXOnY2QJOJ5FwkZ1Eb9oZ/KZu49tCCCl2melH69WQ/G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359239582"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="359239582"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 20:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="720073510"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="720073510"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jun 2023 20:46:41 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEM8e-000CgZ-1W;
	Wed, 28 Jun 2023 03:46:40 +0000
Date: Wed, 28 Jun 2023 11:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 295/385] kernel/sched/alt_core.c:4421:17: error:
 implicit declaration of function 'hrtick_start'; did you mean
 'hrtimer_start'?
Message-ID: <202306281134.YWE0MQM5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   d6148915d97f4535395579f728454c4f68f0774b
commit: bcf5606dbe8958da33841ebb8b63ba49b86c097f [295/385] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: arc-defconfig (https://download.01.org/0day-ci/archive/20230628/202306281134.YWE0MQM5-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306281134.YWE0MQM5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306281134.YWE0MQM5-lkp@intel.com/

Note: the zen/6.4/prjc HEAD d6148915d97f4535395579f728454c4f68f0774b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:9,
                    from kernel/sched/alt_core.c:42:
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
   include/linux/sched.h:2340:15: note: previous declaration of 'sched_cpu_util' with type 'long unsigned int(int)'
    2340 | unsigned long sched_cpu_util(int cpu);
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
   kernel/sched/alt_core.c: In function 'choose_next_task':
>> kernel/sched/alt_core.c:4421:17: error: implicit declaration of function 'hrtick_start'; did you mean 'hrtimer_start'? [-Werror=implicit-function-declaration]
    4421 |                 hrtick_start(rq, next->time_slice);
         |                 ^~~~~~~~~~~~
         |                 hrtimer_start
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
   cc1: some warnings being treated as errors


vim +4421 kernel/sched/alt_core.c

cedcd3e67433b3 Alfred Chen 2019-08-19  4399  
cedcd3e67433b3 Alfred Chen 2019-08-19  4400  static inline struct task_struct *
cedcd3e67433b3 Alfred Chen 2019-08-19  4401  choose_next_task(struct rq *rq, int cpu, struct task_struct *prev)
cedcd3e67433b3 Alfred Chen 2019-08-19  4402  {
cedcd3e67433b3 Alfred Chen 2019-08-19  4403  	struct task_struct *next;
cedcd3e67433b3 Alfred Chen 2019-08-19  4404  
cedcd3e67433b3 Alfred Chen 2019-08-19  4405  	if (unlikely(rq->skip)) {
cedcd3e67433b3 Alfred Chen 2019-08-19  4406  		next = rq_runnable_task(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  4407  		if (next == rq->idle) {
cedcd3e67433b3 Alfred Chen 2019-08-19  4408  #ifdef	CONFIG_SMP
cedcd3e67433b3 Alfred Chen 2019-08-19  4409  			if (!take_other_rq_tasks(rq, cpu)) {
cedcd3e67433b3 Alfred Chen 2019-08-19  4410  #endif
cedcd3e67433b3 Alfred Chen 2019-08-19  4411  				rq->skip = NULL;
cedcd3e67433b3 Alfred Chen 2019-08-19  4412  				schedstat_inc(rq->sched_goidle);
cedcd3e67433b3 Alfred Chen 2019-08-19  4413  				return next;
cedcd3e67433b3 Alfred Chen 2019-08-19  4414  #ifdef	CONFIG_SMP
cedcd3e67433b3 Alfred Chen 2019-08-19  4415  			}
cedcd3e67433b3 Alfred Chen 2019-08-19  4416  			next = rq_runnable_task(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  4417  #endif
cedcd3e67433b3 Alfred Chen 2019-08-19  4418  		}
cedcd3e67433b3 Alfred Chen 2019-08-19  4419  		rq->skip = NULL;
cedcd3e67433b3 Alfred Chen 2019-08-19  4420  #ifdef CONFIG_HIGH_RES_TIMERS
cedcd3e67433b3 Alfred Chen 2019-08-19 @4421  		hrtick_start(rq, next->time_slice);
cedcd3e67433b3 Alfred Chen 2019-08-19  4422  #endif
cedcd3e67433b3 Alfred Chen 2019-08-19  4423  		return next;
cedcd3e67433b3 Alfred Chen 2019-08-19  4424  	}
cedcd3e67433b3 Alfred Chen 2019-08-19  4425  
cedcd3e67433b3 Alfred Chen 2019-08-19  4426  	next = sched_rq_first_task(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  4427  	if (next == rq->idle) {
cedcd3e67433b3 Alfred Chen 2019-08-19  4428  #ifdef	CONFIG_SMP
cedcd3e67433b3 Alfred Chen 2019-08-19  4429  		if (!take_other_rq_tasks(rq, cpu)) {
cedcd3e67433b3 Alfred Chen 2019-08-19  4430  #endif
cedcd3e67433b3 Alfred Chen 2019-08-19  4431  			schedstat_inc(rq->sched_goidle);
9a3feaa4d828fe Alfred Chen 2020-08-09  4432  			/*printk(KERN_INFO "sched: choose_next_task(%d) idle %px\n", cpu, next);*/
cedcd3e67433b3 Alfred Chen 2019-08-19  4433  			return next;
cedcd3e67433b3 Alfred Chen 2019-08-19  4434  #ifdef	CONFIG_SMP
cedcd3e67433b3 Alfred Chen 2019-08-19  4435  		}
cedcd3e67433b3 Alfred Chen 2019-08-19  4436  		next = sched_rq_first_task(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  4437  #endif
cedcd3e67433b3 Alfred Chen 2019-08-19  4438  	}
cedcd3e67433b3 Alfred Chen 2019-08-19  4439  #ifdef CONFIG_HIGH_RES_TIMERS
cedcd3e67433b3 Alfred Chen 2019-08-19  4440  	hrtick_start(rq, next->time_slice);
cedcd3e67433b3 Alfred Chen 2019-08-19  4441  #endif
9a3feaa4d828fe Alfred Chen 2020-08-09  4442  	/*printk(KERN_INFO "sched: choose_next_task(%d) next %px\n", cpu,
9a3feaa4d828fe Alfred Chen 2020-08-09  4443  	 * next);*/
cedcd3e67433b3 Alfred Chen 2019-08-19  4444  	return next;
cedcd3e67433b3 Alfred Chen 2019-08-19  4445  }
cedcd3e67433b3 Alfred Chen 2019-08-19  4446  

:::::: The code at line 4421 was first introduced by commit
:::::: cedcd3e67433b3472068caf48ea86414191e0a6b Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
