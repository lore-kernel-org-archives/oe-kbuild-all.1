Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745EF611E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 22:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689288555; x=1720824555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vpp39E0MfTzHx6GS4A/Qhvf8RwlshBgYZMU+3UPhokg=;
  b=I+F5VWn1CfbCqrv91Xr36RYIELJmLynK3TJETyyf7y/Db3RBNVfdLtOd
   ONVpIsYyiD36GCV/1SOwrjvgdW1quhpmQBLf4xEIe7IliA/MshsQuqGmL
   5TGKP5nSTW9V0LNKrd0DLw4reYqDD48VAnJ1h/mZWMXxYXnGKBIbFuo7h
   rYCdClE3v8/eSb2F21FobVn/C1TxQP2h8Kz3KjEmUhYxEl9gs6feXzFJM
   wfkST38Dd/8VrdEbb2QsYiSP5XYTl9G04PTq8nAWpDp4X5KQP8SH2S5ed
   ojQF7PlbqEiPXGSjhhxxErW0x4aohuc7EhZHQuPoWtLzwpXOjooNUlueV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="344929495"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="344929495"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 15:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="716130192"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="716130192"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Jul 2023 15:49:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK57W-0006xV-2x;
	Thu, 13 Jul 2023 22:49:10 +0000
Date: Fri, 14 Jul 2023 06:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Valentin Schneider <valentin.schneider@arm.com>,
	Connor O'Brien <connoro@google.com>,
	John Stultz <jstultz@google.com>
Subject: [arm-de:tip/sched/core_20232906_proxy_exec_v4 11/12]
 kernel/sched/core.c:7178:35: sparse: sparse: incorrect type in argument 2
 (different address spaces)
Message-ID: <202307140640.AcNREOA9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.gitlab.arm.com/linux-arm/linux-de.git tip/sched/core_20232906_proxy_exec_v4
head:   6a8f4ce70148c468ef287fc38700ed2217f94c43
commit: 77312af3338107c40b838680697cfb854bcf7326 [11/12] sched: Add proxy execution
config: um-randconfig-r083-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140640.AcNREOA9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140640.AcNREOA9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140640.AcNREOA9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:1044:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1044:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1044:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2204:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2204:36: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:2204:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2215:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2215:64: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2215:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5790:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5790:36: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5790:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7088:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:7088:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:7088:14: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:7178:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:7178:35: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:7178:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7648:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7648:17: sparse:    struct task_struct *
   kernel/sched/core.c:7648:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7864:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7864:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7864:22: sparse:    struct task_struct *
   kernel/sched/core.c:12006:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:12006:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:12006:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:552:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:585:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:601:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:639:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:680:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2105:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2105:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2105:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2295:18: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:18: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2295:18: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:18: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2295:18: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:18: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2295:18: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:18: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2295:18: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:18: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2105:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct *

