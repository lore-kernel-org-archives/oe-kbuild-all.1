Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CA71624DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 15:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765638475; cv=none; b=NM7epRy5S+p9IJ58HKYf/g96SBtksrR6RCMQo6BgmHbnEr4ZS8rg6Zev26Dx4PVQzo9m5yjgAWYAe25s9cvtE8TncK/IYltfbxSw8lWkHSEV77ljU8JwRLslLfBA++OywiXbiuermzBEk7xYHxuAgP+Ciaq/QJQhqNT1V1d/G9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765638475; c=relaxed/simple;
	bh=cQ/QqYl2EMw5yRGZadQz8ZJaL0Vg1uuv3Yw16J9Br+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IzUUQs1zRljv5OE7/PWVzzQVtpamWLRzfUyd1sWAE99fLHlD9REG91yt6Cg2UYlpz9tVoX4Zts2A1D2KNwFjZjhmdj9Bq7IO2GEsT3mVnt7qjapvpu4G6YG+Kr2ROq6mWp7yQEogkcl7+Vn0jI91C3HxCdfo1hX/OwnARVAVJzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eb9cGMhV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eb9cGMhV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765638472; x=1797174472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQ/QqYl2EMw5yRGZadQz8ZJaL0Vg1uuv3Yw16J9Br+o=;
  b=eb9cGMhVONH1co2ybfdAlwYKjIDWFKRdd1ern0aNscfuTn95g70HMPKU
   9ZE72oI9TMBFtEVBM6jNVjoA5A6w8SWJYRRkzMiBbMI5kDvZ0sks7Gpx6
   YaGHK5kiYFkGOnYBnM0z8AwFMvfXa/39FTGqkNxyEEUIdrjuC2oDf+0Pv
   IfsWAADrSSEHUistHHSyFB29tDVlWz4pXZPEqHicB4W6AKD8kJnb0LDqs
   GITOzu+x5TRLDenppoaEfdURZ+enaesE1aRPOrlrMxEAGYOq0DG1Qx+fp
   qUj0wSaiFMgvOftaJdakehw5UVVF2B9D1lFZMh+aXwLPVHZq2bb9/XlHg
   A==;
X-CSE-ConnectionGUID: QdkH9JnVQGeIKffu641QKQ==
X-CSE-MsgGUID: tI/eFr/KREmVtTn8OWBx4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67769436"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67769436"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 07:07:51 -0800
X-CSE-ConnectionGUID: LQsonmavSHm3Ku2xlvlP+A==
X-CSE-MsgGUID: YtTAIJ/WTbKUbUVQZMP/JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="234718390"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Dec 2025 07:07:51 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vURDo-000000007mO-1iLg;
	Sat, 13 Dec 2025 15:07:48 +0000
Date: Sat, 13 Dec 2025 23:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2] io_uring/io_uring.c:1469:61:
 warning: parameter 'locked' set but not used
Message-ID: <202512132236.25C42Pj5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   401d2e5564fad8fc4b2fa18984c5bfe568e36feb
commit: 3a1c153b965470d1225facb7f4a5cd30eb90241c [2/2] UPSTREAM: io_uring: move to separate directory
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251213/202512132236.25C42Pj5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132236.25C42Pj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132236.25C42Pj5-lkp@intel.com/

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

