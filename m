Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4902EACD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 04:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762058727; cv=none; b=XySkFjDH+leYc9yaWJzSQTtuNpsjN4je0CV4QWmZyqyFYMSOhnQpHIlGCsVZ5XkoxiG7Hx0uDXrmTK+CIYgrxEOMAy5wqHrv2joA4Jhq7fz0n498lVV5iKwtgF+9qZ2Jp8glgWokXhDMhMvDovnInkAr6pGZviZjMWpCGvH/VN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762058727; c=relaxed/simple;
	bh=x1cEzSmb6Wlu43ZuJ9FZirXyos7dKMRSesVdq2KoCFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MBfnE8t55wg9SkJnTiL9vhgmhBAgQ/conbIKZONoIgZP22e5WIvvwSIckoYVqhqnA/ULKnkb9EkLGQA5O0nRXIhQ3VaG/8s48cyvI4wazE3beXGmRBW5xl/jUw2fdu3gNcuuScmmUC/hTn2kyMgXHkziseyK7KxhUEjELmZ5bIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGtaKKpZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGtaKKpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762058725; x=1793594725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x1cEzSmb6Wlu43ZuJ9FZirXyos7dKMRSesVdq2KoCFs=;
  b=QGtaKKpZSTnnJ37cS8G66IvqNP7kJEuV4wgGi/cgYmMpQ8gDyPCasJ1j
   GUTE5aAB0ra1D9gwt6dsC09pqY5Uw7LTsAHcLJsRCt67XS0WDKiFM4htk
   AAlNtxWvrOfQRmrmWdarJh5naHuNnuGSe5ltGXJNlIUUloHSMx0h1grv9
   4ce8YWm/wXNFTEjXTY6ChssGbNEdK9WIV3SijFdo+63a/W9NCLz5RW4Zl
   WLLD0AWwJMuxl0ENiJdMzeU9zF+r1/8WGZD64J04o0P7aJk5xkkLgEoHw
   EHqYfD7irH5Ffmhz9XJA6vYQcAWhL5TscHEqu+m2lxM+5KxNGfrVrZwDN
   g==;
X-CSE-ConnectionGUID: w1drJw4QRSKycwSLU+gqnw==
X-CSE-MsgGUID: bdrNj0NhTXmykOjbyMRvTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="63376974"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="63376974"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 21:45:24 -0700
X-CSE-ConnectionGUID: S2MFS0s6S3uIhdW608Um3Q==
X-CSE-MsgGUID: Pz+efe8sRgOWROcjTc6/WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="186254723"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Nov 2025 21:45:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFPxW-000P0O-2A;
	Sun, 02 Nov 2025 04:44:58 +0000
Date: Sun, 2 Nov 2025 12:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1900/1900] block/blk-mq-sched.c:219:5:
 sparse: sparse: symbol '__blk_mq_sched_dispatch_requests' was not declared.
 Should it be static?
Message-ID: <202511021213.bb4zk6r7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bca20ebb0eb886b6eef61fe75d9b476d02f92611
commit: c1ea82c0ddde70d5998c2f547520afbee10bea2a [1900/1900] block: Limit number of items taken from the I/O scheduler in one go
config: arm64-randconfig-r132-20251030 (https://download.01.org/0day-ci/archive/20251102/202511021213.bb4zk6r7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021213.bb4zk6r7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511021213.bb4zk6r7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-mq-sched.c:219:5: sparse: sparse: symbol '__blk_mq_sched_dispatch_requests' was not declared. Should it be static?
   block/blk-mq-sched.c:219:5: warning: no previous prototype for '__blk_mq_sched_dispatch_requests' [-Wmissing-prototypes]
     219 | int __blk_mq_sched_dispatch_requests(struct blk_mq_hw_ctx *hctx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/__blk_mq_sched_dispatch_requests +219 block/blk-mq-sched.c

   218	
 > 219	int __blk_mq_sched_dispatch_requests(struct blk_mq_hw_ctx *hctx)
   220	{
   221		struct request_queue *q = hctx->queue;
   222		struct elevator_queue *e = q->elevator;
   223		const bool has_sched_dispatch = e && e->type->ops.mq.dispatch_request;
   224		int ret = 0;
   225		LIST_HEAD(rq_list);
   226	
   227		/*
   228		 * If we have previous entries on our dispatch list, grab them first for
   229		 * more fair dispatch.
   230		 */
   231		if (!list_empty_careful(&hctx->dispatch)) {
   232			spin_lock(&hctx->lock);
   233			if (!list_empty(&hctx->dispatch))
   234				list_splice_init(&hctx->dispatch, &rq_list);
   235			spin_unlock(&hctx->lock);
   236		}
   237	
   238		/*
   239		 * Only ask the scheduler for requests, if we didn't have residual
   240		 * requests from the dispatch list. This is to avoid the case where
   241		 * we only ever dispatch a fraction of the requests available because
   242		 * of low device queue depth. Once we pull requests out of the IO
   243		 * scheduler, we can no longer merge or sort them. So it's best to
   244		 * leave them there for as long as we can. Mark the hw queue as
   245		 * needing a restart in that case.
   246		 *
   247		 * We want to dispatch from the scheduler if there was nothing
   248		 * on the dispatch list or we were able to dispatch from the
   249		 * dispatch list.
   250		 */
   251		if (!list_empty(&rq_list)) {
   252			blk_mq_sched_mark_restart_hctx(hctx);
   253			if (blk_mq_dispatch_rq_list(q, &rq_list, false)) {
   254				if (has_sched_dispatch)
   255					ret = blk_mq_do_dispatch_sched(hctx);
   256				else
   257					ret = blk_mq_do_dispatch_ctx(hctx);
   258			}
   259		} else if (has_sched_dispatch) {
   260			ret = blk_mq_do_dispatch_sched(hctx);
   261		} else if (hctx->dispatch_busy) {
   262			/* dequeue request one by one from sw queue if queue is busy */
   263			ret = blk_mq_do_dispatch_ctx(hctx);
   264		} else {
   265			blk_mq_flush_busy_ctxs(hctx, &rq_list);
   266			blk_mq_dispatch_rq_list(q, &rq_list, false);
   267		}
   268	
   269		return ret;
   270	}
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
