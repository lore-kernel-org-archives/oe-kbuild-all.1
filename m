Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80B4200111
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 18:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740680690; cv=none; b=bEsCxTDvNjXgBqfTqGdA7fkoSymmxZsJu6M6GYmlnSRUOHpZeRJpLP4HodyaCPHARRaQf0fvPgIMLjmJNWkOU8tHQcg/vcL+GF86D58adiMrlYBZOaImPk7Qsrj52Ptpy4La3ZqMe6lOjmvYGMILFh3KPkdT2W4MBo+DIzjE5nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740680690; c=relaxed/simple;
	bh=StzVIafwzTmFBHtTyloJO1YjBIH7NsVYjysOLyjB/3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jkqPgcg/c9xgU/O5vIZwp/bFkGSZBm9wRUVkjmqXefm2z+k3R/iJxZDDEUgCdS8OF2kqlaHCM/axUB+vAZeS4tA8gwWXxrqSZGI7Gc+LbWjYbi7L+ieHmpBcIC3emllTIx+s6wEapap4HF+IFlPf7IHLloqNJh+u7r8DyCHlIQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MS5KWNry; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MS5KWNry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740680688; x=1772216688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=StzVIafwzTmFBHtTyloJO1YjBIH7NsVYjysOLyjB/3Q=;
  b=MS5KWNryrH9w4iIK71pHmIU98Ou+0v4Iyyb8fIbUuuKaf3LVQo/nqDOd
   OrtAZSNOHVnJcG3AdhvVn8Kp6dI6OapYMDi5bNJjvfZ5IIIlJNnn5ui9y
   3x3yIuvLoQ1ZDMmeXGK4W9OnjsHiH3fR6qJlSr8ttkV4slauE/ndY3cKq
   j2N4fgeW4epIP5adVU6KQok9wTq2OJk89GbWX5srlOz50QVkJqw69mkAf
   Fv+yaXbgqPyA5FKq4SEncjFpoQ9L0qmZP2vm1bs4J1hXvUGVBdT/6kO0T
   3M2l+WyUTXxPXqAzlVCOqRIRV5rzRzCJzc29P/6jUeMrC6KZiNfZ0uTD3
   A==;
X-CSE-ConnectionGUID: /gVZ0GVTTqqwCopG0UH9Ww==
X-CSE-MsgGUID: zO3GuVraTluQbTnoBP4NzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41714182"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="41714182"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 10:24:42 -0800
X-CSE-ConnectionGUID: aGp3couTRI+oJx3b0hDMuw==
X-CSE-MsgGUID: QDZ6od8bS6uaCpdyU1Z9sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="116873108"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Feb 2025 10:24:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tniYo-000Dqy-2y;
	Thu, 27 Feb 2025 18:24:38 +0000
Date: Fri, 28 Feb 2025 02:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 8/19] kernel/time/posix-timers.c:482:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202502280251.ad6d5vj0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   c83ebaa51246a53b35305c259ba5e045e0f0d8d9
commit: c27e83266d0f7698bdf1fe6e7eae08bb52114673 [8/19] posix-timers: Use guards in a few places
config: arc-randconfig-r122-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280251.ad6d5vj0-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250228/202502280251.ad6d5vj0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280251.ad6d5vj0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/time/posix-timers.c:313:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:313:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-timers.c:313:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:320:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:320:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-timers.c:320:27: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/time/posix-timers.c:482:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:482:9: sparse:     expected struct spinlock [usertype] *l
   kernel/time/posix-timers.c:482:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:1092:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:1092:9: sparse:     expected struct spinlock [usertype] *l
   kernel/time/posix-timers.c:1092:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:274:13: sparse: sparse: context imbalance in '__posixtimer_deliver_signal' - wrong count at exit
   kernel/time/posix-timers.c:304:6: sparse: sparse: context imbalance in 'posixtimer_deliver_signal' - unexpected unlock
   kernel/time/posix-timers.c:339:29: sparse: sparse: context imbalance in 'posix_timer_fn' - wrong count at exit
   kernel/time/posix-timers.c:531:24: sparse: sparse: context imbalance in '__lock_timer' - different lock contexts for basic block
   kernel/time/posix-timers.c:670:12: sparse: sparse: context imbalance in 'do_timer_gettime' - different lock contexts for basic block
   kernel/time/posix-timers.c:806:24: sparse: sparse: context imbalance in 'timer_wait_running' - unexpected unlock
   kernel/time/posix-timers.c:877:12: sparse: sparse: context imbalance in 'do_timer_settime' - different lock contexts for basic block
   kernel/time/posix-timers.c:1006:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:1006:9: sparse:     expected struct spinlock [usertype] *l
   kernel/time/posix-timers.c:1006:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:986:1: sparse: sparse: context imbalance in '__se_sys_timer_delete' - different lock contexts for basic block
   kernel/time/posix-timers.c:1030:13: sparse: sparse: context imbalance in 'itimer_delete' - wrong count at exit

