Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C172848BA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 20:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781467849; cv=none; b=aYIKAKBNiJAJOk88d/2Gjq1+UK9Ju2Xd39jl2M6V9I14+Si6pxHPF8a0N4hrrL9kqqsO9nGPews8U35EcTULE1XmZ3eTVNReG9kcQF+ruzn2T5jkORKnr+69S99AwVMiX2s0ixk11PkVhTiqXmcIa/SrCyECl3BXU6mCfOaa8AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781467849; c=relaxed/simple;
	bh=p8AgcrrLxZATfk30VCcQ3vixcqb48TnZi4drJIRaZn0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lcyi48YtymNZec2w69mUEceDB4pWKwsDfeW0PpJdLoBgQ+HvSabbfZFoeJ1vVQ0vXjkaaWSrVmFJFHeTrsSEy24pQ3gfJqrgEfuCkXxaeaXWO6IoI0IyQXO+OLJkvBglnphfUf5+XTQrUINI7Gc9Iq3w8L8tpLoRCdwf0mGK7hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYH74Sha; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYH74Sha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781467847; x=1813003847;
  h=date:from:to:cc:subject:message-id;
  bh=p8AgcrrLxZATfk30VCcQ3vixcqb48TnZi4drJIRaZn0=;
  b=FYH74ShaNAimnp0HbyEHeJQa3TjLdmaRpi/7c2gl7Jzjujq5U1LvyliB
   G+1NR6kOmgSaFhf93F6XOCywy8UjQnLmr9jDdSoczXXQwd6n60yAex8gt
   bjOcRJ1pbGwteOoyCRGagMHNQ6kEf6lwxPKBELdcFF+v6zjtTYddoHILM
   B0AN42aO3g5mrTDjdU70US1lmdf6i1joUP4QYjkfaRx59cWpsv5mee+8S
   yD+wwNm+QlJjdlYpWTNNXZfgHCAnMLDchc9rAiLXlJ4hEps6ixKuHwZ7f
   o8Qlw586ckOW744fgdGAiSz4j8D9pn4XDWXPi0yy2vxsM9eZMUUqAi5xR
   A==;
X-CSE-ConnectionGUID: Iysba8e8RsqsIwcGgEwSMQ==
X-CSE-MsgGUID: iMHmfdqtTJmwafvousiY6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82250847"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82250847"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 13:10:46 -0700
X-CSE-ConnectionGUID: nfRJUQQAQyOWM4klcaKLFA==
X-CSE-MsgGUID: DPK05bTvToGpmg7qoeMeEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="244382189"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jun 2026 13:10:44 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYrAH-00000000RBO-2vEQ;
	Sun, 14 Jun 2026 20:10:41 +0000
