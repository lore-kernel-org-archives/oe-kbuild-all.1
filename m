Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717421385
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 03:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707016125; cv=none; b=d5DaoxXfTj3FfN2PzUpT3VRyxKhFuPHi9h/K5wWYeoH2MUeeTGlhA3n51z/7KjqUsif/dOCykidDs0aj+EIn5YgtZV6a4hmFUfxemXYN1mMZ0XjJ2+6i7XtwPIC81l1Vm7g7v1UTVi2eX5CXNPY11MzvMjsrtslhDy9J44NCc2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707016125; c=relaxed/simple;
	bh=ADL3xeGJXZ68im1QzzqdBhs2LqujIrgCaF1yQrHIpJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfAXdCwBAjNfA3QhJlQYsZjZj3sCU5TjpcABj0Kx9YUTT7oPEWIhB/rD/1Z8eaDHhVh/2JUxmXls5+PBzEo9Jh6ZrRhd3Wwwnj6NSyz9hcUpFJBxQ/b5dEmtSInOz9pjs2kUDTt3GH/O0vAZUKmx+46FKN5Mtmti8Boiv8JiM9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXnTf/z9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXnTf/z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707016123; x=1738552123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ADL3xeGJXZ68im1QzzqdBhs2LqujIrgCaF1yQrHIpJA=;
  b=jXnTf/z9UyX9NpCdZlI0eJAEsil1HnbZhhj/CHpff0BDrSUiX0mmlsHM
   jkFAJmntmAnUGzyeZbPQNm676W10Qt7WmFS6J9yyAD29JpwOcrLmnb/Wj
   0oQ4CDtdh898xYsRrGmi7ll+BIszY3cKOhfFZZvYzDzzu2jsjpg/eF8mB
   4hakejOl0mMXPGsf7ggDNucy5Wqx5OPMBdDlvEfxGw5mAGDeHnEi7Lm2a
   WGluJ+e9v9JKjvkCijCAZ7DDN0WRVSMDjr6DRhFk2bEpIrrn+5/QoQeXo
   LtiOaX9SKI9sQLTgAveoM3oW09UkIHetDDTjpitfY8HZtay4Ec3EzzH/5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="518487"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="518487"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 19:08:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="23679476"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2024 19:08:39 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWSs0-0005wG-3C;
	Sun, 04 Feb 2024 03:08:36 +0000
Date: Sun, 4 Feb 2024 11:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 4/5] sched/fair: Track count of tasks running in
 userspace
Message-ID: <202402041155.ZPTGxQSD-lkp@intel.com>
References: <20240202080920.3337862-5-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202080920.3337862-5-vschneid@redhat.com>

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
patch link:    https://lore.kernel.org/r/20240202080920.3337862-5-vschneid%40redhat.com
patch subject: [RFC PATCH v2 4/5] sched/fair: Track count of tasks running in userspace
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240204/202402041155.ZPTGxQSD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041155.ZPTGxQSD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041155.ZPTGxQSD-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'enqueue_task_fair':
>> kernel/sched/fair.c:6940:65: error: 'struct cfs_rq' has no member named 'throttle_pending'
    6940 |                 if (kernel_task || (!throttle_pending && !cfs_rq->throttle_pending))
         |                                                                 ^~
