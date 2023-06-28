Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA371847
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 03:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687922079; x=1719458079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xR7S1Bz4R8XXWedbrZ5aAOF6ir45oPJKFQKyFHrbWd0=;
  b=EE+4iZWCCaPNQyEdWyKzlCaJTu5zGo7NENeayDaF2cyW21UghlQqghdT
   fjKnac/Ic+oP7tmHlab8izQ+nrcYxcTKj6qp5jyKKXHeRQw4+zWMhBjEV
   +/DRPBnA7QdpNYT0A/CM0kti0tlKuv4O8WeR6YZOXNG21q+Wv46Z1pVoV
   onCQM4dVVutvt+38okYhun22/mG/exi4Fmdv5rCmwOpY6ubvMe8AVW7tv
   SLwfCJ6rlr4SwuYT1duFpGFPzNjvNsKoxhmXkB+Qe0/W/1v415FgceTQu
   yn9TmYvL5W+cFzbGbG6pfeI6osMIYqkb/hmH3rRj7pMKNnkG2YxVw9YIY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="364283118"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="364283118"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 20:14:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="694122689"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="694122689"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Jun 2023 20:14:36 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qELdc-000CbZ-0r;
	Wed, 28 Jun 2023 03:14:36 +0000
Date: Wed, 28 Jun 2023 11:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 295/385] kernel/sched/alt_core.c:1004:6: warning: no
 previous prototype for 'select_nohz_load_balancer'
