Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADC6131E4A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707229332; cv=none; b=HZr3Fer3+lvT69pPMs2qXmLHn4SEY85DEaMfVmxHc+GVOoluIggaudIS2zJ2TKjuyTpv83yGGNGWXrmnEs6q7kN6UDSpCNlKxUpZ2tY8flN5XrVDIiGAqyJkV8ilxFUwOWJE92RKSWdwYyQPs5moKrvPMdLrqH12h9mcNVTf0ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707229332; c=relaxed/simple;
	bh=KVI+UHeTSwezdfCDBwfj/v7+Kn+/Krgz1XiTm3N+KRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MvGrntq9apPa6B51p0eEp5KH36wT3SZG2dAS4POvnvGNz7BK1fwdz1T0EoE21DqcKlS/BW3Htaba368Nn8JwTk0Nlplk6E+UDKclkm3W7svGRtg5jr44fX4xE6ynur33yBILGws1TfYkZH2xh+8/8a90P2VkZKPAV7tr48tozb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQ2qP1eW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQ2qP1eW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707229330; x=1738765330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KVI+UHeTSwezdfCDBwfj/v7+Kn+/Krgz1XiTm3N+KRU=;
  b=KQ2qP1eWUcNXmaP6p+Ik0rOzKFWPoApvcR0GUl5gmFbzOunePlM0SmzD
   0i7QTtPkRZ84IklNDR8jMqwk6M2rUVQ3YEoZpoMuHy9p+sbIoRlEj8J6m
   gSQXS3+ZeCKkAzj+FVLr9/+8LCtO8zCHyJercIlSDlCsvTc7/2y/qKMyv
   E5OymedCDdu2FbtFXu6oUSYuIOOfE/mu36zMxsalzC1x7WF/S7heX8QN8
   3C7LB2fG6WDNwZJ3V0oFito3z3C5wX9J1dCW7edDrUjUnAJeyInFbvBp2
   Jg2NUau4Pwg59Kk87pxSG2/SZeKvseMbNcRnw6CHfddo5FcDrNcZr7h01
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="654326"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="654326"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:22:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="5794487"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Feb 2024 06:22:08 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXMKr-0001TO-0I;
	Tue, 06 Feb 2024 14:22:05 +0000
Date: Tue, 6 Feb 2024 22:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19671/21616]
 kernel/sched/debug.c:990:29: error: 'struct dyn_affinity_stats' has no
 member named 'nr_wakeups_preferred_cpus'
