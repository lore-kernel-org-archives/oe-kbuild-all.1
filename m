Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2071B2192
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 22:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734213933; cv=none; b=Gmsc6lwbg1sJncSxmB3QqDoBsYiFwStKM5Hg1QeudqwfM5coBPL7djMahhuxwNtsaaOQqvo5hKLLAB12gt5RnUjRmLcuHkd5k53/QR7baZTiynJL1+pF5rVi333EzqW4W+RsSI1L0W7qd6DRKj+Dx9FHShB6Sh9Y/2mWIk02hbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734213933; c=relaxed/simple;
	bh=VRG+uQhF0vQHVPzr/XeAUYetlxXjCljmp8WFwAh7npM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N3EK0esF4XRgBybkmr/a1j6BQft3aqFDmySXE1cFlrPDJLQzutP7n+yZHu2IBTei+HAucCZIkH9k8ZwHeYLfAmA8aZjrThqfj3fpnUtNZHUMn9ui7cqy2XCHt/z6wnBUW1/CfliSsFfURdkprjzCC53zw0VgyFkBXFSJlYLQcfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQdmqMhm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQdmqMhm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734213931; x=1765749931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VRG+uQhF0vQHVPzr/XeAUYetlxXjCljmp8WFwAh7npM=;
  b=CQdmqMhmXMW+0f7NrQOksXs2zljq5kzaHRbaTiXkGhGDM0WraImVElf5
   chc5D4yjy1sPc4WzCPBbApUw+pmx3AB36H5M44Nun0vSUEA9zCoMcY2PS
   9KbQ5ZFdcIHJOnosw1ig3jtpnOR1guE0mzHYq1G+JUFiTqKyWVMXBsR6j
   dmwpXgYhhOtcMlfxhB7ipLFCOlbYl6e7V2UvXDaV6+J5iwO560Qdx2QEL
   72U6e4n36BHvxHG13C7yReTY/yOXPNFLnU2Es1U99bjKmYBY+It6WlMJX
   mfA0/tpDEyR6/D88zTCPc2yxsaQJXKVIE+ZuHYZsakqOpf+boyvBpER//
   A==;
X-CSE-ConnectionGUID: M78Zk4H7RJamb+jmoFaW7w==
X-CSE-MsgGUID: j6aLh0VfTgaLdFR/98zMpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="45243727"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="45243727"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 14:05:28 -0800
X-CSE-ConnectionGUID: tCUb+VaoTYyBAsbNH45OPg==
X-CSE-MsgGUID: 2OR2KRcDQjOzR0JS1Q409A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="96716805"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Dec 2024 14:05:27 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMaGL-000DH8-1w;
	Sat, 14 Dec 2024 22:05:25 +0000
Date: Sun, 15 Dec 2024 06:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7352/7391]
 kernel/sched/core.c:4069:6: warning: no previous prototype for function
 'move_queued_task_locked'
Message-ID: <202412150513.M1TgnMJ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   979e6f6aa3c78b92ad965d072eddc53477a84fb6
commit: 9bad78b699e4f1746f447bcfa86f997861e5c4d9 [7352/7391] ANDROID: sched: Fix rt/dl load balancing via chain level balance
config: i386-randconfig-141-20241215 (https://download.01.org/0day-ci/archive/20241215/202412150513.M1TgnMJ1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150513.M1TgnMJ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150513.M1TgnMJ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/sched/core.c:3976:21: warning: no previous prototype for function 'find_exec_ctx' [-Wmissing-prototypes]
    3976 | struct task_struct *find_exec_ctx(struct rq *rq, struct task_struct *p)
         |                     ^
   kernel/sched/core.c:3976:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3976 | struct task_struct *find_exec_ctx(struct rq *rq, struct task_struct *p)
         | ^
         | static 
>> kernel/sched/core.c:4069:6: warning: no previous prototype for function 'move_queued_task_locked' [-Wmissing-prototypes]
    4069 | void move_queued_task_locked(struct rq *src_rq, struct rq *dst_rq, struct task_struct *task)
         |      ^
   kernel/sched/core.c:4069:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4069 | void move_queued_task_locked(struct rq *src_rq, struct rq *dst_rq, struct task_struct *task)
         | ^
         | static 
   kernel/sched/core.c:4224:42: error: no member named 'wake_cpu' in 'struct task_struct'
    4224 |                         trace_sched_pe_return_migration(p, p->wake_cpu);
         |                                                            ~  ^
   kernel/sched/core.c:7451:11: error: call to undeclared function 'is_cpu_allowed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7451 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                  ^
   kernel/sched/core.c:7451:32: error: no member named 'wake_cpu' in 'struct task_struct'
    7451 |         WARN_ON(!is_cpu_allowed(p, p->wake_cpu));
         |                                    ~  ^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7452:9: error: no member named 'wake_cpu' in 'struct task_struct'
    7452 |         if (p->wake_cpu == this_cpu) {
         |             ~  ^
   kernel/sched/core.c:7465:40: error: no member named 'wake_cpu' in 'struct task_struct'
    7465 |         trace_sched_pe_return_migration(p, p->wake_cpu);
         |                                            ~  ^
   kernel/sched/core.c:7466:35: error: no member named 'wake_cpu' in 'struct task_struct'
    7466 |         proxy_migrate_task(rq, rf, p, p->wake_cpu);
         |                                       ~  ^
   kernel/sched/core.c:7626:4: error: call to undeclared function 'zap_balance_callbacks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7626 |                         zap_balance_callbacks(rq);
         |                         ^
   kernel/sched/core.c:7626:4: note: did you mean '__balance_callbacks'?
   kernel/sched/core.c:5593:20: note: '__balance_callbacks' declared here
    5593 | static inline void __balance_callbacks(struct rq *rq)
         |                    ^
   3 warnings and 7 errors generated.


vim +/move_queued_task_locked +4069 kernel/sched/core.c

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
