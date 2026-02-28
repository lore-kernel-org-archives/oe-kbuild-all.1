Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2C12517AF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Feb 2026 00:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772238611; cv=none; b=B3ZbfcsmqUw5WMXYjutMvtrK6UjIEoxi5cAe/3Tf0J3RUhCvetmFqVS9d43YeFFzXLjzvR9JT25Oy71ueUiXpFAuGvBPO77z7tVh6A4P9bDs/if66ZVCbFXVbRS+lB1ZUS7T3V+JNU7hIwQM/iEELYupFM0+/S85wIeWnsTa+p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772238611; c=relaxed/simple;
	bh=yU0arJso160x2iUB03aeMvozL3FcYI+fbfC7SZCPRnM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cmE9u1mYX8NS7KEWewqeDa4dSVgFXpXg5zoXIRzfLsLb4NFRIlOsa+MBgY/NVmeNHA1wWuD518SXA4qNHRvSsoLYzRkmqui5gdnEfkCwAj0upbRAdZMCfk5/LGkAdaKUcu+hdUdzxxdv4PXgGRVRx2hHo5J+RsMHKhHAcwLn1Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHRFAnMf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHRFAnMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772238609; x=1803774609;
  h=date:from:to:cc:subject:message-id;
  bh=yU0arJso160x2iUB03aeMvozL3FcYI+fbfC7SZCPRnM=;
  b=fHRFAnMfNGgxSqk1zYbablxFLVqUumD00bWAFSROzzgdm4qnMhB3ZmDD
   zztekVqO7+W4+8VPDH6eRvGnAMmOVbxsY/H8h/54aA1X7T8rgx1ZRWvFA
   evN+IWDLEp4t4n10Bey7EYC4kc+DTUA6An2hLzkZNBlESows5Ke2tVt4o
   fDdt8j0ML3jxFvrwpJF6FFcL/OI3N+2xmOxVU5Lg15hIFGUiSqoDtjsQk
   cVklI95A3txiM8E52u9b4n4qxDVRiC6/BGyxXIQqdcvxY67Le0qZ7lKJc
   ciiGSwak844GDi9TLWMXrQtrTCf+2bRiJ+4VIQL48/OF+yOwvvZrJPkZS
   w==;
X-CSE-ConnectionGUID: 7A7POqQPRWqFgQz7meXZRw==
X-CSE-MsgGUID: 9+XzD0XcQQqZTvMzbIG8Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="90728265"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="90728265"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 16:30:09 -0800
X-CSE-ConnectionGUID: EQ01Y3KSRraV5p0hm/9xsg==
X-CSE-MsgGUID: r53E6vTHTgmJHH/BqUQLqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="215181954"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Feb 2026 16:30:07 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw8DB-00000000BCJ-0q9g;
	Sat, 28 Feb 2026 00:29:48 +0000
Date: Sat, 28 Feb 2026 08:29:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 kernel/sched/core.c:4197:35: warning: 'proxy_resched_idle' used but never
 defined
Message-ID: <202602280814.nB60w925-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   1de239ac3464b167e07b59e5e91f7c58d4cc5166
commit: 1de239ac3464b167e07b59e5e91f7c58d4cc5166 [3/3] ANDROID: sched: proxy-exec: Rework proxy_needs_return() to match v24 logic
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260228/202602280814.nB60w925-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602280814.nB60w925-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602280814.nB60w925-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:5713:6: warning: no previous prototype for '__balance_callbacks' [-Wmissing-prototypes]
    5713 | void __balance_callbacks(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:4197:35: warning: 'proxy_resched_idle' used but never defined
    4197 | static inline struct task_struct *proxy_resched_idle(struct rq *rq);
         |                                   ^~~~~~~~~~~~~~~~~~


vim +/proxy_resched_idle +4197 kernel/sched/core.c

  4195	
  4196	#ifdef CONFIG_SMP
> 4197	static inline struct task_struct *proxy_resched_idle(struct rq *rq);
  4198	/*
  4199	 * Checks to see if task p has been proxy-migrated to another rq
  4200	 * and needs to be returned. If so, we deactivate the task here
  4201	 * so that it can be properly woken up on the p->wake_cpu
  4202	 * (or whichever cpu select_task_rq() picks at the bottom of
  4203	 * try_to_wake_up()
  4204	 */
  4205	static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
  4206	{
  4207		if (!sched_proxy_exec())
  4208			return false;
  4209	
  4210		guard(raw_spinlock)(&p->blocked_lock);
  4211	
  4212		/* If task isn't BO_WAKING, we don't need to do return migration */
  4213		if (p->blocked_on_state != BO_WAKING)
  4214			return false;
  4215	
  4216		__set_blocked_on_runnable(p);
  4217	
  4218		/* If already current, don't need to return migrate */
  4219		if (task_current(rq, p))
  4220			return false;
  4221	
  4222		/* If wake_cpu is targeting this cpu, don't bother return migrating */
  4223		if (p->wake_cpu == cpu_of(rq)) {
  4224			resched_curr(rq);
  4225			return false;
  4226		}
  4227	
  4228		/* If we're return migrating the rq->donor, switch it out for idle */
  4229		if (task_current_donor(rq, p))
  4230			proxy_resched_idle(rq);
  4231	
  4232		/* (ab)Use DEQUEUE_SPECIAL to ensure task is always blocked here. */
  4233		block_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_SPECIAL);
  4234		return true;
  4235	}
  4236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
