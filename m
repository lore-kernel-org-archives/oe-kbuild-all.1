Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFF2282F2A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 22:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772492189; cv=none; b=YsJAVaqbyeng2+jqL9Pr5tq1eTD1KQ7dpAudp9+S1Cq8TvMu71z7jxHTQTex2aJOqNiG4vHkhGmi+DnJVaJikINBzKevCrjHBGpa6dXvsH46TMNroXiGR3HJl7IfL4W81fUZ1YNbybIMiiHAN29oxMyoi+UeU5t7QfvsV1Zlyuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772492189; c=relaxed/simple;
	bh=O8fHbsmUKOGlt4BCNla5SU6MaTAQbCFqQZ9uR1hCPiU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uf3tDwcrk/QjRmPXzB0DAVy6g3BFxOxopAQhmi/3XhvALbn0VxW/VKpH6oHA0aqljrhOWoFtWJ5m5ZMA4QvqBLX4jUeXnnxpjDq/PC4tAW8r6cBAGqaK0eve2jVPMeoAJuiGTQ1AriHmbG0iAFuKGBg6Cfw7bG2kVT7sdDI6LTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8h15ov0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8h15ov0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772492185; x=1804028185;
  h=date:from:to:cc:subject:message-id;
  bh=O8fHbsmUKOGlt4BCNla5SU6MaTAQbCFqQZ9uR1hCPiU=;
  b=X8h15ov0FxatqQ+UDjmzhyi3ZaEiVYPq0TXIN+6kd/4sZo4iSfubRhf1
   Lz0ssFeZiQU6qXara1Z/UhJ2LVE6V4GF9aCc/cUj+lyqROfA8FuIPWnZ1
   cAc9SWjfpKN7RdAVqJWYRcb8734vMvj+vWPddraVu1fhTT9TjPH9eL7WW
   b4e5m6kWq0JG8P5EaQG+FirBJhVfJcRMFflDu+cfOuhedzzeY8VxS8/e8
   O42PQp/x+JJl71I7FnMwfGGyllJ7e9cy6AkypT8eDH2e9JPbN0c31Na3J
   1pfoU6piJBfZX+Z5UsZxrvzXPfzLmS0z3zeEZCGwzbjEisC22sNlScAEU
   Q==;
X-CSE-ConnectionGUID: nQosgZxQRQSuVzwNVjo5WA==
X-CSE-MsgGUID: 0wyxSTL4S1y27UFiu5RYhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84864638"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="84864638"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 14:56:24 -0800
X-CSE-ConnectionGUID: 0NXYaqv2RUKISy6OrIL2dQ==
X-CSE-MsgGUID: PL8GxwLTQq2ZjyJj5mDK0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="244773371"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Mar 2026 14:56:23 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxCBY-000000001Td-1nFi;
	Mon, 02 Mar 2026 22:56:20 +0000
Date: Tue, 03 Mar 2026 06:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext_idle.c:736:33: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202603030625.EdEmNcXG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
commit: d310fb40096896abe1928b88224129bf7122532f sched_ext: Clean up scx_root usages
date:   10 months ago
config: sparc-randconfig-r122-20260302 (https://download.01.org/0day-ci/archive/20260303/202603030625.EdEmNcXG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603030625.EdEmNcXG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603030625.EdEmNcXG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext.c:3394:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3394:49: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3394:49: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3430:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3430:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3430:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3451:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3451:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3451:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3510:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3510:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3510:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3529:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3529:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3529:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3641:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3641:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3641:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3720:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3720:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3720:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3772:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3772:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3772:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3799:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3799:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3799:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3812:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3812:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3812:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3941:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3941:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3941:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3956:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3956:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3956:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:5057:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5057:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5057:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5099:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5099:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5099:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5209:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5209:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:5209:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5971:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5971:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:5971:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6080:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6080:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6080:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:6352:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6352:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6352:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:6485:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6485:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6485:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:7332:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:7332:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:7332:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:245:24: sparse: sparse: Using plain integer as NULL pointer
>> kernel/sched/ext_idle.c:736:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext_idle.c:766:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:253:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:253:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:253:48: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2441:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2441:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1295:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1697:15: sparse: sparse: dereference of noderef expression

vim +736 kernel/sched/ext_idle.c

   717	
   718	/*
   719	 * Update the idle state of a CPU to @idle.
   720	 *
   721	 * If @do_notify is true, ops.update_idle() is invoked to notify the scx
   722	 * scheduler of an actual idle state transition (idle to busy or vice
   723	 * versa). If @do_notify is false, only the idle state in the idle masks is
   724	 * refreshed without invoking ops.update_idle().
   725	 *
   726	 * This distinction is necessary, because an idle CPU can be "reserved" and
   727	 * awakened via scx_bpf_pick_idle_cpu() + scx_bpf_kick_cpu(), marking it as
   728	 * busy even if no tasks are dispatched. In this case, the CPU may return
   729	 * to idle without a true state transition. Refreshing the idle masks
   730	 * without invoking ops.update_idle() ensures accurate idle state tracking
   731	 * while avoiding unnecessary updates and maintaining balanced state
   732	 * transitions.
   733	 */
   734	void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
   735	{
 > 736		struct scx_sched *sch = scx_root;
   737		int cpu = cpu_of(rq);
   738	
   739		lockdep_assert_rq_held(rq);
   740	
   741		/*
   742		 * Trigger ops.update_idle() only when transitioning from a task to
   743		 * the idle thread and vice versa.
   744		 *
   745		 * Idle transitions are indicated by do_notify being set to true,
   746		 * managed by put_prev_task_idle()/set_next_task_idle().
   747		 */
   748		if (SCX_HAS_OP(sch, update_idle) && do_notify && !scx_rq_bypassing(rq))
   749			SCX_CALL_OP(SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
   750	
   751		/*
   752		 * Update the idle masks:
   753		 * - for real idle transitions (do_notify == true)
   754		 * - for idle-to-idle transitions (indicated by the previous task
   755		 *   being the idle thread, managed by pick_task_idle())
   756		 *
   757		 * Skip updating idle masks if the previous task is not the idle
   758		 * thread, since set_next_task_idle() has already handled it when
   759		 * transitioning from a task to the idle thread (calling this
   760		 * function with do_notify == true).
   761		 *
   762		 * In this way we can avoid updating the idle masks twice,
   763		 * unnecessarily.
   764		 */
   765		if (static_branch_likely(&scx_builtin_idle_enabled))
   766			if (do_notify || is_idle_task(rq->curr))
   767				update_builtin_idle(cpu, idle);
   768	}
   769	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
