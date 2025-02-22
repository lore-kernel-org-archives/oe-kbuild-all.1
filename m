Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9E320126C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 20:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740257317; cv=none; b=ZLC78d/iq3lNk5g7/qJaPRzQoCMpa0dZfZyGLkY/+4eXFrdUp24cnA+1+QZT9WckM4UtH4HmCigri+VMIdqELGxSqjQqjrN2yoTGSLTTJ7kN+4LJqKwVZNupzhhXAU0Q/Ai3Z9ij7XxQ/HdBe7TzDsWX4vsuh3dPxf910BvtUpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740257317; c=relaxed/simple;
	bh=fdLrK5lLaS4lNxaDuBcrsCX4Fcy5ImD1ksAX3ekRNNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lHsr57lJOCRVzZ5o49o4emjqskSUDQRhgF3WaldLPgHSO3jXT9cekCk0/uCrKsffNikdkOm+LYPN/YyHDgPlAJax28n1svd3BbFNNeYiL2Qw5WBGxaMA3DvbgFvOqXIwiLUZl4mQFT+Lf54Q6o07t7CXJvg/y/PB8q6g4VnRnWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJaVLOev; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJaVLOev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740257315; x=1771793315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fdLrK5lLaS4lNxaDuBcrsCX4Fcy5ImD1ksAX3ekRNNc=;
  b=YJaVLOevGFnUctrvNcHuNz9MwWtK6vR8jScTs2kfUJTBJzFAwp1viOMV
   eGGngWQq9JsZM3R6+NcyQb8z1VnEUsnclYTK0jRc99+hHJMWjR5//OCqn
   iI1UXPopWK4TEzTFbzq4tcGGEjA1hD0ZBL2RBL0oQ8PQE9MzCtv5jCfW4
   2+K+7ZjB58rTz4rz0lvPLNzBUJgt4VilhnHblSY6qCOILeH3V1D0fHQLD
   aZSrewy/U0jvJa4bi7KLT/lY4wRP9nZnIWtzaBD8k1cVeosCiNFAK7qGQ
   HWTksu96V9L4jOdJJ/vVCPTa1xCd3+nmI2eFImMVVWJfZua7tw/PGMzAY
   A==;
X-CSE-ConnectionGUID: 2aUYmVlsRdypLZ9XXKJ4MQ==
X-CSE-MsgGUID: 9mi4lIFvSZ6AGcIWQUIjMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="51692683"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="51692683"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 12:48:33 -0800
X-CSE-ConnectionGUID: 7wiizzoZR+mlCQkdfvb1rQ==
X-CSE-MsgGUID: eW1aAQnPSpO0h/XycaeqZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="120778786"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Feb 2025 12:48:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlwQH-0006uC-0C;
	Sat, 22 Feb 2025 20:48:29 +0000
Date: Sun, 23 Feb 2025 04:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 10/19] kernel/time/posix-timers.c:423:9:
 error: 'new_timer_id' undeclared; did you mean 'new_timer'?
