Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7BC354ACC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552502; cv=none; b=oJMc/1XERHAGN04hDYmes27/N42fmDm3VsFfsmlnjKR/Bi79E4glyWJ0hPhWxuaazibjm+T/vXoA03ZmSjNLwe3H8ng6zDNAPef5fQdBlz1XONfn9sTBhyaFShDjomew/5ay/MFBPsTfbKDw/+tv/civFpJTjoqODQV0CT6L69Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552502; c=relaxed/simple;
	bh=2/f89hI7LELryvZdyH3KBey4321fmi2Xgb05wZI3R2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ATZ6FtGxwA4ngss1S4jz/n5EnMXHFfQaCHvqtMTm2oO4k9M6A3VeeEBE2Oph+8NnZIDVw+MWfUcxCYJJQRX2d4ZwTkR7poIqG/ObKVmqOOKUIbghLXOdCr/u7bosy94pXfDOCTYaqYRD+TA8hhKSOnL6GKWmOxxp3hEn7MUHX84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYva4gFh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYva4gFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763552500; x=1795088500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2/f89hI7LELryvZdyH3KBey4321fmi2Xgb05wZI3R2U=;
  b=IYva4gFh6zVcP1IuRsQ4M1HDe0JlTr6tOImt1Acf7422HkooV6mRqYGz
   oR3jzHMtLA14DSpKTJTyg7YGlK0UyfgjPQsyP5T/Y7VoEmhl6c8mlNvDR
   Bup+YX/9hDRKhBb8/Og2A5Q9C6GE2e+9YBmXzCIADRSAWTx77CZIO1QvE
   OGh/Mvl+Eetu2jSjXPu+HLqEVF3U+XH0eJBtiGcifildCEZel7F7kblyU
   pChHhez4M49JsBLZS/34dtmPR4jH3MwroQlib8Sji5siPolqqhZ4j8uTB
   Yd8NetIg//5mu6+CPBxG58AiWf0CXKNzAsMa1dI93L4bMPcmWe1Kq3fGc
   Q==;
X-CSE-ConnectionGUID: ThMFX7s6RnW753D6+uqnxA==
X-CSE-MsgGUID: OtlQa7A0RyGc8sfZukCOvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65522960"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65522960"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 03:41:40 -0800
X-CSE-ConnectionGUID: jxnBRpBrTKu6PmMTuvKJ6A==
X-CSE-MsgGUID: 4ufCEUmFQM+sz+xz9oxRgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191287334"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2025 03:41:39 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLgZ7-0002pX-1Q;
	Wed, 19 Nov 2025 11:41:37 +0000
Date: Wed, 19 Nov 2025 19:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 328/328] block/blk-mq.c:324:26: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202511191917.DsIpXs7g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   bb0e74acaf990260e6fbe36e2fe42ec210016242
commit: b0e21ed5b9412dbf0d10b4a027fe130ac0ec166f [328/328] block: cache rq_flags inside blk_mq_rq_ctx_init()
config: arm64-randconfig-r132-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191917.DsIpXs7g-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191917.DsIpXs7g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191917.DsIpXs7g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-mq.c:324:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int rq_flags @@     got restricted req_flags_t [usertype] @@
   block/blk-mq.c:324:26: sparse:     expected unsigned int rq_flags
   block/blk-mq.c:324:26: sparse:     got restricted req_flags_t [usertype]
>> block/blk-mq.c:333:26: sparse: sparse: invalid assignment: |=
   block/blk-mq.c:333:26: sparse:    left side has type unsigned int
   block/blk-mq.c:333:26: sparse:    right side has type restricted req_flags_t
   block/blk-mq.c:335:26: sparse: sparse: invalid assignment: |=
   block/blk-mq.c:335:26: sparse:    left side has type unsigned int
   block/blk-mq.c:335:26: sparse:    right side has type restricted req_flags_t
>> block/blk-mq.c:336:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted req_flags_t [usertype] rq_flags @@     got unsigned int rq_flags @@
   block/blk-mq.c:336:22: sparse:     expected restricted req_flags_t [usertype] rq_flags
   block/blk-mq.c:336:22: sparse:     got unsigned int rq_flags

vim +324 block/blk-mq.c

   311	
   312	static struct request *blk_mq_rq_ctx_init(struct blk_mq_alloc_data *data,
   313			unsigned int tag, u64 alloc_time_ns)
   314	{
   315		struct blk_mq_ctx *ctx = data->ctx;
   316		struct blk_mq_hw_ctx *hctx = data->hctx;
   317		struct request_queue *q = data->q;
   318		struct elevator_queue *e = q->elevator;
   319		struct blk_mq_tags *tags = blk_mq_tags_from_data(data);
   320		struct request *rq = tags->static_rqs[tag];
   321		unsigned int rq_flags = 0;
   322	
   323		if (e) {
 > 324			rq_flags = RQF_ELV;
   325			rq->tag = BLK_MQ_NO_TAG;
   326			rq->internal_tag = tag;
   327		} else {
   328			rq->tag = tag;
   329			rq->internal_tag = BLK_MQ_NO_TAG;
   330		}
   331	
   332		if (data->flags & BLK_MQ_REQ_PM)
 > 333			rq_flags |= RQF_PM;
   334		if (blk_queue_io_stat(q))
   335			rq_flags |= RQF_IO_STAT;
 > 336		rq->rq_flags = rq_flags;
   337	
   338		if (blk_mq_need_time_stamp(rq))
   339			rq->start_time_ns = ktime_get_ns();
   340		else
   341			rq->start_time_ns = 0;
   342		/* csd/requeue_work/fifo_time is initialized before use */
   343		rq->q = q;
   344		rq->mq_ctx = ctx;
   345		rq->mq_hctx = hctx;
   346		rq->cmd_flags = data->cmd_flags;
   347		rq->rq_disk = NULL;
   348		rq->part = NULL;
   349	#ifdef CONFIG_BLK_RQ_ALLOC_TIME
   350		rq->alloc_time_ns = alloc_time_ns;
   351	#endif
   352		rq->io_start_time_ns = 0;
   353		rq->stats_sectors = 0;
   354		rq->nr_phys_segments = 0;
   355	#if defined(CONFIG_BLK_DEV_INTEGRITY)
   356		rq->nr_integrity_segments = 0;
   357	#endif
   358		rq->timeout = 0;
   359		rq->end_io = NULL;
   360		rq->end_io_data = NULL;
   361	
   362		data->ctx->rq_dispatched[op_is_sync(data->cmd_flags)]++;
   363		blk_crypto_rq_set_defaults(rq);
   364		INIT_LIST_HEAD(&rq->queuelist);
   365		/* tag was already set */
   366		WRITE_ONCE(rq->deadline, 0);
   367		refcount_set(&rq->ref, 1);
   368	
   369		if (rq->rq_flags & RQF_ELV) {
   370			struct elevator_queue *e = data->q->elevator;
   371	
   372			rq->elv.icq = NULL;
   373			INIT_HLIST_NODE(&rq->hash);
   374			RB_CLEAR_NODE(&rq->rb_node);
   375	
   376			if (!op_is_flush(data->cmd_flags) &&
   377			    e->type->ops.prepare_request) {
   378				if (e->type->icq_cache)
   379					blk_mq_sched_assign_ioc(rq);
   380	
   381				e->type->ops.prepare_request(rq);
   382				rq->rq_flags |= RQF_ELVPRIV;
   383			}
   384		}
   385	
   386		data->hctx->queued++;
   387		return rq;
   388	}
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
