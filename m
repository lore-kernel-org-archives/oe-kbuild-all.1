Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D6E611E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 01:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706666393; cv=none; b=JvQMu+3ZGZQ2HwmF0BP/KQF/R6TjOUVHBgxMyUAl57Q8FL3UpsTxfkeqKd8ZZ9ljd/PvUEkd38ri0TuA5LwMo5Lq1DnSR6ynTiBg5J5QBiUwjp8gHenstTFDl9JuwZn3pU1W7oYgD7QkC/nZ0/T9804SLTVprMqImmCg4tyauUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706666393; c=relaxed/simple;
	bh=XHSb49HDTbViPdWnCRcGpR8e7Jpjdej4+IscqeCVTOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nHgMI5ojGkyxQIF6U8vZJl3KPOAxQjX96pIP5LzFxqrExF6v2/HB2tfrBRsYo7UVscrvN02lmg5adhp36QEvSgmlaboE9cZ5MscUCePcaDUc6dyfSf2sC7PpFbg6+W6Wg2klgsiV2npfYP0/F9Kft8t+t7QKLIhljBAZ5T3fdCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qo/4d8H1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qo/4d8H1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706666392; x=1738202392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XHSb49HDTbViPdWnCRcGpR8e7Jpjdej4+IscqeCVTOQ=;
  b=Qo/4d8H1LYPuuMitDMFkocaJ5q/pVze5G7Ro5pCd5Knq+LXtpifYwAkS
   lUxr/KNO/fYrfU3ba25awYkAvSUggq6yPoVSgaHxHTHA8LpOpOEcMNqY0
   qHDf/O+eFPca1vRit4wKVVhwY/Z99FiQeT0a+7cwqfKsvmHxMtzPwM+pq
   fHRgewsCC+mv7XiVnH3V6umeBoXMwfDH1ADLPD6FOLFzrssH/gk81wYf5
   YQp0FveUBSdHMxDDuDC330W5q3c/B2cPX3iztkE8Yf6cYHRKB0zcM/jDd
   xW691x5ztdLqYVhDPaWlyLzWQ/jBK3j1/ON3GFyAtILov6991GPCLWUj9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10846235"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10846235"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 17:59:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911633615"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="911633615"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Jan 2024 17:59:49 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUztD-00012e-1H;
	Wed, 31 Jan 2024 01:59:47 +0000
Date: Wed, 31 Jan 2024 09:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-btree-mem-tidyups 3/13]
 fs/xfs/libxfs/xfs_bmap.c:594:10: error: call to undeclared function
 'xfs_bmap_read_buf'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202401310932.txu273gY-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240131/202401310932.txu273gY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310932.txu273gY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310932.txu273gY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_bmap.c:594:10: error: call to undeclared function 'xfs_bmap_read_buf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     594 |         error = xfs_bmap_read_buf(mp, tp, cbno, &cbp);
         |                 ^
   fs/xfs/libxfs/xfs_bmap.c:594:10: note: did you mean 'xfs_da_read_buf'?
   fs/xfs/libxfs/xfs_da_btree.h:214:5: note: 'xfs_da_read_buf' declared here
     214 | int     xfs_da_read_buf(struct xfs_trans *trans, struct xfs_inode *dp,
         |         ^
   1 error generated.


vim +/xfs_bmap_read_buf +594 fs/xfs/libxfs/xfs_bmap.c

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
