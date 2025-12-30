Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046D3270552
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767085794; cv=none; b=aKNq4h6LaRfvNGYVTDbc/sRGj2Q5n+kQqzvp4NLQfzoMkrQbor0HVqmvld3ZxPPPZXrNGMppNo+y/bicXHvu8kYt2IKSVaCQJClrHAXiwKmHJEEAfUS1tOkQotxe1i9Hz4bqd31AcPJYteHaFTqAc1bU7tU+F3z3szFfxddXrFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767085794; c=relaxed/simple;
	bh=4JtI3TxxDdsUMgHojGF0QFQtNkruPUfJKTL7ZYo5k1o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TmBvjDAc+TF0tbBi91htb86IN0aGcaOWLzxVw+aQtSHqh2ni400EH8CKeKz0m1chPryVzaf8VsWIhab//7+9S9kE9VA3BIWt71jfRSAkGY2O4EdPh2OoydTXAm715Uljqe6UoXffuFvFPCWsH5RbNhgnnq6CM7nmIHZIpq/x1Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S11yXCTH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S11yXCTH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767085792; x=1798621792;
  h=date:from:to:cc:subject:message-id;
  bh=4JtI3TxxDdsUMgHojGF0QFQtNkruPUfJKTL7ZYo5k1o=;
  b=S11yXCTHKiyj72QptgOTU9Fl0r5KF7IHIrnmVSb9OanMLXrbHisQNb1q
   JfJ+XFDHtumVm4KgSbNQiiJi/UI+oIk1MaPDQCvYe27MH6m+uymAUaQuq
   99wXtUgUpBCZ+5xXnutGQWr2XlMUB99jfBor4EwmcoI91g4Q6th6FmuhM
   SPw4PyitAiqA2ZwDIT3LKxDm+lkTRihW6zJwTtKye6nKamPHwkIH0fgPg
   ZTyHL6bcUAitMe1dNNguDf6Wn3hAzXxeF2yPHL0E55Hk9tG3uE588bIsx
   WbwI3hEiSIQbNobUavyNRSr0AmTwAwE6XrAnOFpFgjoPi+5njaFBd0lK7
   Q==;
X-CSE-ConnectionGUID: KN5RVYV+TgSRkknhy+i/pw==
X-CSE-MsgGUID: QBe+cuECTruDdB+L89eEfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="67873996"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="67873996"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 01:09:51 -0800
X-CSE-ConnectionGUID: tW1+l7KkTcCojmCJpuqU4g==
X-CSE-MsgGUID: r1fUNFlAQPKyTMozSknHuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="206060514"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Dec 2025 01:09:49 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaVjf-000000000GJ-18PD;
	Tue, 30 Dec 2025 09:09:47 +0000
Date: Tue, 30 Dec 2025 17:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: Fengnan Chang <fengnanchang@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Yu Kuai <yukuai3@huawei.com>
Subject: block/blk-mq.c:4380:16: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202512301645.vLzgeSuh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8640b74557fc8b4c300030f6ccb8cd078f665ec8
commit: 89e1fb7ceffd898505ad7fa57acec0585bfaa2cc blk-mq: fix potential uaf for 'queue_hw_ctx'
date:   5 weeks ago
config: powerpc64-randconfig-r132-20251230 (https://download.01.org/0day-ci/archive/20251230/202512301645.vLzgeSuh-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512301645.vLzgeSuh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512301645.vLzgeSuh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-mq.c:4380:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx @@
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

vim +4380 block/blk-mq.c

1db4909e76f64a Ming Lei      2018-11-20  4359  
e09aae7edec1d2 Ming Lei      2015-01-29  4360  /*
e09aae7edec1d2 Ming Lei      2015-01-29  4361   * It is the actual release handler for mq, but we do it from
e09aae7edec1d2 Ming Lei      2015-01-29  4362   * request queue's release handler for avoiding use-after-free
e09aae7edec1d2 Ming Lei      2015-01-29  4363   * and headache because q->mq_kobj shouldn't have been introduced,
e09aae7edec1d2 Ming Lei      2015-01-29  4364   * but we can't group ctx/kctx kobj without it.
e09aae7edec1d2 Ming Lei      2015-01-29  4365   */
e09aae7edec1d2 Ming Lei      2015-01-29  4366  void blk_mq_release(struct request_queue *q)
e09aae7edec1d2 Ming Lei      2015-01-29  4367  {
2f8f1336a48bd5 Ming Lei      2019-04-30  4368  	struct blk_mq_hw_ctx *hctx, *next;
4f481208749a22 Ming Lei      2022-03-08  4369  	unsigned long i;
e09aae7edec1d2 Ming Lei      2015-01-29  4370  
2f8f1336a48bd5 Ming Lei      2019-04-30  4371  	queue_for_each_hw_ctx(q, hctx, i)
2f8f1336a48bd5 Ming Lei      2019-04-30  4372  		WARN_ON_ONCE(hctx && list_empty(&hctx->hctx_list));
2f8f1336a48bd5 Ming Lei      2019-04-30  4373  
2f8f1336a48bd5 Ming Lei      2019-04-30  4374  	/* all hctx are in .unused_hctx_list now */
2f8f1336a48bd5 Ming Lei      2019-04-30  4375  	list_for_each_entry_safe(hctx, next, &q->unused_hctx_list, hctx_list) {
2f8f1336a48bd5 Ming Lei      2019-04-30  4376  		list_del_init(&hctx->hctx_list);
6c8b232efea1ad Ming Lei      2017-02-22  4377  		kobject_put(&hctx->kobj);
c3b4afca7023b5 Ming Lei      2015-06-04  4378  	}
e09aae7edec1d2 Ming Lei      2015-01-29  4379  
d0c98769ee7d5d Fengnan Chang 2025-11-28 @4380  	kfree(q->queue_hw_ctx);
e09aae7edec1d2 Ming Lei      2015-01-29  4381  
7ea5fe31c12dd8 Ming Lei      2017-02-22  4382  	/*
7ea5fe31c12dd8 Ming Lei      2017-02-22  4383  	 * release .mq_kobj and sw queue's kobject now because
7ea5fe31c12dd8 Ming Lei      2017-02-22  4384  	 * both share lifetime with request queue.
7ea5fe31c12dd8 Ming Lei      2017-02-22  4385  	 */
7ea5fe31c12dd8 Ming Lei      2017-02-22  4386  	blk_mq_sysfs_deinit(q);
e09aae7edec1d2 Ming Lei      2015-01-29  4387  }
e09aae7edec1d2 Ming Lei      2015-01-29  4388  

:::::: The code at line 4380 was first introduced by commit
:::::: d0c98769ee7d5db8d699a270690639cde1766cd4 blk-mq: use array manage hctx map instead of xarray

:::::: TO: Fengnan Chang <fengnanchang@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
