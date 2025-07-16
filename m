Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F47FEC2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 11:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665534; cv=none; b=gwamzScvb1sN8i9yQUycqoAZ/GQ45mxV73UhSMZCGvMf5eFsdeppPKPW9hfxlimR5yCSxjP81lDXdcFBJ/vQGf7wRw7SKx/Tx3M02bFK17T7HX8KFq28wjJoNm5KAnW1IwNY4es+QTSOoy23W4EzV5ksTC46W+PVnqmCqJr8q+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665534; c=relaxed/simple;
	bh=YocFIEFFEKGTBW/V3ZLfBQhV/p1HLWwC8IiUejUrCQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SYaAIWnq4X1AK4wH2MtDbedE0Zfe3FpxwJrMEIzR7gvy3mvqqpkDLRmatO2nDSf3ahdYi/wHq3hTESXidJ/udZjPHOW118X5Epi4veKwL8CNjQjA3TcUsLwUCyzngq2lM6v5bzt1pk5K+q/GdCLaa/p0YhroiMI9lngy6T54O2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SW14zyyd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SW14zyyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752665532; x=1784201532;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YocFIEFFEKGTBW/V3ZLfBQhV/p1HLWwC8IiUejUrCQc=;
  b=SW14zyydF/8n+YW3YgHCNcny16S/NEVLxyFBkGHLKB5ETCJX/r1Yx9Ra
   hENW9oQlf54aS4gyt7X24aO32BTzUH8JwMe0OXZUMAvlQagVwT/BTIkFt
   5MnHgaPUoQEFTDkX7s17uKApYd1Rugchrn+JlFseDgbVVMa9UhXb7AFMG
   cpKxDPE90N7t/ZBDqn+W9FCBCOo3xJnzf/6FdGRD/VOe44MB9TshFTlt5
   OpFI4vVnXpyCsJeVKgZnKikn2P0TNxGu83JOc5IQB2SlkLZx7otnCQzds
   /+jAL3Hqk8Tu30zUrEDI2C4SjZ5oavwjKTUZ+kl6zx9SHw3GoA4J6YsgS
   w==;
X-CSE-ConnectionGUID: QkdRZ8VES2OLO90SCZoChQ==
X-CSE-MsgGUID: j0ohmE0BRESPmCaEW5Brbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54783034"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="54783034"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 04:32:11 -0700
X-CSE-ConnectionGUID: bEhK6k/vRCuDwURlg8R5Lw==
X-CSE-MsgGUID: FzBzPBqVQKa9fyCRQicdIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="181171262"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jul 2025 04:32:09 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uc0Mp-000CJ5-1X;
	Wed, 16 Jul 2025 11:32:07 +0000
Date: Wed, 16 Jul 2025 19:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pu Lehui <pulehui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2519/2519] kernel/locking/mutex.c:623:6: warning:
 variable 'ifs_clock' is used uninitialized whenever 'if' condition is true
