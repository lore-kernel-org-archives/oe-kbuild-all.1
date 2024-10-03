Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1942313D8AC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 10:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727952208; cv=none; b=kt+gphFnF2kkNIE66QmDyym5Zw1m0nU1nix+9VsNOzdNohdI9VvGIe0XqxKsVNvvYUuRfgtd4/PFJfzgKl8D5Wr9Wh1y9RzrXo45Qdnk3q7PeokWTtTiavNSKejDgDmpdjtg1NKVXY7AFQ5crsshhtDqoUc9X3neK0emSDatxTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727952208; c=relaxed/simple;
	bh=UNd50ijYKij2cb5UonBE2PQhYjnHfbeZtoGjJ9R5MRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vj9VXcdsXabre+pYEvwNAfn5UDmEpSQiwTnPJrHNR1Ut1FVmVo8uMDZ36JhugbR81yOQGLtUSdhepFwpvj+b/5gtQFWwLDpicjyexOscOZfaYMxIQHoD/tKXi35K+2JcguMgOMSNPR8I1kP2pPPMw/G6BJQqG+V6yt4N9vA9zlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQlvpuN0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQlvpuN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727952206; x=1759488206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UNd50ijYKij2cb5UonBE2PQhYjnHfbeZtoGjJ9R5MRY=;
  b=aQlvpuN0RSjtLtLxpmU9dGDoaG7JNA0yJZaHp0yxAa5Iiv/9ERh3QBeC
   kZi2jREWH+wvNcamlaiwJWLX2ChtFsdpa8clww+9WqEvaLi2ZJlZVp98r
   T1A0ZhPNzYFOkcUQLLu90zS1Mke3XYewLwA504zYhOnE351Gp57nYrcfY
   FLDn5MMSD0s+ybX+J/uQhEyPKFR0+LZk3Guq8RJuuZofx3Tkg3DvcuC9c
   aL4BODdXhzehwXACYhB6//vAByiHpUT5+1BS4J5YBQwFisJFg+93gpXuI
   +eCXVb9+TvP0tarGyEjQZqXNtROzeAUwP+QP2JJf0H0aCW15WvOU+Ckkr
   w==;
X-CSE-ConnectionGUID: +rvUzls2QqCxwrWed+cJEw==
X-CSE-MsgGUID: quVduHpiRUSEQ3qBit7BRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="44668302"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="44668302"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:43:26 -0700
X-CSE-ConnectionGUID: ALVTlp+4Qca47wMF5Pqarg==
X-CSE-MsgGUID: HgRwRol/SzekDLB/nA7+3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="79156284"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Oct 2024 03:43:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swJIo-0000Im-1G;
	Thu, 03 Oct 2024 10:43:22 +0000
Date: Thu, 3 Oct 2024 18:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rt 4/23317] kernel/locking/rwsem-xadd.c:239:13:
 warning: comparison between signed and unsigned integer expressions
Message-ID: <202410031844.JJLc84Pb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt
head:   43fa17560b718bc4454ab8d291b6995033041456
commit: d8e75c1c75f53e59ea92f6dc539f418b1435defa [4/23317] sparc64: use generic rwsem spinlocks rt
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20241003/202410031844.JJLc84Pb-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031844.JJLc84Pb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031844.JJLc84Pb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/bug.h:20:0,
                    from include/linux/bug.h:4,
                    from include/linux/thread_info.h:11,
                    from include/asm-generic/preempt.h:4,
                    from arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:59,
                    from include/linux/spinlock.h:50,
                    from include/linux/rwsem.h:15,
                    from kernel/locking/rwsem-xadd.c:12:
   include/linux/ktime.h: In function 'ktime_divns':
   include/asm-generic/bug.h:145:47: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    #define BUG_ON(condition) do { if (condition) ; } while (0)
                                                  ^
   include/linux/ktime.h:176:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(div < 0);
     ^~~~~~
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/rwsem.h:10,
                    from kernel/locking/rwsem-xadd.c:12:
   kernel/locking/rwsem-xadd.c: In function '__rwsem_do_wake':
   kernel/locking/rwsem-xadd.c:150:25: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
      if (unlikely(oldcount < RWSEM_WAITING_BIAS)) {
                            ^
   include/linux/compiler.h:166:42: note: in definition of macro 'unlikely'
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
