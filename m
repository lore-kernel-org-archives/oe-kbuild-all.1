Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC929161
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 00:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714436024; cv=none; b=jb3sxAHrJjX8omMfQmfM6M+yiF6rIEGiDBa3Stt9rj2PohyXwmbYzVQiyTc0p/e87nn4pyR1WPW/vcogefQR4jioNknScRJVMU0m+C/fHUMGBGpP8TMEpriB16iJeGgs+JyeeLrO2rIV0AIOsdfGhaCjLpn9rbiEg1xYg8JVQns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714436024; c=relaxed/simple;
	bh=+nyCaz+7sDXImmpxE1pF4YF22Qbj5cgKKTeJx3huGts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPh9EJPattzpXiqAuwDWu6GZ2CtPO8NQdFLNAD0ItOiQUXwLzmmEeaYVw+JwONdt3tGmo6BFHO5+7OVTG2DsM8VubN/k3p0mU8sfKcXR0+hXH8aMhFHXetIBvRpyTpR5TTJZqwGpdcSaepTbH9rGLuzfjcJn3trjLBUsfgDLS14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rbkn/GvE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rbkn/GvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714436023; x=1745972023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+nyCaz+7sDXImmpxE1pF4YF22Qbj5cgKKTeJx3huGts=;
  b=Rbkn/GvESjLGZ7vcrCZFOxe9JZNl3LjuUVbWffEfusMHY4X6AmnArndF
   ShYqLkqLUfCuxQzRJn1JSA0lHaI+35I5oW3YuPpwFSTHDw3/Ykdnkto9p
   ELrRDfZVpvo9weZOB//5+opVMvtPtUyhqYt0FBpxA1r+REUVXBCLtl9SY
   ihXmXqIrFVAiEIQ80rQ4lLWJIkbPQkdhrlz2qZX6L8ouR3DB6Wqw7Q6p3
   /F/UevPWhrvgk7Rsw4kWPovosy7d+9Sg7dDF/1Cx+wXJY4HcKoEb26nzD
   ndYlGMC+j1/oWqCEHCF6LQ+tbbXKGdK+458eegY9+xDBPeUj1cV18N57f
   Q==;
X-CSE-ConnectionGUID: WOFS19AWR4uJFXahr/GRRA==
X-CSE-MsgGUID: In3cyAKLSYyuKIHaVms2UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13911445"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="13911445"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:13:42 -0700
X-CSE-ConnectionGUID: 9XBldMITR6Gkp7ndRGDIiQ==
X-CSE-MsgGUID: ZQY3+bFlS7+ZbDGC8qp68Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="30729098"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2024 17:13:41 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1b7q-0007Xy-2v;
	Tue, 30 Apr 2024 00:13:38 +0000
Date: Tue, 30 Apr 2024 08:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2552/7643] kernel/sched/fair.c:314:15: error: use
 of undeclared identifier 'hundred_thousand'
