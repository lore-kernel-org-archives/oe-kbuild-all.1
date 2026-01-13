Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E725C363C41
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 05:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768283371; cv=none; b=LOP1a+dnCXDD8TXBWxd8RTp8i+iTcuhapxkiuZEjCHQsZyhQo/M13juKP3vhxYlIlByVB3EfI/Su+g7aojA36IPPVQiOo9cMOgEefFzZizMbgSy0Pg80I3RUbXdjP0x9eHEvYn53JP5pgelWDPi4e1YV2BMVa1wOTvz8bJLYx6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768283371; c=relaxed/simple;
	bh=OgkPWfvaBlgJ6hyF9e8qquxjc12LtgAcdwVBantNdMI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dlpVGDzts7GetxE6fZXmznZkUV/IAUWp0fCcQVvMhL9KAtMSNM8fiXQ9ZZt0m7pXuJ3cZjb41HiPco+olCXG1hbyEDYngcrE2pCAMHnJkzdzbNiD/Q7/VtgiDqgnp/ZwLm/wMC3MlntSN3RDy7kxuBj+33uk48fFTx2u6FbGeiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYieJJZA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYieJJZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768283369; x=1799819369;
  h=date:from:to:cc:subject:message-id;
  bh=OgkPWfvaBlgJ6hyF9e8qquxjc12LtgAcdwVBantNdMI=;
  b=dYieJJZAH96GBu1CK4A2un6iPeQJfBdwiIuvjYialfAtYgqqOikSUfKv
   xF+8hbOX891bjL33QDp6kI3gVufYtZC9MV6piGmt/QOBfjxlQDK5YjqV3
   cvlzWOzqXQsFhrDlRyC0IwJpufL1sZ6/ybutmEm7mLvyXC8fFEmk477mT
   aNcp5DLGH1SrPVOeVRzJDA6cuMfNUVHPV86gSyFWWtDCsAwBpb5aO8VEY
   X/vZP2WqRmzXkQGyFERTkWXuRaqkYSydXkMMWGXHrEVETStIgytj3YPFl
   ca3wWdQWtfYboHER+8T/R0jF7iOAz+YtlIM+fofeSGmyjUcG7wpSL98pZ
   A==;
X-CSE-ConnectionGUID: Tj28hkBMTHCujjB/utZKNA==
X-CSE-MsgGUID: nBrNaiWbSuqa+LAH4LjdlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69548071"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69548071"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 21:49:28 -0800
X-CSE-ConnectionGUID: GOuSEYg9R/ypV/2GiemlAA==
X-CSE-MsgGUID: ojqn2+c4RO2xKFPuIUXv/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209119900"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jan 2026 21:49:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfXHQ-00000000EIA-2fCy;
	Tue, 13 Jan 2026 05:49:24 +0000
Date: Tue, 13 Jan 2026 13:48:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 33/33]
 kernel/sched/core.c:2787:3: error: call to undeclared function
 'move_queued_task_locked'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202601131352.jF9eiEnn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   c818542ead502009bd003c189fcc86795005133e
