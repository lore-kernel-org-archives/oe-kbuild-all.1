Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91C21FBA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 06:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725429779; cv=none; b=smbtdu2d2lmJEl6WlB+wTS2hUBTUFuIl+X5nSWhpJ3ogLeDweOvZa4de6HVO1bUmSVHT35Q+zbKiy/Q3IW/CVuY42rll4Y8LbewqbdHq6sGiGjhbmKfJ8daJP5IE3WyV/3tc+8lVkNeAIwRArCl49HxjiqqgPJKl9IXqwNq3TLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725429779; c=relaxed/simple;
	bh=KfzGyBD1fGlY/IntjxQF54s4Xf5EkrEsrm7KbmWdm1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qwNjjZpLxHn6zx6wHGAZTpAcoW62ef56q5LOH6Xr25YcwJ8qZ6WbAiCzf9Y13qVNkm3PnuytopwStnpz6PutpQrz4kFgDQFJTi6B39Prt+3XR0SybusExMMbpDyfp22WAOOnDwVhB50JbvgGiuVYi9WWiMZvFyUyahLaYpNa3y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+TgdrOj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+TgdrOj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725429778; x=1756965778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KfzGyBD1fGlY/IntjxQF54s4Xf5EkrEsrm7KbmWdm1E=;
  b=G+TgdrOjhZ+DHSPdKzE2dw7A6ClYkEdcQUSI7ERkiltzanEW5p0g+d5v
   gfRvVb6HnIDPrmq3WrlrXG7GvfkdcCPUew+MKHkPxeQNP2unK1LV5NRlt
   G7/n/dkGWgHWNxsLQUkTQ6l3d04WyIMNFJpv/sSJaim/jk+NMVXRFSvZQ
   ZTBXbMO9gLGReciUEEYfjgTicvXtCY+C3pjhcPfroRvN1hi++sO7D/rEy
   GHil7Y9q43k5STHHeeNr20YjKBBZplFpKs/josBiRF5q80CTnD2/7fzTo
   5coaPAfBiXzvH2gJ6NM8waAMT99d8jRvkf+WLrjtbupp7K2h9oE/Lktc5
   Q==;
X-CSE-ConnectionGUID: EfgonJ1HT9efNqheaCnROQ==
X-CSE-MsgGUID: UDNxtHXlS0mpbughC0y0Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24176197"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="24176197"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 23:02:57 -0700
X-CSE-ConnectionGUID: ctYmE6ZATaatQRkO4F+vzQ==
X-CSE-MsgGUID: NhL7G2JLR5ixeC9daD6ZBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65878708"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 23:02:53 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slj6Q-0007ay-1C;
	Wed, 04 Sep 2024 06:02:50 +0000
Date: Wed, 4 Sep 2024 14:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7865/10951] kernel/cgroup/sli.c:404:17: error:
 implicit declaration of function 'mem_cgroup_from_task'; did you mean
 'get_cgroup_from_task'?
