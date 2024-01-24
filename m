Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259FB15D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 02:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706062013; cv=none; b=CupLo1bNF9a09JeADXHEcQ7sx3CEo+8WN431zTCfmGh739JGQyo35yr+gG+uA4GX0UsHsqFU9QmJV2Uvzd9OrXlm3GMPZFG1zwmGhwcDcjDe47ZJzyI9HspvIXWyyeOBRGElbN3o/GGUC0HTGalpIhvKdBPayLXoQ/DN0XxnhKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706062013; c=relaxed/simple;
	bh=Vp6sncswL2EJZzS/cC74iB5X3osTf1vfUjb1+p8X+cY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hZmv54m1ZSmZGeRcBJdIXF1IRzz8+V1D1VKtBosiED3VO9JA5Z0rMNPIxBj4GF08r+EgRlyRvDY2AxhapAuiRP3WpukLikzhxLfntldK5vRKH/Bvo8pvkR21Mp2SMm/MGY5tW+ssiXKKcRESlbgTxngdFYR6rf8TTR7LZnuUBWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7QRqrDq; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7QRqrDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706062011; x=1737598011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vp6sncswL2EJZzS/cC74iB5X3osTf1vfUjb1+p8X+cY=;
  b=J7QRqrDqAZfgJ2h46CJ4Z9gSpRj6nSDKEh26rzizjdcVF6mWCKtnd8Jq
   jAe88E9bY+OERnM74WVrOiJhm3kiE9kykkinufNvRHfZs8Ei1zqJOiRK4
   eYXIKwOhjpvI6J0IDU+5rI1Azq97XeSJK+xRB7RVAc1RwsXLKqxd8vXo0
   G0raBNnHFTR7SJGyE7ebpuKCgEAz/KAbrMxccnqJUHr6eJY2CtA1ugfWa
   2h7tn+q55Q3EdTJseeZorV1Ep/yrwSjZjEKtcufmcW7F4AdHA1AHSJc0t
   43TVdSGdnempnt/h7sW1TEXFNTnncTnefT9bzWtT25QIZzeNjurk2r98f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405467849"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="405467849"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 18:06:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1820354"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jan 2024 18:06:48 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSSf6-0007nD-1G;
	Wed, 24 Jan 2024 02:06:44 +0000
Date: Wed, 24 Jan 2024 10:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2490/2572] kernel/sched/core.c:9719:2: error:
 call to undeclared function 'tg_update_affinity_domains'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202401241028.WtP2GPxu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a662a03b9d1d5b93551f9c0f9c2875373b223115
commit: 6eb07f9925a906d81f328c808ba25f7800888dce [2490/2572] sched: Introduce smart grid scheduling strategy for cfs
config: arm64-randconfig-004-20240124 (https://download.01.org/0day-ci/archive/20240124/202401241028.WtP2GPxu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241028.WtP2GPxu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241028.WtP2GPxu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:9719:2: error: call to undeclared function 'tg_update_affinity_domains'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    9719 |         tg_update_affinity_domains(cpu, 1);
         |         ^
   kernel/sched/core.c:9719:2: note: did you mean 'irq_update_affinity_hint'?
   include/linux/interrupt.h:325:1: note: 'irq_update_affinity_hint' declared here
     325 | irq_update_affinity_hint(unsigned int irq, const struct cpumask *m)
         | ^
   kernel/sched/core.c:9809:2: error: call to undeclared function 'tg_update_affinity_domains'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    9809 |         tg_update_affinity_domains(cpu, 0);
         |         ^
>> kernel/sched/core.c:9931:2: error: call to undeclared function 'init_auto_affinity'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    9931 |         init_auto_affinity(&root_task_group);
         |         ^
   kernel/sched/core.c:9931:2: note: did you mean 'irq_set_affinity'?
   include/linux/interrupt.h:308:12: note: 'irq_set_affinity' declared here
     308 | extern int irq_set_affinity(unsigned int irq, const struct cpumask *cpumask);
         |            ^
   kernel/sched/core.c:9931:22: error: use of undeclared identifier 'root_task_group'; did you mean 'task_group'?
    9931 |         init_auto_affinity(&root_task_group);
         |                             ^~~~~~~~~~~~~~~
         |                             task_group
   kernel/sched/sched.h:2140:34: note: 'task_group' declared here
    2140 | static inline struct task_group *task_group(struct task_struct *p)
         |                                  ^
   4 errors generated.


vim +/tg_update_affinity_domains +9719 kernel/sched/core.c

  9699	
  9700	int sched_cpu_activate(unsigned int cpu)
  9701	{
  9702		struct rq *rq = cpu_rq(cpu);
  9703		struct rq_flags rf;
  9704	
  9705		/*
  9706		 * Clear the balance_push callback and prepare to schedule
  9707		 * regular tasks.
  9708		 */
  9709		balance_push_set(cpu, false);
  9710	
  9711	#ifdef CONFIG_SCHED_SMT
  9712		/*
  9713		 * When going up, increment the number of cores with SMT present.
  9714		 */
  9715		if (cpumask_weight(cpu_smt_mask(cpu)) == 2)
  9716			static_branch_inc_cpuslocked(&sched_smt_present);
  9717	#endif
  9718		set_cpu_active(cpu, true);
> 9719		tg_update_affinity_domains(cpu, 1);
  9720	
  9721		if (sched_smp_initialized) {
  9722			sched_update_numa(cpu, true);
  9723			sched_domains_numa_masks_set(cpu);
  9724			cpuset_cpu_active();
  9725		}
  9726	
  9727		/*
  9728		 * Put the rq online, if not already. This happens:
  9729		 *
  9730		 * 1) In the early boot process, because we build the real domains
  9731		 *    after all CPUs have been brought up.
  9732		 *
  9733		 * 2) At runtime, if cpuset_cpu_active() fails to rebuild the
  9734		 *    domains.
  9735		 */
  9736		rq_lock_irqsave(rq, &rf);
  9737		if (rq->rd) {
  9738			BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
  9739			set_rq_online(rq);
  9740		}
  9741		rq_unlock_irqrestore(rq, &rf);
  9742	
  9743		return 0;
  9744	}
  9745	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
