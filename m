Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4F11D516C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774200069; cv=none; b=g5ZpPRdiVFvkWkU31faNj2cuhhpqTdExKktvrn30KlTSxQ5iF+ojA0RrNqo+B14amPEGCBpxeKI/2bPVNI2CS9FJUWU5NBn7pidJoV8Babslvnvmsz4EKm3Lp8hg2mjrvTU9m+nZHu7Zg9EjZb3ieMvO9yEA+e++XPlNVgWuGtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774200069; c=relaxed/simple;
	bh=RsrvZNCqOO6NCDt06m6IiNUJCWXAhZZfwt3aaIa1y5g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IUIJG6LcKNEvHwAK/ZV0OSwVRmMJXS0NTpS/MNSs2YQgwoZkIYw3SZkZGLv4cDBJ7vp4Lb+hG/Jtiq3ZYpRamU6iLbImgTSmaOHB2gs7TRhEdyhP6q6OqcAEsXu9yQvhiORGOgRGUjFvLKyJHFJ9yH0TKRHwg9qxDlsSd7gcdqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTt4mnaw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTt4mnaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774200066; x=1805736066;
  h=date:from:to:cc:subject:message-id;
  bh=RsrvZNCqOO6NCDt06m6IiNUJCWXAhZZfwt3aaIa1y5g=;
  b=BTt4mnawzlwtLWg0ze/gd7n5wSoHYCLCs0yGkWYr/O5qfwmA860njsGo
   k9wTUw32nfWbStfVgmaQwF2u2pFFxT+jpHu5gA1Dsqh+DEsk1Lww5hVx0
   q1nNTtMamySKOpDJOE20awZU04No71Wh5wI0Dy0G4zaVzE6oAeHYMvfWh
   FMnAsa/OXZZGdUWLKqf4c3dgQaTjOK7J3/IU9aOmSsCvvNFoEVzNTdNVg
   fdYSv2TGPOr9dpQE6oog1tt+ze9f++qzyR8tKV4bZPWkO4rHgKitf0jKV
   6NQNVNicPhKjvT/kY+eZIyO2fWzPJQmC9I6+sGYTbMsfoCDu6rfBpIgb4
   A==;
X-CSE-ConnectionGUID: LoATDMDiQ82FWdb1IiWM8g==
X-CSE-MsgGUID: FpKt4WooTm2L9Fzk6rF+DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75283128"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75283128"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 10:21:05 -0700
X-CSE-ConnectionGUID: 01vMwMGOTJq9v9nhfsgCZQ==
X-CSE-MsgGUID: w2lKALcAQ+6WHbD3a+mIBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="223837752"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Mar 2026 10:21:03 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4MTk-000000002SR-3KJr;
	Sun, 22 Mar 2026 17:20:48 +0000
