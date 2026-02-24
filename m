Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C8418787A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 02:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771898439; cv=none; b=VA6LqoOYkSudveiiX3OHtcZQlqm+n8BxSUuSU34mvh4NpDAv9jsnRd/Eb/xUCe4PRPWG7S2H7YBJxEF5ZfLjBxTtbRhIPsNOvu59u4/eMdZ8YoFKYWKpeJEjEPVAbEiC1jG/y6+F3fOziV/UsFBzJppkpw+wpC79H5jCQk/3wJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771898439; c=relaxed/simple;
	bh=0b+dNhugRT2GOV6r10mK0Dygm1I3mqNUebPxK4S72hI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A8231GKl60Eh312xQXOo5BDRJAOqCoI+NcrJj0p6lJs6/sH2BpdFrBFLWz5juznvznMLb98xqm3mn/zFGRQEGP9hlW7zpHiMEfqAw4PzpB2PYW04c3ZjhpnfsHM5oylK9IUitVK1eVRQqT0f/gqYCwXm5R4K2RqN/bMr7UzPsPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdXvQ8Hh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdXvQ8Hh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771898437; x=1803434437;
  h=date:from:to:cc:subject:message-id;
  bh=0b+dNhugRT2GOV6r10mK0Dygm1I3mqNUebPxK4S72hI=;
  b=NdXvQ8HhdFUcUC3lbdIzhDazIWFIenKFLNaYlqvF4AHGJLm3O+q9dtTk
   3i+NWPFHh6HNFmvfjIs9I/hviqIr8KQA489e0CVA+a5/jYCpwcsDqh5oe
   3i97zproWSqH5MF5DbjpkuEfQk6LqJFj2AUWNF7+NqV7RCLfPd+6F8KjE
   K+/EE6gYTsF9lav1mPytHh1+ijXXIuNkcyPTWXEHdJyR8myeBzT1mdsLw
   ucZTdhooKn1/GFg1CeNqlYCYWDy3CbKM5fPuCfSVYgG75r8ytRJIwxrVo
   0S+VU/ruM4d12mSw30gXjMHbefWoPuMut5L2Eg299POql2BZ2wFmYf2HN
   Q==;
X-CSE-ConnectionGUID: AcHpg1DVTtC/P3GqGSRdbg==
X-CSE-MsgGUID: /MHoUBBzRKaUoy+BGRTOpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76736153"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="76736153"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 18:00:36 -0800
X-CSE-ConnectionGUID: oE+zUChHRHaNvdCbdfMQ2Q==
X-CSE-MsgGUID: PCPmE/gwShCTVpbWjW7iOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="220312087"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Feb 2026 18:00:34 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuhiy-0000000018f-0vwl;
	Tue, 24 Feb 2026 02:00:32 +0000
