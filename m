Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE801427A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 23:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785195441; cv=none; b=amodO+6CNLarXU0NG7JRvmUnudWp0LcFEba85xD011AbZyD52/ipP17JPZYox0DTC6k0Fog3UWfVTMnN91dpU3e4PYRBzZ9RftoyBlRrkgdz6epuWLlK/Vryt+5/VY9ykQ2PpG06ZVN3laEjAqffVDDkf3nshixuh3aWj4tj8ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785195441; c=relaxed/simple;
	bh=Q/pN3zg6HdO8zochy9Hk41hmNU9i75Jct1yl6Rh1gJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GlHbSWnKAEoKxUmbAQxTMwVfgkDAMGOhFcOKoi6uF/gzAGKIsBbsC6l0vBctaD7btzbNxy/yl3HfrTgTp3z8nYHQSUg8HlvR/qLZJlnm5EBOwjdr7lUS+HP0/knXvBrQ3NYH2CywKdsgwsXs36rMXdzo54Q5YDKzRSFut4Z8cUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SprsnQhl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SprsnQhl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785195440; x=1816731440;
  h=date:from:to:cc:subject:message-id;
  bh=Q/pN3zg6HdO8zochy9Hk41hmNU9i75Jct1yl6Rh1gJ4=;
  b=SprsnQhloJYNl5PEgW+IvbhbNjGXIbpwUIzmr1tREa4E6XowD7b3ytuA
   IhlqpSxn0rJE0ad7diK38W3FyJHe+tPqXcjPrB3Dpmey4kTx9eEws1YtT
   kr6WiPSIb3qmh0qjHbs3xZwgug5ftFneRvq1/quIiIIxSNtn+Pg92+MNq
   m7/zisahwuKzIVcJXJvGyvXnNvtpoyU5ozvAqFh5Nq8McNO5wpMcEIWns
   jPtsUEi9JPqNPmYr0fZwngB+pFRyrPE+wbm3UkWdz3XXJ3JTRMr5M24/c
   zEyyvAjKqiIhAzpwQKG14i0So3khSZq26Ge1Nt4SnZ6/z54LzUJjc0Xzl
   w==;
X-CSE-ConnectionGUID: rKJbI75STr+5DKK+go2EaQ==
X-CSE-MsgGUID: R7TR9ZfASPeE3zJnJSOejA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="97284789"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="97284789"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 16:37:19 -0700
X-CSE-ConnectionGUID: Lk1TS24aRgSe/SSDst8evg==
X-CSE-MsgGUID: w8Iu6mYYTT2p47Pggk3nlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="255601194"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jul 2026 16:37:17 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woUsl-000000001ms-0yR7;
	Mon, 27 Jul 2026 23:37:15 +0000
Date: Tue, 28 Jul 2026 01:36:49 +0200
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v5 8/9]
 drivers/nvme/host/ioctl.c:668:15: error: implicit declaration of function
 'blk_uring_cmd_alloc_iobuf'
Message-ID: <202607280157.e53UIAbB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5
head:   de80bacbf04a137715357b6a2948d9f29a18d990
commit: 7b61092440add7fbe6d72ae7ede11080113e193e [8/9] nvme: allocate pool-backed fixed buffers through namespace char devices
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260728/202607280157.e53UIAbB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280157.e53UIAbB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280157.e53UIAbB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/ioctl.c: In function 'nvme_ns_alloc_iobuf':
>> drivers/nvme/host/ioctl.c:668:15: error: implicit declaration of function 'blk_uring_cmd_alloc_iobuf' [-Wimplicit-function-declaration]
     668 |         ret = blk_uring_cmd_alloc_iobuf(ioucmd, pool, buf_index, len,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/blk_uring_cmd_alloc_iobuf +668 drivers/nvme/host/ioctl.c

   649	
   650	static int nvme_ns_alloc_iobuf(struct nvme_ns *ns, struct io_uring_cmd *ioucmd,
   651				       unsigned int issue_flags)
   652	{
   653		const struct io_uring_sqe *sqe = ioucmd->sqe;
   654		struct blk_iobuf_pool *pool;
   655		u64 buf_index, len;
   656		int ret;
   657	
   658		if (READ_ONCE(sqe->ioprio) || READ_ONCE(sqe->__pad1) ||
   659		    READ_ONCE(sqe->len) || READ_ONCE(sqe->rw_flags) ||
   660		    READ_ONCE(sqe->file_index))
   661			return -EINVAL;
   662		buf_index = READ_ONCE(sqe->addr);
   663		len = READ_ONCE(sqe->addr3);
   664	
   665		pool = blk_queue_get_iobuf_pool(ns->queue);
   666		if (!pool)
   667			return -EOPNOTSUPP;
 > 668		ret = blk_uring_cmd_alloc_iobuf(ioucmd, pool, buf_index, len,
   669					       issue_flags);
   670		blk_iobuf_pool_put(pool);
   671		return ret;
   672	}
   673	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
