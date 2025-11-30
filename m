Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EC3298CA6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 16:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764519785; cv=none; b=Vbr+BknKMCNEd7MitfScHaIpB23EiwjEP/ZaD9O2hEfF1caU7e9VLmFMF3QT1CrLg6wM8bIaTybwND3k04RL2jAxPwspm11YFuMEggFs70fJbw+R7UIj9NAQA0ehrAdSxXq0JpphWuhbC8cbTFFNEYpipMfBatG8UgRw5nHvebo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764519785; c=relaxed/simple;
	bh=nHaYhcpTmZuFPKf0WTwtlhyqBUVFg9c1CIDuIDn6dUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=akFKX0/C48OYwBEQtZ3y3wg7O5NevDFK/iHnoTCwYp+e+YUefHo/u4UKhsRWDdwyHzuePnpehkb2G3tXJlnCxqrU/6aQjSi2Vs2M4qwCdeBsFFDpWKi94DcmHFqVurD7FndwP2J5nRwGMzABCyHKtGBC1Hu/DV1GaiMfZv4/+l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eai38viY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eai38viY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764519784; x=1796055784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nHaYhcpTmZuFPKf0WTwtlhyqBUVFg9c1CIDuIDn6dUA=;
  b=eai38viYV7pXv+L1Uqv5ZAb05xjLlss6DvQ6eYLoqS4NZ3uF+iEweTS3
   0cxhB7bRWSrKZ7ubBDOasRDY9ishr3r1W/38TZQVj3Dt54PyJOPnaeWln
   mn3kG5P/1zcWdzJPRi6n8jd0IMJlzEf/O1ym/7qHMpsLgpdmd6qeU39j1
   DZj+YPouX5miF23BTzV1+kKwejmRltQVe4sA5sag2suojKR1DdqZqEfnu
   179x31zR8A5SDHna1TwGkNZ5NtbqsZCUjbPdg+rOOMJwMTvB9CejfjKya
   fgJDE9x6DlBHS7Yl8Wh0e9Q1wYOJUxjps33uCBez4eNmgqHLPGH20YUl9
   w==;
X-CSE-ConnectionGUID: ZJzKzZXkSbi++O84UcpfIQ==
X-CSE-MsgGUID: Ca25NKJBQlO1AtVg1siX5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="89113741"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="89113741"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 08:23:03 -0800
X-CSE-ConnectionGUID: 16W0CBnHQjye5H+OBZ05PQ==
X-CSE-MsgGUID: JQTvTM6RTSajS8KijiKEZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="217220965"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Nov 2025 08:23:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPkCR-00000000841-0kxU;
	Sun, 30 Nov 2025 16:22:59 +0000
Date: Mon, 1 Dec 2025 00:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:rqspinlock/freeze 1/1] kernel/bpf/rqspinlock.c:200:21:
 warning: 'check_timeout' defined but not used
Message-ID: <202512010056.jGSagCm9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux rqspinlock/freeze
head:   ecbeea85f52f8ff53a69932204c687c4de11f1c9
commit: ecbeea85f52f8ff53a69932204c687c4de11f1c9 [1/1] rqspinlock: Back propagate deadlock signals from successors
config: arm64-randconfig-001-20251130 (https://download.01.org/0day-ci/archive/20251201/202512010056.jGSagCm9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512010056.jGSagCm9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512010056.jGSagCm9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/rqspinlock.c: In function 'resilient_tas_spin_lock':
   kernel/bpf/rqspinlock.c:304:43: error: macro "RES_CHECK_TIMEOUT" passed 4 arguments, but takes just 3
      if (RES_CHECK_TIMEOUT(ts, ret, ~0u, NULL))
                                              ^
   kernel/bpf/rqspinlock.c:304:7: error: 'RES_CHECK_TIMEOUT' undeclared (first use in this function); did you mean 'NET_LLC2_TIMEOUT'?
      if (RES_CHECK_TIMEOUT(ts, ret, ~0u, NULL))
          ^~~~~~~~~~~~~~~~~
          NET_LLC2_TIMEOUT
   kernel/bpf/rqspinlock.c:304:7: note: each undeclared identifier is reported only once for each function it appears in
   kernel/bpf/rqspinlock.c: In function 'resilient_queued_spin_lock_slowpath':
   kernel/bpf/rqspinlock.c:429:100: error: macro "RES_CHECK_TIMEOUT" passed 4 arguments, but takes just 3
      res_smp_cond_load_acquire(&lock->locked, !VAL || RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_MASK, NULL));
                                                                                                       ^
   In file included from include/linux/bpf.h:34,
                    from kernel/bpf/rqspinlock.c:18:
   kernel/bpf/rqspinlock.c:429:52: error: 'RES_CHECK_TIMEOUT' undeclared (first use in this function); did you mean 'NET_LLC2_TIMEOUT'?
      res_smp_cond_load_acquire(&lock->locked, !VAL || RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_MASK, NULL));
                                                       ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/rqspinlock.h:59:7: note: in definition of macro '__smp_cond_load_acquire_timewait'
      if (cond_expr)      \
          ^~~~~~~~~
   arch/arm64/include/asm/rqspinlock.h:89:41: note: in expansion of macro 'smp_cond_load_acquire_timewait'
    #define res_smp_cond_load_acquire(v, c) smp_cond_load_acquire_timewait(v, c, 0, 1)
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/rqspinlock.c:429:3: note: in expansion of macro 'res_smp_cond_load_acquire'
      res_smp_cond_load_acquire(&lock->locked, !VAL || RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_MASK, NULL));
      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/rqspinlock.c:559:69: error: macro "RES_CHECK_TIMEOUT" passed 4 arguments, but takes just 3
          (VAL != RES_HUNG_VAL && RES_CHECK_TIMEOUT(ts, ret, ~0u, node)));
                                                                        ^
   kernel/bpf/rqspinlock.c:607:1: error: macro "RES_CHECK_TIMEOUT" passed 4 arguments, but takes just 3
            RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_PENDING_MASK, node));
    ^       ~~~~~~~~~
   At top level:
