Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CCB1CD15
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 03:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740799144; cv=none; b=DJMaJvyTKDw6uXoHGDIebSgcICcgRobs1WPl2gC2djkoiC2omuSZEgB+IDuwiP8uOYxxypuV7yd8eRabzvvdsbOh+pL1xEQK/v9aWkTVwd9UzqRACSeQ8lcJdlISQFFCThIxa7XJRVJVYc2oHhZbJFtra/sa6i2sK5lc6SJWsus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740799144; c=relaxed/simple;
	bh=pxyq3dwcBIyJUQrFp/iwMgRS6mSUgWpt2RBF/vd5QEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vELE5HF7+86djk+HDWqxWVRdkiqQKrjapjr4KLdyC9JgA+wq1LGOCQUeUcwso7ABtzYTuG+LGdphOdvtxs+oWRx3SBrEitcEC6jidYSOIDcprLlLz26uPt9Vwp3kv6z/cMQvi3citpxFqfnB5gSC5PQUS9ku2BY9tcJLqBzIn2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwoxHSQn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwoxHSQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740799142; x=1772335142;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pxyq3dwcBIyJUQrFp/iwMgRS6mSUgWpt2RBF/vd5QEg=;
  b=FwoxHSQnocmztvQEzO0rvfFF7XeY0tiUA0YiZWFuRwUhlk1NqhM6NiyH
   ZCBN/hDkN3Hi9j4rwoH7h77TXTIgXaYd741eT+7+y1USiFqkklhZl3Tvx
   LS3O9EwKeEvxZ3WHlUHUcVcH49ogzdJdjzSTHiPp0fmpZYBg77gnLRaoa
   6i9j2iJjGGY7kGf1i/WltXa1+A0dLsCxK7moLTK5Uip7Tf9F8JkEjnW9o
   Ltn2/+UwUZDXFUwwkQB/qvuFhAsVMSUDPZOtzLjnMCDLiCbjsdZPRUax9
   k36SN9CVi68c2sSNuZ5QcDc5b1IB8vHAbdFi5Q8ml+LDSjyVt6YjfruDn
   A==;
X-CSE-ConnectionGUID: EILC0PqBSgCmvyMWTbKQ3w==
X-CSE-MsgGUID: 6hDEJ9rdQ/WXauCTMjHUKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45522827"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="45522827"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 19:19:01 -0800
X-CSE-ConnectionGUID: xtVa+UzqQtehBvZmbq1N/g==
X-CSE-MsgGUID: byx0bFf6QASzqcy+a/XyVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117360200"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 28 Feb 2025 19:18:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toDNS-000Fni-0N;
	Sat, 01 Mar 2025 03:18:58 +0000
Date: Sat, 1 Mar 2025 11:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:futex/scope 17/18] kernel/futex/waitwake.c:404:
 warning: expecting prototype for __futex_wait_multiple_setup(). Prototype
 was for futex_wait_multiple_setup() instead
