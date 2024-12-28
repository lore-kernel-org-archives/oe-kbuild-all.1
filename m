Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCA6B644
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 01:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735350440; cv=none; b=F3PUuMwSxQ1Z0c0NJotRRa52n7E/ARTA3qXNhmK008W3eEoK0ZovLfyHXuIiINVD4vXdaqs3wsLw7DT5Y+/HgDxxaz5FhjzUhpXQfVUf+weBNpk605bRHxKx4qrLECMDHClm9Z40j/LpvWZJ4OxLxKdTyH/jj/d3BsWrSGbUgZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735350440; c=relaxed/simple;
	bh=MmVi4DlBPH3lnr7Bg1Du2PT252rDoxyyKuo4AJ8Peq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lmsQguCPS22j8etxazX1xCKojjZ+BwVs8MeRORaib3bK9xvoiE3ot3Qpm8a9J2qJHAR6yX2/NA5xCrncchKtmR0VNmDR2HRlK6ky/1LTG/llUBIwsIACHDyABF8uZw2D1o+ndn7l+nufqFShD4e9Tf09xND11ELC3c9CfGhFPV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnHFrP4h; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnHFrP4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735350438; x=1766886438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MmVi4DlBPH3lnr7Bg1Du2PT252rDoxyyKuo4AJ8Peq8=;
  b=QnHFrP4hpsw+ERScgqRMq/j3T7zPHTx8PmtCvHexy9s1HXD7ns+caJZX
   G8/Q029yqGJ7OZFZUAswjV5XONHO7sknL37ZMQD/Rh38a+4QxLhb3JN7+
   bJQ+SLTFak8SgLOWyUHV11FMU7lOvBC3QcU19n2vMckOsTOA2yIFUlNBs
   D4DSwfYJ654j05A5HCk55Pq+ARKAU19eip0C4xDbYYYjZ8yyfXW6gbNxE
   3d2pyD5yv7zaBXZt5AFFXC41S/g3agL0Yx9RklSXf22HmPAtHebvpolgq
   DGc7rly7GjyfdlzD0Uve9qgNw0PZMysgq/mRbbA0PgnTz3RN453DNTU5Y
   A==;
X-CSE-ConnectionGUID: eGJqWE3mSPiv13+Fmcv/zA==
X-CSE-MsgGUID: hu0gDWzHQGipRqc3C20liQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="23334141"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="23334141"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 17:47:17 -0800
X-CSE-ConnectionGUID: Nbn+BBKuR5ChOLJFrMAoyw==
X-CSE-MsgGUID: W3SkTtJARM6gSF6IoAZ7kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137618329"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Dec 2024 17:47:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRLv7-0003nc-2X;
	Sat, 28 Dec 2024 01:47:13 +0000
Date: Sat, 28 Dec 2024 09:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2600/2600] kernel/sched/core.c:9822:6: sparse:
 sparse: symbol 'sched_setsteal' was not declared. Should it be static?
Message-ID: <202412280954.LFjWVbbl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: b7772972a0a76efac27078392f3f706914fe2af7 [2600/2600] sched/core: Add cpu.steal_task in cgroup v1 cpu subsystem
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280954.LFjWVbbl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412280954.LFjWVbbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280954.LFjWVbbl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:635:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:635:39: sparse:     expected struct task_struct *task
   kernel/sched/core.c:635:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:705:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:705:48: sparse:     expected struct task_struct *p
   kernel/sched/core.c:705:48: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:959:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:959:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:959:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1014:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1014:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1014:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2067:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2067:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2067:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2067:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2067:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2067:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2809:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:2809:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:2809:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3010:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3010:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3010:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4447:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:4447:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:4447:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5341:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5341:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:5341:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6010:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6010:17: sparse:    struct task_struct *
   kernel/sched/core.c:6010:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6208:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6208:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6208:22: sparse:    struct task_struct *
>> kernel/sched/core.c:9822:6: sparse: sparse: symbol 'sched_setsteal' was not declared. Should it be static?
>> kernel/sched/core.c:9854:5: sparse: sparse: symbol 'tg_change_steal' was not declared. Should it be static?
   kernel/sched/core.c:10398:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10398:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10398:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1411:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:460:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/sched.h:1411:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:493:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:509:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:547:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:588:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:78:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:78:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:78:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:705:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2058:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2059:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2060:37: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2163:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *
   kernel/sched/core.c:2033:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2033:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2033:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2163:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2163:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2163:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2163:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2163:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2163:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2163:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2163:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2314:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2314:9: sparse:    struct task_struct *

vim +/sched_setsteal +9822 kernel/sched/core.c

  9821	
> 9822	void sched_setsteal(struct task_struct *tsk, s64 steal_task)
  9823	{
  9824		struct sched_entity *se = &tsk->se;
  9825		int queued, running, queue_flags =
  9826				DEQUEUE_SAVE | DEQUEUE_MOVE | DEQUEUE_NOCLOCK;
  9827		struct rq_flags rf;
  9828		struct rq *rq;
  9829	
  9830		if (se->steal_task == steal_task)
  9831			return;
  9832	
  9833		rq = task_rq_lock(tsk, &rf);
  9834	
  9835		running = task_current(rq, tsk);
  9836		queued = task_on_rq_queued(tsk);
  9837	
  9838		update_rq_clock(rq);
  9839		if (queued)
  9840			dequeue_task(rq, tsk, queue_flags);
  9841		if (running)
  9842			put_prev_task(rq, tsk);
  9843	
  9844		se->steal_task = steal_task;
  9845	
  9846		if (queued)
  9847			enqueue_task(rq, tsk, queue_flags);
  9848		if (running)
  9849			set_next_task(rq, tsk);
  9850	
  9851		task_rq_unlock(rq, tsk, &rf);
  9852	}
  9853	
> 9854	int tg_change_steal(struct task_group *tg, void *data)
  9855	{
  9856		struct css_task_iter it;
  9857		struct task_struct *tsk;
  9858		s64 steal_task = *(s64 *)data;
  9859		struct cgroup_subsys_state *css = &tg->css;
  9860	
  9861		tg->steal_task = steal_task;
  9862	
  9863		css_task_iter_start(css, 0, &it);
  9864		while ((tsk = css_task_iter_next(&it)))
  9865			sched_setsteal(tsk, steal_task);
  9866		css_task_iter_end(&it);
  9867	
  9868		return 0;
  9869	}
  9870	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
