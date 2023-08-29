Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85860A21
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 05:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693286607; x=1724822607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1o4jLOHWaKqzesrSwD0QZcHw21CEqlnf0sBTCC4A0ro=;
  b=BZDym8s5ETbLhO+9IlqioR4kATKCPSAC+rV/MWcvBLSJrIwzK5nEjmwP
   vCatZS6oKHoQ8xA5PSRvFJmh8SpPcaN3NOQw4PPncplGAP88t8JG/hh9N
   L7tdb39LIGfGUpP8Bvw/tKzrOWhOrATitgBDLZYj/jhQ95LbDqO1etRWj
   pa+VyWpTiWgJrJ30C5ADRO7yImbSjtdjEMCMjJDDh4arw889ywtW8Mvhb
   9hK4djq8TpzPmAclr4bMzl5yTi0Rf5QD2JrLHvDLD6hTbMI0neEpD75ou
   o/M3zZ21ej4qLNDaW0gjM/8CWKvqg/WoFVYIfAdoNogaaHf0elfv/AvRI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="372695086"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="372695086"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 22:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="773538172"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="773538172"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Aug 2023 22:23:17 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qarC8-0008QF-1I;
	Tue, 29 Aug 2023 05:23:16 +0000
Date: Tue, 29 Aug 2023 13:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:rt-thermal-pressure 1/2] kernel/sched/rt.c:2650:39:
 error: 'struct rq' has no member named 'cpu'
Message-ID: <202308291327.Aj06hv5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux rt-thermal-pressure
head:   f9adf589d645dfda6f820165dafbc0f9d11747b4
commit: 6a44180bbdcfdd7281062d068cd85458f74c53e7 [1/2] sched/rt: Handle misfit RT task due to changed uclamp_min value
config: csky-randconfig-r024-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291327.Aj06hv5J-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291327.Aj06hv5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291327.Aj06hv5J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c: In function 'task_tick_rt':
   kernel/sched/rt.c:2648:14: error: implicit declaration of function 'rt_task_fits_cpu'; did you mean 'rt_task_fits_capacity'? [-Werror=implicit-function-declaration]
    2648 |         if (!rt_task_fits_cpu(p, cpu_of(rq))) {
         |              ^~~~~~~~~~~~~~~~
         |              rt_task_fits_capacity
>> kernel/sched/rt.c:2650:39: error: 'struct rq' has no member named 'cpu'
    2650 |                 stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
         |                                       ^~
>> kernel/sched/rt.c:2650:46: error: 'push_cpu_stop' undeclared (first use in this function); did you mean 'put_cpu_ptr'?
    2650 |                 stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
         |                                              ^~~~~~~~~~~~~
         |                                              put_cpu_ptr
   kernel/sched/rt.c:2650:46: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/sched/rt.c:2651:37: error: 'push_task' undeclared (first use in this function); did you mean 'curr_task'?
    2651 |                                     push_task, &rq->push_work);
         |                                     ^~~~~~~~~
         |                                     curr_task
   cc1: some warnings being treated as errors


vim +2650 kernel/sched/rt.c

  2630	
  2631	/*
  2632	 * scheduler tick hitting a task of our scheduling class.
  2633	 *
  2634	 * NOTE: This function can be called remotely by the tick offload that
  2635	 * goes along full dynticks. Therefore no local assumption can be made
  2636	 * and everything must be accessed through the @rq and @curr passed in
  2637	 * parameters.
  2638	 */
  2639	static void task_tick_rt(struct rq *rq, struct task_struct *p, int queued)
  2640	{
  2641		struct sched_rt_entity *rt_se = &p->rt;
  2642	
  2643		update_curr_rt(rq);
  2644		update_rt_rq_load_avg(rq_clock_pelt(rq), rq, 1);
  2645	
  2646		watchdog(rq, p);
  2647	
> 2648		if (!rt_task_fits_cpu(p, cpu_of(rq))) {
  2649			raw_spin_rq_unlock(rq);
> 2650			stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
> 2651					    push_task, &rq->push_work);
  2652			raw_spin_rq_lock(rq);
  2653			return;
  2654		}
  2655	
  2656		/*
  2657		 * RR tasks need a special form of timeslice management.
  2658		 * FIFO tasks have no timeslices.
  2659		 */
  2660		if (p->policy != SCHED_RR)
  2661			return;
  2662	
  2663		if (--p->rt.time_slice)
  2664			return;
  2665	
  2666		p->rt.time_slice = sched_rr_timeslice;
  2667	
  2668		/*
  2669		 * Requeue to the end of queue if we (and all of our ancestors) are not
  2670		 * the only element on the queue
  2671		 */
  2672		for_each_sched_rt_entity(rt_se) {
  2673			if (rt_se->run_list.prev != rt_se->run_list.next) {
  2674				requeue_task_rt(rq, p, 0);
  2675				resched_curr(rq);
  2676				return;
  2677			}
  2678		}
  2679	}
  2680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
