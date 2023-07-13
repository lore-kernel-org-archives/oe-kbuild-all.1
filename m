Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB95200CE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 22:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689287293; x=1720823293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XAMb382LzwwCvESIial4l12lIniiKa4iQeo1n91gKyk=;
  b=F7z3kRCSa7YH8f+/XpTqSnUd/r6fdqvVF6++TANVtYIk3HtJnyvVxW5D
   e7h8FKjSSdGLddLxNtGtijt57uUv7RbCrJoGYt8DGglSIAhJYGkARz9rx
   ogREIfLnG9Gne1h95DhnORoh7oCSAYGnNSXLatBUxeBJdfAj+PEtlF/NG
   WZwKPDaDiY/OYZd3TzVuuXwSICBSaBwLKsgnK5SVMe5BD3vveJ20mDmS/
   p10GEwQ7aszW0uC/B53keM9CCr/+u2OZw9yTvHgwj9KAsk95C1QxkOhjg
   K7gK3OgLqQZxLFcKflXe+Z0jcAqDMM/rJR8mECfv/Vpszw/9g6EeVgU6F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="350200764"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="350200764"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 15:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="722158278"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="722158278"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Jul 2023 15:28:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK4nC-0006wM-0t;
	Thu, 13 Jul 2023 22:28:10 +0000
Date: Fri, 14 Jul 2023 06:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Connor O'Brien <connoro@google.com>,
	John Stultz <jstultz@google.com>
Subject: [arm-de:tip/sched/core_20232906_proxy_exec_v4 9/12]
 kernel/sched/rt.c:1606:18: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202307140632.WrVVJN6F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.gitlab.arm.com/linux-arm/linux-de.git tip/sched/core_20232906_proxy_exec_v4
head:   6a8f4ce70148c468ef287fc38700ed2217f94c43
commit: bc1277464259d65e5044dcd2c2d988170e70e12a [9/12] sched: Split scheduler execution context
config: i386-randconfig-r082-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140632.WrVVJN6F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140632.WrVVJN6F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140632.WrVVJN6F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:961:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:961:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:961:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2410:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2410:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2410:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1047:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1047:36: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1047:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1585:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1585:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1585:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1924:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1924:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1924:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1605:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1605:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1605:14: sparse:     got struct task_struct [noderef] __rcu *
>> kernel/sched/rt.c:1606:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *selected @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1606:18: sparse:     expected struct task_struct *selected
   kernel/sched/rt.c:1606:18: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1667:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1667:43: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1667:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1710:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1710:36: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1710:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1730:63: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1730:63: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1730:63: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2092:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2092:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2092:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2113:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2113:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2113:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2461:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2461:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2461:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2463:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2463:38: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2463:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2463:66: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2463:66: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2463:66: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2303:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2303:21: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2303:21: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2313:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2313:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2313:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2421:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2421:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2421:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1941:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1941:40: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1941:40: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1952:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1952:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:1952:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1175:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1175:21: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1175:21: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1302:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1302:36: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1302:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2161:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2161:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2161:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:1825:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1825:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1825:14: sparse:     got struct task_struct [noderef] __rcu *
>> kernel/sched/deadline.c:1826:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *selected @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1826:18: sparse:     expected struct task_struct *selected
   kernel/sched/deadline.c:1826:18: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1902:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1902:41: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1902:41: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2466:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2466:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2466:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2468:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2468:21: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2468:21: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2470:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2470:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2470:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2633:29: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2633:29: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2633:29: sparse:    struct task_struct *
   kernel/sched/deadline.c:2682:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2105:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2105:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2105:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2105:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2105:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *

vim +1606 kernel/sched/rt.c

  1590	
  1591	static int
  1592	select_task_rq_rt(struct task_struct *p, int cpu, int flags)
  1593	{
  1594		struct task_struct *curr, *selected;
  1595		struct rq *rq;
  1596		bool test;
  1597	
  1598		/* For anything but wake ups, just return the task_cpu */
  1599		if (!(flags & (WF_TTWU | WF_FORK)))
  1600			goto out;
  1601	
  1602		rq = cpu_rq(cpu);
  1603	
  1604		rcu_read_lock();
  1605		curr = READ_ONCE(rq->curr); /* unlocked access */
> 1606		selected = READ_ONCE(rq_selected(rq));
  1607	
  1608		/*
  1609		 * If the current task on @p's runqueue is an RT task, then
  1610		 * try to see if we can wake this RT task up on another
  1611		 * runqueue. Otherwise simply start this RT task
  1612		 * on its current runqueue.
  1613		 *
  1614		 * We want to avoid overloading runqueues. If the woken
  1615		 * task is a higher priority, then it will stay on this CPU
  1616		 * and the lower prio task should be moved to another CPU.
  1617		 * Even though this will probably make the lower prio task
  1618		 * lose its cache, we do not want to bounce a higher task
  1619		 * around just because it gave up its CPU, perhaps for a
  1620		 * lock?
  1621		 *
  1622		 * For equal prio tasks, we just let the scheduler sort it out.
  1623		 *
  1624		 * Otherwise, just let it ride on the affined RQ and the
  1625		 * post-schedule router will push the preempted task away
  1626		 *
  1627		 * This test is optimistic, if we get it wrong the load-balancer
  1628		 * will have to sort it out.
  1629		 *
  1630		 * We take into account the capacity of the CPU to ensure it fits the
  1631		 * requirement of the task - which is only important on heterogeneous
  1632		 * systems like big.LITTLE.
  1633		 */
  1634		test = curr &&
  1635		       unlikely(rt_task(selected)) &&
  1636		       (curr->nr_cpus_allowed < 2 || selected->prio <= p->prio);
  1637	
  1638		if (test || !rt_task_fits_capacity(p, cpu)) {
  1639			int target = find_lowest_rq(p);
  1640	
  1641			/*
  1642			 * Bail out if we were forcing a migration to find a better
  1643			 * fitting CPU but our search failed.
  1644			 */
  1645			if (!test && target != -1 && !rt_task_fits_capacity(p, target))
  1646				goto out_unlock;
  1647	
  1648			/*
  1649			 * Don't bother moving it if the destination CPU is
  1650			 * not running a lower priority task.
  1651			 */
  1652			if (target != -1 &&
  1653			    p->prio < cpu_rq(target)->rt.highest_prio.curr)
  1654				cpu = target;
  1655		}
  1656	
  1657	out_unlock:
  1658		rcu_read_unlock();
  1659	
  1660	out:
  1661		return cpu;
  1662	}
  1663	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
