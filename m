Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17E45786E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710789376; cv=none; b=tGaP3ws+C2xtTP7O7yxsQhkZSQwT96Us4eRZemFtz9fo4GNKK5mJLDD+nHPoBjyWuAPLkxvIImhMIB1Tg+5D1vedsD+d4vh7+XOsf1KvjETjTaXpccUhnNXva8qlXtxxcXpOIjnFTVeMX8QG5mog/XNx4SN/xv5K7H+zpHh8mR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710789376; c=relaxed/simple;
	bh=E6fAKRPwlHFUQKMi/U8OofO7x+v20Z0jhk1tqeeFOaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ND5w7kuUndHlw59jnRurgTs6bZkEaaeaNAW20ZOlNZ+QAbLNce+wDhrx9bxLoqnpHkvKsrIn0G4Vl+A0MPTbhzHxSDNSgY+ItY9fRHyRUWwpLgYN2+u6lHyIPDVIYhNkFdE/3fk1lt+ZmfmsdVAdofCvNyOGlvV8e/J5GJm1XQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egNMqPWF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egNMqPWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710789374; x=1742325374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E6fAKRPwlHFUQKMi/U8OofO7x+v20Z0jhk1tqeeFOaM=;
  b=egNMqPWF+gzDPI+sN9KMPu26AP5SzGr4pmSEfBos9gbDBECAmg3CrMTD
   3NDMDH70+5jEZQ4fLpgmHtCOF1Qo6vlPT8sZbnxNmF2y+FVPdOiJKAyBy
   JkHgGAtVjg8XLB+b4V4JaM0w9jTPaTwuehlt2S05eXDwnE7RvZglaUiAo
   vxhyPtJig86T+vQKdux4f/V5fCCsxnpCDeG2VFlPaekq+mZkbIRTF+O5G
   HTSJIsPfyaF8wFikMTz8sh8ucDcFsSRkXSwmHykmwXptBl4FXj3ELnHTX
   xyQ5248BhSD+oH0GaQq2uQud2DyfBc+fPaB2U7mRmHAnKwPN6EYbOUGNB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5840209"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5840209"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 12:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="13457074"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2024 12:16:12 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmISw-000HBr-0O;
	Mon, 18 Mar 2024 19:16:10 +0000
Date: Tue, 19 Mar 2024 03:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:b-4.4-st50-rt48 3/395] kernel/locking/rwsem-xadd.c:239:13:
 warning: comparison between signed and unsigned integer expressions
