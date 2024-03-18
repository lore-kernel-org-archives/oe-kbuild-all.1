Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EA85D489
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 23:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710803600; cv=none; b=XQq96WyKKrV3nIKW+Qj9b3UCJHRNbl9B9/wTQDaVBTidU4TAB7MlD0z4zFThhcip2pIfYkFmVlra0tJTFCRVV52dslhS7KWWB0H9jK3hQaJ5mJ8WYiLmDXyFBtyEXO+z6BB4lVejc+9QUcTzu4FVWpe/lhMKZ2m82eWj/dTNQ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710803600; c=relaxed/simple;
	bh=iVDF799IsTpjp3rob5oDfljYb8we8a6St78cVsb/Ujs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBH1DFZm9iHtsIAB9NHsaLZUfDKWYR0zbQ77ZC9DwVdwJJT0GcjcFTcLP2CJB5K1+4DTbNRIGdZQlmQ3qCdeH6esH0lSAqk0JgWtlXo9KDjTVYapdTEL1ewEXiMhCZ+qqyVpK/AW3Fmb4jrgsFyhaXyauzeDUefdu8vcEL4jpmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAKndWwK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAKndWwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710803598; x=1742339598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iVDF799IsTpjp3rob5oDfljYb8we8a6St78cVsb/Ujs=;
  b=nAKndWwKOesnZIyiByie4m3dGZ8RA4aoyYHhgrLO2T7goeI5/F1fAolS
   jP4MWSlzUk7B+pNsL6xhmQrhgETwsNdfR9jcxh/mV58I1WNZDZwn04V1C
   7+jVNG1EwTIq7+i6EX9M8I6W2ZqQn7CaMqiCtTBzcaKzVbXnTID56Fybm
   uVCToT7Lcy4HNoqhQUdjwIOKvnirD6A2C548XzePhA0jrvfbtvcfLzRoT
   qumIa8/oCtAgM0txDtvuy4cOHYaUG4glOg8341S3kgV34fazyTz50AOY3
   uzo7aYwnvZUgLij35aLcdJwBEqlXoHijbCK6JotXKce0AM+H5/I6ogGpX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5829410"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5829410"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 16:13:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="44684182"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2024 16:13:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmMAL-000HIp-2L;
	Mon, 18 Mar 2024 23:13:13 +0000
Date: Tue, 19 Mar 2024 07:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rt 24/22725] kernel/trace/latency_hist.c:887:25:
 warning: comparison between signed and unsigned integer expressions
