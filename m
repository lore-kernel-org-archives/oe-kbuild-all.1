Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540D1A2D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 06:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680850354; x=1712386354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XRRH3W5OAxOYkt+cFX2cDAy8WQS0KZcRpKYoryfW0o0=;
  b=bgXwra8RBgUelSOofJ75gdGmmBsXBWIJhifr+H+XXLe27AVBMzsUZkAx
   WnOgkAppnGXixlk98Ue9fDzkfDIjF6Aw8QnPGYink6tqOw12uGGavG2YN
   G4bQNlqFJZSi/JXMxOTUzrG2plJD4CVV7tdIv8T6mYVT+C5vacWC4M+k0
   vaDVtaKDu40OzkCQUqs2fF6lkwGefKwHNDU+xt/LQstA5acb4LtxXSFpv
   Vs6zrtc7mTT4sLAwBQylzMy1Y34QUxqvJzejQeP7yiezMDRQJITGzIiJS
   2EcDOW3J0wM/5HExEKztvU2HritLDuQFQVMCxhQjtBCD97Dj1H8XXTImt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="342945247"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="342945247"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 23:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="687435131"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="687435131"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Apr 2023 23:52:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkfxX-000SCy-1H;
	Fri, 07 Apr 2023 06:52:31 +0000
Date: Fri, 7 Apr 2023 14:52:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:block-for-next 6/13] block/blk-mq.c:1445:38: sparse:
 sparse: dereference of noderef expression
Message-ID: <202304071429.AqGkABnt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux block-for-next
head:   aa3a56b35f7420ada52515e9815855ed43da6726
commit: 41087062c7374352a6c618bde0afe946dfd13637 [6/13] block: One requeue list per hctx
config: alpha-randconfig-s042-20230403 (https://download.01.org/0day-ci/archive/20230407/202304071429.AqGkABnt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/bvanassche/linux/commit/41087062c7374352a6c618bde0afe946dfd13637
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche block-for-next
        git checkout 41087062c7374352a6c618bde0afe946dfd13637
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071429.AqGkABnt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-mq.c:1445:38: sparse: sparse: dereference of noderef expression

vim +1445 block/blk-mq.c

  1439	
  1440	void blk_mq_add_to_requeue_list(struct request *rq, bool at_head,
  1441					bool kick_requeue_list)
  1442	{
  1443		struct request_queue *q = rq->q;
  1444		struct blk_mq_hw_ctx *hctx = rq->mq_hctx ? :
> 1445			q->queue_ctx[0].hctxs[HCTX_TYPE_DEFAULT];
  1446		unsigned long flags;
  1447	
  1448		/*
  1449		 * We abuse this flag that is otherwise used by the I/O scheduler to
  1450		 * request head insertion from the workqueue.
  1451		 */
  1452		BUG_ON(rq->rq_flags & RQF_SOFTBARRIER);
  1453	
  1454		spin_lock_irqsave(&hctx->requeue_lock, flags);
  1455		if (at_head) {
  1456			rq->rq_flags |= RQF_SOFTBARRIER;
  1457			list_add(&rq->queuelist, &hctx->requeue_list);
  1458		} else {
  1459			list_add_tail(&rq->queuelist, &hctx->requeue_list);
  1460		}
  1461		spin_unlock_irqrestore(&hctx->requeue_lock, flags);
  1462	
  1463		if (kick_requeue_list)
  1464			blk_mq_kick_requeue_list(q);
  1465	}
  1466	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
