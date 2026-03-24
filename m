Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983B23DEAC9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349642; cv=none; b=HEyxASyTlW/BAQOT7gJxnClRKLciQqs/cuM6buz/IRjvGLmKFgXoEY2UvFwU/+67TbLPhGeDfJgrnm3/ujYv6X+vsap+4CnXKrxf/o3/9VY/2etvPwDRYHAw/sGWxsRbTpELzrM/bkMJigr9F3y2s8tccIYIK14yXscxfQ9XyEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349642; c=relaxed/simple;
	bh=To1BIO+B/pdw0AM5vpn7iQQdJC/ahL6gm17tGR5DNWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MSfqoyqXgR9qRjItouMAKMDJaqMt7h+SHBnN+cfXrN09UB0xlh/gjEUuwck4xYBWM5VJ/hkrq2DIdUMgzIcvriHh38brcEHQvJzTZ3c0ciupsiio6ehKAGVtO+Trmz47a6sbDp7EgyHqMed5Zc+llhqBIlPvSYxTyq/ROB6a/SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwsARvVh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwsARvVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774349640; x=1805885640;
  h=date:from:to:cc:subject:message-id;
  bh=To1BIO+B/pdw0AM5vpn7iQQdJC/ahL6gm17tGR5DNWg=;
  b=DwsARvVhAZuXq4GclwGESmEEjVFdvf/RUlSxXY/cY0RkSrMl5biH8yAZ
   KpmT3jXU3SFxDie0s3UxLwXrFj4BZXinHv7cQqt3y/lhCcVWuFbxDuRYV
   Ed0P+Voz2rZYNYoCZubTWNtlZoP0TYFs2BQy/6NZFElMyrRHn95xIoCQk
   4HRoMRSP6fGss0NJuijXWGizK1Ry8kDFbPeb3AK/nkEhTgc2vmjOV2Tvy
   jvyxhR/ODdAhSuGUIe1MBsLvVgyNrJjHYR0calTKYzvLUkpnimXogoaqD
   zNouuy6aodl8xT2U/PhQEZOtbz6rnnDGJNC2rnzv1LYIOiTIBLyEUuTbK
   w==;
X-CSE-ConnectionGUID: 3KEwABKTRfWmkUdfPQmFLQ==
X-CSE-MsgGUID: l1LzFb+vTRqwGl6bVtv2hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="100806412"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="100806412"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:54:00 -0700
X-CSE-ConnectionGUID: f6fcRt7+R7qpMbMld+m8BQ==
X-CSE-MsgGUID: oi5v/7T7Tv+0bJaYJ8aiXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="223533560"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Mar 2026 03:53:58 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4zOV-000000004Q1-3bj1;
	Tue, 24 Mar 2026 10:53:55 +0000
Date: Tue, 24 Mar 2026 18:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 io_uring/io_uring.c:1469:61: warning: parameter 'locked' set but not used
Message-ID: <202603241826.aKtRxVtU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jens,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   4245ca9177fc8433bf9e3dd66b5fbbec23250334
commit: f435c66d2336fff104e2c3cbfff60905733e7d89 [1/1] io_uring: move to separate directory
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260324/202603241826.aKtRxVtU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241826.aKtRxVtU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241826.aKtRxVtU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/io_uring.c:1469:61: warning: parameter 'locked' set but not used [-Wunused-but-set-parameter]
    1469 | static void io_queue_async_work(struct io_kiocb *req, bool *locked)
         |                                                             ^
   io_uring/io_uring.c:6135:31: warning: default initialization of an object of type 'typeof ((sqe->addr2))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    6135 |                 if (get_timespec64(&tr->ts, u64_to_user_ptr(sqe->addr2)))
         |                                             ^
   include/linux/kernel.h:50:2: note: expanded from macro 'u64_to_user_ptr'
      50 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   io_uring/io_uring.c:6216:32: warning: default initialization of an object of type 'typeof ((sqe->addr))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    6216 |         if (get_timespec64(&data->ts, u64_to_user_ptr(sqe->addr)))
         |                                       ^
   include/linux/kernel.h:50:2: note: expanded from macro 'u64_to_user_ptr'
      50 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   3 warnings generated.


vim +/locked +1469 io_uring/io_uring.c

