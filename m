Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1295A38DD3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 23:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734218980; cv=none; b=sxxzCiITuhKwNe6Wmn8WJYCntNtae8mUXKPuM60UpbAdW+z1/9NtbLmBV92UqEd+OAOZzRAJ67xjZJBoL6T3pmngXJUoMjW4whvQg9VyK4hRgPwI5LbRjmND8Yidm805NZEdKz8rW3D+x1PUrtmD1yxDi5EVmuLhLkLVwQIK0Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734218980; c=relaxed/simple;
	bh=tDNeFrCEjxXHV+cRi3KZ0dj61rLW8z4mq4DmNlUqR1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPPzSqz0WHiR/j8ZD2dLzwSRygJ5SGB3kOix8PeDrTPZ8r+AblxnKkx/pBJWEsWU1/Oyff7E5Q3Mw0shBg9Hs9i8PBkd/cIF6Sbs8mzntKWAs69MgINNOw5EqCasaAEusaqSp0wA0TlGA45EXKPEAbePRqKTicdK6r6PLAOr2fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxDuWz6R; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxDuWz6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734218979; x=1765754979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tDNeFrCEjxXHV+cRi3KZ0dj61rLW8z4mq4DmNlUqR1U=;
  b=LxDuWz6RLw+5nq9r56HoMUI4BrrY8nh7uKRKam/NF/kzrs3JmEsA1B9P
   RnRGkufxitKg7EL+Qj5EoFPQQTjuRre4wm3JPWdqZq2kehV3qH7DzMMSF
   C4cxyVqO4enESNTGfUq/WmbH47UTM0XKe36TJNMyHaurQDhn5kJrG8Pmf
   dPBAxaZhnfyBom+c3MnrxOa4cJAD+4BdSm/oLKx42XZYoFrktj2hiGS3h
   87x6A+v19sRb2E18HeCc46YT9JLYdV4UyGmqhfVLrzwW/AzcvjDqTDj6z
   8ZeK31SjK5PHx6ff+kgU8fjqww9wQKQY5bhd5dy2D0Xkx+tyhaK9fkh6i
   w==;
X-CSE-ConnectionGUID: I1m41x9OTViXctlp3rsEyA==
X-CSE-MsgGUID: kyFsomnvT+6OiWPcdExVtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="52061451"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="52061451"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 15:29:36 -0800
X-CSE-ConnectionGUID: RnZODCnDRVaZOK3SrPf3UQ==
X-CSE-MsgGUID: ADN8UxwNTg2q6z8YjOodjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="97092676"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Dec 2024 15:29:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMbZk-000DJk-0t;
	Sat, 14 Dec 2024 23:29:32 +0000
Date: Sun, 15 Dec 2024 07:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7232/7241]
 kernel/sched/core.c:4069:6: warning: no previous prototype for
 'move_queued_task_locked'
