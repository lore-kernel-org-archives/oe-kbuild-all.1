Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2FA39341F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319005; cv=none; b=g5bzf/Zc4w4hV7aHyqRio8D/2MVO1H8m3/EFl7czn4yOsLZv6yzvIYMcAl/zxxcUcn99UNWfYJv01e3N/lqhnaOk2yvmj2UD9oXXfjGlJp3Rs/NklWJ2vzAPLn0u2oXREu3DUh5S1wALdTJdVmt1jBazi9XOAjSKNL2Info3SaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319005; c=relaxed/simple;
	bh=lfWA8mbyFqyEzgEA5Z+0kp9WQB6i/GV2UlyREH81Nt8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FWQ3iSTxYc2Xz8fuknG4NolYcl/GBIm90lFecNgChspKsNLF6oa11nT6dOgSQKTi0M6mTt0nrNbsXs7yyf3NoU9WyM6bJn9fK6k9c40asE8iedKPGyS/VnJyPKp40GiBs46j5jxpI3tE1OgZETeebCwb9JgavW4j4OaCvHqfS8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kv9n6GMe; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kv9n6GMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768319004; x=1799855004;
  h=date:from:to:cc:subject:message-id;
  bh=lfWA8mbyFqyEzgEA5Z+0kp9WQB6i/GV2UlyREH81Nt8=;
  b=kv9n6GMeeDl8G3TnZ4x6fVbJwSZvp8cpKP+76TtMmlRgeS1/06O5KFjV
   mQ8yTo9MDgrY1SpGwC7A3lzfJiwYBwb9hECg1y6YBIO8SmaV9WZMj73vu
   cMWRh8QiRLbffGYJkZ8cyDc4w+UApg9Qr0egDcIpX1Wn8JL1Jtq0RmnWT
   P+APKna0BxEwmv+57sxYPcJ0wYzUeWxWSrnqMOexTHKxDP72rHuUJDzeS
   rvWQ2rbt6ftmZ48RHdyRUaXH/7+JjiQOf8dsZcf9BQj667s9HTJlHNjKL
   99UvDTrRv+/iRu5fSYetV6mnh0swUFIM+Mrh6Awldnqg+FptfFY+/LSgV
   w==;
X-CSE-ConnectionGUID: /sAlC+tTSGyXiBmUYSlflA==
X-CSE-MsgGUID: y050HJ3tR3GcRE3/SRZjeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69764904"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69764904"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 07:43:24 -0800
X-CSE-ConnectionGUID: 5TcMFDUcQCWav1XAR/Wj9Q==
X-CSE-MsgGUID: XjSNy+rETz6XYt8L+XlYHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204435498"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jan 2026 07:43:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfgYB-00000000F1K-1BzB;
	Tue, 13 Jan 2026 15:43:19 +0000
Date: Tue, 13 Jan 2026 23:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>
Subject: io_uring/io_uring.c:1667:25: sparse: sparse: restricted
 io_req_flags_t degrades to integer
Message-ID: <202601132310.hT6ZSHAG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 19a94da447f832ee614f8f5532d31c1c70061520 io_uring: consolidate drain seq checking
date:   8 months ago
config: i386-randconfig-061-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132310.hT6ZSHAG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132310.hT6ZSHAG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132310.hT6ZSHAG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:199:37: sparse: sparse: array of flexible structures
   io_uring/io_uring.c:566:28: sparse: sparse: invalid assignment: |=
   io_uring/io_uring.c:566:28: sparse:    left side has type bool
   io_uring/io_uring.c:566:28: sparse:    right side has type restricted io_req_flags_t
>> io_uring/io_uring.c:1667:25: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:577:29: sparse: sparse: context imbalance in 'io_queue_deferred' - wrong count at exit
   io_uring/io_uring.c:612:36: sparse: sparse: context imbalance in 'io_req_post_cqe' - unexpected unlock
   io_uring/io_uring.c:614:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block
   io_uring/io_uring.c:2398:29: sparse: sparse: context imbalance in 'io_cqring_min_timer_wakeup' - different lock contexts for basic block

vim +1667 io_uring/io_uring.c

  1662	
  1663	static __cold void io_drain_req(struct io_kiocb *req)
  1664		__must_hold(&ctx->uring_lock)
  1665	{
  1666		struct io_ring_ctx *ctx = req->ctx;
> 1667		bool drain = req->flags & IOSQE_IO_DRAIN;
  1668		struct io_defer_entry *de;
  1669	
  1670		de = kmalloc(sizeof(*de), GFP_KERNEL_ACCOUNT);
  1671		if (!de) {
  1672			io_req_defer_failed(req, -ENOMEM);
  1673			return;
  1674		}
  1675	
  1676		io_prep_async_link(req);
  1677		trace_io_uring_defer(req);
  1678		de->req = req;
  1679		de->seq = io_get_sequence(req);
  1680	
  1681		scoped_guard(spinlock, &ctx->completion_lock) {
  1682			list_add_tail(&de->list, &ctx->defer_list);
  1683			__io_queue_deferred(ctx);
  1684			if (!drain && list_empty(&ctx->defer_list))
  1685				ctx->drain_active = false;
  1686		}
  1687	}
  1688	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
