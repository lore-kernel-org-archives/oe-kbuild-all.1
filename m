Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15312F12D4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 06:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011044; cv=none; b=o1Q6rEEnCAaoLCp291uq2ErFOo1gL7MxExs5UBgEuAjF91fnGkWu8zpx29GhLlmjN5ZSjE2WHe/OLCDUCOvrTUC7DENfoGKscxu5sCVGPMR7e8ED/e8MN04cTlAqFrFDDZUl160N7ivV3El9y4PRH2mR7EEIc+EkqOpE8LUTtoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011044; c=relaxed/simple;
	bh=5kULCfK8oiaKjjVhHTf6Y7hnBE9SVyxZZsOf6KELWqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m5sQGk6f5su0sq+j8MbRcTZ+1sxYMYD12jeVAx4Po8jJwGKFV2rNiD5rtPHGgvsUat1iYkA6gAk614I5u13RLK2dhCnlAfGCLga0EorsOCGRT5dNQ+sKWKT70ETHY90Fhcx5EG8Jgh3uUJ6kvnQlVkHOD0YU15EYnnl8uRaADHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLnhCp6K; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLnhCp6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784011041; x=1815547041;
  h=date:from:to:cc:subject:message-id;
  bh=5kULCfK8oiaKjjVhHTf6Y7hnBE9SVyxZZsOf6KELWqA=;
  b=gLnhCp6Kx0MEyhhQ61P8WyUNIUrLS6EyWmgyPLGU+xOOQ99EjuJjRCTS
   DmM2sLVMjAVkmLKBCs16dtuB8MF2LnAu2Rf/3Y+ngUl8GJ6bg+Ri1mqKN
   wHHcxFStXKEUaTcfIJamEK86zw3lKnxBMeDTkk8yQaedQeA8IwqljLNtJ
   Hpa1MRXVxseajpRS1X9HnGgT+P4197XCQoyqZTzkUKmeOPpa5O5bjprVc
   YlKRCsZaYHnsW22fhTqB/geoNIDWFGDExkKZgX3uWwA998J7gwTrLmZb6
   B1ztA0F2emwI7lijzpcEsznIdt0mEuFAkf6r1sbSXBfFMlFH+hRhLlXXK
   A==;
X-CSE-ConnectionGUID: yiyAoPhORQuxzPjmAG0BMg==
X-CSE-MsgGUID: 7JkJCfzZRT+eDnxlzFVQdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84721391"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84721391"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 23:37:20 -0700
X-CSE-ConnectionGUID: 11SyJC98TMqsD5KpvL7fjw==
X-CSE-MsgGUID: kjKG6H9BSxyKLtzSML01Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="259617931"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 13 Jul 2026 23:37:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjWlY-00000000MU5-27yu;
	Tue, 14 Jul 2026 06:37:16 +0000
Date: Tue, 14 Jul 2026 14:36:41 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/prjc 2/4] kernel/sched/alt_core.c:3782:9: error:
 too few arguments to function 'blk_plug_invalidate_ts'; expected 1, have 0
Message-ID: <202607141446.KsHafPhU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/prjc
head:   c1b28ebbed9c3eb5a224f397ed9ec0049186e0d0
commit: f3e8d2abb7fb9e5202ac3cb9991bd7aad83c9aee [2/4] sched/alt: [Sync] dcb7416212e6 block: invalidate cached plug timestamp after task switch
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260714/202607141446.KsHafPhU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607141446.KsHafPhU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607141446.KsHafPhU-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c:1527:6: error: redefinition of 'set_task_cpu'
    1527 | void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
         |      ^~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:15:
   include/linux/sched.h:2340:20: note: previous definition of 'set_task_cpu' with type 'void(struct task_struct *, unsigned int)'
    2340 | static inline void set_task_cpu(struct task_struct *p, unsigned int cpu)
         |                    ^~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'finish_task_switch':
>> kernel/sched/alt_core.c:3782:9: error: too few arguments to function 'blk_plug_invalidate_ts'; expected 1, have 0
    3782 |         blk_plug_invalidate_ts();
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:28:
   include/linux/blkdev.h:1220:20: note: declared here
    1220 | static inline void blk_plug_invalidate_ts(struct task_struct *tsk)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:6440:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Wimplicit-function-declaration]
    6440 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6440:57: error: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    6440 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37:
   include/linux/cpumask.h:155:73: note: expected 'const struct cpumask *' but argument is of type 'int'
     155 | static __always_inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                                   ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:6441:60: error: passing argument 1 of 'cpumask_weight' makes pointer from integer without a cast [-Wint-conversion]
    6441 |                 per_cpu(sd_llc_size, cpu) = cpumask_weight(cpu_coregroup_mask(cpu));
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                            |
         |                                                            int
   include/linux/cpumask.h:868:74: note: expected 'const struct cpumask *' but argument is of type 'int'
     868 | static __always_inline unsigned int cpumask_weight(const struct cpumask *srcp)
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:6443:45: error: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6443 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6416:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6416 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:714:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     714 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:6443:45: error: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    6443 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6417:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6417 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:932:63: note: expected 'const struct cpumask *' but argument is of type 'int'
     932 | void cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from include/linux/sched.h:16:
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   kernel/sched/alt_core.c:6422:55: note: in expansion of macro 'cpumask_bits'
    6422 |                 bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),       \
         |                                                       ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6443:17: note: in expansion of macro 'TOPOLOGY_CPUMASK'
    6443 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                 ^~~~~~~~~~~~~~~~


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
