Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EA02BD5B9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 16:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762534410; cv=none; b=t5eNAOWd1hV3Dh0taXrHkvus8lfUkL6wKoC8llJqFKVsLRId70rq0bRcoFREIAaUnV1aeekMGf7gTEV6Px1v4EU6JNIMLPQPHEQMh4yqaI39Zjl7GxJPZYLMep9f0p9/WsHE9kp1vppZ6R0i5ji2Qpm6CqfzQ8VMgYEJkejMLJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762534410; c=relaxed/simple;
	bh=uKkUpKAra55va9mtv8z7ke7PuGIskwYywdSQEHXjS2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YMX0MfukKs3rDZOMn6zEh81JPTiQ+BTulvPiRB1fepCT3VZ7JkMAxzPTA2C+7pL+hFoRpFY9IaxxWDXPPnNkm9wSDoV9Ar5ONaBiCZqQ4/ux7JnQsBmsYFguOEHQ9uJrNZHau1c/GOMn5A7v6RUcjpR+fChpF6Ehqvp05bsq7Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kgj4rcC8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kgj4rcC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762534409; x=1794070409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uKkUpKAra55va9mtv8z7ke7PuGIskwYywdSQEHXjS2Q=;
  b=Kgj4rcC8/kF4EPmslL2QXn6Uvg73hBo77t0vLORR4lBWNJnGjmPSvw3u
   ddS6BYI0oaPvGzFBhnr4PFYUZAHYzeNE1pTAKbYJRj655NgjwZxN57osc
   890WtOGl2TsqzQkAJse0dkjPKx3S5DxHu/AQd2dZ3kPHqG6cyKeOZzPPe
   QHeKx3AsKYwBcSfL0E0fN4XVhMKyo4DMe8UJ4onrljhVhme2FDbPNm25D
   mmhQ9xhsYbWYrPCfu8acNPgs56By+ObNsiar+RtKMulo96p9+u5vgEZ1Z
   aSaz+B8kPr1Cind7d2m4i7P8fWv9qhZuWid/awPBKqniMfxCqwiiCHoXs
   w==;
X-CSE-ConnectionGUID: UYW0oVCOT+WG5qrG5i8rpA==
X-CSE-MsgGUID: 9nVnTM7+TNSX6V5grlB+5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="76135717"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="76135717"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 08:53:28 -0800
X-CSE-ConnectionGUID: 4z0bwwnlSxaTn3EZNTnhJA==
X-CSE-MsgGUID: ZrO4T/5dTNCuSA6MSdqubg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="187919674"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2025 08:53:26 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vHPiG-000000003Su-2uMM;
	Fri, 07 Nov 2025 16:53:24 +0000
Date: Fri, 7 Nov 2025 17:52:42 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:rqspinlock/fix 3/3] kernel/bpf/rqspinlock.c:568:53:
 warning: suggest parentheses around '&&' within '||'
Message-ID: <202511071724.vV6t2lcd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux rqspinlock/fix
head:   1c218aec083042d8683e8088d49abc8109529da7
commit: 1c218aec083042d8683e8088d49abc8109529da7 [3/3] rqspinlock: Destruct queue when intermediate nodes detect deadlock
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251107/202511071724.vV6t2lcd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511071724.vV6t2lcd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511071724.vV6t2lcd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/barrier.h:81,
                    from include/linux/list.h:11,
                    from include/linux/smp.h:12,
                    from kernel/bpf/rqspinlock.c:16:
   kernel/bpf/rqspinlock.c: In function 'resilient_queued_spin_lock_slowpath':
