Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB4732A3E1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 17:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977081; cv=none; b=L1iihu26gO8rwkUJzeFtyRBcjoZvleTnDu8mTbo4NPdFsXh+7WG1/hQJ7r2xTP00oUcEsuz7tQ5Izsp6++WcHxd5ZFR8Bfc8XhtNhDGpmaTYFLItzNMqbPlVTxGzRVMfgOm09ijdIhd0rRG5ufe22yCy3BUumSZh+iG8C/P1204=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977081; c=relaxed/simple;
	bh=iVrJ+FdG+30VBYph5WHhR6g6tP5HOOBCa2OVWu/sc74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fh+tYSwa7LKvSfXCBzG2UlxdBNOd2f98Ih3ffvsEVr2T8CkFhuIJxYY4kQsmqtEknuyXpVMjUT+38yVpSJoB6AM3aAjcABAPQ2zH0Mgx1KvFQm5PERzXsUV0c3AdyCNgw8uGbvfdPurbP3hcCLqGhPrYvHBF/nIplZ5lZ9d6EJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjJZC97a; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjJZC97a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774977079; x=1806513079;
  h=date:from:to:cc:subject:message-id;
  bh=iVrJ+FdG+30VBYph5WHhR6g6tP5HOOBCa2OVWu/sc74=;
  b=MjJZC97alExoTZKLfEdQAd8KbIZdgEQJMUdLm1wPufp7IEdVaYGva/tc
   bbX1t/fgZiK5yxiTAP8m0UIfXoAysP7JmFe+NYJpfr38X+hlNn4pY29L/
   2ey8pRZA2FvIgLkKmm3lPAmkNEkaERii+lVSm+eXL0oqLZJ98joC6O60b
   17nmbeh4EaRukGvDFDuy5XaBGb6UjijtxSxaYRUyjIUUxC3yOkvy4o4gS
   iexLUDXSo6dI+qHhGEIcYIdOaAwgttnIy6ordxa5A8H/cq9Vw9/UxyN0B
   Qu9B4r6dZ+0JrSl+6m7wQHddncExWNZoSXIo7NUcn6+Wi5DSaIPvOgh8t
   Q==;
X-CSE-ConnectionGUID: tQ40HijBQIirSimVS3LyVw==
X-CSE-MsgGUID: R2crjxAkQLuAaP48Y6kirA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76113292"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="76113292"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 10:11:18 -0700
X-CSE-ConnectionGUID: VobtwN4mSGu/yyHbN3kAFg==
X-CSE-MsgGUID: FILYtZy9SLO369oHMRVrgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="264359594"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Mar 2026 10:11:16 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ccT-000000003bX-3TT7;
	Tue, 31 Mar 2026 17:11:13 +0000
