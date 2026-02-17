Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E538D1A08BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 02:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771295533; cv=none; b=dJWielwvqJkN2eBtBP91Vz0mGPBxLwNK1XCR/P8YyobAHVsoDrZEjdSr8b45Fp2iTcOp7R3WP6DN7fefyiiwrSBkUQq6IDgpIBz7frv40giXH25k6d7b5tuPghX0nIca2APOH0SxO4c1bhKuQZCUpcaCJaaqxnoYJAVMA5583UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771295533; c=relaxed/simple;
	bh=Zs2Atq6h1Wqc6grTG0CUpo812RYgv6v4L/kvxTkwieU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j7Uc8qPd9f7Hqbqebw5iPysajBW15MPNTjiF1H2k3CvqrUTP9/fb3H/2DLzE/wRGeLE8d6xFUIv08DkS09950D7tJw57xDTYeF/vp4GiFyQ8v+XbHHwZwsoPMlU0G/fwlQod1NMXzE3JGxLJaJZo7ZXMDsrItH7vdWA0Q1QDOSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbraUftK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbraUftK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771295532; x=1802831532;
  h=date:from:to:cc:subject:message-id;
  bh=Zs2Atq6h1Wqc6grTG0CUpo812RYgv6v4L/kvxTkwieU=;
  b=DbraUftKo8fprojs0gf+lHj6PqFeZM2exa3ZKXjCjUrdHk85FyngTxqw
   W132rd2Yo1ofu7rhw+FNCrMwHD+KPV/OI5RW51XAD/xWpieHl8qzNFP6I
   WoHCZw1p4JJ5WvjF0qDtQ8DXgK8ju6pXUtt59PUM2bj97r32YLfsipadv
   cf2xUNw0Vy7anF6rCSKSoMnrGtsD4QapO80Tce8jAOCEu+nI9DVn3RCOo
   WOCHU8b+gXb7bWNJ6Gyzl1ebkr570RxjvWTYE92gXcN0JoSi5HGaCC9bW
   MzQTInI6OlJjrgF19ZvLy9jwID2OY/R+OCnacJr93ACwofnkRR2lUzGZ4
   A==;
X-CSE-ConnectionGUID: BLTC+7YVTA6vRsdw0quHew==
X-CSE-MsgGUID: BMj4koThS1K2XgQC83KZGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89780113"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="89780113"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 18:32:11 -0800
X-CSE-ConnectionGUID: Q3AYwiRZRwm9u95OHNKxzQ==
X-CSE-MsgGUID: C74bVeawTKO7t3QUv4ocxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="218747297"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Feb 2026 18:32:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsAsg-000000010Xk-1JV7;
	Tue, 17 Feb 2026 02:32:06 +0000
Date: Tue, 17 Feb 2026 10:31:46 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>
Subject: kernel/sched/core.c:881:49: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202602171024.7LU9yYC8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9702969978695d9a699a1f34771580cdbb153b33
commit: e38e5299747b23015b00b0109891815db44a2f30 sched/hrtick: Fix hrtick() vs. scheduling context
date:   2 months ago
config: i386-randconfig-063-20260215 (https://download.01.org/0day-ci/archive/20260217/202602171024.7LU9yYC8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171024.7LU9yYC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171024.7LU9yYC8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:330:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:330:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:330:56: sparse:    struct task_struct *
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
   kernel/sched/core.c:6180:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6180:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6180:32: sparse:    struct task_struct *
   kernel/sched/core.c:6211:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6211:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6211:23: sparse:    struct task_struct *
   kernel/sched/core.c:6219:46: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6219:46: sparse:    struct task_struct *
   kernel/sched/core.c:6219:46: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6276:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:6276:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:6276:9: sparse:     got struct sched_domain [noderef] __rcu *parent
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
   kernel/sched/core.c:404:9: sparse: sparse: context imbalance in 'sched_core_lock' - different lock contexts for basic block
   kernel/sched/core.c:414:17: sparse: sparse: context imbalance in 'sched_core_unlock' - unexpected unlock
   kernel/sched/core.c:632:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:657:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:681:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1808:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1808:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
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
