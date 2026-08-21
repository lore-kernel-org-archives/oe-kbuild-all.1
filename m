Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1A6312825
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 02:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787280998; cv=none; b=Mn1Ty0lOL44mpmC+GYzOSd2Svn1hjYZ+PpfULEjvbFtNC1S6BUf1+det6f0QD7GVpCFvmSeTMp1NCDqlS7OjkJ7vlEr4IWNDma6BS8RbTZhco07gwpL+ojdrNdNoz1ABixFVn3jOCuukhrncuxVNI2PJ4ho7j7Lsa1Lnsrizhe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787280998; c=relaxed/simple;
	bh=K02FYRBejsmWWktmSnMzsPXN+dybAwqQTBNSk4zU9+w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S14KsuAPyrI5Uj+BCazQJOwS9SWl31bQjpae3daCnXr7Frh6wL99zDBvczHOXtR9B8pXowCNb8xZIp2IsQto+bZxT5hH2O4njF84Rg26nxCbzyiGA5LDYCdCam5K01iVIGTNaKkQcX4OpDJ46lTO2yLnnqt9CLP8hRUfTuwy/Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KpFe5xrE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpFe5xrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787280998; x=1818816998;
  h=date:from:to:cc:subject:message-id;
  bh=K02FYRBejsmWWktmSnMzsPXN+dybAwqQTBNSk4zU9+w=;
  b=KpFe5xrES57EjeNhHpjRTMOlmlI/3iRHRwMbSArF/O90eXmVc9n+wba4
   NBv3Y+nAiz2wjx+MNXW4EdrUZQ5rNeivplnxO0IGsNUd90GalyvqPzbDW
   qIZTNNuEnI2ABo2FAz7J1NBsY5FDKJ8/XKsfhYVuFeo7YrXa5OVqYiUxs
   1FamUCSNdVzYLn6mwk2E8/L6rJBMwiqHXyxDKBUdHyRN/0TeIS1LALqfC
   2UtoIEt6Is2oHLOkzT3MQ+Ij2aFfmvVQWMK7CUr6iP3JxEiJcZOpfBKWW
   OUnTRSdeG34SKWF3Ea/kK7OSQjXlG2g2+KfSPK5Iybw/386NuRKfLNUII
   w==;
X-CSE-ConnectionGUID: Y/0fzKxsR2aHqBFsjp/ZRw==
X-CSE-MsgGUID: 2A33iLywTOqGcexRsrZ6/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="86946496"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="86946496"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 19:56:37 -0700
X-CSE-ConnectionGUID: vhuvdro7Sdq7tXM+NrqpwQ==
X-CSE-MsgGUID: cVdw7J6OR0q31n+eSPQS+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="264447301"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Aug 2026 19:56:36 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxFQn-000000007e5-1Nws;
	Fri, 21 Aug 2026 02:56:33 +0000
Date: Fri, 21 Aug 2026 04:55:43 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/prjc 2/62] kernel/sched/alt_core.c:3782:9: error:
 too few arguments to function 'blk_plug_invalidate_ts'; expected 1, have 0
