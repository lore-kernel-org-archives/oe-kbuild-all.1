Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1EF17FE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Feb 2025 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738491573; cv=none; b=ZodqjRvrz3oaW5k6kDhG32b79cRC/v1CaEMuvF8egkpQwGLUS4gRtFLoIaTH8LHivPgIrrCflOwh8MZaj2MqdsntbpvD9B3V2JTqDEUB9UuMkU28GqGfQhqd1Inb8ayAJv16zwY2ff/81EybJO9G/g/xo21EFaZtZcIynJcdenQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738491573; c=relaxed/simple;
	bh=UfA4//QTnZqS/41BeSpDhDLgGf42Rld9djL6CVT0rrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SA+ZnL52aIzQaDV/KNe/0ub7RQvjlTuoGZ9G4579TKNws7ckylNzlSQXWOAVrqJWlPrwbnpLyYOhtyhPMzY3ZlNnBFn+gbkGvAcISGNaZGvb+oext0RLmCwSIKEBswMCwPld98TJcNz+I9/6FAI9WN7YuvZr112ny2599RYfAgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzpS+v3N; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzpS+v3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738491571; x=1770027571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UfA4//QTnZqS/41BeSpDhDLgGf42Rld9djL6CVT0rrQ=;
  b=KzpS+v3NI9qFJxJNFhrXKRW0FL5W8UG4nh2b0NyNmGu53ieL1+VxhOTL
   MPhEbg+2Cqad19yhfR83K7i926vS7CzgBr2KI6gWUnZyTJTe8fTSOguNJ
   2b6gVoyxk+EfjK9AUulYNWDGL1LYlolvN8nTxy0iS1Wi0CNm7NX6uceh2
   rWPt454qSkPCjJeS5NDPYQIdXSN+sIuacY3bD2O09X8UZPDA1IlEvNZ9K
   2yoY7sgiCg8nujeISaqnCu+D/bQO2rL2MC0q5gC+dPyexA3jf6JaHOITT
   Vuuq8o3uYQI10kG+hGHrtzu/tYBkdXnHe6gu29TLtBCDnTVNK0CA4w5d1
   A==;
X-CSE-ConnectionGUID: bpC9149tQemcXZRuZOtFuA==
X-CSE-MsgGUID: R47HOScxR6ukeOY1CUbHGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="61472470"
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="61472470"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 02:19:30 -0800
X-CSE-ConnectionGUID: p18ui9OWT0+K8yC0r4IrkQ==
X-CSE-MsgGUID: mfv87W8NQomRHrkWk4nDxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114642523"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Feb 2025 02:19:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teX4Y-000pYd-1D;
	Sun, 02 Feb 2025 10:19:26 +0000
