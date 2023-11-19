Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840BB18656
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emKRglCk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700420885; x=1731956885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mb+nxmUIm42h3vlJ5lNGjuKH1namRIKFePO+x3RuwYg=;
  b=emKRglCkhkHh0P1bE2vMvN6NltrGTBAclKJAEUQtd+mrefEvqTkUQUyM
   RI8tPArqxd6zQ+hay6/6BRuCV9uQi13Q5GctCKuTCBZrJ8bM6W4crl61W
   1x5E9afAUj1qfW80z3VRx5DjW+6qqMBRxODZeEn9Aj1e+xBCxFyUR0CzC
   lfvmi4XA9Mn4X0ntMNdE0Hu1zqdIT5RyMrbW9kmSin39cGTbdUOqIiPbZ
   WqQbAPO+u0QP2zjlD1MKhXjOwzEDqfqV9VBQs+w7cqIUbwYqYNIrPcJuz
   kWtxT5SrEiGPrfz8sdZyoQkkta/ed+YftVNdFxe5z5tfbFff+ZvnGATid
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="455832220"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="455832220"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 11:08:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="889729415"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="889729415"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Nov 2023 11:08:03 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4n9E-0005Rd-2x;
	Sun, 19 Nov 2023 19:08:00 +0000
Date: Mon, 20 Nov 2023 03:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/prjc 339/449] kernel/sched/alt_core.c:966:6: warning: no
 previous prototype for function 'resched_curr'
Message-ID: <202311200304.lWdKywWX-lkp@intel.com>
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
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231120/202311200304.lWdKywWX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200304.lWdKywWX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200304.lWdKywWX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:578:14: error: call to undeclared function 'sched_clock_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     578 |         s64 delta = sched_clock_cpu(cpu_of(rq)) - rq->clock;
         |                     ^
   kernel/sched/alt_core.c:632:15: error: conflicting types for 'sched_cpu_util'
     632 | unsigned long sched_cpu_util(int cpu, unsigned long max)
         |               ^
   include/linux/sched.h:2336:15: note: previous declaration is here
    2336 | unsigned long sched_cpu_util(int cpu);
         |               ^
   kernel/sched/alt_core.c:984:3: error: call to undeclared function 'trace_ipi_send_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     984 |                 smp_send_reschedule(cpu);
         |                 ^
   include/linux/smp.h:134:2: note: expanded from macro 'smp_send_reschedule'
     134 |         trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
         |         ^
>> kernel/sched/alt_core.c:966:6: warning: no previous prototype for function 'resched_curr' [-Wmissing-prototypes]
     966 | void resched_curr(struct rq *rq)
         |      ^
   kernel/sched/alt_core.c:966:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     966 | void resched_curr(struct rq *rq)
         | ^
         | static 
>> kernel/sched/alt_core.c:989:6: warning: no previous prototype for function 'resched_cpu' [-Wmissing-prototypes]
     989 | void resched_cpu(int cpu)
         |      ^
   kernel/sched/alt_core.c:989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     989 | void resched_cpu(int cpu)
         | ^
         | static 
>> kernel/sched/alt_core.c:1004:6: warning: no previous prototype for function 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1004 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^
   kernel/sched/alt_core.c:1004:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1004 | void select_nohz_load_balancer(int stop_tick) {}
         | ^
         | static 
>> kernel/sched/alt_core.c:1006:6: warning: no previous prototype for function 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1006 | void set_cpu_sd_state_idle(void) {}
         |      ^
   kernel/sched/alt_core.c:1006:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1006 | void set_cpu_sd_state_idle(void) {}
         | ^
         | static 
   kernel/sched/alt_core.c:1061:3: error: call to undeclared function 'trace_ipi_send_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1061 |                 smp_send_reschedule(cpu);
         |                 ^
   include/linux/smp.h:134:2: note: expanded from macro 'smp_send_reschedule'
     134 |         trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
         |         ^
>> kernel/sched/alt_core.c:1192:6: warning: no previous prototype for function 'hrtick_start' [-Wmissing-prototypes]
    1192 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^
   kernel/sched/alt_core.c:1192:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1192 | void hrtick_start(struct rq *rq, u64 delay)
         | ^
         | static 
   kernel/sched/alt_core.c:1797:3: error: call to undeclared function 'trace_ipi_send_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1797 |                 smp_send_reschedule(cpu);
         |                 ^
   include/linux/smp.h:134:2: note: expanded from macro 'smp_send_reschedule'
     134 |         trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
         |         ^
