Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06A13B798
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 13:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710335993; cv=none; b=UhM8iXLhPyG3OwNNyb41xZXEis7oWzFTsnetagWIYYs8x/HCSoX/LHy6pK4jopnzEix0cI+WQUqK5LbZCLXUixjEaDDhhuEUif+2FFccRaKizilrfUtsf06eQHQXmY6lHN2NWkzKoCm1nrxsjrbrbAr92aBkc1zlFNlntEZ9lBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710335993; c=relaxed/simple;
	bh=I1ddk7O+OA2XLW4qU6qEL2dFOTWG7ySIaifaZqZlMH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bcRXVDJ8hFgjx/OZaMAA7Yg7D1KW96QqkROoPuTvM+JUfxNEQbsAhQQ2sD9LHOepE1UkNuiQotuni8v71Hg4KN+A5KLOqwuJh2EOKDs9clqzQ/jl2Aqle3yy8MZykodscC3S5eJCmv5qwJS/XCFfbH1LdJGtT7fkgqFkD5Yfiuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iohzU/f0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iohzU/f0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710335991; x=1741871991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I1ddk7O+OA2XLW4qU6qEL2dFOTWG7ySIaifaZqZlMH4=;
  b=iohzU/f0Y2R8QUqOl0M6ms57qirkSLn6szFPs2akavLeQ83FckWOjACE
   dDr46oZzVI3q9bu+FKhPkcDG760MDm3+wF6WIea6MKi69zX8dTD/BD/zW
   4N9B9a98lRuYZ49uThC2LRRI1nvNR7SvBer1YZ/fzXvc9X9BvfKLYofE0
   a6ww3Mj76r/CobUHSD/jSWMQv3kM8cEOug/e6FxZFv1Sb7Gn6S3MiDmCe
   Q9pi/jIb6g5YdzM5EJP+ro5fQUaYtUDTxP1PfYpB3RGX2oqV6zNytLXyB
   /YWhnx7U0V1m8NxCKIZ7iiM8HpADmyaGUQcA0LQfjgHxA7XS3GzQTTrx2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8871538"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8871538"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 06:19:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="35043100"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Mar 2024 06:19:49 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkOWI-000COp-1u;
	Wed, 13 Mar 2024 13:19:46 +0000
Date: Wed, 13 Mar 2024 21:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hui Tang <tanghui20@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1812/3958] kernel/sched/fair.c:175:5: sparse:
 sparse: symbol 'sysctl_sched_util_low_pct' was not declared. Should it be
 static?
