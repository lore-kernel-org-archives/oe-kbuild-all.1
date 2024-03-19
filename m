Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EAE3BBCA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 07:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710833611; cv=none; b=g/KBe2mrqJuCvamD7IY3Nq0Qxf4M6nNIHMAUi+n/YQvrkD+YnEty4s69V71hcbX5jRtAioy6SU2uOwK4cHNuAjv76CFxrvyGXtTvsVgh0J7NHY4oYotLs6uI9DfYb6lVXOrbdNhF3+2RWv/5/T1McJXFVo6r9hUJmgEvr9Rz8CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710833611; c=relaxed/simple;
	bh=ai0l4fukJVWf6t3oHQoo4WI0xFXrFqSB+5hUuv5TjmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TVfdufUpXCqkQoBEwXKEpEKc4Bajl4QUafDz3GkP3T+a1qA4L7g3vFIbAH9NDJYFFKaLBHohOdyCNyVBX9UiiWfyKwiYbKotgtUwbkxvEKXzIDavAzuIPsHrhAsXpqZdV9IcocjtVvR71JZEB/c+eecDgWL3vsDycTlO9kG7whw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBinGh23; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBinGh23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710833610; x=1742369610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ai0l4fukJVWf6t3oHQoo4WI0xFXrFqSB+5hUuv5TjmE=;
  b=JBinGh23eugHuTB21H62ikWvRZMMJuHfnMURnPkIzHuKCER/9YCvigXT
   ABC3rjmdUdvj63iQ2vVukAHdI0qLyHQi/UwqDQKNi9N/qHhe6QLtF98+D
   0hPOBH7mxhWtK2lU0oydhtVqXO8JG9iir+9zgrquW4N6uQ0X9YpU/eD/D
   PeJbxa7t2YG0HkWiUzLA9ByHWhimSlCsZNfrTGTd0chDhNxpPs7Wt+ax0
   Rh71RKZC6Jl/u/u603NNEVgTyPXcDsfCtZWL4UppTNFch75gPg1JeYVUs
   YFAGnsJ5GXVU2/iBeUJOpBvF83UCDwA78WH32FclJkIq4F1vmiAXP+L6n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5533594"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5533594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 00:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="18442633"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Mar 2024 00:33:27 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmTyO-000HZj-0b;
	Tue, 19 Mar 2024 07:33:24 +0000
Date: Tue, 19 Mar 2024 15:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:b-4.4-st50-rt48 21/395] kernel/trace/latency_hist.c:158:14:
 warning: no previous prototype for 'latency_hist'
Message-ID: <202403191550.3gvJG9zw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git b-4.4-st50-rt48
head:   9721fc7815f56adca91f657c671845e73f895763
commit: 64dea772e67f15faba8c6ccd45b70b74d81e0469 [21/395] tracing: Add latency histograms
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240319/202403191550.3gvJG9zw-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403191550.3gvJG9zw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403191550.3gvJG9zw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arc/include/asm/bug.h:32,
                    from include/linux/bug.h:4,
                    from include/linux/thread_info.h:11,
                    from include/asm-generic/preempt.h:4,
                    from arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:59,
                    from include/linux/spinlock.h:50,
                    from include/linux/seqlock.h:35,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:18,
                    from include/linux/module.h:10,
                    from kernel/trace/latency_hist.c:16:
   include/linux/cpumask.h: In function 'cpumask_check':
   include/linux/cpumask.h:117:26: warning: comparison of integer expressions of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
     117 |         WARN_ON_ONCE(cpu >= nr_cpumask_bits);
         |                          ^~
   include/asm-generic/bug.h:112:34: note: in definition of macro 'WARN_ON_ONCE'
     112 |         int __ret_warn_once = !!(condition);                    \
         |                                  ^~~~~~~~~
   In file included from include/trace/events/hist.h:7,
                    from kernel/trace/latency_hist.c:34:
   include/trace/events/latency_hist.h: In function 'getaction':
   include/trace/events/latency_hist.h:24:35: warning: comparison of integer expressions of different signedness: 'int' and 'unsigned int' [-Wsign-compare]
      24 |         if (action >= 0 && action <= sizeof(actions)/sizeof(actions[0]))
         |                                   ^~
   kernel/trace/latency_hist.c: At top level:
