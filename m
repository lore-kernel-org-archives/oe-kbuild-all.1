Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595E036A615
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 17:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761845695; cv=none; b=RyJ2Xd9wah3eU04E45jsbsswX93RnVJ4rRhJ8N3ZxbhumCg2TClN8bXKqHEzZRVpkoQt2d/y/4/8WpEyJai3gCQWllt3dnH9cCv+q5WDaSIxUOg15cMFJkoqZp4XhSKevbKUjPwCdtjlrAbXPLanGDSYFudViKaZsx/K5gcRRyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761845695; c=relaxed/simple;
	bh=NE7y6hC/x4ETt2Fyeyw2hbPRCEjiBzA12pwq+QarElc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q3vsusslRyddZ3b7yjLpF/MlkOLYyx+Q2pO07VdFVybVKvr4cJjf9Qu+p/V2fdC/kFw/WPWlA7T1tbPlRouAfFu/Fid8juukmOmaV7pPwwdiIS5mhSoavF4KXGvaXogUWCYkh29OS2Cub5HoDJM9cZq30/1WibDyQeDfEp0zF3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXf+qJGO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXf+qJGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761845693; x=1793381693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NE7y6hC/x4ETt2Fyeyw2hbPRCEjiBzA12pwq+QarElc=;
  b=JXf+qJGOV+BsCrGFlQCwKGSKEOqs9csc2sFsw7KFqEFTkGFUQyPJySgR
   j6FNOXr0SWO5Z/yfd0NqOtOeA78h2M5RHxHWwLRGlJJHhCE5kdXJTjrbm
   8Mo63bOvE/RJzkWcmcIif3jOAmNS1PLd8X2JCDvXMBvbiBpzTy3bhi3Ys
   ekkGWZxOkRtgsvFYKRXIO1dvOsIqRAuCObW15frN5LSzMOkkXPOVI5Sxv
   zvE8pzBwC1Xf9ZtsS3ECia9nGWfPlOijmhtLUzpjQZ3yGd2Ia+MBr2c5Q
   4AjsxTRrcl/JL5bpS+Y9mF8AY+aZGU11W/KjBgVJhVlAPRH3sJC6/T2wh
   w==;
X-CSE-ConnectionGUID: ssIC8KhHTXm4c6BI9YTDTQ==
X-CSE-MsgGUID: ZIXjYJzNSOOE8uJAN37vXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67649042"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="67649042"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 10:34:51 -0700
X-CSE-ConnectionGUID: qZmIMRNKQsm2ewEzsY8GlQ==
X-CSE-MsgGUID: f6uypzx1QKKeL5DkJ3jrhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="185223662"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 30 Oct 2025 10:34:50 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEWXv-000MKE-2k;
	Thu, 30 Oct 2025 17:34:47 +0000
Date: Fri, 31 Oct 2025 01:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1900/1900] block/blk-mq-sched.c:219:5:
 sparse: sparse: symbol '__blk_mq_sched_dispatch_requests' was not declared.
 Should it be static?
Message-ID: <202510310155.LwSuBIyA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c91cc1d257ea2f599d7cb6d2ec1fb76bacf12c2b
commit: c1ea82c0ddde70d5998c2f547520afbee10bea2a [1900/1900] block: Limit number of items taken from the I/O scheduler in one go
config: arm64-randconfig-r132-20251030 (https://download.01.org/0day-ci/archive/20251031/202510310155.LwSuBIyA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310155.LwSuBIyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310155.LwSuBIyA-lkp@intel.com/

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
