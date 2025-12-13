Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8C123A994
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 23:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765669532; cv=none; b=ZGy9UC7GYdumS4Pk4JjMeZhOQeyQ4B4pBHSu/YNlOR9EKz5+YnMmXtXJA9oRIHvRuT6J8sP3zNR5y+PCELtJpCCAfc0RBjMHdXMWhbCKKU8sZ60Uw9Jul5hWRr6Lfwy/ZF5WbGeT0GnVr1D0eFtZAixySif6YK7KBhcyeYODcSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765669532; c=relaxed/simple;
	bh=666TWkGRz09yBXCvvrlve+0TIHxep/uVQeH/5VdPvfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I02tH7dm3Hs8n5g4r+nePlmnVmkKy+8FRCg3N6GakOPObTCuZaYM4NcCwY9a9QMt1WbmSrWO+YqtYB1G0GOow3EfxLKDy7pXUBIs9C1WiUgvhjrDObm3iR4eCcTSRYiQVBf3cfxpv5bllzuaPNrfF57A8Y6EbUC4yQF4tMdllHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVxNVGs5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVxNVGs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765669531; x=1797205531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=666TWkGRz09yBXCvvrlve+0TIHxep/uVQeH/5VdPvfw=;
  b=MVxNVGs5Cqb4EpoCR1L4b5yHEgfs5xLbyC6H0IJjAWxPO8GdqeI5bg8D
   FwqBcy4IUKz/m8YxEqHsN8JRDcVwunAUclQojLRSlpAD/9ojg2IwypfCG
   SvrZzi11Acm/MG5WGGOV6gxquamYH8fNrPK6Z/h6TVGw1GMsfG4zPlZhu
   0nQtjNPYlSplBYqGCz/ldjl8khIofXiP1lHFYts+zFiSm8DqLXCPgOJ/w
   9UQDsPRGeOc4k+s5ZWXj/q/iA8DvbkdYImOx7tKzgvc2Q9vxfKHmugHQL
   9hARfc02tieF1pPv6XofmIgFFr0gmsQhQ48HxfGb7ck8yzk4J1Z1oeu3p
   w==;
X-CSE-ConnectionGUID: SZ03tv5+RQ6UeF2ZpsILsA==
X-CSE-MsgGUID: uM4Bs7/kRWiQkCqANvz0wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71254500"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="71254500"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 15:45:31 -0800
X-CSE-ConnectionGUID: PMebISvgT8CMb35n3q1xcw==
X-CSE-MsgGUID: a8ATQOUnRBmRnwtDAyRg5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197295606"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 15:45:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUZIk-000000008Kd-3OBr;
	Sat, 13 Dec 2025 23:45:26 +0000
Date: Sun, 14 Dec 2025 07:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hui Tang <tanghui20@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] kernel/sched/fair.c:175:5: sparse:
 sparse: symbol 'sysctl_sched_util_low_pct' was not declared. Should it be
 static?
Message-ID: <202512140710.cAqdH8JK-lkp@intel.com>
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
commit: 2e1dfc02d115143587ccfee1815ad295763050f2 [3541/3541] sched: Adjust wakeup cpu range according CPU util dynamicly
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140710.cAqdH8JK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140710.cAqdH8JK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140710.cAqdH8JK-lkp@intel.com/

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
   kernel/sched/fair.c:7180:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7180:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7180:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7186:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7186:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7186:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7193:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7193:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7193:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7201:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7201:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7201:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
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
