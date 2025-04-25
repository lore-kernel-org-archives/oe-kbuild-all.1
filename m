Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8751520F09A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 20:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745611375; cv=none; b=jSiw7R00Vr/YKXndFe+vOoyCRlfneWd/NK34IRmdoohLpUkKBcZiPuLJxYlEROo/F1prFc0ya4n9y8Bt05d4FmpOfJ5bBgiqcFxbJpKggw49lyVIFWKKXOr8yyv46ujkvVUasUTjPJR0ROAyTtKoCM60w3hEDwzwwqVMihLlhjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745611375; c=relaxed/simple;
	bh=j9A6gqu21BkRZY89jAcBs7wkuDyOapU4ZNjGFkywRN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QkfhBju9ntR2s2tJDW1oPJOa4IvX3ZPhrM3kVUKzM3xwuyr2b9cGV8T77U3x2PHt8NA8LWWU2VhaSHVRf3rsWmKk77zmCImsQe8hmt6+9x2W2w9ZRLoeDUY6NWRjRVAdNOkNVYyPgtqfnY9hIhxj8yxe7iLQjIbTdvWtU3i7w5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjzH+2L3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjzH+2L3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745611373; x=1777147373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j9A6gqu21BkRZY89jAcBs7wkuDyOapU4ZNjGFkywRN0=;
  b=ZjzH+2L3qcqktIUnLgJkUoOwZ9OKcQB9C+SDe+xyqGSFmhxsdNtu3Uny
   3REzEZlvVNv2tGWFVVynIvBMGObDM79hbdC79LoKfdtGhFgw7PGQ9Ueb0
   DQ8/vQn02vyv99lTSc5xYNFB9GC/91vPNksPZL633qkQzbGdHa0CsPfPf
   ehx8l6iundsRApgFX2PtZGj+k8kko5ON1MF2KdVtNoXoEzXKWykS9AsXe
   GG0KVTuXWQkTgMwlrHqPApEjprd84dmqqEBxhTotPjWSzLtQFcUq9fV/p
   E2za4xc66M8UlhxFHjPEXHZkg2WqRqLXFaa4C4Wgua36QOfh7V+HyRcdO
   w==;
X-CSE-ConnectionGUID: 2XRlFLD0QdeHYYYDncdFCQ==
X-CSE-MsgGUID: +55ZM++nS+e6jnk5ZGEpqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="51088822"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="51088822"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 13:02:52 -0700
X-CSE-ConnectionGUID: NW9ZJsqSQqWWsR30h3aC9g==
X-CSE-MsgGUID: /LLvg65oSPqZN9w0hvlDbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="170202090"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Apr 2025 13:02:51 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8PG4-0005Tt-0T;
	Fri, 25 Apr 2025 20:02:48 +0000
Date: Sat, 26 Apr 2025 04:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7/7]
 kernel/locking/mutex.c:651:24-25: Unneeded semicolon
Message-ID: <202504260348.ZTgDe5Oc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   b01e71951e32bcf55e252da941d55692247d1a5c
commit: 484044f3c605752f50898a51ab924603befb3b23 [7/7] FROMLIST: locking/mutex: Rework task_struct::blocked_on
config: x86_64-randconfig-102-20250425 (https://download.01.org/0day-ci/archive/20250426/202504260348.ZTgDe5Oc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504260348.ZTgDe5Oc-lkp@intel.com/

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
