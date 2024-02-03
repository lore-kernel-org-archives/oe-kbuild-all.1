Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A875FDB1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 19:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706987606; cv=none; b=TDjO8rApeKgIdpUma8MDvewmKqukFiP0lxEYiy9cF5R6DT5dexCeDt9gTvQqiUeS+WsHLfDsodmVyjdIRdu68Bl/wJ37S+lQ2kPZlOjGXDTz+2gQmQWMD1h8NU/wSmMtxVsAOCChlNDwuUGV+ABLJOv8dRlPCi7hWLmS7Rj/UtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706987606; c=relaxed/simple;
	bh=QKQwEvKgzasHpmslCQEAY53PzSCDxPDCosMXRi8v1mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHfaNFD/XJEBcEXJpfyaoq51z2CyrR8aAd4lUw3A/aDRxXShbwF/kJN3u83H1E/wpHos2MV/6/T99Zs7JWrVAhR34qb9nvfFblWaF31ZZD038tN+L90gfaTRt/77W9FW2Bo5vcxvV5QHOmpYZxBsfjIHCH0vIJow5gKY5zyVTiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1TzJFbg; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1TzJFbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706987603; x=1738523603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QKQwEvKgzasHpmslCQEAY53PzSCDxPDCosMXRi8v1mM=;
  b=U1TzJFbg+iOyg9aDFstr8/Xd5eO1Ohl3oX7hZmOW/9c4zKFSQNA8yw40
   s8MW6rm3oHSLkXyaYG947l2aXQSI/PEVdVwL4F3yC67xWRAtKVHoHJM9v
   CATxxCk16JHRfZUb5QkUXly2vGgv9+qHcNCFiFz44oWOodaypBH7AvUpa
   QJXYa2TwQtYk2ISfZDSiN1wIkEuX2/hj1myKFp2WkElg8PcaaevvZp6A4
   fyv+cTcHQmOKXIi449oWRRsVM7MzcbDrXS5FXIF8CZul8v0+W8ILCfq59
   XyMHchKhCARefQzlWSB6sei9aSzNnDLezIWf9AgCCY1Srhn75M2WX2ulu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="435476113"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="435476113"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 11:13:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="4973110"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Feb 2024 11:13:21 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWLS2-0005Uk-1y;
	Sat, 03 Feb 2024 19:13:18 +0000
Date: Sun, 4 Feb 2024 03:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/5] sched/fair: Only throttle CFS tasks on return
 to userspace
Message-ID: <202402040304.j8HAHYHG-lkp@intel.com>
References: <20240202080920.3337862-2-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202080920.3337862-2-vschneid@redhat.com>

Hi Valentin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/core/entry tip/master linus/master v6.8-rc2 next-20240202]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Schneider/sched-fair-Only-throttle-CFS-tasks-on-return-to-userspace/20240202-162620
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20240202080920.3337862-2-vschneid%40redhat.com
patch subject: [RFC PATCH v2 1/5] sched/fair: Only throttle CFS tasks on return to userspace
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240204/202402040304.j8HAHYHG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040304.j8HAHYHG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040304.j8HAHYHG-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'enqueue_task_fair':
>> kernel/sched/fair.c:6937:17: error: implicit declaration of function 'unthrottle_on_enqueue' [-Werror=implicit-function-declaration]
    6937 |                 unthrottle_on_enqueue(p);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'dequeue_task_fair':
