Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA521A938
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 20:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677788914; x=1709324914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6kB9//1sahBJydydLM+CFe2tIWaMCQB8ITMS4cmzJXg=;
  b=XOb3Qq0canHLv6NQWzhsNcKeEB2wJ0nF7NvGlcD0WGP3CyazZOEmrwG4
   /f17HtNxsiKqwKSFrhFurKlGquvaMxE5RYl64WskV7EWvtbwZQA7IZNzJ
   2kqCTQhvo1VZ7Tl4n44IgdvroUkeAzfUb6r0yMGEZjI5Xxj6sdAr5Y71+
   UmeZBxG/YldE6AS4YFqGti9UjNsl2qWl9tGE7rQ+/F7p/CzEDYG4f1cts
   5UuycEAwzRIjfEchgakCyFIHDzdChHtvwOhDJCpLUKa6epXfB7VwbCgyW
   Goz/Lprp2EvuDxT205q8wsKvf8KCnKqhMBdm4gXbcCDOkXMbWvzEsZPc3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397435991"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="397435991"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 12:28:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="677371824"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="677371824"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Mar 2023 12:28:32 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXpXU-0000rS-12;
	Thu, 02 Mar 2023 20:28:32 +0000
Date: Fri, 3 Mar 2023 04:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: Vineeth Pillai <vineethrp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Joel Fernandes <joelaf@google.com>
Subject: [jfern:sched/rt-throttle 10/12] kernel/sched/rt.c:1012:92: error:
 'root_task_group' undeclared; did you mean 'task_group'?
