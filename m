Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644C2448BB6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 21:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786569105; cv=none; b=N3JTUkX5eLyY9AmN9Xn4jLyqRY+FzdyPzurGsuLkEdVrJ3earnmGgOEZB+0af/VqApcBX7xwlGqG0vChh/FR8epLGWk4P8JH6P3rQ7Mk9qyox1W6EhFRM7GekKRjEbIDOQ8626IYV64GwVlvgz2pp8GE5ZpQuEn+YbyDF+ybYVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786569105; c=relaxed/simple;
	bh=Fmh6oyuC21q4nalAMbVi4jaakgHVqHtvAy/QtSdHgiE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oDjVXTIfOAZe8kebUynhHjq2l5ZnnpTZLS2d8YeGLXp1xb5pHyaT5dNdTKqYZk1j91Co47uhWvw5eEmkFjPpB35HuGd75mN1qhKEsZK6ne4TgZMHAVrg1QmL+E28IeypEf4SwfGRTkuBQ8rNZC8c2zNs3dfknWWBsrj6fFFviQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIuLPT3m; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIuLPT3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786569103; x=1818105103;
  h=date:from:to:cc:subject:message-id;
  bh=Fmh6oyuC21q4nalAMbVi4jaakgHVqHtvAy/QtSdHgiE=;
  b=AIuLPT3mSeGDlwyYC8yAwZ3z9Am42TU5/wRjYTiisatlRr9bCwZEWevh
   z9Tvyyy6JUSesUIRjvxSmp2YxclS0uSqjI6fnWDU8BVCnepPSCtuBeGM/
   q9ijucivz3j9A0W6cdi1pdTT8GRKINXTg0hRAvG6mMiEO5NlOtVYPjNBo
   ttELgqoWgIlxztp9Afh8IYjcQz3l4BDj6RW3j4aieagUtZahwbA7uDRqH
   BrhXyGVxYO1DZ8LBvzugJcg3mKQNodCKqy5UIraho2b3OrFRhsPIik9rV
   9cbKVaCB5lOHuRphNTJyX5ePhLYp52HmxwVAOYsYPURBd21CFKVquvjd0
   g==;
X-CSE-ConnectionGUID: x9X7kiqPSYqMzUXDKc39tQ==
X-CSE-MsgGUID: Lo9P6uSmTl2M2dGG6YSB0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87351113"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87351113"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 14:11:43 -0700
X-CSE-ConnectionGUID: ZKfjXtYOSqS39gRAifOBHw==
X-CSE-MsgGUID: 8kNbnTKzRzqaUEqktSCR7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="302010204"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Aug 2026 14:11:41 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuGEd-00000000Rj8-0cpa;
	Wed, 12 Aug 2026 21:11:39 +0000
Date: Thu, 13 Aug 2026 05:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andrea Righi <arighi@nvidia.com>
Subject: [linux-next:master 4493/14447] kernel/sched/idle.c:511:45:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202608130538.MRGPIzQa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5e6de6a2b522f659defacb1551d0465ba6ce13cf
commit: ca3aec453d64d2ad89156c10a2e1b15a93b9fe50 [4493/14447] sched_ext: Route ops.update_idle() to sub-schedulers and re-notify owed scheds
config: x86_64-randconfig-122-20260812 (https://download.01.org/0day-ci/archive/20260813/202608130538.MRGPIzQa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130538.MRGPIzQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130538.MRGPIzQa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/idle.c:511:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/idle.c:511:45: sparse:     expected struct task_struct const *p
   kernel/sched/idle.c:511:45: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:2325:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2325:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2325:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:976:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:976:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:976:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1498:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1498:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1498:31: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1826:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1826:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1826:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1517:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1517:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1517:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1518:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1518:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1518:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1579:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1579:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1579:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1605:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1605:35: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1605:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1627:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1627:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1627:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1652:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1652:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1652:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2002:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2002:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2002:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2025:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2025:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2025:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2376:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2376:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2376:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2378:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2378:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2378:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2378:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2378:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2378:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:3151:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3151:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3151:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3161:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3161:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:3161:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3267:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3267:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:3267:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2744:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2744:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2744:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2754:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2754:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2754:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1188:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1188:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1188:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1188:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1188:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1188:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1286:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1286:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1286:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1815:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1815:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1815:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1815:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1815:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1815:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2130:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2130:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2130:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2973:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2973:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2973:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2618:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2618:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2618:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2619:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2619:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2619:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2693:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2693:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2693:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2713:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2713:35: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2713:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3312:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:3312:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:3312:38: sparse:     got struct task_struct [noderef] __rcu *curr

vim +511 kernel/sched/idle.c

   503	
   504	struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
   505	{
   506		/*
   507		 * Notify scx only on an idle-to-idle re-pick (the cpu was already idle).
   508		 * A real task->idle transition is delivered by set_next_task_idle(), so
   509		 * calling here too would duplicate it.
   510		 */
 > 511		if (scx_enabled() && is_idle_task(rq->curr))
   512			scx_update_idle(rq, true, false);
   513		return rq->idle;
   514	}
   515	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