vim +7178 kernel/sched/core.c

  7036	
  7037	/*
  7038	 * __schedule() is the main scheduler function.
  7039	 *
  7040	 * The main means of driving the scheduler and thus entering this function are:
  7041	 *
  7042	 *   1. Explicit blocking: mutex, semaphore, waitqueue, etc.
  7043	 *
  7044	 *   2. TIF_NEED_RESCHED flag is checked on interrupt and userspace return
  7045	 *      paths. For example, see arch/x86/entry_64.S.
  7046	 *
  7047	 *      To drive preemption between tasks, the scheduler sets the flag in timer
  7048	 *      interrupt handler scheduler_tick().
  7049	 *
  7050	 *   3. Wakeups don't really cause entry into schedule(). They add a
  7051	 *      task to the run-queue and that's it.
  7052	 *
  7053	 *      Now, if the new task added to the run-queue preempts the current
  7054	 *      task, then the wakeup sets TIF_NEED_RESCHED and schedule() gets
  7055	 *      called on the nearest possible occasion:
  7056	 *
  7057	 *       - If the kernel is preemptible (CONFIG_PREEMPTION=y):
  7058	 *
  7059	 *         - in syscall or exception context, at the next outmost
  7060	 *           preempt_enable(). (this might be as soon as the wake_up()'s
  7061	 *           spin_unlock()!)
  7062	 *
  7063	 *         - in IRQ context, return from interrupt-handler to
  7064	 *           preemptible context
  7065	 *
  7066	 *       - If the kernel is not preemptible (CONFIG_PREEMPTION is not set)
  7067	 *         then at the next:
  7068	 *
  7069	 *          - cond_resched() call
  7070	 *          - explicit schedule() call
  7071	 *          - return from syscall or exception to user-space
  7072	 *          - return from interrupt-handler to user-space
  7073	 *
  7074	 * WARNING: must be called with preemption disabled!
  7075	 */
  7076	static void __sched notrace __schedule(unsigned int sched_mode)
  7077	{
  7078		struct task_struct *prev, *next;
  7079		unsigned long *switch_count;
  7080		unsigned long prev_state;
  7081		struct rq_flags rf;
  7082		struct rq *rq;
  7083		int cpu;
  7084		bool preserve_need_resched = false;
  7085	
  7086		cpu = smp_processor_id();
  7087		rq = cpu_rq(cpu);
  7088		prev = rq->curr;
  7089	
  7090		schedule_debug(prev, !!sched_mode);
  7091	
  7092		if (sched_feat(HRTICK) || sched_feat(HRTICK_DL))
  7093			hrtick_clear(rq);
  7094	
  7095		local_irq_disable();
  7096		rcu_note_context_switch(!!sched_mode);
  7097	
  7098		/*
  7099		 * Make sure that signal_pending_state()->signal_pending() below
  7100		 * can't be reordered with __set_current_state(TASK_INTERRUPTIBLE)
  7101		 * done by the caller to avoid the race with signal_wake_up():
  7102		 *
  7103		 * __set_current_state(@state)		signal_wake_up()
  7104		 * schedule()				  set_tsk_thread_flag(p, TIF_SIGPENDING)
  7105		 *					  wake_up_state(p, state)
  7106		 *   LOCK rq->lock			    LOCK p->pi_state
  7107		 *   smp_mb__after_spinlock()		    smp_mb__after_spinlock()
  7108		 *     if (signal_pending_state())	    if (p->state & @state)
  7109		 *
  7110		 * Also, the membarrier system call requires a full memory barrier
  7111		 * after coming from user-space, before storing to rq->curr.
  7112		 */
  7113		rq_lock(rq, &rf);
  7114		smp_mb__after_spinlock();
  7115	
  7116		/* Promote REQ to ACT */
  7117		rq->clock_update_flags <<= 1;
  7118		update_rq_clock(rq);
  7119	
  7120		switch_count = &prev->nivcsw;
  7121	
  7122		/*
  7123		 * We must load prev->state once (task_struct::state is volatile), such
  7124		 * that we form a control dependency vs deactivate_task() below.
  7125		 */
  7126		prev_state = READ_ONCE(prev->__state);
  7127		if (!(sched_mode & SM_MASK_PREEMPT) && prev_state) {
  7128			if (signal_pending_state(prev_state, prev)) {
  7129				WRITE_ONCE(prev->__state, TASK_RUNNING);
  7130			} else if (!task_is_blocked(prev)) {
  7131				prev->sched_contributes_to_load =
  7132					(prev_state & TASK_UNINTERRUPTIBLE) &&
  7133					!(prev_state & TASK_NOLOAD) &&
  7134					!(prev_state & TASK_FROZEN);
  7135	
  7136				if (prev->sched_contributes_to_load)
  7137					rq->nr_uninterruptible++;
  7138	
  7139				/*
  7140				 * __schedule()			ttwu()
  7141				 *   prev_state = prev->state;    if (p->on_rq && ...)
  7142				 *   if (prev_state)		    goto out;
  7143				 *     p->on_rq = 0;		  smp_acquire__after_ctrl_dep();
  7144				 *				  p->state = TASK_WAKING
  7145				 *
  7146				 * Where __schedule() and ttwu() have matching control dependencies.
  7147				 *
  7148				 * After this, schedule() must not care about p->state any more.
  7149				 */
  7150				deactivate_task(rq, prev, DEQUEUE_SLEEP | DEQUEUE_NOCLOCK);
  7151	
  7152				if (prev->in_iowait) {
  7153					atomic_inc(&rq->nr_iowait);
  7154					delayacct_blkio_start();
  7155				}
  7156			} else {
  7157				/*
  7158				 * Let's make this task, which is blocked on
  7159				 * a mutex, (push/pull)able (RT/DL).
  7160				 * Unfortunately we can only deal with that by
  7161				 * means of a dequeue/enqueue cycle. :-/
  7162				 */
  7163				dequeue_task(rq, prev, 0);
  7164				enqueue_task(rq, prev, 0);
  7165			}
  7166			switch_count = &prev->nvcsw;
  7167		}
  7168	
  7169	pick_again:
  7170		/*
  7171		 * If picked task is actually blocked it means that it can act as a
  7172		 * proxy for the task that is holding the mutex picked task is blocked
  7173		 * on. Get a reference to the blocked (going to be proxy) task here.
  7174		 * Note that if next isn't actually blocked we will have rq->proxy ==
  7175		 * rq->curr == next in the end, which is intended and means that proxy
  7176		 * execution is currently "not in use".
  7177		 */
> 7178		next = pick_next_task(rq, rq_selected(rq), &rf);
  7179		rq_set_selected(rq, next);
  7180		next->blocked_donor = NULL;
  7181		if (unlikely(task_is_blocked(next))) {
  7182			next = proxy(rq, next, &rf);
  7183			if (!next) {
  7184				__balance_callbacks(rq);
  7185				goto pick_again;
  7186			}
  7187			if (next == rq->idle && prev == rq->idle)
  7188				preserve_need_resched = true;
  7189		}
  7190	
  7191		if (!preserve_need_resched)
  7192			clear_tsk_need_resched(prev);
  7193		clear_preempt_need_resched();
  7194	#ifdef CONFIG_SCHED_DEBUG
  7195		rq->last_seen_need_resched_ns = 0;
  7196	#endif
  7197	
  7198		if (likely(prev != next)) {
  7199			rq->nr_switches++;
  7200			/*
  7201			 * RCU users of rcu_dereference(rq->curr) may not see
  7202			 * changes to task_struct made by pick_next_task().
  7203			 */
  7204			RCU_INIT_POINTER(rq->curr, next);
  7205			/*
  7206			 * The membarrier system call requires each architecture
  7207			 * to have a full memory barrier after updating
  7208			 * rq->curr, before returning to user-space.
  7209			 *
  7210			 * Here are the schemes providing that barrier on the
  7211			 * various architectures:
  7212			 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC.
  7213			 *   switch_mm() rely on membarrier_arch_switch_mm() on PowerPC.
  7214			 * - finish_lock_switch() for weakly-ordered
  7215			 *   architectures where spin_unlock is a full barrier,
  7216			 * - switch_to() for arm64 (weakly-ordered, spin_unlock
  7217			 *   is a RELEASE barrier),
  7218			 */
  7219			++*switch_count;
  7220	
  7221			migrate_disable_switch(rq, prev);
  7222			psi_sched_switch(prev, next, !task_on_rq_queued(prev));
  7223	
  7224			trace_sched_switch(sched_mode & SM_MASK_PREEMPT, prev, next, prev_state);
  7225	
  7226			/* Also unlocks the rq: */
  7227			rq = context_switch(rq, prev, next, &rf);
  7228		} else {
  7229			rq->clock_update_flags &= ~(RQCF_ACT_SKIP|RQCF_REQ_SKIP);
  7230	
  7231			rq_unpin_lock(rq, &rf);
  7232			__balance_callbacks(rq);
  7233			raw_spin_rq_unlock_irq(rq);
  7234		}
  7235	}
  7236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
