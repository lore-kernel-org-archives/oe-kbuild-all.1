Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBF818D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 01:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727141456; cv=none; b=TLSDtwGhpYpVrq9YeTZ12rCOlTH48zSV3oRwYIIR70SGR6yfHmQGPcy6lu4bQted1CVbpyrTeFF/o8Dpe43Dfy0Sg9wo3MEfYokVPjqKs6mEiqPmBbBwgz0/jEEMeIFcZ3t0fwU40DvaEMe7yTdopgyIIJjqnNes4DIRE07Z+1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727141456; c=relaxed/simple;
	bh=gVvcVJ4spvDkD5tskN8ddCLkenu4MNmW+TQNC+4+k14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VIRBG/7jvpXvs8L5JYFDjGbNacLXC27KpsQR3K8Fno53LFK2Ri8Sqcd0krqIB18q3NXQl1NQ8xLLglnV2Tjh0K73DzH5H2mONDxW9U2S07F7IiiaVcybUBiB5V74rWZRKtGzD1V5vMZGLD0VHH1zOW2naIzxabkooFrkoo46HNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktUE7W+C; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktUE7W+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727141454; x=1758677454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gVvcVJ4spvDkD5tskN8ddCLkenu4MNmW+TQNC+4+k14=;
  b=ktUE7W+C1T6hJ1bWpa4IpN0v8q9WLZn2y9rBmO2nAuWDdGdUk/7/U9xh
   E7XgvjCKZ0dl6EGdlRnGL8amuWTn5ufSQJqtZJQQmQJy02gfKlOkJ7n2H
   hqiILeMwPyhjIZYJHcF3hAIjXouCl+k9FX8C3zHuCkchRuFTNQMwY0Aj2
   0zlGomd4jAgWFMCpemN40fp3Pa9AsxyDxrk+ucie7yZ0BCOIlRCKv2hpV
   7Rn0pl/5p2RkS6k3pS344TXLXTVNMTqoJjsUwoQxnbHoeT9v6Cx5+kOh2
   3+GcAn2z52hicG009Y6b0T8ZJWvRGT8AWA5y8Gs2YRt1puluWn0KxNWoW
   g==;
X-CSE-ConnectionGUID: jumxawb5QcWxGAFyMXC21A==
X-CSE-MsgGUID: xinZO11PRrGokyeBBX7sXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29009891"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="29009891"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 18:30:53 -0700
X-CSE-ConnectionGUID: 40rG5GyhSmGhb8MtAgAhDw==
X-CSE-MsgGUID: jnmuoyAdRn2NxhwUms/nBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="71519283"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2024 18:30:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssuOA-000HmH-0s;
	Tue, 24 Sep 2024 01:30:50 +0000
Date: Tue, 24 Sep 2024 09:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/main 296/2981] kernel/sched/alt_core.c:7209:57: error:
 implicit declaration of function 'cpu_coregroup_mask'
