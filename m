Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA272EA4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 05:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686893711; x=1718429711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wbZN6xmp/r684JbPAvAyxdd7tQ5sHYqpl3ojt3r7afo=;
  b=fFe8pa17RZaY17cN8EgC7jCbCi5jMp/u8b8HWDxvlXkb22yLJCmedcvm
   90wdXhKt1G2hBiLhLfoC5706zTqRjLw3WlVafdaaE2iNKPwL2W/qZGDvT
   M6g9DhOib4JWwX0YIeHRytU7va9gpawlKhnPwnAJ+FGO91LtInjU6ZVcN
   yxue7p1zrLiLepf8odane4NmN1v6xY/SGpd+0eNbushDWaWJ1zzoJEoFX
   cP2H36hBT5yZdKRckXu8VFRvbI2YjRUXvYiMOYXWmkaFRWNqRaCX3e6AS
   GG/A87fehLlXaTCFLUYITO9nJ6A5VxBEjb4M3Zn27yUQuGq72sLqhqBkA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="359127503"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="359127503"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 22:35:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="802693737"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="802693737"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Jun 2023 22:35:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA272-0000qQ-2u;
	Fri, 16 Jun 2023 05:35:08 +0000
Date: Fri, 16 Jun 2023 13:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 401/494] fs/xfs/xfs_inode.c:2561:1:
 warning: stack frame size (2064) exceeds limit (2048) in
 'xfs_iflush_cluster'