Message-ID: <202412150754.fRRLVt8v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   39fc9c68b13a226d44263bb908cccf8783e34d6e
commit: 9bad78b699e4f1746f447bcfa86f997861e5c4d9 [7232/7241] ANDROID: sched: Fix rt/dl load balancing via chain level balance
config: x86_64-randconfig-161-20241215 (https://download.01.org/0day-ci/archive/20241215/202412150754.fRRLVt8v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150754.fRRLVt8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150754.fRRLVt8v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:3976:21: warning: no previous prototype for 'find_exec_ctx' [-Wmissing-prototypes]
    3976 | struct task_struct *find_exec_ctx(struct rq *rq, struct task_struct *p)
         |                     ^~~~~~~~~~~~~
>> kernel/sched/core.c:4069:6: warning: no previous prototype for 'move_queued_task_locked' [-Wmissing-prototypes]
    4069 | void move_queued_task_locked(struct rq *src_rq, struct rq *dst_rq, struct task_struct *task)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'ttwu_runnable':
   kernel/sched/core.c:4224:63: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    4224 |                         trace_sched_pe_return_migration(p, p->wake_cpu);
         |                                                               ^~~~~~~~
         |                                                               wake_q
   In file included from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:280,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:10:
   kernel/sched/core.c: In function 'find_proxy_task':
   kernel/sched/core.c:7451:18: error: implicit declaration of function 'is_cpu_allowed'; did you mean 'cpuset_cpus_allowed'? [-Werror=implicit-function-declaration]
    7451 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                  ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7451:39: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7451 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                                       ^~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7452:16: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7452 |         if (p->wake_cpu == this_cpu) {
         |                ^~~~~~~~
         |                wake_q
   kernel/sched/core.c:7465:47: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7465 |         trace_sched_pe_return_migration(p, p->wake_cpu);
         |                                               ^~~~~~~~
         |                                               wake_q
   kernel/sched/core.c:7466:42: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7466 |         proxy_migrate_task(rq, rf, p, p->wake_cpu);
         |                                          ^~~~~~~~
         |                                          wake_q
   kernel/sched/core.c: In function '__schedule':
   kernel/sched/core.c:7626:25: error: implicit declaration of function 'zap_balance_callbacks'; did you mean 'balance_callbacks'? [-Werror=implicit-function-declaration]
    7626 |                         zap_balance_callbacks(rq);
         |                         ^~~~~~~~~~~~~~~~~~~~~
         |                         balance_callbacks
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]


vim +/move_queued_task_locked +4069 kernel/sched/core.c

  3971	
  3972	/*
  3973	 * Returns the unblocked task at the end of the blocked chain starting with p
  3974	 * if that chain is composed entirely of tasks enqueued on rq, or NULL otherwise.
  3975	 */
> 3976	struct task_struct *find_exec_ctx(struct rq *rq, struct task_struct *p)
  3977	{
  3978		struct task_struct *exec_ctx, *owner;
  3979	
  3980		if (!sched_proxy_exec())
  3981			return p;
  3982	
  3983		lockdep_assert_rq_held(rq);
  3984	
  3985		for (exec_ctx = p; task_is_blocked(exec_ctx) && !task_on_cpu(rq, exec_ctx);
  3986								exec_ctx = owner) {
  3987			owner = __mutex_owner(exec_ctx->blocked_on);
  3988			if (!owner || owner == exec_ctx)
  3989				break;
  3990	
  3991			if (!task_queued_on_rq(rq, owner) || task_current_donor(rq, owner)) {
  3992				exec_ctx = NULL;
  3993				break;
  3994			}
  3995		}
  3996		return exec_ctx;
  3997	}
  3998	
  3999	#ifdef CONFIG_SMP
  4000	void move_queued_task_locked(struct rq *src_rq, struct rq *dst_rq, struct task_struct *task)
  4001	{
  4002		lockdep_assert_rq_held(src_rq);
  4003		lockdep_assert_rq_held(dst_rq);
  4004	
  4005		if (!sched_proxy_exec()) {
  4006			__move_queued_task_locked(src_rq, dst_rq, task);
  4007			return;
  4008		}
  4009	
  4010		WARN_ON(!task_queued_on_rq(src_rq, task));
  4011		WARN_ON(task_current_donor(src_rq, task));
  4012	
  4013		while (task) {
  4014			struct task_struct *owner = NULL;
  4015	
  4016			if (!task_queued_on_rq(src_rq, task) || task_current_donor(src_rq, task))
  4017				break;
  4018	
  4019			if (task_is_blocked(task))
  4020				owner = __mutex_owner(task->blocked_on);
  4021	
  4022			__move_queued_task_locked(src_rq, dst_rq, task);
  4023			if (task == owner)
  4024				break;
  4025			task = owner;
  4026		}
  4027	}
  4028	
  4029	/*
  4030	 * Returns:
  4031	 * 1 if chain is pushable and affinity does not prevent pushing to cpu
  4032	 * 0 if chain is unpushable
  4033	 * -1 if chain is pushable but affinity blocks running on cpu.
  4034	 */
  4035	int task_is_pushable(struct rq *rq, struct task_struct *p, int cpu)
  4036	{
  4037		struct task_struct *exec_ctx;
  4038	
  4039		lockdep_assert_rq_held(rq);
  4040	
  4041		if (!sched_proxy_exec())
  4042			return __task_is_pushable(rq, p, cpu);
  4043	
  4044		if (task_rq(p) != rq || !task_on_rq_queued(p))
  4045			return 0;
  4046	
  4047		exec_ctx = find_exec_ctx(rq, p);
  4048		/*
  4049		 * Chain leads off the rq, we're free to push it anywhere.
  4050		 *
  4051		 * One wrinkle with relying on find_exec_ctx is that when the chain
  4052		 * leads to a task currently migrating to rq, we see the chain as
  4053		 * pushable & push everything prior to the migrating task. Even if
  4054		 * we checked explicitly for this case, we could still race with a
  4055		 * migration after the check.
  4056		 * This shouldn't permanently produce a bad state though, as
  4057		 * find_proxy_task() will send the chain back to rq and by that point
  4058		 * the migration should be complete & a proper push can occur.
  4059		 */
  4060		if (!exec_ctx)
  4061			return 1;
  4062	
  4063		if (task_on_cpu(rq, exec_ctx) || exec_ctx->nr_cpus_allowed <= 1)
  4064			return 0;
  4065	
  4066		return cpumask_test_cpu(cpu, &exec_ctx->cpus_mask) ? 1 : -1;
  4067	}
  4068	#else /* !CONFIG_SMP */
> 4069	void move_queued_task_locked(struct rq *src_rq, struct rq *dst_rq, struct task_struct *task)
  4070	{
  4071	}
  4072	#endif /* CONFIG_SMP */
  4073	#else /* !CONFIG_SCHED_PROXY_EXEC */
  4074	static inline void proxy_remove_from_sleeping_owner(struct task_struct *p)
  4075	{
  4076	}
  4077	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
