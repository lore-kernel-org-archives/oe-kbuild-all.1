Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAFB3904C9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 13:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768311793; cv=none; b=bvXBPhMgxlV6AfYx6topYtSVNV6iNqCEdJcGUHPEuDJdjh5K0j09XMp4zeIRCqzZmn7CeuuPAPeOnBOg+zE64G7aO6Ob6t4uCO8kDSFb9jZU4G9LJrI2x0dLhw9QGbFjCl64HmfEa7yJY1JGRDUhV76sD09f9Yi2ghnDy6f4dMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768311793; c=relaxed/simple;
	bh=wFpVDTU2CWL5H1YO7ztsnt8tNjW8sEPflxsAh7YtOZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XrxmmCSGO4rrWWZ5PxtrpYdNDveynAHE4OAyqOWvFMb8InX4XMHM5P42hXrv9/U4Uf9sQ7P+9iE10dXoAX1ccmYEESCLI5I87ksfeb4yQNcWWyytRpSGVnL56eRhBH93F3sHItq5N0djoOOa5/CuzxRxCrQuXoolICP+3um6Ruo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzihRvlT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzihRvlT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768311790; x=1799847790;
  h=date:from:to:cc:subject:message-id;
  bh=wFpVDTU2CWL5H1YO7ztsnt8tNjW8sEPflxsAh7YtOZk=;
  b=GzihRvlTG7KL4kmjLsvUuqDVvaX98Gpl1E4/FdOfwXZa+NWnrN0se+XT
   BlPpmYrKVR5auarRkTRDnVzlzHJDwaKdeloHBIsZw8b61iOmpjqH/Fo/3
   uzmrtW/P+Z7Ez2qyasvvKKd4B/Sa57klo6tkSl4pIYLntN6PMshTGJa5k
   KlCdvh9BRdEkX+BzFuCwWZaI3XHfYUASmlr0+WcN3129BYCTUsW2s8bSn
   Pq2BlwsLYsWTJ3U1M2Qdybd5m0O2NJihdKYw6Ltp8NOmN5RSkK+4Brc9M
   uhd0dQouhuGTsMOtY6MMualQrqOH6IY8nvdHd29wQdQG30Lmw1whvL0OD
   Q==;
X-CSE-ConnectionGUID: kUbEZ00RSCyPfBV8DDouWA==
X-CSE-MsgGUID: bAVhUcGxS4Seoi2UFtQhcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68601653"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68601653"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 05:43:10 -0800
X-CSE-ConnectionGUID: woiK19eSSB+xArMdMZ6DTQ==
X-CSE-MsgGUID: RbWbXC6uRP6K8QABBDHrAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204471224"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jan 2026 05:43:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfefq-00000000Eq4-1w6i;
	Tue, 13 Jan 2026 13:43:06 +0000
Date: Tue, 13 Jan 2026 21:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>
Subject: io_uring/io_uring.c:578:28: sparse: sparse: invalid
 assignment: |=
Message-ID: <202601132144.mWxwrB2F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: fde04c7e2775feb0746301e0ef86a04d3598c3fe io_uring: fix spurious drain flushing
date:   8 months ago
config: i386-randconfig-061-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132144.mWxwrB2F-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132144.mWxwrB2F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132144.mWxwrB2F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:199:37: sparse: sparse: array of flexible structures
>> io_uring/io_uring.c:578:28: sparse: sparse: invalid assignment: |=
   io_uring/io_uring.c:578:28: sparse:    left side has type bool
   io_uring/io_uring.c:578:28: sparse:    right side has type restricted io_req_flags_t
   io_uring/io_uring.c:619:36: sparse: sparse: context imbalance in 'io_req_post_cqe' - unexpected unlock
   io_uring/io_uring.c:621:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block
   io_uring/io_uring.c:2420:29: sparse: sparse: context imbalance in 'io_cqring_min_timer_wakeup' - different lock contexts for basic block

vim +578 io_uring/io_uring.c

   568	
   569	static __cold noinline void io_queue_deferred(struct io_ring_ctx *ctx)
   570	{
   571		bool drain_seen = false, first = true;
   572	
   573		spin_lock(&ctx->completion_lock);
   574		while (!list_empty(&ctx->defer_list)) {
   575			struct io_defer_entry *de = list_first_entry(&ctx->defer_list,
   576							struct io_defer_entry, list);
   577	
 > 578			drain_seen |= de->req->flags & REQ_F_IO_DRAIN;
   579			if ((drain_seen || first) && io_drain_defer_seq(de->req, de->seq))
   580				break;
   581	
   582			list_del_init(&de->list);
   583			io_req_task_queue(de->req);
   584			kfree(de);
   585			first = false;
   586		}
   587		spin_unlock(&ctx->completion_lock);
   588	}
   589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
