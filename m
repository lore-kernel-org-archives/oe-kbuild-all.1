Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D030C3A5E8B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 03:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778729678; cv=none; b=bhlwrRP91slV7MGJzoNe40RwbZY2lslNSwsnSuCwQSONYRbhjjLCkg3VF67Gj/oAFieTLOcBmwziz+5kQ+Ltq3QqpCbwKUTue4cts2BDf2WOSEzGPleaNtyWbGNefb9zkVfxNjZ+0oqpcPVYeTJwqn/1FAwdq2VSU8R7JtKGiwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778729678; c=relaxed/simple;
	bh=j7AMqXR6TNgwgfrr8HWrlRzLncajKmDZdU0ySoJPWUw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QFIEqjHu4GL3MB3+aftDd5fqp9UI+fxeZQvEL0nxf1aemhVwEIm3bZ59gQTOQHWkRSirHzo1XBRK+ky5Z75AjfAwGGK5XI07yk9uaDL7UqmAbO8u/5a4znT8IJqGIEugJi4X4ySYa8mkAe3ksUwhW+h5T3XSZPMJ7cT11kN3ENE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4hLHla5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4hLHla5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778729677; x=1810265677;
  h=date:from:to:cc:subject:message-id;
  bh=j7AMqXR6TNgwgfrr8HWrlRzLncajKmDZdU0ySoJPWUw=;
  b=C4hLHla51mg1goWYk0bsYrV3TcRsw8tCiyCvQ+5TixSjmBdmqkz/h3eJ
   Rp/+pCmBs6ABK61b1xPnuLTa48iucRO+TA9kaR6m2AdMWiCO1hnML+Ajt
   aG2Xsh55sKJ6gp9JYad8fry7xhPCpV0hWHnWYnDwbzKszO7Uzd3zA2MQW
   cxKD6zcd8/XwD3J1HLtOZWEmqfQeeE7DoURsEaBgFAUQfIbZx6F9j16OW
   orYHnITrgYFQN+ywilsh5iEP3zyWQ2jtd7com9KjrmBm+bbOi09mLfdz1
   ud1yN968FfsKRPxCYN8XckmVXaRhttd75ns02hfr9AJxqptYuarUHaTJt
   Q==;
X-CSE-ConnectionGUID: NmA+NFvNRnmPY2s1e+lc+Q==
X-CSE-MsgGUID: +h1uaVe3QSu+2OXveyIoZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79648533"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79648533"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 20:34:33 -0700
X-CSE-ConnectionGUID: v0IWM+bmR12nOKWn3Z9XXg==
X-CSE-MsgGUID: Arix3K3/SIGa1Jopzz68Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="242598646"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 May 2026 20:34:32 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNMqC-000000005kl-1wEF;
	Thu, 14 May 2026 03:34:28 +0000
Date: Thu, 14 May 2026 11:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: Fengnan Chang <fengnanchang@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Yu Kuai <yukuai3@huawei.com>
Subject: block/blk-mq.c:733:36: sparse: sparse: dereference of
 noderef expression
Message-ID: <202605141138.hMZzR7pQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 89e1fb7ceffd898505ad7fa57acec0585bfaa2cc blk-mq: fix potential uaf for 'queue_hw_ctx'
date:   6 months ago
config: m68k-randconfig-r122-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141138.hMZzR7pQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141138.hMZzR7pQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 89e1fb7ceffd ("blk-mq: fix potential uaf for 'queue_hw_ctx'")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141138.hMZzR7pQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-mq.c:4380:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx @@
   block/blk-mq.c:4380:16: sparse:     expected void const *objp
   block/blk-mq.c:4380:16: sparse:     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx
   block/blk-mq.c:4525:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct blk_mq_hw_ctx **hctxs @@     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx @@
   block/blk-mq.c:4525:41: sparse:     expected struct blk_mq_hw_ctx **hctxs
   block/blk-mq.c:4525:41: sparse:     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx
>> block/blk-mq.c:733:36: sparse: sparse: dereference of noderef expression
   block/blk-mq.c:2326:9: sparse: sparse: context imbalance in 'blk_mq_run_hw_queue' - unexpected unlock
   block/blk-mq.c:2551:9: sparse: sparse: context imbalance in 'blk_mq_run_work_fn' - unexpected unlock
   block/blk-mq.c:2587:17: sparse: sparse: context imbalance in 'blk_mq_insert_requests' - unexpected unlock
   block/blk-mq.c:2892:17: sparse: sparse: context imbalance in 'blk_mq_dispatch_queue_requests' - unexpected unlock
   block/blk-mq.c:3242:17: sparse: sparse: context imbalance in 'blk_mq_submit_bio' - unexpected unlock
   block/blk-mq.c:3677:53: sparse: sparse: context imbalance in 'blk_mq_hctx_has_requests' - unexpected unlock
   block/blk-mq.c: note: in included file:
   block/blk-mq.h:87:31: sparse: sparse: dereference of noderef expression
   block/blk-mq.h:87:31: sparse: sparse: dereference of noderef expression
   block/blk-mq.h:87:31: sparse: sparse: dereference of noderef expression
   block/blk-mq.h:87:31: sparse: sparse: dereference of noderef expression
   block/blk-mq.h:87:31: sparse: sparse: dereference of noderef expression
   block/blk-mq.h:87:31: sparse: sparse: dereference of noderef expression
   block/blk-mq.c:5211:48: sparse: sparse: dereference of noderef expression

