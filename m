Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D96C4A1E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 06:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728712979; cv=none; b=rEAVFm4eH5ISYHneu9YeFtRxtv8m7EUixW22UevTKv/dvw8kDwVdsG+2AC8C7belYJzJLJROIHe1oE7xbadYr2JnB/k7PmWK1QH2RQilALH34/7oT1iB/xqFG8hU7Z9d1wAr+i7uuZzM8zra2NQY/vkE/7tHfk8/kESrWYDzZR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728712979; c=relaxed/simple;
	bh=A7FjRmnsyk6d4iUhqSs97v4tsjcTawgTD0MzrH+wosM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W1F/36YvDV9iwyTikDI9gmDLMrm+VxjiL413+R13VHNlBGISUUbXG5IM+e4m4/5LkDCZCht0OaF3xTp3k00HANt25B2nWbOwPhe2JvkDCp+9Mnijo9zyCvHdt8Qpdsvi5W1FqfmWFrJEtS+AYQ2euN73cm05cO4TPmx5jbKBdZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fi4kafsg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fi4kafsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728712978; x=1760248978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A7FjRmnsyk6d4iUhqSs97v4tsjcTawgTD0MzrH+wosM=;
  b=fi4kafsgZnFVHgITM49mlj2LajrsEzBV6Ww0nK2k9DfxiVmlRzcPOxgl
   TmCjFiYdRkV/a4syoImKdbiRm+9HB5WoQxRtO66VxNYycMNCLS1+PxO2I
   lAGtEMtBRnFtjLhRMdx+G6nexAGTwNARFfXatRRvJwx1tqPcHzyllZ3Pe
   iVkDRto/bD5sK+Vk7fa/J5iAiGjF2/Q0snXdt358lph/FF31vShuTXLfe
   WQHxXuqSs9QY1ySb8EcUWej6JEGbw5Xh/BaC7OD2oCQVPvGl23g7VRR8w
   nnpZGDbtSrdsuk6H86ItMMs36F05tDW/3bMLCUbLP5VQD3eF9jv+nJurd
   A==;
X-CSE-ConnectionGUID: C9HK3vW+QBCmN6OjhOykgw==
X-CSE-MsgGUID: RyWIk1fzSn6kYV1izADgaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28006622"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="28006622"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 23:02:57 -0700
X-CSE-ConnectionGUID: 2hDEfXAeQyqXFPqmZAcwVw==
X-CSE-MsgGUID: t/h7jt9KT7yIuStUV/dxiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="77920453"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Oct 2024 23:02:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szVDH-000D6N-3D;
	Sat, 12 Oct 2024 06:02:51 +0000
Date: Sat, 12 Oct 2024 14:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Juri Lelli <juri.lelli@redhat.com>,
	John Stultz <jstultz@google.com>, Metin Kaya <metin.kaya@arm.com>
Subject: [peterz-queue:sched/core 4/10] kernel/locking/rtmutex_api.c:296:
 warning: Function parameter or struct member 'wake_q' not described in
 '__rt_mutex_start_proxy_lock'
Message-ID: <202410121433.jYN4ypTb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   f3542dc97564eea82e113e7978ed9ea5ccc7f37e
commit: 8d8fcb8c6a67c5c2674c25effa5c728b1410232d [4/10] locking/mutex: Remove wakeups from under mutex::wait_lock
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241012/202410121433.jYN4ypTb-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121433.jYN4ypTb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121433.jYN4ypTb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/rtmutex_api.c:296: warning: Function parameter or struct member 'wake_q' not described in '__rt_mutex_start_proxy_lock'


vim +296 kernel/locking/rtmutex_api.c

