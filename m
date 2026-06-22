Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267943A9D8D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782131503; cv=none; b=O84bcCkTWoqAA1IIDx43sA96FE14IRhqk4N2qH7lkHI7gjdywGQUHUBe1HUpDffFckseC1sL4xBxKKqZ+CPag9r+tMV8NYOpoLQ7sFiu7865lBp/cxvD6dIM0IekfnWCIBgHWeZpwcXUjK2AGwD3qo8rbSQBEy1FqnNKR9Fjzq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782131503; c=relaxed/simple;
	bh=BIFVnWwX5HIwYgQ2rUOiZs5B/olEux9vLvpXOsDEvh8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gUT5cELxFyG3KIT2n4Z2War6oMflnME7uxyLr0EvNhBmkm7ejxVfEkfjgDotWDP8zrs7D20xi8RM8AqzxBPth1qUcREkeXc1j7UpJ14wPRZsA0qbM+uhgQovsL06UbE7YPjLiEYZfHiPfcfeESHGhe6ibanEdYvMVWwyzE8zUvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXNMyptg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXNMyptg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782131500; x=1813667500;
  h=date:from:to:cc:subject:message-id;
  bh=BIFVnWwX5HIwYgQ2rUOiZs5B/olEux9vLvpXOsDEvh8=;
  b=UXNMyptgQXQ3MFFEDbdov+1tiDOHU0rr1I31+O02hUwZxucYO+/GybOI
   8y8e1MEYlZQn/j65kJFKXd5/OgEjGwdp/F0hACpefMV20uCzN2MquGiP0
   Ii8Is/nhuus1qNTbkP4rzs/sW0uOSJvnI9YGisbm5ot65liszZ0s/nDiD
   nP+K005AnO1ogVhvbX8kdheA+dx7tcpKtOEoXrAovpYSx1pOK7iQGowYX
   l2ZCEVv4tIU7EygMiSc5zJOXb55Tg3qRPxqcbWoEGsvV1FgsyeYAqaFT0
   XEKuTATSUIRfZ5davu4rmh1Ztjl+WwGjhxgleQE8a7ZK6wscxIPkxgruz
   A==;
X-CSE-ConnectionGUID: Tafn4TDVRZG8djeTnxjJkw==
X-CSE-MsgGUID: mZ853JFVTUiQV2ujkLvnSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93973569"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="93973569"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 05:31:40 -0700
X-CSE-ConnectionGUID: cdIMT/vMTWWIXgkkCGGkgw==
X-CSE-MsgGUID: 0DWXXS/4SYSyUD5zKkzW0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="251138963"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2026 05:31:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbdoJ-0000000018s-0a3W;
	Mon, 22 Jun 2026 12:31:32 +0000
