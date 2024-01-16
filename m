Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58A88488
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 04:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7d3o+6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705377789; x=1736913789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wRNVFXhMPICao3lGatwiGqrLbIc8RMDdBueCct/tpvE=;
  b=F7d3o+6xEaazOpsQo5awotNoZVJ0yAWxyq70FBcjA6RkIkfRTwephgd0
   5Tuywh+zdSvbUTfPZLLiZkDz9nFSMoBAns/ZtZslHKX791CzhVDwavXAH
   qeespKUGqumjJEmr0BP7qWUSse7SpN/1cA4voM22lzwirLV0djCzE7Bf7
   Z17c/d2RBeJ6M9caOk0KdnvVVb/doGoRC3ACCcFv47mKLKmVkx5SGdDQ5
   1W+cKnb4oRHa1diFiH1ZAbT8Sg3DW3kl+oJ1LCcRay0N8lAo+paRawJel
   ne0uHJdVNqsiaYE7GIhfbvIwwJeg9SnnxaPP4twECQQMz1aU8p9785hug
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="398612583"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="398612583"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 20:03:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="1115149282"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="1115149282"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jan 2024 20:03:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPaZb-000Cwd-2W;
	Tue, 16 Jan 2024 03:59:42 +0000
Date: Tue, 16 Jan 2024 11:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:wtf-rebase 24/427] fs/xfs/scrub/xfbtree.c:240:22: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202401161158.mXmj8qzY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs wtf-rebase
head:   c6068c926e0a22f601635791544839904d123150
commit: 13d99f412a072cf6cbde5a8a0dc71a2bd2d6a4fc [24/427] xfs: support in-memory btrees
config: i386-randconfig-062-20240116 (https://download.01.org/0day-ci/archive/20240116/202401161158.mXmj8qzY-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401161158.mXmj8qzY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401161158.mXmj8qzY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/xfbtree.c:240:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] l @@     got unsigned long long [usertype] xfoff @@
   fs/xfs/scrub/xfbtree.c:240:22: sparse:     expected restricted __be64 [usertype] l
   fs/xfs/scrub/xfbtree.c:240:22: sparse:     got unsigned long long [usertype] xfoff
   fs/xfs/scrub/xfbtree.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, fs/xfs/kmem.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +240 fs/xfs/scrub/xfbtree.c

   214	
   215	/* Initialize an empty leaf block as the btree root. */
   216	STATIC int
   217	xfbtree_init_leaf_block(
   218		struct xfs_mount		*mp,
   219		struct xfbtree			*xfbt,
   220		const struct xfs_btree_ops	*ops)
   221	{
   222		struct xfs_buf			*bp;
   223		xfileoff_t			xfoff = xfbt->highest_offset++;
   224		int				error;
   225	
   226		error = xfs_buf_get(xfbt->target, xfoff << (PAGE_SHIFT - BBSHIFT),
   227				XFBTREE_BBSIZE, &bp);
   228		if (error)
   229			return error;
   230	
   231		trace_xfbtree_create_root_buf(xfbt, bp);
   232	
   233		bp->b_ops = ops->buf_ops;
   234		xfs_btree_init_buf(mp, bp, ops, 0, 0, xfbt->owner);
   235		error = xfs_bwrite(bp);
   236		xfs_buf_relse(bp);
   237		if (error)
   238			return error;
   239	
 > 240		xfbt->root.l = xfoff;
   241		return 0;
   242	}
   243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
