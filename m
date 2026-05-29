Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD313382C7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 20:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086893; cv=none; b=UAmzEbNAnLvGVRs86kVKclwIAvrzzy2WrOifcVkWRHbnjCdmWvMopG+SAnM2ltSWUhzid2H5I0Da6fwzm0VjnMJG/cSQffFN2OrKv6P+xIMw4utr0v/Wv8bpxvbDdi2DdgKnSV5PRNVhRHpa+a6GxlgHlmiYW279PtD+xfW8QDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086893; c=relaxed/simple;
	bh=WHn5jGT6bUq1QludYGtC4oRFswyqQLHyES+YeIDeU+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YsNzaKXi8U5gR8WesslQVjSJppBp3JlWN4dKSJA7WjqZ5BlBIu9fESRGvgBTInCPFO5G+rwY//WGncx3pUYCkiO+Vdv1/bUDfP69VXouZtma3inFNg6lKYtRCrqWqzFP6A7uJiBraV/2JvLHt8r9ahj3Uk2UMRpmseWITf3yzUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZNrjx4H; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZNrjx4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780086891; x=1811622891;
  h=date:from:to:cc:subject:message-id;
  bh=WHn5jGT6bUq1QludYGtC4oRFswyqQLHyES+YeIDeU+M=;
  b=OZNrjx4H1iDYWQHc+zErMXRilRTzkLqc3nJIYIFxzTGw3RaSn5nuGvLA
   ERFn2BTJIsBOI0xo01VY/86z0+mnu7EW2jQxqfAfPa0Oo71Kkuz9rasTl
   g2J2jfplXMcEoZccAfa9SSOxXNOaH+EtRQolPw+/l/rzjECk+GN1obm18
   6d/v+O3zPdgXKiL0wzH4Yu4HT/DT4eqVpDqXFb2cJR6u2/gMKUj17AgW7
   5qgfYeyCEed9uopQ1TbZ2MWg2YQNtYK0SamfOWuWvwIoqr7xmz5itI7aJ
   2C5+4OAykttpFp7JnAAX/e+eCqIQj0lEaD8rTANGgz7hTwW/6MjY3ffKP
   A==;
X-CSE-ConnectionGUID: XkawQH+UQwO/JGS2qGMEIw==
X-CSE-MsgGUID: ObcurnwYRxq/GGks6Tqs6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91628644"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="91628644"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 13:34:51 -0700
X-CSE-ConnectionGUID: gaBu6vc8Ry+UiFFInCJfvA==
X-CSE-MsgGUID: jW73ufD4TzeM3/jxDf51Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="248048722"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 May 2026 13:34:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT3up-000000007fu-0QfQ;
	Fri, 29 May 2026 20:34:47 +0000
Date: Sat, 30 May 2026 04:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-poll-gate 4/7] io_uring/poll.c:415:12:
 sparse: sparse: incorrect type in assignment (different modifiers)
