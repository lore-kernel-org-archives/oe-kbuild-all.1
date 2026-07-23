Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0B930D41E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 07:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784793283; cv=none; b=QYLsWxHwqVtzmJb2z1vyZAYeJo8tzD8uCtL/XtwTocT8TKDPMjFjzTcZ9GTay1qbO1RY85BQB7XI83/6B9lUvVg6FCWBnKpkYCUyEW1bfkSHcmsG+SYsE0fbI2Lvxo5fwlJxNe13BgRwsiqJXfzl2jkJ7yRjx57AOZHQB0PGfrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784793283; c=relaxed/simple;
	bh=N4tAO51DH65hXVDHsfBPAojI1fgz/SnHKvYcL5bjP4M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uiKBaVGTVl9J6o1vH/mK4oeKNU7cgRk2gfdXVtQr7ws8Jko6G165xxwjYDkQnNKQAboy24C5DC4bvdBOnfqW5maxH7POXgTEL/u5kOydkYNk1vLK/c2WaB3thi6J3d75yoHS/7e4XHpmXgEepWQgLJWMjgX+tk026SI/SHGRP6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqrMy9n3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqrMy9n3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784793279; x=1816329279;
  h=date:from:to:cc:subject:message-id;
  bh=N4tAO51DH65hXVDHsfBPAojI1fgz/SnHKvYcL5bjP4M=;
  b=XqrMy9n3ii+6KcLlRWPMJjCkGBcjcCH0xfIyDCF7BXjUV/TuCnyaPKgO
   qMGaXI1RU8KpkYFtsHDQvkzjCq7YfyPp2H/x66XPn/olqNexs5bxPCkgG
   8iWxKuWTrJ/O+Muy7K/bvZT1/SKErQJ4aRVKIO296DrFV9FylM8eHQrB9
   Wb/9tCktb/3bXeiVy3EHM+Pe8RN2igcpYYGHJlfh13wYGnNCgDxXoMp5H
   HHO005ZG6avFJEaoFKVg05mKoGGblNACVe5wrNTXWGHpI9E4K5PigBLVl
   wq9H3DdCl4jAA21pqRyIkljdFE7unBGvxlBeLLgiumrKpOiDOurXKSihy
   Q==;
X-CSE-ConnectionGUID: Kfwnzqy8Qmuw1Vco+OXrKw==
X-CSE-MsgGUID: AqEr0fjwT4mKbJmMHAQ0XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89334117"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="89334117"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:54:39 -0700
X-CSE-ConnectionGUID: wQO+tLAEQ+GFOor9IrDKfQ==
X-CSE-MsgGUID: oLR+YfupTmO9qthRkOB+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="254408271"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jul 2026 00:54:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmoGH-00000000ZTB-3Oq1;
	Thu, 23 Jul 2026 07:54:33 +0000
