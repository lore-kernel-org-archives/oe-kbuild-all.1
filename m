Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88641F608
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706350157; cv=none; b=n+gvLOwk17L5CEHvi0eLx1Xmc60E0k2U0pOpE5DNuqAA6Cjxhf3bz1eZfR46btogYNfnY+5jB+BP6Gpqr3qSwrM2FpmMau+v9FXusY8NNlgEwFVZo+xnEz77sec73Mj04c0dmY1WOjTKX4RE6gE3eVlsriR10BpDDVnGHllcZX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706350157; c=relaxed/simple;
	bh=nBBK2DKG1dL3Llo2PDhnULd3PfO1x2/ZMTP4o8FYxsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lVRaxLWGiYZo/onpFqY7zJUtdRocXN+Ra/39AAWMyR2Be7gLPZpZH6jCpyfABdcXxDT7WcwFXKCrD3GbYxovBzn2XtckcaSbwZ8QrgazTGQ4hP7joZLcrk7wZ1C54ULpOsCQ3BlvoixsWotRkYyqBM6rhkBspKsPWAfYiy8ZbdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6S/37rH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6S/37rH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706350156; x=1737886156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nBBK2DKG1dL3Llo2PDhnULd3PfO1x2/ZMTP4o8FYxsU=;
  b=T6S/37rH5F8II8LTf9Xhh0WMLQAyWTwV9YgUzmlCsnz+ttpY56Jev+tl
   LAdMRw4trUL7znTPeXJ/cHi1zo7oNZqvCJLQP5DNppUj4k6GdW1F6z92Z
   s4vOGvxJHVI5+ZFaqyRj7YkFlTOiR2pgtPFp8nd7F7NLoft9nachNv5vQ
   ggenDloMIzM8RDTgMZ0YMRTJkn8uHAg4dpcBH9vg4cPPgd5iCBCiQQyP3
   yu9IzlpyV0uzOFGwpn67PxHJPxum4gTPuHfDC0zo11VlrTnE7X1cW3Ah4
   GnaE3NHZvuUOJwbSFXw022NG0fB2KwvlfYJAiS2Nerotqs7yAjku7I3jD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2539346"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2539346"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 02:09:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="787358132"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="787358132"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Jan 2024 02:09:13 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTfcd-00025y-1L;
	Sat, 27 Jan 2024 10:09:11 +0000
Date: Sat, 27 Jan 2024 18:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20703/21579]
 kernel/sched/core.c:5845:2: error: implicit declaration of function
 'tg_update_affinity_domains'
