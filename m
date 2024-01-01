Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A614B33D6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jan 2024 05:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3R+9tAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704086836; x=1735622836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6hZyqXb0tICVy7EcHnmQ+XVWvQzuiPGDckcDjuGigSk=;
  b=V3R+9tAE/lD6jgIa1HvbavCBSlsDZE3eYqERhwRXveUXIkhU8P8Qu0Gt
   w19fqS6ujDYOz7+0e81aN/nXA3YwaSJwZHIXWim230iS6gKCiBTEdc66o
   YocilRyjpfRx0xWD1uc8TAluW1dEk5Vq0nX3/xHxkoQIIHV718axZJ/CH
   cvieFBrqSZJh1JgseTEoZcFkHKMs4vTlhvCZIyvwRGo3eNSeYSMNUyptr
   3YtBFrpW6l3OXhbqL6PYhPujZ1b3LqMa/KgWVK4JcGsrJ70gZkt1DDd4+
   W0eDr9LR+uzdcM1S8NZebQa8JPhI7uunojuH2/RfHjJllpOS0oRadX3OC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="463182467"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="463182467"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2023 21:27:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="1026449693"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="1026449693"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 31 Dec 2023 21:27:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKApU-000K12-0Q;
	Mon, 01 Jan 2024 05:27:12 +0000
Date: Mon, 1 Jan 2024 13:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: caelli <caelli@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	kaixuxiakx <60962168+kaixuxiakx@users.noreply.github.com>,
	Peng Hao <flyingpeng@tencent.com>, Bin Lai <robinlai@tencent.com>
Subject: kernel/cgroup/cpuset.c:2697:5: warning: no previous prototype for
 'cpuset_cgroupfs_stat_show'