Message-ID: <202403190319.9GBF0oBB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git b-4.4-st50-rt48
head:   9721fc7815f56adca91f657c671845e73f895763
commit: cf6411cc66a2b7791a853f68acd7a68d9cd344f6 [3/395] sparc64: use generic rwsem spinlocks rt
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20240319/202403190319.9GBF0oBB-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403190319.9GBF0oBB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403190319.9GBF0oBB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/linkage.h:4:0,
                    from include/linux/rwsem.h:10,
                    from kernel/locking/rwsem-xadd.c:12:
   kernel/locking/rwsem-xadd.c: In function '__rwsem_do_wake':
   kernel/locking/rwsem-xadd.c:150:25: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
      if (unlikely(oldcount < RWSEM_WAITING_BIAS)) {
                            ^
   include/linux/compiler.h:182:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   kernel/locking/rwsem-xadd.c: In function 'rwsem_down_read_failed':
>> kernel/locking/rwsem-xadd.c:239:13: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
         (count > RWSEM_WAITING_BIAS &&
                ^
   kernel/locking/rwsem-xadd.c: In function 'rwsem_down_write_failed':
   kernel/locking/rwsem-xadd.c:474:13: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (count > RWSEM_WAITING_BIAS)
                ^
   kernel/locking/rwsem-xadd.c:1: warning: no structured comments found


vim +239 kernel/locking/rwsem-xadd.c

ce6711f3d196f0 lib/rwsem.c                 Alex Shi          2013-02-05  209  
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  210  /*
4fc828e24cd9c3 kernel/locking/rwsem-xadd.c Davidlohr Bueso   2014-05-02  211   * Wait for the read lock to be granted
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  212   */
3ebae4f3a2e746 kernel/locking/rwsem-xadd.c Andi Kleen        2014-02-08  213  __visible
1e78277ccbbb48 lib/rwsem.c                 Michel Lespinasse 2013-05-07  214  struct rw_semaphore __sched *rwsem_down_read_failed(struct rw_semaphore *sem)
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  215  {
b5f541810ea9fb lib/rwsem.c                 Davidlohr Bueso   2013-05-07  216  	long count, adjustment = -RWSEM_ACTIVE_READ_BIAS;
a8618a0e8a06f7 lib/rwsem.c                 Michel Lespinasse 2010-08-09  217  	struct rwsem_waiter waiter;
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  218  	struct task_struct *tsk = current;
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  219  
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  220  	/* set up my own style of waitqueue */
a8618a0e8a06f7 lib/rwsem.c                 Michel Lespinasse 2010-08-09  221  	waiter.task = tsk;
da16922cc031b9 lib/rwsem.c                 Michel Lespinasse 2013-05-07  222  	waiter.type = RWSEM_WAITING_FOR_READ;
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  223  	get_task_struct(tsk);
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  224  
f7dd1cee9a4e2b lib/rwsem.c                 Michel Lespinasse 2013-05-07  225  	raw_spin_lock_irq(&sem->wait_lock);
fd41b33435ada8 lib/rwsem.c                 Michel Lespinasse 2010-08-09  226  	if (list_empty(&sem->wait_list))
fd41b33435ada8 lib/rwsem.c                 Michel Lespinasse 2010-08-09  227  		adjustment += RWSEM_WAITING_BIAS;
a8618a0e8a06f7 lib/rwsem.c                 Michel Lespinasse 2010-08-09  228  	list_add_tail(&waiter.list, &sem->wait_list);
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  229  
70bdc6e0644f35 lib/rwsem.c                 Michel Lespinasse 2010-08-09  230  	/* we're now waiting on the lock, but no longer actively locking */
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  231  	count = rwsem_atomic_update(adjustment, sem);
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  232  
25c39325968bbc lib/rwsem.c                 Michel Lespinasse 2013-05-07  233  	/* If there are no active locks, wake the front queued process(es).
25c39325968bbc lib/rwsem.c                 Michel Lespinasse 2013-05-07  234  	 *
25c39325968bbc lib/rwsem.c                 Michel Lespinasse 2013-05-07  235  	 * If there are no writers and we are first in the queue,
25c39325968bbc lib/rwsem.c                 Michel Lespinasse 2013-05-07  236  	 * wake our own waiter to join the existing active readers !
25c39325968bbc lib/rwsem.c                 Michel Lespinasse 2013-05-07  237  	 */
25c39325968bbc lib/rwsem.c                 Michel Lespinasse 2013-05-07  238  	if (count == RWSEM_WAITING_BIAS ||
25c39325968bbc lib/rwsem.c                 Michel Lespinasse 2013-05-07 @239  	    (count > RWSEM_WAITING_BIAS &&
25c39325968bbc lib/rwsem.c                 Michel Lespinasse 2013-05-07  240  	     adjustment != -RWSEM_ACTIVE_READ_BIAS))
fe6e674c6187d4 lib/rwsem.c                 Michel Lespinasse 2013-05-07  241  		sem = __rwsem_do_wake(sem, RWSEM_WAKE_ANY);
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  242  
ddb6c9b58a19ed lib/rwsem.c                 Thomas Gleixner   2010-02-24  243  	raw_spin_unlock_irq(&sem->wait_lock);
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  244  
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  245  	/* wait to be given the lock */
f7dd1cee9a4e2b lib/rwsem.c                 Michel Lespinasse 2013-05-07  246  	while (true) {
f7dd1cee9a4e2b lib/rwsem.c                 Michel Lespinasse 2013-05-07  247  		set_task_state(tsk, TASK_UNINTERRUPTIBLE);
a8618a0e8a06f7 lib/rwsem.c                 Michel Lespinasse 2010-08-09  248  		if (!waiter.task)
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  249  			break;
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  250  		schedule();
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  251  	}
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  252  
73105994c57d06 kernel/locking/rwsem-xadd.c Davidlohr Bueso   2015-01-25  253  	__set_task_state(tsk, TASK_RUNNING);
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  254  	return sem;
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  255  }
db0e716a151217 kernel/locking/rwsem-xadd.c Davidlohr Bueso   2014-09-11  256  EXPORT_SYMBOL(rwsem_down_read_failed);
^1da177e4c3f41 lib/rwsem.c                 Linus Torvalds    2005-04-16  257  

:::::: The code at line 239 was first introduced by commit
:::::: 25c39325968bbcebe6cd2a1991228c9dfb48d655 rwsem: do not block readers at head of queue if other readers are active

:::::: TO: Michel Lespinasse <walken@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
