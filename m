Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F7313B791
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730565048; cv=none; b=sqLSA0/2z0u74lzWc4L5e1YbB/BlwVHl05oEw+CjuO88ep8RcLUfD3JkT8BEKag9ul9kFkrhanPH1GpyUZXvKWqvLdeEgLncCCRxM+jtah2fHe6/l3QEuArpH9uArs6EelheE5P8/gx+MoFMj9zgv4J1eDsCLSkmG8XqiQqjsB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730565048; c=relaxed/simple;
	bh=8DssGYshoyJ48LFZlr0D/BbMtPUzC+tBWOnW55CtlDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/hBY02BC+1R8C35uqngxEN8uyr0jXq+FBE7EXIidbHqL/wth51a0MTEsyN9N1YASqvuu74cqSvoiYQOBaTdKtNuG/Zk8kURpVCYQFqKEhch5N43v4S4h1h3umk0vZgARIFxCEbEtiU0SOFuKLsgs4/vKBCeWFdhYHNxBFjFGH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJ9GQ0OK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJ9GQ0OK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730565046; x=1762101046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8DssGYshoyJ48LFZlr0D/BbMtPUzC+tBWOnW55CtlDI=;
  b=KJ9GQ0OKSAZg6uCINSI8lIhXxh56+T+9aQm8VsMLWEjPgpInPsKMrHqt
   4aNDA2gi5rgTQuGanHlZCePT+0JkWmd2F5lw8JQrnq9BxvuBU3o5AkoAj
   I5Jww7ZJUSrA8BY5sG1Bv4n/Ykr/Bq8VqptoSfeWQ1Big1vIR+eGco/S5
   pbW4DemcdKk4MfIiLf325fSyykTo0b0drWJwUux0RylNUoTAxpztamhXC
   MYMwIM18vWCrGap5VayQZ7hCeZsgHl4I5Un7nKOW6tXI7TwgcgbARcf3O
   5TVuGSbUtahDajXayZVfnw3P7YhUjIEY8Uw1IOZRl3W+zTsWkXJLrRWmt
   g==;
X-CSE-ConnectionGUID: YR/O247iQsK0fIXXFb5E5Q==
X-CSE-MsgGUID: /OjPaD1KSHCnMAnac+6Ylw==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="33153217"
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="33153217"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 09:30:45 -0700
X-CSE-ConnectionGUID: W5WmHDyJRJWOqOTKM4Q+Eg==
X-CSE-MsgGUID: mHrA7EDCRQiXhY78e20z9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="83693402"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Nov 2024 09:30:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7H1O-000jA1-0R;
	Sat, 02 Nov 2024 16:30:42 +0000
Date: Sun, 3 Nov 2024 00:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: 'Guanjun' <guanjun@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v1 1/2] genirq/affinity: add support for limiting
 managed interrupts
Message-ID: <202411030019.Ho11gGvG-lkp@intel.com>
References: <20241031074618.3585491-2-guanjun@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031074618.3585491-2-guanjun@linux.alibaba.com>

