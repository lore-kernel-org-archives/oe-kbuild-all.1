Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D075249FA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 13:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707140974; cv=none; b=qzN+DUgDGwbpLCEoTiSLy4jJpXMuACT4+LRPiw3H5W7KUnMrOm6jIBcpNbQauaHvr8CE7YkUeVr6DeVimM66eRXqa3h8FyWobtMJVKhrJfzGb3tTjA2grg7Zoq89jnSlhXyRLGOxSGJb+jzqkKOdYx7m/bHsHzqavmZkcBS+Bq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707140974; c=relaxed/simple;
	bh=vfaaNPbvGYvqan5q53y8Wjd0JvLAOl1T8XpvcNEtlaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pyDs4UgDbEL9FQpsEswsqeGkaVBNGcywDsmvDNqlNJ8OIhsSiGIgSQUpeh4WIpT1d0RAXlxSsT6J188Dw1yVAMzk/q+uyIgVCgS+VzefHBxj92W0Lvy/kx7FlgD8k/zMxjRxwzOWjxQMwslqEHoPDLZamE1UM4FMMw7ZD1CgDwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBLnUtxc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBLnUtxc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707140972; x=1738676972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vfaaNPbvGYvqan5q53y8Wjd0JvLAOl1T8XpvcNEtlaE=;
  b=OBLnUtxcsDfyBnnr9Et9rRwb8Qb1dh7sjB+g9wIFQBvAelTxG0gSAhyv
   BU+rrnP+DiyXqKTPpmcHtDFoGKPYmFDLNvWQcSoQof8Gu7qjmRKWb8B8a
   tbBDvULWQjRvQ5HjD5thLUos8H9DzWqP0kYEpMfhIGKpkBscVttLNTwMr
   AMJEIYfJ6+mss6OeghAn5tVag1bC+OxSt7hWY5O3GagxhRu5uKSeCFwM8
   bTAqFKT8UoCrGY7UYOspdIYqlXk/YHUB+W7iiV+bI9zsa2mKVLWTBwLuU
   5KzVMNbGvu6+9yXs9/eyRAmrKWb5yJD+9N5obtIoh+6xiwWdeyl1pSsvu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="413057"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="413057"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 05:49:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="728242"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Feb 2024 05:49:31 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWzLk-0000ZE-0U;
	Mon, 05 Feb 2024 13:49:28 +0000
Date: Mon, 5 Feb 2024 21:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2536/2999] kernel/sched/fair.c:314:36: error:
 'hundred_thousand' undeclared here (not in a function)
Message-ID: <202402052121.E2UkGTnd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   90577e059749e400dd367f89398a3f60a35ab887
commit: f7c232d3e20a69b46e53da221ba3cbac0fa68a0d [2536/2999] smart_grid: introduce smart_grid_strategy_ctrl sysctl
config: loongarch-randconfig-001-20240205 (https://download.01.org/0day-ci/archive/20240205/202402052121.E2UkGTnd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402052121.E2UkGTnd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402052121.E2UkGTnd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:314:36: error: 'hundred_thousand' undeclared here (not in a function)
     314 |                 .extra2         = &hundred_thousand,
         |                                    ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7104:6: warning: no previous prototype for 'free_affinity_domains' [-Wmissing-prototypes]
    7104 | void free_affinity_domains(struct affinity_domain *ad)
         |      ^~~~~~~~~~~~~~~~~~~~~


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
