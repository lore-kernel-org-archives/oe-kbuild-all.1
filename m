Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E838FA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 06:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742280927; cv=none; b=RSzCT/jxQT8RsSNH4KzaWLncrW497wxk8XEx8P4sEqeZahQVQpVV7EbiXqKQ5iM0I7n0zji2qU3fykoHtYrD5duiPwcZfdQ/hjbLH0KaDlE8K4AolOtHA3y874ZLH4z6UH2WdDd0VZsyI5SvvSCoG/6+RWMGuk40G2cU24I1RWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742280927; c=relaxed/simple;
	bh=R5w0/YXlLaP6u9r7WtswhOtBaW/Yhi5hVwh+3quRxjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IvFqpEZ5/VXZbMnLeeWZgi3hl7EBOSj7w5S0JgLKmvpaJ0oSEecfa5bjAyuS2StF9QydNtJafXZds3VmQkkmFssWTMuwJqwqiBWwAdNQJG9+/Xd55NTMejUD8kX0Je2dEtIp7vpxhJdZYZwZcOMUHpYyLfrBEKe0fcwjzSo3xEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mX74LXgu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mX74LXgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742280924; x=1773816924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5w0/YXlLaP6u9r7WtswhOtBaW/Yhi5hVwh+3quRxjo=;
  b=mX74LXguVtnUbEUzsnP60A10kos52j4mtq2zHiAFuUhD3cC/NQV+g0v7
   sALP4scJIfH/tbUW/C8d39qLoS8kHAioe1p2Uc/+CR/qvLYk5bRb/9BKd
   n1RR6l4dElg6G8faF5bgvU2ej3HQpfPECo9P9cKNoSbHf9P3cEFPF8C07
   FfXI3QsfQZp8cNgcnaiBjb8aYwKwlM0hNjNpOfCYplg6AhtDYtXiY5DhB
   YSoqW2y4914mVTeUSjf08UqADzmOCAxQmp+9TNNfKeI/PFXCJciuQgDyR
   Dco2cQSwMxLcG2BGqYEELReEn1XANVOShQeBG8RpN4kuLyDzUxrFF4/5d
   g==;
X-CSE-ConnectionGUID: XLArfTuoS06WSh/qSm+DMg==
X-CSE-MsgGUID: v/W9K84RR5e3ghIJh2WStw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43319294"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="43319294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 23:55:24 -0700
X-CSE-ConnectionGUID: 6tN6YxO/RRKLvrgqmy0LAA==
X-CSE-MsgGUID: bwkfDwT2T4miEEwJAB8fnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="126826183"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2025 23:55:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuQr6-000DUZ-1y;
	Tue, 18 Mar 2025 06:55:17 +0000