Hi 'Guanjun',

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on axboe-block/for-next mszeredi-fuse/for-next tip/smp/core linus/master v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guanjun/genirq-affinity-add-support-for-limiting-managed-interrupts/20241031-154824
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20241031074618.3585491-2-guanjun%40linux.alibaba.com
patch subject: [PATCH RFC v1 1/2] genirq/affinity: add support for limiting managed interrupts
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20241103/202411030019.Ho11gGvG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030019.Ho11gGvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030019.Ho11gGvG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/group_cpus.c:480:17: error: conflicting types for 'group_cpus_evenly'; have 'struct cpumask *(unsigned int)'
     480 | struct cpumask *group_cpus_evenly(unsigned int numgrps)
         |                 ^~~~~~~~~~~~~~~~~
   In file included from lib/group_cpus.c:10:
   include/linux/group_cpus.h:12:17: note: previous declaration of 'group_cpus_evenly' with type 'struct cpumask *(unsigned int,  bool)' {aka 'struct cpumask *(unsigned int,  _Bool)'}
      12 | struct cpumask *group_cpus_evenly(unsigned int numgrps, bool is_managed);
         |                 ^~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from lib/group_cpus.c:6:
   lib/group_cpus.c:492:19: error: conflicting types for 'group_cpus_evenly'; have 'struct cpumask *(unsigned int)'
     492 | EXPORT_SYMBOL_GPL(group_cpus_evenly);
         |                   ^~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   lib/group_cpus.c:492:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     492 | EXPORT_SYMBOL_GPL(group_cpus_evenly);
         | ^~~~~~~~~~~~~~~~~
   include/linux/group_cpus.h:12:17: note: previous declaration of 'group_cpus_evenly' with type 'struct cpumask *(unsigned int,  bool)' {aka 'struct cpumask *(unsigned int,  _Bool)'}
      12 | struct cpumask *group_cpus_evenly(unsigned int numgrps, bool is_managed);
         |                 ^~~~~~~~~~~~~~~~~


vim +480 lib/group_cpus.c

