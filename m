Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368124BB5DE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788631196; cv=none; b=gqIdTFtsyENEvNqtCJPrG8c3wz2Wntik8uuO9RWFUeUNqcYI4kMoHyjPC9hmM29quTZ2OglCC/Pk7H4W28B6hpZ9s3jdSDZaj1iWOOEY2mGJkAV2GX61RTOWMpt5N/lZkyau7/qUS7A7GrgRNqnh2MlHLUW5tZ3bT7BaGpJ4+1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788631196; c=relaxed/simple;
	bh=IlJG7nHrcXRYy1fYYQv+GqZx0EPKKg+dTGdlkxUdke4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j3/GFoYT21pdBU7T9gnRhgm61cUrkG0n4Ej0PUbERPb6gBQdmVyXdTLFOIbFa3QpGH1opjyairIAO3YzofMCJb4UqvXfuhPwL0am++do4dh7Q0wVFr+NGfm1o1nNcYRmOhl3HgOj5ka1BVwJDSCFpVSFlIzFSiHzLp8CgZFYG6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIgtlxaS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIgtlxaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788631194; x=1820167194;
  h=date:from:to:cc:subject:message-id;
  bh=IlJG7nHrcXRYy1fYYQv+GqZx0EPKKg+dTGdlkxUdke4=;
  b=BIgtlxaSP9MiFTjigwco/RG1eAwIi+3NdrKJLVEZMLSIIrSWA+YuvOEf
   8BzllB3QH7wmDxE02NdtD3AqakU/FdtIB4l5IlIIslJXGc/QY0wFLbFHn
   q8TWOHHMotrlFJqI8KE9B6P+asOMvcv6NO0XYllXnTXt3jMqWXvxo0Met
   sS50z7MtsOh5unJ+d90D/1c4ZGj3UWgtjRavRP03Xlf+6jHCUCBM4cOVe
   SRma3RuQwxyfsxFVp7NJsRKgsqOpCd7eGOIy6IHEaSG+Ksv2T84wS5qg3
   /Rf00xEqmGijjbcm7BbV0GsaJco3MMZ2C/3cf8yTVTlPK0A7CZY9VW2Z/
   w==;
X-CSE-ConnectionGUID: H5lhwXOPS/ehRzYcHSTo/Q==
X-CSE-MsgGUID: fRGPmk8xSfOzOJUud+pyyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="92918125"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="92918125"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 10:59:54 -0700
X-CSE-ConnectionGUID: Q5QUxfwhRXmKDd2ZgMGFJA==
X-CSE-MsgGUID: qx3V/viqSnyQ+xVyB8Sy1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="293814314"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2026 10:59:52 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2ugA-000000000v7-0ZRk;
	Sat, 05 Sep 2026 17:59:50 +0000
Date: Sun, 06 Sep 2026 01:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:posix-timers 7/8]
 kernel/time/posix-cpu-timers.c:697:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202609060118.YBPMfHB9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git posix-timers
head:   f64ba1a35b28399681f34690444e3696ef2a38ad
commit: 7342f2625bad7fc229dbf74e2b8c9df1d5c58015 [7/8] posix-cpu-timers: Prevent enqueueing when PF_EXITING is set
config: i386-randconfig-061-20260905 (https://download.01.org/0day-ci/archive/20260906/202609060118.YBPMfHB9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260906/202609060118.YBPMfHB9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609060118.YBPMfHB9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/posix-cpu-timers.c:697:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/time/posix-cpu-timers.c:697:9: sparse:     expected struct lockdep_map const *lock
   kernel/time/posix-cpu-timers.c:697:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/time/posix-cpu-timers.c:1423:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-cpu-timers.c:1423:9: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-cpu-timers.c:1423:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-cpu-timers.c:1483:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-cpu-timers.c:1483:36: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-cpu-timers.c:1483:36: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-cpu-timers.c: note: in included file:
   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *

vim +697 kernel/time/posix-cpu-timers.c

   686	
   687	/*
   688	 * Insert the timer on the appropriate list before any timers that
   689	 * expire later.  This must be called with the sighand lock held.
   690	 */
   691	static void arm_timer(struct k_itimer *timer, struct task_struct *p)
   692	{
   693		struct posix_cputimer_base *base = timer_base(timer, p);
   694		struct cpu_timer *ctmr = &timer->it.cpu;
   695		u64 newexp = cpu_timer_getexpires(ctmr);
   696	
 > 697		lockdep_assert_held(&p->sighand->siglock);
   698	
   699		timer->it_status = POSIX_TIMER_ARMED;
   700	
   701		/*
   702		 * Don't enqueue timers when the task or the group is exiting. That
   703		 * ensures that timer operations are still succeeding as long as the
   704		 * tasks are visible, but won't enqueue the timers on the task or
   705		 * process. They won't expire anyway because run_posix_cpu_timers()
   706		 * exits early when PF_EXITING is set.
   707		 *
   708		 * Enqueue is skipped if PF_EXITING is set when the timer is per task
   709		 * and when the last thread decremented p::signal::live to zero also for
   710		 * per process timers.
   711		 */
   712		if (unlikely(!task_can_enqueue(timer, p)))
   713			return;
   714	
   715		if (!cpu_timer_enqueue(&base->tqhead, ctmr))
   716			return;
   717	
   718		/*
   719		 * We are the new earliest-expiring POSIX 1.b timer, hence
   720		 * need to update expiration cache. Take into account that
   721		 * for process timers we share expiration cache with itimers
   722		 * and RLIMIT_CPU and for thread timers with RLIMIT_RTTIME.
   723		 */
   724		if (newexp < base->nextevt)
   725			base->nextevt = newexp;
   726	
   727		if (CPUCLOCK_PERTHREAD(timer->it_clock))
   728			tick_dep_set_task(p, TICK_DEP_BIT_POSIX_TIMER);
   729		else
   730			tick_dep_set_signal(p, TICK_DEP_BIT_POSIX_TIMER);
   731	}
   732	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
