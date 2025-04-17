Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53CB240611
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891040; cv=none; b=LyJVZIU5TK9b2wVaKjrzDKjHxxccpFxNoOvNOVGvx6cT6ZC5Umppiv/WHWNyRfogmvtDwhn37hLCA14bMDhgpL4nWr5dkGWmVk4ZtMW+7E/QxTFOH+iblccL0x2US5W4VbYHTHPPc8bZF8xW5rV4IO8TLBvlSeq36dSnMpzCSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891040; c=relaxed/simple;
	bh=WOyKbema8pfG19eniZUbGOQS3r4Q/InT778Cr7eJt8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=glNemz4LgdCk/deZtJlEnfKoHjdmrke3qiZ/G9DPYpOJpxTDTh6IqoXSzQKQTZfsUXanK3l3udeE5y5WAwB285MqnLR0Fvu+CNoA4aYTTfkEbHFA8ZjnwDeTpaGvV4gknDGCUI8Gux96ypCYybU6OVm1+VDgN/JPo1OrDTBVY8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBLhJLs+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBLhJLs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744891038; x=1776427038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WOyKbema8pfG19eniZUbGOQS3r4Q/InT778Cr7eJt8k=;
  b=YBLhJLs+pgF9fduVfdYqhreBMtXSlVohndpU6Sd4X8xBLMkZQ+/NoPBk
   d3fPxS4CLwJ1GLkRy46AsiBoP6NOt9p0wIoTVMZTh/h3ZsTzlppkpk1YG
   vtFpSM270gx+W2WG8dEHIbSqpyk9Lq9XDa3W3Bn9OyiNkdOlS//MZ+C5p
   /vDpUH6Khyv4Mt7S+wwSK+yLvId7tBq1BZYBAiIZWMInb27KPq3hcpphQ
   bC+w9noImHNLqAHElC7xWjLDNtfXjqSKHf8+/dx6L3x833rjMe+h+QFfs
   QEDfXirb0mV/yuYYGLTf7OLXts+gUzgBOaSBxpOPvERbQ+e0IMR/K+mQE
   Q==;
X-CSE-ConnectionGUID: 7P2hFDiCTuaWxoY+BJcfiQ==
X-CSE-MsgGUID: +uU/dGRZRcSYERH0vQv0Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57844311"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57844311"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 04:57:16 -0700
X-CSE-ConnectionGUID: KeMKgYt2TQuXUIuy5sXIsw==
X-CSE-MsgGUID: 8nS0W8teTiGBCNNq99eqhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="161736527"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Apr 2025 04:57:14 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Nrj-000Mcm-21;
	Thu, 17 Apr 2025 11:57:11 +0000
Date: Thu, 17 Apr 2025 19:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2864/2864] kernel/sched/fair.c:4499:43: error:
 'struct cfs_rq' has no member named 'steal_h_nr_running'; did you mean
 'idle_h_nr_running'?