>> kernel/sched/alt_core.c:2339:6: warning: no previous prototype for function 'sched_ttwu_pending' [-Wmissing-prototypes]
    2339 | void sched_ttwu_pending(void *arg)
         |      ^
   kernel/sched/alt_core.c:2339:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2339 | void sched_ttwu_pending(void *arg)
         | ^
         | static 
   kernel/sched/alt_core.c:2372:6: warning: no previous prototype for function 'send_call_function_single_ipi' [-Wmissing-prototypes]
    2372 | void send_call_function_single_ipi(int cpu)
         |      ^
   kernel/sched/alt_core.c:2372:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2372 | void send_call_function_single_ipi(int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:2432:3: error: call to undeclared function 'sched_clock_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2432 |                 sched_clock_cpu(cpu); /* Sync clocks across CPUs */
         |                 ^
   kernel/sched/alt_core.c:3284:10: warning: cast from 'void (*)(struct callback_head *)' to 'void (*)(struct rq *)' converts to incompatible function type [-Wcast-function-type-strict]
    3284 |                 func = (void (*)(struct rq *))head->func;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:3308:10: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    3308 |         .func = (void (*)(struct callback_head *))balance_push,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> kernel/sched/alt_core.c:6770:6: warning: no previous prototype for function 'idle_task_exit' [-Wmissing-prototypes]
    6770 | void idle_task_exit(void)
         |      ^
   kernel/sched/alt_core.c:6770:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6770 | void idle_task_exit(void)
         | ^
         | static 
>> kernel/sched/alt_core.c:6980:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
    6980 | int sched_cpu_activate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:6980:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6980 | int sched_cpu_activate(unsigned int cpu)
         | ^
         | static 
>> kernel/sched/alt_core.c:7019:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7019 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7019:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7019 | int sched_cpu_deactivate(unsigned int cpu)
         | ^
         | static 
>> kernel/sched/alt_core.c:7083:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
    7083 | int sched_cpu_starting(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7083:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7083 | int sched_cpu_starting(unsigned int cpu)
         | ^
         | static 
>> kernel/sched/alt_core.c:7103:5: warning: no previous prototype for function 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7103 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^
   kernel/sched/alt_core.c:7103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7103 | int sched_cpu_wait_empty(unsigned int cpu)
         | ^
         | static 
>> kernel/sched/alt_core.c:7145:5: warning: no previous prototype for function 'sched_cpu_dying' [-Wmissing-prototypes]
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
   kernel/sched/alt_core.c:7209:43: error: call to undeclared function 'cpu_coregroup_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7209 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^
   kernel/sched/alt_core.c:7209:43: note: did you mean 'cpu_core_mask'?
   arch/powerpc/include/asm/smp.h:118:31: note: 'cpu_core_mask' declared here
     118 | static inline struct cpumask *cpu_core_mask(int cpu)
         |                               ^
   kernel/sched/alt_core.c:7209:43: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
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
>> kernel/sched/alt_core.c:7226:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
    7226 | void __init sched_init_smp(void)
         |             ^
   kernel/sched/alt_core.c:7226:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7226 | void __init sched_init_smp(void)
         | ^
         | static 
>> kernel/sched/alt_core.c:7278:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
    7278 | void __init sched_init(void)
         |             ^
   kernel/sched/alt_core.c:7278:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7278 | void __init sched_init(void)
         | ^
         | static 
>> kernel/sched/alt_core.c:7633:20: warning: no previous prototype for function 'sched_create_group' [-Wmissing-prototypes]
    7633 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^
   kernel/sched/alt_core.c:7633:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7633 | struct task_group *sched_create_group(struct task_group *parent)
         | ^
         | static 
>> kernel/sched/alt_core.c:7644:6: warning: no previous prototype for function 'sched_online_group' [-Wmissing-prototypes]
    7644 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^
   kernel/sched/alt_core.c:7644:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7644 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         | ^
         | static 
>> kernel/sched/alt_core.c:7655:6: warning: no previous prototype for function 'sched_destroy_group' [-Wmissing-prototypes]
    7655 | void sched_destroy_group(struct task_group *tg)
         |      ^
   kernel/sched/alt_core.c:7655:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7655 | void sched_destroy_group(struct task_group *tg)
         | ^
         | static 
>> kernel/sched/alt_core.c:7661:6: warning: no previous prototype for function 'sched_release_group' [-Wmissing-prototypes]
    7661 | void sched_release_group(struct task_group *tg)
         |      ^
   kernel/sched/alt_core.c:7661:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7661 | void sched_release_group(struct task_group *tg)
         | ^
         | static 
>> kernel/sched/alt_core.c:7731:5: warning: no previous prototype for function 'sched_group_set_shares' [-Wmissing-prototypes]
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


vim +/resched_curr +966 kernel/sched/alt_core.c

9f08fc0c802aa6 Alfred Chen 2019-08-19   958  
9f08fc0c802aa6 Alfred Chen 2019-08-19   959  /*
9f08fc0c802aa6 Alfred Chen 2019-08-19   960   * resched_curr - mark rq's current task 'to be rescheduled now'.
9f08fc0c802aa6 Alfred Chen 2019-08-19   961   *
9f08fc0c802aa6 Alfred Chen 2019-08-19   962   * On UP this means the setting of the need_resched flag, on SMP it
9f08fc0c802aa6 Alfred Chen 2019-08-19   963   * might also involve a cross-CPU call to trigger the scheduler on
9f08fc0c802aa6 Alfred Chen 2019-08-19   964   * the target CPU.
9f08fc0c802aa6 Alfred Chen 2019-08-19   965   */
9f08fc0c802aa6 Alfred Chen 2019-08-19  @966  void resched_curr(struct rq *rq)
9f08fc0c802aa6 Alfred Chen 2019-08-19   967  {
9f08fc0c802aa6 Alfred Chen 2019-08-19   968  	struct task_struct *curr = rq->curr;
9f08fc0c802aa6 Alfred Chen 2019-08-19   969  	int cpu;
9f08fc0c802aa6 Alfred Chen 2019-08-19   970  
9f08fc0c802aa6 Alfred Chen 2019-08-19   971  	lockdep_assert_held(&rq->lock);
9f08fc0c802aa6 Alfred Chen 2019-08-19   972  
9f08fc0c802aa6 Alfred Chen 2019-08-19   973  	if (test_tsk_need_resched(curr))
9f08fc0c802aa6 Alfred Chen 2019-08-19   974  		return;
9f08fc0c802aa6 Alfred Chen 2019-08-19   975  
9f08fc0c802aa6 Alfred Chen 2019-08-19   976  	cpu = cpu_of(rq);
9f08fc0c802aa6 Alfred Chen 2019-08-19   977  	if (cpu == smp_processor_id()) {
9f08fc0c802aa6 Alfred Chen 2019-08-19   978  		set_tsk_need_resched(curr);
9f08fc0c802aa6 Alfred Chen 2019-08-19   979  		set_preempt_need_resched();
9f08fc0c802aa6 Alfred Chen 2019-08-19   980  		return;
9f08fc0c802aa6 Alfred Chen 2019-08-19   981  	}
9f08fc0c802aa6 Alfred Chen 2019-08-19   982  
9f08fc0c802aa6 Alfred Chen 2019-08-19   983  	if (set_nr_and_not_polling(curr))
9f08fc0c802aa6 Alfred Chen 2019-08-19   984  		smp_send_reschedule(cpu);
9f08fc0c802aa6 Alfred Chen 2019-08-19   985  	else
9f08fc0c802aa6 Alfred Chen 2019-08-19   986  		trace_sched_wake_idle_without_ipi(cpu);
9f08fc0c802aa6 Alfred Chen 2019-08-19   987  }
9f08fc0c802aa6 Alfred Chen 2019-08-19   988  
9f08fc0c802aa6 Alfred Chen 2019-08-19  @989  void resched_cpu(int cpu)
9f08fc0c802aa6 Alfred Chen 2019-08-19   990  {
9f08fc0c802aa6 Alfred Chen 2019-08-19   991  	struct rq *rq = cpu_rq(cpu);
9f08fc0c802aa6 Alfred Chen 2019-08-19   992  	unsigned long flags;
9f08fc0c802aa6 Alfred Chen 2019-08-19   993  
9f08fc0c802aa6 Alfred Chen 2019-08-19   994  	raw_spin_lock_irqsave(&rq->lock, flags);
9f08fc0c802aa6 Alfred Chen 2019-08-19   995  	if (cpu_online(cpu) || cpu == smp_processor_id())
9f08fc0c802aa6 Alfred Chen 2019-08-19   996  		resched_curr(cpu_rq(cpu));
9f08fc0c802aa6 Alfred Chen 2019-08-19   997  	raw_spin_unlock_irqrestore(&rq->lock, flags);
9f08fc0c802aa6 Alfred Chen 2019-08-19   998  }
9f08fc0c802aa6 Alfred Chen 2019-08-19   999  
9f08fc0c802aa6 Alfred Chen 2019-08-19  1000  #ifdef CONFIG_SMP
9f08fc0c802aa6 Alfred Chen 2019-08-19  1001  #ifdef CONFIG_NO_HZ_COMMON
43dd755815bff3 Alfred Chen 2020-08-07  1002  void nohz_balance_enter_idle(int cpu) {}
9f08fc0c802aa6 Alfred Chen 2019-08-19  1003  
43dd755815bff3 Alfred Chen 2020-08-07 @1004  void select_nohz_load_balancer(int stop_tick) {}
9f08fc0c802aa6 Alfred Chen 2019-08-19  1005  
9f08fc0c802aa6 Alfred Chen 2019-08-19 @1006  void set_cpu_sd_state_idle(void) {}
9f08fc0c802aa6 Alfred Chen 2019-08-19  1007  

:::::: The code at line 966 was first introduced by commit
:::::: 9f08fc0c802aa60b849cb326294a06f38abaa0b0 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