Message-ID: <202409041349.ETbsushy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   95e99651a23c1ccc103007c3b0532ff97d7c357d
commit: 00423a80429a623a28227d306c3108e801dd0f6f [7865/10951] sli: backport sli function from tk3
config: loongarch-randconfig-r051-20240904 (https://download.01.org/0day-ci/archive/20240904/202409041349.ETbsushy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041349.ETbsushy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041349.ETbsushy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/cgroup/sli.c:14:
   kernel/cgroup/../sched/sched.h: In function 'mm_cid_get':
   kernel/cgroup/../sched/sched.h:3581:25: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
    3581 |         struct cpumask *cpumask;
         |                         ^~~~~~~
   kernel/cgroup/sli.c: In function 'sli_memlat_stat_end':
>> kernel/cgroup/sli.c:404:17: error: implicit declaration of function 'mem_cgroup_from_task'; did you mean 'get_cgroup_from_task'? [-Wimplicit-function-declaration]
     404 |         memcg = mem_cgroup_from_task(current);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 get_cgroup_from_task
>> kernel/cgroup/sli.c:404:15: error: assignment to 'struct mem_cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     404 |         memcg = mem_cgroup_from_task(current);
         |               ^
>> kernel/cgroup/sli.c:405:32: error: 'root_mem_cgroup' undeclared (first use in this function); did you mean 'parent_mem_cgroup'?
     405 |         if (!memcg || memcg == root_mem_cgroup)
         |                                ^~~~~~~~~~~~~~~
         |                                parent_mem_cgroup
   kernel/cgroup/sli.c:405:32: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/cgroup/sli.c:408:21: error: invalid use of undefined type 'struct mem_cgroup'
     408 |         cgrp = memcg->css.cgroup;
         |                     ^~
   kernel/cgroup/sli.c: In function 'sli_check_longsys':
>> kernel/cgroup/sli.c:552:29: error: 'struct sched_info' has no member named 'kernel_exec_start'
     552 |         if (!tsk->sched_info.kernel_exec_start ||
         |                             ^
>> kernel/cgroup/sli.c:553:28: error: 'struct sched_info' has no member named 'task_switch'
     553 |             tsk->sched_info.task_switch != (tsk->nvcsw + tsk->nivcsw) ||
         |                            ^
>> kernel/cgroup/sli.c:554:42: error: 'struct sched_info' has no member named 'utime'
     554 |             tsk->utime != tsk->sched_info.utime) {
         |                                          ^
   kernel/cgroup/sli.c:555:32: error: 'struct sched_info' has no member named 'utime'
     555 |                 tsk->sched_info.utime = tsk->utime;
         |                                ^
   kernel/cgroup/sli.c:556:32: error: 'struct sched_info' has no member named 'kernel_exec_start'
     556 |                 tsk->sched_info.kernel_exec_start = rq_clock(task_rq(tsk));
         |                                ^
   kernel/cgroup/sli.c:557:32: error: 'struct sched_info' has no member named 'task_switch'
     557 |                 tsk->sched_info.task_switch = tsk->nvcsw + tsk->nivcsw;
         |                                ^
   kernel/cgroup/sli.c:561:57: error: 'struct sched_info' has no member named 'kernel_exec_start'
     561 |         delta = rq_clock(task_rq(tsk)) - tsk->sched_info.kernel_exec_start;
         |                                                         ^
   kernel/cgroup/sli.c: At top level:
   kernel/cgroup/sli.c:642:16: warning: no previous prototype for 'get_cgroup_from_task_id' [-Wmissing-prototypes]
     642 | struct cgroup *get_cgroup_from_task_id(struct task_struct *task, int event_nr)
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/sli.c: In function 'get_cgroup_from_task_id':
   kernel/cgroup/sli.c:647:14: error: 'cpuacct_cgrp_id' undeclared (first use in this function); did you mean 'cpu_cgrp_id'?
     647 |         id = cpuacct_cgrp_id;
         |              ^~~~~~~~~~~~~~~
         |              cpu_cgrp_id


vim +404 kernel/cgroup/sli.c

   394	
   395	void sli_memlat_stat_end(enum sli_memlat_stat_item sidx, u64 start)
   396	{
   397		struct mem_cgroup *memcg;
   398		struct cgroup *cgrp;
   399	
   400		if (!static_branch_likely(&sli_enabled) || start == 0)
   401			return;
   402	
   403		rcu_read_lock();
 > 404		memcg = mem_cgroup_from_task(current);
 > 405		if (!memcg || memcg == root_mem_cgroup)
   406			goto out;
   407	
 > 408		cgrp = memcg->css.cgroup;
   409		if (cgrp && cgroup_parent(cgrp)) {
   410			enum sli_lat_count cidx;
   411			u64 duration;
   412	
   413			duration = local_clock() - start;
   414			cidx = get_lat_count_idx(duration);
   415	
   416			duration = duration >> 10;
   417			this_cpu_inc(cgrp->sli_memlat_stat_percpu->item[sidx][cidx]);
   418			this_cpu_add(cgrp->sli_memlat_stat_percpu->latency_max[sidx], duration);
   419	
   420			if (static_branch_unlikely(&sli_monitor_enabled)) {
   421				struct sli_event_monitor *event_monitor = cgrp->cgrp_event_monitor;
   422	
   423				if (duration < READ_ONCE(event_monitor->memlat_threshold[sidx]))
   424					goto out;
   425	
   426				atomic_long_inc(&event_monitor->memlat_statistics[sidx]);
   427	
   428				if (event_monitor->mbuf_enable) {
   429					char *lat_name;
   430	
   431					lat_name = get_memlat_name(sidx);
   432					store_task_stack(current, lat_name, duration, 0, cgrp);
   433				}
   434			}
   435		}
   436	
   437	out:
   438		rcu_read_unlock();
   439	}
   440	
   441	void sli_schedlat_stat(struct task_struct *task, enum sli_schedlat_stat_item sidx, u64 delta)
   442	{
   443		struct cgroup *cgrp = NULL;
   444	
   445		if (!static_branch_likely(&sli_enabled) || !task)
   446			return;
   447	
   448		rcu_read_lock();
   449		cgrp = get_cgroup_from_task(task);
   450		if (cgrp && cgroup_parent(cgrp)) {
   451			enum sli_lat_count cidx = get_lat_count_idx(delta);
   452	
   453			delta = delta >> 10;
   454			this_cpu_inc(cgrp->sli_schedlat_stat_percpu->item[sidx][cidx]);
   455			this_cpu_add(cgrp->sli_schedlat_stat_percpu->latency_max[sidx], delta);
   456	
   457			if (static_branch_unlikely(&sli_monitor_enabled)) {
   458				struct sli_event_monitor *event_monitor = cgrp->cgrp_event_monitor;
   459	
   460				if (delta < READ_ONCE(event_monitor->schedlat_threshold[sidx]))
   461					goto out;
   462	
   463				atomic_long_inc(&event_monitor->schedlat_statistics[sidx]);
   464	
   465				if (event_monitor->mbuf_enable) {
   466					char *lat_name;
   467	
   468					lat_name = get_schedlat_name(sidx);
   469					store_task_stack(task, lat_name, delta, 0, cgrp);
   470				}
   471			}
   472		}
   473	
   474	out:
   475		rcu_read_unlock();
   476	}
   477	
   478	void sli_schedlat_rundelay(struct task_struct *task, struct task_struct *prev, u64 delta)
   479	{
   480		enum sli_schedlat_stat_item sidx = SCHEDLAT_RUNDELAY;
   481		struct cgroup *cgrp = NULL;
   482	
   483		if (!static_branch_likely(&sli_enabled) || !task || !prev)
   484			return;
   485	
   486		rcu_read_lock();
   487		cgrp = get_cgroup_from_task(task);
   488		if (cgrp && cgroup_parent(cgrp)) {
   489			enum sli_lat_count cidx = get_lat_count_idx(delta);
   490	
   491			delta = delta >> 10;
   492			this_cpu_inc(cgrp->sli_schedlat_stat_percpu->item[sidx][cidx]);
   493			this_cpu_add(cgrp->sli_schedlat_stat_percpu->latency_max[sidx], delta);
   494	
   495			if (static_branch_unlikely(&sli_monitor_enabled)) {
   496				struct sli_event_monitor *event_monitor = cgrp->cgrp_event_monitor;
   497	
   498				if (delta < READ_ONCE(event_monitor->schedlat_threshold[sidx]))
   499					goto out;
   500	
   501				atomic_long_inc(&event_monitor->schedlat_statistics[sidx]);
   502	
   503	#ifdef CONFIG_RQM
   504				if (event_monitor->mbuf_enable) {
   505					int i;
   506					unsigned long *entries;
   507					unsigned int nr_entries = 0;
   508					unsigned long flags;
   509	
   510					entries = kmalloc_array(MAX_STACK_TRACE_DEPTH, sizeof(*entries),
   511								GFP_ATOMIC);
   512					if (!entries)
   513						goto out;
   514	
   515					nr_entries = stack_trace_save_tsk(prev, entries,
   516									  MAX_STACK_TRACE_DEPTH, 0);
   517					spin_lock_irqsave(&cgrp->cgrp_mbuf_lock, flags);
   518					mbuf_print(cgrp, "record reason:schedlat_rundelay next_comm:%s "
   519									"next_pid:%d prev_comm:%s prev_pid:%d duration=%lld\n",
   520						   task->comm, task->pid, prev->comm, prev->pid, delta);
   521					for (i = 0; i < nr_entries; i++)
   522						mbuf_print(cgrp, "[<0>] %pB\n", (void *)entries[i]);
   523	
   524					spin_unlock_irqrestore(&cgrp->cgrp_mbuf_lock, flags);
   525					kfree(entries);
   526				}
   527	#endif
   528			}
   529		}
   530	out:
   531		rcu_read_unlock();
   532	}
   533	
   534	void sli_check_longsys(struct task_struct *tsk)
   535	{
   536		long delta;
   537	
   538		if (!static_branch_likely(&sli_enabled))
   539			return;
   540	
   541		if (tsk->sched_class != &fair_sched_class)
   542			return;
   543	
   544		/* Longsys is performed only when TIF_RESCHED is set */
   545		if (!test_tsk_need_resched(tsk))
   546			return;
   547	
   548		/* Kthread is not belong to any cgroup */
   549		if (tsk->flags & PF_KTHREAD)
   550			return;
   551	
 > 552		if (!tsk->sched_info.kernel_exec_start ||
 > 553		    tsk->sched_info.task_switch != (tsk->nvcsw + tsk->nivcsw) ||
 > 554		    tsk->utime != tsk->sched_info.utime) {
   555			tsk->sched_info.utime = tsk->utime;
   556			tsk->sched_info.kernel_exec_start = rq_clock(task_rq(tsk));
   557			tsk->sched_info.task_switch = tsk->nvcsw + tsk->nivcsw;
   558			return;
   559	
   560		}
   561		delta = rq_clock(task_rq(tsk)) - tsk->sched_info.kernel_exec_start;
   562		sli_schedlat_stat(tsk, SCHEDLAT_LONGSYS, delta);
   563	}
   564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
