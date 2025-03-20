Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3481FB3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 13:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742478896; cv=none; b=cy/7R+NzEmZ3sY4NjNkcgjsuLGZfDMkp+ys+mcdZHRcWYs+xGM9djACj105HJ3E2dcGyGUbqZnGOS3bksEvwyQpmAr1u8a7oxgjDuvG1KbUC7I6DQAkhf9B5WnHdk7sdSpRXJdk0leDHR9PS5JGgmsxG5oXtVz13iuCssFKrSvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742478896; c=relaxed/simple;
	bh=bPJaK0Rud32/lVWqHyUpmGIvZ+TFElrw8GQMq9UkpQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M997UKwGsuC25LjFbaJlOfYWAvnZfxccPAGNYbWgTPz/4t4ct/tEkZ4qzjruEUbO2N2WFLxbmqmcOVqjNhDiE+N6TDAaEkS5j8s18ntOMEZUtEiloqDftEeKu61bxWzZd/Aa4zYE+7JAoxM+yYDj8e8q75htEBtZDR5XdZFNHFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lx2mPG4i; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lx2mPG4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742478894; x=1774014894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bPJaK0Rud32/lVWqHyUpmGIvZ+TFElrw8GQMq9UkpQo=;
  b=lx2mPG4iB7Uoy3pU5Dt3XJed7yI62F6uaVWFOA9wAi69nkQiCSmwehrk
   qaUqTtzkgGUCdi6UeDdUqbfYmAW+x1eLoaVufCF0kpsjfHj52R4CkLGaV
   BbNg9N0qVoOtoZk2AYeCAGbU/5I684WT23CybPRH/Nv+kO6htW5XdBwaR
   q6dsMeyH7qQsynkvszJfAjZ755xRv9mUg642/lldEXNmay/zAWnmQ3XuN
   2tVtQUTF5VD1ew4bvT481+kbkHZTT6vxyPTDhE3BWaX4jsEfw3BjFOhR/
   simkoF4ZlIKrLC+TbCbkyri0QPIxaD5DcAmnrEdf0PVlI9EPVrCQRAMdi
   w==;
X-CSE-ConnectionGUID: 6PHe/RDzT7qH8wvyRH7Uog==
X-CSE-MsgGUID: BKF3t/KbTneXZRSLnW2yiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43630776"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="43630776"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 06:54:54 -0700
X-CSE-ConnectionGUID: jJRBOgQ8SJWaNekNOk92Lg==
X-CSE-MsgGUID: +xwpqWfQTmOmu3du1/Bmtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="146309495"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2025 06:54:53 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvGME-0000TQ-1n;
	Thu, 20 Mar 2025 13:54:50 +0000
Date: Thu, 20 Mar 2025 21:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [brauner-vfs:work.pidfs.thread_group 4/8] fs/pidfs.c:213:14:
 warning: unused variable 'thread'
