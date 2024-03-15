Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BF6DDBC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 04:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710477719; cv=none; b=HQS9BTybsasUIgq+0+QH46faeLS0ffrXVHImRJVeSV/L6FTjU9LBQXkRFxWjM7KO8N+e3HHL/0fOXcJot+Lt6USL7KTUyi1KxDx0BlKESKDernh8MXx0vHkj7i70iHJ0E8O6/fxtPv5mEgdaIMenMd90LasHNFFxzSKF3uP80Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710477719; c=relaxed/simple;
	bh=4YlUQNJU9Mo2CkZf5NdXGUVPedVsA/8jkVaynUo7k8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DCRhi7Z6PgHwATd0Y6VRP6xzC8ADiGF2dcnn16NIMIzqgtQM7J62C0cgqvj7/xPhH6f6VkQAjqCw/ylEyvhQX6ksB5yI4dm+ZQa2QVy3xA+VuN6GHXI6VadHjMOpDAlW8NvcuX2BZ6vFbY9xNk973WvkFwxZBwdhgtqg1E/2shU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWVASVvw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWVASVvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710477718; x=1742013718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4YlUQNJU9Mo2CkZf5NdXGUVPedVsA/8jkVaynUo7k8Y=;
  b=NWVASVvwmwhEyheak5rgGVcGPiMvB/otSCfWEt06lx4CaIUSaBSxH/b9
   cnd6TXBgJy9Q70TyeH1y4pEQwpM0w9TqPd3GW7Pz8z27dwpW226g+VF4D
   kWtmE3UWLuQKNi7pmTULk7PUnP9qR5Y/3RMBWRYGCICHqgy2hNYVRJzl4
   jxkLx6zhx4dNGKpxYKDqsYNWL/dfiGiyFgEiP8pg/1lwaFkfrddrF35XE
   ZnNoe6HVOXslNn3wTu61gGuKoQ7WqyqrKaJgdKHuqPxGe8nl4YpBPVzAn
   gCV2Ck35wn2XKi8c/426VylYx8NRKTbhAIaH4SsTb3+DRbCULS6pxPbvV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="8269013"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="8269013"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 21:41:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="17151502"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Mar 2024 21:41:56 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkzOE-000E77-0O;
	Fri, 15 Mar 2024 04:41:54 +0000
Date: Fri, 15 Mar 2024 12:40:57 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.7/main 435/3293] kernel/sched/alt_core.c:136:1: sparse:
 sparse: symbol 'sched_cpu_llc_mask' was not declared. Should it be static?
Message-ID: <202403151204.ACjBk8xA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 6.7/main
head:   6e5c8b50414acc1e8c08a44a834f6a22af5765f2
commit: a3d80748dd6e5dc2746d1013edb5f46475e3bc01 [435/3293] sched/alt: [Sync] 2ef269ef1ac0 cgroup/cpuset: Free DL BW in case can_attach() fails
config: sparc64-randconfig-r111-20240315 (https://download.01.org/0day-ci/archive/20240315/202403151204.ACjBk8xA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240315/202403151204.ACjBk8xA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151204.ACjBk8xA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/alt_core.c:136:1: sparse: sparse: symbol 'sched_cpu_llc_mask' was not declared. Should it be static?
   kernel/sched/alt_core.c:1009:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:1009:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:1009:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:1045:6: sparse: sparse: symbol 'select_nohz_load_balancer' was not declared. Should it be static?
   kernel/sched/alt_core.c:2652:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:2652:28: sparse:     expected struct task_struct const *p
   kernel/sched/alt_core.c:2652:28: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4063:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:4063:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:4063:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:4151:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4151:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4151:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4167:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4167:32: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4167:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4789:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4789:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4789:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5325:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5325:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5325:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5475:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5475:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5475:22: sparse:    struct task_struct *
   kernel/sched/alt_core.c:7081:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:7081:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:7081:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c: note: in included file (through kernel/sched/sched.h):
   kernel/sched/alt_sched.h:446:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/alt_core.c:536:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/alt_core.c:555:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1928:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1928:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1928:38: sparse:    struct task_struct const *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *

vim +/sched_cpu_llc_mask +136 kernel/sched/alt_core.c

9f08fc0c802aa6 Alfred Chen 2019-08-19  134  
310588427142b9 Alfred Chen 2023-02-16  135  DEFINE_PER_CPU_ALIGNED(cpumask_t [NR_CPU_AFFINITY_LEVELS], sched_cpu_topo_masks);
310588427142b9 Alfred Chen 2023-02-16 @136  DEFINE_PER_CPU_ALIGNED(cpumask_t *, sched_cpu_llc_mask);
310588427142b9 Alfred Chen 2023-02-16  137  DEFINE_PER_CPU_ALIGNED(cpumask_t *, sched_cpu_topo_end_mask);
9f08fc0c802aa6 Alfred Chen 2019-08-19  138  

:::::: The code at line 136 was first introduced by commit
:::::: 310588427142b9ed9c0f6a33d0013bf8c4095103 sched/alt: PER_CPU_ALIGENED for cpu topo masks

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
