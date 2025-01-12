Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C84B79E1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 01:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736646834; cv=none; b=DpBrWyeLU7XXdR2qv+ikGatBlKcgIb14t3Et0s4koo9lRns+Y05lRZ+RIxJ+Q6jtmvAVQDONhqadTkuVV0BBWpRo6/JvNQ0nfWsNndNKPodLukDpR7KmICGnE2BmcaycQnmKIwkT5+pKiKLEXOokzNjovGPXzqtMkswv2RUXQ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736646834; c=relaxed/simple;
	bh=s7hIZFtjKdz3TrfAgg9yF8j46fMwW4awkcLaSrX6iic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p5suKac6rn7p+0cV5rcT0p70UdqyWkPnq9+pEILa0K4Zkky1T/D02q5YXT79SPDi4xcnFJ3UKdMIx+hnLSvvc6dMpReb7UQgwYCk21NMy54RnTXA0UpoSMnny7jHEXptt6yWX7KIBbkUioqnGS/j1lCmOGi9q8zTE0vdNlGg6vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEn5qi/W; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEn5qi/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736646832; x=1768182832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s7hIZFtjKdz3TrfAgg9yF8j46fMwW4awkcLaSrX6iic=;
  b=KEn5qi/WSsjaeluLzIzraJ5iONKczG/O2yEWj8LCkxj/g2ElhBurUUcM
   knAZxKopCuz+6k5v7LvnjUwfdQKq8DB13U+MnEdtQIyG5V28NVCbcB0K+
   xTCxLnnPmgYGeFx6I3qYw6PavKvpjfoIDNQ8XKdcQnO0NCvRH7iN0xCeM
   m9Iw2MfoepGm/eieWbutgnxbFvtR6GzknxfPPdFF6yfN439e4cMAkXUlk
   LdrLe6hR42RyFdGBkJsrjY+Ub2xXRao4PYu1JANpjAwf+6XXoSLg+A2yN
   4W8iPx9XUO8+p7av4qoC90m2In4rX52QQniADGI+Oq7fl63zEMlB//zr3
   A==;
X-CSE-ConnectionGUID: O7tktFAcROS8/ze9r2q8rQ==
X-CSE-MsgGUID: t7AONZP+ROa1I/+vqIds7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36120802"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="36120802"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 17:53:52 -0800
X-CSE-ConnectionGUID: iMrDf7MFSzujuh2soTpi3w==
X-CSE-MsgGUID: YUaQQBqMTcSzMWAqeOMa6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103972163"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jan 2025 17:53:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWnAh-000LQs-2W;
	Sun, 12 Jan 2025 01:53:47 +0000
Date: Sun, 12 Jan 2025 09:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1402/1402] block/blk-mq-sched.c:219:5:
 warning: no previous prototype for function
 '__blk_mq_sched_dispatch_requests'
Message-ID: <202501120938.POMOjCGU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   97f98c391a1fd153ae010a2faf73f9e03270da6e
commit: c1ea82c0ddde70d5998c2f547520afbee10bea2a [1402/1402] block: Limit number of items taken from the I/O scheduler in one go
config: x86_64-buildonly-randconfig-004-20250109 (https://download.01.org/0day-ci/archive/20250112/202501120938.POMOjCGU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120938.POMOjCGU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120938.POMOjCGU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/blk-mq-sched.c:8:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> block/blk-mq-sched.c:219:5: warning: no previous prototype for function '__blk_mq_sched_dispatch_requests' [-Wmissing-prototypes]
     219 | int __blk_mq_sched_dispatch_requests(struct blk_mq_hw_ctx *hctx)
         |     ^
   block/blk-mq-sched.c:219:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     219 | int __blk_mq_sched_dispatch_requests(struct blk_mq_hw_ctx *hctx)
         | ^
         | static 
   2 warnings generated.


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
