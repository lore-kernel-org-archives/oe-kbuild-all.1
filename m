Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D364D38A9DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 10:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300082; cv=none; b=fVvUSG6GeUES1kP0+EWrtW2w3PosJP3iFYi9hYud0H6/WjUUuEr7l9lDX3ZWSrfqNa9d4DyC+JPLHRzWtsPpF0fXF2phhtEgNB339Rjrqza9/qxNjAUlNl4dg3b6Dr19WM+OZLC3SkHsw5O1yG6qvYsjcI9Ruc42Wdam/sE6NTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300082; c=relaxed/simple;
	bh=0t1t6GbiyC720gQQJ8eT/RC5b3R7/7B5EO82Lem9mFI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KhkdDLsNV4e5/RTVfg4ieEAh30qVbDzVdIoNdOvgVxTsq1joQC9e0XOba6s8pCERoHbm+gIMzBcXYieFvVCX5/jBJUb07Fm32XUtlo+VwUp+Fok9PUchKN0QqZu0g/zVhILinF62bMNpR6qP/S8HXmWvsBoNYsQhdTjUci3xnbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXO+4fVr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXO+4fVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768300081; x=1799836081;
  h=date:from:to:cc:subject:message-id;
  bh=0t1t6GbiyC720gQQJ8eT/RC5b3R7/7B5EO82Lem9mFI=;
  b=hXO+4fVrrsnIiU67gj5EjbohYgEcl7HLaIqDmYQBcXbcvLq2AA+wTiLc
   A/7jZu2UhhmdbMoBomVC70QpiBJKQ5hDQeNcjijJTxkbMwn0BwMIEMEr6
   PH0Th7lcr2GkiWRm6+PrMxSXIqPRQ2hoX5YEwQ2qmXHxz5dEFhcKtGTn6
   XkG9Y6mmY6qEqskmoDKH20IvOFlada1+1b5ebjWBt9dcqbj+aexfdHykT
   XZVDw2NW36aHeV4z/4Rmh7Bt+HVRl96JyXUjNNgHOJAkO6Vs9VU9TWxfO
   y9vPglf3h1nFC5Pi7I8psl3V8+799tN8EUlnX/yO74EduJAO6ESXCxyYw
   w==;
X-CSE-ConnectionGUID: Gmk+KnH3Swm28nEthEnxuA==
X-CSE-MsgGUID: yw+gPKExTZWX2uIdVqgQ0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="92249361"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="92249361"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:27:57 -0800
X-CSE-ConnectionGUID: vLVYS3PDR9inq5/crzfs5A==
X-CSE-MsgGUID: aGA8Pz64Q1+yd6A3hUnmKw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 02:27:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfbct-00000000EbS-3eum;
	Tue, 13 Jan 2026 10:27:51 +0000
Date: Tue, 13 Jan 2026 18:27:19 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>
Subject: kernel/sched/core.c:881:49: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202601131800.QPUyjQNY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: e38e5299747b23015b00b0109891815db44a2f30 sched/hrtick: Fix hrtick() vs. scheduling context
date:   5 weeks ago
config: arm64-randconfig-r121-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131800.QPUyjQNY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131800.QPUyjQNY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131800.QPUyjQNY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:805:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:805:33: sparse:     expected struct task_struct *task
   kernel/sched/core.c:805:33: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:881:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:881:49: sparse:     expected struct task_struct *p
   kernel/sched/core.c:881:49: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:1101:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1101:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1101:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2175:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2175:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2175:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2186:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2186:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2186:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3583:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3583:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3583:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3788:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3788:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3788:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:8065:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:8065:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:8065:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5512:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5512:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5512:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6730:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6730:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6730:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6797:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6797:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6797:37: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7303:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7303:17: sparse:    struct task_struct *
   kernel/sched/core.c:7303:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10207:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10207:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10207:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:632:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:657:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:681:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:717:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:758:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:881:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2256:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2291:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct *
   kernel/sched/core.c:2170:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2170:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2170:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2635:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2635:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2635:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2635:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2635:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2612:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2612:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2612:9: sparse:    struct task_struct *

vim +881 kernel/sched/core.c

   867	
   868	/*
   869	 * High-resolution timer tick.
   870	 * Runs from hardirq context with interrupts disabled.
   871	 */
   872	static enum hrtimer_restart hrtick(struct hrtimer *timer)
   873	{
   874		struct rq *rq = container_of(timer, struct rq, hrtick_timer);
   875		struct rq_flags rf;
   876	
   877		WARN_ON_ONCE(cpu_of(rq) != smp_processor_id());
   878	
   879		rq_lock(rq, &rf);
   880		update_rq_clock(rq);
 > 881		rq->donor->sched_class->task_tick(rq, rq->donor, 1);
   882		rq_unlock(rq, &rf);
   883	
   884		return HRTIMER_NORESTART;
   885	}
   886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