Message-ID: <202503202312.SmfIIwCj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.pidfs.thread_group
head:   d0a0cf0bc25c919225b65ae639aaeb05747974a3
commit: 65d0a567a7317093032cfd56cae7aa7417b03d17 [4/8] pidfs: improve multi-threaded exec and premature thread-group leader exit polling
config: i386-buildonly-randconfig-001-20250320 (https://download.01.org/0day-ci/archive/20250320/202503202312.SmfIIwCj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503202312.SmfIIwCj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503202312.SmfIIwCj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/pidfs.c: In function 'pidfd_poll':
>> fs/pidfs.c:213:14: warning: unused variable 'thread' [-Wunused-variable]
     213 |         bool thread = file->f_flags & PIDFD_THREAD;
         |              ^~~~~~


vim +/thread +213 fs/pidfs.c

50f4f2d197e194 Christian Brauner 2024-02-12  206  
50f4f2d197e194 Christian Brauner 2024-02-12  207  /*
50f4f2d197e194 Christian Brauner 2024-02-12  208   * Poll support for process exit notification.
50f4f2d197e194 Christian Brauner 2024-02-12  209   */
50f4f2d197e194 Christian Brauner 2024-02-12  210  static __poll_t pidfd_poll(struct file *file, struct poll_table_struct *pts)
50f4f2d197e194 Christian Brauner 2024-02-12  211  {
cb12fd8e0dabb9 Christian Brauner 2024-02-12  212  	struct pid *pid = pidfd_pid(file);
50f4f2d197e194 Christian Brauner 2024-02-12 @213  	bool thread = file->f_flags & PIDFD_THREAD;
50f4f2d197e194 Christian Brauner 2024-02-12  214  	struct task_struct *task;
50f4f2d197e194 Christian Brauner 2024-02-12  215  	__poll_t poll_flags = 0;
50f4f2d197e194 Christian Brauner 2024-02-12  216  
50f4f2d197e194 Christian Brauner 2024-02-12  217  	poll_wait(file, &pid->wait_pidfd, pts);
50f4f2d197e194 Christian Brauner 2024-02-12  218  	/*
50f4f2d197e194 Christian Brauner 2024-02-12  219  	 * Depending on PIDFD_THREAD, inform pollers when the thread
50f4f2d197e194 Christian Brauner 2024-02-12  220  	 * or the whole thread-group exits.
65d0a567a73170 Christian Brauner 2025-03-19  221  	 *
65d0a567a73170 Christian Brauner 2025-03-19  222  	 * There are two corner cases to consider:
65d0a567a73170 Christian Brauner 2025-03-19  223  	 *
65d0a567a73170 Christian Brauner 2025-03-19  224  	 * (1) If a thread-group leader of a thread-group with
65d0a567a73170 Christian Brauner 2025-03-19  225  	 *     subthreads exits prematurely, i.e., before all of the
65d0a567a73170 Christian Brauner 2025-03-19  226  	 *     subthreads of the thread-group have exited then no
65d0a567a73170 Christian Brauner 2025-03-19  227  	 *     notification will be generated for PIDFD_THREAD pidfds
65d0a567a73170 Christian Brauner 2025-03-19  228  	 *     referring to the thread-group leader.
65d0a567a73170 Christian Brauner 2025-03-19  229  	 *
65d0a567a73170 Christian Brauner 2025-03-19  230  	 *     The exit notification for the thread-group leader will be
65d0a567a73170 Christian Brauner 2025-03-19  231  	 *     delayed until the last subthread of the thread-group
65d0a567a73170 Christian Brauner 2025-03-19  232  	 *     exits.
65d0a567a73170 Christian Brauner 2025-03-19  233  	 *
65d0a567a73170 Christian Brauner 2025-03-19  234  	 * (2) If a subthread of a thread-group execs then the
65d0a567a73170 Christian Brauner 2025-03-19  235  	 *     current thread-group leader will be SIGKILLed and the
65d0a567a73170 Christian Brauner 2025-03-19  236  	 *     subthread will assume the struct pid of the now defunct
65d0a567a73170 Christian Brauner 2025-03-19  237  	 *     old thread-group leader. No exit notification will be
65d0a567a73170 Christian Brauner 2025-03-19  238  	 *     generated for PIDFD_THREAD pidfds referring to the old
65d0a567a73170 Christian Brauner 2025-03-19  239  	 *     thread-group leader as they continue referring to the new
65d0a567a73170 Christian Brauner 2025-03-19  240  	 *     thread-group leader.
50f4f2d197e194 Christian Brauner 2024-02-12  241  	 */
50f4f2d197e194 Christian Brauner 2024-02-12  242  	guard(rcu)();
50f4f2d197e194 Christian Brauner 2024-02-12  243  	task = pid_task(pid, PIDTYPE_PID);
50f4f2d197e194 Christian Brauner 2024-02-12  244  	if (!task)
50f4f2d197e194 Christian Brauner 2024-02-12  245  		poll_flags = EPOLLIN | EPOLLRDNORM | EPOLLHUP;
65d0a567a73170 Christian Brauner 2025-03-19  246  	else if (task->exit_state && !delay_group_leader(task))
50f4f2d197e194 Christian Brauner 2024-02-12  247  		poll_flags = EPOLLIN | EPOLLRDNORM;
50f4f2d197e194 Christian Brauner 2024-02-12  248  
50f4f2d197e194 Christian Brauner 2024-02-12  249  	return poll_flags;
50f4f2d197e194 Christian Brauner 2024-02-12  250  }
50f4f2d197e194 Christian Brauner 2024-02-12  251  

:::::: The code at line 213 was first introduced by commit
:::::: 50f4f2d197e194ec0356962b99ca2b72e9a37bc8 pidfd: move struct pidfd_fops

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
