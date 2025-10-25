Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22188C2E0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 23:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761433537; cv=none; b=RKeYe4LwYnEHfLGWwIsP+HJ7KXw6GuK6n51wbGaN/yHOet3gY/iVmb9SCfqeK5TF2IqMhoTeQzuaagqYb2850lpeOcI7AsBV5mn5NFvbqLFMHdKnijMyLWRgM7IpUWDJJrpnK5DMTDmeSUXZgcZpwmKtxYoRRI8M8fpbUX4FdGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761433537; c=relaxed/simple;
	bh=nHLMO/1X3q82ApLoyxtONYuVKtBA7Ov+hiEZBJNU8iY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/xe3UC3D6VnEEIeVTINGzT9g4wRhDPZ92UEn/Z8SO768+HZ5YVqoh8hRtRebR+6ohtQ+5SUsNds9IlHA5DRPTeOfm1cFXIhw8faF+sDxy8lxQKdW0jQGhjxCpyKMq+ImG7/vLoCX2uxHjzZqWF5MMlhJuixzWNlbdukCUXfH2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkE8lv8i; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkE8lv8i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761433535; x=1792969535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nHLMO/1X3q82ApLoyxtONYuVKtBA7Ov+hiEZBJNU8iY=;
  b=AkE8lv8ihioMP46a1UHAa9W5dw5vMXdkapdJQZ0k9nzeSK8DCeSx9oii
   5bXdSe796aOu8nxMRvxkfXAMTrgg1NR8p8VMLmdFrTKQrMNVD4HYDzR8S
   UgQk4GVpaf4H85U7FKR7xA4Z9NjpwThhjofK5YWGRHDjVRAL3Jbqqq2aT
   AKCqCBw+l4XNm4T0GQ7lC67YCOS9ke+82x9kgbe8rGJfphj0UjL492+VT
   7pX9Eq/aZN/z9asqD3evuA029KhYKTIlpURKXOggiyOaMDrtfbS82MzSN
   E36fFsyPXH7eU7y1ohDkvRmy1V5ySZNx/84D8ctahjeIfZAyDGISK2lyb
   A==;
X-CSE-ConnectionGUID: u3pRwghlSnKzolL8kAVSLQ==
X-CSE-MsgGUID: RcvY4wh9TAa6DUjdN/ftZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63458887"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="63458887"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 16:05:34 -0700
X-CSE-ConnectionGUID: GJiHSf4kTzGMYa2h0yxmqA==
X-CSE-MsgGUID: vS+O6s1GRz6GFzibdtuSYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="184418886"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Oct 2025 16:05:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCnKE-000Ffx-2g;
	Sat, 25 Oct 2025 23:05:30 +0000
Date: Sun, 26 Oct 2025 07:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1425/1425] kernel/sched/debug.c:990:17:
 error: no member named 'nr_wakeups_preferred_cpus' in 'struct
 dyn_affinity_stats'