Message-ID: <202306161327.p8bjV0zD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   fe4478b28c0065201a37d4b3fab2d01f98c81cd6
commit: 7f15fc8f952d1db0bca31bc9d1099f07fd44c6cc [401/494] xfs: add realtime reverse map inode to metadata directory
config: riscv-buildonly-randconfig-r001-20230615 (https://download.01.org/0day-ci/archive/20230616/202306161327.p8bjV0zD-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=7f15fc8f952d1db0bca31bc9d1099f07fd44c6cc
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout 7f15fc8f952d1db0bca31bc9d1099f07fd44c6cc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/xfs/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306161327.p8bjV0zD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_inode.c:2561:1: warning: stack frame size (2064) exceeds limit (2048) in 'xfs_iflush_cluster' [-Wframe-larger-than]
   xfs_iflush_cluster(
   ^
   1 warning generated.


vim +/xfs_iflush_cluster +2561 fs/xfs/xfs_inode.c

44a8736bd20a08 Darrick J. Wong 2018-07-25  2546  
e6187b3444e88e Dave Chinner    2020-06-29  2547  /*
e6187b3444e88e Dave Chinner    2020-06-29  2548   * Non-blocking flush of dirty inode metadata into the backing buffer.
e6187b3444e88e Dave Chinner    2020-06-29  2549   *
e6187b3444e88e Dave Chinner    2020-06-29  2550   * The caller must have a reference to the inode and hold the cluster buffer
e6187b3444e88e Dave Chinner    2020-06-29  2551   * locked. The function will walk across all the inodes on the cluster buffer it
e6187b3444e88e Dave Chinner    2020-06-29  2552   * can find and lock without blocking, and flush them to the cluster buffer.
e6187b3444e88e Dave Chinner    2020-06-29  2553   *
5717ea4d527acb Dave Chinner    2020-06-29  2554   * On successful flushing of at least one inode, the caller must write out the
5717ea4d527acb Dave Chinner    2020-06-29  2555   * buffer and release it. If no inodes are flushed, -EAGAIN will be returned and
5717ea4d527acb Dave Chinner    2020-06-29  2556   * the caller needs to release the buffer. On failure, the filesystem will be
5717ea4d527acb Dave Chinner    2020-06-29  2557   * shut down, the buffer will have been unlocked and released, and EFSCORRUPTED
5717ea4d527acb Dave Chinner    2020-06-29  2558   * will be returned.
e6187b3444e88e Dave Chinner    2020-06-29  2559   */
e6187b3444e88e Dave Chinner    2020-06-29  2560  int
e6187b3444e88e Dave Chinner    2020-06-29 @2561  xfs_iflush_cluster(
e6187b3444e88e Dave Chinner    2020-06-29  2562  	struct xfs_buf		*bp)
e6187b3444e88e Dave Chinner    2020-06-29  2563  {
5717ea4d527acb Dave Chinner    2020-06-29  2564  	struct xfs_mount	*mp = bp->b_mount;
5717ea4d527acb Dave Chinner    2020-06-29  2565  	struct xfs_log_item	*lip, *n;
5717ea4d527acb Dave Chinner    2020-06-29  2566  	struct xfs_inode	*ip;
5717ea4d527acb Dave Chinner    2020-06-29  2567  	struct xfs_inode_log_item *iip;
e6187b3444e88e Dave Chinner    2020-06-29  2568  	int			clcount = 0;
5717ea4d527acb Dave Chinner    2020-06-29  2569  	int			error = 0;
e6187b3444e88e Dave Chinner    2020-06-29  2570  
e6187b3444e88e Dave Chinner    2020-06-29  2571  	/*
5717ea4d527acb Dave Chinner    2020-06-29  2572  	 * We must use the safe variant here as on shutdown xfs_iflush_abort()
d2d7c0473586d2 Dave Chinner    2022-03-29  2573  	 * will remove itself from the list.
e6187b3444e88e Dave Chinner    2020-06-29  2574  	 */
5717ea4d527acb Dave Chinner    2020-06-29  2575  	list_for_each_entry_safe(lip, n, &bp->b_li_list, li_bio_list) {
5717ea4d527acb Dave Chinner    2020-06-29  2576  		iip = (struct xfs_inode_log_item *)lip;
5717ea4d527acb Dave Chinner    2020-06-29  2577  		ip = iip->ili_inode;
e6187b3444e88e Dave Chinner    2020-06-29  2578  
e6187b3444e88e Dave Chinner    2020-06-29  2579  		/*
5717ea4d527acb Dave Chinner    2020-06-29  2580  		 * Quick and dirty check to avoid locks if possible.
e6187b3444e88e Dave Chinner    2020-06-29  2581  		 */
718ecc50359ec7 Dave Chinner    2020-08-17  2582  		if (__xfs_iflags_test(ip, XFS_IRECLAIM | XFS_IFLUSHING))
5717ea4d527acb Dave Chinner    2020-06-29  2583  			continue;
5717ea4d527acb Dave Chinner    2020-06-29  2584  		if (xfs_ipincount(ip))
5717ea4d527acb Dave Chinner    2020-06-29  2585  			continue;
e6187b3444e88e Dave Chinner    2020-06-29  2586  
e6187b3444e88e Dave Chinner    2020-06-29  2587  		/*
5717ea4d527acb Dave Chinner    2020-06-29  2588  		 * The inode is still attached to the buffer, which means it is
5717ea4d527acb Dave Chinner    2020-06-29  2589  		 * dirty but reclaim might try to grab it. Check carefully for
5717ea4d527acb Dave Chinner    2020-06-29  2590  		 * that, and grab the ilock while still holding the i_flags_lock
5717ea4d527acb Dave Chinner    2020-06-29  2591  		 * to guarantee reclaim will not be able to reclaim this inode
5717ea4d527acb Dave Chinner    2020-06-29  2592  		 * once we drop the i_flags_lock.
e6187b3444e88e Dave Chinner    2020-06-29  2593  		 */
5717ea4d527acb Dave Chinner    2020-06-29  2594  		spin_lock(&ip->i_flags_lock);
5717ea4d527acb Dave Chinner    2020-06-29  2595  		ASSERT(!__xfs_iflags_test(ip, XFS_ISTALE));
718ecc50359ec7 Dave Chinner    2020-08-17  2596  		if (__xfs_iflags_test(ip, XFS_IRECLAIM | XFS_IFLUSHING)) {
5717ea4d527acb Dave Chinner    2020-06-29  2597  			spin_unlock(&ip->i_flags_lock);
e6187b3444e88e Dave Chinner    2020-06-29  2598  			continue;
5717ea4d527acb Dave Chinner    2020-06-29  2599  		}
e6187b3444e88e Dave Chinner    2020-06-29  2600  
e6187b3444e88e Dave Chinner    2020-06-29  2601  		/*
5717ea4d527acb Dave Chinner    2020-06-29  2602  		 * ILOCK will pin the inode against reclaim and prevent
5717ea4d527acb Dave Chinner    2020-06-29  2603  		 * concurrent transactions modifying the inode while we are
718ecc50359ec7 Dave Chinner    2020-08-17  2604  		 * flushing the inode. If we get the lock, set the flushing
718ecc50359ec7 Dave Chinner    2020-08-17  2605  		 * state before we drop the i_flags_lock.
e6187b3444e88e Dave Chinner    2020-06-29  2606  		 */
5717ea4d527acb Dave Chinner    2020-06-29  2607  		if (!xfs_ilock_nowait(ip, XFS_ILOCK_SHARED)) {
5717ea4d527acb Dave Chinner    2020-06-29  2608  			spin_unlock(&ip->i_flags_lock);
e6187b3444e88e Dave Chinner    2020-06-29  2609  			continue;
e6187b3444e88e Dave Chinner    2020-06-29  2610  		}
718ecc50359ec7 Dave Chinner    2020-08-17  2611  		__xfs_iflags_set(ip, XFS_IFLUSHING);
5717ea4d527acb Dave Chinner    2020-06-29  2612  		spin_unlock(&ip->i_flags_lock);
e6187b3444e88e Dave Chinner    2020-06-29  2613  
e6187b3444e88e Dave Chinner    2020-06-29  2614  		/*
5717ea4d527acb Dave Chinner    2020-06-29  2615  		 * Abort flushing this inode if we are shut down because the
5717ea4d527acb Dave Chinner    2020-06-29  2616  		 * inode may not currently be in the AIL. This can occur when
5717ea4d527acb Dave Chinner    2020-06-29  2617  		 * log I/O failure unpins the inode without inserting into the
5717ea4d527acb Dave Chinner    2020-06-29  2618  		 * AIL, leaving a dirty/unpinned inode attached to the buffer
5717ea4d527acb Dave Chinner    2020-06-29  2619  		 * that otherwise looks like it should be flushed.
e6187b3444e88e Dave Chinner    2020-06-29  2620  		 */
01728b44ef1b71 Dave Chinner    2022-03-17  2621  		if (xlog_is_shutdown(mp->m_log)) {
5717ea4d527acb Dave Chinner    2020-06-29  2622  			xfs_iunpin_wait(ip);
5717ea4d527acb Dave Chinner    2020-06-29  2623  			xfs_iflush_abort(ip);
5717ea4d527acb Dave Chinner    2020-06-29  2624  			xfs_iunlock(ip, XFS_ILOCK_SHARED);
5717ea4d527acb Dave Chinner    2020-06-29  2625  			error = -EIO;
5717ea4d527acb Dave Chinner    2020-06-29  2626  			continue;
e6187b3444e88e Dave Chinner    2020-06-29  2627  		}
5717ea4d527acb Dave Chinner    2020-06-29  2628  
5717ea4d527acb Dave Chinner    2020-06-29  2629  		/* don't block waiting on a log force to unpin dirty inodes */
5717ea4d527acb Dave Chinner    2020-06-29  2630  		if (xfs_ipincount(ip)) {
718ecc50359ec7 Dave Chinner    2020-08-17  2631  			xfs_iflags_clear(ip, XFS_IFLUSHING);
5717ea4d527acb Dave Chinner    2020-06-29  2632  			xfs_iunlock(ip, XFS_ILOCK_SHARED);
5717ea4d527acb Dave Chinner    2020-06-29  2633  			continue;
e6187b3444e88e Dave Chinner    2020-06-29  2634  		}
e6187b3444e88e Dave Chinner    2020-06-29  2635  
5717ea4d527acb Dave Chinner    2020-06-29  2636  		if (!xfs_inode_clean(ip))
5717ea4d527acb Dave Chinner    2020-06-29  2637  			error = xfs_iflush(ip, bp);
5717ea4d527acb Dave Chinner    2020-06-29  2638  		else
718ecc50359ec7 Dave Chinner    2020-08-17  2639  			xfs_iflags_clear(ip, XFS_IFLUSHING);
5717ea4d527acb Dave Chinner    2020-06-29  2640  		xfs_iunlock(ip, XFS_ILOCK_SHARED);
5717ea4d527acb Dave Chinner    2020-06-29  2641  		if (error)
5717ea4d527acb Dave Chinner    2020-06-29  2642  			break;
5717ea4d527acb Dave Chinner    2020-06-29  2643  		clcount++;
e6187b3444e88e Dave Chinner    2020-06-29  2644  	}
e6187b3444e88e Dave Chinner    2020-06-29  2645  
e6187b3444e88e Dave Chinner    2020-06-29  2646  	if (error) {
01728b44ef1b71 Dave Chinner    2022-03-17  2647  		/*
01728b44ef1b71 Dave Chinner    2022-03-17  2648  		 * Shutdown first so we kill the log before we release this
01728b44ef1b71 Dave Chinner    2022-03-17  2649  		 * buffer. If it is an INODE_ALLOC buffer and pins the tail
01728b44ef1b71 Dave Chinner    2022-03-17  2650  		 * of the log, failing it before the _log_ is shut down can
01728b44ef1b71 Dave Chinner    2022-03-17  2651  		 * result in the log tail being moved forward in the journal
01728b44ef1b71 Dave Chinner    2022-03-17  2652  		 * on disk because log writes can still be taking place. Hence
01728b44ef1b71 Dave Chinner    2022-03-17  2653  		 * unpinning the tail will allow the ICREATE intent to be
01728b44ef1b71 Dave Chinner    2022-03-17  2654  		 * removed from the log an recovery will fail with uninitialised
01728b44ef1b71 Dave Chinner    2022-03-17  2655  		 * inode cluster buffers.
01728b44ef1b71 Dave Chinner    2022-03-17  2656  		 */
01728b44ef1b71 Dave Chinner    2022-03-17  2657  		xfs_force_shutdown(mp, SHUTDOWN_CORRUPT_INCORE);
e6187b3444e88e Dave Chinner    2020-06-29  2658  		bp->b_flags |= XBF_ASYNC;
e6187b3444e88e Dave Chinner    2020-06-29  2659  		xfs_buf_ioend_fail(bp);
e6187b3444e88e Dave Chinner    2020-06-29  2660  		return error;
e6187b3444e88e Dave Chinner    2020-06-29  2661  	}
e6187b3444e88e Dave Chinner    2020-06-29  2662  
5717ea4d527acb Dave Chinner    2020-06-29  2663  	if (!clcount)
5717ea4d527acb Dave Chinner    2020-06-29  2664  		return -EAGAIN;
5717ea4d527acb Dave Chinner    2020-06-29  2665  
5717ea4d527acb Dave Chinner    2020-06-29  2666  	XFS_STATS_INC(mp, xs_icluster_flushcnt);
5717ea4d527acb Dave Chinner    2020-06-29  2667  	XFS_STATS_ADD(mp, xs_icluster_flushinode, clcount);
5717ea4d527acb Dave Chinner    2020-06-29  2668  	return 0;
5717ea4d527acb Dave Chinner    2020-06-29  2669  

:::::: The code at line 2561 was first introduced by commit
:::::: e6187b3444e88ed9aa5f3843603e1f024b6d0309 xfs: rename xfs_iflush_int()

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Darrick J. Wong <darrick.wong@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
