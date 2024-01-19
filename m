Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30423175A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 03:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705634685; cv=none; b=YOlinb0WIRrs7eSzJWj/ESG9ubfdH2fmLeIRuwTJRSHtg+gd9oc9iIm4uAqnlkHBngPwSIATY5A91GPmExz5wBgoO91R589fZOra1OcZsZCqzu+M8FOKscBGqcHXMwEpMuCDseGPqGrceNhKHDFbWXBFujmzY6UlLqxHChGgudU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705634685; c=relaxed/simple;
	bh=gqCycu1qaaRHjDgM5huAqT7BcOgv4ajGwQr2yGMbEtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U8mKMdN/N/Q7A/eVPqJ4Yoex76KlZMLU8IO5W2MIKngcIAXV4YwSxhCrxs1b30aPIN0coEpylnDzu1c5Gluci/cB30jblI3tNUpck+Pcywz0oeevArPEY7nxIgJNsRER+zVF8XzilvVyTEr9Hirp9259uLo+88lnOCJA/+BAX2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aw1qlC89; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aw1qlC89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705634683; x=1737170683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gqCycu1qaaRHjDgM5huAqT7BcOgv4ajGwQr2yGMbEtc=;
  b=Aw1qlC89y4FH1MAomy/8Af6nz8cDcVJKzdWMsQTXmfeqFzAKOszsidJV
   pt9teKEY0QcpBP9H/YIcGoXI4HdYn/y+/QrTRW1LYpj0mJKiOohk1mMh3
   Lv/BzKxpxLBSk8eVEVQwpgmNAHbGhPLLdfQiKkspewe2qiulGIPsRt1IT
   ObmT7LGVdpH2Z2/VwFw2Pj0A/rVhvhQ2nJiJJGG1qbDvNWHO/+WQ1WvgL
   0q7JheGNZ8YLq/HsSb2swjaTVzbK0l0NSQKBEpmMrEjOLVxZQsvw3cFZE
   03QZfTa4fxXKQd+189nOmrKjVI3OFmeTfwgX31n7BlCQQ2WHRZ6rYZ/y4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="464919600"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="464919600"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 19:24:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="904035843"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="904035843"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2024 19:24:41 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQfUl-0003Yw-1p;
	Fri, 19 Jan 2024 03:24:39 +0000
Date: Fri, 19 Jan 2024 11:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-btree-check-cleanups 36/37]
 fs/xfs/libxfs/xfs_btree.c:102:1: warning: no previous prototype for
 '__xfs_btree_check_fsblock'
