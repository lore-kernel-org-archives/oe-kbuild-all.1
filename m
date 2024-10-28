Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0741D2796
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 21:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150731; cv=none; b=t+EPPxpi8CaEt4cqR+yFclTu11f0okivzz7Uqrs3ZYygCaPnc2hW7e4OFhi4qSASU46eMpLrfK2vX7QBNyrwVry5HdBcDXguZ0L6OQbaCAJiSAi/dTJdXJMvQXXaM/qS22bkdVaxTFTP2tJGf+5pHzrw2h65C9uchPsz2L1XE44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150731; c=relaxed/simple;
	bh=MlqyaBno75tLPZYTopK0HlrY6wcBapewySmDdaqRq5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tfqZyi6dNb3zcIBsdDUUu6gh9CDLVth3GR5RAEl2ai2XamgEMi2+Kb0ZSZMTyi5L0L9uubIqu3htKMsJFgfQ4N/xK9b2PvXExztFvt5zdiQ3Ye6ZeWnnaIpRREi5K9w53cLP7YQgEQjaUTDAo4GDW4XVeH4XQ18kfKtl3U93vOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkOFHAh4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkOFHAh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730150726; x=1761686726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MlqyaBno75tLPZYTopK0HlrY6wcBapewySmDdaqRq5k=;
  b=bkOFHAh46hXgVQu7TNRVIZGb309n7tVO5N8Ar3gGvHhdZIIvJ5Cmh+dy
   UcGzYDKaE77XTNstrj3lfHOwVPanp8ECcu/Yq2KWqWeHw5cSkATSLP3X/
   x+Vo5Tjfars/e4cKTVOTVsx+giVKYbwL66gKma9XUcYU611yKa7gnrJQS
   hjta10D4vNAvB+2dTX9zHPIArVVGmDQ8SJvODnylMTL6YxrMdKuh24pJt
   I14f99S7rahQii8ZoQtqjH08hbqFrt62r4M3UmGJfouEVVLA3KqWxDMGq
   jaQMDOj255rYKO8AnAN9rC/TIMVWd7/bQA9CvDH02dOGaLfgf2kzcD69R
   Q==;
X-CSE-ConnectionGUID: gTo5Vsm2Q/C7PKIjveF6wQ==
X-CSE-MsgGUID: WHWT7h83QZ++/AFVt9KNZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52322775"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52322775"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 14:25:25 -0700
X-CSE-ConnectionGUID: y5kp3obkS4+78FPaiduy8w==
X-CSE-MsgGUID: TgfiAvNHTN6dkxKlZfvC0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="81308677"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2024 14:25:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5XEn-000ctU-2d;
	Mon, 28 Oct 2024 21:25:21 +0000
Date: Tue, 29 Oct 2024 05:25:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2387/15358] kernel/sched/psi.c:384:13: error:
 invalid storage class for function 'test_fine_grained_stat'