Date: Mon, 15 Jun 2026 04:10:38 +0800
From: kernel test robot <lkp@intel.com>
To: Fengnan Chang <fengnanchang@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Yu Kuai <yukuai3@huawei.com>
Subject: block/blk-mq.c:4380:16: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202606150408.9QUZb3ur-lkp@intel.com>
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
config: arm64-randconfig-r123-20260614 (https://download.01.org/0day-ci/archive/20260615/202606150408.9QUZb3ur-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150408.9QUZb3ur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 89e1fb7ceffd ("blk-mq: fix potential uaf for 'queue_hw_ctx'")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150408.9QUZb3ur-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-mq.c:4380:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx @@
   block/blk-mq.c:4380:16: sparse:     expected void const *objp
   block/blk-mq.c:4380:16: sparse:     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx
   block/blk-mq.c:4525:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct blk_mq_hw_ctx **hctxs @@     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx @@
   block/blk-mq.c:4525:41: sparse:     expected struct blk_mq_hw_ctx **hctxs
   block/blk-mq.c:4525:41: sparse:     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx
   block/blk-mq.c:733:36: sparse: sparse: dereference of noderef expression
   block/blk-mq.c: note: in included file:
   block/blk-mq.h:87:31: sparse: sparse: dereference of noderef expression
   block/blk-mq.h:87:31: sparse: sparse: dereference of noderef expression
   block/blk-mq.h:87:31: sparse: sparse: dereference of noderef expression
   block/blk-mq.h:87:31: sparse: sparse: dereference of noderef expression
   block/blk-mq.h:87:31: sparse: sparse: dereference of noderef expression
   block/blk-mq.h:87:31: sparse: sparse: dereference of noderef expression
   block/blk-mq.c:5211:48: sparse: sparse: dereference of noderef expression

vim +4380 block/blk-mq.c

1db4909e76f64a8 Ming Lei      2018-11-20  4359  
e09aae7edec1d20 Ming Lei      2015-01-29  4360  /*
e09aae7edec1d20 Ming Lei      2015-01-29  4361   * It is the actual release handler for mq, but we do it from
e09aae7edec1d20 Ming Lei      2015-01-29  4362   * request queue's release handler for avoiding use-after-free
e09aae7edec1d20 Ming Lei      2015-01-29  4363   * and headache because q->mq_kobj shouldn't have been introduced,
e09aae7edec1d20 Ming Lei      2015-01-29  4364   * but we can't group ctx/kctx kobj without it.
e09aae7edec1d20 Ming Lei      2015-01-29  4365   */
e09aae7edec1d20 Ming Lei      2015-01-29  4366  void blk_mq_release(struct request_queue *q)
e09aae7edec1d20 Ming Lei      2015-01-29  4367  {
2f8f1336a48bd51 Ming Lei      2019-04-30  4368  	struct blk_mq_hw_ctx *hctx, *next;
4f481208749a22d Ming Lei      2022-03-08  4369  	unsigned long i;
e09aae7edec1d20 Ming Lei      2015-01-29  4370  
2f8f1336a48bd51 Ming Lei      2019-04-30  4371  	queue_for_each_hw_ctx(q, hctx, i)
2f8f1336a48bd51 Ming Lei      2019-04-30  4372  		WARN_ON_ONCE(hctx && list_empty(&hctx->hctx_list));
2f8f1336a48bd51 Ming Lei      2019-04-30  4373  
2f8f1336a48bd51 Ming Lei      2019-04-30  4374  	/* all hctx are in .unused_hctx_list now */
2f8f1336a48bd51 Ming Lei      2019-04-30  4375  	list_for_each_entry_safe(hctx, next, &q->unused_hctx_list, hctx_list) {
2f8f1336a48bd51 Ming Lei      2019-04-30  4376  		list_del_init(&hctx->hctx_list);
6c8b232efea1ad3 Ming Lei      2017-02-22  4377  		kobject_put(&hctx->kobj);
c3b4afca7023b5a Ming Lei      2015-06-04  4378  	}
e09aae7edec1d20 Ming Lei      2015-01-29  4379  
d0c98769ee7d5db Fengnan Chang 2025-11-28 @4380  	kfree(q->queue_hw_ctx);
e09aae7edec1d20 Ming Lei      2015-01-29  4381  
7ea5fe31c12dd8b Ming Lei      2017-02-22  4382  	/*
7ea5fe31c12dd8b Ming Lei      2017-02-22  4383  	 * release .mq_kobj and sw queue's kobject now because
7ea5fe31c12dd8b Ming Lei      2017-02-22  4384  	 * both share lifetime with request queue.
7ea5fe31c12dd8b Ming Lei      2017-02-22  4385  	 */
7ea5fe31c12dd8b Ming Lei      2017-02-22  4386  	blk_mq_sysfs_deinit(q);
e09aae7edec1d20 Ming Lei      2015-01-29  4387  }
e09aae7edec1d20 Ming Lei      2015-01-29  4388  

:::::: The code at line 4380 was first introduced by commit
:::::: d0c98769ee7d5db8d699a270690639cde1766cd4 blk-mq: use array manage hctx map instead of xarray

:::::: TO: Fengnan Chang <fengnanchang@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
