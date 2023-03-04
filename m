Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE01023BC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 12:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677932454; x=1709468454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ljGcDI+pavKQMJU2f9csmlYkUwPs84a9T8sH6YF80T8=;
  b=MatENFNHCKmf+4chHe70twfDWEiB2K/e/whItGW3UcvC8xWHwOtpvHgk
   P7u9mgOSdtfOe7hyPdHGrwQL8ioA8Nmbsgi6Q6waL9EHj1YqJs85VH8uP
   E7GQwvbo70MC7phN4Ty2lvIwFpqANOA/VmqKuXiGdsvsJhAfoAoKm2T+C
   orGc0Lx6eFjo5z9Yu91lN7UfPcerlOvS3yNvNUsJzc8OxvzRiZeHh4pZv
   fVa/2v0nhSt2YggtUswi8OYht4I/VtEVkWbnXsFnZaDy4v28IQSiXrpeK
   ORSfKE0NJ4eYfatgcrkJkEmXhzGeNPdJW9fX6Y/AGBhHPgqjlMfCmb+QT
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="400073659"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="400073659"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 04:20:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="675653562"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="675653562"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Mar 2023 04:20:53 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYQse-00029I-1n;
	Sat, 04 Mar 2023 12:20:52 +0000
Date: Sat, 4 Mar 2023 20:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 23/214] block/blk-mq-sched.c:200:5:
 warning: no previous prototype for function
 '__blk_mq_sched_dispatch_requests'
Message-ID: <202303042037.HpF8W1AQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   273024806c52933197cd3cde4a439e71a726c27d
commit: 3bf0224336845b1c14493ba5b0ff119446fdb371 [23/214] block: Limit number of items taken from the I/O scheduler in one go
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230304/202303042037.HpF8W1AQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=3bf0224336845b1c14493ba5b0ff119446fdb371
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout 3bf0224336845b1c14493ba5b0ff119446fdb371
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303042037.HpF8W1AQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq-sched.c:200:5: warning: no previous prototype for function '__blk_mq_sched_dispatch_requests' [-Wmissing-prototypes]
   int __blk_mq_sched_dispatch_requests(struct blk_mq_hw_ctx *hctx)
       ^
   block/blk-mq-sched.c:200:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __blk_mq_sched_dispatch_requests(struct blk_mq_hw_ctx *hctx)
   ^
   static 
   1 warning generated.


vim +/__blk_mq_sched_dispatch_requests +200 block/blk-mq-sched.c

   199	
 > 200	int __blk_mq_sched_dispatch_requests(struct blk_mq_hw_ctx *hctx)
   201	{
   202		struct request_queue *q = hctx->queue;
   203		struct elevator_queue *e = q->elevator;
   204		const bool has_sched_dispatch = e && e->type->ops.dispatch_request;
   205		int ret = 0;
   206		LIST_HEAD(rq_list);
   207	
   208		/*
   209		 * If we have previous entries on our dispatch list, grab them first for
   210		 * more fair dispatch.
   211		 */
   212		if (!list_empty_careful(&hctx->dispatch)) {
   213			spin_lock(&hctx->lock);
   214			if (!list_empty(&hctx->dispatch))
   215				list_splice_init(&hctx->dispatch, &rq_list);
   216			spin_unlock(&hctx->lock);
   217		}
   218	
   219		/*
   220		 * Only ask the scheduler for requests, if we didn't have residual
   221		 * requests from the dispatch list. This is to avoid the case where
   222		 * we only ever dispatch a fraction of the requests available because
   223		 * of low device queue depth. Once we pull requests out of the IO
   224		 * scheduler, we can no longer merge or sort them. So it's best to
   225		 * leave them there for as long as we can. Mark the hw queue as
   226		 * needing a restart in that case.
   227		 *
   228		 * We want to dispatch from the scheduler if there was nothing
   229		 * on the dispatch list or we were able to dispatch from the
   230		 * dispatch list.
   231		 */
   232		if (!list_empty(&rq_list)) {
   233			blk_mq_sched_mark_restart_hctx(hctx);
   234			if (blk_mq_dispatch_rq_list(q, &rq_list, false)) {
   235				if (has_sched_dispatch)
   236					ret = blk_mq_do_dispatch_sched(hctx);
   237				else
   238					ret = blk_mq_do_dispatch_ctx(hctx);
   239			}
   240		} else if (has_sched_dispatch) {
   241			ret = blk_mq_do_dispatch_sched(hctx);
   242		} else if (hctx->dispatch_busy) {
   243			/* dequeue request one by one from sw queue if queue is busy */
   244			ret = blk_mq_do_dispatch_ctx(hctx);
   245		} else {
   246			blk_mq_flush_busy_ctxs(hctx, &rq_list);
   247			blk_mq_dispatch_rq_list(q, &rq_list, false);
   248		}
   249	
   250		return ret;
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
