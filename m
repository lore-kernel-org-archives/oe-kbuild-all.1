Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFA7282F32
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 13:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764432; cv=none; b=F5RtdkGNtkdg/DuOfqMhVAoApGhY4LDtnKlL2r55yL0qxQtBeyp/ptG6pqcuMmzKDHIYsxcn/X5x3IPDk2T+knR2PVtPTLx1MvNgOvln/gD43v1Xs/lh6O4XLXLoHpDB029x223Q/EuJfX7mIb6r3Zt8xvf3rpuTrZSd+VuWl2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764432; c=relaxed/simple;
	bh=8e/QWHgXbzt2rpxv+cErxzFQDOQZvF7S+gXWCgHv7D0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KRhQgd0JFMuznNKdcsUDdvEB0nzHbcMaNf1TD7iOe/XGcpY20NQVIw+K9F2N2Rc8gWtNha1dT1rlwigEMWsjx8ZKPvCHVh86yDPHFZAOFkpvHDZvo7ouyJnQiFNtm90ntXk4Yq9T2mLrU7QNns8/O/UN4/RC51pLhr5aemfbH/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dC+l1m7/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dC+l1m7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778764429; x=1810300429;
  h=date:from:to:cc:subject:message-id;
  bh=8e/QWHgXbzt2rpxv+cErxzFQDOQZvF7S+gXWCgHv7D0=;
  b=dC+l1m7/F0sQQwkpX7rOIXu/cIwUUYBajvP7Pbf3S2rcN8fv0rc8X4x7
   HhCDar1TgUp9lKeioKxiH5RDiN+HzSHOC1FkRNSlx1/BW0U/DdA/S9+79
   yFFIF9FThShi6KZ8gSPiS5ZQpsjiXkwc5wxUXrq2nKM1sVzJcrpDFBITK
   EX2T1PgU3r8h1TJazquileCgvNx1fgkdS9SkdgI4cHxgXAzurXpet1qZ1
   wJ3w1J7te/DtNJNHdb00pAT4hGUMnGYvmXu3xVzLtaDmAZYxdjs//h95T
   twjWuPnBks28vK0bgfSV9ci0b+GgfrUyWbEFlpFCj50FmhzqjLYI8ASGY
   w==;
X-CSE-ConnectionGUID: buZmIigCR32gzawmqICXJg==
X-CSE-MsgGUID: iz25Yg9LRgG4Adjk0uDFnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="105164609"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="105164609"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 06:13:49 -0700
X-CSE-ConnectionGUID: 7YlaaMHbQLOKhGV67wS1uw==
X-CSE-MsgGUID: Ia/u8RxsQmuoOb/5LeTr4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="237516882"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 May 2026 06:13:47 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNVsl-000000006aR-2QyV;
	Thu, 14 May 2026 13:13:43 +0000
Date: Thu, 14 May 2026 21:13:09 +0800
From: kernel test robot <lkp@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>,
 Andrea Righi <arighi@nvidia.com>
Subject: [peterz-queue:sched/core 6/9]
 kernel/sched/topology.c:2705:25: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202605142117.gyxGm7SY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   238b6f2b3a4948ca7048025a15874b2c253a34bf
commit: c3d608e99c540bb4a68f31a1e0dffa7af2827216 [6/9] sched/fair: Attach sched_domain_shared to sd_asym_cpucapacity
config: nios2-randconfig-r123-20260514 (https://download.01.org/0day-ci/archive/20260514/202605142117.gyxGm7SY-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142117.gyxGm7SY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605142117.gyxGm7SY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/debug.c:730:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:730:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/debug.c:730:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/debug.c:1071:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:1071:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:1071:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/debug.c:1071:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:1071:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:1071:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/topology.c:116:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:116:56: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:116:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:135:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:135:60: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:135:60: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:158:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:158:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:158:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:468:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:468:19: sparse:     expected struct perf_domain *pd
   kernel/sched/topology.c:468:19: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:643:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:643:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:643:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:746:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:746:50: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:746:50: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:761:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:761:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:761:55: sparse:     got struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:774:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:774:29: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:774:29: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:779:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:779:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:779:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:800:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:800:13: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:800:13: sparse:     got struct sched_domain [noderef] __rcu *sd
   kernel/sched/topology.c:964:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:964:70: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:964:70: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:993:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:993:59: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:993:59: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1039:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1039:57: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1039:57: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1041:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1041:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1041:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1049:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1049:55: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1049:55: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1051:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1051:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1051:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1121:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1121:62: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1121:62: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1225:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1225:40: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:1225:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1361:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1361:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:1361:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1618:52: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1618:52: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:1618:52: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1728:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1728:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1728:43: sparse:     got struct sched_domain *child
   kernel/sched/topology.c:2522:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2522:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2522:31: sparse:     got struct sched_domain *sd
   kernel/sched/topology.c:2650:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent @@
   kernel/sched/topology.c:2650:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2650:16: sparse:     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent
   kernel/sched/topology.c:2652:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2652:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2652:24: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2657:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2657:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2657:16: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2662:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2662:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2662:24: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/topology.c:2705:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd_asym @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2705:25: sparse:     expected struct sched_domain *[assigned] sd_asym
   kernel/sched/topology.c:2705:25: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2759:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2759:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2759:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2783:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2783:28: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2783:28: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2809:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2809:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2809:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2379:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2379:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2379:25: sparse:    struct task_struct *

vim +2705 kernel/sched/topology.c

  2679	
  2680	/*
  2681	 * For asymmetric CPU capacity, attach sched_domain_shared on the innermost
  2682	 * SD_ASYM_CPUCAPACITY_FULL ancestor of @cpu's base domain when that ancestor is
  2683	 * not an overlapping NUMA-built domain (then LLC should claim shared).
  2684	 *
  2685	 * A CPU may lack any FULL ancestor (e.g., exclusive cpuset symmetric island),
  2686	 * then LLC must claim shared instead.
  2687	 *
  2688	 * Note: SD_ASYM_CPUCAPACITY_FULL is only set when all CPU capacity values
  2689	 * are present in the domain span, so the asym domain we attach to cannot
  2690	 * degenerate into a single-capacity group. The relevant edge cases are instead
  2691	 * covered by the caveats above.
  2692	 *
  2693	 * Return true if this CPU's asym path claimed sd->shared, false otherwise.
  2694	 */
  2695	static bool claim_asym_sched_domain_shared(struct s_data *d, int cpu)
  2696	{
  2697		struct sched_domain *sd = *per_cpu_ptr(d->sd, cpu);
  2698		struct sched_domain *sd_asym;
  2699	
  2700		if (!sd)
  2701			return false;
  2702	
  2703		sd_asym = sd;
  2704		while (sd_asym && !(sd_asym->flags & SD_ASYM_CPUCAPACITY_FULL))
> 2705			sd_asym = sd_asym->parent;
  2706	
  2707		if (!sd_asym || (sd_asym->flags & SD_NUMA))
  2708			return false;
  2709	
  2710		init_sched_domain_shared(d, sd_asym);
  2711		return true;
  2712	}
  2713	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
