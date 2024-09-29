Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5984626AD9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 23:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727651302; cv=none; b=q3zxvoSIfLWoBu9qFqGjEI/heWFOGLxYOSe6tRv32jo/68/9JWmGRLCQrh6MfC8T9LwhN2+BiFEhAmD/YV3gqhkd92Eqm10pCT7EGSZPV+eigQBscgAbYs4Ojc9+mUbMMsCRciJ8XURHnGHudhce1+5nhyi/QPYMDRAAlO8kY4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727651302; c=relaxed/simple;
	bh=xN/UEuGfqrsJgb1vGSBj/tdrW/XiraN5nJHw250NP54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sWXxpKi0HUICI3IsfSFNoVN1j87B/bHC3NdoM5W8FP1Y+983amReP5JMsrtY9utWPARpdZcayaDVQiXv5sKgv0Hq2GAGtAAGpEYmk5uqvWJGqEwwp3oWY7Uo55sQOOshlcI+Uy5+qChrfOJcZPzZZ3XpnESRh8Gk6XhsXkY9/bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zwc54iyL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zwc54iyL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727651300; x=1759187300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xN/UEuGfqrsJgb1vGSBj/tdrW/XiraN5nJHw250NP54=;
  b=Zwc54iyLOwhx4Pm8yJK/eeBFRzGm7xDuOWlMEyf3gBMohJV5Ly855H7z
   UtQSFALS+DNLh1lQdZYee+dXFtDgkq3UhxXWHrO5lUIq+4iewAiiqInC6
   EEEd+6cJqhEpms9Yl/hnbNh+Beyz5qa5T71qQm8OC9nowSC3cS8I7i8Bz
   gLjpnoi/5Lje2eVFqQ1ulIbfpq9FhzpchyHzto1gK7wQU+2j4BlJAyAD6
   MoPnUkvYhGhcsn3MoE9dqgeOfZenhcZKz6oETCNEPHAA/OPeoMZlZ2zhh
   QmFqw0Sso6E0F9KoX3ECzkR+nnSvaFk5f7zFYZMCW1x9xHhMdjFr5KKgl
   A==;
X-CSE-ConnectionGUID: lEpmk/3UQnKos923pWK/EQ==
X-CSE-MsgGUID: 7dErBaypR6+FvrwppcWaEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37862914"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="37862914"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 16:08:19 -0700
X-CSE-ConnectionGUID: 5Zh+jAOsQl6Wn+RQoK0r3g==
X-CSE-MsgGUID: RRySeF9dTjyE/Aa0Pjxu8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73254770"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Sep 2024 16:08:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv31T-000OnN-1e;
	Sun, 29 Sep 2024 23:08:15 +0000
Date: Mon, 30 Sep 2024 07:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2552/14244] kernel/sched/fair.c:314:36: error:
 'hundred_thousand' undeclared here (not in a function)
Message-ID: <202409300719.up3kaIm6-lkp@intel.com>
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
head:   91ff8f4b711382909faa289c49735e0514af6f76
commit: f7c232d3e20a69b46e53da221ba3cbac0fa68a0d [2552/14244] smart_grid: introduce smart_grid_strategy_ctrl sysctl
config: loongarch-randconfig-001-20240930 (https://download.01.org/0day-ci/archive/20240930/202409300719.up3kaIm6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300719.up3kaIm6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300719.up3kaIm6-lkp@intel.com/

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
