Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E5CC141
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762087866; cv=none; b=tVl8bajwjW+y1ZfXRnhcJDvKIL6YLDeeY7DjKxzFDx3mDD2ZGVLUmJzISGtaR6rt5YIt5w8QCzxDQPzmcj9uYHqeZoSYSdnhux2qbFFBkbzZQo2suOcNLpDStQZtu5VlZ2MyQilqMo5UP6Pmx6DVtsZ4l89R1viaefTZeyItxZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762087866; c=relaxed/simple;
	bh=G8maNkYODLBSmJhSe6YPcuLvTZRBeFDMqBe3GFMm0AU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AWmCnI1e+CSb1aXAgWoaf/8HWm6QkSy3TqGsAtp4UnOJvGbq2sX5B14u8V/HyTGoefkWsd0+7g3zuWp0kPxpmIYXvsUVIb3xdzE46AL7nMqSnmPf13slf7rkTpk7bJtoUpYdLz4SxLb5LZd0Sb3xahpmvMZ9xgBgqgL1mjwqi/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkZbwgJj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkZbwgJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762087862; x=1793623862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G8maNkYODLBSmJhSe6YPcuLvTZRBeFDMqBe3GFMm0AU=;
  b=JkZbwgJj89mWuodOdxiQutlWKVqQgTC9mr1FertQpMFca1l8DfZC/oiE
   9uevFUhq61iDh+6NWG4CXbB9olXEuXe0icFAsN2YQqvKJB7YUgqr4Knam
   dymQLcSsG+t1rdBMrMD/ZS6rIb2ZreR3n2kYSmCTxAfUBcOhMy8S3LImU
   p7Ep+Jlxwb3W3WE70DnTdTjqQSZLIWIr2LjfC/TxWVUzqC0DQgn87l8wa
   3qKvZNgnEcTA6r2TswEZ184DUEHGDj5eXueu4w/zPLN04Whb5xU+aMPcb
   +Ke50zCub+wh07+iTarKOHSbzztdqtPra3rGvWd2kuIT/sFD+RyFzP8hM
   g==;
X-CSE-ConnectionGUID: K0LSPMhdS4eRreLhFmh9Mg==
X-CSE-MsgGUID: AsIj3XDGShiVF8jAdXdfug==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="75297843"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="75297843"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 04:51:01 -0800
X-CSE-ConnectionGUID: sUxHnSe/R5aNW4asUNwIHg==
X-CSE-MsgGUID: oX7RXrB4Q0KLJHlE2dNg3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="190982361"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Nov 2025 04:51:01 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFXXu-000PE8-10;
	Sun, 02 Nov 2025 12:50:58 +0000
Date: Sun, 2 Nov 2025 20:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:locking 5/5] kernel/locking/rwsem.c:996:14: warning: unused
 variable 'rcnt'
Message-ID: <202511022002.cMc3M0Kh-lkp@intel.com>
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
config: loongarch-randconfig-001-20251102 (https://download.01.org/0day-ci/archive/20251102/202511022002.cMc3M0Kh-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511022002.cMc3M0Kh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511022002.cMc3M0Kh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/locking/rwsem.c: In function 'rwsem_down_read_slowpath':
   kernel/locking/rwsem.c:1730: error: unterminated argument list invoking macro 'if'
    1730 | #endif
   kernel/locking/rwsem.c:1731: error: expected '(' at end of input
   kernel/locking/rwsem.c:1005:9: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
    1005 |         if ((count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF)) ||
         |         ^~
   kernel/locking/rwsem.c:1005:9: error: expected declaration or statement at end of input
   kernel/locking/rwsem.c:997:29: warning: unused variable 'waiter' [-Wunused-variable]
     997 |         struct rwsem_waiter waiter;
         |                             ^~~~~~
>> kernel/locking/rwsem.c:996:14: warning: unused variable 'rcnt' [-Wunused-variable]
     996 |         long rcnt = (count >> RWSEM_READER_SHIFT);
         |              ^~~~
   kernel/locking/rwsem.c:995:14: warning: unused variable 'adjustment' [-Wunused-variable]
     995 |         long adjustment = -RWSEM_READER_BIAS;
         |              ^~~~~~~~~~
   kernel/locking/rwsem.c:1005:9: warning: no return statement in function returning non-void [-Wreturn-type]
    1005 |         if ((count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF)) ||
         |         ^~
   kernel/locking/rwsem.c: At top level:
>> kernel/locking/rwsem.c:993:1: warning: 'rwsem_down_read_slowpath' defined but not used [-Wunused-function]
     993 | rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int state)
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/locking/rwsem.c:816:13: warning: 'rwsem_optimistic_spin' defined but not used [-Wunused-function]
     816 | static bool rwsem_optimistic_spin(struct rw_semaphore *sem)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/rcnt +996 kernel/locking/rwsem.c

