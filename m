Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE2D283C87
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665819; cv=none; b=Wv1cZyhNGsHTKRmufysdSROYWORoB2ZMwG8y+eoMI9/L1lrwMxAdaSclYruXF9JkgbSOeU9uz81QZxdomqBFTrwiVOhut3u0o28rqrEAYFf6MSFMJ2PO6oi7myKhtFtBMlIAZylQV7C9bsgD/4NVD3Pw299EcOcJ5lUBrFgyIjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665819; c=relaxed/simple;
	bh=sFifzLgBWckxoqqCgSkoglaHek53cx3p/VfaohDaQLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LxFa01VEisF21zeds8LDVwlEUvsxkIO1uWK4P5VobHSY+g6ZLgsBJc6oj4bsauGroVb/HfbwusydmbhMcWxRBKnVip4cJIc2XYWRTudu7+YoXVUd62Xny4opfuY+Z5XKJFuy9xAieIQZnKcXEnawKsmMdM3j033n/+kVkQXVsvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0l1DLQ7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0l1DLQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747665817; x=1779201817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sFifzLgBWckxoqqCgSkoglaHek53cx3p/VfaohDaQLw=;
  b=A0l1DLQ7aimawas92Z9bDNL/OnNlnQU6ZO7iqSWh3wMfmnn4FadqH17P
   2r/u7YDz6HGiaI+G4lZzECoTbIxqM4KtMzRgL2CJiItgvTSOjJii1OaCe
   1ZyuXqefJwjC+O4jU/tCjVbDYJk9U4hN0dJwVnMt9B2sERh+XB3BNAlQ3
   EQItr1ubHk9s1R3gIJx8ZlUz4RwsLX3r09C0LCm7koX6+xHvt7L5WLkp3
   T7pOKHJ7867VxhLAWj+zIF/bntYql6K7wGjOsFfBpeWJo2AO/gVuqfsFm
   mZOUaM7bsqdYgAwavJ3D+QxeCKtEE75mO3U6svR0u1OIFzpX4RnlKR9+Y
   A==;
X-CSE-ConnectionGUID: PheWn3H4TiGama9wT3UReQ==
X-CSE-MsgGUID: egtyXPHNRrymTVRzeyxcmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52200578"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="52200578"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 07:43:36 -0700
X-CSE-ConnectionGUID: nAcqvzU9TzOpMkxqRJX4RA==
X-CSE-MsgGUID: GyjdnP6WQPSxvotfeCtsOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="139295825"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 May 2025 07:43:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH1iH-000LaO-16;
	Mon, 19 May 2025 14:43:33 +0000
Date: Mon, 19 May 2025 22:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] kernel/sched/core.c:4466:16:
 warning: unknown attribute 'optimize' ignored
Message-ID: <202505192249.AQAMirqL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Erwei,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   950b90b563b8c87ae35bb6edc4775609bc9471c2
commit: d8067218f102beede0017de50b37d0c539586952 [11/11] anolis: sched: disable optimizing stack frame pointer of __schedule
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250519/202505192249.AQAMirqL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505192249.AQAMirqL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505192249.AQAMirqL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:2403:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
    2403 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^
   kernel/sched/core.c:2403:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2403 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         | ^
         | static 
>> kernel/sched/core.c:4466:16: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
    4466 | __attribute__((optimize("no-omit-frame-pointer")))
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:4705:35: warning: no previous prototype for function 'schedule_user' [-Wmissing-prototypes]
    4705 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^
   kernel/sched/core.c:4705:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4705 | asmlinkage __visible void __sched schedule_user(void)
         |                      ^
         |                      static 
   3 warnings generated.


vim +/optimize +4466 kernel/sched/core.c

  4426	
  4427	/*
  4428	 * __schedule() is the main scheduler function.
  4429	 *
  4430	 * The main means of driving the scheduler and thus entering this function are:
  4431	 *
  4432	 *   1. Explicit blocking: mutex, semaphore, waitqueue, etc.
  4433	 *
  4434	 *   2. TIF_NEED_RESCHED flag is checked on interrupt and userspace return
  4435	 *      paths. For example, see arch/x86/entry_64.S.
  4436	 *
  4437	 *      To drive preemption between tasks, the scheduler sets the flag in timer
  4438	 *      interrupt handler scheduler_tick().
  4439	 *
  4440	 *   3. Wakeups don't really cause entry into schedule(). They add a
  4441	 *      task to the run-queue and that's it.
  4442	 *
  4443	 *      Now, if the new task added to the run-queue preempts the current
  4444	 *      task, then the wakeup sets TIF_NEED_RESCHED and schedule() gets
  4445	 *      called on the nearest possible occasion:
  4446	 *
  4447	 *       - If the kernel is preemptible (CONFIG_PREEMPTION=y):
  4448	 *
  4449	 *         - in syscall or exception context, at the next outmost
  4450	 *           preempt_enable(). (this might be as soon as the wake_up()'s
  4451	 *           spin_unlock()!)
  4452	 *
  4453	 *         - in IRQ context, return from interrupt-handler to
  4454	 *           preemptible context
  4455	 *
  4456	 *       - If the kernel is not preemptible (CONFIG_PREEMPTION is not set)
  4457	 *         then at the next:
  4458	 *
  4459	 *          - cond_resched() call
  4460	 *          - explicit schedule() call
  4461	 *          - return from syscall or exception to user-space
  4462	 *          - return from interrupt-handler to user-space
  4463	 *
  4464	 * WARNING: must be called with preemption disabled!
  4465	 */
