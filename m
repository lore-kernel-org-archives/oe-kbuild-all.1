Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB02E25DB1A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835137; cv=none; b=AwT92d8OmynfSklTxTt/ebHaB9ujrvCM7jnl+w6CEBmy4LtNsEnayzudD7qQAOZWnkzxYzGmeltkwBs9W4duLf5IJI4PyBG/CsKKcGpAWRLzHFG1Z5ZtUwlDY2420Q4/m0UW0ZU366oBA2LGVXLSbXcZbTT9mh8xvjkcfJ/Lkcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835137; c=relaxed/simple;
	bh=FITalY+u0IrQct1NNviMLI4r4/g5jKNjq0mX5sMX5NA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uotVCPO+QMfN59jaOOfkfk6q21cc3NVloIarux/fFnz7XVTt13tr5bjl1MtiPbCyvDPUC71HOFkC5XDaLv4qI2SydJcf+WyJmXaj1CtSnN3b1xrJeyt4TYuI7rtnLh4NKrGeu2w0RFz/8i9DLFYbOl0VktPwPOP5mTB39KhvcYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWlX0n+f; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWlX0n+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773835136; x=1805371136;
  h=date:from:to:cc:subject:message-id;
  bh=FITalY+u0IrQct1NNviMLI4r4/g5jKNjq0mX5sMX5NA=;
  b=LWlX0n+fJrGTkGCHx/eB3QMuUqmN6wlGjMN7tEK+vwf0av521toEZHL1
   Q0Ly87O2BOOrGhCLiV8NaACMtWsN7AViT8gn21Uz03fLlklH6RDdPH8FJ
   +fcxbEu3YqlglrvXrhskUMBJOjOOXR8iReqOX3bAPAwGebFzXsxVuyJEo
   zMDucWryOHQz8+1FQvE0MPNQMM8pcRmsTkOy20BcOB1eR2driXKsqtC1g
   ms28OEtuOMGniVM3+IFXVjYZ6wZEcWZwYLKojBkUbO4bvg68W+h7u6K6D
   ECHJkOjA7eiSf238HFuiwiX0TIQgxGpuNmK8O9IQUTZf3IJwxU9Y3PzNz
   w==;
X-CSE-ConnectionGUID: fkDdkJIZQx63g8DNCe2tLQ==
X-CSE-MsgGUID: HAtgtfF5TMCSWK973BRxLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74915352"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74915352"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 04:58:55 -0700
X-CSE-ConnectionGUID: So4euo1eRvuSHNekATTF8Q==
X-CSE-MsgGUID: P+PxpUAbTOewOHej1KMnSQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Mar 2026 04:58:54 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2pY3-000000002s5-2EUc;
	Wed, 18 Mar 2026 11:58:51 +0000
Date: Wed, 18 Mar 2026 19:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 9/9] kernel/sched/fair.c:1368:38:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202603181922.0zqh2Rch-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   ce21f9c3b62573e0077e18d71aaaa0ed92250a6b
commit: ce21f9c3b62573e0077e18d71aaaa0ed92250a6b [9/9] sched/eevdf: Move to a single runqueue
config: m68k-randconfig-r122-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181922.0zqh2Rch-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181922.0zqh2Rch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181922.0zqh2Rch-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1275:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1275:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1275:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1309:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1309:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1309:33: sparse:     got struct sched_entity [noderef] __rcu *
>> kernel/sched/fair.c:1368:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1368:38: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1368:38: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:13122:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13122:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13122:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8597:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8597:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8597:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8799:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8799:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8799:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8974:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8974:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8974:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9007:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9007:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:9007:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9205:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9205:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:9205:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:10241:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10241:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:10241:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10874:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10874:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10874:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12347:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12347:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12347:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11985:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11985:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11985:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12483:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12483:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12483:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6910:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:1403:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1403:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1403:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1403:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1403:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1403:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1403:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1403:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1403:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1403:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1403:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1403:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1403:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1403:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1403:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2385:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2385:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2385:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2374:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2374:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2374:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2385:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2385:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2385:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2385:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2385:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2385:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2385:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2385:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2385:26: sparse:    struct task_struct *

vim +1368 kernel/sched/fair.c

  1365	
  1366	static void update_curr_fair(struct rq *rq)
  1367	{
> 1368		struct sched_entity *se = &rq->donor->se;
  1369	
  1370		for_each_sched_entity(se)
  1371			update_curr(cfs_rq_of(se));
  1372	}
  1373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