Message-ID: <202409240913.jJtCtwNn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.10/main
head:   14cddf41a02f74b2d2a6727fe33914a57b4432f6
commit: 8709d450c41654b91b78d6bca880f98164d4b219 [296/2981] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240924/202409240913.jJtCtwNn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240913.jJtCtwNn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240913.jJtCtwNn-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/sched.h:2209:15: note: previous declaration of 'sched_cpu_util' with type 'long unsigned int(int)'
    2209 | unsigned long sched_cpu_util(int cpu);
         |               ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:966:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
     966 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
   In file included from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5:
   kernel/sched/alt_core.c: In function 'resched_curr':
   include/linux/smp.h:140:9: error: implicit declaration of function 'trace_ipi_send_cpu' [-Wimplicit-function-declaration]
     140 |         trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
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
   kernel/sched/alt_core.c: In function 'set_task_cpu':
   kernel/sched/alt_core.c:1380:9: error: implicit declaration of function 'rseq_migrate'; did you mean 'cant_migrate'? [-Wimplicit-function-declaration]
    1380 |         rseq_migrate(p);
         |         ^~~~~~~~~~~~
         |         cant_migrate
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:2339:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2339 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2372:6: warning: no previous prototype for 'send_call_function_single_ipi' [-Wmissing-prototypes]
    2372 | void send_call_function_single_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'prepare_task_switch':
   kernel/sched/alt_core.c:3449:9: error: implicit declaration of function 'rseq_preempt' [-Wimplicit-function-declaration]
    3449 |         rseq_preempt(prev);
         |         ^~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:3887:6: warning: no previous prototype for 'scheduler_tick' [-Wmissing-prototypes]
    3887 | void scheduler_tick(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'scheduler_tick':
   kernel/sched/alt_core.c:3894:9: error: implicit declaration of function 'sched_clock_tick'; did you mean 'scheduler_tick'? [-Wimplicit-function-declaration]
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
   kernel/sched/alt_core.c:4674:13: error: implicit declaration of function 'tsk_is_pi_blocked'; did you mean 'osq_is_locked'? [-Wimplicit-function-declaration]
    4674 |         if (tsk_is_pi_blocked(tsk))
         |             ^~~~~~~~~~~~~~~~~
         |             osq_is_locked
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:4734:35: warning: no previous prototype for 'schedule_user' [-Wmissing-prototypes]
    4734 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function '__sched_setscheduler':
   kernel/sched/alt_core.c:5357:17: error: implicit declaration of function 'cpuset_read_lock'; did you mean 'cpus_read_lock'? [-Wimplicit-function-declaration]
    5357 |                 cpuset_read_lock();
         |                 ^~~~~~~~~~~~~~~~
         |                 cpus_read_lock
   kernel/sched/alt_core.c:5405:25: error: implicit declaration of function 'cpuset_read_unlock'; did you mean 'cpus_read_unlock'? [-Wimplicit-function-declaration]
    5405 |                         cpuset_read_unlock();
         |                         ^~~~~~~~~~~~~~~~~~
         |                         cpus_read_unlock
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:6743:5: error: conflicting types for 'task_can_attach'; have 'int(struct task_struct *, const struct cpumask *)'
    6743 | int task_can_attach(struct task_struct *p,
         |     ^~~~~~~~~~~~~~~
   include/linux/sched.h:1786:12: note: previous declaration of 'task_can_attach' with type 'int(struct task_struct *)'
    1786 | extern int task_can_attach(struct task_struct *p);
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
   kernel/sched/alt_core.c:7205:17: error: implicit declaration of function 'cpumask_complement'; did you mean 'bitmap_complement'? [-Wimplicit-function-declaration]
    7205 |                 cpumask_complement(topo, cpumask_of(cpu));
         |                 ^~~~~~~~~~~~~~~~~~
         |                 bitmap_complement
>> kernel/sched/alt_core.c:7209:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Wimplicit-function-declaration]
    7209 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7209:57: error: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    7209 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from include/linux/smp.h:13:
   include/linux/cpumask.h:161:64: note: expected 'const struct cpumask *' but argument is of type 'int'
     161 | static inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:7211:45: error: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    7211 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7186:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7186 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:634:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     634 |                                const struct cpumask *src2p)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> kernel/sched/alt_core.c:7211:45: error: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    7211 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:7187:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    7187 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:834:55: note: expected 'const struct cpumask *' but argument is of type 'int'
     834 |                                 const struct cpumask *srcp)
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


vim +/cpu_coregroup_mask +7209 kernel/sched/alt_core.c