Message-ID: <202401191137.7kGJzVfA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.infradead.org/users/hch/xfs xfs-btree-check-cleanups
head:   b6892a137b424db9d9e928e41c21a5f45f991052
commit: 1ecac9eecc63f962e39a682cca57c6914b82cb30 [36/37] xfs: rename btree helpers that depends on the block number representation
config: i386-buildonly-randconfig-005-20240119 (https://download.01.org/0day-ci/archive/20240119/202401191137.7kGJzVfA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401191137.7kGJzVfA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401191137.7kGJzVfA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_btree.c:102:1: warning: no previous prototype for '__xfs_btree_check_fsblock' [-Wmissing-prototypes]
     102 | __xfs_btree_check_fsblock(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/libxfs/xfs_btree.c:156:1: warning: no previous prototype for '__xfs_btree_check_agblock' [-Wmissing-prototypes]
     156 | __xfs_btree_check_agblock(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__xfs_btree_check_fsblock +102 fs/xfs/libxfs/xfs_btree.c

    96	
    97	/*
    98	 * Check a long btree block header.  Return the address of the failing check,
    99	 * or NULL if everything is ok.
   100	 */
   101	xfs_failaddr_t
 > 102	__xfs_btree_check_fsblock(
   103		struct xfs_btree_cur	*cur,
   104		struct xfs_btree_block	*block,
   105		int			level,
   106		struct xfs_buf		*bp)
   107	{
   108		struct xfs_mount	*mp = cur->bc_mp;
   109		xfs_failaddr_t		fa;
   110		xfs_fsblock_t		fsb;
   111	
   112		if (xfs_has_crc(mp)) {
   113			if (!uuid_equal(&block->bb_u.l.bb_uuid, &mp->m_sb.sb_meta_uuid))
   114				return __this_address;
   115			if (block->bb_u.l.bb_blkno !=
   116			    cpu_to_be64(bp ? xfs_buf_daddr(bp) : XFS_BUF_DADDR_NULL))
   117				return __this_address;
   118			if (block->bb_u.l.bb_pad != cpu_to_be32(0))
   119				return __this_address;
   120		}
   121	
   122		if (be32_to_cpu(block->bb_magic) != xfs_btree_magic(mp, cur->bc_ops))
   123			return __this_address;
   124		if (be16_to_cpu(block->bb_level) != level)
   125			return __this_address;
   126		if (be16_to_cpu(block->bb_numrecs) >
   127		    cur->bc_ops->get_maxrecs(cur, level))
   128			return __this_address;
   129	
   130		/*
   131		 * For inode-rooted btrees, the root block sits in the inode fork.  In
   132		 * that case bp is NULL, and the block must not have any siblings.
   133		 */
   134		if (!bp) {
   135			if (block->bb_u.l.bb_leftsib != cpu_to_be64(NULLFSBLOCK))
   136				return __this_address;
   137			if (block->bb_u.l.bb_rightsib != cpu_to_be64(NULLFSBLOCK))
   138				return __this_address;
   139			return NULL;
   140		}
   141	
   142		fsb = XFS_DADDR_TO_FSB(mp, xfs_buf_daddr(bp));
   143		fa = xfs_btree_check_fsblock_siblings(mp, fsb,
   144				block->bb_u.l.bb_leftsib);
   145		if (!fa)
   146			fa = xfs_btree_check_fsblock_siblings(mp, fsb,
   147					block->bb_u.l.bb_rightsib);
   148		return fa;
   149	}
   150	
   151	/*
   152	 * Check a short btree block header.  Return the address of the failing check,
   153	 * or NULL if everything is ok.
   154	 */
   155	xfs_failaddr_t
 > 156	__xfs_btree_check_agblock(
   157		struct xfs_btree_cur	*cur,
   158		struct xfs_btree_block	*block,
   159		int			level,
   160		struct xfs_buf		*bp)
   161	{
   162		struct xfs_mount	*mp = cur->bc_mp;
   163		struct xfs_perag	*pag = cur->bc_ag.pag;
   164		xfs_failaddr_t		fa;
   165		xfs_agblock_t		agbno;
   166	
   167		if (xfs_has_crc(mp)) {
   168			if (!uuid_equal(&block->bb_u.s.bb_uuid, &mp->m_sb.sb_meta_uuid))
   169				return __this_address;
   170			if (block->bb_u.s.bb_blkno != cpu_to_be64(xfs_buf_daddr(bp)))
   171				return __this_address;
   172		}
   173	
   174		if (be32_to_cpu(block->bb_magic) != xfs_btree_magic(mp, cur->bc_ops))
   175			return __this_address;
   176		if (be16_to_cpu(block->bb_level) != level)
   177			return __this_address;
   178		if (be16_to_cpu(block->bb_numrecs) >
   179		    cur->bc_ops->get_maxrecs(cur, level))
   180			return __this_address;
   181	
   182		agbno = xfs_daddr_to_agbno(mp, xfs_buf_daddr(bp));
   183		fa = xfs_btree_check_agblock_siblings(pag, agbno,
   184				block->bb_u.s.bb_leftsib);
   185		if (!fa)
   186			fa = xfs_btree_check_agblock_siblings(pag, agbno,
   187					block->bb_u.s.bb_rightsib);
   188		return fa;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
