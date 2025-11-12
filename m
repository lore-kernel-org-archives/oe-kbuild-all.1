Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3814C6D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 00:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762907984; cv=none; b=NohFODTPMksqrRE7kt0L9AGlbcu+GIJQtWla+lECVB7iWeiHRnmAdnRDdkUndB6YHyQSyJDvL92O1b3TrwlNvsrWKTbvAnTn6eOG8kww1WK18ToEdKa2huEPYuZIZN94fvqzMSAYhhjM8z1I5ryXLhRFyk+N17pch3RbYNcxQ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762907984; c=relaxed/simple;
	bh=UCtoHSaTmZe/wMwKI7bLRtVsD24qBiF6lPzRKjvBIfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J68+YP06jy+hheJeTtDip59KGEmyLr0IRQsXG6hDKa+goEHjIkkMVHAAYnHSCZLke5drjwI4hYDQtVC5Ptzp1tPohX8kTlD8/0M9rn7B/orkpmsDsYx8O6S/0pDAspg67Zh0nkN8RcjjYAVfrJ8Sx3eXSYKf0sowN6ewpdhe5vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXyGrxPN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXyGrxPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762907983; x=1794443983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UCtoHSaTmZe/wMwKI7bLRtVsD24qBiF6lPzRKjvBIfY=;
  b=iXyGrxPNjoeq22LEwe5vOg9h8k19u501JwHzdYvWEJQzWpmvDSTxWJ91
   Q0ClLbDZ77zhhzIY6Vb2d5/s+jJnhU14ybM424ZlHO38bC7p2ZIrbgNWC
   Qdl5JhKRswpa+tvCfYem5oDyckONoFEXKXcIhKyCiKUy/AvMicFPCbOQf
   O15ELGjsdK6Ap3ijKcTU5A1xo2BFmPcb/MTXVuTI1EW9EUBKNT1Eti/5/
   DMSFOxPGWZY7P0tIgS6F6GnPvDX+M+Vds4ewXje+e+y0iepAoFb+3x5UZ
   3AhZvAgUbjuz7Uo9CkrKKxIz2h9U8XdLTDkg6ZEbS501tC8V2nRuN9rHP
   w==;
X-CSE-ConnectionGUID: V6nCSmpyQNOTf2y9rAJARQ==
X-CSE-MsgGUID: bavXhGoNTfq1Xl02g4TR7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64903012"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64903012"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:39:43 -0800
X-CSE-ConnectionGUID: Z/2sYdDQQ5aUhFuykH9n7Q==
X-CSE-MsgGUID: TV4MzlUBQN+w3mYIKdTUsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="194282252"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Nov 2025 16:39:41 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIyte-0003hR-05;
	Wed, 12 Nov 2025 00:39:38 +0000
Date: Wed, 12 Nov 2025 08:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:iou-bpf/test 8/12] io_uring/bpf.h:43:1: warning: non-void
 function does not return a value
Message-ID: <202511120850.osYHgeoy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux iou-bpf/test
head:   22c04e600798ca3905808ff55ebf3029fca38874
commit: c153662b73aafa8d6879a136f2d643b2a2729bb6 [8/12] io_uring/bpf: add handle events callback
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251112/202511120850.osYHgeoy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120850.osYHgeoy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120850.osYHgeoy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:102:
>> io_uring/bpf.h:43:1: warning: non-void function does not return a value [-Wreturn-type]
      43 | }
         | ^
   1 warning generated.


vim +43 io_uring/bpf.h

    31	
    32	
    33	#ifdef CONFIG_IO_URING_BPF
    34	void io_unregister_bpf(struct io_ring_ctx *ctx);
    35	int io_run_cqwait_ops(struct io_ring_ctx *ctx, struct iou_loop_state *ls);
    36	#else
    37	static inline void io_unregister_bpf(struct io_ring_ctx *ctx)
    38	{
    39	}
    40	static inline int io_run_cqwait_ops(struct io_ring_ctx *ctx,
    41					    struct iou_loop_state *ls)
    42	{
  > 43	}
    44	#endif
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
