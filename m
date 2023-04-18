Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77ECAFC3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 18:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681840894; x=1713376894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LjJhYGk1N1koHQ2bPXAStFPEFpgR3xj6VwVcCpdXvi8=;
  b=mK3jRYNNwDdDJMv1BJSvHKMk0mXX6j3zvmhjnbXjLMFB3UOVbrl+mR8X
   1HhatPjwBJVgJ2JT4G84zLNmxjjrVimUn3zr+1JuD8x2YWWN60v6wnHIR
   CHG9rtrE7k3qsjGUjuSk5+dPjEWdcoAhz/B/V4dJWVHU24zmctG6xAXDI
   W8+4/IXA18cGkKgx6QocFSJ4Y5HkrwdRVw1R8exjvhFCesKRAnHxa9Kqq
   TPpGsv3COAEiAnibd+aA0Xrnq+EW2P7E6jcez1bGwODtkCgiYssiKeksH
   h0r40gI3zGpZRQUEo/RzOiK8BhmOTJpyxL6yokf5BUpY0U5mnhTtnkez/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334054011"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="334054011"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 11:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="937339920"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="937339920"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Apr 2023 11:01:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1popdU-000dqV-03;
	Tue, 18 Apr 2023 18:01:00 +0000
Date: Wed, 19 Apr 2023 02:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 295/390] kernel/sched/alt_core.c:1004:6: warning: no
 previous prototype for 'select_nohz_load_balancer'
Message-ID: <202304190129.ijYg2V9L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   e1fa9ea876458eade5717e6e00b375bff8d86c98
commit: 758c39a103c58a35cb772408e0ceb8ff65399e12 [295/390] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230419/202304190129.ijYg2V9L-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/758c39a103c58a35cb772408e0ceb8ff65399e12
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 758c39a103c58a35cb772408e0ceb8ff65399e12
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190129.ijYg2V9L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:632:15: error: conflicting types for 'sched_cpu_util'; have 'long unsigned int(int,  long unsigned int)'
     632 | unsigned long sched_cpu_util(int cpu, unsigned long max)
         |               ^~~~~~~~~~~~~~
   In file included from include/linux/sched/signal.h:7,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/alt_core.c:14:
   include/linux/sched.h:2319:15: note: previous declaration of 'sched_cpu_util' with type 'long unsigned int(int)'
    2319 | unsigned long sched_cpu_util(int cpu);
         |               ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:966:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
     966 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
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
>> kernel/sched/alt_core.c:2339:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2339 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:2372:6: warning: no previous prototype for 'send_call_function_single_ipi' [-Wmissing-prototypes]
    2372 | void send_call_function_single_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> kernel/sched/alt_core.c:6770:6: warning: no previous prototype for 'idle_task_exit' [-Wmissing-prototypes]
    6770 | void idle_task_exit(void)
         |      ^~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:6980:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
    6980 | int sched_cpu_activate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7019:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7019 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7083:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
    7083 | int sched_cpu_starting(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7103:5: warning: no previous prototype for 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7103 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7145:5: warning: no previous prototype for 'sched_cpu_dying' [-Wmissing-prototypes]
    7145 | int sched_cpu_dying(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:7209:57: error: implicit declaration of function 'cpu_coregroup_mask'; did you mean 'cpu_core_mask'? [-Werror=implicit-function-declaration]
    7209 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
         |                                                         cpu_core_mask
>> kernel/sched/alt_core.c:7209:57: warning: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    7209 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5:
   include/linux/cpumask.h:127:64: note: expected 'const struct cpumask *' but argument is of type 'int'
     127 | static inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~^~~~
>> kernel/sched/alt_core.c:7211:45: warning: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    7211 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7186:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7186 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:503:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     503 |                                const struct cpumask *src2p)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> kernel/sched/alt_core.c:7211:45: warning: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    7211 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7187:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7187 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:686:55: note: expected 'const struct cpumask *' but argument is of type 'int'
     686 |                                 const struct cpumask *srcp)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
>> kernel/sched/alt_core.c:7211:45: warning: passing argument 2 of 'cpumask_complement' makes pointer from integer without a cast [-Wint-conversion]
    7211 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7192:42: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7192 |                 cpumask_complement(topo, mask)
         |                                          ^~~~
   include/linux/cpumask.h:558:61: note: expected 'const struct cpumask *' but argument is of type 'int'
     558 |                                       const struct cpumask *srcp)
         |                                       ~~~~~~~~~~~~~~~~~~~~~~^~~~
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


