Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBFA10A3A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYNKzrUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699698314; x=1731234314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gzAW+jbbT0DzHgHZ+3l31KF6horzJFlHllPKICVMSR8=;
  b=CYNKzrUmqlr9sLp5+RXoNmwybID6F3vwDTbKx2T9fmAhqn4nPejgiq7t
   7hiOR5IrU+kgEx8UtE0AHQyj479kD+UO/Xe1nmJSvDorNRsqv0U+l6iJB
   zCK7Fy2O2zxS3T2G18ZjB2O01ZEY2LYUEBAXrc79RN6uaJieh4d5E7BZ/
   b1HHu2YS6BwzxfJYPcf1JuLoIzVnpmE/Idbx4j+jUYUqqIZoPWb3dj0za
   F3Xn4Hd6WfIWcWspRMnVKGa6Qf3Ewwjoz7khAIhx9ydwXNh8/OwY6DxII
   IPE+BINxUfbG7GRgZcnCjd8zlpzZceoUVWj86/THxBhRed6AVOCEqSNTD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="421363446"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="421363446"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 02:25:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="907635489"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="907635489"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Nov 2023 02:25:12 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1lAs-000AN6-1D;
	Sat, 11 Nov 2023 10:25:10 +0000
Date: Sat, 11 Nov 2023 18:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 11/20] sched: Split scheduler execution context
Message-ID: <202311111836.bVMOgOgk-lkp@intel.com>
References: <20231106193524.866104-12-jstultz@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106193524.866104-12-jstultz@google.com>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on v6.6]
[cannot apply to tip/sched/core tip/master linus/master tip/auto-latest next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Stultz/sched-Unify-runtime-accounting-across-classes/20231107-033946
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20231106193524.866104-12-jstultz%40google.com
patch subject: [PATCH v6 11/20] sched: Split scheduler execution context
config: i386-randconfig-062-20231111 (https://download.01.org/0day-ci/archive/20231111/202311111836.bVMOgOgk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111836.bVMOgOgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111836.bVMOgOgk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:961:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:961:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:961:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2411:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2411:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2411:25: sparse:    struct task_struct [noderef] __rcu *
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
   kernel/sched/rt.c:2093:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2093:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2093:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2114:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2114:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2114:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2462:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2462:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2462:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2464:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2464:38: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2464:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2464:66: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2464:66: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2464:66: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2301:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2301:21: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2301:21: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2311:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2311:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2311:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2419:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2419:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2419:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1939:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1939:40: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1939:40: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1950:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1950:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:1950:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1177:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1177:21: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1177:21: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1300:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1300:36: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1300:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2159:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2159:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2159:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:1823:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1823:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1823:14: sparse:     got struct task_struct [noderef] __rcu *
>> kernel/sched/deadline.c:1824:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *selected @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1824:18: sparse:     expected struct task_struct *selected
   kernel/sched/deadline.c:1824:18: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1900:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1900:41: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1900:41: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2464:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2464:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2464:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2466:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2466:21: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2466:21: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2468:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2468:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2468:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2643:29: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2643:29: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2643:29: sparse:    struct task_struct *
   kernel/sched/deadline.c:2692:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2155:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2155:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2166:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2155:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2166:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2155:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2155:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2166:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct *

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
