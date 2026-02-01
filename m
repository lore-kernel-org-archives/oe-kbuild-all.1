Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C98A3EBF3E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 22:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769985256; cv=none; b=CSSZj4VI789u2tnFM2jF0f7xVKYeh8c2KJaN7nyIlc30xTSW+LgtP6EHZUjVEJmr+XWJ2lf87j7sMPaAAsgjIOWK0YRa/p+1VldJuMGXIrKdhTYS9AQriaDOJ8fus8rpi/G5WW99g5HUgFbLYJEqOYf3N/ZH2UJdZrfwQ3OiUd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769985256; c=relaxed/simple;
	bh=pPUK9bvFALcFHdW/0n1A2zk3PujKIbivhjzi4P8d72g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JUR0h0D0l6bNPnUBcjQUfE8gHgV+DLSK0WMJrErlDm8+sYRXSEv8OsmkV5Qkm4BQP4pSi2cYFAGvxdjMu0LSGy0f9DIXsg6sDUSc/n41N4/aXpdbIDiAJvn7iDl6rfmFudnVqz2tw/t42esVjrMSqHbIpaFfJAsBCr2celmCy+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIPgvttS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIPgvttS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769985254; x=1801521254;
  h=date:from:to:cc:subject:message-id;
  bh=pPUK9bvFALcFHdW/0n1A2zk3PujKIbivhjzi4P8d72g=;
  b=LIPgvttStyti+Tp0o/Y9/SvTqwDgyowqWWh43fA/tVcQG88RR36imb/i
   F/bNeoc48f12SHpdHrBcBTyffG+ldaW8S72zHfwQqy7gB2aoxEHHcEpjY
   9UxHCl3+P5ufthQRHmX6bx6t+j46nFUglz1ScfK8h5yc6stLOeutS11Lm
   0n871NpCL0nZzFkVO7G0+qUy72FEWRjWiCozNC5pUtfUJbhvml89gTXoR
   ryyL4BeZoVNkdIWhpoC6Izp5ONTaTxE1mnXsDbESqjglYoTyBGIk6PYac
   oUXyC8mlwGjmd4diPBUGOhfarLxa+a8rPSchRFKCK079A/cn/Y5RtB82m
   A==;
X-CSE-ConnectionGUID: WhGjkKIJSMKMjD4zZlAbBw==
X-CSE-MsgGUID: lu9dWLycQ9uW54MTZTtxbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71060984"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="71060984"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 14:34:14 -0800
X-CSE-ConnectionGUID: EbXG6rZfTauqruURGq7yTw==
X-CSE-MsgGUID: 65rY74EgT1SlOFOJHYYTUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="213891942"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Feb 2026 14:34:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmg1B-00000000f4q-06H3;
	Sun, 01 Feb 2026 22:34:09 +0000
