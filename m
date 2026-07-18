Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A7D17BB21
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 00:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784336154; cv=none; b=PW3aD+wHRX1/CjPF34giaVhcUVb/8CmGsKM6WnkP7xWf8wWI5z4UKaQmriTY3K59eVRORJj0NMljQnv/n4lYspBo0O2QI3t0BjS+8jLCTxt7qzKt4Vh4ZSfsV9aQpH+rk0HzA3FcRokQ/Qt2KW2wj5ViOViq88ZE1gbF8vmZ3ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784336154; c=relaxed/simple;
	bh=SKIDdeQ8AmUUHZPfeQzKHP5BSxAl5BZUj8sAkqB+BKU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mvR6JUkBqmRMeB4bFHtHhc9kOJBPqfysRcjF2SNSXOm+TE85My7GN9v+n8Wq0iw5NyAsb5i9pS4uhWXx9YT7YIGhDIJzi1LF5GhgTPnc5kxwRaU2ylQmyZYfLKWiXDwOVSCCSn5WQTTpUK6hxS7p6+k7uhf0sU7ohtAwjJJwptU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVBc9ZI8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVBc9ZI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784336152; x=1815872152;
  h=date:from:to:cc:subject:message-id;
  bh=SKIDdeQ8AmUUHZPfeQzKHP5BSxAl5BZUj8sAkqB+BKU=;
  b=AVBc9ZI8oMrJv1tr2UOYPQJzyrdkWmhQy0/4x/i8+15BNwoOvvJMEjkV
   9J/S2yYiKnSE3zWKTw09kUr18tzzcamhedybq0UWnOuAC5LHwleSXSReH
   SEPgXe2F38+My5scHk9Dojv7avLjykA9vYmR1kiiduc0e79I+0sdiK7Fo
   ly/+vBPyjL/FVGC+UcqNKsWfLB3XDeLGjD9a7zvOUL+1P5KegMibs5iLm
   b+pEumFQwVffN+N8r6quXUvq41xcDl8z0LWcSNIGqO0oEWjjs12s+/o9l
   E+wRt71c8f9dK+K0qAGEe4u5G5KZjFWj/nzzxQnj24TDbOahLXhgszw0i
   w==;
X-CSE-ConnectionGUID: ISdoNxY6Sla8a1Q7mxcWJw==
X-CSE-MsgGUID: vrluUou6TU25uKVhBdL54g==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="72547292"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="72547292"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 17:55:51 -0700
X-CSE-ConnectionGUID: jS69uZ1pRG+K6bggI9l3tA==
X-CSE-MsgGUID: QTC2uLwKQCqv4vlfFTWFRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="255149781"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Jul 2026 17:55:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wktLD-00000000TKZ-0mkF;
	Sat, 18 Jul 2026 00:55:44 +0000
Date: Sat, 18 Jul 2026 08:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 43/51] fs/xfs/xfs_ioend.c:154:20: warning:
 unused variable 'ip'
Message-ID: <202607180819.mPCeTJiz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   ef3d55d014b3a800421b9dae3ac182577bfe2bd7
commit: d2fb31974d0bb17f4f1fdc1de60e0a9ca53e6480 [43/51] xfs: add support for writing with data checksums
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260718/202607180819.mPCeTJiz-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180819.mPCeTJiz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180819.mPCeTJiz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_ioend.c:154:20: warning: unused variable 'ip' [-Wunused-variable]
     154 |         struct xfs_inode        *ip = XFS_I(inode);
         |                                  ^~
   1 warning generated.


vim +/ip +154 fs/xfs/xfs_ioend.c

   145	
   146	int
   147	xfs_ioend_submit_read_sync(
   148		struct bio		*bio,
   149		struct inode		*inode,
   150		loff_t			file_offset,
   151		const struct iomap	*iomap,
   152		u16			flags)
   153	{
 > 154		struct xfs_inode	*ip = XFS_I(inode);
   155		struct iomap_ioend	*ioend;
   156		int			error;
   157	
   158		ASSERT(xfs_is_rtcsum_inode(ip));
   159		ASSERT(!(flags & IOMAP_IOEND_DIRECT));
   160		ASSERT(!(iomap->flags & IOMAP_F_INTEGRITY));
   161	
   162		ioend = iomap_init_ioend(inode, bio, file_offset, flags);
   163		if (!xfs_rtcsum_prepare_read(ioend))
   164			return blk_status_to_errno(bio->bi_status);
   165		error = submit_bio_wait(bio);
   166		error = xfs_rtcsum_verify_ioend(ioend, error);
   167		iomap_csum_free(ioend);
   168		return error;
   169	}
   170	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
