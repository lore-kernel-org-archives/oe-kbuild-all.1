Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59525248880
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 01:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765501808; cv=none; b=LqgNhyCqz/6bpT/ztu280LNMCRb308y8tONN5BAEBteZ6ksNikcvc9vGsaCi1r14q6H4gwKeXb2OrUllAePJqtqlj69BGb/pCasQbwZHp5e6YdfUws8lHv7jCeX7calrK1WPO982eWg92Po2a9u95QMSHWl/ERwCsiRYvw8WY1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765501808; c=relaxed/simple;
	bh=vX+pmc2EPCygocOqHSKtjQ62Mw9Mcewur1XN2fzMyPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EbhXkg0R+Q3aJC6HfCrafdnVGGmpvP/6Jz3YDPsD9ufNVs770Swk8KOxtkG5dSKx4I5Cj7tYZdyDJ1SWcyhk2DrLb845e6QbhGR9q3cJPM04qmKU1KBfcV6hMzCqXq0HncIV0GWePAn9obVGYFN1R37rUN1IXwi0pw0GHDfyCjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNlGShXe; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNlGShXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765501805; x=1797037805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vX+pmc2EPCygocOqHSKtjQ62Mw9Mcewur1XN2fzMyPc=;
  b=GNlGShXea/zJaz4mfqpIKkaaq2cjwKmXUqZ6zYbppnpIj05S6LDkzPFV
   hjuNr/D7oo7fyzzJj/WIL75ZjsKwn2b2NlSOlItuzcq+BQw0/AZ77ZeQ4
   DJ7PuGis0O3BSSgHHnoLPHZr7pxj0p5lMWUbzLRZsJbgGHPvUpwGulaLi
   WHwJyBGlcYlPeKOGy40cOJejISBZSL+ufkWXjo6g8y309fTQhL6ue2YJR
   fWA+52wo96g2PagFdkPqi+xZwhyCVixg3A+Z3NxFxE1V4Cq2frOnbqgds
   oieMUqQ57xodtRzeFOb3AFbhhaimU6u57nBbDOqqT9/pJvIuVVWXiCgcl
   A==;
X-CSE-ConnectionGUID: yl19cF23QV6Y1A8hDtdzZg==
X-CSE-MsgGUID: ETL5agzgRtC5+zHi9aSGAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67229011"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67229011"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 17:10:04 -0800
X-CSE-ConnectionGUID: WxLekabhT32LvHpiI1Mk6w==
X-CSE-MsgGUID: rLhAcbi7Syi/J6TTmwZP+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196719265"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Dec 2025 17:10:04 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTrfV-000000005H7-0w7g;
	Fri, 12 Dec 2025 01:10:01 +0000
Date: Fri, 12 Dec 2025 09:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: io_uring/io_uring.c:1667:25: sparse: sparse: restricted
 io_req_flags_t degrades to integer
Message-ID: <202512120944.2Wp9or5n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 19a94da447f832ee614f8f5532d31c1c70061520 io_uring: consolidate drain seq checking
date:   7 months ago
config: i386-randconfig-061-20251211 (https://download.01.org/0day-ci/archive/20251212/202512120944.2Wp9or5n-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120944.2Wp9or5n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120944.2Wp9or5n-lkp@intel.com/

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
