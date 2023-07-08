Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A297F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 00:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688777598; x=1720313598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=28bN9dL+8cHkxzG5WwIbAgJ7RQ83JNelvRRJsJNqgeM=;
  b=HC5TReKhCIA5bDwXXGmRt1ousxS6f4OjmlpIgo02iJw6mjfOOzl6TuLG
   qxthOgrc+0ePpPZpqgW6r/2ohDfR1GK62cQYUyg9pLLHA8sp/a93RYmyg
   ukl97H+QKVAAmT5jN88IkPjODTW4YoMNuk8dduqueLFrX4BS14qEHaOyz
   Vi+rWY4VnIgtbcubNQ29AJtY2EuySn775IjytfrcaL7av/LxJG52mzg6Y
   zQoHKPhpHXI9of+0CBb27YZRnEUB1mFm78WFFS812L3oscDn1qdA10X3Z
   XqZ9mz2Dp0mgMNJuiz0o1nUTOLFhlAPdFiG0Uem0N7WGNFs7gw6Uy+VHX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="367502897"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="367502897"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 17:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="723389474"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="723389474"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jul 2023 17:53:16 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHwCJ-0002RT-26;
	Sat, 08 Jul 2023 00:53:15 +0000
Date: Sat, 8 Jul 2023 08:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 381/386] kernel/sched/alt_core.c:4284:14: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202307080829.66pBp74B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   ea6d5107f9aa76407998568ad4cbcf54879ee0c0
commit: 4facf7f6e34125d06a1fc94cbc716e2cb1e09f82 [381/386] sched/alt: [Sync] 223baf9d17f2 sched: Fix performance regression introduced by mm_cid
config: x86_64-randconfig-x061-20230703 (https://download.01.org/0day-ci/archive/20230708/202307080829.66pBp74B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080829.66pBp74B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080829.66pBp74B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/alt_core.c:136:1: sparse: sparse: symbol 'sched_cpu_llc_mask' was not declared. Should it be static?
   kernel/sched/alt_core.c:1009:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:1009:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:1009:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:1045:6: sparse: sparse: symbol 'select_nohz_load_balancer' was not declared. Should it be static?
   kernel/sched/alt_core.c:1826:44: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1826:44: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1826:44: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:2611:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:2611:28: sparse:     expected struct task_struct const *p
   kernel/sched/alt_core.c:2611:28: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:7200:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:7200:43: sparse:     expected struct task_struct *push_task
   kernel/sched/alt_core.c:7200:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4025:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:4025:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:4025:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:4128:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4128:32: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4128:32: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:4284:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4284:14: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4284:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4747:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4747:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4747:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5283:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5283:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5283:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5433:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5433:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5433:22: sparse:    struct task_struct *
   kernel/sched/alt_core.c:7048:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:7048:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:7048:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:536:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/alt_core.c:555:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1784:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1784:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1784:38: sparse:    struct task_struct const *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *

vim +4284 kernel/sched/alt_core.c

cedcd3e67433b3 Alfred Chen 2019-08-19  4261  
cedcd3e67433b3 Alfred Chen 2019-08-19  4262  static void sched_tick_remote(struct work_struct *work)
cedcd3e67433b3 Alfred Chen 2019-08-19  4263  {
cedcd3e67433b3 Alfred Chen 2019-08-19  4264  	struct delayed_work *dwork = to_delayed_work(work);
cedcd3e67433b3 Alfred Chen 2019-08-19  4265  	struct tick_work *twork = container_of(dwork, struct tick_work, work);
cedcd3e67433b3 Alfred Chen 2019-08-19  4266  	int cpu = twork->cpu;
cedcd3e67433b3 Alfred Chen 2019-08-19  4267  	struct rq *rq = cpu_rq(cpu);
cedcd3e67433b3 Alfred Chen 2019-08-19  4268  	struct task_struct *curr;
cedcd3e67433b3 Alfred Chen 2019-08-19  4269  	unsigned long flags;
cedcd3e67433b3 Alfred Chen 2019-08-19  4270  	u64 delta;
cedcd3e67433b3 Alfred Chen 2019-08-19  4271  	int os;
cedcd3e67433b3 Alfred Chen 2019-08-19  4272  
cedcd3e67433b3 Alfred Chen 2019-08-19  4273  	/*
cedcd3e67433b3 Alfred Chen 2019-08-19  4274  	 * Handle the tick only if it appears the remote CPU is running in full
cedcd3e67433b3 Alfred Chen 2019-08-19  4275  	 * dynticks mode. The check is racy by nature, but missing a tick or
cedcd3e67433b3 Alfred Chen 2019-08-19  4276  	 * having one too much is no big deal because the scheduler tick updates
cedcd3e67433b3 Alfred Chen 2019-08-19  4277  	 * statistics and checks timeslices in a time-independent way, regardless
cedcd3e67433b3 Alfred Chen 2019-08-19  4278  	 * of when exactly it is running.
cedcd3e67433b3 Alfred Chen 2019-08-19  4279  	 */
cedcd3e67433b3 Alfred Chen 2019-08-19  4280  	if (!tick_nohz_tick_stopped_cpu(cpu))
cedcd3e67433b3 Alfred Chen 2019-08-19  4281  		goto out_requeue;
cedcd3e67433b3 Alfred Chen 2019-08-19  4282  
cedcd3e67433b3 Alfred Chen 2019-08-19  4283  	raw_spin_lock_irqsave(&rq->lock, flags);
cedcd3e67433b3 Alfred Chen 2019-08-19 @4284  	curr = rq->curr;
cedcd3e67433b3 Alfred Chen 2019-08-19  4285  	if (cpu_is_offline(cpu))
cedcd3e67433b3 Alfred Chen 2019-08-19  4286  		goto out_unlock;
cedcd3e67433b3 Alfred Chen 2019-08-19  4287  
cedcd3e67433b3 Alfred Chen 2019-08-19  4288  	update_rq_clock(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  4289  	if (!is_idle_task(curr)) {
cedcd3e67433b3 Alfred Chen 2019-08-19  4290  		/*
cedcd3e67433b3 Alfred Chen 2019-08-19  4291  		 * Make sure the next tick runs within a reasonable
cedcd3e67433b3 Alfred Chen 2019-08-19  4292  		 * amount of time.
cedcd3e67433b3 Alfred Chen 2019-08-19  4293  		 */
cedcd3e67433b3 Alfred Chen 2019-08-19  4294  		delta = rq_clock_task(rq) - curr->last_ran;
cedcd3e67433b3 Alfred Chen 2019-08-19  4295  		WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 3);
cedcd3e67433b3 Alfred Chen 2019-08-19  4296  	}
cedcd3e67433b3 Alfred Chen 2019-08-19  4297  	scheduler_task_tick(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  4298  
cedcd3e67433b3 Alfred Chen 2019-08-19  4299  	calc_load_nohz_remote(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  4300  out_unlock:
cedcd3e67433b3 Alfred Chen 2019-08-19  4301  	raw_spin_unlock_irqrestore(&rq->lock, flags);
cedcd3e67433b3 Alfred Chen 2019-08-19  4302  
cedcd3e67433b3 Alfred Chen 2019-08-19  4303  out_requeue:
cedcd3e67433b3 Alfred Chen 2019-08-19  4304  	/*
cedcd3e67433b3 Alfred Chen 2019-08-19  4305  	 * Run the remote tick once per second (1Hz). This arbitrary
cedcd3e67433b3 Alfred Chen 2019-08-19  4306  	 * frequency is large enough to avoid overload but short enough
cedcd3e67433b3 Alfred Chen 2019-08-19  4307  	 * to keep scheduler internal stats reasonably up to date.  But
cedcd3e67433b3 Alfred Chen 2019-08-19  4308  	 * first update state to reflect hotplug activity if required.
cedcd3e67433b3 Alfred Chen 2019-08-19  4309  	 */
cedcd3e67433b3 Alfred Chen 2019-08-19  4310  	os = atomic_fetch_add_unless(&twork->state, -1, TICK_SCHED_REMOTE_RUNNING);
cedcd3e67433b3 Alfred Chen 2019-08-19  4311  	WARN_ON_ONCE(os == TICK_SCHED_REMOTE_OFFLINE);
cedcd3e67433b3 Alfred Chen 2019-08-19  4312  	if (os == TICK_SCHED_REMOTE_RUNNING)
cedcd3e67433b3 Alfred Chen 2019-08-19  4313  		queue_delayed_work(system_unbound_wq, dwork, HZ);
cedcd3e67433b3 Alfred Chen 2019-08-19  4314  }
cedcd3e67433b3 Alfred Chen 2019-08-19  4315  

:::::: The code at line 4284 was first introduced by commit
:::::: cedcd3e67433b3472068caf48ea86414191e0a6b Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