Date: Sun, 2 Feb 2025 18:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:io_uring-epoll-wait 7/19] io_uring/io_uring.c:396:43:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202502021802.ulY6VEco-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-epoll-wait
head:   81a642b29d7d837fda2d86c4e1dc036effcfa4a7
commit: 4fbd68dbbb65f14f3fd40e1232045e06d168ecbd [7/19] io_uring: cache io_kiocb->flags in variable
config: hexagon-randconfig-r112-20250202 (https://download.01.org/0day-ci/archive/20250202/202502021802.ulY6VEco-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce: (https://download.01.org/0day-ci/archive/20250202/202502021802.ulY6VEco-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502021802.ulY6VEco-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:191:37: sparse: sparse: array of flexible structures
>> io_uring/io_uring.c:396:43: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int const req_flags @@     got restricted io_req_flags_t [usertype] flags @@
   io_uring/io_uring.c:396:43: sparse:     expected unsigned int const req_flags
   io_uring/io_uring.c:396:43: sparse:     got restricted io_req_flags_t [usertype] flags
>> io_uring/io_uring.c:398:25: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:404:25: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:410:26: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:415:25: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:417:25: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:419:25: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/io_uring.c:473:37: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int req_flags @@     got restricted io_req_flags_t [usertype] flags @@
   io_uring/io_uring.c:473:37: sparse:     expected unsigned int req_flags
   io_uring/io_uring.c:473:37: sparse:     got restricted io_req_flags_t [usertype] flags
   io_uring/io_uring.c:477:27: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/io_uring.c:478:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int req_flags @@     got restricted io_req_flags_t [usertype] flags @@
   io_uring/io_uring.c:478:27: sparse:     expected unsigned int req_flags
   io_uring/io_uring.c:478:27: sparse:     got restricted io_req_flags_t [usertype] flags
   io_uring/io_uring.c:484:25: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:487:40: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:488:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int req_flags @@     got restricted io_req_flags_t [usertype] flags @@
   io_uring/io_uring.c:488:27: sparse:     expected unsigned int req_flags
   io_uring/io_uring.c:488:27: sparse:     got restricted io_req_flags_t [usertype] flags
   io_uring/io_uring.c:490:39: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:1723:25: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:1733:43: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int const req_flags @@     got restricted io_req_flags_t [usertype] flags @@
   io_uring/io_uring.c:1733:43: sparse:     expected unsigned int const req_flags
   io_uring/io_uring.c:1733:43: sparse:     got restricted io_req_flags_t [usertype] flags
   io_uring/io_uring.c:1741:13: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:1798:43: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int const req_flags @@     got restricted io_req_flags_t [usertype] flags @@
   io_uring/io_uring.c:1798:43: sparse:     expected unsigned int const req_flags
   io_uring/io_uring.c:1798:43: sparse:     got restricted io_req_flags_t [usertype] flags
   io_uring/io_uring.c:1805:27: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:1832:25: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:1847:25: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:1865:33: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:609:36: sparse: sparse: context imbalance in 'io_req_post_cqe' - unexpected unlock
   io_uring/io_uring.c:1197:19: sparse: sparse: Using plain integer as NULL pointer
   io_uring/io_uring.c:1197:19: sparse: sparse: Using plain integer as NULL pointer
   io_uring/io_uring.c:611:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block
   io_uring/io_uring.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:175:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:175:41: sparse:     expected struct cred const *old
   include/linux/cred.h:175:41: sparse:     got struct cred const [noderef] __rcu *cred
   include/linux/cred.h:183:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *override_cred @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:183:51: sparse:     expected struct cred const *override_cred
   include/linux/cred.h:183:51: sparse:     got struct cred const [noderef] __rcu *cred
>> io_uring/io_uring.c:468:34: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int req_flags @@     got restricted io_req_flags_t [usertype] flags @@
   io_uring/io_uring.c:468:34: sparse:     expected unsigned int req_flags
   io_uring/io_uring.c:468:34: sparse:     got restricted io_req_flags_t [usertype] flags
   io_uring/io_uring.c:462:13: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:462:13: sparse: sparse: restricted io_req_flags_t degrades to integer

vim +396 io_uring/io_uring.c

   393	
   394	static void io_clean_op(struct io_kiocb *req)
   395	{
 > 396		const unsigned int req_flags = req->flags;
   397	
 > 398		if (req_flags & REQ_F_BUFFER_SELECTED) {
   399			spin_lock(&req->ctx->completion_lock);
   400			io_kbuf_drop(req);
   401			spin_unlock(&req->ctx->completion_lock);
   402		}
   403	
 > 404		if (req_flags & REQ_F_NEED_CLEANUP) {
   405			const struct io_cold_def *def = &io_cold_defs[req->opcode];
   406	
   407			if (def->cleanup)
   408				def->cleanup(req);
   409		}
   410		if ((req_flags & REQ_F_POLLED) && req->apoll) {
   411			kfree(req->apoll->double_poll);
   412			kfree(req->apoll);
   413			req->apoll = NULL;
   414		}
   415		if (req_flags & REQ_F_INFLIGHT)
   416			atomic_dec(&req->tctx->inflight_tracked);
   417		if (req_flags & REQ_F_CREDS)
   418			put_cred(req->creds);
   419		if (req_flags & REQ_F_ASYNC_DATA) {
   420			kfree(req->async_data);
   421			req->async_data = NULL;
   422		}
   423		req->flags &= ~IO_REQ_CLEAN_FLAGS;
   424	}
   425	
   426	static inline void io_req_track_inflight(struct io_kiocb *req)
   427	{
   428		if (!(req->flags & REQ_F_INFLIGHT)) {
   429			req->flags |= REQ_F_INFLIGHT;
   430			atomic_inc(&req->tctx->inflight_tracked);
   431		}
   432	}
   433	
   434	static struct io_kiocb *__io_prep_linked_timeout(struct io_kiocb *req)
   435	{
   436		if (WARN_ON_ONCE(!req->link))
   437			return NULL;
   438	
   439		req->flags &= ~REQ_F_ARM_LTIMEOUT;
   440		req->flags |= REQ_F_LINK_TIMEOUT;
   441	
   442		/* linked timeouts should have two refs once prep'ed */
   443		io_req_set_refcount(req);
   444		__io_req_set_refcount(req->link, 2);
   445		return req->link;
   446	}
   447	
   448	static inline struct io_kiocb *io_prep_linked_timeout(struct io_kiocb *req)
   449	{
   450		if (likely(!(req->flags & REQ_F_ARM_LTIMEOUT)))
   451			return NULL;
   452		return __io_prep_linked_timeout(req);
   453	}
   454	
   455	static noinline void __io_arm_ltimeout(struct io_kiocb *req)
   456	{
   457		io_queue_linked_timeout(__io_prep_linked_timeout(req));
   458	}
   459	
   460	static inline void _io_arm_ltimeout(struct io_kiocb *req, unsigned int req_flags)
   461	{
   462		if (unlikely(req_flags & REQ_F_ARM_LTIMEOUT))
   463			__io_arm_ltimeout(req);
   464	}
   465	
   466	static inline void io_arm_ltimeout(struct io_kiocb *req)
   467	{
 > 468		_io_arm_ltimeout(req, req->flags);
   469	}
   470	
   471	static void io_prep_async_work(struct io_kiocb *req)
   472	{
 > 473		unsigned int req_flags = req->flags;
   474		const struct io_issue_def *def = &io_issue_defs[req->opcode];
   475		struct io_ring_ctx *ctx = req->ctx;
   476	
   477		if (!(req_flags & REQ_F_CREDS)) {
 > 478			req_flags = req->flags |= REQ_F_CREDS;
   479			req->creds = get_current_cred();
   480		}
   481	
   482		req->work.list.next = NULL;
   483		atomic_set(&req->work.flags, 0);
   484		if (req_flags & REQ_F_FORCE_ASYNC)
   485			atomic_or(IO_WQ_WORK_CONCURRENT, &req->work.flags);
   486	
   487		if (req->file && !(req_flags & REQ_F_FIXED_FILE))
   488			req_flags = req->flags |= io_file_get_flags(req->file);
   489	
   490		if (req->file && (req_flags & REQ_F_ISREG)) {
   491			bool should_hash = def->hash_reg_file;
   492	
   493			/* don't serialize this request if the fs doesn't need it */
   494			if (should_hash && (req->file->f_flags & O_DIRECT) &&
   495			    (req->file->f_op->fop_flags & FOP_DIO_PARALLEL_WRITE))
   496				should_hash = false;
   497			if (should_hash || (ctx->flags & IORING_SETUP_IOPOLL))
   498				io_wq_hash_work(&req->work, file_inode(req->file));
   499		} else if (!req->file || !S_ISBLK(file_inode(req->file)->i_mode)) {
   500			if (def->unbound_nonreg_file)
   501				atomic_or(IO_WQ_WORK_UNBOUND, &req->work.flags);
   502		}
   503	}
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