Message-ID: <202402062202.5xZX0hbZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: ebca52abe099caa97d7669d0acc71209ea80cfec [19671/21616] sched: Add statistics for scheduler dynamic affinity
config: arm64-randconfig-002-20240205 (https://download.01.org/0day-ci/archive/20240206/202402062202.5xZX0hbZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402062202.5xZX0hbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402062202.5xZX0hbZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/debug.c:815:6: warning: no previous prototype for 'sysrq_sched_debug_tidy' [-Wmissing-prototypes]
     815 | void sysrq_sched_debug_tidy(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/debug.c: In function 'proc_sched_show_task':
>> kernel/sched/debug.c:990:29: error: 'struct dyn_affinity_stats' has no member named 'nr_wakeups_preferred_cpus'
     990 |                 __P(dyn_affi->nr_wakeups_preferred_cpus);
         |                             ^~
   kernel/sched/debug.c:21:31: note: in definition of macro 'SEQ_printf'
      21 |                 seq_printf(m, x);               \
         |                               ^
   kernel/sched/debug.c:990:17: note: in expansion of macro '__P'
     990 |                 __P(dyn_affi->nr_wakeups_preferred_cpus);
         |                 ^~~
   In file included from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/debug.c:12:
>> kernel/sched/debug.c:990:29: error: 'struct dyn_affinity_stats' has no member named 'nr_wakeups_preferred_cpus'
     990 |                 __P(dyn_affi->nr_wakeups_preferred_cpus);
         |                             ^~
   include/linux/printk.h:362:33: note: in definition of macro 'pr_cont'
     362 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   kernel/sched/debug.c:939:9: note: in expansion of macro 'SEQ_printf'
     939 |         SEQ_printf(m, "%-45s:%21Ld\n", #F, (long long)F)
         |         ^~~~~~~~~~
   kernel/sched/debug.c:990:17: note: in expansion of macro '__P'
     990 |                 __P(dyn_affi->nr_wakeups_preferred_cpus);
         |                 ^~~
>> kernel/sched/debug.c:991:29: error: 'struct dyn_affinity_stats' has no member named 'nr_wakeups_force_preferred_cpus'
     991 |                 __P(dyn_affi->nr_wakeups_force_preferred_cpus);
         |                             ^~
   kernel/sched/debug.c:21:31: note: in definition of macro 'SEQ_printf'
      21 |                 seq_printf(m, x);               \
         |                               ^
   kernel/sched/debug.c:991:17: note: in expansion of macro '__P'
     991 |                 __P(dyn_affi->nr_wakeups_force_preferred_cpus);
         |                 ^~~
>> kernel/sched/debug.c:991:29: error: 'struct dyn_affinity_stats' has no member named 'nr_wakeups_force_preferred_cpus'
     991 |                 __P(dyn_affi->nr_wakeups_force_preferred_cpus);
         |                             ^~
   include/linux/printk.h:362:33: note: in definition of macro 'pr_cont'
     362 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   kernel/sched/debug.c:939:9: note: in expansion of macro 'SEQ_printf'
     939 |         SEQ_printf(m, "%-45s:%21Ld\n", #F, (long long)F)
         |         ^~~~~~~~~~
   kernel/sched/debug.c:991:17: note: in expansion of macro '__P'
     991 |                 __P(dyn_affi->nr_wakeups_force_preferred_cpus);
         |                 ^~~
   kernel/sched/debug.c: At top level:
   kernel/sched/debug.c:867:36: warning: 'sched_debug_sops' defined but not used [-Wunused-const-variable=]
     867 | static const struct seq_operations sched_debug_sops = {
         |                                    ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for UACCE
   Depends on [n]: IOMMU_API [=n]
   Selected by [y]:
   - CRYPTO_DEV_HISI_QM [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 [=y] && PCI [=y]


vim +990 kernel/sched/debug.c

   924	
   925	void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
   926							  struct seq_file *m)
   927	{
   928	#ifdef CONFIG_QOS_SCHED_DYNAMIC_AFFINITY
   929		struct dyn_affinity_stats	*dyn_affi = p->se.dyn_affi_stats;
   930	#endif
   931		unsigned long nr_switches;
   932	
   933		SEQ_printf(m, "%s (%d, #threads: %d)\n", p->comm, task_pid_nr_ns(p, ns),
   934							get_nr_threads(p));
   935		SEQ_printf(m,
   936			"---------------------------------------------------------"
   937			"----------\n");
   938	#define __P(F) \
   939		SEQ_printf(m, "%-45s:%21Ld\n", #F, (long long)F)
   940	#define P(F) \
   941		SEQ_printf(m, "%-45s:%21Ld\n", #F, (long long)p->F)
   942	#define P_SCHEDSTAT(F) \
   943		SEQ_printf(m, "%-45s:%21Ld\n", #F, (long long)schedstat_val(p->F))
   944	#define __PN(F) \
   945		SEQ_printf(m, "%-45s:%14Ld.%06ld\n", #F, SPLIT_NS((long long)F))
   946	#define PN(F) \
   947		SEQ_printf(m, "%-45s:%14Ld.%06ld\n", #F, SPLIT_NS((long long)p->F))
   948	#define PN_SCHEDSTAT(F) \
   949		SEQ_printf(m, "%-45s:%14Ld.%06ld\n", #F, SPLIT_NS((long long)schedstat_val(p->F)))
   950	
   951		PN(se.exec_start);
   952		PN(se.vruntime);
   953		PN(se.sum_exec_runtime);
   954	
   955		nr_switches = p->nvcsw + p->nivcsw;
   956	
   957		P(se.nr_migrations);
   958	
   959		if (schedstat_enabled()) {
   960			u64 avg_atom, avg_per_cpu;
   961	
   962			PN_SCHEDSTAT(se.statistics.sum_sleep_runtime);
   963			PN_SCHEDSTAT(se.statistics.wait_start);
   964			PN_SCHEDSTAT(se.statistics.sleep_start);
   965			PN_SCHEDSTAT(se.statistics.block_start);
   966			PN_SCHEDSTAT(se.statistics.sleep_max);
   967			PN_SCHEDSTAT(se.statistics.block_max);
   968			PN_SCHEDSTAT(se.statistics.exec_max);
   969			PN_SCHEDSTAT(se.statistics.slice_max);
   970			PN_SCHEDSTAT(se.statistics.wait_max);
   971			PN_SCHEDSTAT(se.statistics.wait_sum);
   972			P_SCHEDSTAT(se.statistics.wait_count);
   973			PN_SCHEDSTAT(se.statistics.iowait_sum);
   974			P_SCHEDSTAT(se.statistics.iowait_count);
   975			P_SCHEDSTAT(se.statistics.nr_migrations_cold);
   976			P_SCHEDSTAT(se.statistics.nr_failed_migrations_affine);
   977			P_SCHEDSTAT(se.statistics.nr_failed_migrations_running);
   978			P_SCHEDSTAT(se.statistics.nr_failed_migrations_hot);
   979			P_SCHEDSTAT(se.statistics.nr_forced_migrations);
   980			P_SCHEDSTAT(se.statistics.nr_wakeups);
   981			P_SCHEDSTAT(se.statistics.nr_wakeups_sync);
   982			P_SCHEDSTAT(se.statistics.nr_wakeups_migrate);
   983			P_SCHEDSTAT(se.statistics.nr_wakeups_local);
   984			P_SCHEDSTAT(se.statistics.nr_wakeups_remote);
   985			P_SCHEDSTAT(se.statistics.nr_wakeups_affine);
   986			P_SCHEDSTAT(se.statistics.nr_wakeups_affine_attempts);
   987			P_SCHEDSTAT(se.statistics.nr_wakeups_passive);
   988			P_SCHEDSTAT(se.statistics.nr_wakeups_idle);
   989	#ifdef CONFIG_QOS_SCHED_DYNAMIC_AFFINITY
 > 990			__P(dyn_affi->nr_wakeups_preferred_cpus);
 > 991			__P(dyn_affi->nr_wakeups_force_preferred_cpus);
   992	#endif
   993	
   994			avg_atom = p->se.sum_exec_runtime;
   995			if (nr_switches)
   996				avg_atom = div64_ul(avg_atom, nr_switches);
   997			else
   998				avg_atom = -1LL;
   999	
  1000			avg_per_cpu = p->se.sum_exec_runtime;
  1001			if (p->se.nr_migrations) {
  1002				avg_per_cpu = div64_u64(avg_per_cpu,
  1003							p->se.nr_migrations);
  1004			} else {
  1005				avg_per_cpu = -1LL;
  1006			}
  1007	
  1008			__PN(avg_atom);
  1009			__PN(avg_per_cpu);
  1010		}
  1011	
  1012		__P(nr_switches);
  1013		SEQ_printf(m, "%-45s:%21Ld\n",
  1014			   "nr_voluntary_switches", (long long)p->nvcsw);
  1015		SEQ_printf(m, "%-45s:%21Ld\n",
  1016			   "nr_involuntary_switches", (long long)p->nivcsw);
  1017	
  1018		P(se.load.weight);
  1019		P(se.runnable_weight);
  1020	#ifdef CONFIG_SMP
  1021		P(se.avg.load_sum);
  1022		P(se.avg.runnable_load_sum);
  1023		P(se.avg.util_sum);
  1024		P(se.avg.load_avg);
  1025		P(se.avg.runnable_load_avg);
  1026		P(se.avg.util_avg);
  1027		P(se.avg.last_update_time);
  1028		P(se.avg.util_est.ewma);
  1029		P(se.avg.util_est.enqueued);
  1030	#endif
  1031		P(policy);
  1032		P(prio);
  1033		if (task_has_dl_policy(p)) {
  1034			P(dl.runtime);
  1035			P(dl.deadline);
  1036		}
  1037	#undef PN_SCHEDSTAT
  1038	#undef PN
  1039	#undef __PN
  1040	#undef P_SCHEDSTAT
  1041	#undef P
  1042	#undef __P
  1043	
  1044		{
  1045			unsigned int this_cpu = raw_smp_processor_id();
  1046			u64 t0, t1;
  1047	
  1048			t0 = cpu_clock(this_cpu);
  1049			t1 = cpu_clock(this_cpu);
  1050			SEQ_printf(m, "%-45s:%21Ld\n",
  1051				   "clock-delta", (long long)(t1-t0));
  1052		}
  1053	
  1054		sched_show_numa(p, m);
  1055	}
  1056	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
