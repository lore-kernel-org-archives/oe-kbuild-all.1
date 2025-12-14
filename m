Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634842BEC32
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 08:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765702511; cv=none; b=njlfqdpHLzRnR6tcc+wUJR0lWj6PiPXlZjHEUyGpv0Rds00BFT9wd9WixgJzIjdGvMM7SEz90e/QHX8IXYLjbisNSdqriLIlufV2kfNgrHNHgIYxhnN0254XlZIA0BlF4UvxagVqKFO4WvtF0tKsArmqyI5jmgKYqNiylX2luPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765702511; c=relaxed/simple;
	bh=ftHB3Tn9G6YLASCzyd4D3IrEF1mTl1OSQJXd3SoPD7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hJNVhF19QAcXPHnzROXMzG+uGJtNzbfznXbw75Tw3L88a7Zx1gaCfX2R6zc7DOSPDNlQI0q4GSEzO9c+lPsPLPPlriBdCf9iIyRYy+H2bySdkn+8ZDKDw49ocg8mGwKDrybqYw/3C8oJ4SpHWAXuBY9h0TjQU1bTKWNGEm2G3J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1HEvnCr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1HEvnCr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765702508; x=1797238508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ftHB3Tn9G6YLASCzyd4D3IrEF1mTl1OSQJXd3SoPD7M=;
  b=D1HEvnCr0rAHu698yrJH6gzUXjvN3kKAidx9RdddreqcaWA45r5eEn7r
   qLMVVSLLaL1zE5ujFil980oXJu+AdYfwAlbkkbvTcDH4v0nj7xkSEr9by
   pJaGh9KeZiprVSl02I+apj6rpBkODbq2LxjaN60Dp/v+NiPOD2xxXK4Vq
   HObigDSTc5fj/E9Fa1JWXtkvMT3sFeAGr5iRD0q8Wtd0fGyeJzIj9htZ5
   Rc+AjDaY4DoYQGfmVHWvy4Ygrjy+lSWD71aonKpjIAcgv5zFg8ekbJAss
   cFTEHmwYs2wU8gMpxXJtBxpVJ0SqltLs17KBWt5hIv3ZvWwGOYc7d8nn6
   g==;
X-CSE-ConnectionGUID: HtwHIEeDTx+sWIq96CXpcA==
X-CSE-MsgGUID: oFWFxwhMTvCSAbl6ThfNcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85229628"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="85229628"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 00:55:03 -0800
X-CSE-ConnectionGUID: lnU96sfIQp6E8HenQGAyJg==
X-CSE-MsgGUID: 5Nf2q+tsSU+ZBfTHcxIG9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202563274"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Dec 2025 00:55:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUhsZ-000000008tP-1COl;
	Sun, 14 Dec 2025 08:54:59 +0000
Date: Sun, 14 Dec 2025 16:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] kernel/sched/topology.c:2310:32:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202512141633.L3GKJfV1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 0ccb3f810722de634beed0dc6fe5c59d963b4c50 [3541/3541] sched/topology: Provide cfs_overload_cpus bitmap
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141633.L3GKJfV1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141633.L3GKJfV1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141633.L3GKJfV1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/stop_task.c:73:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/stop_task.c:73:38: sparse:     expected struct task_struct *curr
   kernel/sched/stop_task.c:73:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/topology.c:2310:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected int flags @@     got restricted gfp_t @@
   kernel/sched/topology.c:2310:32: sparse:     expected int flags
   kernel/sched/topology.c:2310:32: sparse:     got restricted gfp_t
>> kernel/sched/topology.c:2318:61: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got int flags @@
   kernel/sched/topology.c:2318:61: sparse:     expected restricted gfp_t [usertype] flags
   kernel/sched/topology.c:2318:61: sparse:     got int flags
   kernel/sched/topology.c:2346:58: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2346:58: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2346:58: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:491:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:491:19: sparse:     expected struct perf_domain *pd
   kernel/sched/topology.c:491:19: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:655:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:655:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:655:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:702:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:702:9: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/topology.c:702:9: sparse:    struct sparsemask *
   kernel/sched/topology.c:730:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:730:50: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:730:50: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:738:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:738:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:738:55: sparse:     got struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:751:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:751:29: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:751:29: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:756:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:756:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:756:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:777:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:777:13: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:777:13: sparse:     got struct sched_domain [noderef] __rcu *sd
   kernel/sched/topology.c:939:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:939:70: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:939:70: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:968:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:968:59: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:968:59: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1014:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1014:57: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1014:57: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1016:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1016:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1016:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1024:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1024:55: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1024:55: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1026:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1026:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1026:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1096:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1096:62: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1096:62: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1200:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1200:40: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:1200:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1620:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1620:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1620:43: sparse:     got struct sched_domain *child
   kernel/sched/topology.c:1758:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:1758:21: sparse:    int [noderef] __rcu *
   kernel/sched/topology.c:1758:21: sparse:    int *
   kernel/sched/topology.c:1884:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:1884:9: sparse:    int [noderef] __rcu *
   kernel/sched/topology.c:1884:9: sparse:    int *
   kernel/sched/topology.c:1939:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:1939:9: sparse:    struct cpumask **[noderef] __rcu *
   kernel/sched/topology.c:1939:9: sparse:    struct cpumask ***
   kernel/sched/topology.c:1997:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:1997:9: sparse:    int [noderef] __rcu *
   kernel/sched/topology.c:1997:9: sparse:    int *
   kernel/sched/topology.c:1999:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:1999:9: sparse:    struct cpumask **[noderef] __rcu *
   kernel/sched/topology.c:1999:9: sparse:    struct cpumask ***
   kernel/sched/topology.c:2083:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:2083:17: sparse:    struct cpumask **[noderef] __rcu *
   kernel/sched/topology.c:2083:17: sparse:    struct cpumask ***
   kernel/sched/topology.c:2150:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:2150:19: sparse:    struct cpumask **[noderef] __rcu *
   kernel/sched/topology.c:2150:19: sparse:    struct cpumask ***
   kernel/sched/topology.c:2190:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:2190:17: sparse:    struct cpumask **[noderef] __rcu *
   kernel/sched/topology.c:2190:17: sparse:    struct cpumask ***
   kernel/sched/topology.c:2386:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2386:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2386:31: sparse:     got struct sched_domain *sd
   kernel/sched/topology.c:2489:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2489:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2489:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2510:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:2510:56: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:2510:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:2509:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2509:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2509:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2564:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2564:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2564:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:1853:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1853:9: sparse:     expected struct sched_domain *[assigned] sd

vim +2310 kernel/sched/topology.c

  2304	
  2305	static int sd_llc_alloc(struct sched_domain *sd)
  2306	{
  2307		struct sched_domain_shared *sds = sd->shared;
  2308		struct cpumask *span = sched_domain_span(sd);
  2309		int nid = cpu_to_node(cpumask_first(span));
> 2310		int flags = __GFP_ZERO | GFP_KERNEL;
  2311		struct sparsemask *mask;
  2312	
  2313		/*
  2314		 * Allocate the bitmap if not already allocated.  This is called for
  2315		 * every CPU in the LLC but only allocates once per sd_llc_shared.
  2316		 */
  2317		if (!sds->cfs_overload_cpus) {
> 2318			mask = sparsemask_alloc_node(nr_cpu_ids, 3, flags, nid);
  2319			if (!mask)
  2320				return 1;
  2321			sds->cfs_overload_cpus = mask;
  2322		}
  2323	
  2324		return 0;
  2325	}
  2326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
