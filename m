Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01312E6CD8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771223488; cv=none; b=DSZsrYMhW7V672SBy4nz7jbUG+LRWyxZIg0wdiPemeOmr1kSkOcb3Pr16MxJCaUggki3X1Qg1OTLxM+TduIrch6+krf5a9izoKPp3ELCFpHmy65eqGE8Eta8UfzvmjCQn/7MFOnZRGuRmu7foozhmPoxpfpf/1v8se5uCmxsg6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771223488; c=relaxed/simple;
	bh=AdiOz8NpVddcORoHoB91hYSie71AYr+k6p8dpYH+Drk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iGTJ/niIgIJ73Khlv4AYTTIZyrL+6mTQMkznMoOnSPr4zUYWeh/Sbtbnt2TI8mPmrSY6bqtdFoFi9TAXMhWHGLjNkJ+3L6A6fc+/6P6EYrMT2OB77ML4C5aQJRhNq8pR05ISGXTu6tzi0huD9tU7OzCLFpL/8ET1QOX3tcEsjyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abJ5RtxQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abJ5RtxQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771223488; x=1802759488;
  h=date:from:to:cc:subject:message-id;
  bh=AdiOz8NpVddcORoHoB91hYSie71AYr+k6p8dpYH+Drk=;
  b=abJ5RtxQDV10IyqPtk55LMg+IEckhRsssjm10ZOsqx6x5BFnUNCAXs+H
   78r8tj3pgs1FrWQ6niTElS2Fh/Bh6zDjLlrjgl/TKbEH2ixBRgJ7BhP5T
   joN9F7EHQlHl7DF5s/+WJ4464aTpr7/2dqG260xxn2GWi0H+mpJv/VX3d
   Q6JzWgMvoY4wsTyGEIpOMWLihhQcsf/3vavaS9j+09A9Zd7QTwl84mxyD
   UUE4nx2tdrPunyoHSeZRTln7lJJIH1sWYG89+ulGY3+VFEpkd1Gny5MX7
   5W9FNBVwoKr4Gz2zFfJV5Fs9Kr5fWMwcq0wRro/p2jLPv10ikJTPj2Evm
   A==;
X-CSE-ConnectionGUID: s4m7IdR0Rv6wc9eeSSy4Ag==
X-CSE-MsgGUID: TV4RbWlDQWS2T/AxiPPERw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="82633421"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="82633421"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 22:31:27 -0800
X-CSE-ConnectionGUID: vYWaymKaQGWtsyf41Tb5cg==
X-CSE-MsgGUID: hVAMnvEDSn+e1g3NmeihKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="213359861"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Feb 2026 22:31:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrs8f-00000000zRs-3PGK;
	Mon, 16 Feb 2026 06:31:21 +0000
Date: Mon, 16 Feb 2026 14:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Juri Lelli <juri.lelli@redhat.com>,
 "Connor O'Brien" <connoro@google.com>, John Stultz <jstultz@google.com>,
 Metin Kaya <metin.kaya@arm.com>
Subject: kernel/sched/deadline.c:2703:23: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202602161456.uWPO6NT7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: af0c8b2bf67b25756f27644936e74fd9a6273bd2 sched: Split scheduler and execution contexts
date:   1 year, 4 months ago
config: i386-randconfig-063-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161456.uWPO6NT7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161456.uWPO6NT7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161456.uWPO6NT7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:2336:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2336:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2336:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:991:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:991:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:991:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1529:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1529:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1529:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1849:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1849:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1849:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1549:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1549:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1549:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1550:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1550:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1550:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1611:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1611:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1611:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1654:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1654:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1654:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1674:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1674:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1674:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2018:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2018:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2018:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2041:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2041:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2041:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2387:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2387:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2387:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2389:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2389:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2389:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2389:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2389:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2389:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/deadline.c:2703:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2703:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2703:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2713:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2713:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2713:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2819:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2819:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2819:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2342:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2342:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2342:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2353:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2353:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2353:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1242:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1242:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1242:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1242:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1342:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1342:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1342:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1651:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1651:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1651:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1651:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1651:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1651:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1739:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1739:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1739:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2564:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2564:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2564:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2226:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2226:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2226:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2227:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2227:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2227:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2303:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2303:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2303:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2864:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2864:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2864:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2866:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2866:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2866:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2868:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2868:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2868:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3043:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3043:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3043:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3092:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2473:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2473:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1336:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block

vim +2703 kernel/sched/deadline.c

  2681	
  2682	/*
  2683	 * See if the non running -deadline tasks on this rq
  2684	 * can be sent to some other CPU where they can preempt
  2685	 * and start executing.
  2686	 */
  2687	static int push_dl_task(struct rq *rq)
  2688	{
  2689		struct task_struct *next_task;
  2690		struct rq *later_rq;
  2691		int ret = 0;
  2692	
  2693		next_task = pick_next_pushable_dl_task(rq);
  2694		if (!next_task)
  2695			return 0;
  2696	
  2697	retry:
  2698		/*
  2699		 * If next_task preempts rq->curr, and rq->curr
  2700		 * can move away, it makes sense to just reschedule
  2701		 * without going further in pushing next_task.
  2702		 */
> 2703		if (dl_task(rq->donor) &&
  2704		    dl_time_before(next_task->dl.deadline, rq->donor->dl.deadline) &&
  2705		    rq->curr->nr_cpus_allowed > 1) {
  2706			resched_curr(rq);
  2707			return 0;
  2708		}
  2709	
  2710		if (is_migration_disabled(next_task))
  2711			return 0;
  2712	
  2713		if (WARN_ON(next_task == rq->curr))
  2714			return 0;
  2715	
  2716		/* We might release rq lock */
  2717		get_task_struct(next_task);
  2718	
  2719		/* Will lock the rq it'll find */
  2720		later_rq = find_lock_later_rq(next_task, rq);
  2721		if (!later_rq) {
  2722			struct task_struct *task;
  2723	
  2724			/*
  2725			 * We must check all this again, since
  2726			 * find_lock_later_rq releases rq->lock and it is
  2727			 * then possible that next_task has migrated.
  2728			 */
  2729			task = pick_next_pushable_dl_task(rq);
  2730			if (task == next_task) {
  2731				/*
  2732				 * The task is still there. We don't try
  2733				 * again, some other CPU will pull it when ready.
  2734				 */
  2735				goto out;
  2736			}
  2737	
  2738			if (!task)
  2739				/* No more tasks */
  2740				goto out;
  2741	
  2742			put_task_struct(next_task);
  2743			next_task = task;
  2744			goto retry;
  2745		}
  2746	
  2747		move_queued_task_locked(rq, later_rq, next_task);
  2748		ret = 1;
  2749	
  2750		resched_curr(later_rq);
  2751	
  2752		double_unlock_balance(rq, later_rq);
  2753	
  2754	out:
  2755		put_task_struct(next_task);
  2756	
  2757		return ret;
  2758	}
  2759	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
