Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3F3197
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 00:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712535702; cv=none; b=mawCVmihtre19f0eJ+dTRrLVbWPUgtLT7rCQv5BEkxRfE2GPEuWfX4IyO4KtA1f7LvoJ+OBQ/D2V17hDeUFdURfr35aaYlNBbnEd7OloxXe9y/XV8mGlX+WDiGq8ZfkV3JPQvLi5sxeJnWrlfLAu76LVoCuGZuajosKmlQq5FU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712535702; c=relaxed/simple;
	bh=JKw5BnCELaMiVniFJlse/eiHHcyzcplVysuh1oBSCf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CgOarkAIBQZpqmIIGHVKzB5ibb+h49KkKTiqzwmNtguxaxng8d9kaI68pVLGbKCbeQAD9ZXLH3UPfBplp9kf0UQqnmAmt1R6ZrsCmWGMC8xCwkCZQc/jq/WQjqM+pHSC3AFL3tr2tSTcYzU2dUP0vM77XNMciXCpreJR2EIihbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQABdvca; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQABdvca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712535701; x=1744071701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JKw5BnCELaMiVniFJlse/eiHHcyzcplVysuh1oBSCf0=;
  b=hQABdvca865HVxbvhsPlS7Wepc5Je3ZLKHMs0gqnVpT4x/pJ2H0WWvat
   8EvNIxKBKwoUwJls4oaw/5yS+PaYKi7YfdTe0Zk71n39NZjpYzLkhYdAf
   zNfBbVZvTJNVhQOkml7Sb5jJKi3Yi6HdaNUuJORSxlkPYLYH2wyOGe33f
   Sq3mqX3fZVpeCKDKkkeiNYDDKUSl25WoH8SSMNrB8VC9P1vFqK4DMyvfz
   47sr12qU8+nuttBUrl1WIhToC8O3fwGBFcg7Rou15dWrEVY6otTDD+69H
   W2jw4nzHge9wQwFjyCjeuwsRNECOKTWUWh8titWJG2p5Tjb82v+/8Is79
   Q==;
X-CSE-ConnectionGUID: q4SLD5iPS2OTw68XpHBE8w==
X-CSE-MsgGUID: rAn71Al/Scu19TI7hCVP2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="11573788"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="11573788"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 17:21:39 -0700
X-CSE-ConnectionGUID: TlkAn+EPRXOJvCMT1H9tzg==
X-CSE-MsgGUID: yI+eYDBUSiiIGC+L8iwsfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="24356239"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Apr 2024 17:21:38 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtclU-0004h0-0Z;
	Mon, 08 Apr 2024 00:21:36 +0000
Date: Mon, 8 Apr 2024 08:20:45 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 10/13]
 kernel/sched/fair.c:6657:11: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202404080831.qZy52mod-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   3173a853e6c16e1dcb09d392ef1e9b5a06448696
commit: cdc541b0310662b02f0b4bd5188ddda85e9ba31b [10/13] sched/uclamp: Remove rq max aggregation
config: openrisc-randconfig-r112-20240408 (https://download.01.org/0day-ci/archive/20240408/202404080831.qZy52mod-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240408/202404080831.qZy52mod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404080831.qZy52mod-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1147:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1147:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:1147:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1184:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1184:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1184:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12355:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12355:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12355:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5900:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5900:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5900:22: sparse:    struct task_struct *
   kernel/sched/fair.c:7961:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7961:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7961:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8140:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8140:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8140:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8271:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8271:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8271:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8549:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8549:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8549:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9554:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9554:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9554:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10176:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10176:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10176:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11601:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11601:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11601:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11249:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11249:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11249:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11710:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11710:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11710:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
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
>> kernel/sched/fair.c:6657:11: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6657:11: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:6657:11: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7194:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7194:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7194:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7200:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7200:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7200:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7207:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7207:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7207:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7215:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7215:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7215:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2295:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2127:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2127:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2127:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2127:25: sparse:    struct task_struct *

vim +6657 kernel/sched/fair.c

  6647	
  6648	#ifdef CONFIG_SMP
  6649	static inline bool cpu_overutilized(int cpu)
  6650	{
  6651		unsigned long util_min, util_max;
  6652		struct task_struct *p;
  6653	
  6654		if (!sched_energy_enabled())
  6655			return false;
  6656	
> 6657		p = cpu_rq(cpu)->curr;
  6658		util_min = uclamp_eff_value(p, UCLAMP_MIN);
  6659		util_max = uclamp_eff_value(p, UCLAMP_MAX);
  6660	
  6661		/*
  6662		 * Return true only if the utilization doesn't fit CPU's capacity
  6663		 *
  6664		 * TODO: this definition of overutilized = misfit() is stale and no
  6665		 * longer fit for purpose and must be updated to reflect when the
  6666		 * system or a cluster is truly overloaded.
  6667		 */
  6668		return !util_fits_cpu(cpu_util_cfs(cpu), util_min, util_max, cpu);
  6669	}
  6670	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