Message-ID: <202404300812.EAGGykdR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3fd472966bcc21f40dc20bb47c7ad18392fbec05
commit: f7c232d3e20a69b46e53da221ba3cbac0fa68a0d [2552/7643] smart_grid: introduce smart_grid_strategy_ctrl sysctl
config: x86_64-randconfig-r123-20240430 (https://download.01.org/0day-ci/archive/20240430/202404300812.EAGGykdR-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300812.EAGGykdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300812.EAGGykdR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:314:15: error: use of undeclared identifier 'hundred_thousand'
     314 |                 .extra2         = &hundred_thousand,
         |                                    ^
>> kernel/sched/fair.c:322:2: error: invalid application of 'sizeof' to an incomplete type 'struct ctl_table[]'
     322 |         register_sysctl_init("kernel", sched_fair_sysctls);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:241:46: note: expanded from macro 'register_sysctl_init'
     241 |         __register_sysctl_init(path, table, #table, ARRAY_SIZE(table))
         |                                                     ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:32: note: expanded from macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   kernel/sched/fair.c:7104:6: warning: no previous prototype for function 'free_affinity_domains' [-Wmissing-prototypes]
    7104 | void free_affinity_domains(struct affinity_domain *ad)
         |      ^
   kernel/sched/fair.c:7104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7104 | void free_affinity_domains(struct affinity_domain *ad)
         | ^
         | static 
   1 warning and 2 errors generated.


vim +/hundred_thousand +314 kernel/sched/fair.c

   216	
   217	#ifdef CONFIG_SYSCTL
   218	static struct ctl_table sched_fair_sysctls[] = {
   219		{
   220			.procname       = "sched_child_runs_first",
   221			.data           = &sysctl_sched_child_runs_first,
   222			.maxlen         = sizeof(unsigned int),
   223			.mode           = 0644,
   224			.proc_handler   = proc_dointvec,
   225		},
   226	#ifdef CONFIG_CFS_BANDWIDTH
   227		{
   228			.procname       = "sched_cfs_bandwidth_slice_us",
   229			.data           = &sysctl_sched_cfs_bandwidth_slice,
   230			.maxlen         = sizeof(unsigned int),
   231			.mode           = 0644,
   232			.proc_handler   = proc_dointvec_minmax,
   233			.extra1         = SYSCTL_ONE,
   234		},
   235	#endif
   236	#ifdef CONFIG_NUMA_BALANCING
   237		{
   238			.procname	= "numa_balancing_promote_rate_limit_MBps",
   239			.data		= &sysctl_numa_balancing_promote_rate_limit,
   240			.maxlen		= sizeof(unsigned int),
   241			.mode		= 0644,
   242			.proc_handler	= proc_dointvec_minmax,
   243			.extra1		= SYSCTL_ZERO,
   244		},
   245	#endif /* CONFIG_NUMA_BALANCING */
   246	#ifdef CONFIG_QOS_SCHED
   247		{
   248			.procname	= "qos_overload_detect_period_ms",
   249			.data		= &sysctl_overload_detect_period,
   250			.maxlen		= sizeof(unsigned int),
   251			.mode		= 0644,
   252			.proc_handler	= proc_dointvec_minmax,
   253			.extra1		= SYSCTL_ONE_HUNDRED,
   254			.extra2		= &hundred_thousand,
   255		},
   256		{
   257			.procname	= "qos_offline_wait_interval_ms",
   258			.data		= &sysctl_offline_wait_interval,
   259			.maxlen		= sizeof(unsigned int),
   260			.mode		= 0644,
   261			.proc_handler	= proc_dointvec_minmax,
   262			.extra1		= SYSCTL_ONE_HUNDRED,
   263			.extra2		= &one_thousand,
   264		},
   265	#endif
   266	#ifdef CONFIG_QOS_SCHED_DYNAMIC_AFFINITY
   267		{
   268			.procname       = "sched_util_low_pct",
   269			.data           = &sysctl_sched_util_low_pct,
   270			.maxlen         = sizeof(sysctl_sched_util_low_pct),
   271			.mode           = 0644,
   272			.proc_handler   = proc_dointvec_minmax,
   273			.extra1         = SYSCTL_ZERO,
   274			.extra2		= SYSCTL_ONE_HUNDRED,
   275		},
   276	#endif
   277	#ifdef CONFIG_QOS_SCHED_PRIO_LB
   278		{
   279			.procname	= "sched_prio_load_balance_enabled",
   280			.data		= &sysctl_sched_prio_load_balance_enabled,
   281			.maxlen		= sizeof(unsigned int),
   282			.mode		= 0644,
   283			.proc_handler	= proc_dointvec_minmax,
   284			.extra1		= SYSCTL_ZERO,
   285			.extra2		= SYSCTL_ONE,
   286		},
   287	#endif
   288	#ifdef CONFIG_QOS_SCHED_MULTILEVEL
   289		{
   290			.procname	= "qos_level_weights",
   291			.data		= &sysctl_qos_level_weights,
   292			.maxlen		= 5*sizeof(int),
   293			.mode		= 0644,
   294			.proc_handler	= proc_dointvec,
   295		},
   296	#endif
   297	#ifdef CONFIG_QOS_SCHED_SMART_GRID
   298		{
   299			.procname	= "smart_grid_strategy_ctrl",
   300			.data		= &sysctl_smart_grid_strategy_ctrl,
   301			.maxlen		= sizeof(unsigned int),
   302			.mode		= 0644,
   303			.proc_handler   = proc_dointvec_minmax,
   304			.extra1         = SYSCTL_ZERO,
   305			.extra2		= SYSCTL_ONE,
   306		},
   307		{
   308			.procname	= "affinity_adjust_delay_ms",
   309			.data		= &sysctl_affinity_adjust_delay_ms,
   310			.maxlen		= sizeof(unsigned int),
   311			.mode		= 0644,
   312			.proc_handler   = proc_dointvec_minmax,
   313			.extra1         = SYSCTL_ZERO,
 > 314			.extra2		= &hundred_thousand,
   315		},
   316	#endif
   317		{}
   318	};
   319	
   320	static int __init sched_fair_sysctl_init(void)
   321	{
 > 322		register_sysctl_init("kernel", sched_fair_sysctls);
   323		return 0;
   324	}
   325	late_initcall(sched_fair_sysctl_init);
   326	#endif
   327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
