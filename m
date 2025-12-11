Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455352DC787
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 23:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495800; cv=none; b=TJzxFT+fO4vA3WNsWacmCfqN/pRv9D5hVcemrLVUBPMvcKVMLnXMpjV7ciTrPsycrT4Be2OhrBlVGiFavJLEjxtRl/oOAWWwz/j2RKs4TfNTRKrfI4uPLgSh5HxJPPVbfPEIaj6zpOWK2NbuyBuzIs9dCme87uBiwORt6UABySA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495800; c=relaxed/simple;
	bh=48S3dt1lYkxYRTnxF+USt8HEyrXiWjkMO89fHnILgrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fA+WccNzgb83+C91saMDV3wK4/jDmscYEGNkX/sN4iTv/roIUFlnMWdS2CjGzQr27QMxRuVDXcxdD9TWBvPkYSrNKTtBTkb6xz/V1Ez8VqZiSa8l7lOXitDRkqcQh+goyVd8BDwfZHC7wuOrcA1jeI+9BTbBZLwbjUOszMnhL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYFlWH1B; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYFlWH1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765495799; x=1797031799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=48S3dt1lYkxYRTnxF+USt8HEyrXiWjkMO89fHnILgrw=;
  b=IYFlWH1BDe3SGq2bJ3yjNb4vEoksHbKX4iX9qRP7H8wksMCtmnAUgP8w
   23lAEMQrY9zUFKFOL+THDH9ed3QUCz2a20YSc2SZHC0SM8uKk07HMZilB
   LS+reWaCxSHyGfvnSJ4SsyFaLi//SvsAZ3qhHHzzaZrlea1ZMETMEOipl
   wEAKdQ/pW8amnlKDnkRn0efs0pPKKp7c8hxB4ieWwObra6rpPRb/a1B6O
   fY+YE7H8g2StSFXd0eEl46ONlj7pPkv5w5DdO1QZJyQJWXeILvfCy2Udv
   wshEqwDn8KDF46mqGew2YWLu2tG6iQMOVODccLITVC/TNfHf+aOIK+va9
   g==;
X-CSE-ConnectionGUID: kQ17+rfBQR+ba28RFoqY6A==
X-CSE-MsgGUID: dRnC0ek4RkeWJKVO+Y+cKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67528571"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67528571"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:29:55 -0800
X-CSE-ConnectionGUID: j8jqPCzERFuestenPs61AA==
X-CSE-MsgGUID: 6+yuTJ1lSXa280gRDOV2uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="234320726"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Dec 2025 15:29:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTq6a-000000005CH-0A06;
	Thu, 11 Dec 2025 23:29:52 +0000
Date: Fri, 12 Dec 2025 07:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: io_uring/io_uring.c:578:28: sparse: sparse: invalid assignment: |=
Message-ID: <202512120728.8PwbUnH5-lkp@intel.com>
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
commit: fde04c7e2775feb0746301e0ef86a04d3598c3fe io_uring: fix spurious drain flushing
date:   7 months ago
config: i386-randconfig-061-20251211 (https://download.01.org/0day-ci/archive/20251212/202512120728.8PwbUnH5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120728.8PwbUnH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120728.8PwbUnH5-lkp@intel.com/

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
