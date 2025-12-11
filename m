Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9720F2F6579
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765445036; cv=none; b=BHOODMkAFHmW0FOryyDVAGIn66nj/1T0N6ZB4GTaNLqlF5lBeYExZFqOM0kqCs/qBCWLnXbZ9T8/H7LJ6UWAaxb6Qn0M/jv2E5ddM72EelpzplFwv2YSLUge2547MWtAo6IxklhzHLHX95QXJaMJL7r2MT8ByOED6DDTLmYPSu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765445036; c=relaxed/simple;
	bh=1u7l/euhEyBugfNGESveD7XIdQ3WWApVKoFOkEG80Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DrGnS8+al8/K3pL2rLdqP8WEc44pGp5CQfCQI/3bKHHGPKpW5lBe1YbBYje/zgzNaX83DlmkjnyVrOX9fOsyc22kriK8v6UfGJMA6QOOBIoKRVybW/v7xJPnbzuPps2eH0N19tY0wKb/gOFwPLRflqcVY10oMLiVd93E2IULGUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPn0/C6I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPn0/C6I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765445034; x=1796981034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1u7l/euhEyBugfNGESveD7XIdQ3WWApVKoFOkEG80Zg=;
  b=iPn0/C6IGN4UFAWsascGEGAw+kIv0982V9e713oeT1cQL7lt6rAljDMd
   51cy8k9gU793GTI7JoUYDSEDjoxcjKnwkED5HYc2q+YPQN5BVP0VkiiA3
   N13kgxNb8EH5i5IKZuerIzm0bS6sssRica17FL9ujb5NCVf3M+14mcOAt
   oA24hAyMK0CwfR8CXltj8wUAa7OPui4UsDO3JOW2gLgpx7hC8Vy82Aulz
   RhsacBrUHIe/9hWHCZDK4HIf/IWmJso9bHpVBUuYDnB1K8mt3NenE/Dzk
   aIFq7GcxbDWAroaBf9aqoHZ8NGS4PurKipueF8hP8hUASGvkFXy7fGlcm
   Q==;
X-CSE-ConnectionGUID: 0uR+NMKXQh+PXQylIRqPwg==
X-CSE-MsgGUID: c7bbOF7JT3qT01OnfgMQyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71289145"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71289145"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 01:23:54 -0800
X-CSE-ConnectionGUID: uAu+9+tORlyaB0gUB4hIHA==
X-CSE-MsgGUID: u4X6vLmNRXGPttQ2iXwy6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196524057"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Dec 2025 01:23:51 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTcto-000000004SZ-3wDC;
	Thu, 11 Dec 2025 09:23:48 +0000
Date: Thu, 11 Dec 2025 17:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/rt.c:1804:9: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202512111736.KDCkdFtL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 15125a229abc2404a264ce493e64a9ffa7850f6e sched/smp: Use the SMP version of the RT scheduling class
date:   6 months ago
config: arm-randconfig-r111-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111736.KDCkdFtL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111736.KDCkdFtL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111736.KDCkdFtL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:838:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:838:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:838:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2289:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2289:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2289:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:529:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:529:55: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:529:55: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:976:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:976:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:976:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1490:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1490:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1490:31: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/rt.c:1804:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1804:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1804:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/rt.c:1509:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1509:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1509:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1510:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1510:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1510:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1571:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1571:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1571:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1613:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1613:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1613:39: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/rt.c:1632:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1632:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1632:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1971:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1971:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:1971:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1994:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1994:13: sparse:    struct task_struct *
   kernel/sched/rt.c:1994:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2340:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2340:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2340:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2342:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2342:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2342:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2342:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2342:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2342:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2634:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2634:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2634:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2644:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2644:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2644:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2750:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2750:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2750:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2278:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2278:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2278:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2288:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2288:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2288:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1197:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1197:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1197:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1197:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1197:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1197:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1295:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1295:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1295:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1604:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1604:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1604:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1604:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1604:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1604:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1693:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1693:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1693:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2495:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2495:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2495:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2164:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2164:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2164:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2165:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2165:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2165:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2240:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2240:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2240:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2795:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2795:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2795:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2797:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2797:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2797:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2799:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2799:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2799:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2986:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2986:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2986:23: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2235:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2235:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2235:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2235:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2235:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2235:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2246:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2246:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2246:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2235:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2235:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2235:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2235:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2246:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2246:26: sparse:    struct task_struct [noderef] __rcu *

vim +1804 kernel/sched/rt.c

