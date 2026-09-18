Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2F8331EB0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 04:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705266; cv=none; b=h2+IHHyOk4bfGA2Yi/UDrn5dmayzxcLO9xvxm0s/nI7c7DuwbgR/n7UdQDdhwN8eE3Qvra/Fz+l1Fh/O7nYSL+Z1AFnBFFfRgB7PMTZ/uVuMyODwUWhib1WrjZ3C++5UmxS5C+ZnxZ7A0B6lHtnpl99XREYMJZKdKOWh6QwyuYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705266; c=relaxed/simple;
	bh=IiyqM1KJb3kWY8VHuoZya1OhBRxR2YCi4CKCMA6aWIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mNdS3XjLQTjqgmzobl0slciAvtbV3T0S0FkdLXuTg69FKeQ+4grw3Eg+k5uhCjQAd/Heo5WOTZ9pfzWHwp1ngdy7UN/nSTLwdFn6HUAUVGmvZwYpsv2kV4bEgWQRm+heOicC5EEdNHiyugUVRtG8GFLva+h0UR8bYGY3Up8N+y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwS7Yp4C; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwS7Yp4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789705264; x=1821241264;
  h=date:from:to:cc:subject:message-id;
  bh=IiyqM1KJb3kWY8VHuoZya1OhBRxR2YCi4CKCMA6aWIY=;
  b=hwS7Yp4Cf4XEfEKb+Jf+bhdUajFSAZVfUmOuwdZhjQl62MrYLnq3qq40
   5NK4Er0y3yfDbKQBlo3LVukAwR6lsiJ8oYJet7HVCHDAfnCatcbYEXwFI
   iZvbtyS73iicePJbtM3AbkDxrMAq2GO+UFUoVSEQXZ07oWfQllgfuA/Tt
   j+yh5ZViz/1hQmBlcf+s4m8ImoI14hDs8VZB362t9H18EhR6C7dNewNWm
   7ulgw84FMO2YxfMLfuWGVbIj+rBQAmzYC1mKS9zecH13fB405MabG3gId
   G0EojRRUqmbpUHVVyyruKKG6BE7Caw3Xkj5Y/O4pDJWY91rdY7KPfkTJP
   w==;
X-CSE-ConnectionGUID: 9p5/iCZ7RA2rY7wqmlS99A==
X-CSE-MsgGUID: U2vIdL4fQKy3asvjJD8OQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77752069"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77752069"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 21:21:03 -0700
X-CSE-ConnectionGUID: gS0qLnwmQVOE55ZjyhzBug==
X-CSE-MsgGUID: /VEBPrnGTaSuWY+2WOjs+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267940511"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2026 21:21:02 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Q5n-000000009GZ-2dkJ;
	Fri, 18 Sep 2026 04:20:55 +0000
Date: Fri, 18 Sep 2026 12:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-06 0/1]
 io_uring/io_uring.c:3110:51: sparse: sparse: incompatible types in comparison
 expression (different address spaces):
