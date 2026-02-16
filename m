Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC2614A62B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 17:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771263024; cv=none; b=RZXl4YL4WQEMFK+nOIIja/4vR9/n7x35W9Sbh2D+SEkwQHAXx8B4Bhxp5nc9Z0saBcBSwSpuhJq8OV18m+6b4wXebNNxPfqSfO3uM8AeG598zZStr+3eAXQNGy0m3h/IxBBJLXJfufnebeFRpi/e5Qe4Y2Uje+sq9wBgy1K1Ox8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771263024; c=relaxed/simple;
	bh=7ToJadfQUXNV8kXVrjxwfSkp8KksC05/geItwzISbgg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N92Eej/1h36pDNE9cP1AeV1sTPwx8PLbxjLmM3lv1gdH5xeruvpLCG2Bdw6AlG4xpK+YxgNYx08pb+galXqQsLGVIfhjVFdZtb9FwPxedYV2HdQn74sR8bE4QCeVnEdgmz4niDISnmQU1stRZ6cJ8dh7/UFvkz0ip4/IxOhwx8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXxMtnse; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXxMtnse"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771263023; x=1802799023;
  h=date:from:to:cc:subject:message-id;
  bh=7ToJadfQUXNV8kXVrjxwfSkp8KksC05/geItwzISbgg=;
  b=KXxMtnseOKSCMZ2PegA6P4NOYUeAAQbC5QKkpBW2qmBWF9098ZqDrnaL
   joIB2vQ4DKOhRMgnWXnjjp7ply4zOlgp5wksCFyJ7k4NKhBEpsL3Z1mu9
   yBw/738IIJwtUBrutnzcGdNBK8Esvc8gPr6k3JF9LFyNbC/rmhehzKblN
   QN9KBuTZU7QXKUdvdvWEnGM8xhf1zsePRx2JDglZSHz/Keup3f5oJp5Ug
   U/Bih1ud0W3pjHlwXw4I8XQtiP53tXzZ8LyZZYJubQ023TfwLXAdAit4c
   PMMurP7u3QiDSzDweZYf9tN47fcZ+CUsazpi4oXPWZJ1In5eIzwsyAH1Q
   g==;
X-CSE-ConnectionGUID: UW/f10mXTAGPgjj6895n0Q==
X-CSE-MsgGUID: PHi/NimAQdasUrDQfIv52w==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72440354"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72440354"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 09:30:22 -0800
X-CSE-ConnectionGUID: NjlcaSMZRFefBQfHDdZSsw==
X-CSE-MsgGUID: DudC8q30TDayQBG43o+3/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="213766123"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Feb 2026 09:30:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs2QL-0000000108Q-0VI1;
	Mon, 16 Feb 2026 17:30:17 +0000
Date: Tue, 17 Feb 2026 01:29:51 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Juri Lelli <juri.lelli@redhat.com>,
 "Connor O'Brien" <connoro@google.com>, John Stultz <jstultz@google.com>,
 Metin Kaya <metin.kaya@arm.com>
Subject: kernel/sched/fair.c:1203:39: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202602170126.C1jPrrS3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: af0c8b2bf67b25756f27644936e74fd9a6273bd2 sched: Split scheduler and execution contexts
date:   1 year, 4 months ago
config: i386-randconfig-062-20260216 (https://download.01.org/0day-ci/archive/20260217/202602170126.C1jPrrS3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170126.C1jPrrS3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170126.C1jPrrS3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:1203:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:1203:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:1203:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:1261:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1261:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1261:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12772:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12772:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12772:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6103:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6103:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6103:22: sparse:    struct task_struct *
   kernel/sched/fair.c:7036:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7036:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:7036:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8404:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8404:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8404:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8608:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8608:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8608:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8753:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8753:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8753:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8784:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8784:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8784:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8995:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8995:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8995:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9966:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9966:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9966:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10588:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10588:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10588:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12011:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12011:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12011:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11661:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11661:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11661:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12120:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12120:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12120:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7517:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7517:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7517:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7523:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7523:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7523:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7530:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7530:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7530:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7538:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7538:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7538:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8692:9: sparse: sparse: context imbalance in 'task_dead_fair' - wrong count at exit
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2496:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2496:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2496:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *

vim +1203 kernel/sched/fair.c

  1197	
  1198	/*
  1199	 * Used by other classes to account runtime.
  1200	 */
  1201	s64 update_curr_common(struct rq *rq)
  1202	{
> 1203		struct task_struct *donor = rq->donor;
  1204		s64 delta_exec;
  1205	
  1206		delta_exec = update_curr_se(rq, &donor->se);
  1207		if (likely(delta_exec > 0))
  1208			update_curr_task(donor, delta_exec);
  1209	
  1210		return delta_exec;
  1211	}
  1212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