7d43f1ce9dd075 Waiman Long    2019-05-20   815  
617f3ef9517784 Waiman Long    2020-11-20  @816  static bool rwsem_optimistic_spin(struct rw_semaphore *sem)
5dec94d4923683 Waiman Long    2019-05-20   817  {
5dec94d4923683 Waiman Long    2019-05-20   818  	bool taken = false;
990fa7384a3057 Waiman Long    2019-05-20   819  	int prev_owner_state = OWNER_NULL;
7d43f1ce9dd075 Waiman Long    2019-05-20   820  	int loop = 0;
7d43f1ce9dd075 Waiman Long    2019-05-20   821  	u64 rspin_threshold = 0;
5dec94d4923683 Waiman Long    2019-05-20   822  
5dec94d4923683 Waiman Long    2019-05-20   823  	/* sem->wait_lock should not be held when doing optimistic spinning */
5dec94d4923683 Waiman Long    2019-05-20   824  	if (!osq_lock(&sem->osq))
5dec94d4923683 Waiman Long    2019-05-20   825  		goto done;
5dec94d4923683 Waiman Long    2019-05-20   826  
5dec94d4923683 Waiman Long    2019-05-20   827  	/*
5dec94d4923683 Waiman Long    2019-05-20   828  	 * Optimistically spin on the owner field and attempt to acquire the
5dec94d4923683 Waiman Long    2019-05-20   829  	 * lock whenever the owner changes. Spinning will be stopped when:
5dec94d4923683 Waiman Long    2019-05-20   830  	 *  1) the owning writer isn't running; or
7d43f1ce9dd075 Waiman Long    2019-05-20   831  	 *  2) readers own the lock and spinning time has exceeded limit.
5dec94d4923683 Waiman Long    2019-05-20   832  	 */
990fa7384a3057 Waiman Long    2019-05-20   833  	for (;;) {
7d43f1ce9dd075 Waiman Long    2019-05-20   834  		enum owner_state owner_state;
990fa7384a3057 Waiman Long    2019-05-20   835  
617f3ef9517784 Waiman Long    2020-11-20   836  		owner_state = rwsem_spin_on_owner(sem);
f84a15b90d96f3 Jinliang Zheng 2025-06-10   837  		if (owner_state == OWNER_NONSPINNABLE)
990fa7384a3057 Waiman Long    2019-05-20   838  			break;
990fa7384a3057 Waiman Long    2019-05-20   839  
5dec94d4923683 Waiman Long    2019-05-20   840  		/*
5dec94d4923683 Waiman Long    2019-05-20   841  		 * Try to acquire the lock
5dec94d4923683 Waiman Long    2019-05-20   842  		 */
617f3ef9517784 Waiman Long    2020-11-20   843  		taken = rwsem_try_write_lock_unqueued(sem);
cf69482d62d996 Waiman Long    2019-05-20   844  
cf69482d62d996 Waiman Long    2019-05-20   845  		if (taken)
5dec94d4923683 Waiman Long    2019-05-20   846  			break;
5dec94d4923683 Waiman Long    2019-05-20   847  
7d43f1ce9dd075 Waiman Long    2019-05-20   848  		/*
7d43f1ce9dd075 Waiman Long    2019-05-20   849  		 * Time-based reader-owned rwsem optimistic spinning
7d43f1ce9dd075 Waiman Long    2019-05-20   850  		 */
617f3ef9517784 Waiman Long    2020-11-20   851  		if (owner_state == OWNER_READER) {
7d43f1ce9dd075 Waiman Long    2019-05-20   852  			/*
7d43f1ce9dd075 Waiman Long    2019-05-20   853  			 * Re-initialize rspin_threshold every time when
7d43f1ce9dd075 Waiman Long    2019-05-20   854  			 * the owner state changes from non-reader to reader.
7d43f1ce9dd075 Waiman Long    2019-05-20   855  			 * This allows a writer to steal the lock in between
7d43f1ce9dd075 Waiman Long    2019-05-20   856  			 * 2 reader phases and have the threshold reset at
7d43f1ce9dd075 Waiman Long    2019-05-20   857  			 * the beginning of the 2nd reader phase.
7d43f1ce9dd075 Waiman Long    2019-05-20   858  			 */
7d43f1ce9dd075 Waiman Long    2019-05-20   859  			if (prev_owner_state != OWNER_READER) {
617f3ef9517784 Waiman Long    2020-11-20   860  				if (rwsem_test_oflags(sem, RWSEM_NONSPINNABLE))
7d43f1ce9dd075 Waiman Long    2019-05-20   861  					break;
7d43f1ce9dd075 Waiman Long    2019-05-20   862  				rspin_threshold = rwsem_rspin_threshold(sem);
7d43f1ce9dd075 Waiman Long    2019-05-20   863  				loop = 0;
7d43f1ce9dd075 Waiman Long    2019-05-20   864  			}
7d43f1ce9dd075 Waiman Long    2019-05-20   865  
7d43f1ce9dd075 Waiman Long    2019-05-20   866  			/*
7d43f1ce9dd075 Waiman Long    2019-05-20   867  			 * Check time threshold once every 16 iterations to
7d43f1ce9dd075 Waiman Long    2019-05-20   868  			 * avoid calling sched_clock() too frequently so
7d43f1ce9dd075 Waiman Long    2019-05-20   869  			 * as to reduce the average latency between the times
7d43f1ce9dd075 Waiman Long    2019-05-20   870  			 * when the lock becomes free and when the spinner
7d43f1ce9dd075 Waiman Long    2019-05-20   871  			 * is ready to do a trylock.
7d43f1ce9dd075 Waiman Long    2019-05-20   872  			 */
7d43f1ce9dd075 Waiman Long    2019-05-20   873  			else if (!(++loop & 0xf) && (sched_clock() > rspin_threshold)) {
7d43f1ce9dd075 Waiman Long    2019-05-20   874  				rwsem_set_nonspinnable(sem);
7d43f1ce9dd075 Waiman Long    2019-05-20   875  				lockevent_inc(rwsem_opt_nospin);
7d43f1ce9dd075 Waiman Long    2019-05-20   876  				break;
7d43f1ce9dd075 Waiman Long    2019-05-20   877  			}
7d43f1ce9dd075 Waiman Long    2019-05-20   878  		}
7d43f1ce9dd075 Waiman Long    2019-05-20   879  
5dec94d4923683 Waiman Long    2019-05-20   880  		/*
990fa7384a3057 Waiman Long    2019-05-20   881  		 * An RT task cannot do optimistic spinning if it cannot
990fa7384a3057 Waiman Long    2019-05-20   882  		 * be sure the lock holder is running or live-lock may
990fa7384a3057 Waiman Long    2019-05-20   883  		 * happen if the current task and the lock holder happen
990fa7384a3057 Waiman Long    2019-05-20   884  		 * to run in the same CPU. However, aborting optimistic
990fa7384a3057 Waiman Long    2019-05-20   885  		 * spinning while a NULL owner is detected may miss some
990fa7384a3057 Waiman Long    2019-05-20   886  		 * opportunity where spinning can continue without causing
990fa7384a3057 Waiman Long    2019-05-20   887  		 * problem.
990fa7384a3057 Waiman Long    2019-05-20   888  		 *
990fa7384a3057 Waiman Long    2019-05-20   889  		 * There are 2 possible cases where an RT task may be able
990fa7384a3057 Waiman Long    2019-05-20   890  		 * to continue spinning.
990fa7384a3057 Waiman Long    2019-05-20   891  		 *
990fa7384a3057 Waiman Long    2019-05-20   892  		 * 1) The lock owner is in the process of releasing the
990fa7384a3057 Waiman Long    2019-05-20   893  		 *    lock, sem->owner is cleared but the lock has not
990fa7384a3057 Waiman Long    2019-05-20   894  		 *    been released yet.
990fa7384a3057 Waiman Long    2019-05-20   895  		 * 2) The lock was free and owner cleared, but another
990fa7384a3057 Waiman Long    2019-05-20   896  		 *    task just comes in and acquire the lock before
990fa7384a3057 Waiman Long    2019-05-20   897  		 *    we try to get it. The new owner may be a spinnable
990fa7384a3057 Waiman Long    2019-05-20   898  		 *    writer.
990fa7384a3057 Waiman Long    2019-05-20   899  		 *
e2db7592be8e83 Ingo Molnar    2021-03-22   900  		 * To take advantage of two scenarios listed above, the RT
990fa7384a3057 Waiman Long    2019-05-20   901  		 * task is made to retry one more time to see if it can
990fa7384a3057 Waiman Long    2019-05-20   902  		 * acquire the lock or continue spinning on the new owning
990fa7384a3057 Waiman Long    2019-05-20   903  		 * writer. Of course, if the time lag is long enough or the
990fa7384a3057 Waiman Long    2019-05-20   904  		 * new owner is not a writer or spinnable, the RT task will
990fa7384a3057 Waiman Long    2019-05-20   905  		 * quit spinning.
990fa7384a3057 Waiman Long    2019-05-20   906  		 *
990fa7384a3057 Waiman Long    2019-05-20   907  		 * If the owner is a writer, the need_resched() check is
990fa7384a3057 Waiman Long    2019-05-20   908  		 * done inside rwsem_spin_on_owner(). If the owner is not
990fa7384a3057 Waiman Long    2019-05-20   909  		 * a writer, need_resched() check needs to be done here.
5dec94d4923683 Waiman Long    2019-05-20   910  		 */
990fa7384a3057 Waiman Long    2019-05-20   911  		if (owner_state != OWNER_WRITER) {
990fa7384a3057 Waiman Long    2019-05-20   912  			if (need_resched())
5dec94d4923683 Waiman Long    2019-05-20   913  				break;
ae04f69de0bef9 Qais Yousef    2024-06-10   914  			if (rt_or_dl_task(current) &&
990fa7384a3057 Waiman Long    2019-05-20   915  			   (prev_owner_state != OWNER_WRITER))
990fa7384a3057 Waiman Long    2019-05-20   916  				break;
990fa7384a3057 Waiman Long    2019-05-20   917  		}
990fa7384a3057 Waiman Long    2019-05-20   918  		prev_owner_state = owner_state;
5dec94d4923683 Waiman Long    2019-05-20   919  
5dec94d4923683 Waiman Long    2019-05-20   920  		/*
5dec94d4923683 Waiman Long    2019-05-20   921  		 * The cpu_relax() call is a compiler barrier which forces
5dec94d4923683 Waiman Long    2019-05-20   922  		 * everything in this loop to be re-loaded. We don't need
5dec94d4923683 Waiman Long    2019-05-20   923  		 * memory barriers as we'll eventually observe the right
5dec94d4923683 Waiman Long    2019-05-20   924  		 * values at the cost of a few extra spins.
5dec94d4923683 Waiman Long    2019-05-20   925  		 */
5dec94d4923683 Waiman Long    2019-05-20   926  		cpu_relax();
5dec94d4923683 Waiman Long    2019-05-20   927  	}
5dec94d4923683 Waiman Long    2019-05-20   928  	osq_unlock(&sem->osq);
5dec94d4923683 Waiman Long    2019-05-20   929  done:
5dec94d4923683 Waiman Long    2019-05-20   930  	lockevent_cond_inc(rwsem_opt_fail, !taken);
5dec94d4923683 Waiman Long    2019-05-20   931  	return taken;
5dec94d4923683 Waiman Long    2019-05-20   932  }
7d43f1ce9dd075 Waiman Long    2019-05-20   933  
7d43f1ce9dd075 Waiman Long    2019-05-20   934  /*
617f3ef9517784 Waiman Long    2020-11-20   935   * Clear the owner's RWSEM_NONSPINNABLE bit if it is set. This should
7d43f1ce9dd075 Waiman Long    2019-05-20   936   * only be called when the reader count reaches 0.
5cfd92e12e1343 Waiman Long    2019-05-20   937   */
617f3ef9517784 Waiman Long    2020-11-20   938  static inline void clear_nonspinnable(struct rw_semaphore *sem)
1a728dff855a31 Waiman Long    2020-11-20   939  {
54c1ee4d614d52 Waiman Long    2022-03-22   940  	if (unlikely(rwsem_test_oflags(sem, RWSEM_NONSPINNABLE)))
617f3ef9517784 Waiman Long    2020-11-20   941  		atomic_long_andnot(RWSEM_NONSPINNABLE, &sem->owner);
1a728dff855a31 Waiman Long    2020-11-20   942  }
1a728dff855a31 Waiman Long    2020-11-20   943  
5dec94d4923683 Waiman Long    2019-05-20   944  #else
617f3ef9517784 Waiman Long    2020-11-20   945  static inline bool rwsem_can_spin_on_owner(struct rw_semaphore *sem)
cf69482d62d996 Waiman Long    2019-05-20   946  {
cf69482d62d996 Waiman Long    2019-05-20   947  	return false;
cf69482d62d996 Waiman Long    2019-05-20   948  }
cf69482d62d996 Waiman Long    2019-05-20   949  
617f3ef9517784 Waiman Long    2020-11-20   950  static inline bool rwsem_optimistic_spin(struct rw_semaphore *sem)
5cfd92e12e1343 Waiman Long    2019-05-20   951  {
5cfd92e12e1343 Waiman Long    2019-05-20   952  	return false;
5cfd92e12e1343 Waiman Long    2019-05-20   953  }
91d2a812dfb98b Waiman Long    2019-06-25   954  
617f3ef9517784 Waiman Long    2020-11-20   955  static inline void clear_nonspinnable(struct rw_semaphore *sem) { }
1a728dff855a31 Waiman Long    2020-11-20   956  
7cdacc5f52d68a Yanfei Xu      2021-10-13   957  static inline enum owner_state
617f3ef9517784 Waiman Long    2020-11-20   958  rwsem_spin_on_owner(struct rw_semaphore *sem)
91d2a812dfb98b Waiman Long    2019-06-25   959  {
7cdacc5f52d68a Yanfei Xu      2021-10-13   960  	return OWNER_NONSPINNABLE;
91d2a812dfb98b Waiman Long    2019-06-25   961  }
5dec94d4923683 Waiman Long    2019-05-20   962  #endif
5dec94d4923683 Waiman Long    2019-05-20   963  
54c1ee4d614d52 Waiman Long    2022-03-22   964  /*
54c1ee4d614d52 Waiman Long    2022-03-22   965   * Prepare to wake up waiter(s) in the wait queue by putting them into the
54c1ee4d614d52 Waiman Long    2022-03-22   966   * given wake_q if the rwsem lock owner isn't a writer. If rwsem is likely
54c1ee4d614d52 Waiman Long    2022-03-22   967   * reader-owned, wake up read lock waiters in queue front or wake up any
54c1ee4d614d52 Waiman Long    2022-03-22   968   * front waiter otherwise.
54c1ee4d614d52 Waiman Long    2022-03-22   969  
54c1ee4d614d52 Waiman Long    2022-03-22   970   * This is being called from both reader and writer slow paths.
54c1ee4d614d52 Waiman Long    2022-03-22   971   */
54c1ee4d614d52 Waiman Long    2022-03-22   972  static inline void rwsem_cond_wake_waiter(struct rw_semaphore *sem, long count,
54c1ee4d614d52 Waiman Long    2022-03-22   973  					  struct wake_q_head *wake_q)
54c1ee4d614d52 Waiman Long    2022-03-22   974  {
54c1ee4d614d52 Waiman Long    2022-03-22   975  	enum rwsem_wake_type wake_type;
54c1ee4d614d52 Waiman Long    2022-03-22   976  
54c1ee4d614d52 Waiman Long    2022-03-22   977  	if (count & RWSEM_WRITER_MASK)
54c1ee4d614d52 Waiman Long    2022-03-22   978  		return;
54c1ee4d614d52 Waiman Long    2022-03-22   979  
54c1ee4d614d52 Waiman Long    2022-03-22   980  	if (count & RWSEM_READER_MASK) {
54c1ee4d614d52 Waiman Long    2022-03-22   981  		wake_type = RWSEM_WAKE_READERS;
54c1ee4d614d52 Waiman Long    2022-03-22   982  	} else {
54c1ee4d614d52 Waiman Long    2022-03-22   983  		wake_type = RWSEM_WAKE_ANY;
54c1ee4d614d52 Waiman Long    2022-03-22   984  		clear_nonspinnable(sem);
54c1ee4d614d52 Waiman Long    2022-03-22   985  	}
54c1ee4d614d52 Waiman Long    2022-03-22   986  	rwsem_mark_wake(sem, wake_type, wake_q);
54c1ee4d614d52 Waiman Long    2022-03-22   987  }
54c1ee4d614d52 Waiman Long    2022-03-22   988  
5dec94d4923683 Waiman Long    2019-05-20   989  /*
5dec94d4923683 Waiman Long    2019-05-20   990   * Wait for the read lock to be granted
5dec94d4923683 Waiman Long    2019-05-20   991   */
6cef7ff6e43cbd Waiman Long    2019-05-20   992  static struct rw_semaphore __sched *
2f064a59a11ff9 Peter Zijlstra 2021-06-11  @993  rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int state)
5dec94d4923683 Waiman Long    2019-05-20   994  {
617f3ef9517784 Waiman Long    2020-11-20   995  	long adjustment = -RWSEM_READER_BIAS;
2f06f702925b51 Waiman Long    2020-11-20  @996  	long rcnt = (count >> RWSEM_READER_SHIFT);
5dec94d4923683 Waiman Long    2019-05-20   997  	struct rwsem_waiter waiter;
5dec94d4923683 Waiman Long    2019-05-20   998  	DEFINE_WAKE_Q(wake_q);
5dec94d4923683 Waiman Long    2019-05-20   999  
2f06f702925b51 Waiman Long    2020-11-20  1000  	/*
2f06f702925b51 Waiman Long    2020-11-20  1001  	 * To prevent a constant stream of readers from starving a sleeping
d566c78659eccf Waiman Long    2024-02-22  1002  	 * writer, don't attempt optimistic lock stealing if the lock is
d566c78659eccf Waiman Long    2024-02-22  1003  	 * very likely owned by readers.
2f06f702925b51 Waiman Long    2020-11-20  1004  	 */
cbce0966b2c1f7 Chao Yu        2025-10-31  1005  	if ((count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF)) ||
cbce0966b2c1f7 Chao Yu        2025-10-31  1006  	    ((atomic_long_read(&sem->owner) & RWSEM_READER_OWNED) &&
cbce0966b2c1f7 Chao Yu        2025-10-31  1007  	    (rcnt > 1))
2f06f702925b51 Waiman Long    2020-11-20  1008  		goto queue;
2f06f702925b51 Waiman Long    2020-11-20  1009  
1a728dff855a31 Waiman Long    2020-11-20  1010  	/*
617f3ef9517784 Waiman Long    2020-11-20  1011  	 * Reader optimistic lock stealing.
1a728dff855a31 Waiman Long    2020-11-20  1012  	 */
1a728dff855a31 Waiman Long    2020-11-20  1013  	rwsem_set_reader_owned(sem);
1a728dff855a31 Waiman Long    2020-11-20  1014  	lockevent_inc(rwsem_rlock_steal);
5cfd92e12e1343 Waiman Long    2019-05-20  1015  
cf69482d62d996 Waiman Long    2019-05-20  1016  	/*
cbce0966b2c1f7 Chao Yu        2025-10-31  1017  	 * Wake up other readers in the wait queue if it is the first reader.
cf69482d62d996 Waiman Long    2019-05-20  1018  	 */
617f3ef9517784 Waiman Long    2020-11-20  1019  	if ((rcnt == 1) && (count & RWSEM_FLAG_WAITERS)) {
cf69482d62d996 Waiman Long    2019-05-20  1020  		raw_spin_lock_irq(&sem->wait_lock);
cf69482d62d996 Waiman Long    2019-05-20  1021  		if (!list_empty(&sem->wait_list))
cbce0966b2c1f7 Chao Yu        2025-10-31  1022  			rwsem_mark_wake(sem, RWSEM_WAKE_READ_OWNED, &wake_q);
cf69482d62d996 Waiman Long    2019-05-20  1023  		raw_spin_unlock_irq(&sem->wait_lock);
cf69482d62d996 Waiman Long    2019-05-20  1024  		wake_up_q(&wake_q);
cf69482d62d996 Waiman Long    2019-05-20  1025  	}
cf69482d62d996 Waiman Long    2019-05-20  1026  	return sem;
cf69482d62d996 Waiman Long    2019-05-20  1027  
cf69482d62d996 Waiman Long    2019-05-20  1028  queue:
5dec94d4923683 Waiman Long    2019-05-20  1029  	waiter.task = current;
5dec94d4923683 Waiman Long    2019-05-20  1030  	waiter.type = RWSEM_WAITING_FOR_READ;
4f23dbc1e65795 Waiman Long    2019-05-20  1031  	waiter.timeout = jiffies + RWSEM_WAIT_TIMEOUT;
6eebd5fb20838f Waiman Long    2022-06-22  1032  	waiter.handoff_set = false;
5dec94d4923683 Waiman Long    2019-05-20  1033  
5dec94d4923683 Waiman Long    2019-05-20  1034  	raw_spin_lock_irq(&sem->wait_lock);
5dec94d4923683 Waiman Long    2019-05-20  1035  	if (list_empty(&sem->wait_list)) {
5dec94d4923683 Waiman Long    2019-05-20  1036  		/*
5dec94d4923683 Waiman Long    2019-05-20  1037  		 * In case the wait queue is empty and the lock isn't owned
f9e21aa9e6fb11 Waiman Long    2022-03-22  1038  		 * by a writer, this reader can exit the slowpath and return
f9e21aa9e6fb11 Waiman Long    2022-03-22  1039  		 * immediately as its RWSEM_READER_BIAS has already been set
f9e21aa9e6fb11 Waiman Long    2022-03-22  1040  		 * in the count.
5dec94d4923683 Waiman Long    2019-05-20  1041  		 */
f9e21aa9e6fb11 Waiman Long    2022-03-22  1042  		if (!(atomic_long_read(&sem->count) & RWSEM_WRITER_MASK)) {
e1b98fa3166484 Jan Stancek    2019-07-18  1043  			/* Provide lock ACQUIRE */
e1b98fa3166484 Jan Stancek    2019-07-18  1044  			smp_acquire__after_ctrl_dep();
5dec94d4923683 Waiman Long    2019-05-20  1045  			raw_spin_unlock_irq(&sem->wait_lock);
5dec94d4923683 Waiman Long    2019-05-20  1046  			rwsem_set_reader_owned(sem);
5dec94d4923683 Waiman Long    2019-05-20  1047  			lockevent_inc(rwsem_rlock_fast);
5dec94d4923683 Waiman Long    2019-05-20  1048  			return sem;
5dec94d4923683 Waiman Long    2019-05-20  1049  		}
5dec94d4923683 Waiman Long    2019-05-20  1050  		adjustment += RWSEM_FLAG_WAITERS;
5dec94d4923683 Waiman Long    2019-05-20  1051  	}
d257cc8cb8d535 Waiman Long    2021-11-15  1052  	rwsem_add_waiter(sem, &waiter);
5dec94d4923683 Waiman Long    2019-05-20  1053  
5dec94d4923683 Waiman Long    2019-05-20  1054  	/* we're now waiting on the lock, but no longer actively locking */
5dec94d4923683 Waiman Long    2019-05-20  1055  	count = atomic_long_add_return(adjustment, &sem->count);
5dec94d4923683 Waiman Long    2019-05-20  1056  
54c1ee4d614d52 Waiman Long    2022-03-22  1057  	rwsem_cond_wake_waiter(sem, count, &wake_q);
5dec94d4923683 Waiman Long    2019-05-20  1058  	raw_spin_unlock_irq(&sem->wait_lock);
54c1ee4d614d52 Waiman Long    2022-03-22  1059  
54c1ee4d614d52 Waiman Long    2022-03-22  1060  	if (!wake_q_empty(&wake_q))
5dec94d4923683 Waiman Long    2019-05-20  1061  		wake_up_q(&wake_q);
5dec94d4923683 Waiman Long    2019-05-20  1062  
ee042be16cb455 Namhyung Kim   2022-03-22  1063  	trace_contention_begin(sem, LCB_F_READ);
77da18de55ac64 Lance Yang     2025-06-27  1064  	set_current_state(state);
77da18de55ac64 Lance Yang     2025-06-27  1065  
77da18de55ac64 Lance Yang     2025-06-27  1066  	if (state == TASK_UNINTERRUPTIBLE)
77da18de55ac64 Lance Yang     2025-06-27  1067  		hung_task_set_blocker(sem, BLOCKER_TYPE_RWSEM_READER);
ee042be16cb455 Namhyung Kim   2022-03-22  1068  
5dec94d4923683 Waiman Long    2019-05-20  1069  	/* wait to be given the lock */
6ffddfb9e1de21 Peter Zijlstra 2019-07-18  1070  	for (;;) {
99143f82a255e7 Peter Zijlstra 2019-07-18  1071  		if (!smp_load_acquire(&waiter.task)) {
6ffddfb9e1de21 Peter Zijlstra 2019-07-18  1072  			/* Matches rwsem_mark_wake()'s smp_store_release(). */
5dec94d4923683 Waiman Long    2019-05-20  1073  			break;
99143f82a255e7 Peter Zijlstra 2019-07-18  1074  		}
5dec94d4923683 Waiman Long    2019-05-20  1075  		if (signal_pending_state(state, current)) {
5dec94d4923683 Waiman Long    2019-05-20  1076  			raw_spin_lock_irq(&sem->wait_lock);
5dec94d4923683 Waiman Long    2019-05-20  1077  			if (waiter.task)
5dec94d4923683 Waiman Long    2019-05-20  1078  				goto out_nolock;
5dec94d4923683 Waiman Long    2019-05-20  1079  			raw_spin_unlock_irq(&sem->wait_lock);
6ffddfb9e1de21 Peter Zijlstra 2019-07-18  1080  			/* Ordered by sem->wait_lock against rwsem_mark_wake(). */
5dec94d4923683 Waiman Long    2019-05-20  1081  			break;
5dec94d4923683 Waiman Long    2019-05-20  1082  		}
3f5245538a1964 Waiman Long    2023-01-25  1083  		schedule_preempt_disabled();
5dec94d4923683 Waiman Long    2019-05-20  1084  		lockevent_inc(rwsem_sleep_reader);
77da18de55ac64 Lance Yang     2025-06-27  1085  		set_current_state(state);
5dec94d4923683 Waiman Long    2019-05-20  1086  	}
5dec94d4923683 Waiman Long    2019-05-20  1087  
77da18de55ac64 Lance Yang     2025-06-27  1088  	if (state == TASK_UNINTERRUPTIBLE)
77da18de55ac64 Lance Yang     2025-06-27  1089  		hung_task_clear_blocker();
77da18de55ac64 Lance Yang     2025-06-27  1090  
5dec94d4923683 Waiman Long    2019-05-20  1091  	__set_current_state(TASK_RUNNING);
5dec94d4923683 Waiman Long    2019-05-20  1092  	lockevent_inc(rwsem_rlock);
ee042be16cb455 Namhyung Kim   2022-03-22  1093  	trace_contention_end(sem, 0);
5dec94d4923683 Waiman Long    2019-05-20  1094  	return sem;
6ffddfb9e1de21 Peter Zijlstra 2019-07-18  1095  
5dec94d4923683 Waiman Long    2019-05-20  1096  out_nolock:
1ee326196c6658 Waiman Long    2022-03-22  1097  	rwsem_del_wake_waiter(sem, &waiter, &wake_q);
5dec94d4923683 Waiman Long    2019-05-20  1098  	__set_current_state(TASK_RUNNING);
5dec94d4923683 Waiman Long    2019-05-20  1099  	lockevent_inc(rwsem_rlock_fail);
ee042be16cb455 Namhyung Kim   2022-03-22  1100  	trace_contention_end(sem, -EINTR);
5dec94d4923683 Waiman Long    2019-05-20  1101  	return ERR_PTR(-EINTR);
5dec94d4923683 Waiman Long    2019-05-20  1102  }
5dec94d4923683 Waiman Long    2019-05-20  1103  

:::::: The code at line 996 was first introduced by commit
:::::: 2f06f702925b512a95b95dca3855549c047eef58 locking/rwsem: Prevent potential lock starvation

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
