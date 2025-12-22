Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8742FF140
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 21:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766439252; cv=none; b=YH9bC1mAxMAA5P4M3WDQ/GRjho+iURC1VPo5CLmS5jrDSV+ERj+15FGdnP9ruedZEyQCOFH54PPKnVnAkdIx2tPzU4/C9L80uVyEAsmANKPfqf2Xc75lpQvrOGqPucnZrQZrFzKXWjpKYRdxzeB7SorSPLLcXkkt6d80yAiJScA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766439252; c=relaxed/simple;
	bh=IRrqSXX93TY3E8wWhnelxofA/wpF2JvHaz0kEo5Sj5o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fTHyNfi6yHNdjgz8tI3ctMRNI7LgjYT7lOoBfjnEc20FDdz3/oU8HuvNcqvzTTv1QvVGIpS3LNP7Rk7pZvYuXSkpNeWBizinOMQzETqoTVorLukrVObfFhxE/TUJqwn5kelR4MhemRsrCLEHQ2o/NtQyU2c4pzn6g+TpoyBBuX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eynebLA2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eynebLA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766439250; x=1797975250;
  h=date:from:to:cc:subject:message-id;
  bh=IRrqSXX93TY3E8wWhnelxofA/wpF2JvHaz0kEo5Sj5o=;
  b=eynebLA2w2wTfgszf6EdkzY2wa6swrEP4qvH2aZqIoi8raNW2nkCZgfN
   R+J+utWV34ZHOqUk/IPa79SFpCBT9dkudiKIbxwvDEhEclUhRgjBb2Q/2
   9BOn0hFtL1AX3KOuBmWGOrRKLcpz5zW0rRutFFtjXvDPo/Vvr0hAFf88o
   uiIyG65kAtnhT7o2+5HMBV8tt+o5Tl7xZUpyCHEPUWHoZDmSRygtIPGOv
   Rozd2OtR6P95H3qZh2lx+VoxQq6MhnqEomXZ+qKtp3oPoiUELx3QR7/4+
   x3AXKS+88cED1p8d2EicJbFRlZ3aCG8D1dpPWwwiUmU003rwgKZfP5In+
   g==;
X-CSE-ConnectionGUID: kWpSeWOhQ0y4tizpDWbq/A==
X-CSE-MsgGUID: +/pdDSyERqanNChMi0pogg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79414145"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="79414145"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 13:34:07 -0800
X-CSE-ConnectionGUID: PVLw/SMySOm7kDPBp7zdVg==
X-CSE-MsgGUID: ++ZDYUDzS3CFrFuEn7XVBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199925893"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2025 13:34:05 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXnXW-00000000195-25cb;
	Mon, 22 Dec 2025 21:34:02 +0000
Date: Tue, 23 Dec 2025 05:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541]
 kernel/sched/topology.c:2310:32: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202512230528.roqd2yzx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: 0ccb3f810722de634beed0dc6fe5c59d963b4c50 [3541/3541] sched/topology: Provide cfs_overload_cpus bitmap
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251223/202512230528.roqd2yzx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230528.roqd2yzx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230528.roqd2yzx-lkp@intel.com/

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
