Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751161;
	b=pTnrA0XB7bkNyskQ9+yDZFDCjIy4y0Qt4DOLQJUcdlAnBfZryTesLf/EXNvxaTH9C5lM
	 FIntGCEM8qcocphWMf101pTf13DHIP5N5VpaJxlosiZ+1J9FDpE8dQC9S4kJxudCDEgK9
	 xYFW/yt0sreSvtzZ+OPVakIFWXN5ZjObu4zaJC40ad+ylk6drxeqvUdbaPLr2iSDPPwq2
	 75xO2K93p6lhJTHZQ6n/m2P9RoyeL0UlpgRddHeBekda1IpvlNcwMWYhgrQO2w8yFce3r
	 FRqIYas+Ggv3eBeX/xTGdDFfcnRcqCpsYcmLcMjmy56gsBZXqyQQBn5BUTF2fsk40WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751161;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1IUH7SquYfxcotm3HRcTWKdexVB3rMe8blwZ4Z1ZcIU=;
	b=lxRoOj3gaq557E40C7Uo8xxeuhSC1RGsRaY4TiAsOEyAbs5szn6675gdafmI2R0VWOwC
	 yLhhbQvHp1WQXWJNEjFoh0LZukY5bxXJW1Ngssyn+LpkupRiFX2KzwY3s7qnCAvu646Hk
	 83sWe01EvpxtoGABBq6Aj4+z6lrUE8Yx4uxCwNx7XvFyYIMfOAw3FM7oNRaTJ2Ib442z6
	 iUVzb0AiJCLYHmNr84RHP20Hu5dRRhGEYJp9Ch4gz/CgXLhvw1ntRngad7jgodgUzwRuI
	 MD52D1sXMf20ODiorZfOcGp32EVZ/3fuFpjaT1ss0/RhKkiQUYq4LCBSBduoSKIuI+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hnaDbJyq;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848A9606A31B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 10:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 848A9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hnaDbJyq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792751159; x=1824287159;
  h=date:from:to:cc:subject:message-id;
  bh=g/2pDceCT5D7/RmAu7qSEKqAIFmgoNOCchTM4xsBR38=;
  b=hnaDbJyqnuF0bbXuMh+lg5WWusmQHZVs8b1iThRiClxPWLTj+v6zg/gX
   X+UXr2Df7Qq05AciQcjdA/lF6KDdFs5ydjEJA2bpqoEKroaQ3PlzvKB4O
   BVTIadNe3E+8xfaTYp/WtfrSpix9AJsvYq1ls6T2+4usbwNWawOdIa6Cf
   eAWh6wZvNsUT4iba1gGKeVdnnr8wlImKxeTgvxpUGrAr+KQQrQ+Rl9CqG
   mpB0vhkMqXHrNoCiSLIhBJ3eF403Lr+iHT8+MOVnNM3pM8ThUiy9X+KnK
   p0Q73Jw6dQ6en7Vj4V42oYlO5qP8sMafAfapGo7UZAQooceStUzkdQwO5
   w==;
X-CSE-ConnectionGUID: sJsUUHKJQg+juGCdOTLiuQ==
X-CSE-MsgGUID: ye5dk/MVQcmkfERPGZRK5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1546931"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1546931"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 03:25:59 -0700
X-CSE-ConnectionGUID: SqRm4l0nStafWKOH6/JgmA==
X-CSE-MsgGUID: irHWob0/To29x3oyOTFiuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3940057"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2026 03:25:58 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKCTD-000000000aH-282g;
	Fri, 23 Oct 2026 10:25:55 +0000