54a91f3bb9b96ed fs/io_uring.c Jens Axboe     2019-09-10  1468  
f237c30a5610d35 fs/io_uring.c Pavel Begunkov 2021-08-18 @1469  static void io_queue_async_work(struct io_kiocb *req, bool *locked)
561fb04a6a22577 fs/io_uring.c Jens Axboe     2019-10-24  1470  {
a197f664a0db8a6 fs/io_uring.c Jackie Liu     2019-11-08  1471  	struct io_ring_ctx *ctx = req->ctx;
cbdcb4357c00086 fs/io_uring.c Pavel Begunkov 2020-06-29  1472  	struct io_kiocb *link = io_prep_linked_timeout(req);
5aa75ed5b93f086 fs/io_uring.c Jens Axboe     2021-02-16  1473  	struct io_uring_task *tctx = req->task->io_uring;
561fb04a6a22577 fs/io_uring.c Jens Axboe     2019-10-24  1474  
f237c30a5610d35 fs/io_uring.c Pavel Begunkov 2021-08-18  1475  	/* must not take the lock, NULL it as a precaution */
f237c30a5610d35 fs/io_uring.c Pavel Begunkov 2021-08-18  1476  	locked = NULL;
f237c30a5610d35 fs/io_uring.c Pavel Begunkov 2021-08-18  1477  
3bfe6106693b6b4 fs/io_uring.c Jens Axboe     2021-02-16  1478  	BUG_ON(!tctx);
3bfe6106693b6b4 fs/io_uring.c Jens Axboe     2021-02-16  1479  	BUG_ON(!tctx->io_wq);
561fb04a6a22577 fs/io_uring.c Jens Axboe     2019-10-24  1480  
cbdcb4357c00086 fs/io_uring.c Pavel Begunkov 2020-06-29  1481  	/* init ->work of the whole link before punting */
cbdcb4357c00086 fs/io_uring.c Pavel Begunkov 2020-06-29  1482  	io_prep_async_link(req);
991468dcf198bb8 fs/io_uring.c Jens Axboe     2021-07-23  1483  
991468dcf198bb8 fs/io_uring.c Jens Axboe     2021-07-23  1484  	/*
991468dcf198bb8 fs/io_uring.c Jens Axboe     2021-07-23  1485  	 * Not expected to happen, but if we do have a bug where this _can_
991468dcf198bb8 fs/io_uring.c Jens Axboe     2021-07-23  1486  	 * happen, catch it here and ensure the request is marked as
991468dcf198bb8 fs/io_uring.c Jens Axboe     2021-07-23  1487  	 * canceled. That will make io-wq go through the usual work cancel
991468dcf198bb8 fs/io_uring.c Jens Axboe     2021-07-23  1488  	 * procedure rather than attempt to run this request (or create a new
991468dcf198bb8 fs/io_uring.c Jens Axboe     2021-07-23  1489  	 * worker for it).
991468dcf198bb8 fs/io_uring.c Jens Axboe     2021-07-23  1490  	 */
991468dcf198bb8 fs/io_uring.c Jens Axboe     2021-07-23  1491  	if (WARN_ON_ONCE(!same_thread_group(req->task, current)))
991468dcf198bb8 fs/io_uring.c Jens Axboe     2021-07-23  1492  		req->work.flags |= IO_WQ_WORK_CANCEL;
991468dcf198bb8 fs/io_uring.c Jens Axboe     2021-07-23  1493  
d07f1e8a42614cc fs/io_uring.c Pavel Begunkov 2021-03-22  1494  	trace_io_uring_queue_async_work(ctx, io_wq_is_hashed(&req->work), req,
d07f1e8a42614cc fs/io_uring.c Pavel Begunkov 2021-03-22  1495  					&req->work, req->flags);
ebf936670721be8 fs/io_uring.c Pavel Begunkov 2021-03-01  1496  	io_wq_enqueue(tctx->io_wq, &req->work);
7271ef3a93a8321 fs/io_uring.c Jens Axboe     2020-08-10  1497  	if (link)
7271ef3a93a8321 fs/io_uring.c Jens Axboe     2020-08-10  1498  		io_queue_linked_timeout(link);
cbdcb4357c00086 fs/io_uring.c Pavel Begunkov 2020-06-29  1499  }
cbdcb4357c00086 fs/io_uring.c Pavel Begunkov 2020-06-29  1500  

:::::: The code at line 1469 was first introduced by commit
:::::: f237c30a5610d35a584f3296d397b93d80ce374e io_uring: batch task work locking

:::::: TO: Pavel Begunkov <asml.silence@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
