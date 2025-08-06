Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613E1221F15
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 21:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754514369; cv=none; b=AlQT9APgVV/wqRTsQx84z/iWYW20Kd0pxicwpf2ko4GMj9/c/D/761i/98FwmTBtaEc7ezxAzX7w/QbLV8iomM64fZJPQTunGO6MAT1mSdhiReq5pAcUtVfxaXhiQfEJXHyT++LLktLI9pMfp5iEtxKYU2lquSh4us74e9MOb44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754514369; c=relaxed/simple;
	bh=qoJNIy4KZ1kPikv3HZHoPRJuvIQmO3aD+23zyvCISX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bfYAhZKgrQ+B2SXxo1hTQ4f5bV5M5d26vupWX4/Km1B6neiWjvusrL3I4WGEIy/KW/dNMoO7Vp6BU6f9lEDj/gDh26g1kIYiF2aEdNW166YaWpv9oLSR1yENxyyBEMmCpwA8zwrGJAnHf7wfkow/okObBTf9mDVUc736nBEYzeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJebWHXg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJebWHXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754514369; x=1786050369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qoJNIy4KZ1kPikv3HZHoPRJuvIQmO3aD+23zyvCISX4=;
  b=EJebWHXguVquiDp8TOj0QjWznQjOcl4+nUJEtCN7zfr1Iba+zAqccF8J
   LUxhAK6UmmqTq05YzS8LmJc/f9mmtjfo54vvLhZsJAaTIm0FLeNarURMx
   bKGFmiayfDtKleckv7U16u/MgVIOgCtgiFVOpEFYEUaGK7YdzpEZiu3MI
   ZZ+F5IXAzhkAAPC9RDUUXB261fCGbak0mxzAY7vyRnBRAFE0dKxVKR9JN
   yPMObHJpqPWGcK2070q9xFU/HkocTBjaMNwq9eLdetJxT2yrHzl3uMRCd
   JGHgyRTtoeT5qkQRivBToM5jprnb+Six4iYwXps7mPOWwW34HReKXk6AA
   Q==;
X-CSE-ConnectionGUID: MaiqVaYQT7GY3qrfmO7Wsw==
X-CSE-MsgGUID: ce7YhNOCSZ2IgQ+PLismhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60681811"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60681811"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 14:06:08 -0700
X-CSE-ConnectionGUID: 0RXQ2lyuRO2rYzzmADcE0Q==
X-CSE-MsgGUID: TwxRh1pRSSe4ssim+BkGpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169310337"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2025 14:06:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujlK4-00026u-29;
	Wed, 06 Aug 2025 21:05:27 +0000
Date: Thu, 7 Aug 2025 05:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1753/1753] block/blk-mq-sched.c:219:5:
 warning: no previous prototype for function
 '__blk_mq_sched_dispatch_requests'
Message-ID: <202508070424.1zkCZb3G-lkp@intel.com>
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
head:   464c0bf980f96a307759f809825ab0a3b59f8b70
commit: c1ea82c0ddde70d5998c2f547520afbee10bea2a [1753/1753] block: Limit number of items taken from the I/O scheduler in one go
config: x86_64-buildonly-randconfig-006-20250806 (https://download.01.org/0day-ci/archive/20250807/202508070424.1zkCZb3G-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070424.1zkCZb3G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070424.1zkCZb3G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq-sched.c:219:5: warning: no previous prototype for function '__blk_mq_sched_dispatch_requests' [-Wmissing-prototypes]
     219 | int __blk_mq_sched_dispatch_requests(struct blk_mq_hw_ctx *hctx)
         |     ^
   block/blk-mq-sched.c:219:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     219 | int __blk_mq_sched_dispatch_requests(struct blk_mq_hw_ctx *hctx)
         | ^
         | static 
   1 warning generated.


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
