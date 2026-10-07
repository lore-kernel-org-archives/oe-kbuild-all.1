Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7873390C8A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 20:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791403467; cv=none; b=q4O9emODKI0jlOoGsXotsILz1YK4JaaKO49M8+rJjo00N7iqfYNKVZYlx6K78srRrz3nZ0EFE6YQKSRs89Lwpuvkeq3O4E0wMgywTcjAtW9zXqHpNTOBrRfeZxxv22kTmqFTd2gO/6odHXdon9f8MmOm/zOWcBkprGgxeOK3kNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791403467; c=relaxed/simple;
	bh=3W94plUoGeBouJDsnL4492ES1YgmUer4hMPejU41HCU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e5bmrzts9P1CHshkGQRMhzfJnErUGMb6enHfUDPraRr3cR/ByhoiSjUXbPqqLKURdEUtioxIbq/J/i+AtkzEVYENHsfTILX6loDUN9Smuf4MRlzzYlhHm1yosXdqc0k9+Vnm4uVUQvlSbxzIA3NiaGqoaVq7dTDIVFaS3WDMIcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VCeS/tw5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCeS/tw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791403466; x=1822939466;
  h=date:from:to:cc:subject:message-id;
  bh=3W94plUoGeBouJDsnL4492ES1YgmUer4hMPejU41HCU=;
  b=VCeS/tw5VLfXMlDEw6qbgTO3gZKexlXVz1FoLcVsQ4Xs/a3hAPHmW6Za
   jvzddHiVVUFgZi5We1E/bqjzzkpDt4Aa+q89tahQ8RIR4VDHu5YACgpOB
   4eLasNqkdGdA0NuROSpA8rI3yUKdHOxKTFJn5guleXo12Ka6IMfemvmKx
   ukxlIvAsZ9K2VITFZLTqPG1Tl5MirpB0u8936izd4jQZbLXQRblF7YMaX
   xwz/uqBLwIoQLobgC7ZECaUuj/I9kSaw1K74WWxXIvT2KG9w4RVm6h3IR
   RpZMkv9t+JRtKO2e6HrpyoXVS83yjMwdPJaDOhEscdXcXfT90GNluh64m
   A==;
X-CSE-ConnectionGUID: AvvEc96zRbST1Vn9AEsKAQ==
X-CSE-MsgGUID: yCCU92UlRRGGbwPeK8IJ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="76827"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="76827"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:04:25 -0700
X-CSE-ConnectionGUID: EHqCI4/8SyemLssRn/5rig==
X-CSE-MsgGUID: mMZKZqVMTe6dn5WPfKf8CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="1632757"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 07 Oct 2026 13:04:24 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEXsD-000000003wf-2yXT;
	Wed, 07 Oct 2026 20:04:21 +0000
Date: Wed, 07 Oct 2026 22:04:09 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 64/124] kernel/sched/alt_core.c:4156:14:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202610072139.w5zNlDrh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   dca70816eacb7e122d8192bc4f042c74c312eb5d
commit: 82b6f6a8359812dab8232a9d1691b4740aecf15a [64/124] sched/alt: [Sync] ddae0ca2a8fe sched: Move psi_account_irqtime() out of update_rq_clock_task() hotpath
config: powerpc-randconfig-r2303-20261007 (https://download.01.org/0day-ci/archive/20261007/202610072139.w5zNlDrh-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072139.w5zNlDrh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072139.w5zNlDrh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/alt_core.c:452:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:452:33: sparse:     expected struct task_struct *task
   kernel/sched/alt_core.c:452:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:2625:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:2625:36: sparse:     expected struct task_struct const *p
   kernel/sched/alt_core.c:2625:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4062:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:4062:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:4062:15: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:4156:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4156:14: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4156:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4234:46: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4234:46: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4234:46: sparse:     got struct task_struct [noderef] __rcu *curr
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