>> kernel/trace/latency_hist.c:158:14: warning: no previous prototype for 'latency_hist' [-Wmissing-prototypes]
     158 | void notrace latency_hist(int latency_type, int cpu, long latency,
         |              ^~~~~~~~~~~~
   kernel/trace/latency_hist.c: In function 'do_enable':
   kernel/trace/latency_hist.c:582:29: warning: passing argument 1 of 'register_trace_sched_wakeup' from incompatible pointer type [-Wincompatible-pointer-types]
     582 |                             probe_wakeup_latency_hist_start, NULL);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             |
         |                             void (*)(void *, struct task_struct *, int)
   In file included from kernel/trace/trace.h:11,
                    from kernel/trace/latency_hist.c:28:
   include/linux/tracepoint.h:213:38: note: expected 'void (*)(void *, struct task_struct *)' but argument is of type 'void (*)(void *, struct task_struct *, int)'
     213 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:362:9: note: in expansion of macro '__DECLARE_TRACE'
     362 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:487:9: note: in expansion of macro 'DECLARE_TRACE'
     487 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/sched.h:95:1: note: in expansion of macro 'DEFINE_EVENT'
      95 | DEFINE_EVENT(sched_wakeup_template, sched_wakeup,
         | ^~~~~~~~~~~~
   kernel/trace/latency_hist.c:590:29: warning: passing argument 1 of 'register_trace_sched_wakeup_new' from incompatible pointer type [-Wincompatible-pointer-types]
     590 |                             probe_wakeup_latency_hist_start, NULL);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             |
         |                             void (*)(void *, struct task_struct *, int)
   include/linux/tracepoint.h:213:38: note: expected 'void (*)(void *, struct task_struct *)' but argument is of type 'void (*)(void *, struct task_struct *, int)'
     213 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:362:9: note: in expansion of macro '__DECLARE_TRACE'
     362 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:487:9: note: in expansion of macro 'DECLARE_TRACE'
     487 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/sched.h:102:1: note: in expansion of macro 'DEFINE_EVENT'
     102 | DEFINE_EVENT(sched_wakeup_template, sched_wakeup_new,
         | ^~~~~~~~~~~~
   kernel/trace/latency_hist.c:596:37: warning: passing argument 1 of 'unregister_trace_sched_wakeup' from incompatible pointer type [-Wincompatible-pointer-types]
     596 |                                     probe_wakeup_latency_hist_start, NULL);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     void (*)(void *, struct task_struct *, int)
   include/linux/tracepoint.h:226:40: note: expected 'void (*)(void *, struct task_struct *)' but argument is of type 'void (*)(void *, struct task_struct *, int)'
     226 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:362:9: note: in expansion of macro '__DECLARE_TRACE'
     362 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:487:9: note: in expansion of macro 'DECLARE_TRACE'
     487 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/sched.h:95:1: note: in expansion of macro 'DEFINE_EVENT'
      95 | DEFINE_EVENT(sched_wakeup_template, sched_wakeup,
         | ^~~~~~~~~~~~
   kernel/trace/latency_hist.c:600:29: warning: passing argument 1 of 'register_trace_sched_switch' from incompatible pointer type [-Wincompatible-pointer-types]
     600 |                             probe_wakeup_latency_hist_stop, NULL);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             |
         |                             void (*)(void *, struct task_struct *, struct task_struct *)
   include/linux/tracepoint.h:213:38: note: expected 'void (*)(void *, bool,  struct task_struct *, struct task_struct *)' {aka 'void (*)(void *, _Bool,  struct task_struct *, struct task_struct *)'} but argument is of type 'void (*)(void *, struct task_struct *, struct task_struct *)'
     213 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:362:9: note: in expansion of macro '__DECLARE_TRACE'
     362 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:498:9: note: in expansion of macro 'DECLARE_TRACE'
     498 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/sched.h:124:1: note: in expansion of macro 'TRACE_EVENT'
     124 | TRACE_EVENT(sched_switch,
         | ^~~~~~~~~~~
   kernel/trace/latency_hist.c:606:37: warning: passing argument 1 of 'unregister_trace_sched_wakeup' from incompatible pointer type [-Wincompatible-pointer-types]
     606 |                                     probe_wakeup_latency_hist_start, NULL);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     void (*)(void *, struct task_struct *, int)
   include/linux/tracepoint.h:226:40: note: expected 'void (*)(void *, struct task_struct *)' but argument is of type 'void (*)(void *, struct task_struct *, int)'
     226 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:362:9: note: in expansion of macro '__DECLARE_TRACE'
     362 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:487:9: note: in expansion of macro 'DECLARE_TRACE'
     487 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/sched.h:95:1: note: in expansion of macro 'DEFINE_EVENT'
      95 | DEFINE_EVENT(sched_wakeup_template, sched_wakeup,
         | ^~~~~~~~~~~~
   kernel/trace/latency_hist.c:608:37: warning: passing argument 1 of 'unregister_trace_sched_wakeup_new' from incompatible pointer type [-Wincompatible-pointer-types]
     608 |                                     probe_wakeup_latency_hist_start, NULL);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     void (*)(void *, struct task_struct *, int)
   include/linux/tracepoint.h:226:40: note: expected 'void (*)(void *, struct task_struct *)' but argument is of type 'void (*)(void *, struct task_struct *, int)'
     226 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:362:9: note: in expansion of macro '__DECLARE_TRACE'
     362 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \


vim +/latency_hist +158 kernel/trace/latency_hist.c

   157	
 > 158	void notrace latency_hist(int latency_type, int cpu, long latency,
   159				  long timeroffset, cycle_t stop,
   160				  struct task_struct *p)
   161	{
   162		struct hist_data *my_hist;
   163	#if defined(CONFIG_WAKEUP_LATENCY_HIST) || \
   164		defined(CONFIG_MISSED_TIMER_OFFSETS_HIST)
   165		struct maxlatproc_data *mp = NULL;
   166	#endif
   167	
   168		if (!cpu_possible(cpu) || latency_type < 0 ||
   169		    latency_type >= MAX_LATENCY_TYPE)
   170			return;
   171	
   172		switch (latency_type) {
   173	#ifdef CONFIG_INTERRUPT_OFF_HIST
   174		case IRQSOFF_LATENCY:
   175			my_hist = &per_cpu(irqsoff_hist, cpu);
   176			break;
   177	#endif
   178	#ifdef CONFIG_PREEMPT_OFF_HIST
   179		case PREEMPTOFF_LATENCY:
   180			my_hist = &per_cpu(preemptoff_hist, cpu);
   181			break;
   182	#endif
   183	#if defined(CONFIG_PREEMPT_OFF_HIST) && defined(CONFIG_INTERRUPT_OFF_HIST)
   184		case PREEMPTIRQSOFF_LATENCY:
   185			my_hist = &per_cpu(preemptirqsoff_hist, cpu);
   186			break;
   187	#endif
   188	#ifdef CONFIG_WAKEUP_LATENCY_HIST
   189		case WAKEUP_LATENCY:
   190			my_hist = &per_cpu(wakeup_latency_hist, cpu);
   191			mp = &per_cpu(wakeup_maxlatproc, cpu);
   192			break;
   193		case WAKEUP_LATENCY_SHAREDPRIO:
   194			my_hist = &per_cpu(wakeup_latency_hist_sharedprio, cpu);
   195			mp = &per_cpu(wakeup_maxlatproc_sharedprio, cpu);
   196			break;
   197	#endif
   198	#ifdef CONFIG_MISSED_TIMER_OFFSETS_HIST
   199		case MISSED_TIMER_OFFSETS:
   200			my_hist = &per_cpu(missed_timer_offsets, cpu);
   201			mp = &per_cpu(missed_timer_offsets_maxlatproc, cpu);
   202			break;
   203	#endif
   204	#if defined(CONFIG_WAKEUP_LATENCY_HIST) && \
   205		defined(CONFIG_MISSED_TIMER_OFFSETS_HIST)
   206		case TIMERANDWAKEUP_LATENCY:
   207			my_hist = &per_cpu(timerandwakeup_latency_hist, cpu);
   208			mp = &per_cpu(timerandwakeup_maxlatproc, cpu);
   209			break;
   210	#endif
   211	
   212		default:
   213			return;
   214		}
   215	
   216		latency += my_hist->offset;
   217	
   218		if (atomic_read(&my_hist->hist_mode) == 0)
   219			return;
   220	
   221		if (latency < 0 || latency >= MAX_ENTRY_NUM) {
   222			if (latency < 0)
   223				my_hist->below_hist_bound_samples++;
   224			else
   225				my_hist->above_hist_bound_samples++;
   226		} else
   227			my_hist->hist_array[latency]++;
   228	
   229		if (unlikely(latency > my_hist->max_lat ||
   230		    my_hist->min_lat == LONG_MAX)) {
   231	#if defined(CONFIG_WAKEUP_LATENCY_HIST) || \
   232		defined(CONFIG_MISSED_TIMER_OFFSETS_HIST)
   233			if (latency_type == WAKEUP_LATENCY ||
   234			    latency_type == WAKEUP_LATENCY_SHAREDPRIO ||
   235			    latency_type == MISSED_TIMER_OFFSETS ||
   236			    latency_type == TIMERANDWAKEUP_LATENCY) {
   237				strncpy(mp->comm, p->comm, sizeof(mp->comm));
   238				strncpy(mp->current_comm, current->comm,
   239				    sizeof(mp->current_comm));
   240				mp->pid = task_pid_nr(p);
   241				mp->current_pid = task_pid_nr(current);
   242				mp->prio = p->prio;
   243				mp->current_prio = current->prio;
   244				mp->latency = latency;
   245				mp->timeroffset = timeroffset;
   246				mp->timestamp = stop;
   247			}
   248	#endif
   249			my_hist->max_lat = latency;
   250		}
   251		if (unlikely(latency < my_hist->min_lat))
   252			my_hist->min_lat = latency;
   253		my_hist->total_samples++;
   254		my_hist->accumulate_lat += latency;
   255	}
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