531ae4b06a737e Thomas Gleixner 2021-08-15  272  
531ae4b06a737e Thomas Gleixner 2021-08-15  273  /**
531ae4b06a737e Thomas Gleixner 2021-08-15  274   * __rt_mutex_start_proxy_lock() - Start lock acquisition for another task
531ae4b06a737e Thomas Gleixner 2021-08-15  275   * @lock:		the rt_mutex to take
531ae4b06a737e Thomas Gleixner 2021-08-15  276   * @waiter:		the pre-initialized rt_mutex_waiter
531ae4b06a737e Thomas Gleixner 2021-08-15  277   * @task:		the task to prepare
531ae4b06a737e Thomas Gleixner 2021-08-15  278   *
531ae4b06a737e Thomas Gleixner 2021-08-15  279   * Starts the rt_mutex acquire; it enqueues the @waiter and does deadlock
531ae4b06a737e Thomas Gleixner 2021-08-15  280   * detection. It does not wait, see rt_mutex_wait_proxy_lock() for that.
531ae4b06a737e Thomas Gleixner 2021-08-15  281   *
531ae4b06a737e Thomas Gleixner 2021-08-15  282   * NOTE: does _NOT_ remove the @waiter on failure; must either call
531ae4b06a737e Thomas Gleixner 2021-08-15  283   * rt_mutex_wait_proxy_lock() or rt_mutex_cleanup_proxy_lock() after this.
531ae4b06a737e Thomas Gleixner 2021-08-15  284   *
531ae4b06a737e Thomas Gleixner 2021-08-15  285   * Returns:
531ae4b06a737e Thomas Gleixner 2021-08-15  286   *  0 - task blocked on lock
531ae4b06a737e Thomas Gleixner 2021-08-15  287   *  1 - acquired the lock for task, caller should wake it up
531ae4b06a737e Thomas Gleixner 2021-08-15  288   * <0 - error
531ae4b06a737e Thomas Gleixner 2021-08-15  289   *
531ae4b06a737e Thomas Gleixner 2021-08-15  290   * Special API call for PI-futex support.
531ae4b06a737e Thomas Gleixner 2021-08-15  291   */
830e6acc8a1caf Peter Zijlstra  2021-08-15  292  int __sched __rt_mutex_start_proxy_lock(struct rt_mutex_base *lock,
531ae4b06a737e Thomas Gleixner 2021-08-15  293  					struct rt_mutex_waiter *waiter,
8d8fcb8c6a67c5 Peter Zijlstra  2024-10-09  294  					struct task_struct *task,
8d8fcb8c6a67c5 Peter Zijlstra  2024-10-09  295  					struct wake_q_head *wake_q)
531ae4b06a737e Thomas Gleixner 2021-08-15 @296  {
531ae4b06a737e Thomas Gleixner 2021-08-15  297  	int ret;
531ae4b06a737e Thomas Gleixner 2021-08-15  298  
531ae4b06a737e Thomas Gleixner 2021-08-15  299  	lockdep_assert_held(&lock->wait_lock);
531ae4b06a737e Thomas Gleixner 2021-08-15  300  
531ae4b06a737e Thomas Gleixner 2021-08-15  301  	if (try_to_take_rt_mutex(lock, task, NULL))
531ae4b06a737e Thomas Gleixner 2021-08-15  302  		return 1;
531ae4b06a737e Thomas Gleixner 2021-08-15  303  
531ae4b06a737e Thomas Gleixner 2021-08-15  304  	/* We enforce deadlock detection for futexes */
add461325ec5bc Peter Zijlstra  2021-08-15  305  	ret = task_blocks_on_rt_mutex(lock, waiter, task, NULL,
8d8fcb8c6a67c5 Peter Zijlstra  2024-10-09  306  				      RT_MUTEX_FULL_CHAINWALK, wake_q);
531ae4b06a737e Thomas Gleixner 2021-08-15  307  
531ae4b06a737e Thomas Gleixner 2021-08-15  308  	if (ret && !rt_mutex_owner(lock)) {
531ae4b06a737e Thomas Gleixner 2021-08-15  309  		/*
531ae4b06a737e Thomas Gleixner 2021-08-15  310  		 * Reset the return value. We might have
531ae4b06a737e Thomas Gleixner 2021-08-15  311  		 * returned with -EDEADLK and the owner
531ae4b06a737e Thomas Gleixner 2021-08-15  312  		 * released the lock while we were walking the
531ae4b06a737e Thomas Gleixner 2021-08-15  313  		 * pi chain.  Let the waiter sort it out.
531ae4b06a737e Thomas Gleixner 2021-08-15  314  		 */
531ae4b06a737e Thomas Gleixner 2021-08-15  315  		ret = 0;
531ae4b06a737e Thomas Gleixner 2021-08-15  316  	}
531ae4b06a737e Thomas Gleixner 2021-08-15  317  
531ae4b06a737e Thomas Gleixner 2021-08-15  318  	return ret;
531ae4b06a737e Thomas Gleixner 2021-08-15  319  }
531ae4b06a737e Thomas Gleixner 2021-08-15  320  

:::::: The code at line 296 was first introduced by commit
:::::: 531ae4b06a737ed5539cd75dc6f6b9a28f900bba locking/rtmutex: Split API from implementation

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
