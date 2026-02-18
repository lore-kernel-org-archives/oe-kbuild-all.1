Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4991FE44B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 00:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771373786; cv=none; b=ihjsVi4AlquxJoP1K3w7wktv5WWFDBW6Ok+WTcT8zEttxX5PmJnMIlikrwTait+r8oOcJn+w7YWqdp4JrKxrkyva4T5LHuemzFBvOrHCQWfkdlw0MMs6Ctf+ZBLu+fr2J2xu3z5PgcMbaLntJHWEQ+gz9rUL55aGLxxWPDLF54g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771373786; c=relaxed/simple;
	bh=dGtQkHzgfxTnS2lEpTPBtUkKyMn6xZoFpuXaqHA3JI8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zy84N9QX4ZHRd3YkuuDlN9rMODfctcPOIbf72/N/56TD06p1GL5MMHrmkseyKx9wzLPMwtDby3XtTXN2YyCQm7G2JiByVtRS2hDa2NiXhqBu6A8IgNObEXtKdv/l0Kq88Wzqw+WIn/Q8o/XJG7zfzG/GaNiMxXSf5vT+X1bfFy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aculQ+hk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aculQ+hk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771373785; x=1802909785;
  h=date:from:to:cc:subject:message-id;
  bh=dGtQkHzgfxTnS2lEpTPBtUkKyMn6xZoFpuXaqHA3JI8=;
  b=aculQ+hkrWn9RMtiJYAAH64416XnwRZFAkKWikRbX/SGbcUqHNz90D48
   I31dIslMwNmdtSMB8bzmxU2d8mIT5MQB7Svax6h1kZG5/HWl9/9y0WWfD
   TQCBvSa5LHXAyV4KmdQGRqf5LcQwsIoeGpU15S6jH/7udY0MUhLQT/9eM
   nSuWpbZOPYfLr14eD/M+RACYbCafqih6YUgADbqjF+y0DQ4fmDvJFWGge
   4Cu6k/uX7ji2GuYUtIWO3qJWcEhSuMbNozRlM5Zqpdm56FLkBfgfJEjxy
   nZ4JMCPqhnr5W2xOUC+ZYw0StQBU1ZzG0ybD85temwScFNlEBbmP9vGmG
   w==;
X-CSE-ConnectionGUID: kjsaQm2oQrKS9pxJCljYDA==
X-CSE-MsgGUID: /n2RxHbMQ0eyfCCQ73FyIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72353833"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72353833"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 16:16:25 -0800
X-CSE-ConnectionGUID: ANdzI7k8RGKLYIAhImeT/Q==
X-CSE-MsgGUID: kHRpX4ovSNGjpR/Q0A89eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="217923994"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Feb 2026 16:16:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsVEq-000000011rW-2jWg;
	Wed, 18 Feb 2026 00:16:20 +0000
Date: Wed, 18 Feb 2026 08:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 1/1]
 io_uring/io_uring.c:3110:51: sparse: sparse: incompatible types in comparison
 expression (different address spaces):
Message-ID: <202602180851.INqzXyVj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   29ad9691904c2b418850403fe9ef5b80a58f13ac
commit: 48f33ec1410756957889a3642199aee065d1167f [1/1] io_uring: consistently use rcu semantics with sqpoll thread
config: i386-randconfig-r112-20260218 (https://download.01.org/0day-ci/archive/20260218/202602180851.INqzXyVj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180851.INqzXyVj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180851.INqzXyVj-lkp@intel.com/

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
