Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C94738DC47
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 03:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786507083; cv=none; b=k3OsWFPLwGMF5Ca3NrB+VJzKg0Hlf++h4FBlXXKjgBw8Obj2kgwjjirSP5bBa4op1vOs2mLq4UzBazX98JxopzEYQxiQYEUd4L44s1LWpfytKGjTAmZoj21z50BifXrYLhNt8pCFpf2hd8tDRWViwNq20VbxehYE32Mye/EicFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786507083; c=relaxed/simple;
	bh=mh++83Tv+pjgv85suT+8DkjDFn4SaV1bJ/2MGDDBZpI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C2j0cKSKEUrl5l9aEbW+l7nA9GCNhInYoLsxxTYNE7DzvCrbC8/kDNeVkM/5WH8sC9x6BUiBgzyXEkBmshLrA3f75pD5qO0LjF/LprRBImorpltgII81jjoo5mkkGqwWjIiBDbfZqPr/xDwyV7NT8Gx4E0/75agG6cFmngMRdlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsbR3m5A; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsbR3m5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786507082; x=1818043082;
  h=date:from:to:cc:subject:message-id;
  bh=mh++83Tv+pjgv85suT+8DkjDFn4SaV1bJ/2MGDDBZpI=;
  b=HsbR3m5AwUs9LScvgbDGZu7d695lPrGT+Keu/0IwAZ0JCX0PoFE7NuZO
   1JBPeLOSCqIaHK9Nf3bs9gmxptPSdIGHATXzBU7uetilglIWwhmuoukFE
   N0LX9ow03UakLYMrXFnnjQ9ZMVIxcn8VIOcpQn61MMvoSVYeM3IJCk090
   WY1X8biWayVjNZpqPc5LU/6RZl64A4rzW+GS72RciZR0fu3hZlwDahU7j
   y2N8f/OFNXEW+u0R6H8J/XzZOf0mLZYEa92Gqor3UtcaCCXry6Q0EJUNK
   IYFoLXdvwwxykvSmlaw0FalJVgGxzfPzFTt36GkfZma7xHR0pXz1tsLhe
   Q==;
X-CSE-ConnectionGUID: +UlBwV8ZSUmUT1G2Pi3kVQ==
X-CSE-MsgGUID: PeJ/SGrlRdCIIVaQsXWCVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="90725561"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="90725561"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 20:58:01 -0700
X-CSE-ConnectionGUID: G2A0D0jQSMWfB01QpdiWZw==
X-CSE-MsgGUID: F0CNfVHWQgWBmto8kMyptg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="288240756"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Aug 2026 20:57:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu06G-00000000Ple-1YAE;
	Wed, 12 Aug 2026 03:57:56 +0000
Date: Wed, 12 Aug 2026 11:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jann Horn <jannh@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linuxsecuritymodule:dev-staging 5/5]
 init/init_task.c:162:9: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202608121153.nzs6HZg7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LinuxSecurityModule/kernel dev-staging
