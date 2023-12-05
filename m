Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EED86A02C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 20:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJlXm9tZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701809635; x=1733345635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AW7tkBCmHcxowWDWasxrXqZymI1NighjBIemLAsCCic=;
  b=ZJlXm9tZd0+QJFmFq8kW2ulXkj/sN/FUyXgN1RX9HXGfBTeoyVygz2J+
   u0nveCcVkuhBNvFZ91QbQTn8nAxyO8PoVY9vnHKwxPx+YyXcNxDg4W0k/
   awZG2UONgpFSG4kfQKxMHQNA7C5U5TMJUmmSjSRhYpcfGz56AphhPEHdP
   l0JtRQnEh3M3vTZxEbWRz41ICNPXl76FGzWrQX8/7wmLDrAgQbKUkAjFW
   lX8SWeFvLreph+fvDJdnC8iu6e6umjmftkhjmwOjXeM/DUPZsv1tg32DF
   87tHnVZwK/nRcmCV+k1xHef5HMZADgL6EZHWlR9Bb80UxYPQ+np4x3C0a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="797923"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="797923"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 12:53:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102580913"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1102580913"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 12:53:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAcQP-0009iE-0F;
	Tue, 05 Dec 2023 20:53:49 +0000
Date: Wed, 6 Dec 2023 04:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] sched/fair: Only throttle CFS tasks on return to
 userspace
Message-ID: <202312060457.FyTjUazp-lkp@intel.com>
References: <20231130161245.3894682-2-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130161245.3894682-2-vschneid@redhat.com>

Hi Valentin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on tip/master linus/master v6.7-rc4 next-20231205]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Schneider/sched-fair-Only-throttle-CFS-tasks-on-return-to-userspace/20231201-001908
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20231130161245.3894682-2-vschneid%40redhat.com
patch subject: [RFC PATCH 1/2] sched/fair: Only throttle CFS tasks on return to userspace
config: i386-randconfig-141-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060457.FyTjUazp-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060457.FyTjUazp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060457.FyTjUazp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:5809:6: warning: variable 'top_cfs_rq' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!qcfs_rq->in_throttle_limbo)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5860:6: note: uninitialized use occurs here
           if (top_cfs_rq && !top_cfs_rq->throttled_clock)
               ^~~~~~~~~~
   kernel/sched/fair.c:5809:2: note: remove the 'if' if its condition is always false
           if (!qcfs_rq->in_throttle_limbo)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5788:37: note: initialize the variable 'top_cfs_rq' to silence this warning
           struct cfs_rq *qcfs_rq, *top_cfs_rq;
                                              ^
                                               = NULL
   kernel/sched/fair.c:533:19: warning: unused function 'max_vruntime' [-Wunused-function]
   static inline u64 max_vruntime(u64 max_vruntime, u64 vruntime)
                     ^
   2 warnings generated.


vim +5809 kernel/sched/fair.c

  5782	
  5783	static void throttle_cfs_rq_work(struct callback_head *work)
  5784	{
  5785		struct task_struct *p = container_of(work, struct task_struct, sched_throttle_work);
  5786		struct sched_entity *se;
  5787		struct rq *rq;
  5788		struct cfs_rq *qcfs_rq, *top_cfs_rq;
  5789		long task_delta, idle_task_delta;
  5790	
  5791		WARN_ON_ONCE(p != current);
  5792	
  5793		/*
  5794		 * If task is exiting, then there won't be a return to userspace, so we
  5795		 * don't have to bother with any of this.
  5796		 */
  5797		if ((p->flags & PF_EXITING))
  5798			return;
  5799	
  5800		CLASS(task_rq_lock, rq_guard)(p);
  5801		rq = rq_guard.rq;
  5802		se = &p->se;
  5803		qcfs_rq = cfs_rq_of(se);
  5804	
  5805		/*
  5806		 * If not in limbo, then either replenish has happened or this task got
  5807		 * migrated out of the throttled cfs_rq, move along
  5808		 */
> 5809		if (!qcfs_rq->in_throttle_limbo)
  5810			goto done;
  5811	
  5812		update_rq_clock(rq);
  5813	
  5814		list_add(&p->throttle_node, &qcfs_rq->throttled_limbo_list);
  5815		task_delta = 1;
  5816		idle_task_delta = cfs_rq_is_idle(qcfs_rq) ? 1 : 0;
  5817	
  5818		for_each_sched_entity(se) {
  5819			qcfs_rq = cfs_rq_of(se);
  5820	
  5821			if (!se->on_rq)
  5822				goto done;
  5823	
  5824			dequeue_entity(qcfs_rq, se, DEQUEUE_SLEEP);
  5825			qcfs_rq->h_nr_running -= task_delta;
  5826			qcfs_rq->idle_h_nr_running -= idle_task_delta;
  5827	
  5828			if (qcfs_rq->in_throttle_limbo)
  5829				top_cfs_rq = qcfs_rq;
  5830	
  5831			if (qcfs_rq->load.weight) {
  5832				/* Avoid re-evaluating load for this entity: */
  5833				se = parent_entity(se);
  5834				break;
  5835			}
  5836		}
  5837	
  5838		for_each_sched_entity(se) {
  5839			qcfs_rq = cfs_rq_of(se);
  5840			/* throttled entity or throttle-on-deactivate */
  5841			if (!se->on_rq)
  5842				goto throttle_done;
  5843	
  5844			update_load_avg(qcfs_rq, se, 0);
  5845			se_update_runnable(se);
  5846			qcfs_rq->h_nr_running -= task_delta;
  5847			qcfs_rq->h_nr_running -= idle_task_delta;
  5848		}
  5849	
  5850	throttle_done:
  5851		/* At this point se is NULL and we are at root level*/
  5852		sub_nr_running(rq, 1);
  5853	done:
  5854		p->sched_throttle_work.next = &p->sched_throttle_work;
  5855		/*
  5856		 * XXX: this assumes the highest in_throttle_limbo cfs_rq in the
  5857		 * hierarchy is the one which got throttled, which might not always
  5858		 * be the case.
  5859		 */
  5860		if (top_cfs_rq && !top_cfs_rq->throttled_clock)
  5861			top_cfs_rq->throttled_clock = rq_clock(rq);
  5862	
  5863		resched_curr(rq);
  5864	}
  5865	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