Date: Mon, 23 Mar 2026 01:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: kernel/sched/core.c:6781:37: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202603230154.Gwpf8bHV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   113ae7b4decc6c2d95bdbbe52e615a0137ef7f9f
commit: be41bde4c3a86de4be5cd3d1ca613e24664e68dc sched: Add an initial sketch of the find_proxy_task() function
date:   8 months ago
config: arc-randconfig-r122-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230154.Gwpf8bHV-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230154.Gwpf8bHV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230154.Gwpf8bHV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:1097:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1097:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1097:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1197:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1197:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1197:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2196:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2196:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2196:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2207:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2207:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2207:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3679:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3679:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3679:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3884:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3884:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3884:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5607:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5607:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5607:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6715:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6715:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6715:14: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:6781:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6781:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6781:37: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7277:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7277:17: sparse:    struct task_struct *
   kernel/sched/core.c:7277:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10208:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10208:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10208:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:628:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:661:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:677:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1774:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1774:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2277:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2447:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2447:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2447:9: sparse:    struct task_struct *
   kernel/sched/core.c:2160:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2160:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2160:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:9: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file (through arch/arc/include/asm/mmu.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   arch/arc/include/asm/mmu-arcv2.h:84:9: sparse: sparse: undefined identifier '__builtin_arc_sr'
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2447:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2447:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2447:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2447:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2447:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2447:9: sparse:    struct task_struct *

vim +6781 kernel/sched/core.c

  6656	
  6657	/*
  6658	 * __schedule() is the main scheduler function.
  6659	 *
  6660	 * The main means of driving the scheduler and thus entering this function are:
  6661	 *
  6662	 *   1. Explicit blocking: mutex, semaphore, waitqueue, etc.
  6663	 *
  6664	 *   2. TIF_NEED_RESCHED flag is checked on interrupt and userspace return
  6665	 *      paths. For example, see arch/x86/entry_64.S.
  6666	 *
  6667	 *      To drive preemption between tasks, the scheduler sets the flag in timer
  6668	 *      interrupt handler sched_tick().
  6669	 *
  6670	 *   3. Wakeups don't really cause entry into schedule(). They add a
  6671	 *      task to the run-queue and that's it.
  6672	 *
  6673	 *      Now, if the new task added to the run-queue preempts the current
  6674	 *      task, then the wakeup sets TIF_NEED_RESCHED and schedule() gets
  6675	 *      called on the nearest possible occasion:
  6676	 *
  6677	 *       - If the kernel is preemptible (CONFIG_PREEMPTION=y):
  6678	 *
  6679	 *         - in syscall or exception context, at the next outmost
  6680	 *           preempt_enable(). (this might be as soon as the wake_up()'s
  6681	 *           spin_unlock()!)
  6682	 *
  6683	 *         - in IRQ context, return from interrupt-handler to
  6684	 *           preemptible context
  6685	 *
  6686	 *       - If the kernel is not preemptible (CONFIG_PREEMPTION is not set)
  6687	 *         then at the next:
  6688	 *
  6689	 *          - cond_resched() call
  6690	 *          - explicit schedule() call
  6691	 *          - return from syscall or exception to user-space
  6692	 *          - return from interrupt-handler to user-space
  6693	 *
  6694	 * WARNING: must be called with preemption disabled!
  6695	 */
  6696	static void __sched notrace __schedule(int sched_mode)
  6697	{
  6698		struct task_struct *prev, *next;
  6699		/*
  6700		 * On PREEMPT_RT kernel, SM_RTLOCK_WAIT is noted
  6701		 * as a preemption by schedule_debug() and RCU.
  6702		 */
  6703		bool preempt = sched_mode > SM_NONE;
  6704		bool is_switch = false;
  6705		unsigned long *switch_count;
  6706		unsigned long prev_state;
  6707		struct rq_flags rf;
  6708		struct rq *rq;
  6709		int cpu;
  6710	
  6711		trace_sched_entry_tp(preempt, CALLER_ADDR0);
  6712	
  6713		cpu = smp_processor_id();
  6714		rq = cpu_rq(cpu);
  6715		prev = rq->curr;
  6716	
  6717		schedule_debug(prev, preempt);
  6718	
  6719		if (sched_feat(HRTICK) || sched_feat(HRTICK_DL))
  6720			hrtick_clear(rq);
  6721	
  6722		klp_sched_try_switch(prev);
  6723	
  6724		local_irq_disable();
  6725		rcu_note_context_switch(preempt);
  6726	
  6727		/*
  6728		 * Make sure that signal_pending_state()->signal_pending() below
  6729		 * can't be reordered with __set_current_state(TASK_INTERRUPTIBLE)
  6730		 * done by the caller to avoid the race with signal_wake_up():
  6731		 *
  6732		 * __set_current_state(@state)		signal_wake_up()
  6733		 * schedule()				  set_tsk_thread_flag(p, TIF_SIGPENDING)
  6734		 *					  wake_up_state(p, state)
  6735		 *   LOCK rq->lock			    LOCK p->pi_state
  6736		 *   smp_mb__after_spinlock()		    smp_mb__after_spinlock()
  6737		 *     if (signal_pending_state())	    if (p->state & @state)
  6738		 *
  6739		 * Also, the membarrier system call requires a full memory barrier
  6740		 * after coming from user-space, before storing to rq->curr; this
  6741		 * barrier matches a full barrier in the proximity of the membarrier
  6742		 * system call exit.
  6743		 */
  6744		rq_lock(rq, &rf);
  6745		smp_mb__after_spinlock();
  6746	
  6747		/* Promote REQ to ACT */
  6748		rq->clock_update_flags <<= 1;
  6749		update_rq_clock(rq);
  6750		rq->clock_update_flags = RQCF_UPDATED;
  6751	
  6752		switch_count = &prev->nivcsw;
  6753	
  6754		/* Task state changes only considers SM_PREEMPT as preemption */
  6755		preempt = sched_mode == SM_PREEMPT;
  6756	
  6757		/*
  6758		 * We must load prev->state once (task_struct::state is volatile), such
  6759		 * that we form a control dependency vs deactivate_task() below.
  6760		 */
  6761		prev_state = READ_ONCE(prev->__state);
  6762		if (sched_mode == SM_IDLE) {
  6763			/* SCX must consult the BPF scheduler to tell if rq is empty */
  6764			if (!rq->nr_running && !scx_enabled()) {
  6765				next = prev;
  6766				goto picked;
  6767			}
  6768		} else if (!preempt && prev_state) {
  6769			/*
  6770			 * We pass task_is_blocked() as the should_block arg
  6771			 * in order to keep mutex-blocked tasks on the runqueue
  6772			 * for slection with proxy-exec (without proxy-exec
  6773			 * task_is_blocked() will always be false).
  6774			 */
  6775			try_to_block_task(rq, prev, &prev_state,
  6776					  !task_is_blocked(prev));
  6777			switch_count = &prev->nvcsw;
  6778		}
  6779	
  6780	pick_again:
> 6781		next = pick_next_task(rq, rq->donor, &rf);
  6782		rq_set_donor(rq, next);
  6783		if (unlikely(task_is_blocked(next))) {
  6784			next = find_proxy_task(rq, next, &rf);
  6785			if (!next)
  6786				goto pick_again;
  6787		}
  6788	picked:
  6789		clear_tsk_need_resched(prev);
  6790		clear_preempt_need_resched();
  6791		rq->last_seen_need_resched_ns = 0;
  6792	
  6793		is_switch = prev != next;
  6794		if (likely(is_switch)) {
  6795			rq->nr_switches++;
  6796			/*
  6797			 * RCU users of rcu_dereference(rq->curr) may not see
  6798			 * changes to task_struct made by pick_next_task().
  6799			 */
  6800			RCU_INIT_POINTER(rq->curr, next);
  6801			/*
  6802			 * The membarrier system call requires each architecture
  6803			 * to have a full memory barrier after updating
  6804			 * rq->curr, before returning to user-space.
  6805			 *
  6806			 * Here are the schemes providing that barrier on the
  6807			 * various architectures:
  6808			 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
  6809			 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
  6810			 *   on PowerPC and on RISC-V.
  6811			 * - finish_lock_switch() for weakly-ordered
  6812			 *   architectures where spin_unlock is a full barrier,
  6813			 * - switch_to() for arm64 (weakly-ordered, spin_unlock
  6814			 *   is a RELEASE barrier),
  6815			 *
  6816			 * The barrier matches a full barrier in the proximity of
  6817			 * the membarrier system call entry.
  6818			 *
  6819			 * On RISC-V, this barrier pairing is also needed for the
  6820			 * SYNC_CORE command when switching between processes, cf.
  6821			 * the inline comments in membarrier_arch_switch_mm().
  6822			 */
  6823			++*switch_count;
  6824	
  6825			migrate_disable_switch(rq, prev);
  6826			psi_account_irqtime(rq, prev, next);
  6827			psi_sched_switch(prev, next, !task_on_rq_queued(prev) ||
  6828						     prev->se.sched_delayed);
  6829	
  6830			trace_sched_switch(preempt, prev, next, prev_state);
  6831	
  6832			/* Also unlocks the rq: */
  6833			rq = context_switch(rq, prev, next, &rf);
  6834		} else {
  6835			rq_unpin_lock(rq, &rf);
  6836			__balance_callbacks(rq);
  6837			raw_spin_rq_unlock_irq(rq);
  6838		}
  6839		trace_sched_exit_tp(is_switch, CALLER_ADDR0);
  6840	}
  6841	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
