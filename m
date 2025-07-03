Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2599372610
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554052; cv=none; b=aeXz/Y6TfoXXLBT7vUB/UUjSBpd+WXZ4KSZojoWyTkEWVHQdnQxEvHly/AWmXjb6og5yLJMtr4nXxz3eqFDAqEeicjroxsP8KmRinS7HTNHJhh175ietsPlLifK41lDIStcLvCCFmqjr0xoNHXNH/43CpXQ6CMvE2UAbc+h7nF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554052; c=relaxed/simple;
	bh=zZdI7fPLgh0iLjMTDzJb7uvQ1GYOs9T+xOHWXiI5LCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KvSghL8eAtYsmpnPNlTkEpUpLv4xSJk2LRX5WJvqi/uPgSEaNGfse+LUD9qzLd+MbqtnKnnyyNzTEAoMvlGy8USQlcQ1gZYHfIRG7mswNvjvTjnF8hhcedy0sdo4sVvOrPNajD5BLLoB17WGSvL961ReVuqePStkluiDESpjfWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBQLH3j/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBQLH3j/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751554051; x=1783090051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zZdI7fPLgh0iLjMTDzJb7uvQ1GYOs9T+xOHWXiI5LCw=;
  b=VBQLH3j/nvyT23UH1BbZxrkhWXeIFzRUsOfwM2kr7ku408rSEyWgX4mx
   hZIwOFC2ukoSS5YJUnH4DssW4RJ/TGiqCbGRVNjFNJrsdWZnRjEGsd79m
   f3MiGmP2AEQ5ORRA5iYMWb5tMBW9/kQ+dgdDW+MyXP0aKcwTCljCNpO7F
   vyvi6Qa9RWbv6OWCRslOVWGW7xomBOpr3G4m1H7fSJ636c2AXiSsyg7nL
   AfA/8G7iS7TeRzk6UbRxdqDNxloU2/8uTX74B8kQh31x/cO7h2+0PQHnG
   h4Khe4I3PY4fIXH0okiJm0UwV1mTjqY+fo5Bk6nx1FFtM8AImkJZ1PPZ7
   g==;
X-CSE-ConnectionGUID: UjNzuHnvTbO5bmeOtJwDNw==
X-CSE-MsgGUID: tSXwbOg7R7mcwDl+v601gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53851706"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53851706"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:47:30 -0700
X-CSE-ConnectionGUID: no3pAsWwQ3iKfOETDjc4mQ==
X-CSE-MsgGUID: TA+FEQIbSd2nEaNZVlY58w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="153800514"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Jul 2025 07:47:17 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXLDT-0001vh-35;
	Thu, 03 Jul 2025 14:47:11 +0000
