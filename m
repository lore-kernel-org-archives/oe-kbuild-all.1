Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23323364
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 00:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706659787; cv=none; b=ukAjj642AOICOK0cirw27i042kv2DAFPAo+S3XnikgMPPd3rpQcPXQ0JDsSgAUXu/I0+XUH27KqM+S5pmzHlranITNZyfDVqXXX97aanGoXer032lpID/BIQ98ksnhhFsWcjvQatcsxiQNACVHqjKpGKX31V+KVTzyE7+xIiM0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706659787; c=relaxed/simple;
	bh=l4gSbpHgvRjsFSvkKRMFpCsN0zX70IeYZ/cIMxnMfh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DHxku2VUZnG2U3ArKU3zjweCuBgBjsFJZE/ZRBt0OGHJN5+zus8jxBHGC32L4KsoTQTxraMIKdHs7+ofmVgzdLzUqzBWDbXS4xJTHs+S+JCdiDBkD9ki1nnt+RONCRuYxHzt1AP41treicJXBiXGa/Bm3J8VRDlz3HllRqFQ7bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fxfm3clg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fxfm3clg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706659784; x=1738195784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l4gSbpHgvRjsFSvkKRMFpCsN0zX70IeYZ/cIMxnMfh8=;
  b=Fxfm3clgXn1DWVeUhy8FJDe5jcrfSJj9MVx0hBecO96t+4b9pM62khC3
   1nd+s3d0RrT0DW3khiUsYWj2NneJzTN66KIa26C6U3IgafTtjOlSeLnkM
   P4km6SxtGAK5rpNylpLUs0riyDru5quh5IBKUJwj0oGrihrNGrha9eWb1
   uQ/TO/FeoUtO3IICusXmnFFlS0ZTTdqmF3miD7AxDXtrfP665OB5hk9ku
   2KZ2L2mkg32jvHQ55QUCuReov2qgNF2gdjprAqfbbfi7fcx4a7Tirh9/l
   n6B1APRwUpMi7bBa0Ew6wwF9ePPNT7IJXFTBzDiWEt7D8YJsluh9+j2ru
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10108152"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="10108152"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 16:09:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931630707"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="931630707"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2024 16:09:41 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUyAd-0000xs-35;
	Wed, 31 Jan 2024 00:09:39 +0000
Date: Wed, 31 Jan 2024 08:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-btree-mem-tidyups 3/13]
 fs/xfs/libxfs/xfs_bmap.c:594:17: error: implicit declaration of function
 'xfs_bmap_read_buf'; did you mean 'xfs_da_read_buf'?
Message-ID: <202401310757.lmNQdkjY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-btree-mem-tidyups
head:   14ff5daf7379b9ed9cf735ff27846611fa52d9e9
commit: 2870f29542025c569e4e3492a5f2fca3cfd02967 [3/13] xfs: move and rename xfs_btree_read_bufl
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240131/202401310757.lmNQdkjY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310757.lmNQdkjY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310757.lmNQdkjY-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/libxfs/xfs_bmap.c: In function 'xfs_bmap_btree_to_extents':
>> fs/xfs/libxfs/xfs_bmap.c:594:17: error: implicit declaration of function 'xfs_bmap_read_buf'; did you mean 'xfs_da_read_buf'? [-Werror=implicit-function-declaration]
     594 |         error = xfs_bmap_read_buf(mp, tp, cbno, &cbp);
         |                 ^~~~~~~~~~~~~~~~~
         |                 xfs_da_read_buf
   cc1: some warnings being treated as errors


vim +594 fs/xfs/libxfs/xfs_bmap.c

   545	
   546	/*
   547	 * Inode fork format manipulation functions
   548	 */
   549	
   550	/*
   551	 * Convert the inode format to extent format if it currently is in btree format,
   552	 * but the extent list is small enough that it fits into the extent format.
   553	 *
   554	 * Since the extents are already in-core, all we have to do is give up the space
   555	 * for the btree root and pitch the leaf block.
   556	 */
   557	STATIC int				/* error */
   558	xfs_bmap_btree_to_extents(
   559		struct xfs_trans	*tp,	/* transaction pointer */
   560		struct xfs_inode	*ip,	/* incore inode pointer */
   561		struct xfs_btree_cur	*cur,	/* btree cursor */
   562		int			*logflagsp, /* inode logging flags */
   563		int			whichfork)  /* data or attr fork */
   564	{
   565		struct xfs_ifork	*ifp = xfs_ifork_ptr(ip, whichfork);
   566		struct xfs_mount	*mp = ip->i_mount;
   567		struct xfs_btree_block	*rblock = ifp->if_broot;
   568		struct xfs_btree_block	*cblock;/* child btree block */
   569		xfs_fsblock_t		cbno;	/* child block number */
   570		struct xfs_buf		*cbp;	/* child block's buffer */
   571		int			error;	/* error return value */
   572		__be64			*pp;	/* ptr to block address */
   573		struct xfs_owner_info	oinfo;
   574	
   575		/* check if we actually need the extent format first: */
   576		if (!xfs_bmap_wants_extents(ip, whichfork))
   577			return 0;
   578	
   579		ASSERT(cur);
   580		ASSERT(whichfork != XFS_COW_FORK);
   581		ASSERT(ifp->if_format == XFS_DINODE_FMT_BTREE);
   582		ASSERT(be16_to_cpu(rblock->bb_level) == 1);
   583		ASSERT(be16_to_cpu(rblock->bb_numrecs) == 1);
   584		ASSERT(xfs_bmbt_maxrecs(mp, ifp->if_broot_bytes, 0) == 1);
   585	
   586		pp = XFS_BMAP_BROOT_PTR_ADDR(mp, rblock, 1, ifp->if_broot_bytes);
   587		cbno = be64_to_cpu(*pp);
   588	#ifdef DEBUG
   589		if (XFS_IS_CORRUPT(cur->bc_mp, !xfs_verify_fsbno(mp, cbno))) {
   590			xfs_btree_mark_sick(cur);
   591			return -EFSCORRUPTED;
   592		}
   593	#endif
 > 594		error = xfs_bmap_read_buf(mp, tp, cbno, &cbp);
   595		if (xfs_metadata_is_sick(error))
   596			xfs_btree_mark_sick(cur);
   597		if (error)
   598			return error;
   599		cblock = XFS_BUF_TO_BLOCK(cbp);
   600		if ((error = xfs_btree_check_block(cur, cblock, 0, cbp)))
   601			return error;
   602	
   603		xfs_rmap_ino_bmbt_owner(&oinfo, ip->i_ino, whichfork);
   604		error = xfs_free_extent_later(cur->bc_tp, cbno, 1, &oinfo,
   605				XFS_AG_RESV_NONE, false);
   606		if (error)
   607			return error;
   608	
   609		ip->i_nblocks--;
   610		xfs_trans_mod_dquot_byino(tp, ip, XFS_TRANS_DQ_BCOUNT, -1L);
   611		xfs_trans_binval(tp, cbp);
   612		if (cur->bc_levels[0].bp == cbp)
   613			cur->bc_levels[0].bp = NULL;
   614		xfs_iroot_realloc(ip, -1, whichfork);
   615		ASSERT(ifp->if_broot == NULL);
   616		ifp->if_format = XFS_DINODE_FMT_EXTENTS;
   617		*logflagsp |= XFS_ILOG_CORE | xfs_ilog_fext(whichfork);
   618		return 0;
   619	}
   620	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
