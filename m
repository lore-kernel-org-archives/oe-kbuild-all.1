Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5C312C473
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 05:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730353381; cv=none; b=dMltvEvYyN/YSlWLIbwndlGGVITrLl07JFR0KiMOz2pOtaFibGhFJb5uap7ToGU9e5gz/p7eZY0HQbM2j7LSrFrgfI9eCV/f0cx+0fBTuQhaX+lTKAuiR41YlQIP+NjofhsUHZxBJjL4cvks3upRJ8KSORic14lXxIZ91tFZlhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730353381; c=relaxed/simple;
	bh=D4tOHwOBRIiQFrDlWAa2q3iNGbOHJjF5iBULklQKDhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k8V+b2zsMaFraryOm8iLl4UioqILz86Af/GoBviZyR8EZ9xE5PrVSbMbAvZATEV+rUf8hO9IVTjW+VpWjAFb0YQ3vxox+AJl6UKpWgyWwNYoqY3wam5RcLnF3skQvVyYd3RUooA4LaTZwL/8Aw5tJDLVhi3Q9oISvMmHMeBLOos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJa3LijJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJa3LijJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730353378; x=1761889378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D4tOHwOBRIiQFrDlWAa2q3iNGbOHJjF5iBULklQKDhQ=;
  b=iJa3LijJlDDkacft1mVWl9+BBriFN/PEuwhT0/yjhff2IagSK1XGCAQC
   T7GVT1+Jb/pgtsu9TrgEaxEIRO46jOxlNBYO8w/j1d+Fjr//a5nA2kvhx
   YekDSM6HOKT0wG9LKqFJr8AInmJtDcRFSr3JmZ+MmCvdzsbN2wiGtSXIp
   TULFMJCqHHKbTE22vWAcz4eSN/nkrgzI321ow1bMLBxhOjcjodUGttMbq
   nTl0LOFaADgSbhOU7EIaO+Qz1UA2ZC0w6DNZQYF9VGGG889RPlCDOzCYD
   BvvtUZ9TNYzetaSgPH7S7Lrc8ttkbcwQPXQFzrO71CrKeGiUD8uhLV3WQ
   Q==;
X-CSE-ConnectionGUID: /THf/pMeRdyKHp3mnOFS+Q==
X-CSE-MsgGUID: NUxUyH9ISCqFzkITe5lVzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47536992"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47536992"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 22:42:58 -0700
X-CSE-ConnectionGUID: CLu+p830S7+BxlUmNFvcgQ==
X-CSE-MsgGUID: wznsqsJwRn6LlgYBkDdl8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87313371"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Oct 2024 22:42:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6NxN-000fiG-2O;
	Thu, 31 Oct 2024 05:42:53 +0000
Date: Thu, 31 Oct 2024 13:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [bigeasy-staging:ktimers_v2.5 3/3] kernel/rcu/rcutorture.c:2445:37:
 error: 'timersd' undeclared; did you mean 'ktimerd'?
Message-ID: <202410311325.AyDdMnSI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git ktimers_v2.5
head:   e5c4029a61dc897cc0ab99e2647f0e796bdde2bf
commit: e5c4029a61dc897cc0ab99e2647f0e796bdde2bf [3/3] softirq: Use a dedicated thread for timer wakeups on PREEMPT_RT.
config: arm-randconfig-003-20241031 (https://download.01.org/0day-ci/archive/20241031/202410311325.AyDdMnSI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311325.AyDdMnSI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311325.AyDdMnSI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:7,
                    from arch/arm/include/asm/percpu.h:68,
                    from include/linux/irqflags.h:19,
                    from arch/arm/include/asm/bitops.h:28,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from kernel/rcu/rcutorture.c:16:
   kernel/rcu/rcutorture.c: In function 'rcutorture_booster_init':
>> kernel/rcu/rcutorture.c:2445:37: error: 'timersd' undeclared (first use in this function); did you mean 'ktimerd'?
    2445 |                         t = per_cpu(timersd, cpu);
         |                                     ^~~~~~~
   include/linux/percpu-defs.h:219:54: note: in definition of macro '__verify_pcpu_ptr'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:263:49: note: in expansion of macro 'VERIFY_PERCPU_PTR'
     263 | #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
         |                                                 ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/rcu/rcutorture.c:2445:29: note: in expansion of macro 'per_cpu'
    2445 |                         t = per_cpu(timersd, cpu);
         |                             ^~~~~~~
   kernel/rcu/rcutorture.c:2445:37: note: each undeclared identifier is reported only once for each function it appears in
    2445 |                         t = per_cpu(timersd, cpu);
         |                                     ^~~~~~~
   include/linux/percpu-defs.h:219:54: note: in definition of macro '__verify_pcpu_ptr'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:263:49: note: in expansion of macro 'VERIFY_PERCPU_PTR'
     263 | #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
         |                                                 ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/rcu/rcutorture.c:2445:29: note: in expansion of macro 'per_cpu'
    2445 |                         t = per_cpu(timersd, cpu);
         |                             ^~~~~~~


vim +2445 kernel/rcu/rcutorture.c

  2424	
  2425	static int rcutorture_booster_init(unsigned int cpu)
  2426	{
  2427		int retval;
  2428	
  2429		if (boost_tasks[cpu] != NULL)
  2430			return 0;  /* Already created, nothing more to do. */
  2431	
  2432		// Testing RCU priority boosting requires rcutorture do
  2433		// some serious abuse.  Counter this by running ksoftirqd
  2434		// at higher priority.
  2435		if (IS_BUILTIN(CONFIG_RCU_TORTURE_TEST)) {
  2436			struct sched_param sp;
  2437			struct task_struct *t;
  2438	
  2439			t = per_cpu(ksoftirqd, cpu);
  2440			WARN_ON_ONCE(!t);
  2441			sp.sched_priority = 2;
  2442			sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
  2443	#ifdef CONFIG_IRQ_FORCED_THREADING
  2444			if (force_irqthreads()) {
> 2445				t = per_cpu(timersd, cpu);
  2446				WARN_ON_ONCE(!t);
  2447				sp.sched_priority = 2;
  2448				sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
  2449			}
  2450	#endif
  2451		}
  2452	
  2453		/* Don't allow time recalculation while creating a new task. */
  2454		mutex_lock(&boost_mutex);
  2455		rcu_torture_disable_rt_throttle();
  2456		VERBOSE_TOROUT_STRING("Creating rcu_torture_boost task");
  2457		boost_tasks[cpu] = kthread_run_on_cpu(rcu_torture_boost, NULL,
  2458						      cpu, "rcu_torture_boost_%u");
  2459		if (IS_ERR(boost_tasks[cpu])) {
  2460			retval = PTR_ERR(boost_tasks[cpu]);
  2461			VERBOSE_TOROUT_STRING("rcu_torture_boost task create failed");
  2462			n_rcu_torture_boost_ktrerror++;
  2463			boost_tasks[cpu] = NULL;
  2464			mutex_unlock(&boost_mutex);
  2465			return retval;
  2466		}
  2467		mutex_unlock(&boost_mutex);
  2468		return 0;
  2469	}
  2470	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
