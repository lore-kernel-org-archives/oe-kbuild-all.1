Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833DE37E2F5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 21:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647086; cv=none; b=Gf73Q4gLHu/3lQjpGLn6SdvwFFHbNAe1nZZvyWD39LtG4RKzvfF7INNEtzsQRXlrdN40lFqAfzu+Qb+0FfPS6dXga0BMALk19JVHhxPIt2AQlfUAJInRb3V8WODxsY1WLACHVK5qYgLUnyWmSA0zHbK95l0p+MBGzO9OKr/5FNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647086; c=relaxed/simple;
	bh=EUA2Y42EM4vmeBZgHrM36JJj5y6i+U3mjHC7Bk8Ww6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uZO5sNdlbfhFZ0HdP71a6ORdIX+s6YaM8oYcW3JQYCZI5bGJS/oD68Kucm40k8M6IXstBO+r24LMwGIHC+JYrFU2GF2gGaONx1tuJNxsec6CKi8AeLStRvzYktL/BZ8l/YjcgSpwGevna9p61dHb4g7RR/zd/OE1WL4FD3veZ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/R/tM/t; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/R/tM/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774647085; x=1806183085;
  h=date:from:to:cc:subject:message-id;
  bh=EUA2Y42EM4vmeBZgHrM36JJj5y6i+U3mjHC7Bk8Ww6M=;
  b=E/R/tM/tlMPwgwmzF8LCIYpH2rkelMoyzIU7ioSfppK6kLkCxouNQYwB
   d9RopCaKwOsSGWZAXfmS8FpzfGnoRRxh1enLpIRsnGQTQ4I9ncPqgZ6nM
   gJze/BxvC03QVKZrKINim4MdcqMLjEYjAquV5dHuOn2FZgXhU5quGjdK1
   OAB+PmWHclAaI5Mtq9d18S8bVdNzTW8rpYKdtGrlxPI7R/iTaf37iX+9j
   Pdqi6gd12b+jezn3q4600qwzimpB3OM94r/Wz1LVnv03L8mVwjybM3GHH
   GhWIbq12LtEuTUzM36Sd1pLCdGMcx77R0QWjYRskQ34la2nNtYeF2lDbe
   A==;
X-CSE-ConnectionGUID: PvjMYi+KRPK+H4GJ0Xl7Pg==
X-CSE-MsgGUID: Qz+0ffpGTAG0QVMuaO7udQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93307805"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="93307805"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 14:31:24 -0700
X-CSE-ConnectionGUID: HQ+FYrxRSoqH+b/15r+Prg==
X-CSE-MsgGUID: TUqxvjuZTCyuiDVrsi6ggw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="227031761"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Mar 2026 14:31:23 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Em0-00000000Amn-2JUJ;
	Fri, 27 Mar 2026 21:31:20 +0000
Date: Sat, 28 Mar 2026 05:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 5/5]
 kernel/sched/fair.c:4492:6: warning: no previous prototype for function
 'set_next_entity'
Message-ID: <202603280510.JE3KUmG2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Shaleen,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   5358ce5b12374ccfca58d40797ac7c5dad72ff05
commit: f94f1b91143ed44a6c64a6d201cd3b41e3c90863 [5/5] ANDROID: sched: Export set_next_entity
config: x86_64-randconfig-104-20260322 (https://download.01.org/0day-ci/archive/20260328/202603280510.JE3KUmG2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280510.JE3KUmG2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280510.JE3KUmG2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:4492:6: warning: no previous prototype for function 'set_next_entity' [-Wmissing-prototypes]
    4492 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^
   kernel/sched/fair.c:4492:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4492 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         | ^
         | static 
   kernel/sched/fair.c:5506:6: warning: no previous prototype for function 'init_cfs_bandwidth' [-Wmissing-prototypes]
    5506 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^
   kernel/sched/fair.c:5506:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5506 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         | ^
         | static 
   kernel/sched/fair.c:11140:6: warning: no previous prototype for function 'task_vruntime_update' [-Wmissing-prototypes]
    11140 | void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
          |      ^
   kernel/sched/fair.c:11140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11140 | void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
          | ^
          | static 
   kernel/sched/fair.c:11752:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
    11752 | void free_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:11752:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11752 | void free_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:11754:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
    11754 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          |     ^
   kernel/sched/fair.c:11754:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11754 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          | ^
          | static 
   kernel/sched/fair.c:11759:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
    11759 | void online_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:11759:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11759 | void online_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:11761:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
    11761 | void unregister_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:11761:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11761 | void unregister_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:469:20: warning: unused function 'list_del_leaf_cfs_rq' [-Wunused-function]
     469 | static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:490:19: warning: unused function 'tg_is_idle' [-Wunused-function]
     490 | static inline int tg_is_idle(struct task_group *tg)
         |                   ^~~~~~~~~~
   kernel/sched/fair.c:5487:20: warning: unused function 'sync_throttle' [-Wunused-function]
    5487 | static inline void sync_throttle(struct task_group *tg, int cpu) {}
         |                    ^~~~~~~~~~~~~
   kernel/sched/fair.c:5512:37: warning: unused function 'tg_cfs_bandwidth' [-Wunused-function]
    5512 | static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
         |                                     ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5516:20: warning: unused function 'destroy_cfs_bandwidth' [-Wunused-function]
    5516 | static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8609:19: warning: unused function 'check_misfit_status' [-Wunused-function]
    8609 | static inline int check_misfit_status(struct rq *rq, struct sched_domain *sd)
         |                   ^~~~~~~~~~~~~~~~~~~
   13 warnings generated.


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