>> kernel/sched/fair.c:6945:33: error: 'struct cfs_rq' has no member named 'h_user_running'; did you mean 'h_nr_running'?
    6945 |                         cfs_rq->h_user_running++;
         |                                 ^~~~~~~~~~~~~~
         |                                 h_nr_running
   kernel/sched/fair.c:6947:43: error: 'struct cfs_rq' has no member named 'throttle_pending'
    6947 |                 throttle_pending |= cfs_rq->throttle_pending;
         |                                           ^~
   kernel/sched/fair.c:6969:65: error: 'struct cfs_rq' has no member named 'throttle_pending'
    6969 |                 if (kernel_task || (!throttle_pending && !cfs_rq->throttle_pending))
         |                                                                 ^~
   kernel/sched/fair.c:6974:33: error: 'struct cfs_rq' has no member named 'h_user_running'; did you mean 'h_nr_running'?
    6974 |                         cfs_rq->h_user_running++;
         |                                 ^~~~~~~~~~~~~~
         |                                 h_nr_running
   kernel/sched/fair.c:6976:43: error: 'struct cfs_rq' has no member named 'throttle_pending'
    6976 |                 throttle_pending |= cfs_rq->throttle_pending;
         |                                           ^~
   kernel/sched/fair.c:7014:17: error: implicit declaration of function 'unthrottle_on_enqueue' [-Werror=implicit-function-declaration]
    7014 |                 unthrottle_on_enqueue(p);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'dequeue_task_fair':
   kernel/sched/fair.c:7031:46: error: 'struct sched_entity' has no member named 'kernel_node'
    7031 |         bool kernel_task = !list_empty(&p->se.kernel_node);
         |                                              ^
   kernel/sched/fair.c:7041:65: error: 'struct cfs_rq' has no member named 'throttle_pending'
    7041 |                 if (kernel_task || (!throttle_pending && !cfs_rq->throttle_pending))
         |                                                                 ^~
   kernel/sched/fair.c:7046:33: error: 'struct cfs_rq' has no member named 'h_user_running'; did you mean 'h_nr_running'?
    7046 |                         cfs_rq->h_user_running--;
         |                                 ^~~~~~~~~~~~~~
         |                                 h_nr_running
   kernel/sched/fair.c:7048:43: error: 'struct cfs_rq' has no member named 'throttle_pending'
    7048 |                 throttle_pending |= cfs_rq->throttle_pending;
         |                                           ^~
   kernel/sched/fair.c:7082:65: error: 'struct cfs_rq' has no member named 'throttle_pending'
    7082 |                 if (kernel_task || (!throttle_pending && !cfs_rq->throttle_pending))
         |                                                                 ^~
   kernel/sched/fair.c:7087:33: error: 'struct cfs_rq' has no member named 'h_user_running'; did you mean 'h_nr_running'?
    7087 |                         cfs_rq->h_user_running--;
         |                                 ^~~~~~~~~~~~~~
         |                                 h_nr_running
   kernel/sched/fair.c:7089:43: error: 'struct cfs_rq' has no member named 'throttle_pending'
    7089 |                 throttle_pending |= cfs_rq->throttle_pending;
         |                                           ^~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:13427:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   13427 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13429:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   13429 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13434:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   13434 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13436:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   13436 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6807:13: warning: 'cfs_rq_throttled_loose' defined but not used [-Wunused-function]
    6807 | static bool cfs_rq_throttled_loose(struct cfs_rq *cfs_rq)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +6940 kernel/sched/fair.c

  6901	
  6902	/*
  6903	 * The enqueue_task method is called before nr_running is
  6904	 * increased. Here we update the fair scheduling stats and
  6905	 * then put the task into the rbtree:
  6906	 */
  6907	static void
  6908	enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
  6909	{
  6910		struct cfs_rq *cfs_rq;
  6911		struct sched_entity *se = &p->se;
  6912		int idle_h_nr_running = task_has_idle_policy(p);
  6913		int task_new = !(flags & ENQUEUE_WAKEUP);
  6914		bool kernel_task = is_kernel_task(p);
  6915		bool throttle_pending = false;
  6916	
  6917		/*
  6918		 * The code below (indirectly) updates schedutil which looks at
  6919		 * the cfs_rq utilization to select a frequency.
  6920		 * Let's add the task's estimated utilization to the cfs_rq's
  6921		 * estimated utilization, before we update schedutil.
  6922		 */
  6923		util_est_enqueue(&rq->cfs, p);
  6924	
  6925		/*
  6926		 * If in_iowait is set, the code below may not trigger any cpufreq
  6927		 * utilization updates, so do it here explicitly with the IOWAIT flag
  6928		 * passed.
  6929		 */
  6930		if (p->in_iowait)
  6931			cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
  6932	
  6933		for_each_sched_entity(se) {
  6934			if (se->on_rq)
  6935				break;
  6936			cfs_rq = cfs_rq_of(se);
  6937			enqueue_entity(cfs_rq, se, flags);
  6938	
  6939	
> 6940			if (kernel_task || (!throttle_pending && !cfs_rq->throttle_pending))
  6941				cfs_rq->h_nr_running++;
  6942			if (kernel_task)
  6943				enqueue_kernel(cfs_rq, se, 1);
  6944			else if (!throttle_pending)
> 6945				cfs_rq->h_user_running++;
  6946	
  6947			throttle_pending |= cfs_rq->throttle_pending;
  6948	
  6949			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  6950			if (cfs_rq_is_idle(cfs_rq))
  6951				idle_h_nr_running = 1;
  6952	
  6953	
  6954			/* end evaluation on encountering a throttled cfs_rq */
  6955			if (cfs_rq_throttled(cfs_rq))
  6956				goto enqueue_throttle;
  6957	
  6958			flags = ENQUEUE_WAKEUP;
  6959		}
  6960	
  6961		for_each_sched_entity(se) {
  6962			cfs_rq = cfs_rq_of(se);
  6963	
  6964			update_load_avg(cfs_rq, se, UPDATE_TG);
  6965			se_update_runnable(se);
  6966			update_cfs_group(se);
  6967	
  6968	
  6969			if (kernel_task || (!throttle_pending && !cfs_rq->throttle_pending))
  6970				cfs_rq->h_nr_running++;
  6971			if (kernel_task)
  6972				enqueue_kernel(cfs_rq, se, 1);
  6973			else if (!throttle_pending)
  6974				cfs_rq->h_user_running++;
  6975	
  6976			throttle_pending |= cfs_rq->throttle_pending;
  6977	
  6978			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  6979			if (cfs_rq_is_idle(cfs_rq))
  6980				idle_h_nr_running = 1;
  6981	
  6982	
  6983			/* end evaluation on encountering a throttled cfs_rq */
  6984			if (cfs_rq_throttled(cfs_rq))
  6985				goto enqueue_throttle;
  6986		}
  6987	
  6988		/* At this point se is NULL and we are at root level*/
  6989		add_nr_running(rq, 1);
  6990	
  6991		/*
  6992		 * Since new tasks are assigned an initial util_avg equal to
  6993		 * half of the spare capacity of their CPU, tiny tasks have the
  6994		 * ability to cross the overutilized threshold, which will
  6995		 * result in the load balancer ruining all the task placement
  6996		 * done by EAS. As a way to mitigate that effect, do not account
  6997		 * for the first enqueue operation of new tasks during the
  6998		 * overutilized flag detection.
  6999		 *
  7000		 * A better way of solving this problem would be to wait for
  7001		 * the PELT signals of tasks to converge before taking them
  7002		 * into account, but that is not straightforward to implement,
  7003		 * and the following generally works well enough in practice.
  7004		 */
  7005		if (!task_new)
  7006			update_overutilized_status(rq);
  7007	
  7008	enqueue_throttle:
  7009		assert_list_leaf_cfs_rq(rq);
  7010	
  7011		hrtick_update(rq);
  7012	
  7013		if (kernel_task)
  7014			unthrottle_on_enqueue(p);
  7015	}
  7016	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
