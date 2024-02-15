Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCF71754B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Feb 2024 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708012750; cv=none; b=FsdAtkUjy1p+1nGM7JZoubyOW8bCGiIdq4te+v29F78T40jhwev+HAkkx+KPTcPRrig/xuTlg85K4o/Jyzg/U3vkBFYB80OeqbBba7ypXf7TDgPWWW2UMqnUDhflh7xhJLZxWvW2+n0yRHpFIrpY3/2PTn2I1UkgzO8GnDo/Xyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708012750; c=relaxed/simple;
	bh=frTeu33FrjxuqFBDZJa3oUw/wxnCLczBbFQJs4TQcGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BuTphrwZ1NjF3IDCk+LaywT0gdSUUPjb9NVEJc2/VLKvNqN+cKyERW+HLo9R6ibipaRMq+kx2wqXaph+xEayJdGsYqV7NLzV+lXL7WNpRZU/EZqK9K001VALfIXGR5Wsu32aOCNWTLBuW0/vd8USRYefPYNHTlNoGamfhIPoLHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMUMaPNL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMUMaPNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708012748; x=1739548748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=frTeu33FrjxuqFBDZJa3oUw/wxnCLczBbFQJs4TQcGI=;
  b=CMUMaPNLqim0RCGi4JcAzxS6aY9HD8Jr6v6pVw9SuQjaGHEy8x/Yurzj
   uNNyKl1fC6SlWx6oujrIceE6ahV9NZfeRq9F3MpbmqzjQnzGaNlEjHOo0
   +T4sEnyrZsk8V+eWPAJxiRXMLED0buAEUwAgO2vK52NlP1Dm3wtzHsCS9
   evzG7sn6nVHBw4Ntt50CpwOi+lyqFC2RosVAOurbrXOxlpu0nYhRQo96r
   pEgkXKvUE8S6inYWoGARZKJXZpqKZFiwMEb1zKN34XkYqe/uO+9IOMRkI
   +0enrs0yhqh1ja/dNsLkRtHHUnNcz5lXGlGJp5aT8fZbHYk4FSS1x5UAr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2220988"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2220988"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 07:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="912184237"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="912184237"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Feb 2024 07:59:05 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rae8d-0000am-2g;
	Thu, 15 Feb 2024 15:59:03 +0000
Date: Thu, 15 Feb 2024 23:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bristot:dl_server_v6 5/5] kernel/sched/fair.c:6732:58: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202402152302.FCYrNlan-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/bristot/linux dl_server_v6
head:   46a04dc08aec247d43247d411da82c4c78d048c5
commit: 46a04dc08aec247d43247d411da82c4c78d048c5 [5/5] sched/deadline: Account idle time for deferred server
config: x86_64-randconfig-121-20240215 (https://download.01.org/0day-ci/archive/20240215/202402152302.FCYrNlan-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240215/202402152302.FCYrNlan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402152302.FCYrNlan-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1143:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1143:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:1143:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1190:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1190:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1190:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:5925:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5925:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5925:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6655:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6655:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6655:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/fair.c:6732:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6732:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:6732:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8290:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8290:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8290:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8586:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8586:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8586:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2160:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2160:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2160:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2332:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2332:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2332:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2160:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2160:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2160:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2160:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2160:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2160:25: sparse:    struct task_struct *

vim +6732 kernel/sched/fair.c

  6707	
  6708	/*
  6709	 * The enqueue_task method is called before nr_running is
  6710	 * increased. Here we update the fair scheduling stats and
  6711	 * then put the task into the rbtree:
  6712	 */
  6713	static void
  6714	enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
  6715	{
  6716		struct cfs_rq *cfs_rq;
  6717		struct sched_entity *se = &p->se;
  6718		int idle_h_nr_running = task_has_idle_policy(p);
  6719		int task_new = !(flags & ENQUEUE_WAKEUP);
  6720	
  6721		/*
  6722		 * The code below (indirectly) updates schedutil which looks at
  6723		 * the cfs_rq utilization to select a frequency.
  6724		 * Let's add the task's estimated utilization to the cfs_rq's
  6725		 * estimated utilization, before we update schedutil.
  6726		 */
  6727		util_est_enqueue(&rq->cfs, p);
  6728	
  6729		if (!rq->cfs.h_nr_running) {
  6730			/* Account for idle runtime */
  6731			if (!rq->nr_running)
> 6732				dl_server_update_idle_time(rq, rq->curr);
  6733			dl_server_start(&rq->fair_server);
  6734		}
  6735	
  6736		/*
  6737		 * If in_iowait is set, the code below may not trigger any cpufreq
  6738		 * utilization updates, so do it here explicitly with the IOWAIT flag
  6739		 * passed.
  6740		 */
  6741		if (p->in_iowait)
  6742			cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
  6743	
  6744		for_each_sched_entity(se) {
  6745			if (se->on_rq)
  6746				break;
  6747			cfs_rq = cfs_rq_of(se);
  6748			enqueue_entity(cfs_rq, se, flags);
  6749	
  6750			cfs_rq->h_nr_running++;
  6751			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  6752	
  6753			if (cfs_rq_is_idle(cfs_rq))
  6754				idle_h_nr_running = 1;
  6755	
  6756			/* end evaluation on encountering a throttled cfs_rq */
  6757			if (cfs_rq_throttled(cfs_rq))
  6758				goto enqueue_throttle;
  6759	
  6760			flags = ENQUEUE_WAKEUP;
  6761		}
  6762	
  6763		for_each_sched_entity(se) {
  6764			cfs_rq = cfs_rq_of(se);
  6765	
  6766			update_load_avg(cfs_rq, se, UPDATE_TG);
  6767			se_update_runnable(se);
  6768			update_cfs_group(se);
  6769	
  6770			cfs_rq->h_nr_running++;
  6771			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  6772	
  6773			if (cfs_rq_is_idle(cfs_rq))
  6774				idle_h_nr_running = 1;
  6775	
  6776			/* end evaluation on encountering a throttled cfs_rq */
  6777			if (cfs_rq_throttled(cfs_rq))
  6778				goto enqueue_throttle;
  6779		}
  6780	
  6781		/* At this point se is NULL and we are at root level*/
  6782		add_nr_running(rq, 1);
  6783	
  6784		/*
  6785		 * Since new tasks are assigned an initial util_avg equal to
  6786		 * half of the spare capacity of their CPU, tiny tasks have the
  6787		 * ability to cross the overutilized threshold, which will
  6788		 * result in the load balancer ruining all the task placement
  6789		 * done by EAS. As a way to mitigate that effect, do not account
  6790		 * for the first enqueue operation of new tasks during the
  6791		 * overutilized flag detection.
  6792		 *
  6793		 * A better way of solving this problem would be to wait for
  6794		 * the PELT signals of tasks to converge before taking them
  6795		 * into account, but that is not straightforward to implement,
  6796		 * and the following generally works well enough in practice.
  6797		 */
  6798		if (!task_new)
  6799			update_overutilized_status(rq);
  6800	
  6801	enqueue_throttle:
  6802		assert_list_leaf_cfs_rq(rq);
  6803	
  6804		hrtick_update(rq);
  6805	}
  6806	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
