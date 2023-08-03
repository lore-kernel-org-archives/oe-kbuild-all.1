Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C077F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 01:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691025037; x=1722561037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DUWjptuB6vp2v/BiGe1EjcR2haPc17tI4tH36sPQFEg=;
  b=CecTEmpAI6RNlhhr0kS+oyDTgY0Y5ym7tCUGlKdbgbQNfLaRhV84WD6L
   xlibfqJJKyiGb3mHQjGiPR0LqhB16VeQum6TKhaOuhu9gQiFQq9D+rhXj
   OGIg9DEAHmP5vdx45gfPFoRqx2u1GURg7jZ2gx25+D6CShGntZfZAq8Yc
   LVMBSL5ppkSh95ZPwo0Y8iYa7kyWHcpejcWFJh6slcoljLgaJAhxSvF+u
   S1IY4snOxeRBSQfLR4KZ5j2PfCaJlpjkwv7+gv+XiLzX11Z8MybB8/6OV
   Ph3FQD8J1LIpsS+RZcrRtG9KWP+N3+fOUJN5itwEDdkfw4GDhYKyhjIOs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="436055605"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="436055605"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 18:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="764421085"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="764421085"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Aug 2023 18:10:35 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRMrK-0001d1-1T;
	Thu, 03 Aug 2023 01:10:34 +0000
Date: Thu, 3 Aug 2023 09:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 295/387] kernel/sched/alt_core.c:1192:6: warning: no
 previous prototype for 'hrtick_start'
Message-ID: <202308030911.ZmDRoRIS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   81c27c2ecb3019a7e76026b3fced2f750c2faf0a
commit: bcf5606dbe8958da33841ebb8b63ba49b86c097f [295/387] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230803/202308030911.ZmDRoRIS-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030911.ZmDRoRIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308030911.ZmDRoRIS-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> kernel/sched/alt_core.c:6770:6: warning: no previous prototype for 'idle_task_exit' [-Wmissing-prototypes]
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
>> kernel/sched/alt_core.c:7103:5: warning: no previous prototype for 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7103 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7145:5: warning: no previous prototype for 'sched_cpu_dying' [-Wmissing-prototypes]
    7145 | int sched_cpu_dying(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:7205:17: error: implicit declaration of function 'cpumask_complement'; did you mean 'bitmap_complement'? [-Werror=implicit-function-declaration]
    7205 |                 cpumask_complement(topo, cpumask_of(cpu));
         |                 ^~~~~~~~~~~~~~~~~~
         |                 bitmap_complement
   kernel/sched/alt_core.c:7209:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Werror=implicit-function-declaration]
    7209 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7209:57: warning: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    7209 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from arch/mips/include/asm/processor.h:15,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27:
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


vim +/hrtick_start +1192 kernel/sched/alt_core.c

cedcd3e67433b34 Alfred Chen 2019-08-19  1186  
cedcd3e67433b34 Alfred Chen 2019-08-19  1187  /*
cedcd3e67433b34 Alfred Chen 2019-08-19  1188   * Called to set the hrtick timer state.
cedcd3e67433b34 Alfred Chen 2019-08-19  1189   *
cedcd3e67433b34 Alfred Chen 2019-08-19  1190   * called with rq->lock held and irqs disabled
cedcd3e67433b34 Alfred Chen 2019-08-19  1191   */
cedcd3e67433b34 Alfred Chen 2019-08-19 @1192  void hrtick_start(struct rq *rq, u64 delay)
cedcd3e67433b34 Alfred Chen 2019-08-19  1193  {
cedcd3e67433b34 Alfred Chen 2019-08-19  1194  	struct hrtimer *timer = &rq->hrtick_timer;
cedcd3e67433b34 Alfred Chen 2019-08-19  1195  	s64 delta;
cedcd3e67433b34 Alfred Chen 2019-08-19  1196  
cedcd3e67433b34 Alfred Chen 2019-08-19  1197  	/*
cedcd3e67433b34 Alfred Chen 2019-08-19  1198  	 * Don't schedule slices shorter than 10000ns, that just
cedcd3e67433b34 Alfred Chen 2019-08-19  1199  	 * doesn't make sense and can cause timer DoS.
cedcd3e67433b34 Alfred Chen 2019-08-19  1200  	 */
cedcd3e67433b34 Alfred Chen 2019-08-19  1201  	delta = max_t(s64, delay, 10000LL);
cedcd3e67433b34 Alfred Chen 2019-08-19  1202  
fa5f7bf056d3065 Alfred Chen 2021-04-01  1203  	rq->hrtick_time = ktime_add_ns(timer->base->get_time(), delta);
cedcd3e67433b34 Alfred Chen 2019-08-19  1204  
cedcd3e67433b34 Alfred Chen 2019-08-19  1205  	if (rq == this_rq())
cedcd3e67433b34 Alfred Chen 2019-08-19  1206  		__hrtick_restart(rq);
cedcd3e67433b34 Alfred Chen 2019-08-19  1207  	else
cedcd3e67433b34 Alfred Chen 2019-08-19  1208  		smp_call_function_single_async(cpu_of(rq), &rq->hrtick_csd);
cedcd3e67433b34 Alfred Chen 2019-08-19  1209  }
cedcd3e67433b34 Alfred Chen 2019-08-19  1210  

:::::: The code at line 1192 was first introduced by commit
:::::: cedcd3e67433b3472068caf48ea86414191e0a6b Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
