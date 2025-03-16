Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED0910A1F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Mar 2025 03:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742096845; cv=none; b=udfA05uExH5qloBPr6dzDQEXcY1lAGkL+vNVNeKIWa3H6iUwbecy9vjyrQhuqG12Mnm5hT4Jru/R1T/rX7fZQPCtoIlaby7tqwgNpDeFuT2C0dBJgLTJUHBxI5qWE9quRhQbOblonwGY+oxpSLtGZMu/jeplRaL1cRifMOd6SQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742096845; c=relaxed/simple;
	bh=l4JWSWHIKHHahI+O9y7zNC5kxxk3ors3XUDcpNVh9CA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tLJk6ysEJFmy9FdzCOqcmxFXV+pL80LcgfzNvSz2jlKldm8YWaN8pT4tKjPNWHe1m6WuAT4LV7r94/m7nZHAEPXdnLwVmVxxXRCU2JKExVoP8otOQey4JiPkh1vwU5WuaDV3rMhFxb0VVSYnfhbWF6MstvUmQJJPrcmkTGVTlCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnJh1B/S; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnJh1B/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742096841; x=1773632841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l4JWSWHIKHHahI+O9y7zNC5kxxk3ors3XUDcpNVh9CA=;
  b=NnJh1B/S57D2FIw82BIKir8T7E8GgB0QAvRbQ/CtSd0CuOPA7tRd3Pkd
   QLd+PsvybfdZhD8wrdyPLS8EEJhmbz5JgkBiQ+jkPYDs92tQxHiNMjh5J
   W6lUM54UdtFb8pk8wguNkfw8Uywa71X10Z+xA9sBDBIAviNuWK7vW8blK
   JGSx/Ds9kb9ix8EN0tFWcgryCPmUZkmiEFmeYdemJP4THrSo4kS1MN9Xv
   zE6JOPmwT6Ra2sxANT8mckTlq08pD5+noJdycAf370urrG6ESbFwEYqsZ
   UONde+7U4BF0KJPR67aCu8xxoCy7FdzhSoNh78GdLeiDke0KXxOB5tyg+
   w==;
X-CSE-ConnectionGUID: +uBaSmNZQZObeQhSqyPGuw==
X-CSE-MsgGUID: cWF7ntGSQw+9gfn6kgxAZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="68574505"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="68574505"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 20:47:20 -0700
X-CSE-ConnectionGUID: WfwKYn3YQw+xq+UT/1PmbA==
X-CSE-MsgGUID: NcAPcfppQECzlU057/VvzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="122568353"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 15 Mar 2025 20:47:18 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttey5-000BqB-0M;
	Sun, 16 Mar 2025 03:47:17 +0000
Date: Sun, 16 Mar 2025 11:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:res-lock-v4 17/25] kernel/bpf/rqspinlock.c:563:41:
 sparse: sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202503161104.ABrvygqI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kumar,

First bad commit (maybe != root cause):

