Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBFC4014B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 17:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458575; cv=none; b=eMN3i+Gz8mhS54u4ZQMZUIrEOVmZUCOYGloxg+nh3Z1ATftiT/d2vPqbgryVmo8hh8p/NeF2JYX3mLYJzE/qIfx5Tghzrjs4Zhzv0MzvbIZ3VgVhMu+vs7ebYXxU2AEI0IP7Fzd4w8q3AH0TtenX8P/z2mQXvxvruFPlRoMrIrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458575; c=relaxed/simple;
	bh=eDgnEFeXXrvDRTB12bMZmvwHxaqL3uhDv58J8BzDNJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r+zmOsN/4bFvGDyyRGcolJHeFkkxbvP4MkEVLs9vPsDyd6icQLVLIO4w4vccBXVh0kvcZ/4Kuq2OOLxAhqLeoZtptLnlyKRGymgOJhFs/wt7P6W4qRy6ratu0gCekBd8s0iXQ+vSlzZoJFlR7GtoKFpWlmD96HFzmfHprT2NqVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4mLBVT3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4mLBVT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774458565; x=1805994565;
  h=date:from:to:cc:subject:message-id;
  bh=eDgnEFeXXrvDRTB12bMZmvwHxaqL3uhDv58J8BzDNJc=;
  b=D4mLBVT3jt3G1PDcUHHUqJ3Xq4vLacSfO5bgP0DIixI3XAQ7lghm48Hr
   ldoWWXdds250WR94Wgd8pqkdeoBckHL4hXu/eUCKE0uzWQ7lCLI3z3Nyr
   ufquD8/nR/azWhChui1vxu3cDyTGjma5tG8xjC6nm/ZhVfxWDllHlfrL/
   l+YahS1CDauJ01aB5i0DEwQ74ZeA5MLcdUljNM34uln1GujVffWXWLsCg
   QMzhyMAJ4pxeeHMkBLSUl+7FvnqOFoMVxRSRtsvs2ENuj9v278uKzb1F5
   fDMTLhqx2W/DEfrdvRMv6KOgTx8LGCxreruVj2/3g8kg4+9e+Df1JJCmc
   Q==;
X-CSE-ConnectionGUID: eT0SH09eRceOLiSpEexCXQ==
X-CSE-MsgGUID: kZRzp6OuT92eRoT+dZ2yPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75219349"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75219349"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 10:09:15 -0700
X-CSE-ConnectionGUID: zos4mixeTFW4SK6Q1fsc0A==
X-CSE-MsgGUID: PTrgtQAmQgCSErRuWWSp6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="228811669"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Mar 2026 10:09:13 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5RjC-000000007Kt-1m1e;
	Wed, 25 Mar 2026 17:09:10 +0000
Date: Thu, 26 Mar 2026 01:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 4/4]
 drivers/mmc/core/queue.c:313:21: sparse: sparse: incorrect type in assignment
 (different base types)
Message-ID: <202603260138.JPob0YxH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   fc88a7504f0f262cc5b2e8a7f58b2a1108034856
commit: 7f5325b5bb9e2256378085bfc84bdf2feebaab54 [4/4] ANDROID: GKI: add vendor hook for mmc
config: i386-randconfig-r122-20260325 (https://download.01.org/0day-ci/archive/20260326/202603260138.JPob0YxH-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260138.JPob0YxH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260138.JPob0YxH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/core/queue.c:313:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] ret @@     got restricted blk_status_t [usertype] @@
   drivers/mmc/core/queue.c:313:21: sparse:     expected int [addressable] ret
   drivers/mmc/core/queue.c:313:21: sparse:     got restricted blk_status_t [usertype]
   drivers/mmc/core/queue.c:316:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] ret @@     got restricted blk_status_t [usertype] @@
   drivers/mmc/core/queue.c:316:21: sparse:     expected int [addressable] ret
   drivers/mmc/core/queue.c:316:21: sparse:     got restricted blk_status_t [usertype]