head:   a4229a2a16a80bd4b46202aacf041c495b4886b6
commit: a4229a2a16a80bd4b46202aacf041c495b4886b6 [5/5] cred: clarify that task_struct::cred is only for the current task
config: csky-randconfig-r132-20260812 (https://download.01.org/0day-ci/archive/20260812/202608121153.nzs6HZg7-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608121153.nzs6HZg7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608121153.nzs6HZg7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   init/init_task.c:125:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_exec_state [noderef] __rcu *exec_state @@     got struct task_exec_state * @@
   init/init_task.c:125:28: sparse:     expected struct task_exec_state [noderef] __rcu *exec_state
   init/init_task.c:125:28: sparse:     got struct task_exec_state *
   init/init_task.c:156:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   init/init_task.c:156:28: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   init/init_task.c:156:28: sparse:     got struct task_struct *
   init/init_task.c:157:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct [noderef] __rcu *parent @@     got struct task_struct * @@
   init/init_task.c:157:28: sparse:     expected struct task_struct [noderef] __rcu *parent
   init/init_task.c:157:28: sparse:     got struct task_struct *
>> init/init_task.c:162:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *cred @@     got struct cred [noderef] __rcu * @@
   init/init_task.c:162:9: sparse:     expected struct cred const *cred
   init/init_task.c:162:9: sparse:     got struct cred [noderef] __rcu *
   init/init_task.c:171:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct [noderef] __rcu *sighand @@     got struct sighand_struct * @@
   init/init_task.c:171:28: sparse:     expected struct sighand_struct [noderef] __rcu *sighand
   init/init_task.c:171:28: sparse:     got struct sighand_struct *

vim +162 init/init_task.c

40314c2818b700 Christian Brauner            2025-11-03  100  
d11ed3ab3166a2 David Howells                2018-01-02  101  /*
d11ed3ab3166a2 David Howells                2018-01-02  102   * Set up the first task table, touch at your own risk!. Base=0,
d11ed3ab3166a2 David Howells                2018-01-02  103   * limit=0x1fffff (=2MB)
d11ed3ab3166a2 David Howells                2018-01-02  104   */
0eb5085c38749f Heiko Carstens               2023-11-16  105  struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
4e7e3adbba5224 David Howells                2018-01-02  106  #ifdef CONFIG_THREAD_INFO_IN_TASK
4e7e3adbba5224 David Howells                2018-01-02  107  	.thread_info	= INIT_THREAD_INFO(init_task),
f0b89d3958d73c Elena Reshetova              2019-01-18  108  	.stack_refcount	= REFCOUNT_INIT(1),
4e7e3adbba5224 David Howells                2018-01-02  109  #endif
2f064a59a11ff9 Peter Zijlstra               2021-06-11  110  	.__state	= 0,
d11ed3ab3166a2 David Howells                2018-01-02  111  	.stack		= init_stack,
ec1d281923cf81 Elena Reshetova              2019-01-18  112  	.usage		= REFCOUNT_INIT(2),
d11ed3ab3166a2 David Howells                2018-01-02  113  	.flags		= PF_KTHREAD,
d11ed3ab3166a2 David Howells                2018-01-02  114  	.prio		= MAX_PRIO - 20,
d11ed3ab3166a2 David Howells                2018-01-02  115  	.static_prio	= MAX_PRIO - 20,
d11ed3ab3166a2 David Howells                2018-01-02  116  	.normal_prio	= MAX_PRIO - 20,
d11ed3ab3166a2 David Howells                2018-01-02  117  	.policy		= SCHED_NORMAL,
3bd3706251ee8a Sebastian Andrzej Siewior    2019-04-23  118  	.cpus_ptr	= &init_task.cpus_mask,
b90ca8badbd114 Will Deacon                  2021-07-30  119  	.user_cpus_ptr	= NULL,
3bd3706251ee8a Sebastian Andrzej Siewior    2019-04-23  120  	.cpus_mask	= CPU_MASK_ALL,
22d5607400c62c Qais Yousef                  2024-03-24  121  	.max_allowed_capacity	= SCHED_CAPACITY_SCALE,
d11ed3ab3166a2 David Howells                2018-01-02  122  	.nr_cpus_allowed= NR_CPUS,
d11ed3ab3166a2 David Howells                2018-01-02  123  	.mm		= NULL,
d11ed3ab3166a2 David Howells                2018-01-02  124  	.active_mm	= &init_mm,
6b1c66c9cca99b Christian Brauner (Amutable  2026-05-20 @125) 	.exec_state	= &init_task_exec_state,
d11ed3ab3166a2 David Howells                2018-01-02  126  	.restart_block	= {
d11ed3ab3166a2 David Howells                2018-01-02  127  		.fn = do_no_restart_syscall,
d11ed3ab3166a2 David Howells                2018-01-02  128  	},
d11ed3ab3166a2 David Howells                2018-01-02  129  	.se		= {
d11ed3ab3166a2 David Howells                2018-01-02  130  		.group_node 	= LIST_HEAD_INIT(init_task.se.group_node),
d11ed3ab3166a2 David Howells                2018-01-02  131  	},
d11ed3ab3166a2 David Howells                2018-01-02  132  	.rt		= {
d11ed3ab3166a2 David Howells                2018-01-02  133  		.run_list	= LIST_HEAD_INIT(init_task.rt.run_list),
d11ed3ab3166a2 David Howells                2018-01-02  134  		.time_slice	= RR_TIMESLICE,
d11ed3ab3166a2 David Howells                2018-01-02  135  	},
d11ed3ab3166a2 David Howells                2018-01-02  136  	.tasks		= LIST_HEAD_INIT(init_task.tasks),
4e7e3adbba5224 David Howells                2018-01-02  137  #ifdef CONFIG_SMP
4e7e3adbba5224 David Howells                2018-01-02  138  	.pushable_tasks	= PLIST_NODE_INIT(init_task.pushable_tasks, MAX_PRIO),
4e7e3adbba5224 David Howells                2018-01-02  139  #endif
4e7e3adbba5224 David Howells                2018-01-02  140  #ifdef CONFIG_CGROUP_SCHED
4e7e3adbba5224 David Howells                2018-01-02  141  	.sched_task_group = &root_task_group,
f0e1a0643a59bf Tejun Heo                    2024-06-18  142  #endif
f0e1a0643a59bf Tejun Heo                    2024-06-18  143  #ifdef CONFIG_SCHED_CLASS_EXT
f0e1a0643a59bf Tejun Heo                    2024-06-18  144  	.scx		= {
d4af01c3731ff9 Tejun Heo                    2024-07-08  145  		.dsq_list.node	= LIST_HEAD_INIT(init_task.scx.dsq_list.node),
f0e1a0643a59bf Tejun Heo                    2024-06-18  146  		.sticky_cpu	= -1,
f0e1a0643a59bf Tejun Heo                    2024-06-18  147  		.holding_cpu	= -1,
f0e1a0643a59bf Tejun Heo                    2024-06-18  148  		.runnable_node	= LIST_HEAD_INIT(init_task.scx.runnable_node),
8a010b81b3a50b David Vernet                 2024-06-18  149  		.runnable_at	= INITIAL_JIFFIES,
f0e1a0643a59bf Tejun Heo                    2024-06-18  150  		.ddsp_dsq_id	= SCX_DSQ_INVALID,
f0e1a0643a59bf Tejun Heo                    2024-06-18  151  		.slice		= SCX_SLICE_DFL,
f0e1a0643a59bf Tejun Heo                    2024-06-18  152  	},
4e7e3adbba5224 David Howells                2018-01-02  153  #endif
d11ed3ab3166a2 David Howells                2018-01-02  154  	.ptraced	= LIST_HEAD_INIT(init_task.ptraced),
d11ed3ab3166a2 David Howells                2018-01-02  155  	.ptrace_entry	= LIST_HEAD_INIT(init_task.ptrace_entry),
d11ed3ab3166a2 David Howells                2018-01-02  156  	.real_parent	= &init_task,
d11ed3ab3166a2 David Howells                2018-01-02  157  	.parent		= &init_task,
d11ed3ab3166a2 David Howells                2018-01-02  158  	.children	= LIST_HEAD_INIT(init_task.children),
d11ed3ab3166a2 David Howells                2018-01-02  159  	.sibling	= LIST_HEAD_INIT(init_task.sibling),
d11ed3ab3166a2 David Howells                2018-01-02  160  	.group_leader	= &init_task,
d11ed3ab3166a2 David Howells                2018-01-02  161  	RCU_POINTER_INITIALIZER(real_cred, &init_cred),
d11ed3ab3166a2 David Howells                2018-01-02 @162  	RCU_POINTER_INITIALIZER(cred, &init_cred),
d11ed3ab3166a2 David Howells                2018-01-02  163  	.comm		= INIT_TASK_COMM,
d11ed3ab3166a2 David Howells                2018-01-02  164  	.thread		= INIT_THREAD,
d11ed3ab3166a2 David Howells                2018-01-02  165  	.fs		= &init_fs,
d11ed3ab3166a2 David Howells                2018-01-02  166  	.files		= &init_files,
0f2122045b9462 Jens Axboe                   2020-09-13  167  #ifdef CONFIG_IO_URING
0f2122045b9462 Jens Axboe                   2020-09-13  168  	.io_uring	= NULL,
0f2122045b9462 Jens Axboe                   2020-09-13  169  #endif
d11ed3ab3166a2 David Howells                2018-01-02  170  	.signal		= &init_signals,
d11ed3ab3166a2 David Howells                2018-01-02  171  	.sighand	= &init_sighand,
d11ed3ab3166a2 David Howells                2018-01-02  172  	.nsproxy	= &init_nsproxy,
d11ed3ab3166a2 David Howells                2018-01-02  173  	.pending	= {
d11ed3ab3166a2 David Howells                2018-01-02  174  		.list = LIST_HEAD_INIT(init_task.pending.list),
d11ed3ab3166a2 David Howells                2018-01-02  175  		.signal = {{0}}
d11ed3ab3166a2 David Howells                2018-01-02  176  	},
d11ed3ab3166a2 David Howells                2018-01-02  177  	.blocked	= {{0}},
d11ed3ab3166a2 David Howells                2018-01-02  178  	.alloc_lock	= __SPIN_LOCK_UNLOCKED(init_task.alloc_lock),
d11ed3ab3166a2 David Howells                2018-01-02  179  	.journal_info	= NULL,
d11ed3ab3166a2 David Howells                2018-01-02  180  	INIT_CPU_TIMERS(init_task)
d11ed3ab3166a2 David Howells                2018-01-02  181  	.pi_lock	= __RAW_SPIN_LOCK_UNLOCKED(init_task.pi_lock),
fa4a1ff8ab235a John Stultz                  2026-03-24  182  	.blocked_lock	= __RAW_SPIN_LOCK_UNLOCKED(init_task.blocked_lock),
d11ed3ab3166a2 David Howells                2018-01-02  183  	.timer_slack_ns = 50000, /* 50 usec default slack */
2c4704756cab7c Eric W. Biederman            2017-09-26  184  	.thread_pid	= &init_struct_pid,
d11ed3ab3166a2 David Howells                2018-01-02  185  	.thread_node	= LIST_HEAD_INIT(init_signals.thread_head),
4b7d248b3a1de4 Richard Guy Briggs           2019-01-22  186  #ifdef CONFIG_AUDIT
4e7e3adbba5224 David Howells                2018-01-02  187  	.loginuid	= INVALID_UID,
f0b752168d7091 Richard Guy Briggs           2018-05-12  188  	.sessionid	= AUDIT_SID_UNSET,
4e7e3adbba5224 David Howells                2018-01-02  189  #endif
4e7e3adbba5224 David Howells                2018-01-02  190  #ifdef CONFIG_PERF_EVENTS
4e7e3adbba5224 David Howells                2018-01-02  191  	.perf_event_mutex = __MUTEX_INITIALIZER(init_task.perf_event_mutex),
4e7e3adbba5224 David Howells                2018-01-02  192  	.perf_event_list = LIST_HEAD_INIT(init_task.perf_event_list),
4e7e3adbba5224 David Howells                2018-01-02  193  #endif
4e7e3adbba5224 David Howells                2018-01-02  194  #ifdef CONFIG_PREEMPT_RCU
4e7e3adbba5224 David Howells                2018-01-02  195  	.rcu_read_lock_nesting = 0,
4e7e3adbba5224 David Howells                2018-01-02  196  	.rcu_read_unlock_special.s = 0,
4e7e3adbba5224 David Howells                2018-01-02  197  	.rcu_node_entry = LIST_HEAD_INIT(init_task.rcu_node_entry),
4e7e3adbba5224 David Howells                2018-01-02  198  	.rcu_blocked_node = NULL,
4e7e3adbba5224 David Howells                2018-01-02  199  #endif
4e7e3adbba5224 David Howells                2018-01-02  200  #ifdef CONFIG_TASKS_RCU
4e7e3adbba5224 David Howells                2018-01-02  201  	.rcu_tasks_holdout = false,
4e7e3adbba5224 David Howells                2018-01-02  202  	.rcu_tasks_holdout_list = LIST_HEAD_INIT(init_task.rcu_tasks_holdout_list),
4e7e3adbba5224 David Howells                2018-01-02  203  	.rcu_tasks_idle_cpu = -1,
46faf9d8e1d52e Paul E. McKenney             2024-02-05  204  	.rcu_tasks_exit_list = LIST_HEAD_INIT(init_task.rcu_tasks_exit_list),
4e7e3adbba5224 David Howells                2018-01-02  205  #endif
d5f177d35c2442 Paul E. McKenney             2020-03-09  206  #ifdef CONFIG_TASKS_TRACE_RCU
d5f177d35c2442 Paul E. McKenney             2020-03-09  207  	.trc_reader_nesting = 0,
d5f177d35c2442 Paul E. McKenney             2020-03-09  208  #endif
4e7e3adbba5224 David Howells                2018-01-02  209  #ifdef CONFIG_CPUSETS
b75058614fdd31 Ahmed S. Darwish             2020-07-20  210  	.mems_allowed_seq = SEQCNT_SPINLOCK_ZERO(init_task.mems_allowed_seq,
b75058614fdd31 Ahmed S. Darwish             2020-07-20  211  						 &init_task.alloc_lock),
4e7e3adbba5224 David Howells                2018-01-02  212  #endif
1628b25248d074 Peter Zijlstra               2026-05-12  213  	.blocked_donor = NULL,
4e7e3adbba5224 David Howells                2018-01-02  214  #ifdef CONFIG_RT_MUTEXES
4e7e3adbba5224 David Howells                2018-01-02  215  	.pi_waiters	= RB_ROOT_CACHED,
4e7e3adbba5224 David Howells                2018-01-02  216  	.pi_top_task	= NULL,
4e7e3adbba5224 David Howells                2018-01-02  217  #endif
d11ed3ab3166a2 David Howells                2018-01-02  218  	INIT_PREV_CPUTIME(init_task)
4e7e3adbba5224 David Howells                2018-01-02  219  #ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
4e7e3adbba5224 David Howells                2018-01-02  220  	.vtime.seqcount	= SEQCNT_ZERO(init_task.vtime_seqcount),
4e7e3adbba5224 David Howells                2018-01-02  221  	.vtime.starttime = 0,
4e7e3adbba5224 David Howells                2018-01-02  222  	.vtime.state	= VTIME_SYS,
4e7e3adbba5224 David Howells                2018-01-02  223  #endif
4e7e3adbba5224 David Howells                2018-01-02  224  #ifdef CONFIG_NUMA_BALANCING
98fa15f34cb379 Anshuman Khandual            2019-03-05  225  	.numa_preferred_nid = NUMA_NO_NODE,
4e7e3adbba5224 David Howells                2018-01-02  226  	.numa_group	= NULL,
4e7e3adbba5224 David Howells                2018-01-02  227  	.numa_faults	= NULL,
4e7e3adbba5224 David Howells                2018-01-02  228  #endif
47d8696b95f739 Tim Chen                     2026-04-01  229  #ifdef CONFIG_SCHED_CACHE
47d8696b95f739 Tim Chen                     2026-04-01  230  	.preferred_llc  = -1,
03755348b8e744 Chen Yu                      2026-05-13  231  	.pref_llc_queued  = 0,
47d8696b95f739 Tim Chen                     2026-04-01  232  #endif
d73b49365ee65a Andrey Konovalov             2020-12-22  233  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
4e7e3adbba5224 David Howells                2018-01-02  234  	.kasan_depth	= 1,
4e7e3adbba5224 David Howells                2018-01-02  235  #endif
dfd402a4c4baae Marco Elver                  2019-11-14  236  #ifdef CONFIG_KCSAN
dfd402a4c4baae Marco Elver                  2019-11-14  237  	.kcsan_ctx = {
757a4cefde7669 Marco Elver                  2020-03-25  238  		.scoped_accesses	= {LIST_POISON1, NULL},
dfd402a4c4baae Marco Elver                  2019-11-14  239  	},
dfd402a4c4baae Marco Elver                  2019-11-14  240  #endif
4e7e3adbba5224 David Howells                2018-01-02  241  #ifdef CONFIG_TRACE_IRQFLAGS
4e7e3adbba5224 David Howells                2018-01-02  242  	.softirqs_enabled = 1,
4e7e3adbba5224 David Howells                2018-01-02  243  #endif
4e7e3adbba5224 David Howells                2018-01-02  244  #ifdef CONFIG_LOCKDEP
e196e479a3b844 Yuyang Du                    2019-05-06  245  	.lockdep_depth = 0, /* no locks held yet */
f6ec8829ac9d59 Yuyang Du                    2019-05-06  246  	.curr_chain_key = INITIAL_CHAIN_KEY,
4e7e3adbba5224 David Howells                2018-01-02  247  	.lockdep_recursion = 0,
4e7e3adbba5224 David Howells                2018-01-02  248  #endif
4e7e3adbba5224 David Howells                2018-01-02  249  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
4e7e3adbba5224 David Howells                2018-01-02  250  	.ret_stack		= NULL,
7e0a9220467dbc Steven Rostedt (VMware       2021-01-29  251) 	.tracing_graph_pause	= ATOMIC_INIT(0),
4e7e3adbba5224 David Howells                2018-01-02  252  #endif
c1a280b68d4e6b Thomas Gleixner              2019-07-26  253  #if defined(CONFIG_TRACING) && defined(CONFIG_PREEMPTION)
4e7e3adbba5224 David Howells                2018-01-02  254  	.trace_recursion = 0,
4e7e3adbba5224 David Howells                2018-01-02  255  #endif
4e7e3adbba5224 David Howells                2018-01-02  256  #ifdef CONFIG_LIVEPATCH
d927752f287fe1 Wardenjohn                   2024-05-07  257  	.patch_state	= KLP_TRANSITION_IDLE,
4e7e3adbba5224 David Howells                2018-01-02  258  #endif
4e7e3adbba5224 David Howells                2018-01-02  259  #ifdef CONFIG_SECURITY
4e7e3adbba5224 David Howells                2018-01-02  260  	.security	= NULL,
4e7e3adbba5224 David Howells                2018-01-02  261  #endif
64bdc0244054f7 Kenta.Tada@sony.com          2021-03-21  262  #ifdef CONFIG_SECCOMP_FILTER
c818c03b661cd7 Kees Cook                    2020-05-13  263  	.seccomp	= { .filter_count = ATOMIC_INIT(0) },
c818c03b661cd7 Kees Cook                    2020-05-13  264  #endif
8cea569ca78506 Thomas Gleixner              2025-11-19  265  #ifdef CONFIG_SCHED_MM_CID
8cea569ca78506 Thomas Gleixner              2025-11-19  266  	.mm_cid		= { .cid = MM_CID_UNSET, },
8cea569ca78506 Thomas Gleixner              2025-11-19  267  #endif
d11ed3ab3166a2 David Howells                2018-01-02  268  };
a4a2eb490e38aa Thomas Gleixner              2012-05-03  269  EXPORT_SYMBOL(init_task);
a4a2eb490e38aa Thomas Gleixner              2012-05-03  270  

:::::: The code at line 162 was first introduced by commit
:::::: d11ed3ab3166a2bfad60681aebf3e13e1c3408a9 Expand INIT_TASK() in init/init_task.c and remove

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
