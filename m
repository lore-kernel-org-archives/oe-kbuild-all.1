Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A905B22D7B0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762159573; cv=none; b=BqPdXb/joyKwNsxLLpWa1kEJhlvBrCea74jmS2bcpjRRcxl0DT44DVn2auPkGYFH0fb4hiR4vLLmC2Z2uGhhmmhz6n61CBrHLKRc0HW7wq0a28XCYYlv3CGUHGFHMErrLBOJn8WiAeO6IkOpP3KeEmb/JH8p84/9w7rRZ/cpT4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762159573; c=relaxed/simple;
	bh=9y2sgCz7hRRYZw6FWyo2qFQTkkcr93Db065W4f9Q8yU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvGsUM22CyPzKUWNSHEqmD0Be4laN6QqW5ZrQl46OTFos6QFec7VQMrYqewYn9g0l2lGHaj2AaN9n0rRL3iyZ2D9ml+/l1KxFoczyfjRtV7nGtkhMxjEfWVjmCqQrs9n9ABJ71R5c+WsEq/Olf4NcIda+xV1t0RCIja4np3pwdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M0qW23wx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0qW23wx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762159568; x=1793695568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9y2sgCz7hRRYZw6FWyo2qFQTkkcr93Db065W4f9Q8yU=;
  b=M0qW23wxENf7g+gl+aY+xsfLNtWbQrhiwLa+h1ji48SWtYvBC0Rdh7xS
   ehsygb6deVfU8KMCtCuHlNmJx1JgMFdpnGAu7fxP2T1uN4tgkTqibtCna
   iB8Th3mN72toHrxEh3NHcL0EDPl8e2sxwF/EmUKuufBfh4gNF2dTyLDLb
   //FnDqPEHeQBHc3wPGsWtNHQkqWKlMh8l3xKtBmdUuVF71GrvbCKDtQRV
   WJ66ButPfJEE6XEz8uDthYsEq8PLVCoDsdUDZ4/O/EFQh2aC7sA6E8Jol
   USnBxJQWgKLpfzlqd4cIspjBLdK4Yx9+HzYilxzLuoW9bayusGqBL4zOE
   g==;
X-CSE-ConnectionGUID: VADfUXXQRWyvlJ8S/P7UPw==
X-CSE-MsgGUID: O1lDb4+cTKO57WMuWyeRAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="66843147"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="66843147"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:45:54 -0800
X-CSE-ConnectionGUID: Kyq6ij/+Tbqgwm9KfNybMg==
X-CSE-MsgGUID: HkgAi4YqSGKN2xlvIVYzvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="217634954"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2025 00:45:53 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vFqCF-000000001eK-226W;
	Mon, 03 Nov 2025 08:45:51 +0000
Date: Mon, 3 Nov 2025 09:45:38 +0100
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:locking 5/5] kernel/locking/rwsem.c:1007:24: error: expected
 ')' before 'goto'
Message-ID: <202511030918.80zFXnNf-lkp@intel.com>
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251103/202511030918.80zFXnNf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030918.80zFXnNf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030918.80zFXnNf-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/rwsem.c: In function 'rwsem_down_read_slowpath':
>> kernel/locking/rwsem.c:1007:24: error: expected ')' before 'goto'
    1007 |             (rcnt > 1))
         |                        ^
         |                        )
    1008 |                 goto queue;
         |                 ~~~~    
   kernel/locking/rwsem.c:1005:12: note: to match this '('
    1005 |         if ((count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF)) ||
         |            ^
>> kernel/locking/rwsem.c:1102:1: error: expected expression before '}' token
    1102 | }
         | ^
   kernel/locking/rwsem.c:997:29: warning: unused variable 'waiter' [-Wunused-variable]
     997 |         struct rwsem_waiter waiter;
         |                             ^~~~~~
   kernel/locking/rwsem.c:995:14: warning: unused variable 'adjustment' [-Wunused-variable]
     995 |         long adjustment = -RWSEM_READER_BIAS;
         |              ^~~~~~~~~~
   kernel/locking/rwsem.c:1102:1: warning: no return statement in function returning non-void [-Wreturn-type]
    1102 | }
         | ^


vim +1007 kernel/locking/rwsem.c

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
  1005		if ((count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF)) ||
  1006		    ((atomic_long_read(&sem->owner) & RWSEM_READER_OWNED) &&
> 1007		    (rcnt > 1))
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
> 1102	}
  1103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