Message-ID: <202410290508.V6mqgsUO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   27e5d43e49e85d816bd05ffe8672ceea631a07e4
commit: 654944510822988390470cbc5b6f914c19dd9b88 [2387/15358] sched/psi: add cpu fine grained stall tracking in pressure.stat
config: loongarch-randconfig-002-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290508.V6mqgsUO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290508.V6mqgsUO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290508.V6mqgsUO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/irq.h:23,
                    from kernel/sched/build_utility.c:29:
   include/linux/nmi.h: In function 'trigger_all_cpu_backtrace':
   arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:160:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     160 |         return arch_trigger_cpumask_backtrace(cpu_online_mask, -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_allbutcpu_cpu_backtrace':
   arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:165:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     165 |         return arch_trigger_cpumask_backtrace(cpu_online_mask, exclude_cpu);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_cpumask_backtrace':
   arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:170:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     170 |         return arch_trigger_cpumask_backtrace(mask, -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_single_cpu_backtrace':
   arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:175:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     175 |         return arch_trigger_cpumask_backtrace(cpumask_of(cpu), -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:97:
   kernel/sched/psi.c: In function 'record_stat_times':
>> kernel/sched/psi.c:384:13: error: invalid storage class for function 'test_fine_grained_stat'
     384 | static bool test_fine_grained_stat(unsigned int *stat_tasks,
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:419:13: error: invalid storage class for function 'psi_group_stat_change'
     419 | static void psi_group_stat_change(struct psi_group *group, int cpu,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:447:13: error: invalid storage class for function 'psi_stat_flags_change'
     447 | static void psi_stat_flags_change(struct task_struct *task, int *stat_set,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:469:13: error: invalid storage class for function 'get_recent_stat_times'
     469 | static void get_recent_stat_times(struct psi_group *group, int cpu,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:516:20: error: invalid storage class for function 'update_throttle_type'
     516 | static inline void update_throttle_type(struct task_struct *task, int cpu,
         |                    ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:520:13: error: invalid storage class for function 'collect_percpu_times'
     520 | static void collect_percpu_times(struct psi_group *group,
         |             ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:588:13: error: invalid storage class for function 'window_reset'
     588 | static void window_reset(struct psi_window *win, u64 now, u64 value,
         |             ^~~~~~~~~~~~
>> kernel/sched/psi.c:607:12: error: invalid storage class for function 'window_update'
     607 | static u64 window_update(struct psi_window *win, u64 now, u64 value)
         |            ^~~~~~~~~~~~~
>> kernel/sched/psi.c:633:12: error: invalid storage class for function 'update_triggers'
     633 | static u64 update_triggers(struct psi_group *group, u64 now, bool *update_total,
         |            ^~~~~~~~~~~~~~~
>> kernel/sched/psi.c:706:12: error: invalid storage class for function 'update_averages'
     706 | static u64 update_averages(struct psi_group *group, u64 now)
         |            ^~~~~~~~~~~~~~~
>> kernel/sched/psi.c:771:13: error: invalid storage class for function 'psi_avgs_work'
     771 | static void psi_avgs_work(struct work_struct *work)
         |             ^~~~~~~~~~~~~
>> kernel/sched/psi.c:807:13: error: invalid storage class for function 'init_rtpoll_triggers'
     807 | static void init_rtpoll_triggers(struct psi_group *group, u64 now)
         |             ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:820:13: error: invalid storage class for function 'psi_schedule_rtpoll_work'
     820 | static void psi_schedule_rtpoll_work(struct psi_group *group, unsigned long delay,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:847:13: error: invalid storage class for function 'psi_rtpoll_work'
     847 | static void psi_rtpoll_work(struct psi_group *group)
         |             ^~~~~~~~~~~~~~~
>> kernel/sched/psi.c:931:12: error: invalid storage class for function 'psi_rtpoll_worker'
     931 | static int psi_rtpoll_worker(void *data)
         |            ^~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:949:13: error: invalid storage class for function 'poll_timer_fn'
     949 | static void poll_timer_fn(struct timer_list *t)
         |             ^~~~~~~~~~~~~
>> kernel/sched/psi.c:957:13: error: invalid storage class for function 'record_times'
     957 | static void record_times(struct psi_group_cpu *groupc, u64 now)
         |             ^~~~~~~~~~~~
>> kernel/sched/psi.c:990:13: error: invalid storage class for function 'psi_group_change'
     990 | static void psi_group_change(struct psi_group *group, int cpu,
         |             ^~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1106:13: error: invalid storage class for function 'task_is_in_psi_v1'
    1106 | static bool task_is_in_psi_v1(void)
         |             ^~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1112:33: error: invalid storage class for function 'task_psi_group'
    1112 | static inline struct psi_group *task_psi_group(struct task_struct *task)
         |                                 ^~~~~~~~~~~~~~
   kernel/sched/psi.c: In function 'task_psi_group':
   kernel/sched/psi.c:1120:52: error: 'cpuacct_cgrp_id' undeclared (first use in this function); did you mean 'cpuset_cgrp_id'?
    1120 |                         cgroup = task_cgroup(task, cpuacct_cgrp_id);
         |                                                    ^~~~~~~~~~~~~~~
         |                                                    cpuset_cgrp_id
   kernel/sched/psi.c:1120:52: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/psi.c: In function 'record_stat_times':
   kernel/sched/psi.c:1130:13: error: invalid storage class for function 'psi_flags_change'
    1130 | static void psi_flags_change(struct task_struct *task, int clear, int set)
         |             ^~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:17,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
   kernel/sched/psi.c:1338:19: error: non-static declaration of 'psi_memstall_enter' follows static declaration
    1338 | EXPORT_SYMBOL_GPL(psi_memstall_enter);
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/psi.c:1338:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1338 | EXPORT_SYMBOL_GPL(psi_memstall_enter);
         | ^~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1306:6: note: previous definition of 'psi_memstall_enter' with type 'void(long unsigned int *)'
    1306 | void psi_memstall_enter(unsigned long *flags)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1370:19: error: non-static declaration of 'psi_memstall_leave' follows static declaration
    1370 | EXPORT_SYMBOL_GPL(psi_memstall_leave);
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/psi.c:1370:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1370 | EXPORT_SYMBOL_GPL(psi_memstall_leave);
         | ^~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1346:6: note: previous definition of 'psi_memstall_leave' with type 'void(long unsigned int *)'
    1346 | void psi_memstall_leave(unsigned long *flags)
         |      ^~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:101:
   kernel/sched/membarrier.c:165:13: error: invalid storage class for function 'ipi_mb'
     165 | static void ipi_mb(void *info)
         |             ^~~~~~
   kernel/sched/membarrier.c:170:13: error: invalid storage class for function 'ipi_sync_core'
     170 | static void ipi_sync_core(void *info)
         |             ^~~~~~~~~~~~~
   kernel/sched/membarrier.c:187:13: error: invalid storage class for function 'ipi_rseq'
     187 | static void ipi_rseq(void *info)
         |             ^~~~~~~~
   kernel/sched/membarrier.c:200:13: error: invalid storage class for function 'ipi_sync_rq_state'
     200 | static void ipi_sync_rq_state(void *info)
         |             ^~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:245:12: error: invalid storage class for function 'membarrier_global_expedited'
     245 | static int membarrier_global_expedited(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:310:12: error: invalid storage class for function 'membarrier_private_expedited'
     310 | static int membarrier_private_expedited(int flags, int cpu_id)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:426:12: error: invalid storage class for function 'sync_runqueues_membarrier_state'
     426 | static int sync_runqueues_membarrier_state(struct mm_struct *mm)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:483:12: error: invalid storage class for function 'membarrier_register_global_expedited'
     483 | static int membarrier_register_global_expedited(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:502:12: error: invalid storage class for function 'membarrier_register_private_expedited'
     502 | static int membarrier_register_private_expedited(int flags)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:544:12: error: invalid storage class for function 'membarrier_get_registrations'
     544 | static int membarrier_get_registrations(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler_types.h:153,
                    from <command-line>:
   include/linux/compiler-gcc.h:132:33: warning: 'alias' attribute ignored [-Wattributes]
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/compiler-gcc.h:135:33: note: in expansion of macro '__diag'
     135 | #define __diag_GCC_8(s)         __diag(s)
         |                                 ^~~~~~
   include/linux/compiler-gcc.h:123:9: note: in expansion of macro '__diag_GCC_8'
     123 |         __diag_GCC_ ## version(__diag_GCC_ ## severity s)
         |         ^~~~~~~~~~~
   include/linux/compiler_types.h:444:9: note: in expansion of macro '__diag_GCC'
     444 |         __diag_ ## compiler(version, ignore, option)
         |         ^~~~~~~
   include/linux/syscalls.h:242:9: note: in expansion of macro '__diag_ignore'
     242 |         __diag_ignore(GCC, 8, "-Wattribute-alias",                      \
         |         ^~~~~~~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'


vim +/test_fine_grained_stat +384 kernel/sched/psi.c

a65983d90bfb5e Lu Jialin          2024-01-04  383  
a65983d90bfb5e Lu Jialin          2024-01-04 @384  static bool test_fine_grained_stat(unsigned int *stat_tasks,
a65983d90bfb5e Lu Jialin          2024-01-04  385  				   unsigned int nr_running,
a65983d90bfb5e Lu Jialin          2024-01-04  386  				   enum psi_stat_states state)
a65983d90bfb5e Lu Jialin          2024-01-04  387  {
a65983d90bfb5e Lu Jialin          2024-01-04  388  	switch (state) {
a65983d90bfb5e Lu Jialin          2024-01-04  389  	case PSI_MEMCG_RECLAIM_SOME:
a65983d90bfb5e Lu Jialin          2024-01-04  390  		return unlikely(stat_tasks[NR_MEMCG_RECLAIM]);
a65983d90bfb5e Lu Jialin          2024-01-04  391  	case PSI_MEMCG_RECLAIM_FULL:
a65983d90bfb5e Lu Jialin          2024-01-04  392  		return unlikely(stat_tasks[NR_MEMCG_RECLAIM] &&
a65983d90bfb5e Lu Jialin          2024-01-04  393  		       nr_running == stat_tasks[NR_MEMCG_RECLAIM_RUNNING]);
25d00f6853c3c6 Lu Jialin          2024-01-04  394  	case PSI_GLOBAL_RECLAIM_SOME:
25d00f6853c3c6 Lu Jialin          2024-01-04  395  		return unlikely(stat_tasks[NR_GLOBAL_RECLAIM]);
25d00f6853c3c6 Lu Jialin          2024-01-04  396  	case PSI_GLOBAL_RECLAIM_FULL:
25d00f6853c3c6 Lu Jialin          2024-01-04  397  		return unlikely(stat_tasks[NR_GLOBAL_RECLAIM] &&
25d00f6853c3c6 Lu Jialin          2024-01-04  398  		       nr_running == stat_tasks[NR_GLOBAL_RECLAIM_RUNNING]);
25d00f6853c3c6 Lu Jialin          2024-01-04  399  	case PSI_COMPACT_SOME:
25d00f6853c3c6 Lu Jialin          2024-01-04  400  		return unlikely(stat_tasks[NR_COMPACT]);
25d00f6853c3c6 Lu Jialin          2024-01-04  401  	case PSI_COMPACT_FULL:
25d00f6853c3c6 Lu Jialin          2024-01-04  402  		return unlikely(stat_tasks[NR_COMPACT] &&
25d00f6853c3c6 Lu Jialin          2024-01-04  403  		       nr_running == stat_tasks[NR_COMPACT_RUNNING]);
25d00f6853c3c6 Lu Jialin          2024-01-04  404  	case PSI_ASYNC_MEMCG_RECLAIM_SOME:
25d00f6853c3c6 Lu Jialin          2024-01-04  405  		return unlikely(stat_tasks[NR_ASYNC_MEMCG_RECLAIM]);
25d00f6853c3c6 Lu Jialin          2024-01-04  406  	case PSI_ASYNC_MEMCG_RECLAIM_FULL:
25d00f6853c3c6 Lu Jialin          2024-01-04  407  		return unlikely(stat_tasks[NR_ASYNC_MEMCG_RECLAIM] &&
25d00f6853c3c6 Lu Jialin          2024-01-04  408  		      nr_running == stat_tasks[NR_ASYNC_MEMCG_RECLAIM_RUNNING]);
25d00f6853c3c6 Lu Jialin          2024-01-04  409  	case PSI_SWAP_SOME:
25d00f6853c3c6 Lu Jialin          2024-01-04  410  		return unlikely(stat_tasks[NR_SWAP]);
25d00f6853c3c6 Lu Jialin          2024-01-04  411  	case PSI_SWAP_FULL:
25d00f6853c3c6 Lu Jialin          2024-01-04  412  		return unlikely(stat_tasks[NR_SWAP] &&
25d00f6853c3c6 Lu Jialin          2024-01-04  413  		       nr_running == stat_tasks[NR_SWAP_RUNNING]);
a65983d90bfb5e Lu Jialin          2024-01-04  414  	default:
a65983d90bfb5e Lu Jialin          2024-01-04  415  		return false;
a65983d90bfb5e Lu Jialin          2024-01-04  416  	}
a65983d90bfb5e Lu Jialin          2024-01-04  417  }
a65983d90bfb5e Lu Jialin          2024-01-04  418  
a65983d90bfb5e Lu Jialin          2024-01-04 @419  static void psi_group_stat_change(struct psi_group *group, int cpu,
a65983d90bfb5e Lu Jialin          2024-01-04  420  				  int clear, int set)
a65983d90bfb5e Lu Jialin          2024-01-04  421  {
a65983d90bfb5e Lu Jialin          2024-01-04  422  	int t;
a65983d90bfb5e Lu Jialin          2024-01-04  423  	u32 state_mask = 0;
a65983d90bfb5e Lu Jialin          2024-01-04  424  	enum psi_stat_states s;
a65983d90bfb5e Lu Jialin          2024-01-04  425  	struct psi_group_cpu *groupc = per_cpu_ptr(group->pcpu, cpu);
a65983d90bfb5e Lu Jialin          2024-01-04  426  
a65983d90bfb5e Lu Jialin          2024-01-04  427  	write_seqcount_begin(&groupc->seq);
a65983d90bfb5e Lu Jialin          2024-01-04  428  
a65983d90bfb5e Lu Jialin          2024-01-04  429  	for (t = 0; clear; clear &= ~(1 << t), t++)
a65983d90bfb5e Lu Jialin          2024-01-04  430  		if (clear & (1 << t))
a65983d90bfb5e Lu Jialin          2024-01-04  431  			groupc->fine_grained_tasks[t]--;
a65983d90bfb5e Lu Jialin          2024-01-04  432  	for (t = 0; set; set &= ~(1 << t), t++)
a65983d90bfb5e Lu Jialin          2024-01-04  433  		if (set & (1 << t))
a65983d90bfb5e Lu Jialin          2024-01-04  434  			groupc->fine_grained_tasks[t]++;
65494451082298 Lu Jialin          2024-01-04  435  	for (s = 0; s < PSI_CPU_CFS_BANDWIDTH_FULL; s++)
a65983d90bfb5e Lu Jialin          2024-01-04  436  		if (test_fine_grained_stat(groupc->fine_grained_tasks,
a65983d90bfb5e Lu Jialin          2024-01-04  437  					   groupc->tasks[NR_RUNNING], s))
a65983d90bfb5e Lu Jialin          2024-01-04  438  			state_mask |= (1 << s);
a65983d90bfb5e Lu Jialin          2024-01-04  439  	if (unlikely(groupc->state_mask & PSI_ONCPU) &&
a65983d90bfb5e Lu Jialin          2024-01-04  440  		     cpu_curr(cpu)->memstall_type)
a65983d90bfb5e Lu Jialin          2024-01-04  441  		state_mask |= (1 << (cpu_curr(cpu)->memstall_type * 2 - 1));
a65983d90bfb5e Lu Jialin          2024-01-04  442  
a65983d90bfb5e Lu Jialin          2024-01-04  443  	groupc->fine_grained_state_mask = state_mask;
a65983d90bfb5e Lu Jialin          2024-01-04  444  	write_seqcount_end(&groupc->seq);
a65983d90bfb5e Lu Jialin          2024-01-04  445  }
a65983d90bfb5e Lu Jialin          2024-01-04  446  
a65983d90bfb5e Lu Jialin          2024-01-04 @447  static void psi_stat_flags_change(struct task_struct *task, int *stat_set,
a65983d90bfb5e Lu Jialin          2024-01-04  448  				  int *stat_clear, int set, int clear)
a65983d90bfb5e Lu Jialin          2024-01-04  449  {
a65983d90bfb5e Lu Jialin          2024-01-04  450  	if (!task->memstall_type)
a65983d90bfb5e Lu Jialin          2024-01-04  451  		return;
a65983d90bfb5e Lu Jialin          2024-01-04  452  
a65983d90bfb5e Lu Jialin          2024-01-04  453  	if (clear) {
a65983d90bfb5e Lu Jialin          2024-01-04  454  		if (clear & TSK_MEMSTALL)
a65983d90bfb5e Lu Jialin          2024-01-04  455  			*stat_clear |= 1 << (2 * task->memstall_type - 2);
a65983d90bfb5e Lu Jialin          2024-01-04  456  		if (clear & TSK_MEMSTALL_RUNNING)
a65983d90bfb5e Lu Jialin          2024-01-04  457  			*stat_clear |= 1 << (2 * task->memstall_type - 1);
a65983d90bfb5e Lu Jialin          2024-01-04  458  	}
a65983d90bfb5e Lu Jialin          2024-01-04  459  	if (set) {
a65983d90bfb5e Lu Jialin          2024-01-04  460  		if (set & TSK_MEMSTALL)
a65983d90bfb5e Lu Jialin          2024-01-04  461  			*stat_set |= 1 << (2 * task->memstall_type - 2);
a65983d90bfb5e Lu Jialin          2024-01-04  462  		if (set & TSK_MEMSTALL_RUNNING)
a65983d90bfb5e Lu Jialin          2024-01-04  463  			*stat_set |= 1 << (2 * task->memstall_type - 1);
a65983d90bfb5e Lu Jialin          2024-01-04  464  	}
a65983d90bfb5e Lu Jialin          2024-01-04  465  	if (!task->in_memstall)
a65983d90bfb5e Lu Jialin          2024-01-04  466  		task->memstall_type = 0;
a65983d90bfb5e Lu Jialin          2024-01-04  467  }
a65983d90bfb5e Lu Jialin          2024-01-04  468  
0df60cce43301d Lu Jialin          2024-01-04 @469  static void get_recent_stat_times(struct psi_group *group, int cpu,
0df60cce43301d Lu Jialin          2024-01-04  470  				  enum psi_aggregators aggregator, u64 *stat_delta, u64 nonidle)
0df60cce43301d Lu Jialin          2024-01-04  471  {
0df60cce43301d Lu Jialin          2024-01-04  472  	struct psi_group_cpu *groupc = per_cpu_ptr(group->pcpu, cpu);
0df60cce43301d Lu Jialin          2024-01-04  473  	u32 times[NR_PSI_STAT_STATES] = {0};
0df60cce43301d Lu Jialin          2024-01-04  474  	enum psi_stat_states s;
0df60cce43301d Lu Jialin          2024-01-04  475  	u32 delta;
0df60cce43301d Lu Jialin          2024-01-04  476  
0df60cce43301d Lu Jialin          2024-01-04  477  	memcpy(times, groupc->fine_grained_times, sizeof(groupc->fine_grained_times));
0df60cce43301d Lu Jialin          2024-01-04  478  	for (s = 0; s < NR_PSI_STAT_STATES; s++) {
0df60cce43301d Lu Jialin          2024-01-04  479  		if (groupc->fine_grained_state_mask & (1 << s))
0df60cce43301d Lu Jialin          2024-01-04  480  			times[s] += groupc->fine_grained_times_delta;
0df60cce43301d Lu Jialin          2024-01-04  481  		delta = times[s] - groupc->fine_grained_times_prev[aggregator][s];
0df60cce43301d Lu Jialin          2024-01-04  482  		groupc->fine_grained_times_prev[aggregator][s] = times[s];
0df60cce43301d Lu Jialin          2024-01-04  483  		stat_delta[s] += (u64)delta * nonidle;
0df60cce43301d Lu Jialin          2024-01-04  484  	}
0df60cce43301d Lu Jialin          2024-01-04  485  }
a65983d90bfb5e Lu Jialin          2024-01-04  486  #else
a65983d90bfb5e Lu Jialin          2024-01-04  487  static inline void psi_group_stat_change(struct psi_group *group, int cpu,
a65983d90bfb5e Lu Jialin          2024-01-04  488  					 int clear, int set) {}
a65983d90bfb5e Lu Jialin          2024-01-04  489  static inline void psi_stat_flags_change(struct task_struct *task,
a65983d90bfb5e Lu Jialin          2024-01-04  490  					 int *stat_set, int *stat_clear,
a65983d90bfb5e Lu Jialin          2024-01-04  491  					 int set, int clear) {}
a65983d90bfb5e Lu Jialin          2024-01-04  492  #endif
a65983d90bfb5e Lu Jialin          2024-01-04  493  
65494451082298 Lu Jialin          2024-01-04  494  #if defined(CONFIG_CFS_BANDWIDTH) && defined(CONFIG_CGROUP_CPUACCT) && \
65494451082298 Lu Jialin          2024-01-04  495  	defined(CONFIG_PSI_FINE_GRAINED)
65494451082298 Lu Jialin          2024-01-04  496  static void update_throttle_type(struct task_struct *task, int cpu, bool next)
65494451082298 Lu Jialin          2024-01-04  497  {
65494451082298 Lu Jialin          2024-01-04  498  	if (!cgroup_subsys_on_dfl(cpuacct_cgrp_subsys)) {
65494451082298 Lu Jialin          2024-01-04  499  		struct cgroup *cpuacct_cgrp;
65494451082298 Lu Jialin          2024-01-04  500  		struct psi_group_cpu *groupc;
65494451082298 Lu Jialin          2024-01-04  501  		struct task_group *tsk_grp;
65494451082298 Lu Jialin          2024-01-04  502  
65494451082298 Lu Jialin          2024-01-04  503  		rcu_read_lock();
65494451082298 Lu Jialin          2024-01-04  504  		cpuacct_cgrp = task_cgroup(task, cpuacct_cgrp_id);
65494451082298 Lu Jialin          2024-01-04  505  		if (cgroup_parent(cpuacct_cgrp)) {
65494451082298 Lu Jialin          2024-01-04  506  			groupc = per_cpu_ptr(cgroup_psi(cpuacct_cgrp)->pcpu, cpu);
65494451082298 Lu Jialin          2024-01-04  507  			tsk_grp = task_group(task);
65494451082298 Lu Jialin          2024-01-04  508  			if (next)
65494451082298 Lu Jialin          2024-01-04  509  				groupc->prev_throttle = groupc->cur_throttle;
65494451082298 Lu Jialin          2024-01-04  510  			groupc->cur_throttle = tsk_grp->cfs_rq[cpu]->throttled;
65494451082298 Lu Jialin          2024-01-04  511  		}
65494451082298 Lu Jialin          2024-01-04  512  		rcu_read_unlock();
65494451082298 Lu Jialin          2024-01-04  513  	}
65494451082298 Lu Jialin          2024-01-04  514  }
65494451082298 Lu Jialin          2024-01-04  515  #else
65494451082298 Lu Jialin          2024-01-04 @516  static inline void update_throttle_type(struct task_struct *task, int cpu,
65494451082298 Lu Jialin          2024-01-04  517  					bool next) {}
65494451082298 Lu Jialin          2024-01-04  518  #endif
65494451082298 Lu Jialin          2024-01-04  519  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14 @520  static void collect_percpu_times(struct psi_group *group,
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  521  				 enum psi_aggregators aggregator,
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  522  				 u32 *pchanged_states)
eb414681d5a07d Johannes Weiner    2018-10-26  523  {
0df60cce43301d Lu Jialin          2024-01-04  524  #ifdef CONFIG_PSI_FINE_GRAINED
0df60cce43301d Lu Jialin          2024-01-04  525  	u64 stat_delta[NR_PSI_STAT_STATES] = { 0 };
0df60cce43301d Lu Jialin          2024-01-04  526  #endif
eb414681d5a07d Johannes Weiner    2018-10-26  527  	u64 deltas[NR_PSI_STATES - 1] = { 0, };
eb414681d5a07d Johannes Weiner    2018-10-26  528  	unsigned long nonidle_total = 0;
333f3017c5a893 Suren Baghdasaryan 2019-05-14  529  	u32 changed_states = 0;
eb414681d5a07d Johannes Weiner    2018-10-26  530  	int cpu;
eb414681d5a07d Johannes Weiner    2018-10-26  531  	int s;
eb414681d5a07d Johannes Weiner    2018-10-26  532  
eb414681d5a07d Johannes Weiner    2018-10-26  533  	/*
eb414681d5a07d Johannes Weiner    2018-10-26  534  	 * Collect the per-cpu time buckets and average them into a
eb414681d5a07d Johannes Weiner    2018-10-26  535  	 * single time sample that is normalized to wallclock time.
eb414681d5a07d Johannes Weiner    2018-10-26  536  	 *
eb414681d5a07d Johannes Weiner    2018-10-26  537  	 * For averaging, each CPU is weighted by its non-idle time in
eb414681d5a07d Johannes Weiner    2018-10-26  538  	 * the sampling period. This eliminates artifacts from uneven
eb414681d5a07d Johannes Weiner    2018-10-26  539  	 * loading, or even entirely idle CPUs.
eb414681d5a07d Johannes Weiner    2018-10-26  540  	 */
eb414681d5a07d Johannes Weiner    2018-10-26  541  	for_each_possible_cpu(cpu) {
eb414681d5a07d Johannes Weiner    2018-10-26  542  		u32 times[NR_PSI_STATES];
eb414681d5a07d Johannes Weiner    2018-10-26  543  		u32 nonidle;
333f3017c5a893 Suren Baghdasaryan 2019-05-14  544  		u32 cpu_changed_states;
eb414681d5a07d Johannes Weiner    2018-10-26  545  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  546  		get_recent_times(group, cpu, aggregator, times,
333f3017c5a893 Suren Baghdasaryan 2019-05-14  547  				&cpu_changed_states);
333f3017c5a893 Suren Baghdasaryan 2019-05-14  548  		changed_states |= cpu_changed_states;
eb414681d5a07d Johannes Weiner    2018-10-26  549  
eb414681d5a07d Johannes Weiner    2018-10-26  550  		nonidle = nsecs_to_jiffies(times[PSI_NONIDLE]);
eb414681d5a07d Johannes Weiner    2018-10-26  551  		nonidle_total += nonidle;
eb414681d5a07d Johannes Weiner    2018-10-26  552  
eb414681d5a07d Johannes Weiner    2018-10-26  553  		for (s = 0; s < PSI_NONIDLE; s++)
eb414681d5a07d Johannes Weiner    2018-10-26  554  			deltas[s] += (u64)times[s] * nonidle;
0df60cce43301d Lu Jialin          2024-01-04  555  #ifdef CONFIG_PSI_FINE_GRAINED
0df60cce43301d Lu Jialin          2024-01-04  556  		get_recent_stat_times(group, cpu, aggregator, stat_delta, nonidle);
0df60cce43301d Lu Jialin          2024-01-04  557  #endif
eb414681d5a07d Johannes Weiner    2018-10-26  558  	}
eb414681d5a07d Johannes Weiner    2018-10-26  559  
eb414681d5a07d Johannes Weiner    2018-10-26  560  	/*
eb414681d5a07d Johannes Weiner    2018-10-26  561  	 * Integrate the sample into the running statistics that are
eb414681d5a07d Johannes Weiner    2018-10-26  562  	 * reported to userspace: the cumulative stall times and the
eb414681d5a07d Johannes Weiner    2018-10-26  563  	 * decaying averages.
eb414681d5a07d Johannes Weiner    2018-10-26  564  	 *
eb414681d5a07d Johannes Weiner    2018-10-26  565  	 * Pressure percentages are sampled at PSI_FREQ. We might be
eb414681d5a07d Johannes Weiner    2018-10-26  566  	 * called more often when the user polls more frequently than
eb414681d5a07d Johannes Weiner    2018-10-26  567  	 * that; we might be called less often when there is no task
eb414681d5a07d Johannes Weiner    2018-10-26  568  	 * activity, thus no data, and clock ticks are sporadic. The
eb414681d5a07d Johannes Weiner    2018-10-26  569  	 * below handles both.
eb414681d5a07d Johannes Weiner    2018-10-26  570  	 */
eb414681d5a07d Johannes Weiner    2018-10-26  571  
eb414681d5a07d Johannes Weiner    2018-10-26  572  	/* total= */
eb414681d5a07d Johannes Weiner    2018-10-26  573  	for (s = 0; s < NR_PSI_STATES - 1; s++)
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  574  		group->total[aggregator][s] +=
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  575  				div_u64(deltas[s], max(nonidle_total, 1UL));
eb414681d5a07d Johannes Weiner    2018-10-26  576  

:::::: The code at line 384 was first introduced by commit
:::::: a65983d90bfb5e031444fea492b32f931c83ffcf sched/psi: Introduce fine grained stall time collect for cgroup reclaim

:::::: TO: Lu Jialin <lujialin4@huawei.com>
:::::: CC: yanhaitao <yanhaitao2@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
