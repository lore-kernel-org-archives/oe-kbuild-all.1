Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157FB3C1E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693665924; x=1725201924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XBKAsbPCh1+3wXHR5G9DHRPOkrIqGemXMWv1hlRx/2k=;
  b=bIPLyqFg9rMSyXQVY7DzzIMITjaIRYQnpsHak0ukiL5ADIExxEFiexjT
   RTmE6oFnB1XtehqFix8EtOogdhOaRvl7I3M5FylA3z7Jb7qWRe8Qu2vfN
   zB5iZEkepI973VzFMvMwR0gHkts7na/6lP6MYT4G+PchRwC80AJU47zwX
   /qYE9Auy75hKEVBd13Cah9fgReQ8QLpGsND24DVDAvrEfZ1gNmzwS6BL1
   NoiHZ54CyedK0WwdwiOhO5HAB52074hXNfmtrcCaURyrqjXH5rJ3zlBTW
   nOV7VSC9mB1yAS82qtsLpRkHocTlHX8kIqsPgRSpEsGDBFQV7AIgbu1QF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="356688757"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="356688757"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 07:45:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="740235152"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="740235152"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Sep 2023 07:45:23 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcRsG-0002PH-39;
	Sat, 02 Sep 2023 14:45:20 +0000
Date: Sat, 2 Sep 2023 22:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Lu <aaron.lu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [aaronlu:sis_profile 1/1] kernel/sched/fair.c:7128:1: warning:
 'noipa' attribute directive ignored