commit: f77e294987675cc8ef143bb52667ff0025416d73 [33/33] ANDROID: sched: Fix rt/dl load balancing via chain level balance
config: x86_64-randconfig-161-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131352.jF9eiEnn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131352.jF9eiEnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131352.jF9eiEnn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:2787:3: error: call to undeclared function 'move_queued_task_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2787 |                 move_queued_task_locked(rq, lowest_rq, p);
         |                 ^
   kernel/sched/core.c:2787:3: note: did you mean '__move_queued_task_locked'?
   kernel/sched/sched.h:3890:6: note: '__move_queued_task_locked' declared here
    3890 | void __move_queued_task_locked(struct rq *src_rq, struct rq *dst_rq, struct task_struct *task)
         |      ^
   kernel/sched/core.c:8619:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    8619 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:8594:1: note: array 'preempt_modes' declared here
    8594 | const char *preempt_modes[] = {
         | ^
   1 warning and 1 error generated.
--
   In file included from kernel/sched/build_policy.c:52:
>> kernel/sched/rt.c:1846:7: error: call to undeclared function 'task_is_pushable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1846 |                 if (task_is_pushable(rq, p, cpu) == 1)
         |                     ^
   kernel/sched/rt.c:1846:7: note: did you mean '__task_is_pushable'?
   kernel/sched/sched.h:3901:5: note: '__task_is_pushable' declared here
    3901 | int __task_is_pushable(struct rq *rq, struct task_struct *p, int cpu)
         |     ^
   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c:1965:7: error: call to undeclared function 'task_is_pushable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1965 |                 if (task_is_pushable(rq, p, 0)) {
         |                     ^
   kernel/sched/rt.c:2059:18: error: call to undeclared function 'task_is_pushable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2059 |                 int pushable = task_is_pushable(rq, task, lowest->cpu);
         |                                ^
>> kernel/sched/rt.c:2231:2: error: call to undeclared function 'move_queued_task_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2231 |         move_queued_task_locked(rq, lowest_rq, next_task);
         |         ^
   kernel/sched/rt.c:2231:2: note: did you mean '__move_queued_task_locked'?
   kernel/sched/sched.h:3890:6: note: '__move_queued_task_locked' declared here
    3890 | void __move_queued_task_locked(struct rq *src_rq, struct rq *dst_rq, struct task_struct *task)
         |      ^
   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c:2505:5: error: call to undeclared function 'move_queued_task_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2505 |                                 move_queued_task_locked(src_rq, this_rq, p);
         |                                 ^
   In file included from kernel/sched/build_policy.c:58:
>> kernel/sched/deadline.c:2472:7: error: call to undeclared function 'task_is_pushable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2472 |                 if (task_is_pushable(rq, p, cpu) == 1)
         |                     ^
   kernel/sched/deadline.c:2587:7: error: call to undeclared function 'task_is_pushable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2587 |                 if (task_is_pushable(rq, p, 0))
         |                     ^
   kernel/sched/deadline.c:2665:18: error: call to undeclared function 'task_is_pushable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2665 |                 int pushable = task_is_pushable(rq, task, later->cpu);
         |                                ^
>> kernel/sched/deadline.c:2795:2: error: call to undeclared function 'move_queued_task_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2795 |         move_queued_task_locked(rq, later_rq, next_task);
         |         ^
   kernel/sched/deadline.c:2881:5: error: call to undeclared function 'move_queued_task_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2881 |                                 move_queued_task_locked(src_rq, this_rq, p);
         |                                 ^
   10 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +/move_queued_task_locked +2787 kernel/sched/core.c

5cc389bcee088b Peter Zijlstra 2015-06-11  2760  
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2761  int push_cpu_stop(void *arg)
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2762  {
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2763  	struct rq *lowest_rq = NULL, *rq = this_rq();
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2764  	struct task_struct *p = arg;
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2765  
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2766  	raw_spin_lock_irq(&p->pi_lock);
5cb9eaa3d274f7 Peter Zijlstra 2020-11-17  2767  	raw_spin_rq_lock(rq);
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2768  
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2769  	if (task_rq(p) != rq)
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2770  		goto out_unlock;
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2771  
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2772  	if (is_migration_disabled(p)) {
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2773  		p->migration_flags |= MDF_PUSH;
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2774  		goto out_unlock;
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2775  	}
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2776  
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2777  	p->migration_flags &= ~MDF_PUSH;
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2778  
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2779  	if (p->sched_class->find_lock_rq)
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2780  		lowest_rq = p->sched_class->find_lock_rq(p, rq);
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2781  
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2782  	if (!lowest_rq)
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2783  		goto out_unlock;
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2784  
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2785  	// XXX validate p is still the highest prio task
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2786  	if (task_rq(p) == rq) {
2b05a0b4c08ffd Connor O'Brien 2024-10-09 @2787  		move_queued_task_locked(rq, lowest_rq, p);
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2788  		resched_curr(lowest_rq);
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2789  	}
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2790  
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2791  	double_unlock_balance(rq, lowest_rq);
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2792  
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2793  out_unlock:
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2794  	rq->push_busy = false;
5cb9eaa3d274f7 Peter Zijlstra 2020-11-17  2795  	raw_spin_rq_unlock(rq);
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2796  	raw_spin_unlock_irq(&p->pi_lock);
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2797  
a7c81556ec4d34 Peter Zijlstra 2020-09-28  2798  	put_task_struct(p);
5cc389bcee088b Peter Zijlstra 2015-06-11  2799  	return 0;
5cc389bcee088b Peter Zijlstra 2015-06-11  2800  }
4d4666820ab722 Rick Yiu       2025-06-06  2801  EXPORT_SYMBOL_GPL(push_cpu_stop);
5cc389bcee088b Peter Zijlstra 2015-06-11  2802  

:::::: The code at line 2787 was first introduced by commit
:::::: 2b05a0b4c08ffd6dedfbd27af8708742cde39b95 sched: Add move_queued_task_locked helper

:::::: TO: Connor O'Brien <connoro@google.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