Message-ID: <202303030435.nzPZqxeW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle
head:   3426c4b45d36b426432e250f667021e9b4b5356b
commit: c8255b85822c5027201577a5748a9f3094581f4a [10/12] traces
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230303/202303030435.nzPZqxeW-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=c8255b85822c5027201577a5748a9f3094581f4a
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle
        git checkout c8255b85822c5027201577a5748a9f3094581f4a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030435.nzPZqxeW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c: In function 'init_rt_rq':
   kernel/sched/rt.c:155:16: error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean 'rt_cg_throttled'?
     155 |         rt_rq->rt_nr_cg_throttled = 0;
         |                ^~~~~~~~~~~~~~~~~~
         |                rt_cg_throttled
   kernel/sched/rt.c: At top level:
   kernel/sched/rt.c:924:30: warning: missing terminating " character
     924 |                 trace_printk("RT_THROT:[actu] Dequeued rt_rq(%p),
         |                              ^
   kernel/sched/rt.c:926:46: warning: missing terminating " character
     926 |                                 cg_throt=%d\n", rt_rq, rt_rq->rt_nr_running,
         |                                              ^
   kernel/sched/rt.c: In function 'do_sched_rt_period_timer':
   kernel/sched/rt.c:1012:56: error: 'struct rt_rq' has no member named 'tg'
    1012 |                                         i, rt_rq, rt_rq->tg->rt_se[i], rt_rq->tg->parent, &root_task_group,
         |                                                        ^~
   kernel/sched/rt.c:1012:77: error: 'struct rt_rq' has no member named 'tg'
    1012 |                                         i, rt_rq, rt_rq->tg->rt_se[i], rt_rq->tg->parent, &root_task_group,
         |                                                                             ^~
>> kernel/sched/rt.c:1012:92: error: 'root_task_group' undeclared (first use in this function); did you mean 'task_group'?
    1012 |                                         i, rt_rq, rt_rq->tg->rt_se[i], rt_rq->tg->parent, &root_task_group,
         |                                                                                            ^~~~~~~~~~~~~~~
         |                                                                                            task_group
   kernel/sched/rt.c:1012:92: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/rt.c:1019:100: error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean 'rt_cg_throttled'?
    1019 |                                                 rt_rq->rt_se_running, rt_rq->rt_nr_running, rt_rq->rt_nr_cg_throttled,
         |                                                                                                    ^~~~~~~~~~~~~~~~~~
         |                                                                                                    rt_cg_throttled
   kernel/sched/rt.c:1020:54: error: 'struct rt_rq' has no member named 'rt_nr_boosted'
    1020 |                                                 rt_rq->rt_nr_boosted, rt_rq->rt_queued);
         |                                                      ^~
   kernel/sched/rt.c: In function 'update_curr_rt':
   kernel/sched/rt.c:1156:114: error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean 'rt_cg_throttled'?
    1156 |                                                 rt_se, rt_rq, rt_rq->rt_nr_running, rt_rq->rt_se_running, rt_rq->rt_nr_cg_throttled, rt_rq->rt_bw_throttled);
         |                                                                                                                  ^~~~~~~~~~~~~~~~~~
         |                                                                                                                  rt_cg_throttled
   kernel/sched/rt.c: In function 'update_nr_cg_throttled':
   kernel/sched/rt.c:1430:16: error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean 'rt_cg_throttled'?
    1430 |         rt_rq->rt_nr_cg_throttled += (dec ? -1 : 1);
         |                ^~~~~~~~~~~~~~~~~~
         |                rt_cg_throttled
   In file included from include/linux/printk.h:10,
                    from include/linux/kernel.h:29,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_policy.c:16:
   kernel/sched/rt.c: In function '__delist_rt_entity':
   kernel/sched/rt.c:1450:27: error: 'struct sched_rt_entity' has no member named 'parent'
    1450 |         WARN_ON_ONCE(rt_se->parent && tbefore && !rt_rq_throttled(rt_rq));
         |                           ^~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/sched/rt.c:1450:9: note: in expansion of macro 'WARN_ON_ONCE'
    1450 |         WARN_ON_ONCE(rt_se->parent && tbefore && !rt_rq_throttled(rt_rq));
         |         ^~~~~~~~~~~~
   kernel/sched/rt.c: In function '__enqueue_rt_entity':
   kernel/sched/rt.c:1584:35: error: 'struct sched_rt_entity' has no member named 'parent'
    1584 |                 WARN_ON_ONCE(rt_se->parent && !tbefore && rt_rq_throttled(rt_rq));
         |                                   ^~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/sched/rt.c:1584:17: note: in expansion of macro 'WARN_ON_ONCE'
    1584 |                 WARN_ON_ONCE(rt_se->parent && !tbefore && rt_rq_throttled(rt_rq));
         |                 ^~~~~~~~~~~~
   kernel/sched/rt.c: In function 'pick_next_rt_entity':
   kernel/sched/rt.c:1908:61: error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean 'rt_cg_throttled'?
    1908 |                         rt_rq, rt_rq->rt_se_running, rt_rq->rt_nr_cg_throttled);
         |                                                             ^~~~~~~~~~~~~~~~~~
         |                                                             rt_cg_throttled
   kernel/sched/rt.c:1926:79: error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean 'rt_cg_throttled'?
    1926 |                                                 grq, grq->rt_se_running, grq->rt_nr_cg_throttled);
         |                                                                               ^~~~~~~~~~~~~~~~~~
         |                                                                               rt_cg_throttled