e7693a362ec84b kernel/sched_rt.c Gregory Haskins   2008-01-25  1607  
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1608  /*
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1609   * Preempt the current task with a newly woken task if needed:
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1610   */
e23edc86b09df6 kernel/sched/rt.c Ingo Molnar       2023-09-19  1611  static void wakeup_preempt_rt(struct rq *rq, struct task_struct *p, int flags)
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1612  {
af0c8b2bf67b25 kernel/sched/rt.c Peter Zijlstra    2024-10-09  1613  	struct task_struct *donor = rq->donor;
af0c8b2bf67b25 kernel/sched/rt.c Peter Zijlstra    2024-10-09  1614  
af0c8b2bf67b25 kernel/sched/rt.c Peter Zijlstra    2024-10-09  1615  	if (p->prio < donor->prio) {
8875125efe8402 kernel/sched/rt.c Kirill Tkhai      2014-06-29  1616  		resched_curr(rq);
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1617  		return;
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1618  	}
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1619  
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1620  	/*
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1621  	 * If:
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1622  	 *
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1623  	 * - the newly woken task is of equal priority to the current task
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1624  	 * - the newly woken task is non-migratable while current is migratable
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1625  	 * - current will be preempted on the next reschedule
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1626  	 *
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1627  	 * we should check to see if current can readily move to a different
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1628  	 * cpu.  If so, we will reschedule to allow the push logic to try
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1629  	 * to move current somewhere else, making room for our non-migratable
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1630  	 * task.
45c01e824991b2 kernel/sched_rt.c Gregory Haskins   2008-05-12  1631  	 */
af0c8b2bf67b25 kernel/sched/rt.c Peter Zijlstra    2024-10-09 @1632  	if (p->prio == donor->prio && !test_tsk_need_resched(rq->curr))
7ebefa8ceefed4 kernel/sched_rt.c Dmitry Adamushko  2008-07-01  1633  		check_preempt_equal_prio(rq, p);
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1634  }
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1635  
a0e813f26ebcb2 kernel/sched/rt.c Peter Zijlstra    2019-11-08  1636  static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, bool first)
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song       2018-10-26  1637  {
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao       2021-09-05  1638  	struct sched_rt_entity *rt_se = &p->rt;
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao       2021-09-05  1639  	struct rt_rq *rt_rq = &rq->rt;
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao       2021-09-05  1640  
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song       2018-10-26  1641  	p->se.exec_start = rq_clock_task(rq);
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao       2021-09-05  1642  	if (on_rt_rq(&p->rt))
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao       2021-09-05  1643  		update_stats_wait_end_rt(rt_rq, rt_se);
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song       2018-10-26  1644  
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song       2018-10-26  1645  	/* The running task is never eligible for pushing */
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song       2018-10-26  1646  	dequeue_pushable_task(rq, p);
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra    2019-05-29  1647  
a0e813f26ebcb2 kernel/sched/rt.c Peter Zijlstra    2019-11-08  1648  	if (!first)
a0e813f26ebcb2 kernel/sched/rt.c Peter Zijlstra    2019-11-08  1649  		return;
a0e813f26ebcb2 kernel/sched/rt.c Peter Zijlstra    2019-11-08  1650  
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra    2019-05-29  1651  	/*
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra    2019-05-29  1652  	 * If prev task was rt, put_prev_task() has already updated the
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra    2019-05-29  1653  	 * utilization. We only care of the case where we start to schedule a
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra    2019-05-29  1654  	 * rt task
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra    2019-05-29  1655  	 */
af0c8b2bf67b25 kernel/sched/rt.c Peter Zijlstra    2024-10-09  1656  	if (rq->donor->sched_class != &rt_sched_class)
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra    2019-05-29  1657  		update_rt_rq_load_avg(rq_clock_pelt(rq), rq, 0);
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra    2019-05-29  1658  
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra    2019-05-29  1659  	rt_queue_push_tasks(rq);
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song       2018-10-26  1660  }
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song       2018-10-26  1661  
821aecd09e5ad2 kernel/sched/rt.c Dietmar Eggemann  2022-03-02  1662  static struct sched_rt_entity *pick_next_rt_entity(struct rt_rq *rt_rq)
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1663  {
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra    2008-01-25  1664  	struct rt_prio_array *array = &rt_rq->active;
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra    2008-01-25  1665  	struct sched_rt_entity *next = NULL;
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1666  	struct list_head *queue;
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1667  	int idx;
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1668  
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1669  	idx = sched_find_first_bit(array->bitmap);
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra    2008-01-25  1670  	BUG_ON(idx >= MAX_RT_PRIO);
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1671  
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1672  	queue = array->queue + idx;
f7d2728cc032a2 kernel/sched/rt.c Ingo Molnar       2025-03-17  1673  	if (WARN_ON_ONCE(list_empty(queue)))
7c4a5b89a0b5a5 kernel/sched/rt.c Pietro Borrello   2023-02-06  1674  		return NULL;
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra    2008-01-25  1675  	next = list_entry(queue->next, struct sched_rt_entity, run_list);
326587b840785c kernel/sched_rt.c Dmitry Adamushko  2008-01-25  1676  
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra    2008-01-25  1677  	return next;
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra    2008-01-25  1678  }
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1679  
917b627d4d981d kernel/sched_rt.c Gregory Haskins   2008-12-29  1680  static struct task_struct *_pick_next_task_rt(struct rq *rq)
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra    2008-01-25  1681  {
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra    2008-01-25  1682  	struct sched_rt_entity *rt_se;
606dba2e289446 kernel/sched/rt.c Peter Zijlstra    2012-02-11  1683  	struct rt_rq *rt_rq  = &rq->rt;
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra    2008-01-25  1684  
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra    2008-01-25  1685  	do {
821aecd09e5ad2 kernel/sched/rt.c Dietmar Eggemann  2022-03-02  1686  		rt_se = pick_next_rt_entity(rt_rq);
7c4a5b89a0b5a5 kernel/sched/rt.c Pietro Borrello   2023-02-06  1687  		if (unlikely(!rt_se))
7c4a5b89a0b5a5 kernel/sched/rt.c Pietro Borrello   2023-02-06  1688  			return NULL;
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra    2008-01-25  1689  		rt_rq = group_rt_rq(rt_se);
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra    2008-01-25  1690  	} while (rt_rq);
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra    2008-01-25  1691  
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song       2018-10-26  1692  	return rt_task_of(rt_se);
917b627d4d981d kernel/sched_rt.c Gregory Haskins   2008-12-29  1693  }
917b627d4d981d kernel/sched_rt.c Gregory Haskins   2008-12-29  1694  
21f56ffe4482e5 kernel/sched/rt.c Peter Zijlstra    2020-11-17  1695  static struct task_struct *pick_task_rt(struct rq *rq)
917b627d4d981d kernel/sched_rt.c Gregory Haskins   2008-12-29  1696  {
606dba2e289446 kernel/sched/rt.c Peter Zijlstra    2012-02-11  1697  	struct task_struct *p;
606dba2e289446 kernel/sched/rt.c Peter Zijlstra    2012-02-11  1698  
6e2df0581f5690 kernel/sched/rt.c Peter Zijlstra    2019-11-08  1699  	if (!sched_rt_runnable(rq))
606dba2e289446 kernel/sched/rt.c Peter Zijlstra    2012-02-11  1700  		return NULL;
606dba2e289446 kernel/sched/rt.c Peter Zijlstra    2012-02-11  1701  
606dba2e289446 kernel/sched/rt.c Peter Zijlstra    2012-02-11  1702  	p = _pick_next_task_rt(rq);
21f56ffe4482e5 kernel/sched/rt.c Peter Zijlstra    2020-11-17  1703  
21f56ffe4482e5 kernel/sched/rt.c Peter Zijlstra    2020-11-17  1704  	return p;
21f56ffe4482e5 kernel/sched/rt.c Peter Zijlstra    2020-11-17  1705  }
21f56ffe4482e5 kernel/sched/rt.c Peter Zijlstra    2020-11-17  1706  
b2d70222dbf2a2 kernel/sched/rt.c Peter Zijlstra    2024-08-14  1707  static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_struct *next)
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1708  {
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao       2021-09-05  1709  	struct sched_rt_entity *rt_se = &p->rt;
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao       2021-09-05  1710  	struct rt_rq *rt_rq = &rq->rt;
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao       2021-09-05  1711  
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao       2021-09-05  1712  	if (on_rt_rq(&p->rt))
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao       2021-09-05  1713  		update_stats_wait_start_rt(rt_rq, rt_se);
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao       2021-09-05  1714  
f1e14ef64d3e1b kernel/sched_rt.c Ingo Molnar       2007-08-09  1715  	update_curr_rt(rq);
917b627d4d981d kernel/sched_rt.c Gregory Haskins   2008-12-29  1716  
23127296889fe8 kernel/sched/rt.c Vincent Guittot   2019-01-23  1717  	update_rt_rq_load_avg(rq_clock_pelt(rq), rq, 1);
371bf42732694d kernel/sched/rt.c Vincent Guittot   2018-06-28  1718  
917b627d4d981d kernel/sched_rt.c Gregory Haskins   2008-12-29  1719  	/*
917b627d4d981d kernel/sched_rt.c Gregory Haskins   2008-12-29  1720  	 * The previous task needs to be made eligible for pushing
917b627d4d981d kernel/sched_rt.c Gregory Haskins   2008-12-29  1721  	 * if it is still active
917b627d4d981d kernel/sched_rt.c Gregory Haskins   2008-12-29  1722  	 */
4b53a3412d6663 kernel/sched/rt.c Ingo Molnar       2017-02-05  1723  	if (on_rt_rq(&p->rt) && p->nr_cpus_allowed > 1)
917b627d4d981d kernel/sched_rt.c Gregory Haskins   2008-12-29  1724  		enqueue_pushable_task(rq, p);
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1725  }
bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar       2007-07-09  1726  
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1727  /* Only try algorithms three times */
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1728  #define RT_MAX_TRIES 3
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1729  
e23ee74777f389 kernel/sched/rt.c Kirill Tkhai      2013-06-07  1730  /*
e23ee74777f389 kernel/sched/rt.c Kirill Tkhai      2013-06-07  1731   * Return the highest pushable rq's task, which is suitable to be executed
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar       2018-03-03  1732   * on the CPU, NULL otherwise
e23ee74777f389 kernel/sched/rt.c Kirill Tkhai      2013-06-07  1733   */
e23ee74777f389 kernel/sched/rt.c Kirill Tkhai      2013-06-07  1734  static struct task_struct *pick_highest_pushable_task(struct rq *rq, int cpu)
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1735  {
e23ee74777f389 kernel/sched/rt.c Kirill Tkhai      2013-06-07  1736  	struct plist_head *head = &rq->rt.pushable_tasks;
3d07467b7aa916 kernel/sched_rt.c Peter Zijlstra    2010-03-10  1737  	struct task_struct *p;
3d07467b7aa916 kernel/sched_rt.c Peter Zijlstra    2010-03-10  1738  
e23ee74777f389 kernel/sched/rt.c Kirill Tkhai      2013-06-07  1739  	if (!has_pushable_tasks(rq))
e23ee74777f389 kernel/sched/rt.c Kirill Tkhai      2013-06-07  1740  		return NULL;
3d07467b7aa916 kernel/sched_rt.c Peter Zijlstra    2010-03-10  1741  
e23ee74777f389 kernel/sched/rt.c Kirill Tkhai      2013-06-07  1742  	plist_for_each_entry(p, head, pushable_tasks) {
18adad1dac3334 kernel/sched/rt.c Connor O'Brien    2024-10-09  1743  		if (task_is_pushable(rq, p, cpu))
e23ee74777f389 kernel/sched/rt.c Kirill Tkhai      2013-06-07  1744  			return p;
f65eda4f789168 kernel/sched_rt.c Steven Rostedt    2008-01-25  1745  	}
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1746  
e23ee74777f389 kernel/sched/rt.c Kirill Tkhai      2013-06-07  1747  	return NULL;
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1748  }
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1749  
0e3900e6d3b04c kernel/sched_rt.c Rusty Russell     2008-11-25  1750  static DEFINE_PER_CPU(cpumask_var_t, local_cpu_mask);
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1751  
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1752  static int find_lowest_rq(struct task_struct *task)
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1753  {
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1754  	struct sched_domain *sd;
4ba2968420fa9d kernel/sched/rt.c Christoph Lameter 2014-08-26  1755  	struct cpumask *lowest_mask = this_cpu_cpumask_var_ptr(local_cpu_mask);
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1756  	int this_cpu = smp_processor_id();
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1757  	int cpu      = task_cpu(task);
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1758  	int ret;
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1759  
0da938c44921cf kernel/sched_rt.c Steven Rostedt    2011-06-14  1760  	/* Make sure the mask is initialized first */
0da938c44921cf kernel/sched_rt.c Steven Rostedt    2011-06-14  1761  	if (unlikely(!lowest_mask))
0da938c44921cf kernel/sched_rt.c Steven Rostedt    2011-06-14  1762  		return -1;
0da938c44921cf kernel/sched_rt.c Steven Rostedt    2011-06-14  1763  
4b53a3412d6663 kernel/sched/rt.c Ingo Molnar       2017-02-05  1764  	if (task->nr_cpus_allowed == 1)
6e0534f278199f kernel/sched_rt.c Gregory Haskins   2008-05-12  1765  		return -1; /* No other targets possible */
06f90dbd7610d5 kernel/sched_rt.c Gregory Haskins   2008-01-25  1766  
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1767  	/*
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1768  	 * If we're on asym system ensure we consider the different capacities
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1769  	 * of the CPUs when searching for the lowest_mask.
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1770  	 */
740cf8a760b73e kernel/sched/rt.c Dietmar Eggemann  2022-07-29  1771  	if (sched_asym_cpucap_active()) {
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1772  
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1773  		ret = cpupri_find_fitness(&task_rq(task)->rd->cpupri,
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1774  					  task, lowest_mask,
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1775  					  rt_task_fits_capacity);
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1776  	} else {
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1777  
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1778  		ret = cpupri_find(&task_rq(task)->rd->cpupri,
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1779  				  task, lowest_mask);
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1780  	}
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1781  
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef       2020-03-02  1782  	if (!ret)
6e0534f278199f kernel/sched_rt.c Gregory Haskins   2008-05-12  1783  		return -1; /* No targets found */
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1784  
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1785  	/*
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar       2018-03-03  1786  	 * At this point we have built a mask of CPUs representing the
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1787  	 * lowest priority tasks in the system.  Now we want to elect
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1788  	 * the best one based on our affinity and topology.
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1789  	 *
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar       2018-03-03  1790  	 * We prioritize the last CPU that the task executed on since
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1791  	 * it is most likely cache-hot in that location.
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1792  	 */
96f874e26428ab kernel/sched_rt.c Rusty Russell     2008-11-25  1793  	if (cpumask_test_cpu(cpu, lowest_mask))
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1794  		return cpu;
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1795  
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1796  	/*
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1797  	 * Otherwise, we consult the sched_domains span maps to figure
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar       2018-03-03  1798  	 * out which CPU is logically closest to our hot cache data.
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1799  	 */
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1800  	if (!cpumask_test_cpu(this_cpu, lowest_mask))
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1801  		this_cpu = -1; /* Skip this_cpu opt if not among lowest */
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1802  
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1803  	rcu_read_lock();
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25 @1804  	for_each_domain(cpu, sd) {
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1805  		if (sd->flags & SD_WAKE_AFFINE) {
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1806  			int best_cpu;
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1807  
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1808  			/*
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1809  			 * "this_cpu" is cheaper to preempt than a
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1810  			 * remote processor.
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1811  			 */
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1812  			if (this_cpu != -1 &&
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1813  			    cpumask_test_cpu(this_cpu, sched_domain_span(sd))) {
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1814  				rcu_read_unlock();
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1815  				return this_cpu;
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1816  			}
d38b223c86db31 kernel/sched_rt.c Mike Travis       2009-01-10  1817  
14e292f8d45380 kernel/sched/rt.c Peter Zijlstra    2020-10-01  1818  			best_cpu = cpumask_any_and_distribute(lowest_mask,
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1819  							      sched_domain_span(sd));
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1820  			if (best_cpu < nr_cpu_ids) {
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1821  				rcu_read_unlock();
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1822  				return best_cpu;
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1823  			}
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1824  		}
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1825  	}
cd4ae6adf8b1c2 kernel/sched_rt.c Xiaotian Feng     2011-04-22  1826  	rcu_read_unlock();
e8fa136262e112 kernel/sched_rt.c Steven Rostedt    2008-01-25  1827  
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1828  	/*
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1829  	 * And finally, if there were no matches within the domains
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1830  	 * just give the caller *something* to work with from the compatible
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1831  	 * locations.
6e1254d2c41215 kernel/sched_rt.c Gregory Haskins   2008-01-25  1832  	 */
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1833  	if (this_cpu != -1)
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1834  		return this_cpu;
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1835  
14e292f8d45380 kernel/sched/rt.c Peter Zijlstra    2020-10-01  1836  	cpu = cpumask_any_distribute(lowest_mask);
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1837  	if (cpu < nr_cpu_ids)
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1838  		return cpu;
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar       2018-03-03  1839  
e2c880630438f8 kernel/sched_rt.c Rusty Russell     2009-11-03  1840  	return -1;
07b4032c9e505e kernel/sched_rt.c Gregory Haskins   2008-01-25  1841  }
07b4032c9e505e kernel/sched_rt.c Gregory Haskins   2008-01-25  1842  

:::::: The code at line 1804 was first introduced by commit
:::::: 6e1254d2c41215da27025add8900ed187bca121d sched: optimize RT affinity

:::::: TO: Gregory Haskins <ghaskins@novell.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