Message-ID: <202510260628.B3y7ky3K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hui,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ee55f6a88c1f70120d9cec8244c5cd10f0c4dce9
commit: ebca52abe099caa97d7669d0acc71209ea80cfec [1425/1425] sched: Add statistics for scheduler dynamic affinity
config: x86_64-randconfig-103-20250219 (https://download.01.org/0day-ci/archive/20251026/202510260628.B3y7ky3K-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260628.B3y7ky3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260628.B3y7ky3K-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/debug.c:815:6: warning: no previous prototype for function 'sysrq_sched_debug_tidy' [-Wmissing-prototypes]
     815 | void sysrq_sched_debug_tidy(void)
         |      ^
   kernel/sched/debug.c:815:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     815 | void sysrq_sched_debug_tidy(void)
         | ^
         | static 
>> kernel/sched/debug.c:990:17: error: no member named 'nr_wakeups_preferred_cpus' in 'struct dyn_affinity_stats'
     990 |                 __P(dyn_affi->nr_wakeups_preferred_cpus);
         |                     ~~~~~~~~  ^
   kernel/sched/debug.c:939:48: note: expanded from macro '__P'
     939 |         SEQ_printf(m, "%-45s:%21Ld\n", #F, (long long)F)
         |                                                       ^
   kernel/sched/debug.c:21:17: note: expanded from macro 'SEQ_printf'
      21 |                 seq_printf(m, x);               \
         |                               ^
>> kernel/sched/debug.c:990:17: error: no member named 'nr_wakeups_preferred_cpus' in 'struct dyn_affinity_stats'
     990 |                 __P(dyn_affi->nr_wakeups_preferred_cpus);
         |                     ~~~~~~~~  ^
   kernel/sched/debug.c:939:48: note: expanded from macro '__P'
     939 |         SEQ_printf(m, "%-45s:%21Ld\n", #F, (long long)F)
         |                                                       ^
   kernel/sched/debug.c:23:11: note: expanded from macro 'SEQ_printf'
      23 |                 pr_cont(x);                     \
         |                         ^
   include/linux/printk.h:362:26: note: expanded from macro 'pr_cont'
     362 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
>> kernel/sched/debug.c:991:17: error: no member named 'nr_wakeups_force_preferred_cpus' in 'struct dyn_affinity_stats'
     991 |                 __P(dyn_affi->nr_wakeups_force_preferred_cpus);
         |                     ~~~~~~~~  ^
   kernel/sched/debug.c:939:48: note: expanded from macro '__P'
     939 |         SEQ_printf(m, "%-45s:%21Ld\n", #F, (long long)F)
         |                                                       ^
   kernel/sched/debug.c:21:17: note: expanded from macro 'SEQ_printf'
      21 |                 seq_printf(m, x);               \
         |                               ^
>> kernel/sched/debug.c:991:17: error: no member named 'nr_wakeups_force_preferred_cpus' in 'struct dyn_affinity_stats'
     991 |                 __P(dyn_affi->nr_wakeups_force_preferred_cpus);
         |                     ~~~~~~~~  ^
   kernel/sched/debug.c:939:48: note: expanded from macro '__P'
     939 |         SEQ_printf(m, "%-45s:%21Ld\n", #F, (long long)F)
         |                                                       ^
   kernel/sched/debug.c:23:11: note: expanded from macro 'SEQ_printf'
      23 |                 pr_cont(x);                     \
         |                         ^
   include/linux/printk.h:362:26: note: expanded from macro 'pr_cont'
     362 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   1 warning and 4 errors generated.


vim +990 kernel/sched/debug.c

   814	
 > 815	void sysrq_sched_debug_tidy(void)
   816	{
   817		int cpu;
   818	
   819		SEQ_printf(NULL, "Sched Debug Version: v0.11, %s %.*s\n",
   820			init_utsname()->release,
   821			(int)strcspn(init_utsname()->version, " "),
   822			init_utsname()->version);
   823	
   824		for_each_online_cpu(cpu)
   825			print_cpu_tidy(NULL, cpu);
   826	}
   827	
   828	/*
   829	 * This itererator needs some explanation.
   830	 * It returns 1 for the header position.
   831	 * This means 2 is CPU 0.
   832	 * In a hotplugged system some CPUs, including CPU 0, may be missing so we have
   833	 * to use cpumask_* to iterate over the CPUs.
   834	 */
   835	static void *sched_debug_start(struct seq_file *file, loff_t *offset)
   836	{
   837		unsigned long n = *offset;
   838	
   839		if (n == 0)
   840			return (void *) 1;
   841	
   842		n--;
   843	
   844		if (n > 0)
   845			n = cpumask_next(n - 1, cpu_online_mask);
   846		else
   847			n = cpumask_first(cpu_online_mask);
   848	
   849		*offset = n + 1;
   850	
   851		if (n < nr_cpu_ids)
   852			return (void *)(unsigned long)(n + 2);
   853	
   854		return NULL;
   855	}
   856	
   857	static void *sched_debug_next(struct seq_file *file, void *data, loff_t *offset)
   858	{
   859		(*offset)++;
   860		return sched_debug_start(file, offset);
   861	}
   862	
   863	static void sched_debug_stop(struct seq_file *file, void *data)
   864	{
   865	}
   866	
   867	static const struct seq_operations sched_debug_sops = {
   868		.start		= sched_debug_start,
   869		.next		= sched_debug_next,
   870		.stop		= sched_debug_stop,
   871		.show		= sched_debug_show,
   872	};
   873	
   874	static int __init init_sched_debug_procfs(void)
   875	{
   876		if (!proc_create_seq("sched_debug", 0444, NULL, &sched_debug_sops))
   877			return -ENOMEM;
   878		return 0;
   879	}
   880	
   881	__initcall(init_sched_debug_procfs);
   882	
   883	#define __P(F)	SEQ_printf(m, "%-45s:%21Ld\n",	     #F, (long long)F)
   884	#define   P(F)	SEQ_printf(m, "%-45s:%21Ld\n",	     #F, (long long)p->F)
   885	#define __PN(F)	SEQ_printf(m, "%-45s:%14Ld.%06ld\n", #F, SPLIT_NS((long long)F))
   886	#define   PN(F)	SEQ_printf(m, "%-45s:%14Ld.%06ld\n", #F, SPLIT_NS((long long)p->F))
   887	
   888	
   889	#ifdef CONFIG_NUMA_BALANCING
   890	void print_numa_stats(struct seq_file *m, int node, unsigned long tsf,
   891			unsigned long tpf, unsigned long gsf, unsigned long gpf)
   892	{
   893		SEQ_printf(m, "numa_faults node=%d ", node);
   894		SEQ_printf(m, "task_private=%lu task_shared=%lu ", tpf, tsf);
   895		SEQ_printf(m, "group_private=%lu group_shared=%lu\n", gpf, gsf);
   896	}
   897	#endif
   898	
   899	
   900	static void sched_show_numa(struct task_struct *p, struct seq_file *m)
   901	{
   902	#ifdef CONFIG_NUMA_BALANCING
   903		struct mempolicy *pol;
   904	
   905		if (p->mm)
   906			P(mm->numa_scan_seq);
   907	
   908		task_lock(p);
   909		pol = p->mempolicy;
   910		if (pol && !(pol->flags & MPOL_F_MORON))
   911			pol = NULL;
   912		mpol_get(pol);
   913		task_unlock(p);
   914	
   915		P(numa_pages_migrated);
   916		P(numa_preferred_nid);
   917		P(total_numa_faults);
   918		SEQ_printf(m, "current_node=%d, numa_group_id=%d\n",
   919				task_node(p), task_numa_group_id(p));
   920		show_numa_stats(p, m);
   921		mpol_put(pol);
   922	#endif
   923	}
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
 > 939		SEQ_printf(m, "%-45s:%21Ld\n", #F, (long long)F)
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
