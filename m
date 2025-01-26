Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B1F45005
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 23:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737935150; cv=none; b=ZEQb18ue6j/GSOzs2CjmUjYV56S2Bv8grbq8nXZiB/FYrexZYhEjVBG7PeD5Fxnne+vIa/S5FcFi4cIJggEIBv4sPEddU74Y1/xR1qY7eiNXTNPIDQeHLxWdB9Yr9XkOTkRScoQVkKVPkee4rHuwLeHNtrIWQ9rpsA/DpkWdUJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737935150; c=relaxed/simple;
	bh=Hz2doSsjWsQg1nSQ2DxFI7CAvUBn6Ya01y28yCWw4io=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IXSJM2Vyo6Yi1lPrEETzBHPsMYiD1Pc2XVw2g3UgW4xceeA0EzvcuC3PzR2rqtgVl94CeVis0IlvoIn05ocdBRlFsmV7d+a5uTHwR8E+O2ldI1uieUiPumvOMbPP6q9VLSAaFciYeFoUzcKlw9PG3T4CgQ23Kmr02UxkB8lzNCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0Fh0qEe; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0Fh0qEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737935149; x=1769471149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hz2doSsjWsQg1nSQ2DxFI7CAvUBn6Ya01y28yCWw4io=;
  b=c0Fh0qEe/aEiZiiJOgW0IRpLk+XxjR6Aug0qAPJZ3PP/9T3ZApHNwYlb
   cht9EZ937mXON4y8uhHqv5qp0VbZIYoofSTQHoSODWO5o7dvX/+a54yRC
   B8CjQAthVGZwFFZtp2EZINSa8/06o+fSU6xGKRgp82NUQGTyIcQecSbEO
   FjZtj3puPezgwLUNaxATdjxEAdaByhxrBCeeoSR4dYEtVTK3/7+MrM+gE
   7CSaZlEu9UU/+tDGZ8C4Ngj4lTt5F7V6Xe+jkIjsztWfYF2BdiyjWD50r
   U9YA0z3/VP43K0pczYzhizMkphjcnZMfhsW2thkllN+250wOMKTtIuFps
   g==;
X-CSE-ConnectionGUID: uKG3hs3DRRyLdl+mqUODQg==
X-CSE-MsgGUID: MapQnAeDRYew+3SsA53c/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38530446"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="38530446"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 15:45:46 -0800
X-CSE-ConnectionGUID: wgIAwVJXQPO3J3rwlufb/w==
X-CSE-MsgGUID: oLGKtGWOQri417Pm5RicEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108726199"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Jan 2025 15:45:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcCJy-000gB5-2n;
	Sun, 26 Jan 2025 23:45:42 +0000
Date: Mon, 27 Jan 2025 07:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.13.y 83/83] kernel/sched/fair.c:3810:6:
 warning: no previous prototype for function 'reweight_entity'
Message-ID: <202501270729.t9UEoBvc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   c358c65925524fe1dfe962d59966a6aa01b5fc9b
commit: c358c65925524fe1dfe962d59966a6aa01b5fc9b [83/83] linux6.13.y-bore5.9.6
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250127/202501270729.t9UEoBvc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501270729.t9UEoBvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270729.t9UEoBvc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:3810:6: warning: no previous prototype for function 'reweight_entity' [-Wmissing-prototypes]
    3810 | void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
         |      ^
   kernel/sched/fair.c:3810:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3810 | void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
         | ^
         | static 
   kernel/sched/fair.c:504:20: warning: unused function 'list_del_leaf_cfs_rq' [-Wunused-function]
     504 | static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:525:19: warning: unused function 'tg_is_idle' [-Wunused-function]
     525 | static inline int tg_is_idle(struct task_group *tg)
         |                   ^~~~~~~~~~
   kernel/sched/fair.c:549:19: warning: unused function 'max_vruntime' [-Wunused-function]
     549 | static inline u64 max_vruntime(u64 max_vruntime, u64 vruntime)
         |                   ^~~~~~~~~~~~
   kernel/sched/fair.c:1423:20: warning: unused function 'is_core_idle' [-Wunused-function]
    1423 | static inline bool is_core_idle(int cpu)
         |                    ^~~~~~~~~~~~
   kernel/sched/fair.c:3690:20: warning: unused function 'account_numa_enqueue' [-Wunused-function]
    3690 | static inline void account_numa_enqueue(struct rq *rq, struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3694:20: warning: unused function 'account_numa_dequeue' [-Wunused-function]
    3694 | static inline void account_numa_dequeue(struct rq *rq, struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3698:20: warning: unused function 'update_scan_period' [-Wunused-function]
    3698 | static inline void update_scan_period(struct task_struct *p, int new_cpu)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5165:20: warning: unused function 'cfs_rq_is_decayed' [-Wunused-function]
    5165 | static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
         |                    ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5180:20: warning: unused function 'remove_entity_load_avg' [-Wunused-function]
    5180 | static inline void remove_entity_load_avg(struct sched_entity *se) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6722:20: warning: unused function 'cfs_bandwidth_used' [-Wunused-function]
    6722 | static inline bool cfs_bandwidth_used(void)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6730:20: warning: unused function 'sync_throttle' [-Wunused-function]
    6730 | static inline void sync_throttle(struct task_group *tg, int cpu) {}
         |                    ^~~~~~~~~~~~~
   kernel/sched/fair.c:6743:19: warning: unused function 'throttled_lb_pair' [-Wunused-function]
    6743 | static inline int throttled_lb_pair(struct task_group *tg,
         |                   ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6754:37: warning: unused function 'tg_cfs_bandwidth' [-Wunused-function]
    6754 | static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
         |                                     ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6758:20: warning: unused function 'destroy_cfs_bandwidth' [-Wunused-function]
    6758 | static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6759:20: warning: unused function 'update_runtime_enabled' [-Wunused-function]
    6759 | static inline void update_runtime_enabled(struct rq *rq) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6760:20: warning: unused function 'unthrottle_offline_cfs_rqs' [-Wunused-function]
    6760 | static inline void unthrottle_offline_cfs_rqs(struct rq *rq) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   17 warnings generated.


vim +/reweight_entity +3810 kernel/sched/fair.c

  3809	
> 3810	void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
  3811				    unsigned long weight)
  3812	{
  3813		bool curr = cfs_rq->curr == se;
  3814	
  3815		if (se->on_rq) {
  3816			/* commit outstanding execution time */
  3817			update_curr(cfs_rq);
  3818			update_entity_lag(cfs_rq, se);
  3819			se->deadline -= se->vruntime;
  3820			se->rel_deadline = 1;
  3821			if (!curr)
  3822				__dequeue_entity(cfs_rq, se);
  3823			update_load_sub(&cfs_rq->load, se->load.weight);
  3824		}
  3825		dequeue_load_avg(cfs_rq, se);
  3826	
  3827		/*
  3828		 * Because we keep se->vlag = V - v_i, while: lag_i = w_i*(V - v_i),
  3829		 * we need to scale se->vlag when w_i changes.
  3830		 */
  3831		se->vlag = div_s64(se->vlag * se->load.weight, weight);
  3832		if (se->rel_deadline)
  3833			se->deadline = div_s64(se->deadline * se->load.weight, weight);
  3834	
  3835		update_load_set(&se->load, weight);
  3836	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