vim +733 block/blk-mq.c

320ae51feed5c2f Jens Axboe        2013-10-24  686  
cd6ce1482fd9e69 Bart Van Assche   2017-06-20  687  struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
16458cf3bd15e56 Bart Van Assche   2022-07-14  688  	blk_opf_t opf, blk_mq_req_flags_t flags, unsigned int hctx_idx)
1f5bd336b915056 Ming Lin          2016-06-13  689  {
e6e7abffe386b61 Christoph Hellwig 2020-05-29  690  	struct blk_mq_alloc_data data = {
e6e7abffe386b61 Christoph Hellwig 2020-05-29  691  		.q		= q,
e6e7abffe386b61 Christoph Hellwig 2020-05-29  692  		.flags		= flags,
9b79f86e06283ba Jens Axboe        2025-04-15  693  		.shallow_depth	= 0,
16458cf3bd15e56 Bart Van Assche   2022-07-14  694  		.cmd_flags	= opf,
9b79f86e06283ba Jens Axboe        2025-04-15  695  		.rq_flags	= 0,
47c122e35d7e43b Jens Axboe        2021-10-06  696  		.nr_tags	= 1,
9b79f86e06283ba Jens Axboe        2025-04-15  697  		.cached_rqs	= NULL,
9b79f86e06283ba Jens Axboe        2025-04-15  698  		.ctx		= NULL,
9b79f86e06283ba Jens Axboe        2025-04-15  699  		.hctx		= NULL
e6e7abffe386b61 Christoph Hellwig 2020-05-29  700  	};
600c3b0cea784aa Christoph Hellwig 2020-05-29  701  	u64 alloc_time_ns = 0;
e3c5a78cdb6237b John Garry        2022-10-26  702  	struct request *rq;
6d2809d51a5079f Omar Sandoval     2017-02-27  703  	unsigned int cpu;
600c3b0cea784aa Christoph Hellwig 2020-05-29  704  	unsigned int tag;
1f5bd336b915056 Ming Lin          2016-06-13  705  	int ret;
1f5bd336b915056 Ming Lin          2016-06-13  706  
600c3b0cea784aa Christoph Hellwig 2020-05-29  707  	/* alloc_time includes depth and tag waits */
600c3b0cea784aa Christoph Hellwig 2020-05-29  708  	if (blk_queue_rq_alloc_time(q))
08420cf70cfb32e Jens Axboe        2024-01-15  709  		alloc_time_ns = blk_time_get_ns();
600c3b0cea784aa Christoph Hellwig 2020-05-29  710  
1f5bd336b915056 Ming Lin          2016-06-13  711  	/*
1f5bd336b915056 Ming Lin          2016-06-13  712  	 * If the tag allocator sleeps we could get an allocation for a
1f5bd336b915056 Ming Lin          2016-06-13  713  	 * different hardware context.  No need to complicate the low level
1f5bd336b915056 Ming Lin          2016-06-13  714  	 * allocator for this for the rare use case of a command tied to
1f5bd336b915056 Ming Lin          2016-06-13  715  	 * a specific queue.
1f5bd336b915056 Ming Lin          2016-06-13  716  	 */
6ee858a3d3270a6 Kemeng Shi        2023-01-18  717  	if (WARN_ON_ONCE(!(flags & BLK_MQ_REQ_NOWAIT)) ||
6ee858a3d3270a6 Kemeng Shi        2023-01-18  718  	    WARN_ON_ONCE(!(flags & BLK_MQ_REQ_RESERVED)))
1f5bd336b915056 Ming Lin          2016-06-13  719  		return ERR_PTR(-EINVAL);
1f5bd336b915056 Ming Lin          2016-06-13  720  
1f5bd336b915056 Ming Lin          2016-06-13  721  	if (hctx_idx >= q->nr_hw_queues)
1f5bd336b915056 Ming Lin          2016-06-13  722  		return ERR_PTR(-EIO);
1f5bd336b915056 Ming Lin          2016-06-13  723  
3a0a529971ec4e2 Bart Van Assche   2017-11-09  724  	ret = blk_queue_enter(q, flags);
1f5bd336b915056 Ming Lin          2016-06-13  725  	if (ret)
1f5bd336b915056 Ming Lin          2016-06-13  726  		return ERR_PTR(ret);
1f5bd336b915056 Ming Lin          2016-06-13  727  
c8712c6a674e338 Christoph Hellwig 2016-09-23  728  	/*
c8712c6a674e338 Christoph Hellwig 2016-09-23  729  	 * Check if the hardware context is actually mapped to anything.
c8712c6a674e338 Christoph Hellwig 2016-09-23  730  	 * If not tell the caller that it should skip this queue.
c8712c6a674e338 Christoph Hellwig 2016-09-23  731  	 */
a5ea5811058ddb9 Christoph Hellwig 2020-05-16  732  	ret = -EXDEV;
d0c98769ee7d5db Fengnan Chang     2025-11-28 @733  	data.hctx = q->queue_hw_ctx[hctx_idx];
e6e7abffe386b61 Christoph Hellwig 2020-05-29  734  	if (!blk_mq_hw_queue_mapped(data.hctx))
a5ea5811058ddb9 Christoph Hellwig 2020-05-16  735  		goto out_queue_exit;
e6e7abffe386b61 Christoph Hellwig 2020-05-29  736  	cpu = cpumask_first_and(data.hctx->cpumask, cpu_online_mask);
14dc7a18abbe417 Bart Van Assche   2022-06-15  737  	if (cpu >= nr_cpu_ids)
14dc7a18abbe417 Bart Van Assche   2022-06-15  738  		goto out_queue_exit;
e6e7abffe386b61 Christoph Hellwig 2020-05-29  739  	data.ctx = __blk_mq_get_ctx(q, cpu);
1f5bd336b915056 Ming Lin          2016-06-13  740  
dd6216bb16e83e3 Christoph Hellwig 2023-05-18  741  	if (q->elevator)
dd6216bb16e83e3 Christoph Hellwig 2023-05-18  742  		data.rq_flags |= RQF_SCHED_TAGS;
781dd830ec4f4d5 Jens Axboe        2021-11-02  743  	else
dd6216bb16e83e3 Christoph Hellwig 2023-05-18  744  		blk_mq_tag_busy(data.hctx);
600c3b0cea784aa Christoph Hellwig 2020-05-29  745  
99e48cd6855e953 John Garry        2022-07-06  746  	if (flags & BLK_MQ_REQ_RESERVED)
99e48cd6855e953 John Garry        2022-07-06  747  		data.rq_flags |= RQF_RESV;
99e48cd6855e953 John Garry        2022-07-06  748  
a5ea5811058ddb9 Christoph Hellwig 2020-05-16  749  	ret = -EWOULDBLOCK;
600c3b0cea784aa Christoph Hellwig 2020-05-29  750  	tag = blk_mq_get_tag(&data);
600c3b0cea784aa Christoph Hellwig 2020-05-29  751  	if (tag == BLK_MQ_NO_TAG)
a5ea5811058ddb9 Christoph Hellwig 2020-05-16  752  		goto out_queue_exit;
b8643d682669994 Chengming Zhou    2023-09-13  753  	if (!(data.rq_flags & RQF_SCHED_TAGS))
b8643d682669994 Chengming Zhou    2023-09-13  754  		blk_mq_inc_active_requests(data.hctx);
5c17f45e91f5035 Chengming Zhou    2023-07-10  755  	rq = blk_mq_rq_ctx_init(&data, blk_mq_tags_from_data(&data), tag);
5c17f45e91f5035 Chengming Zhou    2023-07-10  756  	blk_mq_rq_time_init(rq, alloc_time_ns);
e3c5a78cdb6237b John Garry        2022-10-26  757  	rq->__data_len = 0;
2f6b2565d43cdb5 Keith Busch       2025-10-14  758  	rq->phys_gap_bit = 0;
e3c5a78cdb6237b John Garry        2022-10-26  759  	rq->__sector = (sector_t) -1;
e3c5a78cdb6237b John Garry        2022-10-26  760  	rq->bio = rq->biotail = NULL;
e3c5a78cdb6237b John Garry        2022-10-26  761  	return rq;
600c3b0cea784aa Christoph Hellwig 2020-05-29  762  
a5ea5811058ddb9 Christoph Hellwig 2020-05-16  763  out_queue_exit:
a5ea5811058ddb9 Christoph Hellwig 2020-05-16  764  	blk_queue_exit(q);
a5ea5811058ddb9 Christoph Hellwig 2020-05-16  765  	return ERR_PTR(ret);
1f5bd336b915056 Ming Lin          2016-06-13  766  }
1f5bd336b915056 Ming Lin          2016-06-13  767  EXPORT_SYMBOL_GPL(blk_mq_alloc_request_hctx);
1f5bd336b915056 Ming Lin          2016-06-13  768  

:::::: The code at line 733 was first introduced by commit
:::::: d0c98769ee7d5db8d699a270690639cde1766cd4 blk-mq: use array manage hctx map instead of xarray

:::::: TO: Fengnan Chang <fengnanchang@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