Message-ID: <202306281141.GUEFFYF7-lkp@intel.com>
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
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230628/202306281141.GUEFFYF7-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306281141.GUEFFYF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306281141.GUEFFYF7-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> kernel/sched/alt_core.c:1004:6: warning: no previous prototype for 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1004 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:1006:6: warning: no previous prototype for 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1006 | void set_cpu_sd_state_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:1192:6: warning: no previous prototype for 'hrtick_start' [-Wmissing-prototypes]
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
   kernel/sched/alt_core.c:6770:6: warning: no previous prototype for 'idle_task_exit' [-Wmissing-prototypes]
    6770 | void idle_task_exit(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6980:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
    6980 | int sched_cpu_activate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7019:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7019 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7083:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
    7083 | int sched_cpu_starting(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7103:5: warning: no previous prototype for 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7103 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7145:5: warning: no previous prototype for 'sched_cpu_dying' [-Wmissing-prototypes]
    7145 | int sched_cpu_dying(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:7205:17: error: implicit declaration of function 'cpumask_complement'; did you mean 'bitmap_complement'? [-Werror=implicit-function-declaration]
    7205 |                 cpumask_complement(topo, cpumask_of(cpu));
         |                 ^~~~~~~~~~~~~~~~~~
         |                 bitmap_complement
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:7226:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    7226 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7278:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    7278 | void __init sched_init(void)
         |             ^~~~~~~~~~
>> kernel/sched/alt_core.c:7633:20: warning: no previous prototype for 'sched_create_group' [-Wmissing-prototypes]
    7633 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7644:6: warning: no previous prototype for 'sched_online_group' [-Wmissing-prototypes]
    7644 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7655:6: warning: no previous prototype for 'sched_destroy_group' [-Wmissing-prototypes]
    7655 | void sched_destroy_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7661:6: warning: no previous prototype for 'sched_release_group' [-Wmissing-prototypes]
    7661 | void sched_release_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7731:5: warning: no previous prototype for 'sched_group_set_shares' [-Wmissing-prototypes]
    7731 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7800:27: warning: initialized field overwritten [-Woverride-init]
    7800 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7800:27: note: (near initialization for 'cpu_cgrp_subsys.legacy_cftypes')
   cc1: some warnings being treated as errors


vim +/select_nohz_load_balancer +1004 kernel/sched/alt_core.c

cedcd3e67433b3 Alfred Chen 2019-08-19  1003  
20fdd10d6b2a3d Alfred Chen 2020-08-07 @1004  void select_nohz_load_balancer(int stop_tick) {}
cedcd3e67433b3 Alfred Chen 2019-08-19  1005  
cedcd3e67433b3 Alfred Chen 2019-08-19 @1006  void set_cpu_sd_state_idle(void) {}
cedcd3e67433b3 Alfred Chen 2019-08-19  1007  
cedcd3e67433b3 Alfred Chen 2019-08-19  1008  /*
cedcd3e67433b3 Alfred Chen 2019-08-19  1009   * In the semi idle case, use the nearest busy CPU for migrating timers
cedcd3e67433b3 Alfred Chen 2019-08-19  1010   * from an idle CPU.  This is good for power-savings.
cedcd3e67433b3 Alfred Chen 2019-08-19  1011   *
cedcd3e67433b3 Alfred Chen 2019-08-19  1012   * We don't do similar optimization for completely idle system, as
cedcd3e67433b3 Alfred Chen 2019-08-19  1013   * selecting an idle CPU will add more delays to the timers than intended
cedcd3e67433b3 Alfred Chen 2019-08-19  1014   * (as that CPU's timer base may not be uptodate wrt jiffies etc).
cedcd3e67433b3 Alfred Chen 2019-08-19  1015   */
cedcd3e67433b3 Alfred Chen 2019-08-19  1016  int get_nohz_timer_target(void)
cedcd3e67433b3 Alfred Chen 2019-08-19  1017  {
cedcd3e67433b3 Alfred Chen 2019-08-19  1018  	int i, cpu = smp_processor_id(), default_cpu = -1;
cedcd3e67433b3 Alfred Chen 2019-08-19  1019  	struct cpumask *mask;
f6ded291cc9b43 Alfred Chen 2021-10-15  1020  	const struct cpumask *hk_mask;
cedcd3e67433b3 Alfred Chen 2019-08-19  1021  
2d596dea2bad04 Alfred Chen 2022-05-19  1022  	if (housekeeping_cpu(cpu, HK_TYPE_TIMER)) {
cedcd3e67433b3 Alfred Chen 2019-08-19  1023  		if (!idle_cpu(cpu))
cedcd3e67433b3 Alfred Chen 2019-08-19  1024  			return cpu;
cedcd3e67433b3 Alfred Chen 2019-08-19  1025  		default_cpu = cpu;
cedcd3e67433b3 Alfred Chen 2019-08-19  1026  	}
cedcd3e67433b3 Alfred Chen 2019-08-19  1027  
2d596dea2bad04 Alfred Chen 2022-05-19  1028  	hk_mask = housekeeping_cpumask(HK_TYPE_TIMER);
f6ded291cc9b43 Alfred Chen 2021-10-15  1029  
11516d37fca3a4 Alfred Chen 2021-07-10  1030  	for (mask = per_cpu(sched_cpu_topo_masks, cpu) + 1;
11516d37fca3a4 Alfred Chen 2021-07-10  1031  	     mask < per_cpu(sched_cpu_topo_end_mask, cpu); mask++)
f6ded291cc9b43 Alfred Chen 2021-10-15  1032  		for_each_cpu_and(i, mask, hk_mask)
cedcd3e67433b3 Alfred Chen 2019-08-19  1033  			if (!idle_cpu(i))
cedcd3e67433b3 Alfred Chen 2019-08-19  1034  				return i;
cedcd3e67433b3 Alfred Chen 2019-08-19  1035  
cedcd3e67433b3 Alfred Chen 2019-08-19  1036  	if (default_cpu == -1)
2d596dea2bad04 Alfred Chen 2022-05-19  1037  		default_cpu = housekeeping_any_cpu(HK_TYPE_TIMER);
cedcd3e67433b3 Alfred Chen 2019-08-19  1038  	cpu = default_cpu;
cedcd3e67433b3 Alfred Chen 2019-08-19  1039  
cedcd3e67433b3 Alfred Chen 2019-08-19  1040  	return cpu;
cedcd3e67433b3 Alfred Chen 2019-08-19  1041  }
cedcd3e67433b3 Alfred Chen 2019-08-19  1042  
cedcd3e67433b3 Alfred Chen 2019-08-19  1043  /*
cedcd3e67433b3 Alfred Chen 2019-08-19  1044   * When add_timer_on() enqueues a timer into the timer wheel of an
cedcd3e67433b3 Alfred Chen 2019-08-19  1045   * idle CPU then this timer might expire before the next timer event
cedcd3e67433b3 Alfred Chen 2019-08-19  1046   * which is scheduled to wake up that CPU. In case of a completely
cedcd3e67433b3 Alfred Chen 2019-08-19  1047   * idle system the next event might even be infinite time into the
cedcd3e67433b3 Alfred Chen 2019-08-19  1048   * future. wake_up_idle_cpu() ensures that the CPU is woken up and
cedcd3e67433b3 Alfred Chen 2019-08-19  1049   * leaves the inner idle loop so the newly added timer is taken into
cedcd3e67433b3 Alfred Chen 2019-08-19  1050   * account when the CPU goes back to idle and evaluates the timer
cedcd3e67433b3 Alfred Chen 2019-08-19  1051   * wheel for the next timer event.
cedcd3e67433b3 Alfred Chen 2019-08-19  1052   */
cedcd3e67433b3 Alfred Chen 2019-08-19  1053  static inline void wake_up_idle_cpu(int cpu)
cedcd3e67433b3 Alfred Chen 2019-08-19  1054  {
6e2561bfbf1fec Alfred Chen 2020-09-19  1055  	struct rq *rq = cpu_rq(cpu);
6e2561bfbf1fec Alfred Chen 2020-09-19  1056  
cedcd3e67433b3 Alfred Chen 2019-08-19  1057  	if (cpu == smp_processor_id())
cedcd3e67433b3 Alfred Chen 2019-08-19  1058  		return;
cedcd3e67433b3 Alfred Chen 2019-08-19  1059  
6e2561bfbf1fec Alfred Chen 2020-09-19  1060  	if (set_nr_and_not_polling(rq->idle))
cedcd3e67433b3 Alfred Chen 2019-08-19  1061  		smp_send_reschedule(cpu);
6e2561bfbf1fec Alfred Chen 2020-09-19  1062  	else
6e2561bfbf1fec Alfred Chen 2020-09-19  1063  		trace_sched_wake_idle_without_ipi(cpu);
cedcd3e67433b3 Alfred Chen 2019-08-19  1064  }
cedcd3e67433b3 Alfred Chen 2019-08-19  1065  
cedcd3e67433b3 Alfred Chen 2019-08-19  1066  static inline bool wake_up_full_nohz_cpu(int cpu)
cedcd3e67433b3 Alfred Chen 2019-08-19  1067  {
cedcd3e67433b3 Alfred Chen 2019-08-19  1068  	/*
cedcd3e67433b3 Alfred Chen 2019-08-19  1069  	 * We just need the target to call irq_exit() and re-evaluate
cedcd3e67433b3 Alfred Chen 2019-08-19  1070  	 * the next tick. The nohz full kick at least implies that.
cedcd3e67433b3 Alfred Chen 2019-08-19  1071  	 * If needed we can still optimize that later with an
cedcd3e67433b3 Alfred Chen 2019-08-19  1072  	 * empty IRQ.
cedcd3e67433b3 Alfred Chen 2019-08-19  1073  	 */
6e2561bfbf1fec Alfred Chen 2020-09-19  1074  	if (cpu_is_offline(cpu))
6e2561bfbf1fec Alfred Chen 2020-09-19  1075  		return true;  /* Don't try to wake offline CPUs. */
cedcd3e67433b3 Alfred Chen 2019-08-19  1076  	if (tick_nohz_full_cpu(cpu)) {
cedcd3e67433b3 Alfred Chen 2019-08-19  1077  		if (cpu != smp_processor_id() ||
cedcd3e67433b3 Alfred Chen 2019-08-19  1078  		    tick_nohz_tick_stopped())
cedcd3e67433b3 Alfred Chen 2019-08-19  1079  			tick_nohz_full_kick_cpu(cpu);
cedcd3e67433b3 Alfred Chen 2019-08-19  1080  		return true;
cedcd3e67433b3 Alfred Chen 2019-08-19  1081  	}
cedcd3e67433b3 Alfred Chen 2019-08-19  1082  
cedcd3e67433b3 Alfred Chen 2019-08-19  1083  	return false;
cedcd3e67433b3 Alfred Chen 2019-08-19  1084  }
cedcd3e67433b3 Alfred Chen 2019-08-19  1085  
cedcd3e67433b3 Alfred Chen 2019-08-19  1086  void wake_up_nohz_cpu(int cpu)
cedcd3e67433b3 Alfred Chen 2019-08-19  1087  {
6e2561bfbf1fec Alfred Chen 2020-09-19  1088  	if (!wake_up_full_nohz_cpu(cpu))
cedcd3e67433b3 Alfred Chen 2019-08-19  1089  		wake_up_idle_cpu(cpu);
cedcd3e67433b3 Alfred Chen 2019-08-19  1090  }
cedcd3e67433b3 Alfred Chen 2019-08-19  1091  
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1092  static void nohz_csd_func(void *info)
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1093  {
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1094  	struct rq *rq = info;
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1095  	int cpu = cpu_of(rq);
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1096  	unsigned int flags;
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1097  
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1098  	/*
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1099  	 * Release the rq::nohz_csd.
20fdd10d6b2a3d Alfred Chen 2020-08-07  1100  	 */
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1101  	flags = atomic_fetch_andnot(NOHZ_KICK_MASK, nohz_flags(cpu));
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1102  	WARN_ON(!(flags & NOHZ_KICK_MASK));
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1103  
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1104  	rq->idle_balance = idle_cpu(cpu);
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1105  	if (rq->idle_balance && !need_resched()) {
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1106  		rq->nohz_idle_balance = flags;
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1107  		raise_softirq_irqoff(SCHED_SOFTIRQ);
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1108  	}
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1109  }
6ab8ee0f0daeb2 Alfred Chen 2020-07-31  1110  
cedcd3e67433b3 Alfred Chen 2019-08-19  1111  #endif /* CONFIG_NO_HZ_COMMON */
cedcd3e67433b3 Alfred Chen 2019-08-19  1112  #endif /* CONFIG_SMP */
cedcd3e67433b3 Alfred Chen 2019-08-19  1113  
cedcd3e67433b3 Alfred Chen 2019-08-19  1114  static inline void check_preempt_curr(struct rq *rq)
cedcd3e67433b3 Alfred Chen 2019-08-19  1115  {
cedcd3e67433b3 Alfred Chen 2019-08-19  1116  	if (sched_rq_first_task(rq) != rq->curr)
cedcd3e67433b3 Alfred Chen 2019-08-19  1117  		resched_curr(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  1118  }
cedcd3e67433b3 Alfred Chen 2019-08-19  1119  
cedcd3e67433b3 Alfred Chen 2019-08-19  1120  #ifdef CONFIG_SCHED_HRTICK
cedcd3e67433b3 Alfred Chen 2019-08-19  1121  /*
cedcd3e67433b3 Alfred Chen 2019-08-19  1122   * Use HR-timers to deliver accurate preemption points.
cedcd3e67433b3 Alfred Chen 2019-08-19  1123   */
cedcd3e67433b3 Alfred Chen 2019-08-19  1124  
cedcd3e67433b3 Alfred Chen 2019-08-19  1125  static void hrtick_clear(struct rq *rq)
cedcd3e67433b3 Alfred Chen 2019-08-19  1126  {
cedcd3e67433b3 Alfred Chen 2019-08-19  1127  	if (hrtimer_active(&rq->hrtick_timer))
cedcd3e67433b3 Alfred Chen 2019-08-19  1128  		hrtimer_cancel(&rq->hrtick_timer);
cedcd3e67433b3 Alfred Chen 2019-08-19  1129  }
cedcd3e67433b3 Alfred Chen 2019-08-19  1130  
cedcd3e67433b3 Alfred Chen 2019-08-19  1131  /*
cedcd3e67433b3 Alfred Chen 2019-08-19  1132   * High-resolution timer tick.
cedcd3e67433b3 Alfred Chen 2019-08-19  1133   * Runs from hardirq context with interrupts disabled.
cedcd3e67433b3 Alfred Chen 2019-08-19  1134   */
cedcd3e67433b3 Alfred Chen 2019-08-19  1135  static enum hrtimer_restart hrtick(struct hrtimer *timer)
cedcd3e67433b3 Alfred Chen 2019-08-19  1136  {
cedcd3e67433b3 Alfred Chen 2019-08-19  1137  	struct rq *rq = container_of(timer, struct rq, hrtick_timer);
cedcd3e67433b3 Alfred Chen 2019-08-19  1138  
cedcd3e67433b3 Alfred Chen 2019-08-19  1139  	WARN_ON_ONCE(cpu_of(rq) != smp_processor_id());
cedcd3e67433b3 Alfred Chen 2019-08-19  1140  
cedcd3e67433b3 Alfred Chen 2019-08-19  1141  	raw_spin_lock(&rq->lock);
cedcd3e67433b3 Alfred Chen 2019-08-19  1142  	resched_curr(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  1143  	raw_spin_unlock(&rq->lock);
cedcd3e67433b3 Alfred Chen 2019-08-19  1144  
cedcd3e67433b3 Alfred Chen 2019-08-19  1145  	return HRTIMER_NORESTART;
cedcd3e67433b3 Alfred Chen 2019-08-19  1146  }
cedcd3e67433b3 Alfred Chen 2019-08-19  1147  
cedcd3e67433b3 Alfred Chen 2019-08-19  1148  /*
cedcd3e67433b3 Alfred Chen 2019-08-19  1149   * Use hrtick when:
cedcd3e67433b3 Alfred Chen 2019-08-19  1150   *  - enabled by features
cedcd3e67433b3 Alfred Chen 2019-08-19  1151   *  - hrtimer is actually high res
cedcd3e67433b3 Alfred Chen 2019-08-19  1152   */
cedcd3e67433b3 Alfred Chen 2019-08-19  1153  static inline int hrtick_enabled(struct rq *rq)
cedcd3e67433b3 Alfred Chen 2019-08-19  1154  {
cedcd3e67433b3 Alfred Chen 2019-08-19  1155  	/**
cedcd3e67433b3 Alfred Chen 2019-08-19  1156  	 * Alt schedule FW doesn't support sched_feat yet
cedcd3e67433b3 Alfred Chen 2019-08-19  1157  	if (!sched_feat(HRTICK))
cedcd3e67433b3 Alfred Chen 2019-08-19  1158  		return 0;
cedcd3e67433b3 Alfred Chen 2019-08-19  1159  	*/
cedcd3e67433b3 Alfred Chen 2019-08-19  1160  	if (!cpu_active(cpu_of(rq)))
cedcd3e67433b3 Alfred Chen 2019-08-19  1161  		return 0;
cedcd3e67433b3 Alfred Chen 2019-08-19  1162  	return hrtimer_is_hres_active(&rq->hrtick_timer);
cedcd3e67433b3 Alfred Chen 2019-08-19  1163  }
cedcd3e67433b3 Alfred Chen 2019-08-19  1164  
cedcd3e67433b3 Alfred Chen 2019-08-19  1165  #ifdef CONFIG_SMP
cedcd3e67433b3 Alfred Chen 2019-08-19  1166  
cedcd3e67433b3 Alfred Chen 2019-08-19  1167  static void __hrtick_restart(struct rq *rq)
cedcd3e67433b3 Alfred Chen 2019-08-19  1168  {
cedcd3e67433b3 Alfred Chen 2019-08-19  1169  	struct hrtimer *timer = &rq->hrtick_timer;
fa5f7bf056d306 Alfred Chen 2021-04-01  1170  	ktime_t time = rq->hrtick_time;
cedcd3e67433b3 Alfred Chen 2019-08-19  1171  
fa5f7bf056d306 Alfred Chen 2021-04-01  1172  	hrtimer_start(timer, time, HRTIMER_MODE_ABS_PINNED_HARD);
cedcd3e67433b3 Alfred Chen 2019-08-19  1173  }
cedcd3e67433b3 Alfred Chen 2019-08-19  1174  
cedcd3e67433b3 Alfred Chen 2019-08-19  1175  /*
cedcd3e67433b3 Alfred Chen 2019-08-19  1176   * called from hardirq (IPI) context
cedcd3e67433b3 Alfred Chen 2019-08-19  1177   */
cedcd3e67433b3 Alfred Chen 2019-08-19  1178  static void __hrtick_start(void *arg)
cedcd3e67433b3 Alfred Chen 2019-08-19  1179  {
cedcd3e67433b3 Alfred Chen 2019-08-19  1180  	struct rq *rq = arg;
cedcd3e67433b3 Alfred Chen 2019-08-19  1181  
cedcd3e67433b3 Alfred Chen 2019-08-19  1182  	raw_spin_lock(&rq->lock);
cedcd3e67433b3 Alfred Chen 2019-08-19  1183  	__hrtick_restart(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  1184  	raw_spin_unlock(&rq->lock);
cedcd3e67433b3 Alfred Chen 2019-08-19  1185  }
cedcd3e67433b3 Alfred Chen 2019-08-19  1186  
cedcd3e67433b3 Alfred Chen 2019-08-19  1187  /*
cedcd3e67433b3 Alfred Chen 2019-08-19  1188   * Called to set the hrtick timer state.
cedcd3e67433b3 Alfred Chen 2019-08-19  1189   *
cedcd3e67433b3 Alfred Chen 2019-08-19  1190   * called with rq->lock held and irqs disabled
cedcd3e67433b3 Alfred Chen 2019-08-19  1191   */
cedcd3e67433b3 Alfred Chen 2019-08-19 @1192  void hrtick_start(struct rq *rq, u64 delay)
cedcd3e67433b3 Alfred Chen 2019-08-19  1193  {
cedcd3e67433b3 Alfred Chen 2019-08-19  1194  	struct hrtimer *timer = &rq->hrtick_timer;
cedcd3e67433b3 Alfred Chen 2019-08-19  1195  	s64 delta;
cedcd3e67433b3 Alfred Chen 2019-08-19  1196  
cedcd3e67433b3 Alfred Chen 2019-08-19  1197  	/*
cedcd3e67433b3 Alfred Chen 2019-08-19  1198  	 * Don't schedule slices shorter than 10000ns, that just
cedcd3e67433b3 Alfred Chen 2019-08-19  1199  	 * doesn't make sense and can cause timer DoS.
cedcd3e67433b3 Alfred Chen 2019-08-19  1200  	 */
cedcd3e67433b3 Alfred Chen 2019-08-19  1201  	delta = max_t(s64, delay, 10000LL);
cedcd3e67433b3 Alfred Chen 2019-08-19  1202  
fa5f7bf056d306 Alfred Chen 2021-04-01  1203  	rq->hrtick_time = ktime_add_ns(timer->base->get_time(), delta);
cedcd3e67433b3 Alfred Chen 2019-08-19  1204  
cedcd3e67433b3 Alfred Chen 2019-08-19  1205  	if (rq == this_rq())
cedcd3e67433b3 Alfred Chen 2019-08-19  1206  		__hrtick_restart(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  1207  	else
cedcd3e67433b3 Alfred Chen 2019-08-19  1208  		smp_call_function_single_async(cpu_of(rq), &rq->hrtick_csd);
cedcd3e67433b3 Alfred Chen 2019-08-19  1209  }
cedcd3e67433b3 Alfred Chen 2019-08-19  1210  

:::::: The code at line 1004 was first introduced by commit
:::::: 20fdd10d6b2a3de7a6cf8be5c0e565525e0cccff sched/alt: Fix/Enabled nohz_csd_func(), but not used.

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
