Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A668205AA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731428858; cv=none; b=MbQvAHRxvLXbicMsDZ9nZL+sdavdWDV9/MAZXOfobhJez9xi/+0LozU0Nr1P6bU5Ll5qnfi089KRIjC4v3HfjrAeu9jPlHReMmSTYTg277uQbC5d0FIA7g4D+8hj1NVHC0hlBKXB7hr5GDkFQjOHvBN1MuBi2Q1gs23IDcciDaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731428858; c=relaxed/simple;
	bh=n3gtTYLopiCkR35j7xbTZwCV33muaepmwh56YoUGTyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EUdpc+jYQHl4yK4qrc8lzzn/aNjXP1wrGMVEyvIy0LIWi8flxKGSjKwPORk5rSgOOdcT0dUNKT44lIZAt8y2ZyfIG+Dbkzt44o/shSZTGGImF5m82eTwQ3w7uh49mxVK2d9kco1YIU728++pspl2fnDWUsaVEN/1uFEJAVMApmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5c7CG+y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5c7CG+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731428856; x=1762964856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n3gtTYLopiCkR35j7xbTZwCV33muaepmwh56YoUGTyA=;
  b=T5c7CG+yIE1isF8zzWOhvzeiUk/JH5G26pxw7MXs4qvVUyUH/tk7uFYr
   KmC6CVWQ1GDymfh8EP83Fsy7y536MqJ5rlD+/dJNa7J7Eb3gxR3ZPk5uB
   9y3oiEFvku7CBSJTgWgMKL81y1pxETqWDLAiAZByxBiy2y1kmFTrlM4os
   uL4L0a/3/0fBqbiIxlC5sSpAGWOMXyZCw/zTjSlrN3iaugr1pWYvNQcKa
   ih9w4/8070j/p5oHIQRrl3Zetwz3smJS9W3//LLOBCRaUzMSm5FywdaiO
   93+ge4jgi0ZoYh9/T3Fzz+RsGCeZWh5xEdlNynInCk1MFcnYSdBnbyr79
   Q==;
X-CSE-ConnectionGUID: QVG8f6GISEe3bTGMMLF9Sw==
X-CSE-MsgGUID: q4IB/nOkQceLRKjT0RD1Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41836534"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41836534"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 08:27:34 -0800
X-CSE-ConnectionGUID: jU3KpKDfRkWrmBgw3vfjGQ==
X-CSE-MsgGUID: ele0rhq+Q0GNODWBEjT3iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="88372366"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Nov 2024 08:27:33 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAtjm-0001WJ-1M;
	Tue, 12 Nov 2024 16:27:30 +0000
Date: Wed, 13 Nov 2024 00:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2417/2417] kernel/sched/fair.c:4499:43: error:
 no member named 'steal_h_nr_running' in 'struct cfs_rq'; did you mean
 'idle_h_nr_running'?