Date: Mon, 02 Feb 2026 06:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Fengnan Chang <fengnanchang@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Yu Kuai <yukuai3@huawei.com>
Subject: block/blk-mq.c:4380:16: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202602020610.DZ1KdBZ1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f2693489ef8558240d9e80bfad103650daed0af
commit: 89e1fb7ceffd898505ad7fa57acec0585bfaa2cc blk-mq: fix potential uaf for 'queue_hw_ctx'
date:   9 weeks ago
config: openrisc-randconfig-r134-20260202 (https://download.01.org/0day-ci/archive/20260202/202602020610.DZ1KdBZ1-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020610.DZ1KdBZ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020610.DZ1KdBZ1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-mq.c:4380:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx @@
   block/blk-mq.c:4380:16: sparse:     expected void const *objp
   block/blk-mq.c:4380:16: sparse:     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx
>> block/blk-mq.c:4525:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct blk_mq_hw_ctx **hctxs @@     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx @@
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

vim +4380 block/blk-mq.c

1db4909e76f64a Ming Lei          2018-11-20  4359  
e09aae7edec1d2 Ming Lei          2015-01-29  4360  /*
e09aae7edec1d2 Ming Lei          2015-01-29  4361   * It is the actual release handler for mq, but we do it from
e09aae7edec1d2 Ming Lei          2015-01-29  4362   * request queue's release handler for avoiding use-after-free
e09aae7edec1d2 Ming Lei          2015-01-29  4363   * and headache because q->mq_kobj shouldn't have been introduced,
e09aae7edec1d2 Ming Lei          2015-01-29  4364   * but we can't group ctx/kctx kobj without it.
e09aae7edec1d2 Ming Lei          2015-01-29  4365   */
e09aae7edec1d2 Ming Lei          2015-01-29  4366  void blk_mq_release(struct request_queue *q)
e09aae7edec1d2 Ming Lei          2015-01-29  4367  {
2f8f1336a48bd5 Ming Lei          2019-04-30  4368  	struct blk_mq_hw_ctx *hctx, *next;
4f481208749a22 Ming Lei          2022-03-08  4369  	unsigned long i;
e09aae7edec1d2 Ming Lei          2015-01-29  4370  
2f8f1336a48bd5 Ming Lei          2019-04-30  4371  	queue_for_each_hw_ctx(q, hctx, i)
2f8f1336a48bd5 Ming Lei          2019-04-30  4372  		WARN_ON_ONCE(hctx && list_empty(&hctx->hctx_list));
2f8f1336a48bd5 Ming Lei          2019-04-30  4373  
2f8f1336a48bd5 Ming Lei          2019-04-30  4374  	/* all hctx are in .unused_hctx_list now */
2f8f1336a48bd5 Ming Lei          2019-04-30  4375  	list_for_each_entry_safe(hctx, next, &q->unused_hctx_list, hctx_list) {
2f8f1336a48bd5 Ming Lei          2019-04-30  4376  		list_del_init(&hctx->hctx_list);
6c8b232efea1ad Ming Lei          2017-02-22  4377  		kobject_put(&hctx->kobj);
c3b4afca7023b5 Ming Lei          2015-06-04  4378  	}
e09aae7edec1d2 Ming Lei          2015-01-29  4379  
d0c98769ee7d5d Fengnan Chang     2025-11-28 @4380  	kfree(q->queue_hw_ctx);
e09aae7edec1d2 Ming Lei          2015-01-29  4381  
7ea5fe31c12dd8 Ming Lei          2017-02-22  4382  	/*
7ea5fe31c12dd8 Ming Lei          2017-02-22  4383  	 * release .mq_kobj and sw queue's kobject now because
7ea5fe31c12dd8 Ming Lei          2017-02-22  4384  	 * both share lifetime with request queue.
7ea5fe31c12dd8 Ming Lei          2017-02-22  4385  	 */
7ea5fe31c12dd8 Ming Lei          2017-02-22  4386  	blk_mq_sysfs_deinit(q);
e09aae7edec1d2 Ming Lei          2015-01-29  4387  }
e09aae7edec1d2 Ming Lei          2015-01-29  4388  
9ac4dd8c47d533 Christoph Hellwig 2024-02-13  4389  struct request_queue *blk_mq_alloc_queue(struct blk_mq_tag_set *set,
9ac4dd8c47d533 Christoph Hellwig 2024-02-13  4390  		struct queue_limits *lim, void *queuedata)
b62c21b71f08b7 Mike Snitzer      2015-03-12  4391  {
9ac4dd8c47d533 Christoph Hellwig 2024-02-13  4392  	struct queue_limits default_lim = { };
26a9750aa87512 Christoph Hellwig 2021-06-02  4393  	struct request_queue *q;
26a9750aa87512 Christoph Hellwig 2021-06-02  4394  	int ret;
b62c21b71f08b7 Mike Snitzer      2015-03-12  4395  
cdb2497918cc29 Christoph Hellwig 2024-06-17  4396  	if (!lim)
cdb2497918cc29 Christoph Hellwig 2024-06-17  4397  		lim = &default_lim;
f76af42f8bf13d Christoph Hellwig 2024-06-17  4398  	lim->features |= BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT;
d432c817c21a48 Christoph Hellwig 2025-01-10  4399  	if (set->nr_maps > HCTX_TYPE_POLL)
8023e144f9d6e3 Christoph Hellwig 2024-06-17  4400  		lim->features |= BLK_FEAT_POLL;
cdb2497918cc29 Christoph Hellwig 2024-06-17  4401  
cdb2497918cc29 Christoph Hellwig 2024-06-17  4402  	q = blk_alloc_queue(lim, set->numa_node);
ad751ba1f8d5d4 Christoph Hellwig 2024-02-13  4403  	if (IS_ERR(q))
ad751ba1f8d5d4 Christoph Hellwig 2024-02-13  4404  		return q;
26a9750aa87512 Christoph Hellwig 2021-06-02  4405  	q->queuedata = queuedata;
26a9750aa87512 Christoph Hellwig 2021-06-02  4406  	ret = blk_mq_init_allocated_queue(set, q);
26a9750aa87512 Christoph Hellwig 2021-06-02  4407  	if (ret) {
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4408  		blk_put_queue(q);
26a9750aa87512 Christoph Hellwig 2021-06-02  4409  		return ERR_PTR(ret);
26a9750aa87512 Christoph Hellwig 2021-06-02  4410  	}
b62c21b71f08b7 Mike Snitzer      2015-03-12  4411  	return q;
b62c21b71f08b7 Mike Snitzer      2015-03-12  4412  }
9ac4dd8c47d533 Christoph Hellwig 2024-02-13  4413  EXPORT_SYMBOL(blk_mq_alloc_queue);
b62c21b71f08b7 Mike Snitzer      2015-03-12  4414  
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4415  /**
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4416   * blk_mq_destroy_queue - shutdown a request queue
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4417   * @q: request queue to shutdown
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4418   *
9ac4dd8c47d533 Christoph Hellwig 2024-02-13  4419   * This shuts down a request queue allocated by blk_mq_alloc_queue(). All future
81ea42b9c3d61e Bart Van Assche   2023-01-30  4420   * requests will be failed with -ENODEV. The caller is responsible for dropping
9ac4dd8c47d533 Christoph Hellwig 2024-02-13  4421   * the reference from blk_mq_alloc_queue() by calling blk_put_queue().
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4422   *
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4423   * Context: can sleep
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4424   */
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4425  void blk_mq_destroy_queue(struct request_queue *q)
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4426  {
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4427  	WARN_ON_ONCE(!queue_is_mq(q));
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4428  	WARN_ON_ONCE(blk_queue_registered(q));
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4429  
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4430  	might_sleep();
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4431  
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4432  	blk_queue_flag_set(QUEUE_FLAG_DYING, q);
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4433  	blk_queue_start_drain(q);
56c1ee92246a50 Jinlong Chen      2022-10-30  4434  	blk_mq_freeze_queue_wait(q);
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4435  
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4436  	blk_sync_queue(q);
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4437  	blk_mq_cancel_work_sync(q);
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4438  	blk_mq_exit_queue(q);
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4439  }
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4440  EXPORT_SYMBOL(blk_mq_destroy_queue);
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4441  
27e32cd23fed1a Christoph Hellwig 2024-02-13  4442  struct gendisk *__blk_mq_alloc_disk(struct blk_mq_tag_set *set,
27e32cd23fed1a Christoph Hellwig 2024-02-13  4443  		struct queue_limits *lim, void *queuedata,
4dcc4874deb41a Christoph Hellwig 2021-08-16  4444  		struct lock_class_key *lkclass)
9316a9ed6895c4 Jens Axboe        2018-10-15  4445  {
9316a9ed6895c4 Jens Axboe        2018-10-15  4446  	struct request_queue *q;
b461dfc49eb6fb Christoph Hellwig 2021-06-02  4447  	struct gendisk *disk;
9316a9ed6895c4 Jens Axboe        2018-10-15  4448  
27e32cd23fed1a Christoph Hellwig 2024-02-13  4449  	q = blk_mq_alloc_queue(set, lim, queuedata);
b461dfc49eb6fb Christoph Hellwig 2021-06-02  4450  	if (IS_ERR(q))
b461dfc49eb6fb Christoph Hellwig 2021-06-02  4451  		return ERR_CAST(q);
9316a9ed6895c4 Jens Axboe        2018-10-15  4452  
4a1fa41d304c71 Christoph Hellwig 2021-08-16  4453  	disk = __alloc_disk_node(q, set->numa_node, lkclass);
b461dfc49eb6fb Christoph Hellwig 2021-06-02  4454  	if (!disk) {
0a3e5cc7bbfcd5 Christoph Hellwig 2022-07-20  4455  		blk_mq_destroy_queue(q);
2b3f056f72e56f Christoph Hellwig 2022-10-18  4456  		blk_put_queue(q);
b461dfc49eb6fb Christoph Hellwig 2021-06-02  4457  		return ERR_PTR(-ENOMEM);
9316a9ed6895c4 Jens Axboe        2018-10-15  4458  	}
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4459  	set_bit(GD_OWNS_QUEUE, &disk->state);
b461dfc49eb6fb Christoph Hellwig 2021-06-02  4460  	return disk;
9316a9ed6895c4 Jens Axboe        2018-10-15  4461  }
b461dfc49eb6fb Christoph Hellwig 2021-06-02  4462  EXPORT_SYMBOL(__blk_mq_alloc_disk);
9316a9ed6895c4 Jens Axboe        2018-10-15  4463  
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4464  struct gendisk *blk_mq_alloc_disk_for_queue(struct request_queue *q,
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4465  		struct lock_class_key *lkclass)
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4466  {
22c17e279a1b03 Christoph Hellwig 2022-11-22  4467  	struct gendisk *disk;
22c17e279a1b03 Christoph Hellwig 2022-11-22  4468  
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4469  	if (!blk_get_queue(q))
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4470  		return NULL;
22c17e279a1b03 Christoph Hellwig 2022-11-22  4471  	disk = __alloc_disk_node(q, NUMA_NO_NODE, lkclass);
22c17e279a1b03 Christoph Hellwig 2022-11-22  4472  	if (!disk)
22c17e279a1b03 Christoph Hellwig 2022-11-22  4473  		blk_put_queue(q);
22c17e279a1b03 Christoph Hellwig 2022-11-22  4474  	return disk;
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4475  }
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4476  EXPORT_SYMBOL(blk_mq_alloc_disk_for_queue);
6f8191fdf41d3a Christoph Hellwig 2022-06-19  4477  
85672ca9ceeaa1 Ming Lei          2024-12-18  4478  /*
85672ca9ceeaa1 Ming Lei          2024-12-18  4479   * Only hctx removed from cpuhp list can be reused
85672ca9ceeaa1 Ming Lei          2024-12-18  4480   */
85672ca9ceeaa1 Ming Lei          2024-12-18  4481  static bool blk_mq_hctx_is_reusable(struct blk_mq_hw_ctx *hctx)
85672ca9ceeaa1 Ming Lei          2024-12-18  4482  {
85672ca9ceeaa1 Ming Lei          2024-12-18  4483  	return hlist_unhashed(&hctx->cpuhp_online) &&
85672ca9ceeaa1 Ming Lei          2024-12-18  4484  		hlist_unhashed(&hctx->cpuhp_dead);
85672ca9ceeaa1 Ming Lei          2024-12-18  4485  }
85672ca9ceeaa1 Ming Lei          2024-12-18  4486  
34d11ffac1f56c Jianchao Wang     2018-10-12  4487  static struct blk_mq_hw_ctx *blk_mq_alloc_and_init_hctx(
34d11ffac1f56c Jianchao Wang     2018-10-12  4488  		struct blk_mq_tag_set *set, struct request_queue *q,
34d11ffac1f56c Jianchao Wang     2018-10-12  4489  		int hctx_idx, int node)
34d11ffac1f56c Jianchao Wang     2018-10-12  4490  {
2f8f1336a48bd5 Ming Lei          2019-04-30  4491  	struct blk_mq_hw_ctx *hctx = NULL, *tmp;
34d11ffac1f56c Jianchao Wang     2018-10-12  4492  
2f8f1336a48bd5 Ming Lei          2019-04-30  4493  	/* reuse dead hctx first */
2f8f1336a48bd5 Ming Lei          2019-04-30  4494  	spin_lock(&q->unused_hctx_lock);
2f8f1336a48bd5 Ming Lei          2019-04-30  4495  	list_for_each_entry(tmp, &q->unused_hctx_list, hctx_list) {
85672ca9ceeaa1 Ming Lei          2024-12-18  4496  		if (tmp->numa_node == node && blk_mq_hctx_is_reusable(tmp)) {
2f8f1336a48bd5 Ming Lei          2019-04-30  4497  			hctx = tmp;
2f8f1336a48bd5 Ming Lei          2019-04-30  4498  			break;
2f8f1336a48bd5 Ming Lei          2019-04-30  4499  		}
2f8f1336a48bd5 Ming Lei          2019-04-30  4500  	}
2f8f1336a48bd5 Ming Lei          2019-04-30  4501  	if (hctx)
2f8f1336a48bd5 Ming Lei          2019-04-30  4502  		list_del_init(&hctx->hctx_list);
2f8f1336a48bd5 Ming Lei          2019-04-30  4503  	spin_unlock(&q->unused_hctx_lock);
2f8f1336a48bd5 Ming Lei          2019-04-30  4504  
2f8f1336a48bd5 Ming Lei          2019-04-30  4505  	if (!hctx)
7c6c5b7c9186e3 Ming Lei          2019-04-30  4506  		hctx = blk_mq_alloc_hctx(q, set, node);
34d11ffac1f56c Jianchao Wang     2018-10-12  4507  	if (!hctx)
7c6c5b7c9186e3 Ming Lei          2019-04-30  4508  		goto fail;
34d11ffac1f56c Jianchao Wang     2018-10-12  4509  
7c6c5b7c9186e3 Ming Lei          2019-04-30  4510  	if (blk_mq_init_hctx(q, set, hctx, hctx_idx))
7c6c5b7c9186e3 Ming Lei          2019-04-30  4511  		goto free_hctx;
34d11ffac1f56c Jianchao Wang     2018-10-12  4512  
7c6c5b7c9186e3 Ming Lei          2019-04-30  4513  	return hctx;
34d11ffac1f56c Jianchao Wang     2018-10-12  4514  
7c6c5b7c9186e3 Ming Lei          2019-04-30  4515   free_hctx:
7c6c5b7c9186e3 Ming Lei          2019-04-30  4516  	kobject_put(&hctx->kobj);
7c6c5b7c9186e3 Ming Lei          2019-04-30  4517   fail:
34d11ffac1f56c Jianchao Wang     2018-10-12  4518  	return NULL;
34d11ffac1f56c Jianchao Wang     2018-10-12  4519  }
34d11ffac1f56c Jianchao Wang     2018-10-12  4520  
01b91bf14f6d48 Ming Lei          2025-04-03  4521  static void __blk_mq_realloc_hw_ctxs(struct blk_mq_tag_set *set,
b62c21b71f08b7 Mike Snitzer      2015-03-12  4522  				     struct request_queue *q)
320ae51feed5c2 Jens Axboe        2013-10-24  4523  {
d0c98769ee7d5d Fengnan Chang     2025-11-28  4524  	int i, j, end;
d0c98769ee7d5d Fengnan Chang     2025-11-28 @4525  	struct blk_mq_hw_ctx **hctxs = q->queue_hw_ctx;
d0c98769ee7d5d Fengnan Chang     2025-11-28  4526  
d0c98769ee7d5d Fengnan Chang     2025-11-28  4527  	if (q->nr_hw_queues < set->nr_hw_queues) {
d0c98769ee7d5d Fengnan Chang     2025-11-28  4528  		struct blk_mq_hw_ctx **new_hctxs;
d0c98769ee7d5d Fengnan Chang     2025-11-28  4529  
d0c98769ee7d5d Fengnan Chang     2025-11-28  4530  		new_hctxs = kcalloc_node(set->nr_hw_queues,
d0c98769ee7d5d Fengnan Chang     2025-11-28  4531  				       sizeof(*new_hctxs), GFP_KERNEL,
d0c98769ee7d5d Fengnan Chang     2025-11-28  4532  				       set->numa_node);
d0c98769ee7d5d Fengnan Chang     2025-11-28  4533  		if (!new_hctxs)
d0c98769ee7d5d Fengnan Chang     2025-11-28  4534  			return;
d0c98769ee7d5d Fengnan Chang     2025-11-28  4535  		if (hctxs)
d0c98769ee7d5d Fengnan Chang     2025-11-28  4536  			memcpy(new_hctxs, hctxs, q->nr_hw_queues *
d0c98769ee7d5d Fengnan Chang     2025-11-28  4537  			       sizeof(*hctxs));
89e1fb7ceffd89 Fengnan Chang     2025-11-28  4538  		rcu_assign_pointer(q->queue_hw_ctx, new_hctxs);
89e1fb7ceffd89 Fengnan Chang     2025-11-28  4539  		/*
89e1fb7ceffd89 Fengnan Chang     2025-11-28  4540  		 * Make sure reading the old queue_hw_ctx from other
89e1fb7ceffd89 Fengnan Chang     2025-11-28  4541  		 * context concurrently won't trigger uaf.
89e1fb7ceffd89 Fengnan Chang     2025-11-28  4542  		 */
89e1fb7ceffd89 Fengnan Chang     2025-11-28  4543  		synchronize_rcu_expedited();
d0c98769ee7d5d Fengnan Chang     2025-11-28  4544  		kfree(hctxs);
d0c98769ee7d5d Fengnan Chang     2025-11-28  4545  		hctxs = new_hctxs;
d0c98769ee7d5d Fengnan Chang     2025-11-28  4546  	}
ac0d6b926e741f Bart Van Assche   2019-10-25  4547  
24d2f90309b23f Christoph Hellwig 2014-04-15  4548  	for (i = 0; i < set->nr_hw_queues; i++) {
306f13ee164248 Ming Lei          2022-03-08  4549  		int old_node;
4d805131abf219 Ming Lei          2022-03-08  4550  		int node = blk_mq_get_hctx_node(set, i);
d0c98769ee7d5d Fengnan Chang     2025-11-28  4551  		struct blk_mq_hw_ctx *old_hctx = hctxs[i];
868f2f0b72068a Keith Busch       2015-12-17  4552  
306f13ee164248 Ming Lei          2022-03-08  4553  		if (old_hctx) {
306f13ee164248 Ming Lei          2022-03-08  4554  			old_node = old_hctx->numa_node;
306f13ee164248 Ming Lei          2022-03-08  4555  			blk_mq_exit_hctx(q, set, old_hctx, i);
306f13ee164248 Ming Lei          2022-03-08  4556  		}
320ae51feed5c2 Jens Axboe        2013-10-24  4557  
d0c98769ee7d5d Fengnan Chang     2025-11-28  4558  		hctxs[i] = blk_mq_alloc_and_init_hctx(set, q, i, node);
d0c98769ee7d5d Fengnan Chang     2025-11-28  4559  		if (!hctxs[i]) {
306f13ee164248 Ming Lei          2022-03-08  4560  			if (!old_hctx)
868f2f0b72068a Keith Busch       2015-12-17  4561  				break;
306f13ee164248 Ming Lei          2022-03-08  4562  			pr_warn("Allocate new hctx on node %d fails, fallback to previous one on node %d\n",
306f13ee164248 Ming Lei          2022-03-08  4563  					node, old_node);
d0c98769ee7d5d Fengnan Chang     2025-11-28  4564  			hctxs[i] = blk_mq_alloc_and_init_hctx(set, q, i,
d0c98769ee7d5d Fengnan Chang     2025-11-28  4565  					old_node);
d0c98769ee7d5d Fengnan Chang     2025-11-28  4566  			WARN_ON_ONCE(!hctxs[i]);
868f2f0b72068a Keith Busch       2015-12-17  4567  		}
868f2f0b72068a Keith Busch       2015-12-17  4568  	}
e01ad46d53b597 Jianchao Wang     2018-10-12  4569  	/*
e01ad46d53b597 Jianchao Wang     2018-10-12  4570  	 * Increasing nr_hw_queues fails. Free the newly allocated
e01ad46d53b597 Jianchao Wang     2018-10-12  4571  	 * hctxs and keep the previous q->nr_hw_queues.
e01ad46d53b597 Jianchao Wang     2018-10-12  4572  	 */
e01ad46d53b597 Jianchao Wang     2018-10-12  4573  	if (i != set->nr_hw_queues) {
e01ad46d53b597 Jianchao Wang     2018-10-12  4574  		j = q->nr_hw_queues;
d0c98769ee7d5d Fengnan Chang     2025-11-28  4575  		end = i;
e01ad46d53b597 Jianchao Wang     2018-10-12  4576  	} else {
e01ad46d53b597 Jianchao Wang     2018-10-12  4577  		j = i;
d0c98769ee7d5d Fengnan Chang     2025-11-28  4578  		end = q->nr_hw_queues;
e01ad46d53b597 Jianchao Wang     2018-10-12  4579  		q->nr_hw_queues = set->nr_hw_queues;
e01ad46d53b597 Jianchao Wang     2018-10-12  4580  	}
34d11ffac1f56c Jianchao Wang     2018-10-12  4581  
d0c98769ee7d5d Fengnan Chang     2025-11-28  4582  	for (; j < end; j++) {
d0c98769ee7d5d Fengnan Chang     2025-11-28  4583  		struct blk_mq_hw_ctx *hctx = hctxs[j];
d0c98769ee7d5d Fengnan Chang     2025-11-28  4584  
d0c98769ee7d5d Fengnan Chang     2025-11-28  4585  		if (hctx) {
868f2f0b72068a Keith Busch       2015-12-17  4586  			blk_mq_exit_hctx(q, set, hctx, j);
d0c98769ee7d5d Fengnan Chang     2025-11-28  4587  			hctxs[j] = NULL;
d0c98769ee7d5d Fengnan Chang     2025-11-28  4588  		}
d0c98769ee7d5d Fengnan Chang     2025-11-28  4589  	}
01b91bf14f6d48 Ming Lei          2025-04-03  4590  }
01b91bf14f6d48 Ming Lei          2025-04-03  4591  

:::::: The code at line 4380 was first introduced by commit
:::::: d0c98769ee7d5db8d699a270690639cde1766cd4 blk-mq: use array manage hctx map instead of xarray

:::::: TO: Fengnan Chang <fengnanchang@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
