Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED323BFE3B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 17:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498116; cv=none; b=jNN662OWGzAd7E43wlSGEz9zQrw+ocafSBQ+6DH5143JnOHhLwvJg/qHQJQuTDSMkN45Bfxy86aCrB2KG4UIUJ6iSQ47CHx5g0HZFLc6AQziJxB8fepVf1WIUbDpk0T07VobaSuxxllHkUL0lyf5fY2+VXXYlLRGNn5XLLC0c0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498116; c=relaxed/simple;
	bh=AfJzNaNtXuPzbkwHHsHnPvQU6XuVSkmFA4FOeMGg/Hk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p2PNx4X9z/o7pmy1Fa+Oq5PSBhYmYCPozq2evwouK9sRBq1TIXfC+hqn07MvwTTjY/4meotLDGrF3NZ8JTjIklxlb8ZHDXRImrv8tgAmNNav942KISjz38Isf4NRH6uUqZX6joJKTCllS7hVAd3tV5oWZgDN2wu9m41u/SCWy2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ToRZ5p6l; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ToRZ5p6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768498115; x=1800034115;
  h=date:from:to:cc:subject:message-id;
  bh=AfJzNaNtXuPzbkwHHsHnPvQU6XuVSkmFA4FOeMGg/Hk=;
  b=ToRZ5p6lIKPtTuWGLbVq3hoScAuK/Q+M5qN6o7WYDE8Pc7RGPthdilWS
   BexbKt0QuE3vj/lwnqYhjesSKC8Na/PfZxfaKavAiYSpUgs5MyKeg6eqx
   CXWKAfyuAFL7A1lCY5WWP8cHqAIXxe/ZRe63C5kQ1eEn0Q2M0UQBIxMid
   QLzyetYA7skiJlsdGOxGreqzkJzE6mzPS0i0hL8N/RUsm8pl9aKvw7mT7
   rTU4rrrLXewW+flsmW+SjN3BtD5HK8QGh1n7/7as0lqoedF7OedNRw7+L
   K2muYmM6xgFlZe1cKituVSkWl1TP+yTHQ6d9GjhkfU/diWqkFZC+gcIv0
   Q==;
X-CSE-ConnectionGUID: AF+R4omaTXiAcyau1r3wyw==
X-CSE-MsgGUID: JnRJ0LEETGao+n4DAYASuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69976941"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69976941"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 09:28:35 -0800
X-CSE-ConnectionGUID: z+0xyYpURrqd0uG9/ApAEA==
X-CSE-MsgGUID: 11luuGvlTLu4tLPGiDLv+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="228074285"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jan 2026 09:28:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgR94-00000000IlO-0mMG;
	Thu, 15 Jan 2026 17:28:30 +0000
Date: Fri, 16 Jan 2026 01:27:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-restrictions 15/16]
 io_uring/bpf_filter.c:79:30: sparse: sparse: restricted io_req_flags_t
 degrades to integer
