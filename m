Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA3A199FA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725979789; cv=none; b=p5dZMycNrJLcUD8QKhlehA2dN5McCpNH9pnFbb4K0eSY9ZpVLp91ZkQdHfEmkNvf6QESSyILZsmSvp1w1K4GOY0crTYSXHqlOGUbM+RoXQkJI51pAocXbfc8WEYwaG3ThzUYmxhtbMjVO6SDgnPALOX4A+mu7S6nAxpqy8ANDRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725979789; c=relaxed/simple;
	bh=X4x5KTBXDKqyxEfrAnTIwVJwj6vE4t2Sv5VyVxTAHGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y8fctzK9hOhHTjKJEppJuAMSGEucWW4Z74nbzbsI2J4sdDVbzBm6zNTbOag0qrFsTxKkGjGSrOyznF3MhagexDUMRmLKtuNaHA00uz3w+c8z/qoLEeadukLjCmSpwIogY7uzd/FIBflH2WH5h1o5QyTc2tlNZIn3yv3StsonS6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sz5D8SOc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sz5D8SOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725979788; x=1757515788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X4x5KTBXDKqyxEfrAnTIwVJwj6vE4t2Sv5VyVxTAHGE=;
  b=Sz5D8SOcrM2pOYKkbemMAVPE9nt64hrUyYaL6HC2OR7UoGmMvcpCh33P
   Qs1KdMFz9kQgxaeNryBp8Af05Dmx1BygkhFB1znP2CAdzRyL6dAEmudiW
   eTvOl/Or79pcGcA+raKmxWUaOXUsmw2n+dGoFoOsj/QKi0FW47ZzoN4EX
   eK8gm8zEsUngjjSk1RTWEzn/P9eRoNpBRYzc52dHSmRITM5wcFP+u42PS
   WEktz0y97vAukLsvGxcmFJ4nk5AYmdHlwoZMqZdAebuoNo6twqRqTajPV
   T2LkLSRIKk0GE55GHVXSZnwSoP80Vevqen9NETZL/vQ+Ok8qWScBOI5BX
   w==;
X-CSE-ConnectionGUID: nUJ89t7sS565QAtwBU2ZGw==
X-CSE-MsgGUID: Lb5Yvmx4Qt65+ZCJsVh68w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24924096"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="24924096"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 07:49:47 -0700
X-CSE-ConnectionGUID: XHd/xHGfRMCXtIMZVx01Mg==
X-CSE-MsgGUID: HLNbN+wJTGWG9xfkC65RnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="97748620"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2024 07:49:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so2Bb-0002EA-0C;
	Tue, 10 Sep 2024 14:49:43 +0000
Date: Tue, 10 Sep 2024 22:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 12815/15115]
 init/init_task.c:71:17: error: use of undeclared identifier 'NR_syscalls'
