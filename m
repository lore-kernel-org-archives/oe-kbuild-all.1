Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8863016E3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 16:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780331628; cv=none; b=XwU6RIa6KaQcJMDuUxMRNxEhfuIx69z1Hl+KRQCKkU6GkNTd9XyZxbED1UVb1aXdAk7g5F1DE6rY26ZXfUeWYWUWTmaKNmKvFMI3Zt92qKhIHkBCJJ10rmNt+gR36tLYIaVmq++0rdw16ulvqidnm/2T02JZFx5fC4BdCMzli+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780331628; c=relaxed/simple;
	bh=mtyMTL0tWD10MS2KNOM9Z9xLmzGdEwqJypSS9VIYJV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NNKHV61fXQB1YTcwEWz89MMyYYQec5meFZuSeq53SbwCUh+Pahkzteiis9at4xMceeabJF3+/ck5hy12uXmU27RGjyj68Y+6QWw/cdjo012HEDy44f0EQNxJcb/IkX3p1wmnmj4yI+QkWHH5vfSPUAZ8kZv31Lq5XtZ2wtaxPws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5niEqYB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5niEqYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780331627; x=1811867627;
  h=date:from:to:cc:subject:message-id;
  bh=mtyMTL0tWD10MS2KNOM9Z9xLmzGdEwqJypSS9VIYJV8=;
  b=c5niEqYBglHPKw9RockNtckpmuXQmegril9ESKMv4Ea0qM3NVe3oX8FZ
   vFmiQaKZmtaPfNflIzRfIE/CaNNMhnwMqnZosH4uU4jObTH1OVpbsT+EF
   Pqb7ZD2oGXlycv5nYYxaCceloYVPLS1LKB+2nOAI/9lElOzicXHowWIwg
   uAowS8yywwe/PF07PY6Ke/edth49xRX9s0PhLHjpKmref4BcWyDYo7MS2
   AhJi/aeHwx/Rr8WUeTsV75ldn8aQY2N1zqfkFSjt//rJ0eNxz226RYHyj
   NQkoiZOq9eF4J5m1/k4rECiTrt7H/mmDEkV3IT4BEJURQ/GerBRA1wnvO
   w==;
X-CSE-ConnectionGUID: zAy62xwES1eBrGPqb92m8g==
X-CSE-MsgGUID: EnV/st6IRmKxXWJhC/rHQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81069834"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81069834"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 09:33:45 -0700
X-CSE-ConnectionGUID: C9j3nB9FSr2puB+wM5jAFA==
X-CSE-MsgGUID: u9pmzuctQguVQunbzqc7Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243450530"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Jun 2026 09:33:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU5a8-00000000AoI-0rUe;
	Mon, 01 Jun 2026 16:33:40 +0000