vim +482 kernel/time/posix-timers.c

   407	
   408	/* Create a POSIX.1b interval timer. */
   409	static int do_timer_create(clockid_t which_clock, struct sigevent *event,
   410				   timer_t __user *created_timer_id)
   411	{
   412		const struct k_clock *kc = clockid_to_kclock(which_clock);
   413		struct k_itimer *new_timer;
   414		int error, new_timer_id;
   415	
   416		if (!kc)
   417			return -EINVAL;
   418		if (!kc->timer_create)
   419			return -EOPNOTSUPP;
   420	
   421		new_timer = alloc_posix_timer();
   422		if (unlikely(!new_timer))
   423			return -EAGAIN;
   424	
   425		spin_lock_init(&new_timer->it_lock);
   426	
   427		/*
   428		 * Add the timer to the hash table. The timer is not yet valid
   429		 * after insertion, but has a unique ID allocated.
   430		 */
   431		new_timer_id = posix_timer_add(new_timer);
   432		if (new_timer_id < 0) {
   433			posixtimer_free_timer(new_timer);
   434			return new_timer_id;
   435		}
   436	
   437		new_timer->it_clock = which_clock;
   438		new_timer->kclock = kc;
   439		new_timer->it_overrun = -1LL;
   440	
   441		if (event) {
   442			scoped_guard (rcu)
   443				new_timer->it_pid = get_pid(good_sigevent(event));
   444			if (!new_timer->it_pid) {
   445				error = -EINVAL;
   446				goto out;
   447			}
   448			new_timer->it_sigev_notify     = event->sigev_notify;
   449			new_timer->sigq.info.si_signo = event->sigev_signo;
   450			new_timer->sigq.info.si_value = event->sigev_value;
   451		} else {
   452			new_timer->it_sigev_notify     = SIGEV_SIGNAL;
   453			new_timer->sigq.info.si_signo = SIGALRM;
   454			memset(&new_timer->sigq.info.si_value, 0, sizeof(sigval_t));
   455			new_timer->sigq.info.si_value.sival_int = new_timer->it_id;
   456			new_timer->it_pid = get_pid(task_tgid(current));
   457		}
   458	
   459		if (new_timer->it_sigev_notify & SIGEV_THREAD_ID)
   460			new_timer->it_pid_type = PIDTYPE_PID;
   461		else
   462			new_timer->it_pid_type = PIDTYPE_TGID;
   463	
   464		new_timer->sigq.info.si_tid = new_timer->it_id;
   465		new_timer->sigq.info.si_code = SI_TIMER;
   466	
   467		if (copy_to_user(created_timer_id, &new_timer_id, sizeof (new_timer_id))) {
   468			error = -EFAULT;
   469			goto out;
   470		}
   471		/*
   472		 * After succesful copy out, the timer ID is visible to user space
   473		 * now but not yet valid because new_timer::signal low order bit is 1.
   474		 *
   475		 * Complete the initialization with the clock specific create
   476		 * callback.
   477		 */
   478		error = kc->timer_create(new_timer);
   479		if (error)
   480			goto out;
   481	
 > 482		scoped_guard (spinlock_irq, &current->sighand->siglock) {
   483			/*
   484			 * new_timer::it_signal contains the signal pointer with bit 0 set,
   485			 * which makes it invalid for syscall operations. Store the
   486			 * unmodified signal pointer to make it valid.
   487			 */
   488			WRITE_ONCE(new_timer->it_signal, current->signal);
   489			hlist_add_head(&new_timer->list, &current->signal->posix_timers);
   490		}
   491		/*
   492		 * After unlocking sighand::siglock @new_timer is subject to
   493		 * concurrent removal and cannot be touched anymore
   494		 */
   495		return 0;
   496	out:
   497		posix_timer_unhash_and_free(new_timer);
   498		return error;
   499	}
   500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
