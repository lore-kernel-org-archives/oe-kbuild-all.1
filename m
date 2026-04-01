Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784CA21ADCB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 01:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775006524; cv=none; b=owBp73smzw1vYfqs8BUgwLBa0/SYVjRYj+d/ki94I1MBnM3Zp5C8haLzE9R1CTLjmSEy20qlqfTWyNxrLopA/7kPwjjjaMoZtMQVdBJBG/GgUWouS9er4yKJTDJ4bgI2sLRcrMB9Xs74lc6MIeJb4VfgkCYxvgcQviBhmPRzaws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775006524; c=relaxed/simple;
	bh=1Ag2L9wFXteZ9lmnXsxAe0rRY1Gs+mf3RqAsdAK6JDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y5c0eIUILmJB6d+ZfpNfv5GNPYum0olutx0GS5dHIkgywpu7bSNuxYMIic/SnrzwsiBU1bcUl/xfJ4PLFzHyVBwff4JmLd41UgiEoxekNap7UfoDJ20/pqzxiAsj/DYrE87ullVV4OgLMi9VJSTukHjMoNcNF9ip1BqWCiutH1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jv2ggOti; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jv2ggOti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775006522; x=1806542522;
  h=date:from:to:cc:subject:message-id;
  bh=1Ag2L9wFXteZ9lmnXsxAe0rRY1Gs+mf3RqAsdAK6JDk=;
  b=Jv2ggOtixD7j3itAQ1aSLWwbhBj3SsVSk642Bo/cS0A4GAEe16VibTJQ
   81YLpXoN/Vnz5F3HsbOkCkxZBF93ulqoyOAgz4Olw4dwxP2bt9r84bZN1
   zXlfm2dYeOZi6E/fuBjbrv56lidVNDllF1JUoESJNTIrWqGJRQMkNMTU0
   4+zPueLJOXZ7eBxA82BFenSn9rgVGlmr9nDPEOxZ9393rkPLKwF6GrOwh
   MbPBW0zo1VsJ3pzjNs3GUk/cCvURiqMpMJXWSpMy94vW7e6sQZ5lCEL5Z
   H2f6FLPNQHDSTw3Qp3Y53X3e4X1swZSCZifs8MnxRWAVXbdndtyek7KVu
   A==;
X-CSE-ConnectionGUID: +huHywJDSwyATk/XXlcnnA==
X-CSE-MsgGUID: 5rkqCBBpQ+uqCmIzKjUfOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78629703"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="78629703"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 18:22:02 -0700
X-CSE-ConnectionGUID: RcNpkpH+Qeeu+6sjryBkaw==
X-CSE-MsgGUID: uN625NOfQhOC/mR03fm1Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230953217"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Mar 2026 18:22:00 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7kHN-000000004XT-11fm;
	Wed, 01 Apr 2026 01:21:57 +0000
Date: Wed, 01 Apr 2026 09:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, Junxi Qian <qjx1298677004@gmail.com>
Subject: [axboe:io_uring-7.0 24/25] io_uring/wait.c:309:49: sparse:
 sparse: cast removes address space '__rcu' of expression