Message-ID: <202504171909.aMEHPXYz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   90bc43e348ee5b80304a53353ee95bfae19e7bf9
commit: 433c0b72564239cf3086f563d5ca32a10e4ffd3f [2864/2864] sched/fair: Count the number of tasks marked as steal_task on cfs_rq
config: arm64-randconfig-004-20250417 (https://download.01.org/0day-ci/archive/20250417/202504171909.aMEHPXYz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171909.aMEHPXYz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171909.aMEHPXYz-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'group_steal_enabled':
   kernel/sched/fair.c:4483:31: error: implicit declaration of function 'is_tg_steal' [-Werror=implicit-function-declaration]
    4483 |  return group_steal_used() && is_tg_steal(steal_task);
         |                               ^~~~~~~~~~~
   kernel/sched/fair.c: In function 'overload_clear':
>> kernel/sched/fair.c:4499:43: error: 'struct cfs_rq' has no member named 'steal_h_nr_running'; did you mean 'idle_h_nr_running'?
    4499 |      (rq->cfs.h_nr_running < 2 || rq->cfs.steal_h_nr_running == 0))
         |                                           ^~~~~~~~~~~~~~~~~~
         |                                           idle_h_nr_running
   kernel/sched/fair.c:4489:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    4489 |  unsigned long time;
         |                ^~~~
   kernel/sched/fair.c: In function 'overload_set':
   kernel/sched/fair.c:4525:36: error: 'struct cfs_rq' has no member named 'steal_h_nr_running'; did you mean 'idle_h_nr_running'?
    4525 |  if (group_steal_used() && rq->cfs.steal_h_nr_running < 1)
         |                                    ^~~~~~~~~~~~~~~~~~
         |                                    idle_h_nr_running
   kernel/sched/fair.c:4517:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    4517 |  unsigned long time;
         |                ^~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:6013:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    6013 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'enqueue_task_fair':
   kernel/sched/fair.c:6670:12: error: 'struct cfs_rq' has no member named 'steal_h_nr_running'; did you mean 'idle_h_nr_running'?
    6670 |    cfs_rq->steal_h_nr_running++;
         |            ^~~~~~~~~~~~~~~~~~
         |            idle_h_nr_running
   kernel/sched/fair.c:6694:12: error: 'struct cfs_rq' has no member named 'steal_h_nr_running'; did you mean 'idle_h_nr_running'?
    6694 |    cfs_rq->steal_h_nr_running++;
         |            ^~~~~~~~~~~~~~~~~~
         |            idle_h_nr_running
   kernel/sched/fair.c: In function 'dequeue_task_fair':
   kernel/sched/fair.c:6795:12: error: 'struct cfs_rq' has no member named 'steal_h_nr_running'; did you mean 'idle_h_nr_running'?
    6795 |    cfs_rq->steal_h_nr_running--;
         |            ^~~~~~~~~~~~~~~~~~
         |            idle_h_nr_running
   kernel/sched/fair.c:6831:12: error: 'struct cfs_rq' has no member named 'steal_h_nr_running'; did you mean 'idle_h_nr_running'?
    6831 |    cfs_rq->steal_h_nr_running--;
         |            ^~~~~~~~~~~~~~~~~~
         |            idle_h_nr_running
   kernel/sched/fair.c: In function 'select_task_rq_fair':
   kernel/sched/fair.c:8191:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    8191 |  unsigned long time;
         |                ^~~~
   kernel/sched/fair.c: In function 'pick_next_task_fair':
   kernel/sched/fair.c:9185:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    9185 |  unsigned long time;
         |                ^~~~
   kernel/sched/fair.c: In function 'can_migrate_task_llc':
>> kernel/sched/fair.c:9944:43: error: dereferencing pointer to incomplete type 'struct task_group'
    9944 |  if (group_steal_used() && !is_tg_steal(tg->steal_task))
         |                                           ^~
   kernel/sched/fair.c: In function 'steal_from':
   kernel/sched/fair.c:13229:29: error: 'struct cfs_rq' has no member named 'steal_h_nr_running'; did you mean 'idle_h_nr_running'?
   13229 |  if (tg_used && src_rq->cfs.steal_h_nr_running < 1)
         |                             ^~~~~~~~~~~~~~~~~~
         |                             idle_h_nr_running
   kernel/sched/fair.c:13241:30: error: 'struct cfs_rq' has no member named 'steal_h_nr_running'; did you mean 'idle_h_nr_running'?
   13241 |      (tg_used && src_rq->cfs.steal_h_nr_running < 1))
         |                              ^~~~~~~~~~~~~~~~~~
         |                              idle_h_nr_running
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:13411:6: warning: no previous prototype for 'task_vruntime_update' [-Wmissing-prototypes]
   13411 | void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13961:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   13961 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13963:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   13963 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13968:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   13968 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13970:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   13970 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +4499 kernel/sched/fair.c

  4480	
  4481	static inline bool group_steal_enabled(int steal_task)
  4482	{
> 4483		return group_steal_used() && is_tg_steal(steal_task);
  4484	}
  4485	
  4486	static void overload_clear(struct rq *rq)
  4487	{
  4488		struct sparsemask *overload_cpus;
  4489		unsigned long time;
  4490		bool need_clear = false;
  4491	
  4492		if (!steal_enabled())
  4493			return;
  4494	
  4495		if (!group_steal_used() && rq->cfs.h_nr_running >= 2)
  4496			return;
  4497	
  4498		if (group_steal_used() &&
> 4499		    (rq->cfs.h_nr_running < 2 || rq->cfs.steal_h_nr_running == 0))
  4500			need_clear = true;
  4501	
  4502		if (!need_clear)
  4503			return;
  4504	
  4505		time = schedstat_start_time();
  4506		rcu_read_lock();
  4507		overload_cpus = rcu_dereference(rq->cfs_overload_cpus);
  4508		if (overload_cpus)
  4509			sparsemask_clear_elem(overload_cpus, rq->cpu);
  4510		rcu_read_unlock();
  4511		schedstat_end_time(rq, time);
  4512	}
  4513	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
