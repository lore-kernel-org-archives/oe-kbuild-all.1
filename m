Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9B0137E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 21:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734213271; cv=none; b=kBod4demSlfR8cGICWnHIg5Mcohso6okb71SzwA6kddCTtZljF65TASWVTcdBxjaOiVmz3BKTP8WsIHRshKNRFnQxxSm6l8U9xwt0tX9BtjPYEp8zfDTxyYNq0WVm1KNN+u394sDUrBwK0J//dMUw5QdgyK+AgfQ6YtlYF5H9Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734213271; c=relaxed/simple;
	bh=4jgqbhbx5I3x3WzbiS29IeQNSh7vewVRpXyNrWNpCoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jxK8E2LOIYVaCK4S1f7ihWkinQ/5DUHyyzDpx/Vfsghg6pmaGfsfMuru9zEGaZwO7KjRvGd68E+VIlC+uylnLk2wHQVNEMaanJE4H3OMCH6dInhsNrv6Q497TP4GrgH/QpbfvokDZVwSr0Iutnu7o8Cq9GOhDxPoZQpQ8Gbm/pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqz/npM0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqz/npM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734213269; x=1765749269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4jgqbhbx5I3x3WzbiS29IeQNSh7vewVRpXyNrWNpCoU=;
  b=bqz/npM02Jy1/LQv8TTSyuQNUJVirB585Fs2pEIbnJFR45MfXZYp7jMX
   kKrwbLqhvTjiWlz5Tu2vQ2j3wt+BzhhPQWbLurRokr6u3POSXMvP26e06
   KTfmO3pHzBN93pFP4B2NXK3AAu/1n2oM/dPgsYWMotlJQS84UEyQMrwhD
   UcKz/LJL01K9Bz1bEHx5XxBICbKe6tIcvxDkwrz3t3CAN38ufD2ds292X
   dvLp5mZIwiv1idllo7o9+t4e3Mf158cGf88hsG6wgLOKkYb6GxS/02muU
   e2Ig24+GJ+blR5GigQ9wTANb786C5Src4vYvh+gUWGudiqG2WcksxWtpg
   g==;
X-CSE-ConnectionGUID: vvyfDLl/R2+CG8JanNtV9w==
X-CSE-MsgGUID: Lki38boAStCfynXtpAxpSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="60031746"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="60031746"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 13:54:28 -0800
X-CSE-ConnectionGUID: TnB9Tji2SaqKg87Itz2G5w==
X-CSE-MsgGUID: 4Ydfc+ZgQHKlhPyep9IaFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101815967"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Dec 2024 13:54:27 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMa5g-000DGE-1a;
	Sat, 14 Dec 2024 21:54:24 +0000
Date: Sun, 15 Dec 2024 05:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7230/7241]
 kernel/sched/core.c:3976:21: warning: no previous prototype for
 'find_exec_ctx'
Message-ID: <202412150516.2qjKlw2Q-lkp@intel.com>
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
commit: a70dd213296b2f2524c2b4440cb60d46f85ab2e4 [7230/7241] ANDROID: sched: Add find_exec_ctx helper
config: x86_64-randconfig-161-20241215 (https://download.01.org/0day-ci/archive/20241215/202412150516.2qjKlw2Q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150516.2qjKlw2Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150516.2qjKlw2Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:3976:21: warning: no previous prototype for 'find_exec_ctx' [-Wmissing-prototypes]
    3976 | struct task_struct *find_exec_ctx(struct rq *rq, struct task_struct *p)
         |                     ^~~~~~~~~~~~~
   kernel/sched/core.c: In function 'ttwu_runnable':
   kernel/sched/core.c:4149:63: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    4149 |                         trace_sched_pe_return_migration(p, p->wake_cpu);
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
   kernel/sched/core.c:7376:18: error: implicit declaration of function 'is_cpu_allowed'; did you mean 'cpuset_cpus_allowed'? [-Werror=implicit-function-declaration]
    7376 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                  ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7376:39: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7376 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                                       ^~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7377:16: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7377 |         if (p->wake_cpu == this_cpu) {
         |                ^~~~~~~~
         |                wake_q
   kernel/sched/core.c:7390:47: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7390 |         trace_sched_pe_return_migration(p, p->wake_cpu);
         |                                               ^~~~~~~~
         |                                               wake_q
   kernel/sched/core.c:7391:42: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    7391 |         proxy_migrate_task(rq, rf, p, p->wake_cpu);
         |                                          ^~~~~~~~
         |                                          wake_q
   kernel/sched/core.c: In function '__schedule':
   kernel/sched/core.c:7551:25: error: implicit declaration of function 'zap_balance_callbacks'; did you mean 'balance_callbacks'? [-Werror=implicit-function-declaration]
    7551 |                         zap_balance_callbacks(rq);
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


vim +/find_exec_ctx +3976 kernel/sched/core.c

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
  3998	#else /* !CONFIG_SCHED_PROXY_EXEC */
  3999	static inline void proxy_remove_from_sleeping_owner(struct task_struct *p)
  4000	{
  4001	}
  4002	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
