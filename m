Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000CF84039
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 20:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455880; cv=none; b=JcmTuKBm62o6gnDSlDMDBRZavKF6Ql6hM6eTJr/Wij01pD0QUx4dNNUJ7iT3HdFhBdAdTB8cBkRpiAOgJUSfJG4AffNlwFiyIMKQNM5h60iIkBAY+0meZUHcUdd5oL+XHJ/l0xFjhM2iUelVsLWNLy9zq2Cv4Ck9S4mCWJuIaWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455880; c=relaxed/simple;
	bh=sZXkGALJC0H+43H4OY+2xnU3UV+VsfhSliLnrZjfJgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yi9QzzdTB/8DkIzO4QXjz5Ki5PkRKOY/qXUd9Ary68+jeivIQdFxVd0abvRbMmTCHfQchqveNuWXiihR2sVkkFOys2kJ7B32BiJeHk+DKwVS13snjomvsAl25UViPNesvjTcCRgIqZkNhIwLwO/YfMW5BBcHj/6iVMcJuOV+jtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkeccRmQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkeccRmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736455878; x=1767991878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sZXkGALJC0H+43H4OY+2xnU3UV+VsfhSliLnrZjfJgs=;
  b=RkeccRmQrbBiiefNEtsqx/sRSOmuys3GNoDuPJam/R1aOe2aJPjEos56
   CCSDSlirMWh+TF7QTYcPGP48Y+3B/oGJiTe4TDOCC7uKo1R8bsDJm9Gkb
   9VInxFjtN62B9/7QZO+tsXeBMJqes+FpoqjUxQN3lqOAF22ZHoePTQ8d3
   wrQZ0eaZJHPMHowPdIaPMXFV7CiGjPr606DaXd8hemv5QlXX769lPSbmz
   F7YRs98Cvza9HmlYBKrC8oKh3B0E7/d/mwS4KgEkbb4A+D8hAYetcdxZD
   DABWHYpy9xGM3ZkFFgRv7wtRaIonwPu6NmgutZ46oxffqYM1/8ktO6Ebf
   A==;
X-CSE-ConnectionGUID: HHdJPQT8RpeOefBB2axjdA==
X-CSE-MsgGUID: ZnO+eGvYTEGuufge0AmtwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36758384"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36758384"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 12:51:18 -0800
X-CSE-ConnectionGUID: u/H2dQ8qSGWFuHPgZspacA==
X-CSE-MsgGUID: UTXhJtqgSi+YnxZvpC2j+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108620197"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Jan 2025 12:51:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVzUo-000I7v-0s;
	Thu, 09 Jan 2025 20:51:14 +0000
Date: Fri, 10 Jan 2025 04:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1402/1402] block/blk-mq-sched.c:219:5:
 warning: no previous prototype for '__blk_mq_sched_dispatch_requests'
Message-ID: <202501100428.rcoZkFtm-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-006-20250109 (https://download.01.org/0day-ci/archive/20250110/202501100428.rcoZkFtm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100428.rcoZkFtm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100428.rcoZkFtm-lkp@intel.com/

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
