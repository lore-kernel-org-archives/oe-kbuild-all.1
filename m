Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D37323AF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 11:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675337131; x=1706873131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DqXMklSEtz2gUZ2EazfiN1eEGqt5uAO0xXyggtlcp+k=;
  b=Vln9XVwQdiNYwPIUzm4hK+lbJn61LgUKyaCVbv7gPEtHdzQS+sQ0qLEh
   9PJBpeJikqKjGdeHUXWUO8CZEPx0SUV8+GiFzOOpySTa6F/7Q3uPi7LaY
   9v7pGjO97h+tUs3YNcBgmdRb+ez4+H1OwFnrSOpWmhEBfSHJHDzqFI6qN
   UqoOo1xBORH4S5dkMfV614ferauuz5nL2Qezigii5YgqpH95j9rnD8bR1
   2NgAWAP7kRY47IQY9XBpE9qMx9BtgSgEYjIhNUYIVX9FUo5f68+I883Rc
   Rwbw9Cxh2SBxRQLaWAisypZYRObhBKcrMpQZJ8ZyEloA+uFRbNebO9jHV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308071906"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="308071906"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 03:25:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="754029005"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="754029005"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2023 03:25:27 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNXiZ-0006Sd-0N;
	Thu, 02 Feb 2023 11:25:27 +0000
Date: Thu, 2 Feb 2023 19:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle.feb2.2023 3/3] kernel/sched/rt.c:963:50:
 error: 'struct rt_rq' has no member named 'tg'
Message-ID: <202302021940.YpSV36HG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle.feb2.2023
head:   1bd3cc21bb61cc085f34fe3a493233bceb1994e0
commit: 1bd3cc21bb61cc085f34fe3a493233bceb1994e0 [3/3] sched/rt: Keep throttled rt_rqs on the runqueue
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230202/202302021940.YpSV36HG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=1bd3cc21bb61cc085f34fe3a493233bceb1994e0
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle.feb2.2023
        git checkout 1bd3cc21bb61cc085f34fe3a493233bceb1994e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c: In function 'do_sched_rt_period_timer':
>> kernel/sched/rt.c:963:50: error: 'struct rt_rq' has no member named 'tg'
     963 |                                         if (rt_rq->tg && rt_rq->tg->parent)
         |                                                  ^~
   kernel/sched/rt.c:963:63: error: 'struct rt_rq' has no member named 'tg'
     963 |                                         if (rt_rq->tg && rt_rq->tg->parent)
         |                                                               ^~
   kernel/sched/rt.c:964:69: error: 'struct rt_rq' has no member named 'tg'
     964 |                                                 parent_rt_se = rt_rq->tg->parent->rt_se[i];
         |                                                                     ^~
   kernel/sched/rt.c:966:49: error: implicit declaration of function 'adjust_cg_throt_update' [-Werror=implicit-function-declaration]
     966 |                                                 adjust_cg_throt_update(parent_rt_se, false);
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:923:21: warning: unused variable 'enqueue' [-Wunused-variable]
     923 |                 int enqueue = 0;
         |                     ^~~~~~~
   kernel/sched/rt.c: In function 'update_curr_rt':
   kernel/sched/rt.c:1101:54: error: 'struct sched_rt_entity' has no member named 'parent'
    1101 |                                 if (!tbefore && rt_se->parent)
         |                                                      ^~
   kernel/sched/rt.c:1102:69: error: 'struct sched_rt_entity' has no member named 'parent'
    1102 |                                         adjust_cg_throt_update(rt_se->parent, true);
         |                                                                     ^~
   kernel/sched/rt.c: At top level:
   kernel/sched/rt.c:1331:13: warning: conflicting types for 'adjust_cg_throt_update'; have 'void(struct sched_rt_entity *, bool)' {aka 'void(struct sched_rt_entity *, _Bool)'}
    1331 | static void adjust_cg_throt_update(struct sched_rt_entity *rse, bool throt) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:1331:13: error: static declaration of 'adjust_cg_throt_update' follows non-static declaration
   kernel/sched/rt.c:966:49: note: previous implicit declaration of 'adjust_cg_throt_update' with type 'void(struct sched_rt_entity *, bool)' {aka 'void(struct sched_rt_entity *, _Bool)'}
     966 |                                                 adjust_cg_throt_update(parent_rt_se, false);
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c: In function '__delist_rt_entity':
   kernel/sched/rt.c:1426:56: error: 'struct sched_rt_entity' has no member named 'parent'
    1426 |         if (!tbefore && rt_rq_throttled(rt_rq) && rt_se->parent)
         |                                                        ^~
   kernel/sched/rt.c:1427:45: error: 'struct sched_rt_entity' has no member named 'parent'
    1427 |                 adjust_cg_throt_update(rt_se->parent, true);
         |                                             ^~
   kernel/sched/rt.c: In function '__enqueue_rt_entity':
   kernel/sched/rt.c:1572:64: error: 'struct sched_rt_entity' has no member named 'parent'
    1572 |                 if (tbefore && !rt_rq_throttled(rt_rq) && rt_se->parent)
         |                                                                ^~
   kernel/sched/rt.c:1573:53: error: 'struct sched_rt_entity' has no member named 'parent'
    1573 |                         adjust_cg_throt_update(rt_se->parent, false);
         |                                                     ^~
   cc1: some warnings being treated as errors