Message-ID: <202609181101.oIyaCj0W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-06
head:   9502f9af7772f796d474c821526ac09e4dfea914
commit: 48f33ec1410756957889a3642199aee065d1167f [0/1] io_uring: consistently use rcu semantics with sqpoll thread
config: x86_64-randconfig-1302-20260917 (https://download.01.org/0day-ci/archive/20260918/202609181101.oIyaCj0W-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609181101.oIyaCj0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609181101.oIyaCj0W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> io_uring/io_uring.c:3110:51: sparse: sparse: incompatible types in comparison expression (different address spaces):
   io_uring/io_uring.c:3110:51: sparse:    struct task_struct [noderef] __rcu *
   io_uring/io_uring.c:3110:51: sparse:    struct task_struct *
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:183:37: sparse: sparse: array of flexible structures
   io_uring/io_uring.c:581:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block

vim +3110 io_uring/io_uring.c

1b00764f09b691 fs/io_uring.c       Pavel Begunkov 2021-03-06  3076  
affa87db90108d io_uring/io_uring.c Pavel Begunkov 2022-06-20  3077  static __cold bool io_uring_try_cancel_requests(struct io_ring_ctx *ctx,
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3078  						struct task_struct *task,
3dd0c97a9e011b fs/io_uring.c       Pavel Begunkov 2021-05-16  3079  						bool cancel_all)
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3080  {
3dd0c97a9e011b fs/io_uring.c       Pavel Begunkov 2021-05-16  3081  	struct io_task_cancel cancel = { .task = task, .all = cancel_all, };
1b00764f09b691 fs/io_uring.c       Pavel Begunkov 2021-03-06  3082  	struct io_uring_task *tctx = task ? task->io_uring : NULL;
affa87db90108d io_uring/io_uring.c Pavel Begunkov 2022-06-20  3083  	enum io_wq_cancel cret;
affa87db90108d io_uring/io_uring.c Pavel Begunkov 2022-06-20  3084  	bool ret = false;
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3085  
360cd42c4e95ff io_uring/io_uring.c Pavel Begunkov 2023-04-06  3086  	/* set it so io_req_local_work_add() would wake us up */
360cd42c4e95ff io_uring/io_uring.c Pavel Begunkov 2023-04-06  3087  	if (ctx->flags & IORING_SETUP_DEFER_TASKRUN) {
360cd42c4e95ff io_uring/io_uring.c Pavel Begunkov 2023-04-06  3088  		atomic_set(&ctx->cq_wait_nr, 1);
360cd42c4e95ff io_uring/io_uring.c Pavel Begunkov 2023-04-06  3089  		smp_mb();
360cd42c4e95ff io_uring/io_uring.c Pavel Begunkov 2023-04-06  3090  	}
360cd42c4e95ff io_uring/io_uring.c Pavel Begunkov 2023-04-06  3091  
60053be859b33f fs/io_uring.c       Pavel Begunkov 2022-03-21  3092  	/* failed during ring init, it couldn't have issued any requests */
60053be859b33f fs/io_uring.c       Pavel Begunkov 2022-03-21  3093  	if (!ctx->rings)
affa87db90108d io_uring/io_uring.c Pavel Begunkov 2022-06-20  3094  		return false;
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3095  
1b00764f09b691 fs/io_uring.c       Pavel Begunkov 2021-03-06  3096  	if (!task) {
1b00764f09b691 fs/io_uring.c       Pavel Begunkov 2021-03-06  3097  		ret |= io_uring_try_cancel_iowq(ctx);
1b00764f09b691 fs/io_uring.c       Pavel Begunkov 2021-03-06  3098  	} else if (tctx && tctx->io_wq) {
1b00764f09b691 fs/io_uring.c       Pavel Begunkov 2021-03-06  3099  		/*
1b00764f09b691 fs/io_uring.c       Pavel Begunkov 2021-03-06  3100  		 * Cancels requests of all rings, not only @ctx, but
1b00764f09b691 fs/io_uring.c       Pavel Begunkov 2021-03-06  3101  		 * it's fine as the task is in exit/exec.
1b00764f09b691 fs/io_uring.c       Pavel Begunkov 2021-03-06  3102  		 */
5aa75ed5b93f08 fs/io_uring.c       Jens Axboe     2021-02-16  3103  		cret = io_wq_cancel_cb(tctx->io_wq, io_cancel_task_cb,
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3104  				       &cancel, true);
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3105  		ret |= (cret != IO_WQ_CANCEL_NOTFOUND);
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3106  	}
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3107  
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3108  	/* SQPOLL thread does its own polling */
3dd0c97a9e011b fs/io_uring.c       Pavel Begunkov 2021-05-16  3109  	if ((!(ctx->flags & IORING_SETUP_SQPOLL) && cancel_all) ||
d052d1d685f512 fs/io_uring.c       Jens Axboe     2021-03-11 @3110  	    (ctx->sq_data && ctx->sq_data->thread == current)) {
5eef4e87eb0b2b fs/io_uring.c       Pavel Begunkov 2021-09-24  3111  		while (!wq_list_empty(&ctx->iopoll_list)) {
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3112  			io_iopoll_try_reap_events(ctx);
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3113  			ret = true;
fcc926bb857949 io_uring/io_uring.c Jens Axboe     2023-01-27  3114  			cond_resched();
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3115  		}
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3116  	}
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3117  
140102ae9a9f2f io_uring/io_uring.c Pavel Begunkov 2023-01-05  3118  	if ((ctx->flags & IORING_SETUP_DEFER_TASKRUN) &&
140102ae9a9f2f io_uring/io_uring.c Pavel Begunkov 2023-01-05  3119  	    io_allowed_defer_tw_run(ctx))
9fe3eaea4a3530 io_uring/io_uring.c Jens Axboe     2024-01-31  3120  		ret |= io_run_local_work(ctx, INT_MAX) > 0;
3dd0c97a9e011b fs/io_uring.c       Pavel Begunkov 2021-05-16  3121  	ret |= io_cancel_defer_files(ctx, task, cancel_all);
9ca9fb24d5febc io_uring/io_uring.c Pavel Begunkov 2022-06-16  3122  	mutex_lock(&ctx->uring_lock);
3dd0c97a9e011b fs/io_uring.c       Pavel Begunkov 2021-05-16  3123  	ret |= io_poll_remove_all(ctx, task, cancel_all);
f31ecf671ddc49 io_uring/io_uring.c Jens Axboe     2023-07-10  3124  	ret |= io_waitid_remove_all(ctx, task, cancel_all);
194bb58c6090e3 io_uring/io_uring.c Jens Axboe     2023-06-08  3125  	ret |= io_futex_remove_all(ctx, task, cancel_all);
93b8cc60c37b9d io_uring/io_uring.c Ming Lei       2023-09-28  3126  	ret |= io_uring_try_cancel_uring_cmd(ctx, task, cancel_all);
9ca9fb24d5febc io_uring/io_uring.c Pavel Begunkov 2022-06-16  3127  	mutex_unlock(&ctx->uring_lock);
3dd0c97a9e011b fs/io_uring.c       Pavel Begunkov 2021-05-16  3128  	ret |= io_kill_timeouts(ctx, task, cancel_all);
e5dc480d4ed988 fs/io_uring.c       Pavel Begunkov 2021-06-26  3129  	if (task)
c0e0d6ba25f180 io_uring/io_uring.c Dylan Yudaken  2022-08-30  3130  		ret |= io_run_task_work() > 0;
254176234222c9 io_uring/io_uring.c Jens Axboe     2024-03-18  3131  	else
254176234222c9 io_uring/io_uring.c Jens Axboe     2024-03-18  3132  		ret |= flush_delayed_work(&ctx->fallback_work);
affa87db90108d io_uring/io_uring.c Pavel Begunkov 2022-06-20  3133  	return ret;
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3134  }
9936c7c2bc76a0 fs/io_uring.c       Pavel Begunkov 2021-02-04  3135  

:::::: The code at line 3110 was first introduced by commit
:::::: d052d1d685f5125249ab4ff887562c88ba959638 io_uring: perform IOPOLL reaping if canceler is thread itself

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