>> kernel/bpf/rqspinlock.c:200:21: warning: 'check_timeout' defined but not used [-Wunused-function]
    static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
                        ^~~~~~~~~~~~~


vim +/check_timeout +200 kernel/bpf/rqspinlock.c

31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  199  
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15 @200  static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  201  				  struct rqspinlock_timeout *ts,
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  202  				  struct mcs_spinlock *node)
14c48ee8145275 Kumar Kartikeya Dwivedi 2025-03-15  203  {
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  204  	u64 prev = ts->cur;
5860f5ce479f42 Kumar Kartikeya Dwivedi 2025-11-28  205  	u64 time;
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  206  	int ret;
14c48ee8145275 Kumar Kartikeya Dwivedi 2025-03-15  207  
14c48ee8145275 Kumar Kartikeya Dwivedi 2025-03-15  208  	if (!ts->timeout_end) {
5860f5ce479f42 Kumar Kartikeya Dwivedi 2025-11-28  209  		if (check_deadlock_AA(lock))
5860f5ce479f42 Kumar Kartikeya Dwivedi 2025-11-28  210  			return -EDEADLK;
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  211  		/*
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  212  		 * Is the successor indicating to us that they have a deadlock?
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  213  		 */
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  214  		if (node && READ_ONCE(node->next)) {
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  215  			if (node->next->locked != RES_HUNG_VAL)
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  216  				return 0;
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  217  			return -ETIMEDOUT;
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  218  		}
5860f5ce479f42 Kumar Kartikeya Dwivedi 2025-11-28  219  		ts->cur = ktime_get_mono_fast_ns();
5860f5ce479f42 Kumar Kartikeya Dwivedi 2025-11-28  220  		ts->timeout_end = ts->cur + ts->duration;
14c48ee8145275 Kumar Kartikeya Dwivedi 2025-03-15  221  		return 0;
14c48ee8145275 Kumar Kartikeya Dwivedi 2025-03-15  222  	}
14c48ee8145275 Kumar Kartikeya Dwivedi 2025-03-15  223  
5860f5ce479f42 Kumar Kartikeya Dwivedi 2025-11-28  224  	time = ktime_get_mono_fast_ns();
14c48ee8145275 Kumar Kartikeya Dwivedi 2025-03-15  225  	if (time > ts->timeout_end)
14c48ee8145275 Kumar Kartikeya Dwivedi 2025-03-15  226  		return -ETIMEDOUT;
14c48ee8145275 Kumar Kartikeya Dwivedi 2025-03-15  227  
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  228  	/*
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  229  	 * A millisecond interval passed from last time? Trigger deadlock
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  230  	 * checks.
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  231  	 */
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  232  	if (prev + NSEC_PER_MSEC < time) {
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  233  		ts->cur = time;
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  234  		ret = check_deadlock_ABBA(lock, mask);
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  235  		if (ret)
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  236  			return ret;
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  237  		/*
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  238  		 * Is the successor indicating to us that they have a deadlock?
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  239  		 */
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  240  		if (node && READ_ONCE(node->next)) {
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  241  			if (node->next->locked != RES_HUNG_VAL)
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  242  				return 0;
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  243  			return -ETIMEDOUT;
ecbeea85f52f8f Kumar Kartikeya Dwivedi 2025-11-29  244  		}
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  245  	}
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  246  
14c48ee8145275 Kumar Kartikeya Dwivedi 2025-03-15  247  	return 0;
14c48ee8145275 Kumar Kartikeya Dwivedi 2025-03-15  248  }
14c48ee8145275 Kumar Kartikeya Dwivedi 2025-03-15  249  

:::::: The code at line 200 was first introduced by commit
:::::: 31158ad02ddbed2b0672c9701a0a2f3e5b3bc01a rqspinlock: Add deadlock detection and recovery

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
