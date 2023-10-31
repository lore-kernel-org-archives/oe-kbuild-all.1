Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A2A1D54A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 12:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFw/tddB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698753950; x=1730289950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U2liCR6h/fApxwEs5YbqEaa6V1pMJXckpRW4j8FxC9Q=;
  b=nFw/tddBrGwaSTutdIwvLlmcUgsFxbOs4vFNwO3HQxpwvcL/e/0T6NvG
   +OzaUpOAetD60ukN0yzCdBY/j5iQ59IOVJJpr5LGmOaZNXDeTrHApzd8s
   UHdRqv8X6GE31lS0GsOFI3rwJ/eAW1eCAxdPGyHVequLm0qrGn+B5jTGg
   9/1TtzNceYiBr2uy9Gf/Z3LTZVeyi+K3wKPggu0W3EwTZZR+YzQiMKsIp
   QfaRdyMt/iM84vpGsnNI2UKNXqezgtYHAVUj4T4Q7isOy8KMZD2Vp/nWv
   ucohHc+hW5gY6p1aaulrLjHoMhCuUutLA2xxosNW7l4r6vJagTQvEHHdo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="392135015"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="392135015"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 05:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1776054"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2023 05:05:45 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxnV8-00008u-22;
	Tue, 31 Oct 2023 12:05:42 +0000
Date: Tue, 31 Oct 2023 20:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Chengming Zhou <zhouchengming@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: kernel/sched/core.c:711:31: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202310311921.TywchFFd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a6a09e97199d6600d31383055f9d43fbbcbe86f
commit: 52b1364ba0b105122d6de0e719b36db705011ac1 sched/psi: Add PSI_IRQ to track IRQ/SOFTIRQ pressure
date:   1 year, 2 months ago
config: x86_64-randconfig-r031-20230909 (https://download.01.org/0day-ci/archive/20231031/202310311921.TywchFFd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311921.TywchFFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311921.TywchFFd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/core.c:711:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:711:31: sparse:     expected struct task_struct *task
   kernel/sched/core.c:711:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:781:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:781:48: sparse:     expected struct task_struct *p
   kernel/sched/core.c:781:48: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1028:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1028:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1028:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2192:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2192:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2192:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2192:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2192:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2192:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5441:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5441:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5441:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6387:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6387:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6387:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6913:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6913:17: sparse:    struct task_struct *
   kernel/sched/core.c:6913:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7129:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7129:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7129:22: sparse:    struct task_struct *
   kernel/sched/core.c:11188:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11188:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11188:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:537:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:570:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:586:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:624:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:665:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c:781:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2183:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2184:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2185:18: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1594:9: sparse: sparse: context imbalance in 'ttwu_runnable' - wrong count at exit
   kernel/sched/core.c:4266:9: sparse: sparse: context imbalance in 'task_call_func' - wrong count at exit
   kernel/sched/sched.h:1594:9: sparse: sparse: context imbalance in 'wake_up_new_task' - wrong count at exit
   kernel/sched/core.c:5100:9: sparse: sparse: context imbalance in 'finish_task_switch' - wrong count at exit
   kernel/sched/sched.h:2060:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2060:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2060:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2217:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2217:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2217:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2217:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2217:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2217:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2060:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2060:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2060:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2217:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2217:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2217:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2060:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2060:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2060:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2217:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2217:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2217:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2060:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2060:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2060:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2217:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2217:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2217:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2060:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2060:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2060:25: sparse:    struct task_struct *

vim +711 kernel/sched/core.c

   675	
   676	/*
   677	 * RQ-clock updating methods:
   678	 */
   679	
   680	static void update_rq_clock_task(struct rq *rq, s64 delta)
   681	{
   682	/*
   683	 * In theory, the compile should just see 0 here, and optimize out the call
   684	 * to sched_rt_avg_update. But I don't trust it...
   685	 */
   686		s64 __maybe_unused steal = 0, irq_delta = 0;
   687	
   688	#ifdef CONFIG_IRQ_TIME_ACCOUNTING
   689		irq_delta = irq_time_read(cpu_of(rq)) - rq->prev_irq_time;
   690	
   691		/*
   692		 * Since irq_time is only updated on {soft,}irq_exit, we might run into
   693		 * this case when a previous update_rq_clock() happened inside a
   694		 * {soft,}irq region.
   695		 *
   696		 * When this happens, we stop ->clock_task and only update the
   697		 * prev_irq_time stamp to account for the part that fit, so that a next
   698		 * update will consume the rest. This ensures ->clock_task is
   699		 * monotonic.
   700		 *
   701		 * It does however cause some slight miss-attribution of {soft,}irq
   702		 * time, a more accurate solution would be to update the irq_time using
   703		 * the current rq->clock timestamp, except that would require using
   704		 * atomic ops.
   705		 */
   706		if (irq_delta > delta)
   707			irq_delta = delta;
   708	
   709		rq->prev_irq_time += irq_delta;
   710		delta -= irq_delta;
 > 711		psi_account_irqtime(rq->curr, irq_delta);
   712	#endif
   713	#ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
   714		if (static_key_false((&paravirt_steal_rq_enabled))) {
   715			steal = paravirt_steal_clock(cpu_of(rq));
   716			steal -= rq->prev_steal_time_rq;
   717	
   718			if (unlikely(steal > delta))
   719				steal = delta;
   720	
   721			rq->prev_steal_time_rq += steal;
   722			delta -= steal;
   723		}
   724	#endif
   725	
   726		rq->clock_task += delta;
   727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