Message-ID: <202411130044.gkUMo98D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   400fd9ccb52e01bf78acae2bbc1710923a15f033
commit: 433c0b72564239cf3086f563d5ca32a10e4ffd3f [2417/2417] sched/fair: Count the number of tasks marked as steal_task on cfs_rq
config: x86_64-randconfig-015-20241112 (https://download.01.org/0day-ci/archive/20241113/202411130044.gkUMo98D-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130044.gkUMo98D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130044.gkUMo98D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:23:
   In file included from kernel/sched/sched.h:39:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/genhd.h:20:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/bvec.h:14:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/fair.c:23:
   kernel/sched/sched.h:1864:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1864 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:4499:43: error: no member named 'steal_h_nr_running' in 'struct cfs_rq'; did you mean 'idle_h_nr_running'?
    4499 |             (rq->cfs.h_nr_running < 2 || rq->cfs.steal_h_nr_running == 0))
         |                                                  ^~~~~~~~~~~~~~~~~~
         |                                                  idle_h_nr_running
   kernel/sched/sched.h:632:16: note: 'idle_h_nr_running' declared here
     632 |         unsigned int            idle_h_nr_running; /* SCHED_IDLE */
         |                                 ^
   kernel/sched/fair.c:4525:36: error: no member named 'steal_h_nr_running' in 'struct cfs_rq'; did you mean 'idle_h_nr_running'?
    4525 |         if (group_steal_used() && rq->cfs.steal_h_nr_running < 1)
         |                                           ^~~~~~~~~~~~~~~~~~
         |                                           idle_h_nr_running
   kernel/sched/sched.h:632:16: note: 'idle_h_nr_running' declared here
     632 |         unsigned int            idle_h_nr_running; /* SCHED_IDLE */
         |                                 ^
   kernel/sched/fair.c:6670:12: error: no member named 'steal_h_nr_running' in 'struct cfs_rq'; did you mean 'idle_h_nr_running'?
    6670 |                         cfs_rq->steal_h_nr_running++;
         |                                 ^~~~~~~~~~~~~~~~~~
         |                                 idle_h_nr_running
   kernel/sched/sched.h:632:16: note: 'idle_h_nr_running' declared here
     632 |         unsigned int            idle_h_nr_running; /* SCHED_IDLE */
         |                                 ^
   kernel/sched/fair.c:6694:12: error: no member named 'steal_h_nr_running' in 'struct cfs_rq'; did you mean 'idle_h_nr_running'?
    6694 |                         cfs_rq->steal_h_nr_running++;
         |                                 ^~~~~~~~~~~~~~~~~~
         |                                 idle_h_nr_running
   kernel/sched/sched.h:632:16: note: 'idle_h_nr_running' declared here
     632 |         unsigned int            idle_h_nr_running; /* SCHED_IDLE */
         |                                 ^
   kernel/sched/fair.c:6795:12: error: no member named 'steal_h_nr_running' in 'struct cfs_rq'; did you mean 'idle_h_nr_running'?
    6795 |                         cfs_rq->steal_h_nr_running--;
         |                                 ^~~~~~~~~~~~~~~~~~
         |                                 idle_h_nr_running
   kernel/sched/sched.h:632:16: note: 'idle_h_nr_running' declared here
     632 |         unsigned int            idle_h_nr_running; /* SCHED_IDLE */
         |                                 ^
   kernel/sched/fair.c:6831:12: error: no member named 'steal_h_nr_running' in 'struct cfs_rq'; did you mean 'idle_h_nr_running'?
    6831 |                         cfs_rq->steal_h_nr_running--;
         |                                 ^~~~~~~~~~~~~~~~~~
         |                                 idle_h_nr_running
   kernel/sched/sched.h:632:16: note: 'idle_h_nr_running' declared here
     632 |         unsigned int            idle_h_nr_running; /* SCHED_IDLE */
         |                                 ^
   kernel/sched/fair.c:13229:29: error: no member named 'steal_h_nr_running' in 'struct cfs_rq'; did you mean 'idle_h_nr_running'?
    13229 |         if (tg_used && src_rq->cfs.steal_h_nr_running < 1)
          |                                    ^~~~~~~~~~~~~~~~~~
          |                                    idle_h_nr_running
   kernel/sched/sched.h:632:16: note: 'idle_h_nr_running' declared here
     632 |         unsigned int            idle_h_nr_running; /* SCHED_IDLE */
         |                                 ^
   kernel/sched/fair.c:13241:30: error: no member named 'steal_h_nr_running' in 'struct cfs_rq'; did you mean 'idle_h_nr_running'?
    13241 |             (tg_used && src_rq->cfs.steal_h_nr_running < 1))
          |                                     ^~~~~~~~~~~~~~~~~~
          |                                     idle_h_nr_running
   kernel/sched/sched.h:632:16: note: 'idle_h_nr_running' declared here
     632 |         unsigned int            idle_h_nr_running; /* SCHED_IDLE */
         |                                 ^
   kernel/sched/fair.c:13411:6: warning: no previous prototype for function 'task_vruntime_update' [-Wmissing-prototypes]
    13411 | void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
          |      ^
   kernel/sched/fair.c:13411:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13411 | void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
          | ^
          | static 
   7 warnings and 8 errors generated.


vim +4499 kernel/sched/fair.c

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
