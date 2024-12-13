Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591E15573A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 22:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128297; cv=none; b=DOl0kHdc/tCjMCQ/9bWFPyEVyx/IWmD8UuXaT854S0ARE3OhSqJEdx1NXQcuU2JaSrvXN+ACPxt+HtS9+SoA0rFUsmVWcoWRqL3tnBvzWXm/pw+0XFeX+vD00pErcklXm/q4T5uWLzuNr9uc7r2zvx9C4AYGA0Gv6u6letMUtro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128297; c=relaxed/simple;
	bh=NtjuPL/4cM+BB+7X6aeEO1Ub0mNtprp/yGaL/ccVQyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EqtsQlwQiq4KtcctF/kKbV4/sXxqx/0L1qKRuXoZZf6mnxB/9W/Vt6A2VJO8Q52bRzJ8pQjv9/zff1MIVTxiiBDWZqNeEcsbKTDKnWviGZPMshb4pkvWd48Uk7AJFVLOAuYzuw/OBDPxFjBsmON2Ekg3b41bAMVCS1XTHjEWQGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cn+3zL1R; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cn+3zL1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734128295; x=1765664295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NtjuPL/4cM+BB+7X6aeEO1Ub0mNtprp/yGaL/ccVQyo=;
  b=cn+3zL1R6L8xWuJuXgEEggMvo/KqASjfnjgaymWkITzUX6jqFJkuLZSM
   DuoXjME9NeOnI6JTJY0BhRDARjlJO6GQHnDwUnOToCwz7vpKRwS1A60cZ
   3YZw/I22NqPTvVBHqzjELanQb3ZS0PZ3ffFgX8XAu6Xb3EYvLEyKtno9f
   OVknbgxkjOEJDdTep2L8TWEQ1nzsh4mVnnpvG7hFHO5FUW8lmVYWNKUVQ
   uf1C5cFNmTBrGmKTBJ6fSUpnoKeeEAZBl9Vl46hG9xYrePh2sVpI0cyNF
   jcDnTfzZqNG134GlVeKNfxCXik7LWJwXqKEpTQTxRv+NiGBmzQKnpW+21
   A==;
X-CSE-ConnectionGUID: mjZVWqAkSqCv5NTJotnUYQ==
X-CSE-MsgGUID: tyzBIgNYRCSHQGtjSELAng==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45068722"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45068722"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 14:18:15 -0800
X-CSE-ConnectionGUID: C9He6mpCQ7qvSFWmGqx3Ag==
X-CSE-MsgGUID: 6QMkY5+MS9mybuLMhTc55g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="97197488"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2024 14:18:13 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMDz9-000CUB-1O;
	Fri, 13 Dec 2024 22:18:11 +0000
Date: Sat, 14 Dec 2024 06:17:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7221/7239]
 kernel/sched/core.c:6922:4: error: call to undeclared function
 'zap_balance_callbacks'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202412140618.W8r1YS8N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c89a2687772eacf71bfcb875160ec3f71564d898