>> kernel/sched/fair.c:6954:46: error: 'struct sched_entity' has no member named 'kernel_node'
    6954 |         bool kernel_task = !list_empty(&p->se.kernel_node);
         |                                              ^
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:13312:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   13312 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13314:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   13314 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13319:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   13319 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13321:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   13321 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/unthrottle_on_enqueue +6937 kernel/sched/fair.c

  6839	
  6840	/*
  6841	 * The enqueue_task method is called before nr_running is
  6842	 * increased. Here we update the fair scheduling stats and
  6843	 * then put the task into the rbtree:
  6844	 */
  6845	static void
  6846	enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
  6847	{
  6848		struct cfs_rq *cfs_rq;
  6849		struct sched_entity *se = &p->se;
  6850		int idle_h_nr_running = task_has_idle_policy(p);
  6851		int task_new = !(flags & ENQUEUE_WAKEUP);
  6852		bool kernel_task = is_kernel_task(p);
  6853	
  6854		/*
  6855		 * The code below (indirectly) updates schedutil which looks at
  6856		 * the cfs_rq utilization to select a frequency.
  6857		 * Let's add the task's estimated utilization to the cfs_rq's
  6858		 * estimated utilization, before we update schedutil.
  6859		 */
  6860		util_est_enqueue(&rq->cfs, p);
  6861	
  6862		/*
  6863		 * If in_iowait is set, the code below may not trigger any cpufreq
  6864		 * utilization updates, so do it here explicitly with the IOWAIT flag
  6865		 * passed.
  6866		 */
  6867		if (p->in_iowait)
  6868			cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
  6869	
  6870		for_each_sched_entity(se) {
  6871			if (se->on_rq)
  6872				break;
  6873			cfs_rq = cfs_rq_of(se);
  6874			enqueue_entity(cfs_rq, se, flags);
  6875	
  6876			cfs_rq->h_nr_running++;
  6877			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  6878	
  6879			if (cfs_rq_is_idle(cfs_rq))
  6880				idle_h_nr_running = 1;
  6881			if (kernel_task)
  6882				enqueue_kernel(cfs_rq, se, 1);
  6883	
  6884			/* end evaluation on encountering a throttled cfs_rq */
  6885			if (cfs_rq_throttled(cfs_rq))
  6886				goto enqueue_throttle;
  6887	
  6888			flags = ENQUEUE_WAKEUP;
  6889		}
  6890	
  6891		for_each_sched_entity(se) {
  6892			cfs_rq = cfs_rq_of(se);
  6893	
  6894			update_load_avg(cfs_rq, se, UPDATE_TG);
  6895			se_update_runnable(se);
  6896			update_cfs_group(se);
  6897	
  6898			cfs_rq->h_nr_running++;
  6899			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  6900	
  6901			if (cfs_rq_is_idle(cfs_rq))
  6902				idle_h_nr_running = 1;
  6903			if (kernel_task)
  6904				enqueue_kernel(cfs_rq, se, 1);
  6905	
  6906			/* end evaluation on encountering a throttled cfs_rq */
  6907			if (cfs_rq_throttled(cfs_rq))
  6908				goto enqueue_throttle;
  6909		}
  6910	
  6911		/* At this point se is NULL and we are at root level*/
  6912		add_nr_running(rq, 1);
  6913	
  6914		/*
  6915		 * Since new tasks are assigned an initial util_avg equal to
  6916		 * half of the spare capacity of their CPU, tiny tasks have the
  6917		 * ability to cross the overutilized threshold, which will
  6918		 * result in the load balancer ruining all the task placement
  6919		 * done by EAS. As a way to mitigate that effect, do not account
  6920		 * for the first enqueue operation of new tasks during the
  6921		 * overutilized flag detection.
  6922		 *
  6923		 * A better way of solving this problem would be to wait for
  6924		 * the PELT signals of tasks to converge before taking them
  6925		 * into account, but that is not straightforward to implement,
  6926		 * and the following generally works well enough in practice.
  6927		 */
  6928		if (!task_new)
  6929			update_overutilized_status(rq);
  6930	
  6931	enqueue_throttle:
  6932		assert_list_leaf_cfs_rq(rq);
  6933	
  6934		hrtick_update(rq);
  6935	
  6936		if (kernel_task)
> 6937			unthrottle_on_enqueue(p);
  6938	}
  6939	
  6940	static void set_next_buddy(struct sched_entity *se);
  6941	
  6942	/*
  6943	 * The dequeue_task method is called before nr_running is
  6944	 * decreased. We remove the task from the rbtree and
  6945	 * update the fair scheduling stats:
  6946	 */
  6947	static void dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
  6948	{
  6949		struct cfs_rq *cfs_rq;
  6950		struct sched_entity *se = &p->se;
  6951		int task_sleep = flags & DEQUEUE_SLEEP;
  6952		int idle_h_nr_running = task_has_idle_policy(p);
  6953		bool was_sched_idle = sched_idle_rq(rq);
> 6954		bool kernel_task = !list_empty(&p->se.kernel_node);
  6955	
  6956		util_est_dequeue(&rq->cfs, p);
  6957	
  6958		for_each_sched_entity(se) {
  6959			cfs_rq = cfs_rq_of(se);
  6960			dequeue_entity(cfs_rq, se, flags);
  6961	
  6962			cfs_rq->h_nr_running--;
  6963			cfs_rq->idle_h_nr_running -= idle_h_nr_running;
  6964	
  6965			if (cfs_rq_is_idle(cfs_rq))
  6966				idle_h_nr_running = 1;
  6967			if (kernel_task)
  6968				dequeue_kernel(cfs_rq, se, 1);
  6969	
  6970			/* end evaluation on encountering a throttled cfs_rq */
  6971			if (cfs_rq_throttled(cfs_rq))
  6972				goto dequeue_throttle;
  6973	
  6974			/* Don't dequeue parent if it has other entities besides us */
  6975			if (cfs_rq->load.weight) {
  6976				/* Avoid re-evaluating load for this entity: */
  6977				se = parent_entity(se);
  6978				/*
  6979				 * Bias pick_next to pick a task from this cfs_rq, as
  6980				 * p is sleeping when it is within its sched_slice.
  6981				 */
  6982				if (task_sleep && se && !throttled_hierarchy(cfs_rq))
  6983					set_next_buddy(se);
  6984				break;
  6985			}
  6986			flags |= DEQUEUE_SLEEP;
  6987		}
  6988	
  6989		for_each_sched_entity(se) {
  6990			cfs_rq = cfs_rq_of(se);
  6991	
  6992			update_load_avg(cfs_rq, se, UPDATE_TG);
  6993			se_update_runnable(se);
  6994			update_cfs_group(se);
  6995	
  6996			cfs_rq->h_nr_running--;
  6997			cfs_rq->idle_h_nr_running -= idle_h_nr_running;
  6998	
  6999			if (cfs_rq_is_idle(cfs_rq))
  7000				idle_h_nr_running = 1;
  7001			if (kernel_task)
  7002				dequeue_kernel(cfs_rq, se, 1);
  7003	
  7004			/* end evaluation on encountering a throttled cfs_rq */
  7005			if (cfs_rq_throttled(cfs_rq))
  7006				goto dequeue_throttle;
  7007	
  7008		}
  7009	
  7010		/* At this point se is NULL and we are at root level*/
  7011		sub_nr_running(rq, 1);
  7012	
  7013		/* balance early to pull high priority tasks */
  7014		if (unlikely(!was_sched_idle && sched_idle_rq(rq)))
  7015			rq->next_balance = jiffies;
  7016	
  7017	dequeue_throttle:
  7018		util_est_update(&rq->cfs, p, task_sleep);
  7019		hrtick_update(rq);
  7020	}
  7021	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