Date: Tue, 18 Mar 2025 14:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2815/2815] block/blk-mq.c:485:19: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202503181406.E4pR441t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a348aa0315d2a90cde93df922b84ab682459a834
commit: 8a6bee347626968d467aef07453c4547bc23cb64 [2815/2815] blk-mq: fix potential uaf for 'queue_hw_ctx'
config: x86_64-randconfig-122-20250318 (https://download.01.org/0day-ci/archive/20250318/202503181406.E4pR441t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181406.E4pR441t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503181406.E4pR441t-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-mq-sysfs.c:339:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct blk_mq_hw_ctx *hctx @@     got struct blk_mq_hw_ctx [noderef] __rcu * @@
   block/blk-mq-sysfs.c:339:55: sparse:     expected struct blk_mq_hw_ctx *hctx
   block/blk-mq-sysfs.c:339:55: sparse:     got struct blk_mq_hw_ctx [noderef] __rcu *
   block/blk-mq-sysfs.c: note: in included file:
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
--
>> block/blk-mq.c:485:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct blk_mq_hw_ctx *hctx @@     got struct blk_mq_hw_ctx [noderef] __rcu * @@
   block/blk-mq.c:485:19: sparse:     expected struct blk_mq_hw_ctx *hctx
   block/blk-mq.c:485:19: sparse:     got struct blk_mq_hw_ctx [noderef] __rcu *
>> block/blk-mq.c:3270:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct blk_mq_hw_ctx **hctxs @@     got struct blk_mq_hw_ctx [noderef] __rcu **queue_hw_ctx @@
   block/blk-mq.c:3270:41: sparse:     expected struct blk_mq_hw_ctx **hctxs
   block/blk-mq.c:3270:41: sparse:     got struct blk_mq_hw_ctx [noderef] __rcu **queue_hw_ctx
   block/blk-mq.c:3284:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   block/blk-mq.c:3284:17: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   block/blk-mq.c:3284:17: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   block/blk-mq.c:4033:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct blk_mq_hw_ctx *hctx @@     got struct blk_mq_hw_ctx [noderef] __rcu * @@
   block/blk-mq.c: note: in included file:
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **

vim +485 block/blk-mq.c

320ae51feed5c2 Jens Axboe        2013-10-24  446  
cd6ce1482fd9e6 Bart Van Assche   2017-06-20  447  struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
9a95e4ef709533 Bart Van Assche   2017-11-09  448  	unsigned int op, blk_mq_req_flags_t flags, unsigned int hctx_idx)
1f5bd336b91505 Ming Lin          2016-06-13  449  {
e6e7abffe386b6 Christoph Hellwig 2020-05-29  450  	struct blk_mq_alloc_data data = {
e6e7abffe386b6 Christoph Hellwig 2020-05-29  451  		.q		= q,
e6e7abffe386b6 Christoph Hellwig 2020-05-29  452  		.flags		= flags,
e6e7abffe386b6 Christoph Hellwig 2020-05-29  453  		.cmd_flags	= op,
e6e7abffe386b6 Christoph Hellwig 2020-05-29  454  	};
600c3b0cea784a Christoph Hellwig 2020-05-29  455  	u64 alloc_time_ns = 0;
6d2809d51a5079 Omar Sandoval     2017-02-27  456  	unsigned int cpu;
600c3b0cea784a Christoph Hellwig 2020-05-29  457  	unsigned int tag;
1f5bd336b91505 Ming Lin          2016-06-13  458  	int ret;
1f5bd336b91505 Ming Lin          2016-06-13  459  
600c3b0cea784a Christoph Hellwig 2020-05-29  460  	/* alloc_time includes depth and tag waits */
600c3b0cea784a Christoph Hellwig 2020-05-29  461  	if (blk_queue_rq_alloc_time(q))
600c3b0cea784a Christoph Hellwig 2020-05-29  462  		alloc_time_ns = ktime_get_ns();
600c3b0cea784a Christoph Hellwig 2020-05-29  463  
1f5bd336b91505 Ming Lin          2016-06-13  464  	/*
1f5bd336b91505 Ming Lin          2016-06-13  465  	 * If the tag allocator sleeps we could get an allocation for a
1f5bd336b91505 Ming Lin          2016-06-13  466  	 * different hardware context.  No need to complicate the low level
1f5bd336b91505 Ming Lin          2016-06-13  467  	 * allocator for this for the rare use case of a command tied to
1f5bd336b91505 Ming Lin          2016-06-13  468  	 * a specific queue.
1f5bd336b91505 Ming Lin          2016-06-13  469  	 */
600c3b0cea784a Christoph Hellwig 2020-05-29  470  	if (WARN_ON_ONCE(!(flags & (BLK_MQ_REQ_NOWAIT | BLK_MQ_REQ_RESERVED))))
1f5bd336b91505 Ming Lin          2016-06-13  471  		return ERR_PTR(-EINVAL);
1f5bd336b91505 Ming Lin          2016-06-13  472  
1f5bd336b91505 Ming Lin          2016-06-13  473  	if (hctx_idx >= q->nr_hw_queues)
1f5bd336b91505 Ming Lin          2016-06-13  474  		return ERR_PTR(-EIO);
1f5bd336b91505 Ming Lin          2016-06-13  475  
3a0a529971ec4e Bart Van Assche   2017-11-09  476  	ret = blk_queue_enter(q, flags);
1f5bd336b91505 Ming Lin          2016-06-13  477  	if (ret)
1f5bd336b91505 Ming Lin          2016-06-13  478  		return ERR_PTR(ret);
1f5bd336b91505 Ming Lin          2016-06-13  479  
c8712c6a674e33 Christoph Hellwig 2016-09-23  480  	/*
c8712c6a674e33 Christoph Hellwig 2016-09-23  481  	 * Check if the hardware context is actually mapped to anything.
c8712c6a674e33 Christoph Hellwig 2016-09-23  482  	 * If not tell the caller that it should skip this queue.
c8712c6a674e33 Christoph Hellwig 2016-09-23  483  	 */
a5ea5811058ddb Christoph Hellwig 2020-05-16  484  	ret = -EXDEV;
e6e7abffe386b6 Christoph Hellwig 2020-05-29 @485  	data.hctx = q->queue_hw_ctx[hctx_idx];
e6e7abffe386b6 Christoph Hellwig 2020-05-29  486  	if (!blk_mq_hw_queue_mapped(data.hctx))
a5ea5811058ddb Christoph Hellwig 2020-05-16  487  		goto out_queue_exit;
e6e7abffe386b6 Christoph Hellwig 2020-05-29  488  	cpu = cpumask_first_and(data.hctx->cpumask, cpu_online_mask);
e6e7abffe386b6 Christoph Hellwig 2020-05-29  489  	data.ctx = __blk_mq_get_ctx(q, cpu);
1f5bd336b91505 Ming Lin          2016-06-13  490  
42fdc5e49c2be9 Christoph Hellwig 2020-06-29  491  	if (!q->elevator)
600c3b0cea784a Christoph Hellwig 2020-05-29  492  		blk_mq_tag_busy(data.hctx);
600c3b0cea784a Christoph Hellwig 2020-05-29  493  
a5ea5811058ddb Christoph Hellwig 2020-05-16  494  	ret = -EWOULDBLOCK;
600c3b0cea784a Christoph Hellwig 2020-05-29  495  	tag = blk_mq_get_tag(&data);
600c3b0cea784a Christoph Hellwig 2020-05-29  496  	if (tag == BLK_MQ_NO_TAG)
a5ea5811058ddb Christoph Hellwig 2020-05-16  497  		goto out_queue_exit;
600c3b0cea784a Christoph Hellwig 2020-05-29  498  	return blk_mq_rq_ctx_init(&data, tag, alloc_time_ns);
600c3b0cea784a Christoph Hellwig 2020-05-29  499  
a5ea5811058ddb Christoph Hellwig 2020-05-16  500  out_queue_exit:
a5ea5811058ddb Christoph Hellwig 2020-05-16  501  	blk_queue_exit(q);
a5ea5811058ddb Christoph Hellwig 2020-05-16  502  	return ERR_PTR(ret);
1f5bd336b91505 Ming Lin          2016-06-13  503  }
1f5bd336b91505 Ming Lin          2016-06-13  504  EXPORT_SYMBOL_GPL(blk_mq_alloc_request_hctx);
1f5bd336b91505 Ming Lin          2016-06-13  505  

:::::: The code at line 485 was first introduced by commit
:::::: e6e7abffe386b614a194ec32457a00c304c980f4 blk-mq: simplify the blk_mq_get_request calling convention

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
