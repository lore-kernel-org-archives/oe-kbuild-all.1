Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D3583A14
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 21:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758575355; cv=none; b=Nry6Bj7mqADD9SoPLdl+RZd3HIYDOFZk0D3Tn04OGQDmxnS0ugL5oDgPo3/QtbynXhhXLiXF+tdh/siZ+uHepHYDorn7x/o27DKGWXWO2XDRBhBFiieKsC1KoieBUtn11Hpx4fJvBaZqnHsHDS1ZFCNzB0dVVeODJv4B5PI0f1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758575355; c=relaxed/simple;
	bh=Ngv1jOieNx7Bs4wnX6+v3y8mIU+N2ym6qd4NX3zzz2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uk6/rONmIk9eDqMn3NZxwps/nSAwm6yOuQ30NRE1A6om1XIJkwBXVoXvB15r8qqA5yJWfBY3PY3Jg7V+tOe+cH9c+Q/1Ua0vhiwcRsV5vHvrFTHZxRKK6XAsr6wjFKHVyIYokrJ3sG2WToQrGbATQA9K+RE67FfRl2x0vi2TMXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1EITXNb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1EITXNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758575353; x=1790111353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ngv1jOieNx7Bs4wnX6+v3y8mIU+N2ym6qd4NX3zzz2M=;
  b=b1EITXNbF/GssmQ3VPZ+VJ85sGZ1uPEj5HLSUo2er2r1zvthNKGhKg/O
   PmKzr10FwWJ9B+19av1jMZ3rupbi65raq4cdKePiAVz0Mewk5ARNovzp0
   WfVSKhuoepNqbfI+gjJkiz6I2w+ZD4CI9CUQ4JctZLihoGxsUKLyod4/4
   +GLOmNT8bMiCtONlfveqLV7dsSa5JGiPv9282Hd3cP/ZMiBX3zDLt5IGe
   SBazVFcUQb89npsK6r9wlm8qRWMGtmQxOKWsBo/bqj+Ld2cNV0ehAZfmB
   BoD9Ehf5gE9dH/DFVGjHilKZ8baSiyG0b15gtZEpnKT3Grp4QHA8MdUol
   Q==;
X-CSE-ConnectionGUID: kssI10bWSV2CJnlJMjuuCQ==
X-CSE-MsgGUID: IJ+K1eNJToSR7iAhbwc0+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61013248"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="61013248"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 14:09:12 -0700
X-CSE-ConnectionGUID: 19OMqzz7RcuSW0Z3cIAX4w==
X-CSE-MsgGUID: iRe1qLvESKSniYWkuoJ87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="177358857"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2025 14:09:11 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0nmW-0002U5-39;
	Mon, 22 Sep 2025 21:09:08 +0000
Date: Tue, 23 Sep 2025 05:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 146/146] block/blk-mq.c:324:26: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202509230528.nXmIOXXP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c73db7ebb024f59416db0cf136dc2d4b9dbc3695
commit: b0e21ed5b9412dbf0d10b4a027fe130ac0ec166f [146/146] block: cache rq_flags inside blk_mq_rq_ctx_init()
config: arm64-randconfig-r113-20250923 (https://download.01.org/0day-ci/archive/20250923/202509230528.nXmIOXXP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230528.nXmIOXXP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509230528.nXmIOXXP-lkp@intel.com/

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
