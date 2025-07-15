Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D7B24DCEC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 15:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752594129; cv=none; b=RJyI1hXs6nIxB/D6SDP9mrSl8IcLF9HWVBxm43N01ZX8dIwghI8QfJGnJ+zTkFZ+SEDl7tw+95+FqMUrxPEoeBnR8/N/R2zYDYHLRFlrTjvN8T7wQXuUqjY3dkGjPpUzt8B/7sz1qPnpa36Y3zVH/ltyRW2g0XuAmiRWjW/KJBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752594129; c=relaxed/simple;
	bh=i7zGDrpCs0zOY7b4ZK2nPEICeLTLJNIjJydZGkO4FXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FgdnvNdh9vG0032CMu/h+tv0QgVYnyXY1IZ7X9b2E2eTsVxKMiMTMtCA5X2KLm7BvO9nNFEzuheFMZ1UaiB5rlV7GN9p6rmXlk7pgNLbkmyFEHkNxM7loPCwJn2MaTTjUskRHLNXNpP4uDvUggYBO2oJ3Q4OXRuOtnjYYUzA4Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eh+OdsXi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eh+OdsXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752594128; x=1784130128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i7zGDrpCs0zOY7b4ZK2nPEICeLTLJNIjJydZGkO4FXQ=;
  b=Eh+OdsXisHlFSRdjkWFUGYjZpKTHXLq77fjWSyGdqr5PnBBQhZNV17Jt
   bDeeq7Bun+2YO4QzywReOW0Z3wIFHj8ilSaLzxTgjUJ8P3WcULbH3jIGZ
   wDc5tjrlMqkYmQTfpjfGh5Lie4LB7UyAgs+yjNqdCEdkIbG1EMz3fWoxN
   nuNw+J4FhJOMFOeHaShGsMunD8L6avydtuWeJeapj/Gjk8ijaPlXW+OyU
   RE6F1Tkr02mIl7elnX0/69oeVlBqZ7LgvggorLMZmhTxbft7BqY1e55rT
   clDG6RYj2M+77HD7XrZRnSGLVssw+CEHp3Ks+yFSiOhxAoU55lt9GdDNf
   Q==;
X-CSE-ConnectionGUID: 7kjxbvjoSkuczMEzYz1HwA==
X-CSE-MsgGUID: RTx2kLruST2y0GSK3MEI3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54757897"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54757897"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 08:42:07 -0700
X-CSE-ConnectionGUID: diPoKhKNR1mcZwHesovYdQ==
X-CSE-MsgGUID: amoLNCgzT86k6iKA2o/ZEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="161572175"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jul 2025 08:42:06 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubhn9-000BGJ-2W;
	Tue, 15 Jul 2025 15:42:03 +0000
Date: Tue, 15 Jul 2025 23:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-trans-cleanups 5/8] fs/xfs/xfs_inode.c:2939:6: warning:
 variable 'error' is used uninitialized whenever 'if' condition is false
Message-ID: <202507152359.IWcfY6aZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-trans-cleanups
head:   eabea0b216f4782b4f15143d5b411b113026a69b
commit: 9823a1576f363cb62d4ad064359cb2c7b5d2c49a [5/8] xfs: return the allocated transaction from xfs_trans_alloc_empty
config: arm64-randconfig-004-20250715 (https://download.01.org/0day-ci/archive/20250715/202507152359.IWcfY6aZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507152359.IWcfY6aZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507152359.IWcfY6aZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_inode.c:2939:6: warning: variable 'error' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2939 |         if (xfs_inode_unlinked_incomplete(ip))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_inode.c:2944:9: note: uninitialized use occurs here
    2944 |         return error;
         |                ^~~~~
   fs/xfs/xfs_inode.c:2939:2: note: remove the 'if' if its condition is always true
    2939 |         if (xfs_inode_unlinked_incomplete(ip))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2940 |                 error = xfs_inode_reload_unlinked_bucket(tp, ip);
   fs/xfs/xfs_inode.c:2935:13: note: initialize the variable 'error' to silence this warning
    2935 |         int                     error;
         |                                      ^
         |                                       = 0
   1 warning generated.


vim +2939 fs/xfs/xfs_inode.c

83771c50e42b92 Darrick J. Wong   2023-09-11  2928  
83771c50e42b92 Darrick J. Wong   2023-09-11  2929  /* Decide if this inode is missing its unlinked list and reload it. */
83771c50e42b92 Darrick J. Wong   2023-09-11  2930  int
83771c50e42b92 Darrick J. Wong   2023-09-11  2931  xfs_inode_reload_unlinked(
83771c50e42b92 Darrick J. Wong   2023-09-11  2932  	struct xfs_inode	*ip)
83771c50e42b92 Darrick J. Wong   2023-09-11  2933  {
83771c50e42b92 Darrick J. Wong   2023-09-11  2934  	struct xfs_trans	*tp;
83771c50e42b92 Darrick J. Wong   2023-09-11  2935  	int			error;
83771c50e42b92 Darrick J. Wong   2023-09-11  2936  
9823a1576f363c Christoph Hellwig 2025-07-15  2937  	tp = xfs_trans_alloc_empty(ip->i_mount);
83771c50e42b92 Darrick J. Wong   2023-09-11  2938  	xfs_ilock(ip, XFS_ILOCK_SHARED);
83771c50e42b92 Darrick J. Wong   2023-09-11 @2939  	if (xfs_inode_unlinked_incomplete(ip))
83771c50e42b92 Darrick J. Wong   2023-09-11  2940  		error = xfs_inode_reload_unlinked_bucket(tp, ip);
83771c50e42b92 Darrick J. Wong   2023-09-11  2941  	xfs_iunlock(ip, XFS_ILOCK_SHARED);
83771c50e42b92 Darrick J. Wong   2023-09-11  2942  	xfs_trans_cancel(tp);
83771c50e42b92 Darrick J. Wong   2023-09-11  2943  
83771c50e42b92 Darrick J. Wong   2023-09-11  2944  	return error;
83771c50e42b92 Darrick J. Wong   2023-09-11  2945  }
d9041681dd2f53 Darrick J. Wong   2023-12-15  2946  

:::::: The code at line 2939 was first introduced by commit
:::::: 83771c50e42b92de6740a63e152c96c052d37736 xfs: reload entire unlinked bucket lists

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
