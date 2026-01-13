Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406C3921E5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308011; cv=none; b=E0nnaknWzKH9uUkdNMRTDJGTNtCGvUkrbQO9rdwe1xeRaR4+oq6uKUevQFv6tSV7ywND3i4DNfm9UuSAXZcwjtn67xv4M4LeMRd8/D4S76jXJktsvXtpwDnHaoYXENz9CulNst/+asJA8QrvzoAjuvw6rryyX2FKRjiTypJNPCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308011; c=relaxed/simple;
	bh=IGC/yD5pcuaPJ9qzNJnhulf+QMpFa1Gf9PC/ju0D7f0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zun5BkMItJ+uunbfJx20W/T8HDUSReHnvjxQELUd/sndMUBVg6l9va+pzXMDtlZ/zy3PZM8zW+khiiX0Lt1cIXXhu2+6+8iXkJv3vrjEPDg4Xvfqx2SRsidC/yAjitxq3VUCsgshabReYW8cHeQTD3XpqnHiPS4XliEK4KDJr/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzfKwNtK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzfKwNtK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768308008; x=1799844008;
  h=date:from:to:cc:subject:message-id;
  bh=IGC/yD5pcuaPJ9qzNJnhulf+QMpFa1Gf9PC/ju0D7f0=;
  b=HzfKwNtKSeMcE9tFQModiSul6Nq74s8LI9KPT9jNJ0n3YBBcdrLMt/Lx
   EY2bkaQpyoQINFpn9u7BL2/5RhE17DSqTz6f/BponOcOrn1+jO3zTjhek
   MhTEJz+z6h+YY7XeynHcULdK3E4t9CXHoQXKUWKawOyJtOMCNpCxokzWe
   iOdtwjSknmLFxcdn6g3L9wyYB/8Ze/rBqpnFnYvtZr5yMY39mT12bkScl
   vnC6T44F8Hb2VIzTDIabY8m2JKMyX/YbBEs4tcfhkQ2puMfYOJ45tU6Zm
   2JkcrEmK1rQiPRZBMS20/iJK9VHvLr41A//L/yUVvZjN7rQaeVvnI71EE
   g==;
X-CSE-ConnectionGUID: 2xw1wIdUQa+AjMZvDraH2g==
X-CSE-MsgGUID: AMQ3GdG4SxuoU8p8xfWfPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69748702"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69748702"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:40:05 -0800
X-CSE-ConnectionGUID: pk1t8MiXQdq6ob8ER4yIyQ==
X-CSE-MsgGUID: ieH4lCnfQ1u8C3F0S4DE1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203586133"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2026 04:40:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfdgl-00000000EkE-3Tfd;
	Tue, 13 Jan 2026 12:39:59 +0000
Date: Tue, 13 Jan 2026 20:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/rt.c:1971:40: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202601132053.KYrHnjZE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ingo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 15125a229abc2404a264ce493e64a9ffa7850f6e sched/smp: Use the SMP version of the RT scheduling class
date:   7 months ago
config: sparc64-randconfig-r112-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132053.KYrHnjZE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132053.KYrHnjZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132053.KYrHnjZE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:2289:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2289:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2289:25: sparse:    struct task_struct [noderef] __rcu *
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
   kernel/sched/rt.c:1571:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1571:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1571:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1613:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1613:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1613:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1632:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1632:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1632:64: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/rt.c:1971:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
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
   kernel/sched/sched.h:2246:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2235:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:25: sparse:    struct task_struct [noderef] __rcu *

vim +1971 kernel/sched/rt.c

