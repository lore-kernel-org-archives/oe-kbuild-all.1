Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCA23DBD48
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 04:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790655332; cv=none; b=DsSfGzttyaR2F5oPFqMMsD5Fg37v+gujUHOhy4LbEv8vLoEx7plVPcWIn7RFrySWmJQtlU+egOEN3nBaNn3M++PSB6/sdN/tWPA9ZfkSnKSmS+8WuFTAJOuD/0E45g13XMRcS5mn/3rG80nwzO6/GVVh2yPKy4WYQCqkZxmD0ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790655332; c=relaxed/simple;
	bh=ZvxMeMjPX/LDwnRkxmvR8OBfGay9D/6Y+eH6/OCrPoQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mcSxipZVPhtDFByQ2aw3a8qOSGZhEfIm/BOFfM6FMz7C+QvYhahlQf+Q+9SB0/fLXQoApXC0Q6fhPintJg3/bpX+9pQgqqTLRUcZJYb63ODrU8vF/CBJlH8a8bt5yk6TqzlLPEliFN6q2xkbCzzKM69s2piIhJQ4p6bpSx37CX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQEFdtJf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQEFdtJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790655330; x=1822191330;
  h=date:from:to:cc:subject:message-id;
  bh=ZvxMeMjPX/LDwnRkxmvR8OBfGay9D/6Y+eH6/OCrPoQ=;
  b=NQEFdtJfXYp7WoBH3jOWFy0ch8z1hctW5SSb9X2qBbnkUQUE3txJTWxF
   T4N03Hc0nKhEq1McLadn3cmV1DHCYLOivloAMce8lwwQhk+o7DmfstbNL
   1qRvv8cFzUzagaBoZXD6cdJbYJMDdb9qsI8rsmKyPmq19cPIBpRhNpf54
   YbpePHB2gfbb1wlGGhT1Kn1qVZST6NT830GyGwhwN5al8kGqXlpjZoPbB
   Vz66ZZvisMbjU6nOFvpK3J1AWYkBU0ollEr/JzAlqNrxa6IlVbGNbAe1a
   tcZPQRWWlnvDdumSD/vieUYFrG2ZP0ec78Te/VEcraJn8xAwao96LATcK
   g==;
X-CSE-ConnectionGUID: xb01CBmIQpOFP2R5fOJWTw==
X-CSE-MsgGUID: uVXQXWaeSp+aJrMkR9/wDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101935212"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="101935212"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 21:15:18 -0700
X-CSE-ConnectionGUID: WWg0sekoQ0KkGNDSEe2t3g==
X-CSE-MsgGUID: ARTry3I3QluXVom1G/Gf7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="275393023"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 28 Sep 2026 21:15:17 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBPFL-000000001IF-1ybK;
	Tue, 29 Sep 2026 04:15:15 +0000
Date: Tue, 29 Sep 2026 06:14:58 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 7/7]
 kernel/locking/mutex.c:651:24-25: Unneeded semicolon