Message-ID: <202409102218.aytW4LMb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   ac7820b03cbd81c34aa8e9a3a05ed969c03f68ec
commit: f50b7d2c226ed73ee8be68842a1bbf7f49da1109 [12815/15115] CHROMIUM: x86: Add alt-syscall support
config: x86_64-randconfig-076-20240910 (https://download.01.org/0day-ci/archive/20240910/202409102218.aytW4LMb-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409102218.aytW4LMb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409102218.aytW4LMb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> init/init_task.c:71:17: error: use of undeclared identifier 'NR_syscalls'
      71 |         .thread_info    = INIT_THREAD_INFO(init_task),
         |                           ^
   arch/x86/include/asm/thread_info.h:102:2: note: expanded from macro 'INIT_THREAD_INFO'
     102 |         INIT_THREAD_INFO_SYSCALL                \
         |         ^
   arch/x86/include/asm/thread_info.h:92:17: note: expanded from macro 'INIT_THREAD_INFO_SYSCALL'
      92 |         .nr_syscalls    = NR_syscalls,          \
         |                           ^
   init/init_task.c:71:17: error: use of undeclared identifier 'sys_call_table'; did you mean 'sg_alloc_table'?
   arch/x86/include/asm/thread_info.h:102:2: note: expanded from macro 'INIT_THREAD_INFO'
     102 |         INIT_THREAD_INFO_SYSCALL                \
         |         ^
   arch/x86/include/asm/thread_info.h:93:20: note: expanded from macro 'INIT_THREAD_INFO_SYSCALL'
      93 |         .sys_call_table = sys_call_table,       \
         |                           ^
   include/linux/scatterlist.h:440:5: note: 'sg_alloc_table' declared here
     440 | int sg_alloc_table(struct sg_table *, unsigned int, gfp_t);
         |     ^
>> init/init_task.c:71:17: error: use of undeclared identifier 'IA32_NR_syscalls'
      71 |         .thread_info    = INIT_THREAD_INFO(init_task),
         |                           ^
   arch/x86/include/asm/thread_info.h:102:2: note: expanded from macro 'INIT_THREAD_INFO'
     102 |         INIT_THREAD_INFO_SYSCALL                \
         |         ^
   arch/x86/include/asm/thread_info.h:94:2: note: expanded from macro 'INIT_THREAD_INFO_SYSCALL'
      94 |         INIT_THREAD_INFO_SYSCALL_COMPAT
         |         ^
   arch/x86/include/asm/thread_info.h:86:22: note: expanded from macro 'INIT_THREAD_INFO_SYSCALL_COMPAT'
      86 |         .ia32_nr_syscalls       = IA32_NR_syscalls,             \
         |                                   ^
   init/init_task.c:71:17: error: use of undeclared identifier 'ia32_sys_call_table'
   arch/x86/include/asm/thread_info.h:102:2: note: expanded from macro 'INIT_THREAD_INFO'
     102 |         INIT_THREAD_INFO_SYSCALL                \
         |         ^
   arch/x86/include/asm/thread_info.h:94:2: note: expanded from macro 'INIT_THREAD_INFO_SYSCALL'
      94 |         INIT_THREAD_INFO_SYSCALL_COMPAT
         |         ^
   arch/x86/include/asm/thread_info.h:87:25: note: expanded from macro 'INIT_THREAD_INFO_SYSCALL_COMPAT'
      87 |         .ia32_sys_call_table    = ia32_sys_call_table,
         |                                   ^
   4 errors generated.


vim +/NR_syscalls +71 init/init_task.c

d08b9f0ca6605e Sami Tolvanen             2020-04-27   59  
d11ed3ab3166a2 David Howells             2018-01-02   60  /*
d11ed3ab3166a2 David Howells             2018-01-02   61   * Set up the first task table, touch at your own risk!. Base=0,
d11ed3ab3166a2 David Howells             2018-01-02   62   * limit=0x1fffff (=2MB)
d11ed3ab3166a2 David Howells             2018-01-02   63   */
0500871f21b237 David Howells             2018-01-02   64  struct task_struct init_task
0500871f21b237 David Howells             2018-01-02   65  #ifdef CONFIG_ARCH_TASK_STRUCT_ON_STACK
0500871f21b237 David Howells             2018-01-02   66  	__init_task_data
0500871f21b237 David Howells             2018-01-02   67  #endif
d0b7213f895cd0 Stafford Horne            2020-06-26   68  	__aligned(L1_CACHE_BYTES)
d11ed3ab3166a2 David Howells             2018-01-02   69  = {
4e7e3adbba5224 David Howells             2018-01-02   70  #ifdef CONFIG_THREAD_INFO_IN_TASK
4e7e3adbba5224 David Howells             2018-01-02  @71  	.thread_info	= INIT_THREAD_INFO(init_task),
f0b89d3958d73c Elena Reshetova           2019-01-18   72  	.stack_refcount	= REFCOUNT_INIT(1),
4e7e3adbba5224 David Howells             2018-01-02   73  #endif
2f064a59a11ff9 Peter Zijlstra            2021-06-11   74  	.__state	= 0,
d11ed3ab3166a2 David Howells             2018-01-02   75  	.stack		= init_stack,
ec1d281923cf81 Elena Reshetova           2019-01-18   76  	.usage		= REFCOUNT_INIT(2),
d11ed3ab3166a2 David Howells             2018-01-02   77  	.flags		= PF_KTHREAD,
d11ed3ab3166a2 David Howells             2018-01-02   78  	.prio		= MAX_PRIO - 20,
d11ed3ab3166a2 David Howells             2018-01-02   79  	.static_prio	= MAX_PRIO - 20,
d11ed3ab3166a2 David Howells             2018-01-02   80  	.normal_prio	= MAX_PRIO - 20,
d11ed3ab3166a2 David Howells             2018-01-02   81  	.policy		= SCHED_NORMAL,
3bd3706251ee8a Sebastian Andrzej Siewior 2019-04-23   82  	.cpus_ptr	= &init_task.cpus_mask,
b90ca8badbd114 Will Deacon               2021-07-30   83  	.user_cpus_ptr	= NULL,
3bd3706251ee8a Sebastian Andrzej Siewior 2019-04-23   84  	.cpus_mask	= CPU_MASK_ALL,
d11ed3ab3166a2 David Howells             2018-01-02   85  	.nr_cpus_allowed= NR_CPUS,
d11ed3ab3166a2 David Howells             2018-01-02   86  	.mm		= NULL,
d11ed3ab3166a2 David Howells             2018-01-02   87  	.active_mm	= &init_mm,
d11ed3ab3166a2 David Howells             2018-01-02   88  	.restart_block	= {
d11ed3ab3166a2 David Howells             2018-01-02   89  		.fn = do_no_restart_syscall,
d11ed3ab3166a2 David Howells             2018-01-02   90  	},
d11ed3ab3166a2 David Howells             2018-01-02   91  	.se		= {
d11ed3ab3166a2 David Howells             2018-01-02   92  		.group_node 	= LIST_HEAD_INIT(init_task.se.group_node),
d11ed3ab3166a2 David Howells             2018-01-02   93  	},
d11ed3ab3166a2 David Howells             2018-01-02   94  	.rt		= {
d11ed3ab3166a2 David Howells             2018-01-02   95  		.run_list	= LIST_HEAD_INIT(init_task.rt.run_list),
d11ed3ab3166a2 David Howells             2018-01-02   96  		.time_slice	= RR_TIMESLICE,
d11ed3ab3166a2 David Howells             2018-01-02   97  	},
d11ed3ab3166a2 David Howells             2018-01-02   98  	.tasks		= LIST_HEAD_INIT(init_task.tasks),
4e7e3adbba5224 David Howells             2018-01-02   99  #ifdef CONFIG_SMP
4e7e3adbba5224 David Howells             2018-01-02  100  	.pushable_tasks	= PLIST_NODE_INIT(init_task.pushable_tasks, MAX_PRIO),
4e7e3adbba5224 David Howells             2018-01-02  101  #endif
4e7e3adbba5224 David Howells             2018-01-02  102  #ifdef CONFIG_CGROUP_SCHED
4e7e3adbba5224 David Howells             2018-01-02  103  	.sched_task_group = &root_task_group,
4e7e3adbba5224 David Howells             2018-01-02  104  #endif
d11ed3ab3166a2 David Howells             2018-01-02  105  	.ptraced	= LIST_HEAD_INIT(init_task.ptraced),
d11ed3ab3166a2 David Howells             2018-01-02  106  	.ptrace_entry	= LIST_HEAD_INIT(init_task.ptrace_entry),
d11ed3ab3166a2 David Howells             2018-01-02  107  	.real_parent	= &init_task,
d11ed3ab3166a2 David Howells             2018-01-02  108  	.parent		= &init_task,
d11ed3ab3166a2 David Howells             2018-01-02  109  	.children	= LIST_HEAD_INIT(init_task.children),
d11ed3ab3166a2 David Howells             2018-01-02  110  	.sibling	= LIST_HEAD_INIT(init_task.sibling),
d11ed3ab3166a2 David Howells             2018-01-02  111  	.group_leader	= &init_task,
d11ed3ab3166a2 David Howells             2018-01-02  112  	RCU_POINTER_INITIALIZER(real_cred, &init_cred),
d11ed3ab3166a2 David Howells             2018-01-02  113  	RCU_POINTER_INITIALIZER(cred, &init_cred),
d11ed3ab3166a2 David Howells             2018-01-02  114  	.comm		= INIT_TASK_COMM,
d11ed3ab3166a2 David Howells             2018-01-02  115  	.thread		= INIT_THREAD,
d11ed3ab3166a2 David Howells             2018-01-02  116  	.fs		= &init_fs,
d11ed3ab3166a2 David Howells             2018-01-02  117  	.files		= &init_files,
0f2122045b9462 Jens Axboe                2020-09-13  118  #ifdef CONFIG_IO_URING
0f2122045b9462 Jens Axboe                2020-09-13  119  	.io_uring	= NULL,
0f2122045b9462 Jens Axboe                2020-09-13  120  #endif
d11ed3ab3166a2 David Howells             2018-01-02  121  	.signal		= &init_signals,
d11ed3ab3166a2 David Howells             2018-01-02  122  	.sighand	= &init_sighand,
d11ed3ab3166a2 David Howells             2018-01-02  123  	.nsproxy	= &init_nsproxy,
d11ed3ab3166a2 David Howells             2018-01-02  124  	.pending	= {
d11ed3ab3166a2 David Howells             2018-01-02  125  		.list = LIST_HEAD_INIT(init_task.pending.list),
d11ed3ab3166a2 David Howells             2018-01-02  126  		.signal = {{0}}
d11ed3ab3166a2 David Howells             2018-01-02  127  	},
d11ed3ab3166a2 David Howells             2018-01-02  128  	.blocked	= {{0}},
d11ed3ab3166a2 David Howells             2018-01-02  129  	.alloc_lock	= __SPIN_LOCK_UNLOCKED(init_task.alloc_lock),
d11ed3ab3166a2 David Howells             2018-01-02  130  	.journal_info	= NULL,
d11ed3ab3166a2 David Howells             2018-01-02  131  	INIT_CPU_TIMERS(init_task)
d11ed3ab3166a2 David Howells             2018-01-02  132  	.pi_lock	= __RAW_SPIN_LOCK_UNLOCKED(init_task.pi_lock),
d11ed3ab3166a2 David Howells             2018-01-02  133  	.timer_slack_ns = 50000, /* 50 usec default slack */
2c4704756cab7c Eric W. Biederman         2017-09-26  134  	.thread_pid	= &init_struct_pid,
d11ed3ab3166a2 David Howells             2018-01-02  135  	.thread_group	= LIST_HEAD_INIT(init_task.thread_group),
d11ed3ab3166a2 David Howells             2018-01-02  136  	.thread_node	= LIST_HEAD_INIT(init_signals.thread_head),
4b7d248b3a1de4 Richard Guy Briggs        2019-01-22  137  #ifdef CONFIG_AUDIT
4e7e3adbba5224 David Howells             2018-01-02  138  	.loginuid	= INVALID_UID,
f0b752168d7091 Richard Guy Briggs        2018-05-12  139  	.sessionid	= AUDIT_SID_UNSET,
4e7e3adbba5224 David Howells             2018-01-02  140  #endif
4e7e3adbba5224 David Howells             2018-01-02  141  #ifdef CONFIG_PERF_EVENTS
4e7e3adbba5224 David Howells             2018-01-02  142  	.perf_event_mutex = __MUTEX_INITIALIZER(init_task.perf_event_mutex),
4e7e3adbba5224 David Howells             2018-01-02  143  	.perf_event_list = LIST_HEAD_INIT(init_task.perf_event_list),
4e7e3adbba5224 David Howells             2018-01-02  144  #endif
4e7e3adbba5224 David Howells             2018-01-02  145  #ifdef CONFIG_PREEMPT_RCU
4e7e3adbba5224 David Howells             2018-01-02  146  	.rcu_read_lock_nesting = 0,
4e7e3adbba5224 David Howells             2018-01-02  147  	.rcu_read_unlock_special.s = 0,
4e7e3adbba5224 David Howells             2018-01-02  148  	.rcu_node_entry = LIST_HEAD_INIT(init_task.rcu_node_entry),
4e7e3adbba5224 David Howells             2018-01-02  149  	.rcu_blocked_node = NULL,
4e7e3adbba5224 David Howells             2018-01-02  150  #endif
4e7e3adbba5224 David Howells             2018-01-02  151  #ifdef CONFIG_TASKS_RCU
4e7e3adbba5224 David Howells             2018-01-02  152  	.rcu_tasks_holdout = false,
4e7e3adbba5224 David Howells             2018-01-02  153  	.rcu_tasks_holdout_list = LIST_HEAD_INIT(init_task.rcu_tasks_holdout_list),
4e7e3adbba5224 David Howells             2018-01-02  154  	.rcu_tasks_idle_cpu = -1,
4e7e3adbba5224 David Howells             2018-01-02  155  #endif
d5f177d35c2442 Paul E. McKenney          2020-03-09  156  #ifdef CONFIG_TASKS_TRACE_RCU
d5f177d35c2442 Paul E. McKenney          2020-03-09  157  	.trc_reader_nesting = 0,
276c410448dbca Paul E. McKenney          2020-03-17  158  	.trc_reader_special.s = 0,
d5f177d35c2442 Paul E. McKenney          2020-03-09  159  	.trc_holdout_list = LIST_HEAD_INIT(init_task.trc_holdout_list),
434c9eefb959c3 Paul E. McKenney          2022-05-16  160  	.trc_blkd_node = LIST_HEAD_INIT(init_task.trc_blkd_node),
d5f177d35c2442 Paul E. McKenney          2020-03-09  161  #endif
4e7e3adbba5224 David Howells             2018-01-02  162  #ifdef CONFIG_CPUSETS
b75058614fdd31 Ahmed S. Darwish          2020-07-20  163  	.mems_allowed_seq = SEQCNT_SPINLOCK_ZERO(init_task.mems_allowed_seq,
b75058614fdd31 Ahmed S. Darwish          2020-07-20  164  						 &init_task.alloc_lock),
4e7e3adbba5224 David Howells             2018-01-02  165  #endif
4e7e3adbba5224 David Howells             2018-01-02  166  #ifdef CONFIG_RT_MUTEXES
4e7e3adbba5224 David Howells             2018-01-02  167  	.pi_waiters	= RB_ROOT_CACHED,
4e7e3adbba5224 David Howells             2018-01-02  168  	.pi_top_task	= NULL,
4e7e3adbba5224 David Howells             2018-01-02  169  #endif
d11ed3ab3166a2 David Howells             2018-01-02  170  	INIT_PREV_CPUTIME(init_task)
4e7e3adbba5224 David Howells             2018-01-02  171  #ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
4e7e3adbba5224 David Howells             2018-01-02  172  	.vtime.seqcount	= SEQCNT_ZERO(init_task.vtime_seqcount),
4e7e3adbba5224 David Howells             2018-01-02  173  	.vtime.starttime = 0,
4e7e3adbba5224 David Howells             2018-01-02  174  	.vtime.state	= VTIME_SYS,
4e7e3adbba5224 David Howells             2018-01-02  175  #endif
4e7e3adbba5224 David Howells             2018-01-02  176  #ifdef CONFIG_NUMA_BALANCING
98fa15f34cb379 Anshuman Khandual         2019-03-05  177  	.numa_preferred_nid = NUMA_NO_NODE,
4e7e3adbba5224 David Howells             2018-01-02  178  	.numa_group	= NULL,
4e7e3adbba5224 David Howells             2018-01-02  179  	.numa_faults	= NULL,
4e7e3adbba5224 David Howells             2018-01-02  180  #endif
d73b49365ee65a Andrey Konovalov          2020-12-22  181  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
4e7e3adbba5224 David Howells             2018-01-02  182  	.kasan_depth	= 1,
4e7e3adbba5224 David Howells             2018-01-02  183  #endif
dfd402a4c4baae Marco Elver               2019-11-14  184  #ifdef CONFIG_KCSAN
dfd402a4c4baae Marco Elver               2019-11-14  185  	.kcsan_ctx = {
757a4cefde7669 Marco Elver               2020-03-25  186  		.scoped_accesses	= {LIST_POISON1, NULL},
dfd402a4c4baae Marco Elver               2019-11-14  187  	},
dfd402a4c4baae Marco Elver               2019-11-14  188  #endif
4e7e3adbba5224 David Howells             2018-01-02  189  #ifdef CONFIG_TRACE_IRQFLAGS
4e7e3adbba5224 David Howells             2018-01-02  190  	.softirqs_enabled = 1,
4e7e3adbba5224 David Howells             2018-01-02  191  #endif
4e7e3adbba5224 David Howells             2018-01-02  192  #ifdef CONFIG_LOCKDEP
e196e479a3b844 Yuyang Du                 2019-05-06  193  	.lockdep_depth = 0, /* no locks held yet */
f6ec8829ac9d59 Yuyang Du                 2019-05-06  194  	.curr_chain_key = INITIAL_CHAIN_KEY,
4e7e3adbba5224 David Howells             2018-01-02  195  	.lockdep_recursion = 0,
4e7e3adbba5224 David Howells             2018-01-02  196  #endif
4e7e3adbba5224 David Howells             2018-01-02  197  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
4e7e3adbba5224 David Howells             2018-01-02  198  	.ret_stack		= NULL,
7e0a9220467dbc Steven Rostedt (VMware    2021-01-29  199) 	.tracing_graph_pause	= ATOMIC_INIT(0),
4e7e3adbba5224 David Howells             2018-01-02  200  #endif
c1a280b68d4e6b Thomas Gleixner           2019-07-26  201  #if defined(CONFIG_TRACING) && defined(CONFIG_PREEMPTION)
4e7e3adbba5224 David Howells             2018-01-02  202  	.trace_recursion = 0,
4e7e3adbba5224 David Howells             2018-01-02  203  #endif
4e7e3adbba5224 David Howells             2018-01-02  204  #ifdef CONFIG_LIVEPATCH
4e7e3adbba5224 David Howells             2018-01-02  205  	.patch_state	= KLP_UNDEFINED,
4e7e3adbba5224 David Howells             2018-01-02  206  #endif
4e7e3adbba5224 David Howells             2018-01-02  207  #ifdef CONFIG_SECURITY
4e7e3adbba5224 David Howells             2018-01-02  208  	.security	= NULL,
4e7e3adbba5224 David Howells             2018-01-02  209  #endif
64bdc0244054f7 Kenta.Tada@sony.com       2021-03-21  210  #ifdef CONFIG_SECCOMP_FILTER
c818c03b661cd7 Kees Cook                 2020-05-13  211  	.seccomp	= { .filter_count = ATOMIC_INIT(0) },
c818c03b661cd7 Kees Cook                 2020-05-13  212  #endif
3e9d5f02f0e124 Qingqing Zhou             2021-11-30  213  #ifdef CONFIG_ANDROID_VENDOR_OEM_DATA
a2f67957845c52 Maria Yu                  2021-11-24  214  	.android_vendor_data1 = {0, },
a2f67957845c52 Maria Yu                  2021-11-24  215  	.android_oem_data1 = {0, },
3e9d5f02f0e124 Qingqing Zhou             2021-11-30  216  #endif
d11ed3ab3166a2 David Howells             2018-01-02  217  };
a4a2eb490e38aa Thomas Gleixner           2012-05-03  218  EXPORT_SYMBOL(init_task);
a4a2eb490e38aa Thomas Gleixner           2012-05-03  219  

:::::: The code at line 71 was first introduced by commit
:::::: 4e7e3adbba5224604b34b0d42003ff6dbdc8ddd9 Expand various INIT_* macros and remove

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