Date: Tue, 24 Feb 2026 09:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 kernel/locking/rwsem.c:447:31: warning: variable 'donor' set but not used
Message-ID: <202602240923.SG4knJBI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   4ea731e9f36e8451ebb0c17931f0aa73b0296988
commit: 8f585b1490b3ffb4dfedd448b3c770807cd96a7b [3/3] ANDROID: Reapply: locking/rwsem: Wake up donor first.
config: arm64-randconfig-002-20260224 (https://download.01.org/0day-ci/archive/20260224/202602240923.SG4knJBI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602240923.SG4knJBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602240923.SG4knJBI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/locking/rwsem.c: In function 'rwsem_mark_wake':
>> kernel/locking/rwsem.c:447:31: warning: variable 'donor' set but not used [-Wunused-but-set-variable]
     447 |  struct task_struct *_donor, *donor;
         |                               ^~~~~


vim +/donor +447 kernel/locking/rwsem.c

   426	
   427	/*
   428	 * handle the lock release when processes blocked on it that can now run
   429	 * - if we come here from up_xxxx(), then the RWSEM_FLAG_WAITERS bit must
   430	 *   have been set.
   431	 * - there must be someone on the queue
   432	 * - the wait_lock must be held by the caller
   433	 * - tasks are marked for wakeup, the caller must later invoke wake_up_q()
   434	 *   to actually wakeup the blocked task(s) and drop the reference count,
   435	 *   preferably when the wait_lock is released
   436	 * - woken process blocks are discarded from the list after having task zeroed
   437	 * - writers are only marked woken if downgrading is false
   438	 *
   439	 * Implies rwsem_del_waiter() for all woken readers.
   440	 */
   441	static void rwsem_mark_wake(struct rw_semaphore *sem,
   442				    enum rwsem_wake_type wake_type,
   443				    struct wake_q_head *wake_q)
   444	{
   445		struct rwsem_waiter *w, *waiter, *tmp;
   446		long oldcount, woken = 0, adjustment = 0;
 > 447		struct task_struct *_donor, *donor;
   448		struct list_head wlist;
   449	
   450		lockdep_assert_held(&sem->wait_lock);
   451	
   452		waiter = NULL;
   453		donor = NULL;
   454		/* Try to wake up our donor */
   455		if (sched_proxy_exec()) {
   456			raw_spin_lock(&current->blocked_lock);
   457			_donor = current->blocked_donor;
   458			if (_donor) {
   459				raw_spin_lock_nested(&_donor->blocked_lock,
   460				    SINGLE_DEPTH_NESTING);
   461				if (__get_task_blocked_on(_donor) == sem) {
   462					list_for_each_entry(w, &sem->wait_list, list) {
   463						if (w->task == _donor) {
   464							donor = _donor;
   465							waiter = w;
   466							waiter->donor_wakeup = true;
   467							break;
   468						}
   469					}
   470					WARN_ON_ONCE(waiter == NULL);
   471				}
   472				raw_spin_unlock(&_donor->blocked_lock);
   473			}
   474			raw_spin_unlock(&current->blocked_lock);
   475		}
   476	
   477		/*
   478		 * Take a peek at the queue head waiter such that we can determine
   479		 * the wakeup(s) to perform.
   480		 */
   481		if (waiter == NULL)
   482			waiter = rwsem_first_waiter(sem);
   483	
   484		if (waiter->type == RWSEM_WAITING_FOR_WRITE) {
   485			if (wake_type == RWSEM_WAKE_ANY) {
   486				/*
   487				 * Mark writer at the front of the queue for wakeup.
   488				 * Until the task is actually later awoken later by
   489				 * the caller, other writers are able to steal it.
   490				 * Readers, on the other hand, will block as they
   491				 * will notice the queued writer.
   492				 */
   493				raw_spin_lock(&waiter->task->blocked_lock);
   494				/*
   495				 * We also get here if sem was reader owned and thus
   496				 * waiter isn't blocked_on, but this function only sets
   497				 * PROXY_WAKING if it is.
   498				 */
   499				__set_task_blocked_on_waking(waiter->task, sem);
   500				if (waiter->task == current->blocked_donor)
   501					current->blocked_donor = NULL;
   502				raw_spin_unlock(&waiter->task->blocked_lock);
   503				wake_q_add(wake_q, waiter->task);
   504				lockevent_inc(rwsem_wake_writer);
   505			}
   506	
   507			return;
   508		}
   509	
   510		/*
   511		 * No reader wakeup if there are too many of them already.
   512		 */
   513		if (unlikely(atomic_long_read(&sem->count) < 0))
   514			return;
   515	
   516		/*
   517		 * Writers might steal the lock before we grant it to the next reader.
   518		 * We prefer to do the first reader grant before counting readers
   519		 * so we can bail out early if a writer stole the lock.
   520		 */
   521		if (wake_type != RWSEM_WAKE_READ_OWNED) {
   522			struct task_struct *owner;
   523	
   524			adjustment = RWSEM_READER_BIAS;
   525			oldcount = atomic_long_fetch_add(adjustment, &sem->count);
   526			if (unlikely(oldcount & RWSEM_WRITER_MASK)) {
   527				/*
   528				 * When we've been waiting "too" long (for writers
   529				 * to give up the lock), request a HANDOFF to
   530				 * force the issue.
   531				 */
   532				if (time_after(jiffies, waiter->timeout)) {
   533					if (!(oldcount & RWSEM_FLAG_HANDOFF)) {
   534						adjustment -= RWSEM_FLAG_HANDOFF;
   535						lockevent_inc(rwsem_rlock_handoff);
   536					}
   537					waiter->handoff_set = true;
   538				}
   539	
   540				atomic_long_add(-adjustment, &sem->count);
   541				return;
   542			}
   543			/*
   544			 * Set it to reader-owned to give spinners an early
   545			 * indication that readers now have the lock.
   546			 * The reader nonspinnable bit seen at slowpath entry of
   547			 * the reader is copied over.
   548			 */
   549			owner = waiter->task;
   550			__rwsem_set_reader_owned(sem, owner);
   551		}
   552	
   553		/*
   554		 * Grant up to MAX_READERS_WAKEUP read locks to all the readers in the
   555		 * queue. We know that the woken will be at least 1 as we accounted
   556		 * for above. Note we increment the 'active part' of the count by the
   557		 * number of readers before waking any processes up.
   558		 *
   559		 * This is an adaptation of the phase-fair R/W locks where at the
   560		 * reader phase (first waiter is a reader), all readers are eligible
   561		 * to acquire the lock at the same time irrespective of their order
   562		 * in the queue. The writers acquire the lock according to their
   563		 * order in the queue.
   564		 *
   565		 * We have to do wakeup in 2 passes to prevent the possibility that
   566		 * the reader count may be decremented before it is incremented. It
   567		 * is because the to-be-woken waiter may not have slept yet. So it
   568		 * may see waiter->task got cleared, finish its critical section and
   569		 * do an unlock before the reader count increment.
   570		 *
   571		 * 1) Collect the read-waiters in a separate list, count them and
   572		 *    fully increment the reader count in rwsem.
   573		 * 2) For each waiters in the new list, clear waiter->task and
   574		 *    put them into wake_q to be woken up later.
   575		 */
   576		INIT_LIST_HEAD(&wlist);
   577		list_for_each_entry_safe(waiter, tmp, &sem->wait_list, list) {
   578			if (waiter->type == RWSEM_WAITING_FOR_WRITE)
   579				continue;
   580	
   581			woken++;
   582			list_move_tail(&waiter->list, &wlist);
   583	
   584			/*
   585			 * Limit # of readers that can be woken up per wakeup call.
   586			 */
   587			if (unlikely(woken >= MAX_READERS_WAKEUP))
   588				break;
   589		}
   590	
   591		adjustment = woken * RWSEM_READER_BIAS - adjustment;
   592		lockevent_cond_inc(rwsem_wake_reader, woken);
   593	
   594		oldcount = atomic_long_read(&sem->count);
   595		if (list_empty(&sem->wait_list)) {
   596			/*
   597			 * Combined with list_move_tail() above, this implies
   598			 * rwsem_del_waiter().
   599			 */
   600			adjustment -= RWSEM_FLAG_WAITERS;
   601			if (oldcount & RWSEM_FLAG_HANDOFF)
   602				adjustment -= RWSEM_FLAG_HANDOFF;
   603		} else if (woken) {
   604			/*
   605			 * When we've woken a reader, we no longer need to force
   606			 * writers to give up the lock and we can clear HANDOFF.
   607			 */
   608			if (oldcount & RWSEM_FLAG_HANDOFF)
   609				adjustment -= RWSEM_FLAG_HANDOFF;
   610		}
   611	
   612		if (adjustment)
   613			atomic_long_add(adjustment, &sem->count);
   614	
   615		/* 2nd pass */
   616		list_for_each_entry_safe(waiter, tmp, &wlist, list) {
   617			struct task_struct *tsk;
   618	
   619			tsk = waiter->task;
   620			get_task_struct(tsk);
   621	
   622			/*
   623			 * Ensure calling get_task_struct() before setting the reader
   624			 * waiter to nil such that rwsem_down_read_slowpath() cannot
   625			 * race with do_exit() by always holding a reference count
   626			 * to the task to wakeup.
   627			 */
   628			smp_store_release(&waiter->task, NULL);
   629			/*
   630			 * Ensure issuing the wakeup (either by us or someone else)
   631			 * after setting the reader waiter to nil.
   632			 */
   633			wake_q_add_safe(wake_q, tsk);
   634			raw_spin_lock(&tsk->blocked_lock);
   635			/*
   636			 * We also get here if sem was reader owned and thus
   637			 * waiter isn't blocked_on, but this function only sets
   638			 * PROXY_WAKING if we are.
   639			 */
   640			__set_task_blocked_on_waking(tsk, sem);
   641			if (tsk == current->blocked_donor)
   642				current->blocked_donor = NULL;
   643			raw_spin_unlock(&tsk->blocked_lock);
   644		}
   645	}
   646	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