e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1922  
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1923  /*
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1924   * If the current CPU has more than one RT task, see if the non
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1925   * running task can migrate over to a CPU that is running a task
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1926   * of lesser priority.
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1927   */
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1928  static int push_rt_task(struct rq *rq, bool pull)
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1929  {
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1930  	struct task_struct *next_task;
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1931  	struct rq *lowest_rq;
311e800e16f63d kernel/sched_rt.c Hillf Danton       2011-06-16  1932  	int ret = 0;
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1933  
a22d7fc187ed99 kernel/sched_rt.c Gregory Haskins    2008-01-25  1934  	if (!rq->rt.overloaded)
a22d7fc187ed99 kernel/sched_rt.c Gregory Haskins    2008-01-25  1935  		return 0;
a22d7fc187ed99 kernel/sched_rt.c Gregory Haskins    2008-01-25  1936  
917b627d4d981d kernel/sched_rt.c Gregory Haskins    2008-12-29  1937  	next_task = pick_next_pushable_task(rq);
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1938  	if (!next_task)
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1939  		return 0;
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1940  
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1941  retry:
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1942  	/*
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1943  	 * It's possible that the next_task slipped in of
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1944  	 * higher priority than current. If that's the case
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1945  	 * just reschedule current.
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1946  	 */
af0c8b2bf67b25 kernel/sched/rt.c Peter Zijlstra     2024-10-09  1947  	if (unlikely(next_task->prio < rq->donor->prio)) {
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1948  		resched_curr(rq);
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1949  		return 0;
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1950  	}
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1951  
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1952  	if (is_migration_disabled(next_task)) {
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1953  		struct task_struct *push_task = NULL;
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1954  		int cpu;
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1955  
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1956  		if (!pull || rq->push_busy)
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1957  			return 0;
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1958  
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1959  		/*
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1960  		 * Invoking find_lowest_rq() on anything but an RT task doesn't
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1961  		 * make sense. Per the above priority check, curr has to
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1962  		 * be of higher priority than next_task, so no need to
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1963  		 * reschedule when bailing out.
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1964  		 *
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1965  		 * Note that the stoppers are masqueraded as SCHED_FIFO
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1966  		 * (cf. sched_set_stop_task()), so we can't rely on rt_task().
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1967  		 */
af0c8b2bf67b25 kernel/sched/rt.c Peter Zijlstra     2024-10-09  1968  		if (rq->donor->sched_class != &rt_sched_class)
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1969  			return 0;
49bef33e4b87b7 kernel/sched/rt.c Valentin Schneider 2022-01-27  1970  
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28 @1971  		cpu = find_lowest_rq(rq->curr);
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1972  		if (cpu == -1 || cpu == rq->cpu)
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1973  			return 0;
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1974  
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1975  		/*
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1976  		 * Given we found a CPU with lower priority than @next_task,
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1977  		 * therefore it should be running. However we cannot migrate it
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1978  		 * to this other CPU, instead attempt to push the current
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1979  		 * running task on this CPU away.
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1980  		 */
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1981  		push_task = get_push_task(rq);
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1982  		if (push_task) {
f0498d2a54e796 kernel/sched/rt.c Peter Zijlstra     2023-10-10  1983  			preempt_disable();
5cb9eaa3d274f7 kernel/sched/rt.c Peter Zijlstra     2020-11-17  1984  			raw_spin_rq_unlock(rq);
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1985  			stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1986  					    push_task, &rq->push_work);
f0498d2a54e796 kernel/sched/rt.c Peter Zijlstra     2023-10-10  1987  			preempt_enable();
5cb9eaa3d274f7 kernel/sched/rt.c Peter Zijlstra     2020-11-17  1988  			raw_spin_rq_lock(rq);
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1989  		}
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1990  
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1991  		return 0;
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1992  	}
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  1993  
9ebc6053814d37 kernel/sched/rt.c Yangtao Li         2018-11-03  1994  	if (WARN_ON(next_task == rq->curr))
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1995  		return 0;
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1996  
697f0a487f294e kernel/sched_rt.c Gregory Haskins    2008-01-25  1997  	/* We might release rq lock */
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1998  	get_task_struct(next_task);
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  1999  
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2000  	/* find_lock_lowest_rq locks the rq if found */
697f0a487f294e kernel/sched_rt.c Gregory Haskins    2008-01-25  2001  	lowest_rq = find_lock_lowest_rq(next_task, rq);
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2002  	if (!lowest_rq) {
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2003  		struct task_struct *task;
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2004  		/*
311e800e16f63d kernel/sched_rt.c Hillf Danton       2011-06-16  2005  		 * find_lock_lowest_rq releases rq->lock
1563513d34ed4b kernel/sched_rt.c Gregory Haskins    2008-12-29  2006  		 * so it is possible that next_task has migrated.
1563513d34ed4b kernel/sched_rt.c Gregory Haskins    2008-12-29  2007  		 *
1563513d34ed4b kernel/sched_rt.c Gregory Haskins    2008-12-29  2008  		 * We need to make sure that the task is still on the same
1563513d34ed4b kernel/sched_rt.c Gregory Haskins    2008-12-29  2009  		 * run-queue and is also still the next task eligible for
1563513d34ed4b kernel/sched_rt.c Gregory Haskins    2008-12-29  2010  		 * pushing.
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2011  		 */
917b627d4d981d kernel/sched_rt.c Gregory Haskins    2008-12-29  2012  		task = pick_next_pushable_task(rq);
de16b91effdbf5 kernel/sched/rt.c Byungchul Park     2017-05-12  2013  		if (task == next_task) {
917b627d4d981d kernel/sched_rt.c Gregory Haskins    2008-12-29  2014  			/*
311e800e16f63d kernel/sched_rt.c Hillf Danton       2011-06-16  2015  			 * The task hasn't migrated, and is still the next
311e800e16f63d kernel/sched_rt.c Hillf Danton       2011-06-16  2016  			 * eligible task, but we failed to find a run-queue
311e800e16f63d kernel/sched_rt.c Hillf Danton       2011-06-16  2017  			 * to push it to.  Do not retry in this case, since
97fb7a0a8944bd kernel/sched/rt.c Ingo Molnar        2018-03-03  2018  			 * other CPUs will pull from us when ready.
917b627d4d981d kernel/sched_rt.c Gregory Haskins    2008-12-29  2019  			 */
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2020  			goto out;
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2021  		}
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2022  
1563513d34ed4b kernel/sched_rt.c Gregory Haskins    2008-12-29  2023  		if (!task)
1563513d34ed4b kernel/sched_rt.c Gregory Haskins    2008-12-29  2024  			/* No more tasks, just exit */
1563513d34ed4b kernel/sched_rt.c Gregory Haskins    2008-12-29  2025  			goto out;
1563513d34ed4b kernel/sched_rt.c Gregory Haskins    2008-12-29  2026  
1563513d34ed4b kernel/sched_rt.c Gregory Haskins    2008-12-29  2027  		/*
1563513d34ed4b kernel/sched_rt.c Gregory Haskins    2008-12-29  2028  		 * Something has shifted, try again.
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2029  		 */
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2030  		put_task_struct(next_task);
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2031  		next_task = task;
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2032  		goto retry;
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2033  	}
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2034  
2b05a0b4c08ffd kernel/sched/rt.c Connor O'Brien     2024-10-09  2035  	move_queued_task_locked(rq, lowest_rq, next_task);
8875125efe8402 kernel/sched/rt.c Kirill Tkhai       2014-06-29  2036  	resched_curr(lowest_rq);
a7c81556ec4d34 kernel/sched/rt.c Peter Zijlstra     2020-09-28  2037  	ret = 1;
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2038  
1b12bbc747560e kernel/sched_rt.c Peter Zijlstra     2008-08-11  2039  	double_unlock_balance(rq, lowest_rq);
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2040  out:
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2041  	put_task_struct(next_task);
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2042  
311e800e16f63d kernel/sched_rt.c Hillf Danton       2011-06-16  2043  	return ret;
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2044  }
e8fa136262e112 kernel/sched_rt.c Steven Rostedt     2008-01-25  2045  

:::::: The code at line 1971 was first introduced by commit
:::::: a7c81556ec4d341dfdbf2cc478ead89d73e474a7 sched: Fix migrate_disable() vs rt/dl balancing

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