Message-ID: <202403132127.OaVz6UjY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f066d3699b4816fda2b6f452885b51bd22199c43
commit: 2e1dfc02d115143587ccfee1815ad295763050f2 [1812/3958] sched: Adjust wakeup cpu range according CPU util dynamicly
config: x86_64-randconfig-123-20240313 (https://download.01.org/0day-ci/archive/20240313/202403132127.OaVz6UjY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403132127.OaVz6UjY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403132127.OaVz6UjY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:143:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
   kernel/sched/fair.c:144:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
>> kernel/sched/fair.c:175:5: sparse: sparse: symbol 'sysctl_sched_util_low_pct' was not declared. Should it be static?
   kernel/sched/fair.c:1256:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1256:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1256:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:3039:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/fair.c:3039:13: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:3039:13: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:12740:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12740:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12740:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5891:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5891:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5891:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6633:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6633:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6633:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7964:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7964:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7964:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8258:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8258:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8258:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8367:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8367:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8367:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8587:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8587:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8587:22: sparse:    struct task_struct *
   kernel/sched/fair.c:8941:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8941:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8941:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9934:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9934:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9934:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10571:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10571:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10571:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12012:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12012:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12012:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11669:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11669:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11669:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12108:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12108:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12108:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:2985:9: sparse: sparse: context imbalance in 'task_numa_placement' - different lock contexts for basic block
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *

vim +/sysctl_sched_util_low_pct +175 kernel/sched/fair.c

    64	
    65	/*
    66	 * The initial- and re-scaling of tunables is configurable
    67	 *
    68	 * Options are:
    69	 *
    70	 *   SCHED_TUNABLESCALING_NONE - unscaled, always *1
    71	 *   SCHED_TUNABLESCALING_LOG - scaled logarithmical, *1+ilog(ncpus)
    72	 *   SCHED_TUNABLESCALING_LINEAR - scaled linear, *ncpus
    73	 *
    74	 * (default SCHED_TUNABLESCALING_LOG = *(1+ilog(ncpus))
    75	 */
  > 76	unsigned int sysctl_sched_tunable_scaling = SCHED_TUNABLESCALING_LOG;
    77	
    78	/*
    79	 * Minimal preemption granularity for CPU-bound tasks:
    80	 *
    81	 * (default: 0.75 msec * (1 + ilog(ncpus)), units: nanoseconds)
    82	 */
    83	unsigned int sysctl_sched_base_slice			= 750000ULL;
    84	static unsigned int normalized_sysctl_sched_base_slice	= 750000ULL;
    85	
    86	/*
    87	 * After fork, child runs first. If set to 0 (default) then
    88	 * parent will (try to) run first.
    89	 */
    90	unsigned int sysctl_sched_child_runs_first __read_mostly;
    91	
    92	const_debug unsigned int sysctl_sched_migration_cost	= 500000UL;
    93	
    94	int sched_thermal_decay_shift;
    95	static int __init setup_sched_thermal_decay_shift(char *str)
    96	{
    97		int _shift = 0;
    98	
    99		if (kstrtoint(str, 0, &_shift))
   100			pr_warn("Unable to set scheduler thermal pressure decay shift parameter\n");
   101	
   102		sched_thermal_decay_shift = clamp(_shift, 0, 10);
   103		return 1;
   104	}
   105	__setup("sched_thermal_decay_shift=", setup_sched_thermal_decay_shift);
   106	
   107	#ifdef CONFIG_SMP
   108	/*
   109	 * For asym packing, by default the lower numbered CPU has higher priority.
   110	 */
   111	int __weak arch_asym_cpu_priority(int cpu)
   112	{
   113		return -cpu;
   114	}
   115	
   116	/*
   117	 * The margin used when comparing utilization with CPU capacity.
   118	 *
   119	 * (default: ~20%)
   120	 */
   121	#define fits_capacity(cap, max)	((cap) * 1280 < (max) * 1024)
   122	
   123	/*
   124	 * The margin used when comparing CPU capacities.
   125	 * is 'cap1' noticeably greater than 'cap2'
   126	 *
   127	 * (default: ~5%)
   128	 */
   129	#define capacity_greater(cap1, cap2) ((cap1) * 1024 > (cap2) * 1078)
   130	#endif
   131	
   132	#ifdef CONFIG_QOS_SCHED
   133	
   134	/*
   135	 * To distinguish cfs bw, use QOS_THROTTLED mark cfs_rq->throttled
   136	 * when qos throttled(and cfs bw throttle mark cfs_rq->throttled as 1).
   137	 */
   138	#define QOS_THROTTLED	2
   139	
   140	static DEFINE_PER_CPU_SHARED_ALIGNED(struct list_head, qos_throttled_cfs_rq);
   141	static DEFINE_PER_CPU_SHARED_ALIGNED(struct hrtimer, qos_overload_timer);
   142	static DEFINE_PER_CPU(int, qos_cpu_overload);
   143	unsigned int sysctl_overload_detect_period = 5000;  /* in ms */
   144	unsigned int sysctl_offline_wait_interval = 100;  /* in ms */
   145	static int one_thousand = 1000;
   146	static int hundred_thousand = 100000;
   147	static int unthrottle_qos_cfs_rqs(int cpu);
   148	#endif
   149	
   150	#ifdef CONFIG_CFS_BANDWIDTH
   151	/*
   152	 * Amount of runtime to allocate from global (tg) to local (per-cfs_rq) pool
   153	 * each time a cfs_rq requests quota.
   154	 *
   155	 * Note: in the case that the slice exceeds the runtime remaining (either due
   156	 * to consumption or the quota being specified to be smaller than the slice)
   157	 * we will always only issue the remaining available time.
   158	 *
   159	 * (default: 5 msec, units: microseconds)
   160	 */
   161	static unsigned int sysctl_sched_cfs_bandwidth_slice		= 5000UL;
   162	#endif
   163	
   164	#ifdef CONFIG_NUMA_BALANCING
   165	/* Restrict the NUMA promotion throughput (MB/s) for each target node. */
   166	static unsigned int sysctl_numa_balancing_promote_rate_limit = 65536;
   167	#endif
   168	
   169	#ifdef CONFIG_QOS_SCHED_DYNAMIC_AFFINITY
   170	/*
   171	 * Low utilization threshold for CPU
   172	 *
   173	 * (default: 85%), units: percentage of CPU utilization)
   174	 */
 > 175	int sysctl_sched_util_low_pct = 85;
   176	#endif
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
