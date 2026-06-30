Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700B63B4EAA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 18:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782843457; cv=none; b=WOnAP8CFfPGdQrgbZXYg5iSrUZSUdt1yhOtA39ZperqRegDU06qIefTFd8QNVjoa2UisyAFraAStrjFquMTzZoWqudg9tVkI5dw0bUrlzgENYmJTQLOS9WG5TSKiB1ozoqbSz01KWqn+03evwEq7ydVSIksaMnU6/bAVTdyrBII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782843457; c=relaxed/simple;
	bh=xycdVR0f3vXPnp023tTEOy1VPRbgvtWh34nwcV8vYyk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p/e5odIoFpB8cQ4zftOlJrpMpPWgw9vX4pNs1aE97xbLpole6LKABt4Lgn6Hhl7txkWPzeeEdYuJLX5cUlDmAu5qloqIsY6sHe9/AcHPMOvMGo2u6TT/JQwmpHE9f+ggJQtEpItVDlZydr+OKB41uSjYbAG8FOJnPzqC8p2foIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhSJa8Xs; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhSJa8Xs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782843455; x=1814379455;
  h=date:from:to:cc:subject:message-id;
  bh=xycdVR0f3vXPnp023tTEOy1VPRbgvtWh34nwcV8vYyk=;
  b=HhSJa8XsrRklrFfH3LYwjhdzK9M1zx0DfMEXV6ESO56K3hV6C2+oIeu3
   X3klmqXWSfq5Dzaqd7S2UEzFhjuB+LVJjn2+QtSO9oBMec2Z0cybJTGUc
   jCfs4dYZXZJzbaJ9yjyMSkzDkmPMrV6ijA5YreoEBKIsac7G373B/zMNy
   92i2SvBcwv4LuOijWIIIGddZ79orEkbHYp67Qm9OQ/nz0AmHonCzdf8rK
   ojOXLeKUwBZf7+DZ85g2MPQ32xN4Arj4qze01exQI36NcM9giZAq3gr3b
   zHep1WGMkFOr8EMMlv6wRaMoaiWDv3QSBLTuSJjYy/GdpgtJMiP+dRBAS
   A==;
X-CSE-ConnectionGUID: gylp2FifSAKR3NYfkucssg==
X-CSE-MsgGUID: s7jrxpJQRLWJAQXxDU/r1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83763972"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="83763972"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 11:16:21 -0700
X-CSE-ConnectionGUID: 7TI6D/0cTnmjegMQ5dgj3A==
X-CSE-MsgGUID: tpgUudM2RKmsrp2WC+8mFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="290454132"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Jun 2026 11:16:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wed0I-000000008ZP-2ipo;
	Tue, 30 Jun 2026 18:16:15 +0000
