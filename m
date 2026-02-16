Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4481A23B6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771245666; cv=none; b=dAkuB4+wxnW+qH/INR06ZIYK2uFTBUTMF/JaU2+rNvMfqsnMWR/FnEckZjE6P4ZAVXxxSaody7xQsRo5iXXh0GCcC1gkYKyCN0fqXT2WnqZq4N760tRlDVdLh1Cf9vYQu8sibdzDGfxIi9UTg1k1ioO7QQkjC+AFbtXAQZNTaWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771245666; c=relaxed/simple;
	bh=v4QsVfUT+0ANi4CdTKC9xT1fmieXNlqqhjqlJzNZ37Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cYjzHXT0Wv0xjsRK8XGwoKDNjwK3PWaZLno7vslqrLXZKbrUstE+VuiLGFCG7JlnX+XHVd0/YYRhKGKuRQ7l1wX2A1xM+nJIcH4vAopV+DVVQeJyR2RxGdhhQ1EOcpLbMO+Yu2TfNM261cZ0CrvCZuxmM0Dvdm7CWwJQlTn0VUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JND0U730; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JND0U730"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771245664; x=1802781664;
  h=date:from:to:cc:subject:message-id;
  bh=v4QsVfUT+0ANi4CdTKC9xT1fmieXNlqqhjqlJzNZ37Y=;
  b=JND0U730QR/lq0jhY7y6IxROsTw7FuzlVmWuJNlJ0pJ98UVT2KdU/CC9
   EEG+D2al1LQaIuWX/nJksO4saoGpGiSqpCk8HGRu5diFbbhIFc53OdaaL
   7SkQcpRJboLVACOzvN55Uep608oRsSYpYQgJ28g8GnfobaUf9fG7IgXwJ
   NFZ+6/PfaxE5Y9gOSIrTRnWy1+Uf8d2O5REHeVxY0Fc1T6/zD3CBU4Bg3
   vNr6cEMMCjO9eVHKHV6NX56k6IiF2sEBKcQ/wGoSZkYDs3IhMi3CMFNwx
   dxTYFsXrxVHtblwGPMLRf9A9d5wQJ6yL8Y1vOU5pGlhS/15st1tvrBVEL
   Q==;
X-CSE-ConnectionGUID: ewVeXWyFTjSznoDq/92+1g==
X-CSE-MsgGUID: zmM8qRd9QE23gywOOyuGQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72216960"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72216960"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 04:41:03 -0800
X-CSE-ConnectionGUID: lh0eC6jsQBiDIYEAaZRazA==
X-CSE-MsgGUID: 3X+f2pL5TjOqZkGa/yrGWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="251262071"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Feb 2026 04:41:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrxuN-00000000zqm-1JnQ;
	Mon, 16 Feb 2026 12:40:59 +0000
Date: Mon, 16 Feb 2026 20:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>
Subject: io_uring/io_uring.c:1667:25: sparse: sparse: restricted
 io_req_flags_t degrades to integer
Message-ID: <202602162019.SvTi8Qes-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: 19a94da447f832ee614f8f5532d31c1c70061520 io_uring: consolidate drain seq checking
date:   9 months ago
config: alpha-randconfig-r134-20260216 (https://download.01.org/0day-ci/archive/20260216/202602162019.SvTi8Qes-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602162019.SvTi8Qes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602162019.SvTi8Qes-lkp@intel.com/

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