Date: Fri, 23 Oct 2026 12:25:37 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.3/prjc 647/732] kernel/sched/alt_core.c:5859:43:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202610231207.aZy3S3si-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Alfred,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 7.3/prjc
head:   f1ab44d828f1d74c6ec1d7a6cf32bc79cec13905
commit: f12c89ee63642bc3e9b2868770e78964634b8b3b [647/732] sched/alt: [Sync] dcb7416212e6 block: invalidate cached plug timestamp after task switch
config: powerpc64-randconfig-r2307-20261023 (https://download.01.org/0day-ci/archive/20261023/202610231207.aZy3S3si-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231207.aZy3S3si-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231207.aZy3S3si-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/alt_core.c:109:1: sparse: sparse: symbol 'sched_cpu_topo_end_mask' was not declared. Should it be static?
   kernel/sched/alt_core.c:487:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:487:33: sparse:     expected struct task_struct *task
   kernel/sched/alt_core.c:487:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:2505:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:2505:36: sparse:     expected struct task_struct const *p
   kernel/sched/alt_core.c:2505:36: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:5859:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:5859:43: sparse:     expected struct task_struct *push_task
   kernel/sched/alt_core.c:5859:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:3916:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:3916:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:3916:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:4000:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4000:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4000:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4644:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4644:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4644:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5170:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5170:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5170:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5716:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:5716:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:5716:25: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:6623:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct task_struct * @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:6623:16: sparse:     expected struct task_struct *
   kernel/sched/alt_core.c:6623:16: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:923:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:923:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:923:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:923:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:923:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:923:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1831:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1831:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1831:38: sparse:    struct task_struct const *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c: note: in included file (through kernel/sched/sched.h):
   kernel/sched/alt_sched.h:333:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:333:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:333:25: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:333:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:333:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:333:25: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *

vim +5859 kernel/sched/alt_core.c

f8de7c4f70ca15 Alfred Chen 2021-02-02  5852  
f8de7c4f70ca15 Alfred Chen 2021-02-02  5853  /*
b4ddc13cd70176 Alfred Chen 2021-06-08  5854   * This is enabled below SCHED_AP_ACTIVE; when !cpu_active(), but only
b4ddc13cd70176 Alfred Chen 2021-06-08  5855   * effective when the hotplug motion is down.
f8de7c4f70ca15 Alfred Chen 2021-02-02  5856   */
f8de7c4f70ca15 Alfred Chen 2021-02-02  5857  static void balance_push(struct rq *rq)
f8de7c4f70ca15 Alfred Chen 2021-02-02  5858  {
f8de7c4f70ca15 Alfred Chen 2021-02-02 @5859  	struct task_struct *push_task = rq->curr;
f8de7c4f70ca15 Alfred Chen 2021-02-02  5860  
f8de7c4f70ca15 Alfred Chen 2021-02-02  5861  	lockdep_assert_held(&rq->lock);
b4ddc13cd70176 Alfred Chen 2021-06-08  5862  
f8de7c4f70ca15 Alfred Chen 2021-02-02  5863  	/*
f8de7c4f70ca15 Alfred Chen 2021-02-02  5864  	 * Ensure the thing is persistent until balance_push_set(.on = false);
f8de7c4f70ca15 Alfred Chen 2021-02-02  5865  	 */
f8de7c4f70ca15 Alfred Chen 2021-02-02  5866  	rq->balance_callback = &balance_push_callback;
f8de7c4f70ca15 Alfred Chen 2021-02-02  5867  
b4ddc13cd70176 Alfred Chen 2021-06-08  5868  	/*
1164bba2944a83 Alfred Chen 2021-09-19  5869  	 * Only active while going offline and when invoked on the outgoing
1164bba2944a83 Alfred Chen 2021-09-19  5870  	 * CPU.
b4ddc13cd70176 Alfred Chen 2021-06-08  5871  	 */
1164bba2944a83 Alfred Chen 2021-09-19  5872  	if (!cpu_dying(rq->cpu) || rq != this_rq())
b4ddc13cd70176 Alfred Chen 2021-06-08  5873  		return;
b4ddc13cd70176 Alfred Chen 2021-06-08  5874  
f8de7c4f70ca15 Alfred Chen 2021-02-02  5875  	/*
f8de7c4f70ca15 Alfred Chen 2021-02-02  5876  	 * Both the cpu-hotplug and stop task are in this case and are
f8de7c4f70ca15 Alfred Chen 2021-02-02  5877  	 * required to complete the hotplug process.
f8de7c4f70ca15 Alfred Chen 2021-02-02  5878  	 */
57a626dcc74bcf Alfred Chen 2021-08-11  5879  	if (kthread_is_per_cpu(push_task) ||
0e3bda43af9f48 Alfred Chen 2021-02-09  5880  	    is_migration_disabled(push_task)) {
f8de7c4f70ca15 Alfred Chen 2021-02-02  5881  
f8de7c4f70ca15 Alfred Chen 2021-02-02  5882  		/*
f8de7c4f70ca15 Alfred Chen 2021-02-02  5883  		 * If this is the idle task on the outgoing CPU try to wake
f8de7c4f70ca15 Alfred Chen 2021-02-02  5884  		 * up the hotplug control thread which might wait for the
f8de7c4f70ca15 Alfred Chen 2021-02-02  5885  		 * last task to vanish. The rcuwait_active() check is
f8de7c4f70ca15 Alfred Chen 2021-02-02  5886  		 * accurate here because the waiter is pinned on this CPU
f8de7c4f70ca15 Alfred Chen 2021-02-02  5887  		 * and can't obviously be running in parallel.
f8de7c4f70ca15 Alfred Chen 2021-02-02  5888  		 *
f8de7c4f70ca15 Alfred Chen 2021-02-02  5889  		 * On RT kernels this also has to check whether there are
f8de7c4f70ca15 Alfred Chen 2021-02-02  5890  		 * pinned and scheduled out tasks on the runqueue. They
f8de7c4f70ca15 Alfred Chen 2021-02-02  5891  		 * need to leave the migrate disabled section first.
f8de7c4f70ca15 Alfred Chen 2021-02-02  5892  		 */
0e3bda43af9f48 Alfred Chen 2021-02-09  5893  		if (!rq->nr_running && !rq_has_pinned_tasks(rq) &&
0e3bda43af9f48 Alfred Chen 2021-02-09  5894  		    rcuwait_active(&rq->hotplug_wait)) {
f8de7c4f70ca15 Alfred Chen 2021-02-02  5895  			raw_spin_unlock(&rq->lock);
f8de7c4f70ca15 Alfred Chen 2021-02-02  5896  			rcuwait_wake_up(&rq->hotplug_wait);
f8de7c4f70ca15 Alfred Chen 2021-02-02  5897  			raw_spin_lock(&rq->lock);
f8de7c4f70ca15 Alfred Chen 2021-02-02  5898  		}
f8de7c4f70ca15 Alfred Chen 2021-02-02  5899  		return;
f8de7c4f70ca15 Alfred Chen 2021-02-02  5900  	}
f8de7c4f70ca15 Alfred Chen 2021-02-02  5901  
f8de7c4f70ca15 Alfred Chen 2021-02-02  5902  	get_task_struct(push_task);
f8de7c4f70ca15 Alfred Chen 2021-02-02  5903  	/*
f8de7c4f70ca15 Alfred Chen 2021-02-02  5904  	 * Temporarily drop rq->lock such that we can wake-up the stop task.
f8de7c4f70ca15 Alfred Chen 2021-02-02  5905  	 * Both preemption and IRQs are still disabled.
f8de7c4f70ca15 Alfred Chen 2021-02-02  5906  	 */
46fab6469e8ca7 Alfred Chen 2024-01-08  5907  	preempt_disable();
f8de7c4f70ca15 Alfred Chen 2021-02-02  5908  	raw_spin_unlock(&rq->lock);
f8de7c4f70ca15 Alfred Chen 2021-02-02  5909  	stop_one_cpu_nowait(rq->cpu, __balance_push_cpu_stop, push_task,
f8de7c4f70ca15 Alfred Chen 2021-02-02  5910  			    this_cpu_ptr(&push_work));
46fab6469e8ca7 Alfred Chen 2024-01-08  5911  	preempt_enable();
f8de7c4f70ca15 Alfred Chen 2021-02-02  5912  	/*
f8de7c4f70ca15 Alfred Chen 2021-02-02  5913  	 * At this point need_resched() is true and we'll take the loop in
f8de7c4f70ca15 Alfred Chen 2021-02-02  5914  	 * schedule(). The next pick is obviously going to be the stop task
f8de7c4f70ca15 Alfred Chen 2021-02-02  5915  	 * which kthread_is_per_cpu() and will push this task away.
f8de7c4f70ca15 Alfred Chen 2021-02-02  5916  	 */
f8de7c4f70ca15 Alfred Chen 2021-02-02  5917  	raw_spin_lock(&rq->lock);
f8de7c4f70ca15 Alfred Chen 2021-02-02  5918  }
f8de7c4f70ca15 Alfred Chen 2021-02-02  5919  

:::::: The code at line 5859 was first introduced by commit
:::::: f8de7c4f70ca1595d37f5f62b0819ccd0cb9e564 sched/alt: [Sync] af449901b84c sched: Add migrate_disable()

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
