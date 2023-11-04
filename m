Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ADC17D5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WR6iTnGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699100729; x=1730636729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2I6h8yzH3ybwjOwUSpe0Zz9XEhNi9RbFVcyIGA1wC1Q=;
  b=WR6iTnGvOowu5PLFybwfGXYi4rH1Ucv8PzkDIxhKNAhrtcWqYJwZawGs
   x//BytkcsessKy2KlX98/nrw0ycYGJ3ojYg75zEvMAADK605soo/is8oW
   kY+WDBWZa302pUDIMEo1O36Af4yR2MG5rtDSW4Dqdg9cwPMTdRza1wgOJ
   XGsAhHHTIpc4x6PqT0C4Zj5w3BYuil3+Y2xKsKT9kE/iABuwYCwyZSXv9
   VrjritsbTgmuS76cubD7sFyYJp7H+qp7gN3kfntk+jfRWqaSRHvjHFUEP
   ian6AUgOXRhcuWSt3ng7i20SXspgSPMvvYCPoPUnf6ourvTk1HZqqL33n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="475315667"
X-IronPort-AV: E=Sophos;i="6.03,277,1694761200"; 
   d="scan'208";a="475315667"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 05:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1009074356"
X-IronPort-AV: E=Sophos;i="6.03,277,1694761200"; 
   d="scan'208";a="1009074356"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Nov 2023 05:25:26 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzFiO-0004O8-2y;
	Sat, 04 Nov 2023 12:25:24 +0000
Date: Sat, 4 Nov 2023 20:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-defer 19/19] fs/xfs/libxfs/xfs_rmap.c:2718:58: error:
 use of undeclared identifier 'bno'
Message-ID: <202311042017.vjrBewU2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-defer
head:   c702ad904b529ee1c6c5d0640dc545c5feaffd6a
commit: c702ad904b529ee1c6c5d0640dc545c5feaffd6a [19/19] xfs: split out RT rmap operations
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231104/202311042017.vjrBewU2-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311042017.vjrBewU2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311042017.vjrBewU2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_rmap.c:2718:58: error: use of undeclared identifier 'bno'
           xfs_rmap_update_hook(tp, ri->ri_pag, NULL, ri->ri_type, bno,
                                                                   ^
   fs/xfs/libxfs/xfs_rmap.c:2763:58: error: use of undeclared identifier 'bno'
           xfs_rmap_update_hook(tp, NULL, ri->ri_rtg, ri->ri_type, bno,
                                                                   ^
   2 errors generated.


vim +/bno +2718 fs/xfs/libxfs/xfs_rmap.c

  2656	
  2657	/*
  2658	 * Process one of the deferred rmap operations.  We pass back the
  2659	 * btree cursor to maintain our lock on the rmapbt between calls.
  2660	 * This saves time and eliminates a buffer deadlock between the
  2661	 * superblock and the AGF because we'll always grab them in the same
  2662	 * order.
  2663	 */
  2664	int
  2665	xfs_rmap_finish_one(
  2666		struct xfs_trans		*tp,
  2667		struct xfs_rmap_intent		*ri,
  2668		struct xfs_btree_cur		**pcur)
  2669	{
  2670		struct xfs_owner_info		oinfo;
  2671		struct xfs_mount		*mp = tp->t_mountp;
  2672		struct xfs_btree_cur		*rcur = *pcur;
  2673		struct xfs_buf			*agbp = NULL;
  2674		int				error = 0;
  2675	
  2676		trace_xfs_rmap_deferred(mp, ri);
  2677	
  2678		if (XFS_TEST_ERROR(false, mp, XFS_ERRTAG_RMAP_FINISH_ONE))
  2679			return -EIO;
  2680	
  2681		/*
  2682		 * If we haven't gotten a cursor or the cursor AG doesn't match
  2683		 * the startblock, get one now.
  2684		 */
  2685		if (rcur != NULL && rcur->bc_ag.pag != ri->ri_pag) {
  2686			xfs_btree_del_cursor(rcur, 0);
  2687			rcur = NULL;
  2688		}
  2689		if (!rcur) {
  2690			/*
  2691			 * Refresh the freelist before we start changing the rmapbt,
  2692			 * because a shape change could cause us to allocate blocks.
  2693			 */
  2694			error = xfs_free_extent_fix_freelist(tp, ri->ri_pag, &agbp);
  2695			if (error) {
  2696				xfs_ag_mark_sick(ri->ri_pag, XFS_SICK_AG_AGFL);
  2697				return error;
  2698			}
  2699	
  2700			if (XFS_IS_CORRUPT(tp->t_mountp, !agbp)) {
  2701				xfs_ag_mark_sick(ri->ri_pag, XFS_SICK_AG_AGFL);
  2702				return -EFSCORRUPTED;
  2703			}
  2704	
  2705			rcur = *pcur = xfs_rmapbt_init_cursor(mp, tp, agbp, ri->ri_pag);
  2706		}
  2707	
  2708		xfs_rmap_ino_owner(&oinfo, ri->ri_owner, ri->ri_whichfork,
  2709				ri->ri_bmap.br_startoff);
  2710	
  2711		error = __xfs_rmap_finish_intent(rcur, ri->ri_type,
  2712				XFS_FSB_TO_AGBNO(mp, ri->ri_bmap.br_startblock),
  2713				ri->ri_bmap.br_blockcount, &oinfo,
  2714				ri->ri_bmap.br_state == XFS_EXT_UNWRITTEN);
  2715		if (error)
  2716			return error;
  2717	
> 2718		xfs_rmap_update_hook(tp, ri->ri_pag, NULL, ri->ri_type, bno,
  2719				ri->ri_bmap.br_blockcount,
  2720				ri->ri_bmap.br_state == XFS_EXT_UNWRITTEN, &oinfo);
  2721		return 0;
  2722	}
  2723	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