Message-ID: <202401011301.Z79vJKWp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: b80247552b030b427e8483f5f566b86d3b8d3ec1 cgroupfs: support for proc and sys
date:   2 years, 2 months ago
config: x86_64-oc_base_config (https://download.01.org/0day-ci/archive/20240101/202401011301.Z79vJKWp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240101/202401011301.Z79vJKWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401011301.Z79vJKWp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cpuset.c:2697:5: warning: no previous prototype for 'cpuset_cgroupfs_stat_show' [-Wmissing-prototypes]
    2697 | int cpuset_cgroupfs_stat_show(struct seq_file *m, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c: In function 'cpuset_cgroup_cpuinfo_show_comm':
   kernel/cgroup/cpuset.c:2809:39: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
    2809 |                 if (c->x86_cache_size >= 0)
         |                                       ^~
   kernel/cgroup/cpuset.c: At top level:
>> kernel/cgroup/cpuset.c:2860:5: warning: no previous prototype for 'cpuset_cgroups_cpu_allowed' [-Wmissing-prototypes]
    2860 | int cpuset_cgroups_cpu_allowed(struct task_struct *task, int cpu, int once)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/cgroup/cpuset.c:2879:5: warning: no previous prototype for 'cpuset_cgroupfs_cpuinfo_show' [-Wmissing-prototypes]
    2879 | int cpuset_cgroupfs_cpuinfo_show(struct seq_file *m, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4082:6: warning: no previous prototype for 'cgroup_cpuset_calc_load' [-Wmissing-prototypes]
    4082 | void cgroup_cpuset_calc_load(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/cgroup/cpuset.c:4184:5: warning: no previous prototype for 'cpuset_cgroupfs_loadavg_show' [-Wmissing-prototypes]
    4184 | int cpuset_cgroupfs_loadavg_show(struct seq_file *m, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> kernel/sched/cpuacct.c:340:5: warning: no previous prototype for 'cpuacct_cgroupfs_uptime_show' [-Wmissing-prototypes]
     340 | int cpuacct_cgroupfs_uptime_show(struct seq_file *m, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cpuset_cgroupfs_stat_show +2697 kernel/cgroup/cpuset.c

  2696	
> 2697	int cpuset_cgroupfs_stat_show(struct seq_file *m, void *v)
  2698	{
  2699		struct cgroup_subsys_state *css = task_css(current, cpuset_cgrp_id);
  2700		struct cpuset *cs = css_cs(css);
  2701		int max_cpu = cpu_get_max_cpus(current);
  2702		return cpuset_cgroup_stat_show_comm(m, v, cs, max_cpu);
  2703	}
  2704	
  2705	static int cpuset_cgroup_stat_show(struct seq_file *sf, void *v)
  2706	{
  2707		struct cpuset *cs = css_cs(seq_css(sf));
  2708		return cpuset_cgroup_stat_show_comm(sf, v, cs, INT_MAX);
  2709	}
  2710	
  2711	#ifdef CONFIG_X86
  2712	/*
  2713	 *	Get CPU information for use by the procfs.
  2714	 */
  2715	static void show_cpuinfo_core(struct seq_file *m, struct cpuinfo_x86 *c,
  2716				      unsigned int cpu)
  2717	{
  2718	#ifdef CONFIG_SMP
  2719		seq_printf(m, "physical id\t: %d\n", c->phys_proc_id);
  2720		seq_printf(m, "siblings\t: %d\n",
  2721			   cpumask_weight(topology_core_cpumask(cpu)));
  2722		seq_printf(m, "core id\t\t: %d\n", c->cpu_core_id);
  2723		seq_printf(m, "cpu cores\t: %d\n", c->booted_cores);
  2724		seq_printf(m, "apicid\t\t: %d\n", c->apicid);
  2725		seq_printf(m, "initial apicid\t: %d\n", c->initial_apicid);
  2726	#endif
  2727	}
  2728	
  2729	#ifdef CONFIG_X86_32
  2730	static void show_cpuinfo_misc(struct seq_file *m, struct cpuinfo_x86 *c)
  2731	{
  2732		seq_printf(m,
  2733			   "fdiv_bug\t: %s\n"
  2734			   "f00f_bug\t: %s\n"
  2735			   "coma_bug\t: %s\n"
  2736			   "fpu\t\t: %s\n"
  2737			   "fpu_exception\t: %s\n"
  2738			   "cpuid level\t: %d\n"
  2739			   "wp\t\t: yes\n",
  2740			   static_cpu_has_bug(X86_BUG_FDIV) ? "yes" : "no",
  2741			   static_cpu_has_bug(X86_BUG_F00F) ? "yes" : "no",
  2742			   static_cpu_has_bug(X86_BUG_COMA) ? "yes" : "no",
  2743			   static_cpu_has(X86_FEATURE_FPU) ? "yes" : "no",
  2744			   static_cpu_has(X86_FEATURE_FPU) ? "yes" : "no",
  2745			   c->cpuid_level);
  2746	}
  2747	#else
  2748	static void show_cpuinfo_misc(struct seq_file *m, struct cpuinfo_x86 *c)
  2749	{
  2750		seq_printf(m,
  2751			   "fpu\t\t: yes\n"
  2752			   "fpu_exception\t: yes\n"
  2753			   "cpuid level\t: %d\n"
  2754			   "wp\t\t: yes\n",
  2755			   c->cpuid_level);
  2756	}
  2757	#endif
  2758	
  2759	static int cpuset_cgroup_cpuinfo_show_comm(struct seq_file *sf, void *v, struct cpuset *cs, int max_cpu)
  2760	{
  2761		int i, j, k = 0;
  2762		struct cpuinfo_x86 *c;
  2763		unsigned int cpu;
  2764		bool is_top_cgrp;
  2765	
  2766		if (!cs->css.parent)
  2767			is_top_cgrp = true;
  2768		else
  2769			is_top_cgrp = false;
  2770	
  2771		for_each_cpu(j, cs->cpus_allowed)
  2772		{
  2773			c = &cpu_data(j);
  2774			if (is_top_cgrp || cpuset_cpuinfo_show_realinfo)
  2775				cpu = c->cpu_index;
  2776			else
  2777				cpu = k;
  2778			k++;
  2779			if (k > max_cpu)
  2780				break;
  2781			seq_printf(sf, "processor\t: %u\n"
  2782					"vendor_id\t: %s\n"
  2783					"cpu family\t: %d\n"
  2784					"model\t\t: %u\n"
  2785					"model name\t: %s\n",
  2786					cpu,
  2787					c->x86_vendor_id[0] ? c->x86_vendor_id : "unknown",
  2788					c->x86,
  2789					c->x86_model,
  2790					c->x86_model_id[0] ? c->x86_model_id : "unknown");
  2791	
  2792			if (c->x86_stepping || c->cpuid_level >= 0)
  2793				seq_printf(sf, "stepping\t: %d\n", c->x86_stepping);
  2794			else
  2795				seq_printf(sf, "stepping\t: unknown\n");
  2796			if (c->microcode)
  2797				seq_printf(sf, "microcode\t: 0x%x\n", c->microcode);
  2798	
  2799			if (cpu_has(c, X86_FEATURE_TSC)) {
  2800				unsigned int freq = cpufreq_quick_get(cpu);
  2801	
  2802				if (!freq)
  2803					freq = cpu_khz;
  2804				seq_printf(sf, "cpu MHz\t\t: %u.%03u\n",
  2805						freq / 1000, (freq % 1000));
  2806			}
  2807	
  2808			/* Cache size */
  2809			if (c->x86_cache_size >= 0)
  2810				seq_printf(sf, "cache size\t: %d KB\n", c->x86_cache_size);
  2811	
  2812			show_cpuinfo_core(sf, c, cpu);
  2813			show_cpuinfo_misc(sf, c);
  2814	
  2815			seq_printf(sf, "flags\t\t:");
  2816			for (i = 0; i < 32*NCAPINTS; i++)
  2817				if (cpu_has(c, i) && x86_cap_flags[i] != NULL)
  2818					seq_printf(sf, " %s", x86_cap_flags[i]);
  2819	
  2820			seq_puts(sf, "\nbugs\t\t:");
  2821			for (i = 0; i < 32*NBUGINTS; i++) {
  2822				unsigned int bug_bit = 32*NCAPINTS + i;
  2823	
  2824				if (cpu_has_bug(c, bug_bit) && x86_bug_flags[i])
  2825					seq_printf(sf, " %s", x86_bug_flags[i]);
  2826			}
  2827	
  2828			seq_printf(sf, "\nbogomips\t: %lu.%02lu\n",
  2829					c->loops_per_jiffy/(500000/HZ),
  2830					(c->loops_per_jiffy/(5000/HZ)) % 100);
  2831	
  2832	#ifdef CONFIG_X86_64
  2833			if (c->x86_tlbsize > 0)
  2834				seq_printf(sf, "TLB size\t: %d 4K pages\n", c->x86_tlbsize);
  2835	#endif
  2836			seq_printf(sf, "clflush size\t: %u\n", c->x86_clflush_size);
  2837			seq_printf(sf, "cache_alignment\t: %d\n", c->x86_cache_alignment);
  2838			seq_printf(sf, "address sizes\t: %u bits physical, %u bits virtual\n",
  2839					c->x86_phys_bits, c->x86_virt_bits);
  2840	
  2841			seq_printf(sf, "power management:");
  2842			for (i = 0; i < 32; i++) {
  2843				if (c->x86_power & (1 << i)) {
  2844					if (i < ARRAY_SIZE(x86_power_flags) &&
  2845							x86_power_flags[i])
  2846						seq_printf(sf, "%s%s",
  2847								x86_power_flags[i][0] ? " " : "",
  2848								x86_power_flags[i]);
  2849					else
  2850						seq_printf(sf, " [%d]", i);
  2851				}
  2852			}
  2853	
  2854			seq_puts(sf, "\n\n");
  2855		}
  2856		return 0;
  2857	}
  2858	
  2859	/* return 1 if allowed, otherwise 0 is returned */
> 2860	int cpuset_cgroups_cpu_allowed(struct task_struct *task, int cpu, int once)
  2861	{
  2862		struct cgroup_subsys_state *css = task_css(task, cpuset_cgrp_id);
  2863		struct cpuset *cs = css_cs(css);
  2864		int max_cpu, i, k = 0;
  2865		if (!once)
  2866			return cpumask_test_cpu(cpu, cs->cpus_allowed);
  2867		max_cpu = cpu_get_max_cpus(task);
  2868		for_each_cpu(i, cs->cpus_allowed) {
  2869			if (++k > max_cpu)
  2870				return 0;
  2871			if (i == cpu)
  2872				return 1;
  2873			if (i > cpu)
  2874				return 0;
  2875		}
  2876		return 0;
  2877	}
  2878	
> 2879	int cpuset_cgroupfs_cpuinfo_show(struct seq_file *m, void *v)
  2880	{
  2881		struct cgroup_subsys_state *css = task_css(current, cpuset_cgrp_id);
  2882		struct cpuset *cs = css_cs(css);
  2883		int max_cpu = cpu_get_max_cpus(current);
  2884		return cpuset_cgroup_cpuinfo_show_comm(m, v, cs, max_cpu);
  2885	}
  2886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