> 4466	__attribute__((optimize("no-omit-frame-pointer")))
  4467	static void __sched notrace __schedule(bool preempt)
  4468	{
  4469		struct task_struct *prev, *next;
  4470		unsigned long *switch_count;
  4471		unsigned long prev_state;
  4472		struct rq_flags rf;
  4473		struct rq *rq;
  4474		int cpu;
  4475	
  4476		cpu = smp_processor_id();
  4477		rq = cpu_rq(cpu);
  4478		prev = rq->curr;
  4479	
  4480		schedule_debug(prev, preempt);
  4481	
  4482		if (sched_feat(HRTICK))
  4483			hrtick_clear(rq);
  4484	
  4485		local_irq_disable();
  4486		rcu_note_context_switch(preempt);
  4487	
  4488		/*
  4489		 * Make sure that signal_pending_state()->signal_pending() below
  4490		 * can't be reordered with __set_current_state(TASK_INTERRUPTIBLE)
  4491		 * done by the caller to avoid the race with signal_wake_up():
  4492		 *
  4493		 * __set_current_state(@state)		signal_wake_up()
  4494		 * schedule()				  set_tsk_thread_flag(p, TIF_SIGPENDING)
  4495		 *					  wake_up_state(p, state)
  4496		 *   LOCK rq->lock			    LOCK p->pi_state
  4497		 *   smp_mb__after_spinlock()		    smp_mb__after_spinlock()
  4498		 *     if (signal_pending_state())	    if (p->state & @state)
  4499		 *
  4500		 * Also, the membarrier system call requires a full memory barrier
  4501		 * after coming from user-space, before storing to rq->curr.
  4502		 */
  4503		rq_lock(rq, &rf);
  4504		smp_mb__after_spinlock();
  4505	
  4506		/* Promote REQ to ACT */
  4507		rq->clock_update_flags <<= 1;
  4508		update_rq_clock(rq);
  4509	
  4510		switch_count = &prev->nivcsw;
  4511	
  4512		/*
  4513		 * We must load prev->state once (task_struct::state is volatile), such
  4514		 * that:
  4515		 *
  4516		 *  - we form a control dependency vs deactivate_task() below.
  4517		 *  - ptrace_{,un}freeze_traced() can change ->state underneath us.
  4518		 */
  4519		prev_state = prev->state;
  4520		if (!preempt && prev_state) {
  4521			if (signal_pending_state(prev_state, prev)) {
  4522				prev->state = TASK_RUNNING;
  4523			} else {
  4524				prev->sched_contributes_to_load =
  4525					(prev_state & TASK_UNINTERRUPTIBLE) &&
  4526					!(prev_state & TASK_NOLOAD) &&
  4527					!(prev->flags & PF_FROZEN);
  4528	
  4529				if (prev->sched_contributes_to_load) {
  4530					update_nr_uninterruptible(prev, 1);
  4531					rq->nr_uninterruptible++;
  4532				}
  4533	
  4534				/*
  4535				 * __schedule()			ttwu()
  4536				 *   prev_state = prev->state;    if (p->on_rq && ...)
  4537				 *   if (prev_state)		    goto out;
  4538				 *     p->on_rq = 0;		  smp_acquire__after_ctrl_dep();
  4539				 *				  p->state = TASK_WAKING
  4540				 *
  4541				 * Where __schedule() and ttwu() have matching control dependencies.
  4542				 *
  4543				 * After this, schedule() must not care about p->state any more.
  4544				 */
  4545				deactivate_task(rq, prev, DEQUEUE_SLEEP | DEQUEUE_NOCLOCK);
  4546	
  4547				if (prev->in_iowait) {
  4548					atomic_inc(&rq->nr_iowait);
  4549					update_nr_iowait(prev, 1);
  4550					delayacct_blkio_start();
  4551				}
  4552			}
  4553			switch_count = &prev->nvcsw;
  4554		}
  4555	
  4556		next = pick_next_task(rq, prev, &rf);
  4557	
  4558		notify_smt_expeller(rq, next);
  4559	
  4560		clear_tsk_need_resched(prev);
  4561		clear_preempt_need_resched();
  4562	
  4563		if (likely(prev != next)) {
  4564			rq->nr_switches++;
  4565			/*
  4566			 * RCU users of rcu_dereference(rq->curr) may not see
  4567			 * changes to task_struct made by pick_next_task().
  4568			 */
  4569			RCU_INIT_POINTER(rq->curr, next);
  4570			/*
  4571			 * The membarrier system call requires each architecture
  4572			 * to have a full memory barrier after updating
  4573			 * rq->curr, before returning to user-space.
  4574			 *
  4575			 * Here are the schemes providing that barrier on the
  4576			 * various architectures:
  4577			 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC.
  4578			 *   switch_mm() rely on membarrier_arch_switch_mm() on PowerPC.
  4579			 * - finish_lock_switch() for weakly-ordered
  4580			 *   architectures where spin_unlock is a full barrier,
  4581			 * - switch_to() for arm64 (weakly-ordered, spin_unlock
  4582			 *   is a RELEASE barrier),
  4583			 */
  4584			++*switch_count;
  4585	
  4586			psi_sched_switch(prev, next, !task_on_rq_queued(prev));
  4587	
  4588			trace_sched_switch(preempt, prev, next);
  4589	
  4590			/* Also unlocks the rq: */
  4591			rq = context_switch(rq, prev, next, &rf);
  4592	#ifdef CONFIG_HT_STABLE
  4593			wake_up_idle_ht(rq);
  4594	#endif
  4595		} else {
  4596			rq->clock_update_flags &= ~(RQCF_ACT_SKIP|RQCF_REQ_SKIP);
  4597			rq_unlock_irq(rq, &rf);
  4598		}
  4599	
  4600		balance_callback(rq);
  4601	}
  4602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
