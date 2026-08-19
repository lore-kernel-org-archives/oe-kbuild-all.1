Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11EE20010A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146613; cv=none; b=c9lpu2kkU3JIIOUilWnLAeg6qL5yLXCdN0lTqZp4h+1Mh57lyBiDaLQIkkkDkMqYpP/aox92V2Nk8e8c8ecGY6JpA6XWoM5/Wr6y4c2psDpPu44tOZECT9bfFDAi8IqQWnwHtH1J302OunqE79/1M2WBPh567SBomBsYAJcWfnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146613; c=relaxed/simple;
	bh=WEgKcRkWr33ngank6bbrCIxW9pAlcjUNsgz8lNxAf2U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NfSXbkVXDUiRIpkb3SIrgpZQxvwYXV40f5tMwb15T8mP9aIu4CpF4Sk0RZhFo25SFu4cTiv9ktRsdc8Has3zPo0CqU8hUHyLzryP8JPHEyI/unSSe/aH+NqPDlp/xHbYei3rlIEN6B3pE0AQWJkpqh4UtxfQZa1F+qp0ZnJ+5EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCq3g3Ib; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCq3g3Ib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787146612; x=1818682612;
  h=date:from:to:cc:subject:message-id;
  bh=WEgKcRkWr33ngank6bbrCIxW9pAlcjUNsgz8lNxAf2U=;
  b=KCq3g3IbPMGEBdqlZjouiFTNyFWV+ZUsyvUFamcRXFxCFW8lfxPgKXTa
   IgLWEB/JBxfKLofde5gR5By6Mv4OL1nn9HCa4t+a3LiJW9407EXAZ7VVL
   Sr/u0a7Emz+0uQhfkwM1a1TKpSs0i+OD2ORZic5LZh/3umy3l48QoXppZ
   gx4pzfO3zcHGBTxoPO63iiKxeXG/NeklFvM6oY7XCNLNM13D+/ctDfQhi
   CbKjM7ytKZCozdVbiQx3K90xW0hhEgPrN1SLF4CzA7amuHuzDNuOby8oY
   Cl4wc2r3JfyWSmJvcfny8A6GDCpdj+ym80lcDpO44wpTPQQ0GrrNQ/aWy
   A==;
X-CSE-ConnectionGUID: t83T0yfdS2Obx6haCVbEwg==
X-CSE-MsgGUID: YxR6wpxLQk+JgQ0QTrJnpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98821306"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="98821306"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 06:36:51 -0700
X-CSE-ConnectionGUID: yNEfNi2SR8O8Y/UMd4Xscg==
X-CSE-MsgGUID: U5AfPpagS/mda93v/5zTcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="264233424"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Aug 2026 06:36:50 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwgTH-00000000fM2-2wTt;
	Wed, 19 Aug 2026 13:36:47 +0000
Date: Wed, 19 Aug 2026 21:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 64/80] kernel/sched/alt_core.c:4156:14:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202608192134.rFW6LQAd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   b735d8ec47d31db8e62d1925521a44d98c1cac2d
commit: 82b6f6a8359812dab8232a9d1691b4740aecf15a [64/80] sched/alt: [Sync] ddae0ca2a8fe sched: Move psi_account_irqtime() out of update_rq_clock_task() hotpath
config: parisc-randconfig-r121-20260819 (https://download.01.org/0day-ci/archive/20260819/202608192134.rFW6LQAd-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608192134.rFW6LQAd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608192134.rFW6LQAd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/alt_core.c:125:1: sparse: sparse: symbol '__pcpu_scope_sched_smt_idle_lock' was not declared. Should it be static?
   kernel/sched/alt_core.c:2625:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:2625:36: sparse:     expected struct task_struct const *p
   kernel/sched/alt_core.c:2625:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:6023:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:6023:43: sparse:     expected struct task_struct *push_task
   kernel/sched/alt_core.c:6023:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4062:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:4062:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:4062:15: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:4156:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4156:14: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4156:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4797:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4797:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4797:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5328:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5328:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5328:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5873:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:5873:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:5873:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:904:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:904:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:904:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:904:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:904:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:904:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:1131:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1810:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1810:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1810:38: sparse:    struct task_struct const *
   kernel/sched/alt_core.c: note: in included file (through kernel/sched/sched.h):
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1131:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1131:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1131:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1131:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1131:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1131:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1131:37: sparse:    struct task_struct [noderef] __rcu *

vim +4156 kernel/sched/alt_core.c

  4137	
  4138	/*
  4139	 * This function gets called by the timer code, with HZ frequency.
  4140	 * We call it with interrupts disabled.
  4141	 */
  4142	void sched_tick(void)
  4143	{
  4144		int cpu __maybe_unused = smp_processor_id();
  4145		struct rq *rq = cpu_rq(cpu);
  4146		struct task_struct *curr;
  4147		struct rq_flags rf;
  4148		u64 resched_latency;
  4149	
  4150		if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
  4151			arch_scale_freq_tick();
  4152	
  4153		sched_clock_tick();
  4154	
  4155		rq_lock(rq, &rf);
> 4156		curr = rq->curr;
  4157	
  4158		psi_account_irqtime(rq, curr, NULL);
  4159		update_rq_clock(rq);
  4160	
  4161		if (dynamic_preempt_lazy() && tif_test_bit(TIF_NEED_RESCHED_LAZY))
  4162			resched_curr(rq);
  4163	
  4164		scheduler_task_tick(rq);
  4165		if (sched_feat(LATENCY_WARN))
  4166			resched_latency = cpu_resched_latency(rq);
  4167		calc_global_load_tick(rq);
  4168	
  4169		rq_unlock(rq, &rf);
  4170	
  4171		if (sched_feat(LATENCY_WARN) && resched_latency)
  4172			resched_latency_warn(cpu, resched_latency);
  4173	
  4174		perf_event_task_tick();
  4175	
  4176		if (curr->flags & PF_WQ_WORKER)
  4177			wq_worker_tick(curr);
  4178	}
  4179	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
