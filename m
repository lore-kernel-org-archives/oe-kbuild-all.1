Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C67154C17
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 17:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744825655; cv=none; b=QVrLzuyS7ZSvXgj153kufcIIZk8ADrDZYVs3+F9YGl+Pml1Wi7r00MW9zOycgRkuYXnf4Emq8W4uXQTKWfThECq9vPKVzCh9EqgKnS//6ytWm4gKjW27zw/NxwRJ1QSZTWHXghRLe/rrrkZAAgAsEUoLZ+UKNLb3/0AleTPmRIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744825655; c=relaxed/simple;
	bh=vQX+Ci/yOzrn4L7Kr93Prqh0r1n1TJNBtOrr4YlJmRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vAuXJR8XXsuGscUIo6L7VB7J3cu2LkJQaEu5SnTUeSVKzGJq/0ddIK7euNzbGNK0CXmj9dZ05M8CAzn011U5wl8YZTS2VMc5J5f/oNkGThVJMefNhJHAGTnKzpcfqxYT3/faBkSDsgAuEJPbWHvy8Cw/L3ooJkPkyYMoWn4kFr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9QHhFuN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9QHhFuN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744825653; x=1776361653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vQX+Ci/yOzrn4L7Kr93Prqh0r1n1TJNBtOrr4YlJmRs=;
  b=f9QHhFuNC9SrHOXy2FiizE5wnRHbKzhqMJSt7EG215+app+PPYYevPOH
   3JOh2Swnq8lYybmjrFZKmV/wa0Yv4Ki3pI78oNYfLmSYG59nLfRzeYZgl
   Ne81llJVuWsz4xZWp5X9X2iYpSg6P+KM5jeVytc0xQ4MlZIjm1Z08h6az
   iIMvmI4VfSv8nDkOSQ4TOPPi4uMY8qfvPgG+vUjZsv2xczzaZ8gJiVJAg
   mpX2EZlcCGsKLoIh3xUv0mBodgqzs2gs5nTWMKaZ36AK3Z38IeHU/QBmO
   OqU9+V2aG+1ZoD1i3x4ePZoPKtUwV9zQZ4rg3zyjfUu1EZRyElnvg40N8
   g==;
X-CSE-ConnectionGUID: FNCtfNyPSteQBb7JqiUPuQ==
X-CSE-MsgGUID: vNI4KU35Su2qTE5OuRyNcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45621748"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="45621748"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:47:32 -0700
X-CSE-ConnectionGUID: 14wwHh8QSz21/WFXX0pMVQ==
X-CSE-MsgGUID: oqie4DEdRzSwpRmkOswmKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="130322517"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Apr 2025 10:47:30 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u56r9-000K9q-2z;
	Wed, 16 Apr 2025 17:47:27 +0000
Date: Thu, 17 Apr 2025 01:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2130/2130] kernel/sched/psi.c:1262:6: warning:
 'psi_account_irqtime' defined but not used
