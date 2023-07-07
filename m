Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCD763D4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 07:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688715117; x=1720251117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K559e7WRt4Ehgdk74a8oDRum0Ws+LjEjEkmPJ/t8suM=;
  b=Z/cAUj57MowQ59Q4UYG1Xw105Dnd6GwnwSsckN/auCIrcvOWZiyie3or
   fo0Apkit6nzmzKSzn3QAVrhD29WmELH6qM/jlNv//BIa3+Eqf4jdy42Z+
   kUBGG30twRQrZjY59X9/ei+2iEgiRhaB+WedT4YTWb+ZVMCtdrEnTag/X
   VfYCYFH1CjXQnhS1pTrnIiCm+duOmCb22ttsAAQObzBZ84UmATkPbdlTG
   jbkLWYjYgwDcc710HnUxM+Ha0eZibVF58z6mMRvbwqv+zoYr5RCdByHbe
   49dQz3fBWj71vge4SdICCh4jsQ8Gbq1YHrOrR6h5FGMM+zduxUcbZj3bA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="429891092"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="429891092"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 00:31:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="697129128"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="697129128"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jul 2023 00:31:54 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHfwX-0001ri-1g;
	Fri, 07 Jul 2023 07:31:53 +0000
Date: Fri, 7 Jul 2023 15:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 381/386] kernel/sched/alt_core.c:4128:32: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202307071551.plsRxOGn-lkp@intel.com>
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
config: i386-randconfig-i061-20230704 (https://download.01.org/0day-ci/archive/20230707/202307071551.plsRxOGn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071551.plsRxOGn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071551.plsRxOGn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/alt_core.c:1009:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:1009:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:1009:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4025:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:4025:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:4025:15: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:4128:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4128:32: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4128:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4747:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4747:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4747:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5283:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5283:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5283:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5433:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5433:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5433:22: sparse:    struct task_struct *
   kernel/sched/alt_core.c:7048:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:7048:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:7048:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:536:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/alt_core.c:555:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *

vim +4128 kernel/sched/alt_core.c

  4104	
  4105	/*
  4106	 * This function gets called by the timer code, with HZ frequency.
  4107	 * We call it with interrupts disabled.
  4108	 */
  4109	void scheduler_tick(void)
  4110	{
  4111		int cpu __maybe_unused = smp_processor_id();
  4112		struct rq *rq = cpu_rq(cpu);
  4113		u64 resched_latency;
  4114	
  4115		if (housekeeping_cpu(cpu, HK_TYPE_TICK))
  4116			arch_scale_freq_tick();
  4117	
  4118		sched_clock_tick();
  4119	
  4120		raw_spin_lock(&rq->lock);
  4121		update_rq_clock(rq);
  4122	
  4123		scheduler_task_tick(rq);
  4124		if (sched_feat(LATENCY_WARN))
  4125			resched_latency = cpu_resched_latency(rq);
  4126		calc_global_load_tick(rq);
  4127	
> 4128		task_tick_mm_cid(rq, rq->curr);
  4129	
  4130		rq->last_tick = rq->clock;
  4131		raw_spin_unlock(&rq->lock);
  4132	
  4133		if (sched_feat(LATENCY_WARN) && resched_latency)
  4134			resched_latency_warn(cpu, resched_latency);
  4135	
  4136		perf_event_task_tick();
  4137	}
  4138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
