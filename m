Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5916B22068A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 16:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765469416; cv=none; b=J2ebYYkMsggk2fjCc/qVlmhh+1twvSqlt+oL8v1/P/53u5Vd0nsEPtqCaDfEC1xwfYsa5EIO34e7jv9YS8WaY6h1wcGuH89ZYhcg9lpSKtFyySdiN6v5ztVJeBRlih2K5z+/sAStaFjdI0fTyCFiIMfz/Kh4nDTYSkSHp4ucaSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765469416; c=relaxed/simple;
	bh=adtK50VYFhJYnd7i6hkUCCdmwOdFQKv21zD+Kwtyb+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D6VU0vbn/t7WG0ZQclleiCBHFz8vvXeOULt24K3Unw8ZxqhJOrRdiuWtFPGIy5jZX85xUxQnO/+r8fZU5MAiOIhmgLFssdQ97K+rAneedInbeDWqk97/tJtdLrOw88HEFa3hj5CEFESNQYvX7J3dvkbsKW4bl9oyy1emYC96o8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQZjEJMD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQZjEJMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765469414; x=1797005414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=adtK50VYFhJYnd7i6hkUCCdmwOdFQKv21zD+Kwtyb+M=;
  b=AQZjEJMDGojnQdBPWsAH80Hj5+PP5cjZR20/CYlDekiKKhLgPcGdkaMD
   vwJYTq2qqULxROo3qBtVTntn3wirMrdZWRIWw1Sdrm+Xa1GzqcD9FiP8d
   8LsaQkR5uI7uB25iPZswnVWJZ+R2o2xSvR7iAyHF2vnWduktHLB211S6F
   hb4QuyAzc4Bx3u7zsfajZVI5lFoIyXzuYOCAXuzLCFdZ5SSoY/Mu1o+kv
   j1jMtajOs2z2eoeHe+vzIFFGEROO51v8yQbUmZywgHeSQ65CjBtAER+LI
   inSwhMUrsZALZanewdEsbJdYcrwfU7w5vTqY9o8gjrw3bsjjLW+uWathp
   A==;
X-CSE-ConnectionGUID: tMEna4pWTfmHyti22i9tTQ==
X-CSE-MsgGUID: 1boRBmONT8m0U7Syd4iyBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="85062051"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="85062051"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 08:10:13 -0800
X-CSE-ConnectionGUID: tz0pC+R0Rp+/XlakU7zitg==
X-CSE-MsgGUID: z/ccmaG3RSW4Y1qu6AOhWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196838829"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2025 08:10:12 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTjF3-000000004rL-2FPe;
	Thu, 11 Dec 2025 16:10:09 +0000
Date: Fri, 12 Dec 2025 00:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/rt.c:1656:15: sparse: sparse: dereference of noderef
 expression
Message-ID: <202512120039.K3b6g8aA-lkp@intel.com>
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
commit: ea100b31eed459ea32d6df4489cf70219fd83a07 sched/smp: Use the SMP version of task_on_cpu()
date:   6 months ago
config: arm-randconfig-r111-20251211 (https://download.01.org/0day-ci/archive/20251212/202512120039.K3b6g8aA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120039.K3b6g8aA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120039.K3b6g8aA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   kernel/sched/deadline.c:3032:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2225:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2225:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2225:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2225:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2225:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2225:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2236:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2236:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2236:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2225:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2225:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2225:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2236:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2236:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2236:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2225:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2225:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2225:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2225:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2225:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2225:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2236:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2236:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2236:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2236:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2236:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2236:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2419:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2419:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2419:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2236:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2236:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2236:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2419:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2419:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2419:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1289:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/rt.c:1656:15: sparse: sparse: dereference of noderef expression

vim +1656 kernel/sched/rt.c

bb44e5d1c6b3b7 kernel/sched_rt.c Ingo Molnar    2007-07-09  1635  
a0e813f26ebcb2 kernel/sched/rt.c Peter Zijlstra 2019-11-08  1636  static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, bool first)
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song    2018-10-26  1637  {
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao    2021-09-05  1638  	struct sched_rt_entity *rt_se = &p->rt;
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao    2021-09-05  1639  	struct rt_rq *rt_rq = &rq->rt;
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao    2021-09-05  1640  
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song    2018-10-26  1641  	p->se.exec_start = rq_clock_task(rq);
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao    2021-09-05  1642  	if (on_rt_rq(&p->rt))
57a5c2dafca8e3 kernel/sched/rt.c Yafang Shao    2021-09-05  1643  		update_stats_wait_end_rt(rt_rq, rt_se);
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song    2018-10-26  1644  
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song    2018-10-26  1645  	/* The running task is never eligible for pushing */
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song    2018-10-26  1646  	dequeue_pushable_task(rq, p);
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra 2019-05-29  1647  
a0e813f26ebcb2 kernel/sched/rt.c Peter Zijlstra 2019-11-08  1648  	if (!first)
a0e813f26ebcb2 kernel/sched/rt.c Peter Zijlstra 2019-11-08  1649  		return;
a0e813f26ebcb2 kernel/sched/rt.c Peter Zijlstra 2019-11-08  1650  
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra 2019-05-29  1651  	/*
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra 2019-05-29  1652  	 * If prev task was rt, put_prev_task() has already updated the
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra 2019-05-29  1653  	 * utilization. We only care of the case where we start to schedule a
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra 2019-05-29  1654  	 * rt task
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra 2019-05-29  1655  	 */
af0c8b2bf67b25 kernel/sched/rt.c Peter Zijlstra 2024-10-09 @1656  	if (rq->donor->sched_class != &rt_sched_class)
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra 2019-05-29  1657  		update_rt_rq_load_avg(rq_clock_pelt(rq), rq, 0);
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra 2019-05-29  1658  
f95d4eaee6d020 kernel/sched/rt.c Peter Zijlstra 2019-05-29  1659  	rt_queue_push_tasks(rq);
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song    2018-10-26  1660  }
ff1cdc94de4d33 kernel/sched/rt.c Muchun Song    2018-10-26  1661  

:::::: The code at line 1656 was first introduced by commit
:::::: af0c8b2bf67b25756f27644936e74fd9a6273bd2 sched: Split scheduler and execution contexts

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
