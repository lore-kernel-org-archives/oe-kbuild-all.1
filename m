Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B98C07
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 06:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730354641; cv=none; b=Yl4HmzWk1xJoxjB1WMT+j++sRfR+eKgX4XmqjZmKAzWTl2EGUGBhoI3XfxNGsl1ZfLqIMf/17VNy5tygiaGPAlgTTgCy4WsyLiq1SYARqNi+lYmD0xzJCPiGh4gzPQlUfmamgjbMCGamxSpDmtRaw32E2Agb+mMCu1O8Uxm3Oo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730354641; c=relaxed/simple;
	bh=hruFAzgsiros9vIZNERbTOhEqgqMNMz9j8xZzMu053Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bagVwXvzIJ8imrhm2qdHSlr2UeUVB8QCzmy9bUtDB1hwW2U+RnFfqSWBlkmxHuralevKOZ0T3/EN0eMkJANjYcFSvDWEH+is19nrnLrhIGPRXYvBR7VuNIE1IjOYvGkefEPhb4B7W1MQuBetEMiXNihiFpK135jZRGtx+89cfcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ohp0cCZD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ohp0cCZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730354640; x=1761890640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hruFAzgsiros9vIZNERbTOhEqgqMNMz9j8xZzMu053Y=;
  b=Ohp0cCZD5iRrJqDgtgmdzq23pmNm85jPcW9WbCsQYIlm6VISpvRzIFtB
   NXirbLksfZe2kg1+fIZuiJGgiAWMeDoJrBVIWxu6x+6u6bZVU7ts28XX3
   2ex3kikYqQtZdUwNIVWWHX6WyngTWu6BPA2Fr5RMfxLZzt+6evh5ltDML
   xhQ8ynBdySzDcj6pl15plYidiBOd+pVFzIMicRnpdcFjktv70N9kpNeUo
   5TP5yqjdVGqJIeED1svspfsIhWs2YP45xcQaJwYu/+VcADEW5uSCJaRSe
   /hvYAZexSzMFAk7GtxJfMv2YItAR1WVovCNXn5WVP+7wXlmepSlO9BLX5
   w==;
X-CSE-ConnectionGUID: 7hZKNdZBRomKTXSM5JVVow==
X-CSE-MsgGUID: dQiO6VgvRpqBWc8FSMQlpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29937423"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29937423"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 23:03:59 -0700
X-CSE-ConnectionGUID: jFCWJOlzRL+UG/jCaLoNyA==
X-CSE-MsgGUID: yhaMBDoTTI6mB/KmK/B/WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82847731"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Oct 2024 23:03:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6OHi-000fjT-2E;
	Thu, 31 Oct 2024 06:03:54 +0000
Date: Thu, 31 Oct 2024 14:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [bigeasy-staging:ktimers_v2.5 3/3] kernel/rcu/rcutorture.c:2445:16:
 error: use of undeclared identifier 'timersd'
Message-ID: <202410311444.1PayqJk2-lkp@intel.com>
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
config: x86_64-randconfig-161-20241031 (https://download.01.org/0day-ci/archive/20241031/202410311444.1PayqJk2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311444.1PayqJk2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311444.1PayqJk2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/rcutorture.c:47:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/rcu/rcutorture.c:2445:16: error: use of undeclared identifier 'timersd'
    2445 |                         t = per_cpu(timersd, cpu);
         |                                     ^
>> kernel/rcu/rcutorture.c:2445:16: error: use of undeclared identifier 'timersd'
>> kernel/rcu/rcutorture.c:2445:16: error: use of undeclared identifier 'timersd'
   kernel/rcu/rcutorture.c:2445:8: error: indirection requires pointer operand ('void' invalid)
    2445 |                         t = per_cpu(timersd, cpu);
         |                             ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:28: note: expanded from macro 'per_cpu'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 4 errors generated.


vim +/timersd +2445 kernel/rcu/rcutorture.c

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
