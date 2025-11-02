Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A953EA8D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762102453; cv=none; b=s46qs2gWmHZInXLMeP3HtJiutP2OuV/3szyLPqJD+jgZrBcUpW9s9d4JYjQ2RRhrNMM78Erhc7YwEFzk7oKO6XZZDZOqDxP1ctxW0nEPd1Nhub61fT5xc/rfXVJ6eUcoBuJV1d0Du5Fn37LVAdFQ/Sl86vwo8+71xOVRHy3jbXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762102453; c=relaxed/simple;
	bh=g504lM72f+kAgPZ2OQTIKb7YrY7GIlMQqAp8D0l2tzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ak/aKi+t1WlILmJZDWJKG77Tksy+ZQvOSacYe+I3qJms53IrEHwcgoVjLkEYG/carBaORpnGrx0hOdyjHepxwYqUvxSK/FhIomIh0ljYCzhSCLPWP2OKG+06nM0gdGIh0zLsDOd5cPwDg05yCwgyH7xSoUrHmNAwBP2z8R32MCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVW+MErC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVW+MErC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762102451; x=1793638451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g504lM72f+kAgPZ2OQTIKb7YrY7GIlMQqAp8D0l2tzw=;
  b=CVW+MErC5umJlrzTLOEU9jcgEwsPMTKj4wLAWgXbbIKhWh6H12jnOXZ0
   WqSCvMnmJQd2bVqu7lH8jqMwNTejZZKBG/gaa21+2BW6U7VvC8zrf1TTF
   mDWrLXemw5TPMlSYC1tU08Bm+jZL9+ijSTcXiXFmyIITzO0TIpsHNL/H+
   IicwjA688UE0Ne2LI/j1pO2UVN5vI8V07LE6PJ9npNxn83aNQHTl1ocK+
   NAq/8wH4BZJZuqPI0m7WbjsTqtgGYM/vwxGRqV+c0MAy/az+VaMxOP5cx
   7QSrgERcBx9VWcBGRFZ5hncaWvXlGjkpUAIzrneyLaEtoiW1a3LK4D0Ha
   A==;
X-CSE-ConnectionGUID: N37h/9WsRN+jDPDoGvOQ+Q==
X-CSE-MsgGUID: 4Xjuu8pMSXS8mOD30OBdtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="51763232"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="51763232"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 08:54:10 -0800
X-CSE-ConnectionGUID: VGUqDERkRRebSlMX/dQ4qg==
X-CSE-MsgGUID: u24nlk8ISNqq1cOQPjQjfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="186556148"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Nov 2025 08:54:09 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFbKc-000PQW-0f;
	Sun, 02 Nov 2025 16:53:47 +0000
Date: Mon, 3 Nov 2025 00:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:locking 5/5] kernel/locking/rwsem.c:1005:2: warning: this 'if'
 clause does not guard...