tree:   https://github.com/kkdwivedi/linux res-lock-v4
head:   899336fd553b7b1c285936a76027e305a2f7e58f
commit: 78b8828eae603e326faa2784533ab560ff3979ce [17/25] rqspinlock: Add entry to Makefile, MAINTAINERS
config: i386-randconfig-061-20250316 (https://download.01.org/0day-ci/archive/20250316/202503161104.ABrvygqI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503161104.ABrvygqI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503161104.ABrvygqI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/rqspinlock.c:100:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:100:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:100:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:122:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:122:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:122:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:135:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:135:51: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:135:51: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:205:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:205:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:205:39: sparse:     got struct rqspinlock_held *
>> kernel/bpf/rqspinlock.c:563:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct qnode *qnodes @@     got struct qnode [noderef] __percpu * @@
   kernel/bpf/rqspinlock.c:563:41: sparse:     expected struct qnode *qnodes
   kernel/bpf/rqspinlock.c:563:41: sparse:     got struct qnode [noderef] __percpu *
   kernel/bpf/rqspinlock.c: note: in included file:
>> kernel/bpf/../locking/qspinlock.h:67:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct mcs_spinlock * @@
   kernel/bpf/../locking/qspinlock.h:67:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/../locking/qspinlock.h:67:16: sparse:     got struct mcs_spinlock *

vim +563 kernel/bpf/rqspinlock.c

05395402d2f50cc Kumar Kartikeya Dwivedi 2025-02-02  348  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  349  /**
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  350   * resilient_queued_spin_lock_slowpath - acquire the queued spinlock
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  351   * @lock: Pointer to queued spinlock structure
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  352   * @val: Current value of the queued spinlock 32-bit word
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  353   *
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  354   * Return:
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  355   * * 0		- Lock was acquired successfully.
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  356   * * -EDEADLK	- Lock acquisition failed because of AA/ABBA deadlock.
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  357   * * -ETIMEDOUT - Lock acquisition failed because of timeout.
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  358   *
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  359   * (queue tail, pending bit, lock value)
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  360   *
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  361   *              fast     :    slow                                  :    unlock
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  362   *                       :                                          :
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  363   * uncontended  (0,0,0) -:--> (0,0,1) ------------------------------:--> (*,*,0)
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  364   *                       :       | ^--------.------.             /  :
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  365   *                       :       v           \      \            |  :
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  366   * pending               :    (0,1,1) +--> (0,1,0)   \           |  :
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  367   *                       :       | ^--'              |           |  :
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  368   *                       :       v                   |           |  :
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  369   * uncontended           :    (n,x,y) +--> (n,0,0) --'           |  :
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  370   *   queue               :       | ^--'                          |  :
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  371   *                       :       v                               |  :
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  372   * contended             :    (*,x,y) +--> (*,0,0) ---> (*,0,1) -'  :
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  373   *   queue               :         ^--'                             :
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  374   */
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  375  int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  376  {
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  377  	struct mcs_spinlock *prev, *next, *node;
0c0eaba54e728cf Kumar Kartikeya Dwivedi 2024-08-15  378  	struct rqspinlock_timeout ts;
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  379  	int idx, ret = 0;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  380  	u32 old, tail;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  381  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  382  	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  383  
d34d481c08553a4 Kumar Kartikeya Dwivedi 2024-10-15  384  	if (resilient_virt_spin_lock_enabled())
d34d481c08553a4 Kumar Kartikeya Dwivedi 2024-10-15  385  		return resilient_virt_spin_lock(lock);
d34d481c08553a4 Kumar Kartikeya Dwivedi 2024-10-15  386  
0c0eaba54e728cf Kumar Kartikeya Dwivedi 2024-08-15  387  	RES_INIT_TIMEOUT(ts);
0c0eaba54e728cf Kumar Kartikeya Dwivedi 2024-08-15  388  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  389  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  390  	 * Wait for in-progress pending->locked hand-overs with a bounded
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  391  	 * number of spins so that we guarantee forward progress.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  392  	 *
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  393  	 * 0,1,0 -> 0,0,1
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  394  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  395  	if (val == _Q_PENDING_VAL) {
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  396  		int cnt = _Q_PENDING_LOOPS;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  397  		val = atomic_cond_read_relaxed(&lock->val,
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  398  					       (VAL != _Q_PENDING_VAL) || !cnt--);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  399  	}
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  400  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  401  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  402  	 * If we observe any contention; queue.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  403  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  404  	if (val & ~_Q_LOCKED_MASK)
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  405  		goto queue;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  406  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  407  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  408  	 * trylock || pending
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  409  	 *
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  410  	 * 0,0,* -> 0,1,* -> 0,0,1 pending, trylock
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  411  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  412  	val = queued_fetch_set_pending_acquire(lock);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  413  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  414  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  415  	 * If we observe contention, there is a concurrent locker.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  416  	 *
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  417  	 * Undo and queue; our setting of PENDING might have made the
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  418  	 * n,0,0 -> 0,0,0 transition fail and it will now be waiting
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  419  	 * on @next to become !NULL.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  420  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  421  	if (unlikely(val & ~_Q_LOCKED_MASK)) {
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  422  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  423  		/* Undo PENDING if we set it. */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  424  		if (!(val & _Q_PENDING_MASK))
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  425  			clear_pending(lock);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  426  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  427  		goto queue;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  428  	}
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  429  
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  430  	/*
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  431  	 * Grab an entry in the held locks array, to enable deadlock detection.
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  432  	 */
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  433  	grab_held_lock_entry(lock);
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  434  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  435  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  436  	 * We're pending, wait for the owner to go away.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  437  	 *
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  438  	 * 0,1,1 -> *,1,0
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  439  	 *
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  440  	 * this wait loop must be a load-acquire such that we match the
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  441  	 * store-release that clears the locked bit and create lock
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  442  	 * sequentiality; this is because not all
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  443  	 * clear_pending_set_locked() implementations imply full
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  444  	 * barriers.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  445  	 */
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  446  	if (val & _Q_LOCKED_MASK) {
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  447  		RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT);
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  448  		res_smp_cond_load_acquire(&lock->locked, !VAL || RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_MASK));
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  449  	}
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  450  
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  451  	if (ret) {
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  452  		/*
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  453  		 * We waited for the locked bit to go back to 0, as the pending
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  454  		 * waiter, but timed out. We need to clear the pending bit since
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  455  		 * we own it. Once a stuck owner has been recovered, the lock
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  456  		 * must be restored to a valid state, hence removing the pending
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  457  		 * bit is necessary.
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  458  		 *
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  459  		 * *,1,* -> *,0,*
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  460  		 */
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  461  		clear_pending(lock);
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  462  		lockevent_inc(rqspinlock_lock_timeout);
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  463  		goto err_release_entry;
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  464  	}
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  465  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  466  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  467  	 * take ownership and clear the pending bit.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  468  	 *
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  469  	 * 0,1,0 -> 0,0,1
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  470  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  471  	clear_pending_set_locked(lock);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  472  	lockevent_inc(lock_pending);
721dd7e308f9799 Kumar Kartikeya Dwivedi 2024-08-15  473  	return 0;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  474  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  475  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  476  	 * End of pending bit optimistic spinning and beginning of MCS
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  477  	 * queuing.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  478  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  479  queue:
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  480  	lockevent_inc(lock_slowpath);
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  481  	/*
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  482  	 * Grab deadlock detection entry for the queue path.
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  483  	 */
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  484  	grab_held_lock_entry(lock);
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  485  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  486  	node = this_cpu_ptr(&rqnodes[0].mcs);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  487  	idx = node->count++;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  488  	tail = encode_tail(smp_processor_id(), idx);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  489  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  490  	trace_contention_begin(lock, LCB_F_SPIN);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  491  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  492  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  493  	 * 4 nodes are allocated based on the assumption that there will
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  494  	 * not be nested NMIs taking spinlocks. That may not be true in
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  495  	 * some architectures even though the chance of needing more than
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  496  	 * 4 nodes will still be extremely unlikely. When that happens,
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  497  	 * we fall back to spinning on the lock directly without using
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  498  	 * any MCS node. This is not the most elegant solution, but is
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  499  	 * simple enough.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  500  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  501  	if (unlikely(idx >= _Q_MAX_NODES)) {
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  502  		lockevent_inc(lock_no_node);
92b13b279eb3ac5 Kumar Kartikeya Dwivedi 2024-08-15  503  		RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT);
92b13b279eb3ac5 Kumar Kartikeya Dwivedi 2024-08-15  504  		while (!queued_spin_trylock(lock)) {
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  505  			if (RES_CHECK_TIMEOUT(ts, ret, ~0u)) {
92b13b279eb3ac5 Kumar Kartikeya Dwivedi 2024-08-15  506  				lockevent_inc(rqspinlock_lock_timeout);
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  507  				goto err_release_node;
92b13b279eb3ac5 Kumar Kartikeya Dwivedi 2024-08-15  508  			}
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  509  			cpu_relax();
92b13b279eb3ac5 Kumar Kartikeya Dwivedi 2024-08-15  510  		}
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  511  		goto release;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  512  	}
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  513  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  514  	node = grab_mcs_node(node, idx);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  515  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  516  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  517  	 * Keep counts of non-zero index values:
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  518  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  519  	lockevent_cond_inc(lock_use_node2 + idx - 1, idx);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  520  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  521  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  522  	 * Ensure that we increment the head node->count before initialising
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  523  	 * the actual node. If the compiler is kind enough to reorder these
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  524  	 * stores, then an IRQ could overwrite our assignments.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  525  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  526  	barrier();
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  527  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  528  	node->locked = 0;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  529  	node->next = NULL;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  530  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  531  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  532  	 * We touched a (possibly) cold cacheline in the per-cpu queue node;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  533  	 * attempt the trylock once more in the hope someone let go while we
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  534  	 * weren't watching.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  535  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  536  	if (queued_spin_trylock(lock))
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  537  		goto release;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  538  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  539  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  540  	 * Ensure that the initialisation of @node is complete before we
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  541  	 * publish the updated tail via xchg_tail() and potentially link
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  542  	 * @node into the waitqueue via WRITE_ONCE(prev->next, node) below.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  543  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  544  	smp_wmb();
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  545  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  546  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  547  	 * Publish the updated tail.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  548  	 * We have already touched the queueing cacheline; don't bother with
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  549  	 * pending stuff.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  550  	 *
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  551  	 * p,*,* -> n,*,*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  552  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  553  	old = xchg_tail(lock, tail);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  554  	next = NULL;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  555  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  556  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  557  	 * if there was a previous node; link it and wait until reaching the
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  558  	 * head of the waitqueue.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  559  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  560  	if (old & _Q_TAIL_MASK) {
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  561  		int val;
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  562  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15 @563  		prev = decode_tail(old, rqnodes);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  564  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  565  		/* Link @node into the waitqueue. */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  566  		WRITE_ONCE(prev->next, node);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  567  
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  568  		val = arch_mcs_spin_lock_contended(&node->locked);
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  569  		if (val == RES_TIMEOUT_VAL) {
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  570  			ret = -EDEADLK;
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  571  			goto waitq_timeout;
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  572  		}
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  573  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  574  		/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  575  		 * While waiting for the MCS lock, the next pointer may have
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  576  		 * been set by another lock waiter. We optimistically load
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  577  		 * the next pointer & prefetch the cacheline for writing
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  578  		 * to reduce latency in the upcoming MCS unlock operation.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  579  		 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  580  		next = READ_ONCE(node->next);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  581  		if (next)
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  582  			prefetchw(next);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  583  	}
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  584  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  585  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  586  	 * we're at the head of the waitqueue, wait for the owner & pending to
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  587  	 * go away.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  588  	 *
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  589  	 * *,x,y -> *,0,0
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  590  	 *
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  591  	 * this wait loop must use a load-acquire such that we match the
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  592  	 * store-release that clears the locked bit and create lock
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  593  	 * sequentiality; this is because the set_locked() function below
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  594  	 * does not imply a full barrier.
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  595  	 *
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  596  	 * We use RES_DEF_TIMEOUT * 2 as the duration, as RES_DEF_TIMEOUT is
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  597  	 * meant to span maximum allowed time per critical section, and we may
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  598  	 * have both the owner of the lock and the pending bit waiter ahead of
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  599  	 * us.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  600  	 */
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  601  	RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT * 2);
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  602  	val = res_atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK) ||
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  603  					   RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_PENDING_MASK));
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  604  
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  605  waitq_timeout:
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  606  	if (ret) {
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  607  		/*
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  608  		 * If the tail is still pointing to us, then we are the final waiter,
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  609  		 * and are responsible for resetting the tail back to 0. Otherwise, if
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  610  		 * the cmpxchg operation fails, we signal the next waiter to take exit
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  611  		 * and try the same. For a waiter with tail node 'n':
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  612  		 *
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  613  		 * n,*,* -> 0,*,*
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  614  		 *
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  615  		 * When performing cmpxchg for the whole word (NR_CPUS > 16k), it is
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  616  		 * possible locked/pending bits keep changing and we see failures even
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  617  		 * when we remain the head of wait queue. However, eventually,
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  618  		 * pending bit owner will unset the pending bit, and new waiters
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  619  		 * will queue behind us. This will leave the lock owner in
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  620  		 * charge, and it will eventually either set locked bit to 0, or
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  621  		 * leave it as 1, allowing us to make progress.
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  622  		 *
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  623  		 * We terminate the whole wait queue for two reasons. Firstly,
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  624  		 * we eschew per-waiter timeouts with one applied at the head of
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  625  		 * the wait queue.  This allows everyone to break out faster
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  626  		 * once we've seen the owner / pending waiter not responding for
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  627  		 * the timeout duration from the head.  Secondly, it avoids
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  628  		 * complicated synchronization, because when not leaving in FIFO
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  629  		 * order, prev's next pointer needs to be fixed up etc.
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  630  		 */
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  631  		if (!try_cmpxchg_tail(lock, tail, 0)) {
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  632  			next = smp_cond_load_relaxed(&node->next, VAL);
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  633  			WRITE_ONCE(next->locked, RES_TIMEOUT_VAL);
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  634  		}
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  635  		lockevent_inc(rqspinlock_lock_timeout);
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  636  		goto err_release_node;
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  637  	}
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  638  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  639  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  640  	 * claim the lock:
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  641  	 *
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  642  	 * n,0,0 -> 0,0,1 : lock, uncontended
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  643  	 * *,*,0 -> *,*,1 : lock, contended
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  644  	 *
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  645  	 * If the queue head is the only one in the queue (lock value == tail)
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  646  	 * and nobody is pending, clear the tail code and grab the lock.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  647  	 * Otherwise, we only need to grab the lock.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  648  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  649  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  650  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  651  	 * Note: at this point: (val & _Q_PENDING_MASK) == 0, because of the
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  652  	 *       above wait condition, therefore any concurrent setting of
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  653  	 *       PENDING will make the uncontended transition fail.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  654  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  655  	if ((val & _Q_TAIL_MASK) == tail) {
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  656  		if (atomic_try_cmpxchg_relaxed(&lock->val, &val, _Q_LOCKED_VAL))
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  657  			goto release; /* No contention */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  658  	}
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  659  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  660  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  661  	 * Either somebody is queued behind us or _Q_PENDING_VAL got set
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  662  	 * which will then detect the remaining tail and queue behind us
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  663  	 * ensuring we'll see a @next.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  664  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  665  	set_locked(lock);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  666  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  667  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  668  	 * contended path; wait for next if not observed yet, release.
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  669  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  670  	if (!next)
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  671  		next = smp_cond_load_relaxed(&node->next, (VAL));
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  672  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  673  	arch_mcs_spin_unlock_contended(&next->locked);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  674  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  675  release:
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  676  	trace_contention_end(lock, 0);
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  677  
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  678  	/*
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  679  	 * release the node
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  680  	 */
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  681  	__this_cpu_dec(rqnodes[0].mcs.count);
6f7db2e260da7c2 Kumar Kartikeya Dwivedi 2024-08-15  682  	return ret;
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  683  err_release_node:
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  684  	trace_contention_end(lock, ret);
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  685  	__this_cpu_dec(rqnodes[0].mcs.count);
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  686  err_release_entry:
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  687  	release_held_lock_entry();
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  688  	return ret;
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  689  }
a2ec988124aa1cf Kumar Kartikeya Dwivedi 2024-08-15  690  EXPORT_SYMBOL_GPL(resilient_queued_spin_lock_slowpath);
954d874602ce04c Kumar Kartikeya Dwivedi 2025-02-04  691  

:::::: The code at line 563 was first introduced by commit
:::::: a2ec988124aa1cf9394b8f292e2efa20ccd570ad locking: Copy out qspinlock.c to kernel/bpf/rqspinlock.c

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Kumar Kartikeya Dwivedi <memxor@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
