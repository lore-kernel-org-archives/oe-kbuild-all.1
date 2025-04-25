Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E8B136E37
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 05:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745558439; cv=none; b=rVnH3ZeHqDj9n457KEh/TPkZ6LJgH4F20a/fi9QDOGs8V5qkXdJxDtivC8L4NUl8CPMzgZBprXl3mqUx6oJMuPuMRENGo8g2zSb4+t24TZ6YoI/8/8mWlzzBXIHDUU9TL4TBzYacn+4SFOVVj/PpPv8+p/7vFFBQc8RlrvTBF4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745558439; c=relaxed/simple;
	bh=YgfellHQmxXYk65BoQlT5O/5ilMLx54xqR7J1ZTwCMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oW5RW4eFNirN41yIWU2LsitAUlxTdK2Bm8rVEvgQxEMOQiVXz5yMfkJZqBpBbQvdv45KxKgY1yLOIOzqgFKAr3SoJ3SBo2SGFkN96qE5hcQ5X7Qd5uKZ3lcL/AFyAa1bjUDgSQQA+imrPkDzCDo5xZbVPvoqJDZjuxLvdVJPr6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgRz3Ejq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgRz3Ejq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745558437; x=1777094437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YgfellHQmxXYk65BoQlT5O/5ilMLx54xqR7J1ZTwCMM=;
  b=DgRz3EjqP/r4deD8wgS1ch4pQ387G5Urci7lo82fkuc8WTqiTzAcQSL1
   TX2ZS+EG/yVXCRXa3emaptWQoTLueBZSv5IVxeWriLat1BgVin4jcaNqn
   GRCblGDNgtXonrC8/AqV7Uw+gL2Y+W0UxaWPlDO0RAhGl5DT2GbMuQjJ2
   QPIxaZGZO/L1+S0dRRCSaIlxS4ATr5uRZdxZ9Pjc+tIGPnsycabuUdPl7
   EGhsBK50uCXFSgDqG5tWDKQ0H0Dwp0thU5cTF0VQaL2Ku+ir5jO/H3PKz
   vUSv0P2AFO7Z14iGBXhrN/aOiW8XHzrx/yd0+YpMsTaBMQMPlXSL0jrT3
   A==;
X-CSE-ConnectionGUID: IqEkvdUCQC24SFNSmUyGJw==
X-CSE-MsgGUID: +O1BApbiQHyYya15WB9WKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="69704807"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="69704807"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 22:20:37 -0700
X-CSE-ConnectionGUID: RKfuaV8FRMyohPO9D31akQ==
X-CSE-MsgGUID: 9LH9dn/iQbmpNK9rDhUUvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133792781"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Apr 2025 22:20:36 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8BUH-0004qm-1k;
	Fri, 25 Apr 2025 05:20:33 +0000
Date: Fri, 25 Apr 2025 13:20:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1593/1593] block/blk-mq-sched.c:219:5:
 warning: no previous prototype for '__blk_mq_sched_dispatch_requests'
Message-ID: <202504251357.XH0GnYXx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Salman,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   08111f03f1ec65598372cfe9bf64f366d575671e
commit: c1ea82c0ddde70d5998c2f547520afbee10bea2a [1593/1593] block: Limit number of items taken from the I/O scheduler in one go
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250425/202504251357.XH0GnYXx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251357.XH0GnYXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251357.XH0GnYXx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq-sched.c:219:5: warning: no previous prototype for '__blk_mq_sched_dispatch_requests' [-Wmissing-prototypes]
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