f7b3ea8cf72f3d Ming Lei    2022-12-27  379  
f7b3ea8cf72f3d Ming Lei    2022-12-27  380  /**
f7b3ea8cf72f3d Ming Lei    2022-12-27  381   * group_cpus_evenly - Group all CPUs evenly per NUMA/CPU locality
f7b3ea8cf72f3d Ming Lei    2022-12-27  382   * @numgrps: number of groups
59cfa36232b76f Guanjun     2024-10-31  383   * @is_managed: if these groups managed by kernel
f7b3ea8cf72f3d Ming Lei    2022-12-27  384   *
f7b3ea8cf72f3d Ming Lei    2022-12-27  385   * Return: cpumask array if successful, NULL otherwise. And each element
f7b3ea8cf72f3d Ming Lei    2022-12-27  386   * includes CPUs assigned to this group
f7b3ea8cf72f3d Ming Lei    2022-12-27  387   *
f7b3ea8cf72f3d Ming Lei    2022-12-27  388   * Try to put close CPUs from viewpoint of CPU and NUMA locality into
f7b3ea8cf72f3d Ming Lei    2022-12-27  389   * same group, and run two-stage grouping:
f7b3ea8cf72f3d Ming Lei    2022-12-27  390   *	1) allocate present CPUs on these groups evenly first
f7b3ea8cf72f3d Ming Lei    2022-12-27  391   *	2) allocate other possible CPUs on these groups evenly
f7b3ea8cf72f3d Ming Lei    2022-12-27  392   *
f7b3ea8cf72f3d Ming Lei    2022-12-27  393   * We guarantee in the resulted grouping that all CPUs are covered, and
f7b3ea8cf72f3d Ming Lei    2022-12-27  394   * no same CPU is assigned to multiple groups
f7b3ea8cf72f3d Ming Lei    2022-12-27  395   */
59cfa36232b76f Guanjun     2024-10-31  396  struct cpumask *group_cpus_evenly(unsigned int numgrps, bool is_managed)
f7b3ea8cf72f3d Ming Lei    2022-12-27  397  {
f7b3ea8cf72f3d Ming Lei    2022-12-27  398  	unsigned int curgrp = 0, nr_present = 0, nr_others = 0;
f7b3ea8cf72f3d Ming Lei    2022-12-27  399  	cpumask_var_t *node_to_cpumask;
f7b3ea8cf72f3d Ming Lei    2022-12-27  400  	cpumask_var_t nmsk, npresmsk;
f7b3ea8cf72f3d Ming Lei    2022-12-27  401  	int ret = -ENOMEM;
f7b3ea8cf72f3d Ming Lei    2022-12-27  402  	struct cpumask *masks = NULL;
f7b3ea8cf72f3d Ming Lei    2022-12-27  403  
f7b3ea8cf72f3d Ming Lei    2022-12-27  404  	if (!zalloc_cpumask_var(&nmsk, GFP_KERNEL))
f7b3ea8cf72f3d Ming Lei    2022-12-27  405  		return NULL;
f7b3ea8cf72f3d Ming Lei    2022-12-27  406  
f7b3ea8cf72f3d Ming Lei    2022-12-27  407  	if (!zalloc_cpumask_var(&npresmsk, GFP_KERNEL))
f7b3ea8cf72f3d Ming Lei    2022-12-27  408  		goto fail_nmsk;
f7b3ea8cf72f3d Ming Lei    2022-12-27  409  
f7b3ea8cf72f3d Ming Lei    2022-12-27  410  	node_to_cpumask = alloc_node_to_cpumask();
f7b3ea8cf72f3d Ming Lei    2022-12-27  411  	if (!node_to_cpumask)
f7b3ea8cf72f3d Ming Lei    2022-12-27  412  		goto fail_npresmsk;
f7b3ea8cf72f3d Ming Lei    2022-12-27  413  
f7b3ea8cf72f3d Ming Lei    2022-12-27  414  	masks = kcalloc(numgrps, sizeof(*masks), GFP_KERNEL);
f7b3ea8cf72f3d Ming Lei    2022-12-27  415  	if (!masks)
f7b3ea8cf72f3d Ming Lei    2022-12-27  416  		goto fail_node_to_cpumask;
f7b3ea8cf72f3d Ming Lei    2022-12-27  417  
f7b3ea8cf72f3d Ming Lei    2022-12-27  418  	build_node_to_cpumask(node_to_cpumask);
f7b3ea8cf72f3d Ming Lei    2022-12-27  419  
0263f92fadbb9d Ming Lei    2023-11-20  420  	/*
0263f92fadbb9d Ming Lei    2023-11-20  421  	 * Make a local cache of 'cpu_present_mask', so the two stages
0263f92fadbb9d Ming Lei    2023-11-20  422  	 * spread can observe consistent 'cpu_present_mask' without holding
0263f92fadbb9d Ming Lei    2023-11-20  423  	 * cpu hotplug lock, then we can reduce deadlock risk with cpu
0263f92fadbb9d Ming Lei    2023-11-20  424  	 * hotplug code.
0263f92fadbb9d Ming Lei    2023-11-20  425  	 *
0263f92fadbb9d Ming Lei    2023-11-20  426  	 * Here CPU hotplug may happen when reading `cpu_present_mask`, and
0263f92fadbb9d Ming Lei    2023-11-20  427  	 * we can live with the case because it only affects that hotplug
0263f92fadbb9d Ming Lei    2023-11-20  428  	 * CPU is handled in the 1st or 2nd stage, and either way is correct
0263f92fadbb9d Ming Lei    2023-11-20  429  	 * from API user viewpoint since 2-stage spread is sort of
0263f92fadbb9d Ming Lei    2023-11-20  430  	 * optimization.
0263f92fadbb9d Ming Lei    2023-11-20  431  	 */
0263f92fadbb9d Ming Lei    2023-11-20  432  	cpumask_copy(npresmsk, data_race(cpu_present_mask));
0263f92fadbb9d Ming Lei    2023-11-20  433  
59cfa36232b76f Guanjun     2024-10-31  434  	/* Limit the count of managed interrupts on every node */
59cfa36232b76f Guanjun     2024-10-31  435  	if (is_managed && managed_irqs_per_node)
59cfa36232b76f Guanjun     2024-10-31  436  		__group_prepare_affinity(npresmsk, node_to_cpumask);
59cfa36232b76f Guanjun     2024-10-31  437  
f7b3ea8cf72f3d Ming Lei    2022-12-27  438  	/* grouping present CPUs first */
f7b3ea8cf72f3d Ming Lei    2022-12-27  439  	ret = __group_cpus_evenly(curgrp, numgrps, node_to_cpumask,
0263f92fadbb9d Ming Lei    2023-11-20  440  				  npresmsk, nmsk, masks);
f7b3ea8cf72f3d Ming Lei    2022-12-27  441  	if (ret < 0)
f7b3ea8cf72f3d Ming Lei    2022-12-27  442  		goto fail_build_affinity;
f7b3ea8cf72f3d Ming Lei    2022-12-27  443  	nr_present = ret;
f7b3ea8cf72f3d Ming Lei    2022-12-27  444  
f7b3ea8cf72f3d Ming Lei    2022-12-27  445  	/*
f7b3ea8cf72f3d Ming Lei    2022-12-27  446  	 * Allocate non present CPUs starting from the next group to be
f7b3ea8cf72f3d Ming Lei    2022-12-27  447  	 * handled. If the grouping of present CPUs already exhausted the
f7b3ea8cf72f3d Ming Lei    2022-12-27  448  	 * group space, assign the non present CPUs to the already
f7b3ea8cf72f3d Ming Lei    2022-12-27  449  	 * allocated out groups.
f7b3ea8cf72f3d Ming Lei    2022-12-27  450  	 */
f7b3ea8cf72f3d Ming Lei    2022-12-27  451  	if (nr_present >= numgrps)
f7b3ea8cf72f3d Ming Lei    2022-12-27  452  		curgrp = 0;
f7b3ea8cf72f3d Ming Lei    2022-12-27  453  	else
f7b3ea8cf72f3d Ming Lei    2022-12-27  454  		curgrp = nr_present;
0263f92fadbb9d Ming Lei    2023-11-20  455  	cpumask_andnot(npresmsk, cpu_possible_mask, npresmsk);
f7b3ea8cf72f3d Ming Lei    2022-12-27  456  	ret = __group_cpus_evenly(curgrp, numgrps, node_to_cpumask,
f7b3ea8cf72f3d Ming Lei    2022-12-27  457  				  npresmsk, nmsk, masks);
f7b3ea8cf72f3d Ming Lei    2022-12-27  458  	if (ret >= 0)
f7b3ea8cf72f3d Ming Lei    2022-12-27  459  		nr_others = ret;
f7b3ea8cf72f3d Ming Lei    2022-12-27  460  
f7b3ea8cf72f3d Ming Lei    2022-12-27  461   fail_build_affinity:
f7b3ea8cf72f3d Ming Lei    2022-12-27  462  	if (ret >= 0)
f7b3ea8cf72f3d Ming Lei    2022-12-27  463  		WARN_ON(nr_present + nr_others < numgrps);
f7b3ea8cf72f3d Ming Lei    2022-12-27  464  
f7b3ea8cf72f3d Ming Lei    2022-12-27  465   fail_node_to_cpumask:
f7b3ea8cf72f3d Ming Lei    2022-12-27  466  	free_node_to_cpumask(node_to_cpumask);
f7b3ea8cf72f3d Ming Lei    2022-12-27  467  
f7b3ea8cf72f3d Ming Lei    2022-12-27  468   fail_npresmsk:
f7b3ea8cf72f3d Ming Lei    2022-12-27  469  	free_cpumask_var(npresmsk);
f7b3ea8cf72f3d Ming Lei    2022-12-27  470  
f7b3ea8cf72f3d Ming Lei    2022-12-27  471   fail_nmsk:
f7b3ea8cf72f3d Ming Lei    2022-12-27  472  	free_cpumask_var(nmsk);
f7b3ea8cf72f3d Ming Lei    2022-12-27  473  	if (ret < 0) {
f7b3ea8cf72f3d Ming Lei    2022-12-27  474  		kfree(masks);
f7b3ea8cf72f3d Ming Lei    2022-12-27  475  		return NULL;
f7b3ea8cf72f3d Ming Lei    2022-12-27  476  	}
f7b3ea8cf72f3d Ming Lei    2022-12-27  477  	return masks;
f7b3ea8cf72f3d Ming Lei    2022-12-27  478  }
188a569658584e Ingo Molnar 2023-01-18  479  #else /* CONFIG_SMP */
f7b3ea8cf72f3d Ming Lei    2022-12-27 @480  struct cpumask *group_cpus_evenly(unsigned int numgrps)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