commit: 7236283bb8acfbee811da21affcbc56674999b02 [7221/7239] FROMLIST: sched: Add an initial sketch of the find_proxy_task() function
config: i386-buildonly-randconfig-003-20241214 (https://download.01.org/0day-ci/archive/20241214/202412140618.W8r1YS8N-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140618.W8r1YS8N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140618.W8r1YS8N-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/sched/core.c:6922:4: error: call to undeclared function 'zap_balance_callbacks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6922 |                         zap_balance_callbacks(rq);
         |                         ^
   kernel/sched/core.c:6922:4: note: did you mean '__balance_callbacks'?
   kernel/sched/core.c:5202:20: note: '__balance_callbacks' declared here
    5202 | static inline void __balance_callbacks(struct rq *rq)
         |                    ^
   1 warning and 1 error generated.


vim +/zap_balance_callbacks +6922 kernel/sched/core.c

  6801	
  6802	/*
  6803	 * __schedule() is the main scheduler function.
  6804	 *
  6805	 * The main means of driving the scheduler and thus entering this function are:
  6806	 *
  6807	 *   1. Explicit blocking: mutex, semaphore, waitqueue, etc.
  6808	 *
  6809	 *   2. TIF_NEED_RESCHED flag is checked on interrupt and userspace return
  6810	 *      paths. For example, see arch/x86/entry_64.S.
  6811	 *
  6812	 *      To drive preemption between tasks, the scheduler sets the flag in timer
  6813	 *      interrupt handler sched_tick().
  6814	 *
  6815	 *   3. Wakeups don't really cause entry into schedule(). They add a
  6816	 *      task to the run-queue and that's it.
  6817	 *
  6818	 *      Now, if the new task added to the run-queue preempts the current
  6819	 *      task, then the wakeup sets TIF_NEED_RESCHED and schedule() gets
  6820	 *      called on the nearest possible occasion:
  6821	 *
  6822	 *       - If the kernel is preemptible (CONFIG_PREEMPTION=y):
  6823	 *
  6824	 *         - in syscall or exception context, at the next outmost
  6825	 *           preempt_enable(). (this might be as soon as the wake_up()'s
  6826	 *           spin_unlock()!)
  6827	 *
  6828	 *         - in IRQ context, return from interrupt-handler to
  6829	 *           preemptible context
  6830	 *
  6831	 *       - If the kernel is not preemptible (CONFIG_PREEMPTION is not set)
  6832	 *         then at the next:
  6833	 *
  6834	 *          - cond_resched() call
  6835	 *          - explicit schedule() call
  6836	 *          - return from syscall or exception to user-space
  6837	 *          - return from interrupt-handler to user-space
  6838	 *
  6839	 * WARNING: must be called with preemption disabled!
  6840	 */
  6841	static void __sched notrace __schedule(int sched_mode)
  6842	{
  6843		struct task_struct *prev, *next;
  6844		/*
  6845		 * On PREEMPT_RT kernel, SM_RTLOCK_WAIT is noted
  6846		 * as a preemption by schedule_debug() and RCU.
  6847		 */
  6848		bool preempt = sched_mode > SM_NONE;
  6849		bool block = false;
  6850		unsigned long *switch_count;
  6851		unsigned long prev_state;
  6852		struct rq_flags rf;
  6853		struct rq *rq;
  6854		int cpu;
  6855	
  6856		cpu = smp_processor_id();
  6857		rq = cpu_rq(cpu);
  6858		prev = rq->curr;
  6859	
  6860		schedule_debug(prev, preempt);
  6861	
  6862		if (sched_feat(HRTICK) || sched_feat(HRTICK_DL))
  6863			hrtick_clear(rq);
  6864	
  6865		local_irq_disable();
  6866		rcu_note_context_switch(preempt);
  6867	
  6868		/*
  6869		 * Make sure that signal_pending_state()->signal_pending() below
  6870		 * can't be reordered with __set_current_state(TASK_INTERRUPTIBLE)
  6871		 * done by the caller to avoid the race with signal_wake_up():
  6872		 *
  6873		 * __set_current_state(@state)		signal_wake_up()
  6874		 * schedule()				  set_tsk_thread_flag(p, TIF_SIGPENDING)
  6875		 *					  wake_up_state(p, state)
  6876		 *   LOCK rq->lock			    LOCK p->pi_state
  6877		 *   smp_mb__after_spinlock()		    smp_mb__after_spinlock()
  6878		 *     if (signal_pending_state())	    if (p->state & @state)
  6879		 *
  6880		 * Also, the membarrier system call requires a full memory barrier
  6881		 * after coming from user-space, before storing to rq->curr; this
  6882		 * barrier matches a full barrier in the proximity of the membarrier
  6883		 * system call exit.
  6884		 */
  6885		rq_lock(rq, &rf);
  6886		smp_mb__after_spinlock();
  6887	
  6888		/* Promote REQ to ACT */
  6889		rq->clock_update_flags <<= 1;
  6890		update_rq_clock(rq);
  6891		rq->clock_update_flags = RQCF_UPDATED;
  6892	
  6893		switch_count = &prev->nivcsw;
  6894	
  6895		/* Task state changes only considers SM_PREEMPT as preemption */
  6896		preempt = sched_mode == SM_PREEMPT;
  6897	
  6898		/*
  6899		 * We must load prev->state once (task_struct::state is volatile), such
  6900		 * that we form a control dependency vs deactivate_task() below.
  6901		 */
  6902		prev_state = READ_ONCE(prev->__state);
  6903		if (sched_mode == SM_IDLE) {
  6904			/* SCX must consult the BPF scheduler to tell if rq is empty */
  6905			if (!rq->nr_running && !scx_enabled()) {
  6906				next = prev;
  6907				goto picked;
  6908			}
  6909		} else if (!preempt && prev_state) {
  6910			block = try_to_block_task(rq, prev, prev_state,
  6911						  !task_is_blocked(prev));
  6912			switch_count = &prev->nvcsw;
  6913		}
  6914	
  6915	pick_again:
  6916		next = pick_next_task(rq, rq->donor, &rf);
  6917		rq_set_donor(rq, next);
  6918		if (unlikely(task_is_blocked(next))) {
  6919			next = find_proxy_task(rq, next, &rf);
  6920			if (!next) {
  6921				/* zap the balance_callbacks before picking again */
> 6922				zap_balance_callbacks(rq);
  6923				goto pick_again;
  6924			}
  6925		}
  6926	picked:
  6927		clear_tsk_need_resched(prev);
  6928		clear_preempt_need_resched();
  6929	#ifdef CONFIG_SCHED_DEBUG
  6930		rq->last_seen_need_resched_ns = 0;
  6931	#endif
  6932	
  6933		trace_android_rvh_schedule(prev, next, rq);
  6934		if (likely(prev != next)) {
  6935			rq->nr_switches++;
  6936			/*
  6937			 * RCU users of rcu_dereference(rq->curr) may not see
  6938			 * changes to task_struct made by pick_next_task().
  6939			 */
  6940			RCU_INIT_POINTER(rq->curr, next);
  6941			/*
  6942			 * The membarrier system call requires each architecture
  6943			 * to have a full memory barrier after updating
  6944			 * rq->curr, before returning to user-space.
  6945			 *
  6946			 * Here are the schemes providing that barrier on the
  6947			 * various architectures:
  6948			 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
  6949			 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
  6950			 *   on PowerPC and on RISC-V.
  6951			 * - finish_lock_switch() for weakly-ordered
  6952			 *   architectures where spin_unlock is a full barrier,
  6953			 * - switch_to() for arm64 (weakly-ordered, spin_unlock
  6954			 *   is a RELEASE barrier),
  6955			 *
  6956			 * The barrier matches a full barrier in the proximity of
  6957			 * the membarrier system call entry.
  6958			 *
  6959			 * On RISC-V, this barrier pairing is also needed for the
  6960			 * SYNC_CORE command when switching between processes, cf.
  6961			 * the inline comments in membarrier_arch_switch_mm().
  6962			 */
  6963			++*switch_count;
  6964	
  6965			migrate_disable_switch(rq, prev);
  6966			psi_account_irqtime(rq, prev, next);
  6967			psi_sched_switch(prev, next, block);
  6968	
  6969			trace_sched_switch(preempt, prev, next, prev_state);
  6970	
  6971			/* Also unlocks the rq: */
  6972			rq = context_switch(rq, prev, next, &rf);
  6973		} else {
  6974			rq_unpin_lock(rq, &rf);
  6975			__balance_callbacks(rq);
  6976			raw_spin_rq_unlock_irq(rq);
  6977		}
  6978	}
  6979	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