Message-ID: <202511030000.lUj83bmV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git locking
head:   cbce0966b2c1f7cc06b410bac3d96ae003a7bc8a
commit: cbce0966b2c1f7cc06b410bac3d96ae003a7bc8a [5/5] rwsem: clean up code
config: powerpc-randconfig-001-20251102 (https://download.01.org/0day-ci/archive/20251103/202511030000.lUj83bmV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030000.lUj83bmV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030000.lUj83bmV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/locking/rwsem.c: In function 'rwsem_down_read_slowpath':
   kernel/locking/rwsem.c:1730: error: unterminated argument list invoking macro "if"
    1730 | #endif
         | 
   kernel/locking/rwsem.c:1730: error: expected '(' at end of input
    1730 | #endif
         | 
         |(
>> kernel/locking/rwsem.c:1005:2: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    1005 |  if ((count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF)) ||
         |  ^~
   kernel/locking/rwsem.c:1730: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    1730 | #endif
         | 
   kernel/locking/rwsem.c:1005:2: error: expected declaration or statement at end of input
    1005 |  if ((count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF)) ||
         |  ^~
   kernel/locking/rwsem.c:997:22: warning: unused variable 'waiter' [-Wunused-variable]
     997 |  struct rwsem_waiter waiter;
         |                      ^~~~~~
   kernel/locking/rwsem.c:996:7: warning: unused variable 'rcnt' [-Wunused-variable]
     996 |  long rcnt = (count >> RWSEM_READER_SHIFT);
         |       ^~~~
   kernel/locking/rwsem.c:995:7: warning: unused variable 'adjustment' [-Wunused-variable]
     995 |  long adjustment = -RWSEM_READER_BIAS;
         |       ^~~~~~~~~~
   kernel/locking/rwsem.c:1005:2: warning: no return statement in function returning non-void [-Wreturn-type]
    1005 |  if ((count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF)) ||
         |  ^~
   At top level:
   kernel/locking/rwsem.c:993:1: warning: 'rwsem_down_read_slowpath' defined but not used [-Wunused-function]
     993 | rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int state)
         | ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/if +1005 kernel/locking/rwsem.c

   988	
   989	/*
   990	 * Wait for the read lock to be granted
   991	 */
   992	static struct rw_semaphore __sched *
   993	rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int state)
   994	{
   995		long adjustment = -RWSEM_READER_BIAS;
   996		long rcnt = (count >> RWSEM_READER_SHIFT);
   997		struct rwsem_waiter waiter;
   998		DEFINE_WAKE_Q(wake_q);
   999	
  1000		/*
  1001		 * To prevent a constant stream of readers from starving a sleeping
  1002		 * writer, don't attempt optimistic lock stealing if the lock is
  1003		 * very likely owned by readers.
  1004		 */
> 1005		if ((count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF)) ||
  1006		    ((atomic_long_read(&sem->owner) & RWSEM_READER_OWNED) &&
  1007		    (rcnt > 1))
  1008			goto queue;
  1009	
  1010		/*
  1011		 * Reader optimistic lock stealing.
  1012		 */
  1013		rwsem_set_reader_owned(sem);
  1014		lockevent_inc(rwsem_rlock_steal);
  1015	
  1016		/*
  1017		 * Wake up other readers in the wait queue if it is the first reader.
  1018		 */
  1019		if ((rcnt == 1) && (count & RWSEM_FLAG_WAITERS)) {
  1020			raw_spin_lock_irq(&sem->wait_lock);
  1021			if (!list_empty(&sem->wait_list))
  1022				rwsem_mark_wake(sem, RWSEM_WAKE_READ_OWNED, &wake_q);
  1023			raw_spin_unlock_irq(&sem->wait_lock);
  1024			wake_up_q(&wake_q);
  1025		}
  1026		return sem;
  1027	
  1028	queue:
  1029		waiter.task = current;
  1030		waiter.type = RWSEM_WAITING_FOR_READ;
  1031		waiter.timeout = jiffies + RWSEM_WAIT_TIMEOUT;
  1032		waiter.handoff_set = false;
  1033	
  1034		raw_spin_lock_irq(&sem->wait_lock);
  1035		if (list_empty(&sem->wait_list)) {
  1036			/*
  1037			 * In case the wait queue is empty and the lock isn't owned
  1038			 * by a writer, this reader can exit the slowpath and return
  1039			 * immediately as its RWSEM_READER_BIAS has already been set
  1040			 * in the count.
  1041			 */
  1042			if (!(atomic_long_read(&sem->count) & RWSEM_WRITER_MASK)) {
  1043				/* Provide lock ACQUIRE */
  1044				smp_acquire__after_ctrl_dep();
  1045				raw_spin_unlock_irq(&sem->wait_lock);
  1046				rwsem_set_reader_owned(sem);
  1047				lockevent_inc(rwsem_rlock_fast);
  1048				return sem;
  1049			}
  1050			adjustment += RWSEM_FLAG_WAITERS;
  1051		}
  1052		rwsem_add_waiter(sem, &waiter);
  1053	
  1054		/* we're now waiting on the lock, but no longer actively locking */
  1055		count = atomic_long_add_return(adjustment, &sem->count);
  1056	
  1057		rwsem_cond_wake_waiter(sem, count, &wake_q);
  1058		raw_spin_unlock_irq(&sem->wait_lock);
  1059	
  1060		if (!wake_q_empty(&wake_q))
  1061			wake_up_q(&wake_q);
  1062	
  1063		trace_contention_begin(sem, LCB_F_READ);
  1064		set_current_state(state);
  1065	
  1066		if (state == TASK_UNINTERRUPTIBLE)
  1067			hung_task_set_blocker(sem, BLOCKER_TYPE_RWSEM_READER);
  1068	
  1069		/* wait to be given the lock */
  1070		for (;;) {
  1071			if (!smp_load_acquire(&waiter.task)) {
  1072				/* Matches rwsem_mark_wake()'s smp_store_release(). */
  1073				break;
  1074			}
  1075			if (signal_pending_state(state, current)) {
  1076				raw_spin_lock_irq(&sem->wait_lock);
  1077				if (waiter.task)
  1078					goto out_nolock;
  1079				raw_spin_unlock_irq(&sem->wait_lock);
  1080				/* Ordered by sem->wait_lock against rwsem_mark_wake(). */
  1081				break;
  1082			}
  1083			schedule_preempt_disabled();
  1084			lockevent_inc(rwsem_sleep_reader);
  1085			set_current_state(state);
  1086		}
  1087	
  1088		if (state == TASK_UNINTERRUPTIBLE)
  1089			hung_task_clear_blocker();
  1090	
  1091		__set_current_state(TASK_RUNNING);
  1092		lockevent_inc(rwsem_rlock);
  1093		trace_contention_end(sem, 0);
  1094		return sem;
  1095	
  1096	out_nolock:
  1097		rwsem_del_wake_waiter(sem, &waiter, &wake_q);
  1098		__set_current_state(TASK_RUNNING);
  1099		lockevent_inc(rwsem_rlock_fail);
  1100		trace_contention_end(sem, -EINTR);
  1101		return ERR_PTR(-EINTR);
  1102	}
  1103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
