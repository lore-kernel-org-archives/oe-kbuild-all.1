Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13C11870
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 04:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689310226; x=1720846226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x69etJsP2Sl0674Mz+BinnTBgYTkEIXdk385MVNefhQ=;
  b=RfNGhjDNBozkQeO+aVd8rDl7M5XqcZ1WlUSJzNci+YyGbD3LUh7AO7Q1
   EN+4PIpj/DHnIbXjY7rxN5vuarEjqd0td22yxrsE/Fkczc5T5yRMpCVso
   HYmQzn1GNC50kidZLbWNhBdJXumfBamrue8aKUwH3+bT5PJ6nwor0ojxl
   5jgOLPANIkpGyT3uxl08qfI8WvfQIYc0rh3Z6khFc98ijmUghzG1s83ed
   MfefN8asidvkbMLUc9HxlY0s+OTkCt5wKYvRDFsYxDIWXZvRg31N4od0V
   6hs6OvOdkrBcxuWGyyLZUo3huzs6w0ck9F0Xvmc0Ua9AroQHUQ8rajBV7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="431561311"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="431561311"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 21:50:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792311567"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="792311567"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2023 21:50:22 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKAl4-0007Bs-0H;
	Fri, 14 Jul 2023 04:50:22 +0000
Date: Fri, 14 Jul 2023 12:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Valentin Schneider <valentin.schneider@arm.com>,
	Connor O'Brien <connoro@google.com>,
	John Stultz <jstultz@google.com>
Subject: [arm-de:tip/sched/core_20232906_proxy_exec_v4_orig_part 11/11]
 kernel/sched/core.c:6789:15: error: 'struct rq' has no member named
 'balance_callback'
Message-ID: <202307141207.GKXDYyg5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.gitlab.arm.com/linux-arm/linux-de.git tip/sched/core_20232906_proxy_exec_v4_orig_part
head:   b3eb0410c0a54bdb052712b00fa6caa5760ffa9b
commit: b3eb0410c0a54bdb052712b00fa6caa5760ffa9b [11/11] sched: Add proxy execution
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230714/202307141207.GKXDYyg5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141207.GKXDYyg5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141207.GKXDYyg5-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c:3868:6: warning: no previous prototype for 'ttwu_proxy_skip_wakeup' [-Wmissing-prototypes]
    3868 | bool ttwu_proxy_skip_wakeup(struct rq *rq, struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'proxy_migrate_task':
   kernel/sched/core.c:6770:35: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    6770 |                 int wake_cpu = p->wake_cpu;
         |                                   ^~~~~~~~
         |                                   wake_q
   kernel/sched/core.c:6786:20: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    6786 |                 p->wake_cpu = wake_cpu;
         |                    ^~~~~~~~
         |                    wake_q
>> kernel/sched/core.c:6789:15: error: 'struct rq' has no member named 'balance_callback'
    6789 |         if (rq->balance_callback)
         |               ^~


vim +6789 kernel/sched/core.c

  6712	
  6713	static struct task_struct *
  6714	proxy_migrate_task(struct rq *rq, struct task_struct *next,
  6715			   struct rq_flags *rf, struct task_struct *p,
  6716			   int that_cpu, bool curr_in_chain)
  6717	{
  6718		struct rq *that_rq;
  6719		LIST_HEAD(migrate_list);
  6720	
  6721		/*
  6722		 * If the blocked-on relationship crosses CPUs, migrate @p to the
  6723		 * @owner's CPU.
  6724		 *
  6725		 * This is because we must respect the CPU affinity of execution
  6726		 * contexts (@owner) but we can ignore affinity for scheduling
  6727		 * contexts (@p). So we have to move scheduling contexts towards
  6728		 * potential execution contexts.
  6729		 */
  6730		that_rq = cpu_rq(that_cpu);
  6731	
  6732		/*
  6733		 * @owner can disappear, simply migrate to @that_cpu and leave that CPU
  6734		 * to sort things out.
  6735		 */
  6736	
  6737		/*
  6738		 * Since we're going to drop @rq, we have to put(@next) first,
  6739		 * otherwise we have a reference that no longer belongs to us.  Use
  6740		 * @fake_task to fill the void and make the next pick_next_task()
  6741		 * invocation happy.
  6742		 *
  6743		 * CPU0				CPU1
  6744		 *
  6745		 *				B mutex_lock(X)
  6746		 *
  6747		 * A mutex_lock(X) <- B
  6748		 * A __schedule()
  6749		 * A pick->A
  6750		 * A proxy->B
  6751		 * A migrate A to CPU1
  6752		 *				B mutex_unlock(X) -> A
  6753		 *				B __schedule()
  6754		 *				B pick->A
  6755		 *				B switch_to (A)
  6756		 *				A ... does stuff
  6757		 * A ... is still running here
  6758		 *
  6759		 *		* BOOM *
  6760		 */
  6761		put_prev_task(rq, next);
  6762		if (curr_in_chain) {
  6763			rq_set_selected(rq, rq->idle);
  6764			set_tsk_need_resched(rq->idle);
  6765			return rq->idle;
  6766		}
  6767		rq_set_selected(rq, rq->idle);
  6768	
  6769		for (; p; p = p->blocked_donor) {
  6770			int wake_cpu = p->wake_cpu;
  6771	
  6772			WARN_ON(p == rq->curr);
  6773	
  6774			deactivate_task(rq, p, 0);
  6775			set_task_cpu(p, that_cpu);
  6776			/*
  6777			 * We can abuse blocked_entry to migrate the thing,
  6778			 * because @p is still on the rq.
  6779			 */
  6780			list_add(&p->blocked_entry, &migrate_list);
  6781	
  6782			/*
  6783			 * Preserve p->wake_cpu, such that we can tell where it
  6784			 * used to run later.
  6785			 */
  6786			p->wake_cpu = wake_cpu;
  6787		}
  6788	
> 6789		if (rq->balance_callback)
  6790			__balance_callbacks(rq);
  6791	
  6792		rq_unpin_lock(rq, rf);
  6793		raw_spin_rq_unlock(rq);
  6794		raw_spin_rq_lock(that_rq);
  6795	
  6796		while (!list_empty(&migrate_list)) {
  6797			p = list_first_entry(&migrate_list, struct task_struct, blocked_entry);
  6798			list_del_init(&p->blocked_entry);
  6799	
  6800			enqueue_task(that_rq, p, 0);
  6801			check_preempt_curr(that_rq, p, 0);
  6802			p->on_rq = TASK_ON_RQ_QUEUED;
  6803		}
  6804	
  6805		raw_spin_rq_unlock(that_rq);
  6806		raw_spin_rq_lock(rq);
  6807		rq_repin_lock(rq, rf);
  6808	
  6809		return NULL; /* Retry task selection on _this_ CPU. */
  6810	}
  6811	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
