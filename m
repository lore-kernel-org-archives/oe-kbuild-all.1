Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCA3136351
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 17:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740677893; cv=none; b=snj+S0zKbtrWkMRpSW+VWukaWJBdUFOUI7Uxa7zxokp8TBcyOYPJVq+ZJfPbv8gUFXkvxjjSRLAnzvJeWnCyw/eE2RdcufSafi8iHbVA7Z5lvQKV0PtE6ACQk6S4J5bTNv0IhNBMaWFtufhZcGiBpFGhfId55pfxuoHsgf5u7Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740677893; c=relaxed/simple;
	bh=+DQcn0G0EGb3MLlblVvnM7YSHBnomLLYtMv9IJXzhL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lUExHHJDcFkq4OvvtEUBZ2r4VoQe0a3zuL0kQKV5StGmnO7/Yhhc/JUgVmtDbxfPKKpxQGnTBAGWjBLuUeqcWPFgAAsEAEeUzmb1S326EsWeXfPr07XJwCxB+FF4NKkmkGu+sPLSezC+RKocq8BjN82T1DEgJUeFdSRGdE1ME08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QH879DAB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QH879DAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740677891; x=1772213891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+DQcn0G0EGb3MLlblVvnM7YSHBnomLLYtMv9IJXzhL4=;
  b=QH879DABP47Qv8uvgO+3xbNmNDSYHRDSQHfZkhNt5+WzGebx8NyzGb6U
   hRxqCgGkIJjDxtDOlGox21jno8a/VEwdmyFjpX4cg9qeRGXeVYQ+13oMG
   g64/vmmrTEdxafplCJixujgSjGQiUE5nt0V84XPGWfHPTWjQmXFNcWlWF
   TEwjivfZ0RVc8Ey0nkHR7nFlHxkO3pI/Me6FPw6uKN+vwYh0lqy2XzVNc
   JzBBHcIy8kdKBxgepobIBPRKlTHglzzu8ZAnzYL6vJhp1kwF2JiF018uT
   XhWs1MXoFSbLJgn4l4KTxVBFyZUVmIOqKqDilyAKqr6gWIQytIzLIWIJ+
   g==;
X-CSE-ConnectionGUID: h0lVQArFQOO5yzVkvMgGbQ==
X-CSE-MsgGUID: QdP6LT7ySHqeEnrXkJnT8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="44405578"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="44405578"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 09:38:09 -0800
X-CSE-ConnectionGUID: y0N+sRjbSRiA9R1HcWGF4Q==
X-CSE-MsgGUID: bQKAxtx0S76z+6ieDQKaQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117115269"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Feb 2025 09:38:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnhpl-000DmY-0u;
	Thu, 27 Feb 2025 17:38:05 +0000
Date: Fri, 28 Feb 2025 01:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:microq 1/1] kernel/sched/microq.c:23:5: sparse: sparse:
 symbol 'sysctl_sched_microq_period' was not declared. Should it be static?
Message-ID: <202502280147.rfzCdUcO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux microq
head:   00a569cb6069576a53081ef9112cf361497c009b
commit: 00a569cb6069576a53081ef9112cf361497c009b [1/1] sched: Add micro quanta scheduling class
config: m68k-randconfig-r121-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280147.rfzCdUcO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250228/202502280147.rfzCdUcO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280147.rfzCdUcO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/pelt.h:200:5: sparse: sparse: symbol 'update_rt_rq_load_avg_ratio' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:851:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:851:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:851:70: sparse:    struct task_struct *
   kernel/sched/rt.c:531:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:531:55: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:531:55: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:991:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:991:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:991:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1529:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1529:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1529:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1654:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1654:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1654:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2359:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2359:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2359:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1262:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1262:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1262:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1262:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1262:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1262:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1362:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1362:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1362:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1672:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1672:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1672:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1672:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1672:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1672:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1761:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1761:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1761:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3069:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3069:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3069:23: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/microq.c:23:5: sparse: sparse: symbol 'sysctl_sched_microq_period' was not declared. Should it be static?