Message-ID: <202401271837.ND9zSaBY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   acf72db532a7791fde53af3dc7b4d0a6adcf6eff
commit: 713cfd2684fa5ea08b144d92b9858b932c0f1705 [20703/21579] sched: Introduce smart grid scheduling strategy for cfs
config: x86_64-randconfig-001-20240125 (https://download.01.org/0day-ci/archive/20240127/202401271837.ND9zSaBY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401271837.ND9zSaBY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401271837.ND9zSaBY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:8:
   In file included from kernel/sched/sched.h:39:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/core.c:8:
   kernel/sched/sched.h:1249:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1249 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:1587:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
    1587 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^
   kernel/sched/core.c:1587:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1587 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         | ^
         | static 
   kernel/sched/core.c:2741:10: warning: cast from 'void (*)(struct callback_head *)' to 'void (*)(struct rq *)' converts to incompatible function type [-Wcast-function-type-strict]
    2741 |                 func = (void (*)(struct rq *))head->func;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:3771:35: warning: no previous prototype for function 'preempt_schedule_irq' [-Wmissing-prototypes]
    3771 | asmlinkage __visible void __sched preempt_schedule_irq(void)
         |                                   ^
   kernel/sched/core.c:3771:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3771 | asmlinkage __visible void __sched preempt_schedule_irq(void)
         |                      ^
         |                      static 
>> kernel/sched/core.c:5845:2: error: implicit declaration of function 'tg_update_affinity_domains' [-Werror,-Wimplicit-function-declaration]
    5845 |         tg_update_affinity_domains(cpu, 1);
         |         ^
   kernel/sched/core.c:5904:2: error: implicit declaration of function 'tg_update_affinity_domains' [-Werror,-Wimplicit-function-declaration]
    5904 |         tg_update_affinity_domains(cpu, 0);
         |         ^
>> kernel/sched/core.c:5976:2: error: implicit declaration of function 'init_auto_affinity' [-Werror,-Wimplicit-function-declaration]
    5976 |         init_auto_affinity(&root_task_group);
         |         ^
   kernel/sched/core.c:5976:2: note: did you mean 'irq_set_affinity'?
   include/linux/interrupt.h:292:1: note: 'irq_set_affinity' declared here
     292 | irq_set_affinity(unsigned int irq, const struct cpumask *cpumask)
         | ^
>> kernel/sched/core.c:5976:22: error: use of undeclared identifier 'root_task_group'; did you mean 'task_group'?
    5976 |         init_auto_affinity(&root_task_group);
         |                             ^~~~~~~~~~~~~~~
         |                             task_group
   kernel/sched/sched.h:1444:34: note: 'task_group' declared here
    1444 | static inline struct task_group *task_group(struct task_struct *p)
         |                                  ^
   kernel/sched/core.c:6029:32: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
    6029 |         unsigned long alloc_size = 0, ptr;
         |                                       ^
   6 warnings and 4 errors generated.


vim +/tg_update_affinity_domains +5845 kernel/sched/core.c

  5831	
  5832	int sched_cpu_activate(unsigned int cpu)
  5833	{
  5834		struct rq *rq = cpu_rq(cpu);
  5835		struct rq_flags rf;
  5836	
  5837	#ifdef CONFIG_SCHED_SMT
  5838		/*
  5839		 * When going up, increment the number of cores with SMT present.
  5840		 */
  5841		if (cpumask_weight(cpu_smt_mask(cpu)) == 2)
  5842			static_branch_inc_cpuslocked(&sched_smt_present);
  5843	#endif
  5844		set_cpu_active(cpu, true);
> 5845		tg_update_affinity_domains(cpu, 1);
  5846	
  5847		if (sched_smp_initialized) {
  5848			sched_domains_numa_masks_set(cpu);
  5849			cpuset_cpu_active();
  5850		}
  5851	
  5852		/*
  5853		 * Put the rq online, if not already. This happens:
  5854		 *
  5855		 * 1) In the early boot process, because we build the real domains
  5856		 *    after all CPUs have been brought up.
  5857		 *
  5858		 * 2) At runtime, if cpuset_cpu_active() fails to rebuild the
  5859		 *    domains.
  5860		 */
  5861		rq_lock_irqsave(rq, &rf);
  5862		if (rq->rd) {
  5863			BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
  5864			set_rq_online(rq);
  5865		}
  5866		rq_unlock_irqrestore(rq, &rf);
  5867	
  5868		update_max_interval();
  5869	
  5870		return 0;
  5871	}
  5872	
  5873	int sched_cpu_deactivate(unsigned int cpu)
  5874	{
  5875		int ret;
  5876	
  5877		set_cpu_active(cpu, false);
  5878		/*
  5879		 * We've cleared cpu_active_mask, wait for all preempt-disabled and RCU
  5880		 * users of this state to go away such that all new such users will
  5881		 * observe it.
  5882		 *
  5883		 * Do sync before park smpboot threads to take care the rcu boost case.
  5884		 */
  5885		synchronize_rcu_mult(call_rcu, call_rcu_sched);
  5886	
  5887	#ifdef CONFIG_SCHED_SMT
  5888		/*
  5889		 * When going down, decrement the number of cores with SMT present.
  5890		 */
  5891		if (cpumask_weight(cpu_smt_mask(cpu)) == 2)
  5892			static_branch_dec_cpuslocked(&sched_smt_present);
  5893	#endif
  5894	
  5895		if (!sched_smp_initialized)
  5896			return 0;
  5897	
  5898		ret = cpuset_cpu_inactive(cpu);
  5899		if (ret) {
  5900			set_cpu_active(cpu, true);
  5901			return ret;
  5902		}
  5903		sched_domains_numa_masks_clear(cpu);
  5904		tg_update_affinity_domains(cpu, 0);
  5905		return 0;
  5906	}
  5907	
  5908	static void sched_rq_cpu_starting(unsigned int cpu)
  5909	{
  5910		struct rq *rq = cpu_rq(cpu);
  5911	
  5912		rq->calc_load_update = calc_load_update;
  5913		update_max_interval();
  5914	}
  5915	
  5916	int sched_cpu_starting(unsigned int cpu)
  5917	{
  5918		sched_rq_cpu_starting(cpu);
  5919		sched_tick_start(cpu);
  5920		return 0;
  5921	}
  5922	
  5923	#ifdef CONFIG_HOTPLUG_CPU
  5924	int sched_cpu_dying(unsigned int cpu)
  5925	{
  5926		struct rq *rq = cpu_rq(cpu);
  5927		struct rq_flags rf;
  5928	
  5929		/* Handle pending wakeups and then migrate everything off */
  5930		sched_ttwu_pending();
  5931		sched_tick_stop(cpu);
  5932	
  5933		rq_lock_irqsave(rq, &rf);
  5934		if (rq->rd) {
  5935			BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
  5936			set_rq_offline(rq);
  5937		}
  5938		migrate_tasks(rq, &rf);
  5939		BUG_ON(rq->nr_running != 1);
  5940		rq_unlock_irqrestore(rq, &rf);
  5941	
  5942		calc_load_migrate(rq);
  5943		update_max_interval();
  5944		nohz_balance_exit_idle(rq);
  5945		hrtick_clear(rq);
  5946		return 0;
  5947	}
  5948	#endif
  5949	
  5950	void __init sched_init_smp(void)
  5951	{
  5952		sched_init_numa();
  5953	
  5954		/*
  5955		 * There's no userspace yet to cause hotplug operations; hence all the
  5956		 * CPU masks are stable and all blatant races in the below code cannot
  5957		 * happen. The hotplug lock is nevertheless taken to satisfy lockdep,
  5958		 * but there won't be any contention on it.
  5959		 */
  5960		cpus_read_lock();
  5961		mutex_lock(&sched_domains_mutex);
  5962		sched_init_domains(cpu_active_mask);
  5963		mutex_unlock(&sched_domains_mutex);
  5964		cpus_read_unlock();
  5965	
  5966		/* Move init over to a non-isolated CPU */
  5967		if (set_cpus_allowed_ptr(current, housekeeping_cpumask(HK_FLAG_DOMAIN)) < 0)
  5968			BUG();
  5969		sched_init_granularity();
  5970	
  5971		init_sched_rt_class();
  5972		init_sched_dl_class();
  5973	
  5974		sched_smp_initialized = true;
  5975	
> 5976		init_auto_affinity(&root_task_group);
  5977	}
  5978	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