54a91f3bb9b96e fs/io_uring.c Jens Axboe     2019-09-10  1468  
f237c30a5610d3 fs/io_uring.c Pavel Begunkov 2021-08-18 @1469  static void io_queue_async_work(struct io_kiocb *req, bool *locked)
561fb04a6a2257 fs/io_uring.c Jens Axboe     2019-10-24  1470  {
a197f664a0db8a fs/io_uring.c Jackie Liu     2019-11-08  1471  	struct io_ring_ctx *ctx = req->ctx;
cbdcb4357c0008 fs/io_uring.c Pavel Begunkov 2020-06-29  1472  	struct io_kiocb *link = io_prep_linked_timeout(req);
5aa75ed5b93f08 fs/io_uring.c Jens Axboe     2021-02-16  1473  	struct io_uring_task *tctx = req->task->io_uring;
561fb04a6a2257 fs/io_uring.c Jens Axboe     2019-10-24  1474  
f237c30a5610d3 fs/io_uring.c Pavel Begunkov 2021-08-18  1475  	/* must not take the lock, NULL it as a precaution */
f237c30a5610d3 fs/io_uring.c Pavel Begunkov 2021-08-18  1476  	locked = NULL;
f237c30a5610d3 fs/io_uring.c Pavel Begunkov 2021-08-18  1477  
3bfe6106693b6b fs/io_uring.c Jens Axboe     2021-02-16  1478  	BUG_ON(!tctx);
3bfe6106693b6b fs/io_uring.c Jens Axboe     2021-02-16  1479  	BUG_ON(!tctx->io_wq);
561fb04a6a2257 fs/io_uring.c Jens Axboe     2019-10-24  1480  
cbdcb4357c0008 fs/io_uring.c Pavel Begunkov 2020-06-29  1481  	/* init ->work of the whole link before punting */
cbdcb4357c0008 fs/io_uring.c Pavel Begunkov 2020-06-29  1482  	io_prep_async_link(req);
991468dcf198bb fs/io_uring.c Jens Axboe     2021-07-23  1483  
991468dcf198bb fs/io_uring.c Jens Axboe     2021-07-23  1484  	/*
991468dcf198bb fs/io_uring.c Jens Axboe     2021-07-23  1485  	 * Not expected to happen, but if we do have a bug where this _can_
991468dcf198bb fs/io_uring.c Jens Axboe     2021-07-23  1486  	 * happen, catch it here and ensure the request is marked as
991468dcf198bb fs/io_uring.c Jens Axboe     2021-07-23  1487  	 * canceled. That will make io-wq go through the usual work cancel
991468dcf198bb fs/io_uring.c Jens Axboe     2021-07-23  1488  	 * procedure rather than attempt to run this request (or create a new
991468dcf198bb fs/io_uring.c Jens Axboe     2021-07-23  1489  	 * worker for it).
991468dcf198bb fs/io_uring.c Jens Axboe     2021-07-23  1490  	 */
991468dcf198bb fs/io_uring.c Jens Axboe     2021-07-23  1491  	if (WARN_ON_ONCE(!same_thread_group(req->task, current)))
991468dcf198bb fs/io_uring.c Jens Axboe     2021-07-23  1492  		req->work.flags |= IO_WQ_WORK_CANCEL;
991468dcf198bb fs/io_uring.c Jens Axboe     2021-07-23  1493  
d07f1e8a42614c fs/io_uring.c Pavel Begunkov 2021-03-22  1494  	trace_io_uring_queue_async_work(ctx, io_wq_is_hashed(&req->work), req,
d07f1e8a42614c fs/io_uring.c Pavel Begunkov 2021-03-22  1495  					&req->work, req->flags);
ebf936670721be fs/io_uring.c Pavel Begunkov 2021-03-01  1496  	io_wq_enqueue(tctx->io_wq, &req->work);
7271ef3a93a832 fs/io_uring.c Jens Axboe     2020-08-10  1497  	if (link)
7271ef3a93a832 fs/io_uring.c Jens Axboe     2020-08-10  1498  		io_queue_linked_timeout(link);
cbdcb4357c0008 fs/io_uring.c Pavel Begunkov 2020-06-29  1499  }
cbdcb4357c0008 fs/io_uring.c Pavel Begunkov 2020-06-29  1500  

:::::: The code at line 1469 was first introduced by commit
:::::: f237c30a5610d35a584f3296d397b93d80ce374e io_uring: batch task work locking

:::::: TO: Pavel Begunkov <asml.silence@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