Date: Thu, 23 Jul 2026 15:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202607231504.Y8MSRiKf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: cac5cefbade90ff0bb0b393d301fa3b5234cf056 sched/smp: Make SMP unconditional
date:   1 year, 1 month ago
config: openrisc-randconfig-r113-20260723 (https://download.01.org/0day-ci/archive/20260723/202607231504.Y8MSRiKf-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607231504.Y8MSRiKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cac5cefbade9 ("sched/smp: Make SMP unconditional")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231504.Y8MSRiKf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:1091:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1091:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1091:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2190:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2190:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2190:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2201:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2201:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2201:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3677:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3677:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3677:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3882:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3882:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3882:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5612:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5612:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5612:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6626:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6626:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6626:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7175:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7175:17: sparse:    struct task_struct *
   kernel/sched/core.c:7175:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10092:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10092:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10092:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:599:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:632:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:648:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:684:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:725:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
>> kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2437:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2437:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2437:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/core.c:2154:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2154:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2154:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2460:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2460:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2437:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2437:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2437:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2437:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2437:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2437:9: sparse:    struct task_struct *

vim +102 kernel/sched/pelt.h

e2f3e35f1f5a4dc Vincent Donnefort 2022-06-21   87  
23127296889fe84 Vincent Guittot   2019-01-23   88  /*
23127296889fe84 Vincent Guittot   2019-01-23   89   * The clock_pelt scales the time to reflect the effective amount of
23127296889fe84 Vincent Guittot   2019-01-23   90   * computation done during the running delta time but then sync back to
23127296889fe84 Vincent Guittot   2019-01-23   91   * clock_task when rq is idle.
23127296889fe84 Vincent Guittot   2019-01-23   92   *
23127296889fe84 Vincent Guittot   2019-01-23   93   *
23127296889fe84 Vincent Guittot   2019-01-23   94   * absolute time   | 1| 2| 3| 4| 5| 6| 7| 8| 9|10|11|12|13|14|15|16
23127296889fe84 Vincent Guittot   2019-01-23   95   * @ max capacity  ------******---------------******---------------
23127296889fe84 Vincent Guittot   2019-01-23   96   * @ half capacity ------************---------************---------
23127296889fe84 Vincent Guittot   2019-01-23   97   * clock pelt      | 1| 2|    3|    4| 7| 8| 9|   10|   11|14|15|16
23127296889fe84 Vincent Guittot   2019-01-23   98   *
23127296889fe84 Vincent Guittot   2019-01-23   99   */
23127296889fe84 Vincent Guittot   2019-01-23  100  static inline void update_rq_clock_pelt(struct rq *rq, s64 delta)
23127296889fe84 Vincent Guittot   2019-01-23  101  {
23127296889fe84 Vincent Guittot   2019-01-23 @102  	if (unlikely(is_idle_task(rq->curr))) {
e2f3e35f1f5a4dc Vincent Donnefort 2022-06-21  103  		_update_idle_rq_clock_pelt(rq);
23127296889fe84 Vincent Guittot   2019-01-23  104  		return;
23127296889fe84 Vincent Guittot   2019-01-23  105  	}
23127296889fe84 Vincent Guittot   2019-01-23  106  
23127296889fe84 Vincent Guittot   2019-01-23  107  	/*
23127296889fe84 Vincent Guittot   2019-01-23  108  	 * When a rq runs at a lower compute capacity, it will need
23127296889fe84 Vincent Guittot   2019-01-23  109  	 * more time to do the same amount of work than at max
23127296889fe84 Vincent Guittot   2019-01-23  110  	 * capacity. In order to be invariant, we scale the delta to
23127296889fe84 Vincent Guittot   2019-01-23  111  	 * reflect how much work has been really done.
23127296889fe84 Vincent Guittot   2019-01-23  112  	 * Running longer results in stealing idle time that will
23127296889fe84 Vincent Guittot   2019-01-23  113  	 * disturb the load signal compared to max capacity. This
23127296889fe84 Vincent Guittot   2019-01-23  114  	 * stolen idle time will be automatically reflected when the
23127296889fe84 Vincent Guittot   2019-01-23  115  	 * rq will be idle and the clock will be synced with
23127296889fe84 Vincent Guittot   2019-01-23  116  	 * rq_clock_task.
23127296889fe84 Vincent Guittot   2019-01-23  117  	 */
23127296889fe84 Vincent Guittot   2019-01-23  118  
23127296889fe84 Vincent Guittot   2019-01-23  119  	/*
23127296889fe84 Vincent Guittot   2019-01-23  120  	 * Scale the elapsed time to reflect the real amount of
23127296889fe84 Vincent Guittot   2019-01-23  121  	 * computation
23127296889fe84 Vincent Guittot   2019-01-23  122  	 */
8ec59c0f5f4966f Vincent Guittot   2019-06-17  123  	delta = cap_scale(delta, arch_scale_cpu_capacity(cpu_of(rq)));
23127296889fe84 Vincent Guittot   2019-01-23  124  	delta = cap_scale(delta, arch_scale_freq_capacity(cpu_of(rq)));
23127296889fe84 Vincent Guittot   2019-01-23  125  
23127296889fe84 Vincent Guittot   2019-01-23  126  	rq->clock_pelt += delta;
23127296889fe84 Vincent Guittot   2019-01-23  127  }
23127296889fe84 Vincent Guittot   2019-01-23  128  

:::::: The code at line 102 was first introduced by commit
:::::: 23127296889fe84b0762b191b5d041e8ba6f2599 sched/fair: Update scale invariance of PELT

:::::: TO: Vincent Guittot <vincent.guittot@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