Message-ID: <202605300407.drQ9vHYV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-poll-gate
head:   d0510c73f88ca0f1dd894a7ef0dae269950258ba
commit: 00a000893aa2b556f30bb08b4b96b67c83da869b [4/7] io_uring/poll: invoke BPF poll_gate from io_poll_wake
config: powerpc64-randconfig-r123-20260529 (https://download.01.org/0day-ci/archive/20260530/202605300407.drQ9vHYV-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300407.drQ9vHYV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300407.drQ9vHYV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/poll.c:469:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:469:40: sparse:     expected int mask
   io_uring/poll.c:469:40: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:284:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t @@
   io_uring/poll.c:284:38: sparse:     expected signed int [usertype] res
   io_uring/poll.c:284:38: sparse:     got restricted __poll_t
   io_uring/poll.c:304:56: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:303:66: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:303:66: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:303:66: sparse:     got unsigned int
   io_uring/poll.c:303:52: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned short @@
   io_uring/poll.c:303:52: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:303:52: sparse:     got unsigned short
   io_uring/poll.c:306:51: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:306:51: sparse:     expected signed int [usertype] res
   io_uring/poll.c:306:51: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:307:53: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:307:53: sparse:     expected signed int [usertype] res
   io_uring/poll.c:307:53: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:360:71: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:360:65: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:360:65: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:360:65: sparse:     got unsigned int
>> io_uring/poll.c:415:12: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected int ( *fn )( ... ) @@     got int ( [noderef] * )( ... ) @@
   io_uring/poll.c:415:12: sparse:     expected int ( *fn )( ... )
   io_uring/poll.c:415:12: sparse:     got int ( [noderef] * )( ... )
   io_uring/poll.c:657:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:657:40: sparse:     expected int mask
   io_uring/poll.c:657:40: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/poll.c:737:38: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:737:38: sparse:     expected int mask
   io_uring/poll.c:737:38: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/poll.c:737:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int events @@     got restricted __poll_t [usertype] events @@
   io_uring/poll.c:737:55: sparse:     expected int events
   io_uring/poll.c:737:55: sparse:     got restricted __poll_t [usertype] events
   io_uring/poll.c:744:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got int @@
   io_uring/poll.c:744:33: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:744:33: sparse:     got int
   io_uring/poll.c:882:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:882:24: sparse:    left side has type unsigned int
   io_uring/poll.c:882:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:884:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:884:24: sparse:    left side has type unsigned int
   io_uring/poll.c:884:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:886:55: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:885:29: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:885:38: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got unsigned int @@
   io_uring/poll.c:885:38: sparse:     expected restricted __poll_t
   io_uring/poll.c:885:38: sparse:     got unsigned int
   io_uring/poll.c:946:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [addressable] [assigned] [usertype] result_mask @@
   io_uring/poll.c:946:40: sparse:     expected signed int [usertype] res
   io_uring/poll.c:946:40: sparse:     got restricted __poll_t [addressable] [assigned] [usertype] result_mask
   io_uring/poll.c:977:38: sparse: sparse: invalid assignment: &=
   io_uring/poll.c:977:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:977:38: sparse:    right side has type int
   io_uring/poll.c:978:52: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:978:38: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:978:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:978:38: sparse:    right side has type unsigned int

vim +415 io_uring/poll.c

   231	
   232	/*
   233	 * All poll tw should go through this. Checks for poll events, manages
   234	 * references, does rewait, etc.
   235	 *
   236	 * Returns a negative error on failure. IOU_POLL_NO_ACTION when no action
   237	 * require, which is either spurious wakeup or multishot CQE is served.
   238	 * IOU_POLL_DONE when it's done with the request, then the mask is stored in
   239	 * req->cqe.res. IOU_POLL_REMOVE_POLL_USE_RES indicates to remove multishot
   240	 * poll and that the result is stored in req->cqe.
   241	 */
   242	static int io_poll_check_events(struct io_kiocb *req, io_tw_token_t tw)
   243	{
   244		int v;
   245	
   246		if (unlikely(tw.cancel))
   247			return -ECANCELED;
   248	
   249		do {
   250			v = atomic_read(&req->poll_refs);
   251	
   252			if (unlikely(v != 1)) {
   253				/* tw should be the owner and so have some refs */
   254				if (WARN_ON_ONCE(!(v & IO_POLL_REF_MASK)))
   255					return IOU_POLL_NO_ACTION;
   256				if (v & IO_POLL_CANCEL_FLAG)
   257					return -ECANCELED;
   258				/*
   259				 * cqe.res contains only events of the first wake up
   260				 * and all others are to be lost. Redo vfs_poll() to get
   261				 * up to date state.
   262				 */
   263				if ((v & IO_POLL_REF_MASK) != 1)
   264					req->cqe.res = 0;
   265	
   266				if (v & IO_POLL_RETRY_FLAG) {
   267					req->cqe.res = 0;
   268					/*
   269					 * We won't find new events that came in between
   270					 * vfs_poll and the ref put unless we clear the
   271					 * flag in advance.
   272					 */
   273					atomic_andnot(IO_POLL_RETRY_FLAG, &req->poll_refs);
   274					v &= ~IO_POLL_RETRY_FLAG;
   275				}
   276				v &= IO_POLL_REF_MASK;
   277			}
   278	
   279			/* the mask was stashed in __io_poll_execute */
   280			if (!req->cqe.res) {
   281				__poll_t events = req->apoll_events;
   282				struct poll_table_struct pt = { ._key = events };
   283	
   284				req->cqe.res = vfs_poll(req->file, &pt) & events;
   285				/*
   286				 * We got woken with a mask, but someone else got to
   287				 * it first. The above vfs_poll() doesn't add us back
   288				 * to the waitqueue, so if we get nothing back, we
   289				 * should be safe and attempt a reissue.
   290				 */
   291				if (unlikely(!req->cqe.res)) {
   292					/* Multishot armed need not reissue */
   293					if (!(events & EPOLLONESHOT))
   294						continue;
   295					return IOU_POLL_REISSUE;
   296				}
   297			}
   298			if (req->apoll_events & EPOLLONESHOT)
   299				return IOU_POLL_DONE;
   300	
   301			/* multishot, just fill a CQE and proceed */
   302			if (!(req->flags & REQ_F_APOLL_MULTISHOT)) {
   303				__poll_t mask = mangle_poll(req->cqe.res &
   304							    req->apoll_events);
   305	
 > 306				if (!io_req_post_cqe(req, mask, IORING_CQE_F_MORE)) {
   307					io_req_set_res(req, mask, 0);
   308					return IOU_POLL_REMOVE_POLL_USE_RES;
   309				}
   310			} else {
   311				int ret;
   312	
   313				/* multiple refs and HUP, ensure we loop once more */
   314				if ((req->cqe.res & (POLLHUP | POLLRDHUP)) && v != 1)
   315					v--;
   316	
   317				ret = io_poll_issue(req, tw);
   318				if (ret == IOU_COMPLETE)
   319					return IOU_POLL_REMOVE_POLL_USE_RES;
   320				else if (ret == IOU_REQUEUE)
   321					return IOU_POLL_REQUEUE;
   322				if (ret != IOU_RETRY && ret < 0)
   323					return ret;
   324			}
   325	
   326			/* force the next iteration to vfs_poll() */
   327			req->cqe.res = 0;
   328	
   329			/*
   330			 * Release all references, retry if someone tried to restart
   331			 * task_work while we were executing it.
   332			 */
   333		} while (atomic_sub_return(v, &req->poll_refs) & IO_POLL_REF_MASK);
   334	
   335		io_napi_add(req);
   336		return IOU_POLL_NO_ACTION;
   337	}
   338	
   339	void io_poll_task_func(struct io_tw_req tw_req, io_tw_token_t tw)
   340	{
   341		struct io_kiocb *req = tw_req.req;
   342		int ret;
   343	
   344		ret = io_poll_check_events(req, tw);
   345		if (ret == IOU_POLL_NO_ACTION) {
   346			return;
   347		} else if (ret == IOU_POLL_REQUEUE) {
   348			__io_poll_execute(req, 0);
   349			return;
   350		}
   351		io_poll_remove_entries(req);
   352		/* task_work always has ->uring_lock held */
   353		hash_del(&req->hash_node);
   354	
   355		if (req->opcode == IORING_OP_POLL_ADD) {
   356			if (ret == IOU_POLL_DONE) {
   357				struct io_poll *poll;
   358	
   359				poll = io_kiocb_to_cmd(req, struct io_poll);
   360				req->cqe.res = mangle_poll(req->cqe.res & poll->events);
   361			} else if (ret == IOU_POLL_REISSUE) {
   362				io_req_task_submit(tw_req, tw);
   363				return;
   364			} else if (ret != IOU_POLL_REMOVE_POLL_USE_RES) {
   365				req->cqe.res = ret;
   366				req_set_fail(req);
   367			}
   368	
   369			io_req_set_res(req, req->cqe.res, 0);
   370			io_req_task_complete(tw_req, tw);
   371		} else {
   372			io_tw_lock(req->ctx, tw);
   373	
   374			if (ret == IOU_POLL_REMOVE_POLL_USE_RES)
   375				io_req_task_complete(tw_req, tw);
   376			else if (ret == IOU_POLL_DONE || ret == IOU_POLL_REISSUE)
   377				io_req_task_submit(tw_req, tw);
   378			else
   379				io_req_defer_failed(req, ret);
   380		}
   381	}
   382	
   383	static void io_poll_cancel_req(struct io_kiocb *req)
   384	{
   385		io_poll_mark_cancelled(req);
   386		/* kick tw, which should complete the request */
   387		io_poll_execute(req, 0);
   388	}
   389	
   390	#define IO_ASYNC_POLL_COMMON	(EPOLLONESHOT | EPOLLPRI)
   391	
   392	static __cold int io_pollfree_wake(struct io_kiocb *req, struct io_poll *poll)
   393	{
   394		io_poll_mark_cancelled(req);
   395		/* we have to kick tw in case it's not already */
   396		io_poll_execute(req, 0);
   397		io_poll_remove_waitq(poll);
   398		return 1;
   399	}
   400	
   401	static int __io_bpf_poll_gate(struct io_kiocb *req, __poll_t mask)
   402	{
   403		int (*fn)(struct io_uring_poll_event *);
   404		struct io_ring_ctx *ctx = req->ctx;
   405		struct io_uring_poll_event_priv ev = {
   406			.pub.user_data	= req->cqe.user_data,
   407			.pub.gate_state	= req->poll_bpf_val,
   408			.pub.mask	= (__force __u32) mask,
   409			.pub.opcode	= req->opcode,
   410			.req		= req,
   411		};
   412		int ret = 0;
   413	
   414		guard(rcu)();
 > 415		fn = rcu_dereference(ctx->poll_gate);
   416		if (fn)
   417			ret = fn(&ev.pub);
   418	
   419		req->poll_bpf_val = ev.pub.gate_state;
   420		return ret;
   421	}
   422	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