Message-ID: <202504170110.nEONpqWt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lu,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   58353f394bfe86212d5089bc9c1c235ffc761e2c
commit: 654944510822988390470cbc5b6f914c19dd9b88 [2130/2130] sched/psi: add cpu fine grained stall tracking in pressure.stat
config: arm64-randconfig-001-20250417 (https://download.01.org/0day-ci/archive/20250417/202504170110.nEONpqWt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504170110.nEONpqWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170110.nEONpqWt-lkp@intel.com/

All warnings (new ones prefixed by >>):

                           ^
   include/linux/init.h:343:32: note: in definition of macro '__setup_param'
      = { __setup_str_##unique_id, fn, early }
                                   ^~
   kernel/sched/autogroup.c:227:1: note: in expansion of macro '__setup'
    __setup("noautogroup", setup_autogroup);
    ^~~~~~~
   kernel/sched/build_utility.c:110:0: error: expected declaration or statement at end of input
    #endif
    
   In file included from kernel/sched/build_utility.c:97:0:
   kernel/sched/build_utility.c: At top level:
   kernel/sched/psi.c:178:13: warning: 'psi_avgs_work' used but never defined
    static void psi_avgs_work(struct work_struct *work);
                ^~~~~~~~~~~~~
   kernel/sched/psi.c:180:13: warning: 'poll_timer_fn' used but never defined
    static void poll_timer_fn(struct timer_list *t);
                ^~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:109:0:
   kernel/sched/autogroup.c:285:5: warning: 'autogroup_path' defined but not used [-Wunused-function]
    int autogroup_path(struct task_group *tg, char *buf, int buflen)
        ^~~~~~~~~~~~~~
   kernel/sched/autogroup.c:269:6: warning: 'proc_sched_autogroup_show_task' defined but not used [-Wunused-function]
    void proc_sched_autogroup_show_task(struct task_struct *p, struct seq_file *m)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:231:5: warning: 'proc_sched_autogroup_set_nice' defined but not used [-Wunused-function]
    int proc_sched_autogroup_set_nice(struct task_struct *p, int nice)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:216:6: warning: 'sched_autogroup_exit' defined but not used [-Wunused-function]
    void sched_autogroup_exit(struct signal_struct *sig)
         ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:211:6: warning: 'sched_autogroup_fork' defined but not used [-Wunused-function]
    void sched_autogroup_fork(struct signal_struct *sig)
         ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:147:6: warning: 'sched_autogroup_exit_task' defined but not used [-Wunused-function]
    void sched_autogroup_exit_task(struct task_struct *p)
         ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:129:6: warning: 'task_wants_autogroup' defined but not used [-Wunused-function]
    bool task_wants_autogroup(struct task_struct *p, struct task_group *tg)
         ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:42:6: warning: 'autogroup_free' defined but not used [-Wunused-function]
    void autogroup_free(struct task_group *tg)
         ^~~~~~~~~~~~~~
   kernel/sched/autogroup.c:33:13: warning: 'autogroup_init' defined but not used [-Wunused-function]
    void __init autogroup_init(struct task_struct *init_task)
                ^~~~~~~~~~~~~~
   In file included from include/linux/compat.h:34:0,
                    from arch/arm64/include/asm/elf.h:9,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/cpufreq.h:12,
                    from kernel/sched/build_utility.c:22:
   arch/arm64/include/asm/syscall_wrapper.h:62:14: warning: '__se_sys_membarrier' defined but not used [-Wunused-function]
     static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
                 ^
   include/linux/syscalls.h:230:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
    ^~~~~~~~~~~~~~~
   arch/arm64/include/asm/syscall_wrapper.h:58:18: warning: '__arm64_sys_membarrier' defined but not used [-Wunused-function]
     asmlinkage long __arm64_sys##name(const struct pt_regs *regs)  \
                     ^
   include/linux/syscalls.h:230:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
    ^~~~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:101:0:
   kernel/sched/membarrier.c:233:6: warning: 'membarrier_update_current_mm' defined but not used [-Wunused-function]
    void membarrier_update_current_mm(struct mm_struct *next_mm)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:217:6: warning: 'membarrier_exec_mmap' defined but not used [-Wunused-function]
    void membarrier_exec_mmap(struct mm_struct *mm)
         ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:97:0:
   kernel/sched/psi.c:1471:6: warning: 'psi_cgroup_restart' defined but not used [-Wunused-function]
    void psi_cgroup_restart(struct psi_group *group)
         ^~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1416:6: warning: 'cgroup_move_task' defined but not used [-Wunused-function]
    void cgroup_move_task(struct task_struct *task, struct css_set *to)
         ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1392:6: warning: 'psi_cgroup_free' defined but not used [-Wunused-function]
    void psi_cgroup_free(struct cgroup *cgroup)
         ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1373:5: warning: 'psi_cgroup_alloc' defined but not used [-Wunused-function]
    int psi_cgroup_alloc(struct cgroup *cgroup)
        ^~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1262:6: warning: 'psi_account_irqtime' defined but not used [-Wunused-function]
    void psi_account_irqtime(struct task_struct *task, u32 delta)
         ^~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1168:6: warning: 'psi_task_switch' defined but not used [-Wunused-function]
    void psi_task_switch(struct task_struct *prev, struct task_struct *next,
         ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:949:13: warning: 'poll_timer_fn' defined but not used [-Wunused-function]
    static void poll_timer_fn(struct timer_list *t)
                ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/psi_account_irqtime +1262 kernel/sched/psi.c

eb414681d5a07d Johannes Weiner    2018-10-26  1260  
52b1364ba0b105 Chengming Zhou     2022-08-26  1261  #ifdef CONFIG_IRQ_TIME_ACCOUNTING
52b1364ba0b105 Chengming Zhou     2022-08-26 @1262  void psi_account_irqtime(struct task_struct *task, u32 delta)
52b1364ba0b105 Chengming Zhou     2022-08-26  1263  {
52b1364ba0b105 Chengming Zhou     2022-08-26  1264  	int cpu = task_cpu(task);
52b1364ba0b105 Chengming Zhou     2022-08-26  1265  	struct psi_group *group;
52b1364ba0b105 Chengming Zhou     2022-08-26  1266  	struct psi_group_cpu *groupc;
52b1364ba0b105 Chengming Zhou     2022-08-26  1267  	u64 now;
52b1364ba0b105 Chengming Zhou     2022-08-26  1268  
c4069ab39e78c5 Haifeng Xu         2024-01-04  1269  	if (static_branch_likely(&psi_disabled))
c4069ab39e78c5 Haifeng Xu         2024-01-04  1270  		return;
c4069ab39e78c5 Haifeng Xu         2024-01-04  1271  
52b1364ba0b105 Chengming Zhou     2022-08-26  1272  	if (!task->pid)
52b1364ba0b105 Chengming Zhou     2022-08-26  1273  		return;
52b1364ba0b105 Chengming Zhou     2022-08-26  1274  
52b1364ba0b105 Chengming Zhou     2022-08-26  1275  	now = cpu_clock(cpu);
52b1364ba0b105 Chengming Zhou     2022-08-26  1276  
dc86aba751e286 Chengming Zhou     2022-08-26  1277  	group = task_psi_group(task);
dc86aba751e286 Chengming Zhou     2022-08-26  1278  	do {
34f26a15611afb Chengming Zhou     2022-09-07  1279  		if (!group->enabled)
34f26a15611afb Chengming Zhou     2022-09-07  1280  			continue;
34f26a15611afb Chengming Zhou     2022-09-07  1281  
52b1364ba0b105 Chengming Zhou     2022-08-26  1282  		groupc = per_cpu_ptr(group->pcpu, cpu);
52b1364ba0b105 Chengming Zhou     2022-08-26  1283  
52b1364ba0b105 Chengming Zhou     2022-08-26  1284  		write_seqcount_begin(&groupc->seq);
52b1364ba0b105 Chengming Zhou     2022-08-26  1285  
52b1364ba0b105 Chengming Zhou     2022-08-26  1286  		record_times(groupc, now);
52b1364ba0b105 Chengming Zhou     2022-08-26  1287  		groupc->times[PSI_IRQ_FULL] += delta;
52b1364ba0b105 Chengming Zhou     2022-08-26  1288  
52b1364ba0b105 Chengming Zhou     2022-08-26  1289  		write_seqcount_end(&groupc->seq);
52b1364ba0b105 Chengming Zhou     2022-08-26  1290  
65457b74aa9437 Domenico Cerasuolo 2023-03-30  1291  		if (group->rtpoll_states & (1 << PSI_IRQ_FULL))
65457b74aa9437 Domenico Cerasuolo 2023-03-30  1292  			psi_schedule_rtpoll_work(group, 1, false);
dc86aba751e286 Chengming Zhou     2022-08-26  1293  	} while ((group = group->parent));
52b1364ba0b105 Chengming Zhou     2022-08-26  1294  }
52b1364ba0b105 Chengming Zhou     2022-08-26  1295  #endif
52b1364ba0b105 Chengming Zhou     2022-08-26  1296  
eb414681d5a07d Johannes Weiner    2018-10-26  1297  /**
eb414681d5a07d Johannes Weiner    2018-10-26  1298   * psi_memstall_enter - mark the beginning of a memory stall section
a65983d90bfb5e Lu Jialin          2024-01-04  1299   * @flags: flags to handle nested sections. When the memory pressure
a65983d90bfb5e Lu Jialin          2024-01-04  1300   * is stalled in pressure_stat, the flags will be the pressure source,
a65983d90bfb5e Lu Jialin          2024-01-04  1301   * Otherwise, the init flags should be zero.
eb414681d5a07d Johannes Weiner    2018-10-26  1302   *
eb414681d5a07d Johannes Weiner    2018-10-26  1303   * Marks the calling task as being stalled due to a lack of memory,
eb414681d5a07d Johannes Weiner    2018-10-26  1304   * such as waiting for a refault or performing reclaim.
eb414681d5a07d Johannes Weiner    2018-10-26  1305   */
eb414681d5a07d Johannes Weiner    2018-10-26  1306  void psi_memstall_enter(unsigned long *flags)
eb414681d5a07d Johannes Weiner    2018-10-26  1307  {
eb414681d5a07d Johannes Weiner    2018-10-26  1308  	struct rq_flags rf;
eb414681d5a07d Johannes Weiner    2018-10-26  1309  	struct rq *rq;
a65983d90bfb5e Lu Jialin          2024-01-04  1310  #ifdef CONFIG_PSI_FINE_GRAINED
a65983d90bfb5e Lu Jialin          2024-01-04  1311  	unsigned long stat_flags = *flags;
a65983d90bfb5e Lu Jialin          2024-01-04  1312  #endif
eb414681d5a07d Johannes Weiner    2018-10-26  1313  
e0c274472d5d27 Johannes Weiner    2018-11-30  1314  	if (static_branch_likely(&psi_disabled))
eb414681d5a07d Johannes Weiner    2018-10-26  1315  		return;
eb414681d5a07d Johannes Weiner    2018-10-26  1316  
1066d1b6974e09 Yafang Shao        2020-03-16  1317  	*flags = current->in_memstall;
eb414681d5a07d Johannes Weiner    2018-10-26  1318  	if (*flags)
eb414681d5a07d Johannes Weiner    2018-10-26  1319  		return;
3dfdd2f9d0dbe7 Lu Jialin          2024-01-02  1320  
3dfdd2f9d0dbe7 Lu Jialin          2024-01-02  1321  	trace_psi_memstall_enter(_RET_IP_);
eb414681d5a07d Johannes Weiner    2018-10-26  1322  	/*
1066d1b6974e09 Yafang Shao        2020-03-16  1323  	 * in_memstall setting & accounting needs to be atomic wrt
eb414681d5a07d Johannes Weiner    2018-10-26  1324  	 * changes to the task's scheduling state, otherwise we can
eb414681d5a07d Johannes Weiner    2018-10-26  1325  	 * race with CPU migration.
eb414681d5a07d Johannes Weiner    2018-10-26  1326  	 */
eb414681d5a07d Johannes Weiner    2018-10-26  1327  	rq = this_rq_lock_irq(&rf);
eb414681d5a07d Johannes Weiner    2018-10-26  1328  
1066d1b6974e09 Yafang Shao        2020-03-16  1329  	current->in_memstall = 1;
a65983d90bfb5e Lu Jialin          2024-01-04  1330  #ifdef CONFIG_PSI_FINE_GRAINED
a65983d90bfb5e Lu Jialin          2024-01-04  1331  	if (stat_flags)
a65983d90bfb5e Lu Jialin          2024-01-04  1332  		current->memstall_type = stat_flags;
a65983d90bfb5e Lu Jialin          2024-01-04  1333  #endif
cb0e52b7748737 Brian Chen         2021-11-10  1334  	psi_task_change(current, 0, TSK_MEMSTALL | TSK_MEMSTALL_RUNNING);
eb414681d5a07d Johannes Weiner    2018-10-26  1335  
eb414681d5a07d Johannes Weiner    2018-10-26  1336  	rq_unlock_irq(rq, &rf);
eb414681d5a07d Johannes Weiner    2018-10-26  1337  }
527eb453bbfe65 Christoph Hellwig  2022-09-15  1338  EXPORT_SYMBOL_GPL(psi_memstall_enter);
eb414681d5a07d Johannes Weiner    2018-10-26  1339  
eb414681d5a07d Johannes Weiner    2018-10-26  1340  /**
eb414681d5a07d Johannes Weiner    2018-10-26  1341   * psi_memstall_leave - mark the end of an memory stall section
eb414681d5a07d Johannes Weiner    2018-10-26  1342   * @flags: flags to handle nested memdelay sections
eb414681d5a07d Johannes Weiner    2018-10-26  1343   *
eb414681d5a07d Johannes Weiner    2018-10-26  1344   * Marks the calling task as no longer stalled due to lack of memory.
eb414681d5a07d Johannes Weiner    2018-10-26  1345   */
eb414681d5a07d Johannes Weiner    2018-10-26  1346  void psi_memstall_leave(unsigned long *flags)
eb414681d5a07d Johannes Weiner    2018-10-26  1347  {
eb414681d5a07d Johannes Weiner    2018-10-26  1348  	struct rq_flags rf;
eb414681d5a07d Johannes Weiner    2018-10-26  1349  	struct rq *rq;
eb414681d5a07d Johannes Weiner    2018-10-26  1350  
e0c274472d5d27 Johannes Weiner    2018-11-30  1351  	if (static_branch_likely(&psi_disabled))
eb414681d5a07d Johannes Weiner    2018-10-26  1352  		return;
eb414681d5a07d Johannes Weiner    2018-10-26  1353  
eb414681d5a07d Johannes Weiner    2018-10-26  1354  	if (*flags)
eb414681d5a07d Johannes Weiner    2018-10-26  1355  		return;
3dfdd2f9d0dbe7 Lu Jialin          2024-01-02  1356  
3dfdd2f9d0dbe7 Lu Jialin          2024-01-02  1357  	trace_psi_memstall_leave(_RET_IP_);
eb414681d5a07d Johannes Weiner    2018-10-26  1358  	/*
1066d1b6974e09 Yafang Shao        2020-03-16  1359  	 * in_memstall clearing & accounting needs to be atomic wrt
eb414681d5a07d Johannes Weiner    2018-10-26  1360  	 * changes to the task's scheduling state, otherwise we could
eb414681d5a07d Johannes Weiner    2018-10-26  1361  	 * race with CPU migration.
eb414681d5a07d Johannes Weiner    2018-10-26  1362  	 */
eb414681d5a07d Johannes Weiner    2018-10-26  1363  	rq = this_rq_lock_irq(&rf);
eb414681d5a07d Johannes Weiner    2018-10-26  1364  
1066d1b6974e09 Yafang Shao        2020-03-16  1365  	current->in_memstall = 0;
cb0e52b7748737 Brian Chen         2021-11-10  1366  	psi_task_change(current, TSK_MEMSTALL | TSK_MEMSTALL_RUNNING, 0);
eb414681d5a07d Johannes Weiner    2018-10-26  1367  
eb414681d5a07d Johannes Weiner    2018-10-26  1368  	rq_unlock_irq(rq, &rf);
eb414681d5a07d Johannes Weiner    2018-10-26  1369  }
527eb453bbfe65 Christoph Hellwig  2022-09-15  1370  EXPORT_SYMBOL_GPL(psi_memstall_leave);
eb414681d5a07d Johannes Weiner    2018-10-26  1371  
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1372  #ifdef CONFIG_CGROUPS
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1373  int psi_cgroup_alloc(struct cgroup *cgroup)
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1374  {
e2ad8ab04c5cdf Chengming Zhou     2022-08-26  1375  	if (!static_branch_likely(&psi_cgroups_enabled))
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1376  		return 0;
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1377  
2b97cf76289a4f Hao Jia            2022-08-06  1378  	cgroup->psi = kzalloc(sizeof(struct psi_group), GFP_KERNEL);
5f69a6577bc33d Chen Wandun        2022-05-26  1379  	if (!cgroup->psi)
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1380  		return -ENOMEM;
5f69a6577bc33d Chen Wandun        2022-05-26  1381  
5f69a6577bc33d Chen Wandun        2022-05-26  1382  	cgroup->psi->pcpu = alloc_percpu(struct psi_group_cpu);
5f69a6577bc33d Chen Wandun        2022-05-26  1383  	if (!cgroup->psi->pcpu) {
5f69a6577bc33d Chen Wandun        2022-05-26  1384  		kfree(cgroup->psi);
5f69a6577bc33d Chen Wandun        2022-05-26  1385  		return -ENOMEM;
5f69a6577bc33d Chen Wandun        2022-05-26  1386  	}
5f69a6577bc33d Chen Wandun        2022-05-26  1387  	group_init(cgroup->psi);
dc86aba751e286 Chengming Zhou     2022-08-26  1388  	cgroup->psi->parent = cgroup_psi(cgroup_parent(cgroup));
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1389  	return 0;
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1390  }
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1391  
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1392  void psi_cgroup_free(struct cgroup *cgroup)
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1393  {
e2ad8ab04c5cdf Chengming Zhou     2022-08-26  1394  	if (!static_branch_likely(&psi_cgroups_enabled))
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1395  		return;
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1396  
5f69a6577bc33d Chen Wandun        2022-05-26  1397  	cancel_delayed_work_sync(&cgroup->psi->avgs_work);
5f69a6577bc33d Chen Wandun        2022-05-26  1398  	free_percpu(cgroup->psi->pcpu);
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1399  	/* All triggers must be removed by now */
65457b74aa9437 Domenico Cerasuolo 2023-03-30  1400  	WARN_ONCE(cgroup->psi->rtpoll_states, "psi: trigger leak\n");
5f69a6577bc33d Chen Wandun        2022-05-26  1401  	kfree(cgroup->psi);
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1402  }
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1403  
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1404  /**
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1405   * cgroup_move_task - move task to a different cgroup
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1406   * @task: the task
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1407   * @to: the target css_set
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1408   *
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1409   * Move task to a new cgroup and safely migrate its associated stall
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1410   * state between the different groups.
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1411   *
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1412   * This function acquires the task's rq lock to lock out concurrent
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1413   * changes to the task's scheduling state and - in case the task is
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1414   * running - concurrent changes to its stall state.
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1415   */
2ce7135adc9ad0 Johannes Weiner    2018-10-26 @1416  void cgroup_move_task(struct task_struct *task, struct css_set *to)
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1417  {
d583d360a620e6 Johannes Weiner    2021-05-03  1418  	unsigned int task_flags;
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1419  	struct rq_flags rf;
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1420  	struct rq *rq;
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1421  
e2ad8ab04c5cdf Chengming Zhou     2022-08-26  1422  	if (!static_branch_likely(&psi_cgroups_enabled)) {
8fcb2312d1e330 Olof Johansson     2018-11-16  1423  		/*
8fcb2312d1e330 Olof Johansson     2018-11-16  1424  		 * Lame to do this here, but the scheduler cannot be locked
8fcb2312d1e330 Olof Johansson     2018-11-16  1425  		 * from the outside, so we move cgroups from inside sched/.
8fcb2312d1e330 Olof Johansson     2018-11-16  1426  		 */
8fcb2312d1e330 Olof Johansson     2018-11-16  1427  		rcu_assign_pointer(task->cgroups, to);
8fcb2312d1e330 Olof Johansson     2018-11-16  1428  		return;
8fcb2312d1e330 Olof Johansson     2018-11-16  1429  	}
8fcb2312d1e330 Olof Johansson     2018-11-16  1430  
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1431  	rq = task_rq_lock(task, &rf);
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1432  
d583d360a620e6 Johannes Weiner    2021-05-03  1433  	/*
d583d360a620e6 Johannes Weiner    2021-05-03  1434  	 * We may race with schedule() dropping the rq lock between
d583d360a620e6 Johannes Weiner    2021-05-03  1435  	 * deactivating prev and switching to next. Because the psi
d583d360a620e6 Johannes Weiner    2021-05-03  1436  	 * updates from the deactivation are deferred to the switch
d583d360a620e6 Johannes Weiner    2021-05-03  1437  	 * callback to save cgroup tree updates, the task's scheduling
d583d360a620e6 Johannes Weiner    2021-05-03  1438  	 * state here is not coherent with its psi state:
d583d360a620e6 Johannes Weiner    2021-05-03  1439  	 *
d583d360a620e6 Johannes Weiner    2021-05-03  1440  	 * schedule()                   cgroup_move_task()
d583d360a620e6 Johannes Weiner    2021-05-03  1441  	 *   rq_lock()
d583d360a620e6 Johannes Weiner    2021-05-03  1442  	 *   deactivate_task()
d583d360a620e6 Johannes Weiner    2021-05-03  1443  	 *     p->on_rq = 0
d583d360a620e6 Johannes Weiner    2021-05-03  1444  	 *     psi_dequeue() // defers TSK_RUNNING & TSK_IOWAIT updates
d583d360a620e6 Johannes Weiner    2021-05-03  1445  	 *   pick_next_task()
d583d360a620e6 Johannes Weiner    2021-05-03  1446  	 *     rq_unlock()
d583d360a620e6 Johannes Weiner    2021-05-03  1447  	 *                                rq_lock()
d583d360a620e6 Johannes Weiner    2021-05-03  1448  	 *                                psi_task_change() // old cgroup
d583d360a620e6 Johannes Weiner    2021-05-03  1449  	 *                                task->cgroups = to
d583d360a620e6 Johannes Weiner    2021-05-03  1450  	 *                                psi_task_change() // new cgroup
d583d360a620e6 Johannes Weiner    2021-05-03  1451  	 *                                rq_unlock()
d583d360a620e6 Johannes Weiner    2021-05-03  1452  	 *     rq_lock()
d583d360a620e6 Johannes Weiner    2021-05-03  1453  	 *   psi_sched_switch() // does deferred updates in new cgroup
d583d360a620e6 Johannes Weiner    2021-05-03  1454  	 *
d583d360a620e6 Johannes Weiner    2021-05-03  1455  	 * Don't rely on the scheduling state. Use psi_flags instead.
d583d360a620e6 Johannes Weiner    2021-05-03  1456  	 */
d583d360a620e6 Johannes Weiner    2021-05-03  1457  	task_flags = task->psi_flags;
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1458  
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1459  	if (task_flags)
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1460  		psi_task_change(task, task_flags, 0);
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1461  
8fcb2312d1e330 Olof Johansson     2018-11-16  1462  	/* See comment above */
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1463  	rcu_assign_pointer(task->cgroups, to);
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1464  
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1465  	if (task_flags)
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1466  		psi_task_change(task, 0, task_flags);
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1467  
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1468  	task_rq_unlock(rq, task, &rf);
2ce7135adc9ad0 Johannes Weiner    2018-10-26  1469  }
34f26a15611afb Chengming Zhou     2022-09-07  1470  

:::::: The code at line 1262 was first introduced by commit
:::::: 52b1364ba0b105122d6de0e719b36db705011ac1 sched/psi: Add PSI_IRQ to track IRQ/SOFTIRQ pressure

:::::: TO: Chengming Zhou <zhouchengming@bytedance.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
