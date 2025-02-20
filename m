Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1029D1DF735
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 21:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740085972; cv=none; b=buSj/g6F+RuMSSCrzl0FXMuMsjU1eJJMRlo5WS6NkNLBHWTccqqBSGbPNCOgVXQvAohf03z4+b9SNMl0vRnoaA2gS8bHbHeRjjxjoVotogyyJgXmx7tEfS1Vse9RnBvAWo9AYLAMFy4oHFBBd4U1r0jHAPiq3J1C8uZryOdcRcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740085972; c=relaxed/simple;
	bh=VEL8RaFih5qilJBRqr1wV2JkfkJAdFhQMULYm49K/44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Shomv7hI5jNEICciGC/GOlbwtrjObURstHMnSY6c6UgJI4T1U+BNK7kCUU/ZGQHoZ7/zxVhaf+qrpqiEiXUcj/zNOn+s4xRknDlDpZsYt43nta8OrBn89AxjCmUODo5aBl9+eI21P90LJ2TNYRHk4qpJZwQoW6iB/tsgrHzrNfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPH0qcUf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPH0qcUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740085970; x=1771621970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VEL8RaFih5qilJBRqr1wV2JkfkJAdFhQMULYm49K/44=;
  b=QPH0qcUf4Igh3KivZFG9wCCZQj6PyslwtYDcxbXCov0Hak07dXGVRHkD
   wPL7go6s78I6SelbC5vmu/43/K07DBle+g/gIsJqe98bITNaVtxfM8PJs
   4DvyLjTgML4J2beuZEyL1dcKBkiUGxhpwzdpoL84DoJW2WnYRe42lAkBw
   WRGJnwUs0Zg8aSbaK39saKyFKqVx8NEQ3quapsE0/IHBgfGGyKfmWOPWv
   GX6u2sNfgc3rGNkZB3GVgTuV0yvk9vqdsU1HVdcAmr9eZ8HjvPVznGJxA
   7CcIwuK+3Pyd8dMM5UvsQykhbn1V/gjNjnnXOtPutFcnZrDiJLdRFl+O5
   g==;
X-CSE-ConnectionGUID: eaRbsk9jQgmX5OWyP0snIA==
X-CSE-MsgGUID: W9XJKG/9TH+G+hXx+6xExQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40756346"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40756346"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 13:12:49 -0800
X-CSE-ConnectionGUID: nobtpWGOSfqCK/2FOC9Fwg==
X-CSE-MsgGUID: QpyEbhZVTKiXlb3ABy4wxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="115826864"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 20 Feb 2025 13:12:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlDqg-0004lv-13;
	Thu, 20 Feb 2025 21:12:46 +0000
Date: Fri, 21 Feb 2025 05:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:futex/scope 1/4] kernel/futex/waitwake.c:343: warning:
 expecting prototype for futex_wait_queue(). Prototype was for
 futex_do_wait() instead
Message-ID: <202502210552.DMq5sFjU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git futex/scope
head:   39534100fe613f467451202beacb7f4f39c4e403
commit: f8af8b710a8a109b2dff00b94e9d493de3f7425f [1/4] futex: Move futex_queue() into futex_wait_setup()
config: arc-randconfig-002-20250221 (https://download.01.org/0day-ci/archive/20250221/202502210552.DMq5sFjU-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210552.DMq5sFjU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502210552.DMq5sFjU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex/waitwake.c:343: warning: expecting prototype for futex_wait_queue(). Prototype was for futex_do_wait() instead
>> kernel/futex/waitwake.c:584: warning: Function parameter or struct member 'key2' not described in 'futex_wait_setup'
>> kernel/futex/waitwake.c:584: warning: Function parameter or struct member 'task' not described in 'futex_wait_setup'
>> kernel/futex/waitwake.c:584: warning: Excess function parameter 'hb' description in 'futex_wait_setup'


vim +343 kernel/futex/waitwake.c

a046f1a0d3e320 Peter Zijlstra 2021-09-23  335  
a046f1a0d3e320 Peter Zijlstra 2021-09-23  336  /**
a046f1a0d3e320 Peter Zijlstra 2021-09-23  337   * futex_wait_queue() - futex_queue() and wait for wakeup, timeout, or signal
a046f1a0d3e320 Peter Zijlstra 2021-09-23  338   * @hb:		the futex hash bucket, must be locked by the caller
a046f1a0d3e320 Peter Zijlstra 2021-09-23  339   * @q:		the futex_q to queue up on
a046f1a0d3e320 Peter Zijlstra 2021-09-23  340   * @timeout:	the prepared hrtimer_sleeper, or null for no timeout
a046f1a0d3e320 Peter Zijlstra 2021-09-23  341   */
f8af8b710a8a10 Peter Zijlstra 2025-02-20  342  void futex_do_wait(struct futex_q *q, struct hrtimer_sleeper *timeout)
a046f1a0d3e320 Peter Zijlstra 2021-09-23 @343  {
a046f1a0d3e320 Peter Zijlstra 2021-09-23  344  	/* Arm the timer */
a046f1a0d3e320 Peter Zijlstra 2021-09-23  345  	if (timeout)
a046f1a0d3e320 Peter Zijlstra 2021-09-23  346  		hrtimer_sleeper_start_expires(timeout, HRTIMER_MODE_ABS);
a046f1a0d3e320 Peter Zijlstra 2021-09-23  347  
a046f1a0d3e320 Peter Zijlstra 2021-09-23  348  	/*
a046f1a0d3e320 Peter Zijlstra 2021-09-23  349  	 * If we have been removed from the hash list, then another task
a046f1a0d3e320 Peter Zijlstra 2021-09-23  350  	 * has tried to wake us, and we can skip the call to schedule().
a046f1a0d3e320 Peter Zijlstra 2021-09-23  351  	 */
a046f1a0d3e320 Peter Zijlstra 2021-09-23  352  	if (likely(!plist_node_empty(&q->list))) {
a046f1a0d3e320 Peter Zijlstra 2021-09-23  353  		/*
a046f1a0d3e320 Peter Zijlstra 2021-09-23  354  		 * If the timer has already expired, current will already be
a046f1a0d3e320 Peter Zijlstra 2021-09-23  355  		 * flagged for rescheduling. Only call schedule if there
a046f1a0d3e320 Peter Zijlstra 2021-09-23  356  		 * is no timeout, or if it has yet to expire.
a046f1a0d3e320 Peter Zijlstra 2021-09-23  357  		 */
a046f1a0d3e320 Peter Zijlstra 2021-09-23  358  		if (!timeout || timeout->task)
f5d39b02080914 Peter Zijlstra 2022-08-22  359  			schedule();
a046f1a0d3e320 Peter Zijlstra 2021-09-23  360  	}
a046f1a0d3e320 Peter Zijlstra 2021-09-23  361  	__set_current_state(TASK_RUNNING);
a046f1a0d3e320 Peter Zijlstra 2021-09-23  362  }
a046f1a0d3e320 Peter Zijlstra 2021-09-23  363  

:::::: The code at line 343 was first introduced by commit
:::::: a046f1a0d3e320cfee6bdac336416a537f49e7c6 futex: Split out wait/wake

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
