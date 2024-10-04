Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97439231CAC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728075225; cv=none; b=oN5qdYKpKiudU/A+zvSeq3LKYaEcnU8O9u+HW07iZLAcgQhjnjIvnXIsM/PPy8y4aeh/RaNWOHfoErgIuVcu1il9z4iuz68y4yo60qU/udBXctwczThSNxaKY6AfiEfRnJI32zfeWqTIk7L6TQ9yaaHtLFG6yOdHQHD0LniPJEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728075225; c=relaxed/simple;
	bh=JIbGxbtkBYKSJbbkfq1XUPreeDcmQngH0UsoA+g2VaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WjI2fwYvFoF7+/tEJV/fGzVUBl4b9xwelLewWs79+Cw7Zhk9c49WKo3tHiCl/2K0kLGBEXQdEXhUYn2N3efMODQtMZw1a4S6Zjh8/OLOX9dzZy70yI524lZPbywFf8nHvFBj8BXQYaKaU5KPh1kMMJjEI4vmhcK9Jqgpv4c9+NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8PNeL5n; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8PNeL5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728075223; x=1759611223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIbGxbtkBYKSJbbkfq1XUPreeDcmQngH0UsoA+g2VaY=;
  b=A8PNeL5nTngYSxLJ6nZ4IQupmD4AwQsbFgYEV/ohpfgyaSCMmN5CeSgK
   00Dl3i0q3xjCHa2l4kFVLvK0W9qcDstRQGWDozCexkhKIXOhx7+GQJ7QE
   okd9ND99l2rlOXgyCJjWaTRhY6/ukfT3fYtR4CrmlT9XRR+O+uGgbZD/n
   55OZyuNVe9qGRFPekVEsydEpOqsiu33DByBEIhXeHdOIDlyvvPVo5pD/u
   utdLIaUXA4+iT6fm5jCLoVIq0YMrrvhCAuUeeA95YcqruLO4Y+FAmZj2w
   IZ9+WGH9cqn9yZCRFfn5cYEi3NAEsLxW88/l4NZfOKtXfu0I/j6SRFIDC
   Q==;
X-CSE-ConnectionGUID: 0DPI30ELQt+PDwn/wXC+xg==
X-CSE-MsgGUID: fYPHDEQaQpSnW9MUtNgRKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27119326"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="27119326"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 13:53:42 -0700
X-CSE-ConnectionGUID: 4gPVOXBkQv+wDrGkDY8eIg==
X-CSE-MsgGUID: KF8i/55kSKW2aGkDtwEudw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="75252834"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Oct 2024 13:53:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swpIx-0002D4-0K;
	Fri, 04 Oct 2024 20:53:39 +0000
Date: Sat, 5 Oct 2024 04:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 14/23] io_uring/zcrx.h:62:39: warning: 'struct
 socket' declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202410050417.8aiMxLPW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   d2d392d762028d4a8d56e53ad82626dcb2d17431
commit: bc08ae25178811e78912b88aa97797af46a1ce00 [14/23] io_uring/zcrx: add io_recvzc request
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241005/202410050417.8aiMxLPW-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050417.8aiMxLPW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050417.8aiMxLPW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/memmap.c:15:
>> io_uring/zcrx.h:62:39: warning: 'struct socket' declared inside parameter list will not be visible outside of this definition or declaration
      62 |                                struct socket *sock, unsigned int flags)
         |                                       ^~~~~~


vim +62 io_uring/zcrx.h

    41	
    42	#if defined(CONFIG_PAGE_POOL) && defined(CONFIG_INET)
    43	int io_register_zcrx_ifq(struct io_ring_ctx *ctx,
    44				 struct io_uring_zcrx_ifq_reg __user *arg);
    45	void io_unregister_zcrx_ifqs(struct io_ring_ctx *ctx);
    46	void io_shutdown_zcrx_ifqs(struct io_ring_ctx *ctx);
    47	int io_zcrx_recv(struct io_kiocb *req, struct io_zcrx_ifq *ifq,
    48			 struct socket *sock, unsigned int flags);
    49	#else
    50	static inline int io_register_zcrx_ifq(struct io_ring_ctx *ctx,
    51						struct io_uring_zcrx_ifq_reg __user *arg)
    52	{
    53		return -EOPNOTSUPP;
    54	}
    55	static inline void io_unregister_zcrx_ifqs(struct io_ring_ctx *ctx)
    56	{
    57	}
    58	static inline void io_shutdown_zcrx_ifqs(struct io_ring_ctx *ctx)
    59	{
    60	}
    61	static inline int io_zcrx_recv(struct io_kiocb *req, struct io_zcrx_ifq *ifq,
  > 62				       struct socket *sock, unsigned int flags)
    63	{
    64		return -EOPNOTSUPP;
    65	}
    66	#endif
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
