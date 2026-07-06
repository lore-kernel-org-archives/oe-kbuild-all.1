Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BE7389100
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325450; cv=none; b=pfur/8pB+lyCxpl0QjmIY0iiCw+FVlcapTLgxsGbpw+bqtG+niQj5N/PMTraRvsHYGq2Z+ISdBFIvhKBosOKrx+3UkjfeD7NuXhms5hsuxZSRypelxkUxS90Sh+GqS3cDQTCRK2Tlh66kVcfZw90LXNLaL5UJZhdZsoOW9Eye4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325450; c=relaxed/simple;
	bh=5Z5uNStRHAqlanx99eHQoiJ9E3t8aoWxL0sTbQYOfdw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a79tDP+0FfZ33NwwVqRzGMzItmhU0T5XNMb4i/0ctA+T8957KtGD55DPsdVsck3kVnZJQ0aZCivvAaZaNoPrJh+D0np8PXBp5rccY/KFFYogB7MIUIXHK/haqYcSPTgKkpT8qLMAOLzNsv52OMZWN0RXF0Lakyxzgi8bqLYvYkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+zPZZxw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+zPZZxw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783325444; x=1814861444;
  h=date:from:to:cc:subject:message-id;
  bh=5Z5uNStRHAqlanx99eHQoiJ9E3t8aoWxL0sTbQYOfdw=;
  b=f+zPZZxwtwOSZtYmHck0l0ChIYToTuuQFQoj9bgcxIniFFhY/WEQKyQ8
   +9fn8LY6xwWf3iWaC89+DeSBLLZpNmOQu7LYwWcKnRjrezTcpFzEapFgB
   CqlXS0hWtZ2h/TRYJm8W+UHXkKFWbecgorqq42eJ4qfnZIpJeVedrobcy
   +EwSUtFCGUA15eDNFh2zKkkKMFfc5GAIhfO48JjIeQ8s+pIeFK4o767DX
   t+17waiMkYKMJbB00vhp9K80J7bm3pbSMNu/KjN+6nAmko8ggY+6+mHla
   NjbRT/GcUIxL9SnfKh/1+mhl4T2XB4aRmPUDvG3MDNBsKntlwpgfb54Vj
   Q==;
X-CSE-ConnectionGUID: uxSe8xlVQP6SX3MaO3TYXg==
X-CSE-MsgGUID: T321+kPSQ/Oc3BH8fMNGpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="109495960"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="109495960"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 01:10:37 -0700
X-CSE-ConnectionGUID: Ek2UYFt5TMuGF3/6V6b3ug==
X-CSE-MsgGUID: sDN8XM/1QKG/5hq++vIdvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="258545460"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jul 2026 01:10:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgePQ-00000000EC3-2TpN;
	Mon, 06 Jul 2026 08:10:32 +0000
Date: Mon, 06 Jul 2026 16:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-sub-caps-v2 50/54]
 kernel/sched/idle.c:511:45: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202607061612.ZCUUl7HP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-sub-caps-v2
head:   3b27acd4b8b011d25b3014f7b0c8cbab856abdc2
commit: 52d7e96c18de37f8f3d73a84857db4507f3ebd0d [50/54] sched_ext: Route ops.update_idle() to sub-schedulers and re-notify owed scheds
config: mips-randconfig-r132-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061612.ZCUUl7HP-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061612.ZCUUl7HP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061612.ZCUUl7HP-lkp@intel.com/

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
