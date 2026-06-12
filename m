Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304D930BB97
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 01:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781226670; cv=none; b=IfkWnUgFJBr+Vtxmtz5K3DtnU6nEnAZACK2E8COiqR3Vws5JrrRg/5wg82Xpi2dPeeTumPvg83vqW7zZu0lSK5T4uz5TdTNQC8KRDU0T/gkMXEUkg5+K7/FUL02ohlS6gXTVkxrRl98OQ93EabK2HgZIxLqR7jWwojBYoVcem5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781226670; c=relaxed/simple;
	bh=gF3FmPVWrCYAPoR8EJBX3++aKgGnw3sbIBT0GrBbq0I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nokczYSNOUU663wFyIKcFEPwbEwFMiVQdsvisEiH3eXa2wZ4JzBjXSkkW8U+/vBbJ+2bCoCX++BA5+lGE8c2Zw5DvPwEYz5NXvuzgqR8rcA/3MwDcOAteDnsynSX2HkC9Rbh4fVNAPHL5OgTarXqPvdoGJH88gqbA8EAHqn3h0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZevTx1y1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZevTx1y1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781226668; x=1812762668;
  h=date:from:to:cc:subject:message-id;
  bh=gF3FmPVWrCYAPoR8EJBX3++aKgGnw3sbIBT0GrBbq0I=;
  b=ZevTx1y1t+HK+Fl3y0Anyfc+wci6f4iNs6p0FpDCCp6OB+Lp8ho1/KBC
   2teSCTPVaVJ6+YBphPwPrWzTuzMgavAnLc1mDt6daKRwaHND+ax04CzQN
   GaVbnuAXwBKNGnZ1yCUCxeyVSGuUQWhb3uDU4/NcxGpj2abpWC3Xubw9g
   9dgd///SNwLOD6BUj0e4UAh/V6hbun1nOsSMLOUyhYa+KSAs6AWd9OKiK
   D6RHNdoLVHZAi2IQEatbIt3GtNEVlMf14A6nrhgm/pEJ9/JXM5yJvZo3V
   xq+0M6i5cwqff2Z3avQlRpVglu9CS5Ybiufcn2PfVBDiqQ3PadLRc6j/Q
   A==;
X-CSE-ConnectionGUID: 8I9bkKdaSpeac5AoOoBt8w==
X-CSE-MsgGUID: SzM9PwqsQtqwLY/pug1+0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69601809"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="69601809"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 18:11:07 -0700
X-CSE-ConnectionGUID: V6RRT+7DS72OgwcbP4ExFw==
X-CSE-MsgGUID: 2RIFfs7DQTOqs4YkvrYYFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251764260"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2026 18:11:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXqQJ-00000000O6O-1ull;
	Fri, 12 Jun 2026 01:11:03 +0000
Date: Fri, 12 Jun 2026 09:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/rt.c:1571:45: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202606120900.a9u93sLd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 15125a229abc2404a264ce493e64a9ffa7850f6e sched/smp: Use the SMP version of the RT scheduling class
date:   12 months ago
config: x86_64-randconfig-123-20260610 (https://download.01.org/0day-ci/archive/20260612/202606120900.a9u93sLd-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120900.a9u93sLd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 15125a229abc ("sched/smp: Use the SMP version of the RT scheduling class")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120900.a9u93sLd-lkp@intel.com/

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
   kernel/sched/rt.c:1804:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1804:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1804:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1509:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1509:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1509:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1510:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1510:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1510:15: sparse:     got struct task_struct [noderef] __rcu *
>> kernel/sched/rt.c:1571:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1571:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1571:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1613:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1613:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1613:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1632:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
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

vim +1571 kernel/sched/rt.c

7ebefa8ceefed4 kernel/sched_rt.c Dmitry Adamushko 2008-07-01  1567  
7ebefa8ceefed4 kernel/sched_rt.c Dmitry Adamushko 2008-07-01  1568  static void check_preempt_equal_prio(struct rq *rq, struct task_struct *p)
7ebefa8ceefed4 kernel/sched_rt.c Dmitry Adamushko 2008-07-01  1569  {
4b53a3412d6663 kernel/sched/rt.c Ingo Molnar      2017-02-05  1570  	if (rq->curr->nr_cpus_allowed == 1 ||
af0c8b2bf67b25 kernel/sched/rt.c Peter Zijlstra   2024-10-09 @1571  	    !cpupri_find(&rq->rd->cpupri, rq->donor, NULL))
7ebefa8ceefed4 kernel/sched_rt.c Dmitry Adamushko 2008-07-01  1572  		return;
7ebefa8ceefed4 kernel/sched_rt.c Dmitry Adamushko 2008-07-01  1573  
308a623a40ce16 kernel/sched/rt.c Wanpeng Li       2014-10-31  1574  	/*
308a623a40ce16 kernel/sched/rt.c Wanpeng Li       2014-10-31  1575  	 * p is migratable, so let's not schedule it and
308a623a40ce16 kernel/sched/rt.c Wanpeng Li       2014-10-31  1576  	 * see if it is pushed or pulled somewhere else.
308a623a40ce16 kernel/sched/rt.c Wanpeng Li       2014-10-31  1577  	 */
804d402fb6f648 kernel/sched/rt.c Qais Yousef      2019-10-09  1578  	if (p->nr_cpus_allowed != 1 &&
a1bd02e1f28b19 kernel/sched/rt.c Qais Yousef      2020-03-02  1579  	    cpupri_find(&rq->rd->cpupri, p, NULL))
13b8bd0a5713bd kernel/sched_rt.c Rusty Russell    2009-03-25  1580  		return;
24600ce89a819a kernel/sched_rt.c Rusty Russell    2008-11-25  1581  
7ebefa8ceefed4 kernel/sched_rt.c Dmitry Adamushko 2008-07-01  1582  	/*
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar      2018-03-03  1583  	 * There appear to be other CPUs that can accept
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar      2018-03-03  1584  	 * the current task but none can run 'p', so lets reschedule
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar      2018-03-03  1585  	 * to try and push the current task away:
7ebefa8ceefed4 kernel/sched_rt.c Dmitry Adamushko 2008-07-01  1586  	 */
7ebefa8ceefed4 kernel/sched_rt.c Dmitry Adamushko 2008-07-01  1587  	requeue_task_rt(rq, p, 1);
8875125efe8402 kernel/sched/rt.c Kirill Tkhai     2014-06-29  1588  	resched_curr(rq);
7ebefa8ceefed4 kernel/sched_rt.c Dmitry Adamushko 2008-07-01  1589  }
7ebefa8ceefed4 kernel/sched_rt.c Dmitry Adamushko 2008-07-01  1590  

:::::: The code at line 1571 was first introduced by commit
:::::: af0c8b2bf67b25756f27644936e74fd9a6273bd2 sched: Split scheduler and execution contexts

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
