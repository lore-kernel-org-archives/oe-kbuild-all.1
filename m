Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2AF2F3B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743004479; cv=none; b=bL8aFz83zZ3rktfU4w9IFyNT33yKEkbndzlmh0pB2A/si636vr82voRQTqaeNc/fdF1yYfDETkZEcNaBpkdExoB4YnCf2UjmboKA4nj4sgB9QhNxC9J7uHltPaMNBNNGZPmUUp8SjvCl+s93s7hYhowKARcSVkC92uizxknJJ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743004479; c=relaxed/simple;
	bh=BvbDCxbcsk8250oZ/hJOu0f2BpkvSHrbveIdnMmyhVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eRfzhcbQi/kZVOAOJJAIbZJAAGcQ7sgifi+OWwACsyOjd7FRMgTtL2cuIKKaC/1vslOxSS0XwNiv5DjkTL8Htn5raMh8sShW1V0XxqjHDCF4o4ctisCZsv+ANchTw0dSPZYBJCbjgrt5HG/SuLSPqXkOhsQC2LacuHqHRWYLVBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PaOnzISV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PaOnzISV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743004477; x=1774540477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BvbDCxbcsk8250oZ/hJOu0f2BpkvSHrbveIdnMmyhVg=;
  b=PaOnzISVuz4Od8lnjIRUKv7IKWNSiW6XciROHYHAUB2mHHlQuowg0WBZ
   4XGduoAWnoTHRJkeehDLUpu3jSzHT5pb3JmgF/xz9c0b2BrmWeD85FttL
   /+3J+kqwE6TBHCtvm+umbr2LR4NGx8FxuydmgkyveDUgDaCUIAic0KymQ
   fWbvbZvavHQ1C2HO9/xuwpkWbJYLQUQJRHPQRJN9gKX1Ts/7ed335gFh+
   WOUoegfS6rH4z9KAB5sVC2POG3CfwzyRuLh5MFU7xYq7PcWFkiZuKZeZl
   Y+1HS73jZW/mnym06fPPsZsgXaBIXHHpbUtYI5Vhf87olfe4wZO/m1k8e
   Q==;
X-CSE-ConnectionGUID: RCgPIj1hT+eWpeb2U5YHYQ==
X-CSE-MsgGUID: Z8jdMb0TTtWt3LvArZnR7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="31908017"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="31908017"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 08:54:36 -0700
X-CSE-ConnectionGUID: uPW3ZRlqQCKQgUQaV1Yjlw==
X-CSE-MsgGUID: YZKgI4gLTKiXpQkzRLwXvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="148010292"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Mar 2025 08:54:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txT5N-0005rX-1l;
	Wed, 26 Mar 2025 15:54:33 +0000
Date: Wed, 26 Mar 2025 23:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-exit-cancel.2 9/9] io_uring/refs.h:80:25:
 sparse: sparse: cast truncates bits from constant value (8000000000000000
 becomes 0)
Message-ID: <202503262328.QNOERG1Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-exit-cancel.2
head:   a1a70bee1b2c37bb587ad61d479cab938c861a75
commit: a1a70bee1b2c37bb587ad61d479cab938c861a75 [9/9] io_uring: switch away from percpu refcounts
config: m68k-randconfig-r113-20250326 (https://download.01.org/0day-ci/archive/20250326/202503262328.QNOERG1Z-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250326/202503262328.QNOERG1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503262328.QNOERG1Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:201:37: sparse: sparse: array of flexible structures
   io_uring/io_uring.c:612:36: sparse: sparse: context imbalance in 'io_req_post_cqe' - unexpected unlock
   io_uring/io_uring.c:614:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block
   io_uring/io_uring.c: note: in included file (through io_uring/io_uring.h):
>> io_uring/refs.h:80:25: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)

vim +80 io_uring/refs.h

    77	
    78	static inline void io_ring_ref_kill(struct io_ring_ctx *ctx)
    79	{
  > 80		atomic_long_xor(IO_RING_REF_DEAD, &ctx->refs);
    81		io_ring_ref_put(ctx);
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
