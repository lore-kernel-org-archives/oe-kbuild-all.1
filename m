Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C5521FF48
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 23:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766447929; cv=none; b=kIKeIIY0upffWmYWrtYVzSNkfq98Z/SHCGZ2YD9lghk2H2lOj0S7ukfdVi7+4GDUu+ieRje0j5len8MekzDnTT2R91KMlyKpIpPQ9r/pwjWBY2x7I2FrgL9SIhULgtvFC/f+0Sgb7wynXG1Aj04kaHW9SBXpfLq+YSwUO1XlbUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766447929; c=relaxed/simple;
	bh=4211WQMwwnCSjPflo5VzaCkvoQJTQSFbYSbhBwlemF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pUR4jxZP4/l5qcbdrG9hjVEjhaE7vQUvH0m/7K4hg/dM1XfBix/kcHOK1MSlO2u+mo55CWV9XN2raDHa48oczBOUoqKTmF/7t8gYZZB+SfCbvAzEnn6l7gVZOydVK1+I6gXBOy3Q9eapMkwry0ad9srpvTfWhYX8pyYfK0o7Vbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORYMVlVU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORYMVlVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766447927; x=1797983927;
  h=date:from:to:cc:subject:message-id;
  bh=4211WQMwwnCSjPflo5VzaCkvoQJTQSFbYSbhBwlemF8=;
  b=ORYMVlVUCqMhdpDam0EAoNGGR9bIyxFr/TKQvJaP30v07SBbQDmz5I1N
   BghZg6JVNb1SyuLhtLKjQ31oxRAI7uEUzy55iLQrvD0MrjxPtLRmUZZ8z
   eM42FJXFIa3XxDd0Gkdy0lf2YIOuy8FwupKNKH5XAjM6qa953jQQDk1EH
   cAglTXUMcLqIRz+whb+4jnBqpqWm+sq/NR9vcL+2l3FBXpqAGLJE1qaYK
   8Hy16mVnCblt03qiXsT7vIpEpf9amowlhaPL+ZftKuT+u91bZO9743wGl
   UatO5iwx22HKWsOUPzbWqbxdK4PeSIEEf/q1xMyu1163Mqec6VIPfvpme
   g==;
X-CSE-ConnectionGUID: Hj6rpYztRJ60vjsoUtJSWw==
X-CSE-MsgGUID: X7rDGuv4TPWlKxRBEv3Huw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85888360"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="85888360"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:58:47 -0800
X-CSE-ConnectionGUID: ECblDhpZSxWB5E43RlehTQ==
X-CSE-MsgGUID: PtXnGnkfR4W8Vkw09e9/Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199673639"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 15:58:45 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXpnW-000000001F2-405v;
	Mon, 22 Dec 2025 23:58:42 +0000
Date: Tue, 23 Dec 2025 07:58:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Song Zhang <zhangsong34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] kernel/sched/fair.c:151:14:
 sparse: sparse: symbol 'sysctl_sched_prio_load_balance_enabled' was not
 declared. Should it be static?
Message-ID: <202512230734.tlvqbdf4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: 89bf80a4d6d5ba852b9042480e0be23c2c4a628c [3541/3541] sched: Introduce priority load balance for qos scheduler
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251223/202512230734.tlvqbdf4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230734.tlvqbdf4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230734.tlvqbdf4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:143:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
   kernel/sched/fair.c:144:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
>> kernel/sched/fair.c:151:14: sparse: sparse: symbol 'sysctl_sched_prio_load_balance_enabled' was not declared. Should it be static?
   kernel/sched/fair.c:179:5: sparse: sparse: symbol 'sysctl_sched_util_low_pct' was not declared. Should it be static?
   kernel/sched/fair.c:1271:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1271:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1271:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:3054:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/fair.c:3054:13: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:3054:13: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:12846:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12846:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12846:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5925:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5925:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5925:22: sparse:    struct task_struct *
   kernel/sched/fair.c:7998:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7998:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7998:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8310:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8310:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8310:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8421:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8421:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8421:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8641:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8641:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8641:22: sparse:    struct task_struct *
   kernel/sched/fair.c:8999:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8999:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8999:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:10040:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10040:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:10040:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10677:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10677:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10677:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12118:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12118:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12118:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11775:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11775:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11775:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12214:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12214:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12214:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:3000:9: sparse: sparse: context imbalance in 'task_numa_placement' - different lock contexts for basic block
   kernel/sched/fair.c:7214:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7214:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7214:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7220:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7220:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7220:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7227:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7227:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7227:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7235:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7235:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7235:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2312:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2312:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2312:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2148:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2148:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2148:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2148:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2148:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2148:25: sparse:    struct task_struct *

vim +/sysctl_sched_prio_load_balance_enabled +151 kernel/sched/fair.c

   149	
   150	#ifdef CONFIG_QOS_SCHED_PRIO_LB
 > 151	unsigned int sysctl_sched_prio_load_balance_enabled;
   152	#endif
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