Date: Wed, 01 Jul 2026 02:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/prjc 595/670] kernel/sched/alt_core.c:487:33:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202607010246.LJptC3HN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alfred,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 7.1/prjc
head:   bb2b8160912c2185b974596c31e727ae49edf0d4
commit: bf165aaac06ca8d88bf0b207e7c43684239c5d7c [595/670] sched/alt: [Sync] 653fda7ae73d sched/mmcid: Switch over to the new mechanism
config: powerpc64-randconfig-r132-20260628 (https://download.01.org/0day-ci/archive/20260701/202607010246.LJptC3HN-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010246.LJptC3HN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607010246.LJptC3HN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/alt_core.c:487:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:487:33: sparse:     expected struct task_struct *task
   kernel/sched/alt_core.c:487:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:1694:6: sparse: sparse: symbol 'do_set_cpus_allowed' was not declared. Should it be static?
>> kernel/sched/alt_core.c:2462:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:2462:36: sparse:     expected struct task_struct const *p
   kernel/sched/alt_core.c:2462:36: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:5828:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:5828:43: sparse:     expected struct task_struct *push_task
   kernel/sched/alt_core.c:5828:43: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:3861:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:3861:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:3861:15: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:3945:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:3945:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:3945:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4029:46: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4029:46: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4029:46: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:4589:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4589:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4589:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5132:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5132:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5132:17: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:5681:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:5681:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:5681:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:923:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:923:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:923:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:1140:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1784:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1784:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1784:38: sparse:    struct task_struct const *
   kernel/sched/alt_core.c:1140:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1140:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1140:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1140:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1140:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1140:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1140:37: sparse:    struct task_struct [noderef] __rcu *

vim +487 kernel/sched/alt_core.c

78ae9aedd80b20 Alfred Chen 2021-09-02  450  
628c9dd0f141e0 Alfred Chen 2019-08-19  451  /*
628c9dd0f141e0 Alfred Chen 2019-08-19  452   * RQ-clock updating methods:
628c9dd0f141e0 Alfred Chen 2019-08-19  453   */
628c9dd0f141e0 Alfred Chen 2019-08-19  454  
628c9dd0f141e0 Alfred Chen 2019-08-19  455  static void update_rq_clock_task(struct rq *rq, s64 delta)
628c9dd0f141e0 Alfred Chen 2019-08-19  456  {
628c9dd0f141e0 Alfred Chen 2019-08-19  457  /*
628c9dd0f141e0 Alfred Chen 2019-08-19  458   * In theory, the compile should just see 0 here, and optimize out the call
628c9dd0f141e0 Alfred Chen 2019-08-19  459   * to sched_rt_avg_update. But I don't trust it...
628c9dd0f141e0 Alfred Chen 2019-08-19  460   */
628c9dd0f141e0 Alfred Chen 2019-08-19  461  	s64 __maybe_unused steal = 0, irq_delta = 0;
628c9dd0f141e0 Alfred Chen 2019-08-19  462  
628c9dd0f141e0 Alfred Chen 2019-08-19  463  #ifdef CONFIG_IRQ_TIME_ACCOUNTING
f23f196bb512cd Alfred Chen 2025-03-07  464  	if (irqtime_enabled()) {
628c9dd0f141e0 Alfred Chen 2019-08-19  465  		irq_delta = irq_time_read(cpu_of(rq)) - rq->prev_irq_time;
628c9dd0f141e0 Alfred Chen 2019-08-19  466  
628c9dd0f141e0 Alfred Chen 2019-08-19  467  		/*
628c9dd0f141e0 Alfred Chen 2019-08-19  468  		 * Since irq_time is only updated on {soft,}irq_exit, we might run into
628c9dd0f141e0 Alfred Chen 2019-08-19  469  		 * this case when a previous update_rq_clock() happened inside a
b868217725e119 Alfred Chen 2024-09-13  470  		 * {soft,}IRQ region.
628c9dd0f141e0 Alfred Chen 2019-08-19  471  		 *
628c9dd0f141e0 Alfred Chen 2019-08-19  472  		 * When this happens, we stop ->clock_task and only update the
628c9dd0f141e0 Alfred Chen 2019-08-19  473  		 * prev_irq_time stamp to account for the part that fit, so that a next
628c9dd0f141e0 Alfred Chen 2019-08-19  474  		 * update will consume the rest. This ensures ->clock_task is
628c9dd0f141e0 Alfred Chen 2019-08-19  475  		 * monotonic.
628c9dd0f141e0 Alfred Chen 2019-08-19  476  		 *
b868217725e119 Alfred Chen 2024-09-13  477  		 * It does however cause some slight miss-attribution of {soft,}IRQ
628c9dd0f141e0 Alfred Chen 2019-08-19  478  		 * time, a more accurate solution would be to update the irq_time using
628c9dd0f141e0 Alfred Chen 2019-08-19  479  		 * the current rq->clock timestamp, except that would require using
628c9dd0f141e0 Alfred Chen 2019-08-19  480  		 * atomic ops.
628c9dd0f141e0 Alfred Chen 2019-08-19  481  		 */
628c9dd0f141e0 Alfred Chen 2019-08-19  482  		if (irq_delta > delta)
628c9dd0f141e0 Alfred Chen 2019-08-19  483  			irq_delta = delta;
628c9dd0f141e0 Alfred Chen 2019-08-19  484  
628c9dd0f141e0 Alfred Chen 2019-08-19  485  		rq->prev_irq_time += irq_delta;
628c9dd0f141e0 Alfred Chen 2019-08-19  486  		delta -= irq_delta;
0c2aa73b691e0c Alfred Chen 2023-06-08 @487  		delayacct_irq(rq->curr, irq_delta);
f23f196bb512cd Alfred Chen 2025-03-07  488  	}
628c9dd0f141e0 Alfred Chen 2019-08-19  489  #endif
628c9dd0f141e0 Alfred Chen 2019-08-19  490  #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
628c9dd0f141e0 Alfred Chen 2019-08-19  491  	if (static_key_false((&paravirt_steal_rq_enabled))) {
094b69eadfa6e8 Alfred Chen 2025-03-07  492  		u64 prev_steal;
094b69eadfa6e8 Alfred Chen 2025-03-07  493  
094b69eadfa6e8 Alfred Chen 2025-03-07  494  		steal = prev_steal = paravirt_steal_clock(cpu_of(rq));
628c9dd0f141e0 Alfred Chen 2019-08-19  495  		steal -= rq->prev_steal_time_rq;
628c9dd0f141e0 Alfred Chen 2019-08-19  496  
628c9dd0f141e0 Alfred Chen 2019-08-19  497  		if (unlikely(steal > delta))
628c9dd0f141e0 Alfred Chen 2019-08-19  498  			steal = delta;
628c9dd0f141e0 Alfred Chen 2019-08-19  499  
094b69eadfa6e8 Alfred Chen 2025-03-07  500  		rq->prev_steal_time_rq = prev_steal;
628c9dd0f141e0 Alfred Chen 2019-08-19  501  		delta -= steal;
628c9dd0f141e0 Alfred Chen 2019-08-19  502  	}
628c9dd0f141e0 Alfred Chen 2019-08-19  503  #endif
628c9dd0f141e0 Alfred Chen 2019-08-19  504  
628c9dd0f141e0 Alfred Chen 2019-08-19  505  	rq->clock_task += delta;
628c9dd0f141e0 Alfred Chen 2019-08-19  506  

:::::: The code at line 487 was first introduced by commit
:::::: 0c2aa73b691e0c04afd5b833c0ca722a76441af3 sched/alt: [Sync] a3b2aeac9d15 delayacct: track delays from IRQ/SOFTIRQ

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
