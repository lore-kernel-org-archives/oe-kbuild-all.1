Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0341D1EF372
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 23:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746227980; cv=none; b=rPPfr5S7rnu8AXGpG0DuiaMP8VTHVBi/rqwk0MR4xDdXEVj6iEIie4mlsGl/3XKH9nEKHd0P3MVCDScrbdO9bEol/qqt8IbdpTzh3zkS0eVMN1pJ2O8z8a3/H/SJhg1ELE+dFFCHXpMh0Z8Kf+y3RZLRhVICqJZo+BunRk3LzYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746227980; c=relaxed/simple;
	bh=Gr07U6F5sYLMdafMNVT6aTa4Zewarh3QEcwvb8VymnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KMcV7J86QP8kXCaHiNW5TX7dPsBHLNEGq5lcp+8iqYlr7RrHZ0EDDcHKsQM00c+L3ifer91Qa93XzWUZujsINyKOSo6cO6irymnVS9cUnrZsnUQJvF1uWyW4n7Bhu2re+DfV5R6ipK9g+ZFEbq8gUhfmCLUSCYDEZ0H6Qk7EsnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZInF5FG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZInF5FG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746227978; x=1777763978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gr07U6F5sYLMdafMNVT6aTa4Zewarh3QEcwvb8VymnQ=;
  b=OZInF5FGdSJEXRj+mUyTSkNKSwaI3ElVcXEOiJYo+Mt9T9O7c9EaUS+1
   Ms46wc2zyy713RcQ5xJgPQPWuxtZ8FamptuB2o7UbbbztCilFV4JX6S4c
   6r8HQjruFEV+tArdmxB6D69vX1Vkdn+WT20NtXENBzU9fxEWBVnLLDi/M
   hSUOJe8M0STNHMLMSUHWk1sZUJdMUgU9vmUgCdNDwlLWyEN92tKQrbQ2m
   cST/MVci1dqDlby6SzdrCW9764bUmJC4RhDAubTM321Wsn62Fjn4iRhMB
   DLnPkZ0m5Y9fK8zzzohfJSrLWqFG6K9nzpTR1K59SOPlr/rRO1Y6W5Gej
   w==;
X-CSE-ConnectionGUID: ADdlCoPaQPChluONqfNC6A==
X-CSE-MsgGUID: JNSRSG+1STmhlyj4bHsynA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="51727485"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="51727485"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 16:19:37 -0700
X-CSE-ConnectionGUID: osVuMvxIRGyeMBZbIcbA9w==
X-CSE-MsgGUID: /togEcu3R2OJ7Sw+MIs2Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="134722560"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 May 2025 16:19:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAzfJ-000553-2I;
	Fri, 02 May 2025 23:19:33 +0000
Date: Sat, 3 May 2025 07:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/futex 15/23] kernel/futex/core.c:1461:8:
 error: 'custom' undeclared; did you mean 'ustat'?
