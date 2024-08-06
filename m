Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D812A1C5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722966516; cv=none; b=lIaDWOpqLV+mA6M8aZVke/QmAxDtrm5/88/KxF57iXazIz+xtevpiUGSz5YqSx0ZRrABbtrdw1HeT/MV070Zp/MxstJHRUCcLiqnZyZajgeXOerq6kyWPIEugZXf87EtAQ4cIOGODQMole5jBkMs/oF3fX633fMV0Ix5wWUNsOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722966516; c=relaxed/simple;
	bh=ERwv3eTPgsX0IE+j0FTgiPEEOtRsT0YnwHIPL07Avs0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HHlpxDCPmUfWHinwdDCjWx0dQojBG6NZSm/+QixObNohTfiaL+IS9bUvzFJRDh0qBk1S9JjEurJZ3RUp3JRbOPizG96uCBOfb43NOSCdem/JRw3OmCXNgEymOXJylCulxgS7tAhjyVd9JZ83oaiVJy68MepTdgI1XmS4/Gq2woE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYamjwKU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYamjwKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722966514; x=1754502514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ERwv3eTPgsX0IE+j0FTgiPEEOtRsT0YnwHIPL07Avs0=;
  b=jYamjwKU+UM3xtONFHFW4fD44jIS/zTO7jMX4b43kHs4XFVu8i8A2iR6
   3cAiznPqYjXMPvbjEFh1UJIE7g/ItOWlgYMGU5R8UWTuOV4hQ6eefz0Oy
   +h41f6zV28bSnqHco4Fk92O5WiEDu9CVYLtxXjK/Q+k5+QViz7NLEVwz2
   TB+sFmyHYgqU82FJ8iFQ2XYkc4t4LJCJRKoVY8IWPtPyMPnd4z4qd2TPM
   yZaH0rk2zS8/HOc7HYnYyQEMinNKwKm18+K1xi/FzjHMHuUR4qljzAYHu
   dzTyOnTWvhfnpU1vGV1vLSBCVFTWBHXCaxh4hYmgPrnS9LbwkauTrqewt
   A==;
X-CSE-ConnectionGUID: sRIw7L50S5KT3Zf1SMHurw==
X-CSE-MsgGUID: 04ipCn6fTUKKlyVDc/hM1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20817224"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="20817224"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 10:48:33 -0700
X-CSE-ConnectionGUID: C69O1AOdSeWPAKD7KnsLlA==
X-CSE-MsgGUID: waY63LubS6eA7V51qdl3Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="56458737"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 06 Aug 2024 10:48:32 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbOIP-0004ia-1m;
	Tue, 06 Aug 2024 17:48:29 +0000
Date: Wed, 7 Aug 2024 01:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-min-wait 3/4] io_uring/io_uring.c:2519:17:
 error: too few arguments to function 'io_napi_adjust_timeout'
Message-ID: <202408070154.MQDnR4ag-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-min-wait
head:   d4b0765de858c66031ec3d2fedf393ac656a4c2f
commit: 53a25b7e9412de949d8f4a6d869afddf3c31189d [3/4] io_uring: add support for batch wait timeout
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240807/202408070154.MQDnR4ag-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070154.MQDnR4ag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408070154.MQDnR4ag-lkp@intel.com/

All errors (new ones prefixed by >>):

   io_uring/io_uring.c: In function 'io_cqring_wait':