>> kernel/sched/microq.c:24:5: sparse: sparse: symbol 'sysctl_sched_microq_runtime' was not declared. Should it be static?
>> kernel/sched/microq.c:26:5: sparse: sparse: symbol 'sched_microq_timeslice' was not declared. Should it be static?
>> kernel/sched/microq.c:294:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/microq.c:133:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/microq.c:221:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/microq.c:388:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/microq.c:729:43: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file (through include/linux/smp.h, include/linux/sched/clock.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2343:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2343:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2354:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2343:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2543:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2543:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2543:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2354:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2543:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2543:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2543:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2354:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2543:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2543:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2543:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1388:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2343:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct *

vim +/sysctl_sched_microq_period +23 kernel/sched/microq.c

    18	
    19	/*
    20	 * Global micro quanta period and runtime in ns.
    21	 * Can be overridden by per task parameters.
    22	 */
  > 23	int sysctl_sched_microq_period = 40000;
  > 24	int sysctl_sched_microq_runtime = 20000;
    25	
  > 26	int sched_microq_timeslice = 1;
    27	
    28	static DEFINE_PER_CPU(struct balance_callback, microq_push_head);
    29	
    30	static enum hrtimer_restart sched_microq_period_timer(struct hrtimer *timer);
    31	static void __task_tick_microq(struct rq *rq, struct task_struct *p, int queued);
    32	static void push_one_microq_task(struct rq *rq);
    33	static void push_microq_tasks(struct rq *rq);
    34	
    35	static inline u64 u_saturation_sub(u64 a, u64 b)
    36	{
    37		return a > b ? a - b : 0;
    38	}
    39	
    40	static inline struct task_struct *microq_task_of(struct sched_microq_entity *microq_se)
    41	{
    42		return container_of(microq_se, struct task_struct, microq);
    43	}
    44	
    45	static inline struct rq *rq_of_microq_rq(struct microq_rq *microq_rq)
    46	{
    47		return container_of(microq_rq, struct rq, microq);
    48	}
    49	
    50	static inline struct microq_rq *microq_rq_of_se(struct sched_microq_entity *microq_se)
    51	{
    52		struct task_struct *p = microq_task_of(microq_se);
    53		struct rq *rq = task_rq(p);
    54	
    55		return &rq->microq;
    56	}
    57	
    58	static inline int on_microq_rq(struct sched_microq_entity *microq_se)
    59	{
    60		return !list_empty(&microq_se->run_list);
    61	}
    62	
    63	static int microq_task(struct task_struct *p)
    64	{
    65		return p->sched_class == &microq_sched_class;
    66	}
    67	
    68	/*
    69	 * microq bandwidth can be controlled with either global or per task bandwidth
    70	 * parameters. If none of the microq tasks on a cpu specifies the bandwidth
    71	 * parameters, global parameters take effect.
    72	 *
    73	 * When there are multiple microq tasks on a run queue, the bandwidth
    74	 * parameters of the task with shortest period takes effect. (Note runtime in
    75	 * effect is *not* the sum of microq tasks, it is exactly the runtime requested
    76	 * by one microq task.)
    77	 *
    78	 * See also sched-microq.txt
    79	 */
    80	static inline void get_microq_bandwidth(struct microq_rq *microq_rq, int *period, int *runtime)
    81	{
    82		if (microq_rq->microq_period != MICROQ_BANDWIDTH_UNDEFINED) {
    83			*period = microq_rq->microq_period;
    84			*runtime = microq_rq->microq_runtime;
    85		} else {
    86			*period = READ_ONCE(sysctl_sched_microq_period);
    87			*runtime = READ_ONCE(sysctl_sched_microq_runtime);
    88			*period = max(MICROQ_MIN_PERIOD, *period);
    89			if (*runtime != MICROQ_BANDWIDTH_UNDEFINED) /* if runtime != unlimited */
    90				*runtime = max(MICROQ_MIN_RUNTIME, *runtime);
    91		}
    92	}
    93	
    94	static inline int microq_timer_needed(struct microq_rq *microq_rq)
    95	{
    96		struct rq *rq = rq_of_microq_rq(microq_rq);
    97		int period, runtime;
    98	
    99		get_microq_bandwidth(microq_rq, &period, &runtime);
   100		return runtime != MICROQ_BANDWIDTH_UNDEFINED && rq->microq.microq_nr_running &&
   101		    rq->nr_running > rq->microq.microq_nr_running;
   102	}
   103	
   104	void init_microq_rq(struct microq_rq *microq_rq)
   105	{
   106		INIT_LIST_HEAD(&microq_rq->tasks);
   107	
   108		microq_rq->microq_period = MICROQ_BANDWIDTH_UNDEFINED;
   109		microq_rq->microq_runtime = MICROQ_BANDWIDTH_UNDEFINED;
   110		microq_rq->microq_time = 0;
   111		microq_rq->microq_target_time = 0;
   112		microq_rq->microq_throttled = 0;
   113	
   114		hrtimer_init(&microq_rq->microq_period_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
   115		microq_rq->microq_period_timer.function = sched_microq_period_timer;
   116		microq_rq->quanta_start = 0;
   117		microq_rq->delta_exec_uncharged = 0;
   118		microq_rq->delta_exec_total = 0;
   119	}
   120	
   121	static void account_microq_bandwidth(struct rq *rq)
   122	{
   123		s64 delta;
   124		int period;
   125		int runtime;
   126		struct microq_rq *microq_rq = &rq->microq;
   127	
   128		delta = sched_clock_cpu(cpu_of(rq)) - microq_rq->quanta_start;
   129		microq_rq->quanta_start += delta;
   130		delta = max(0LL, delta);
   131	
   132		get_microq_bandwidth(microq_rq, &period, &runtime);
   133		if (microq_task(rq->curr)) {
   134			microq_rq->microq_time += delta;
   135			microq_rq->delta_exec_uncharged += delta;
   136		}
   137		microq_rq->delta_exec_total += delta;
   138		microq_rq->microq_target_time += delta*runtime/period;
   139		microq_rq->microq_time = clamp(microq_rq->microq_time,
   140		    u_saturation_sub(microq_rq->microq_target_time, period*2),
   141		    microq_rq->microq_target_time + period*2);
   142	}
   143	
   144	static void check_microq_timer(struct rq *rq)
   145	{
   146		struct microq_rq *microq_rq = &rq->microq;
   147		int period, runtime, expire;
   148	
   149		if (hrtimer_active(&microq_rq->microq_period_timer))
   150			return;
   151	
   152		get_microq_bandwidth(microq_rq, &period, &runtime);
   153		account_microq_bandwidth(rq);
   154		if (microq_rq->microq_time < microq_rq->microq_target_time) {
   155			microq_rq->microq_throttled = 0;
   156			expire = microq_rq->microq_target_time - microq_rq->microq_time;
   157			expire = max(runtime, expire);
   158		} else {
   159			microq_rq->microq_throttled = 1;
   160			expire = microq_rq->microq_time - microq_rq->microq_target_time;
   161			expire = max(expire, period - runtime);
   162		}
   163		microq_rq->period_count = 0;
   164		microq_rq->periods_to_jiffies = (jiffies_to_usecs(1) * 1000) / period;
   165		microq_rq->periods_to_jiffies = max(1U, microq_rq->periods_to_jiffies);
   166	
   167		hrtimer_start_range_ns(&microq_rq->microq_period_timer, ns_to_ktime(expire), 0,
   168				 HRTIMER_MODE_REL_PINNED);
   169	}
   170	
   171	// TODO(kkd): Silence warning, we already do declaration in
   172	// kernel/sched/syscalls.c
   173	void microq_adjust_bandwidth(struct task_struct *p);
   174	
   175	void microq_adjust_bandwidth(struct task_struct *p)
   176	{
   177		struct microq_rq *microq_rq = &task_rq(p)->microq;
   178		struct sched_microq_entity *microq_se;
   179	
   180		microq_rq->microq_period = MICROQ_BANDWIDTH_UNDEFINED;
   181		microq_rq->microq_runtime = MICROQ_BANDWIDTH_UNDEFINED;
   182		list_for_each_entry(microq_se, &microq_rq->tasks, run_list) {
   183			if (microq_se->sched_period >= 0 &&
   184			    microq_se->sched_runtime >= MICROQ_BANDWIDTH_UNDEFINED &&
   185			    (microq_rq->microq_period == MICROQ_BANDWIDTH_UNDEFINED ||
   186			    microq_se->sched_period <= microq_rq->microq_period)) {
   187				microq_rq->microq_period = microq_se->sched_period;
   188				microq_rq->microq_runtime = microq_se->sched_runtime;
   189			}
   190		}
   191	
   192	}
   193	
   194	static void microq_update_load_avg_ratio(struct rq *rq)
   195	{
   196		struct microq_rq *microq_rq = &rq->microq;
   197		int period;
   198		int runtime;
   199		u64 contrib_ratio;
   200	
   201		/*
   202		 * For cpu_power accounting (SCHED_POWER_SCALE)
   203		 *
   204		 * Note micro's contribution to rt_avg is capped at elapsed_time*runtime/period for
   205		 * the desired load balancing behavior. We allow microq to go over its bandwidth limit
   206		 * when there are free cpu cycles. However if we don't cap the rt_avg contribution
   207		 * the cpu running microq can report cpu_power of 0, such that no cfs task can be
   208		 * moved to it by load balancer.
   209		 */
   210		get_microq_bandwidth(microq_rq, &period, &runtime);
   211		if (microq_rq->delta_exec_uncharged * period > microq_rq->delta_exec_total * runtime)
   212			contrib_ratio = runtime * SCHED_FIXEDPOINT_SCALE / period;
   213	
   214		else
   215			contrib_ratio = SCHED_FIXEDPOINT_SCALE;
   216		update_rt_rq_load_avg_ratio(rq_clock_pelt(rq), contrib_ratio, rq, 1);
   217	}
   218	
   219	static void update_curr_microq(struct rq *rq)
   220	{
 > 221		struct task_struct *curr = rq->curr;
   222		struct microq_rq *microq_rq = &rq->microq;
   223		struct sched_statistics *stats;
   224	
   225		if (!microq_task(curr))
   226			return;
   227	
   228		account_microq_bandwidth(rq);
   229	
   230		stats = __schedstats_from_se(&curr->se);
   231	
   232		schedstat_set(stats->exec_max, max((u64)stats->exec_max, microq_rq->delta_exec_uncharged));
   233	
   234		curr->se.sum_exec_runtime += microq_rq->delta_exec_uncharged;
   235		account_group_exec_runtime(curr, microq_rq->delta_exec_uncharged);
   236	
   237		curr->se.exec_start = rq_clock_task(rq);
   238		cpuacct_charge(curr, microq_rq->delta_exec_uncharged);
   239	
   240		microq_update_load_avg_ratio(rq),
   241	
   242		microq_rq->delta_exec_uncharged = 0;
   243		microq_rq->delta_exec_total = 0;
   244	}
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
