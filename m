Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112171774B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 22:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688770155; x=1720306155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5quPOgi+xPq2m1/ctWEzMcgL9TWsXxfaov6wVLnKPjk=;
  b=OSUM7KNn7LvnV1gmMbEYzun9SfARBTEcRWfBT5vwNCWmcwBHoPvpxM9R
   HIAifZu+dxzuF2tiCY686U38t4D09GcEC+1uyzxmX/9FLuQWdGSRrUnXW
   M1I04NOilt7VuSoCFBEnrftfKGEf4QRoaX6sAWGuGaxrJOtf2xgudJOZN
   x34V5NqncStfeaVVs312J8TQYaKumfaezxd12rafy+KmpDPxaN0fNesj9
   qEBTtWBMFcqWOyWrr2maayedj15r5TtoXxEVazVZVgab9fzoDB2ilNj7d
   XIDLKMfmC6pMNHE9nuBebm78aZ1cWorS4N67Gd0BYZQHoZV7tSgu6Yc5W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="364032860"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="364032860"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 15:49:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="844261596"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="844261596"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Jul 2023 15:49:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHuGF-0002ME-2o;
	Fri, 07 Jul 2023 22:49:11 +0000
Date: Sat, 8 Jul 2023 06:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 381/386] kernel/sched/alt_core.c:2053:1: warning: the
 frame size of 2088 bytes is larger than 2048 bytes
Message-ID: <202307080601.FFv7VBB7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   ea6d5107f9aa76407998568ad4cbcf54879ee0c0
commit: 4facf7f6e34125d06a1fc94cbc716e2cb1e09f82 [381/386] sched/alt: [Sync] 223baf9d17f2 sched: Fix performance regression introduced by mm_cid
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230708/202307080601.FFv7VBB7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080601.FFv7VBB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080601.FFv7VBB7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:1007:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
    1007 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:1030:6: warning: no previous prototype for 'resched_cpu' [-Wmissing-prototypes]
    1030 | void resched_cpu(int cpu)
         |      ^~~~~~~~~~~
   kernel/sched/alt_core.c:1045:6: warning: no previous prototype for 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1045 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1047:6: warning: no previous prototype for 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1047 | void set_cpu_sd_state_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1233:6: warning: no previous prototype for 'hrtick_start' [-Wmissing-prototypes]
    1233 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:2480:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2480 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2523:6: warning: no previous prototype for 'call_function_single_prep_ipi' [-Wmissing-prototypes]
    2523 | bool call_function_single_prep_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7153:6: warning: no previous prototype for 'idle_task_exit' [-Wmissing-prototypes]
    7153 | void idle_task_exit(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7363:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
    7363 | int sched_cpu_activate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7402:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7402 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7466:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
    7466 | int sched_cpu_starting(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7486:5: warning: no previous prototype for 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7486 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7528:5: warning: no previous prototype for 'sched_cpu_dying' [-Wmissing-prototypes]
    7528 | int sched_cpu_dying(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7611:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    7611 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7671:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    7671 | void __init sched_init(void)
         |             ^~~~~~~~~~
   kernel/sched/alt_core.c:8027:20: warning: no previous prototype for 'sched_create_group' [-Wmissing-prototypes]
    8027 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8038:6: warning: no previous prototype for 'sched_online_group' [-Wmissing-prototypes]
    8038 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8049:6: warning: no previous prototype for 'sched_destroy_group' [-Wmissing-prototypes]
    8049 | void sched_destroy_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8055:6: warning: no previous prototype for 'sched_release_group' [-Wmissing-prototypes]
    8055 | void sched_release_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8123:5: warning: no previous prototype for 'sched_group_set_shares' [-Wmissing-prototypes]
    8123 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8193:27: warning: initialized field overwritten [-Woverride-init]
    8193 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8193:27: note: (near initialization for 'cpu_cgrp_subsys.legacy_cftypes')
   kernel/sched/alt_core.c: In function 'select_task_rq':
>> kernel/sched/alt_core.c:2053:1: warning: the frame size of 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    2053 | }
         | ^


vim +2053 kernel/sched/alt_core.c

81ccd7b280225f Alfred Chen 2022-12-21  2036  
5a8c0773fcc551 Alfred Chen 2021-05-24  2037  static inline int select_task_rq(struct task_struct *p)
cedcd3e67433b3 Alfred Chen 2019-08-19  2038  {
81ccd7b280225f Alfred Chen 2022-12-21  2039  	cpumask_t allow_mask, mask;
cedcd3e67433b3 Alfred Chen 2019-08-19  2040  
81ccd7b280225f Alfred Chen 2022-12-21  2041  	if (unlikely(!cpumask_and(&allow_mask, p->cpus_ptr, cpu_active_mask)))
cedcd3e67433b3 Alfred Chen 2019-08-19  2042  		return select_fallback_rq(task_cpu(p), p);
cedcd3e67433b3 Alfred Chen 2019-08-19  2043  
cedcd3e67433b3 Alfred Chen 2019-08-19  2044  	if (
cedcd3e67433b3 Alfred Chen 2019-08-19  2045  #ifdef CONFIG_SCHED_SMT
81ccd7b280225f Alfred Chen 2022-12-21  2046  	    cpumask_and(&mask, &allow_mask, &sched_sg_idle_mask) ||
cedcd3e67433b3 Alfred Chen 2019-08-19  2047  #endif
81ccd7b280225f Alfred Chen 2022-12-21  2048  	    cpumask_and(&mask, &allow_mask, sched_idle_mask) ||
81ccd7b280225f Alfred Chen 2022-12-21  2049  	    preempt_mask_check(p, &allow_mask, &mask))
81ccd7b280225f Alfred Chen 2022-12-21  2050  		return best_mask_cpu(task_cpu(p), &mask);
cedcd3e67433b3 Alfred Chen 2019-08-19  2051  
81ccd7b280225f Alfred Chen 2022-12-21  2052  	return best_mask_cpu(task_cpu(p), &allow_mask);
cedcd3e67433b3 Alfred Chen 2019-08-19 @2053  }
cedcd3e67433b3 Alfred Chen 2019-08-19  2054  

:::::: The code at line 2053 was first introduced by commit
:::::: cedcd3e67433b3472068caf48ea86414191e0a6b Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
