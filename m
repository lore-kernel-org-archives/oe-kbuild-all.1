Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74C55258
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 00:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJuHl932"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705106610; x=1736642610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IF8KVkRZJj2kUuVLroopIAx90FDXY5BfIqKwFcDCmI8=;
  b=EJuHl932LbfJdqsngsS+5NBfADUupDHoATzZMdGN34kyHGG5ieZcq316
   lEGHohvCs3Fc4WS6bXtPIkqDWsKM8M/2sWntCcX5W9u3V4vIBWVHnuAN3
   D3rT6W/JPu+bnUUi/4F15YC5JHD50r/YELXIWe90alCfh8hm8yCO4Jfap
   GUbXB9X7eA3e0esb6Egr9DKnYYp1T3Yr3Mh6dW6WKl4D6OHcgeEbGTQPU
   XD/Ow9ZK3+NwBvO1tMKK7SgWqLv3PI0LdoJ5Hrsuh5O1ZIE4jGg0VXsp/
   Rs8wbT9s0nUSHRMU0FGCl0BYKPDP139AlTfy42jB9IvT64xB4p9tj3Msd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="403091106"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="403091106"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 16:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="25171889"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jan 2024 16:43:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOS7Q-0009wG-0y;
	Sat, 13 Jan 2024 00:43:24 +0000
Date: Sat, 13 Jan 2024 08:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20703/21544]
 kernel/sched/core.c:5845:2: error: implicit declaration of function
 'tg_update_affinity_domains'; did you mean 'irq_create_affinity_masks'?
Message-ID: <202401130833.aCpqEHDG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 713cfd2684fa5ea08b144d92b9858b932c0f1705 [20703/21544] sched: Introduce smart grid scheduling strategy for cfs
config: x86_64-randconfig-004-20240112 (https://download.01.org/0day-ci/archive/20240113/202401130833.aCpqEHDG-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401130833.aCpqEHDG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401130833.aCpqEHDG-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'sched_cpu_activate':
>> kernel/sched/core.c:5845:2: error: implicit declaration of function 'tg_update_affinity_domains'; did you mean 'irq_create_affinity_masks'? [-Werror=implicit-function-declaration]
     tg_update_affinity_domains(cpu, 1);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
     irq_create_affinity_masks
   kernel/sched/core.c: In function 'sched_init_smp':
>> kernel/sched/core.c:5976:2: error: implicit declaration of function 'init_auto_affinity'; did you mean 'irq_set_affinity'? [-Werror=implicit-function-declaration]
     init_auto_affinity(&root_task_group);
     ^~~~~~~~~~~~~~~~~~
     irq_set_affinity
>> kernel/sched/core.c:5976:22: error: 'root_task_group' undeclared (first use in this function); did you mean 'task_group'?
     init_auto_affinity(&root_task_group);
                         ^~~~~~~~~~~~~~~
                         task_group
   kernel/sched/core.c:5976:22: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/core.c: In function 'sched_init':
   kernel/sched/core.c:6029:32: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
     unsigned long alloc_size = 0, ptr;
                                   ^~~
   cc1: some warnings being treated as errors


vim +5845 kernel/sched/core.c

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
