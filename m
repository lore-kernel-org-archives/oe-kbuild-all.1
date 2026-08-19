Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6284052C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 08:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787127290; cv=none; b=Xcm7BvOQGw+9iCOvBrzVC3C69/UUIAwnl6gXaE4gfyC4MxcScLwvlXx2U9//0Iec9MNJfpKv902pWTOlo1D2krHKy9byLUXTK8l9vvTJEjvtWS6p937YGAH+eR9waqPpVgCMcRcC4cn5y8g33W7zmNDD2qLmowS3laBJkdZ+fno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787127290; c=relaxed/simple;
	bh=GtZX3vPoeASaBIX2vOVVh32wi/zlDvxBo4G/YVLiJpg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ms4HlmYPehr6ddHen6D1uDK8pI2mEhLJnUKxdg3REe5/3UFmCBEw7fHurJ1jhhfrZYI2OT0X5bpXBXILXKhOovuZHfiKuyt53Y7Q/tLsGiwnz1O7xyp2b1Hisza2C5x3eQezcwGncu9MiDfvjs00xPJpiez1Sm0v+6i+OtkHoOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6VhLmfv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6VhLmfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787127278; x=1818663278;
  h=date:from:to:cc:subject:message-id;
  bh=GtZX3vPoeASaBIX2vOVVh32wi/zlDvxBo4G/YVLiJpg=;
  b=T6VhLmfvV6Awp4+MRY8sa35YYLNde5uXdwwOjMJmsXSdijVq3/gzCQl8
   1ZunKHLQx6p1dn3u5ppWYtZCQFOUgyPMAuYBUUY+oKXcufNQ3Gy7o9zfq
   Cz1ukQIk1zt/Cz1I88VACmCZkuJnSd9gramd6yK5cB7sYat3JtnZi5wwR
   X2pSU1F3kXZxDKqmBwxPnUxaBF7nfMqabhO/PDu6TJaxJLJqpzJ4H25gr
   4PCtzIzMsZ75WAIPteoq+8oo8Ej+dBDhfnad8oltZcjPmyRp8K8voHrRd
   hExQCak3QdJ4VOgGaqpdwMvLeGG4Cs8g4qry9WlwdwcjcgqNvQTPofuoU
   Q==;
X-CSE-ConnectionGUID: MVc1WXQAQQOuA/pDk04MOw==
X-CSE-MsgGUID: fYK2U1kSR/GV0Qg5zNFsEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="90152360"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="90152360"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 01:12:47 -0700
X-CSE-ConnectionGUID: QLukdXuZQUmGgycC+KQfPA==
X-CSE-MsgGUID: bEkyDbKyR3ekQbHV4O/Nqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="295384722"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 01:12:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwbPe-00000000ezI-2pTz;
	Wed, 19 Aug 2026 08:12:42 +0000
Date: Wed, 19 Aug 2026 16:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 648/740] kernel/sched/alt_core.c:2505:36:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202608191655.oItu36D1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alfred,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   b735d8ec47d31db8e62d1925521a44d98c1cac2d
commit: ca8e0fde64fcfaf8691f1aa16d875770a5896ca5 [648/740] sched/alt: [Sync] dcb7416212e6 block: invalidate cached plug timestamp after task switch
config: parisc-randconfig-r121-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191655.oItu36D1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191655.oItu36D1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191655.oItu36D1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/alt_core.c:109:1: sparse: sparse: symbol '__pcpu_scope_sched_cpu_topo_end_mask' was not declared. Should it be static?
>> kernel/sched/alt_core.c:2505:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:2505:36: sparse:     expected struct task_struct const *p
   kernel/sched/alt_core.c:2505:36: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:5859:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:5859:43: sparse:     expected struct task_struct *push_task
   kernel/sched/alt_core.c:5859:43: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:3916:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:3916:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:3916:15: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:4000:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4000:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4000:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:4644:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4644:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4644:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5170:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5170:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5170:17: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:5716:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:5716:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:5716:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:923:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:923:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:923:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:923:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:923:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:923:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1831:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1831:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1831:38: sparse:    struct task_struct const *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c: note: in included file (through kernel/sched/sched.h):
   kernel/sched/alt_sched.h:333:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:333:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:333:25: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:333:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:333:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:333:25: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *

vim +2505 kernel/sched/alt_core.c

af93eb24c6d418 Alfred Chen 2020-07-31  2497  
2f7ec82370cbb7 Alfred Chen 2019-08-19  2498  void wake_up_if_idle(int cpu)
2f7ec82370cbb7 Alfred Chen 2019-08-19  2499  {
2f7ec82370cbb7 Alfred Chen 2019-08-19  2500  	struct rq *rq = cpu_rq(cpu);
2f7ec82370cbb7 Alfred Chen 2019-08-19  2501  
df026c771d2990 Alfred Chen 2024-01-05  2502  	guard(rcu)();
df026c771d2990 Alfred Chen 2024-01-05  2503  	if (is_idle_task(rcu_dereference(rq->curr))) {
df026c771d2990 Alfred Chen 2024-01-05  2504  		guard(raw_spinlock_irqsave)(&rq->lock);
2f7ec82370cbb7 Alfred Chen 2019-08-19 @2505  		if (is_idle_task(rq->curr))
cf9228cdcb66d4 Alfred Chen 2022-03-26  2506  			resched_curr(rq);
df026c771d2990 Alfred Chen 2024-01-05  2507  	}
2f7ec82370cbb7 Alfred Chen 2019-08-19  2508  }
2f7ec82370cbb7 Alfred Chen 2019-08-19  2509  

:::::: The code at line 2505 was first introduced by commit
:::::: 2f7ec82370cbb705e7e10f67ae48bb5f5033deb4 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
