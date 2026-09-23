Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BCC4AB1AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 16:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181447; cv=none; b=KOIbKtpyCD3ykw0B08bxaiJfgt+pC4ziv3Ta8jVyU+3C/RHQZo26Szw1tKJVxJjJfIfroZTFRhSAE61UTNAUl8Cpyx0SBN6UgF6ParssjrERa8xAoDXnvMR8SNs623LCIFlyGnGMKgQioiMt0hVf75uVryKAfJnaTV+tmTOt4i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181447; c=relaxed/simple;
	bh=t/cNmNSoPKu9EUU7qyzOMX8w/WHC2bezWQOpZ3AXB/s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=guY0bA/nMQ0ipXGFe4hdhBdcssVFQwWCkUHVax2flUtn3ko1GgJXvsLofBlio7hVGPDkao1maBrxt6mhOS6J9MWd8ObKyUJSKbCCRP+opbitQ3evqE+9mjyZTkttDzare+LxzGkMdi/1dZE1IWTtySIrS5W1WYPpbjwUZg79BCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVQaz97h; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVQaz97h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790181438; x=1821717438;
  h=date:from:to:cc:subject:message-id;
  bh=t/cNmNSoPKu9EUU7qyzOMX8w/WHC2bezWQOpZ3AXB/s=;
  b=OVQaz97h22VgAcENHJzLQi+q6L2LEXlbZU7v1nilQp5VLJGNz7TGmeoa
   l9zBy2UPm8hvRC+xWGT1WVAKgKLF1zNgJVhwUoHdYfePXjiIt6sRGday9
   epgKofiLPkK5ukM4eMLKnALeR8TJ3aUBHQ0RxbP/BFCiiA/7DnGBkc5YC
   MMJh+804ddmTxa/0EiSzQe53QecjTygZCwwLPly0XNRJsPKRGnHhbMnkD
   WTHWsP9Nm3Ap01GjurkpL0nfll7ZWkXq10T300EvBDfcZFAC+oIVtCdCV
   nuGE5eTzzH8NnYEuVliDJ1CDW7NhikcbY0WF+08uUzOMcQt9QymIeHlAT
   w==;
X-CSE-ConnectionGUID: WQj2daZ8TVGOqP4G4DDLgw==
X-CSE-MsgGUID: ArBVxoOsSPWTwvG49J+V9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="116421973"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="116421973"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 09:37:03 -0700
X-CSE-ConnectionGUID: yRF6njsvTPKmEL0gynvp0Q==
X-CSE-MsgGUID: SLjNlJlLT2utS6MyG/XTWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272281517"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2026 09:37:01 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Pxr-000000000kN-0pmk;
	Wed, 23 Sep 2026 16:36:59 +0000
Date: Wed, 23 Sep 2026 18:36:43 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 kernel/locking/rwsem.c:447:38: warning: variable 'donor' set but not used
Message-ID: <202609231825.lJ1Dl0k6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Suleiman,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ac1ed475ebcccb1c9df9130953af8e5dcb11cd84
commit: 8f585b1490b3ffb4dfedd448b3c770807cd96a7b [1/1] ANDROID: Reapply: locking/rwsem: Wake up donor first.
config: x86_64-randconfig-2200-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231825.lJ1Dl0k6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231825.lJ1Dl0k6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231825.lJ1Dl0k6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/locking/rwsem.c: In function 'rwsem_mark_wake':
>> kernel/locking/rwsem.c:447:38: warning: variable 'donor' set but not used [-Wunused-but-set-variable]
     447 |         struct task_struct *_donor, *donor;
         |                                      ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


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
