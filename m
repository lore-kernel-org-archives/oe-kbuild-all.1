Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E181F938
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 22:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689286101; x=1720822101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ct1ocZLVf8D76mI0i4VjVUGD6ylBhBFE2X1ZsDl+jMM=;
  b=HiVZnSy6zvtRTBofM1huVr+2Eo+s2qosXAKF+/3MGf+vO5OirH0x5vAB
   wjWflUDhViGfqxSVcl1h9E9NXuXWMVWIjZpbqGU+Z0PXrJjdAreyN+PRt
   8k+IgT43cFh6mrWzDZyN3BTn0yVqlMxRtBTs/zrh2OHM98nW64rtlu+8k
   fD1JM9f/XB3WN0MOOJSKM6s7lh85N9o5wYV22OZkhePbR4gTet0xXL+Bp
   hCbj9g9ZzmgDE2y54tGC12fsXXZcTu+taTS98yh+Gk5ogETfmKb8wza04
   unXZ6QleI0RCAe1zbfcck0r7QjiA7ooNhm2/jmFZ6ZjQ+IcDKfpddTyhC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367968098"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="367968098"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 15:08:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="672451026"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="672451026"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Jul 2023 15:08:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK4Tp-0006vd-2L;
	Thu, 13 Jul 2023 22:08:09 +0000
Date: Fri, 14 Jul 2023 06:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Connor O'Brien <connoro@google.com>,
	John Stultz <jstultz@google.com>
Subject: [arm-de:tip/sched/core_20232906_proxy_exec_v4 9/12]
 kernel/sched/fair.c:7919:37: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202307140644.TO5OTKF6-lkp@intel.com>
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
config: um-randconfig-r083-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140644.TO5OTKF6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140644.TO5OTKF6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140644.TO5OTKF6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:922:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:922:36: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:922:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:967:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:967:32: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:967:32: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:7885:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7885:36: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:7885:36: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/fair.c:7919:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7919:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:7919:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8183:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8183:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8183:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:6177:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2280:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2280:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2280:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *

vim +7919 kernel/sched/fair.c

  7879	
  7880	/*
  7881	 * Preempt the current task with a newly woken task if needed:
  7882	 */
  7883	static void check_preempt_wakeup(struct rq *rq, struct task_struct *p, int wake_flags)
  7884	{
  7885		struct task_struct *curr = rq_selected(rq);
  7886		struct sched_entity *se = &curr->se, *pse = &p->se;
  7887		struct cfs_rq *cfs_rq = task_cfs_rq(curr);
  7888		int scale = cfs_rq->nr_running >= sched_nr_latency;
  7889		int next_buddy_marked = 0;
  7890		int cse_is_idle, pse_is_idle;
  7891	
  7892		if (unlikely(se == pse))
  7893			return;
  7894	
  7895		/*
  7896		 * This is possible from callers such as attach_tasks(), in which we
  7897		 * unconditionally check_preempt_curr() after an enqueue (which may have
  7898		 * lead to a throttle).  This both saves work and prevents false
  7899		 * next-buddy nomination below.
  7900		 */
  7901		if (unlikely(throttled_hierarchy(cfs_rq_of(pse))))
  7902			return;
  7903	
  7904		if (sched_feat(NEXT_BUDDY) && scale && !(wake_flags & WF_FORK)) {
  7905			set_next_buddy(pse);
  7906			next_buddy_marked = 1;
  7907		}
  7908	
  7909		/*
  7910		 * We can come here with TIF_NEED_RESCHED already set from new task
  7911		 * wake up path.
  7912		 *
  7913		 * Note: this also catches the edge-case of curr being in a throttled
  7914		 * group (e.g. via set_curr_task), since update_curr() (in the
  7915		 * enqueue of curr) will have resulted in resched being set.  This
  7916		 * prevents us from potentially nominating it as a false LAST_BUDDY
  7917		 * below.
  7918		 */
> 7919		if (test_tsk_need_resched(rq->curr))
  7920			return;
  7921	
  7922		/* Idle tasks are by definition preempted by non-idle tasks. */
  7923		if (unlikely(task_has_idle_policy(curr)) &&
  7924		    likely(!task_has_idle_policy(p)))
  7925			goto preempt;
  7926	
  7927		/*
  7928		 * Batch and idle tasks do not preempt non-idle tasks (their preemption
  7929		 * is driven by the tick):
  7930		 */
  7931		if (unlikely(p->policy != SCHED_NORMAL) || !sched_feat(WAKEUP_PREEMPTION))
  7932			return;
  7933	
  7934		find_matching_se(&se, &pse);
  7935		WARN_ON_ONCE(!pse);
  7936	
  7937		cse_is_idle = se_is_idle(se);
  7938		pse_is_idle = se_is_idle(pse);
  7939	
  7940		/*
  7941		 * Preempt an idle group in favor of a non-idle group (and don't preempt
  7942		 * in the inverse case).
  7943		 */
  7944		if (cse_is_idle && !pse_is_idle)
  7945			goto preempt;
  7946		if (cse_is_idle != pse_is_idle)
  7947			return;
  7948	
  7949		update_curr(cfs_rq_of(se));
  7950		if (wakeup_preempt_entity(se, pse) == 1) {
  7951			/*
  7952			 * Bias pick_next to pick the sched entity that is
  7953			 * triggering this preemption.
  7954			 */
  7955			if (!next_buddy_marked)
  7956				set_next_buddy(pse);
  7957			goto preempt;
  7958		}
  7959	
  7960		return;
  7961	
  7962	preempt:
  7963		resched_curr(rq);
  7964		/*
  7965		 * Only set the backward buddy when the current task is still
  7966		 * on the rq. This can happen when a wakeup gets interleaved
  7967		 * with schedule on the ->pre_schedule() or idle_balance()
  7968		 * point, either of which can * drop the rq lock.
  7969		 *
  7970		 * Also, during early boot the idle thread is in the fair class,
  7971		 * for obvious reasons its a bad idea to schedule back to it.
  7972		 */
  7973		if (unlikely(!se->on_rq || curr == rq->idle))
  7974			return;
  7975	
  7976		if (sched_feat(LAST_BUDDY) && scale && entity_is_task(se))
  7977			set_last_buddy(se);
  7978	}
  7979	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
