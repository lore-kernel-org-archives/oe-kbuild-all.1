Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9E22475CB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 22:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781476679; cv=none; b=BR2JLo6x9ihLgL6yJ6X97rNjoNd5tk+YllWLnGv6ltay2jM0WuSclBbq7OU7deDxkgBlu7p/jgmLzdScKUtmJrAP2091Y0cbW7PXRLXaG0qTQ9RA0Pb6rHA2gq1OYXF400Bkds/BLDlOPIufDrHY2suvJvDzP5RVjRDQCAYApVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781476679; c=relaxed/simple;
	bh=/KI0CkXU08ZU+CQm41Q9b9IYOpkFoIsQ5PmToEDwRTw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=moIXVhzwWlyv8O8yO36HMeON7nSaGYUUljJeJcx1AMR9OdncyLrMQrcjaQwylUq1W1P1IynzkMYxCVxoPRd7xud0Q5c1a/mCi54vFAIuFw+POJFUoVTqnMZGm6+IWwgTcbUFB/9EtcLOTIJqXGViA7aHjGaW/C9fQfOMqwILBos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MdGQlaiM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdGQlaiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781476678; x=1813012678;
  h=date:from:to:cc:subject:message-id;
  bh=/KI0CkXU08ZU+CQm41Q9b9IYOpkFoIsQ5PmToEDwRTw=;
  b=MdGQlaiMC0TWQTdsewyEBbG1zRDT6jFkwARJoJI+/v0bI+Wqynnx6+Fx
   /4e7cv7xDRmqWqpPZBDvlEYynrEIWk/2nQQEwjw50g6dHrpfjEx8xsaeY
   9WPCLLc3v+I43d3hx53uZMkJXisBAQpkNzObs+86Vo6X3nQbwnDZ0/3Wp
   N5R6ktegTJ/kSVYYZVBWd41zEPrM7UOUqPXzLL26PeSTFMqby6zHszVSz
   fewIdqiIY7Oy6gJQjXwitS8EgTYV7B/dHvFckIeFSVd9MBkbwFnhnFHxw
   jSXH3Zki2gv/1F6lvY7pW726c94rxCwGYFpz0OqAoZPn250fAoAsZf6JL
   A==;
X-CSE-ConnectionGUID: R5leOWekTrWumD2lRQlftA==
X-CSE-MsgGUID: NS5q0Ow0SMistChxoS1RSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="69761195"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="69761195"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 15:37:56 -0700
X-CSE-ConnectionGUID: nWa4ORCgTLOkpMVrhr3LvQ==
X-CSE-MsgGUID: RxFjrRjhSm+c6kGurp0dSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="243164778"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jun 2026 15:37:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYtSh-00000000RGC-1j3r;
	Sun, 14 Jun 2026 22:37:51 +0000