Date: Mon, 22 Jun 2026 20:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian Brauner (Amutable)" <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>
Subject: init/init_task.c:125:28: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202606222031.BbKqRA55-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: 6b1c66c9cca99bf00386481c7b2aa7394c26d8b8 exec_state: relocate dumpable information
date:   4 weeks ago
config: um-randconfig-r132-20260622 (https://download.01.org/0day-ci/archive/20260622/202606222031.BbKqRA55-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222031.BbKqRA55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6b1c66c9cca9 ("exec_state: relocate dumpable information")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222031.BbKqRA55-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> init/init_task.c:125:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_exec_state [noderef] __rcu *exec_state @@     got struct task_exec_state * @@
   init/init_task.c:125:28: sparse:     expected struct task_exec_state [noderef] __rcu *exec_state
   init/init_task.c:125:28: sparse:     got struct task_exec_state *
   init/init_task.c:156:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   init/init_task.c:156:28: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   init/init_task.c:156:28: sparse:     got struct task_struct *
   init/init_task.c:157:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct [noderef] __rcu *parent @@     got struct task_struct * @@
   init/init_task.c:157:28: sparse:     expected struct task_struct [noderef] __rcu *parent
   init/init_task.c:157:28: sparse:     got struct task_struct *
   init/init_task.c:171:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct [noderef] __rcu *sighand @@     got struct sighand_struct * @@
   init/init_task.c:171:28: sparse:     expected struct sighand_struct [noderef] __rcu *sighand
   init/init_task.c:171:28: sparse:     got struct sighand_struct *

vim +125 init/init_task.c

   100	
   101	/*
   102	 * Set up the first task table, touch at your own risk!. Base=0,
   103	 * limit=0x1fffff (=2MB)
   104	 */
   105	struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
   106	#ifdef CONFIG_THREAD_INFO_IN_TASK
   107		.thread_info	= INIT_THREAD_INFO(init_task),
   108		.stack_refcount	= REFCOUNT_INIT(1),
   109	#endif
   110		.__state	= 0,
   111		.stack		= init_stack,
   112		.usage		= REFCOUNT_INIT(2),
   113		.flags		= PF_KTHREAD,
   114		.prio		= MAX_PRIO - 20,
   115		.static_prio	= MAX_PRIO - 20,
   116		.normal_prio	= MAX_PRIO - 20,
   117		.policy		= SCHED_NORMAL,
   118		.cpus_ptr	= &init_task.cpus_mask,
   119		.user_cpus_ptr	= NULL,
   120		.cpus_mask	= CPU_MASK_ALL,
   121		.max_allowed_capacity	= SCHED_CAPACITY_SCALE,
   122		.nr_cpus_allowed= NR_CPUS,
   123		.mm		= NULL,
   124		.active_mm	= &init_mm,
 > 125		.exec_state	= &init_task_exec_state,
   126		.restart_block	= {
   127			.fn = do_no_restart_syscall,
   128		},
   129		.se		= {
   130			.group_node 	= LIST_HEAD_INIT(init_task.se.group_node),
   131		},
   132		.rt		= {
   133			.run_list	= LIST_HEAD_INIT(init_task.rt.run_list),
   134			.time_slice	= RR_TIMESLICE,
   135		},
   136		.tasks		= LIST_HEAD_INIT(init_task.tasks),
   137	#ifdef CONFIG_SMP
   138		.pushable_tasks	= PLIST_NODE_INIT(init_task.pushable_tasks, MAX_PRIO),
   139	#endif
   140	#ifdef CONFIG_CGROUP_SCHED
   141		.sched_task_group = &root_task_group,
   142	#endif
   143	#ifdef CONFIG_SCHED_CLASS_EXT
   144		.scx		= {
   145			.dsq_list.node	= LIST_HEAD_INIT(init_task.scx.dsq_list.node),
   146			.sticky_cpu	= -1,
   147			.holding_cpu	= -1,
   148			.runnable_node	= LIST_HEAD_INIT(init_task.scx.runnable_node),
   149			.runnable_at	= INITIAL_JIFFIES,
   150			.ddsp_dsq_id	= SCX_DSQ_INVALID,
   151			.slice		= SCX_SLICE_DFL,
   152		},
   153	#endif
   154		.ptraced	= LIST_HEAD_INIT(init_task.ptraced),
   155		.ptrace_entry	= LIST_HEAD_INIT(init_task.ptrace_entry),
   156		.real_parent	= &init_task,
   157		.parent		= &init_task,
   158		.children	= LIST_HEAD_INIT(init_task.children),
   159		.sibling	= LIST_HEAD_INIT(init_task.sibling),
   160		.group_leader	= &init_task,
   161		RCU_POINTER_INITIALIZER(real_cred, &init_cred),
   162		RCU_POINTER_INITIALIZER(cred, &init_cred),
   163		.comm		= INIT_TASK_COMM,
   164		.thread		= INIT_THREAD,
   165		.fs		= &init_fs,
   166		.files		= &init_files,
   167	#ifdef CONFIG_IO_URING
   168		.io_uring	= NULL,
   169	#endif
   170		.signal		= &init_signals,
   171		.sighand	= &init_sighand,
   172		.nsproxy	= &init_nsproxy,
   173		.pending	= {
   174			.list = LIST_HEAD_INIT(init_task.pending.list),
   175			.signal = {{0}}
   176		},
   177		.blocked	= {{0}},
   178		.alloc_lock	= __SPIN_LOCK_UNLOCKED(init_task.alloc_lock),
   179		.journal_info	= NULL,
   180		INIT_CPU_TIMERS(init_task)
   181		.pi_lock	= __RAW_SPIN_LOCK_UNLOCKED(init_task.pi_lock),
   182		.blocked_lock	= __RAW_SPIN_LOCK_UNLOCKED(init_task.blocked_lock),
   183		.timer_slack_ns = 50000, /* 50 usec default slack */
   184		.thread_pid	= &init_struct_pid,
   185		.thread_node	= LIST_HEAD_INIT(init_signals.thread_head),
   186	#ifdef CONFIG_AUDIT
   187		.loginuid	= INVALID_UID,
   188		.sessionid	= AUDIT_SID_UNSET,
   189	#endif
   190	#ifdef CONFIG_PERF_EVENTS
   191		.perf_event_mutex = __MUTEX_INITIALIZER(init_task.perf_event_mutex),
   192		.perf_event_list = LIST_HEAD_INIT(init_task.perf_event_list),
   193	#endif
   194	#ifdef CONFIG_PREEMPT_RCU
   195		.rcu_read_lock_nesting = 0,
   196		.rcu_read_unlock_special.s = 0,
   197		.rcu_node_entry = LIST_HEAD_INIT(init_task.rcu_node_entry),
   198		.rcu_blocked_node = NULL,
   199	#endif
   200	#ifdef CONFIG_TASKS_RCU
   201		.rcu_tasks_holdout = false,
   202		.rcu_tasks_holdout_list = LIST_HEAD_INIT(init_task.rcu_tasks_holdout_list),
   203		.rcu_tasks_idle_cpu = -1,
   204		.rcu_tasks_exit_list = LIST_HEAD_INIT(init_task.rcu_tasks_exit_list),
   205	#endif
   206	#ifdef CONFIG_TASKS_TRACE_RCU
   207		.trc_reader_nesting = 0,
   208	#endif
   209	#ifdef CONFIG_CPUSETS
   210		.mems_allowed_seq = SEQCNT_SPINLOCK_ZERO(init_task.mems_allowed_seq,
   211							 &init_task.alloc_lock),
   212	#endif
   213	#ifdef CONFIG_RT_MUTEXES
   214		.pi_waiters	= RB_ROOT_CACHED,
   215		.pi_top_task	= NULL,
   216	#endif
   217		INIT_PREV_CPUTIME(init_task)
   218	#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
   219		.vtime.seqcount	= SEQCNT_ZERO(init_task.vtime_seqcount),
   220		.vtime.starttime = 0,
   221		.vtime.state	= VTIME_SYS,
   222	#endif
   223	#ifdef CONFIG_NUMA_BALANCING
   224		.numa_preferred_nid = NUMA_NO_NODE,
   225		.numa_group	= NULL,
   226		.numa_faults	= NULL,
   227	#endif
   228	#if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
   229		.kasan_depth	= 1,
   230	#endif
   231	#ifdef CONFIG_KCSAN
   232		.kcsan_ctx = {
   233			.scoped_accesses	= {LIST_POISON1, NULL},
   234		},
   235	#endif
   236	#ifdef CONFIG_TRACE_IRQFLAGS
   237		.softirqs_enabled = 1,
   238	#endif
   239	#ifdef CONFIG_LOCKDEP
   240		.lockdep_depth = 0, /* no locks held yet */
   241		.curr_chain_key = INITIAL_CHAIN_KEY,
   242		.lockdep_recursion = 0,
   243	#endif
   244	#ifdef CONFIG_FUNCTION_GRAPH_TRACER
   245		.ret_stack		= NULL,
   246		.tracing_graph_pause	= ATOMIC_INIT(0),
   247	#endif
   248	#if defined(CONFIG_TRACING) && defined(CONFIG_PREEMPTION)
   249		.trace_recursion = 0,
   250	#endif
   251	#ifdef CONFIG_LIVEPATCH
   252		.patch_state	= KLP_TRANSITION_IDLE,
   253	#endif
   254	#ifdef CONFIG_SECURITY
   255		.security	= NULL,
   256	#endif
   257	#ifdef CONFIG_SECCOMP_FILTER
   258		.seccomp	= { .filter_count = ATOMIC_INIT(0) },
   259	#endif
   260	#ifdef CONFIG_SCHED_MM_CID
   261		.mm_cid		= { .cid = MM_CID_UNSET, },
   262	#endif
   263	};
   264	EXPORT_SYMBOL(init_task);
   265	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