Date: Thu, 3 Jul 2025 22:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [linux-next:master 6809/7039] io_uring/rw.c:291:19: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202507032211.PwSNPNSP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d6c58332c7a8ba025fcfa76888b6c37dbce9633
commit: cf73d9970ea4f8cace5d8f02d2565a2723003112 [6809/7039] io_uring: don't use int for ABI
config: i386-randconfig-063-20250703 (https://download.01.org/0day-ci/archive/20250703/202507032211.PwSNPNSP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507032211.PwSNPNSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507032211.PwSNPNSP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> io_uring/rw.c:291:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __kernel_rwf_t [usertype] flags @@     got unsigned int @@
   io_uring/rw.c:291:19: sparse:     expected restricted __kernel_rwf_t [usertype] flags
   io_uring/rw.c:291:19: sparse:     got unsigned int

vim +291 io_uring/rw.c

a9165b83c1937e Jens Axboe        2024-03-18  251  
2a61e63891add7 Keith Busch       2025-02-27  252  static int __io_prep_rw(struct io_kiocb *req, const struct io_uring_sqe *sqe,
2a61e63891add7 Keith Busch       2025-02-27  253  			int ddir)
f3b44f92e59a80 Jens Axboe        2022-06-13  254  {
f2ccb5aed7bce1 Stefan Metzmacher 2022-08-11  255  	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
c0e965052149c8 Pavel Begunkov    2025-03-31  256  	struct io_async_rw *io;
f3b44f92e59a80 Jens Axboe        2022-06-13  257  	unsigned ioprio;
59a7d12a7fb5ab Anuj Gupta        2024-11-28  258  	u64 attr_type_mask;
f3b44f92e59a80 Jens Axboe        2022-06-13  259  	int ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  260  
c72282dd865ee6 Pavel Begunkov    2025-02-24  261  	if (io_rw_alloc_async(req))
c72282dd865ee6 Pavel Begunkov    2025-02-24  262  		return -ENOMEM;
c0e965052149c8 Pavel Begunkov    2025-03-31  263  	io = req->async_data;
c72282dd865ee6 Pavel Begunkov    2025-02-24  264  
f3b44f92e59a80 Jens Axboe        2022-06-13  265  	rw->kiocb.ki_pos = READ_ONCE(sqe->off);
f3b44f92e59a80 Jens Axboe        2022-06-13  266  	/* used for fixed read/write too - just read unconditionally */
f3b44f92e59a80 Jens Axboe        2022-06-13  267  	req->buf_index = READ_ONCE(sqe->buf_index);
c0e965052149c8 Pavel Begunkov    2025-03-31  268  	io->buf_group = req->buf_index;
f3b44f92e59a80 Jens Axboe        2022-06-13  269  
f3b44f92e59a80 Jens Axboe        2022-06-13  270  	ioprio = READ_ONCE(sqe->ioprio);
f3b44f92e59a80 Jens Axboe        2022-06-13  271  	if (ioprio) {
f3b44f92e59a80 Jens Axboe        2022-06-13  272  		ret = ioprio_check_cap(ioprio);
f3b44f92e59a80 Jens Axboe        2022-06-13  273  		if (ret)
f3b44f92e59a80 Jens Axboe        2022-06-13  274  			return ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  275  
f3b44f92e59a80 Jens Axboe        2022-06-13  276  		rw->kiocb.ki_ioprio = ioprio;
f3b44f92e59a80 Jens Axboe        2022-06-13  277  	} else {
f3b44f92e59a80 Jens Axboe        2022-06-13  278  		rw->kiocb.ki_ioprio = get_current_ioprio();
f3b44f92e59a80 Jens Axboe        2022-06-13  279  	}
099ada2c87260e Jens Axboe        2023-07-08  280  	rw->kiocb.dio_complete = NULL;
59a7d12a7fb5ab Anuj Gupta        2024-11-28  281  	rw->kiocb.ki_flags = 0;
02040353f4fedb Keith Busch       2025-05-06  282  	rw->kiocb.ki_write_stream = READ_ONCE(sqe->write_stream);
f3b44f92e59a80 Jens Axboe        2022-06-13  283  
74f3e875268f1c Pavel Begunkov    2025-02-19  284  	if (req->ctx->flags & IORING_SETUP_IOPOLL)
74f3e875268f1c Pavel Begunkov    2025-02-19  285  		rw->kiocb.ki_complete = io_complete_rw_iopoll;
74f3e875268f1c Pavel Begunkov    2025-02-19  286  	else
74f3e875268f1c Pavel Begunkov    2025-02-19  287  		rw->kiocb.ki_complete = io_complete_rw;
74f3e875268f1c Pavel Begunkov    2025-02-19  288  
f3b44f92e59a80 Jens Axboe        2022-06-13  289  	rw->addr = READ_ONCE(sqe->addr);
f3b44f92e59a80 Jens Axboe        2022-06-13  290  	rw->len = READ_ONCE(sqe->len);
f3b44f92e59a80 Jens Axboe        2022-06-13 @291  	rw->flags = READ_ONCE(sqe->rw_flags);
59a7d12a7fb5ab Anuj Gupta        2024-11-28  292  
59a7d12a7fb5ab Anuj Gupta        2024-11-28  293  	attr_type_mask = READ_ONCE(sqe->attr_type_mask);
59a7d12a7fb5ab Anuj Gupta        2024-11-28  294  	if (attr_type_mask) {
59a7d12a7fb5ab Anuj Gupta        2024-11-28  295  		u64 attr_ptr;
59a7d12a7fb5ab Anuj Gupta        2024-11-28  296  
59a7d12a7fb5ab Anuj Gupta        2024-11-28  297  		/* only PI attribute is supported currently */
59a7d12a7fb5ab Anuj Gupta        2024-11-28  298  		if (attr_type_mask != IORING_RW_ATTR_FLAG_PI)
59a7d12a7fb5ab Anuj Gupta        2024-11-28  299  			return -EINVAL;
59a7d12a7fb5ab Anuj Gupta        2024-11-28  300  
59a7d12a7fb5ab Anuj Gupta        2024-11-28  301  		attr_ptr = READ_ONCE(sqe->attr_ptr);
7a9b0d6925b2b1 Pavel Begunkov    2025-02-24  302  		return io_prep_rw_pi(req, rw, ddir, attr_ptr, attr_type_mask);
59a7d12a7fb5ab Anuj Gupta        2024-11-28  303  	}
7a9b0d6925b2b1 Pavel Begunkov    2025-02-24  304  	return 0;
a9165b83c1937e Jens Axboe        2024-03-18  305  }
a9165b83c1937e Jens Axboe        2024-03-18  306  

:::::: The code at line 291 was first introduced by commit
:::::: f3b44f92e59a804cf375479bda0bccbf4b6e6ef6 io_uring: move read/write related opcodes to its own file

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