Date: Tue, 02 Jun 2026 00:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>
Subject: io_uring/poll.c:703:33: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202606020041.S2ghPkea-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: 162151889267089bb920609830c35f9272087c3f io_uring/poll: introduce io_arm_apoll()
date:   11 months ago
config: m68k-randconfig-r132-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020041.S2ghPkea-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020041.S2ghPkea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 162151889267 ("io_uring/poll: introduce io_arm_apoll()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020041.S2ghPkea-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/poll.c:426:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:426:40: sparse:     expected int mask
   io_uring/poll.c:426:40: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:262:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t @@
   io_uring/poll.c:262:38: sparse:     expected signed int [usertype] res
   io_uring/poll.c:262:38: sparse:     got restricted __poll_t
   io_uring/poll.c:276:21: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:284:56: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:283:66: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:283:66: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:283:66: sparse:     got unsigned int
   io_uring/poll.c:283:52: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned short @@
   io_uring/poll.c:283:52: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:283:52: sparse:     got unsigned short
   io_uring/poll.c:286:51: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:286:51: sparse:     expected signed int [usertype] res
   io_uring/poll.c:286:51: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:287:53: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:287:53: sparse:     expected signed int [usertype] res
   io_uring/poll.c:287:53: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:337:71: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:337:65: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:337:65: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:337:65: sparse:     got unsigned int
   io_uring/poll.c:614:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:614:40: sparse:     expected int mask
   io_uring/poll.c:614:40: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/poll.c:696:38: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:696:38: sparse:     expected int mask
   io_uring/poll.c:696:38: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/poll.c:696:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int events @@     got restricted __poll_t [usertype] events @@
   io_uring/poll.c:696:55: sparse:     expected int events
   io_uring/poll.c:696:55: sparse:     got restricted __poll_t [usertype] events
>> io_uring/poll.c:703:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got int @@
   io_uring/poll.c:703:33: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:703:33: sparse:     got int
   io_uring/poll.c:841:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:841:24: sparse:    left side has type unsigned int
   io_uring/poll.c:841:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:843:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:843:24: sparse:    left side has type unsigned int
   io_uring/poll.c:843:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:845:55: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:844:29: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:844:38: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got unsigned int @@
   io_uring/poll.c:844:38: sparse:     expected restricted __poll_t
   io_uring/poll.c:844:38: sparse:     got unsigned int
   io_uring/poll.c:905:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [addressable] [assigned] [usertype] result_mask @@
   io_uring/poll.c:905:40: sparse:     expected signed int [usertype] res
   io_uring/poll.c:905:40: sparse:     got restricted __poll_t [addressable] [assigned] [usertype] result_mask
   io_uring/poll.c:936:38: sparse: sparse: invalid assignment: &=
   io_uring/poll.c:936:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:936:38: sparse:    right side has type int
   io_uring/poll.c:937:52: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:937:38: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:937:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:937:38: sparse:    right side has type unsigned int

vim +703 io_uring/poll.c

   538	
   539	/*
   540	 * Returns 0 when it's handed over for polling. The caller owns the requests if
   541	 * it returns non-zero, but otherwise should not touch it. Negative values
   542	 * contain an error code. When the result is >0, the polling has completed
   543	 * inline and ipt.result_mask is set to the mask.
   544	 */
   545	static int __io_arm_poll_handler(struct io_kiocb *req,
   546					 struct io_poll *poll,
   547					 struct io_poll_table *ipt, __poll_t mask,
   548					 unsigned issue_flags)
   549	{
   550		INIT_HLIST_NODE(&req->hash_node);
   551		io_init_poll_iocb(poll, mask);
   552		poll->file = req->file;
   553		req->apoll_events = poll->events;
   554	
   555		ipt->pt._key = mask;
   556		ipt->req = req;
   557		ipt->error = 0;
   558		ipt->nr_entries = 0;
   559		/*
   560		 * Polling is either completed here or via task_work, so if we're in the
   561		 * task context we're naturally serialised with tw by merit of running
   562		 * the same task. When it's io-wq, take the ownership to prevent tw
   563		 * from running. However, when we're in the task context, skip taking
   564		 * it as an optimisation.
   565		 *
   566		 * Note: even though the request won't be completed/freed, without
   567		 * ownership we still can race with io_poll_wake().
   568		 * io_poll_can_finish_inline() tries to deal with that.
   569		 */
   570		ipt->owning = issue_flags & IO_URING_F_UNLOCKED;
   571		atomic_set(&req->poll_refs, (int)ipt->owning);
   572	
   573		/*
   574		 * Exclusive waits may only wake a limited amount of entries
   575		 * rather than all of them, this may interfere with lazy
   576		 * wake if someone does wait(events > 1). Ensure we don't do
   577		 * lazy wake for those, as we need to process each one as they
   578		 * come in.
   579		 */
   580		if (poll->events & EPOLLEXCLUSIVE)
   581			req->flags |= REQ_F_POLL_NO_LAZY;
   582	
   583		mask = vfs_poll(req->file, &ipt->pt) & poll->events;
   584	
   585		if (unlikely(ipt->error || !ipt->nr_entries)) {
   586			io_poll_remove_entries(req);
   587	
   588			if (!io_poll_can_finish_inline(req, ipt)) {
   589				io_poll_mark_cancelled(req);
   590				return 0;
   591			} else if (mask && (poll->events & EPOLLET)) {
   592				ipt->result_mask = mask;
   593				return 1;
   594			}
   595			return ipt->error ?: -EINVAL;
   596		}
   597	
   598		if (mask &&
   599		   ((poll->events & (EPOLLET|EPOLLONESHOT)) == (EPOLLET|EPOLLONESHOT))) {
   600			if (!io_poll_can_finish_inline(req, ipt)) {
   601				io_poll_add_hash(req, issue_flags);
   602				return 0;
   603			}
   604			io_poll_remove_entries(req);
   605			ipt->result_mask = mask;
   606			/* no one else has access to the req, forget about the ref */
   607			return 1;
   608		}
   609	
   610		io_poll_add_hash(req, issue_flags);
   611	
   612		if (mask && (poll->events & EPOLLET) &&
   613		    io_poll_can_finish_inline(req, ipt)) {
 > 614			__io_poll_execute(req, mask);
   615			return 0;
   616		}
   617		io_napi_add(req);
   618	
   619		if (ipt->owning) {
   620			/*
   621			 * Try to release ownership. If we see a change of state, e.g.
   622			 * poll was waken up, queue up a tw, it'll deal with it.
   623			 */
   624			if (atomic_cmpxchg(&req->poll_refs, 1, 0) != 1)
   625				__io_poll_execute(req, 0);
   626		}
   627		return 0;
   628	}
   629	
   630	static void io_async_queue_proc(struct file *file, struct wait_queue_head *head,
   631				       struct poll_table_struct *p)
   632	{
   633		struct io_poll_table *pt = container_of(p, struct io_poll_table, pt);
   634		struct async_poll *apoll = pt->req->apoll;
   635	
   636		__io_queue_proc(&apoll->poll, pt, head, &apoll->double_poll);
   637	}
   638	
   639	/*
   640	 * We can't reliably detect loops in repeated poll triggers and issue
   641	 * subsequently failing. But rather than fail these immediately, allow a
   642	 * certain amount of retries before we give up. Given that this condition
   643	 * should _rarely_ trigger even once, we should be fine with a larger value.
   644	 */
   645	#define APOLL_MAX_RETRY		128
   646	
   647	static struct async_poll *io_req_alloc_apoll(struct io_kiocb *req,
   648						     unsigned issue_flags)
   649	{
   650		struct io_ring_ctx *ctx = req->ctx;
   651		struct async_poll *apoll;
   652	
   653		if (req->flags & REQ_F_POLLED) {
   654			apoll = req->apoll;
   655			kfree(apoll->double_poll);
   656		} else {
   657			if (!(issue_flags & IO_URING_F_UNLOCKED))
   658				apoll = io_cache_alloc(&ctx->apoll_cache, GFP_ATOMIC);
   659			else
   660				apoll = kmalloc(sizeof(*apoll), GFP_ATOMIC);
   661			if (!apoll)
   662				return NULL;
   663			apoll->poll.retries = APOLL_MAX_RETRY;
   664		}
   665		apoll->double_poll = NULL;
   666		req->apoll = apoll;
   667		if (unlikely(!--apoll->poll.retries))
   668			return NULL;
   669		return apoll;
   670	}
   671	
   672	int io_arm_apoll(struct io_kiocb *req, unsigned issue_flags, __poll_t mask)
   673	{
   674		struct async_poll *apoll;
   675		struct io_poll_table ipt;
   676		int ret;
   677	
   678		mask |= EPOLLET;
   679		if (!io_file_can_poll(req))
   680			return IO_APOLL_ABORTED;
   681		if (!(req->flags & REQ_F_APOLL_MULTISHOT))
   682			mask |= EPOLLONESHOT;
   683	
   684		apoll = io_req_alloc_apoll(req, issue_flags);
   685		if (!apoll)
   686			return IO_APOLL_ABORTED;
   687		req->flags &= ~(REQ_F_SINGLE_POLL | REQ_F_DOUBLE_POLL);
   688		req->flags |= REQ_F_POLLED;
   689		ipt.pt._qproc = io_async_queue_proc;
   690	
   691		io_kbuf_recycle(req, issue_flags);
   692	
   693		ret = __io_arm_poll_handler(req, &apoll->poll, &ipt, mask, issue_flags);
   694		if (ret)
   695			return ret > 0 ? IO_APOLL_READY : IO_APOLL_ABORTED;
   696		trace_io_uring_poll_arm(req, mask, apoll->poll.events);
   697		return IO_APOLL_OK;
   698	}
   699	
   700	int io_arm_poll_handler(struct io_kiocb *req, unsigned issue_flags)
   701	{
   702		const struct io_issue_def *def = &io_issue_defs[req->opcode];
 > 703		__poll_t mask = POLLPRI | POLLERR;
   704	
   705		if (!def->pollin && !def->pollout)
   706			return IO_APOLL_ABORTED;
   707		if (!io_file_can_poll(req))
   708			return IO_APOLL_ABORTED;
   709	
   710		if (def->pollin) {
   711			mask |= EPOLLIN | EPOLLRDNORM;
   712	
   713			/* If reading from MSG_ERRQUEUE using recvmsg, ignore POLLIN */
   714			if (req->flags & REQ_F_CLEAR_POLLIN)
   715				mask &= ~EPOLLIN;
   716		} else {
   717			mask |= EPOLLOUT | EPOLLWRNORM;
   718		}
   719		if (def->poll_exclusive)
   720			mask |= EPOLLEXCLUSIVE;
   721	
   722		return io_arm_apoll(req, issue_flags, mask);
   723	}
   724	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
