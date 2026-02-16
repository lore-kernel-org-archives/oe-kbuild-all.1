Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA3021D596
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 03:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771211662; cv=none; b=MMFNuVW10Gg/w+NlJFksIdN/FSnIRoNEptb5SEXSs7dlkaTCW1/gTmMQBC5FOZ0CmRK2N9pgmza2M29/j1T69GSh0p9lN/KORlNt18JYZGJgfAsfl5bmNARO0cZhAV9ofghLBik6nqTwvDvajNKT6hI1P72PLPcQ9z2orf1ELgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771211662; c=relaxed/simple;
	bh=JFEoSR+fJmbHa7Qpdi+wDkcoNPcfTNYlxzErgyAd0TI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N0mTfS2qusJIAna4lQSfEUKdHkoWsfplamGR90J0MbnIAVa615vjiyDXgiK7ImZdy/qa16eJ436TTSS5ISyAjx9cWPdRhFI9Di6X5xX5FocFYxSb8v/H0phKS7MglNt8z4SwUgE8aBd0LDF9yxYN6kz0EB+x73IV8NdeZDVHP+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwl3GiVt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwl3GiVt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771211660; x=1802747660;
  h=date:from:to:cc:subject:message-id;
  bh=JFEoSR+fJmbHa7Qpdi+wDkcoNPcfTNYlxzErgyAd0TI=;
  b=hwl3GiVtkwN6Cafr3l5YO0bIuzTvFgp6pIHbJjbi9+7bfAlYBKn5Bze8
   9o6Y3Q5mWMuKrKyhp0CKz3u/J98XiybEPAbVnkZXf+jeqV4rr6hOXBBDX
   t98wc4qFRDbceggbILy7EnLZnqPIUIMxpvrIsoUXpsH/V4AoSCPoOqyID
   L3tHu96o+C5+ozROawSmKwcLB/S6fw9DbvvK2r3wbU28HtSoTSk9iFbQ9
   Z3I/UPuh0+8om4byWF5CWgde7ZDWdJDVchKNCifNT+VOmNc1G8AOyMwJg
   jBSEi9joiIt+YyscSCDrhsIf/ZzoUJb7m2fPaiOv1uxUUM30O3VAQbqhv
   A==;
X-CSE-ConnectionGUID: +HF0CNjhSJKrw1qYdn10cg==
X-CSE-MsgGUID: mioLuFPDSlq6W9o2IIGPNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72006840"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72006840"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 19:14:19 -0800
X-CSE-ConnectionGUID: wEhUJXSjQIahXUdoKGBsAw==
X-CSE-MsgGUID: 0wFW2ntwSXeX9/VCzjbFvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="213574611"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Feb 2026 19:14:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrp3w-00000000zMg-02PB;
	Mon, 16 Feb 2026 03:14:16 +0000
Date: Mon, 16 Feb 2026 11:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>
Subject: io_uring/io_uring.c:578:28: sparse: sparse: invalid
 assignment: |=
Message-ID: <202602161110.UdSSYGJ6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: fde04c7e2775feb0746301e0ef86a04d3598c3fe io_uring: fix spurious drain flushing
date:   9 months ago
config: alpha-randconfig-r134-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161110.UdSSYGJ6-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161110.UdSSYGJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161110.UdSSYGJ6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:199:37: sparse: sparse: array of flexible structures
>> io_uring/io_uring.c:578:28: sparse: sparse: invalid assignment: |=
   io_uring/io_uring.c:578:28: sparse:    left side has type bool
   io_uring/io_uring.c:578:28: sparse:    right side has type restricted io_req_flags_t
   io_uring/io_uring.c:619:36: sparse: sparse: context imbalance in 'io_req_post_cqe' - unexpected unlock
   io_uring/io_uring.c:621:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block

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