>> drivers/mmc/core/queue.c:338:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted blk_status_t @@     got int [addressable] [assigned] ret @@
   drivers/mmc/core/queue.c:338:16: sparse:     expected restricted blk_status_t
   drivers/mmc/core/queue.c:338:16: sparse:     got int [addressable] [assigned] ret

vim +313 drivers/mmc/core/queue.c

c09949cff5eb40 drivers/mmc/card/queue.c Adrian Hunter     2016-11-29  226  
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  227  static blk_status_t mmc_mq_queue_rq(struct blk_mq_hw_ctx *hctx,
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  228  				    const struct blk_mq_queue_data *bd)
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  229  {
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  230  	struct request *req = bd->rq;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  231  	struct request_queue *q = req->q;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  232  	struct mmc_queue *mq = q->queuedata;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  233  	struct mmc_card *card = mq->card;
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  234  	struct mmc_host *host = card->host;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  235  	enum mmc_issue_type issue_type;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  236  	enum mmc_issued issued;
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  237  	bool get_card, cqe_retune_ok;
7f5325b5bb9e22 drivers/mmc/core/queue.c Wenchao Chen      2022-04-22  238  	int ret = 0;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  239  
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  240  	if (mmc_card_removed(mq->card)) {
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  241  		req->rq_flags |= RQF_QUIET;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  242  		return BLK_STS_IOERR;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  243  	}
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  244  
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  245  	issue_type = mmc_issue_type(mq, req);
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  246  
f5d72c5c55bc39 drivers/mmc/core/queue.c Christoph Hellwig 2018-11-16  247  	spin_lock_irq(&mq->lock);
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  248  
26caddf274cf1e drivers/mmc/core/queue.c Adrian Hunter     2018-08-21  249  	if (mq->recovery_needed || mq->busy) {
f5d72c5c55bc39 drivers/mmc/core/queue.c Christoph Hellwig 2018-11-16  250  		spin_unlock_irq(&mq->lock);
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  251  		return BLK_STS_RESOURCE;
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  252  	}
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  253  
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  254  	switch (issue_type) {
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  255  	case MMC_ISSUE_DCMD:
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  256  		if (mmc_cqe_dcmd_busy(mq)) {
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  257  			mq->cqe_busy |= MMC_CQE_DCMD_BUSY;
f5d72c5c55bc39 drivers/mmc/core/queue.c Christoph Hellwig 2018-11-16  258  			spin_unlock_irq(&mq->lock);
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  259  			return BLK_STS_RESOURCE;
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  260  		}
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  261  		break;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  262  	case MMC_ISSUE_ASYNC:
511ce378e16f07 drivers/mmc/core/queue.c Baolin Wang       2020-02-12  263  		/*
511ce378e16f07 drivers/mmc/core/queue.c Baolin Wang       2020-02-12  264  		 * For MMC host software queue, we only allow 2 requests in
511ce378e16f07 drivers/mmc/core/queue.c Baolin Wang       2020-02-12  265  		 * flight to avoid a long latency.
511ce378e16f07 drivers/mmc/core/queue.c Baolin Wang       2020-02-12  266  		 */
7f5325b5bb9e22 drivers/mmc/core/queue.c Wenchao Chen      2022-04-22  267  		trace_android_vh_mmc_check_status(bd, &ret);
7f5325b5bb9e22 drivers/mmc/core/queue.c Wenchao Chen      2022-04-22  268  		if (!ret && host->hsq_enabled && mq->in_flight[issue_type] > 2) {
511ce378e16f07 drivers/mmc/core/queue.c Baolin Wang       2020-02-12  269  			spin_unlock_irq(&mq->lock);
511ce378e16f07 drivers/mmc/core/queue.c Baolin Wang       2020-02-12  270  			return BLK_STS_RESOURCE;
511ce378e16f07 drivers/mmc/core/queue.c Baolin Wang       2020-02-12  271  		}
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  272  		break;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  273  	default:
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  274  		/*
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  275  		 * Timeouts are handled by mmc core, and we don't have a host
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  276  		 * API to abort requests, so we can't handle the timeout anyway.
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  277  		 * However, when the timeout happens, blk_mq_complete_request()
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  278  		 * no longer works (to stop the request disappearing under us).
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  279  		 * To avoid racing with that, set a large timeout.
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  280  		 */
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  281  		req->timeout = 600 * HZ;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  282  		break;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  283  	}
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  284  
26caddf274cf1e drivers/mmc/core/queue.c Adrian Hunter     2018-08-21  285  	/* Parallel dispatch of requests is not supported at the moment */
26caddf274cf1e drivers/mmc/core/queue.c Adrian Hunter     2018-08-21  286  	mq->busy = true;
26caddf274cf1e drivers/mmc/core/queue.c Adrian Hunter     2018-08-21  287  
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  288  	mq->in_flight[issue_type] += 1;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  289  	get_card = (mmc_tot_in_flight(mq) == 1);
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  290  	cqe_retune_ok = (mmc_cqe_qcnt(mq) == 1);
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  291  
f5d72c5c55bc39 drivers/mmc/core/queue.c Christoph Hellwig 2018-11-16  292  	spin_unlock_irq(&mq->lock);
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  293  
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  294  	if (!(req->rq_flags & RQF_DONTPREP)) {
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  295  		req_to_mmc_queue_req(req)->retries = 0;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  296  		req->rq_flags |= RQF_DONTPREP;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  297  	}
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  298  
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  299  	if (get_card)
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  300  		mmc_get_card(card, &mq->ctx);
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  301  
407a1c570f9248 drivers/mmc/core/queue.c Luca Porzio       2021-02-15  302  	if (host->cqe_enabled) {
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  303  		host->retune_now = host->need_retune && cqe_retune_ok &&
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  304  				   !host->hold_retune;
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  305  	}
1e8e55b67030c6 drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  306  
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  307  	blk_mq_start_request(req);
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  308  
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  309  	issued = mmc_blk_mq_issue_rq(mq, req);
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  310  
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  311  	switch (issued) {
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  312  	case MMC_REQ_BUSY:
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29 @313  		ret = BLK_STS_RESOURCE;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  314  		break;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  315  	case MMC_REQ_FAILED_TO_START:
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  316  		ret = BLK_STS_IOERR;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  317  		break;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  318  	default:
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  319  		ret = BLK_STS_OK;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  320  		break;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  321  	}
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  322  
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  323  	if (issued != MMC_REQ_STARTED) {
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  324  		bool put_card = false;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  325  
f5d72c5c55bc39 drivers/mmc/core/queue.c Christoph Hellwig 2018-11-16  326  		spin_lock_irq(&mq->lock);
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  327  		mq->in_flight[issue_type] -= 1;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  328  		if (mmc_tot_in_flight(mq) == 0)
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  329  			put_card = true;
26caddf274cf1e drivers/mmc/core/queue.c Adrian Hunter     2018-08-21  330  		mq->busy = false;
f5d72c5c55bc39 drivers/mmc/core/queue.c Christoph Hellwig 2018-11-16  331  		spin_unlock_irq(&mq->lock);
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  332  		if (put_card)
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  333  			mmc_put_card(card, &mq->ctx);
26caddf274cf1e drivers/mmc/core/queue.c Adrian Hunter     2018-08-21  334  	} else {
26caddf274cf1e drivers/mmc/core/queue.c Adrian Hunter     2018-08-21  335  		WRITE_ONCE(mq->busy, false);
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  336  	}
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  337  
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29 @338  	return ret;
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  339  }
81196976ed946c drivers/mmc/core/queue.c Adrian Hunter     2017-11-29  340  

:::::: The code at line 313 was first introduced by commit
:::::: 81196976ed946cbf36bb41ddda402853c7df7cfa mmc: block: Add blk-mq support

:::::: TO: Adrian Hunter <adrian.hunter@intel.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
