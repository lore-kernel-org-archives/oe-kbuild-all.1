Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5D197
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 00:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rr/8Fte7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698970976; x=1730506976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XPYHB0uI8ISD+MS/LaF5ziz3JgcMGdZtRhuvCdeec/A=;
  b=Rr/8Fte7bnYFjQmoD7OgjKC3uzdGTG2ChO1DrmWCSIXtKmoR+cuQID06
   F9lyjmHjdFQkCXaaHvUYlL2+9MW/npIG6aEzHsy9p+gbKgPWLGw5E/2U/
   +nGvaqZol0BUnRN7VBjpTsqA+zb2bK95SV07/kk4KPEvW1mVoACZmpsfU
   7b3HfSaSPWR+2QI3BqGxCjP2n63FSiw1gzjMs6MUbm4ddzL51ve9Km7F0
   Tuc1Ku6MAsXy8H4/azaD1DdwxjOz2ocViW8y95ZJCr1UsVvETxUe8hsxi
   RajbfGIX8sfC9lFFtwLED5x3vmJzidE8afeQqN3GSygeTCGFdjAIx6s00
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="391718684"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="391718684"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 17:22:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1008651122"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="1008651122"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 17:22:54 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyhxc-000232-2T;
	Fri, 03 Nov 2023 00:22:52 +0000
Date: Fri, 3 Nov 2023 08:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-defer 19/19] fs/xfs/libxfs/xfs_rmap.c:2718:65: error:
 'bno' undeclared; did you mean 'bio'?
Message-ID: <202311030841.l0sGAcST-lkp@intel.com>
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
config: csky-randconfig-001-20231103 (https://download.01.org/0day-ci/archive/20231103/202311030841.l0sGAcST-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030841.l0sGAcST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030841.l0sGAcST-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/libxfs/xfs_rmap.c: In function 'xfs_rmap_finish_one':
>> fs/xfs/libxfs/xfs_rmap.c:2718:65: error: 'bno' undeclared (first use in this function); did you mean 'bio'?
    2718 |         xfs_rmap_update_hook(tp, ri->ri_pag, NULL, ri->ri_type, bno,
         |                                                                 ^~~
         |                                                                 bio
   fs/xfs/libxfs/xfs_rmap.c:2718:65: note: each undeclared identifier is reported only once for each function it appears in
   fs/xfs/libxfs/xfs_rmap.c: In function 'xfs_rtrmap_finish_one':
   fs/xfs/libxfs/xfs_rmap.c:2763:65: error: 'bno' undeclared (first use in this function); did you mean 'bio'?
    2763 |         xfs_rmap_update_hook(tp, NULL, ri->ri_rtg, ri->ri_type, bno,
         |                                                                 ^~~
         |                                                                 bio


vim +2718 fs/xfs/libxfs/xfs_rmap.c

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
