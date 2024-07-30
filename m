Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC6A39B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 00:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722297978; cv=none; b=pEoeUD6pRIqT++nXodJ3WncSnQDJsmBZsQnDPYxri8dfxc2bo+N6ypRpEBr3qy8dGyk90tlQ7DyKkFcOi1p+/YSPhEL6uj5a/PQ6MdyQhteODPHn1dIrXkuv+A/nM1eBbE80kYqnjxItjkmVRt7SXqMGDmZZamS97puY0BPhBvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722297978; c=relaxed/simple;
	bh=uya2jcDksOwJKxMWqS4MgmWA3szVMjuCFuUpp5a7xYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R1fdvKSDQyZjCs8FdAxYwER18f5cZOdmOU8uXQ+RNOijLha8J9kLuQhFmcCXMTu1KoePPyw4WCFzS7Wb2S2u3dcuO1eC8tXPI0Q6hqyHlHnf6WKyJDSm/gG1BXUg+g1RLFFYE39hUKdoSBhLshLsMfDDrID/16QZzGgjvAV4jIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZHgEa0P; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZHgEa0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722297976; x=1753833976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uya2jcDksOwJKxMWqS4MgmWA3szVMjuCFuUpp5a7xYQ=;
  b=YZHgEa0Pxg23k3V/sf5KlK+g3Qz0d8IChUhuzy+CvheNfz3mmN2JiK+j
   Sz/7wbqtPgi3rZwfBJwumOp68T1449JrWx+Z5BMSCHvdoC9avkdWrAT1o
   Ke7td8SCvtqjblLy6J62A8ZptnwME1fwjE3EFkgryi5L1rcozjLZHuOEH
   ll3WEBfBAnUXs4mXitTHlslT7rqS/K6ah6hZl1Xj6T5Ge8yywJWChSS9U
   AoRvOE8w1C/aA9CgmkI8H9FoNUHpVmXZ4+NKRSx8qmRTrnHOueylH0Sra
   zexrceYmmD6uohXpz93ByG9ppN6BzCJeqySZ9tQKGcASvUhVx7F1eOzS5
   w==;
X-CSE-ConnectionGUID: 94e9IfyESA2x7/axrTm4iQ==
X-CSE-MsgGUID: rdO3OPy2Te+S037Vl99nYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="42618253"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="42618253"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 17:06:11 -0700
X-CSE-ConnectionGUID: Jw0HN6WCRAaSDNC0679JwQ==
X-CSE-MsgGUID: PvNuRTO8QLaobfVR8IcapQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="53866294"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2024 17:06:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYaNT-000sCy-0v;
	Tue, 30 Jul 2024 00:06:07 +0000
Date: Tue, 30 Jul 2024 08:05:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-per-rtg-bitmap 8/15] fs/xfs/xfs_rtalloc.h:72:47: error:
 expected parameter name, found ")"
Message-ID: <202407301058.BQyDjdwn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap
head:   f30a4a99bd08a8b9f43363a4ae0fdff0677c5d33
commit: 220c97a57bc171ea5d5463d42328a86017334af7 [8/15] xfs: refactor xfs_growfs_check_rtgeom
config: arm-randconfig-002-20240730 (https://download.01.org/0day-ci/archive/20240730/202407301058.BQyDjdwn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301058.BQyDjdwn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407301058.BQyDjdwn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_bmap_util.c:23:
>> fs/xfs/xfs_rtalloc.h:72:47: error: expected parameter name, found ")"
      72 | # define xfs_growfs_check_rtgeom(mp, d, r, rs,)         (0)
         |                                               ^
--
   In file included from fs/xfs/xfs_fsops.c:24:
>> fs/xfs/xfs_rtalloc.h:72:47: error: expected parameter name, found ")"
      72 | # define xfs_growfs_check_rtgeom(mp, d, r, rs,)         (0)
         |                                               ^
   fs/xfs/xfs_fsops.c: In function 'xfs_growfs_data_private':
>> fs/xfs/xfs_fsops.c:120:17: error: implicit declaration of function 'xfs_growfs_check_rtgeom' [-Wimplicit-function-declaration]
     120 |         error = xfs_growfs_check_rtgeom(mp, nb, mp->m_sb.sb_rblocks,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +72 fs/xfs/xfs_rtalloc.h

    39	
    40	/*
    41	 * Grow the realtime area of the filesystem.
    42	 */
    43	int
    44	xfs_growfs_rt(
    45		struct xfs_mount	*mp,	/* file system mount structure */
    46		xfs_growfs_rt_t		*in);	/* user supplied growfs struct */
    47	
    48	int xfs_rtalloc_reinit_frextents(struct xfs_mount *mp);
    49	int xfs_growfs_check_rtgeom(const struct xfs_mount *mp, xfs_rfsblock_t dblocks,
    50			xfs_rfsblock_t rblocks, xfs_agblock_t rextsize);
    51	int xfs_rtallocate_extent(struct xfs_trans *tp, xfs_rtxnum_t start,
    52			xfs_rtxlen_t maxlen, xfs_rtxlen_t *len, xfs_rtxnum_t *rtx);
    53	#else
    54	# define xfs_growfs_rt(mp,in)				(-ENOSYS)
    55	# define xfs_rtalloc_reinit_frextents(m)		(0)
    56	# define xfs_rtmount_readsb(mp)				(0)
    57	# define xfs_rtmount_freesb(mp)				((void)0)
    58	static inline int		/* error */
    59	xfs_rtmount_init(
    60		xfs_mount_t	*mp)	/* file system mount structure */
    61	{
    62		if (mp->m_sb.sb_rblocks == 0)
    63			return 0;
    64	
    65		xfs_warn(mp, "Not built with CONFIG_XFS_RT");
    66		return -ENOSYS;
    67	}
    68	# define xfs_rtmount_inodes(m)  (((mp)->m_sb.sb_rblocks == 0)? 0 : (-ENOSYS))
    69	# define xfs_rtunmount_inodes(m)
    70	# define xfs_rt_resv_free(mp)				((void)0)
    71	# define xfs_rt_resv_init(mp)				(0)
  > 72	# define xfs_growfs_check_rtgeom(mp, d, r, rs,)		(0)
    73	# define xfs_rtallocate_extent(...)			(-ENOSYS)
    74	#endif	/* CONFIG_XFS_RT */
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
