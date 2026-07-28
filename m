Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D00917BED0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252370; cv=none; b=fbDdk7PTCyiS6R8MjaiuiLHsPYEDm79q/tORO3XVL9Ds4vGDvSfeU/LzQfYOw23GCsgC6CPrr0YV00CG6ZaJydrDKde8zAyKqaGKhm9he0dGrMkwrnyob/5RDC+IKWDGEHRO/WwBMbHzczOGtoT+DPSsEt9ZQKkxRKgPwBTejm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252370; c=relaxed/simple;
	bh=r4MtI4uqH+UExIp1Ya/ozCbiTW/nnYs7sEd6Ii5A5dQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pZdYdcvdnstoMGtHze61JuVuupWRhuhxrI0uxhgXUIwllUMwr4nDeaSXJz0wfCMTEWtaBhsex2Vic8eYlKwRyRrpvtXg1e+W1U3ZE3yrXLj/G7ASvtE+9RVLZZoX96/z/s8YW61w7QuRB0mA3TIZaOCVsQLrhadzRS/BU4zsxbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1/j4Zba; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1/j4Zba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785252368; x=1816788368;
  h=date:from:to:cc:subject:message-id;
  bh=r4MtI4uqH+UExIp1Ya/ozCbiTW/nnYs7sEd6Ii5A5dQ=;
  b=c1/j4ZbaBGVsVCNHkFboB9oez7eQFZHDCZfRNRJumv64EdkH+uAFQ86K
   fbpuvqEto12UzN3JRrmwnQ5FsxClagNeMbonNgtYtUmzBFuUSBL9+nsct
   u65THPuoNRgwxlsN9C8h7kXSlXF1yCPdnMgen59SUvMcy8BKZoXh4ueBi
   OzYjvULFBX7TIAjyVhUaTCnd639/bBaJcapS2nwh2ID4MFbTTg1ufAh1R
   HvMPzBymaPF9m5ix77PuzaiykZAmh6zErnMOouUeSTL/ohS5cv7RjnZTT
   9rH2ILReXY06utcJWhSzZCF4wdR6XU8yHDbKapB+Zoz/VyhckBu9OdI31
   Q==;
X-CSE-ConnectionGUID: N39ryKj3QAigRvOBs/LP6A==
X-CSE-MsgGUID: 0A+tW9nqSQSJig80wWVvdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89660762"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="89660762"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:26:07 -0700
X-CSE-ConnectionGUID: 4+9vWiCGS1WcAlF0O9jzVQ==
X-CSE-MsgGUID: aC1s/6RyR52jjgZr2lggjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="264032163"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Jul 2026 08:26:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wojgy-00000000eTd-0Y9Y;
	Tue, 28 Jul 2026 15:26:04 +0000
Date: Tue, 28 Jul 2026 23:25:40 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v5 8/9]
 drivers/nvme/host/ioctl.c:668:15: error: implicit declaration of function
 'blk_uring_cmd_alloc_iobuf'
Message-ID: <202607282355.4vTDdCjt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5
head:   de80bacbf04a137715357b6a2948d9f29a18d990
commit: 7b61092440add7fbe6d72ae7ede11080113e193e [8/9] nvme: allocate pool-backed fixed buffers through namespace char devices
config: nios2-randconfig-002-20260728 (https://download.01.org/0day-ci/archive/20260728/202607282355.4vTDdCjt-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607282355.4vTDdCjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607282355.4vTDdCjt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/ioctl.c: In function 'nvme_ns_alloc_iobuf':
>> drivers/nvme/host/ioctl.c:668:15: error: implicit declaration of function 'blk_uring_cmd_alloc_iobuf' [-Werror=implicit-function-declaration]
     668 |         ret = blk_uring_cmd_alloc_iobuf(ioucmd, pool, buf_index, len,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
