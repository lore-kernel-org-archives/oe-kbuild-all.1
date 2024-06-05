Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1665D624
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 04:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717561354; cv=none; b=P+R0Dydj3DCyngLECsB1lXZkrs9IrLfKwQ+W9cEbpgIv2zXGhQNhYW4SbPFMaLZJ7yUkuixN1x5oHiRJxwhp0ap2sCObKOi7qHXdbr2FjC6w+n6dcYZgcwBLenOGppVbe9TB1jKFZ6eABjO3PxXSKn6ix/7wu+s+TXcI/joVY8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717561354; c=relaxed/simple;
	bh=Kuome8KAKtrIIU8q0Gv0t0/QvHaFBau5kMLiBoGtg+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fzW4W910Na6pqbKCQgN/4iwRBhYoUiYICIUt3RR6J4SiE7F+mUh/FZa20HC6bdFy9LqixvB2ddoz1ayDuSR+GBr0vqLxuTyd+jLfupyAzn+idOe9XBMowE+8yZWeEw6uLaVwkNglE0LRXa1h+rt2L68m4sdwlyTrLB7EaBkJ/XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSNJne1+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSNJne1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717561353; x=1749097353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kuome8KAKtrIIU8q0Gv0t0/QvHaFBau5kMLiBoGtg+Q=;
  b=QSNJne1+NUQc4mjYoN41Gy7vmL5kgE3SdBfW4AN0c6Dv7y60QpZZznQB
   qdoen0BTruwuH+OOhmxJMkE1QDs8tG6A8V++JIyJy9XD0gpfFTQLCiuQk
   lp1PiedFdwPoAofTcrmkSU65CeOieNGlDvCMxZyNo7t53kiDWfi+bJBsw
   ajB5r/Zc8KgkmSVpSO/8h6BuAWutkDLKGHZCP/dmI91UadbnYRV7YpQYQ
   mmpP2YtLMu1d+btJQVMrKxSSaYVlW4rAUjdmDAdtft5E7iy0WwmN56XI/
   VDUG+Bq93adjXKvT+BK0In9UTnkTlDBNQDCOaO4G5CT0suAXommNEjhqm
   Q==;
X-CSE-ConnectionGUID: IhmpQ2CcT32tUVHlS2vkuw==
X-CSE-MsgGUID: EP/9+c/CRnmvJ65t18YsiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="11913175"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; 
   d="scan'208";a="11913175"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 21:22:32 -0700
X-CSE-ConnectionGUID: 8UH4nMu6RIi9RMhVzjscLQ==
X-CSE-MsgGUID: Z/LvIONHT2qiS/eQFMu+1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; 
   d="scan'208";a="37383901"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 04 Jun 2024 21:22:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEiAO-0000uX-2b;
	Wed, 05 Jun 2024 04:22:28 +0000
Date: Wed, 5 Jun 2024 12:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-msg_ring 11/11] io_uring/msg_ring.c:102:13:
 warning: variable 'nr_wake' set but not used
Message-ID: <202406051224.ufjXrsdc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-msg_ring
head:   67666487bc919056c1142f55d6244dcadadca705
commit: 67666487bc919056c1142f55d6244dcadadca705 [11/11] io_uring/msg_ring: add basic wakeup batch support
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240605/202406051224.ufjXrsdc-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406051224.ufjXrsdc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406051224.ufjXrsdc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/msg_ring.c: In function 'io_msg_add_overflow':
>> io_uring/msg_ring.c:102:13: warning: variable 'nr_wake' set but not used [-Wunused-but-set-variable]
     102 |         int nr_wake;
         |             ^~~~~~~


vim +/nr_wake +102 io_uring/msg_ring.c

    90	
    91	/*
    92	 * Entered with the target uring_lock held, and will drop it before
    93	 * returning. Adds a previously allocated ocqe to the overflow list on
    94	 * the target, and marks it appropriately for flushing.
    95	 */
    96	static void io_msg_add_overflow(struct io_msg *msg,
    97					struct io_ring_ctx *target_ctx,
    98					struct io_overflow_cqe *ocqe, int ret,
    99					u32 flags)
   100		__releases(&target_ctx->completion_lock)
   101	{
 > 102		int nr_wake;
   103	
   104		if (list_empty(&target_ctx->cq_overflow_list)) {
   105			set_bit(IO_CHECK_CQ_OVERFLOW_BIT, &target_ctx->check_cq);
   106			atomic_or(IORING_SQ_TASKRUN, &target_ctx->rings->sq_flags);
   107		}
   108	
   109		ocqe->cqe.user_data = msg->user_data;
   110		ocqe->cqe.res = ret;
   111		ocqe->cqe.flags = flags;
   112		nr_wake = ++target_ctx->nr_overflow;
   113		list_add_tail(&ocqe->list, &target_ctx->cq_overflow_list);
   114		spin_unlock(&target_ctx->completion_lock);
   115		if (target_ctx->flags & IORING_SETUP_DEFER_TASKRUN) {
   116			unsigned nr_wait, nr_prev = 0;
   117	
   118			rcu_read_lock();
   119			io_defer_prev(target_ctx, &nr_wait);
   120			if (nr_wait)
   121				nr_prev = nr_wait - 1;
   122			io_defer_wake(target_ctx, nr_wait, nr_prev);
   123			rcu_read_unlock();
   124		} else if (wq_has_sleeper(&target_ctx->cq_wait)) {
   125			wake_up(&target_ctx->cq_wait);
   126		}
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
