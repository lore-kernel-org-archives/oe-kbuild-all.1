Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47481C32FF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 21:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642778; cv=none; b=i5kwdizcEzrTGL5af8uGFX/2MX9NkH8l51l3ys90JfmII4gYH5u8ruw76ifI0z8jmCxycVkjlQon23QYg5js6Ie5+Ze6rrB30cDLPTs1plgpdcPhyeRHHAoTct3jbK5YIiLZnEE/GJdKmRQHxEIt63qtMER35f9OkTGqrMjBVFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642778; c=relaxed/simple;
	bh=QxPK3RWCp3ZIhUXqyN8L8PG3rIk0zNemGn0o9shhnwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DgHwmgDrHKsR499YH32BuOBQ4e/KjqI0GE5h1qKGMUsr9K/EDwNnPj0utyTewXz1l/bq/O6WzkPD0C0W5mTnCdcystcxNBM8y7pcxB+h0b0ae54sQXzKaTyQzP4WZyXeJzw8LddZSzSg/gI28IX1D96pWEBySeflu6AICe5/XZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEfgRZE/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEfgRZE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734642776; x=1766178776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QxPK3RWCp3ZIhUXqyN8L8PG3rIk0zNemGn0o9shhnwk=;
  b=TEfgRZE/cWmmIA+1ZxKiXykABmX1SSlnEQ0wxezN3tPvrfCb6YRk3d/j
   39KMnpC5YFpMcSBER/n/u9teIJwseOaNwo/d7MZeL0dLPyzNHN2cf5H07
   rsqdKfYdAne7dkltlXysPAhbwsnUFXBpAk8q8P2Sx1ThV8vzrBNBDpPF/
   KajWL/R1Rzu65Erh9RkMbEwQStIrR03uj8A+vl4tULDJoQcvsa/nv/vk8
   gEf3r3dulSZoJDHGpynWGjHOcjJhDxQogIzQlBp9Ejz5Pgcdf+a1aq26p
   J72KVn8nGpcKlFwEtOUNs3hte6SwEivNgGENWswERweethHLHpTcWt5Tw
   g==;
X-CSE-ConnectionGUID: vafosfJVStKRCJewkj+CnA==
X-CSE-MsgGUID: gmcnNu8mTb60vI3gk9+mvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34897956"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="34897956"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 13:12:56 -0800
X-CSE-ConnectionGUID: moVjxpA1QBumK3IYN0hGGg==
X-CSE-MsgGUID: mAlYGoOMTyyprnOyv7YIfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98111509"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Dec 2024 13:12:53 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tONpD-0000X5-2A;
	Thu, 19 Dec 2024 21:12:51 +0000
Date: Fri, 20 Dec 2024 05:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1652/1652] kernel/sched/fair.c:314:15: error: use
 of undeclared identifier 'hundred_thousand'
Message-ID: <202412200541.JaCJnqAZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yipeng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c949b1289f4ebbd5ede571336c2bee4545b28ea4
commit: f7c232d3e20a69b46e53da221ba3cbac0fa68a0d [1652/1652] smart_grid: introduce smart_grid_strategy_ctrl sysctl
config: arm64-randconfig-004-20241220 (https://download.01.org/0day-ci/archive/20241220/202412200541.JaCJnqAZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412200541.JaCJnqAZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412200541.JaCJnqAZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:25:
   In file included from include/linux/hugetlb_inline.h:7:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   6 warnings and 2 errors generated.


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
