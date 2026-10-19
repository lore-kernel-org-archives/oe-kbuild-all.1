Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792442298;
	b=n2ynSxkf9aDrH23bwr5smC332EFB01xLxN+Bau9tlc8fmrKU//13b/0rLYY3KFY+K5MG
	 KO2RwJ4uTTtURYmgG8e43EYV2JMBY5kZAfzw/7VCzUDM/TySIDSIK640drzmJX7ZEQ7zj
	 Rcd6gLsEwu8TSsr2Dn7Dz4xJUfJjAP8CALDH7QichrNh9lVpMdGC9+XoNTBn9kjH5yjyP
	 /YYbfUxtFZiQNAPFv2eK4p8iAyKV3HVEa8cSFCcsg18FEJZC1jvX3pjKHKjgsx1AnoU0f
	 AAXCPWG718lAi0uVyEWI367WK+ryp91+UkmuXrIHtmNCiqTBBbU7+rc9YyqFgZkPubw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792442298;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=U0DFD7Oo/tQ++iGrT5fkYVrr0A6OhBUDYQM1mMBtCoU=;
	b=u+VwZ+CVYMCIfD7PjX7hxDU8QKnfJgbRIStcX7z+PSkbnAjmG2ggm4ceH6XYabKxxyce
	 ypHsqzu7+PByIbNtIxhiKEJZ88BlZFQFeL0fDzQlyvk0MKU0rQ96yNaSAA3qaZ1kS8Nqb
	 FoXGvE1oDi71jeZkjjm4SrEBWyHe3GkBIZWnicjmOZkuW4JtF0GSsoc9PFtKxPElZY81+
	 tV8/cYcBdCrwjuZHdu2hmwuIP8Tb6i9Td430I00L569olclA+ENI7ajPv+aSdZu1M3EBP
	 79NvjrD34Bb2gFqW47CLyMpelnbaQXr83svJwsm40s9HLLmAjNa1T/Sp0os386lMLSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i3vkEJ4S;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5244606A31D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 20:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5244606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i3vkEJ4S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792442298; x=1823978298;
  h=date:from:to:cc:subject:message-id;
  bh=OZ7SQsRIE+YVXaApc8ya0f8152jKHm9PE59S3sj/uM8=;
  b=i3vkEJ4SSHtBayJdfDiZWp5uhgvz9CiqSLxLq7dcE3viEAGVoGYdfDzC
   cZ5qQtNVRALJVm43/QESjK7o9ty4d/okQ6oi+VTfbohhqJKAwxKkrkx8z
   at/KVMGYdFdhuGDuidkQrbBTdv0WRKhSR+osAOihmUEUKRyKgHvH+O27b
   OMRLk6B4umMn5wPM36T2/eRBTFX65/6XrRIWl9nsVem+iXS6303J/CvZc
   kSLTNsLAtutEvtwkRo0isZx9e+WjF44RPq7B3jD3cPs7vLK2qMEi+eyKd
   57/+C73zqlQ5Iq40Jhe6RWm6Ve98iUj+5RlQSyabZCPYunwFb8tUwOVyW
   w==;
X-CSE-ConnectionGUID: +CLigytQTbqFG9bW9riZXw==
X-CSE-MsgGUID: V8zXw/O4SfSta8yGxLZ5nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1035941"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1035941"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:38:17 -0700
X-CSE-ConnectionGUID: d1+c5kcDRAWxiTOoq99rEw==
X-CSE-MsgGUID: ScDemZV6SROMVBY1zLCmzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2599417"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 19 Oct 2026 13:38:17 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIu7Z-000000005sl-37vH;
	Mon, 19 Oct 2026 20:38:13 +0000
Date: Mon, 19 Oct 2026 22:37:14 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 1/1]
 io_uring/io_uring.c:1466:61: warning: parameter 'locked' set but not used
Message-ID: <202610192231.34uG86FR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-10
head:   a4c2f82969bc5fa7fcc21ede4b690ece7ff72335
commit: 76050cdc5c3427bc117501314d31f15a2635d50b [1/1] UPSTREAM: io_uring: import 5.15-stable io_uring
config: arm-randconfig-r2104-20261018 (https://download.01.org/0day-ci/archive/20261019/202610192231.34uG86FR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610192231.34uG86FR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610192231.34uG86FR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/io_uring.c: In function 'io_queue_async_work':
>> io_uring/io_uring.c:1466:61: warning: parameter 'locked' set but not used [-Wunused-but-set-parameter]
    static void io_queue_async_work(struct io_kiocb *req, bool *locked)
                                                                ^~~~~~


vim +/locked +1466 io_uring/io_uring.c

  1465	
> 1466	static void io_queue_async_work(struct io_kiocb *req, bool *locked)
  1467	{
  1468		struct io_ring_ctx *ctx = req->ctx;
  1469		struct io_kiocb *link = io_prep_linked_timeout(req);
  1470		struct io_uring_task *tctx = req->task->io_uring;
  1471	
  1472		/* must not take the lock, NULL it as a precaution */
  1473		locked = NULL;
  1474	
  1475		BUG_ON(!tctx);
  1476		BUG_ON(!tctx->io_wq);
  1477	
  1478		/* init ->work of the whole link before punting */
  1479		io_prep_async_link(req);
  1480	
  1481		/*
  1482		 * Not expected to happen, but if we do have a bug where this _can_
  1483		 * happen, catch it here and ensure the request is marked as
  1484		 * canceled. That will make io-wq go through the usual work cancel
  1485		 * procedure rather than attempt to run this request (or create a new
  1486		 * worker for it).
  1487		 */
  1488		if (WARN_ON_ONCE(!same_thread_group(req->task, current)))
  1489			req->work.flags |= IO_WQ_WORK_CANCEL;
  1490	
  1491		trace_io_uring_queue_async_work(ctx, io_wq_is_hashed(&req->work), req,
  1492						&req->work, req->flags);
  1493		io_wq_enqueue(tctx->io_wq, &req->work);
  1494		if (link)
  1495			io_queue_linked_timeout(link);
  1496	}
  1497	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