Message-ID: <202309022216.qhBIFUYB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/aaronlu/linux.git sis_profile
head:   fc546923e1057cfeec0069d46f12fdabcb0d31c9
commit: fc546923e1057cfeec0069d46f12fdabcb0d31c9 [1/1] profile select_idle_sibling()
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230902/202309022216.qhBIFUYB-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309022216.qhBIFUYB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309022216.qhBIFUYB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:7128:1: warning: 'noipa' attribute directive ignored [-Wattributes]
    {
    ^


vim +/noipa +7128 kernel/sched/fair.c

fc546923e1057c kernel/sched/fair.c Aaron Lu          2023-09-01  7123  
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra    2016-05-09  7124  /*
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra    2016-05-09  7125   * Try and locate an idle core/thread in the LLC cache domain.
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra    2009-11-12  7126   */
fc546923e1057c kernel/sched/fair.c Aaron Lu          2023-09-01  7127  static int __attribute__ ((noipa)) select_idle_sibling(struct task_struct *p, int prev, int target)
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra    2009-11-12 @7128  {
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  7129  	bool has_idle_core = false;
99bd5e2f245d8c kernel/sched_fair.c Suresh Siddha     2010-03-31  7130  	struct sched_domain *sd;
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  7131  	unsigned long task_util, util_min, util_max;
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  7132  	int i, recent_used_cpu;
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra    2009-11-12  7133  
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen  2020-02-06  7134  	/*
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7135  	 * On asymmetric system, update task utilization because we will check
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7136  	 * that the task fits with cpu's capacity.
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen  2020-02-06  7137  	 */
740cf8a760b73e kernel/sched/fair.c Dietmar Eggemann  2022-07-29  7138  	if (sched_asym_cpucap_active()) {
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7139  		sync_entity_load_avg(&p->se);
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  7140  		task_util = task_util_est(p);
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  7141  		util_min = uclamp_eff_value(p, UCLAMP_MIN);
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  7142  		util_max = uclamp_eff_value(p, UCLAMP_MAX);
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen  2020-02-06  7143  	}
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen  2020-02-06  7144  
9099a14708ce1d kernel/sched/fair.c Peter Zijlstra    2020-11-17  7145  	/*
ec4fc801a02d96 kernel/sched/fair.c Dietmar Eggemann  2022-06-23  7146  	 * per-cpu select_rq_mask usage
9099a14708ce1d kernel/sched/fair.c Peter Zijlstra    2020-11-17  7147  	 */
9099a14708ce1d kernel/sched/fair.c Peter Zijlstra    2020-11-17  7148  	lockdep_assert_irqs_disabled();
9099a14708ce1d kernel/sched/fair.c Peter Zijlstra    2020-11-17  7149  
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7150  	if ((available_idle_cpu(target) || sched_idle_cpu(target)) &&
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  7151  	    asym_fits_cpu(task_util, util_min, util_max, target))
fc546923e1057c kernel/sched/fair.c Aaron Lu          2023-09-01  7152  		return target | CPU_TARGET;
99bd5e2f245d8c kernel/sched_fair.c Suresh Siddha     2010-03-31  7153  
99bd5e2f245d8c kernel/sched_fair.c Suresh Siddha     2010-03-31  7154  	/*
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar       2018-03-03  7155  	 * If the previous CPU is cache affine and idle, don't be stupid:
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra    2009-11-12  7156  	 */
3c29e651e16dd3 kernel/sched/fair.c Viresh Kumar      2019-06-26  7157  	if (prev != target && cpus_share_cache(prev, target) &&
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7158  	    (available_idle_cpu(prev) || sched_idle_cpu(prev)) &&
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  7159  	    asym_fits_cpu(task_util, util_min, util_max, prev))
fc546923e1057c kernel/sched/fair.c Aaron Lu          2023-09-01  7160  		return prev | CPU_PREV;
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra    2009-11-12  7161  
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  7162  	/*
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  7163  	 * Allow a per-cpu kthread to stack with the wakee if the
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  7164  	 * kworker thread and the tasks previous CPUs are the same.
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  7165  	 * The assumption is that the wakee queued work for the
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  7166  	 * per-cpu kthread that is now complete and the wakeup is
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  7167  	 * essentially a sync wakeup. An obvious example of this
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  7168  	 * pattern is IO completions.
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  7169  	 */
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  7170  	if (is_per_cpu_kthread(current) &&
8b4e74ccb58279 kernel/sched/fair.c Vincent Donnefort 2021-12-01  7171  	    in_task() &&
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  7172  	    prev == smp_processor_id() &&
014ba44e8184e1 kernel/sched/fair.c Vincent Donnefort 2021-11-29  7173  	    this_rq()->nr_running <= 1 &&
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  7174  	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  7175  		return prev;
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  7176  	}
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  7177  
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar       2018-03-03  7178  	/* Check a recently used CPU as a potential idle candidate: */
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  7179  	recent_used_cpu = p->recent_used_cpu;
89aafd67f28c9e kernel/sched/fair.c Mel Gorman        2021-08-04  7180  	p->recent_used_cpu = prev;
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  7181  	if (recent_used_cpu != prev &&
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  7182  	    recent_used_cpu != target &&
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  7183  	    cpus_share_cache(recent_used_cpu, target) &&
3c29e651e16dd3 kernel/sched/fair.c Viresh Kumar      2019-06-26  7184  	    (available_idle_cpu(recent_used_cpu) || sched_idle_cpu(recent_used_cpu)) &&
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7185  	    cpumask_test_cpu(p->recent_used_cpu, p->cpus_ptr) &&
fc546923e1057c kernel/sched/fair.c Aaron Lu          2023-09-01  7186  	    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu))
fc546923e1057c kernel/sched/fair.c Aaron Lu          2023-09-01  7187  		return recent_used_cpu | CPU_RECENT;
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  7188  
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7189  	/*
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7190  	 * For asymmetric CPU capacity systems, our domain of interest is
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7191  	 * sd_asym_cpucapacity rather than sd_llc.
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7192  	 */
740cf8a760b73e kernel/sched/fair.c Dietmar Eggemann  2022-07-29  7193  	if (sched_asym_cpucap_active()) {
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7194  		sd = rcu_dereference(per_cpu(sd_asym_cpucapacity, target));
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7195  		/*
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7196  		 * On an asymmetric CPU capacity system where an exclusive
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7197  		 * cpuset defines a symmetric island (i.e. one unique
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7198  		 * capacity_orig value through the cpuset), the key will be set
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7199  		 * but the CPUs within that cpuset will not have a domain with
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7200  		 * SD_ASYM_CPUCAPACITY. These should follow the usual symmetric
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7201  		 * capacity path.
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7202  		 */
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7203  		if (sd) {
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7204  			i = select_idle_capacity(p, sd, target);
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7205  			return ((unsigned)i < nr_cpumask_bits) ? i : target;
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7206  		}
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7207  	}
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  7208  
518cd62341786a kernel/sched/fair.c Peter Zijlstra    2011-12-07  7209  	sd = rcu_dereference(per_cpu(sd_llc, target));
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra    2016-05-09  7210  	if (!sd)
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra    2016-05-09  7211  		return target;
772bd008cd9a1d kernel/sched/fair.c Morten Rasmussen  2016-06-22  7212  
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  7213  	if (sched_smt_active()) {
398ba2b0cc0a43 kernel/sched/fair.c Abel Wu           2022-09-07  7214  		has_idle_core = test_idle_cores(target);
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  7215  
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  7216  		if (!has_idle_core && cpus_share_cache(prev, target)) {
3e6efe87cd5cca kernel/sched/fair.c Abel Wu           2022-09-07  7217  			i = select_idle_smt(p, prev);
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  7218  			if ((unsigned int)i < nr_cpumask_bits)
fc546923e1057c kernel/sched/fair.c Aaron Lu          2023-09-01  7219  				return i | CPU_IDLE_SMT;
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  7220  		}
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  7221  	}
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  7222  
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  7223  	i = select_idle_cpu(p, sd, has_idle_core, target);
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra    2016-05-09  7224  	if ((unsigned)i < nr_cpumask_bits)
fc546923e1057c kernel/sched/fair.c Aaron Lu          2023-09-01  7225  		return i | CPU_IDLE_CPU;
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra    2016-05-09  7226  
fc546923e1057c kernel/sched/fair.c Aaron Lu          2023-09-01  7227  	return target | CPU_FALLBACK;
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra    2009-11-12  7228  }
231678b768da07 kernel/sched/fair.c Dietmar Eggemann  2015-08-14  7229  

:::::: The code at line 7128 was first introduced by commit
:::::: a50bde5130f65733142b32975616427d0ea50856 sched: Cleanup select_task_rq_fair()

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
