Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B961FECBA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 07:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765437949; cv=none; b=NZfjnSPnxZieFJyQ2RVD5i4hFl1rtvkJTXu+VFeABYuHggdr/4n9ftPQEhSM3966Jqx83QN3idBYK+0QYsMLqydiCAARJoFNbpumz6yOVJ60C5zojg0weayEPOvPbk0NfNgD1D4NgLcyv7eaUfqt8tK+2/Av7tNgl+Hp9XJiKq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765437949; c=relaxed/simple;
	bh=6SsSMxHagPAmEWFGbEow01dpNShf+CX0verwgpcg168=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IQWDYfYfZCuIk2xpbJyr3QeLOvsDzlaLZx8Y45a48gJo3ivxXUu6mjmhOLVVmr0fdcyqAOzoPFomyH0h682kUbE2zuEOagnnA/YkyI0hYHGcy1Gu++/aE0VWw8xTIVcoBUaEhBVswz6ErdZEetbU8v42sodfkySTJ0DStErm8Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGzAuh2R; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGzAuh2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765437947; x=1796973947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6SsSMxHagPAmEWFGbEow01dpNShf+CX0verwgpcg168=;
  b=OGzAuh2R9N9CAonHuSXCFKbIxs14mj/Hd0Yup7vulW0GOJBUODeiyI4a
   gcvzPd1slLrq5ug3oB9hQfC2Di++Occi04MyA1eLyz+RYu7cR6Cm4664B
   96Rc8wTVGH2qUdpcNmNdAQ5TI7eu49NuEG6KglFSVy0xqt9qggurkQUZ0
   iJFyGdYJVv90YtsgHMizPotAsnR82QpgpmCwiv9rPlUrT9LEH+Gg9qvXj
   yKBCR5MTKDrg9CqxykVdPHs37ow6WU7jnDonhSy9hbdkkjN+B/iRAgaSC
   KqNDFiE/C3vu7z9yKtm8dfoMBB1CTh06lgbt5pcISPfAYYceLrapb64Rc
   g==;
X-CSE-ConnectionGUID: dy3FCcVLTd2302LGXtZEKQ==
X-CSE-MsgGUID: 1FvZ32TbSG2LTK4GG/90xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78781774"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78781774"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 23:25:46 -0800
X-CSE-ConnectionGUID: uQBGZHIhSOKbrjnTF9Tiuw==
X-CSE-MsgGUID: 310C62c2Q2ypfI5eb6D4aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196739616"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 23:25:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTb3X-000000004M9-1bpa;
	Thu, 11 Dec 2025 07:25:43 +0000
Date: Thu, 11 Dec 2025 15:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3] kernel/sched/fair.c:4492:6:
 warning: no previous prototype for function 'set_next_entity'
Message-ID: <202512111502.3rUublR3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   7f79269610abecdf51b504c4b91acc5dba99fce4
commit: f94f1b91143ed44a6c64a6d201cd3b41e3c90863 [0/3] ANDROID: sched: Export set_next_entity
config: i386-randconfig-051-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111502.3rUublR3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111502.3rUublR3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111502.3rUublR3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:4492:6: warning: no previous prototype for function 'set_next_entity' [-Wmissing-prototypes]
    4492 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^
   kernel/sched/fair.c:4492:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4492 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         | ^
         | static 
   kernel/sched/fair.c:2976:20: warning: unused function 'account_numa_enqueue' [-Wunused-function]
    2976 | static inline void account_numa_enqueue(struct rq *rq, struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:2980:20: warning: unused function 'account_numa_dequeue' [-Wunused-function]
    2980 | static inline void account_numa_dequeue(struct rq *rq, struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:2984:20: warning: unused function 'update_scan_period' [-Wunused-function]
    2984 | static inline void update_scan_period(struct task_struct *p, int new_cpu)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4806:19: warning: unused function 'throttled_lb_pair' [-Wunused-function]
    4806 | static inline int throttled_lb_pair(struct task_group *tg,
         |                   ^~~~~~~~~~~~~~~~~
   5 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/set_next_entity +4492 kernel/sched/fair.c

  4491	
> 4492	void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
  4493	{
  4494		clear_buddies(cfs_rq, se);
  4495	
  4496		/* 'current' is not kept within the tree. */
  4497		if (se->on_rq) {
  4498			/*
  4499			 * Any task has to be enqueued before it get to execute on
  4500			 * a CPU. So account for the time it spent waiting on the
  4501			 * runqueue.
  4502			 */
  4503			update_stats_wait_end(cfs_rq, se);
  4504			__dequeue_entity(cfs_rq, se);
  4505			update_load_avg(cfs_rq, se, UPDATE_TG);
  4506		}
  4507	
  4508		update_stats_curr_start(cfs_rq, se);
  4509		cfs_rq->curr = se;
  4510	
  4511		/*
  4512		 * Track our maximum slice length, if the CPU's load is at
  4513		 * least twice that of our own weight (i.e. dont track it
  4514		 * when there are only lesser-weight tasks around):
  4515		 */
  4516		if (schedstat_enabled() &&
  4517		    rq_of(cfs_rq)->cfs.load.weight >= 2*se->load.weight) {
  4518			schedstat_set(se->statistics.slice_max,
  4519				max((u64)schedstat_val(se->statistics.slice_max),
  4520				    se->sum_exec_runtime - se->prev_sum_exec_runtime));
  4521		}
  4522	
  4523		se->prev_sum_exec_runtime = se->sum_exec_runtime;
  4524	}
  4525	EXPORT_SYMBOL_GPL(set_next_entity);
  4526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