Message-ID: <202503011156.PVie36zb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git futex/scope
head:   50063817f6e71b787d3ba96cca9d2fff7b3ea7ff
commit: 07c5880a60a9773964daf0341bb41604efa8cf49 [17/18] futex: Untangle and naming
config: arc-randconfig-001-20250301 (https://download.01.org/0day-ci/archive/20250301/202503011156.PVie36zb-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011156.PVie36zb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503011156.PVie36zb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/futex/waitwake.c:343: warning: expecting prototype for futex_wait_queue(). Prototype was for futex_do_wait() instead
>> kernel/futex/waitwake.c:404: warning: expecting prototype for __futex_wait_multiple_setup(). Prototype was for futex_wait_multiple_setup() instead
   kernel/futex/waitwake.c:594: warning: Function parameter or struct member 'task' not described in 'futex_wait_setup'
--
>> kernel/futex/core.c:328: warning: Function parameter or struct member 'fph' not described in '__futex_hash'
   kernel/futex/core.c:328: warning: expecting prototype for futex_hash(). Prototype was for __futex_hash() instead


vim +404 kernel/futex/waitwake.c

bf69bad38cf63d9 André Almeida             2021-09-23  386  
bf69bad38cf63d9 André Almeida             2021-09-23  387  /**
714486110707822 Sebastian Andrzej Siewior 2025-02-25  388   * __futex_wait_multiple_setup - Prepare to wait and enqueue multiple futexes
bf69bad38cf63d9 André Almeida             2021-09-23  389   * @vs:		The futex list to wait on
bf69bad38cf63d9 André Almeida             2021-09-23  390   * @count:	The size of the list
bf69bad38cf63d9 André Almeida             2021-09-23  391   * @woken:	Index of the last woken futex, if any. Used to notify the
bf69bad38cf63d9 André Almeida             2021-09-23  392   *		caller that it can return this index to userspace (return parameter)
bf69bad38cf63d9 André Almeida             2021-09-23  393   *
bf69bad38cf63d9 André Almeida             2021-09-23  394   * Prepare multiple futexes in a single step and enqueue them. This may fail if
bf69bad38cf63d9 André Almeida             2021-09-23  395   * the futex list is invalid or if any futex was already awoken. On success the
bf69bad38cf63d9 André Almeida             2021-09-23  396   * task is ready to interruptible sleep.
bf69bad38cf63d9 André Almeida             2021-09-23  397   *
bf69bad38cf63d9 André Almeida             2021-09-23  398   * Return:
bf69bad38cf63d9 André Almeida             2021-09-23  399   *  -  1 - One of the futexes was woken by another thread
bf69bad38cf63d9 André Almeida             2021-09-23  400   *  -  0 - Success
bf69bad38cf63d9 André Almeida             2021-09-23  401   *  - <0 - -EFAULT, -EWOULDBLOCK or -EINVAL
bf69bad38cf63d9 André Almeida             2021-09-23  402   */
07c5880a60a9773 Peter Zijlstra            2025-02-28  403  int futex_wait_multiple_setup(struct futex_vector *vs, int count, int *woken)
bf69bad38cf63d9 André Almeida             2021-09-23 @404  {
bf69bad38cf63d9 André Almeida             2021-09-23  405  	bool retry = false;
bf69bad38cf63d9 André Almeida             2021-09-23  406  	int ret, i;
bf69bad38cf63d9 André Almeida             2021-09-23  407  	u32 uval;
bf69bad38cf63d9 André Almeida             2021-09-23  408  
07c5880a60a9773 Peter Zijlstra            2025-02-28  409  	/*
07c5880a60a9773 Peter Zijlstra            2025-02-28  410  	 * Make sure to have a reference on the private_hash such that we
07c5880a60a9773 Peter Zijlstra            2025-02-28  411  	 * don't block on rehash after changing the task state below.
07c5880a60a9773 Peter Zijlstra            2025-02-28  412  	 */
07c5880a60a9773 Peter Zijlstra            2025-02-28  413  	guard(private_hash)();
07c5880a60a9773 Peter Zijlstra            2025-02-28  414  
bf69bad38cf63d9 André Almeida             2021-09-23  415  	/*
bf69bad38cf63d9 André Almeida             2021-09-23  416  	 * Enqueuing multiple futexes is tricky, because we need to enqueue
bf69bad38cf63d9 André Almeida             2021-09-23  417  	 * each futex on the list before dealing with the next one to avoid
bf69bad38cf63d9 André Almeida             2021-09-23  418  	 * deadlocking on the hash bucket. But, before enqueuing, we need to
bf69bad38cf63d9 André Almeida             2021-09-23  419  	 * make sure that current->state is TASK_INTERRUPTIBLE, so we don't
bf69bad38cf63d9 André Almeida             2021-09-23  420  	 * lose any wake events, which cannot be done before the get_futex_key
bf69bad38cf63d9 André Almeida             2021-09-23  421  	 * of the next key, because it calls get_user_pages, which can sleep.
bf69bad38cf63d9 André Almeida             2021-09-23  422  	 * Thus, we fetch the list of futexes keys in two steps, by first
bf69bad38cf63d9 André Almeida             2021-09-23  423  	 * pinning all the memory keys in the futex key, and only then we read
bf69bad38cf63d9 André Almeida             2021-09-23  424  	 * each key and queue the corresponding futex.
bf69bad38cf63d9 André Almeida             2021-09-23  425  	 *
bf69bad38cf63d9 André Almeida             2021-09-23  426  	 * Private futexes doesn't need to recalculate hash in retry, so skip
bf69bad38cf63d9 André Almeida             2021-09-23  427  	 * get_futex_key() when retrying.
bf69bad38cf63d9 André Almeida             2021-09-23  428  	 */
bf69bad38cf63d9 André Almeida             2021-09-23  429  retry:
bf69bad38cf63d9 André Almeida             2021-09-23  430  	for (i = 0; i < count; i++) {
5694289ce183bc3 peterz@infradead.org      2023-09-21  431  		if (!(vs[i].w.flags & FLAGS_SHARED) && retry)
bf69bad38cf63d9 André Almeida             2021-09-23  432  			continue;
bf69bad38cf63d9 André Almeida             2021-09-23  433  
bf69bad38cf63d9 André Almeida             2021-09-23  434  		ret = get_futex_key(u64_to_user_ptr(vs[i].w.uaddr),
3b63a55f498b763 peterz@infradead.org      2023-09-21  435  				    vs[i].w.flags,
bf69bad38cf63d9 André Almeida             2021-09-23  436  				    &vs[i].q.key, FUTEX_READ);
bf69bad38cf63d9 André Almeida             2021-09-23  437  
bf69bad38cf63d9 André Almeida             2021-09-23  438  		if (unlikely(ret))
bf69bad38cf63d9 André Almeida             2021-09-23  439  			return ret;
bf69bad38cf63d9 André Almeida             2021-09-23  440  	}
bf69bad38cf63d9 André Almeida             2021-09-23  441  
f5d39b020809146 Peter Zijlstra            2022-08-22  442  	set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
bf69bad38cf63d9 André Almeida             2021-09-23  443  
bf69bad38cf63d9 André Almeida             2021-09-23  444  	for (i = 0; i < count; i++) {
bf69bad38cf63d9 André Almeida             2021-09-23  445  		u32 __user *uaddr = (u32 __user *)(unsigned long)vs[i].w.uaddr;
bf69bad38cf63d9 André Almeida             2021-09-23  446  		struct futex_q *q = &vs[i].q;
3b63a55f498b763 peterz@infradead.org      2023-09-21  447  		u32 val = vs[i].w.val;
bf69bad38cf63d9 André Almeida             2021-09-23  448  
570abb7b97afdc8 Peter Zijlstra            2025-02-20  449  		if (1) {
bd3ab435510bfed Peter Zijlstra            2025-02-20  450  			CLASS(hb, hb)(&q->key);
570abb7b97afdc8 Peter Zijlstra            2025-02-20  451  
d4ec02bf5600038 Peter Zijlstra            2025-02-20  452  			futex_q_lock(q, hb);
bf69bad38cf63d9 André Almeida             2021-09-23  453  			ret = futex_get_value_locked(&uval, uaddr);
bf69bad38cf63d9 André Almeida             2021-09-23  454  
bf69bad38cf63d9 André Almeida             2021-09-23  455  			if (!ret && uval == val) {
bf69bad38cf63d9 André Almeida             2021-09-23  456  				/*
bf69bad38cf63d9 André Almeida             2021-09-23  457  				 * The bucket lock can't be held while dealing with the
bf69bad38cf63d9 André Almeida             2021-09-23  458  				 * next futex. Queue each futex at this moment so hb can
bf69bad38cf63d9 André Almeida             2021-09-23  459  				 * be unlocked.
bf69bad38cf63d9 André Almeida             2021-09-23  460  				 */
5e0e02f0d7e52cf Jens Axboe                2025-01-15  461  				futex_queue(q, hb, current);
bf69bad38cf63d9 André Almeida             2021-09-23  462  				continue;
bf69bad38cf63d9 André Almeida             2021-09-23  463  			}
bf69bad38cf63d9 André Almeida             2021-09-23  464  
bf69bad38cf63d9 André Almeida             2021-09-23  465  			futex_q_unlock(hb);
570abb7b97afdc8 Peter Zijlstra            2025-02-20  466  		}
bf69bad38cf63d9 André Almeida             2021-09-23  467  		__set_current_state(TASK_RUNNING);
bf69bad38cf63d9 André Almeida             2021-09-23  468  
bf69bad38cf63d9 André Almeida             2021-09-23  469  		/*
bf69bad38cf63d9 André Almeida             2021-09-23  470  		 * Even if something went wrong, if we find out that a futex
bf69bad38cf63d9 André Almeida             2021-09-23  471  		 * was woken, we don't return error and return this index to
bf69bad38cf63d9 André Almeida             2021-09-23  472  		 * userspace
bf69bad38cf63d9 André Almeida             2021-09-23  473  		 */
e9a56c9325ef28d Jens Axboe                2023-06-13  474  		*woken = futex_unqueue_multiple(vs, i);
bf69bad38cf63d9 André Almeida             2021-09-23  475  		if (*woken >= 0)
bf69bad38cf63d9 André Almeida             2021-09-23  476  			return 1;
bf69bad38cf63d9 André Almeida             2021-09-23  477  
bf69bad38cf63d9 André Almeida             2021-09-23  478  		if (ret) {
bf69bad38cf63d9 André Almeida             2021-09-23  479  			/*
bf69bad38cf63d9 André Almeida             2021-09-23  480  			 * If we need to handle a page fault, we need to do so
bf69bad38cf63d9 André Almeida             2021-09-23  481  			 * without any lock and any enqueued futex (otherwise
bf69bad38cf63d9 André Almeida             2021-09-23  482  			 * we could lose some wakeup). So we do it here, after
bf69bad38cf63d9 André Almeida             2021-09-23  483  			 * undoing all the work done so far. In success, we
bf69bad38cf63d9 André Almeida             2021-09-23  484  			 * retry all the work.
bf69bad38cf63d9 André Almeida             2021-09-23  485  			 */
bf69bad38cf63d9 André Almeida             2021-09-23  486  			if (get_user(uval, uaddr))
bf69bad38cf63d9 André Almeida             2021-09-23  487  				return -EFAULT;
bf69bad38cf63d9 André Almeida             2021-09-23  488  
bf69bad38cf63d9 André Almeida             2021-09-23  489  			retry = true;
bf69bad38cf63d9 André Almeida             2021-09-23  490  			goto retry;
bf69bad38cf63d9 André Almeida             2021-09-23  491  		}
bf69bad38cf63d9 André Almeida             2021-09-23  492  
bf69bad38cf63d9 André Almeida             2021-09-23  493  		if (uval != val)
bf69bad38cf63d9 André Almeida             2021-09-23  494  			return -EWOULDBLOCK;
bf69bad38cf63d9 André Almeida             2021-09-23  495  	}
bf69bad38cf63d9 André Almeida             2021-09-23  496  
bf69bad38cf63d9 André Almeida             2021-09-23  497  	return 0;
bf69bad38cf63d9 André Almeida             2021-09-23  498  }
bf69bad38cf63d9 André Almeida             2021-09-23  499  

:::::: The code at line 404 was first introduced by commit
:::::: bf69bad38cf63d980e8a603f8d1bd1f85b5ed3d9 futex: Implement sys_futex_waitv()

:::::: TO: André Almeida <andrealmeid@collabora.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