Date: Mon, 15 Jun 2026 06:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: kernel/time/posix-timers.c:554:17: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202606150642.uF81VHfj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: f16a802d402d735a55731f8c94952b3bbb5ddfe8 locking/rwlock, spinlock: Support Clang's context analysis
date:   5 months ago
config: x86_64-randconfig-r121-20260614 (https://download.01.org/0day-ci/archive/20260615/202606150642.uF81VHfj-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150642.uF81VHfj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f16a802d402d ("locking/rwlock, spinlock: Support Clang's context analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150642.uF81VHfj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/time/posix-timers.c:345:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:345:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-timers.c:345:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:352:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:352:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-timers.c:352:27: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/time/posix-timers.c:554:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:554:17: sparse:     expected struct spinlock [usertype] *_T
   kernel/time/posix-timers.c:554:17: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:1042:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:1042:9: sparse:     expected struct spinlock [usertype] *_T
   kernel/time/posix-timers.c:1042:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:1090:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:1090:9: sparse:     expected struct spinlock [usertype] *_T
   kernel/time/posix-timers.c:1090:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:134:13: sparse: sparse: context imbalance in 'posix_timer_add_at' - wrong count at exit
   kernel/time/posix-timers.c:306:13: sparse: sparse: context imbalance in '__posixtimer_deliver_signal' - wrong count at exit
   kernel/time/posix-timers.c:336:6: sparse: sparse: context imbalance in 'posixtimer_deliver_signal' - unexpected unlock
   kernel/time/posix-timers.c:374:29: sparse: sparse: context imbalance in 'posix_timer_fn' - wrong count at exit
   kernel/time/posix-timers.c:449:13: sparse: sparse: context imbalance in 'posix_timer_unhash_and_free' - wrong count at exit
   kernel/time/posix-timers.c:465:12: sparse: sparse: context imbalance in 'do_timer_create' - different lock contexts for basic block
   kernel/time/posix-timers.c:603:24: sparse: sparse: context imbalance in '__lock_timer' - different lock contexts for basic block
   kernel/time/posix-timers.c:1050:9: sparse: sparse: context imbalance in 'posix_timer_delete' - wrong count at exit
   kernel/time/posix-timers.c:1094:9: sparse: sparse: context imbalance in 'exit_itimers' - different lock contexts for basic block

vim +554 kernel/time/posix-timers.c

838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  463  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  464  /* Create a POSIX.1b interval timer. */
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  465  static int do_timer_create(clockid_t which_clock, struct sigevent *event,
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  466  			   timer_t __user *created_timer_id)
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  467  {
d3ba5a9a345b12 kernel/time/posix-timers.c Christoph Hellwig 2017-05-26  468  	const struct k_clock *kc = clockid_to_kclock(which_clock);
ec2d0c04624b3c kernel/time/posix-timers.c Thomas Gleixner   2025-03-11  469  	timer_t req_id = TIMER_ANY_ID;
2cd499e38ec241 kernel/posix-timers.c      Oleg Nesterov     2008-09-22  470  	struct k_itimer *new_timer;
ef864c95880176 kernel/posix-timers.c      Oleg Nesterov     2008-09-22  471  	int error, new_timer_id;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  472  
838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  473  	if (!kc)
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  474  		return -EINVAL;
838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  475  	if (!kc->timer_create)
838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  476  		return -EOPNOTSUPP;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  477  
ec2d0c04624b3c kernel/time/posix-timers.c Thomas Gleixner   2025-03-11  478  	/* Special case for CRIU to restore timers with a given timer ID. */
ec2d0c04624b3c kernel/time/posix-timers.c Thomas Gleixner   2025-03-11  479  	if (unlikely(current->signal->timer_create_restore_ids)) {
ec2d0c04624b3c kernel/time/posix-timers.c Thomas Gleixner   2025-03-11  480  		if (copy_from_user(&req_id, created_timer_id, sizeof(req_id)))
ec2d0c04624b3c kernel/time/posix-timers.c Thomas Gleixner   2025-03-11  481  			return -EFAULT;
ec2d0c04624b3c kernel/time/posix-timers.c Thomas Gleixner   2025-03-11  482  		/* Valid IDs are 0..INT_MAX */
ec2d0c04624b3c kernel/time/posix-timers.c Thomas Gleixner   2025-03-11  483  		if ((unsigned int)req_id > INT_MAX)
ec2d0c04624b3c kernel/time/posix-timers.c Thomas Gleixner   2025-03-11  484  			return -EINVAL;
ec2d0c04624b3c kernel/time/posix-timers.c Thomas Gleixner   2025-03-11  485  	}
ec2d0c04624b3c kernel/time/posix-timers.c Thomas Gleixner   2025-03-11  486  
e0fd4d42e27f76 kernel/time/posix-timers.c Eslam Khafagy     2025-11-14  487  	new_timer = alloc_posix_timer();
e0fd4d42e27f76 kernel/time/posix-timers.c Eslam Khafagy     2025-11-14  488  	if (unlikely(!new_timer))
e0fd4d42e27f76 kernel/time/posix-timers.c Eslam Khafagy     2025-11-14  489  		return -EAGAIN;
e0fd4d42e27f76 kernel/time/posix-timers.c Eslam Khafagy     2025-11-14  490  
e0fd4d42e27f76 kernel/time/posix-timers.c Eslam Khafagy     2025-11-14  491  	spin_lock_init(&new_timer->it_lock);
e0fd4d42e27f76 kernel/time/posix-timers.c Eslam Khafagy     2025-11-14  492  
ae88967d71f1b4 kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  493  	/*
ae88967d71f1b4 kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  494  	 * Add the timer to the hash table. The timer is not yet valid
45ece9933d4a8e kernel/time/posix-timers.c Eric Dumazet      2025-03-08  495  	 * after insertion, but has a unique ID allocated.
ae88967d71f1b4 kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  496  	 */
ec2d0c04624b3c kernel/time/posix-timers.c Thomas Gleixner   2025-03-11  497  	new_timer_id = posix_timer_add(new_timer, req_id);
5ed67f05f66c41 kernel/posix-timers.c      Pavel Emelyanov   2013-03-11  498  	if (new_timer_id < 0) {
5d916a0988eed5 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  499  		posixtimer_free_timer(new_timer);
8cc96ca2c75f6d kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  500  		return new_timer_id;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  501  	}
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  502  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  503  	new_timer->it_clock = which_clock;
d97bb75ddd2f38 kernel/time/posix-timers.c Thomas Gleixner   2017-05-30  504  	new_timer->kclock = kc;
78c9c4dfbf8c04 kernel/time/posix-timers.c Thomas Gleixner   2018-06-26  505  	new_timer->it_overrun = -1LL;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  506  
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  507  	if (event) {
a31a300c4daba8 kernel/time/posix-timers.c Thomas Gleixner   2025-03-08  508  		scoped_guard (rcu)
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  509  			new_timer->it_pid = get_pid(good_sigevent(event));
899921025b406a kernel/posix-timers.c      Oleg Nesterov     2008-12-01  510  		if (!new_timer->it_pid) {
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  511  			error = -EINVAL;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  512  			goto out;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  513  		}
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  514  		new_timer->it_sigev_notify     = event->sigev_notify;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  515  		new_timer->sigq.info.si_signo = event->sigev_signo;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  516  		new_timer->sigq.info.si_value = event->sigev_value;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  517  	} else {
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  518  		new_timer->it_sigev_notify     = SIGEV_SIGNAL;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  519  		new_timer->sigq.info.si_signo = SIGALRM;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  520  		new_timer->sigq.info.si_value.sival_int = new_timer->it_id;
899921025b406a kernel/posix-timers.c      Oleg Nesterov     2008-12-01  521  		new_timer->it_pid = get_pid(task_tgid(current));
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  522  	}
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  523  
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  524  	if (new_timer->it_sigev_notify & SIGEV_THREAD_ID)
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  525  		new_timer->it_pid_type = PIDTYPE_PID;
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  526  	else
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  527  		new_timer->it_pid_type = PIDTYPE_TGID;
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  528  
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  529  	new_timer->sigq.info.si_tid = new_timer->it_id;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  530  	new_timer->sigq.info.si_code = SI_TIMER;
717835d94d3e3d kernel/posix-timers.c      Oleg Nesterov     2008-09-22  531  
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  532  	if (copy_to_user(created_timer_id, &new_timer_id, sizeof (new_timer_id))) {
2b08de0073a569 kernel/posix-timers.c      Andrey Vagin      2010-07-20  533  		error = -EFAULT;
2b08de0073a569 kernel/posix-timers.c      Andrey Vagin      2010-07-20  534  		goto out;
2b08de0073a569 kernel/posix-timers.c      Andrey Vagin      2010-07-20  535  	}
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  536  	/*
391253b25f078d kernel/time/posix-timers.c Haofeng Li        2025-09-10  537  	 * After successful copy out, the timer ID is visible to user space
45ece9933d4a8e kernel/time/posix-timers.c Eric Dumazet      2025-03-08  538  	 * now but not yet valid because new_timer::signal low order bit is 1.
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  539  	 *
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  540  	 * Complete the initialization with the clock specific create
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  541  	 * callback.
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  542  	 */
838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  543  	error = kc->timer_create(new_timer);
45e0fffc8a7778 kernel/posix-timers.c      Andrey Vagin      2010-05-24  544  	if (error)
45e0fffc8a7778 kernel/posix-timers.c      Andrey Vagin      2010-05-24  545  		goto out;
45e0fffc8a7778 kernel/posix-timers.c      Andrey Vagin      2010-05-24  546  
2389c6efd3ad8e kernel/time/posix-timers.c Thomas Gleixner   2025-03-08  547  	/*
2389c6efd3ad8e kernel/time/posix-timers.c Thomas Gleixner   2025-03-08  548  	 * timer::it_lock ensures that __lock_timer() observes a fully
2389c6efd3ad8e kernel/time/posix-timers.c Thomas Gleixner   2025-03-08  549  	 * initialized timer when it observes a valid timer::it_signal.
2389c6efd3ad8e kernel/time/posix-timers.c Thomas Gleixner   2025-03-08  550  	 *
2389c6efd3ad8e kernel/time/posix-timers.c Thomas Gleixner   2025-03-08  551  	 * sighand::siglock is required to protect signal::posix_timers.
2389c6efd3ad8e kernel/time/posix-timers.c Thomas Gleixner   2025-03-08  552  	 */
2389c6efd3ad8e kernel/time/posix-timers.c Thomas Gleixner   2025-03-08  553  	scoped_guard (spinlock_irq, &new_timer->it_lock) {
2389c6efd3ad8e kernel/time/posix-timers.c Thomas Gleixner   2025-03-08 @554  		guard(spinlock)(&current->sighand->siglock);
45ece9933d4a8e kernel/time/posix-timers.c Eric Dumazet      2025-03-08  555  		/*
45ece9933d4a8e kernel/time/posix-timers.c Eric Dumazet      2025-03-08  556  		 * new_timer::it_signal contains the signal pointer with
45ece9933d4a8e kernel/time/posix-timers.c Eric Dumazet      2025-03-08  557  		 * bit 0 set, which makes it invalid for syscall operations.
45ece9933d4a8e kernel/time/posix-timers.c Eric Dumazet      2025-03-08  558  		 * Store the unmodified signal pointer to make it valid.
45ece9933d4a8e kernel/time/posix-timers.c Eric Dumazet      2025-03-08  559  		 */
028cf5eaa12846 kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  560  		WRITE_ONCE(new_timer->it_signal, current->signal);
451898ea422b58 kernel/time/posix-timers.c Thomas Gleixner   2025-03-08  561  		hlist_add_head_rcu(&new_timer->list, &current->signal->posix_timers);
2389c6efd3ad8e kernel/time/posix-timers.c Thomas Gleixner   2025-03-08  562  	}
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  563  	/*
2389c6efd3ad8e kernel/time/posix-timers.c Thomas Gleixner   2025-03-08  564  	 * After unlocking @new_timer is subject to concurrent removal and
2389c6efd3ad8e kernel/time/posix-timers.c Thomas Gleixner   2025-03-08  565  	 * cannot be touched anymore
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  566  	 */
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  567  	return 0;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  568  out:
8cc96ca2c75f6d kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  569  	posix_timer_unhash_and_free(new_timer);
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  570  	return error;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  571  }
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  572  

:::::: The code at line 554 was first introduced by commit
:::::: 2389c6efd3ad8edb3bcce0019b4edcc7d9c7de19 posix-timers: Ensure that timer initialization is fully visible

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