vim +963 kernel/sched/rt.c

   902	
   903	static int do_sched_rt_period_timer(struct rt_bandwidth *rt_b, int overrun)
   904	{
   905		int i, idle = 1, throttled = 0;
   906		const struct cpumask *span;
   907	
   908		span = sched_rt_period_mask();
   909	#ifdef CONFIG_RT_GROUP_SCHED
   910		/*
   911		 * FIXME: isolated CPUs should really leave the root task group,
   912		 * whether they are isolcpus or were isolated via cpusets, lest
   913		 * the timer run on a CPU which does not service all runqueues,
   914		 * potentially leaving other CPUs indefinitely throttled.  If
   915		 * isolation is really required, the user will turn the throttle
   916		 * off to kill the perturbations it causes anyway.  Meanwhile,
   917		 * this maintains functionality for boot and/or troubleshooting.
   918		 */
   919		if (rt_b == &root_task_group.rt_bandwidth)
   920			span = cpu_online_mask;
   921	#endif
   922		for_each_cpu(i, span) {
   923			int enqueue = 0;
   924			struct rt_rq *rt_rq = sched_rt_period_rt_rq(rt_b, i);
   925			struct rq *rq = rq_of_rt_rq(rt_rq);
   926			struct rq_flags rf;
   927			int skip;
   928	
   929			/*
   930			 * When span == cpu_online_mask, taking each rq->lock
   931			 * can be time-consuming. Try to avoid it when possible.
   932			 */
   933			raw_spin_lock(&rt_rq->rt_runtime_lock);
   934			if (!sched_feat(RT_RUNTIME_SHARE) && rt_rq->rt_runtime != RUNTIME_INF)
   935				rt_rq->rt_runtime = rt_b->rt_runtime;
   936			skip = !rt_rq->rt_time && !rt_rq->rt_nr_running;
   937			raw_spin_unlock(&rt_rq->rt_runtime_lock);
   938			if (skip)
   939				continue;
   940	
   941			rq_lock(rq, &rf);
   942			update_rq_clock(rq);
   943	
   944			if (rt_rq->rt_time) {
   945				u64 runtime;
   946				struct sched_rt_entity *parent_rt_se = NULL;
   947	
   948				raw_spin_lock(&rt_rq->rt_runtime_lock);
   949				if (rt_rq->rt_bw_throttled)
   950					balance_runtime(rt_rq);
   951				runtime = rt_rq->rt_runtime;
   952				rt_rq->rt_time -= min(rt_rq->rt_time, overrun*runtime);
   953				if (rt_rq->rt_bw_throttled && rt_rq->rt_time < runtime) {
   954					bool tbefore = rt_rq_throttled(rt_rq);
   955					rt_rq->rt_bw_throttled = 0;
   956	
   957					/*
   958					 * If a prior rt_rq throttled status changed to unthrottled,
   959					 * adjust the parent information about throttled child groups.
   960					 */
   961					WARN_ON_ONCE (!tbefore && rt_rq_throttled(rt_rq));
   962					if (tbefore && !rt_rq_throttled(rt_rq)) {
 > 963						if (rt_rq->tg && rt_rq->tg->parent)
   964							parent_rt_se = rt_rq->tg->parent->rt_se[i];
   965						if (parent_rt_se)
   966							adjust_cg_throt_update(parent_rt_se, false);
   967					}
   968	
   969					/*
   970					 * When we're idle and a woken (rt) task is
   971					 * throttled check_preempt_curr() will set
   972					 * skip_update and the time between the wakeup
   973					 * and this unthrottle will get accounted as
   974					 * 'runtime'.
   975					 */
   976					if (rt_rq->rt_nr_running && rq->curr == rq->idle)
   977						rq_clock_cancel_skipupdate(rq);
   978				}
   979				if (rt_rq->rt_time || rt_rq->rt_nr_running)
   980					idle = 0;
   981				raw_spin_unlock(&rt_rq->rt_runtime_lock);
   982			} else if (rt_rq->rt_nr_running) {
   983				idle = 0;
   984			}
   985			if (rt_rq->rt_bw_throttled)
   986				throttled = 1;
   987	
   988			rq_unlock(rq, &rf);
   989		}
   990	
   991		if (!throttled && (!rt_bandwidth_enabled() || rt_b->rt_runtime == RUNTIME_INF))
   992			return 1;
   993	
   994		return idle;
   995	}
   996	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