Message-ID: <202609290650.YVwYN98B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   46c9dcf34122090162fe8bdaf2c9f5c17fc95448
commit: 484044f3c605752f50898a51ab924603befb3b23 [7/7] FROMLIST: locking/mutex: Rework task_struct::blocked_on
config: x86_64-randconfig-r2104-20260929 (https://download.01.org/0day-ci/archive/20260929/202609290650.YVwYN98B-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290650.YVwYN98B-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/locking/mutex.c:651:24-25: Unneeded semicolon

vim +651 kernel/locking/mutex.c

   550	
   551	/*
   552	 * Lock a mutex (possibly interruptible), slowpath:
   553	 */
   554	static __always_inline int __sched
   555	__mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclass,
   556			    struct lockdep_map *nest_lock, unsigned long ip,
   557			    struct ww_acquire_ctx *ww_ctx, const bool use_ww_ctx)
   558	{
   559		DEFINE_WAKE_Q(wake_q);
   560		struct mutex_waiter waiter;
   561		struct ww_mutex *ww;
   562		unsigned long flags;
   563		int ret;
   564	
   565		if (!use_ww_ctx)
   566			ww_ctx = NULL;
   567	
   568		might_sleep();
   569	
   570		MUTEX_WARN_ON(lock->magic != lock);
   571	
   572		ww = container_of(lock, struct ww_mutex, base);
   573		if (ww_ctx) {
   574			if (unlikely(ww_ctx == READ_ONCE(ww->ctx)))
   575				return -EALREADY;
   576	
   577			/*
   578			 * Reset the wounded flag after a kill. No other process can
   579			 * race and wound us here since they can't have a valid owner
   580			 * pointer if we don't have any locks held.
   581			 */
   582			if (ww_ctx->acquired == 0)
   583				ww_ctx->wounded = 0;
   584	
   585	#ifdef CONFIG_DEBUG_LOCK_ALLOC
   586			nest_lock = &ww_ctx->dep_map;
   587	#endif
   588		}
   589	
   590		preempt_disable();
   591		mutex_acquire_nest(&lock->dep_map, subclass, 0, nest_lock, ip);
   592	
   593		trace_contention_begin(lock, LCB_F_MUTEX | LCB_F_SPIN);
   594		if (__mutex_trylock(lock) ||
   595		    mutex_optimistic_spin(lock, ww_ctx, NULL)) {
   596			/* got the lock, yay! */
   597			lock_acquired(&lock->dep_map, ip);
   598			if (ww_ctx)
   599				ww_mutex_set_context_fastpath(ww, ww_ctx);
   600			trace_contention_end(lock, 0);
   601			preempt_enable();
   602			return 0;
   603		}
   604	
   605		raw_spin_lock_irqsave(&lock->wait_lock, flags);
   606		raw_spin_lock(&current->blocked_lock);
   607		/*
   608		 * After waiting to acquire the wait_lock, try again.
   609		 */
   610		if (__mutex_trylock(lock)) {
   611			if (ww_ctx)
   612				__ww_mutex_check_waiters(lock, ww_ctx, &wake_q);
   613	
   614			goto skip_wait;
   615		}
   616	
   617		debug_mutex_lock_common(lock, &waiter);
   618		waiter.task = current;
   619		if (use_ww_ctx)
   620			waiter.ww_ctx = ww_ctx;
   621	
   622		lock_contended(&lock->dep_map, ip);
   623	
   624		if (!use_ww_ctx) {
   625			/* add waiting tasks to the end of the waitqueue (FIFO): */
   626			__mutex_add_waiter(lock, &waiter, &lock->wait_list);
   627		} else {
   628			/*
   629			 * Add in stamp order, waking up waiters that must kill
   630			 * themselves.
   631			 */
   632			ret = __ww_mutex_add_waiter(&waiter, lock, ww_ctx, &wake_q);
   633			if (ret)
   634				goto err_early_kill;
   635		}
   636	
   637		trace_android_vh_mutex_wait_start(lock);
   638		set_task_blocked_on(current, lock);
   639		set_current_state(state);
   640		trace_contention_begin(lock, LCB_F_MUTEX);
   641		for (;;) {
   642			bool first;
   643	
   644			/*
   645			 * Once we hold wait_lock, we're serialized against
   646			 * mutex_unlock() handing the lock off to us, do a trylock
   647			 * before testing the error conditions to make sure we pick up
   648			 * the handoff.
   649			 */
   650			if (__mutex_trylock(lock))
 > 651				break; /* acquired */;
   652	
   653			/*
   654			 * Check for signals and kill conditions while holding
   655			 * wait_lock. This ensures the lock cancellation is ordered
   656			 * against mutex_unlock() and wake-ups do not go missing.
   657			 */
   658			if (signal_pending_state(state, current)) {
   659				ret = -EINTR;
   660				goto err;
   661			}
   662	
   663			if (ww_ctx) {
   664				ret = __ww_mutex_check_kill(lock, &waiter, ww_ctx);
   665				if (ret)
   666					goto err;
   667			}
   668	
   669			raw_spin_unlock(&current->blocked_lock);
   670			raw_spin_unlock_irqrestore(&lock->wait_lock, flags);
   671			/* Make sure we do wakeups before calling schedule */
   672			wake_up_q(&wake_q);
   673			wake_q_init(&wake_q);
   674	
   675			schedule_preempt_disabled();
   676	
   677			first = __mutex_waiter_is_first(lock, &waiter);
   678	
   679			raw_spin_lock_irqsave(&lock->wait_lock, flags);
   680			raw_spin_lock(&current->blocked_lock);
   681	
   682			/*
   683			 * Re-set blocked_on_state as unlock path set it to WAKING/RUNNABLE
   684			 */
   685			current->blocked_on_state = BO_BLOCKED;
   686			set_current_state(state);
   687			/*
   688			 * Here we order against unlock; we must either see it change
   689			 * state back to RUNNING and fall through the next schedule(),
   690			 * or we must see its unlock and acquire.
   691			 */
   692			if (__mutex_trylock_or_handoff(lock, first))
   693				break;
   694	
   695			if (first) {
   696				bool opt_acquired;
   697	
   698				/*
   699				 * mutex_optimistic_spin() can schedule, so  we need to
   700				 * release these locks before calling it.
   701				 */
   702				current->blocked_on_state = BO_RUNNABLE;
   703				raw_spin_unlock(&current->blocked_lock);
   704				raw_spin_unlock_irqrestore(&lock->wait_lock, flags);
   705				trace_contention_begin(lock, LCB_F_MUTEX | LCB_F_SPIN);
   706				opt_acquired = mutex_optimistic_spin(lock, ww_ctx, &waiter);
   707				raw_spin_lock_irqsave(&lock->wait_lock, flags);
   708				raw_spin_lock(&current->blocked_lock);
   709				current->blocked_on_state = BO_BLOCKED;
   710				if (opt_acquired)
   711					break;
   712				trace_contention_begin(lock, LCB_F_MUTEX);
   713			}
   714		}
   715		set_task_blocked_on(current, NULL);
   716		__set_current_state(TASK_RUNNING);
   717		trace_android_vh_mutex_wait_finish(lock);
   718	
   719		if (ww_ctx) {
   720			/*
   721			 * Wound-Wait; we stole the lock (!first_waiter), check the
   722			 * waiters as anyone might want to wound us.
   723			 */
   724			if (!ww_ctx->is_wait_die &&
   725			    !__mutex_waiter_is_first(lock, &waiter))
   726				__ww_mutex_check_waiters(lock, ww_ctx, &wake_q);
   727		}
   728	
   729		__mutex_remove_waiter(lock, &waiter);
   730	
   731		debug_mutex_free_waiter(&waiter);
   732	
   733	skip_wait:
   734		/* got the lock - cleanup and rejoice! */
   735		lock_acquired(&lock->dep_map, ip);
   736		trace_contention_end(lock, 0);
   737	
   738		if (ww_ctx)
   739			ww_mutex_lock_acquired(ww, ww_ctx);
   740	
   741		raw_spin_unlock(&current->blocked_lock);
   742		raw_spin_unlock_irqrestore(&lock->wait_lock, flags);
   743		wake_up_q(&wake_q);
   744		preempt_enable();
   745		return 0;
   746	
   747	err:
   748		set_task_blocked_on(current, NULL);
   749		__set_current_state(TASK_RUNNING);
   750		trace_android_vh_mutex_wait_finish(lock);
   751		__mutex_remove_waiter(lock, &waiter);
   752	err_early_kill:
   753		WARN_ON(get_task_blocked_on(current));
   754		trace_contention_end(lock, ret);
   755		raw_spin_unlock(&current->blocked_lock);
   756		raw_spin_unlock_irqrestore(&lock->wait_lock, flags);
   757		debug_mutex_free_waiter(&waiter);
   758		mutex_release(&lock->dep_map, ip);
   759		wake_up_q(&wake_q);
   760		preempt_enable();
   761		return ret;
   762	}
   763	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