Message-ID: <202601160119.OZCBn3F9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-restrictions
head:   20511f2c3707b6de0f299a3c70a9098a5c98e5c6
commit: 575dae8c0edf27527c2e86d4fce468106bf2c3f9 [15/16] io_uring: add support for BPF filtering for opcode restrictions
config: microblaze-randconfig-r111-20260115 (https://download.01.org/0day-ci/archive/20260116/202601160119.OZCBn3F9-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160119.OZCBn3F9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160119.OZCBn3F9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> io_uring/bpf_filter.c:79:30: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/bpf_filter.c:136:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct io_bpf_filter **filters @@     got struct io_bpf_filter [noderef] __rcu **bpf_filters @@
   io_uring/bpf_filter.c:136:17: sparse:     expected struct io_bpf_filter **filters
   io_uring/bpf_filter.c:136:17: sparse:     got struct io_bpf_filter [noderef] __rcu **bpf_filters
>> io_uring/bpf_filter.c:149:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   io_uring/bpf_filter.c:149:37: sparse:    struct io_bpf_filter **
   io_uring/bpf_filter.c:149:37: sparse:    struct io_bpf_filter [noderef] __rcu **
   io_uring/bpf_filter.c:156:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   io_uring/bpf_filter.c:156:37: sparse:    struct io_bpf_filter **
   io_uring/bpf_filter.c:156:37: sparse:    struct io_bpf_filter [noderef] __rcu **
   io_uring/bpf_filter.c:171:30: sparse: sparse: incompatible types in comparison expression (different address spaces):
   io_uring/bpf_filter.c:171:30: sparse:    struct io_bpf_filter [noderef] __rcu *
   io_uring/bpf_filter.c:171:30: sparse:    struct io_bpf_filter *
   io_uring/bpf_filter.c:174:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   io_uring/bpf_filter.c:174:17: sparse:    struct io_bpf_filter [noderef] __rcu *
   io_uring/bpf_filter.c:174:17: sparse:    struct io_bpf_filter *
   io_uring/bpf_filter.c:180:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   io_uring/bpf_filter.c:180:21: sparse:    struct io_bpf_filter **
   io_uring/bpf_filter.c:180:21: sparse:    struct io_bpf_filter [noderef] __rcu **

vim +79 io_uring/bpf_filter.c

    72	
    73	/* Populate BPF context from SQE */
    74	static void io_uring_populate_bpf_ctx(struct io_uring_bpf_ctx *bctx,
    75					      struct io_kiocb *req)
    76	{
    77		memset(bctx, 0, sizeof(*bctx));
    78		bctx->opcode = req->opcode;
  > 79		bctx->sqe_flags = req->flags & SQE_VALID_FLAGS;
    80		bctx->user_data = req->cqe.user_data;
    81	
    82		switch (req->opcode) {
    83		case IORING_OP_SOCKET:
    84			io_socket_bpf_populate(bctx, req);
    85			break;
    86		}
    87	}
    88	
    89	/*
    90	 * Run registered filters for a given opcode. Return of 0 means that the
    91	 * request should be allowed.
    92	 */
    93	int __io_uring_run_bpf_filters(struct io_restriction *res, struct io_kiocb *req)
    94	{
    95		struct io_bpf_filter *filter;
    96		struct io_uring_bpf_ctx bpf_ctx;
    97		int ret;
    98	
    99		rcu_read_lock();
   100		filter = rcu_dereference(res->filters.bpf_filters[req->opcode]);
   101		if (!filter || !filter->prog) {
   102			rcu_read_unlock();
   103			return 0;
   104		}
   105	
   106		io_uring_populate_bpf_ctx(&bpf_ctx, req);
   107	
   108		do {
   109			ret = bpf_prog_run(filter->prog, &bpf_ctx);
   110			if (!ret)
   111				break;
   112			filter = filter->next;
   113		} while (filter);
   114	
   115		rcu_read_unlock();
   116		return ret ? 0 : -EACCES;
   117	}
   118	
   119	int io_register_bpf_filter(struct io_restriction *res,
   120				   struct io_uring_bpf_filter __user *arg)
   121	{
   122		struct io_bpf_filter *filter, *old_filter;
   123		struct io_uring_bpf_filter reg;
   124		struct io_bpf_filter **filters;
   125	
   126		if (copy_from_user(&reg, arg, sizeof(reg)))
   127			return -EFAULT;
   128		if (reg.opcode >= IORING_OP_LAST)
   129			return -EINVAL;
   130		if (reg.flags || !mem_is_zero(reg.reserved, sizeof(reg.reserved)))
   131			return -EINVAL;
   132	
   133		/*
   134		 * No existing filters, allocate set.
   135		 */
 > 136		filters = res->filters.bpf_filters;
   137		if (!filters) {
   138			filters = kzalloc(IORING_OP_LAST * sizeof(struct io_bpf_filter *), GFP_KERNEL);
   139			if (!filters)
   140				return -ENOMEM;
   141		}
   142	
   143		filter = NULL;
   144		if (reg.prog_fd >= 0) {
   145			struct bpf_prog *prog;
   146	
   147			prog = bpf_prog_get_type(reg.prog_fd, BPF_PROG_TYPE_IO_URING_FILTER);
   148			if (IS_ERR(prog)) {
 > 149				if (filters != res->filters.bpf_filters)
   150					kfree(filters);
   151				return PTR_ERR(prog);
   152			}
   153	
   154			filter = kzalloc(sizeof(*filter), GFP_KERNEL);
   155			if (!filter) {
   156				if (filters != res->filters.bpf_filters)
   157					kfree(filters);
   158				bpf_prog_put(prog);
   159				return -ENOMEM;
   160			}
   161			filter->prog = prog;
   162			res->filters.bpf_filters = filters;
   163		}
   164	
   165		/*
   166		 * Insert filter - if the current opcode already has a filter
   167		 * attached, add to the set.
   168		 */
   169		if (filter) {
   170			spin_lock(&res->filters.lock);
   171			old_filter = rcu_dereference(filters[reg.opcode]);
   172			if (old_filter)
   173				filter->next = old_filter;
   174			rcu_assign_pointer(filters[reg.opcode], filter);
   175			spin_unlock(&res->filters.lock);
   176			res->bpf_registered = 1;
   177			return 0;
   178		}
   179	
   180		if (filters != res->filters.bpf_filters)
   181			kfree(filters);
   182		return -EINVAL;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