vim +/select_nohz_load_balancer +1004 kernel/sched/alt_core.c

8b025fc742d760 Alfred Chen 2019-08-19  1003  
56e0358e1d4dc0 Alfred Chen 2020-08-07 @1004  void select_nohz_load_balancer(int stop_tick) {}
8b025fc742d760 Alfred Chen 2019-08-19  1005  
8b025fc742d760 Alfred Chen 2019-08-19 @1006  void set_cpu_sd_state_idle(void) {}
8b025fc742d760 Alfred Chen 2019-08-19  1007  
8b025fc742d760 Alfred Chen 2019-08-19  1008  /*
8b025fc742d760 Alfred Chen 2019-08-19  1009   * In the semi idle case, use the nearest busy CPU for migrating timers
8b025fc742d760 Alfred Chen 2019-08-19  1010   * from an idle CPU.  This is good for power-savings.
8b025fc742d760 Alfred Chen 2019-08-19  1011   *
8b025fc742d760 Alfred Chen 2019-08-19  1012   * We don't do similar optimization for completely idle system, as
8b025fc742d760 Alfred Chen 2019-08-19  1013   * selecting an idle CPU will add more delays to the timers than intended
8b025fc742d760 Alfred Chen 2019-08-19  1014   * (as that CPU's timer base may not be uptodate wrt jiffies etc).
8b025fc742d760 Alfred Chen 2019-08-19  1015   */
8b025fc742d760 Alfred Chen 2019-08-19  1016  int get_nohz_timer_target(void)
8b025fc742d760 Alfred Chen 2019-08-19  1017  {
8b025fc742d760 Alfred Chen 2019-08-19  1018  	int i, cpu = smp_processor_id(), default_cpu = -1;
8b025fc742d760 Alfred Chen 2019-08-19  1019  	struct cpumask *mask;
b9b59a9f7bc732 Alfred Chen 2021-10-15  1020  	const struct cpumask *hk_mask;
8b025fc742d760 Alfred Chen 2019-08-19  1021  
21e8aeb7304d4b Alfred Chen 2022-05-19  1022  	if (housekeeping_cpu(cpu, HK_TYPE_TIMER)) {
8b025fc742d760 Alfred Chen 2019-08-19  1023  		if (!idle_cpu(cpu))
8b025fc742d760 Alfred Chen 2019-08-19  1024  			return cpu;
8b025fc742d760 Alfred Chen 2019-08-19  1025  		default_cpu = cpu;
8b025fc742d760 Alfred Chen 2019-08-19  1026  	}
8b025fc742d760 Alfred Chen 2019-08-19  1027  
21e8aeb7304d4b Alfred Chen 2022-05-19  1028  	hk_mask = housekeeping_cpumask(HK_TYPE_TIMER);
b9b59a9f7bc732 Alfred Chen 2021-10-15  1029  
45dc1e23cc5f2a Alfred Chen 2021-07-10  1030  	for (mask = per_cpu(sched_cpu_topo_masks, cpu) + 1;
45dc1e23cc5f2a Alfred Chen 2021-07-10  1031  	     mask < per_cpu(sched_cpu_topo_end_mask, cpu); mask++)
b9b59a9f7bc732 Alfred Chen 2021-10-15  1032  		for_each_cpu_and(i, mask, hk_mask)
8b025fc742d760 Alfred Chen 2019-08-19  1033  			if (!idle_cpu(i))
8b025fc742d760 Alfred Chen 2019-08-19  1034  				return i;
8b025fc742d760 Alfred Chen 2019-08-19  1035  
8b025fc742d760 Alfred Chen 2019-08-19  1036  	if (default_cpu == -1)
21e8aeb7304d4b Alfred Chen 2022-05-19  1037  		default_cpu = housekeeping_any_cpu(HK_TYPE_TIMER);
8b025fc742d760 Alfred Chen 2019-08-19  1038  	cpu = default_cpu;
8b025fc742d760 Alfred Chen 2019-08-19  1039  
8b025fc742d760 Alfred Chen 2019-08-19  1040  	return cpu;
8b025fc742d760 Alfred Chen 2019-08-19  1041  }
8b025fc742d760 Alfred Chen 2019-08-19  1042  
8b025fc742d760 Alfred Chen 2019-08-19  1043  /*
8b025fc742d760 Alfred Chen 2019-08-19  1044   * When add_timer_on() enqueues a timer into the timer wheel of an
8b025fc742d760 Alfred Chen 2019-08-19  1045   * idle CPU then this timer might expire before the next timer event
8b025fc742d760 Alfred Chen 2019-08-19  1046   * which is scheduled to wake up that CPU. In case of a completely
8b025fc742d760 Alfred Chen 2019-08-19  1047   * idle system the next event might even be infinite time into the
8b025fc742d760 Alfred Chen 2019-08-19  1048   * future. wake_up_idle_cpu() ensures that the CPU is woken up and
8b025fc742d760 Alfred Chen 2019-08-19  1049   * leaves the inner idle loop so the newly added timer is taken into
8b025fc742d760 Alfred Chen 2019-08-19  1050   * account when the CPU goes back to idle and evaluates the timer
8b025fc742d760 Alfred Chen 2019-08-19  1051   * wheel for the next timer event.
8b025fc742d760 Alfred Chen 2019-08-19  1052   */
8b025fc742d760 Alfred Chen 2019-08-19  1053  static inline void wake_up_idle_cpu(int cpu)
8b025fc742d760 Alfred Chen 2019-08-19  1054  {
4f8c309f92285a Alfred Chen 2020-09-19  1055  	struct rq *rq = cpu_rq(cpu);
4f8c309f92285a Alfred Chen 2020-09-19  1056  
8b025fc742d760 Alfred Chen 2019-08-19  1057  	if (cpu == smp_processor_id())
8b025fc742d760 Alfred Chen 2019-08-19  1058  		return;
8b025fc742d760 Alfred Chen 2019-08-19  1059  
4f8c309f92285a Alfred Chen 2020-09-19  1060  	if (set_nr_and_not_polling(rq->idle))
8b025fc742d760 Alfred Chen 2019-08-19  1061  		smp_send_reschedule(cpu);
4f8c309f92285a Alfred Chen 2020-09-19  1062  	else
4f8c309f92285a Alfred Chen 2020-09-19  1063  		trace_sched_wake_idle_without_ipi(cpu);
8b025fc742d760 Alfred Chen 2019-08-19  1064  }
8b025fc742d760 Alfred Chen 2019-08-19  1065  
8b025fc742d760 Alfred Chen 2019-08-19  1066  static inline bool wake_up_full_nohz_cpu(int cpu)
8b025fc742d760 Alfred Chen 2019-08-19  1067  {
8b025fc742d760 Alfred Chen 2019-08-19  1068  	/*
8b025fc742d760 Alfred Chen 2019-08-19  1069  	 * We just need the target to call irq_exit() and re-evaluate
8b025fc742d760 Alfred Chen 2019-08-19  1070  	 * the next tick. The nohz full kick at least implies that.
8b025fc742d760 Alfred Chen 2019-08-19  1071  	 * If needed we can still optimize that later with an
8b025fc742d760 Alfred Chen 2019-08-19  1072  	 * empty IRQ.
8b025fc742d760 Alfred Chen 2019-08-19  1073  	 */
4f8c309f92285a Alfred Chen 2020-09-19  1074  	if (cpu_is_offline(cpu))
4f8c309f92285a Alfred Chen 2020-09-19  1075  		return true;  /* Don't try to wake offline CPUs. */
8b025fc742d760 Alfred Chen 2019-08-19  1076  	if (tick_nohz_full_cpu(cpu)) {
8b025fc742d760 Alfred Chen 2019-08-19  1077  		if (cpu != smp_processor_id() ||
8b025fc742d760 Alfred Chen 2019-08-19  1078  		    tick_nohz_tick_stopped())
8b025fc742d760 Alfred Chen 2019-08-19  1079  			tick_nohz_full_kick_cpu(cpu);
8b025fc742d760 Alfred Chen 2019-08-19  1080  		return true;
8b025fc742d760 Alfred Chen 2019-08-19  1081  	}
8b025fc742d760 Alfred Chen 2019-08-19  1082  
8b025fc742d760 Alfred Chen 2019-08-19  1083  	return false;
8b025fc742d760 Alfred Chen 2019-08-19  1084  }
8b025fc742d760 Alfred Chen 2019-08-19  1085  
8b025fc742d760 Alfred Chen 2019-08-19  1086  void wake_up_nohz_cpu(int cpu)
8b025fc742d760 Alfred Chen 2019-08-19  1087  {
4f8c309f92285a Alfred Chen 2020-09-19  1088  	if (!wake_up_full_nohz_cpu(cpu))
8b025fc742d760 Alfred Chen 2019-08-19  1089  		wake_up_idle_cpu(cpu);
8b025fc742d760 Alfred Chen 2019-08-19  1090  }
8b025fc742d760 Alfred Chen 2019-08-19  1091  
f4c6a635a45d14 Alfred Chen 2020-07-31  1092  static void nohz_csd_func(void *info)
f4c6a635a45d14 Alfred Chen 2020-07-31  1093  {
f4c6a635a45d14 Alfred Chen 2020-07-31  1094  	struct rq *rq = info;
f4c6a635a45d14 Alfred Chen 2020-07-31  1095  	int cpu = cpu_of(rq);
f4c6a635a45d14 Alfred Chen 2020-07-31  1096  	unsigned int flags;
f4c6a635a45d14 Alfred Chen 2020-07-31  1097  
f4c6a635a45d14 Alfred Chen 2020-07-31  1098  	/*
f4c6a635a45d14 Alfred Chen 2020-07-31  1099  	 * Release the rq::nohz_csd.
56e0358e1d4dc0 Alfred Chen 2020-08-07  1100  	 */
f4c6a635a45d14 Alfred Chen 2020-07-31  1101  	flags = atomic_fetch_andnot(NOHZ_KICK_MASK, nohz_flags(cpu));
f4c6a635a45d14 Alfred Chen 2020-07-31  1102  	WARN_ON(!(flags & NOHZ_KICK_MASK));
f4c6a635a45d14 Alfred Chen 2020-07-31  1103  
f4c6a635a45d14 Alfred Chen 2020-07-31  1104  	rq->idle_balance = idle_cpu(cpu);
f4c6a635a45d14 Alfred Chen 2020-07-31  1105  	if (rq->idle_balance && !need_resched()) {
f4c6a635a45d14 Alfred Chen 2020-07-31  1106  		rq->nohz_idle_balance = flags;
f4c6a635a45d14 Alfred Chen 2020-07-31  1107  		raise_softirq_irqoff(SCHED_SOFTIRQ);
f4c6a635a45d14 Alfred Chen 2020-07-31  1108  	}
f4c6a635a45d14 Alfred Chen 2020-07-31  1109  }
f4c6a635a45d14 Alfred Chen 2020-07-31  1110  
8b025fc742d760 Alfred Chen 2019-08-19  1111  #endif /* CONFIG_NO_HZ_COMMON */
8b025fc742d760 Alfred Chen 2019-08-19  1112  #endif /* CONFIG_SMP */
8b025fc742d760 Alfred Chen 2019-08-19  1113  
8b025fc742d760 Alfred Chen 2019-08-19  1114  static inline void check_preempt_curr(struct rq *rq)
8b025fc742d760 Alfred Chen 2019-08-19  1115  {
8b025fc742d760 Alfred Chen 2019-08-19  1116  	if (sched_rq_first_task(rq) != rq->curr)
8b025fc742d760 Alfred Chen 2019-08-19  1117  		resched_curr(rq);
8b025fc742d760 Alfred Chen 2019-08-19  1118  }
8b025fc742d760 Alfred Chen 2019-08-19  1119  
8b025fc742d760 Alfred Chen 2019-08-19  1120  #ifdef CONFIG_SCHED_HRTICK
8b025fc742d760 Alfred Chen 2019-08-19  1121  /*
8b025fc742d760 Alfred Chen 2019-08-19  1122   * Use HR-timers to deliver accurate preemption points.
8b025fc742d760 Alfred Chen 2019-08-19  1123   */
8b025fc742d760 Alfred Chen 2019-08-19  1124  
8b025fc742d760 Alfred Chen 2019-08-19  1125  static void hrtick_clear(struct rq *rq)
8b025fc742d760 Alfred Chen 2019-08-19  1126  {
8b025fc742d760 Alfred Chen 2019-08-19  1127  	if (hrtimer_active(&rq->hrtick_timer))
8b025fc742d760 Alfred Chen 2019-08-19  1128  		hrtimer_cancel(&rq->hrtick_timer);
8b025fc742d760 Alfred Chen 2019-08-19  1129  }
8b025fc742d760 Alfred Chen 2019-08-19  1130  
8b025fc742d760 Alfred Chen 2019-08-19  1131  /*
8b025fc742d760 Alfred Chen 2019-08-19  1132   * High-resolution timer tick.
8b025fc742d760 Alfred Chen 2019-08-19  1133   * Runs from hardirq context with interrupts disabled.
8b025fc742d760 Alfred Chen 2019-08-19  1134   */
8b025fc742d760 Alfred Chen 2019-08-19  1135  static enum hrtimer_restart hrtick(struct hrtimer *timer)
8b025fc742d760 Alfred Chen 2019-08-19  1136  {
8b025fc742d760 Alfred Chen 2019-08-19  1137  	struct rq *rq = container_of(timer, struct rq, hrtick_timer);
8b025fc742d760 Alfred Chen 2019-08-19  1138  
8b025fc742d760 Alfred Chen 2019-08-19  1139  	WARN_ON_ONCE(cpu_of(rq) != smp_processor_id());
8b025fc742d760 Alfred Chen 2019-08-19  1140  
8b025fc742d760 Alfred Chen 2019-08-19  1141  	raw_spin_lock(&rq->lock);
8b025fc742d760 Alfred Chen 2019-08-19  1142  	resched_curr(rq);
8b025fc742d760 Alfred Chen 2019-08-19  1143  	raw_spin_unlock(&rq->lock);
8b025fc742d760 Alfred Chen 2019-08-19  1144  
8b025fc742d760 Alfred Chen 2019-08-19  1145  	return HRTIMER_NORESTART;
8b025fc742d760 Alfred Chen 2019-08-19  1146  }
8b025fc742d760 Alfred Chen 2019-08-19  1147  
8b025fc742d760 Alfred Chen 2019-08-19  1148  /*
8b025fc742d760 Alfred Chen 2019-08-19  1149   * Use hrtick when:
8b025fc742d760 Alfred Chen 2019-08-19  1150   *  - enabled by features
8b025fc742d760 Alfred Chen 2019-08-19  1151   *  - hrtimer is actually high res
8b025fc742d760 Alfred Chen 2019-08-19  1152   */
8b025fc742d760 Alfred Chen 2019-08-19  1153  static inline int hrtick_enabled(struct rq *rq)
8b025fc742d760 Alfred Chen 2019-08-19  1154  {
8b025fc742d760 Alfred Chen 2019-08-19  1155  	/**
8b025fc742d760 Alfred Chen 2019-08-19  1156  	 * Alt schedule FW doesn't support sched_feat yet
8b025fc742d760 Alfred Chen 2019-08-19  1157  	if (!sched_feat(HRTICK))
8b025fc742d760 Alfred Chen 2019-08-19  1158  		return 0;
8b025fc742d760 Alfred Chen 2019-08-19  1159  	*/
8b025fc742d760 Alfred Chen 2019-08-19  1160  	if (!cpu_active(cpu_of(rq)))
8b025fc742d760 Alfred Chen 2019-08-19  1161  		return 0;
8b025fc742d760 Alfred Chen 2019-08-19  1162  	return hrtimer_is_hres_active(&rq->hrtick_timer);
8b025fc742d760 Alfred Chen 2019-08-19  1163  }
8b025fc742d760 Alfred Chen 2019-08-19  1164  
8b025fc742d760 Alfred Chen 2019-08-19  1165  #ifdef CONFIG_SMP
8b025fc742d760 Alfred Chen 2019-08-19  1166  
8b025fc742d760 Alfred Chen 2019-08-19  1167  static void __hrtick_restart(struct rq *rq)
8b025fc742d760 Alfred Chen 2019-08-19  1168  {
8b025fc742d760 Alfred Chen 2019-08-19  1169  	struct hrtimer *timer = &rq->hrtick_timer;
7a4048b322eac3 Alfred Chen 2021-04-01  1170  	ktime_t time = rq->hrtick_time;
8b025fc742d760 Alfred Chen 2019-08-19  1171  
7a4048b322eac3 Alfred Chen 2021-04-01  1172  	hrtimer_start(timer, time, HRTIMER_MODE_ABS_PINNED_HARD);
8b025fc742d760 Alfred Chen 2019-08-19  1173  }
8b025fc742d760 Alfred Chen 2019-08-19  1174  
8b025fc742d760 Alfred Chen 2019-08-19  1175  /*
8b025fc742d760 Alfred Chen 2019-08-19  1176   * called from hardirq (IPI) context
8b025fc742d760 Alfred Chen 2019-08-19  1177   */
8b025fc742d760 Alfred Chen 2019-08-19  1178  static void __hrtick_start(void *arg)
8b025fc742d760 Alfred Chen 2019-08-19  1179  {
8b025fc742d760 Alfred Chen 2019-08-19  1180  	struct rq *rq = arg;
8b025fc742d760 Alfred Chen 2019-08-19  1181  
8b025fc742d760 Alfred Chen 2019-08-19  1182  	raw_spin_lock(&rq->lock);
8b025fc742d760 Alfred Chen 2019-08-19  1183  	__hrtick_restart(rq);
8b025fc742d760 Alfred Chen 2019-08-19  1184  	raw_spin_unlock(&rq->lock);
8b025fc742d760 Alfred Chen 2019-08-19  1185  }
8b025fc742d760 Alfred Chen 2019-08-19  1186  
8b025fc742d760 Alfred Chen 2019-08-19  1187  /*
8b025fc742d760 Alfred Chen 2019-08-19  1188   * Called to set the hrtick timer state.
8b025fc742d760 Alfred Chen 2019-08-19  1189   *
8b025fc742d760 Alfred Chen 2019-08-19  1190   * called with rq->lock held and irqs disabled
8b025fc742d760 Alfred Chen 2019-08-19  1191   */
8b025fc742d760 Alfred Chen 2019-08-19 @1192  void hrtick_start(struct rq *rq, u64 delay)
8b025fc742d760 Alfred Chen 2019-08-19  1193  {
8b025fc742d760 Alfred Chen 2019-08-19  1194  	struct hrtimer *timer = &rq->hrtick_timer;
8b025fc742d760 Alfred Chen 2019-08-19  1195  	s64 delta;
8b025fc742d760 Alfred Chen 2019-08-19  1196  
8b025fc742d760 Alfred Chen 2019-08-19  1197  	/*
8b025fc742d760 Alfred Chen 2019-08-19  1198  	 * Don't schedule slices shorter than 10000ns, that just
8b025fc742d760 Alfred Chen 2019-08-19  1199  	 * doesn't make sense and can cause timer DoS.
8b025fc742d760 Alfred Chen 2019-08-19  1200  	 */
8b025fc742d760 Alfred Chen 2019-08-19  1201  	delta = max_t(s64, delay, 10000LL);
8b025fc742d760 Alfred Chen 2019-08-19  1202  
7a4048b322eac3 Alfred Chen 2021-04-01  1203  	rq->hrtick_time = ktime_add_ns(timer->base->get_time(), delta);
8b025fc742d760 Alfred Chen 2019-08-19  1204  
8b025fc742d760 Alfred Chen 2019-08-19  1205  	if (rq == this_rq())
8b025fc742d760 Alfred Chen 2019-08-19  1206  		__hrtick_restart(rq);
8b025fc742d760 Alfred Chen 2019-08-19  1207  	else
8b025fc742d760 Alfred Chen 2019-08-19  1208  		smp_call_function_single_async(cpu_of(rq), &rq->hrtick_csd);
8b025fc742d760 Alfred Chen 2019-08-19  1209  }
8b025fc742d760 Alfred Chen 2019-08-19  1210  

:::::: The code at line 1004 was first introduced by commit
:::::: 56e0358e1d4dc0a857a1dabb35776bebf9862a7f sched/alt: Fix/Enabled nohz_csd_func(), but not used.

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