>> io_uring/io_uring.c:2519:17: error: too few arguments to function 'io_napi_adjust_timeout'
    2519 |                 io_napi_adjust_timeout(ctx, &iowq);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   In file included from io_uring/io_uring.c:96:
   io_uring/napi.h:88:20: note: declared here
      88 | static inline void io_napi_adjust_timeout(struct io_ring_ctx *ctx,
         |                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/io_napi_adjust_timeout +2519 io_uring/io_uring.c

  2476	
  2477	/*
  2478	 * Wait until events become available, if we don't already have some. The
  2479	 * application must reap them itself, as they reside on the shared cq ring.
  2480	 */
  2481	static int io_cqring_wait(struct io_ring_ctx *ctx, int min_events,
  2482				  const sigset_t __user *sig, size_t sigsz,
  2483				  struct __kernel_timespec __user *uts)
  2484	{
  2485		struct io_wait_queue iowq;
  2486		struct io_rings *rings = ctx->rings;
  2487		ktime_t start_time;
  2488		int ret;
  2489	
  2490		if (!io_allowed_run_tw(ctx))
  2491			return -EEXIST;
  2492		if (!llist_empty(&ctx->work_llist))
  2493			io_run_local_work(ctx, min_events);
  2494		io_run_task_work();
  2495	
  2496		if (unlikely(test_bit(IO_CHECK_CQ_OVERFLOW_BIT, &ctx->check_cq)))
  2497			io_cqring_do_overflow_flush(ctx);
  2498		if (__io_cqring_events_user(ctx) >= min_events)
  2499			return 0;
  2500	
  2501		init_waitqueue_func_entry(&iowq.wq, io_wake_function);
  2502		iowq.wq.private = current;
  2503		INIT_LIST_HEAD(&iowq.wq.entry);
  2504		iowq.ctx = ctx;
  2505		iowq.nr_timeouts = atomic_read(&ctx->cq_timeouts);
  2506		iowq.cq_min_tail = READ_ONCE(ctx->rings->cq.tail);
  2507		iowq.cq_tail = READ_ONCE(ctx->rings->cq.head) + min_events;
  2508		iowq.min_timeout = KTIME_MAX;
  2509		iowq.timeout = KTIME_MAX;
  2510		start_time = ktime_get_ns();
  2511	
  2512		if (uts) {
  2513			struct timespec64 ts;
  2514	
  2515			if (get_timespec64(&ts, uts))
  2516				return -EFAULT;
  2517	
  2518			iowq.timeout = timespec64_to_ktime(ts);
> 2519			io_napi_adjust_timeout(ctx, &iowq);
  2520		}
  2521	
  2522		if (sig) {
  2523	#ifdef CONFIG_COMPAT
  2524			if (in_compat_syscall())
  2525				ret = set_compat_user_sigmask((const compat_sigset_t __user *)sig,
  2526							      sigsz);
  2527			else
  2528	#endif
  2529				ret = set_user_sigmask(sig, sigsz);
  2530	
  2531			if (ret)
  2532				return ret;
  2533		}
  2534	
  2535		io_napi_busy_loop(ctx, &iowq);
  2536	
  2537		trace_io_uring_cqring_wait(ctx, min_events);
  2538		do {
  2539			int nr_wait = (int) iowq.cq_tail - READ_ONCE(ctx->rings->cq.tail);
  2540			unsigned long check_cq;
  2541	
  2542			if (ctx->flags & IORING_SETUP_DEFER_TASKRUN) {
  2543				atomic_set(&ctx->cq_wait_nr, nr_wait);
  2544				set_current_state(TASK_INTERRUPTIBLE);
  2545			} else {
  2546				prepare_to_wait_exclusive(&ctx->cq_wait, &iowq.wq,
  2547								TASK_INTERRUPTIBLE);
  2548			}
  2549	
  2550			ret = io_cqring_wait_schedule(ctx, &iowq, start_time);
  2551			__set_current_state(TASK_RUNNING);
  2552			atomic_set(&ctx->cq_wait_nr, IO_CQ_WAKE_INIT);
  2553	
  2554			/*
  2555			 * Run task_work after scheduling and before io_should_wake().
  2556			 * If we got woken because of task_work being processed, run it
  2557			 * now rather than let the caller do another wait loop.
  2558			 */
  2559			io_run_task_work();
  2560			if (!llist_empty(&ctx->work_llist))
  2561				io_run_local_work(ctx, nr_wait);
  2562	
  2563			/*
  2564			 * Non-local task_work will be run on exit to userspace, but
  2565			 * if we're using DEFER_TASKRUN, then we could have waited
  2566			 * with a timeout for a number of requests. If the timeout
  2567			 * hits, we could have some requests ready to process. Ensure
  2568			 * this break is _after_ we have run task_work, to avoid
  2569			 * deferring running potentially pending requests until the
  2570			 * next time we wait for events.
  2571			 */
  2572			if (ret < 0)
  2573				break;
  2574	
  2575			check_cq = READ_ONCE(ctx->check_cq);
  2576			if (unlikely(check_cq)) {
  2577				/* let the caller flush overflows, retry */
  2578				if (check_cq & BIT(IO_CHECK_CQ_OVERFLOW_BIT))
  2579					io_cqring_do_overflow_flush(ctx);
  2580				if (check_cq & BIT(IO_CHECK_CQ_DROPPED_BIT)) {
  2581					ret = -EBADR;
  2582					break;
  2583				}
  2584			}
  2585	
  2586			if (io_should_wake(&iowq)) {
  2587				ret = 0;
  2588				break;
  2589			}
  2590			cond_resched();
  2591		} while (1);
  2592	
  2593		if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN))
  2594			finish_wait(&ctx->cq_wait, &iowq.wq);
  2595		restore_saved_sigmask_unless(ret == -EINTR);
  2596	
  2597		return READ_ONCE(rings->cq.head) == READ_ONCE(rings->cq.tail) ? ret : 0;
  2598	}
  2599	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
