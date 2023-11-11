Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787A85223
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3kEDaBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699695336; x=1731231336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0/mgnOGLKkmumNCefxiyIJYqA+lAg/99F34lTxCRyWc=;
  b=h3kEDaBra28xS2pEqR7VUYM4Ekz71pbv40TgWLS0Ug7i6y4ufqsMAG2B
   CxOU7UEekyf39W8pEZqJreOTWftdMDgLr5nu/MFsdIybZBlDa/r7ZqUfn
   Vy8R3t2+TnT1ZJqhjFXv8Zq+nUMN16P/A+loZZRhJ07YSo+0QHAM5RxF7
   dUZvlilxV9kG5MZFNe5RSWAcdRZ2iSkQFNe1t/vj5C2moGH8FrqkR81ys
   mkeD7yK5pOzzX05ksAF38m7S3xoCZoaKYOaizIUcRoct0Q4xuuXvFHvRF
   Rox+M/iWX3T08vY1bkoFb+uM6QMEzeVGjFQBOcAQSC/USs4zSp+OIcS4H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="3324587"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="3324587"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 01:35:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="740333429"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="740333429"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Nov 2023 01:35:34 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1kOp-000ALO-3A;
	Sat, 11 Nov 2023 09:35:31 +0000
Date: Sat, 11 Nov 2023 17:34:44 +0800
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 11/20] sched: Split scheduler execution context
Message-ID: <202311111740.AZgq2fGH-lkp@intel.com>
References: <20231106193524.866104-12-jstultz@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106193524.866104-12-jstultz@google.com>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on v6.6]
[cannot apply to tip/sched/core tip/master linus/master tip/auto-latest next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Stultz/sched-Unify-runtime-accounting-across-classes/20231107-033946
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20231106193524.866104-12-jstultz%40google.com
patch subject: [PATCH v6 11/20] sched: Split scheduler execution context
config: x86_64-randconfig-121-20231111 (https://download.01.org/0day-ci/archive/20231111/202311111740.AZgq2fGH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111740.AZgq2fGH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111740.AZgq2fGH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:756:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:756:31: sparse:     expected struct task_struct *task
   kernel/sched/core.c:756:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:757:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:757:25: sparse:     expected struct task_struct *task
   kernel/sched/core.c:757:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1074:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1074:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1074:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2254:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2254:36: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:2254:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2265:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2265:64: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2265:64: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:5687:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5687:14: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5687:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6628:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6628:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6628:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7193:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7193:17: sparse:    struct task_struct *
   kernel/sched/core.c:7193:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7409:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7409:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7409:22: sparse:    struct task_struct *
   kernel/sched/core.c:11608:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11608:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11608:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:582:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:607:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:631:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:669:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:710:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2155:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2155:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2155:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2166:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2344:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2344:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2344:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2344:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2344:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2344:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2166:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2344:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2344:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2344:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2166:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2344:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2344:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2344:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2166:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2344:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2344:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2344:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2155:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2155:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2166:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2166:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2344:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2344:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2344:9: sparse:    struct task_struct *

vim +5687 kernel/sched/core.c

  5666	
  5667	/*
  5668	 * This function gets called by the timer code, with HZ frequency.
  5669	 * We call it with interrupts disabled.
  5670	 */
  5671	void scheduler_tick(void)
  5672	{
  5673		int cpu = smp_processor_id();
  5674		struct rq *rq = cpu_rq(cpu);
  5675		/* accounting goes to the selected task */
  5676		struct task_struct *curr;
  5677		struct rq_flags rf;
  5678		unsigned long thermal_pressure;
  5679		u64 resched_latency;
  5680	
  5681		if (housekeeping_cpu(cpu, HK_TYPE_TICK))
  5682			arch_scale_freq_tick();
  5683	
  5684		sched_clock_tick();
  5685	
  5686		rq_lock(rq, &rf);
> 5687		curr = rq_selected(rq);
  5688	
  5689		update_rq_clock(rq);
  5690		thermal_pressure = arch_scale_thermal_pressure(cpu_of(rq));
  5691		update_thermal_load_avg(rq_clock_thermal(rq), rq, thermal_pressure);
  5692		curr->sched_class->task_tick(rq, curr, 0);
  5693		if (sched_feat(LATENCY_WARN))
  5694			resched_latency = cpu_resched_latency(rq);
  5695		calc_global_load_tick(rq);
  5696		sched_core_tick(rq);
  5697		task_tick_mm_cid(rq, curr);
  5698	
  5699		rq_unlock(rq, &rf);
  5700	
  5701		if (sched_feat(LATENCY_WARN) && resched_latency)
  5702			resched_latency_warn(cpu, resched_latency);
  5703	
  5704		perf_event_task_tick();
  5705	
  5706		if (curr->flags & PF_WQ_WORKER)
  5707			wq_worker_tick(curr);
  5708	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