Message-ID: <202502230433.CF74INaB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   9d4caab4067bd0c9023b7e98205b0747dece9f66
commit: ee35cb454088487035734ec7320ec5974a69651e [10/19] posix-timers: Rework the timer valid mechanism
config: arc-randconfig-002-20250223 (https://download.01.org/0day-ci/archive/20250223/202502230433.CF74INaB-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230433.CF74INaB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230433.CF74INaB-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/posix-timers.c: In function 'posix_timer_add':
   kernel/time/posix-timers.c:105:42: error: initialization of 'struct list_head *' from incompatible pointer type 'struct hlist_head *' [-Werror=incompatible-pointer-types]
     105 |                 struct list_head *head = &posix_timers_hashtable[hash(sig, id)];
         |                                          ^
   kernel/time/posix-timers.c:110:53: error: passing argument 1 of 'posix_timer_hashed' from incompatible pointer type [-Werror=incompatible-pointer-types]
     110 |                         hashed = posix_timer_hashed(head, sig, id);
         |                                                     ^~~~
         |                                                     |
         |                                                     struct list_head *
   kernel/time/posix-timers.c:69:51: note: expected 'struct hlist_head *' but argument is of type 'struct list_head *'
      69 | static bool posix_timer_hashed(struct hlist_head *head, struct signal_struct *sig, timer_t id)
         |                                ~~~~~~~~~~~~~~~~~~~^~~~
   kernel/time/posix-timers.c:123:41: error: passing argument 1 of 'posix_timer_hashed' from incompatible pointer type [-Werror=incompatible-pointer-types]
     123 |                 if (!posix_timer_hashed(head, sig, id)) {
         |                                         ^~~~
         |                                         |
         |                                         struct list_head *
   kernel/time/posix-timers.c:69:51: note: expected 'struct hlist_head *' but argument is of type 'struct list_head *'
      69 | static bool posix_timer_hashed(struct hlist_head *head, struct signal_struct *sig, timer_t id)
         |                                ~~~~~~~~~~~~~~~~~~~^~~~
   kernel/time/posix-timers.c:132:60: error: passing argument 2 of 'hlist_add_head_rcu' from incompatible pointer type [-Werror=incompatible-pointer-types]
     132 |                         hlist_add_head_rcu(&timer->t_hash, head);
         |                                                            ^~~~
         |                                                            |
         |                                                            struct list_head *
   In file included from include/linux/dcache.h:8,
                    from include/linux/fs.h:8,
                    from include/linux/compat.h:17,
                    from kernel/time/posix-timers.c:12:
   include/linux/rculist.h:634:60: note: expected 'struct hlist_head *' but argument is of type 'struct list_head *'
     634 |                                         struct hlist_head *h)
         |                                         ~~~~~~~~~~~~~~~~~~~^
   kernel/time/posix-timers.c: In function 'do_timer_create':
>> kernel/time/posix-timers.c:423:9: error: 'new_timer_id' undeclared (first use in this function); did you mean 'new_timer'?
     423 |         new_timer_id = posix_timer_add(new_timer);
         |         ^~~~~~~~~~~~
         |         new_timer
   kernel/time/posix-timers.c:423:9: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +423 kernel/time/posix-timers.c

838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  399  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  400  /* Create a POSIX.1b interval timer. */
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  401  static int do_timer_create(clockid_t which_clock, struct sigevent *event,
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  402  			   timer_t __user *created_timer_id)
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  403  {
d3ba5a9a345b12 kernel/time/posix-timers.c Christoph Hellwig 2017-05-26  404  	const struct k_clock *kc = clockid_to_kclock(which_clock);
2cd499e38ec241 kernel/posix-timers.c      Oleg Nesterov     2008-09-22  405  	struct k_itimer *new_timer;
ee35cb45408848 kernel/time/posix-timers.c Thomas Gleixner   2025-02-18  406  	int error;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  407  
838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  408  	if (!kc)
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  409  		return -EINVAL;
838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  410  	if (!kc->timer_create)
838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  411  		return -EOPNOTSUPP;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  412  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  413  	new_timer = alloc_posix_timer();
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  414  	if (unlikely(!new_timer))
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  415  		return -EAGAIN;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  416  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  417  	spin_lock_init(&new_timer->it_lock);
ae88967d71f1b4 kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  418  
ae88967d71f1b4 kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  419  	/*
ae88967d71f1b4 kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  420  	 * Add the timer to the hash table. The timer is not yet valid
e577c6d8698192 kernel/time/posix-timers.c Eric Dumazet      2025-02-19  421  	 * after insertion, but has a unique ID allocated.
ae88967d71f1b4 kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  422  	 */
5ed67f05f66c41 kernel/posix-timers.c      Pavel Emelyanov   2013-03-11 @423  	new_timer_id = posix_timer_add(new_timer);
5ed67f05f66c41 kernel/posix-timers.c      Pavel Emelyanov   2013-03-11  424  	if (new_timer_id < 0) {
5d916a0988eed5 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  425  		posixtimer_free_timer(new_timer);
8cc96ca2c75f6d kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  426  		return new_timer_id;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  427  	}
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  428  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  429  	new_timer->it_clock = which_clock;
d97bb75ddd2f38 kernel/time/posix-timers.c Thomas Gleixner   2017-05-30  430  	new_timer->kclock = kc;
78c9c4dfbf8c04 kernel/time/posix-timers.c Thomas Gleixner   2018-06-26  431  	new_timer->it_overrun = -1LL;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  432  
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  433  	if (event) {
36b2f046000b35 kernel/posix-timers.c      Oleg Nesterov     2008-09-22  434  		rcu_read_lock();
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  435  		new_timer->it_pid = get_pid(good_sigevent(event));
36b2f046000b35 kernel/posix-timers.c      Oleg Nesterov     2008-09-22  436  		rcu_read_unlock();
899921025b406a kernel/posix-timers.c      Oleg Nesterov     2008-12-01  437  		if (!new_timer->it_pid) {
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  438  			error = -EINVAL;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  439  			goto out;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  440  		}
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  441  		new_timer->it_sigev_notify     = event->sigev_notify;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  442  		new_timer->sigq.info.si_signo = event->sigev_signo;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  443  		new_timer->sigq.info.si_value = event->sigev_value;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  444  	} else {
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  445  		new_timer->it_sigev_notify     = SIGEV_SIGNAL;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  446  		new_timer->sigq.info.si_signo = SIGALRM;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  447  		memset(&new_timer->sigq.info.si_value, 0, sizeof(sigval_t));
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  448  		new_timer->sigq.info.si_value.sival_int = new_timer->it_id;
899921025b406a kernel/posix-timers.c      Oleg Nesterov     2008-12-01  449  		new_timer->it_pid = get_pid(task_tgid(current));
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  450  	}
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  451  
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  452  	if (new_timer->it_sigev_notify & SIGEV_THREAD_ID)
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  453  		new_timer->it_pid_type = PIDTYPE_PID;
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  454  	else
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  455  		new_timer->it_pid_type = PIDTYPE_TGID;
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  456  
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  457  	new_timer->sigq.info.si_tid = new_timer->it_id;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  458  	new_timer->sigq.info.si_code = SI_TIMER;
717835d94d3e3d kernel/posix-timers.c      Oleg Nesterov     2008-09-22  459  
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  460  	if (copy_to_user(created_timer_id, &new_timer_id, sizeof (new_timer_id))) {
2b08de0073a569 kernel/posix-timers.c      Andrey Vagin      2010-07-20  461  		error = -EFAULT;
2b08de0073a569 kernel/posix-timers.c      Andrey Vagin      2010-07-20  462  		goto out;
2b08de0073a569 kernel/posix-timers.c      Andrey Vagin      2010-07-20  463  	}
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  464  	/*
ee35cb45408848 kernel/time/posix-timers.c Thomas Gleixner   2025-02-18  465  	 * After successful copy out, the timer ID is visible to user space
ee35cb45408848 kernel/time/posix-timers.c Thomas Gleixner   2025-02-18  466  	 * now but not yet valid because new_timer::it_valid is still false.
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  467  	 *
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  468  	 * Complete the initialization with the clock specific create
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  469  	 * callback.
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  470  	 */
838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  471  	error = kc->timer_create(new_timer);
45e0fffc8a7778 kernel/posix-timers.c      Andrey Vagin      2010-05-24  472  	if (error)
45e0fffc8a7778 kernel/posix-timers.c      Andrey Vagin      2010-05-24  473  		goto out;
45e0fffc8a7778 kernel/posix-timers.c      Andrey Vagin      2010-05-24  474  
36b2f046000b35 kernel/posix-timers.c      Oleg Nesterov     2008-09-22  475  	spin_lock_irq(&current->sighand->siglock);
ee35cb45408848 kernel/time/posix-timers.c Thomas Gleixner   2025-02-18  476  	/* Set the valid marker so it's visible for syscall operations. */
ee35cb45408848 kernel/time/posix-timers.c Thomas Gleixner   2025-02-18  477  	WRITE_ONCE(new_timer->it_valid, true);
52dea0a15cc888 kernel/time/posix-timers.c Thomas Gleixner   2024-06-10  478  	hlist_add_head(&new_timer->list, &current->signal->posix_timers);
36b2f046000b35 kernel/posix-timers.c      Oleg Nesterov     2008-09-22  479  	spin_unlock_irq(&current->sighand->siglock);
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  480  	/*
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  481  	 * After unlocking sighand::siglock @new_timer is subject to
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  482  	 * concurrent removal and cannot be touched anymore
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  483  	 */
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  484  	return 0;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  485  out:
8cc96ca2c75f6d kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  486  	posix_timer_unhash_and_free(new_timer);
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  487  	return error;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  488  }
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  489  

:::::: The code at line 423 was first introduced by commit
:::::: 5ed67f05f66c41e39880a6d61358438a25f9fee5 posix timers: Allocate timer id per process (v2)

:::::: TO: Pavel Emelyanov <xemul@parallels.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
