Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D728F26C391
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 06:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773031; cv=none; b=JqUfD471tQmu7Ufc0llJ/phYipO8k62/9q7qy7sRCiRzuOFvhEOHj0gDt7jUVOdSrDNydqW5U+Kpyc3VNgKv+wNuBL5RiUaD+bmVrT7FOpFBiGS6P4ZyKh5VmShFi+qpmDtLpfwBO8NijsubRyIy1OYuY1Ke07HaCOyPenQrk8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773031; c=relaxed/simple;
	bh=CyQkqVt7McQxQ60sIBaGVjwnu56Kn19MkTqHdJBjAU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5ow5kAXG0o31oxoLLa3jvI0HDYA/wCrTE7Uk3ToCs5dOdcFEM6L3NriN6fxZ6t9BIUoltPYemm2GyCKWElEsMPuI61ZcRJvutN3k5ppkmLTSpHGrB0dsytkqdFVUdE+U4kXhcSDN+jQbiWvcVB1jsUF0SYcrbp54aW5un9anM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZ2Pq7Ri; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZ2Pq7Ri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746773030; x=1778309030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CyQkqVt7McQxQ60sIBaGVjwnu56Kn19MkTqHdJBjAU4=;
  b=bZ2Pq7RikYU5ktt2/pzZI98p7kZo2lqb9/J+wOo9Xn7ZA0X7IuX+Ryjh
   cFJWbSscN6murWNWv8ShrBUySNN2IKa2iPofll60syq5N6Ssb6IbPn7qz
   NFUHjt7QCI4kOy/3C5Yo3acaAMlWNbLMiKqeUZNqkuQphFShXiwZ7w97v
   B3n97P6r1VZumNjA1Tc1my0Cc2Q6lgkOtdKXs/D+p6zW/xVwRSit9mJTE
   c8/Pd9vENZHDTDIZkgl9oSmcWf+3+DJqa8lvYqP2cl68r0HX+Aj7g6q1/
   MREnIJOv1lE5cmGXyGrSq2q9/x2KiBiKqig4sZGw1TFaCwDSwyj/5/3qo
   Q==;
X-CSE-ConnectionGUID: HhTBYK1hQFyy7GZ2VALO+w==
X-CSE-MsgGUID: CwT9Wi8vStO0EAVNdLsDAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59215203"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59215203"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 23:43:35 -0700
X-CSE-ConnectionGUID: HiQdzwuYRjeEFzAXcVMsdA==
X-CSE-MsgGUID: Gl6wx1N0SI67AyfFIPL9qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="137455297"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 May 2025 23:43:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDHSF-000Bix-0z;
	Fri, 09 May 2025 06:43:31 +0000
Date: Fri, 9 May 2025 14:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] block/blk-mq.c:324:26: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202505091427.p534vE3q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: b0e21ed5b9412dbf0d10b4a027fe130ac0ec166f [0/1] block: cache rq_flags inside blk_mq_rq_ctx_init()
config: x86_64-randconfig-122-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091427.p534vE3q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091427.p534vE3q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091427.p534vE3q-lkp@intel.com/

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
