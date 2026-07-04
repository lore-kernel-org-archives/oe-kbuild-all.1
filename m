Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0807260D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 00:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783125218; cv=none; b=W3mRWvBxFJwA1pp7R99NLGA6EIuyux5CZGy94SUQy/R/w6YsaxcZiJJ2+G0FsVMd2F3p/o1jYoPiSZInS5E0+hxuOGtcJpYl8FkXfWQGmxqErKDGlA1vjh5VC556cUaURnHoKNRJOp8tIUHD36AyzzDHVlYOnEtzhaTJSlH1wXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783125218; c=relaxed/simple;
	bh=jVGeblFCfxUTgQ4GmtPrqhrgXW6J4CdisRy23LnQjw0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZK5x5yiXsvqtH8zvKm6dIkC5UlCCW+EnWAm/M9uKXBsRl8i8Z/3E2lDhJjeLeyDc9AqN09UkQNjZTHxax0Mm/44NdCur7yvQmOROCj1ahnI4P4ONmd+502J0Q5LzrRHbSZlGqfE5t7XkLXgObb3YuBu8dBhvkDGFCSOYSEYIt0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hcx18KHk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcx18KHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783125216; x=1814661216;
  h=date:from:to:cc:subject:message-id;
  bh=jVGeblFCfxUTgQ4GmtPrqhrgXW6J4CdisRy23LnQjw0=;
  b=hcx18KHk6rufMk67oZEszba/jpp0/XZcFWK2KveHNJDG33Ogr6bYPdGq
   648QAChijJdxNywKlItXVdvuS/ASDacVXQ0LUdew5bpiOrNuSRV/AYDDR
   yn1fmXrGijLk6GSAD+b/FaxUy87MoBvpUKDAB/ZIqYqSyyOYDpRFi8syD
   WDsRwQ6UCHfRKFwONXYMmqdGQ5fgjJGRMv9QXasXRAymtjfDxjePE/Hbb
   xqPsJmRlqpQmrebPEa3FclYlJsNB19icV/lbxJhPIqp8n/ssaNOQNv+CY
   9YJ0PZYMXi6wGPakBZBN50bcrG0j3H4DKYJ5Qv7gtJWW0ZGzxl2WnYn4D
   w==;
X-CSE-ConnectionGUID: vxFzz+hzRDijo0gQf/XmEA==
X-CSE-MsgGUID: BfjvuwJ/Rmqh/M3w/Q0sxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="82851754"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="82851754"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 17:33:35 -0700
X-CSE-ConnectionGUID: UmX5DmgYSuC6ETCnQm0vfg==
X-CSE-MsgGUID: ffoWzk+TRGO8zH3LQGZOxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253352056"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Jul 2026 17:33:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfoK3-00000000CjL-2XSk;
	Sat, 04 Jul 2026 00:33:31 +0000
Date: Sat, 04 Jul 2026 08:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/1]
 kernel/sched/fair.c:4424:6: warning: no previous prototype for
 'set_next_entity'
Message-ID: <202607040849.0VfQacAT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi lijianzhong,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   a00af2707c1d0a67daa8f91db74300f65d84db3b
commit: 54f66141a8834e27601fe594d68a97db01bb86b6 [0/1] ANDROID: sched: Add vendor hooks for sched.
config: i386-randconfig-012-20260702 (https://download.01.org/0day-ci/archive/20260704/202607040849.0VfQacAT-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607040849.0VfQacAT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607040849.0VfQacAT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:4424:6: warning: no previous prototype for 'set_next_entity' [-Wmissing-prototypes]
    4424 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:5408:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    5408 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11341:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   11341 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11343:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   11343 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11348:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   11348 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11350:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   11350 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/set_next_entity +4424 kernel/sched/fair.c

  4423	
> 4424	void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
  4425	{
  4426		/* 'current' is not kept within the tree. */
  4427		if (se->on_rq) {
  4428			/*
  4429			 * Any task has to be enqueued before it get to execute on
  4430			 * a CPU. So account for the time it spent waiting on the
  4431			 * runqueue.
  4432			 */
  4433			update_stats_wait_end(cfs_rq, se);
  4434			__dequeue_entity(cfs_rq, se);
  4435			update_load_avg(cfs_rq, se, UPDATE_TG);
  4436		}
  4437	
  4438		update_stats_curr_start(cfs_rq, se);
  4439		cfs_rq->curr = se;
  4440	
  4441		/*
  4442		 * Track our maximum slice length, if the CPU's load is at
  4443		 * least twice that of our own weight (i.e. dont track it
  4444		 * when there are only lesser-weight tasks around):
  4445		 */
  4446		if (schedstat_enabled() &&
  4447		    rq_of(cfs_rq)->cfs.load.weight >= 2*se->load.weight) {
  4448			schedstat_set(se->statistics.slice_max,
  4449				max((u64)schedstat_val(se->statistics.slice_max),
  4450				    se->sum_exec_runtime - se->prev_sum_exec_runtime));
  4451		}
  4452	
  4453		se->prev_sum_exec_runtime = se->sum_exec_runtime;
  4454	}
  4455	EXPORT_SYMBOL_GPL(set_next_entity);
  4456	
  4457	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