Message-ID: <202507161941.gk9sOp8j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0a2a4d6188250982405816f6ee5b085bfb522721
commit: a1ad9b2ed459a3e3a4a2de50e03f53036fc7ec96 [2519/2519] interference: Add mutex interference track support
config: arm64-randconfig-004-20250716 (https://download.01.org/0day-ci/archive/20250716/202507161941.gk9sOp8j-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161941.gk9sOp8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161941.gk9sOp8j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/mutex.c:623:6: warning: variable 'ifs_clock' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     623 |         if (__mutex_trylock(lock)) {
         |             ^~~~~~~~~~~~~~~~~~~~~
   kernel/locking/mutex.c:725:24: note: uninitialized use occurs here
     725 |         cgroup_ifs_leave_lock(ifs_clock, IFS_MUTEX);
         |                               ^~~~~~~~~
   kernel/locking/mutex.c:623:2: note: remove the 'if' if its condition is always false
     623 |         if (__mutex_trylock(lock)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
     624 |                 if (ww_ctx)
         |                 ~~~~~~~~~~~
     625 |                         __ww_mutex_check_waiters(lock, ww_ctx);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     626 | 
     627 |                 goto skip_wait;
         |                 ~~~~~~~~~~~~~~~
     628 |         }
         |         ~
   kernel/locking/mutex.c:576:15: note: initialize the variable 'ifs_clock' to silence this warning
     576 |         u64 ifs_clock;
         |                      ^
         |                       = 0
   1 warning generated.


vim +623 kernel/locking/mutex.c

040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  565  
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  566  /*
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  567   * Lock a mutex (possibly interruptible), slowpath:
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  568   */
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  569  static __always_inline int __sched
2f064a59a11ff9 kernel/locking/mutex.c Peter Zijlstra            2021-06-11  570  __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclass,
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  571  		    struct lockdep_map *nest_lock, unsigned long ip,
b0267507dfd018 kernel/mutex.c         Tetsuo Handa              2013-10-17  572  		    struct ww_acquire_ctx *ww_ctx, const bool use_ww_ctx)
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  573  {
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  574  	struct mutex_waiter waiter;
a40ca56577f628 kernel/locking/mutex.c Waiman Long               2016-08-26  575  	struct ww_mutex *ww;
a1ad9b2ed459a3 kernel/locking/mutex.c Pu Lehui                  2025-07-16  576  	u64 ifs_clock;
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  577  	int ret;
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  578  
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  579  	if (!use_ww_ctx)
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  580  		ww_ctx = NULL;
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  581  
427b18207a87f6 kernel/locking/mutex.c Peter Zijlstra            2016-12-23  582  	might_sleep();
ea9e0fb8fe1bdf kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  583  
e6b4457b05f36b kernel/locking/mutex.c Peter Zijlstra            2021-06-30  584  	MUTEX_WARN_ON(lock->magic != lock);
6c11c6e3d5e9e5 kernel/locking/mutex.c Sebastian Andrzej Siewior 2019-07-03  585  
a40ca56577f628 kernel/locking/mutex.c Waiman Long               2016-08-26  586  	ww = container_of(lock, struct ww_mutex, base);
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  587  	if (ww_ctx) {
0422e83d84ae24 kernel/locking/mutex.c Chris Wilson              2016-05-26  588  		if (unlikely(ww_ctx == READ_ONCE(ww->ctx)))
0422e83d84ae24 kernel/locking/mutex.c Chris Wilson              2016-05-26  589  			return -EALREADY;
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  590  
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  591  		/*
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  592  		 * Reset the wounded flag after a kill. No other process can
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  593  		 * race and wound us here since they can't have a valid owner
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  594  		 * pointer if we don't have any locks held.
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  595  		 */
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  596  		if (ww_ctx->acquired == 0)
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  597  			ww_ctx->wounded = 0;
cf702eddcd03dc kernel/locking/mutex.c Peter Zijlstra            2021-08-15  598  
cf702eddcd03dc kernel/locking/mutex.c Peter Zijlstra            2021-08-15  599  #ifdef CONFIG_DEBUG_LOCK_ALLOC
cf702eddcd03dc kernel/locking/mutex.c Peter Zijlstra            2021-08-15  600  		nest_lock = &ww_ctx->dep_map;
cf702eddcd03dc kernel/locking/mutex.c Peter Zijlstra            2021-08-15  601  #endif
0422e83d84ae24 kernel/locking/mutex.c Chris Wilson              2016-05-26  602  	}
0422e83d84ae24 kernel/locking/mutex.c Chris Wilson              2016-05-26  603  
41719b03091911 kernel/mutex.c         Peter Zijlstra            2009-01-14  604  	preempt_disable();
e4c70a6629f9c7 kernel/mutex.c         Peter Zijlstra            2011-05-24  605  	mutex_acquire_nest(&lock->dep_map, subclass, 0, nest_lock, ip);
c02260277e4720 kernel/mutex.c         Frederic Weisbecker       2009-12-02  606  
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  607  	trace_contention_begin(lock, LCB_F_MUTEX | LCB_F_SPIN);
e274795ea7b7ca kernel/locking/mutex.c Peter Zijlstra            2017-01-11  608  	if (__mutex_trylock(lock) ||
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  609  	    mutex_optimistic_spin(lock, ww_ctx, NULL)) {
76916515d9d84e kernel/locking/mutex.c Davidlohr Bueso           2014-07-30  610  		/* got the lock, yay! */
3ca0ff571b092e kernel/locking/mutex.c Peter Zijlstra            2016-08-23  611  		lock_acquired(&lock->dep_map, ip);
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  612  		if (ww_ctx)
3ca0ff571b092e kernel/locking/mutex.c Peter Zijlstra            2016-08-23  613  			ww_mutex_set_context_fastpath(ww, ww_ctx);
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  614  		trace_contention_end(lock, 0);
ac6e60ee405aa3 kernel/mutex.c         Chris Mason               2009-01-14  615  		preempt_enable();
ac6e60ee405aa3 kernel/mutex.c         Chris Mason               2009-01-14  616  		return 0;
ac6e60ee405aa3 kernel/mutex.c         Chris Mason               2009-01-14  617  	}
ac6e60ee405aa3 kernel/mutex.c         Chris Mason               2009-01-14  618  
ebf4c55c1ddbab kernel/locking/mutex.c Thomas Gleixner           2021-08-15  619  	raw_spin_lock(&lock->wait_lock);
1e820c9608eace kernel/locking/mutex.c Jason Low                 2014-06-11  620  	/*
3ca0ff571b092e kernel/locking/mutex.c Peter Zijlstra            2016-08-23  621  	 * After waiting to acquire the wait_lock, try again.
1e820c9608eace kernel/locking/mutex.c Jason Low                 2014-06-11  622  	 */
659cf9f5824a12 kernel/locking/mutex.c Nicolai Hähnle            2016-12-21 @623  	if (__mutex_trylock(lock)) {
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  624  		if (ww_ctx)
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  625  			__ww_mutex_check_waiters(lock, ww_ctx);
659cf9f5824a12 kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  626  
ec83f425dbca47 kernel/mutex.c         Davidlohr Bueso           2013-06-28  627  		goto skip_wait;
659cf9f5824a12 kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  628  	}
ec83f425dbca47 kernel/mutex.c         Davidlohr Bueso           2013-06-28  629  
9a11b49a805665 kernel/mutex.c         Ingo Molnar               2006-07-03  630  	debug_mutex_lock_common(lock, &waiter);
c0afb0ffc06e6b kernel/locking/mutex.c Peter Zijlstra            2021-08-15  631  	waiter.task = current;
b857174e68e26f kernel/locking/mutex.c Sebastian Andrzej Siewior 2021-08-19  632  	if (use_ww_ctx)
c0afb0ffc06e6b kernel/locking/mutex.c Peter Zijlstra            2021-08-15  633  		waiter.ww_ctx = ww_ctx;
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  634  
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  635  	lock_contended(&lock->dep_map, ip);
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  636  
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  637  	if (!use_ww_ctx) {
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  638  		/* add waiting tasks to the end of the waitqueue (FIFO): */
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  639  		__mutex_add_waiter(lock, &waiter, &lock->wait_list);
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  640  	} else {
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  641  		/*
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  642  		 * Add in stamp order, waking up waiters that must kill
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  643  		 * themselves.
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  644  		 */
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  645  		ret = __ww_mutex_add_waiter(&waiter, lock, ww_ctx);
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  646  		if (ret)
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  647  			goto err_early_kill;
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  648  	}
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  649  
642fa448ae6b3a kernel/locking/mutex.c Davidlohr Bueso           2017-01-03  650  	set_current_state(state);
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  651  	trace_contention_begin(lock, LCB_F_MUTEX);
a1ad9b2ed459a3 kernel/locking/mutex.c Pu Lehui                  2025-07-16  652  	cgroup_ifs_enter_lock(&ifs_clock);
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  653  	for (;;) {
048661a1f963e9 kernel/locking/mutex.c Peter Zijlstra            2021-06-30  654  		bool first;
048661a1f963e9 kernel/locking/mutex.c Peter Zijlstra            2021-06-30  655  
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  656  		/*
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  657  		 * Once we hold wait_lock, we're serialized against
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  658  		 * mutex_unlock() handing the lock off to us, do a trylock
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  659  		 * before testing the error conditions to make sure we pick up
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  660  		 * the handoff.
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  661  		 */
e274795ea7b7ca kernel/locking/mutex.c Peter Zijlstra            2017-01-11  662  		if (__mutex_trylock(lock))
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  663  			goto acquired;
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  664  
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  665  		/*
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  666  		 * Check for signals and kill conditions while holding
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  667  		 * wait_lock. This ensures the lock cancellation is ordered
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  668  		 * against mutex_unlock() and wake-ups do not go missing.
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  669  		 */
3bb5f4ac55dd91 kernel/locking/mutex.c Davidlohr Bueso           2019-01-03  670  		if (signal_pending_state(state, current)) {
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  671  			ret = -EINTR;
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  672  			goto err;
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  673  		}
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  674  
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  675  		if (ww_ctx) {
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  676  			ret = __ww_mutex_check_kill(lock, &waiter, ww_ctx);
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  677  			if (ret)
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  678  				goto err;
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  679  		}
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  680  
ebf4c55c1ddbab kernel/locking/mutex.c Thomas Gleixner           2021-08-15  681  		raw_spin_unlock(&lock->wait_lock);
bd2f55361f1834 kernel/mutex.c         Thomas Gleixner           2011-03-21  682  		schedule_preempt_disabled();
9d659ae14b545c kernel/locking/mutex.c Peter Zijlstra            2016-08-23  683  
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  684  		first = __mutex_waiter_is_first(lock, &waiter);
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  685  
642fa448ae6b3a kernel/locking/mutex.c Davidlohr Bueso           2017-01-03  686  		set_current_state(state);
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  687  		/*
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  688  		 * Here we order against unlock; we must either see it change
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  689  		 * state back to RUNNING and fall through the next schedule(),
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  690  		 * or we must see its unlock and acquire.
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  691  		 */
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  692  		if (__mutex_trylock_or_handoff(lock, first))
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  693  			break;
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  694  
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  695  		if (first) {
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  696  			trace_contention_begin(lock, LCB_F_MUTEX | LCB_F_SPIN);
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  697  			if (mutex_optimistic_spin(lock, ww_ctx, &waiter))
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  698  				break;
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  699  			trace_contention_begin(lock, LCB_F_MUTEX);
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  700  		}
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  701  
ebf4c55c1ddbab kernel/locking/mutex.c Thomas Gleixner           2021-08-15  702  		raw_spin_lock(&lock->wait_lock);
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  703  	}
ebf4c55c1ddbab kernel/locking/mutex.c Thomas Gleixner           2021-08-15  704  	raw_spin_lock(&lock->wait_lock);
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  705  acquired:
642fa448ae6b3a kernel/locking/mutex.c Davidlohr Bueso           2017-01-03  706  	__set_current_state(TASK_RUNNING);
51587bcf31d070 kernel/locking/mutex.c Davidlohr Bueso           2015-01-19  707  
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  708  	if (ww_ctx) {
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  709  		/*
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  710  		 * Wound-Wait; we stole the lock (!first_waiter), check the
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  711  		 * waiters as anyone might want to wound us.
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  712  		 */
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  713  		if (!ww_ctx->is_wait_die &&
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  714  		    !__mutex_waiter_is_first(lock, &waiter))
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  715  			__ww_mutex_check_waiters(lock, ww_ctx);
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  716  	}
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  717  
3a010c493271f0 kernel/locking/mutex.c Zqiang                    2021-05-17  718  	__mutex_remove_waiter(lock, &waiter);
3ca0ff571b092e kernel/locking/mutex.c Peter Zijlstra            2016-08-23  719  
ec83f425dbca47 kernel/mutex.c         Davidlohr Bueso           2013-06-28  720  	debug_mutex_free_waiter(&waiter);
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  721  
ec83f425dbca47 kernel/mutex.c         Davidlohr Bueso           2013-06-28  722  skip_wait:
ec83f425dbca47 kernel/mutex.c         Davidlohr Bueso           2013-06-28  723  	/* got the lock - cleanup and rejoice! */
c7e78cff6b7518 kernel/mutex.c         Peter Zijlstra            2008-10-16  724  	lock_acquired(&lock->dep_map, ip);
a1ad9b2ed459a3 kernel/locking/mutex.c Pu Lehui                  2025-07-16  725  	cgroup_ifs_leave_lock(ifs_clock, IFS_MUTEX);
ee042be16cb455 kernel/locking/mutex.c Namhyung Kim              2022-03-22  726  	trace_contention_end(lock, 0);
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  727  
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  728  	if (ww_ctx)
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  729  		ww_mutex_lock_acquired(ww, ww_ctx);
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  730  
ebf4c55c1ddbab kernel/locking/mutex.c Thomas Gleixner           2021-08-15  731  	raw_spin_unlock(&lock->wait_lock);
41719b03091911 kernel/mutex.c         Peter Zijlstra            2009-01-14  732  	preempt_enable();
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  733  	return 0;
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  734  
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  735  err:
642fa448ae6b3a kernel/locking/mutex.c Davidlohr Bueso           2017-01-03  736  	__set_current_state(TASK_RUNNING);
3a010c493271f0 kernel/locking/mutex.c Zqiang                    2021-05-17  737  	__mutex_remove_waiter(lock, &waiter);
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  738  err_early_kill:
a1ad9b2ed459a3 kernel/locking/mutex.c Pu Lehui                  2025-07-16  739  	cgroup_ifs_leave_lock(ifs_clock, IFS_MUTEX);
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  740  	trace_contention_end(lock, ret);
ebf4c55c1ddbab kernel/locking/mutex.c Thomas Gleixner           2021-08-15  741  	raw_spin_unlock(&lock->wait_lock);
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  742  	debug_mutex_free_waiter(&waiter);
5facae4f3549b5 kernel/locking/mutex.c Qian Cai                  2019-09-19  743  	mutex_release(&lock->dep_map, ip);
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  744  	preempt_enable();
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  745  	return ret;
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  746  }
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  747  

:::::: The code at line 623 was first introduced by commit
:::::: 659cf9f5824a12e6b50785e4e9cf1adf8a3adbd0 locking/ww_mutex: Optimize ww-mutexes by waking at most one waiter for backoff when acquiring the lock

:::::: TO: Nicolai Hähnle <Nicolai.Haehnle@amd.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