Message-ID: <202403190730.Lgyn83Pv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt
head:   0a25e06c1d858ae27efabaa88494a6dc998a0138
commit: 438c470eb865a5d5812922e93245a3412733fd87 [24/22725] tracing: Add latency histograms
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240319/202403190730.Lgyn83Pv-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403190730.Lgyn83Pv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403190730.Lgyn83Pv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/tracepoint.h:481:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/trace/events/sched.h:95:1: note: in expansion of macro 'DEFINE_EVENT'
    DEFINE_EVENT(sched_wakeup_template, sched_wakeup,
    ^~~~~~~~~~~~
   kernel/trace/latency_hist.c:620:9: warning: passing argument 1 of 'unregister_trace_sched_wakeup_new' from incompatible pointer type [-Wincompatible-pointer-types]
            probe_wakeup_latency_hist_start, NULL);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/trace.h:11:0,
                    from kernel/trace/latency_hist.c:28:
   include/linux/tracepoint.h:224:2: note: expected 'void (*)(void *, struct task_struct *)' but argument is of type 'void (*)(void *, struct task_struct *, int)'
     unregister_trace_##name(void (*probe)(data_proto), void *data) \
     ^
   include/linux/tracepoint.h:358:3: note: in expansion of macro '__DECLARE_TRACE'
      __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
      ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/trace/events/sched.h:102:1: note: in expansion of macro 'DEFINE_EVENT'
    DEFINE_EVENT(sched_wakeup_template, sched_wakeup_new,
    ^~~~~~~~~~~~
   kernel/trace/latency_hist.c:622:9: warning: passing argument 1 of 'unregister_trace_sched_switch' from incompatible pointer type [-Wincompatible-pointer-types]
            probe_wakeup_latency_hist_stop, NULL);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/trace.h:11:0,
                    from kernel/trace/latency_hist.c:28:
   include/linux/tracepoint.h:224:2: note: expected 'void (*)(void *, bool,  struct task_struct *, struct task_struct *) {aka void (*)(void *, _Bool,  struct task_struct *, struct task_struct *)}' but argument is of type 'void (*)(void *, struct task_struct *, struct task_struct *)'
     unregister_trace_##name(void (*probe)(data_proto), void *data) \
     ^
   include/linux/tracepoint.h:358:3: note: in expansion of macro '__DECLARE_TRACE'
      __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
      ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:492:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/trace/events/sched.h:124:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(sched_switch,
    ^~~~~~~~~~~
   kernel/trace/latency_hist.c:682:9: warning: passing argument 1 of 'unregister_trace_sched_wakeup' from incompatible pointer type [-Wincompatible-pointer-types]
            probe_wakeup_latency_hist_start, NULL);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/trace.h:11:0,
                    from kernel/trace/latency_hist.c:28:
   include/linux/tracepoint.h:224:2: note: expected 'void (*)(void *, struct task_struct *)' but argument is of type 'void (*)(void *, struct task_struct *, int)'
     unregister_trace_##name(void (*probe)(data_proto), void *data) \
     ^
   include/linux/tracepoint.h:358:3: note: in expansion of macro '__DECLARE_TRACE'
      __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
      ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/trace/events/sched.h:95:1: note: in expansion of macro 'DEFINE_EVENT'
    DEFINE_EVENT(sched_wakeup_template, sched_wakeup,
    ^~~~~~~~~~~~
   kernel/trace/latency_hist.c:684:9: warning: passing argument 1 of 'unregister_trace_sched_wakeup_new' from incompatible pointer type [-Wincompatible-pointer-types]
            probe_wakeup_latency_hist_start, NULL);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/trace.h:11:0,
                    from kernel/trace/latency_hist.c:28:
   include/linux/tracepoint.h:224:2: note: expected 'void (*)(void *, struct task_struct *)' but argument is of type 'void (*)(void *, struct task_struct *, int)'
     unregister_trace_##name(void (*probe)(data_proto), void *data) \
     ^
   include/linux/tracepoint.h:358:3: note: in expansion of macro '__DECLARE_TRACE'
      __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
      ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/trace/events/sched.h:102:1: note: in expansion of macro 'DEFINE_EVENT'
    DEFINE_EVENT(sched_wakeup_template, sched_wakeup_new,
    ^~~~~~~~~~~~
   kernel/trace/latency_hist.c:686:9: warning: passing argument 1 of 'unregister_trace_sched_switch' from incompatible pointer type [-Wincompatible-pointer-types]
            probe_wakeup_latency_hist_stop, NULL);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/trace.h:11:0,
                    from kernel/trace/latency_hist.c:28:
   include/linux/tracepoint.h:224:2: note: expected 'void (*)(void *, bool,  struct task_struct *, struct task_struct *) {aka void (*)(void *, _Bool,  struct task_struct *, struct task_struct *)}' but argument is of type 'void (*)(void *, struct task_struct *, struct task_struct *)'
     unregister_trace_##name(void (*probe)(data_proto), void *data) \
     ^
   include/linux/tracepoint.h:358:3: note: in expansion of macro '__DECLARE_TRACE'
      __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
      ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:492:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/trace/events/sched.h:124:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(sched_switch,
    ^~~~~~~~~~~
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/list.h:4,
                    from include/linux/module.h:9,
                    from kernel/trace/latency_hist.c:16:
   kernel/trace/latency_hist.c: In function 'probe_wakeup_latency_hist_start':
>> kernel/trace/latency_hist.c:887:25: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (likely(wakeup_pid != task_pid_nr(p)))
                            ^
   include/linux/compiler.h:165:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   kernel/trace/latency_hist.c: In function 'probe_hrtimer_interrupt':
   kernel/trace/latency_hist.c:990:40: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
       if (likely(missed_timer_offsets_pid !=
                                           ^
   include/linux/compiler.h:165:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   kernel/trace/latency_hist.c: In function 'latency_hist_init':
>> kernel/trace/latency_hist.c:1013:17: warning: variable 'entry' set but not used [-Wunused-but-set-variable]
     struct dentry *entry;
                    ^~~~~


vim +887 kernel/trace/latency_hist.c

   870	
   871	static notrace void probe_wakeup_latency_hist_start(void *v,
   872		struct task_struct *p, int success)
   873	{
   874		unsigned long flags;
   875		struct task_struct *curr = current;
   876		int cpu = task_cpu(p);
   877		struct task_struct *cpu_wakeup_task;
   878	
   879		raw_spin_lock_irqsave(&wakeup_lock, flags);
   880	
   881		cpu_wakeup_task = per_cpu(wakeup_task, cpu);
   882	
   883		if (wakeup_pid) {
   884			if ((cpu_wakeup_task && p->prio == cpu_wakeup_task->prio) ||
   885			    p->prio == curr->prio)
   886				per_cpu(wakeup_sharedprio, cpu) = 1;
 > 887			if (likely(wakeup_pid != task_pid_nr(p)))
   888				goto out;
   889		} else {
   890			if (likely(!rt_task(p)) ||
   891			    (cpu_wakeup_task && p->prio > cpu_wakeup_task->prio) ||
   892			    p->prio > curr->prio)
   893				goto out;
   894			if ((cpu_wakeup_task && p->prio == cpu_wakeup_task->prio) ||
   895			    p->prio == curr->prio)
   896				per_cpu(wakeup_sharedprio, cpu) = 1;
   897		}
   898	
   899		if (cpu_wakeup_task)
   900			put_task_struct(cpu_wakeup_task);
   901		cpu_wakeup_task = per_cpu(wakeup_task, cpu) = p;
   902		get_task_struct(cpu_wakeup_task);
   903		cpu_wakeup_task->preempt_timestamp_hist =
   904			ftrace_now(raw_smp_processor_id());
   905	out:
   906		raw_spin_unlock_irqrestore(&wakeup_lock, flags);
   907	}
   908	
   909	static notrace void probe_wakeup_latency_hist_stop(void *v,
   910		struct task_struct *prev, struct task_struct *next)
   911	{
   912		unsigned long flags;
   913		int cpu = task_cpu(next);
   914		long latency;
   915		cycle_t stop;
   916		struct task_struct *cpu_wakeup_task;
   917	
   918		raw_spin_lock_irqsave(&wakeup_lock, flags);
   919	
   920		cpu_wakeup_task = per_cpu(wakeup_task, cpu);
   921	
   922		if (cpu_wakeup_task == NULL)
   923			goto out;
   924	
   925		/* Already running? */
   926		if (unlikely(current == cpu_wakeup_task))
   927			goto out_reset;
   928	
   929		if (next != cpu_wakeup_task) {
   930			if (next->prio < cpu_wakeup_task->prio)
   931				goto out_reset;
   932	
   933			if (next->prio == cpu_wakeup_task->prio)
   934				per_cpu(wakeup_sharedprio, cpu) = 1;
   935	
   936			goto out;
   937		}
   938	
   939		if (current->prio == cpu_wakeup_task->prio)
   940			per_cpu(wakeup_sharedprio, cpu) = 1;
   941	
   942		/*
   943		 * The task we are waiting for is about to be switched to.
   944		 * Calculate latency and store it in histogram.
   945		 */
   946		stop = ftrace_now(raw_smp_processor_id());
   947	
   948		latency = ((long) (stop - next->preempt_timestamp_hist)) /
   949		    NSECS_PER_USECS;
   950	
   951		if (per_cpu(wakeup_sharedprio, cpu)) {
   952			latency_hist(WAKEUP_LATENCY_SHAREDPRIO, cpu, latency, 0, stop,
   953			    next);
   954			per_cpu(wakeup_sharedprio, cpu) = 0;
   955		} else {
   956			latency_hist(WAKEUP_LATENCY, cpu, latency, 0, stop, next);
   957	#ifdef CONFIG_MISSED_TIMER_OFFSETS_HIST
   958			if (timerandwakeup_enabled_data.enabled) {
   959				latency_hist(TIMERANDWAKEUP_LATENCY, cpu,
   960				    next->timer_offset + latency, next->timer_offset,
   961				    stop, next);
   962			}
   963	#endif
   964		}
   965	
   966	out_reset:
   967	#ifdef CONFIG_MISSED_TIMER_OFFSETS_HIST
   968		next->timer_offset = 0;
   969	#endif
   970		put_task_struct(cpu_wakeup_task);
   971		per_cpu(wakeup_task, cpu) = NULL;
   972	out:
   973		raw_spin_unlock_irqrestore(&wakeup_lock, flags);
   974	}
   975	#endif
   976	
   977	#ifdef CONFIG_MISSED_TIMER_OFFSETS_HIST
   978	static notrace void probe_hrtimer_interrupt(void *v, int cpu,
   979		long long latency_ns, struct task_struct *curr,
   980		struct task_struct *task)
   981	{
   982		if (latency_ns <= 0 && task != NULL && rt_task(task) &&
   983		    (task->prio < curr->prio ||
   984		    (task->prio == curr->prio &&
   985		    !cpumask_test_cpu(cpu, &task->cpus_allowed)))) {
   986			long latency;
   987			cycle_t now;
   988	
   989			if (missed_timer_offsets_pid) {
 > 990				if (likely(missed_timer_offsets_pid !=
   991				    task_pid_nr(task)))
   992					return;
   993			}
   994	
   995			now = ftrace_now(cpu);
   996			latency = (long) div_s64(-latency_ns, NSECS_PER_USECS);
   997			latency_hist(MISSED_TIMER_OFFSETS, cpu, latency, latency, now,
   998			    task);
   999	#ifdef CONFIG_WAKEUP_LATENCY_HIST
  1000			task->timer_offset = latency;
  1001	#endif
  1002		}
  1003	}
  1004	#endif
  1005	
  1006	static __init int latency_hist_init(void)
  1007	{
  1008		struct dentry *latency_hist_root = NULL;
  1009		struct dentry *dentry;
  1010	#ifdef CONFIG_WAKEUP_LATENCY_HIST
  1011		struct dentry *dentry_sharedprio;
  1012	#endif
> 1013		struct dentry *entry;
  1014		struct dentry *enable_root;
  1015		int i = 0;
  1016		struct hist_data *my_hist;
  1017		char name[64];
  1018		char *cpufmt = "CPU%d";
  1019	#if defined(CONFIG_WAKEUP_LATENCY_HIST) || \
  1020		defined(CONFIG_MISSED_TIMER_OFFSETS_HIST)
  1021		char *cpufmt_maxlatproc = "max_latency-CPU%d";
  1022		struct maxlatproc_data *mp = NULL;
  1023	#endif
  1024	
  1025		dentry = tracing_init_dentry();
  1026		latency_hist_root = debugfs_create_dir(latency_hist_dir_root, dentry);
  1027		enable_root = debugfs_create_dir("enable", latency_hist_root);
  1028	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