Message-ID: <202505030751.ZSHsrSlB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/futex
head:   de70d23cda670cd8bd50d96c6a7acf832969b55e
commit: ac10690394df3e02848a669dcab8a6eaf1210a38 [15/23] futex: Allow to make the private hash immutable
config: s390-randconfig-002-20250503 (https://download.01.org/0day-ci/archive/20250503/202505030751.ZSHsrSlB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030751.ZSHsrSlB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030751.ZSHsrSlB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/rwonce.h:29,
                    from include/linux/compiler.h:390,
                    from include/asm-generic/div64.h:27,
                    from ./arch/s390/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/compat.h:10,
                    from kernel/futex/core.c:34:
   include/linux/futex.h: In function 'futex_mm_init':
   include/linux/rcupdate.h:555:36: error: dereferencing pointer to incomplete type 'struct futex_private_hash'
    #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
                                       ^~~~
   include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
     *(volatile typeof(x) *)&(x) = (val);    \
                                    ^~~
   arch/s390/include/asm/barrier.h:44:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(*p, v);      \
     ^~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:596:3: note: in expansion of macro 'smp_store_release'
      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:596:25: note: in expansion of macro 'RCU_INITIALIZER'
      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
                            ^~~~~~~~~~~~~~~
   include/linux/futex.h:88:2: note: in expansion of macro 'rcu_assign_pointer'
     rcu_assign_pointer(mm->futex_phash, NULL);
     ^~~~~~~~~~~~~~~~~~
   kernel/futex/core.c: In function 'futex_hash_allocate':
>> kernel/futex/core.c:1461:8: error: 'custom' undeclared (first use in this function); did you mean 'ustat'?
       if (custom)
           ^~~~~~
           ustat
   kernel/futex/core.c:1461:8: note: each undeclared identifier is reported only once for each function it appears in


vim +1461 kernel/futex/core.c

ac10690394df3e Sebastian Andrzej Siewior 2025-04-16  1445  
ac10690394df3e Sebastian Andrzej Siewior 2025-04-16  1446  static int futex_hash_allocate(unsigned int hash_slots, unsigned int flags)
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1447  {
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1448  	struct mm_struct *mm = current->mm;
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1449  	struct futex_private_hash *fph;
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1450  	int i;
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1451  
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1452  	if (hash_slots && (hash_slots == 1 || !is_power_of_2(hash_slots)))
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1453  		return -EINVAL;
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1454  
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1455  	/*
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1456  	 * Once we've disabled the global hash there is no way back.
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1457  	 */
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1458  	scoped_guard(rcu) {
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1459  		fph = rcu_dereference(mm->futex_phash);
ac10690394df3e Sebastian Andrzej Siewior 2025-04-16  1460  		if (fph && (!fph->hash_mask || fph->immutable)) {
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16 @1461  			if (custom)
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1462  				return -EBUSY;
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1463  			return 0;
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1464  		}
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1465  	}
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1466  
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1467  	fph = kvzalloc(struct_size(fph, queues, hash_slots), GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1468  	if (!fph)
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1469  		return -ENOMEM;
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1470  
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1471  	rcuref_init(&fph->users, 1);
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1472  	fph->hash_mask = hash_slots ? hash_slots - 1 : 0;
ac10690394df3e Sebastian Andrzej Siewior 2025-04-16  1473  	fph->custom = !!(flags & FH_CUSTOM);
ac10690394df3e Sebastian Andrzej Siewior 2025-04-16  1474  	fph->immutable = !!(flags & FH_IMMUTABLE);
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1475  	fph->mm = mm;
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1476  
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1477  	for (i = 0; i < hash_slots; i++)
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1478  		futex_hash_bucket_init(&fph->queues[i], fph);
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1479  
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1480  	if (custom) {
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1481  		/*
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1482  		 * Only let prctl() wait / retry; don't unduly delay clone().
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1483  		 */
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1484  again:
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1485  		wait_var_event(mm, futex_pivot_pending(mm));
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1486  	}
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1487  
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1488  	scoped_guard(mutex, &mm->futex_hash_lock) {
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1489  		struct futex_private_hash *free __free(kvfree) = NULL;
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1490  		struct futex_private_hash *cur, *new;
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1491  
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1492  		cur = rcu_dereference_protected(mm->futex_phash,
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1493  						lockdep_is_held(&mm->futex_hash_lock));
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1494  		new = mm->futex_phash_new;
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1495  		mm->futex_phash_new = NULL;
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1496  
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1497  		if (fph) {
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1498  			if (cur && !new) {
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1499  				/*
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1500  				 * If we have an existing hash, but do not yet have
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1501  				 * allocated a replacement hash, drop the initial
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1502  				 * reference on the existing hash.
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1503  				 */
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1504  				futex_private_hash_put(cur);
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1505  			}
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1506  
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1507  			if (new) {
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1508  				/*
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1509  				 * Two updates raced; throw out the lesser one.
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1510  				 */
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1511  				if (futex_hash_less(new, fph)) {
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1512  					free = new;
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1513  					new = fph;
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1514  				} else {
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1515  					free = fph;
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1516  				}
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1517  			} else {
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1518  				new = fph;
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1519  			}
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1520  			fph = NULL;
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1521  		}
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1522  
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1523  		if (new) {
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1524  			/*
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1525  			 * Will set mm->futex_phash_new on failure;
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1526  			 * futex_private_hash_get() will try again.
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1527  			 */
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1528  			if (!__futex_pivot_hash(mm, new) && custom)
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1529  				goto again;
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1530  		}
890f0df403dfc8 Sebastian Andrzej Siewior 2025-04-16  1531  	}
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1532  	return 0;
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1533  }
6fa62f9d32ef07 Sebastian Andrzej Siewior 2025-04-16  1534  

:::::: The code at line 1461 was first introduced by commit
:::::: 890f0df403dfc8ca1cb41c9db5c98ff210245683 futex: Allow to resize the private local hash

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