Message-ID: <202608210439.ABpSu6zR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/prjc
head:   866d8ef40b13c52833d68758a0e166791e4f47b1
commit: f3e8d2abb7fb9e5202ac3cb9991bd7aad83c9aee [2/62] sched/alt: [Sync] dcb7416212e6 block: invalidate cached plug timestamp after task switch
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260821/202608210439.ABpSu6zR-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608210439.ABpSu6zR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608210439.ABpSu6zR-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c: In function 'finish_task_switch':
>> kernel/sched/alt_core.c:3782:9: error: too few arguments to function 'blk_plug_invalidate_ts'; expected 1, have 0
    3782 |         blk_plug_invalidate_ts();
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:28:
   include/linux/blkdev.h:1220:20: note: declared here
    1220 | static inline void blk_plug_invalidate_ts(struct task_struct *tsk)
         |                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/blk_plug_invalidate_ts +3782 kernel/sched/alt_core.c

  3704	
  3705	/**
  3706	 * finish_task_switch - clean up after a task-switch
  3707	 * @rq: runqueue associated with task-switch
  3708	 * @prev: the thread we just switched away from.
  3709	 *
  3710	 * finish_task_switch must be called after the context switch, paired
  3711	 * with a prepare_task_switch call before the context switch.
  3712	 * finish_task_switch will reconcile locking set up by prepare_task_switch,
  3713	 * and do any other architecture-specific cleanup actions.
  3714	 *
  3715	 * Note that we may have delayed dropping an mm in context_switch(). If
  3716	 * so, we finish that here outside of the runqueue lock.  (Doing it
  3717	 * with the lock held can cause deadlocks; see schedule() for
  3718	 * details.)
  3719	 *
  3720	 * The context switch have flipped the stack from under us and restored the
  3721	 * local variables which were saved when this task called schedule() in the
  3722	 * past. 'prev == current' is still correct but we need to recalculate this_rq
  3723	 * because prev may have moved to another CPU.
  3724	 */
  3725	static __always_inline struct rq *finish_task_switch(struct task_struct *prev)
  3726		__releases(rq->lock)
  3727	{
  3728		struct rq *rq = this_rq();
  3729		struct mm_struct *mm = rq->prev_mm;
  3730		unsigned int prev_state;
  3731	
  3732		/*
  3733		 * The previous task will have left us with a preempt_count of 2
  3734		 * because it left us after:
  3735		 *
  3736		 *	schedule()
  3737		 *	  preempt_disable();			// 1
  3738		 *	  __schedule()
  3739		 *	    raw_spin_lock_irq(&rq->lock)	// 2
  3740		 *
  3741		 * Also, see FORK_PREEMPT_COUNT.
  3742		 */
  3743		if (WARN_ONCE(preempt_count() != 2*PREEMPT_DISABLE_OFFSET,
  3744			      "corrupted preempt_count: %s/%d/0x%x\n",
  3745			      current->comm, current->pid, preempt_count()))
  3746			preempt_count_set(FORK_PREEMPT_COUNT);
  3747	
  3748		rq->prev_mm = NULL;
  3749	
  3750		/*
  3751		 * A task struct has one reference for the use as "current".
  3752		 * If a task dies, then it sets TASK_DEAD in tsk->state and calls
  3753		 * schedule one last time. The schedule call will never return, and
  3754		 * the scheduled task must drop that reference.
  3755		 *
  3756		 * We must observe prev->state before clearing prev->on_cpu (in
  3757		 * finish_task), otherwise a concurrent wakeup can get prev
  3758		 * running on another CPU and we could rave with its RUNNING -> DEAD
  3759		 * transition, resulting in a double drop.
  3760		 */
  3761		prev_state = READ_ONCE(prev->__state);
  3762		vtime_task_switch(prev);
  3763		perf_event_task_sched_in(prev, current);
  3764		finish_task(prev);
  3765		tick_nohz_task_switch();
  3766		finish_lock_switch(rq);
  3767		finish_arch_post_lock_switch();
  3768		kcov_finish_switch(current);
  3769		/*
  3770		 * kmap_local_sched_out() is invoked with rq::lock held and
  3771		 * interrupts disabled. There is no requirement for that, but the
  3772		 * sched out code does not have an interrupt enabled section.
  3773		 * Restoring the maps on sched in does not require interrupts being
  3774		 * disabled either.
  3775		 */
  3776		kmap_local_sched_in();
  3777	
  3778		/*
  3779		 * Any cached block-layer timestamp (plug->cur_ktime) is stale now,
  3780		 * invalidate it.
  3781		 */
> 3782		blk_plug_invalidate_ts();
  3783	
  3784		fire_sched_in_preempt_notifiers(current);
  3785		/*
  3786		 * When switching through a kernel thread, the loop in
  3787		 * membarrier_{private,global}_expedited() may have observed that
  3788		 * kernel thread and not issued an IPI. It is therefore possible to
  3789		 * schedule between user->kernel->user threads without passing though
  3790		 * switch_mm(). Membarrier requires a barrier after storing to
  3791		 * rq->curr, before returning to userspace, so provide them here:
  3792		 *
  3793		 * - a full memory barrier for {PRIVATE,GLOBAL}_EXPEDITED, implicitly
  3794		 *   provided by mmdrop_lazy_tlb(),
  3795		 * - a sync_core for SYNC_CORE.
  3796		 */
  3797		if (mm) {
  3798			membarrier_mm_sync_core_before_usermode(mm);
  3799			mmdrop_lazy_tlb_sched(mm);
  3800		}
  3801		if (unlikely(prev_state == TASK_DEAD)) {
  3802			cgroup_task_dead(prev);
  3803	
  3804			/* Task is done with its stack. */
  3805			put_task_stack(prev);
  3806	
  3807			put_task_struct_rcu_user(prev);
  3808		}
  3809	
  3810		return rq;
  3811	}
  3812	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
