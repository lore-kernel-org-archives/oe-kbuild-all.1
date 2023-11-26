Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFE7D277
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9OA7A23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701038419; x=1732574419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6sQ5T61ArTeUid8v4BFWUdAxnto6NGVslgQpPs9ZmqY=;
  b=f9OA7A23SAkbVBoyz44eTaS/0nkIPc2rvRGWA2/NNJ1uuEaHt3x+6INZ
   sRC/7MVWNthqmAZUQbjUqnDhJ7gh9RPE487i4veZNapYxT0uAuaJggx5v
   yvq90jcEoYfjEB2bTD48l2hc9A7k65PnXX63iOIMQUmmkfEawWWKRu0jO
   i9MKQHZ1jylgsxvSWC00RHbM0XbI5W3mTs5M8+GHHMeOGTiNSNzxHmEqO
   J9Ph0KniMahwsBljzpYJYxN2sKeJaq0f4ZRRquF6eYZlBIsMrFvcqmbvG
   07trrJe2oUHkOUCH+noNdEr5PlKJi0enOichQ6croDruzSmcA/KYQi96S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="478802403"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="478802403"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 14:40:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="16123248"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2023 14:40:18 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7NnT-0005ad-2E;
	Sun, 26 Nov 2023 22:40:15 +0000
Date: Mon, 27 Nov 2023 06:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 9/11]
 kernel/sched/fair.c:6627:44: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202311270348.MrRLJtQ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   08e786e9ed2872cba5830c16cd1bf55b475feb22
commit: 86ec485f249360a80bc9baccebedc120b9f5347e [9/11] sched/uclamp: Remove rq max aggregation
config: x86_64-randconfig-123-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270348.MrRLJtQ2-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311270348.MrRLJtQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270348.MrRLJtQ2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1158:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1158:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:1158:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1195:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1195:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1195:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:2966:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/fair.c:2966:13: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:2966:13: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:12271:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12271:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12271:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5876:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5876:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5876:22: sparse:    struct task_struct *
   kernel/sched/fair.c:7908:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7908:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7908:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8087:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8087:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8087:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8186:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8186:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8186:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8467:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8467:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8467:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9458:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9458:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9458:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10095:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10095:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10095:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11531:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11531:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11531:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11188:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11188:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11188:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11627:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11627:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11627:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:2912:9: sparse: sparse: context imbalance in 'task_numa_placement' - different lock contexts for basic block
   kernel/sched/fair.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> kernel/sched/fair.c:6627:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6627:44: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:6627:44: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7147:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7147:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7147:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7153:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7153:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7153:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7160:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7160:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7160:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7168:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7168:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7168:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2259:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2091:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2091:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct *

vim +6627 kernel/sched/fair.c

  6623	
  6624	#ifdef CONFIG_SMP
  6625	static inline bool cpu_overutilized(int cpu)
  6626	{
> 6627		struct task_struct *p = cpu_rq(cpu)->curr;
  6628		unsigned long util_min = uclamp_eff_value(p, UCLAMP_MIN);
  6629		unsigned long util_max = uclamp_eff_value(p, UCLAMP_MAX);
  6630	
  6631		/*
  6632		 * Return true only if the utilization doesn't fit CPU's capacity
  6633		 *
  6634		 * TODO: this definition of overutilized = misfit() is stale and no
  6635		 * longer fit for purpose and must be updated to reflect when the
  6636		 * system or a cluster is truly overloaded.
  6637		 */
  6638		return !util_fits_cpu(cpu_util_cfs(cpu), util_min, util_max, cpu);
  6639	}
  6640	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