vim +1012 kernel/sched/rt.c

   961	
   962	static int do_sched_rt_period_timer(struct rt_bandwidth *rt_b, int overrun)
   963	{
   964		int i, idle = 1, throttled = 0;
   965		const struct cpumask *span;
   966	
   967		span = sched_rt_period_mask();
   968	#ifdef CONFIG_RT_GROUP_SCHED
   969		/*
   970		 * FIXME: isolated CPUs should really leave the root task group,
   971		 * whether they are isolcpus or were isolated via cpusets, lest
   972		 * the timer run on a CPU which does not service all runqueues,
   973		 * potentially leaving other CPUs indefinitely throttled.  If
   974		 * isolation is really required, the user will turn the throttle
   975		 * off to kill the perturbations it causes anyway.  Meanwhile,
   976		 * this maintains functionality for boot and/or troubleshooting.
   977		 */
   978		if (rt_b == &root_task_group.rt_bandwidth)
   979			span = cpu_online_mask;
   980	#endif
   981		for_each_cpu(i, span) {
   982			struct rt_rq *rt_rq = sched_rt_period_rt_rq(rt_b, i);
   983			struct rq *rq = rq_of_rt_rq(rt_rq);
   984			struct rq_flags rf;
   985			int skip;
   986	
   987			/*
   988			 * When span == cpu_online_mask, taking each rq->lock
   989			 * can be time-consuming. Try to avoid it when possible.
   990			 */
   991			raw_spin_lock(&rt_rq->rt_runtime_lock);
   992			if (!sched_feat(RT_RUNTIME_SHARE) && rt_rq->rt_runtime != RUNTIME_INF)
   993				rt_rq->rt_runtime = rt_b->rt_runtime;
   994			skip = !rt_rq->rt_time && !rt_rq->rt_nr_running;
   995			raw_spin_unlock(&rt_rq->rt_runtime_lock);
   996			if (skip)
   997				continue;
   998	
   999			rq_lock(rq, &rf);
  1000			update_rq_clock(rq);
  1001	
  1002			if (rt_rq->rt_time) {
  1003				u64 runtime;
  1004	
  1005				raw_spin_lock(&rt_rq->rt_runtime_lock);
  1006				if (rt_rq->rt_bw_throttled)
  1007					balance_runtime(rt_rq);
  1008				runtime = rt_rq->rt_runtime;
  1009				rt_rq->rt_time -= min(rt_rq->rt_time, overrun*runtime);
  1010				trace_printk("RT_THROT:[timer:%d] rt_rq(%p), rt_se(%p), rt_rq->parent_tg(%p), root_task_group(%p), "
  1011						"runtime(%llu), rt_time(%llu), bw_throttled(%d)\n",
> 1012						i, rt_rq, rt_rq->tg->rt_se[i], rt_rq->tg->parent, &root_task_group,
  1013						runtime, rt_rq->rt_time, rt_rq->rt_bw_throttled);
  1014				if (rt_rq->rt_bw_throttled && rt_rq->rt_time < runtime) {
  1015					bool tbefore = rt_rq_throttled(rt_rq);
  1016					rt_rq->rt_bw_throttled = 0;
  1017	
  1018					trace_printk("RT_THROT:[timer] BW unthrottling: se_run=%d, nr_run=%d, nr_cg_thr=%d, nr_boost=%d, q=%d\n",
  1019							rt_rq->rt_se_running, rt_rq->rt_nr_running, rt_rq->rt_nr_cg_throttled,
  1020							rt_rq->rt_nr_boosted, rt_rq->rt_queued);
  1021					/*
  1022					 * If a prior rt_rq throttled status changed to unthrottled,
  1023					 * adjust the parent information about throttled child groups.
  1024					 */
  1025					WARN_ON_ONCE (!tbefore && rt_rq_throttled(rt_rq));
  1026					if (tbefore && !rt_rq_throttled(rt_rq))
  1027						adjust_cg_throt_update(rt_rq, false);
  1028	
  1029					/*
  1030					 * When we're idle and a woken (rt) task is
  1031					 * throttled check_preempt_curr() will set
  1032					 * skip_update and the time between the wakeup
  1033					 * and this unthrottle will get accounted as
  1034					 * 'runtime'.
  1035					 */
  1036					if (rt_rq->rt_nr_running && rq->curr == rq->idle)
  1037						rq_clock_cancel_skipupdate(rq);
  1038				}
  1039				if (rt_rq->rt_time || rt_rq->rt_nr_running)
  1040					idle = 0;
  1041				raw_spin_unlock(&rt_rq->rt_runtime_lock);
  1042			} else if (rt_rq->rt_nr_running) {
  1043				idle = 0;
  1044			}
  1045			if (rt_rq->rt_bw_throttled)
  1046				throttled = 1;
  1047	
  1048			rq_unlock(rq, &rf);
  1049		}
  1050	
  1051		if (!throttled && (!rt_bandwidth_enabled() || rt_b->rt_runtime == RUNTIME_INF))
  1052			return 1;
  1053	
  1054		return idle;
  1055	}
  1056	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