>> kernel/bpf/rqspinlock.c:568:53: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
     568 |                                                 VAL && (VAL == seq || RES_TIMEOUT_VAL(-seq)) ||
         |                                                 ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:251:21: note: in definition of macro 'smp_cond_load_relaxed'
     251 |                 if (cond_expr)                                  \
         |                     ^~~~~~~~~
   kernel/bpf/rqspinlock.c:330:41: note: in expansion of macro 'smp_cond_load_acquire'
     330 | #define res_smp_cond_load_acquire(v, c) smp_cond_load_acquire(v, c)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/rqspinlock.c:567:23: note: in expansion of macro 'res_smp_cond_load_acquire'
     567 |                 val = res_smp_cond_load_acquire(&node->locked,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +568 kernel/bpf/rqspinlock.c

   334	
   335	/**
   336	 * resilient_queued_spin_lock_slowpath - acquire the queued spinlock
   337	 * @lock: Pointer to queued spinlock structure
   338	 * @val: Current value of the queued spinlock 32-bit word
   339	 *
   340	 * Return:
   341	 * * 0		- Lock was acquired successfully.
   342	 * * -EDEADLK	- Lock acquisition failed because of AA/ABBA deadlock.
   343	 * * -ETIMEDOUT - Lock acquisition failed because of timeout.
   344	 *
   345	 * (queue tail, pending bit, lock value)
   346	 *
   347	 *              fast     :    slow                                  :    unlock
   348	 *                       :                                          :
   349	 * uncontended  (0,0,0) -:--> (0,0,1) ------------------------------:--> (*,*,0)
   350	 *                       :       | ^--------.------.             /  :
   351	 *                       :       v           \      \            |  :
   352	 * pending               :    (0,1,1) +--> (0,1,0)   \           |  :
   353	 *                       :       | ^--'              |           |  :
   354	 *                       :       v                   |           |  :
   355	 * uncontended           :    (n,x,y) +--> (n,0,0) --'           |  :
   356	 *   queue               :       | ^--'                          |  :
   357	 *                       :       v                               |  :
   358	 * contended             :    (*,x,y) +--> (*,0,0) ---> (*,0,1) -'  :
   359	 *   queue               :         ^--'                             :
   360	 */
   361	int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
   362	{
   363		struct mcs_spinlock *prev, *next, *node;
   364		struct rqspinlock_timeout ts;
   365		int idx, ret = 0;
   366		u32 old, tail;
   367	
   368		BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
   369	
   370		if (resilient_virt_spin_lock_enabled())
   371			return resilient_virt_spin_lock(lock);
   372	
   373		RES_INIT_TIMEOUT(ts);
   374	
   375		/*
   376		 * Wait for in-progress pending->locked hand-overs with a bounded
   377		 * number of spins so that we guarantee forward progress.
   378		 *
   379		 * 0,1,0 -> 0,0,1
   380		 */
   381		if (val == _Q_PENDING_VAL) {
   382			int cnt = _Q_PENDING_LOOPS;
   383			val = atomic_cond_read_relaxed(&lock->val,
   384						       (VAL != _Q_PENDING_VAL) || !cnt--);
   385		}
   386	
   387		/*
   388		 * If we observe any contention; queue.
   389		 */
   390		if (val & ~_Q_LOCKED_MASK)
   391			goto queue;
   392	
   393		/*
   394		 * trylock || pending
   395		 *
   396		 * 0,0,* -> 0,1,* -> 0,0,1 pending, trylock
   397		 */
   398		val = queued_fetch_set_pending_acquire(lock);
   399	
   400		/*
   401		 * If we observe contention, there is a concurrent locker.
   402		 *
   403		 * Undo and queue; our setting of PENDING might have made the
   404		 * n,0,0 -> 0,0,0 transition fail and it will now be waiting
   405		 * on @next to become !NULL.
   406		 */
   407		if (unlikely(val & ~_Q_LOCKED_MASK)) {
   408	
   409			/* Undo PENDING if we set it. */
   410			if (!(val & _Q_PENDING_MASK))
   411				clear_pending(lock);
   412	
   413			goto queue;
   414		}
   415	
   416		/*
   417		 * Grab an entry in the held locks array, to enable deadlock detection.
   418		 */
   419		grab_held_lock_entry(lock);
   420	
   421		/*
   422		 * We're pending, wait for the owner to go away.
   423		 *
   424		 * 0,1,1 -> *,1,0
   425		 *
   426		 * this wait loop must be a load-acquire such that we match the
   427		 * store-release that clears the locked bit and create lock
   428		 * sequentiality; this is because not all
   429		 * clear_pending_set_locked() implementations imply full
   430		 * barriers.
   431		 */
   432		if (val & _Q_LOCKED_MASK) {
   433			RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT);
   434			res_smp_cond_load_acquire(&lock->locked, !VAL || RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_MASK));
   435		}
   436	
   437		if (ret) {
   438			/*
   439			 * We waited for the locked bit to go back to 0, as the pending
   440			 * waiter, but timed out. We need to clear the pending bit since
   441			 * we own it. Once a stuck owner has been recovered, the lock
   442			 * must be restored to a valid state, hence removing the pending
   443			 * bit is necessary.
   444			 *
   445			 * *,1,* -> *,0,*
   446			 */
   447			clear_pending(lock);
   448			lockevent_inc(rqspinlock_lock_timeout);
   449			goto err_release_entry;
   450		}
   451	
   452		/*
   453		 * take ownership and clear the pending bit.
   454		 *
   455		 * 0,1,0 -> 0,0,1
   456		 */
   457		clear_pending_set_locked(lock);
   458		lockevent_inc(lock_pending);
   459		return 0;
   460	
   461		/*
   462		 * End of pending bit optimistic spinning and beginning of MCS
   463		 * queuing.
   464		 */
   465	queue:
   466		lockevent_inc(lock_slowpath);
   467		/*
   468		 * Grab deadlock detection entry for the queue path.
   469		 */
   470		grab_held_lock_entry(lock);
   471	
   472		node = this_cpu_ptr(&rqnodes[0].res_mcs.mcs);
   473		idx = node->count++;
   474		tail = encode_tail_rqnode(smp_processor_id(), idx);
   475	
   476		trace_contention_begin(lock, LCB_F_SPIN);
   477	
   478		/*
   479		 * 4 nodes are allocated based on the assumption that there will
   480		 * not be nested NMIs taking spinlocks. That may not be true in
   481		 * some architectures even though the chance of needing more than
   482		 * 4 nodes will still be extremely unlikely. When that happens,
   483		 * we fall back to spinning on the lock directly without using
   484		 * any MCS node. This is not the most elegant solution, but is
   485		 * simple enough.
   486		 */
   487		if (unlikely(idx >= _Q_MAX_NODES || in_nmi())) {
   488			lockevent_inc(lock_no_node);
   489			RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT);
   490			while (!queued_spin_trylock(lock)) {
   491				if (RES_CHECK_TIMEOUT(ts, ret, ~0u)) {
   492					lockevent_inc(rqspinlock_lock_timeout);
   493					goto err_release_node;
   494				}
   495				cpu_relax();
   496			}
   497			goto release;
   498		}
   499	
   500		node = grab_res_mcs_node(node, idx);
   501	
   502		/*
   503		 * Keep counts of non-zero index values:
   504		 */
   505		lockevent_cond_inc(lock_use_node2 + idx - 1, idx);
   506	
   507		/*
   508		 * Ensure that we increment the head node->count before initialising
   509		 * the actual node. If the compiler is kind enough to reorder these
   510		 * stores, then an IRQ could overwrite our assignments.
   511		 */
   512		barrier();
   513	
   514		node->locked = 0;
   515		node->next = NULL;
   516	
   517		/*
   518		 * We touched a (possibly) cold cacheline in the per-cpu queue node;
   519		 * attempt the trylock once more in the hope someone let go while we
   520		 * weren't watching.
   521		 */
   522		if (queued_spin_trylock(lock))
   523			goto release;
   524	
   525		/*
   526		 * Ensure that the initialisation of @node is complete before we
   527		 * publish the updated tail via xchg_tail() and potentially link
   528		 * @node into the waitqueue via WRITE_ONCE(prev->next, node) below.
   529		 */
   530		smp_wmb();
   531	
   532		/*
   533		 * Publish the updated tail.
   534		 * We have already touched the queueing cacheline; don't bother with
   535		 * pending stuff.
   536		 *
   537		 * p,*,* -> n,*,*
   538		 */
   539		old = xchg_tail(lock, tail);
   540		next = NULL;
   541	
   542		prev = NULL;
   543		/*
   544		 * if there was a previous node; link it and wait until reaching the
   545		 * head of the waitqueue.
   546		 */
   547		if (old & _Q_TAIL_MASK) {
   548			struct res_mcs_spinlock *prev_rmcs;
   549			int seq, val;
   550	
   551			if (old == encode_tail_rqnode(-1, 0)) {
   552				ret = -ETIMEDOUT;
   553				goto waitq_timeout;
   554			}
   555	
   556			prev = decode_tail_rqnode(old, rqnodes);
   557			prev_rmcs = (struct res_mcs_spinlock *)prev;
   558	
   559			seq = get_node_seq();
   560	
   561			WRITE_ONCE(prev_rmcs->next_node_seq, seq);
   562			/* Link @node into the waitqueue, use release to order seq. */
   563			smp_store_release(&prev->next, node);
   564	
   565			RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT * 2);
   566			/* Mask is 0, since MCS spinners don't poll the lock. */
   567			val = res_smp_cond_load_acquire(&node->locked,
 > 568							VAL && (VAL == seq || RES_TIMEOUT_VAL(-seq)) ||
   569							RES_CHECK_TIMEOUT(ts, ret, 0U));
   570			if (ret || val == RES_TIMEOUT_VAL(seq)) {
   571				ret = -ETIMEDOUT;
   572				goto waitq_timeout;
   573			}
   574	
   575			// TODO(kkd): Just for debugging/testing, remove later after
   576			// adding a test for this race, since it can happen for real.
   577			// When we hit such a case, we must keep waiting instead of
   578			// breaking the waiting loop.
   579			BUG_ON(val != seq);
   580	
   581			/*
   582			 * While waiting for the MCS lock, the next pointer may have
   583			 * been set by another lock waiter. We optimistically load
   584			 * the next pointer & prefetch the cacheline for writing
   585			 * to reduce latency in the upcoming MCS unlock operation.
   586			 */
   587			next = READ_ONCE(node->next);
   588			if (next)
   589				prefetchw(next);
   590		}
   591	
   592		/*
   593		 * we're at the head of the waitqueue, wait for the owner & pending to
   594		 * go away.
   595		 *
   596		 * *,x,y -> *,0,0
   597		 *
   598		 * this wait loop must use a load-acquire such that we match the
   599		 * store-release that clears the locked bit and create lock
   600		 * sequentiality; this is because the set_locked() function below
   601		 * does not imply a full barrier.
   602		 *
   603		 * We use RES_DEF_TIMEOUT * 2 as the duration, as RES_DEF_TIMEOUT is
   604		 * meant to span maximum allowed time per critical section, and we may
   605		 * have both the owner of the lock and the pending bit waiter ahead of
   606		 * us.
   607		 */
   608		RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT * 2);
   609		val = res_atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK) ||
   610						   RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_PENDING_MASK));
   611	
   612		/* Disable queue destruction when we detect deadlocks. */
   613		if (ret == -EDEADLK) {
   614			if (!next)
   615				next = smp_cond_load_relaxed(&node->next, (VAL));
   616			arch_mcs_spin_unlock_contended(&next->locked);
   617			goto err_release_node;
   618		}
   619	
   620	waitq_timeout:
   621		if (ret) {
   622			/*
   623			 * If the tail is still pointing to us, then we are the final waiter,
   624			 * and are responsible for resetting the tail back to 0. Otherwise, if
   625			 * the cmpxchg operation fails, we signal the next waiter to take exit
   626			 * and try the same. For a waiter with tail node 'n':
   627			 *
   628			 * n,*,* -> 0,*,*
   629			 *
   630			 * When performing cmpxchg for the whole word (NR_CPUS > 16k), it is
   631			 * possible locked/pending bits keep changing and we see failures even
   632			 * when we remain the head of wait queue. However, eventually,
   633			 * pending bit owner will unset the pending bit, and new waiters
   634			 * will queue behind us. This will leave the lock owner in
   635			 * charge, and it will eventually either set locked bit to 0, or
   636			 * leave it as 1, allowing us to make progress.
   637			 *
   638			 * We terminate the whole wait queue for two reasons. Firstly,
   639			 * we eschew per-waiter timeouts with one applied at the head of
   640			 * the wait queue.  This allows everyone to break out faster
   641			 * once we've seen the owner / pending waiter not responding for
   642			 * the timeout duration from the head.  Secondly, it avoids
   643			 * complicated synchronization, because when not leaving in FIFO
   644			 * order, prev's next pointer needs to be fixed up etc.
   645			 */
   646			if (!try_cmpxchg_tail(lock, tail, encode_tail_rqnode(-1, 0))) {
   647				struct res_mcs_spinlock *node_rmcs = (struct res_mcs_spinlock *)node;
   648				/*
   649				 * This load needs to be acquire to observe
   650				 * next_node_seq written by the next waiter.
   651				 */
   652				next = smp_cond_load_acquire(&node->next, VAL);
   653				WRITE_ONCE(next->locked, RES_TIMEOUT_VAL(node_rmcs->next_node_seq));
   654			}
   655			/* Reset queue head. */
   656			if (!prev)
   657				xchg_tail(lock, 0);
   658			lockevent_inc(rqspinlock_lock_timeout);
   659			goto err_release_node;
   660		}
   661	
   662		/*
   663		 * claim the lock:
   664		 *
   665		 * n,0,0 -> 0,0,1 : lock, uncontended
   666		 * *,*,0 -> *,*,1 : lock, contended
   667		 *
   668		 * If the queue head is the only one in the queue (lock value == tail)
   669		 * and nobody is pending, clear the tail code and grab the lock.
   670		 * Otherwise, we only need to grab the lock.
   671		 */
   672	
   673		/*
   674		 * Note: at this point: (val & _Q_PENDING_MASK) == 0, because of the
   675		 *       above wait condition, therefore any concurrent setting of
   676		 *       PENDING will make the uncontended transition fail.
   677		 */
   678		if ((val & _Q_TAIL_MASK) == tail) {
   679			if (atomic_try_cmpxchg_relaxed(&lock->val, &val, _Q_LOCKED_VAL))
   680				goto release; /* No contention */
   681		}
   682	
   683		/*
   684		 * Either somebody is queued behind us or _Q_PENDING_VAL got set
   685		 * which will then detect the remaining tail and queue behind us
   686		 * ensuring we'll see a @next.
   687		 */
   688		set_locked(lock);
   689	
   690		/*
   691		 * contended path; wait for next if not observed yet, release.
   692		 * Needs to be acquire to correctly observe next_node_seq.
   693		 */
   694		if (!next)
   695			next = smp_cond_load_acquire(&node->next, (VAL));
   696	
   697		smp_store_release(&node->locked, ((struct res_mcs_spinlock *)node)->next_node_seq);
   698	
   699	release:
   700		trace_contention_end(lock, 0);
   701	
   702		/*
   703		 * release the node
   704		 */
   705		__this_cpu_dec(rqnodes[0].res_mcs.mcs.count);
   706		return ret;
   707	err_release_node:
   708		trace_contention_end(lock, ret);
   709		__this_cpu_dec(rqnodes[0].res_mcs.mcs.count);
   710	err_release_entry:
   711		release_held_lock_entry();
   712		return ret;
   713	}
   714	EXPORT_SYMBOL_GPL(resilient_queued_spin_lock_slowpath);
   715	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
