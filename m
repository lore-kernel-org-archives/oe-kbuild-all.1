Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4B5182A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 06:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710915124; cv=none; b=J73EK6ODDnD3D00hvMxYTWszfw67x+yhAgusaLAoeR0wVNKg7X5u4fy8MTK4N08rsP5mwJMVYMYkh9bHmf5aPkpCSvFNGVUy8LYGsygbNZArbwGuhuMm33rcsT/JpU0KUeqNTHlCyFxGFRXRv4N7PPqfO9hTxEXfWlWsEcpbwOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710915124; c=relaxed/simple;
	bh=enFIgocbbImfpNyqWv1oj5ItcgheJ0Xkl+KGbxlo4gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=akZixZO6ZBRRglpQC58e7LAWMF39XVqTGvJCpYXvpHyFBXSUrmRZNmTdR/2dL/rHrfVcwwbG9xggKcPLXmzQtxh4JO4aqUoVBKdkd1moMpYeJlt+gl07EZ0VS+HWEKOG78BvD+66MtkBNq3gFtBOxMJmV37esBSCtLXC1YvNiSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e33JliGL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e33JliGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710915122; x=1742451122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=enFIgocbbImfpNyqWv1oj5ItcgheJ0Xkl+KGbxlo4gc=;
  b=e33JliGLYkjZEX+TvFgVbyYuN+BmmzP3nJJlC9hNRXyRQNk9RseMoF4l
   NFtI6a3EWcCvyG9CUhFTqJbacYYCCIA94W7yrHEEP7Qy7S8Q6utEXzIof
   w8TGOxPKllhVnK134e6O+YVxGy9KPVeAlyUSSyvKmUxTLomLfXz+jMouv
   s8H1fmV1n75XRg3ySVBoVJm5e63SKecUN87WUamkIh1g807EIMPRnVMLe
   j6a9jChEosbb6nrFwlXsJphfzpDqFphJramswoO3oTxG5XLprptNUXtfq
   CWTLoS8W1n8w3IU6AAhQ/ywWgs/3T5AUL0DyPb8R9LtoPMFRsp6E3MEXl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5942303"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5942303"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 23:12:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="18776970"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Mar 2024 23:12:00 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmpB8-000IOh-0W;
	Wed, 20 Mar 2024 06:11:58 +0000
Date: Wed, 20 Mar 2024 14:11:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:b-4.4-st50-rt48 394/395] kernel/locking/rtmutex.c:2319:5:
 warning: no previous prototype for '__rt_mutex_start_proxy_lock'
Message-ID: <202403201429.aAuyBZZw-lkp@intel.com>
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
commit: 3ca00e77c0c6e33ce420d4c7251efd4b9730bccf [394/395] futex: fixup wait_lock/pi_lock locking rule changes
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240320/202403201429.aAuyBZZw-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403201429.aAuyBZZw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403201429.aAuyBZZw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arc/include/asm/bug.h:32,
                    from include/linux/bug.h:4,
                    from include/linux/thread_info.h:11,
                    from include/asm-generic/preempt.h:4,
                    from arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:63,
                    from include/linux/spinlock.h:50,
                    from kernel/locking/rtmutex.c:18:
   include/linux/cpumask.h: In function 'cpumask_check':
   include/linux/cpumask.h:117:26: warning: comparison of integer expressions of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
     117 |         WARN_ON_ONCE(cpu >= nr_cpumask_bits);
         |                          ^~
   include/asm-generic/bug.h:112:34: note: in definition of macro 'WARN_ON_ONCE'
     112 |         int __ret_warn_once = !!(condition);                    \
         |                                  ^~~~~~~~~
   In file included from include/linux/linkage.h:4,
                    from include/linux/preempt.h:9:
   include/linux/highmem.h: In function 'kmap_atomic_idx_push':
   include/linux/highmem.h:101:20: warning: comparison of integer expressions of different signedness: 'int' and 'long unsigned int' [-Wsign-compare]
     101 |         BUG_ON(idx >= KM_TYPE_NR);
         |                    ^~
   include/linux/compiler.h:182:45: note: in definition of macro 'unlikely'
     182 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/highmem.h:101:9: note: in expansion of macro 'BUG_ON'
     101 |         BUG_ON(idx >= KM_TYPE_NR);
         |         ^~~~~~
   In file included from include/linux/blkdev.h:14,
                    from kernel/locking/rtmutex.c:25:
   include/linux/pagemap.h: In function 'fault_in_multipages_readable':
   include/linux/pagemap.h:632:23: warning: variable 'c' set but not used [-Wunused-but-set-variable]
     632 |         volatile char c;
         |                       ^
   In file included from include/linux/blkdev.h:18:
   include/linux/bio.h: In function 'bio_next_split':
   include/linux/bio.h:424:21: warning: comparison of integer expressions of different signedness: 'int' and 'unsigned int' [-Wsign-compare]
     424 |         if (sectors >= bio_sectors(bio))
         |                     ^~
   kernel/locking/rtmutex.c: At top level:
>> kernel/locking/rtmutex.c:2319:5: warning: no previous prototype for '__rt_mutex_start_proxy_lock' [-Wmissing-prototypes]
    2319 | int __rt_mutex_start_proxy_lock(struct rt_mutex *lock,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:1669: warning: No description found for parameter 'ww_ctx'
   kernel/locking/rtmutex.c:2129: warning: Excess function parameter 'detect_deadlock' description in 'rt_mutex_lock_killable'
   kernel/locking/rtmutex.c:2203: warning: No description found for parameter 'lock'
   kernel/locking/rtmutex.c:2203: warning: No description found for parameter 'wake_q'
   kernel/locking/rtmutex.c:2203: warning: No description found for parameter 'wq_sleeper'
   kernel/locking/rtmutex.c:2259: warning: No description found for parameter 'name'


vim +/__rt_mutex_start_proxy_lock +2319 kernel/locking/rtmutex.c

  2299	
  2300	/**
  2301	 * __rt_mutex_start_proxy_lock() - Start lock acquisition for another task
  2302	 * @lock:		the rt_mutex to take
  2303	 * @waiter:		the pre-initialized rt_mutex_waiter
  2304	 * @task:		the task to prepare
  2305	 *
  2306	 * Starts the rt_mutex acquire; it enqueues the @waiter and does deadlock
  2307	 * detection. It does not wait, see rt_mutex_wait_proxy_lock() for that.
  2308	 *
  2309	 * NOTE: does _NOT_ remove the @waiter on failure; must either call
  2310	 * rt_mutex_wait_proxy_lock() or rt_mutex_cleanup_proxy_lock() after this.
  2311	 *
  2312	 * Returns:
  2313	 *  0 - task blocked on lock
  2314	 *  1 - acquired the lock for task, caller should wake it up
  2315	 * <0 - error
  2316	 *
  2317	 * Special API call for PI-futex support.
  2318	 */
> 2319	int __rt_mutex_start_proxy_lock(struct rt_mutex *lock,
  2320				      struct rt_mutex_waiter *waiter,
  2321				      struct task_struct *task)
  2322	{
  2323		int ret;
  2324	
  2325		lockdep_assert_held(&lock->wait_lock);
  2326	
  2327		if (try_to_take_rt_mutex(lock, task, NULL))
  2328			return 1;
  2329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