d821e3e8509258 Alfred Chen 2019-08-19  7184  
d821e3e8509258 Alfred Chen 2019-08-19  7185  #define TOPOLOGY_CPUMASK(name, mask, last)\
4076e7f2335228 Alfred Chen 2021-07-10  7186  	if (cpumask_and(topo, topo, mask)) {					\
b99c6a31af83d8 Alfred Chen 2020-12-25  7187  		cpumask_copy(topo, mask);					\
4076e7f2335228 Alfred Chen 2021-07-10  7188  		printk(KERN_INFO "sched: cpu#%02d topo: 0x%08lx - "#name,	\
4076e7f2335228 Alfred Chen 2021-07-10  7189  		       cpu, (topo++)->bits[0]);					\
b99c6a31af83d8 Alfred Chen 2020-12-25  7190  	}									\
d821e3e8509258 Alfred Chen 2019-08-19  7191  	if (!last)								\
4076e7f2335228 Alfred Chen 2021-07-10  7192  		cpumask_complement(topo, mask)
d821e3e8509258 Alfred Chen 2019-08-19  7193  
d821e3e8509258 Alfred Chen 2019-08-19  7194  static void sched_init_topology_cpumask(void)
d821e3e8509258 Alfred Chen 2019-08-19  7195  {
d821e3e8509258 Alfred Chen 2019-08-19  7196  	int cpu;
4076e7f2335228 Alfred Chen 2021-07-10  7197  	cpumask_t *topo;
d821e3e8509258 Alfred Chen 2019-08-19  7198  
d821e3e8509258 Alfred Chen 2019-08-19  7199  	for_each_online_cpu(cpu) {
d821e3e8509258 Alfred Chen 2019-08-19  7200  		/* take chance to reset time slice for idle tasks */
d821e3e8509258 Alfred Chen 2019-08-19  7201  		cpu_rq(cpu)->idle->time_slice = sched_timeslice_ns;
d821e3e8509258 Alfred Chen 2019-08-19  7202  
b99c6a31af83d8 Alfred Chen 2020-12-25  7203  		topo = per_cpu(sched_cpu_topo_masks, cpu) + 1;
82f4452315a839 Alfred Chen 2020-11-09  7204  
4076e7f2335228 Alfred Chen 2021-07-10  7205  		cpumask_complement(topo, cpumask_of(cpu));
d821e3e8509258 Alfred Chen 2019-08-19  7206  #ifdef CONFIG_SCHED_SMT
d821e3e8509258 Alfred Chen 2019-08-19  7207  		TOPOLOGY_CPUMASK(smt, topology_sibling_cpumask(cpu), false);
d821e3e8509258 Alfred Chen 2019-08-19  7208  #endif
d821e3e8509258 Alfred Chen 2019-08-19 @7209  		per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
b99c6a31af83d8 Alfred Chen 2020-12-25  7210  		per_cpu(sched_cpu_llc_mask, cpu) = topo;
d821e3e8509258 Alfred Chen 2019-08-19 @7211  		TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
d821e3e8509258 Alfred Chen 2019-08-19  7212  
d821e3e8509258 Alfred Chen 2019-08-19  7213  		TOPOLOGY_CPUMASK(core, topology_core_cpumask(cpu), false);
d821e3e8509258 Alfred Chen 2019-08-19  7214  
d821e3e8509258 Alfred Chen 2019-08-19  7215  		TOPOLOGY_CPUMASK(others, cpu_online_mask, true);
d821e3e8509258 Alfred Chen 2019-08-19  7216  
4076e7f2335228 Alfred Chen 2021-07-10  7217  		per_cpu(sched_cpu_topo_end_mask, cpu) = topo;
617d32624ea559 Alfred Chen 2020-11-03  7218  		printk(KERN_INFO "sched: cpu#%02d llc_id = %d, llc_mask idx = %d\n",
617d32624ea559 Alfred Chen 2020-11-03  7219  		       cpu, per_cpu(sd_llc_id, cpu),
617d32624ea559 Alfred Chen 2020-11-03  7220  		       (int) (per_cpu(sched_cpu_llc_mask, cpu) -
b99c6a31af83d8 Alfred Chen 2020-12-25  7221  			      per_cpu(sched_cpu_topo_masks, cpu)));
d821e3e8509258 Alfred Chen 2019-08-19  7222  	}
d821e3e8509258 Alfred Chen 2019-08-19  7223  }
d821e3e8509258 Alfred Chen 2019-08-19  7224  #endif
d821e3e8509258 Alfred Chen 2019-08-19  7225  

:::::: The code at line 7209 was first introduced by commit
:::::: d821e3e85092581709b1b5f9ab8cacf0ce70c1a8 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