Date: Wed, 01 Apr 2026 01:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 17/25] kernel/sched/core.c:6831:52:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202604010115.rS9EUQw2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   e3b81e7a51de864abd45114d819569970d871cdf
commit: c226eccb781eec487cedee2bb9489a19235024f0 [17/25] sched: Fix potentially missing balancing with Proxy Exec
config: m68k-randconfig-r132-20260331 (https://download.01.org/0day-ci/archive/20260401/202604010115.rS9EUQw2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010115.rS9EUQw2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010115.rS9EUQw2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:1109:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1109:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1109:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2182:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2182:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2182:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2197:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2197:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2197:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3602:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3602:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3602:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3807:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3807:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3807:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5559:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5559:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5559:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6760:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6760:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6760:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6828:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6828:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6828:37: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/core.c:6831:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev_donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6831:52: sparse:     expected struct task_struct *prev_donor
   kernel/sched/core.c:6831:52: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6841:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6841:31: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6841:31: sparse:    struct task_struct *
   kernel/sched/core.c:7352:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7352:17: sparse:    struct task_struct *
   kernel/sched/core.c:7352:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10272:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10272:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10272:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2378:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2378:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2378:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2367:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2367:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2367:25: sparse:    struct task_struct *
   kernel/sched/core.c:2177:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2177:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2177:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2378:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2378:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2378:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2689:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2689:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2689:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2689:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2689:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2689:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2378:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2378:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2378:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2666:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2666:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2666:9: sparse:    struct task_struct *

vim +6831 kernel/sched/core.c

  6700	
  6701	/*
  6702	 * __schedule() is the main scheduler function.
  6703	 *
  6704	 * The main means of driving the scheduler and thus entering this function are:
  6705	 *
  6706	 *   1. Explicit blocking: mutex, semaphore, waitqueue, etc.
  6707	 *
  6708	 *   2. TIF_NEED_RESCHED flag is checked on interrupt and userspace return
  6709	 *      paths. For example, see arch/x86/entry_64.S.
  6710	 *
  6711	 *      To drive preemption between tasks, the scheduler sets the flag in timer
  6712	 *      interrupt handler sched_tick().
  6713	 *
  6714	 *   3. Wakeups don't really cause entry into schedule(). They add a
  6715	 *      task to the run-queue and that's it.
  6716	 *
  6717	 *      Now, if the new task added to the run-queue preempts the current
  6718	 *      task, then the wakeup sets TIF_NEED_RESCHED and schedule() gets
  6719	 *      called on the nearest possible occasion:
  6720	 *
  6721	 *       - If the kernel is preemptible (CONFIG_PREEMPTION=y):
  6722	 *
  6723	 *         - in syscall or exception context, at the next outmost
  6724	 *           preempt_enable(). (this might be as soon as the wake_up()'s
  6725	 *           spin_unlock()!)
  6726	 *
  6727	 *         - in IRQ context, return from interrupt-handler to
  6728	 *           preemptible context
  6729	 *
  6730	 *       - If the kernel is not preemptible (CONFIG_PREEMPTION is not set)
  6731	 *         then at the next:
  6732	 *
  6733	 *          - cond_resched() call
  6734	 *          - explicit schedule() call
  6735	 *          - return from syscall or exception to user-space
  6736	 *          - return from interrupt-handler to user-space
  6737	 *
  6738	 * WARNING: must be called with preemption disabled!
  6739	 */
  6740	static void __sched notrace __schedule(int sched_mode)
  6741	{
  6742		struct task_struct *prev, *next;
  6743		/*
  6744		 * On PREEMPT_RT kernel, SM_RTLOCK_WAIT is noted
  6745		 * as a preemption by schedule_debug() and RCU.
  6746		 */
  6747		bool preempt = sched_mode > SM_NONE;
  6748		bool is_switch = false;
  6749		unsigned long *switch_count;
  6750		unsigned long prev_state;
  6751		struct rq_flags rf;
  6752		struct rq *rq;
  6753		int cpu;
  6754	
  6755		/* Trace preemptions consistently with task switches */
  6756		trace_sched_entry_tp(sched_mode == SM_PREEMPT);
  6757	
  6758		cpu = smp_processor_id();
  6759		rq = cpu_rq(cpu);
  6760		prev = rq->curr;
  6761	
  6762		schedule_debug(prev, preempt);
  6763	
  6764		if (sched_feat(HRTICK) || sched_feat(HRTICK_DL))
  6765			hrtick_clear(rq);
  6766	
  6767		klp_sched_try_switch(prev);
  6768	
  6769		local_irq_disable();
  6770		rcu_note_context_switch(preempt);
  6771		migrate_disable_switch(rq, prev);
  6772	
  6773		/*
  6774		 * Make sure that signal_pending_state()->signal_pending() below
  6775		 * can't be reordered with __set_current_state(TASK_INTERRUPTIBLE)
  6776		 * done by the caller to avoid the race with signal_wake_up():
  6777		 *
  6778		 * __set_current_state(@state)		signal_wake_up()
  6779		 * schedule()				  set_tsk_thread_flag(p, TIF_SIGPENDING)
  6780		 *					  wake_up_state(p, state)
  6781		 *   LOCK rq->lock			    LOCK p->pi_state
  6782		 *   smp_mb__after_spinlock()		    smp_mb__after_spinlock()
  6783		 *     if (signal_pending_state())	    if (p->state & @state)
  6784		 *
  6785		 * Also, the membarrier system call requires a full memory barrier
  6786		 * after coming from user-space, before storing to rq->curr; this
  6787		 * barrier matches a full barrier in the proximity of the membarrier
  6788		 * system call exit.
  6789		 */
  6790		rq_lock(rq, &rf);
  6791		smp_mb__after_spinlock();
  6792	
  6793		/* Promote REQ to ACT */
  6794		rq->clock_update_flags <<= 1;
  6795		update_rq_clock(rq);
  6796		rq->clock_update_flags = RQCF_UPDATED;
  6797	
  6798		switch_count = &prev->nivcsw;
  6799	
  6800		/* Task state changes only considers SM_PREEMPT as preemption */
  6801		preempt = sched_mode == SM_PREEMPT;
  6802	
  6803		/*
  6804		 * We must load prev->state once (task_struct::state is volatile), such
  6805		 * that we form a control dependency vs deactivate_task() below.
  6806		 */
  6807		prev_state = READ_ONCE(prev->__state);
  6808		if (sched_mode == SM_IDLE) {
  6809			/* SCX must consult the BPF scheduler to tell if rq is empty */
  6810			if (!rq->nr_running && !scx_enabled()) {
  6811				next = prev;
  6812				rq->next_class = &idle_sched_class;
  6813				goto picked;
  6814			}
  6815		} else if (!preempt && prev_state) {
  6816			/*
  6817			 * We pass task_is_blocked() as the should_block arg
  6818			 * in order to keep mutex-blocked tasks on the runqueue
  6819			 * for slection with proxy-exec (without proxy-exec
  6820			 * task_is_blocked() will always be false).
  6821			 */
  6822			try_to_block_task(rq, prev, &prev_state,
  6823					  !task_is_blocked(prev));
  6824			switch_count = &prev->nvcsw;
  6825		}
  6826	
  6827	pick_again:
  6828		next = pick_next_task(rq, rq->donor, &rf);
  6829		rq->next_class = next->sched_class;
  6830		if (sched_proxy_exec()) {
> 6831			struct task_struct *prev_donor = rq->donor;
  6832	
  6833			rq_set_donor(rq, next);
  6834			if (unlikely(next->blocked_on)) {
  6835				next = find_proxy_task(rq, next, &rf);
  6836				if (!next)
  6837					goto pick_again;
  6838				if (next == rq->idle)
  6839					goto keep_resched;
  6840			}
  6841			if (rq->donor == prev_donor && prev != next) {
  6842				struct task_struct *donor = rq->donor;
  6843				/*
  6844				 * When transitioning like:
  6845				 *
  6846				 *         prev         next
  6847				 * donor:    B            B
  6848				 * curr:     A          B or C
  6849				 *
  6850				 * then put_prev_set_next_task() will not have done
  6851				 * anything, since B == B. However, A might have
  6852				 * missed a RT/DL balance opportunity due to being
  6853				 * on_cpu.
  6854				 */
  6855				donor->sched_class->put_prev_task(rq, donor, donor);
  6856				donor->sched_class->set_next_task(rq, donor, true);
  6857			}
  6858		} else {
  6859			rq_set_donor(rq, next);
  6860		}
  6861	
  6862	picked:
  6863		clear_tsk_need_resched(prev);
  6864		clear_preempt_need_resched();
  6865	keep_resched:
  6866		rq->last_seen_need_resched_ns = 0;
  6867	
  6868		is_switch = prev != next;
  6869		if (likely(is_switch)) {
  6870			rq->nr_switches++;
  6871			/*
  6872			 * RCU users of rcu_dereference(rq->curr) may not see
  6873			 * changes to task_struct made by pick_next_task().
  6874			 */
  6875			RCU_INIT_POINTER(rq->curr, next);
  6876	
  6877			/*
  6878			 * The membarrier system call requires each architecture
  6879			 * to have a full memory barrier after updating
  6880			 * rq->curr, before returning to user-space.
  6881			 *
  6882			 * Here are the schemes providing that barrier on the
  6883			 * various architectures:
  6884			 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
  6885			 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
  6886			 *   on PowerPC and on RISC-V.
  6887			 * - finish_lock_switch() for weakly-ordered
  6888			 *   architectures where spin_unlock is a full barrier,
  6889			 * - switch_to() for arm64 (weakly-ordered, spin_unlock
  6890			 *   is a RELEASE barrier),
  6891			 *
  6892			 * The barrier matches a full barrier in the proximity of
  6893			 * the membarrier system call entry.
  6894			 *
  6895			 * On RISC-V, this barrier pairing is also needed for the
  6896			 * SYNC_CORE command when switching between processes, cf.
  6897			 * the inline comments in membarrier_arch_switch_mm().
  6898			 */
  6899			++*switch_count;
  6900	
  6901			psi_account_irqtime(rq, prev, next);
  6902			psi_sched_switch(prev, next, !task_on_rq_queued(prev) ||
  6903						     prev->se.sched_delayed);
  6904	
  6905			trace_sched_switch(preempt, prev, next, prev_state);
  6906	
  6907			/* Also unlocks the rq: */
  6908			rq = context_switch(rq, prev, next, &rf);
  6909		} else {
  6910			rq_unpin_lock(rq, &rf);
  6911			__balance_callbacks(rq, NULL);
  6912			raw_spin_rq_unlock_irq(rq);
  6913		}
  6914		trace_sched_exit_tp(is_switch);
  6915	}
  6916	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
