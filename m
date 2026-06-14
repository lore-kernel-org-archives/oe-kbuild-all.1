Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ABB2F25F3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 18:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781463403; cv=none; b=od4+3RS4g1Mvqvfx4oyJU+xLw0n+VlsSg+9Pj5h4kM0b7nfNLi5ztnIZNkW2hmrv8MyN/yXNEcx7tSSY4bvnuGSJhTNW0ufBYU5pVr0CM/4v9yH0XDLciQ9ZOh3JaWEWqRncJOe/JIDRI6YzohqiDlhvWJJNo++9hyWn55w64Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781463403; c=relaxed/simple;
	bh=3cf0Q+UQfEoHWbjcsgV8YmZzV0w0aKLXGoEOvD5/Ltw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dNtNA38NFhKpbCBfUTDzIXlSlBndmuIlQpHtVNKy+ual3NlV1x9q2OoU5+NKavUGXm1BdBHrijm6DwGs41s9DBvj0r1UfAEhmxz1ZkD51jrmwJsCLIOGEkYtHMpP6jJKr4sD/RgIg39IPnuHVta7zK0pMXflsTpj6M09lUHtJEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWv+3wfI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWv+3wfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781463402; x=1812999402;
  h=date:from:to:cc:subject:message-id;
  bh=3cf0Q+UQfEoHWbjcsgV8YmZzV0w0aKLXGoEOvD5/Ltw=;
  b=JWv+3wfINEGByp89aXly8CI7mR+NR0pTHJOeog/Qg9YMnCvesuoNtem5
   l68v9U3B96LIYdT263RFdk85cEYquG1jse42no1JKhVvLQ+PlxC2UfQC3
   5Us3W7HIXiE7U5OA7PHw34M5yPSnKyph7v2gHSZfS53UxAwDf0suoEGCK
   JQw5JQbWQAMcd67dFJyR+7UE6LL2xv3YzGQnVjaENN2/Ba4EVzG9B9fQj
   yM1p24a4/i3J3VDFluE5AANkut/mu3ZAV6bGWaNGhrLdjgeMZVuoaBIfZ
   Z2ItOCEGWk92Dv3cGUDB5TwutfleW4XNW4Ny6aOMBVGAO0M4LJoJj75cZ
   w==;
X-CSE-ConnectionGUID: oDVJ3aHrSGqTgUgIYtzlzw==
X-CSE-MsgGUID: B4SaQZObQG+d5NKN818sqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="69756796"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="69756796"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 11:56:42 -0700
X-CSE-ConnectionGUID: xjDLx83ORUOskbSR9iJmmA==
X-CSE-MsgGUID: e4Ax1LfFT82m74JORiUpYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="270957348"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2026 11:56:40 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYq0b-00000000R8S-2Huv;
	Sun, 14 Jun 2026 18:56:37 +0000
Date: Mon, 15 Jun 2026 02:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Fengnan Chang <fengnanchang@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Yu Kuai <yukuai3@huawei.com>
Subject: block/blk-mq.c:733:36: sparse: sparse: dereference of
 noderef expression
Message-ID: <202606150258.MpcYNdIz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: 89e1fb7ceffd898505ad7fa57acec0585bfaa2cc blk-mq: fix potential uaf for 'queue_hw_ctx'
date:   7 months ago
config: nios2-randconfig-r132-20260614 (https://download.01.org/0day-ci/archive/20260615/202606150258.MpcYNdIz-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150258.MpcYNdIz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 89e1fb7ceffd ("blk-mq: fix potential uaf for 'queue_hw_ctx'")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150258.MpcYNdIz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-mq.c:4380:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx @@
   block/blk-mq.c:4380:16: sparse:     expected void const *objp
   block/blk-mq.c:4380:16: sparse:     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx
   block/blk-mq.c:4525:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct blk_mq_hw_ctx **hctxs @@     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx @@
   block/blk-mq.c:4525:41: sparse:     expected struct blk_mq_hw_ctx **hctxs
   block/blk-mq.c:4525:41: sparse:     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx
>> block/blk-mq.c:733:36: sparse: sparse: dereference of noderef expression
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