Message-ID: <202604010916.KLLyTYoA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-7.0
head:   876a3cdf9cdc419abe88c31123dc5305135f8ae7
commit: 9d0a7bda72c552eacf567312fd2b50e8231582ca [24/25] io_uring: protect remaining lockless ctx->rings accesses with RCU
config: sparc64-randconfig-r134-20260401 (https://download.01.org/0day-ci/archive/20260401/202604010916.KLLyTYoA-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010916.KLLyTYoA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010916.KLLyTYoA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/wait.c: note: in included file (through include/trace/events/io_uring.h):
   include/linux/io_uring_types.h:219:37: sparse: sparse: array of flexible structures
>> io_uring/wait.c:309:49: sparse: sparse: cast removes address space '__rcu' of expression
   io_uring/wait.c:319:16: sparse: sparse: cast removes address space '__rcu' of expression
   io_uring/wait.c:319:54: sparse: sparse: cast removes address space '__rcu' of expression

vim +/__rcu +309 io_uring/wait.c

   183	
   184	/*
   185	 * Wait until events become available, if we don't already have some. The
   186	 * application must reap them itself, as they reside on the shared cq ring.
   187	 */
   188	int io_cqring_wait(struct io_ring_ctx *ctx, int min_events, u32 flags,
   189			   struct ext_arg *ext_arg)
   190	{
   191		struct io_wait_queue iowq;
   192		struct io_rings *rings;
   193		ktime_t start_time;
   194		int ret, nr_wait;
   195	
   196		min_events = min_t(int, min_events, ctx->cq_entries);
   197	
   198		if (!io_allowed_run_tw(ctx))
   199			return -EEXIST;
   200		if (io_local_work_pending(ctx))
   201			io_run_local_work(ctx, min_events,
   202					  max(IO_LOCAL_TW_DEFAULT_MAX, min_events));
   203		io_run_task_work();
   204	
   205		if (unlikely(test_bit(IO_CHECK_CQ_OVERFLOW_BIT, &ctx->check_cq)))
   206			io_cqring_do_overflow_flush(ctx);
   207	
   208		rcu_read_lock();
   209		rings = io_get_rings(ctx);
   210		if (__io_cqring_events_user(ctx) >= min_events) {
   211			rcu_read_unlock();
   212			return 0;
   213		}
   214	
   215		init_waitqueue_func_entry(&iowq.wq, io_wake_function);
   216		iowq.wq.private = current;
   217		INIT_LIST_HEAD(&iowq.wq.entry);
   218		iowq.ctx = ctx;
   219		iowq.cq_tail = READ_ONCE(rings->cq.head) + min_events;
   220		iowq.cq_min_tail = READ_ONCE(rings->cq.tail);
   221		nr_wait = (int) iowq.cq_tail - READ_ONCE(rings->cq.tail);
   222		rcu_read_unlock();
   223		rings = NULL;
   224		iowq.nr_timeouts = atomic_read(&ctx->cq_timeouts);
   225		iowq.hit_timeout = 0;
   226		iowq.min_timeout = ext_arg->min_time;
   227		iowq.timeout = KTIME_MAX;
   228		start_time = io_get_time(ctx);
   229	
   230		if (ext_arg->ts_set) {
   231			iowq.timeout = timespec64_to_ktime(ext_arg->ts);
   232			if (!(flags & IORING_ENTER_ABS_TIMER))
   233				iowq.timeout = ktime_add(iowq.timeout, start_time);
   234		}
   235	
   236		if (ext_arg->sig) {
   237	#ifdef CONFIG_COMPAT
   238			if (in_compat_syscall())
   239				ret = set_compat_user_sigmask((const compat_sigset_t __user *)ext_arg->sig,
   240							      ext_arg->argsz);
   241			else
   242	#endif
   243				ret = set_user_sigmask(ext_arg->sig, ext_arg->argsz);
   244	
   245			if (ret)
   246				return ret;
   247		}
   248	
   249		io_napi_busy_loop(ctx, &iowq);
   250	
   251		trace_io_uring_cqring_wait(ctx, min_events);
   252		do {
   253			unsigned long check_cq;
   254	
   255			if (ctx->flags & IORING_SETUP_DEFER_TASKRUN) {
   256				atomic_set(&ctx->cq_wait_nr, nr_wait);
   257				set_current_state(TASK_INTERRUPTIBLE);
   258			} else {
   259				prepare_to_wait_exclusive(&ctx->cq_wait, &iowq.wq,
   260								TASK_INTERRUPTIBLE);
   261			}
   262	
   263			ret = io_cqring_wait_schedule(ctx, &iowq, ext_arg, start_time);
   264			__set_current_state(TASK_RUNNING);
   265			atomic_set(&ctx->cq_wait_nr, IO_CQ_WAKE_INIT);
   266	
   267			/*
   268			 * Run task_work after scheduling and before io_should_wake().
   269			 * If we got woken because of task_work being processed, run it
   270			 * now rather than let the caller do another wait loop.
   271			 */
   272			if (io_local_work_pending(ctx))
   273				io_run_local_work(ctx, nr_wait, nr_wait);
   274			io_run_task_work();
   275	
   276			/*
   277			 * Non-local task_work will be run on exit to userspace, but
   278			 * if we're using DEFER_TASKRUN, then we could have waited
   279			 * with a timeout for a number of requests. If the timeout
   280			 * hits, we could have some requests ready to process. Ensure
   281			 * this break is _after_ we have run task_work, to avoid
   282			 * deferring running potentially pending requests until the
   283			 * next time we wait for events.
   284			 */
   285			if (ret < 0)
   286				break;
   287	
   288			check_cq = READ_ONCE(ctx->check_cq);
   289			if (unlikely(check_cq)) {
   290				/* let the caller flush overflows, retry */
   291				if (check_cq & BIT(IO_CHECK_CQ_OVERFLOW_BIT))
   292					io_cqring_do_overflow_flush(ctx);
   293				if (check_cq & BIT(IO_CHECK_CQ_DROPPED_BIT)) {
   294					ret = -EBADR;
   295					break;
   296				}
   297			}
   298	
   299			if (io_should_wake(&iowq)) {
   300				ret = 0;
   301				break;
   302			}
   303			cond_resched();
   304	
   305			/* if min timeout has been hit, don't reset wait count */
   306			if (!iowq.hit_timeout)
   307				scoped_guard(rcu)
   308					nr_wait = (int) iowq.cq_tail -
 > 309							READ_ONCE(ctx->rings_rcu->cq.tail);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
